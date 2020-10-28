package main

import (
	"fmt"
	"time"

	"github.com/drio/golights"
)

func main() {
	numLeds := 100
	theStrip := golights.Strip{Size: numLeds, Port: 7777, Ip: "192.168.8.150"}
	err := theStrip.Connect()
	if err != nil {
		fmt.Println("error: ", err)
	}
	defer theStrip.Conn.Close()

	err = theStrip.AllOn(golights.Color{R: 0, G: 0, B: 255})
	if err != nil {
		fmt.Println("error: ", err)
	}

	oneSecond, _ := time.ParseDuration("500ms")
	time.Sleep(oneSecond)
	err = theStrip.AllOn(golights.Color{R: 0, G: 255, B: 0})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.AllOn(golights.Color{R: 0, G: 0, B: 0})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.TurnOn(golights.Pixel{Idx: 45, RGB: golights.Color{R: 255}})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.TurnOn(golights.Pixel{Idx: 45, RGB: golights.Color{R: 0}})
	if err != nil {
		fmt.Println("error: ", err)
	}

	aBit, _ := time.ParseDuration("10ms")
	for i := 0; i <= numLeds; i++ {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 255}})
		time.Sleep(aBit)
	}

	for i := numLeds; i >= 0; i-- {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 0, G: 0, B: 0}})
		time.Sleep(aBit)
	}

	for i := 0; i < 50; i++ {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 100, G: 0, B: 0}})
		theStrip.TurnOn(golights.Pixel{Idx: uint32(numLeds - i), RGB: golights.Color{R: 0, G: 0, B: 100}})
		time.Sleep(aBit)
	}

	time.Sleep(oneSecond)
	theStrip.AllOn(golights.Color{R: 0, G: 0, B: 0})

	oneMil, _ := time.ParseDuration("50ms")
	for i := 0; i < 255; i++ {
		theStrip.AllOn(golights.Color{R: uint32(i), G: uint32(i), B: uint32(i)})
		time.Sleep(oneMil)
	}
	for i := 255; i >= 0; i-- {
		theStrip.AllOn(golights.Color{R: uint32(i), G: uint32(i), B: uint32(i)})
		time.Sleep(oneMil)
		fmt.Println(i)
	}

	theStrip.AllOn(golights.Color{R: 0, G: 0, B: 0})
}
