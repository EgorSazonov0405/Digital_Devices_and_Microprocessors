`timescale 1ns / 1ps

module test_lab63();
    logic clk;
    logic srst;
    logic mode;
    logic [7:0] dout;

    // Экземпляр тестируемого модуля
    lab63 dut (
        .clk(clk),
        .srst(srst),
        .mode(mode),
        .dout(dout)
    );

    // Генерация тактового сигнала (100 МГц)
    always #5 clk = ~clk;

    // Основной процесс тестирования
    initial begin
        // Инициализация
        clk = 0;
        srst = 1;
        mode = 0;
        
        $display("Starting reversible counter test...");
        $display("Time(ns) | srst | mode | dout  | Description");
        $display("---------|------|------|-------|-------------------");
        
        // Такт 0-20: Сброс
        #20;
        srst = 0;
        
        // Такт 20-100: Счет вверх (mode=0)
        #80;
        
        // Такт 100-180: Счет вниз (mode=1)
        mode = 1;
        #80;
        
        // Такт 180-260: Снова счет вверх (mode=0)
        mode = 0;
        #80;
        
        $display("\nSimulation completed");
        $finish;
    end
endmodule