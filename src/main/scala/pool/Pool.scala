package pool

import chisel3._
import pool.delaybuffers.DelayBuffers
import pool.max.MaxModule

class Pool(bitSize: Int, dataHeight: Int, dataWidth: Int, poolHeight: Int, poolWidth: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(poolHeight, SInt(bitSize.W)))
    val outData = Output(SInt(bitSize.W))
    val valid = Output(Bool())
    val finish = Output(Bool())
  })

  val poolFSM = Module(new PoolFSM(dataHeight, dataWidth, poolHeight, poolWidth, poolWidth))
  val maxModule = Module(new MaxModule(bitSize, poolWidth, poolHeight))
  val delayBuffers = Module(new DelayBuffers(bitSize, poolHeight, poolWidth - 1))
  connection()

  def connection() = {
    io.valid := poolFSM.io.output
    io.finish := poolFSM.io.finish
    io.outData := maxModule.io.output
    maxModule.io.en <> poolFSM.io.output
    io.inputData <> delayBuffers.io.inputData
    for (i <- 0 until maxModule.io.input.length) {
      if (i == 0) {
        maxModule.io.input(i) <> io.inputData
      } else {
        maxModule.io.input(i) <> delayBuffers.io.outputWires(i - 1)
      }
    }
  }

}
