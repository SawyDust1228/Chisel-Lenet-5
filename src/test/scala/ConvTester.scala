import chisel3._
import chisel3.iotesters._
import conv.Convolution

class ConvTester(convolution: Convolution) extends PeekPokeTester(convolution) {
  val data = Array.ofDim[Int](5, 5)
  val weight = Array.ofDim[Int](3, 3)
  val list = Array.ofDim[Int](15, 3)
  generateData()
  generateWeight()


  val result: List[Int] = List()
  for (cycle <- 0 to 20) {
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        poke(convolution.io.inputWeight(i)(j), weight(j)(i))
      }
    }
    if (cycle < 15) {
      for (k <- 0 until 3) {
        poke(convolution.io.inputData(k), list(cycle)(k))
      }
    }


    //    print(peek(convolution.io.outputData).toInt)
    //    print(peek(convolution.io.valid).toInt)

    if (peek(convolution.io.valid).toInt == 1) {
      print(peek(convolution.io.outputData).toInt + " ")
      (peek(convolution.io.outputData).toInt) +: result
    }
    //    if (peek(convolution.io.finish).toInt == 1) {
    //      print("the result is : ")
    //      print(result)
    //      println()
    //    }
    step(1)
  }

  def generateData(): Unit = {
    for (i <- 0 until 5) {
      for (j <- 0 until 5) {
        data(i)(j) = j + 1
      }
    }
    var count = 0

    for (k <- 0 until (5 - 3 + 1)) {
      for (m <- 0 until 5) {
        for (i <- 0 until 3) {
          list(count)(i) = data(k + i)(m)
        }
        count = count + 1
      }
    }

    print(list)

  }

  def generateWeight(): Unit = {
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        weight(j)(i) = 1
      }
    }
  }
}

object ConvTester extends App {
  iotesters.Driver.execute(args, () => new Convolution(5, 5, 3, 3)) {
    convolution => new ConvTester(convolution)
  }
}
