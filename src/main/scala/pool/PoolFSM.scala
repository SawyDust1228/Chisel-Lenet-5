package pool

import chisel3._
import chisel3.util._

class PoolFSM(dataHeight: Int, dataWidth: Int, poolHeight: Int, poolWidth: Int, stride: Int) extends Module {
  val io = IO(new Bundle {
    val output = Output(Bool())
    val finish = Output(Bool())
    val outState = Output(UInt(32.W))
    val outCounter = Output(UInt(32.W))
  })

  val s_IDLE :: s_COMPUTE :: s_NOCOMPUTE :: s_FINISH :: Nil = Enum(4)
  val state = RegInit(init = s_IDLE)
  val count = RegInit(1.U(32.W))
  val numCounter = RegInit(0.U(32.W))
  val stallCounter = RegInit(0.U(32.W))

  switch(state) {
    is(s_IDLE) {
      when(count === (poolWidth.U - 1.U)) {
        state := s_COMPUTE
        numCounter := numCounter + 1.U
      }.otherwise {
        count := count + 1.U
        state := s_IDLE
      }
    }
    is(s_COMPUTE) {
      when(numCounter === ((dataHeight.U * dataWidth.U) / (poolWidth.U * poolHeight.U))) {
        state := s_FINISH
      }.otherwise {
        state := s_NOCOMPUTE
        stallCounter := 1.U
      }
    }
    is(s_NOCOMPUTE) {
      when(stallCounter === poolWidth.U - 1.U) {
        state := s_COMPUTE
      }.otherwise {
        stallCounter := stallCounter + 1.U
        state := s_NOCOMPUTE
      }
    }
    is(s_FINISH) {
      state := s_FINISH
    }
  }

  when(state === s_IDLE) {
    io.output := 0.U
    io.finish := 0.U
    io.outState := 1.U
  }.elsewhen(state === s_COMPUTE) {
    io.output := 1.U
    io.finish := 0.U
    io.outState := 2.U
    numCounter := numCounter + 1.U
  }.elsewhen(state === s_NOCOMPUTE) {
    io.output := 0.U
    io.finish := 0.U
    io.outState := 3.U
  }.otherwise {
    io.output := 0.U
    io.finish := 1.U
    io.outState := 4.U
  }

  io.outCounter := count

}
