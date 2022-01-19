package conv.addopration

import chisel3._

class AdderModule(vecSize: Int, bufferSize: Int) extends Module {
  val io = IO(new Bundle {
    val en = Input(Bool())
    val inputData = Input(Vec(bufferSize, Vec(vecSize, SInt(32.W))))
    val outputData = Output(SInt(32.W))
    val valid = Output(Bool())
  })

  val vecResult = List.fill(bufferSize)(WireInit(0.S(32.W)))
  when(io.en) {
    for (i <- 0 until bufferSize) {
      val vectorAdder = Module(new VectorAdder(vecSize))
      vectorAdder.io.inputData := io.inputData(i)
      vecResult(i) := vectorAdder.io.output
    }
    val adds = List.fill(bufferSize)(Module(new Adder))
    for (i <- 0 until bufferSize - 1) {
      adds(i).io.output <> adds(i + 1).io.a
    }
    adds(0).io.a := 0.S(32.W)
    for (i <- 0 until bufferSize) {
      adds(i).io.b := vecResult(i)
    }
    io.outputData := adds(bufferSize - 1).io.output
    io.valid := true.B
  }.otherwise {
    io.outputData := 0.S(32.W)
    io.valid := false.B
  }

}
