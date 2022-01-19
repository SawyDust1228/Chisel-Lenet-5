package pool.max

import chisel3._

class Comparator(bitSize: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(SInt(bitSize.W))
    val b = Input(SInt(bitSize.W))
    val output = Output(SInt(bitSize.W))
  })

  when(io.a >= io.b) {
    io.output := io.a
  }.otherwise {
    io.output := io.b
  }

}
