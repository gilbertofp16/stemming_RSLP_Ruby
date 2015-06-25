# stemming_RSLP_Ruby
For get a perfect portugues Stemming of words, this library implements RSLP procedure. http://www.inf.ufrgs.br/~viviane/rslp/

# Usage

Enter a word in portugues and obtain a stem word

Example:

require 'stemming_RSLP_Ruby'

puts(Stemming_RSLP_Ruby.applyStemmerPT("consolação"))

>> Result : consol

puts(Stemming_RSLP_Ruby.applyStemmerPT("rolezinho"))

>> Result : rol


# Notes

This gem helps to obtain the stem of a word, it was implemented Viviane Moreira Orengo and Christian Huyck, in C#.
The gem is just a wrapper to use this code in a fast way and without complication on Ruby. 

# Download 

https://github.com/gilbertofp16/stemming_RSLP_Ruby

gem install stemming_RSLP_Ruby

# License
MIT
