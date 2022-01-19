package relu

import chisel3._
import chisel3.util._

class ReluFSM(bitSize: Int) extends Module {
  val io = IO(new Bundle {
    val en = Input(Bool())
    val totalNum = Input(UInt(bitSize.W))
    val output = Output(Bool())
    val finish = Output(Bool())
    val outState = Output(UInt(bitSize.W))
    val outCounter = Output(UInt(bitSize.W))
  })

  val s_IDLE :: s_COMPUTE :: s_FINISH :: Nil = Enum(3)
  val state = RegInit(init = s_IDLE)
  val counter = RegInit(1.U(32.W))
  when(io.en) {
    switch(state) {
      is(s_IDLE) {
        counter := counter + 1.U
        state := s_COMPUTE
      }

      is(s_COMPUTE) {
        when(counter === io.totalNum) {
          state := s_FINISH
        }.otherwise {
          counter := counter + 1.U
        }
      }

      is(s_FINISH) {
        state := state
      }
    }
  }
  when(state === s_IDLE) {
    io.finish := 0.U
    io.output := 1.U
    io.outState := 1.U
  }.elsewhen(state === s_COMPUTE) {
    io.finish := 0.U
    io.output := 1.U
    io.outState := 2.U
  }.otherwise {
    io.finish := 1.U
    io.output := 0.U
    io.outState := 3.U
  }
  io.outCounter := counter

}
