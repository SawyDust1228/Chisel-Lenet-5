import chisel3._
import chisel3.iotesters._
import conv.ConvFSM

class ConvFSMTester(convFSM: ConvFSM) extends PeekPokeTester(convFSM) {
  for (cycle <- 0 to 30) {
    print("the cycle is : " + cycle + " and state is : " +
      peek(convFSM.io.outState).toInt.toString + " and output is : "
      + peek(convFSM.io.output).toString + " and the finish is : " + peek(convFSM.io.finish).toString)
    println()
    step(1)
  }
}

object ConvFSMTester extends App {
  iotesters.Driver.execute(args, () => new ConvFSM(777, 777, 3, 3)) {
    convFSM => new ConvFSMTester(convFSM)
  }
}
