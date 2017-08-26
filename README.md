![Banner](/Art/banner.png)

[![Language](https://img.shields.io/badge/language-Swift%203.1-orange.svg)](https://swift.org) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PiXeL16/SnakeClassic/master/LICENSE) [![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=59a13a90553af700016dfb4f&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/59a13a90553af700016dfb4f/build/latest?branch=master) [![codecov](https://codecov.io/gh/PiXeL16/SnakeClassic/branch/master/graph/badge.svg)](https://codecov.io/gh/PiXeL16/SnakeClassic)

A snake engine written in SpriteKit for all Apple devices.

:star: Features
---
* Fully tested engine functionality.
* Framework based, super easy to integrate in different platforms.
* Easy to customize and extend.

![Banner](/Art/SnakeWatch.png) 
![Banner](/Art/SnakeIphone.png)

## Why?
I wasted a lot of time playing Snake in my Nokia phone back in the day. What better way to learn some `SpriteKit` than to put in on the Apple Watch?. The idea was to create an `engine` that could be integrated in any Apple device that supports `SpriteKit` very easy and to do some `TDD` along the way.

## Project Structure
You can find most of the code in the `SnakeEngine` scheme and two examples of how it is integrated in the watch and in the main scheme. The integration in different platforms is fairly easy and the only thing that changes from the watch to the phone integration are the controls, for example, in the watch you can use the crown as the control along with swiping.

:alien: Author
------
Chris Jimenez - http://code.chrisjimenez.net

## License
`SnakeClassic` is released under the MIT license. See [LICENSE](https://github.com/pixel16/SnakeClassic/blob/master/LICENSE) for details.
