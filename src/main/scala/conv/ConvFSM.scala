package conv

import chisel3._
import chisel3.util._

class ConvFSM(inputDataRow: Int, inputDataColumn: Int, weightRow: Int, weightColumn: Int) extends Module {
  val io = IO(new Bundle {
    val output = Output(Bool())
    val finish = Output(Bool())
    val outState = Output(UInt(32.W))
    val outCounter = Output(UInt(32.W))
  })

  val s_IDEL :: s_COMPUTE :: s_NOCOMPUTE :: s_FINISH :: Nil = Enum(4)
  val state = RegInit(init = s_IDEL)
  val count = RegInit(1.U(32.W))
  val computeCounter = RegInit(0.U(32.W))
  val dontComputeCounter = RegInit(0.U(32.W))
  val rowComputeCounter = RegInit(0.U(32.W))

  switch(state) {
    is(s_IDEL) {
      when(count === weightColumn.U - 1.U) {
        state := s_COMPUTE
        computeCounter := 1.U
      }.otherwise {
        count := count + 1.U
      }
    }
    is(s_COMPUTE) {
      when(computeCounter === inputDataColumn.U - weightColumn.U + 1.U) {
        state := s_NOCOMPUTE
        dontComputeCounter := 1.U
        rowComputeCounter := rowComputeCounter + 1.U
      }
    }
    is(s_NOCOMPUTE) {
      when((dontComputeCounter === weightColumn.U - 1.U)
        && !(rowComputeCounter === inputDataRow.U - weightRow.U + 1.U)) {
        state := s_COMPUTE
        computeCounter := 1.U
      }.elsewhen((rowComputeCounter === inputDataRow.U - weightRow.U + 1.U)) {
        state := s_FINISH
      }
    }
  }
  when((state === s_IDEL)) {
    io.finish := 0.U
    io.output := 0.U
    io.outState := 0.U
  }.elsewhen((state === s_COMPUTE)) {
    computeCounter := computeCounter + 1.U
    io.finish := 0.U
    io.output := 1.U
    io.outState := 1.U
  }.elsewhen((state === s_NOCOMPUTE)) {
    dontComputeCounter := dontComputeCounter + 1.U
    io.finish := 0.U
    io.output := 0.U
    io.outState := 2.U
  }.otherwise {
    io.finish := 1.U
    io.output := 0.U
    io.outState := 3.U
  }

  io.outCounter := count

}
