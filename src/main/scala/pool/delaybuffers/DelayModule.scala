package pool.delaybuffers

import chisel3._

class DelayModule(bitSize: Int, size: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(size, SInt(bitSize.W)))
    val outputData = Output(Vec(size, SInt(bitSize.W)))
  })

  val regs = Reg(Vec(size, SInt(bitSize.W)))
  regs := io.inputData
  io.outputData := regs

}