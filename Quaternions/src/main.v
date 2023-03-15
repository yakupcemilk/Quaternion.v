module main
import giu

fn main() {
	// create the main window
	win := giu.new_window('Quaternion Calculation', 400, 300)

	// initialize the quaternion components
	q0, q1, q2, q3 := '0.0', '0.0', '0.0', '0.0'

	// create the quaternion input fields
	win.layout_space_begin('Quaternion', giu.Vec2{0, 0}, giu.Vec2{400, 100})
	win.label('q =')
	win.input_text('##q0', &q0)
	win.same_line()
	win.label('+')
	win.same_line()
	win.input_text('##q1', &q1)
	win.same_line()
	win.label('i')
	win.same_line()
	win.input_text('##q2', &q2)
	win.same_line()
	win.label('+')
	win.same_line()
	win.input_text('##q3', &q3)
	win.same_line()
	win.label('j')
	win.same_line()
	win.label('+')
	win.same_line()
	win.label('k')
	win.layout_space_end()

	// create the calculation button
	win.layout_space_begin('Calculation', giu.Vec2{0, 110}, giu.Vec2{400, 30})
	if win.button('Calculate') {
		// parse the quaternion components as floats
		q0_f, _ := float32(q0)
		q1_f, _ := float32(q1)
		q2_f, _ := float32(q2)
		q3_f, _ := float32(q3)

		// perform the quaternion calculation (here we're just printing it to the console)
		q := Quaternion{q0_f, q1_f, q2_f, q3_f}
		println(q.string())
	}
	win.layout_space_end()

	// run the GUI loop
	giu.single_window_app(&win)
}

struct Quaternion {
	q0 f32
	q1 f32
	q2 f32
	q3 f32
}

// String returns a string representation of the quaternion in the format "q0 + q1i + q2j + q3k"
fn (q Quaternion) string() string {
return '${q.q0} + ${q.q1}i + ${q.q2}j + ${q.q3}k'
}

