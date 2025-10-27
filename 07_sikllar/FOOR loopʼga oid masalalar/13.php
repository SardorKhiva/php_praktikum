<?php
/*

*****
  *
  *
  *
  *
  *
*****

 Yuqoridagi I harfini, for yordamida hosil qiling
 */

for ($i = 1; $i <= 7; $i++)
{
    if ($i == 1 || $i == 7)
    {
        for ($j = 1; $j <= 5; $j++)
        {
            echo "*";
        }
    }
    if ($i > 1 && $i < 7)
    {
        for ($j = 1; $j <= 5; $j++)
        {
            if ($j == 3)
            {
                echo "*";
            } else
            {
                echo " ";
            }
        }
    }
    echo "\n";
}