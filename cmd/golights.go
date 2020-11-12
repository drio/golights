package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/drio/golights"
)

var LightWhite = golights.Color{R: 20, G: 20, B: 20}
var MidWhite = golights.Color{R: 155, G: 155, B: 155}
var WarmWhite = golights.Color{R: 247, G: 95, B: 24}
var NoColor = golights.Color{R: 0, G: 0, B: 0}
var Halloween = golights.Color{R: 136, G: 30, B: 228}
var FullRed = golights.Color{R: 255, G: 0, B: 0}
var FullBlue = golights.Color{R: 0, G: 0, B: 255}
var FullGreen = golights.Color{R: 0, G: 255, B: 0}

var fiveSecond, _ = time.ParseDuration("5s")
var oneSecond, _ = time.ParseDuration("1s")
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

func fillUp(s golights.Strip, color golights.Color, duration time.Duration, start int, numLeds int) {
	for i := start; i <= numLeds; i++ {
		s.TurnOn(golights.Pixel{Idx: uint32(i), RGB: color})
		time.Sleep(duration)
	}
}

func fillDown(s golights.Strip, color golights.Color, duration time.Duration, end int, numLeds int) {
	for i := numLeds - 1; i >= end; i-- {
		s.TurnOn(golights.Pixel{Idx: uint32(i), RGB: color})
		time.Sleep(duration)
	}
}

func setPixel(s golights.Strip, color golights.Color, duration time.Duration, pixelNum uint32) {
	err := s.TurnOn(golights.Pixel{Idx: pixelNum, RGB: color})
	if err != nil {
		log.Fatal("error: ", err)
	}
	time.Sleep(duration)
}

func setAllColor(s golights.Strip, color golights.Color, duration time.Duration) {
	err := s.AllOn(color)
	if err != nil {
		log.Fatal("error: ", err)
	}
	time.Sleep(duration)
}

func raiseUp(s golights.Strip, color golights.Color,
	duration time.Duration, increment int, start int, end int) {

	for i := start; i < end; i = i + increment {
		ui := uint32(i)
		s.AllOn(golights.Color{R: color.R + ui, G: color.G + ui, B: color.B + ui})
		time.Sleep(duration)
	}
}

func raiseDown(s golights.Strip, color golights.Color,
	duration time.Duration,
	increment int, start int, end int) {

	for i := start; i <= end; i = i + increment {
		ui := uint32(i)
		fmt.Println(ui)
		s.AllOn(golights.Color{R: color.R - ui, G: color.G - ui, B: color.B - ui})
		time.Sleep(duration)
	}
}

func main() {
	numLeds := 100
	theStrip := golights.Strip{Size: numLeds, Port: 7777, Ip: "192.168.8.186"}
	err := theStrip.Connect()
	if err != nil {
		log.Fatal("error: ", err)
	}
	defer theStrip.Conn.Close()

	setAllColor(theStrip, WarmWhite, oneSecond)
	setAllColor(theStrip, NoColor, aBit)

	setPixel(theStrip, FullRed, oneSecond, 34)
	setAllColor(theStrip, NoColor, aBit)

	fillUp(theStrip, FullRed, aBit, 0, numLeds)
	fillDown(theStrip, NoColor, aBit, 0, numLeds)
	setAllColor(theStrip, NoColor, aBit)

	fillUp(theStrip, FullRed, aBitLess, 0, numLeds/2)
	fillUp(theStrip, FullBlue, aBitLess, numLeds/2, numLeds)
	fillDown(theStrip, NoColor, aBitLess, 0, numLeds/2)
	fillDown(theStrip, NoColor, aBitLess, numLeds/2, numLeds)
	setAllColor(theStrip, NoColor, aBitLess)

	fillUp(theStrip, FullBlue, aBitLess, 20, 80)
	setAllColor(theStrip, NoColor, aBitLess)

	raiseUp(theStrip, NoColor, fiftyMil, 5, 0, 155)
	raiseDown(theStrip, MidWhite, fiftyMil, 5, 0, 155)

	setAllColor(theStrip, NoColor, aBit)
	os.Exit(0)

}
