package main

import "core:fmt"
import "core:math/rand"
import rl "vendor:raylib"

main :: proc(){
	rl.InitWindow(1024,768, "Barnsley Fern")

	screen_width : i32 = rl.GetScreenWidth()
	screen_height : i32 = rl.GetScreenHeight()

	x : f32 = 0.0
	y : f32 = 0.0

	next_x : f32 = 0.0
	next_y : f32 = 0.0
	
	rl.SetTargetFPS(200)

	rl.ClearBackground(rl.BLACK)

	for !rl.WindowShouldClose(){

		random_number := rand.float32_range(0, 100)

		if random_number < 1 {
			next_x = 0.0
			next_y = 0.16 * y
		} else if random_number < 86{
			next_x = 0.85 * x + 0.04 * y
			next_y = -0.04 * x + 0.85 * y + 1.86
		} else if random_number < 93 {
			next_x = 0.2 * x - 0.26 * y
			next_y = 0.23 * x + 0.22 * y + 1.6
		} else {
			next_x = -0.15 * x + 0.28 * y
			next_y = 0.26 * x + 0.24 * y + 0.44			
		}

		rl.BeginDrawing()	
		rl.DrawPixel(i32(50.0 * next_x + f32(screen_width) / 2.0), i32(50.0 * next_y + 50.0), rl.GREEN)
		rl.EndDrawing()

		x = next_x
		y = next_y
	}
	
	rl.CloseWindow()
}