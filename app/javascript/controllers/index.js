// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import HideOnTopController from "./hide_on_top_controller"
application.register("hide-on-top", HideOnTopController)

import ScrollIntoController from "./scroll_into_controller"
application.register("scroll-into", ScrollIntoController)
