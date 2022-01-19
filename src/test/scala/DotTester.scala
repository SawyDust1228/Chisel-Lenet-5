import chisel3._
import chisel3.iotesters._
import conv.dotopration.DotModule

import scala.util._

class DotTester(dotModule: DotModule) extends PeekPokeTester(dotModule) {
  val weight = Array(1, 2, 3)
  val inputData = Array(1, 2, 3)

  for (cycle <- 0 to 2) {
    for (i <- 0 until 3) {
      poke(dotModule.io.weight(i), weight(i))
      poke(dotModule.io.inputData(i), inputData(i))
    }
    step(1)
    val result = new Array[Int](3)
    for (i <- 0 until 3) {
      result(i) = peek(dotModule.io.output(i)).toInt
    }
    for (i <- 0 until 3) {
      print(result(i).toString + " ")
    }
    println()
  }

}

object DotTester extends App {
  iotesters.Driver.execute(args, () => new DotModule(3)) {
    dotModule => new DotTester(dotModule)
  }
}
