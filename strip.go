package golights

import (
	"fmt"
	"net"
	"time"
)

type Strip struct {
	Size, Port int
	Ip         string
	LocalIp    string
	Conn       *net.UDPConn
	Duration   time.Duration
}

var NoColor = Color{R: 0, G: 0, B: 0}
var White = Color{R: 255, G: 255, B: 255}
var LightWhite = Color{R: 20, G: 20, B: 20}
var MidWhite = Color{R: 155, G: 155, B: 155}
var WarmWhite = Color{R: 247, G: 95, B: 24}
var Halloween = Color{R: 136, G: 30, B: 228}
var FullRed = Color{R: 255, G: 0, B: 0}
var FullBlue = Color{R: 0, G: 0, B: 255}
var FullGreen = Color{R: 0, G: 255, B: 0}

func (s *Strip) Connect() error {
	ServerAddr, err := net.ResolveUDPAddr("udp", fmt.Sprintf("%s:%d", s.Ip, s.Port))
	if err != nil {
		return err
	}

	// TODO: get local ip or pass it
	localIp := fmt.Sprintf("%s:0", s.LocalIp)
	LocalAddr, err := net.ResolveUDPAddr("udp", localIp)
	if err != nil {
		return err
	}

	conn, err := net.DialUDP("udp", LocalAddr, ServerAddr)
	if err != nil {
		return err
	}
	s.Conn = conn

	return nil
}

func (s *Strip) SetPixel(p Pixel) error {
	_, err := s.Conn.Write(p.toBytes())
	if err != nil {
		time.Sleep(s.Duration)
	}
	return err
}

func (s *Strip) Set(c Color) error {
	data := []byte{}
	for i := 0; i < s.Size; i++ {
		pixel := Pixel{Idx: uint32(i), RGB: c}
		for _, b := range pixel.toBytes() {
			data = append(data, b)
		}
	}
	_, err := s.Conn.Write(data)

	if err != nil {
		return err
	}

	time.Sleep(s.Duration)
	return nil
}

func (s *Strip) FillUp(color Color, start int, numLeds int) error {
	for i := start; i <= numLeds; i++ {
		err := s.SetPixel(Pixel{Idx: uint32(i), RGB: color})
		if err != nil {
			return err
		}
		time.Sleep(s.Duration)
	}
	return nil
}

func (s *Strip) FillDown(color Color, end int, numLeds int) error {
	for i := numLeds - 1; i >= end; i-- {
		err := s.SetPixel(Pixel{Idx: uint32(i), RGB: color})
		if err != nil {
			return err
		}
		time.Sleep(s.Duration)
	}
	return nil
}

func (s *Strip) RaiseUp(color Color, increment int, start int, end int) error {
	for i := start; i < end; i = i + increment {
		ui := uint32(i)
		err := s.Set(Color{R: color.R + ui, G: color.G + ui, B: color.B + ui})
		if err != nil {
			return err
		}
		time.Sleep(s.Duration)
	}
	return nil
}

func (s *Strip) RaiseDown(color Color, increment int, start int, end int) error {
	for i := start; i < end; i = i + increment {
		ui := uint32(i)
		err := s.Set(Color{R: color.R - ui, G: color.G - ui, B: color.B - ui})
		if err != nil {
			return err
		}
		time.Sleep(s.Duration)
	}
	return nil
}

type Pixel struct {
	Idx uint32
	RGB Color
}

func (p *Pixel) rgba() (r, g, b, a uint32) {
	return p.RGB.R, p.RGB.G, p.RGB.B, 1
}

func (p *Pixel) toBytes() []byte {
	return []byte{byte(p.Idx), byte(p.RGB.R), byte(p.RGB.G), byte(p.RGB.B)}
}

type Color struct {
	R, G, B, A uint32
}
