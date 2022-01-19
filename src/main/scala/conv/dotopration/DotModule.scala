package conv.dotopration

import chisel3._

class DotModule(size: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(size, SInt(32.W)))
    val weight = Input(Vec(size, SInt(32.W)))
    val output = Output(Vec(size, SInt(32.W)))
  })

  val outputWire = List.fill(size)(WireInit(0.S(32.W)))
  for (i <- 0 until size) {
    outputWire(i) := io.inputData(i) * io.weight(i)
  }
  for (i <- 0 until size) {
    io.output(i) := outputWire(i)
  }
}
