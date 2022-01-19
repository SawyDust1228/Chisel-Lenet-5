package conv.counter

import chisel3._

class LimitCounter(limitSize: Int) extends Module {
  val io = IO(new Bundle {
    val output = Output(UInt(32.W))
    val en = Input(Bool())
  })
  val reg = RegInit(0.U(32.W))
  when(io.en) {
    when(reg <= limitSize.U) {
      reg := reg + 1.U
    }.otherwise {
      reg := 0.U
    }
  }.otherwise {
    reg := reg
  }

  io.output := reg
}
