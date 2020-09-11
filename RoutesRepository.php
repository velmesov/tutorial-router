<?php

namespace App\Repository;

use PDO;
use PDOException;

/**
 * Репозиторий для работы с роутами.
 *
 * @package App\Repository
 */
class RoutesRepository extends BaseRepository
{
    /**
     * Возвращает все роуты.
     *
     * @return array
     *
     * @throws PDOException
     */
    public function getAll(): array
    {
        $sth = $this->connection->prepare(
            'SELECT *
            FROM routes
            WHERE state = :state
            ORDER BY sorting'
        );
        $sth->bindValue(':state', 1, PDO::PARAM_INT);
        $sth->execute();

        return $sth->fetchAll() ?? [];
    }
}
