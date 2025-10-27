<?php
// funksiyadagi tiplarni majburiy tekshiradi, 1 - on,  0 - off:
declare(strict_types=1);

function foo(int $a, int $b): int
{
    return $a + $b;
}

$natija1 = foo(1, 2);

// 2-qatordagi kod bunga ruxsat bermaydi:
// $natija2 = foo('1', 2);