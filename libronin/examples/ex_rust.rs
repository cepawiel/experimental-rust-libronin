#![no_std]

extern "C" {
    pub fn serial_init(baud: i32);
    pub fn usleep(ns: i32);
    pub fn serial_putc(ns: i32);
    pub fn serial_flush();
}

fn write_char(ch: char) {
    unsafe {
        serial_putc(ch as i32);
    }
}

#[no_mangle]
pub extern "C" fn main() {
    unsafe {
        serial_init(56700);
        
        usleep(1500000);

        write_char('H');
        write_char('e');
        write_char('l');
        write_char('l');
        write_char('o');
        write_char(' ');
        write_char('W');
        write_char('o');
        write_char('r');
        write_char('l');
        write_char('d');
        write_char(' ');
        write_char('f');
        write_char('r');
        write_char('o');
        write_char('m');
        write_char(' ');
        write_char('R');
        write_char('u');
        write_char('s');
        write_char('t');
        write_char(' ');
        write_char('o');
        write_char('n');
        write_char(' ');
        write_char('D');
        write_char('r');
        write_char('e');
        write_char('a');
        write_char('m');
        write_char('c');
        write_char('a');
        write_char('s');
        write_char('t');
        write_char('!');
        write_char('\n');
        write_char('\r');

        serial_flush();

        usleep(2000);
    }
}