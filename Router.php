<?php

namespace App\Core;

class Router
{
    /**
     * @var Response
     */
    private Response $response;

    /**
     * @var RoutesRepository
     */
    private RoutesRepository $routesRepository;

    protected function __construct()
    {
        $this->response         = Response::getInstance();
        $this->routesRepository = RoutesRepository::getInstance();
    }

    /**
     * Парсер запросов.
     *
     * @return void
     */
    public function parse()
    {
        foreach ($this->routesRepository->getAll() as $route) {
            if (preg_match('#^' . $route['route'] . '$#', $_SERVER['REQUEST_URI'], $matches)) {
                $this->clearParameters($matches);

                if (!$this->checkMethods($route)) {
                    if ($this->isAjax($route['route'])) {
                        $this->response->headers([
                            'Access-Control-Allow-Methods' => implode(', ', json_decode($route['methods'], true))
                        ]);
                        $this->response->json([
                            'status' => 'method_not_allowed',
                            'message' => 'Method not allowed'
                        ]);
                    } else {
                        $controller = new ErrorController($route, $matches);
                        $controller->error405();
                    }
                    return;
                }

                if (!$this->checkHeaders($route)) {
                    if ($this->isAjax($route['route'])) {
                        $this->response->json([
                            'status' => 'forbidden',
                            'message' => 'Forbidden'
                        ]);
                    } else {
                        $controller = new ErrorController($route, $matches);
                        $controller->error403();
                    }
                    return;
                }

                $controller = new $route['controller']($route, $matches);
                $controller->{$route['action'] ?? 'main'}();
                return;
            }
        }

        if ($this->isAjax($_SERVER['REQUEST_URI'])) {
            $this->response->json([
                'status' => 'not_found',
                'message' => 'Not found'
            ]);
        } else {
            $controller = new ErrorController(null, null);
            $controller->error404('Страница не найдена!');
        }
    }

    /**
     * Проверка разрешенных методов.
     *
     * @param array $route
     *
     * @return bool
     */
    private function checkMethods(array $route): bool
    {
        if (!in_array($_SERVER['REQUEST_METHOD'], json_decode($route['methods'], true))) {
            return false;
        }

        return true;
    }

    /**
     * Проверка разрешенных заголовков.
     *
     * @param array $route
     *
     * @return bool
     */
    private function checkHeaders(array $route): bool
    {
        if ($route['headers']) {
            foreach (json_decode($route['headers'], true) as $key => $value) {
                if (!isset(getallheaders()[$key])) {
                    return false;
                }

                // Если разрешено любое значение заголовка
                if ($value == '*') {
                    return true;
                } else {
                    if (getallheaders()[$key] !== $value) {
                        return false;
                    }
                }
            }
        }

        return true;
    }

    /**
     * Очищает параметры от мусора результата preg_match.
     *
     * @param array $parameters
     *
     * @return void
     */
    private function clearParameters(array &$parameters)
    {
        foreach ($parameters as $key => $value) {
            if (gettype($key) !== 'string') {
                unset($parameters[$key]);
            }
        }
    }

    /**
     * Проверка если Ajax запрос.
     *
     * @param string $route
     *
     * @return bool
     */
    private function isAjax(string $route): bool
    {
        return preg_match('#^/ajax/#', $route) ? true : false;
    }
}
