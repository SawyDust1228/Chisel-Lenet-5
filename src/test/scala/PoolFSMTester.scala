import chisel3._
import chisel3.iotesters._
import pool.PoolFSM

class PoolFSMTester(poolFSM: PoolFSM) extends PeekPokeTester(poolFSM) {

  for (cycle <- 0 to 40) {
    println("the cycle is : " + cycle
      + " and the output is " + peek(poolFSM.io.output).toInt.toString
      + " and  the finish is " + peek(poolFSM.io.finish).toInt.toString
      + " amd state is : " + peek(poolFSM.io.outState).toInt.toString
      + "and the counter is : " + peek(poolFSM.io.outCounter).toInt.toString)
    step(1)
  }


}

object PoolFSMTester extends App {
  iotesters.Driver.execute(args, () => new PoolFSM(8, 8, 2, 2, 3)) {
    poolFsm => new PoolFSMTester(poolFsm)
  }
}
