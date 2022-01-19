
import chisel3._
import chisel3.iotesters._
import conv.Convolution

class BmpConvTester(convolution: Convolution) extends PeekPokeTester(convolution) {
  val ioTester = new IOTester
  val result = Array.ofDim[Int]((ioTester.height - 2) * (ioTester.width - 2))
  var count = 0
  for (cycle <- 0 until 1000000) {
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        poke(convolution.io.inputWeight(i)(j), ioTester.weight(i)(j))
      }
    }
    if (cycle < ((ioTester.width - 3 + 1) * ioTester.height)) {
      for (k <- 0 until 3) {
        poke(convolution.io.inputData(k), ioTester.stream(cycle)(k))
      }
    }

    if (peek(convolution.io.valid).toInt == 1) {
      result(count) = peek(convolution.io.outputData).toInt
      count += 1
      //print(count)
    }
    if (peek(convolution.io.finish).toInt == 1) {
      //print("done!!!!")
    }
    step(1)
  }
  val pic = getPic

  ioTester.savePicture((ioTester.width - 2), (ioTester.height - 2), pic)

  def colorToRGB(alpha: Int, red: Int, green: Int, blue: Int): Int = {
    var newPixel = 0
    newPixel += alpha
    newPixel = newPixel << 8
    newPixel += red
    newPixel = newPixel << 8
    newPixel += green
    newPixel = newPixel << 8
    newPixel += blue
    newPixel
  }

  def getPic = {
    val pic = Array.ofDim[Int]((ioTester.width - 2), (ioTester.height - 2))
    for (i <- 0 until (ioTester.width - 2)) {
      for (j <- 0 until (ioTester.height - 2)) {
        pic(i)(j) = result(i * (ioTester.height - 2) + j)
      }
    }
    pic
  }
}


object BmpConvTester extends App {
  iotesters.Driver.execute(args, () => new Convolution(600, 450, 3, 3)) {
    convolution => new BmpConvTester(convolution)
  }

}

