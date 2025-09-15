module test_bench ();
    localparam int INPUT_PERIOD = 10; // ns
    localparam int ADDR_PERIOD = 100; // ns
    
    logic din = 1'b0;
    logic [1:0] addr = 2'b00;
    logic [3:0] dout;
    
    // Генерация входного сигнала
    always #(INPUT_PERIOD/2) din = ~din;
    
    // Генерация адреса
    always #(ADDR_PERIOD/4) addr = addr + 1;
    
    // Экземпляр тестируемого модуля
    lab32 dut (
        .din(din),
        .addr(addr),
        .dout(dout)
    );
    
    // Мониторинг результатов
    initial begin
        $monitor("Time = %0t, din = %b, addr = %b, dout = %b", $time, din, addr, dout);
        #400 $finish;
    end
    
endmodule