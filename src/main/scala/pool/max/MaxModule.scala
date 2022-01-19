package pool.max

import chisel3._

class MaxModule(bitSize: Int, heightSize: Int, widthSize: Int) extends Module {
  val io = IO(new Bundle {
    val input = Input(Vec(heightSize, Vec(widthSize, SInt(bitSize.W))))
    val output = Output(SInt(bitSize.W))
    val en = Input(Bool())
    val valid = Output(Bool())
  })

  //val wires = WireInit(Vec(heightSize * widthSize, SInt(bitSize.W)))
  val wires = List.fill(heightSize * widthSize)(Wire(SInt(bitSize.W)))
  val comparators = List.fill(heightSize * widthSize)(Module(new Comparator(bitSize)))
  for (i <- 0 until heightSize) {
    for (j <- 0 until widthSize) {
      wires(i * widthSize + j) := io.input(i)(j)
    }
  }
  connection()
  when(io.en) {
    io.output := comparators(comparators.length - 1).io.output
    io.valid := io.en
  }.otherwise {
    io.output := 0.S
    io.valid := io.en
  }

  def connection() = {
    comparators(0).io.b := 0.S(bitSize.W)
    for (i <- 0 until comparators.length - 1) {
      comparators(i + 1).io.b <> comparators(i).io.output
    }
    for (i <- 0 until comparators.length) {
      comparators(i).io.a := wires(i)
    }

  }

}
