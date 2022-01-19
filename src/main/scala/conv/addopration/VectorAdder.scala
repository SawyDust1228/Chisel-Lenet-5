package conv.addopration

import chisel3._

class VectorAdder(size: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(size, SInt(32.W)))
    val output = Output(SInt(32.W))
  })

  val adds = List.fill(size)(Module(new Adder))

  for (i <- 0 until size - 1) {
    adds(i).io.output <> adds(i + 1).io.a
  }
  adds(0).io.a := 0.S(32.W)
  for (i <- 0 until size) {
    adds(i).io.b := io.inputData(i)
  }


  io.output := adds(size - 1).io.output

}

