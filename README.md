## Enigma Refactoring Exercises

This repository contains 2 project directories intended for use
with the [Refactoring Patterns](https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/refactoring_patterns.markdown)
lesson plan.

Both projects are solutions to Turing's Module 1
[Enigma Project](https://github.com/turingschool/curriculum/blob/master/source/projects/enigma.markdown).

### Exercises

For each project, spend the allotted time focusing on the
3 refactorings described in the lesson. The patterns are:

1. [Move Method](https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/refactoring_patterns_station_1.markdown)
2. [Extract Class](https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/refactoring_patterns_station_2.markdown)
3. [Hide Delegate](https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/refactoring_patterns_station_3.markdown)

You will have roughly 1 hour to devote to each project.
For the first project, you will be working individually.
For the second, you'll join with a pair.

### Project 1

This project is fairly well-tested, but has some long and
possibly mis-placed methods. This makes it an ideal
candidate for refactoring.

You are encouraged to spend some time exploring the project
and identifying areas of the code that would benefit from
refactoring. However, if you get stuck, here are a few pointers
to get you started:

* The `Encrypt` and `Decrypt` both have a collection of methods
dealing with rotating characters forward or backward. Can you find
a way to apply the _move method_ refactoring to pull these out
into a separate, third object so that the logic could be shared?
* The `OffsetCalculator` class has several repetitive methods
for dealing with the respective a,b,c, and d rotations --
could we use _extract method_ to pull these into a more
general solution?
* Our offset generation process relies on 2 key parts -- a "Key"
and a "Date". But neither of these are present as independent
domain objects within our system. Could we use _extract class_
to pull these out into their own objects? Would this improve
the code?

### Project 2

This project will be a little more challenging. It has many
of the same code issues as the first project, but its test
suite is also not in great shape.

Remember the first rule of Refactor Club: It's not refactoring
if it's not tested.

For this exercise, join your assigned pair and focus on
2 things:

1. First, fix up the test suite to get things passing.
2. Second, look for refactorings to make the code of the
project cleaner. Keep in mind that as you go, you may need
to add additional tests around untested code. This step
is crucial for ensuring you don't change too much as well as
for cementing your understanding of what the code does.
