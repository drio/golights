package golights

import (
	"fmt"
	"net"
)

type Strip struct {
	Size, Port int
	Ip         string
	Conn       *net.UDPConn
}

func (s *Strip) Connect() error {
	ServerAddr, err := net.ResolveUDPAddr("udp", fmt.Sprintf("%s:%d", s.Ip, s.Port))
	if err != nil {
		return err
	}

	// TODO: get local ip or pass it
	LocalAddr, err := net.ResolveUDPAddr("udp", "192.168.0.165:0")
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

func (s *Strip) TurnOn(p Pixel) error {
	_, err := s.Conn.Write(p.toBytes())
	return err
}

func (s *Strip) AllOn(c Color) error {
	data := []byte{}
	for i := 0; i < s.Size; i++ {
		pixel := Pixel{Idx: uint32(i), RGB: c}
		for _, b := range pixel.toBytes() {
			data = append(data, b)
		}
	}
	_, err := s.Conn.Write(data)
	return err
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
