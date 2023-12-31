moonpatrol-commented
=====

[Open this project in 8bitworkshop](http://8bitworkshop.com/redir.html?platform=coleco&githubURL=https%3A%2F%2Fgithub.com%2Fmatheusjgsantos%2Fmoonpatrol-commented&file=moonpatrol-cv.asm).

### Decompiling the ROM

 The game ROM was decompiled using z80dasm version 1.1.6 with the following command:
```bash
z80dasm -a -l -g 0x8000 -o moonpatrol-cv.asm moonpatrol.rom
```
 Next, the resulting ASM file was uploaded to the [8bitworkshop IDE](http://8bitworkshop.com) and executed sucessfully, but the emulator doesn't accept the number keys to start the game. Changing the relative jump at 9c3f from `z` to `nz` skips the start screen and goes straight to the game:

 ```
< 	jr z,l9c56h	 ;9c3f
---
> 	jr nz,l9c56h ;9c3f
 ```



### VRAM info

Registers: 02 E3 0E FF 03 78 03 FE
|              |              |
|--------------|--------------|
|Pattern Table:|$0000 - $17FF|
|Name Table:|$3800 - $3AFF|
|Color Table:|$2000 - $37FF|
|Sprite Patterns:|$1800 - $1FFF|
|Sprite Attributes:|$3C00 - $3C7F|
|Screen Mode:|2|
|Display On:|True|



# Resources
 - The original game developer: [Matthew Household's page](http://www.colecovision.dk/householder.htm).
  - Z80 instruction set: [z80-heaven](http://z80-heaven.wikidot.com/instructions-set)

https://www.msx.org/forum/development/cross-development/colecovision-msx
http://colecoboxart.com/faq/FAQ05.htm
https://forums.atariage.com/topic/244875-cv-memory-map-and-programming-info/
https://hackaday.io/project/159057-game-boards-for-rc2014/log/156298-running-colecovision-games
https://www.leadedsolder.com/2020/02/16/colecovision-diy-part-1.html
http://www.gooddealgames.com/articles/ColecoProgramming/cv%20programming.pdf
https://archive.org/details/coleco-adam-technical-manual-eos6-os7/page/n1/mode/2up