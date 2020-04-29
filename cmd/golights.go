package main

import (
	"fmt"
	"time"

	"github.com/drio/golights"
)

func main() {
	theStrip := golights.Strip{Size: 144, Port: 7777, Ip: "192.168.0.150"}
	err := theStrip.Connect()
	if err != nil {
		fmt.Println("error: ", err)
	}
	defer theStrip.Conn.Close()

	err = theStrip.AllOn(golights.Color{R: 0, G: 0, B: 255})
	if err != nil {
		fmt.Println("error: ", err)
	}

	oneSecond, _ := time.ParseDuration("1s")
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
}
