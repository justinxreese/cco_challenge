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
to this project. I don't expect I'll have to roll back any changes, but 
it is nice to have a commit history to show my development style and
workflow.

This document was written with Markdown because it is automatically
parsed into HTML by GitHub and looks great in plain text editors (I'm
"one of those vim guys").

## Design

Like years ago, when I was a stock boy at K-Mart, this utility would 
need one role to check the inventory, check shelves, and stock shelves. 
The best way to achieve that in code was to create a class to fulfill 
this role through a number of tasks. I then created an instance (me?) 
to stock the shelves in a particular script (workday? Am I taking this 
metaphor too far?) with a particular set of inputs (shipment? okay, 
now I'm *definitely* taking the metaphor too far).

I've always found that real world metaphors make designing a project
much simpler, so the initial structure of the application was the 
easiest part. The most challenging part of the exercise was creating 
a way to **best** stock the shelves.

The most fun aspect, as it usually is for me, was making my code as
small and efficient as possible while maintaining readability. Thinking
this way led me to approach the project as a way to fill empty shelves
rather than a way to empty a stock room. This maximizes efficiency,
because the program stops when there is no shelf space remaining. There
is no point to looking at each item in stock if there is no place to 
put it.

## Dependencies and limitations

This was written with Ruby 1.9.2 and requires rubygems and the JSON
gem.
