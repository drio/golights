package main

import (
	"log"
	"os"
	"time"

	"golights"
)

var fiveSecond, _ = time.ParseDuration("5s")
var oneSecond, _ = time.ParseDuration("1s")
var fiveHundredMil, _ = time.ParseDuration("100ms")
var hundredMil, _ = time.ParseDuration("100ms")
var fiftyMil, _ = time.ParseDuration("50ms")
var aBit, _ = time.ParseDuration("20ms")
var aBitLess, _ = time.ParseDuration("10ms")

func main() {
	numLeds := 100
	s := golights.Strip{Size: numLeds, Port: 7777, Ip: "192.168.8.186", Duration: oneSecond}
	err := s.Connect()
	if err != nil {
		log.Fatal("error: ", err)
	}
	defer s.Conn.Close()

	s.Set(golights.WarmWhite)

	s.SetPixel(golights.Pixel{Idx: 34, RGB: golights.FullRed})
	s.Set(golights.NoColor)

	s.Duration = aBit
	s.FillUp(golights.FullRed, 0, numLeds)
	s.FillDown(golights.NoColor, 0, numLeds)

	s.Set(golights.NoColor)

	s.FillUp(golights.FullRed, 0, numLeds/2)
	s.FillUp(golights.FullBlue, numLeds/2, numLeds)
	s.FillDown(golights.NoColor, 0, numLeds/2)
	s.FillDown(golights.NoColor, numLeds/2, numLeds)
	s.Set(golights.NoColor)
	s.FillUp(golights.FullBlue, 20, 80)
	s.Set(golights.NoColor)

	s.Duration = fiveHundredMil
	s.RaiseUp(golights.NoColor, 10, 0, 255)
	s.RaiseDown(golights.White, 10, 0, 255)

	s.Duration = oneSecond
	err = s.Set(golights.NoColor)
	if err != nil {
		log.Fatal(err)
	}

	time.Sleep(s.Duration)
	os.Exit(0)
}
