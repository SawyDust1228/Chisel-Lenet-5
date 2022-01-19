package fc

import chisel3._

class Muter(bitSize: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(SInt(bitSize.W))
    val b = Input(SInt(bitSize.W))
    val out = Output(SInt(bitSize.W))
  })
  io.out := io.a * io.b
}
