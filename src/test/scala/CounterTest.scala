import chisel3._
import chisel3.iotesters._
import chisel3.experimental._
import conv.counter.Counter

class CounterTest(counter: Counter) extends PeekPokeTester(counter) {
  for (cycle <- 0 until 7) {
    println("the cycle is " + cycle.toString + ", the output is " + peek(counter.io.output).toString)
    step(1)
  }
}

object CounterTest extends App {

  iotesters.Driver.execute(args, () => new Counter(3)) {
    counter => new CounterTest(counter)
  }
}