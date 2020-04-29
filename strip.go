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

func (s *Strip) TurnOn(led int, sc StripColor) error {
	p := packet{byte(led), byte(sc.R), byte(sc.G), byte(sc.B)}
	_, err := s.Conn.Write(p.toBytes())
	return err
}

type StripColor struct {
	R, G, B uint32
}

func (c *StripColor) rgba() (r, g, b, a uint32) {
	return c.R, c.G, c.B, 1
}

type packet struct {
	led   byte
	red   byte
	green byte
	blue  byte
}

func (p packet) toBytes() []byte {
	return []byte{p.led, p.red, p.green, p.blue}
}
