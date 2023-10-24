# Lecture 14: Grabbing and Dropping

This lecture completes the implementation of picking up and dropping rigid bodies. The use of signals for binding custom functions and groups for scripting objects with common functionality is also discussed.

## Prerequisites

To follow along with this lecture, you will first need to install:

- [Godot Engine 4.1.2](https://godotengine.org/)
- [Immersive Web Emulator Browser Extension](https://github.com/meta-quest/immersive-web-emulator)

## Notes

This code includes several bug fixes and extensions that were made after class:

- The grabbed object movement was changed from copying position and rotation separately to just multiplying the transform matrix.  This is conceptually simpler and fixes the slight coordinate system bug that was present in the original code.
- The object movement code was moved from the `_physics_process()` method to `_process()`.  When testing on the Quest, the `_physics_process()` method was causing some inconsistencies in the grabbed object's movement, and the regular `_process()` method works just fine because the physics are frozen.
- The grabber script was extended to support passing an object back and forth between the two hands. To accomplish this, a new `globals.gd` script was added to store a global array of active grabbers.  This script was then autoloaded into the scene as a [singleton](https://docs.godotengine.org/en/latest/tutorials/scripting/singletons_autoload.html) in Project Settings->Autoload.
- Additional comments were added to the grabber script to clarify functionality.

## License

Material for [CSCI 5619 Fall 2023](https://canvas.umn.edu/courses/391288/assignments/syllabus) by [Evan Suma Rosenberg](https://illusioneering.umn.edu/) is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)