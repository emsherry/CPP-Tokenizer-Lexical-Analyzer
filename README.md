# CPP-Tokenizer-Lexical-Analyzer

## Introduction

The first phase of compilation, called Lexical Analysis, involves converting the source code into a stream of tokens. A lexer, also known as a lexical analyzer, is responsible for this task. It reads the input source code character by character, converts it into meaningful tokens, and sends it to the parser for further analysis. 

This project is a simple implementation of a C++ tokenizer that can be used to generate tokens from a given C++ source code.

## Installation

Clone the repository and run the following commands:

cd CPP-Tokenizer

g++ tokenizer.cpp -o tokenizer

./tokenizer input_file.cpp


## Usage

To use the tokenizer, simply provide a C++ source code file as input to the tokenizer executable. The tokenizer will generate a list of tokens, which can be used by the parser for further processing.


