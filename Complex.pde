//Just a class to make working with Complex numbers a bit easier
class Complex
{
  private float real, imag;
  
  public Complex(float real, float imag)
  {
    this.real = real;
    this.imag = imag;
  }
  
  public float getReal()
  {
    return real;
  }
  
  public float getImag()
  {
    return imag;
  }
  
  public Complex addition(Complex num)
  {
    float real = this.real + num.getReal();
    float imag = this.imag + num.getImag();
    return new Complex(real, imag);
  }
  
  public Complex multiply(Complex num)
  {
    float real = this.real * num.getReal() - this.imag * num.getImag();
    float imag = this.real * num.getImag() + this.imag * num.getReal();
    return new Complex(real, imag);
  }
  
  public float distSquared()
  {
    return this.real * this.real + this.imag * this.imag;
  }
}
