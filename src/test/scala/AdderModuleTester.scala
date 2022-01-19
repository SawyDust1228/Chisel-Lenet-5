import conv.addopration.AdderModule
import chisel3._
import chisel3.iotesters._

class AdderModuleTester(adderModule: AdderModule) extends PeekPokeTester(adderModule) {
  val data = Array.ofDim[Int](3, 3)
  generateData()
  for (cycle <- 0 to 3) {
    poke(adderModule.io.en, 1)
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        poke(adderModule.io.inputData(i)(j), data(i)(j))
      }
    }
    step(1)
    println("the answer is : " + peek(adderModule.io.outputData).toString)
  }


  def generateData(): Unit = {
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        data(i)(j) = j + 1
      }
    }
  }

}

object AdderModuleTester extends App {
  iotesters.Driver.execute(args, () => new AdderModule(3, 3)) {
    addModule => new AdderModuleTester(addModule)
  }
}
