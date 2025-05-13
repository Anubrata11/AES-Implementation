# AES-Implementation

This project involves the implementation of the Advanced Encryption Standard, with key size 128, using an optimized s-box implementation. 
Each round consists of four steps - substitute bytes, shift rows, mix columns and add round key, except for the last round, which does not include mix columns.

The power dissipation, chip area and delay time were calculated using the Synopsys Compiler Tool, having a transistor size of 32nm. Two different implementations of the s-box were used, one by using the computational logic of byte generation, and the second by storing the s-box values in memory and simply accessing them. 

## Power Report 
![Screenshot 2025-05-13 224932](https://github.com/user-attachments/assets/3c41440c-b477-4dc5-842d-ee3c41e3f8f7)
![ss 2](https://github.com/user-attachments/assets/9a980b75-e607-4955-9f42-e53b8bcd8507)

## Area Report 
![ss 3](https://github.com/user-attachments/assets/3653e091-25f1-4043-af8a-f4368fdbe8b9)

## Timimg Report 
![ss 4](https://github.com/user-attachments/assets/41518db7-5617-4073-bcbd-7c7d3bfe3b63)
![ss 5](https://github.com/user-attachments/assets/3457bed5-898a-4e37-a255-d75a9b0943fc)
