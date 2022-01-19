package pooltester

import chisel3._
import chisel3.iotesters._
import pool.Pool

class PoolTester(pool: Pool) extends PeekPokeTester(pool) {
  val streaming = generateData(8, 8)

  for (cycle <- 0 to 100) {
    if (cycle < 8 * 4) {
      for (i <- 0 until 2) {
        poke(pool.io.inputData(i), streaming(cycle)(i))
      }
    }
    if (peek(pool.io.valid).toInt == 1) {
      print(peek(pool.io.outData).toInt.toString + " ")
    }

    step(1)
  }

  def generateData(row: Int, column: Int) = {
    val data = Array.ofDim[Int](row, column)
    for (i <- 0 until row) {
      for (j <- 0 until column) {
        data(i)(j) = j + 1
      }
    }
    var count = 0
    val streaming = Array.ofDim[Int](row * column / 2, 2)
    for (i <- 0 until row / 2) {
      for (j <- 0 until column) {
        streaming(i * column + j)(0) = data(i * 2)(j)
        streaming(i * column + j)(1) = data(i * 2 + 1)(j)
      }
    }

    streaming

  }
}

object PoolTester extends App {
  iotesters.Driver.execute(args, () => new Pool(32, 8, 8, 2, 2)) {
    pool => new PoolTester(pool)
  }
}
