package main

import (
	"log"
	"os"
	"time"

	"github.com/drio/golights"
)

var fiveSecond, _ = time.ParseDuration("5s")
var oneSecond, _ = time.ParseDuration("1s")
var fiveHundredMil, _ = time.ParseDuration("100ms")
var hundredMil, _ = time.ParseDuration("100ms")
var fiftyMil, _ = time.ParseDuration("50ms")
var aBit, _ = time.ParseDuration("20ms")
var aBitLess, _ = time.ParseDuration("10ms")

/*
	for i := 0; i < 50; i++ {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 100, G: 0, B: 0}})
		theStrip.TurnOn(golights.Pixel{Idx: uint32(numLeds - i), RGB: golights.Color{R: 0, G: 0, B: 100}})
		fmt.Println(i)
		time.Sleep(aBit)
	}
	for i := 50; i >= 0; i-- {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 0, G: 0, B: 0}})
		theStrip.TurnOn(golights.Pixel{Idx: uint32(numLeds - i), RGB: golights.Color{R: 0, G: 0, B: 0}})
		fmt.Println(i)
		time.Sleep(aBit)
	}

*/

func main() {
	numLeds := 100
	s := golights.Strip{Size: numLeds, Port: 7777, Ip: "192.168.8.186", Duration: fiveHundredMil}
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

	err = s.Set(golights.NoColor)
	if err != nil {
		log.Fatal(err)
	}
	os.Exit(0)
}
