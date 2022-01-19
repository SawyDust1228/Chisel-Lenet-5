package relu

import chisel3._

class ReluModule(bitSize: Int) extends Module {
  val io = IO(new Bundle {
    val en = Input(Bool())
    val totalNum = (Input(SInt(bitSize.W)))
    val inputData = Input(SInt(bitSize.W))
    val outputData = Output(SInt(bitSize.W))
    val valid = Output(Bool())
    val finish = Output(Bool())
  })
  val fsm = Module(new ReluFSM(bitSize))
  when(io.en) {
    when(io.inputData > 0.S(bitSize.W)) {
      io.outputData := io.inputData
    }.otherwise {
      io.outputData := 0.S
    }
  }.otherwise {
    io.outputData := DontCare
  }

  def connection() = {
    io.en <> fsm.io.en
    fsm.io.totalNum := io.totalNum
    io.valid := fsm.io.output
    io.finish := fsm.io.finish
  }


}
