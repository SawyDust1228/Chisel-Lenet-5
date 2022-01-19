package conv.addopration

import chisel3._

class Adder extends Module {
  val io = IO(new Bundle {
    val a = Input(SInt(32.W))
    val b = Input(SInt(32.W))
    val output = Output(SInt(32.W))
  })
  io.output := io.a + io.b
}
