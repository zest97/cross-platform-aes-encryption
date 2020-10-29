<?php

$text="Text to encrypt";
$key="1234567890abcder";
$iv="1234567890abcder";
$method = "AES-128-CBC";

$encrypted = openssl_encrypt($text, $method, $key, $option = 0, $iv);
echo $encrypted;
echo "\n";
