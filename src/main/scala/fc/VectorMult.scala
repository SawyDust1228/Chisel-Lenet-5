package fc

import chisel3._

class VectorMult(bitSize: Int, size: Int) extends Module {
  val io = IO(new Bundle {
    val en = Input(Bool())
    val num = Input(UInt(bitSize.W))
    val inputData = Input(Vec(size, SInt(bitSize.W)))
    val outputData = Output(SInt(bitSize.W))
    val valid = Output(Bool())
    val finish = Output(Bool())
    val mode = Input(Bool())
  })

  val datas = RegInit(Vec(size, SInt(bitSize.W)))
  val multers = List.fill(size)(Module(new Muter(bitSize)))
  val adders = List.fill(size)(Module(new Adder(bitSize)))
  val counter = RegInit(0.U(bitSize.W))
  connection()

  when(io.mode) {
    datas := io.inputData
    io.outputData := DontCare
    io.valid := DontCare
    io.finish := DontCare
  } otherwise {
    io.valid := io.en
    io.outputData := multers(multers.length - 1).io.out
    when(io.en === true.B) {
      counter := counter + 1.U
    }
    when(counter === io.num) {
      io.finish := 1.U
    } otherwise {
      io.finish := 0.U
    }

  }

  def connection() = {
    for (i <- 0 until multers.length) {
      multers(i).io.a := io.inputData(i)
      multers(i).io.b := datas(i)
    }
    for (i <- 0 until adders.length) {
      if (i == 0) {
        adders(i).io.b := 0.S(bitSize.W)

      } else {
        adders(i).io.b := adders(i - 1).io.out
      }
      adders(i).io.a := multers(i).io.out
    }
  }


}
