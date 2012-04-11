# CCO Challenge

## What is this?

This project is a small utility for optimally stocking store shelves
with a given stock of items. Stocking the shelves is restricted by the
capacity of a shelf and the size of the items available. Shelves have
a visibility attribute which determine how quickly the items on that
shelf will sell.

## Technology used

I'm most familiar with, and love using, Ruby - so it was my immediate
choice when building this project. I also used git to manage the changes
to this project. While I don't expect I'll have to roll back any changes,
it is nice to have a commit history to show my development style and
workflow.

This document was written with Markdown because it is automatically
parsed into HTML by GitHub and looks great in plain text editors (I'm
"one of those vim guys").

## Design

Like years ago, when I was a stock boy at K-Mart, this utility will need 
to serve roles checking inventory as well as checking and stocking shelves. 
The best way to achieve that in code was to create a class to fulfill 
this role through tasks. I created a script containing an instance of
this class to stock the shelves with a particular set of inputs.

I've always found that real world metaphors make designing a project
much simpler, so the initial structure of the application was the 
easiest part. The most challenging part of the exercise was creating 
a way to **best** stock the shelves. I solved the problem iteratively.
First, I filled the shelves with no regard for their capacity or the
size of the products. I then worked the size of the product into the
logic and the entire thing came together.

The most fun aspect, as it usually is for me, was making my code as
small and efficient as possible while maintaining readability. Thinking
this way led to my approach where the project was a way to fill empty 
shelves rather than a way to empty a stock room. This solution 
maximizes efficiency, because the program stops when there is no shelf 
space remaining. There is no point to looking at each item in stock if 
there is no place to put it.

## Dependencies and limitations

This was written with Ruby 1.9.2 and requires rubygems and the JSON
gem.

The command line interface assumes the products file will come before
the shelves file. See below for how to properly run the program.

The program assumes that the file sent in will be JSON.

## How to use it

To use this program, simply run the stock.rb file with ruby

`ruby stock.rb`

The program also accepts command line input for data files.

`ruby stock.rb dat/products.json dat/shelves.json`
