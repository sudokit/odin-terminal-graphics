package main

import "core:time"

import tb "shared:odin-tb2"

update :: proc(dt: f64) {}

draw :: proc() {}

FPS :: 60

main :: proc() {
	tb.init();defer tb.shutdown()
	tb.hide_cursor()

	ev: tb.Event

	size := [2]i32{tb.width(), tb.height()}

	last_frame := time.tick_now()
	dt: f64
	frame_dt :: f64(1) / FPS
	running := true
	for running {
		now := time.tick_now()
		dur := time.tick_since(last_frame)
		last_frame = now
		dt = time.duration_seconds(dur)
		if dt < frame_dt do time.sleep(time.Duration((frame_dt - dt) * f64(time.Second)))

		// quit logic
		tb.peek_event(&ev, 0)
		if ev.type == .Key && ev.key == .Esc do running = false

		// update
		update(dt)

		// draw
		tb.clear()
		draw()
		tb.present()
	}

}

