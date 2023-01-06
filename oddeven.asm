.model small
.stack 100h
.data

tampilan db 13,10,'               by: Zainnaya Putri Diyanti'
         db 13,10,'-----------------------------------------'
         db 13,10,'| MENENTUKAN BILANGAN GENAP ATAU GANJIL |'  
         db 13,10,'-----------------------------------------$'

a db 10,13,'    Masukkan angka: $'
b db 10,13,'    Bilangan Genap$'
c db 10,13,'    Bilangan Ganjil$'
d db 10,13,'    Ini bukan angka$'

.code
main proc
    mov ax,@data
    mov ds,ax
              
    mov ah,9
    lea dx,tampilan
    int 21h
               
    mov ah,9  
    lea dx,a      ;memanggil kalimat a: 'Masukkan angka:'
    int 21h       ;cetak karakter
    
    mov ah,1
    int 21h
    
    cmp al,09
    jbe number:
    
    number:
    mov cl,04
    rol al,cl  
    
    mov ah,01
    int 21h
    
    cmp al,48     ;membandingkan inputan dengan 48:kode ascii 1
    jl bukanangka ;lompat ke perintah bukanangka
    cmp al,57     ;membandingkan inputan dengan 57:kode ascii 9
    jg bukanangka ;lompat ke perintah bukanangka  
     
    mov ah,0
    mov dl,2       ;bagi dengan 2
    div dl
    
    cmp ah,0       ;apakah hasil bagi habis?
    jne ganjil     ;jika tidak, lompat ke ganjil
    
    genap:
     mov ah,9
     lea dx,b      ;memanggil kalimat b: 'Bilangan Genap'
     int 21h       ;cetak karakter
     jmp exit
    
    ganjil:
     mov ah,9
     lea dx,c      ;memanggil kalimat c: 'Bilangan Ganjil'
     int 21h       ;cetak karakter
     jmp exit
    
    bukanangka:
     mov ah,9      ;memanggil kalimat d: 'Ini bukan angka'
     lea dx,d      ;cetak karakter
     int 21h

exit:
mov ah,4ch
int 21h
main endp      
end main    
    