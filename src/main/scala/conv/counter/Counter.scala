package conv.counter

import chisel3._

class Counter(size: Int) extends Module {
  val io = IO(new Bundle {
    val output = Output(UInt(size.W))
  })
  val reg = RegInit(0.U(size.W))

  reg := reg + 1.U

  io.output := reg
}

