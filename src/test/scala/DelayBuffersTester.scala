import chisel3._
import chisel3.iotesters._
import conv.delaybuffers.DelayBuffers

class DelayBuffersTester(delayBuffers: DelayBuffers) extends PeekPokeTester(delayBuffers) {
  val data = Array(1, 2, 3)
  for (cycle <- 0 to 10) {
    if (cycle == 0) {
      for (i <- 0 until 3) {
        poke(delayBuffers.io.inputData(i), data(i))
      }
    } else {
      for (i <- 0 until 3) {
        poke(delayBuffers.io.inputData(i), 0)
      }
    }
    step(1)
    val result = new Array[Int](3)
    for (i <- 0 until 3) {
      result(i) = peek(delayBuffers.io.outputData(i)).toInt
    }
    for (i <- 0 until result.length) {
      print(result(i).toString + " ")
    }
    println()
  }

}

object DelayBuffersTester extends App {
  iotesters.Driver.execute(args, () => new DelayBuffers(3, 3)) {
    delayBuffers => new DelayBuffersTester(delayBuffers)
  }

}
