package conv.delaybuffers

import chisel3._

class DelayBuffers(vecSize: Int, bufferSize: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(vecSize, SInt(32.W)))
    val outputData = Output(Vec(vecSize, SInt(32.W)))
    val outputWires = Output(Vec(bufferSize, Vec(vecSize, SInt(32.W))))
  })

  val delayBuffers = List.fill(bufferSize)(Module(new DelayModule(vecSize)))
  for (i <- 0 until bufferSize - 1) {
    delayBuffers(i).io.outputData <> delayBuffers(i + 1).io.inputData
  }

  delayBuffers(0).io.inputData := io.inputData
  io.outputData := delayBuffers(delayBuffers.length - 1).io.outputData

  for (i <- 0 until bufferSize) {
    io.outputWires(i) := delayBuffers(i).io.outputData

  }

}