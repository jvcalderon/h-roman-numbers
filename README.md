Roman Numbers
==============

[![Build Status](https://travis-ci.org/jvcalderon/h-roman-numbers.svg?branch=master)](https://travis-ci.org/jvcalderon/h-roman-numbers)
[![Coverage Status](https://coveralls.io/repos/github/jvcalderon/h-roman-numbers/badge.svg?branch=master)](https://coveralls.io/github/jvcalderon/h-roman-numbers?branch=master)

A simple library to convert roman to arabic numbers (and vice versa). It also can check valid roman format.

## Installation

The package is not in Hackage repositories yet. You must use stack to install it.

<pre><code>$ stack install</code></pre>

## How to use it

Currently you can require the package as follow:
    
<pre><code>import RomanNumbers</code></pre>

### isValidArab

Checks if given value can be converted to roman. Only integers (it checks the type) from 1 to 3999 are valid values.

<pre><code>
isValidArab :: Int -> Bool
isValidArab 0 {- Returns (False :: Bool) -}
isValidArab 100  {- Returns (True :: Bool) -}
</code></pre>

### isValidRoman

Checks if given value can be converted to arab. Only capitalized strings with a valid roman format are valid values.

<pre><code>isValidRoman :: String -> Bool
isValidRoman "" {- Returns (False :: Bool) -}
isValidRoman "IIIX" {- Returns (False :: Bool) -}
isValidRoman "ix" {- Returns (False :: Bool) -}
isValidRoman "XI" {- Returns (True :: Bool) -}
</code></pre>

### romanToArab

Converts valid roman number to arab.

<pre><code>romanToArab :: String -> (Maybe Int)
romanToArab "IX" {- Returns Just(9) -}
romanToArab "MMM" {- Returns Just(3000) -}
romanToArab "IIIX" {- Returns Nothing -}
romanToArab "" {- Returns Nothing -}
</code></pre>

### arabToRoman

Converts valid roman number to arab.

<pre><code>arabToRoman :: Int -> (Maybe String)
arabToRoman 12  {- Returns Just("XII") -}
arabToRoman 201 {- Returns Just("CCI") -}
arabToRoman 0 {- Returns Nothing -}
arabToRoman 5000 {- Returns Nothing -}
</code></pre>
