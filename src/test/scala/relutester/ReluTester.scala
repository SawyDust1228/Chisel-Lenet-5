package relutester

import chisel3._
import chisel3.iotesters._
import relu.ReluFSM

class ReluTester(reluFSM: ReluFSM) extends PeekPokeTester(reluFSM) {
  for (cycle <- 0 to 30) {
    poke(reluFSM.io.totalNum, 4)
    println("the cycle is : " + cycle
      + " the output is " + peek(reluFSM.io.output).toString()
      + " the finish is " + peek(reluFSM.io.finish).toInt.toString
      + " the state is : " + peek(reluFSM.io.outState).toInt.toString
      + " the counter is : " + peek(reluFSM.io.outCounter).toInt.toString)
    step(1)
  }
}

object ReluTester extends App {
  iotesters.Driver.execute(args, () => new ReluFSM(32)) {
    reluFSM => new ReluTester(reluFSM)
  }
}