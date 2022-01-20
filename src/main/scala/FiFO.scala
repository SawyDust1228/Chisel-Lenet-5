import chisel3._
import sun.nio.cs.ext.IBM037

class FiFO(bitSize: Int, size: Int) extends Module {
  val io = IO(new Bundle {
    val inputValid = Input(Bool())
    val input = Input(SInt(bitSize.W))
    val rden = Input(Bool())
    val output = Input(SInt(bitSize.W))
    val outputValid = Input(Bool())
  })
  var addr = 0
  var rdAddr = 0
  val regs = List.fill(size)(Reg(SInt(bitSize.W)))
  when(io.inputValid) {
    regs(addr) := io.input
    addr += 1
  }


}
