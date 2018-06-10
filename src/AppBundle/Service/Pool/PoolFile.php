<?php
declare(strict_types=1);

/*
 * Copyright 2018 by Michael Zapf.
 * Licensed under MIT. See file /LICENSE.
 */

namespace AppBundle\Service\Pool;

class PoolFile extends PoolItem
{
    public function __construct(string $filename, string $fullpath)
    {
        parent::__construct($filename, $fullpath);
    }

    public function getType(): string
    {
        return PoolItem::TYPE_FILE;
    }
}
