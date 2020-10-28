package main

import (
	"fmt"
	"log"
	"time"

	"github.com/drio/golights"
)

func main() {
	numLeds := 100
	theStrip := golights.Strip{Size: numLeds, Port: 7777, Ip: "192.168.8.150"}
	err := theStrip.Connect()
	if err != nil {
		log.Fatal("error: ", err)
	}
	defer theStrip.Conn.Close()

	oneSecond, _ := time.ParseDuration("1s")
	err = theStrip.AllOn(golights.Color{R: 0, G: 0, B: 255})
	if err != nil {
		log.Fatal("error: ", err)
	}

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
	err = theStrip.TurnOn(golights.Pixel{Idx: 40, RGB: golights.Color{R: 255}})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.TurnOn(golights.Pixel{Idx: 40, RGB: golights.Color{R: 0}})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.TurnOn(golights.Pixel{Idx: 63, RGB: golights.Color{R: 255}})
	if err != nil {
		fmt.Println("error: ", err)
	}

	time.Sleep(oneSecond)
	err = theStrip.TurnOn(golights.Pixel{Idx: 63, RGB: golights.Color{R: 0}})
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
	time.Sleep(oneSecond)

	for i := 28; i < 75; i++ {
		theStrip.TurnOn(golights.Pixel{Idx: uint32(i), RGB: golights.Color{R: 55, G: 55, B: 55}})
		time.Sleep(aBit)
		fmt.Println(i)
	}

	oneMil, _ := time.ParseDuration("50ms")
	for i := 0; i < 255; i = i + 5 {
		theStrip.AllOn(golights.Color{R: uint32(i), G: uint32(i), B: uint32(i)})
		time.Sleep(oneMil)
	}
	for i := 255; i >= 0; i = i - 5 {
		theStrip.AllOn(golights.Color{R: uint32(i), G: uint32(i), B: uint32(i)})
		time.Sleep(oneMil)
		fmt.Println(i)
	}

	time.Sleep(oneSecond)
	theStrip.AllOn(golights.Color{R: 0, G: 0, B: 0})
}
