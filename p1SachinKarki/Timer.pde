class Timer
{
  float Time;

  Timer(float set)  // Constructor when you create a new Timer
  {
    Time = set;
  }

  float getTime()   //Returs the current time.
  {
    return(Time);
  }

  void setTime(float set)
  {
    Time = set;
  }

  void countUp() // updated the timer by counting up. 
  {
    Time += 1/frameRate;
  }

  void countDown()
  {
    Time -= 1/frameRate;
  }
}
