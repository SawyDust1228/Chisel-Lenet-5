package conv

import chisel3._
import conv.addopration.AdderModule
import conv.delaybuffers.DelayBuffers
import conv.dotopration.DotModule

class Convolution(inputDataRow: Int, inputDataColumn: Int, weightRow: Int, weightColumn: Int) extends Module {
  val io = IO(new Bundle {
    val inputData = Input(Vec(weightRow, SInt(32.W)))
    val inputWeight = Input(Vec(weightColumn, Vec(weightRow, SInt(32.W))))
    val finish = Output(Bool())
    val outputData = Output(SInt(32.W))
    val valid = Output(Bool())
  })
  val delayBuffer = Module(new DelayBuffers(weightRow, weightColumn - 1))
  val dotModules = List.fill(weightColumn)(Module(new DotModule(weightRow)))
  val adderModule = Module(new AdderModule(weightRow, weightColumn))

  val fsm = Module(new ConvFSM(inputDataRow, inputDataColumn, weightRow, weightColumn))
  connection()

  def connection(): Unit = {
    adderModule.io.en := fsm.io.output
    io.finish := fsm.io.finish
    io.valid := adderModule.io.valid
    io.outputData := adderModule.io.outputData
    io.inputData <> delayBuffer.io.inputData
    for (i <- 0 until weightColumn) {
      adderModule.io.inputData(i) <> dotModules(i).io.output
      dotModules(i).io.weight <> io.inputWeight(i)
      if (i == 0) {
        dotModules(i).io.inputData <> io.inputData
      } else {
        dotModules(i).io.inputData <> delayBuffer.io.outputWires(i - 1)
      }
    }

  }


}
