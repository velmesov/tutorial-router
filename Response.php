<?php

namespace App\Core;

/**
 * Класс для формирования ответов с сервера.
 *
 * @package App\Core
 */
class Response
{
    /**
     * Ok
     */
    public const STATUS_OK = 200;

    /**
     * Moved Permanently
     */
    public const STATUS_MOVED_PERMANENTLY = 301;

    /**
     * Bad Request
     */
    public const STATUS_BAD_REQUEST = 400;

    /**
     * Unauthorized
     */
    public const STATUS_UNAUTHORIZED = 401;

    /**
     * Forbidden
     */
    public const STATUS_FORBIDDEN = 403;

    /**
     * Not Found
     */
    public const STATUS_NOT_FOUND = 404;

    /**
     * Method Not Allowed
     */
    public const STATUS_METHOD_NOT_ALLOWED = 405;

    /**
     * Internal Server Error
     */
    public const STATUS_INTERNAL_SERVER_ERROR = 500;

    /**
     * Устанавливает код ответа сервера.
     *
     * @param int $code
     *
     * @return void
     */
    public function code(int $code)
    {
        if ($code) {
            http_response_code($code);
        }
    }

    /**
     * Устанавливает заголовки ответа сервера.
     *
     * @param array $headers
     *
     * @return void
     */
    public function headers(array $headers)
    {
        if ($headers) {
            foreach ($headers as $key => $value) {
                header($key . ': ' . $value);
            }
        }
    }

    /**
     * Производит редирект на указанный url.
     *
     * @param string   $url
     * @param int|null $code
     *
     * @return void
     */
    public function redirect(string $url, int $code = null)
    {
        header('Location: ' . $url, true, $code);
    }

    /**
     * Возвращает ответ в json формате.
     *
     * @param array $data
     *
     * @return void
     */
    public function json(array $data)
    {
        $this->headers([
            'Content-Type' => 'application/json; charset=utf-8'
        ]);

        echo json_encode($data);
    }
}
