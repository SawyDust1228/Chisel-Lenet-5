import chisel3._

class WindowFiFo(bitSize: Int, row: Int, column: Int, shiftSize: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(SInt(bitSize.W))
    val inputValid = Input(Bool())
    val isEmpty = Output(Bool())
    val isFull = Output(Bool())
    val outputData = Output(SInt(bitSize.W))
    val outputValid = Output(Bool())
  })



}
