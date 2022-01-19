
import java.io.File
import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class IOTester {

  val file = new File("D:\\haizeiwang.bmp")
  val image: BufferedImage = ImageIO.read(file)

  val width: Int = image.getWidth
  val height: Int = image.getHeight
  val gray = getDatas()
  val stream = getStreamingData
  val weight = getSobelHorizontal
  print((width, height))
  saveGray()

  def saveGray() = {
    val grayImage = new BufferedImage(width, height, image.getType)
    for (i <- 0 until width) {
      for (j <- 0 until height) {
        val color = image.getRGB(i, j)
        val r: Int = (color >> 16) & 0xff
        val g: Int = (color >> 8) & 0xff
        val b: Int = color & 0xff
        val gray = (0.3 * r + 0.59 * g + 0.11 * b).asInstanceOf[Int]
        grayImage.setRGB(i, j, colorToRGB(0, gray, gray, gray))
      }
    }
    val newFile = new File("D:\\tester")
    ImageIO.write(grayImage, "jpg", newFile)
  }

  def savePicture(width: Int, height: Int, data: Array[Array[Int]]) = {
    val newImage = new BufferedImage(width, height, image.getType)
    for (i <- 0 until width) {
      for (j <- 0 until height) {
        newImage.setRGB(i, j, colorToRGB(0, data(i)(j), data(i)(j), data(i)(j)))
      }
    }
    val newFile = new File("D:\\result.jpg")
    ImageIO.write(newImage, "jpg", newFile)
  }

  def getWeight = {
    Array(Array(-1, 0, 1), Array(-2, 0, 2), Array(-1, 0, -1))
  }

  def getSobelHorizontal = {
    Array(Array(-1, -2, -1), Array(0, 0, 0), Array(1, 2, 1))
  }

  def getStreamingData = {
    val streaming = Array.ofDim[Int]((width - 3 + 1) * height, 3)
    var count = 0
    for (k <- 0 until (width - 3 + 1)) {
      for (m <- 0 until height) {
        for (i <- 0 until 3) {
          streaming(count)(i) = gray(k + i)(m)
        }
        count = count + 1
      }
    }
    streaming
  }


  def getDatas() = {
    val dataArray = Array.ofDim[Int](width, height)
    for (i <- 0 until width) {
      for (j <- 0 until height) {
        val color = image.getRGB(i, j)
        val r: Int = (color >> 16) & 0xff
        val g: Int = (color >> 8) & 0xff
        val b: Int = color & 0xff
        val gray = (0.3 * r + 0.59 * g + 0.11 * b).asInstanceOf[Int] //加权法灰度化
        dataArray(i)(j) = gray
      }
    }
    dataArray
  }

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

}
