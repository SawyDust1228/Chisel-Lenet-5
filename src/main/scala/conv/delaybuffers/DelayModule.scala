package conv.delaybuffers

import chisel3._

class DelayModule(size: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(size, SInt(32.W)))
    val outputData = Output(Vec(size, SInt(32.W)))
  })

  val regs = Reg(Vec(size, SInt(32.W)))
  regs := io.inputData
  io.outputData := regs

}