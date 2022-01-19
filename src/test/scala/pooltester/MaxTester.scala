package pooltester

import chisel3._
import chisel3.iotesters._
import pool.max.MaxModule

class MaxTester(maxModule: MaxModule) extends PeekPokeTester(maxModule) {
  for (cycle <- 0 to 7) {
    poke(maxModule.io.en, 1)
    for (i <- 0 until 2) {
      for (j <- 0 until 2) {
        poke(maxModule.io.input(i)(j), i * 2 + j + 1 - 3)
      }
    }
    step(1)
    if (peek(maxModule.io.valid).toInt == 1) {
      print(peek(maxModule.io.output).toInt)
    }
  }
}

object MaxTester extends App {
  iotesters.Driver.execute(args, () => new MaxModule(32, 2, 2)) {
    maxModule => new MaxTester(maxModule)
  }
}