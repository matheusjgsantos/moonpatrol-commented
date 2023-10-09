; z80dasm 1.1.6
; command line: z80dasm -a -l -g 0x8000 -o moonpatrol-cv.asm moonpatrol.rom

	org	08000h

	ld d,l			;8000 - CARTRIDGE: Cartridge header (55AA or AA55)
	xor d			;8001 - ''
	nop			;8002 - LOCAL_SPR_TABLE: Pointer to RAM copy of the sprite name table.
	nop			;8003 - ''
	nop			;8004 - SPRITE_ORDER: Pointer to RAM sprite order table
	nop			;8005 - ''
	nop			;8006 - WORK_BUFFER: Pointer to free buffer space in RAM.
	nop			;8007 - ''
	nop			;8008 - CONTROLLER_MAP: Pointer to controller memory map.
	nop			;8009 - ''
	ld b,d			;800a - START_GAME: Pointer to the start of the game.
	add a,b			;800b - '' The game code starts at the address 8042
	jp 0a0dfh		;800c - RST_8H_RAM: Restart 8h soft vector.
sub_800fh:
	jp la100h		;800f - RST_10H_RAM: Restart 10h soft vector.
	jp la0b2h		;8012 - RST_18H_RAM: Restart 18h soft vector.
	jp la187h		;8015 - RST_20H_RAM: Restart 20h soft vector.
	jp la833h		;8018 - RST_28H_RAM: Restart 28h soft vector.
	jp la61ch		;801b - RST_30H_RAM: Restart 30h soft vector.
	jp lab8eh		;801e - IRQ_INT_VECTOR: Maskable interrupt soft vector (38h).
	jp 0ab51h		;8021 - NMI_INT_VECTOR: Non maskable interrupt (NMI) soft vector.
	ld d,b			;8024
l8025h:
	ld d,d			;8025
	ld c,a			;8026
	ld b,a			;8027
	ld d,d			;8028
	ld b,c			;8029
	ld c,l			;802a
	ld c,l			;802b
	ld b,l			;802c
	ld b,h			;802d
	jr nz,l8072h		;802e
	ld e,c			;8030
	jr nz,$+79		;8031
	ld b,c			;8033
	ld d,h			;8034
	ld d,h			;8035
	jr nz,$+74		;8036
	ld c,a			;8038
	ld d,l			;8039
	ld d,e			;803a
	ld b,l			;803b
	ld c,b			;803c
	ld c,a			;803d
	ld c,h			;803e
	ld b,h			;803f
	ld b,l			;8040
	jp nc,0bfdbh		;8041
	ld sp,07fffh		;8044
	call sub_9f98h		;8047
	call sub_aafeh		;804a
	call sub_9bd9h		;804d
	jr l8056h		;8050
l8052h:
	call sub_9be5h		;8052
l8055h:
	rst 38h			;8055
l8056h:
	call sub_9fd7h		;8056
	rst 20h			;8059
	call sub_a147h		;805a
	call sub_859ah		;805d
	call 0cc65h		;8060
	call sub_aef8h		;8063
	call sub_baffh		;8066
	call sub_af00h		;8069
	call sub_bbbbh		;806c
	call sub_8416h		;806f
l8072h:
	call sub_9120h		;8072
	call sub_940dh		;8075
	call sub_9502h		;8078
	call sub_8ad7h		;807b
	call 0c1e6h		;807e
	call sub_8246h		;8081
	call sub_8a21h		;8084
	call sub_c561h		;8087
	rst 18h			;808a
	call sub_9fedh		;808b
	ld a,(07db0h)		;808e
	or a			;8091
	call nz,sub_8aaah		;8092
	call sub_c5d9h		;8095
	call 0c3eeh		;8098
	call 0c328h		;809b
	call sub_be8ah		;809e
	call 0bf09h		;80a1
	call sub_c11bh		;80a4
	call sub_ae2ah		;80a7
	call 0bdd7h		;80aa
	call sub_bc2bh		;80ad
	call sub_bab1h		;80b0
	call sub_bcd0h		;80b3
	ld a,(07e0bh)		;80b6
	or a			;80b9
	jp nz,l8181h		;80ba
	call sub_acdah		;80bd
	ld a,(07e09h)		;80c0
	or a			;80c3
	jp z,l8055h		;80c4
	call sub_975dh		;80c7
	ld hl,(07e24h)		;80ca
	ld (07e1eh),hl		;80cd
	ld hl,(07e22h)		;80d0
	ld (07e1ah),hl		;80d3
	ld hl,00000h		;80d6
	ld (07e1ch),hl		;80d9
	ld a,(07d91h)		;80dc
	push af			;80df
	call sub_9197h		;80e0
	pop af			;80e3
	ld b,a			;80e4
	ld a,(07d91h)		;80e5
	xor b			;80e8
	ld b,a			;80e9
	ld a,(07e33h)		;80ea
	or a			;80ed
	jp nz,l8177h		;80ee
	ld a,(07d92h)		;80f1
	or a			;80f4
	jp z,l80ffh		;80f5
	ld a,(07e4eh)		;80f8
	or a			;80fb
	jp nz,l8177h		;80fc
l80ffh:
	call sub_9fd7h		;80ff
	ld a,0b8h		;8102
	ld de,078e0h		;8104
	ld bc,00020h		;8107
	rst 10h			;810a
	call sub_9fedh		;810b
	ld b,01eh		;810e
	ld hl,l8213h		;8110
	call sub_acabh		;8113
	call sub_9fd7h		;8116
	ld hl,l8222h		;8119
	ld de,078a4h		;811c
	call sub_946eh		;811f
	ld hl,l823bh		;8122
	ld de,078ebh		;8125
	call sub_946eh		;8128
	call sub_9fedh		;812b
	sub a			;812e
	ld (07d85h),a		;812f
	ld hl,07dcch		;8132
	ld (hl),010h		;8135
l8137h:
	call l8213h		;8137
	call sub_91cdh		;813a
	ld a,(07d85h)		;813d
	and 03fh		;8140
	jr nz,l815eh		;8142
	ld hl,07dcch		;8144
	ld a,(hl)			;8147
	sub 001h		;8148
	daa			;814a
	ld (hl),a			;814b
	jp c,l8052h		;814c
	call sub_9fd7h		;814f
	ld de,078ebh		;8152
	ld bc,0021eh		;8155
	call sub_9441h		;8158
	call sub_9fedh		;815b
l815eh:
	ld a,(07d95h)		;815e
	and 00fh		;8161
	cp 002h		;8163
	jr nz,l8137h		;8165
	call sub_aae0h		;8167
	sub a			;816a
	ld (07d91h),a		;816b
	call sub_91aeh		;816e
l8171h:
	call sub_9ffdh		;8171
	jp l8056h		;8174
l8177h:
	bit 0,b		;8177
	jr nz,l8171h		;8179
	call sub_a06eh		;817b
	jp l8055h		;817e
l8181h:
	ld a,(07e19h)		;8181
	cp 005h		;8184
	jr z,l81cah		;8186
	cp 00ah		;8188
	jr z,l81d1h		;818a
	cp 00fh		;818c
	jr z,l81d7h		;818e
	cp 014h		;8190
	jr z,l81deh		;8192
	cp 01ah		;8194
	jr z,l81a8h		;8196
	cp 01fh		;8198
	jr z,l81e4h		;819a
	cp 024h		;819c
	jr z,l81ebh		;819e
	cp 029h		;81a0
	jr z,l81f1h		;81a2
	cp 02eh		;81a4
	jr z,l81f8h		;81a6
l81a8h:
	ld hl,l9ebbh		;81a8
	ld (07e7ah),hl		;81ab
	ld hl,l8dc8h		;81ae
	sub a			;81b1
l81b2h:
	ld (07e1eh),hl		;81b2
	ld (07e24h),hl		;81b5
	ld hl,00000h		;81b8
	ld (07e20h),hl		;81bb
	ld (07e1ch),hl		;81be
	ld (07e26h),a		;81c1
	call sub_9ffdh		;81c4
	jp l8056h		;81c7
l81cah:
	ld a,0ffh		;81ca
	ld hl,l8c0ch		;81cc
	jr l81b2h		;81cf
l81d1h:
	sub a			;81d1
	ld hl,l8c79h		;81d2
	jr l81b2h		;81d5
l81d7h:
	ld a,0ffh		;81d7
	ld hl,l8cefh		;81d9
	jr l81b2h		;81dc
l81deh:
	sub a			;81de
	ld hl,l8d45h		;81df
	jr l81b2h		;81e2
l81e4h:
	ld a,0ffh		;81e4
	ld hl,l8e33h		;81e6
	jr l81b2h		;81e9
l81ebh:
	sub a			;81eb
	ld hl,l8eb4h		;81ec
	jr l81b2h		;81ef
l81f1h:
	ld a,0ffh		;81f1
	ld hl,l8f31h		;81f3
	jr l81b2h		;81f6
l81f8h:
	sub a			;81f8
	ld hl,08fc7h		;81f9
	jr l81b2h		;81fc
l81feh:
	rst 38h			;81fe
	call sub_9fd7h		;81ff
	rst 20h			;8202
	call sub_859ah		;8203
	call sub_a147h		;8206
	call sub_8416h		;8209
	call sub_9120h		;820c
	rst 18h			;820f
	jp sub_9fedh		;8210
l8213h:
	rst 38h			;8213
	call sub_9fd7h		;8214
	rst 20h			;8217
	ld bc,00005h		;8218
	call sub_acbbh		;821b
	rst 18h			;821e
	jp sub_9fedh		;821f
l8222h:
	ld l,a			;8222
	ld l,d			;8223
	cp b			;8224
	ld e,(hl)			;8225
	ld l,d			;8226
	ld l,c			;8227
	ld l,a			;8228
	ld h,h			;8229
	ld l,c			;822a
	ld (hl),b			;822b
	ld h,b			;822c
	cp b			;822d
	ld h,d			;822e
	ld e,h			;822f
	ld l,b			;8230
	ld h,b			;8231
	cp b			;8232
	ld l,e			;8233
	ld l,l			;8234
	ld h,b			;8235
	ld l,(hl)			;8236
	ld l,(hl)			;8237
	cp b			;8238
	rra			;8239
	rst 38h			;823a
l823bh:
	rra			;823b
	ld e,0b8h		;823c
	ld l,(hl)			;823e
	ld h,b			;823f
	ld e,(hl)			;8240
	ld l,d			;8241
	ld l,c			;8242
l8243h:
	ld e,a			;8243
	ld l,(hl)			;8244
	rst 38h			;8245
sub_8246h:
	ld hl,(07e1ah)		;8246
	ld a,(07daeh)		;8249
	ld e,a			;824c
	ld d,000h		;824d
	add hl,de			;824f
	ld (07e1ah),hl		;8250
	ld ix,07c00h		;8253
	call sub_83a7h		;8257
	ld a,(07d97h)		;825a
	ld h,(ix+00dh)		;825d
	ld l,(ix+00ch)		;8260
	bit 4,(ix+003h)		;8263
	jr z,l82c9h		;8267
	ld hl,00160h		;8269
	ld (07da3h),hl		;826c
	ld hl,000b0h		;826f
	ld (07da5h),hl		;8272
	ld hl,00008h		;8275
	and 00ah		;8278
	jr nz,l8298h		;827a
	ld de,00120h		;827c
	ld (07da3h),de		;827f
	ld de,000b0h		;8283
	ld (07da5h),de		;8286
	ld a,(ix+001h)		;828a
	sub 030h		;828d
	jr c,l82a3h		;828f
	jr nz,l829dh		;8291
	ld hl,00000h		;8293
	jr l82a3h		;8296
l8298h:
	add hl,hl			;8298
	and 008h		;8299
	jr z,l82a3h		;829b
l829dh:
	ld de,00000h		;829d
	ex de,hl			;82a0
	sbc hl,de		;82a1
l82a3h:
	ld e,(ix+00ch)		;82a3
	ld d,(ix+00dh)		;82a6
	add hl,de			;82a9
	ld de,(07da3h)		;82aa
	or a			;82ae
	push hl			;82af
	sbc hl,de		;82b0
	jr nc,l82bfh		;82b2
	pop hl			;82b4
	push hl			;82b5
	ld de,(07da5h)		;82b6
	or a			;82ba
	sbc hl,de		;82bb
	jr nc,l82c2h		;82bd
l82bfh:
	pop hl			;82bf
	ex de,hl			;82c0
	push hl			;82c1
l82c2h:
	pop hl			;82c2
	ld (ix+00ch),l		;82c3
	ld (ix+00dh),h		;82c6
l82c9h:
	ld e,(ix+00ah)		;82c9
	ld d,(ix+001h)		;82cc
	add hl,de			;82cf
	ld a,(07da9h)		;82d0
	ld e,a			;82d3
	ld a,(07daah)		;82d4
	ld d,a			;82d7
	or a			;82d8
	sbc hl,de		;82d9
	ld (ix+00ah),l		;82db
	ld (ix+001h),h		;82de
	ld a,h			;82e1
	add a,010h		;82e2
	bit 4,(ix+003h)		;82e4
	jp z,l8376h		;82e8
	ld bc,01210h		;82eb
	push bc			;82ee
	ld hl,00000h		;82ef
	push hl			;82f2
	call sub_a8e2h		;82f3
	ld de,00000h		;82f6
	pop hl			;82f9
	adc hl,de		;82fa
	pop bc			;82fc
	inc b			;82fd
	push hl			;82fe
	call sub_a8e2h		;82ff
	ld de,00000h		;8302
	pop hl			;8305
	adc hl,de		;8306
	add hl,hl			;8308
	ld de,l8312h		;8309
	add hl,de			;830c
	ld a,(hl)			;830d
	inc hl			;830e
	ld h,(hl)			;830f
	ld l,a			;8310
	jp (hl)			;8311
l8312h:
	jr $-123		;8312
	ld e,e			;8314
	add a,e			;8315
	ld (hl),b			;8316
	add a,e			;8317
	ld de,00030h		;8318
l831bh:
	ld l,(ix+00eh)		;831b
	ld h,(ix+00fh)		;831e
	add hl,de			;8321
	bit 7,h		;8322
	jr nz,l8333h		;8324
	ld de,00100h		;8326
	push hl			;8329
	or a			;832a
	sbc hl,de		;832b
	jr c,l8340h		;832d
	ex de,hl			;832f
	pop de			;8330
	jr l8341h		;8331
l8333h:
	ld de,lff00h		;8333
	push hl			;8336
	or a			;8337
	sbc hl,de		;8338
	jr nc,l8340h		;833a
	ex de,hl			;833c
	pop de			;833d
	jr l8341h		;833e
l8340h:
	pop hl			;8340
l8341h:
	ld (ix+00eh),l		;8341
	ld (ix+00fh),h		;8344
	ld e,(ix+00bh)		;8347
	ld d,(ix+000h)		;834a
	add hl,de			;834d
	ld a,096h		;834e
	cp h			;8350
	jr c,l8354h		;8351
	ld h,a			;8353
l8354h:
	ld (ix+00bh),l		;8354
	ld (ix+000h),h		;8357
	ret			;835a
	sra (ix+00fh)		;835b
	rr (ix+00eh)		;835f
	sra (ix+00fh)		;8363
	rr (ix+00eh)		;8367
	sub a			;836b
	ld (ix+00bh),a		;836c
	ret			;836f
	ld de,lffd0h		;8370
	jp l831bh		;8373
l8376h:
	ld l,(ix+00eh)		;8376
	ld h,(ix+00fh)		;8379
	ld de,00006h		;837c
	add hl,de			;837f
	ld (ix+00eh),l		;8380
	ld (ix+00fh),h		;8383
	ld e,(ix+00bh)		;8386
	ld d,(ix+000h)		;8389
	add hl,de			;838c
	ld (ix+00bh),l		;838d
	ld (ix+000h),h		;8390
	ld de,l9800h		;8393
	or a			;8396
	sbc hl,de		;8397
	ret c			;8399
	ret z			;839a
	set 5,(ix+003h)		;839b
	sub a			;839f
	ld (ix+00eh),a		;83a0
	ld (ix+00fh),a		;83a3
	ret			;83a6
sub_83a7h:
	ld a,(07d98h)		;83a7
	and 001h		;83aa
	ret z			;83ac
	sub a			;83ad
	ld (07d98h),a		;83ae
	res 4,(ix+003h)		;83b1
	ld a,(ix+001h)		;83b5
	sub 030h		;83b8
	jr nc,l83cdh		;83ba
	neg		;83bc
	dec a			;83be
	add a,a			;83bf
	ld e,a			;83c0
	ld d,000h		;83c1
	ld hl,l83f6h		;83c3
	add hl,de			;83c6
	ld a,(hl)			;83c7
	inc hl			;83c8
	ld h,(hl)			;83c9
	ld l,a			;83ca
	jr l83d0h		;83cb
l83cdh:
	ld hl,lff30h		;83cd
l83d0h:
	ld (ix+00eh),l		;83d0
	ld (ix+00fh),h		;83d3
	ld hl,l9700h		;83d6
	ld (ix+00bh),l		;83d9
	ld (ix+000h),h		;83dc
	ld a,(ix+001h)		;83df
	cp 038h		;83e2
	jr nc,l83f1h		;83e4
	ld hl,(07da9h)		;83e6
	inc hl			;83e9
	inc hl			;83ea
	ld (ix+00ch),l		;83eb
	ld (ix+00dh),h		;83ee
l83f1h:
	ld a,001h		;83f1
	jp lc629h		;83f3
l83f6h:
	ld sp,032ffh		;83f6
	rst 38h			;83f9
	inc sp			;83fa
	rst 38h			;83fb
	inc (hl)			;83fc
	rst 38h			;83fd
	dec (hl)			;83fe
	rst 38h			;83ff
	inc b			;8400
	rst 38h			;8401
	scf			;8402
	rst 38h			;8403
	jr c,$+1		;8404
	add hl,sp			;8406
	rst 38h			;8407
	ld a,(03bffh)		;8408
	rst 38h			;840b
	inc a			;840c
	rst 38h			;840d
	dec a			;840e
	rst 38h			;840f
	ld a,0ffh		;8410
	ccf			;8412
	rst 38h			;8413
	ld b,b			;8414
	rst 38h			;8415
sub_8416h:
	ld ix,07c00h		;8416
	ld a,(ix+000h)		;841a
	rrca			;841d
	rrca			;841e
	and 006h		;841f
	ld e,a			;8421
	ld d,000h		;8422
	ld hl,l85d1h		;8424
	add hl,de			;8427
	ld a,(hl)			;8428
	inc hl			;8429
	ld h,(hl)			;842a
	ld l,a			;842b
	ld de,07800h		;842c
	add hl,de			;842f
	ld a,(ix+001h)		;8430
	rrca			;8433
	rrca			;8434
	rrca			;8435
	and 01fh		;8436
	ld e,a			;8438
	ld d,000h		;8439
	add hl,de			;843b
	ld (07da7h),hl		;843c
	push hl			;843f
	ld de,00020h		;8440
	add hl,de			;8443
	add hl,de			;8444
	ld c,0bfh		;8445
	out (c),l		;8447
	ld a,h			;8449
	and 0bfh		;844a
	out (c),a		;844c
	ld b,005h		;844e
	dec c			;8450
	ld hl,07dc1h		;8451
	ld (07dbfh),hl		;8454
l8457h:
	ini			;8457
	nop			;8459
	jr nz,l8457h		;845a
	pop hl			;845c
	inc c			;845d
	ld a,0f1h		;845e
	ld b,003h		;8460
l8462h:
	out (c),l		;8462
	out (c),h		;8464
	push bc			;8466
	ld b,005h		;8467
l8469h:
	out (0beh),a		;8469 - Send A to the VDP Data Port
	add a,003h		;846b - Add 003h to A
	djnz l8469h		;846d - Jumps to l8469h is B != 0
	sub 00eh		;846f - Substract 00eh from A 
	add hl,de		;8471 - Add DE to HL
	pop bc			;8472 - Fetch data from the stack into BC
	djnz l8462h		;8473
	ld hl,l89a1h		;8475
	ld a,(ix+000h)		;8478
	cp 080h		;847b
	jr nc,l8484h		;847d
	ld de,00008h		;847f
	jr l8497h		;8482
l8484h:
	cp 098h		;8484
	jr c,l848dh		;8486
	ld de,00000h		;8488
	jr l8497h		;848b
l848dh:
	and 007h		;848d
	neg		;848f
	ld b,008h		;8491
	add a,b			;8493
	ld e,a			;8494
	ld d,000h		;8495
l8497h:
	add hl,de			;8497
	ld b,005h		;8498
	ld c,0bfh		;849a
	ld de,07788h		;849c
	out (c),e		;849f
	out (c),d		;84a1
l84a3h:
	push hl			;84a3
	push bc			;84a4
	ld b,018h		;84a5
l84a7h:
	ld a,(hl)			;84a7
	inc hl			;84a8
	out (0beh),a		;84a9
	djnz l84a7h		;84ab
	pop bc			;84ad
	pop hl			;84ae
	djnz l84a3h		;84af
	ld a,(ix+001h)		;84b1
	rlca			;84b4
	and 00eh		;84b5
	ld e,a			;84b7
	ld d,000h		;84b8
	ld hl,l858ah		;84ba
	add hl,de			;84bd
	ld a,(hl)			;84be
	inc hl			;84bf
	ld h,(hl)			;84c0
	ld l,a			;84c1
	ld de,l85d9h		;84c2
	add hl,de			;84c5
	ld a,(ix+000h)		;84c6
	cp 080h		;84c9
	jr nc,l84d2h		;84cb
	ld de,00008h		;84cd
	jr l84e5h		;84d0
l84d2h:
	cp 098h		;84d2
	jr c,l84dbh		;84d4
	ld de,00000h		;84d6
	jr l84e5h		;84d9
l84dbh:
	and 007h		;84db
	neg		;84dd
	ld b,008h		;84df
	add a,b			;84e1
	ld e,a			;84e2
	ld d,000h		;84e3
l84e5h:
	add hl,de			;84e5
	exx			;84e6
	ld de,00018h		;84e7
	ld hl,01770h		;84ea
	ld (07dc6h),hl		;84ed
	ld hl,05780h		;84f0
	ld (07dc8h),hl		;84f3
	ld hl,07780h		;84f6
	ld (07dcah),hl		;84f9
	exx			;84fc
	ld b,005h		;84fd
l84ffh:
	push bc			;84ff
	exx			;8500
	ld hl,(07dc6h)		;8501
	add hl,de			;8504
	ld (07dc6h),hl		;8505
	ld hl,(07dc8h)		;8508
	add hl,de			;850b
	ld (07dc8h),hl		;850c
	ld hl,(07dcah)		;850f
	add hl,de			;8512
	ld (07dcah),hl		;8513
	ld hl,(07dbfh)		;8516
	ld a,(hl)			;8519
	inc hl			;851a
	ld (07dbfh),hl		;851b
	cp 081h		;851e
	exx			;8520
	jr nz,l852fh		;8521
	ld bc,00018h		;8523
	ld de,(07dc6h)		;8526
	call 0a0dfh		;852a
	jr l8583h		;852d
l852fh:
	ld bc,00010h		;852f
	ld de,(07dc6h)		;8532
	push af			;8536
	call 0a0dfh		;8537
	pop af			;853a
	push hl			;853b
	ld l,a			;853c
	ld h,000h		;853d
	add hl,hl			;853f
	add hl,hl			;8540
	add hl,hl			;8541
	push hl			;8542
	ld de,03000h		;8543
	add hl,de			;8546
	ld de,(07dcah)		;8547
	call sub_a128h		;854b
	pop hl			;854e
	ld de,01000h		;854f
	add hl,de			;8552
	ld bc,008bfh		;8553
	out (c),l		;8556
	out (c),h		;8558
	dec c			;855a
	ld hl,07dcch		;855b
	push hl			;855e
l855fh:
	ini		;855f
	jr nz,l855fh		;8561
	exx			;8563
	pop hl			;8564
	exx			;8565
	pop hl			;8566
	ld de,(07dc8h)		;8567
	inc c			;856b
	out (c),e		;856c
	out (c),d		;856e
	ld b,008h		;8570
l8572h:
	ld a,(hl)			;8572
	exx			;8573
	and (hl)			;8574
	jr z,l857ah		;8575
	ld (07e09h),a		;8577
l857ah:
	ld a,(hl)			;857a
	inc hl			;857b
	exx			;857c
	or (hl)			;857d
	inc hl			;857e
	out (0beh),a		;857f
	djnz l8572h		;8581
l8583h:
	pop bc			;8583
	djnz l8587h		;8584
	ret			;8586
l8587h:
	jp l84ffh		;8587
l858ah:
	nop			;858a
	nop			;858b
	ld a,b			;858c
	nop			;858d
	ret p			;858e
	nop			;858f
	ld l,b			;8590
	ld bc,001e0h		;8591
	ld e,b			;8594
	ld (bc),a			;8595
	ret nc			;8596
	ld (bc),a			;8597
	ld c,b			;8598
	inc bc			;8599
sub_859ah:
	ld a,(07d88h)		;859a
	ld b,081h		;859d
	ld c,0bfh		;859f
	ld de,00020h		;85a1
	ld hl,(07da7h)		;85a4
	call sub_85afh		;85a7
	add hl,de			;85aa
	call sub_85afh		;85ab
	add hl,de			;85ae
sub_85afh:
	out (c),l		;85af
	out (c),h		;85b1
	dec c			;85b3
	or a			;85b4
	jr nz,l85c3h		;85b5
	out (c),b		;85b7
	out (c),b		;85b9
	out (c),b		;85bb
	out (c),b		;85bd
	out (c),b		;85bf
	inc c			;85c1
	ret			;85c2
l85c3h:
	push af			;85c3
	push bc			;85c4
	ld a,b			;85c5
	ld b,005h		;85c6
l85c8h:
	out (c),a		;85c8
	nop			;85ca
	djnz l85c8h		;85cb
	pop bc			;85cd
	pop af			;85ce
	inc c			;85cf
	ret			;85d0
l85d1h:
	nop			;85d1
	ld (bc),a			;85d2
	jr nz,l85d7h		;85d3
	ld b,b			;85d5
	ld (bc),a			;85d6
l85d7h:
	ld b,b			;85d7
	ld (bc),a			;85d8
l85d9h:
	nop			;85d9
	nop			;85da
	nop			;85db
	nop			;85dc
	nop			;85dd
	nop			;85de
	nop			;85df
	nop			;85e0
	nop			;85e1
	nop			;85e2
	nop			;85e3
	nop			;85e4
	nop			;85e5
	nop			;85e6
	nop			;85e7
	nop			;85e8
	inc bc			;85e9
	ld c,03fh		;85ea
	ld a,a			;85ec
	rst 38h			;85ed
	rst 38h			;85ee
	ld a,a			;85ef
	ccf			;85f0
	nop			;85f1
	nop			;85f2
	nop			;85f3
	nop			;85f4
	nop			;85f5
	nop			;85f6
	nop			;85f7
	nop			;85f8
	nop			;85f9
	ld h,b			;85fa
	ld h,b			;85fb
	ld h,b			;85fc
	ret p			;85fd
	ld h,b			;85fe
	pop af			;85ff
	rst 30h			;8600
	ld l,a			;8601
	ld h,a			;8602
	rst 38h			;8603
	rst 38h			;8604
	rst 38h			;8605
	rst 38h			;8606
	rst 38h			;8607
	rst 38h			;8608
	nop			;8609
	nop			;860a
	nop			;860b
	nop			;860c
	nop			;860d
	nop			;860e
	nop			;860f
	nop			;8610
	nop			;8611
	nop			;8612
	nop			;8613
	nop			;8614
	ccf			;8615
	ret p			;8616
	ret nz			;8617
	add a,b			;8618
	add a,b			;8619
	rst 38h			;861a
	rst 38h			;861b
	rst 38h			;861c
	rst 38h			;861d
	rst 38h			;861e
	rst 38h			;861f
	rst 38h			;8620
	nop			;8621
	nop			;8622
	nop			;8623
	nop			;8624
	nop			;8625
	nop			;8626
	nop			;8627
	nop			;8628
	nop			;8629
	nop			;862a
	nop			;862b
	nop			;862c
	add a,b			;862d
	ld b,b			;862e
	jr nz,l8641h		;862f
	ld a,b			;8631
	rst 38h			;8632
	rst 38h			;8633
	call m,sub_f8fch		;8634
	ret m			;8637
	ret p			;8638
	nop			;8639
	nop			;863a
	nop			;863b
	nop			;863c
	nop			;863d
	nop			;863e
	nop			;863f
	nop			;8640
l8641h:
	nop			;8641
	nop			;8642
	nop			;8643
	nop			;8644
	nop			;8645
	nop			;8646
	nop			;8647
	nop			;8648
	nop			;8649
	nop			;864a
	nop			;864b
	nop			;864c
	nop			;864d
	nop			;864e
	nop			;864f
	nop			;8650
	nop			;8651
	nop			;8652
	nop			;8653
	nop			;8654
	nop			;8655
	nop			;8656
	nop			;8657
	nop			;8658
	nop			;8659
	nop			;865a
	nop			;865b
	nop			;865c
	nop			;865d
	nop			;865e
	nop			;865f
	nop			;8660
	ld bc,01f07h		;8661
	ccf			;8664
	ld a,a			;8665
	ld a,a			;8666
	ccf			;8667
	rra			;8668
	nop			;8669
	nop			;866a
	nop			;866b
	nop			;866c
	nop			;866d
	nop			;866e
	nop			;866f
	nop			;8670
	nop			;8671
	jr nc,l86a4h		;8672
	jr nc,l86eeh		;8674
	jr nc,l86f0h		;8676
	ld a,e			;8678
	or a			;8679
	inc sp			;867a
	rst 38h			;867b
	rst 38h			;867c
	rst 38h			;867d
	rst 38h			;867e
	rst 38h			;867f
	rst 38h			;8680
	nop			;8681
	nop			;8682
	nop			;8683
	nop			;8684
	nop			;8685
	nop			;8686
	nop			;8687
	nop			;8688
	nop			;8689
	nop			;868a
	nop			;868b
	nop			;868c
	rra			;868d
	ld a,b			;868e
	ret po			;868f
	ret nz			;8690
	ret nz			;8691
	rst 38h			;8692
	rst 38h			;8693
	rst 38h			;8694
	rst 38h			;8695
	rst 38h			;8696
	rst 38h			;8697
	rst 38h			;8698
	nop			;8699
	nop			;869a
	nop			;869b
	nop			;869c
	nop			;869d
	nop			;869e
	nop			;869f
	nop			;86a0
	nop			;86a1
	nop			;86a2
	nop			;86a3
l86a4h:
	nop			;86a4
	ret nz			;86a5
	jr nz,l86b8h		;86a6
	ex af,af'			;86a8
	inc a			;86a9
	rst 38h			;86aa
	rst 38h			;86ab
	cp 0feh		;86ac
	call m,sub_f8fch		;86ae
	nop			;86b1
	nop			;86b2
	nop			;86b3
	nop			;86b4
	nop			;86b5
	nop			;86b6
	nop			;86b7
l86b8h:
	nop			;86b8
	nop			;86b9
	nop			;86ba
	nop			;86bb
	nop			;86bc
	nop			;86bd
	nop			;86be
	nop			;86bf
	nop			;86c0
	nop			;86c1
	add a,b			;86c2
	add a,b			;86c3
	nop			;86c4
	nop			;86c5
	nop			;86c6
	nop			;86c7
	nop			;86c8
	nop			;86c9
	nop			;86ca
	nop			;86cb
	nop			;86cc
	nop			;86cd
	nop			;86ce
	nop			;86cf
	nop			;86d0
	nop			;86d1
	nop			;86d2
	nop			;86d3
	nop			;86d4
	nop			;86d5
	nop			;86d6
	nop			;86d7
	nop			;86d8
	nop			;86d9
	inc bc			;86da
	rrca			;86db
	rra			;86dc
	ccf			;86dd
	ccf			;86de
	rra			;86df
	rrca			;86e0
	nop			;86e1
	nop			;86e2
	nop			;86e3
	nop			;86e4
	nop			;86e5
	nop			;86e6
	nop			;86e7
	nop			;86e8
	nop			;86e9
	jr l8704h		;86ea
	jr $+62		;86ec
l86eeh:
	jr l872ch		;86ee
l86f0h:
	dec a			;86f0
	in a,(099h)		;86f1
	rst 38h			;86f3
	rst 38h			;86f4
	rst 38h			;86f5
	rst 38h			;86f6
	rst 38h			;86f7
	rst 38h			;86f8
	nop			;86f9
	nop			;86fa
	nop			;86fb
	nop			;86fc
	nop			;86fd
	nop			;86fe
	nop			;86ff
	nop			;8700
	nop			;8701
	nop			;8702
	nop			;8703
l8704h:
	nop			;8704
	rrca			;8705
	inc a			;8706
	ld (hl),b			;8707
	ret po			;8708
	ret po			;8709
	rst 38h			;870a
	rst 38h			;870b
	rst 38h			;870c
	rst 38h			;870d
	rst 38h			;870e
	rst 38h			;870f
	rst 38h			;8710
	nop			;8711
	nop			;8712
	nop			;8713
	nop			;8714
	nop			;8715
	nop			;8716
	nop			;8717
	nop			;8718
	nop			;8719
	nop			;871a
	nop			;871b
	nop			;871c
	ret po			;871d
	djnz l8728h		;871e
	inc b			;8720
	ld e,0ffh		;8721
	rst 38h			;8723
	rst 38h			;8724
	rst 38h			;8725
	cp 0feh		;8726
l8728h:
	call m,00000h		;8728
	nop			;872b
l872ch:
	nop			;872c
	nop			;872d
	nop			;872e
	nop			;872f
	nop			;8730
	nop			;8731
	nop			;8732
	nop			;8733
	nop			;8734
	nop			;8735
	nop			;8736
	nop			;8737
	nop			;8738
	nop			;8739
	ret nz			;873a
	ret nz			;873b
	nop			;873c
	nop			;873d
	nop			;873e
	nop			;873f
	nop			;8740
	nop			;8741
	nop			;8742
	nop			;8743
	nop			;8744
	nop			;8745
	nop			;8746
	nop			;8747
	nop			;8748
	nop			;8749
	nop			;874a
	nop			;874b
	nop			;874c
	nop			;874d
	nop			;874e
	nop			;874f
	nop			;8750
	nop			;8751
	ld bc,00f07h		;8752
	rra			;8755
	rra			;8756
	rrca			;8757
	rlca			;8758
	nop			;8759
	nop			;875a
	nop			;875b
	nop			;875c
	nop			;875d
	nop			;875e
	nop			;875f
	nop			;8760
	nop			;8761
	inc c			;8762
	inc c			;8763
	inc c			;8764
	ld e,00ch		;8765
	ld e,01eh		;8767
	ld l,l			;8769
	call z,sub_ffffh		;876a
	rst 38h			;876d
	rst 38h			;876e
	rst 38h			;876f
	rst 38h			;8770
	nop			;8771
	nop			;8772
	nop			;8773
	nop			;8774
	nop			;8775
	nop			;8776
	nop			;8777
	nop			;8778
	nop			;8779
	nop			;877a
	nop			;877b
	nop			;877c
	rlca			;877d
	ld e,038h		;877e
	ret p			;8780
	ret p			;8781
	rst 38h			;8782
	rst 38h			;8783
	rst 38h			;8784
	rst 38h			;8785
	rst 38h			;8786
	rst 38h			;8787
	rst 38h			;8788
	nop			;8789
	nop			;878a
	nop			;878b
	nop			;878c
	nop			;878d
	nop			;878e
	nop			;878f
	nop			;8790
	nop			;8791
	nop			;8792
	nop			;8793
	nop			;8794
	ret p			;8795
	ex af,af'			;8796
	inc b			;8797
	ld (bc),a			;8798
	rrca			;8799
	rst 38h			;879a
	rst 38h			;879b
	rst 38h			;879c
	rst 38h			;879d
	rst 38h			;879e
	rst 38h			;879f
	cp 000h		;87a0
	nop			;87a2
	nop			;87a3
	nop			;87a4
	nop			;87a5
	nop			;87a6
	nop			;87a7
	nop			;87a8
	nop			;87a9
	nop			;87aa
	nop			;87ab
	nop			;87ac
	nop			;87ad
	nop			;87ae
	nop			;87af
	nop			;87b0
	nop			;87b1
	ret po			;87b2
	ret po			;87b3
	add a,b			;87b4
	add a,b			;87b5
	nop			;87b6
	nop			;87b7
	nop			;87b8
	nop			;87b9
	nop			;87ba
	nop			;87bb
	nop			;87bc
	nop			;87bd
	nop			;87be
	nop			;87bf
	nop			;87c0
	nop			;87c1
	nop			;87c2
	nop			;87c3
	nop			;87c4
	nop			;87c5
	nop			;87c6
	nop			;87c7
	nop			;87c8
	nop			;87c9
	nop			;87ca
	inc bc			;87cb
	rlca			;87cc
	rrca			;87cd
	rrca			;87ce
	rlca			;87cf
	inc bc			;87d0
	nop			;87d1
	nop			;87d2
	nop			;87d3
	nop			;87d4
	nop			;87d5
	nop			;87d6
	nop			;87d7
	nop			;87d8
	nop			;87d9
	ld b,006h		;87da
	ld b,00fh		;87dc
	ld b,00fh		;87de
	rrca			;87e0
	ld (hl),0e6h		;87e1
	rst 38h			;87e3
	rst 38h			;87e4
	rst 38h			;87e5
	rst 38h			;87e6
	rst 38h			;87e7
	rst 38h			;87e8
	nop			;87e9
	nop			;87ea
	nop			;87eb
	nop			;87ec
	nop			;87ed
	nop			;87ee
	nop			;87ef
	nop			;87f0
	nop			;87f1
	nop			;87f2
	nop			;87f3
	nop			;87f4
	inc bc			;87f5
	rrca			;87f6
	inc e			;87f7
	ld a,b			;87f8
	ret m			;87f9
	ld a,a			;87fa
	rst 38h			;87fb
	rst 38h			;87fc
	rst 38h			;87fd
	rst 38h			;87fe
	rst 38h			;87ff
	rst 38h			;8800
	nop			;8801
	nop			;8802
	nop			;8803
	nop			;8804
	nop			;8805
	nop			;8806
	nop			;8807
	nop			;8808
	nop			;8809
	nop			;880a
	nop			;880b
	nop			;880c
	ret m			;880d
	inc b			;880e
	ld (bc),a			;880f
	ld bc,lff07h		;8810
	rst 38h			;8813
	rst 38h			;8814
	rst 38h			;8815
	rst 38h			;8816
	rst 38h			;8817
	rst 38h			;8818
	nop			;8819
	nop			;881a
	nop			;881b
	nop			;881c
	nop			;881d
	nop			;881e
	nop			;881f
	nop			;8820
	nop			;8821
	nop			;8822
	nop			;8823
	nop			;8824
	nop			;8825
	nop			;8826
	nop			;8827
	nop			;8828
	add a,b			;8829
	ret p			;882a
	ret p			;882b
	ret nz			;882c
	ret nz			;882d
	add a,b			;882e
	add a,b			;882f
	nop			;8830
	nop			;8831
	nop			;8832
	nop			;8833
	nop			;8834
	nop			;8835
	nop			;8836
	nop			;8837
	nop			;8838
	nop			;8839
	nop			;883a
	nop			;883b
	nop			;883c
	nop			;883d
	nop			;883e
	nop			;883f
	nop			;8840
	nop			;8841
	nop			;8842
	ld bc,00703h		;8843
	rlca			;8846
	inc bc			;8847
	ld bc,00000h		;8848
	nop			;884b
	nop			;884c
	nop			;884d
	nop			;884e
	nop			;884f
	nop			;8850
	nop			;8851
	inc bc			;8852
	inc bc			;8853
	inc bc			;8854
	rlca			;8855
	inc bc			;8856
	rlca			;8857
	rlca			;8858
	dec de			;8859
	ld (hl),e			;885a
	rst 38h			;885b
	rst 38h			;885c
	rst 38h			;885d
	rst 38h			;885e
	rst 38h			;885f
	rst 38h			;8860
	nop			;8861
	nop			;8862
	nop			;8863
	nop			;8864
	nop			;8865
	nop			;8866
	nop			;8867
	nop			;8868
	nop			;8869
	nop			;886a
	nop			;886b
	nop			;886c
	add a,c			;886d
	rlca			;886e
	adc a,(hl)			;886f
	cp h			;8870
	ld a,h			;8871
	ccf			;8872
	rst 38h			;8873
	rst 38h			;8874
	rst 38h			;8875
	rst 38h			;8876
	rst 38h			;8877
	rst 38h			;8878
	nop			;8879
	nop			;887a
	nop			;887b
	nop			;887c
	nop			;887d
	nop			;887e
	nop			;887f
	nop			;8880
	nop			;8881
	nop			;8882
	nop			;8883
	nop			;8884
	call m,00182h		;8885
	nop			;8888
	inc bc			;8889
	rst 38h			;888a
	rst 38h			;888b
	rst 38h			;888c
	rst 38h			;888d
	rst 38h			;888e
	rst 38h			;888f
	rst 38h			;8890
	nop			;8891
	nop			;8892
	nop			;8893
	nop			;8894
	nop			;8895
	nop			;8896
	nop			;8897
	nop			;8898
	nop			;8899
	nop			;889a
	nop			;889b
	nop			;889c
	nop			;889d
	nop			;889e
	nop			;889f
	add a,b			;88a0
	ret nz			;88a1
	ret m			;88a2
	ret m			;88a3
	ret po			;88a4
	ret po			;88a5
	ret nz			;88a6
	ret nz			;88a7
	add a,b			;88a8
	nop			;88a9
	nop			;88aa
	nop			;88ab
	nop			;88ac
	nop			;88ad
	nop			;88ae
	nop			;88af
	nop			;88b0
	nop			;88b1
	nop			;88b2
	nop			;88b3
	nop			;88b4
	nop			;88b5
	nop			;88b6
	nop			;88b7
	nop			;88b8
	nop			;88b9
	nop			;88ba
	nop			;88bb
	ld bc,00303h		;88bc
	ld bc,00000h		;88bf
	nop			;88c2
	nop			;88c3
	nop			;88c4
	nop			;88c5
	nop			;88c6
	nop			;88c7
	nop			;88c8
	nop			;88c9
	ld bc,00101h		;88ca
	inc bc			;88cd
	ld bc,00303h		;88ce
	dec c			;88d1
	add hl,sp			;88d2
	rst 38h			;88d3
	rst 38h			;88d4
	rst 38h			;88d5
	rst 38h			;88d6
	rst 38h			;88d7
	rst 38h			;88d8
	nop			;88d9
	nop			;88da
	nop			;88db
	nop			;88dc
	nop			;88dd
	nop			;88de
	nop			;88df
	nop			;88e0
	nop			;88e1
	add a,b			;88e2
	add a,b			;88e3
	add a,b			;88e4
	ret nz			;88e5
	add a,e			;88e6
	rst 0			;88e7
	sbc a,0beh		;88e8
	sbc a,a			;88ea
	rst 38h			;88eb
	rst 38h			;88ec
	rst 38h			;88ed
	rst 38h			;88ee
	rst 38h			;88ef
	rst 38h			;88f0
	nop			;88f1
	nop			;88f2
	nop			;88f3
	nop			;88f4
	nop			;88f5
	nop			;88f6
	nop			;88f7
	nop			;88f8
	nop			;88f9
	nop			;88fa
	nop			;88fb
	nop			;88fc
	cp 0c1h		;88fd
	nop			;88ff
	nop			;8900
	ld bc,sub_ffffh		;8901
	rst 38h			;8904
	rst 38h			;8905
	rst 38h			;8906
	rst 38h			;8907
	rst 38h			;8908
	nop			;8909
	nop			;890a
	nop			;890b
	nop			;890c
	nop			;890d
	nop			;890e
	nop			;890f
	nop			;8910
	nop			;8911
	nop			;8912
	nop			;8913
	nop			;8914
	nop			;8915
	nop			;8916
	add a,b			;8917
	ld b,b			;8918
	ret po			;8919
	call m,sub_f0fch		;891a
	ret p			;891d
	ret po			;891e
	ret po			;891f
	ret nz			;8920
	nop			;8921
	nop			;8922
	nop			;8923
	nop			;8924
	nop			;8925
	nop			;8926
	nop			;8927
	nop			;8928
	nop			;8929
	nop			;892a
	nop			;892b
	nop			;892c
	nop			;892d
	nop			;892e
	nop			;892f
	nop			;8930
	nop			;8931
	nop			;8932
	nop			;8933
	nop			;8934
	ld bc,00001h		;8935
	nop			;8938
	nop			;8939
	nop			;893a
	nop			;893b
	nop			;893c
	nop			;893d
	nop			;893e
	nop			;893f
	nop			;8940
	nop			;8941
	nop			;8942
	nop			;8943
	nop			;8944
	ld bc,00100h		;8945
	ld bc,01c06h		;8948
	ld a,a			;894b
	rst 38h			;894c
	rst 38h			;894d
	rst 38h			;894e
	rst 38h			;894f
	ld a,a			;8950
	nop			;8951
	nop			;8952
	nop			;8953
	nop			;8954
	nop			;8955
	nop			;8956
	nop			;8957
	nop			;8958
	nop			;8959
	ret nz			;895a
	ret nz			;895b
	ret nz			;895c
	ret po			;895d
	pop bc			;895e
	ex (sp),hl			;895f
	rst 28h			;8960
	rst 18h			;8961
	rst 8			;8962
	rst 38h			;8963
	rst 38h			;8964
	rst 38h			;8965
	rst 38h			;8966
	rst 38h			;8967
	rst 38h			;8968
	nop			;8969
	nop			;896a
	nop			;896b
	nop			;896c
	nop			;896d
	nop			;896e
	nop			;896f
	nop			;8970
	nop			;8971
	nop			;8972
	nop			;8973
	nop			;8974
	ld a,a			;8975
	ret po			;8976
	add a,b			;8977
	nop			;8978
	nop			;8979
	rst 38h			;897a
	rst 38h			;897b
	rst 38h			;897c
	rst 38h			;897d
	rst 38h			;897e
	rst 38h			;897f
	rst 38h			;8980
	nop			;8981
l8982h:
	nop			;8982
	nop			;8983
	nop			;8984
	nop			;8985
	nop			;8986
	nop			;8987
	nop			;8988
	nop			;8989
	nop			;898a
	nop			;898b
	nop			;898c
	nop			;898d
	add a,b			;898e
	ld b,b			;898f
	jr nz,l8982h		;8990
	cp 0feh		;8992
	ret m			;8994
	ret m			;8995
	ret p			;8996
	ret p			;8997
	ret po			;8998
	nop			;8999
	nop			;899a
	nop			;899b
	nop			;899c
	nop			;899d
	nop			;899e
	nop			;899f
	nop			;89a0
l89a1h:
	ld h,e			;89a1
	ld h,e			;89a2
	ld h,e			;89a3
	ld h,e			;89a4
	ld h,e			;89a5
	ld h,e			;89a6
	ld h,e			;89a7
	ld h,e			;89a8
	inc de			;89a9
	inc de			;89aa
	inc de			;89ab
	inc de			;89ac
	inc de			;89ad
	inc de			;89ae
	inc de			;89af
	inc de			;89b0
	inc de			;89b1
	inc de			;89b2
	out (0d3h),a		;89b3
	out (0e3h),a		;89b5
	ex (sp),hl			;89b7
	ex (sp),hl			;89b8
	ld h,e			;89b9
	ld h,e			;89ba
	ld h,e			;89bb
	ld h,e			;89bc
	ld h,e			;89bd
	ld h,e			;89be
	ld h,e			;89bf
	ld h,e			;89c0
	inc de			;89c1
	inc de			;89c2
	inc de			;89c3
	inc de			;89c4
	inc de			;89c5
	inc de			;89c6
	inc de			;89c7
	inc de			;89c8
	inc de			;89c9
	inc de			;89ca
	out (0d3h),a		;89cb
	out (0e3h),a		;89cd
	ex (sp),hl			;89cf
	ex (sp),hl			;89d0
	ld h,e			;89d1
	ld h,e			;89d2
	ld h,e			;89d3
	ld h,e			;89d4
	ld h,e			;89d5
	ld h,e			;89d6
	ld h,e			;89d7
	ld h,e			;89d8
	inc de			;89d9
	inc de			;89da
	inc de			;89db
	inc de			;89dc
	inc de			;89dd
	inc de			;89de
	inc de			;89df
	inc de			;89e0
	inc de			;89e1
	inc de			;89e2
	out (0d3h),a		;89e3
	out (0e3h),a		;89e5
	ex (sp),hl			;89e7
	ex (sp),hl			;89e8
	ld h,e			;89e9
	ld h,e			;89ea
	ld h,e			;89eb
	ld h,e			;89ec
	ld h,e			;89ed
	ld h,e			;89ee
	ld h,e			;89ef
	ld h,e			;89f0
	inc de			;89f1
	inc de			;89f2
	inc de			;89f3
	inc de			;89f4
	inc de			;89f5
	inc de			;89f6
	inc de			;89f7
	inc de			;89f8
	inc de			;89f9
	inc de			;89fa
	out (0d3h),a		;89fb
	out (0e3h),a		;89fd
	ex (sp),hl			;89ff
	ex (sp),hl			;8a00
	ld h,e			;8a01
	ld h,e			;8a02
	ld h,e			;8a03
	ld h,e			;8a04
	ld h,e			;8a05
	ld h,e			;8a06
	ld h,e			;8a07
	ld h,e			;8a08
	inc de			;8a09
	inc de			;8a0a
	inc de			;8a0b
	inc de			;8a0c
	inc de			;8a0d
	inc de			;8a0e
	inc de			;8a0f
	inc de			;8a10
	inc de			;8a11
	inc de			;8a12
	out (0d3h),a		;8a13
	out (0e3h),a		;8a15
	ex (sp),hl			;8a17
	ex (sp),hl			;8a18
	ld h,e			;8a19
	ld h,e			;8a1a
	ld h,e			;8a1b
	ld h,e			;8a1c
	ld h,e			;8a1d
	ld h,e			;8a1e
	ld h,e			;8a1f
	ld h,e			;8a20
sub_8a21h:
	ld iy,07c00h		;8a21
	ld ix,07c94h		;8a25
	ld a,(iy+001h)		;8a29
	dec a			;8a2c
	ld (ix+001h),a		;8a2d
	add a,00ah		;8a30
	ld (ix+005h),a		;8a32
	add a,009h		;8a35
	ld (ix+009h),a		;8a37
	ld a,(iy+003h)		;8a3a
	and 030h		;8a3d
	jr z,l8a98h		;8a3f
	ld b,003h		;8a41
l8a43h:
	push bc			;8a43
	ld bc,01008h		;8a44
	call sub_a91bh		;8a47
	jr c,l8a5eh		;8a4a
	ld b,(ix+000h)		;8a4c
	add a,b			;8a4f
	ld (ix+000h),a		;8a50
	cp 09eh		;8a53
	jr c,l8a8fh		;8a55
	ld a,0ffh		;8a57
	ld (07e09h),a		;8a59
	jr l8a8fh		;8a5c
l8a5eh:
	dec (ix+000h)		;8a5e
	bit 5,(iy+003h)		;8a61
	jr z,l8a8fh		;8a65
	pop bc			;8a67
	ld e,b			;8a68
	dec e			;8a69
	ld d,000h		;8a6a
	ld hl,l8aa7h		;8a6c
	add hl,de			;8a6f
	ld a,(hl)			;8a70
	ld hl,07d99h		;8a71
	or (hl)			;8a74
	ld d,a			;8a75
	inc a			;8a76
	and 0f8h		;8a77
	jr nz,l8a7eh		;8a79
	ld (hl),d			;8a7b
	jr l8a90h		;8a7c
l8a7eh:
	ld (hl),000h		;8a7e
	set 4,(iy+003h)		;8a80
	res 5,(iy+003h)		;8a84
	ld a,001h		;8a88
	ld (07d94h),a		;8a8a
	jr l8a90h		;8a8d
l8a8fh:
	pop bc			;8a8f
l8a90h:
	ld de,00004h		;8a90
	add ix,de		;8a93
	djnz l8a43h		;8a95
	ret			;8a97
l8a98h:
	ld a,(iy+000h)		;8a98
	add a,002h		;8a9b
	ld (ix+000h),a		;8a9d
	ld (ix+004h),a		;8aa0
	ld (ix+008h),a		;8aa3
	ret			;8aa6
l8aa7h:
	ld bc,00402h		;8aa7
sub_8aaah:
	ld ix,07c94h		;8aaa
	ld a,(ix+002h)		;8aae
	add a,004h		;8ab1
	cp 00ch		;8ab3
	jr nz,l8ab8h		;8ab5
	sub a			;8ab7
l8ab8h:
	ld (ix+002h),a		;8ab8
	ld a,(ix+006h)		;8abb
	add a,004h		;8abe
	cp 00ch		;8ac0
	jr nz,l8ac5h		;8ac2
	sub a			;8ac4
l8ac5h:
	ld (ix+006h),a		;8ac5
	ld a,(ix+00ah)		;8ac8
	add a,004h		;8acb
	cp 018h		;8acd
	jr nz,l8ad3h		;8acf
	ld a,00ch		;8ad1
l8ad3h:
	ld (ix+00ah),a		;8ad3
	ret			;8ad6
sub_8ad7h:
	ld de,l8aefh		;8ad7
sub_8adah:
	ld hl,(07e1eh)		;8ada
	ld a,(hl)			;8add
	or a			;8ade
	ret z			;8adf
	ld c,a			;8ae0
	rrca			;8ae1
	rrca			;8ae2
	rrca			;8ae3
	and 01eh		;8ae4
	ld l,a			;8ae6
	ld h,000h		;8ae7
	add hl,de			;8ae9
	ld a,(hl)			;8aea
	inc hl			;8aeb
	ld h,(hl)			;8aec
	ld l,a			;8aed
	jp (hl)			;8aee
l8aefh:
	rrca			;8aef
	adc a,e			;8af0
	rrca			;8af1
	adc a,e			;8af2
	rrca			;8af3
	adc a,e			;8af4
	rrca			;8af5
	adc a,e			;8af6
	rrca			;8af7
	adc a,e			;8af8
	rrca			;8af9
	adc a,e			;8afa
	rrca			;8afb
	adc a,e			;8afc
	rrca			;8afd
	adc a,e			;8afe
	inc a			;8aff
	adc a,e			;8b00
	ld e,a			;8b01
	adc a,e			;8b02
	ld (hl),e			;8b03
	adc a,e			;8b04
	ld a,e			;8b05
	adc a,e			;8b06
	add a,e			;8b07
	adc a,e			;8b08
	sub a			;8b09
	adc a,e			;8b0a
	sbc a,h			;8b0b
	adc a,e			;8b0c
	and c			;8b0d
	adc a,e			;8b0e
	ld hl,(07e1ch)		;8b0f
	ld a,h			;8b12
	or l			;8b13
	jr nz,l8b23h		;8b14
	ld a,c			;8b16
	add a,c			;8b17
	ld e,a			;8b18
	ld d,000h		;8b19
	ld hl,(07e1ah)		;8b1b
	add hl,de			;8b1e
	ld (07e1ch),hl		;8b1f
	ret			;8b22
l8b23h:
	ld de,(07e1ah)		;8b23
	or a			;8b27
	sbc hl,de		;8b28
	ret nc			;8b2a
	ld hl,00000h		;8b2b
	ld (07e1ch),hl		;8b2e
l8b31h:
	ld de,00001h		;8b31
l8b34h:
	ld hl,(07e1eh)		;8b34
	add hl,de			;8b37
	ld (07e1eh),hl		;8b38
	ret			;8b3b
	ld hl,(07e1eh)		;8b3c
	inc hl			;8b3f
	ld a,(hl)			;8b40
	bit 7,a		;8b41
	jr nz,l8b5ah		;8b43
	inc hl			;8b45
	ld (07e60h),hl		;8b46
	ld (07e5dh),a		;8b49
	call sub_bc98h		;8b4c
	ld hl,(07e1ah)		;8b4f
	ld (07e5eh),hl		;8b52
l8b55h:
	ld de,00002h		;8b55
	jr l8b34h		;8b58
l8b5ah:
	call sub_aef2h		;8b5a
	jr l8b55h		;8b5d
	ld a,c			;8b5f
	rrca			;8b60
	rrca			;8b61
	and 003h		;8b62
	ld e,a			;8b64
	ld d,000h		;8b65
	ld hl,07e6bh		;8b67
	add hl,de			;8b6a
	ld a,c			;8b6b
	and 003h		;8b6c
	inc a			;8b6e
	add a,(hl)			;8b6f
	ld (hl),a			;8b70
	jr l8b31h		;8b71
	ld a,c			;8b73
	and 00fh		;8b74
	ld (07e73h),a		;8b76
	jr l8b31h		;8b79
	ld a,c			;8b7b
	and 003h		;8b7c
	ld (07e6fh),a		;8b7e
	jr l8b31h		;8b81
	ld a,c			;8b83
	add a,a			;8b84
	and 00eh		;8b85
	ld c,a			;8b87
	ld b,000h		;8b88
	ld hl,l8ba6h		;8b8a
	add hl,bc			;8b8d
	ld a,(hl)			;8b8e
	inc hl			;8b8f
	ld h,(hl)			;8b90
	ld l,a			;8b91
	ld bc,l8b31h		;8b92
	push bc			;8b95
	jp (hl)			;8b96
	call sub_9228h		;8b97
	jr l8b31h		;8b9a
	call sub_9407h		;8b9c
	jr l8b31h		;8b9f
	call sub_9daah		;8ba1
	jr l8b31h		;8ba4
l8ba6h:
	ld (hl),b			;8ba6
	cp l			;8ba7
	and d			;8ba8
	cp l			;8ba9
	sbc a,b			;8baa
	xor l			;8bab
	cp a			;8bac
	xor l			;8bad
	call c,003adh		;8bae
	xor (hl)			;8bb1
	jp z,078bch		;8bb2
	xor (hl)			;8bb5
l8bb6h:
	ret p			;8bb6
	ld a,a			;8bb7
	ret nz			;8bb8
	ld d,e			;8bb9
	ret nz			;8bba
	ld h,c			;8bbb
	jp nz,03fd0h		;8bbc
	ret nz			;8bbf
	ld h,0e0h		;8bc0
	ld h,0c2h		;8bc2
	ld sp,00180h		;8bc4
	and c			;8bc7
	or c			;8bc8
	sub c			;8bc9
	ld a,a			;8bca
	ld h,0d0h		;8bcb
	and d			;8bcd
	sub l			;8bce
	ld a,b			;8bcf
	ret nc			;8bd0
	jp nz,ld071h+1		;8bd1
	djnz $-126		;8bd4
	ld (bc),a			;8bd6
	sub c			;8bd7
	ld (05ec2h),a		;8bd8
	ret nc			;8bdb
	jp nz,lc04ah		;8bdc
	ld c,d			;8bdf
	ret nc			;8be0
	jp nz,lc251h		;8be1
	ld c,b			;8be4
	ret nc			;8be5
	add a,b			;8be6
	inc bc			;8be7
	or d			;8be8
	and d			;8be9
	ld a,(04bc0h)		;8bea
	ret nz			;8bed
	ret po			;8bee
	ret nc			;8bef
	ld a,(06e96h)		;8bf0
	ret nc			;8bf3
	jp nz,ld071h+2		;8bf4
	dec bc			;8bf7
	add a,b			;8bf8
	inc b			;8bf9
	or c			;8bfa
	and d			;8bfb
	ld l,099h		;8bfc
	ld l,(hl)			;8bfe
	ret nc			;8bff
	ld b,091h		;8c00
	ld l,(hl)			;8c02
	ret nc			;8c03
	ld b,a			;8c04
	jp nz,ld048h		;8c05
	inc h			;8c08
	add a,080h		;8c09
	dec b			;8c0b
l8c0ch:
	ret nc			;8c0c
	ret nc			;8c0d
	and c			;8c0e
	or c			;8c0f
	ld e,e			;8c10
	sbc a,c			;8c11
	ld l,h			;8c12
	ret nc			;8c13
	sub l			;8c14
	ld a,a			;8c15
	inc hl			;8c16
	ret nz			;8c17
	ccf			;8c18
	jp nz,01ed0h		;8c19
	add a,b			;8c1c
	ld b,00fh		;8c1d
	ret nz			;8c1f
	dec hl			;8c20
	ret nz			;8c21
	ret po			;8c22
	dec (hl)			;8c23
	ret nc			;8c24
	jp nz,lc22eh+1		;8c25
	dec a			;8c28
	ret nc			;8c29
	jp lc22eh		;8c2a
	ld sp,022c2h		;8c2d
	ret nc			;8c30
	ret nz			;8c31
	ld sp,031c2h		;8c32
	ret nc			;8c35
	jp nz,0800dh		;8c36
	rlca			;8c39
	and d			;8c3a
	or d			;8c3b
	ret po			;8c3c
	inc a			;8c3d
	pop bc			;8c3e
	ld b,e			;8c3f
	ret nc			;8c40
	jp nz,lc131h		;8c41
	rrca			;8c44
	sub d			;8c45
	inc sp			;8c46
	ret nc			;8c47
	jp nz,0c235h		;8c48
l8c4bh:
	inc hl			;8c4b
	ret nc			;8c4c
	ld l,(hl)			;8c4d
	ret nc			;8c4e
	add hl,de			;8c4f
	add a,b			;8c50
	ex af,af'			;8c51
	and d			;8c52
	or d			;8c53
	sbc a,c			;8c54
	ld a,a			;8c55
	ret nc			;8c56
	inc a			;8c57
	sub c			;8c58
	inc hl			;8c59
	ret nc			;8c5a
	ld l,(hl)			;8c5b
	ret nc			;8c5c
	ld l,(hl)			;8c5d
	ret nc			;8c5e
	dec c			;8c5f
	add a,b			;8c60
	add hl,bc			;8c61
	and c			;8c62
	sbc a,b			;8c63
	ld a,a			;8c64
	ret nc			;8c65
	inc e			;8c66
	jp nz,ld031h		;8c67
	pop bc			;8c6a
	scf			;8c6b
	jp ld037h		;8c6c
	jp nz,lc33eh		;8c6f
	ld sp,lc1d0h		;8c72
	ld (080c6h),hl		;8c75
	ld a,(bc)			;8c78
l8c79h:
	ret nc			;8c79
	ret nc			;8c7a
	ret po			;8c7b
	ld (hl),d			;8c7c
	call nz,lc41ch+1		;8c7d
	inc sp			;8c80
	ret nc			;8c81
	call nz,sub_c420h		;8c82
	jr c,l8c4bh		;8c85
	inc l			;8c87
	call nz,0c436h		;8c88
	inc hl			;8c8b
	ret nc			;8c8c
	call nz,sub_c424h+2		;8c8d
	inc d			;8c90
	add a,b			;8c91
	dec bc			;8c92
	ld hl,02ec4h		;8c93
	call nz,sub_d027h		;8c96
	call nz,sub_c427h		;8c99
	ld l,0c4h		;8c9c
	add hl,de			;8c9e
	ret nc			;8c9f
l8ca0h:
	call nz,sub_c421h		;8ca0
l8ca3h:
	ld hl,03ec4h		;8ca3
	ret nc			;8ca6
	call nz,0c42eh		;8ca7
	inc e			;8caa
	call nz,sub_d022h		;8cab
	call nz,sub_800fh		;8cae
	inc c			;8cb1
	rrca			;8cb2
	call nz,sub_c424h		;8cb3
	add hl,sp			;8cb6
	ret nc			;8cb7
	call nz,sub_c423h		;8cb8
	dec e			;8cbb
	call nz,sub_d039h		;8cbc
	call nz,sub_c427h+2		;8cbf
	inc hl			;8cc2
	ret nc			;8cc3
	call nz,0c431h		;8cc4
	ld h,0e0h		;8cc7
	ret nc			;8cc9
	ld a,(de)			;8cca
	add a,b			;8ccb
	dec c			;8ccc
	and d			;8ccd
	or d			;8cce
	sub e			;8ccf
	ld a,a			;8cd0
	ret nc			;8cd1
	ccf			;8cd2
	sub (hl)			;8cd3
	ld e,0d0h		;8cd4
	ret po			;8cd6
	ret nc			;8cd7
	ld a,a			;8cd8
	ret nc			;8cd9
	inc c			;8cda
	add a,b			;8cdb
	ld c,0a1h		;8cdc
	or d			;8cde
	sbc a,e			;8cdf
	ld a,a			;8ce0
	ret nc			;8ce1
	add hl,de			;8ce2
	sub (hl)			;8ce3
	ld b,(hl)			;8ce4
	ret nc			;8ce5
	inc (hl)			;8ce6
	ld (04dd0h),a		;8ce7
	ret nc			;8cea
	ld (080c6h),a		;8ceb
	rrca			;8cee
l8cefh:
	ret nc			;8cef
	ret nc			;8cf0
	and c			;8cf1
	or d			;8cf2
	ld c,e			;8cf3
	sbc a,e			;8cf4
	ld (hl),d			;8cf5
	sub d			;8cf6
	ret nc			;8cf7
	ld h,(hl)			;8cf8
	ld a,a			;8cf9
	ret nc			;8cfa
	ld (01080h),a		;8cfb
	and e			;8cfe
	or c			;8cff
	ld c,e			;8d00
	sbc a,e			;8d01
	inc d			;8d02
	ret nc			;8d03
	sub a			;8d04
	inc d			;8d05
	sub e			;8d06
	ld a,a			;8d07
	ret nc			;8d08
	sbc a,e			;8d09
	ld h,h			;8d0a
	ret nc			;8d0b
	ld a,a			;8d0c
	ret nc			;8d0d
	add a,b			;8d0e
	ld de,lb2a3h		;8d0f
	ret po			;8d12
	sub a			;8d13
	ld c,h			;8d14
	ret nc			;8d15
	jp nz,ld071h+1		;8d16
	jp ld071h+1		;8d19
	pop bc			;8d1c
	ld d,b			;8d1d
	jp ld032h		;8d1e
	djnz l8ca3h		;8d21
	ld (de),a			;8d23
	and e			;8d24
	or d			;8d25
	ret po			;8d26
	ld (hl),d			;8d27
	ret nc			;8d28
	sub l			;8d29
	ld c,h			;8d2a
	sub c			;8d2b
	inc hl			;8d2c
	ret nc			;8d2d
	ld l,(hl)			;8d2e
	ret nc			;8d2f
	ld l,(hl)			;8d30
	ret nc			;8d31
	inc d			;8d32
	add a,b			;8d33
	inc de			;8d34
	and d			;8d35
	or d			;8d36
	sub d			;8d37
	ld (hl),d			;8d38
	ret nc			;8d39
	sbc a,d			;8d3a
	ld h,h			;8d3b
	ret nc			;8d3c
	ld h,h			;8d3d
	ret nc			;8d3e
	ld h,h			;8d3f
	ret nc			;8d40
	ld (de),a			;8d41
	add a,080h		;8d42
l8d44h:
	inc d			;8d44
l8d45h:
	ret nc			;8d45
	ret nc			;8d46
l8d47h:
	ld (hl),c			;8d47
	jp lc024h		;8d48
	dec (hl)			;8d4b
	ret nz			;8d4c
	ld b,l			;8d4d
	ret nc			;8d4e
	jp nz,lc015h		;8d4f
	dec l			;8d52
	ret nz			;8d53
l8d54h:
	ld b,(hl)			;8d54
	jp 0c00ah		;8d55
	dec l			;8d58
	ret nc			;8d59
	ret nz			;8d5a
	ex af,af'			;8d5b
	add a,b			;8d5c
	dec d			;8d5d
	dec d			;8d5e
	jp nz,lc208h		;8d5f
	ld a,(bc)			;8d62
	ret nz			;8d63
	add hl,sp			;8d64
	ret nc			;8d65
	push bc			;8d66
	dec l			;8d67
	push bc			;8d68
	add hl,sp			;8d69
	ret nc			;8d6a
	push bc			;8d6b
	dec (hl)			;8d6c
	pop bc			;8d6d
	add hl,sp			;8d6e
	ret nc			;8d6f
	push bc			;8d70
	dec hl			;8d71
	push bc			;8d72
	ld l,0c5h		;8d73
	jr z,l8d47h		;8d75
	push bc			;8d77
	inc h			;8d78
	add a,b			;8d79
	ld d,0a2h		;8d7a
	or d			;8d7c
	inc d			;8d7d
	ret nz			;8d7e
	ld l,0c0h		;8d7f
	jr c,$-62		;8d81
	dec hl			;8d83
	ret nz			;8d84
	sbc a,e			;8d85
	ret nc			;8d86
	ld a,a			;8d87
	sub e			;8d88
	rla			;8d89
	sub l			;8d8a
	ret nc			;8d8b
	ld a,a			;8d8c
	rla			;8d8d
	ret nc			;8d8e
	rrca			;8d8f
	add a,b			;8d90
	rla			;8d91
	and d			;8d92
	or d			;8d93
	ret po			;8d94
	ld c,h			;8d95
	sub e			;8d96
	ld c,h			;8d97
	sub (hl)			;8d98
	ret nc			;8d99
	ld a,a			;8d9a
	ret nc			;8d9b
	ld a,a			;8d9c
	ret nc			;8d9d
	rrca			;8d9e
	add a,b			;8d9f
	jr l8d44h		;8da0
	or d			;8da2
	sub e			;8da3
	ld c,h			;8da4
	ld c,h			;8da5
	ret nc			;8da6
	sbc a,d			;8da7
	ld a,a			;8da8
	rla			;8da9
	ret nc			;8daa
	ld a,a			;8dab
	rla			;8dac
	ret nc			;8dad
	inc d			;8dae
	add a,b			;8daf
	add hl,de			;8db0
	and c			;8db1
	or d			;8db2
	sbc a,e			;8db3
	sbc a,c			;8db4
	ld a,a			;8db5
	rla			;8db6
	ret nc			;8db7
	sub (hl)			;8db8
	ld d,l			;8db9
	jp nz,ld042h		;8dba
	ret nz			;8dbd
	jr c,$-62		;8dbe
	ld b,c			;8dc0
	jp sub_d027h		;8dc1
	add a,080h		;8dc4
	ld a,(de)			;8dc6
	nop			;8dc7
l8dc8h:
	ret p			;8dc8
	and c			;8dc9
	or e			;8dca
	ld e,d			;8dcb
	sub d			;8dcc
	ld l,c			;8dcd
	ret nc			;8dce
	sub (hl)			;8dcf
	ld a,a			;8dd0
	ld a,a			;8dd1
	djnz l8d54h		;8dd2
	dec de			;8dd4
	ret po			;8dd5
	ld a,a			;8dd6
	add hl,de			;8dd7
	ret nc			;8dd8
	rst 0			;8dd9
	ld a,a			;8dda
	ld e,0d0h		;8ddb
	ld a,a			;8ddd
	ld e,0d0h		;8dde
	add a,b			;8de0
	add a,b			;8de1
	add a,b			;8de2
	inc e			;8de3
	ld a,a			;8de4
	ccf			;8de5
	ret nc			;8de6
	push bc			;8de7
	ld h,0c2h		;8de8
	ld (034c2h),hl		;8dea
	ret nc			;8ded
	jp nz,sub_c02ah+1		;8dee
	ld c,0c5h		;8df1
	ld h,0c0h		;8df3
	ld (hl),0d0h		;8df5
	add a,b			;8df7
	dec e			;8df8
	ex af,af'			;8df9
	push bc			;8dfa
	ld a,(de)			;8dfb
	push bc			;8dfc
	ld hl,(031c5h)		;8dfd
	ret nc			;8e00
	push bc			;8e01
	ld a,(bc)			;8e02
	pop bc			;8e03
	dec l			;8e04
	jp nz,lc22bh		;8e05
	dec l			;8e08
	push bc			;8e09
	ld hl,007c5h		;8e0a
	ret nc			;8e0d
	pop bc			;8e0e
	dec l			;8e0f
	jp nz,lc52eh		;8e10
	ld l,0c5h		;8e13
	rlca			;8e15
	pop bc			;8e16
	ret nc			;8e17
	rra			;8e18
	add a,b			;8e19
	ld e,0a2h		;8e1a
	or d			;8e1c
	ret po			;8e1d
	ld h,093h		;8e1e
	ld h,0c0h		;8e20
	ld l,0c0h		;8e22
	dec hl			;8e24
	ret nc			;8e25
	ret nz			;8e26
	dec (hl)			;8e27
	jp nz,lc12fh		;8e28
	ret nc			;8e2b
	ld c,(hl)			;8e2c
	jp nz,ld021h		;8e2d
	add a,080h		;8e30
	rra			;8e32
l8e33h:
	ret nc			;8e33
	ret nc			;8e34
	and c			;8e35
	or c			;8e36
	ld h,h			;8e37
	sbc a,d			;8e38
	ld a,a			;8e39
	ret nc			;8e3a
	sbc a,d			;8e3b
	ld a,a			;8e3c
	ld h,l			;8e3d
	ret nc			;8e3e
	add a,b			;8e3f
	jr nz,l8e5bh		;8e40
	jp lc10ah		;8e42
	cpl			;8e45
	jp nz,ld038h		;8e46
	ret nz			;8e49
	ld de,02ec2h		;8e4a
	call nz,sub_c40ah		;8e4d
	ld hl,lc0d0h		;8e50
	daa			;8e53
	jp nz,lc416h		;8e54
	dec bc			;8e57
	call nz,sub_d01ch		;8e58
l8e5bh:
	ret nz			;8e5b
	daa			;8e5c
	jp nz,0d057h		;8e5d
	add a,b			;8e60
	ld hl,lb2a2h		;8e61
	ret po			;8e64
	sbc a,e			;8e65
l8e66h:
	ld (hl),d			;8e66
	ret nc			;8e67
	and c			;8e68
	sub e			;8e69
	ld a,a			;8e6a
	ret nc			;8e6b
	ccf			;8e6c
	ret nz			;8e6d
	inc e			;8e6e
	ret nc			;8e6f
	ld (025c0h),a		;8e70
	jp nz,lc00bh		;8e73
	inc e			;8e76
	ret nc			;8e77
	add a,b			;8e78
	ld (lb3a3h),hl		;8e79
	ret po			;8e7c
	ld h,096h		;8e7d
	ld c,h			;8e7f
	ret nc			;8e80
	sub d			;8e81
	ld h,0c0h		;8e82
	dec l			;8e84
	ret nc			;8e85
	ret nz			;8e86
	ld a,a			;8e87
	ret nc			;8e88
	ld (de),a			;8e89
	jp nz,0c00ah		;8e8a
	ld sp,010c0h		;8e8d
	ret nc			;8e90
	add a,b			;8e91
	inc hl			;8e92
	and c			;8e93
	or d			;8e94
	sbc a,e			;8e95
	ld (hl),d			;8e96
	ret nc			;8e97
	ret nz			;8e98
	cpl			;8e99
	jp nz,ld069h		;8e9a
	ret nz			;8e9d
	inc hl			;8e9e
	jp nz,lc20ch		;8e9f
	rlca			;8ea2
	ret nz			;8ea3
	daa			;8ea4
	ret nc			;8ea5
	ret nz			;8ea6
	dec l			;8ea7
	ret nz			;8ea8
	ld hl,(00ac4h)		;8ea9
	call nz,sub_c206h		;8eac
	dec bc			;8eaf
	ret nc			;8eb0
	add a,080h		;8eb1
	inc h			;8eb3
l8eb4h:
	ret nc			;8eb4
	ret nc			;8eb5
	and l			;8eb6
	or e			;8eb7
	ld c,e			;8eb8
	sbc a,e			;8eb9
	inc d			;8eba
l8ebbh:
	sub a			;8ebb
	inc d			;8ebc
	sub e			;8ebd
	ld a,a			;8ebe
	sbc a,e			;8ebf
	ld (07fd0h),a		;8ec0
	inc (hl)			;8ec3
	ret nc			;8ec4
	add a,b			;8ec5
	dec h			;8ec6
	and d			;8ec7
	or e			;8ec8
	ret po			;8ec9
	ld c,h			;8eca
	sub e			;8ecb
	inc l			;8ecc
	ret nc			;8ecd
	jr nz,l8e66h		;8ece
	ld b,(hl)			;8ed0
	ret nc			;8ed1
	add hl,sp			;8ed2
	ld c,e			;8ed3
	ret nc			;8ed4
	inc (hl)			;8ed5
	ld b,b			;8ed6
	ret nc			;8ed7
	add a,b			;8ed8
	ld h,0e0h		;8ed9
	ld c,h			;8edb
	call nz,sub_d01eh		;8edc
	call nz,sub_c421h		;8edf
	ld hl,021c2h		;8ee2
	ret nc			;8ee5
	call nz,0c42eh		;8ee6
	inc h			;8ee9
	call nz,sub_d018h		;8eea
	ret nz			;8eed
	inc h			;8eee
	call nz,sub_c424h		;8eef
	inc e			;8ef2
	call nz,sub_d019h		;8ef3
	add a,b			;8ef6
	daa			;8ef7
	ld (de),a			;8ef8
	jp nz,sub_c423h		;8ef9
	dec e			;8efc
	call nz,sub_d01bh		;8efd
	pop bc			;8f00
	inc h			;8f01
	jp nz,lc418h		;8f02
	ld hl,01cc4h		;8f05
	ret nc			;8f08
	pop bc			;8f09
	inc h			;8f0a
	call nz,sub_c421h		;8f0b
	ld hl,(lc4d0h)		;8f0e
	add hl,de			;8f11
	ret nz			;8f12
	inc h			;8f13
	call nz,ld032h		;8f14
	add a,b			;8f17
	jr z,l8ebbh		;8f18
	or d			;8f1a
	ld c,h			;8f1b
	sbc a,d			;8f1c
	dec b			;8f1d
	ret nz			;8f1e
	ld h,0d0h		;8f1f
	sbc a,c			;8f21
	ld h,093h		;8f22
	ld h,0c3h		;8f24
	add hl,de			;8f26
	ret nc			;8f27
	inc a			;8f28
	jp nz,ld032h		;8f29
	ld e,d			;8f2c
	ret nc			;8f2d
	add a,080h		;8f2e
	add hl,hl			;8f30
l8f31h:
	ret nc			;8f31
	ret nc			;8f32
	and c			;8f33
	or e			;8f34
	ld c,h			;8f35
	sub e			;8f36
	ld h,094h		;8f37
	ld a,a			;8f39
	ret nc			;8f3a
	ccf			;8f3b
	jp lc030h		;8f3c
	jr nc,$-60		;8f3f
	ld a,(bc)			;8f41
	ret nz			;8f42
	ld de,016c2h		;8f43
	jp nz,00fd0h		;8f46
	add a,b			;8f49
	ld hl,(0c219h)		;8f4a
	ld a,(bc)			;8f4d
	ret nz			;8f4e
	ld de,040c2h		;8f4f
	ret nc			;8f52
l8f53h:
	ret nz			;8f53
	dec a			;8f54
	ret nz			;8f55
	dec b			;8f56
	rst 0			;8f57
	inc (hl)			;8f58
	ret nc			;8f59
	ret nz			;8f5a
	ld a,a			;8f5b
	ret nc			;8f5c
	add a,b			;8f5d
	add a,b			;8f5e
	ld h,0c0h		;8f5f
	ld b,(hl)			;8f61
	ret nc			;8f62
l8f63h:
	add a,b			;8f63
l8f64h:
	dec hl			;8f64
	ld sp,00fc3h		;8f65
	jp nz,0c00ah		;8f68
	dec l			;8f6b
	ret nc			;8f6c
	jp nz,lc321h		;8f6d
	ld a,(bc)			;8f70
	ret nz			;8f71
	ret po			;8f72
	ld h,b			;8f73
	ret nc			;8f74
	call nz,sub_c417h		;8f75
	inc h			;8f78
	call nz,sub_d01ch		;8f79
	pop bc			;8f7c
	add hl,hl			;8f7d
	call nz,sub_c41bh		;8f7e
	jr c,l8f53h		;8f81
	add a,b			;8f83
	inc l			;8f84
	ld e,0c5h		;8f85
	ld a,(bc)			;8f87
	ret nz			;8f88
	add hl,sp			;8f89
	jp ld00ah		;8f8a
	ret nz			;8f8d
	ld e,0c2h		;8f8e
	rlca			;8f90
	jp nz,lc530h		;8f91
	jr nc,$-46		;8f94
	ret nz			;8f96
	ld sp,007c2h		;8f97
	ret nz			;8f9a
	dec hl			;8f9b
	ret nc			;8f9c
l8f9dh:
	ret nz			;8f9d
	jr nc,l8f63h		;8f9e
	ex af,af'			;8fa0
	ret nz			;8fa1
	jr z,l8f64h		;8fa2
	inc h			;8fa4
	ret nc			;8fa5
	add a,b			;8fa6
	dec l			;8fa7
	and c			;8fa8
	or d			;8fa9
	ld a,(bc)			;8faa
	jp nz,lc312h		;8fab
	ex af,af'			;8fae
	ret nz			;8faf
	ret po			;8fb0
	inc sp			;8fb1
	sbc a,e			;8fb2
	sbc a,b			;8fb3
	ld h,0d0h		;8fb4
	and d			;8fb6
	sub (hl)			;8fb7
	ld d,h			;8fb8
	jp nz,ld009h		;8fb9
	ld (066c2h),a		;8fbc
	ret nc			;8fbf
	ld (003c2h),a		;8fc0
	ret nc			;8fc3
	add a,080h		;8fc4
	ld l,0d0h		;8fc6
	ret nc			;8fc8
	ret po			;8fc9
	jp 0c054h		;8fca
	add hl,de			;8fcd
l8fceh:
	rst 0			;8fce
	ld d,(hl)			;8fcf
	ret nz			;8fd0
	ld (lc0d0h),a		;8fd1
	ld c,h			;8fd4
	add a,b			;8fd5
	add a,b			;8fd6
	ld c,h			;8fd7
	pop bc			;8fd8
	dec a			;8fd9
	ret nc			;8fda
	add a,b			;8fdb
	cpl			;8fdc
	ret po			;8fdd
	ld b,b			;8fde
	call nz,sub_d033h		;8fdf
	call nz,sub_c427h		;8fe2
	ld b,h			;8fe5
	ret nc			;8fe6
l8fe7h:
	call nz,lc321h		;8fe7
	inc e			;8fea
	call nz,sub_c412h		;8feb
	dec e			;8fee
	ret nc			;8fef
	jp nz,lc41ch		;8ff0
	ld sp,02ec4h		;8ff3
	call nz,ld021h		;8ff6
	add a,b			;8ff9
	jr nc,l8f9dh		;8ffa
	or d			;8ffc
	sbc a,e			;8ffd
	ld (la298h),a		;8ffe
	sub e			;9001
	ld a,(de)			;9002
	jp 0d055h		;9003
	ld l,c			;9006
	ret nz			;9007
	inc a			;9008
	ret nc			;9009
	jr z,l8fceh		;900a
	add hl,sp			;900c
	ret nc			;900d
	add a,b			;900e
	ld sp,lc019h		;900f
	inc c			;9012
	jp nz,lc41ch+1		;9013
	rlca			;9016
	call nz,sub_c02ah		;9017
	inc h			;901a
	ret nc			;901b
	jp nz,0c227h		;901c
	rlca			;901f
	jp lc21dh		;9020
	jr l8fe7h		;9023
	jr nc,l8fe7h		;9025
	dec c			;9027
	ret nc			;9028
	jp nz,lc41ch+1		;9029
	dec bc			;902c
	call nz,0c222h		;902d
	dec bc			;9030
	ret nz			;9031
	ld hl,(01cc3h)		;9032
	ret nc			;9035
	add a,b			;9036
	ld (lb2a1h),a		;9037
	ret po			;903a
	sbc a,e			;903b
	sbc a,b			;903c
	ld (hl),d			;903d
	jp nz,ld021h		;903e
	jp 07f93h		;9041
	dec de			;9044
	ret nc			;9045
	ld (hl),e			;9046
	jp nz,lc238h		;9047
	ret nc			;904a
	dec b			;904b
	add a,b			;904c
	inc sp			;904d
	inc e			;904e
	jp nz,lc307h		;904f
	ex af,af'			;9052
	pop bc			;9053
	daa			;9054
	jp nz,lc52dh		;9055
	rlca			;9058
	ret nz			;9059
	daa			;905a
	ret nc			;905b
	jp nz,0c00ah		;905c
	ld sp,00cc4h		;905f
	call nz,sub_c31eh		;9062
	ld de,ld0c0h		;9065
	ld a,l			;9068
	ret nc			;9069
	add a,080h		;906a
	inc (hl)			;906c
	nop			;906d
sub_906eh:
	ld bc,00600h		;906e
	ld de,03804h		;9071
	ld hl,07e75h		;9074
	jp sub_9441h		;9077
sub_907ah:
	ld a,(07e79h)		;907a
	push af			;907d
	call 0bcbch		;907e
	ld hl,ld08eh		;9081
	add hl,de			;9084
	ld bc,00008h		;9085
	ld de,006a8h		;9088
	rst 8			;908b
	pop af			;908c
	cp 01bh		;908d
	ld a,06eh		;908f
	jr nc,l9095h		;9091
	ld a,01eh		;9093
l9095h:
	ld bc,00008h		;9095
	ld de,026a8h		;9098
	jp la100h		;909b
sub_909eh:
	ld a,(07d8dh)		;909e
	or a			;90a1
	ret nz			;90a2
	push hl			;90a3
	ld de,07e0ch		;90a4
	call sub_9140h		;90a7
	ld hl,07e75h		;90aa
	ld de,07dcch		;90ad
	ld bc,00004h		;90b0
	ldir		;90b3
	ld hl,07e0ch		;90b5
	ld de,07dcch		;90b8
	call sub_9164h		;90bb
	jp c,l90cfh		;90be
	ld hl,07e0ch		;90c1
	ld de,07e75h		;90c4
	ld bc,00004h		;90c7
	ldir		;90ca
	call sub_906eh		;90cc
l90cfh:
	pop hl			;90cf
	ld de,07e10h		;90d0
	call sub_9140h		;90d3
	ld hl,07e10h		;90d6
	ld de,07dcch		;90d9
	ld bc,00004h		;90dc
	ldir		;90df
	ld hl,07e14h		;90e1
	ld de,07dcch		;90e4
	call sub_9158h		;90e7
	jp c,l910ah		;90ea
	ld hl,07dcch		;90ed
	ld de,07e10h		;90f0
	ld bc,00004h		;90f3
	ldir		;90f6
	ld hl,07e16h		;90f8
	ld (hl),002h		;90fb
	ld a,(07e18h)		;90fd
	inc a			;9100
	ld (07e18h),a		;9101
	call sub_91b4h		;9104
	call sub_91d6h		;9107
l910ah:
	ld hl,07e0ch		;910a
	ld de,03865h		;910d
	ld bc,0060ah		;9110
	ld a,(07d91h)		;9113
	or a			;9116
	jp z,sub_9441h		;9117
	ld de,03885h		;911a
	jp sub_9441h		;911d
sub_9120h:
	ld a,(07d85h)		;9120
	and 01fh		;9123
	or a			;9125
	jr z,l910ah		;9126
	cp 014h		;9128
	ret nz			;912a
	ld de,03865h		;912b
	ld bc,00006h		;912e
	ld a,0b6h		;9131
	ld hl,07d91h		;9133
	bit 0,(hl)		;9136
	jr z,l913dh		;9138
	ld de,03885h		;913a
l913dh:
	jp la100h		;913d
sub_9140h:
	ex de,hl			;9140
	ld a,e			;9141
	add a,(hl)			;9142
	daa			;9143
	ld (hl),a			;9144
	inc hl			;9145
	ld a,d			;9146
	adc a,(hl)			;9147
	daa			;9148
	ld (hl),a			;9149
	inc hl			;914a
	ld a,(hl)			;914b
	adc a,000h		;914c
	daa			;914e
	ld (hl),a			;914f
	inc hl			;9150
	ld a,(hl)			;9151
	adc a,000h		;9152
	daa			;9154
	ld (hl),a			;9155
	ex de,hl			;9156
	ret			;9157
sub_9158h:
	ld b,004h		;9158
	or a			;915a
l915bh:
	ld a,(de)			;915b
	sbc a,(hl)			;915c
	daa			;915d
	ld (de),a			;915e
	inc hl			;915f
	inc de			;9160
	djnz l915bh		;9161
	ret			;9163
sub_9164h:
	ld bc,00004h		;9164
	add hl,bc			;9167
	ex de,hl			;9168
	add hl,bc			;9169
	ld b,c			;916a
	or a			;916b
l916ch:
	dec de			;916c
	dec hl			;916d
	ld a,(de)			;916e
	sbc a,(hl)			;916f
	ret nz			;9170
	djnz l916ch		;9171
	ret			;9173
sub_9174h:
	ld a,(07e19h)		;9174
	ld hl,07e79h		;9177
	cp (hl)			;917a
	jr c,l9183h		;917b
	ld (hl),a			;917d
	push af			;917e
	call sub_907ah		;917f
	pop af			;9182
l9183h:
	or a			;9183
	jp nz,l918ch		;9184
	ld a,0b7h		;9187
l9189h:
	jp l918eh		;9189
l918ch:
	add a,027h		;918c
l918eh:
	ld de,03813h		;918e
	ld bc,00001h		;9191
	jp la100h		;9194
sub_9197h:
	call sub_91b4h		;9197
	ld a,(07d92h)		;919a
	or a			;919d
	jr z,sub_91aeh		;919e
	call sub_91cdh		;91a0
	call sub_91aeh		;91a3
	ld a,(07e18h)		;91a6
	or a			;91a9
	ret nz			;91aa
	call sub_91cdh		;91ab
sub_91aeh:
	call sub_91bbh		;91ae
	ldir		;91b1
	ret			;91b3
sub_91b4h:
	call sub_91bbh		;91b4
	ex de,hl			;91b7
	ldir		;91b8
	ret			;91ba
sub_91bbh:
	ld de,07e0ch		;91bb
	ld hl,07e27h		;91be
	ld bc,0001bh		;91c1
	ld a,(07d91h)		;91c4
	or a			;91c7
	ret z			;91c8
	ld hl,07e42h		;91c9
	ret			;91cc
sub_91cdh:
	ld a,(07d91h)		;91cd
	xor 001h		;91d0
	ld (07d91h),a		;91d2
	ret			;91d5
sub_91d6h:
	ld a,(07e18h)		;91d6
	dec a			;91d9
	jr z,l91fbh		;91da
	dec a			;91dc
	cp 006h		;91dd
	jr c,l91e3h		;91df
	ld a,005h		;91e1
l91e3h:
	add a,a			;91e3
	add a,a			;91e4
	ld e,a			;91e5
	ld d,000h		;91e6
	ld hl,l9204h		;91e8
	add hl,de			;91eb
	ld de,03829h		;91ec
	call sub_946eh		;91ef
	ld hl,l933ah		;91f2
	ld de,03825h		;91f5
	jp sub_946eh		;91f8
l91fbh:
	ld hl,l921ch		;91fb
	ld de,03825h		;91fe
	jp sub_946eh		;9201
l9204h:
	rst 28h			;9204
	cp 0f5h		;9205
	rst 38h			;9207
	ret p			;9208
	cp 0f6h		;9209
	rst 38h			;920b
	pop af			;920c
	cp 0f7h		;920d
	rst 38h			;920f
	jp p,lf8feh		;9210
	rst 38h			;9213
	di			;9214
	cp 0f9h		;9215
	rst 38h			;9217
	call p,sub_fafeh		;9218
	rst 38h			;921b
l921ch:
	or (hl)			;921c
	or (hl)			;921d
	or (hl)			;921e
	or (hl)			;921f
	or (hl)			;9220
	cp 0b6h		;9221
	or (hl)			;9223
	or (hl)			;9224
	or (hl)			;9225
	or (hl)			;9226
	rst 38h			;9227
sub_9228h:
	ld hl,(07e62h)		;9228
	call sub_a118h		;922b
	ld b,a			;922e
	push hl			;922f
	ld de,0389eh		;9230
	or a			;9233
	sbc hl,de		;9234
	pop hl			;9236
	jr nc,l9259h		;9237
	sub 0ach		;9239
	jr z,l9243h		;923b
	dec a			;923d
	jr z,l9243h		;923e
	dec a			;9240
	jr nz,l924ch		;9241
l9243h:
	ld a,b			;9243
	inc a			;9244
	ex de,hl			;9245
	ld bc,00001h		;9246
	jp la100h		;9249
l924ch:
	dec a			;924c
	jr nz,l9255h		;924d
	inc hl			;924f
	ld (07e62h),hl		;9250
	jr l9243h		;9253
l9255h:
	ld b,0abh		;9255
	jr l9243h		;9257
l9259h:
	sub 0b3h		;9259
	jr c,l9243h		;925b
	ld b,0aeh		;925d
	jr l9243h		;925f
sub_9261h:
	ld l,(ix+00eh)		;9261
	ld h,(ix+00fh)		;9264
	ld de,0000eh		;9267
	add hl,de			;926a
	ld (ix+00eh),l		;926b
	ld (ix+00fh),h		;926e
	ld e,(ix+00bh)		;9271
	ld d,(ix+000h)		;9274
	add hl,de			;9277
	ld (ix+00bh),l		;9278
	ld (ix+000h),h		;927b
	ret			;927e
sub_927fh:
	call sub_93f3h		;927f
	ld de,03802h		;9282
	ld hl,l932ch		;9285
	call sub_946eh		;9288
	ld de,03862h		;928b
	ld hl,l932fh		;928e
	call sub_946eh		;9291
	ld a,(07d92h)		;9294
	or a			;9297
	jp z,l92b6h		;9298
	call sub_91b4h		;929b
	call sub_91cdh		;929e
	call sub_91aeh		;92a1
	ld de,03882h		;92a4
	ld hl,l9333h		;92a7
	call sub_946eh		;92aa
	call l910ah		;92ad
	call sub_91cdh		;92b0
	call sub_91aeh		;92b3
l92b6h:
	ld de,0380ah		;92b6
	ld hl,l9337h		;92b9
	call sub_946eh		;92bc
	ld de,0380dh		;92bf
	ld hl,l9344h		;92c2
	call sub_946eh		;92c5
	ld de,0384dh		;92c8
	ld hl,l9362h		;92cb
	call sub_946eh		;92ce
	ld de,0386ch		;92d1
	ld hl,l936dh		;92d4
	call sub_946eh		;92d7
sub_92dah:
	ld de,0382dh		;92da
	ld hl,l934fh		;92dd
	call sub_946eh		;92e0
	ld de,0388ch		;92e3
	ld hl,l9381h		;92e6
	jp sub_946eh		;92e9
l92ech:
	or h			;92ec
	or a			;92ed
	or a			;92ee
	or a			;92ef
	or a			;92f0
	or a			;92f1
	or a			;92f2
	or a			;92f3
	or a			;92f4
	or a			;92f5
	or a			;92f6
	or a			;92f7
	or a			;92f8
	or a			;92f9
	or a			;92fa
	or a			;92fb
	or a			;92fc
	or a			;92fd
	or a			;92fe
	or l			;92ff
	cp 0b4h		;9300
	or a			;9302
	or a			;9303
	or a			;9304
	or a			;9305
	or a			;9306
	or a			;9307
	or a			;9308
	or a			;9309
	or a			;930a
	or a			;930b
	or a			;930c
	or a			;930d
	or a			;930e
	or a			;930f
	or a			;9310
	or a			;9311
	or a			;9312
	or a			;9313
	or l			;9314
	cp 0b4h		;9315
	or a			;9317
	or a			;9318
	or a			;9319
	or a			;931a
	or a			;931b
	or a			;931c
	or a			;931d
	or a			;931e
	or a			;931f
	or a			;9320
	or a			;9321
	or a			;9322
	or a			;9323
	or a			;9324
	or a			;9325
	or a			;9326
	or a			;9327
	or a			;9328
	or l			;9329
	cp 0ffh		;932a
l932ch:
	sub l			;932c
	sub (hl)			;932d
	rst 38h			;932e
l932fh:
	ld bc,l9394h		;932f
	rst 38h			;9332
l9333h:
	ld (bc),a			;9333
	sub h			;9334
	sub e			;9335
	rst 38h			;9336
l9337h:
	sub e			;9337
	push de			;9338
	rst 38h			;9339
l933ah:
	sbc a,l			;933a
	sbc a,(hl)			;933b
	sbc a,a			;933c
	and b			;933d
	cp 0a1h		;933e
	and d			;9340
	and e			;9341
	and h			;9342
	rst 38h			;9343
l9344h:
	scf			;9344
	ld (hl),030h		;9345
	dec (hl)			;9347
	dec sp			;9348
	or a			;9349
	or a			;934a
	or a			;934b
	or a			;934c
	sbc a,h			;934d
	rst 38h			;934e
l934fh:
	cp c			;934f
	cp d			;9350
	cp e			;9351
	cp h			;9352
	or a			;9353
	or a			;9354
	or a			;9355
	or a			;9356
	or a			;9357
	sbc a,h			;9358
	or a			;9359
	or a			;935a
	or a			;935b
	or a			;935c
	or a			;935d
	or a			;935e
	or a			;935f
	or a			;9360
	rst 38h			;9361
l9362h:
	cp l			;9362
	cp (hl)			;9363
	cp a			;9364
	ret nz			;9365
	or a			;9366
	or a			;9367
	or a			;9368
	or a			;9369
	or a			;936a
	sbc a,h			;936b
	rst 38h			;936c
l936dh:
	and (hl)			;936d
	or (hl)			;936e
	or (hl)			;936f
	and a			;9370
	or (hl)			;9371
	or (hl)			;9372
	or (hl)			;9373
	xor b			;9374
	or (hl)			;9375
	or (hl)			;9376
	or (hl)			;9377
	xor c			;9378
	or (hl)			;9379
	or (hl)			;937a
	or (hl)			;937b
	xor d			;937c
	or (hl)			;937d
	or (hl)			;937e
	xor e			;937f
	rst 38h			;9380
l9381h:
	xor h			;9381
	or b			;9382
	or b			;9383
	xor h			;9384
	or b			;9385
	or b			;9386
	or b			;9387
	xor h			;9388
	or b			;9389
	or b			;938a
	or b			;938b
	xor h			;938c
	or b			;938d
	or b			;938e
	or b			;938f
	xor h			;9390
	or b			;9391
	or b			;9392
	or c			;9393
l9394h:
	rst 38h			;9394
sub_9395h:
	call sub_906eh		;9395
	call sub_907ah		;9398
	call l910ah		;939b
	call sub_9174h		;939e
	ld hl,07e21h		;93a1
	call sub_9522h		;93a4
	call sub_91d6h		;93a7
	ld hl,(07e1eh)		;93aa
	push hl			;93ad
	ld de,l8dc8h		;93ae
	or a			;93b1
	sbc hl,de		;93b2
	ld hl,l8bb6h		;93b4
	jr c,l93bch		;93b7
	ld hl,l8dc8h		;93b9
l93bch:
	ld (07e1eh),hl		;93bc
l93bfh:
	pop de			;93bf
	or a			;93c0
	sbc hl,de		;93c1
	jr c,l93cah		;93c3
	ld (07e1eh),de		;93c5
	ret			;93c9
l93cah:
	push de			;93ca
	ld de,l93d3h		;93cb
	call sub_8adah		;93ce
	jr l93bfh		;93d1
l93d3h:
	ld sp,0318bh		;93d3
	adc a,e			;93d6
	ld sp,0318bh		;93d7
	adc a,e			;93da
	ld sp,0318bh		;93db
	adc a,e			;93de
	ld sp,0318bh		;93df
	adc a,e			;93e2
	ld d,l			;93e3
	adc a,e			;93e4
	ld sp,0318bh		;93e5
	adc a,e			;93e8
	ld sp,0318bh		;93e9
	adc a,e			;93ec
	sub a			;93ed
	adc a,e			;93ee
	ld sp,0318bh		;93ef
	adc a,e			;93f2
sub_93f3h:
	ld a,0b6h		;93f3
	ld bc,000a0h		;93f5
	ld de,03800h		;93f8
	call la100h		;93fb
	ld de,0380ch		;93fe
	ld hl,l92ech		;9401
	jp sub_946eh		;9404
sub_9407h:
	ld a,00bh		;9407
	ld (07e64h),a		;9409
	ret			;940c
sub_940dh:
	ld hl,07e64h		;940d
	ld a,(hl)			;9410
	or a			;9411
	ret z			;9412
	inc hl			;9413
	dec (hl)			;9414
	ret nz			;9415
	ld (hl),02dh		;9416
	dec hl			;9418
	dec a			;9419
	ld (hl),a			;941a
	and 001h		;941b
	jr z,l9428h		;941d
	ld hl,l942dh		;941f
l9422h:
	ld de,07836h		;9422
	jp sub_946eh		;9425
l9428h:
	ld hl,l9437h		;9428
	jr l9422h		;942b
l942dh:
	sbc a,d			;942d
	or a			;942e
	ld b,h			;942f
	ld b,d			;9430
	ld d,(hl)			;9431
	ld d,l			;9432
	ld c,d			;9433
	ld d,b			;9434
	ld c,a			;9435
	rst 38h			;9436
l9437h:
	sbc a,h			;9437
	or a			;9438
	or a			;9439
	or a			;943a
	or a			;943b
	or a			;943c
	or a			;943d
	or a			;943e
	or a			;943f
	rst 38h			;9440
sub_9441h:
	ld a,e			;9441
	out (0bfh),a		;9442
	ld a,d			;9444
	or 040h		;9445
	out (0bfh),a		;9447
	ld d,000h		;9449
	ld e,b			;944b
	dec e			;944c
	sra e		;944d
	add hl,de			;944f
	ld a,(hl)			;9450
	bit 0,b		;9451
	jp nz,l9464h		;9453
l9456h:
	ld d,a			;9456
	rrca			;9457
	rrca			;9458
	rrca			;9459
	rrca			;945a
	and 00fh		;945b
	add a,c			;945d
	out (0beh),a		;945e
	djnz l9463h		;9460
	ret			;9462
l9463h:
	ld a,d			;9463
l9464h:
	and 00fh		;9464
	add a,c			;9466
	out (0beh),a		;9467
	dec hl			;9469
	ld a,(hl)			;946a
	djnz l9456h		;946b
	ret			;946d
sub_946eh:
	ld a,e			;946e
	out (0bfh),a		;946f
	ld a,d			;9471
	or 040h		;9472
	out (0bfh),a		;9474
l9476h:
	ld a,(hl)			;9476
	ld b,a			;9477
	inc b			;9478
	ret z			;9479
	inc b			;947a
	jp nz,l948ah		;947b
	push hl			;947e
	ld hl,00020h		;947f
	ex de,hl			;9482
	add hl,de			;9483
	ex de,hl			;9484
	pop hl			;9485
	inc hl			;9486
	jp sub_946eh		;9487
l948ah:
	out (0beh),a		;948a
	inc hl			;948c
	jp l9476h		;948d
	push de			;9490
	ld d,000h		;9491
	ld e,b			;9493
	dec e			;9494
	sra e		;9495
	add hl,de			;9497
	ld a,(hl)			;9498
	bit 0,b		;9499
	pop de			;949b
	jp nz,l94bdh		;949c
l949fh:
	push af			;949f
	ex af,af'			;94a0
	ld a,e			;94a1
	out (0bfh),a		;94a2
	ld a,d			;94a4
	or 040h		;94a5
	out (0bfh),a		;94a7
	pop af			;94a9
	rrca			;94aa
	rrca			;94ab
	rrca			;94ac
	rrca			;94ad
	and 00fh		;94ae
	add a,c			;94b0
	out (0beh),a		;94b1
	ld b,004h		;94b3
	call sub_ac97h		;94b5
	inc de			;94b8
	djnz l94bch		;94b9
	ret			;94bb
l94bch:
	ex af,af'			;94bc
l94bdh:
	push af			;94bd
	ld a,e			;94be
	out (0bfh),a		;94bf
	ld a,d			;94c1
	or 040h		;94c2
	out (0bfh),a		;94c4
	pop af			;94c6
	and 00fh		;94c7
	add a,c			;94c9
	out (0beh),a		;94ca
	ld b,004h		;94cc
	call sub_ac97h		;94ce
	dec hl			;94d1
	inc de			;94d2
	ld a,(hl)			;94d3
	djnz l949fh		;94d4
	ret			;94d6
sub_94d7h:
	ld a,d			;94d7
	or 040h		;94d8
	ld d,a			;94da
	ld c,0bfh		;94db
l94ddh:
	out (c),e		;94dd
	out (c),d		;94df
	ld a,(hl)			;94e1
	ld b,a			;94e2
	inc b			;94e3
	ret z			;94e4
	inc b			;94e5
	jp nz,l94f6h		;94e6
	push hl			;94e9
	ld hl,00020h		;94ea
	ex de,hl			;94ed
	add hl,de			;94ee
	ex de,hl			;94ef
	pop hl			;94f0
	inc hl			;94f1
	inc de			;94f2
	jp l94ddh		;94f3
l94f6h:
	out (0beh),a		;94f6
	ld b,004h		;94f8
	call sub_ac97h		;94fa
	inc hl			;94fd
	inc de			;94fe
	jp l94ddh		;94ff
sub_9502h:
	ld hl,07d8eh		;9502
	dec (hl)			;9505
	ret nz			;9506
	ld a,03ch		;9507
	ld (hl),a			;9509
	ld hl,07e20h		;950a
	ld a,(hl)			;950d
	add a,001h		;950e
	daa			;9510
	ld (hl),a			;9511
	inc hl			;9512
	ld a,(hl)			;9513
	adc a,000h		;9514
	daa			;9516
	ld (hl),a			;9517
	and 0f0h		;9518
	jr z,sub_9522h		;951a
	ld (hl),009h		;951c
	dec hl			;951e
	ld (hl),099h		;951f
	inc hl			;9521
sub_9522h:
	ld a,032h		;9522
	out (0bfh),a		;9524
	ld a,038h		;9526
	or 040h		;9528
	out (0bfh),a		;952a
	ld c,0c1h		;952c
	call sub_953dh		;952e
	ld a,052h		;9531
	out (0bfh),a		;9533
	ld a,038h		;9535
	or 040h		;9537
	out (0bfh),a		;9539
	ld c,0cbh		;953b
sub_953dh:
	ld a,(hl)			;953d
	and 00fh		;953e
	add a,c			;9540
	out (0beh),a		;9541
	dec hl			;9543
	ld a,(hl)			;9544
	inc hl			;9545
	ld b,a			;9546
	rrca			;9547
	rrca			;9548
	rrca			;9549
	rrca			;954a
	and 00fh		;954b
	add a,c			;954d
	out (0beh),a		;954e
	ld a,b			;9550
	and 00fh		;9551
	add a,c			;9553
	nop			;9554
	nop			;9555
	nop			;9556
	nop			;9557
	nop			;9558
	out (0beh),a		;9559
	ret			;955b
sub_955ch:
	ld b,003h		;955c
	ld de,07d4dh		;955e
	ld hl,07c94h		;9561
l9564h:
	push bc			;9564
	dec (hl)			;9565
	ldi		;9566
	ldi		;9568
	inc hl			;956a
	inc hl			;956b
	push hl			;956c
	ld bc,0000eh		;956d
	ex de,hl			;9570
	add hl,bc			;9571
	ex de,hl			;9572
	pop hl			;9573
	pop bc			;9574
	djnz l9564h		;9575
	ld ix,07d4dh		;9577
	ld hl,lfd80h		;957b
	ld (ix+00eh),l		;957e
	ld (ix+01eh),l		;9581
	ld (ix+02eh),l		;9584
	ld (ix+00fh),h		;9587
	ld (ix+01fh),h		;958a
	ld (ix+02fh),h		;958d
	sub a			;9590
	ld (ix+00bh),a		;9591
	ld (ix+01bh),a		;9594
	ld (ix+02bh),a		;9597
	ld (ix+00ah),a		;959a
	ld (ix+01ah),a		;959d
	ld (ix+02ah),a		;95a0
	call sub_ac88h		;95a3
	ld h,000h		;95a6
	ld a,l			;95a8
	and 00eh		;95a9
	ld l,a			;95ab
	ld de,l95e6h		;95ac
	add hl,de			;95af
	ld a,(hl)			;95b0
	ld (ix+00ch),a		;95b1
	inc hl			;95b4
	ld a,(hl)			;95b5
	ld (ix+00dh),a		;95b6
	call sub_ac88h		;95b9
	ld h,000h		;95bc
	ld a,l			;95be
	and 00eh		;95bf
	ld l,a			;95c1
	ld de,l95f6h		;95c2
	add hl,de			;95c5
	ld a,(hl)			;95c6
	ld (ix+01ch),a		;95c7
	inc hl			;95ca
	ld a,(hl)			;95cb
	ld (ix+01dh),a		;95cc
	call sub_ac88h		;95cf
	ld h,000h		;95d2
	ld a,l			;95d4
	and 00eh		;95d5
	ld l,a			;95d7
	ld de,l9606h		;95d8
	add hl,de			;95db
	ld a,(hl)			;95dc
	ld (ix+02ch),a		;95dd
	inc hl			;95e0
	ld a,(hl)			;95e1
	ld (ix+02dh),a		;95e2
	ret			;95e5
l95e6h:
	nop			;95e6
	rst 38h			;95e7
	djnz $+1		;95e8
	jr nz,$+1		;95ea
	ld b,b			;95ec
	rst 38h			;95ed
	ld (hl),b			;95ee
	rst 38h			;95ef
	and b			;95f0
	rst 38h			;95f1
	ret nc			;95f2
	rst 38h			;95f3
	and b			;95f4
	nop			;95f5
l95f6h:
	ret z			;95f6
	rst 38h			;95f7
	ret c			;95f8
	rst 38h			;95f9
	ret p			;95fa
	rst 38h			;95fb
	nop			;95fc
	nop			;95fd
	nop			;95fe
	nop			;95ff
	djnz l9602h		;9600
l9602h:
	jr z,l9604h		;9602
l9604h:
	jr c,l9606h		;9604
l9606h:
	ld h,b			;9606
	rst 38h			;9607
	jr nc,l960ah		;9608
l960ah:
	ld (hl),b			;960a
	nop			;960b
	or b			;960c
	nop			;960d
	ret nc			;960e
	nop			;960f
	ret p			;9610
	nop			;9611
	nop			;9612
	ld bc,00130h		;9613
sub_9616h:
	ld hl,077a0h		;9616
	ld c,0bfh		;9619
	out (c),l		;961b
	out (c),h		;961d
	ld hl,07c03h		;961f
	ld a,(hl)			;9622
	inc (hl)			;9623
	rrca			;9624
	rrca			;9625
	rrca			;9626
	and 01fh		;9627
	ld d,000h		;9629
	ld e,a			;962b
	ld hl,l9682h		;962c
	add hl,de			;962f
	ld c,(hl)			;9630
	ld b,048h		;9631
l9633h:
	call sub_ac88h		;9633
	ld h,000h		;9636
	ld a,l			;9638
	and c			;9639
	ld l,a			;963a
	ld de,l9699h		;963b
	add hl,de			;963e
	ld a,(hl)			;963f
	out (0beh),a		;9640
	djnz l9633h		;9642
	ld ix,07c00h		;9644
	dec (ix+00ah)		;9648
	ret nz			;964b
	ld a,007h		;964c
	ld (ix+00ah),a		;964e
	ld a,(ix+002h)		;9651
	inc a			;9654
	ld (ix+002h),a		;9655
	dec a			;9658
	cp 00eh		;9659
	jp c,l9668h		;965b
	sub a			;965e
	ld bc,00048h		;965f
	ld de,017a0h		;9662
	jp la100h		;9665
l9668h:
	sla a		;9668
	ld h,000h		;966a
	ld l,a			;966c
	ld de,l96a9h		;966d
	add hl,de			;9670
	ld a,(hl)			;9671
	inc hl			;9672
	ld h,(hl)			;9673
	ld l,a			;9674
	ld de,ldce6h		;9675
	add hl,de			;9678
	ld de,017a0h		;9679
	ld bc,00048h		;967c
	jp 0a0dfh		;967f
l9682h:
	rrca			;9682
	rrca			;9683
	ld c,00dh		;9684
	rlca			;9686
	rlca			;9687
	dec b			;9688
	inc bc			;9689
	inc bc			;968a
	ld (bc),a			;968b
	ld bc,00101h		;968c
	ld bc,00000h		;968f
	nop			;9692
	nop			;9693
	nop			;9694
	nop			;9695
	nop			;9696
	nop			;9697
	nop			;9698
l9699h:
	di			;9699
	ex (sp),hl			;969a
	ex (sp),hl			;969b
	ld h,e			;969c
	sub e			;969d
	add a,e			;969e
	sub e			;969f
	inc de			;96a0
	di			;96a1
	sub e			;96a2
	ld h,e			;96a3
	add a,e			;96a4
	inc de			;96a5
	add a,e			;96a6
	or e			;96a7
	di			;96a8
l96a9h:
	nop			;96a9
	nop			;96aa
	ld c,b			;96ab
	nop			;96ac
	nop			;96ad
	nop			;96ae
	ld c,b			;96af
	nop			;96b0
	sub b			;96b1
	nop			;96b2
	ret c			;96b3
	nop			;96b4
	jr nz,l96b8h		;96b5
	ld l,b			;96b7
l96b8h:
	ld bc,001b0h		;96b8
	ret m			;96bb
	ld bc,00240h		;96bc
	adc a,b			;96bf
	ld (bc),a			;96c0
	ret nc			;96c1
	ld (bc),a			;96c2
	ret nc			;96c3
	ld (bc),a			;96c4
sub_96c5h:
	ld ix,07d4dh		;96c5
	ld b,003h		;96c9
l96cbh:
	push bc			;96cb
	call sub_9261h		;96cc
	ld l,(ix+00ch)		;96cf
	ld h,(ix+00dh)		;96d2
	ld e,(ix+00ah)		;96d5
	ld d,(ix+001h)		;96d8
	add hl,de			;96db
	ld a,h			;96dc
	cp 0f9h		;96dd
	jr z,l96e5h		;96df
	cp 0fah		;96e1
	jr nz,l96edh		;96e3
l96e5h:
	ld a,0d1h		;96e5
	ld (ix+000h),a		;96e7
	jp l96f3h		;96ea
l96edh:
	ld (ix+001h),a		;96ed
	ld (ix+00ah),l		;96f0
l96f3h:
	ld a,(07e26h)		;96f3
	or a			;96f6
	jr z,l9700h		;96f7
	ld a,(ix+000h)		;96f9
	cp 080h		;96fc
	jr c,l973eh		;96fe
l9700h:
	ld bc,01008h		;9700
	call sub_a8e2h		;9703
	jp c,l971bh		;9706
	ld bc,00e05h		;9709
	call sub_a8e2h		;970c
	jp c,l971bh		;970f
	ld bc,00e0ah		;9712
	call sub_a8e2h		;9715
	jp nc,l973eh		;9718
l971bh:
	ld e,(ix+00eh)		;971b
	ld d,(ix+00fh)		;971e
	dec (ix+000h)		;9721
	dec (ix+000h)		;9724
	or a			;9727
	ld hl,00000h		;9728
	sbc hl,de		;972b
	sra h		;972d
	rr l		;972f
	ld d,h			;9731
	ld e,l			;9732
	sra h		;9733
	rr l		;9735
	add hl,de			;9737
	ld (ix+00eh),l		;9738
	ld (ix+00fh),h		;973b
l973eh:
	ld de,00010h		;973e
	add ix,de		;9741
	pop bc			;9743
	djnz l96cbh		;9744
	ld b,003h		;9746
	ld de,07c94h		;9748
	ld hl,07d4dh		;974b
l974eh:
	push bc			;974e
	ldi		;974f
	ldi		;9751
	inc de			;9753
	inc de			;9754
	ld bc,0000eh		;9755
	add hl,bc			;9758
	pop bc			;9759
	djnz l974eh		;975a
	ret			;975c
sub_975dh:
	rst 38h			;975d
	call sub_9fd7h		;975e
	rst 20h			;9761
	call sub_9fedh		;9762
	ld bc,00005h		;9765
	call sub_acbbh		;9768
	rst 18h			;976b
	rst 38h			;976c
	call sub_9fd7h		;976d
	rst 20h			;9770
	call sub_c60eh		;9771
	call l910ah		;9774
	call sub_9fedh		;9777
	ld a,000h		;977a
	call lc629h		;977c
	call sub_be53h		;977f
	call 0bf09h		;9782
	call sub_91b4h		;9785
	ld bc,00004h		;9788
	call sub_acbbh		;978b
	rst 18h			;978e
	rst 38h			;978f
	call sub_9fd7h		;9790
	rst 20h			;9793
	call sub_859ah		;9794
	call sub_a147h		;9797
	call 0cc65h		;979a
	call sub_af08h		;979d
	call sub_9fedh		;97a0
	ld ix,07c00h		;97a3
	ld iy,07ce4h		;97a7
	sub a			;97ab
	ld (iy+003h),a		;97ac
	ld (07daeh),a		;97af
	ld (ix+002h),a		;97b2
	ld (ix+003h),a		;97b5
	ld a,0d1h		;97b8
	ld (iy+000h),a		;97ba
	ld a,003h		;97bd
	ld (ix+00ah),a		;97bf
	ld bc,00003h		;97c2
	call sub_acbbh		;97c5
	rst 18h			;97c8
	rst 38h			;97c9
	call sub_9fd7h		;97ca
	rst 20h			;97cd
	ld hl,(07da7h)		;97ce
	inc hl			;97d1
	ld de,00020h		;97d2
	ld a,0f4h		;97d5
	ld bc,003bfh		;97d7
l97dah:
	out (c),l		;97da
	out (c),h		;97dc
	out (0beh),a		;97de
	add a,003h		;97e0
	nop			;97e2
	nop			;97e3
	nop			;97e4
	out (0beh),a		;97e5
	add a,003h		;97e7
	nop			;97e9
	nop			;97ea
	nop			;97eb
	out (0beh),a		;97ec
	sub 005h		;97ee
	add hl,de			;97f0
	djnz l97dah		;97f1
	call sub_955ch		;97f3
	call sub_9fedh		;97f6
	ld bc,00004h		;97f9
	call sub_acbbh		;97fc
	rst 18h			;97ff
l9800h:
	ld b,0b4h		;9800
l9802h:
	push bc			;9802
	call sub_985bh		;9803
	call sub_9616h		;9806
	call sub_9fd7h		;9809
	call sub_9502h		;980c
	call sub_9fedh		;980f
	pop bc			;9812
	djnz l9802h		;9813
	ld hl,07e18h		;9815
	dec (hl)			;9818
	jr nz,l9858h		;9819
	call sub_9fd7h		;981b
	ld de,078ebh		;981e
	ld a,(07d92h)		;9821
	or a			;9824
	jr z,l9841h		;9825
	ld de,078f1h		;9827
	ld hl,l9884h		;982a
	call sub_946eh		;982d
	ld a,(07d91h)		;9830
	add a,01fh		;9833
	ld de,038f8h		;9835
	ld bc,00001h		;9838
	call la100h		;983b
	ld de,078e7h		;983e
l9841h:
	ld hl,l987ah		;9841
	call sub_946eh		;9844
	call sub_9fedh		;9847
	ld a,00ch		;984a
	call lc629h		;984c
	ld bc,000b4h		;984f
	ld hl,sub_985bh		;9852
	call sub_acabh		;9855
l9858h:
	jp sub_91b4h		;9858
sub_985bh:
	rst 38h			;985b
	call sub_9fd7h		;985c
	rst 20h			;985f
	call sub_96c5h		;9860
	call sub_9fedh		;9863
	ld a,(07d85h)		;9866
	and 001h		;9869
	call z,sub_8aaah		;986b
	call sub_bab1h		;986e
	ld bc,00003h		;9871
	call sub_acbbh		;9874
	jp la0b2h		;9877
l987ah:
	ld h,d			;987a
	ld e,h			;987b
	ld l,b			;987c
	ld h,b			;987d
	cp b			;987e
	ld l,d			;987f
	ld (hl),c			;9880
	ld h,b			;9881
	ld l,l			;9882
	rst 38h			;9883
l9884h:
	ld l,e			;9884
	ld h,a			;9885
	ld e,h			;9886
	ld (hl),h			;9887
	ld h,b			;9888
	ld l,l			;9889
	rst 38h			;988a
sub_988bh:
	sub a			;988b
	ld (07daeh),a		;988c
	call sub_be53h		;988f
	call sub_9fd7h		;9892
	call sub_c60eh		;9895
	call l910ah		;9898
	call sub_9fedh		;989b
	ld b,006h		;989e
	ld hl,l9a5bh		;98a0
	call sub_acabh		;98a3
	call sub_9fd7h		;98a6
	call sub_af08h		;98a9
	sub a			;98ac
	ld (07e64h),a		;98ad
	call l9428h		;98b0
	ld a,(07e19h)		;98b3
	cp 01ah		;98b6
	jp z,l9a6ah		;98b8
	ld a,(07e19h)		;98bb
	cp 034h		;98be
	jp z,l9a6ah		;98c0
	ld a,010h		;98c3
	call lc629h		;98c5
	ld a,011h		;98c8
	call lc629h		;98ca
l98cdh:
	call sub_9fedh		;98cd
	ld b,000h		;98d0
	ld hl,l9a5bh		;98d2
	call sub_acabh		;98d5
	call sub_a9a5h		;98d8
	rst 38h			;98db
	ld a,0feh		;98dc
	ld (07d89h),a		;98de
	rst 18h			;98e1
	call sub_9fb2h		;98e2
	ld de,038a0h		;98e5
	ld bc,00260h		;98e8
	ld a,0fdh		;98eb
	rst 10h			;98ed
	ld hl,l9b44h		;98ee
	rst 28h			;98f1
	ld hl,l9b82h		;98f2
	rst 30h			;98f5
	call sub_9fc4h		;98f6
	ld a,0f1h		;98f9
	ld (07d89h),a		;98fb
	rst 18h			;98fe
	ld hl,l9a9bh		;98ff
	ld de,03905h		;9902
	call sub_94d7h		;9905
	ld a,(07e19h)		;9908
	add a,05bh		;990b
	ld de,0391bh		;990d
	ld bc,00001h		;9910
	rst 10h			;9913
	ld hl,l9ab4h		;9914
	ld de,03964h		;9917
	call sub_94d7h		;991a
	ld hl,07e20h		;991d
	ld de,0397ah		;9920
	ld bc,0031eh		;9923
	call sub_9441h		;9926
	ld hl,l9ac9h		;9929
	ld de,039a4h		;992c
	call sub_94d7h		;992f
	ld a,(07e19h)		;9932
	rrca			;9935
	and 01eh		;9936
	sub 002h		;9938
	ld e,a			;993a
	ld d,000h		;993b
	push de			;993d
	ld hl,l9bbfh		;993e
	add hl,de			;9941
	ld de,07dcch		;9942
	ldi		;9945
	ldi		;9947
	ex de,hl			;9949
	dec hl			;994a
	dec hl			;994b
	ld de,039bah		;994c
	ld bc,0031eh		;994f
	call sub_9441h		;9952
	ld hl,l9adeh		;9955
	ld de,039e4h		;9958
	call sub_94d7h		;995b
	pop de			;995e
	push de			;995f
	ld hl,07defh		;9960
	add hl,de			;9963
	ld de,039fah		;9964
	ld bc,0031eh		;9967
	call sub_9441h		;996a
	ld hl,07dcdh		;996d
	ld a,(07e21h)		;9970
	cp (hl)			;9973
	jr c,l9981h		;9974
	jp nz,l9a40h		;9976
	dec hl			;9979
	ld a,(07e20h)		;997a
	cp (hl)			;997d
	jp nc,l9a40h		;997e
l9981h:
	ld a,(07e19h)		;9981
	cp 01ah		;9984
	ld hl,01000h		;9986
	jr c,l9996h		;9989
	ld hl,02000h		;998b
	jp z,l9a4ch		;998e
	cp 034h		;9991
	jp z,l9a4ch		;9993
l9996h:
	ld (07dceh),hl		;9996
	ld hl,l9af3h		;9999
	ld de,03a45h		;999c
l999fh:
	call sub_94d7h		;999f
	ld hl,07dceh		;99a2
	ld de,03a59h		;99a5
	ld bc,0041eh		;99a8
	call sub_9441h		;99ab
	pop de			;99ae
	ld hl,07defh		;99af
	add hl,de			;99b2
	inc hl			;99b3
	ld a,(07e21h)		;99b4
	cp (hl)			;99b7
	jr c,l99c4h		;99b8
	jr nz,l99d6h		;99ba
	dec hl			;99bc
	ld a,(07e20h)		;99bd
	cp (hl)			;99c0
	jr nc,l99d6h		;99c1
	inc hl			;99c3
l99c4h:
	dec hl			;99c4
	ex de,hl			;99c5
	ld hl,07e20h		;99c6
	ldi		;99c9
	ldi		;99cb
	ld hl,l9b1ah		;99cd
	ld de,03aa5h		;99d0
	call sub_94d7h		;99d3
l99d6h:
	rst 38h			;99d6
	call sub_9fd7h		;99d7
	rst 20h			;99da
	ld a,(07d85h)		;99db
	and 00fh		;99de
	jr z,l99eeh		;99e0
l99e2h:
	ld bc,00005h		;99e2
	call sub_acbbh		;99e5
	rst 18h			;99e8
	call sub_9fedh		;99e9
	jr l99d6h		;99ec
l99eeh:
	ld hl,(07e20h)		;99ee
	ld de,(07dcch)		;99f1
	or a			;99f5
	sbc hl,de		;99f6
	jr z,l9a2bh		;99f8
	ld hl,07dcch		;99fa
	ld a,(hl)			;99fd
	sub 001h		;99fe
	daa			;9a00
	ld (hl),a			;9a01
	inc hl			;9a02
	ld a,(hl)			;9a03
	sbc a,000h		;9a04
	daa			;9a06
	ld (hl),a			;9a07
	dec hl			;9a08
	ld de,039bah		;9a09
	ld bc,0031eh		;9a0c
	call sub_9441h		;9a0f
	ld hl,07dcfh		;9a12
	ld a,(hl)			;9a15
	add a,001h		;9a16
	daa			;9a18
	ld (hl),a			;9a19
	dec hl			;9a1a
	ld de,03a59h		;9a1b
	ld bc,0041eh		;9a1e
	call sub_9441h		;9a21
	ld a,005h		;9a24
	call lc629h		;9a26
	jr l99e2h		;9a29
l9a2bh:
	ld bc,00004h		;9a2b
	call sub_acbbh		;9a2e
	rst 18h			;9a31
	call sub_9fedh		;9a32
	ld hl,(07dceh)		;9a35
	call sub_909eh		;9a38
l9a3bh:
	ld b,078h		;9a3b
	jp sub_ac97h		;9a3d
l9a40h:
	pop de			;9a40
	ld hl,l9b34h		;9a41
	ld de,03a45h		;9a44
	call sub_94d7h		;9a47
	jr l9a3bh		;9a4a
l9a4ch:
	ld hl,05000h		;9a4c
	ld (07dceh),hl		;9a4f
	ld hl,l9b05h		;9a52
	ld de,03a42h		;9a55
	jp l999fh		;9a58
l9a5bh:
	rst 38h			;9a5b
	call sub_9fd7h		;9a5c
	rst 20h			;9a5f
	call sub_859ah		;9a60
	call sub_8416h		;9a63
	rst 18h			;9a66
	jp sub_9fedh		;9a67
l9a6ah:
	ld hl,l9a88h		;9a6a
	ld de,078e7h		;9a6d
	call sub_946eh		;9a70
	ld a,012h		;9a73
	call lc629h		;9a75
	ld a,013h		;9a78
	call lc629h		;9a7a
	ld b,000h		;9a7d
	ld hl,l9a5bh		;9a7f
	call sub_acabh		;9a82
	jp l98cdh		;9a85
l9a88h:
	ld e,(hl)			;9a88
	ld l,d			;9a89
	ld l,c			;9a8a
	ld h,d			;9a8b
	ld l,l			;9a8c
	ld e,h			;9a8d
	ld l,a			;9a8e
	ld (hl),b			;9a8f
	ld h,a			;9a90
	ld e,h			;9a91
	ld l,a			;9a92
	ld h,h			;9a93
	ld l,d			;9a94
	ld l,c			;9a95
	ld l,(hl)			;9a96
	cp b			;9a97
	sub b			;9a98
	sub b			;9a99
	rst 38h			;9a9a
l9a9bh:
	ld l,a			;9a9b
	ld h,h			;9a9c
	ld l,b			;9a9d
	ld h,b			;9a9e
	defb 0fdh,06fh	;ld iyl,a		;9a9f
	ld l,d			;9aa1
	defb 0fdh,06dh	;ld iyl,iyl		;9aa2
	ld h,b			;9aa4
	ld e,h			;9aa5
	ld e,(hl)			;9aa6
	ld h,e			;9aa7
	defb 0fdh,06bh	;ld iyl,e		;9aa8
	ld l,d			;9aaa
	ld h,h			;9aab
	ld l,c			;9aac
	ld l,a			;9aad
	defb 0fdh,0fdh,092h	;illegal sequence		;9aae
	defb 0fdh,092h,0ffh	;illegal sequence		;9ab1
l9ab4h:
	adc a,(hl)			;9ab4
	add a,h			;9ab5
	adc a,d			;9ab6
	add a,a			;9ab7
	defb 0fdh,089h,07eh	;illegal sequence		;9ab8
	add a,d			;9abb
	ld a,d			;9abc
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9abd
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9ac0
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9ac3
	defb 0fdh,091h,0ffh	;illegal sequence		;9ac6
l9ac9h:
	adc a,c			;9ac9
	ld a,l			;9aca
	ld a,d			;9acb
	defb 0fdh,076h,08bh	;illegal sequence		;9acc
	ld a,d			;9acf
	add a,a			;9ad0
	halt			;9ad1
	ld a,h			;9ad2
	ld a,d			;9ad3
	defb 0fdh,089h,07eh	;illegal sequence		;9ad4
	add a,d			;9ad7
	ld a,d			;9ad8
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9ad9
	sub c			;9adc
	rst 38h			;9add
l9adeh:
	ld l,a			;9ade
	ld l,d			;9adf
	ld l,e			;9ae0
	defb 0fdh,06dh	;ld iyl,iyl		;9ae1
	ld h,b			;9ae3
	ld e,(hl)			;9ae4
	ld l,d			;9ae5
	ld l,l			;9ae6
	ld e,a			;9ae7
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9ae8
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9aeb
	defb 0fdh,0fdh,0fdh	;illegal sequence		;9aee
	sub c			;9af1
	rst 38h			;9af2
l9af3h:
	ld a,h			;9af3
	add a,h			;9af4
	add a,h			;9af5
	ld a,c			;9af6
	ld (iy-07ch),a		;9af7
	add a,e			;9afa
	adc a,d			;9afb
	adc a,b			;9afc
	defb 0fdh,085h	;add a,iyl		;9afd
	add a,h			;9aff
	ld a,(hl)			;9b00
	add a,e			;9b01
	adc a,c			;9b02
	adc a,b			;9b03
	rst 38h			;9b04
l9b05h:
	ld l,(hl)			;9b05
	ld l,e			;9b06
	ld h,b			;9b07
	ld e,(hl)			;9b08
	ld h,h			;9b09
	ld e,h			;9b0a
	ld h,a			;9b0b
	defb 0fdh,05dh	;ld e,iyl		;9b0c
l9b0eh:
	ld l,d			;9b0e
	ld l,c			;9b0f
	ld (hl),b			;9b10
	ld l,(hl)			;9b11
	defb 0fdh,06bh	;ld iyl,e		;9b12
	ld l,d			;9b14
	ld h,h			;9b15
	ld l,c			;9b16
	ld l,a			;9b17
	ld l,(hl)			;9b18
	rst 38h			;9b19
l9b1ah:
	ld (hl),h			;9b1a
	ld l,d			;9b1b
	ld (hl),b			;9b1c
	defb 0fdh,063h	;ld iyh,e		;9b1d
	ld e,h			;9b1f
	ld (hl),c			;9b20
	ld h,b			;9b21
	defb 0fdh,05dh	;ld e,iyl		;9b22
	ld l,l			;9b24
	ld l,d			;9b25
	ld h,(hl)			;9b26
	ld h,b			;9b27
	ld l,c			;9b28
	defb 0fdh,05ch	;ld e,iyh		;9b29
	defb 0fdh,06dh	;ld iyl,iyl		;9b2b
	ld h,b			;9b2d
	ld e,(hl)			;9b2e
	ld l,d			;9b2f
	ld l,l			;9b30
	ld e,a			;9b31
	sub b			;9b32
	rst 38h			;9b33
l9b34h:
	adc a,b			;9b34
	add a,h			;9b35
	add a,a			;9b36
	add a,a			;9b37
	adc a,(hl)			;9b38
	defb 0fdh,083h,084h	;illegal sequence		;9b39
	ld (iy-07ch),a		;9b3c
	add a,e			;9b3f
	adc a,d			;9b40
	adc a,b			;9b41
	sub b			;9b42
	rst 38h			;9b43
l9b44h:
	ex af,af'			;9b44
	nop			;9b45
	ret pe			;9b46
	rrca			;9b47
	or (hl)			;9b48
	push de			;9b49
	ld d,b			;9b4a
	nop			;9b4b
	ret p			;9b4c
	ex af,af'			;9b4d
	ld a,0d0h		;9b4e
	ret nc			;9b50
	nop			;9b51
	ret po			;9b52
	ld a,(bc)			;9b53
	adc a,(hl)			;9b54
	ret nc			;9b55
	ret nc			;9b56
	nop			;9b57
	or b			;9b58
	dec bc			;9b59
	adc a,(hl)			;9b5a
	ret nc			;9b5b
	jr l9b5eh		;9b5c
l9b5eh:
	add a,b			;9b5e
	inc c			;9b5f
	ld e,(hl)			;9b60
	pop de			;9b61
	ex af,af'			;9b62
	nop			;9b63
	ret pe			;9b64
	rla			;9b65
	or (hl)			;9b66
	push de			;9b67
	ld d,b			;9b68
	nop			;9b69
	ret p			;9b6a
	djnz l9babh		;9b6b
	ret nc			;9b6d
	ret nc			;9b6e
	nop			;9b6f
	ret po			;9b70
	ld (de),a			;9b71
	adc a,(hl)			;9b72
	ret nc			;9b73
	ret nc			;9b74
	nop			;9b75
	or b			;9b76
	inc de			;9b77
	adc a,(hl)			;9b78
	ret nc			;9b79
	jr l9b7ch		;9b7a
l9b7ch:
	add a,b			;9b7c
	inc d			;9b7d
	ld e,(hl)			;9b7e
	pop de			;9b7f
	nop			;9b80
	nop			;9b81
l9b82h:
	ld de,00008h		;9b82
	ret pe			;9b85
	cpl			;9b86
	pop af			;9b87
	ld d,b			;9b88
	nop			;9b89
	ret p			;9b8a
	jr z,l9b0eh		;9b8b
	ret nc			;9b8d
	nop			;9b8e
	ret po			;9b8f
	ld hl,(ld051h)		;9b90
	nop			;9b93
	or b			;9b94
	dec hl			;9b95
	add a,c			;9b96
	ex af,af'			;9b97
	nop			;9b98
	add a,b			;9b99
	inc l			;9b9a
	or c			;9b9b
	djnz l9b9eh		;9b9c
l9b9eh:
	adc a,b			;9b9e
	inc l			;9b9f
	ld de,00008h		;9ba0
	ret pe			;9ba3
	scf			;9ba4
	pop af			;9ba5
	ld d,b			;9ba6
	nop			;9ba7
	ret p			;9ba8
	jr nc,$-125		;9ba9
l9babh:
	ret nc			;9bab
	nop			;9bac
	ret po			;9bad
	ld (ld051h),a		;9bae
	nop			;9bb1
	or b			;9bb2
	inc sp			;9bb3
	add a,c			;9bb4
	ex af,af'			;9bb5
	nop			;9bb6
	add a,b			;9bb7
	inc (hl)			;9bb8
	or c			;9bb9
	djnz l9bbch		;9bba
l9bbch:
	adc a,b			;9bbc
	inc (hl)			;9bbd
	rst 38h			;9bbe
l9bbfh:
	add a,b			;9bbf
	nop			;9bc0
	add a,b			;9bc1
	nop			;9bc2
	nop			;9bc3
	ld bc,00000h		;9bc4
	nop			;9bc7
	ld bc,00100h		;9bc8
	nop			;9bcb
	ld bc,00000h		;9bcc
	nop			;9bcf
	ld bc,00120h		;9bd0
	jr nz,l9bd6h		;9bd3
	nop			;9bd5
l9bd6h:
	nop			;9bd6
	jr nz,$+3		;9bd7
sub_9bd9h:
	call sub_9fa6h		;9bd9
	call sub_c60eh		;9bdc
	ld bc,002eeh		;9bdf
	call sub_acbbh		;9be2
sub_9be5h:
	call sub_9d00h		;9be5
	sub a			;9be8
	ld (07d91h),a		;9be9
	ld b,000h		;9bec
	call sub_9c35h		;9bee
	ld b,03ch		;9bf1
	call sub_9c35h		;9bf3
	call sub_9fd7h		;9bf6
	ld a,051h		;9bf9
	ld de,03800h		;9bfb
	ld bc,00080h		;9bfe
	rst 10h			;9c01
	ld de,03a60h		;9c02
	ld bc,000c0h		;9c05
	rst 10h			;9c08
	call sub_a9a5h		;9c09
	call sub_a29ah		;9c0c
	ld hl,l9e23h		;9c0f
	ld de,07865h		;9c12
	call sub_946eh		;9c15
	ld hl,l9e4eh		;9c18
	ld de,07907h		;9c1b
	call sub_946eh		;9c1e
	ld hl,09f83h		;9c21
	rst 30h			;9c24
	call sub_9fedh		;9c25
	ld b,000h		;9c28
	call sub_9c35h		;9c2a
	ld b,000h		;9c2d
	call sub_9c35h		;9c2f
	jp sub_9be5h		;9c32
sub_9c35h:
	call sub_91cdh		;9c35
	ld a,(07d95h)		;9c38
	and 00fh		;9c3b
	cp 002h		;9c3d
	jr z,l9c56h		;9c3f - Change to nz to start the game automatically
	cp 008h		;9c41
	jr z,l9c5ch		;9c43
	cp 003h		;9c45
	jr z,l9c62h		;9c47
	cp 00dh		;9c49
	jr z,l9c69h		;9c4b
	call sub_ab6fh		;9c4d
	call sub_9cdah		;9c50
	djnz sub_9c35h		;9c53
	ret			;9c55
l9c56h:
	sub a			;9c56
	ld (07d92h),a		;9c57
	jr l9c8ch		;9c5a
l9c5ch:
	sub a			;9c5c
	ld (07d92h),a		;9c5d
	jr l9c6eh		;9c60
l9c62h:
	ld a,001h		;9c62
	ld (07d92h),a		;9c64
	jr l9c8ch		;9c67
l9c69h:
	ld a,001h		;9c69
	ld (07d92h),a		;9c6b
l9c6eh:
	call sub_aaadh		;9c6e
	ld hl,l8dc8h		;9c71
	ld (07e39h),hl		;9c74
	ld (07e54h),hl		;9c77
	ld (07e1eh),hl		;9c7a
	inc hl			;9c7d
	ld (07e3fh),hl		;9c7e
	ld (07e5ah),hl		;9c81
	ld (07e24h),hl		;9c84
	ld hl,l9ebbh		;9c87
	jr l9c92h		;9c8a
l9c8ch:
	call sub_aaadh		;9c8c
	ld hl,l9ed0h		;9c8f
l9c92h:
	ld a,(07d97h)		;9c92
	and 004h		;9c95
	ld (07e0ah),a		;9c97
	pop af			;9c9a
	ld (07e7ah),hl		;9c9b
	sub a			;9c9e
	ld (07d91h),a		;9c9f
	rst 38h			;9ca2
	call sub_9fd7h		;9ca3
	ld hl,la0d7h		;9ca6
	ld bc,00007h		;9ca9
	call sub_a0d1h		;9cac
	ld a,(07d7eh)		;9caf
	and 0feh		;9cb2
	ld (07d7eh),a		;9cb4
	call sub_a0bch		;9cb7
	call sub_a9a5h		;9cba
	call sub_a29ah		;9cbd
	ld de,07d9ah		;9cc0
	ld hl,l9cd1h		;9cc3
	ld bc,00009h		;9cc6
	ldir		;9cc9
	call sub_9fedh		;9ccb
	jp sub_9ffdh		;9cce
l9cd1h:
	nop			;9cd1
	ld b,b			;9cd2
	ld a,c			;9cd3
	nop			;9cd4
	ret nz			;9cd5
	ld a,c			;9cd6
	nop			;9cd7
	and b			;9cd8
	ld a,d			;9cd9
sub_9cdah:
	ld hl,07deeh		;9cda
	dec (hl)			;9cdd
	ret nz			;9cde
	push bc			;9cdf
	ld (hl),004h		;9ce0
	ld hl,07debh		;9ce2
	ld de,07dedh		;9ce5
	ld bc,00020h		;9ce8
	lddr		;9ceb
	ld hl,07dech		;9ced
	dec de			;9cf0
	push de			;9cf1
	ldi		;9cf2
	ldi		;9cf4
	pop hl			;9cf6
	ld de,02290h		;9cf7
	ld bc,00020h		;9cfa
	rst 8			;9cfd
	pop bc			;9cfe
	ret			;9cff
sub_9d00h:
	call sub_9fa6h		;9d00
	ld a,0feh		;9d03
	ld (07d89h),a		;9d05
	rst 18h			;9d08
	ld a,(07d7eh)		;9d09
	or 001h		;9d0c
	ld (07d7eh),a		;9d0e
	call sub_a0bch		;9d11
	call sub_c60eh		;9d14
	ld bc,00005h		;9d17
	call sub_acbbh		;9d1a
	ld a,051h		;9d1d
	ld de,03800h		;9d1f
	ld bc,00300h		;9d22
	rst 10h			;9d25
	ld hl,l9ee5h		;9d26
	rst 30h			;9d29
	ld hl,l9efah		;9d2a
	ld de,07dcch		;9d2d
	push de			;9d30
	ld bc,00020h		;9d31
	ldir		;9d34
	pop hl			;9d36
	ld de,02290h		;9d37
	ld bc,00020h		;9d3a
	rst 8			;9d3d
	ld hl,l9f1ah		;9d3e
	rst 28h			;9d41
	ld a,0ffh		;9d42
	ld de,00290h		;9d44
	ld bc,00020h		;9d47
	rst 10h			;9d4a
	call sub_a999h		;9d4b
	call sub_aa0eh		;9d4e
	call sub_a9a5h		;9d51
	call sub_a29ah		;9d54
	ld hl,l9deah		;9d57
	ld de,078ach		;9d5a
	call sub_946eh		;9d5d
	ld hl,l9f52h		;9d60
	ld de,07c80h		;9d63
	ld bc,00031h		;9d66
	ldir		;9d69
	call sub_a29ah		;9d6b
	ld a,052h		;9d6e
	ld de,03808h		;9d70
	ld bc,00010h		;9d73
	push bc			;9d76
	rst 10h			;9d77
	pop bc			;9d78
	push bc			;9d79
	ld de,03828h		;9d7a
	inc a			;9d7d
	rst 10h			;9d7e
	pop bc			;9d7f
	push bc			;9d80
	ld de,03848h		;9d81
	inc a			;9d84
	rst 10h			;9d85
	pop bc			;9d86
	ld de,03868h		;9d87
	inc a			;9d8a
	rst 10h			;9d8b
	ld hl,l9df3h		;9d8c
	ld de,07a68h		;9d8f
	call sub_946eh		;9d92
	ld hl,l9e03h		;9d95
	ld de,07aaah		;9d98
	call sub_946eh		;9d9b
	ld hl,l9e0fh		;9d9e
	ld de,07ae6h		;9da1
	call sub_946eh		;9da4
	jp sub_9fc4h		;9da7
sub_9daah:
	call sub_ccf9h		;9daa
	call sub_9fd7h		;9dad
	ld hl,(07e7ah)		;9db0
	ld de,078e6h		;9db3
	call sub_946eh		;9db6
	call sub_9fedh		;9db9
	ld b,001h		;9dbc
	ld hl,l81feh		;9dbe
	call sub_acabh		;9dc1
	ld b,00dh		;9dc4
	call sub_acc7h		;9dc6
	ld a,00eh		;9dc9
	call lc629h		;9dcb
	ld a,00fh		;9dce
	call lc629h		;9dd0
	ld b,000h		;9dd3
	ld hl,l81feh		;9dd5
	call sub_acabh		;9dd8
	call sub_9fd7h		;9ddb
	ld a,0b8h		;9dde
	ld bc,00014h		;9de0
	ld de,038e6h		;9de3
	rst 10h			;9de6
	jp sub_9fedh		;9de7
l9deah:
	add hl,de			;9dea
	dec de			;9deb
	ld c,01ch		;9dec
	ld c,017h		;9dee
	dec e			;9df0
	inc e			;9df1
	rst 38h			;9df2
l9df3h:
	dec h			;9df3
	ld bc,00809h		;9df4
	ld (bc),a			;9df7
	ld d,c			;9df8
	ld d,c			;9df9
	jr nz,l9e0eh		;9dfa
	dec d			;9dfc
	dec d			;9dfd
	ld (de),a			;9dfe
	ld a,(bc)			;9dff
	ld d,01ch		;9e00
	rst 38h			;9e02
l9e03h:
	dec h			;9e03
	ld bc,00809h		;9e04
	inc b			;9e07
	ld d,c			;9e08
	ld a,(bc)			;9e09
	dec e			;9e0a
	ld a,(bc)			;9e0b
	dec de			;9e0c
	ld (de),a			;9e0d
l9e0eh:
	rst 38h			;9e0e
l9e0fh:
	ld a,(bc)			;9e0f
	dec d			;9e10
	dec d			;9e11
	ld d,c			;9e12
	dec de			;9e13
	ld (de),a			;9e14
	djnz l9e28h		;9e15
	dec e			;9e17
	inc e			;9e18
	ld d,c			;9e19
	dec de			;9e1a
	ld c,01ch		;9e1b
	ld c,01bh		;9e1d
	rra			;9e1f
	ld c,00dh		;9e20
	rst 38h			;9e22
l9e23h:
	ld d,c			;9e23
	ld d,c			;9e24
	ld d,c			;9e25
	ld d,c			;9e26
	dec e			;9e27
l9e28h:
	jr l9e7bh		;9e28
	inc e			;9e2a
	ld c,015h		;9e2b
	ld c,00ch		;9e2d
	dec e			;9e2f
	ld d,c			;9e30
	djnz l9e3dh		;9e31
	ld d,00eh		;9e33
	cp 0feh		;9e35
	add hl,de			;9e37
	dec de			;9e38
	ld c,01ch		;9e39
l9e3bh:
	inc e			;9e3b
	ld d,c			;9e3c
l9e3dh:
	dec bc			;9e3d
	ld e,01dh		;9e3e
	dec e			;9e40
	jr $+25		;9e41
	ld d,c			;9e43
	jr $+25		;9e44
	ld d,c			;9e46
	inc d			;9e47
	ld c,022h		;9e48
	add hl,de			;9e4a
	ld a,(bc)			;9e4b
	dec c			;9e4c
	rst 38h			;9e4d
l9e4eh:
	ld d,c			;9e4e
	ld d,c			;9e4f
	ld d,c			;9e50
	ld d,c			;9e51
	jr $+25		;9e52
	ld c,051h		;9e54
	add hl,de			;9e56
	dec d			;9e57
	ld a,(bc)			;9e58
	ld (01b0eh),hl		;9e59
	cp 0feh		;9e5c
	ld bc,00b51h		;9e5e
	ld c,010h		;9e61
	ld (de),a			;9e63
	rla			;9e64
	rla			;9e65
	ld c,01bh		;9e66
	ld d,c			;9e68
	inc c			;9e69
	jr l9e8ah		;9e6a
	dec de			;9e6c
	inc e			;9e6d
	ld c,0feh		;9e6e
	cp 002h		;9e70
	ld d,c			;9e72
	inc c			;9e73
	ld de,0160ah		;9e74
	add hl,de			;9e77
	ld (de),a			;9e78
	jr $+25		;9e79
l9e7bh:
	ld d,c			;9e7b
	inc c			;9e7c
	jr l9e9dh		;9e7d
	dec de			;9e7f
	inc e			;9e80
	ld c,0feh		;9e81
	cp 0feh		;9e83
	ld d,c			;9e85
	ld d,c			;9e86
	ld d,c			;9e87
	ld d,c			;9e88
	dec e			;9e89
l9e8ah:
	jr nz,l9ea4h		;9e8a
	ld d,c			;9e8c
	add hl,de			;9e8d
	dec d			;9e8e
	ld a,(bc)			;9e8f
	ld (01b0eh),hl		;9e90
	inc e			;9e93
	cp 0feh		;9e94
	inc bc			;9e96
	ld d,c			;9e97
	dec bc			;9e98
	ld c,010h		;9e99
	ld (de),a			;9e9b
	rla			;9e9c
l9e9dh:
	rla			;9e9d
	ld c,01bh		;9e9e
	ld d,c			;9ea0
	inc c			;9ea1
	jr l9ec2h		;9ea2
l9ea4h:
	dec de			;9ea4
	inc e			;9ea5
	ld c,0feh		;9ea6
	cp 004h		;9ea8
	ld d,c			;9eaa
	inc c			;9eab
	ld de,0160ah		;9eac
	add hl,de			;9eaf
	ld (de),a			;9eb0
	jr l9ecah		;9eb1
	ld d,c			;9eb3
	inc c			;9eb4
	jr l9ed5h		;9eb5
	dec de			;9eb7
	inc e			;9eb8
	ld c,0ffh		;9eb9
l9ebbh:
	ld e,(hl)			;9ebb
	ld h,e			;9ebc
	ld e,h			;9ebd
	ld l,b			;9ebe
	ld l,e			;9ebf
	ld h,h			;9ec0
	ld l,d			;9ec1
l9ec2h:
	ld l,c			;9ec2
	cp b			;9ec3
	ld e,(hl)			;9ec4
	ld l,d			;9ec5
	ld (hl),b			;9ec6
	ld l,l			;9ec7
	ld l,(hl)			;9ec8
	ld h,b			;9ec9
l9ecah:
	cp b			;9eca
	ld h,d			;9ecb
	ld l,d			;9ecc
	cp b			;9ecd
	sub b			;9ece
	rst 38h			;9ecf
l9ed0h:
	ld e,l			;9ed0
l9ed1h:
	ld h,b			;9ed1
	ld h,d			;9ed2
	ld h,h			;9ed3
	ld l,c			;9ed4
l9ed5h:
	ld l,c			;9ed5
	ld h,b			;9ed6
	ld l,l			;9ed7
	cp b			;9ed8
	ld e,(hl)			;9ed9
	ld l,d			;9eda
l9edbh:
	ld (hl),b			;9edb
	ld l,l			;9edc
	ld l,(hl)			;9edd
	ld h,b			;9ede
	cp b			;9edf
	ld h,d			;9ee0
	ld l,d			;9ee1
	cp b			;9ee2
	sub b			;9ee3
	rst 38h			;9ee4
l9ee5h:
	ld h,b			;9ee5
	sub b			;9ee6
	ld (bc),a			;9ee7
	nop			;9ee8
	jr nz,l9edbh		;9ee9
	sub b			;9eeb
	ld (bc),a			;9eec
	nop			;9eed
	jr z,l9f50h		;9eee
	jr nc,l9ef3h		;9ef0
	nop			;9ef2
l9ef3h:
	jr nc,l9ee5h		;9ef3
	ld h,b			;9ef5
	ld bc,03130h		;9ef6
	rst 38h			;9ef9
l9efah:
	ld h,b			;9efa
	ld h,b			;9efb
	ld h,b			;9efc
	add a,b			;9efd
	add a,b			;9efe
	add a,b			;9eff
	sub b			;9f00
	sub b			;9f01
	sub b			;9f02
	and b			;9f03
	and b			;9f04
	or b			;9f05
	or b			;9f06
	ld (hl),b			;9f07
	ld (hl),b			;9f08
	jr nc,l9f3bh		;9f09
	jr nc,l9f2dh		;9f0b
	jr nz,l9f2fh		;9f0d
	ret nz			;9f0f
	ret nz			;9f10
	ld b,b			;9f11
	ld b,b			;9f12
	ld b,b			;9f13
	ld d,b			;9f14
	ld d,b			;9f15
	ld d,b			;9f16
	ret nc			;9f17
	ret nc			;9f18
	ret nc			;9f19
l9f1ah:
	ret c			;9f1a
	nop			;9f1b
	ld d,b			;9f1c
	nop			;9f1d
	adc a,(hl)			;9f1e
	ret nc			;9f1f
	ex af,af'			;9f20
	nop			;9f21
	adc a,b			;9f22
	ld (bc),a			;9f23
	or (hl)			;9f24
	push de			;9f25
	ld d,b			;9f26
	nop			;9f27
	nop			;9f28
	ex af,af'			;9f29
	ld a,0d0h		;9f2a
	ret nc			;9f2c
l9f2dh:
	nop			;9f2d
	ld d,b			;9f2e
l9f2fh:
	ex af,af'			;9f2f
	adc a,(hl)			;9f30
	ret nc			;9f31
	ex af,af'			;9f32
	nop			;9f33
	adc a,b			;9f34
	ld a,(bc)			;9f35
	or (hl)			;9f36
	push de			;9f37
	ld d,b			;9f38
	nop			;9f39
	nop			;9f3a
l9f3bh:
	djnz $+64		;9f3b
	ret nc			;9f3d
	ret c			;9f3e
	nop			;9f3f
	ld d,b			;9f40
	djnz l9ed1h		;9f41
	ret nc			;9f43
l9f44h:
	djnz $+3		;9f44
	jr z,l9f59h		;9f46
	cp 0d5h		;9f48
	ex af,af'			;9f4a
	nop			;9f4b
	adc a,b			;9f4c
	ld (de),a			;9f4d
	or (hl)			;9f4e
	push de			;9f4f
l9f50h:
	nop			;9f50
	nop			;9f51
l9f52h:
	rst 38h			;9f52
	ld b,b			;9f53
	call z,sub_ff0eh		;9f54
	ld h,b			;9f57
	ret nc			;9f58
l9f59h:
	ld c,0ffh		;9f59
	add a,b			;9f5b
	call nc,sub_ff0eh		;9f5c
	and b			;9f5f
	ret c			;9f60
	ld c,03bh		;9f61
	ld b,e			;9f63
	or b			;9f64
	ld bc,06a3bh		;9f65
	or h			;9f68
	ld bc,0833bh		;9f69
	or h			;9f6c
	ld bc,l9e3bh		;9f6d
	cp b			;9f70
	ld bc,04663h		;9f71
	cp h			;9f74
	ld bc,06063h		;9f75
	ret nz			;9f78
	ld bc,07663h		;9f79
	call nz,06301h		;9f7c
	sub c			;9f7f
	ret z			;9f80
	ld bc,060d0h		;9f81
	ld d,b			;9f84
	nop			;9f85
	nop			;9f86
	jr z,$+98		;9f87
	ld d,b			;9f89
	nop			;9f8a
	nop			;9f8b
	jr nc,$-14		;9f8c
	ret nc			;9f8e
	nop			;9f8f
	ld d,b			;9f90
	jr z,$-14		;9f91
	ret nc			;9f93
	nop			;9f94
	ld d,b			;9f95
	jr nc,$+1		;9f96
sub_9f98h:
	call sub_9f9dh		;9f98
	in a,(0bfh)		;9f9b
sub_9f9dh:
	ld a,0c2h		;9f9d
sub_9f9fh:
	out (0bfh),a		;9f9f
	ld a,081h		;9fa1
	out (0bfh),a		;9fa3
	ret			;9fa5
sub_9fa6h:
	call sub_9fd7h		;9fa6
	ld hl,la0d7h		;9fa9
	call sub_a0ceh		;9fac
	jp sub_a0bch		;9faf
sub_9fb2h:
	call sub_9fd7h		;9fb2
	ld a,(07d7eh)		;9fb5
	and 0bfh		;9fb8
	ld (07d7eh),a		;9fba
	out (0bfh),a		;9fbd
	ld a,081h		;9fbf
	out (0bfh),a		;9fc1
	ret			;9fc3
sub_9fc4h:
	call sub_9fedh		;9fc4
	rst 38h			;9fc7
	ld a,(07d7eh)		;9fc8
	or 040h		;9fcb
	ld (07d7eh),a		;9fcd
	out (0bfh),a		;9fd0
	ld a,081h		;9fd2
	out (0bfh),a		;9fd4
	ret			;9fd6
sub_9fd7h:
	call sub_9fdeh		;9fd7
	push bc			;9fda
	pop bc			;9fdb
	in a,(0bfh)		;9fdc
sub_9fdeh:
	ld a,(07d7eh)		;9fde
	and 0dfh		;9fe1
	ld (07d7eh),a		;9fe3
	out (0bfh),a		;9fe6
	ld a,081h		;9fe8
	out (0bfh),a		;9fea
	ret			;9fec
sub_9fedh:
	ld a,(07d7eh)		;9fed
	or 020h		;9ff0
	ld (07d7eh),a		;9ff2
	out (0bfh),a		;9ff5
	nop			;9ff7
	ld a,081h		;9ff8
	out (0bfh),a		;9ffa
	ret			;9ffc
sub_9ffdh:
	ld a,00eh		;9ffd
	ld (07d89h),a		;9fff
	rst 18h			;a002
	call sub_9fb2h		;a003
	call sub_aa0eh		;a006
	call sub_ccf9h		;a009
	call sub_c60eh		;a00c
	call sub_a602h		;a00f
	call sub_a4d9h		;a012
	call sub_a03ch		;a015
	call sub_a9a5h		;a018
	call sub_a29ah		;a01b
	call sub_be53h		;a01e
	call sub_ad50h		;a021
	call sub_ab18h		;a024
	call sub_9395h		;a027
	ld b,002h		;a02a
	call sub_acc7h		;a02c
	ld a,003h		;a02f
	call lc629h		;a031
	ld a,0fah		;a034
	ld (07d89h),a		;a036
	jp sub_9fc4h		;a039
sub_a03ch:
	call sub_927fh		;a03c
	ld a,0b8h		;a03f
	ld bc,000a0h		;a041
	ld de,038a0h		;a044
	rst 10h			;a047
	ld a,018h		;a048
	ld bc,00040h		;a04a
	ld de,03900h		;a04d
	rst 10h			;a050
	ld a,088h		;a051
	ld bc,00020h		;a053
	ld de,039a0h		;a056
	rst 10h			;a059
	ld a,080h		;a05a
	ld bc,00040h		;a05c
	ld de,03ac0h		;a05f
	rst 10h			;a062
sub_a063h:
	ld a,081h		;a063
	ld bc,00080h		;a065
	ld de,03a20h		;a068
	jp la100h		;a06b
sub_a06eh:
	call sub_a9a5h		;a06e
	rst 38h			;a071
	call sub_a29ah		;a072
	ld a,001h		;a075
	ld (07d89h),a		;a077
	rst 18h			;a07a
	call sub_9fb2h		;a07b
	call sub_aa0eh		;a07e
	call sub_c60eh		;a081
	call sub_be53h		;a084
	call sub_a063h		;a087
	call sub_ad50h		;a08a
	call sub_ab18h		;a08d
	call sub_92dah		;a090
	call sub_9395h		;a093
	call sub_9fedh		;a096
	rst 38h			;a099
	call sub_9fc4h		;a09a
	ld b,002h		;a09d
	call sub_acc7h		;a09f
	ld a,003h		;a0a2
	call lc629h		;a0a4
	ld bc,00005h		;a0a7
	call sub_acbbh		;a0aa
	ld a,00ah		;a0ad
	ld (07d89h),a		;a0af
la0b2h:
	ld a,(07d89h)		;a0b2
	out (0bfh),a		;a0b5
	ld a,087h		;a0b7
	out (0bfh),a		;a0b9
	ret			;a0bb
sub_a0bch:
	ld hl,07d7dh		;a0bc
	ld b,008h		;a0bf
	ld c,07fh		;a0c1
la0c3h:
	ld a,(hl)			;a0c3
	inc hl			;a0c4
	out (0bfh),a		;a0c5
	inc c			;a0c7
	ld a,c			;a0c8
	out (0bfh),a		;a0c9
	djnz la0c3h		;a0cb
	ret			;a0cd
sub_a0ceh:
	ld bc,00008h		;a0ce
sub_a0d1h:
	ld de,07d7dh		;a0d1
	ldir		;a0d4
	ret			;a0d6
la0d7h:
	ld (bc),a			;a0d7
	add a,d			;a0d8
	ld c,0ffh		;a0d9
	inc bc			;a0db
	ld a,b			;a0dc
	inc bc			;a0dd
	cp 07bh		;a0de
	out (0bfh),a		;a0e0
	ld a,d			;a0e2
	or 040h		;a0e3
	out (0bfh),a		;a0e5
sub_a0e7h:
	ld a,c			;a0e7
	ld c,0beh		;a0e8
	inc b			;a0ea
	jp la0f6h		;a0eb
la0eeh:
	push bc			;a0ee
	ld b,000h		;a0ef
la0f1h:
	outi		;a0f1
	jr nz,la0f1h		;a0f3
	pop bc			;a0f5
la0f6h:
	djnz la0eeh		;a0f6
	or a			;a0f8
	ret z			;a0f9
	ld b,a			;a0fa
la0fbh:
	outi		;a0fb
	jr nz,la0fbh		;a0fd
	ret			;a0ff
la100h:
	push af			;a100
	push bc			;a101
	ld c,0bfh		;a102
	out (c),e		;a104
	ld h,a			;a106
	ld a,d			;a107
	or 040h		;a108
	out (c),a		;a10a
	dec c			;a10c
	pop de			;a10d
la10eh:
	out (c),h		;a10e
	dec de			;a110
	ld a,d			;a111
	or e			;a112
	jp nz,la10eh		;a113
	pop af			;a116
	ret			;a117
sub_a118h:
	ld a,l			;a118
	out (0bfh),a		;a119
	ld a,h			;a11b
	out (0bfh),a		;a11c
	nop			;a11e
	nop			;a11f
	nop			;a120
	nop			;a121
	nop			;a122
	nop			;a123
	nop			;a124
	in a,(0beh)		;a125
	ret			;a127
sub_a128h:
	ld bc,008bfh		;a128
	out (c),l		;a12b
	out (c),h		;a12d
	ld hl,07dcch		;a12f
	dec c			;a132
la133h:
	ini		;a133
	jr nz,la133h		;a135
	ld bc,008bfh		;a137
	out (c),e		;a13a
	out (c),d		;a13c
	ld hl,07dcch		;a13e
	dec c			;a141
la142h:
	outi		;a142
	jr nz,la142h		;a144
	ret			;a146
sub_a147h:
	ld de,07a80h		;a147
	ld c,0bfh		;a14a
	out (c),e		;a14c
	out (c),d		;a14e
	ld a,(07d88h)		;a150
	or a			;a153
	jr nz,la15fh		;a154
	dec c			;a156
	ld b,020h		;a157
	ld hl,la167h		;a159
	otir		;a15c
	ret			;a15e
la15fh:
	ld a,081h		;a15f
	ld bc,00020h		;a161
	jp la100h		;a164
la167h:
	add a,c			;a167
	add a,c			;a168
	add a,c			;a169
	add a,c			;a16a
	add a,c			;a16b
	add a,c			;a16c
	add a,c			;a16d
	add a,c			;a16e
	add a,c			;a16f
	add a,c			;a170
	add a,c			;a171
	add a,c			;a172
	add a,c			;a173
	add a,c			;a174
	add a,c			;a175
	add a,c			;a176
	add a,c			;a177
	add a,c			;a178
	add a,c			;a179
	add a,c			;a17a
	add a,c			;a17b
	add a,c			;a17c
	add a,c			;a17d
	add a,c			;a17e
	add a,c			;a17f
la180h:
	add a,c			;a180
	add a,c			;a181
	add a,c			;a182
	add a,c			;a183
	add a,c			;a184
	add a,c			;a185
	add a,c			;a186
la187h:
	ld a,(07d88h)		;a187
	or a			;a18a
	jp nz,sub_a29ah		;a18b
	ld hl,07c80h		;a18e
	ld de,07c00h		;a191
	ld c,0bfh		;a194
	out (c),e		;a196
	out (c),d		;a198
	dec c			;a19a
	ld b,040h		;a19b
	otir		;a19d
	ld hl,(07e66h)		;a19f
	ld b,00ch		;a1a2
	otir		;a1a4
	push de			;a1a6
	ex de,hl			;a1a7
	ld hl,07ce0h		;a1a8
	or a			;a1ab
	sbc hl,de		;a1ac
	jr nc,la1b3h		;a1ae
	ld de,07cc0h		;a1b0
la1b3h:
	ex de,hl			;a1b3
	ld (07e66h),hl		;a1b4
	pop de			;a1b7
	ld b,00ch		;a1b8
	call sub_a288h		;a1ba
	ld b,00ch		;a1bd
	call sub_a288h		;a1bf
	ld a,(07d85h)		;a1c2
	and 007h		;a1c5
	add a,a			;a1c7
	ld c,a			;a1c8
	ld b,000h		;a1c9
	ld hl,la1d6h		;a1cb
	add hl,bc			;a1ce
	ld a,(hl)			;a1cf
	inc hl			;a1d0
	ld h,(hl)			;a1d1
	ld l,a			;a1d2
	ld c,0beh		;a1d3
	jp (hl)			;a1d5
la1d6h:
	and 0a1h		;a1d6
	cpi		;a1d8
	ei			;a1da
	and c			;a1db
	djnz la180h		;a1dc
	inc (hl)			;a1de
	and d			;a1df
	ld c,c			;a1e0
	and d			;a1e1
	ld e,(hl)			;a1e2
	and d			;a1e3
	ld (hl),e			;a1e4
	and d			;a1e5
	ld b,014h		;a1e6
	ld hl,07ce4h		;a1e8
	jr la223h		;a1eb
	ld b,010h		;a1ed
	ld hl,07ce8h		;a1ef
	otir		;a1f2
	ld b,004h		;a1f4
	ld hl,07ce4h		;a1f6
	jr la223h		;a1f9
	ld b,004h		;a1fb
	ld hl,07ce4h		;a1fd
	otir		;a200
	ld b,00ch		;a202
	ld hl,07cech		;a204
	otir		;a207
	ld b,004h		;a209
	ld hl,07ce8h		;a20b
	jr la223h		;a20e
	ld b,00ch		;a210
	ld hl,07cech		;a212
	otir		;a215
	ld b,004h		;a217
	ld hl,07ce8h		;a219
	otir		;a21c
	ld b,004h		;a21e
	ld hl,07ce4h		;a220
la223h:
	otir		;a223
	ld a,0d0h		;a225
	out (0beh),a		;a227
	push af			;a229
	pop af			;a22a
	ld a,0feh		;a22b
	out (0bfh),a		;a22d
	ld a,087h		;a22f
	out (0bfh),a		;a231
	ret			;a233
	ld b,004h		;a234
	ld hl,07ce4h		;a236
	otir		;a239
	ld b,008h		;a23b
	ld hl,07cf0h		;a23d
	otir		;a240
	ld b,008h		;a242
	ld hl,07ce8h		;a244
	jr la223h		;a247
	ld b,008h		;a249
	ld hl,07cf0h		;a24b
	otir		;a24e
	ld b,008h		;a250
	ld hl,07ce8h		;a252
	otir		;a255
	ld b,004h		;a257
	ld hl,07ce4h		;a259
	jr la223h		;a25c
	ld b,004h		;a25e
	ld hl,07ce4h		;a260
	otir		;a263
	ld b,004h		;a265
	ld hl,07cf4h		;a267
	otir		;a26a
	ld b,00ch		;a26c
	ld hl,07ce8h		;a26e
	jr la223h		;a271
	ld b,004h		;a273
	ld hl,07cf4h		;a275
	otir		;a278
	ld b,00ch		;a27a
	ld hl,07ce8h		;a27c
	otir		;a27f
	ld b,004h		;a281
	ld hl,07ce4h		;a283
	jr la223h		;a286
sub_a288h:
	otir		;a288
	push de			;a28a
	ex de,hl			;a28b
	ld hl,07ce0h		;a28c
	or a			;a28f
	sbc hl,de		;a290
	jr nc,la297h		;a292
	ld de,07cc0h		;a294
la297h:
	ex de,hl			;a297
la298h:
	pop de			;a298
	ret			;a299
sub_a29ah:
	ld hl,07c80h		;a29a
	ld de,07c00h		;a29d
	ld c,0bfh		;a2a0
	out (c),e		;a2a2
	out (c),d		;a2a4
	call sub_a386h		;a2a6
	ld hl,(07e66h)		;a2a9
	call sub_a48ah		;a2ac
	push de			;a2af
	ex de,hl			;a2b0
	ld hl,07ce0h		;a2b1
	or a			;a2b4
	sbc hl,de		;a2b5
	jr nc,la2bch		;a2b7
	ld de,07cc0h		;a2b9
la2bch:
	ex de,hl			;a2bc
	ld (07e66h),hl		;a2bd
	pop de			;a2c0
	call sub_a4c6h		;a2c1
	call sub_a4c6h		;a2c4
	ld a,(07d85h)		;a2c7
	and 007h		;a2ca
	add a,a			;a2cc
	ld c,a			;a2cd
	ld b,000h		;a2ce
	ld hl,la2dbh		;a2d0
	add hl,bc			;a2d3
	ld a,(hl)			;a2d4
	inc hl			;a2d5
	ld h,(hl)			;a2d6
	ld l,a			;a2d7
	ld c,0beh		;a2d8
	jp (hl)			;a2da
la2dbh:
	ex de,hl			;a2db
	and d			;a2dc
	di			;a2dd
	and d			;a2de
	ld bc,015a3h		;a2df
	and e			;a2e2
	ld (hl),0a3h		;a2e3
	ld c,d			;a2e5
	and e			;a2e6
	ld e,(hl)			;a2e7
	and e			;a2e8
	ld (hl),d			;a2e9
	and e			;a2ea
	ld hl,07ce4h		;a2eb
	call sub_a462h		;a2ee
	jr la327h		;a2f1
	ld hl,07ce8h		;a2f3
	call sub_a476h		;a2f6
	ld hl,07ce4h		;a2f9
	call sub_a4b2h		;a2fc
	jr la327h		;a2ff
	ld hl,07ce4h		;a301
	call sub_a4b2h		;a304
	ld hl,07cech		;a307
	call sub_a48ah		;a30a
	ld hl,07ce8h		;a30d
	call sub_a4b2h		;a310
	jr la327h		;a313
	ld hl,07cech		;a315
	call sub_a48ah		;a318
	ld hl,07ce8h		;a31b
	call sub_a4b2h		;a31e
	ld hl,07ce4h		;a321
	call sub_a4b2h		;a324
la327h:
	ld a,0d0h		;a327
	out (0beh),a		;a329
	push af			;a32b
	pop af			;a32c
	ld a,0feh		;a32d
	out (0bfh),a		;a32f
	ld a,087h		;a331
	out (0bfh),a		;a333
	ret			;a335
	ld hl,07ce4h		;a336
	call sub_a4b2h		;a339
	ld hl,07cf0h		;a33c
	call sub_a49eh		;a33f
	ld hl,07ce8h		;a342
	call sub_a49eh		;a345
	jr la327h		;a348
	ld hl,07cf0h		;a34a
	call sub_a49eh		;a34d
	ld hl,07ce8h		;a350
	call sub_a49eh		;a353
	ld hl,07ce4h		;a356
	call sub_a4b2h		;a359
	jr la327h		;a35c
	ld hl,07ce4h		;a35e
	call sub_a4b2h		;a361
	ld hl,07cf4h		;a364
	call sub_a4b2h		;a367
	ld hl,07ce8h		;a36a
	call sub_a48ah		;a36d
	jr la327h		;a370
	ld hl,07cf4h		;a372
	call sub_a4b2h		;a375
	ld hl,07ce8h		;a378
	call sub_a48ah		;a37b
	ld hl,07ce4h		;a37e
	call sub_a4b2h		;a381
	jr la327h		;a384
sub_a386h:
	ld a,(hl)			;a386
	inc hl			;a387
	out (0beh),a		;a388
	nop			;a38a
	ld a,(hl)			;a38b
	inc hl			;a38c
	out (0beh),a		;a38d
	nop			;a38f
	ld a,(hl)			;a390
	inc hl			;a391
	out (0beh),a		;a392
	nop			;a394
	ld a,(hl)			;a395
	inc hl			;a396
	out (0beh),a		;a397
	nop			;a399
	ld a,(hl)			;a39a
	inc hl			;a39b
	out (0beh),a		;a39c
	nop			;a39e
	ld a,(hl)			;a39f
	inc hl			;a3a0
	out (0beh),a		;a3a1
	nop			;a3a3
	ld a,(hl)			;a3a4
	inc hl			;a3a5
	out (0beh),a		;a3a6
	nop			;a3a8
	ld a,(hl)			;a3a9
	inc hl			;a3aa
	out (0beh),a		;a3ab
	nop			;a3ad
	ld a,(hl)			;a3ae
	inc hl			;a3af
	out (0beh),a		;a3b0
	nop			;a3b2
	ld a,(hl)			;a3b3
	inc hl			;a3b4
	out (0beh),a		;a3b5
	nop			;a3b7
	ld a,(hl)			;a3b8
	inc hl			;a3b9
	out (0beh),a		;a3ba
	nop			;a3bc
	ld a,(hl)			;a3bd
	inc hl			;a3be
	out (0beh),a		;a3bf
	nop			;a3c1
	ld a,(hl)			;a3c2
	inc hl			;a3c3
	out (0beh),a		;a3c4
	nop			;a3c6
	ld a,(hl)			;a3c7
	inc hl			;a3c8
	out (0beh),a		;a3c9
	nop			;a3cb
	ld a,(hl)			;a3cc
	inc hl			;a3cd
	out (0beh),a		;a3ce
	nop			;a3d0
	ld a,(hl)			;a3d1
	inc hl			;a3d2
	out (0beh),a		;a3d3
	nop			;a3d5
	ld a,(hl)			;a3d6
	inc hl			;a3d7
	out (0beh),a		;a3d8
	nop			;a3da
	ld a,(hl)			;a3db
	inc hl			;a3dc
	out (0beh),a		;a3dd
	nop			;a3df
	ld a,(hl)			;a3e0
	inc hl			;a3e1
	out (0beh),a		;a3e2
	nop			;a3e4
	ld a,(hl)			;a3e5
	inc hl			;a3e6
	out (0beh),a		;a3e7
	nop			;a3e9
	ld a,(hl)			;a3ea
	inc hl			;a3eb
	out (0beh),a		;a3ec
	nop			;a3ee
	ld a,(hl)			;a3ef
	inc hl			;a3f0
	out (0beh),a		;a3f1
	nop			;a3f3
	ld a,(hl)			;a3f4
	inc hl			;a3f5
	out (0beh),a		;a3f6
	nop			;a3f8
	ld a,(hl)			;a3f9
	inc hl			;a3fa
	out (0beh),a		;a3fb
	nop			;a3fd
	ld a,(hl)			;a3fe
	inc hl			;a3ff
	out (0beh),a		;a400
	nop			;a402
	ld a,(hl)			;a403
	inc hl			;a404
	out (0beh),a		;a405
	nop			;a407
	ld a,(hl)			;a408
	inc hl			;a409
	out (0beh),a		;a40a
	nop			;a40c
	ld a,(hl)			;a40d
	inc hl			;a40e
	out (0beh),a		;a40f
	nop			;a411
	ld a,(hl)			;a412
	inc hl			;a413
	out (0beh),a		;a414
	nop			;a416
	ld a,(hl)			;a417
	inc hl			;a418
	out (0beh),a		;a419
	nop			;a41b
	ld a,(hl)			;a41c
	inc hl			;a41d
	out (0beh),a		;a41e
	nop			;a420
	ld a,(hl)			;a421
	inc hl			;a422
	out (0beh),a		;a423
	nop			;a425
	ld a,(hl)			;a426
	inc hl			;a427
	out (0beh),a		;a428
	nop			;a42a
	ld a,(hl)			;a42b
	inc hl			;a42c
	out (0beh),a		;a42d
	nop			;a42f
	ld a,(hl)			;a430
	inc hl			;a431
	out (0beh),a		;a432
	nop			;a434
	ld a,(hl)			;a435
	inc hl			;a436
	out (0beh),a		;a437
	nop			;a439
	ld a,(hl)			;a43a
	inc hl			;a43b
	out (0beh),a		;a43c
	nop			;a43e
	ld a,(hl)			;a43f
	inc hl			;a440
	out (0beh),a		;a441
	nop			;a443
	ld a,(hl)			;a444
	inc hl			;a445
	out (0beh),a		;a446
	nop			;a448
	ld a,(hl)			;a449
	inc hl			;a44a
	out (0beh),a		;a44b
	nop			;a44d
	ld a,(hl)			;a44e
	inc hl			;a44f
	out (0beh),a		;a450
	nop			;a452
	ld a,(hl)			;a453
	inc hl			;a454
	out (0beh),a		;a455
	nop			;a457
	ld a,(hl)			;a458
	inc hl			;a459
	out (0beh),a		;a45a
	nop			;a45c
	ld a,(hl)			;a45d
	inc hl			;a45e
	out (0beh),a		;a45f
	nop			;a461
sub_a462h:
	ld a,(hl)			;a462
	inc hl			;a463
	out (0beh),a		;a464
	nop			;a466
	ld a,(hl)			;a467
	inc hl			;a468
	out (0beh),a		;a469
	nop			;a46b
	ld a,(hl)			;a46c
	inc hl			;a46d
	out (0beh),a		;a46e
	nop			;a470
	ld a,(hl)			;a471
	inc hl			;a472
	out (0beh),a		;a473
	nop			;a475
sub_a476h:
	ld a,(hl)			;a476
	inc hl			;a477
	out (0beh),a		;a478
	nop			;a47a
	ld a,(hl)			;a47b
	inc hl			;a47c
	out (0beh),a		;a47d
	nop			;a47f
	ld a,(hl)			;a480
	inc hl			;a481
	out (0beh),a		;a482
	nop			;a484
	ld a,(hl)			;a485
	inc hl			;a486
	out (0beh),a		;a487
	nop			;a489
sub_a48ah:
	ld a,(hl)			;a48a
	inc hl			;a48b
	out (0beh),a		;a48c
	nop			;a48e
	ld a,(hl)			;a48f
	inc hl			;a490
	out (0beh),a		;a491
	nop			;a493
	ld a,(hl)			;a494
	inc hl			;a495
	out (0beh),a		;a496
	nop			;a498
	ld a,(hl)			;a499
	inc hl			;a49a
	out (0beh),a		;a49b
	nop			;a49d
sub_a49eh:
	ld a,(hl)			;a49e
	inc hl			;a49f
	out (0beh),a		;a4a0
	nop			;a4a2
	ld a,(hl)			;a4a3
	inc hl			;a4a4
	out (0beh),a		;a4a5
	nop			;a4a7
	ld a,(hl)			;a4a8
	inc hl			;a4a9
	out (0beh),a		;a4aa
	nop			;a4ac
	ld a,(hl)			;a4ad
	inc hl			;a4ae
	out (0beh),a		;a4af
	nop			;a4b1
sub_a4b2h:
	ld a,(hl)			;a4b2
	inc hl			;a4b3
	out (0beh),a		;a4b4
	nop			;a4b6
	ld a,(hl)			;a4b7
	inc hl			;a4b8
	out (0beh),a		;a4b9
	nop			;a4bb
	ld a,(hl)			;a4bc
	inc hl			;a4bd
	out (0beh),a		;a4be
	nop			;a4c0
	ld a,(hl)			;a4c1
	inc hl			;a4c2
	out (0beh),a		;a4c3
	ret			;a4c5
sub_a4c6h:
	call sub_a48ah		;a4c6
	push de			;a4c9
	ex de,hl			;a4ca
	ld hl,07ce0h		;a4cb
	or a			;a4ce
	sbc hl,de		;a4cf
	jr nc,la4d6h		;a4d1
	ld de,07cc0h		;a4d3
la4d6h:
	ex de,hl			;a4d6
	pop de			;a4d7
	ret			;a4d8
sub_a4d9h:
	ld hl,la850h		;a4d9
	rst 28h			;a4dc
	ld hl,00800h		;a4dd
	ld (07db3h),hl		;a4e0
	ld de,ld33eh		;a4e3
	push de			;a4e6
	ld hl,lcdf2h		;a4e7
	ld b,008h		;a4ea
	call sub_a595h		;a4ec
	pop de			;a4ef
	push de			;a4f0
	ld hl,lce1bh		;a4f1
	ld b,008h		;a4f4
	call sub_a595h		;a4f6
	pop de			;a4f9
	push de			;a4fa
	ld hl,lce44h		;a4fb
	ld b,008h		;a4fe
	call sub_a595h		;a500
	pop de			;a503
	ld a,(07e26h)		;a504
	or a			;a507
	jr z,la54dh		;a508
	ld de,ld446h		;a50a
	push de			;a50d
	ld hl,lcf30h		;a50e
	ld b,020h		;a511
	call sub_a595h		;a513
	pop de			;a516
	push de			;a517
	ld hl,lcf71h		;a518
	ld b,020h		;a51b
	call sub_a595h		;a51d
	pop de			;a520
	ld hl,lcffah		;a521
	ld b,003h		;a524
	call sub_a595h		;a526
	ld ix,la58ah		;a529
	call sub_a6cch		;a52d
	ld hl,ld546h		;a530
	ld de,00e68h		;a533
	ld bc,00070h		;a536
	rst 8			;a539
	ld hl,01000h		;a53a
	ld (07db3h),hl		;a53d
	ld de,ld5beh		;a540
	ld hl,lcfb2h		;a543
	ld b,020h		;a546
	call sub_a595h		;a548
	jr la573h		;a54b
la54dh:
	ld de,ld33eh		;a54d
	push de			;a550
	ld hl,lce6dh		;a551
	ld b,020h		;a554
	call sub_a595h		;a556
	pop de			;a559
	ld hl,lceaeh		;a55a
	ld b,020h		;a55d
	call sub_a595h		;a55f
	ld hl,01000h		;a562
	ld (07db3h),hl		;a565
	ld de,ld43eh		;a568
	ld hl,lceefh		;a56b
	ld b,020h		;a56e
	call sub_a595h		;a570
la573h:
	ld de,ld43eh		;a573
	ld hl,ld034h		;a576
	ld b,008h		;a579
	call sub_a595h		;a57b
	ld bc,00010h		;a57e
	ld de,01400h		;a581
	ld hl,ld4beh		;a584
	jp 0a0dfh		;a587
la58ah:
	dec b			;a58a
	ld b,b			;a58b
	ld c,0b6h		;a58c
	push de			;a58e
	dec b			;a58f
	ret c			;a590
	ld c,0b6h		;a591
	push de			;a593
	rst 38h			;a594
sub_a595h:
	push bc			;a595
	push hl			;a596
	ld l,(hl)			;a597
	ld h,000h		;a598
	add hl,hl			;a59a
	add hl,hl			;a59b
	add hl,hl			;a59c
	push de			;a59d
	ld de,(07db3h)		;a59e
	add hl,de			;a5a2
	ld (07db5h),hl		;a5a3
	pop de			;a5a6
	pop hl			;a5a7
	push hl			;a5a8
	ld l,(hl)			;a5a9
	ld h,000h		;a5aa
	add hl,de			;a5ac
	ld b,h			;a5ad
	ld c,l			;a5ae
	pop hl			;a5af
	inc hl			;a5b0
	push hl			;a5b1
	push de			;a5b2
	ld l,(hl)			;a5b3
	ld h,000h		;a5b4
	add hl,de			;a5b6
	ex de,hl			;a5b7
	call sub_a5c1h		;a5b8
	pop de			;a5bb
	pop hl			;a5bc
	pop bc			;a5bd
	djnz sub_a595h		;a5be
	ret			;a5c0
sub_a5c1h:
	ld a,(07db5h)		;a5c1
	out (0bfh),a		;a5c4
	ld a,(07db6h)		;a5c6
la5c9h:
	or 040h		;a5c9
	out (0bfh),a		;a5cb
	ld a,008h		;a5cd
	ld (07db7h),a		;a5cf
la5d2h:
	push bc			;a5d2
	push de			;a5d3
	ld a,008h		;a5d4
	ld (07db8h),a		;a5d6
la5d9h:
	ld a,(bc)			;a5d9
	ld h,a			;a5da
	inc bc			;a5db
	ld a,(de)			;a5dc
	ld l,a			;a5dd
	inc de			;a5de
	push bc			;a5df
	ld a,(07db7h)		;a5e0
	neg		;a5e3
	add a,009h		;a5e5
	ld b,a			;a5e7
	jr la5ebh		;a5e8
la5eah:
	add hl,hl			;a5ea
la5ebh:
	djnz la5eah		;a5eb
	ld a,h			;a5ed
	out (0beh),a		;a5ee
	pop bc			;a5f0
	ld hl,07db8h		;a5f1
	dec (hl)			;a5f4
	jp nz,la5d9h		;a5f5
	pop de			;a5f8
	pop bc			;a5f9
	ld hl,07db7h		;a5fa
	dec (hl)			;a5fd
	jp nz,la5d2h		;a5fe
la601h:
	ret			;a601
sub_a602h:
	ld ix,0a73eh		;a602
	call sub_a6cch		;a606
	ld hl,la62fh		;a609
	rst 30h			;a60c
	ld ix,la6f7h		;a60d
	call sub_a6cch		;a611
	ld a,(07e26h)		;a614
	or a			;a617
	ret nz			;a618
	ld hl,la6c1h		;a619
la61ch:
	ld a,(hl)			;a61c
	inc a			;a61d
	ret z			;a61e
	dec a			;a61f
	inc hl			;a620
	ld c,(hl)			;a621
	inc hl			;a622
	ld b,(hl)			;a623
	inc hl			;a624
	ld e,(hl)			;a625
	inc hl			;a626
	ld d,(hl)			;a627
	inc hl			;a628
	push hl			;a629
	rst 10h			;a62a
	pop hl			;a62b
	jp la61ch		;a62c
la62fh:
	ld l,(hl)			;a62f
la630h:
	ld d,b			;a630
	nop			;a631
	nop			;a632
la633h:
	jr nz,la633h		;a633
	ld d,b			;a635
	nop			;a636
	ld d,b			;a637
	jr nz,la5c9h		;a638
	ld d,b			;a63a
	nop			;a63b
	and b			;a63c
	jr nz,la630h		;a63d
	ld d,b			;a63f
	nop			;a640
	ret p			;a641
	jr nz,la663h		;a642
	ret nc			;a644
	nop			;a645
	ld b,b			;a646
	ld hl,ld08eh+1		;a647
	nop			;a64a
	djnz la66fh		;a64b
	add a,c			;a64d
	ret nc			;a64e
	nop			;a64f
	ret po			;a650
	ld (ld071h),hl		;a651
	nop			;a654
la655h:
	or b			;a655
	inc hl			;a656
	sub c			;a657
	ex af,af'			;a658
	nop			;a659
	add a,b			;a65a
	inc h			;a65b
	or c			;a65c
	ex af,af'			;a65d
	nop			;a65e
	adc a,b			;a65f
	inc h			;a660
	or c			;a661
	ex af,af'			;a662
la663h:
	nop			;a663
	sub b			;a664
	inc h			;a665
	ld e,008h		;a666
	nop			;a668
	sbc a,b			;a669
	inc h			;a66a
	adc a,(hl)			;a66b
	ex af,af'			;a66c
	nop			;a66d
	and b			;a66e
la66fh:
	inc h			;a66f
	cp 010h		;a670
	nop			;a672
	xor b			;a673
	inc h			;a674
	sbc a,a			;a675
	ex af,af'			;a676
	nop			;a677
	ret z			;a678
	inc h			;a679
	cp a			;a67a
	ex af,af'			;a67b
	nop			;a67c
	ret nc			;a67d
	inc h			;a67e
	ccf			;a67f
	ex af,af'			;a680
	nop			;a681
	ret c			;a682
	inc h			;a683
	rra			;a684
	ex af,af'			;a685
	nop			;a686
	ret po			;a687
	inc h			;a688
	ld e,030h		;a689
	nop			;a68b
	jr nc,la6b3h		;a68c
	cp 010h		;a68e
	nop			;a690
	and b			;a691
	dec h			;a692
	xor 008h		;a693
	nop			;a695
	or b			;a696
	dec h			;a697
	rst 28h			;a698
	ex af,af'			;a699
	nop			;a69a
	cp b			;a69b
	dec h			;a69c
	ld de,00008h		;a69d
	ret nz			;a6a0
	dec h			;a6a1
	ld l,a			;a6a2
	ret po			;a6a3
	nop			;a6a4
	ret z			;a6a5
	dec h			;a6a6
	sbc a,060h		;a6a7
	nop			;a6a9
	ld a,b			;a6aa
	daa			;a6ab
	ld d,c			;a6ac
	ld b,b			;a6ad
	inc b			;a6ae
	nop			;a6af
	jr z,la655h		;a6b0
	nop			;a6b2
la6b3h:
	ld (bc),a			;a6b3
	nop			;a6b4
	ld (010a3h),a		;a6b5
	nop			;a6b8
	nop			;a6b9
	inc (hl)			;a6ba
	ld de,00008h		;a6bb
la6beh:
	ret pe			;a6be
	daa			;a6bf
	rst 38h			;a6c0
la6c1h:
	dec (hl)			;a6c1
	ret nz			;a6c2
	inc bc			;a6c3
	ld b,b			;a6c4
	inc l			;a6c5
	dec (hl)			;a6c6
	nop			;a6c7
	ld (bc),a			;a6c8
	nop			;a6c9
	jr nc,$+1		;a6ca
sub_a6cch:
	ld b,(ix+000h)		;a6cc
	inc b			;a6cf
	ret z			;a6d0
	dec b			;a6d1
	ld e,(ix+001h)		;a6d2
	ld d,(ix+002h)		;a6d5
	ld l,(ix+003h)		;a6d8
	ld h,(ix+004h)		;a6db
la6deh:
	push bc			;a6de
	push hl			;a6df
	push de			;a6e0
	ld bc,00008h		;a6e1
	rst 8			;a6e4
	pop de			;a6e5
	ld hl,00008h		;a6e6
	add hl,de			;a6e9
	ex de,hl			;a6ea
	pop hl			;a6eb
	pop bc			;a6ec
	djnz la6deh		;a6ed
	ld de,00005h		;a6ef
	add ix,de		;a6f2
	jp sub_a6cch		;a6f4
la6f7h:
	jr nc,la739h		;a6f7
	inc l			;a6f9
	ld d,0a7h		;a6fa
	jr z,la6beh		;a6fc
	dec l			;a6fe
	ld e,0a7h		;a6ff
	jr la743h		;a701
	cpl			;a703
	ld h,0a7h		;a704
	ex af,af'			;a706
	nop			;a707
	jr nc,la738h		;a708
	and a			;a70a
	jr la74dh		;a70b
	jr nc,la745h		;a70d
	and a			;a70f
	jr nz,la712h		;a710
la712h:
	ld sp,la72eh		;a712
	rst 38h			;a715
	ld h,l			;a716
	add a,l			;a717
	sub l			;a718
	sub l			;a719
	sub l			;a71a
	add a,l			;a71b
	ld h,l			;a71c
	push de			;a71d
	push af			;a71e
	push af			;a71f
	push af			;a720
	push af			;a721
	push af			;a722
	push af			;a723
	push af			;a724
	push af			;a725
	ld (hl),l			;a726
	ld (hl),l			;a727
	ld (hl),l			;a728
	ld (hl),l			;a729
	ld (hl),l			;a72a
	ld (hl),l			;a72b
	ld (hl),l			;a72c
	ld (hl),l			;a72d
la72eh:
	dec d			;a72e
	call nc,0626ch		;a72f
	ld h,d			;a732
	add a,e			;a733
	add a,e			;a734
	sbc a,(hl)			;a735
	ld (hl),l			;a736
	ld (hl),h			;a737
la738h:
	ld a,h			;a738
la739h:
	ld (hl),d			;a739
	ld (hl),d			;a73a
	ld (hl),e			;a73b
	ld (hl),e			;a73c
	ld e,008h		;a73d
	ld h,b			;a73f
	dec h			;a740
	res 4,a		;a741
la743h:
	inc b			;a743
	ret pe			;a744
la745h:
	inc h			;a745
	out (0a7h),a		;a746
	inc b			;a748
	ex af,af'			;a749
	dec h			;a74a
	in a,(0a7h)		;a74b
la74dh:
	ld (bc),a			;a74d
	jr z,la787h		;a74e
	ex (sp),hl			;a750
	and a			;a751
	ld (bc),a			;a752
	jr c,la78ch		;a753
	ex de,hl			;a755
	and a			;a756
	ld (bc),a			;a757
	ld c,b			;a758
	scf			;a759
	ex (sp),hl			;a75a
	and a			;a75b
	ld (bc),a			;a75c
	ld e,b			;a75d
	scf			;a75e
	ex de,hl			;a75f
	and a			;a760
	ld (bc),a			;a761
	ld l,b			;a762
	scf			;a763
	ex (sp),hl			;a764
	and a			;a765
	ld (bc),a			;a766
	ld a,b			;a767
	scf			;a768
	ex de,hl			;a769
	and a			;a76a
	inc bc			;a76b
	ret m			;a76c
	ld (hl),0e3h		;a76d
	and a			;a76f
	inc bc			;a770
	djnz $+57		;a771
	ex de,hl			;a773
	and a			;a774
	ld bc,03698h		;a775
	di			;a778
	and a			;a779
	ld bc,036a0h		;a77a
	ei			;a77d
	and a			;a77e
	ld (bc),a			;a77f
	xor b			;a780
	ld (hl),003h		;a781
	xor b			;a783
	ld bc,036b8h		;a784
la787h:
	di			;a787
	and a			;a788
	ld bc,036c0h		;a789
la78ch:
	ei			;a78c
	and a			;a78d
	ld (bc),a			;a78e
	ret z			;a78f
	ld (hl),003h		;a790
	xor b			;a792
	ld bc,036d8h		;a793
	di			;a796
	and a			;a797
	ld bc,036e0h		;a798
	ei			;a79b
	and a			;a79c
	ld (bc),a			;a79d
	ret pe			;a79e
	ld (hl),003h		;a79f
	xor b			;a7a1
	ld (bc),a			;a7a2
	ld e,b			;a7a3
	ld (hl),00bh		;a7a4
	xor b			;a7a6
	ld (bc),a			;a7a7
	ld l,b			;a7a8
	ld (hl),013h		;a7a9
	xor b			;a7ab
	ld (bc),a			;a7ac
	ld a,b			;a7ad
	ld (hl),00bh		;a7ae
	xor b			;a7b0
	ld (bc),a			;a7b1
	adc a,b			;a7b2
	ld (hl),013h		;a7b3
	xor b			;a7b5
	ld (bc),a			;a7b6
	jr la7efh		;a7b7
	dec de			;a7b9
	xor b			;a7ba
	inc b			;a7bb
	ret m			;a7bc
	dec (hl)			;a7bd
	inc hl			;a7be
	xor b			;a7bf
	ld b,0c8h		;a7c0
	dec (hl)			;a7c2
	dec hl			;a7c3
	xor b			;a7c4
	inc b			;a7c5
	xor b			;a7c6
	dec (hl)			;a7c7
	dec hl			;a7c8
	xor b			;a7c9
	rst 38h			;a7ca
	adc a,(hl)			;a7cb
	add a,a			;a7cc
	add a,a			;a7cd
	add a,a			;a7ce
	add a,a			;a7cf
	add a,a			;a7d0
	adc a,(hl)			;a7d1
	adc a,(hl)			;a7d2
	ld e,01eh		;a7d3
	ld e,01eh		;a7d5
	ld e,01eh		;a7d7
	ld e,0deh		;a7d9
	sbc a,0feh		;a7db
	ld e,01eh		;a7dd
	ld e,01eh		;a7df
	ld e,01eh		;a7e1
	ld h,e			;a7e3
	ld h,e			;a7e4
	ld h,e			;a7e5
	ld h,e			;a7e6
	ld h,e			;a7e7
	ld h,e			;a7e8
	ld h,e			;a7e9
	ld h,e			;a7ea
	ld h,e			;a7eb
	and e			;a7ec
	and e			;a7ed
	and e			;a7ee
la7efh:
	and e			;a7ef
	and e			;a7f0
	and e			;a7f1
	and e			;a7f2
	out (0d3h),a		;a7f3
	out (0d3h),a		;a7f5
	out (033h),a		;a7f7
	add a,e			;a7f9
	add a,e			;a7fa
	out (0d3h),a		;a7fb
	out (0d3h),a		;a7fd
	out (033h),a		;a7ff
	di			;a801
	di			;a802
	inc de			;a803
	and e			;a804
	and e			;a805
	and e			;a806
	and e			;a807
	and e			;a808
	and e			;a809
	and e			;a80a
	di			;a80b
	add a,e			;a80c
	or e			;a80d
	ex (sp),hl			;a80e
	di			;a80f
	inc de			;a810
	inc de			;a811
	inc de			;a812
	inc de			;a813
	and e			;a814
	and e			;a815
	and e			;a816
	and e			;a817
	and e			;a818
	and e			;a819
	and e			;a81a
	inc sp			;a81b
	inc de			;a81c
	inc sp			;a81d
	inc sp			;a81e
	inc sp			;a81f
	inc sp			;a820
	ex (sp),hl			;a821
	ex (sp),hl			;a822
	di			;a823
	ex (sp),hl			;a824
	di			;a825
	ex (sp),hl			;a826
	di			;a827
	sub e			;a828
	ld h,e			;a829
	inc de			;a82a
	and e			;a82b
	and e			;a82c
	and e			;a82d
	and e			;a82e
	and e			;a82f
	and e			;a830
	and e			;a831
	and e			;a832
la833h:
	ld c,(hl)			;a833
	inc hl			;a834
	ld a,(hl)			;a835
	ld b,a			;a836
	or c			;a837
	ret z			;a838
	inc hl			;a839
	ld e,(hl)			;a83a
	inc hl			;a83b
	ld d,(hl)			;a83c
	inc hl			;a83d
	push hl			;a83e
	pop ix		;a83f
	ld l,(ix+000h)		;a841
	ld h,(ix+001h)		;a844
	rst 8			;a847
	push ix		;a848
	pop hl			;a84a
	inc hl			;a84b
	inc hl			;a84c
	jp la833h		;a84d
la850h:
	ld d,b			;a850
	nop			;a851
	nop			;a852
	nop			;a853
	ld a,0d0h		;a854
	ld d,b			;a856
	nop			;a857
	ld d,b			;a858
	nop			;a859
	ld a,0d0h		;a85a
	ld d,b			;a85c
	nop			;a85d
	and b			;a85e
	nop			;a85f
	ld a,0d0h		;a860
	ld d,b			;a862
	nop			;a863
	ret p			;a864
	nop			;a865
	dec a			;a866
	ret nc			;a867
	ret nc			;a868
	nop			;a869
	ld b,b			;a86a
	ld bc,ld08dh		;a86b
	ret nc			;a86e
	nop			;a86f
	djnz la874h		;a870
	adc a,l			;a872
	ret nc			;a873
la874h:
	ret nc			;a874
	nop			;a875
	ret po			;a876
	ld (bc),a			;a877
	adc a,l			;a878
	ret nc			;a879
	ret nc			;a87a
	nop			;a87b
	or b			;a87c
	inc bc			;a87d
	adc a,(hl)			;a87e
	ret nc			;a87f
	jr z,la882h		;a880
la882h:
	add a,b			;a882
	inc b			;a883
	ld e,(hl)			;a884
	pop de			;a885
	jr nz,la888h		;a886
la888h:
	xor b			;a888
	inc b			;a889
	add a,(hl)			;a88a
	pop de			;a88b
	ex af,af'			;a88c
	nop			;a88d
	ret z			;a88e
	inc b			;a88f
	sub (hl)			;a890
	pop de			;a891
	ex af,af'			;a892
	nop			;a893
	ret nc			;a894
	inc b			;a895
	sub (hl)			;a896
	pop de			;a897
	ex af,af'			;a898
	nop			;a899
	ret c			;a89a
	inc b			;a89b
	sub (hl)			;a89c
	pop de			;a89d
	ex af,af'			;a89e
	nop			;a89f
	ret po			;a8a0
	inc b			;a8a1
	sub (hl)			;a8a2
	pop de			;a8a3
	ld b,b			;a8a4
	nop			;a8a5
	ret pe			;a8a6
	inc b			;a8a7
	sbc a,(hl)			;a8a8
	pop de			;a8a9
	jr nc,la8ach		;a8aa
la8ach:
	jr nc,la8b3h		;a8ac
	sbc a,0d1h		;a8ae
	ld b,b			;a8b0
	nop			;a8b1
	ld h,b			;a8b2
la8b3h:
	dec b			;a8b3
	ld c,0d2h		;a8b4
	djnz la8b8h		;a8b6
la8b8h:
	and b			;a8b8
	dec b			;a8b9
	ld d,(hl)			;a8ba
	jp nc,00018h		;a8bb
	or b			;a8be
	dec b			;a8bf
	or (hl)			;a8c0
	push de			;a8c1
	ld b,b			;a8c2
	nop			;a8c3
	ret z			;a8c4
	dec b			;a8c5
	ld h,(hl)			;a8c6
	jp nc,000a0h		;a8c7
	ex af,af'			;a8ca
	ld b,0a2h		;a8cb
	jp nc,00030h		;a8cd
	ld a,b			;a8d0
	rlca			;a8d1
	xor d			;a8d2
la8d3h:
	jp nc,00030h		;a8d3
	xor b			;a8d6
	rlca			;a8d7
	jp m,008d2h		;a8d8
	nop			;a8db
	ret pe			;a8dc
	rlca			;a8dd
	or (hl)			;a8de
	push de			;a8df
	nop			;a8e0
	nop			;a8e1
sub_a8e2h:
	ld hl,la951h+1		;a8e2
	push hl			;a8e5
la8e6h:
	call sub_a962h		;a8e6
	push hl			;a8e9
	ld a,(07db9h)		;a8ea
	ld h,d			;a8ed
	rlca			;a8ee
	rlca			;a8ef
	rlca			;a8f0
	and 006h		;a8f1
	ld l,a			;a8f3
	ld de,la94ah		;a8f4
	add hl,de			;a8f7
	ld a,(hl)			;a8f8
	inc hl			;a8f9
	ld h,(hl)			;a8fa
	ld l,a			;a8fb
	pop de			;a8fc
	add hl,de			;a8fd
	ld a,(07db9h)		;a8fe
	and 007h		;a901
	ld e,a			;a903
	ld d,000h		;a904
	add hl,de			;a906
	ld (07dbbh),hl		;a907
	ld a,(07dbah)		;a90a
	and 007h		;a90d
	ld e,a			;a90f
	ld d,000h		;a910
	call sub_a118h		;a912
	pop hl			;a915
	add hl,de			;a916
	and (hl)			;a917
	ret z			;a918
	scf			;a919
	ret			;a91a
sub_a91bh:
	call sub_a8e2h		;a91b
	jr nc,la929h		;a91e
	ld a,(07dbdh)		;a920
	cp 0f1h		;a923
	ret c			;a925
	ld a,001h		;a926
	ret			;a928
la929h:
	ld b,004h		;a929
la92bh:
	ld hl,(07dbbh)		;a92b
	inc hl			;a92e
	ld (07dbbh),hl		;a92f
	call sub_a118h		;a932
	ld hl,la951h+1		;a935
	and (hl)			;a938
	jp nz,la93eh		;a939
	djnz la92bh		;a93c
la93eh:
	ld a,004h		;a93e
	sub b			;a940
	or a			;a941
	ret			;a942
sub_a943h:
	ld hl,0a95ah		;a943
	push hl			;a946
	jp la8e6h		;a947
la94ah:
	nop			;a94a
	nop			;a94b
	nop			;a94c
	ex af,af'			;a94d
	nop			;a94e
	djnz la951h		;a94f
la951h:
	djnz la8d3h		;a951
	ld b,b			;a953
	jr nz,la966h		;a954
	ex af,af'			;a956
	inc b			;a957
	ld (bc),a			;a958
	ld bc,060c0h		;a959
	jr nc,la976h		;a95c
	inc c			;a95e
	ld b,003h		;a95f
	add a,e			;a961
sub_a962h:
	call sub_a96ch		;a962
	ld l,a			;a965
la966h:
	ld h,000h		;a966
	add hl,hl			;a968
	add hl,hl			;a969
	add hl,hl			;a96a
	ret			;a96b
sub_a96ch:
	ld hl,03800h		;a96c
	ld a,(ix+000h)		;a96f
	add a,b			;a972
	ld (07db9h),a		;a973
la976h:
	ld d,000h		;a976
	and 0f8h		;a978
	add a,a			;a97a
	rl d		;a97b
	add a,a			;a97d
	rl d		;a97e
	ld e,a			;a980
	add hl,de			;a981
	ld a,(ix+001h)		;a982
	add a,c			;a985
	ld (07dbah),a		;a986
	rrca			;a989
	rrca			;a98a
	rrca			;a98b
	and 01fh		;a98c
	ld e,a			;a98e
	ld d,000h		;a98f
	add hl,de			;a991
	call sub_a118h		;a992
	ld (07dbdh),a		;a995
	ret			;a998
sub_a999h:
	ld bc,00800h		;a999
	ld de,01800h		;a99c
	ld hl,ld606h		;a99f
	jp 0a0dfh		;a9a2
sub_a9a5h:
	ld de,07c80h		;a9a5
	ld hl,laa0ah		;a9a8
	ld bc,00004h		;a9ab
	ldir		;a9ae
	ld hl,07c80h		;a9b0
	ld bc,0007ch		;a9b3
	ldir		;a9b6
	ld hl,07c80h		;a9b8
	ld a,017h		;a9bb
	ld de,00004h		;a9bd
	ld b,004h		;a9c0
la9c2h:
	ld (hl),a			;a9c2
	add hl,de			;a9c3
	djnz la9c2h		;a9c4
	ld hl,07ceah		;a9c6
	ld a,034h		;a9c9
	ld c,009h		;a9cb
	ld b,003h		;a9cd
la9cfh:
	ld (hl),a			;a9cf
	inc hl			;a9d0
	ld (hl),c			;a9d1
	inc hl			;a9d2
	inc hl			;a9d3
	inc hl			;a9d4
	djnz la9cfh		;a9d5
	ld (hl),03ch		;a9d7
	inc hl			;a9d9
	ld (hl),008h		;a9da
	ld hl,07cc2h		;a9dc
	ld a,024h		;a9df
	ld c,006h		;a9e1
	ld b,003h		;a9e3
la9e5h:
	ld (hl),a			;a9e5
	inc hl			;a9e6
	ld (hl),c			;a9e7
	inc hl			;a9e8
	inc hl			;a9e9
	inc hl			;a9ea
	djnz la9e5h		;a9eb
	ld a,028h		;a9ed
	ld c,00bh		;a9ef
	ld b,003h		;a9f1
la9f3h:
	ld (hl),a			;a9f3
	inc hl			;a9f4
	ld (hl),c			;a9f5
	inc hl			;a9f6
	inc hl			;a9f7
	inc hl			;a9f8
	djnz la9f3h		;a9f9
	ld a,018h		;a9fb
	ld c,00fh		;a9fd
	ld b,003h		;a9ff
laa01h:
	ld (hl),a			;aa01
	inc hl			;aa02
	ld (hl),c			;aa03
	inc hl			;aa04
	inc hl			;aa05
	inc hl			;aa06
	djnz laa01h		;aa07
	ret			;aa09
laa0ah:
	pop de			;aa0a
	nop			;aa0b
	or b			;aa0c
	nop			;aa0d
sub_aa0eh:
	sub a			;aa0e
	ld (07d85h),a		;aa0f
	ld (07d86h),a		;aa12
	ld (07d8ah),a		;aa15
	ld (07d8dh),a		;aa18
	ld (07dabh),a		;aa1b
	ld (07dach),a		;aa1e
	ld (07dadh),a		;aa21
	ld (07d8bh),a		;aa24
	ld (07d93h),a		;aa27
	ld (07d94h),a		;aa2a
	ld (07d95h),a		;aa2d
	ld (07d96h),a		;aa30
	ld (07d97h),a		;aa33
	ld (07d98h),a		;aa36
	ld (07d99h),a		;aa39
	ld (07e09h),a		;aa3c
	ld (07e0bh),a		;aa3f
	ld (07e64h),a		;aa42
	ld (07ea8h),a		;aa45
	ld hl,00000h		;aa48
	ld (07da9h),hl		;aa4b
	inc a			;aa4e
	ld (07daeh),a		;aa4f
	ld (07dafh),a		;aa52
	ld (07db0h),a		;aa55
	ld (07db1h),a		;aa58
	ld (07deeh),a		;aa5b
	sub a			;aa5e
	ld (07e68h),a		;aa5f
	ld (07e69h),a		;aa62
	ld (07e6ah),a		;aa65
	ld (07e6bh),a		;aa68
	ld (07e6ch),a		;aa6b
	ld (07e6dh),a		;aa6e
	ld (07e6eh),a		;aa71
	inc a			;aa74
	ld (07e6fh),a		;aa75
	ld hl,07d04h		;aa78
	ld (07e70h),hl		;aa7b
	ld (07e72h),a		;aa7e
	ld hl,07cc0h		;aa81
	ld (07e66h),hl		;aa84
	ld a,03fh		;aa87
	ld (07e74h),a		;aa89
	ld hl,0388ch		;aa8c
	ld (07e62h),hl		;aa8f
	ld a,07fh		;aa92
	ld (07d8ch),a		;aa94
	ld hl,(07d8fh)		;aa97
	ld a,h			;aa9a
	or l			;aa9b
	jr nz,laaa7h		;aa9c
	ld a,r		;aa9e
	or a			;aaa0
	jr nz,laaa4h		;aaa1
	inc a			;aaa3
laaa4h:
	ld (07d8fh),a		;aaa4
laaa7h:
	ld a,03ch		;aaa7
	ld (07d8eh),a		;aaa9
	ret			;aaac
sub_aaadh:
	ld bc,0001bh		;aaad
	ld de,07e0ch		;aab0
	ld hl,laac5h		;aab3
	push bc			;aab6
	push hl			;aab7
	ldir		;aab8
	pop hl			;aaba
	pop bc			;aabb
	push bc			;aabc
	push hl			;aabd
	ldir		;aabe
	pop hl			;aac0
	pop bc			;aac1
	ldir		;aac2
	ret			;aac4
laac5h:
	nop			;aac5
	nop			;aac6
	nop			;aac7
	nop			;aac8
	nop			;aac9
	nop			;aaca
	nop			;aacb
	nop			;aacc
	nop			;aacd
	nop			;aace
	ld bc,00400h		;aacf
	nop			;aad2
	nop			;aad3
	nop			;aad4
	nop			;aad5
	nop			;aad6
	or (hl)			;aad7
	adc a,e			;aad8
	nop			;aad9
	nop			;aada
	nop			;aadb
	nop			;aadc
	or a			;aadd
	adc a,e			;aade
	nop			;aadf
sub_aae0h:
	ld bc,0000dh		;aae0
	ld de,07e0ch		;aae3
	ld hl,laac5h		;aae6
	push bc			;aae9
	push hl			;aaea
	ldir		;aaeb
	pop hl			;aaed
	pop bc			;aaee
	push bc			;aaef
	push hl			;aaf0
	ld de,07e27h		;aaf1
	ldir		;aaf4
	pop hl			;aaf6
	pop bc			;aaf7
	ld de,07e42h		;aaf8
	ldir		;aafb
	ret			;aafd
sub_aafeh:
	ld hl,l9bbfh		;aafe
	ld de,07defh		;ab01
	ld bc,0001ah		;ab04
	ldir		;ab07
	ld hl,ld5b6h		;ab09
	ld de,07e75h		;ab0c
	ld bc,00004h		;ab0f
	ldir		;ab12
	ld a,001h		;ab14
	ld (de),a			;ab16
	ret			;ab17
sub_ab18h:
	ld bc,00010h		;ab18
	ld de,07c00h		;ab1b
	ld hl,lab35h		;ab1e
	ldir		;ab21
	ld hl,07a45h		;ab23
	ld (07da7h),hl		;ab26
	ld hl,lab45h		;ab29
	ld de,07c94h		;ab2c
	ld bc,0000ch		;ab2f
	ldir		;ab32
	ret			;ab34
lab35h:
	sbc a,b			;ab35
	ld c,b			;ab36
	nop			;ab37
	dec e			;ab38
	nop			;ab39
	nop			;ab3a
	nop			;ab3b
	nop			;ab3c
	nop			;ab3d
	nop			;ab3e
	nop			;ab3f
	nop			;ab40
	nop			;ab41
	ld bc,00000h		;ab42
lab45h:
	sbc a,d			;ab45
	ld b,a			;ab46
	nop			;ab47
	ld bc,0519ah		;ab48
	inc b			;ab4b
	ld bc,05a9ah		;ab4c
	inc c			;ab4f
	ld bc,lc5f5h		;ab50
	push de			;ab53
	push hl			;ab54
	call sub_ac18h		;ab55
	call sub_c66ch		;ab58
	ld hl,(07d85h)		;ab5b
	inc hl			;ab5e
	ld (07d85h),hl		;ab5f
	ld a,0ffh		;ab62
	ld (07d8ah),a		;ab64
	in a,(0bfh)		;ab67
	pop hl			;ab69
	pop de			;ab6a
	pop bc			;ab6b
	pop af			;ab6c
	retn		;ab6d
sub_ab6fh:
	push af			;ab6f
	sub a			;ab70
	ld (07d88h),a		;ab71
	ld a,(07d8ah)		;ab74
	inc a			;ab77
	jr nz,lab83h		;ab78
	ld (07d8ah),a		;ab7a
	dec a			;ab7d
	ld (07d88h),a		;ab7e
	pop af			;ab81
	ret			;ab82
lab83h:
	ld a,(07d8ah)		;ab83
	inc a			;ab86
	jr nz,lab83h		;ab87
	ld (07d8ah),a		;ab89
	pop af			;ab8c
	ret			;ab8d
lab8eh:
	push af			;ab8e
	push bc			;ab8f
	push de			;ab90
	push hl			;ab91
	sub a			;ab92
	ld (07d88h),a		;ab93
	ld a,(07d8ah)		;ab96
	inc a			;ab99
	jr nz,laba5h		;ab9a
	ld (07d8ah),a		;ab9c
	dec a			;ab9f
	ld (07d88h),a		;aba0
	jr lac05h		;aba3
laba5h:
	ld bc,004b0h		;aba5
laba8h:
	ld a,(07d8ah)		;aba8
	inc a			;abab
	jr z,labbeh		;abac
	dec bc			;abae
	ld a,b			;abaf
	or c			;abb0
	jr nz,laba8h		;abb1
	in a,(0bfh)		;abb3
	call sub_9fedh		;abb5
	ld a,0ffh		;abb8
	ld (07d88h),a		;abba
	inc a			;abbd
labbeh:
	ld (07d8ah),a		;abbe
	ld a,(07d95h)		;abc1
	cp 086h		;abc4
	jr nz,labd1h		;abc6
	call sub_ac0ah		;abc8
	ld sp,07fffh		;abcb
	jp l8052h		;abce
labd1h:
	cp 089h		;abd1
	jr nz,lac05h		;abd3
	call sub_ac0ah		;abd5
	ld hl,00000h		;abd8
	ld (07d85h),hl		;abdb
	ld hl,07d89h		;abde
	ld b,(hl)			;abe1
	ld (hl),001h		;abe2
	rst 18h			;abe4
	ld (hl),b			;abe5
labe6h:
	call sub_ab6fh		;abe6
	ld hl,(07d85h)		;abe9
	ld de,l8ca0h		;abec
	or a			;abef
	sbc hl,de		;abf0
	call z,sub_9fb2h		;abf2
	call sub_9fedh		;abf5
	ld a,(07d95h)		;abf8
	cp 089h		;abfb
	jr nz,labe6h		;abfd
	call sub_ac0ah		;abff
	call sub_9fc4h		;ac02
lac05h:
	pop hl			;ac05
	pop de			;ac06
	pop bc			;ac07
lac08h:
	pop af			;ac08
	ret			;ac09
sub_ac0ah:
	ld hl,07d95h		;ac0a
	ld b,003h		;ac0d
lac0fh:
	call sub_ab6fh		;ac0f
	cp (hl)			;ac12
	jr z,sub_ac0ah		;ac13
	djnz lac0fh		;ac15
	ret			;ac17
sub_ac18h:
	out (0c0h),a		;ac18
	ld a,(07d91h)		;ac1a
	add a,a			;ac1d
	add a,0fch		;ac1e
	ld c,a			;ac20
	in a,(c)		;ac21
	push bc			;ac23
	cpl			;ac24
	ld d,a			;ac25
	ld (07d97h),a		;ac26
	and 001h		;ac29
	ld b,a			;ac2b
	ld a,(07d95h)		;ac2c
	and 040h		;ac2f
	jr z,lac35h		;ac31
	set 0,b		;ac33
lac35h:
	ld a,(07c03h)		;ac35
	and 010h		;ac38
	jr z,lac58h		;ac3a
	ld hl,07d98h		;ac3c
	sub a			;ac3f
	or (hl)			;ac40
	jr nz,lac58h		;ac41
	ld a,(07d94h)		;ac43
	or a			;ac46
	jr nz,lac4ch		;ac47
	ld (hl),b			;ac49
	jr lac58h		;ac4a
lac4ch:
	ld c,a			;ac4c
	sub a			;ac4d
	or b			;ac4e
	ld a,001h		;ac4f
	jr nz,lac55h		;ac51
	ld a,c			;ac53
	dec a			;ac54
lac55h:
	ld (07d94h),a		;ac55
lac58h:
	out (080h),a		;ac58
	ld hl,07d96h		;ac5a
	push af			;ac5d
	pop af			;ac5e
	pop bc			;ac5f
	in a,(c)		;ac60
	cpl			;ac62
	ld (07d95h),a		;ac63
	ld b,d			;ac66
	ld a,(hl)			;ac67
	or a			;ac68
	ret nz			;ac69
	ld a,(07d93h)		;ac6a
	or a			;ac6d
	jr z,lac83h		;ac6e
	ld a,b			;ac70
	and 040h		;ac71
	jr nz,lac7dh		;ac73
	ld a,(07d93h)		;ac75
	dec a			;ac78
	ld (07d93h),a		;ac79
	ret			;ac7c
lac7dh:
	ld a,002h		;ac7d
	ld (07d93h),a		;ac7f
	ret			;ac82
lac83h:
	ld a,b			;ac83
	and 040h		;ac84
	ld (hl),a			;ac86
	ret			;ac87
sub_ac88h:
	ld hl,(07d8fh)		;ac88
	ld a,h			;ac8b
	add hl,hl			;ac8c
	and 0b4h		;ac8d
	jp pe,lac93h		;ac8f
	inc l			;ac92
lac93h:
	ld (07d8fh),hl		;ac93
	ret			;ac96
sub_ac97h:
	push bc			;ac97
	push af			;ac98
	push de			;ac99
	push hl			;ac9a
	rst 38h			;ac9b
	rst 20h			;ac9c
	ld bc,00005h		;ac9d
	call sub_acbbh		;aca0
	rst 18h			;aca3
	pop hl			;aca4
	pop de			;aca5
	pop af			;aca6
	pop bc			;aca7
	djnz sub_ac97h		;aca8
	ret			;acaa
sub_acabh:
	push af			;acab
	push de			;acac
lacadh:
	push bc			;acad
	push hl			;acae
	ld de,lacb4h		;acaf
	push de			;acb2
	jp (hl)			;acb3
lacb4h:
	pop hl			;acb4
	pop bc			;acb5
	djnz lacadh		;acb6
	pop de			;acb8
	pop af			;acb9
	ret			;acba
sub_acbbh:
	push bc			;acbb
	ld b,000h		;acbc
lacbeh:
	djnz lacbeh		;acbe
	pop bc			;acc0
	dec bc			;acc1
	ld a,b			;acc2
	or c			;acc3
	jr nz,sub_acbbh		;acc4
	ret			;acc6
sub_acc7h:
	sub a			;acc7
	ld (07ea4h),a		;acc8
	ld (07ea5h),a		;accb
	ld a,(07d85h)		;acce
	and 007h		;acd1
	ld (07ea6h),a		;acd3
	ld a,b			;acd6
	jp lc629h		;acd7
sub_acdah:
	ld hl,07ea4h		;acda
	ld c,002h		;acdd
	call sub_acffh		;acdf
	ld hl,07ea5h		;ace2
	ld c,003h		;ace5
	call sub_acffh		;ace7
	ld hl,07ea7h		;acea
	sub a			;aced
	or (hl)			;acee
	ret z			;acef
	and 080h		;acf0
	ret nz			;acf2
	dec (hl)			;acf3
	ret nz			;acf4
	ld a,006h		;acf5
	push hl			;acf7
	call lc629h		;acf8
	pop hl			;acfb
	ret c			;acfc
	inc (hl)			;acfd
	ret			;acfe
sub_acffh:
	sub a			;acff
	or (hl)			;ad00
lad01h:
	ret z			;ad01
	and 080h		;ad02
	jr nz,lad08h		;ad04
	dec (hl)			;ad06
	ret nz			;ad07
lad08h:
	ld (hl),080h		;ad08
	ld a,(07d85h)		;ad0a
	and 007h		;ad0d
	ld b,a			;ad0f
	ld a,(07ea6h)		;ad10
	sub b			;ad13
	ret nz			;ad14
	ld (hl),a			;ad15
	ld a,c			;ad16
	jp lc629h		;ad17
lad1ah:
	ld a,008h		;ad1a
	call lc629h		;ad1c
	ret nc			;ad1f
	ld a,014h		;ad20
	ld (07ea4h),a		;ad22
	ld a,009h		;ad25
	call lc629h		;ad27
	ret nc			;ad2a
	ld hl,07ea7h		;ad2b
	ld a,(hl)			;ad2e
	and 080h		;ad2f
	or 014h		;ad31
	ld (hl),a			;ad33
	ret			;ad34
sub_ad35h:
	ld a,00ah		;ad35
	call lc629h		;ad37
	ret nc			;ad3a
	ld a,014h		;ad3b
	ld (07ea4h),a		;ad3d
	ld a,00bh		;ad40
	call lc629h		;ad42
	ret nc			;ad45
	ld hl,07ea7h		;ad46
	ld a,(hl)			;ad49
	and 080h		;ad4a
	or 012h		;ad4c
	ld (hl),a			;ad4e
	ret			;ad4f
sub_ad50h:
	ld hl,07c10h		;ad50
	sub a			;ad53
	ld (hl),a			;ad54
	ld e,l			;ad55
	ld d,h			;ad56
	inc de			;ad57
	ld bc,0006fh		;ad58
	ldir		;ad5b
	ret			;ad5d
sub_ad5eh:
	ld l,(ix+006h)		;ad5e
	ld h,(ix+007h)		;ad61
	jp (hl)			;ad64
sub_ad65h:
	ld de,00008h		;ad65
lad68h:
	bit 6,(ix+004h)		;ad68
	jr z,lad74h		;ad6c
	add ix,de		;ad6e
	djnz lad68h		;ad70
	or a			;ad72
	ret			;ad73
lad74h:
	scf			;ad74
	ret			;ad75
sub_ad76h:
	ld iy,07c10h		;ad76
	ld de,00008h		;ad7a
	ld b,00eh		;ad7d
lad7fh:
	bit 6,(iy+004h)		;ad7f
	jr z,lad90h		;ad83
	ld c,(iy+005h)		;ad85
	cp c			;ad88
	jr z,lad96h		;ad89
	dec a			;ad8b
	cp c			;ad8c
	jr z,lad96h		;ad8d
	inc a			;ad8f
lad90h:
	add iy,de		;ad90
	djnz lad7fh		;ad92
	or a			;ad94
	ret			;ad95
lad96h:
	scf			;ad96
	ret			;ad97
	ld ix,07c18h		;ad98
	ld b,003h		;ad9c
	call sub_ad65h		;ad9e
	ret nc			;ada1
	push ix		;ada2
	pop de			;ada4
	ld a,b			;ada5
	ld hl,ladb7h		;ada6
	ld bc,00008h		;ada9
	ldir		;adac
	dec a			;adae
	add a,a			;adaf
	add a,a			;adb0
	add a,0e5h		;adb1
	ld (ix+005h),a		;adb3
	ret			;adb6
ladb7h:
	and b			;adb7
	rst 30h			;adb8
	nop			;adb9
	nop			;adba
	ld b,c			;adbb
	nop			;adbc
	or b			;adbd
	xor a			;adbe
	ld ix,07c58h		;adbf
	bit 6,(ix+004h)		;adc3
	ret nz			;adc7
	push ix		;adc8
	pop de			;adca
	ld hl,ladd4h		;adcb
	ld bc,00008h		;adce
	ldir		;add1
	ret			;add3
ladd4h:
	and b			;add4
	rst 30h			;add5
	nop			;add6
	nop			;add7
	ld b,d			;add8
	rst 18h			;add9
	ld l,l			;adda
laddbh:
	or b			;addb
	ld ix,07c40h		;addc
	ld b,003h		;ade0
	call sub_ad65h		;ade2
	ret nc			;ade5
	push ix		;ade6
	pop de			;ade8
	ld a,b			;ade9
	ld hl,ladfbh		;adea
	ld bc,00008h		;aded
	ldir		;adf0
	dec a			;adf2
	add a,a			;adf3
	add a,a			;adf4
	add a,0d3h		;adf5
	ld (ix+005h),a		;adf7
	ret			;adfa
ladfbh:
	and b			;adfb
	rst 30h			;adfc
	nop			;adfd
	nop			;adfe
	ld b,e			;adff
	nop			;ae00
	ld (lddb1h),a		;ae01
	ld hl,07c30h		;ae04
	ld b,002h		;ae07
	call sub_ad65h		;ae09
	ret nc			;ae0c
	push ix		;ae0d
	pop de			;ae0f
	ld a,b			;ae10
	ld hl,lae22h		;ae11
	ld bc,00008h		;ae14
	ldir		;ae17
	dec a			;ae19
	add a,a			;ae1a
	add a,a			;ae1b
	add a,0cbh		;ae1c
	ld (ix+005h),a		;ae1e
	ret			;ae21
lae22h:
	and b			;ae22
	rst 30h			;ae23
	nop			;ae24
	nop			;ae25
	ld b,h			;ae26
	nop			;ae27
	jr c,laddbh		;ae28
sub_ae2ah:
	ld a,(07d85h)		;ae2a
	ld b,a			;ae2d
	ld a,(07e74h)		;ae2e
	and b			;ae31
	ret nz			;ae32
	ld ix,07c10h		;ae33
	ld b,001h		;ae37
	call sub_ad65h		;ae39
	ret nc			;ae3c
	ld iy,07c30h		;ae3d
	ld b,002h		;ae41
	ld de,00008h		;ae43
	ld a,(07c01h)		;ae46
	add a,018h		;ae49
	ld c,a			;ae4b
lae4ch:
	bit 6,(iy+004h)		;ae4c
	jr z,lae5ch		;ae50
	ld a,(iy+001h)		;ae52
	cp 0d0h		;ae55
	jr nc,lae5ch		;ae57
	cp c			;ae59
	jr nc,lae61h		;ae5a
lae5ch:
	add iy,de		;ae5c
	djnz lae4ch		;ae5e
	ret			;ae60
lae61h:
	push ix		;ae61
	pop de			;ae63
	ld hl,lae70h		;ae64
	ld bc,00008h		;ae67
	ldir		;ae6a
	ld (ix+001h),a		;ae6c
	ret			;ae6f
lae70h:
	and b			;ae70
	rst 30h			;ae71
	nop			;ae72
	rst 38h			;ae73
	ld b,l			;ae74
	jp lb13eh		;ae75
	ld de,07c60h		;ae78
	ld hl,00004h		;ae7b
	add hl,de			;ae7e
	bit 6,(hl)		;ae7f
	ret nz			;ae81
	ld hl,lae94h		;ae82
	ld bc,00008h		;ae85
	ldir		;ae88
	ld a,07fh		;ae8a
	ld (07ea5h),a		;ae8c
	ld a,084h		;ae8f
	jp lc629h		;ae91
lae94h:
	and b			;ae94
	ex af,af'			;ae95
	nop			;ae96
	nop			;ae97
	ld b,(hl)			;ae98
	cp a			;ae99
	sub c			;ae9a
	or c			;ae9b
sub_ae9ch:
	ld ix,07c68h		;ae9c
	ld b,002h		;aea0
	call sub_ad65h		;aea2
	ret nc			;aea5
	push ix		;aea6
	pop de			;aea8
	ld a,b			;aea9
	ld hl,laec3h		;aeaa
	ld bc,00008h		;aead
	ldir		;aeb0
	dec a			;aeb2
	ld b,a			;aeb3
	add a,a			;aeb4
	add a,b			;aeb5
	add a,0b9h		;aeb6
	ld (ix+005h),a		;aeb8
	ld a,(07dcch)		;aebb
	ld (ix+001h),a		;aebe
	scf			;aec1
	ret			;aec2
laec3h:
	xor b			;aec3
	nop			;aec4
	nop			;aec5
	nop			;aec6
	ld b,a			;aec7
	nop			;aec8
	dec a			;aec9
	or d			;aeca
sub_aecbh:
	ld ix,07c78h		;aecb
	bit 6,(ix+004h)		;aecf
	jr nz,laee8h		;aed3
	ld hl,laeeah		;aed5
	ld de,07c78h		;aed8
	ld bc,00008h		;aedb
	ldir		;aede
	ld a,(07dcch)		;aee0
	ld (ix+001h),a		;aee3
	scf			;aee6
	ret			;aee7
laee8h:
	or a			;aee8
	ret			;aee9
laeeah:
	xor b			;aeea
	nop			;aeeb
	nop			;aeec
	nop			;aeed
	ld b,a			;aeee
	or l			;aeef
	sub 0b1h		;aef0
sub_aef2h:
	ld a,001h		;aef2
	ld (07c63h),a		;aef4
	ret			;aef7
sub_aef8h:
	ld ix,07c10h		;aef8
	ld b,004h		;aefc
	jr laf0eh		;aefe
sub_af00h:
	ld ix,07c30h		;af00
	ld b,00ah		;af04
	jr laf0eh		;af06
sub_af08h:
	ld ix,07c10h		;af08
	ld b,00eh		;af0c
laf0eh:
	ld a,(07daeh)		;af0e
	ld c,a			;af11
laf12h:
	ld a,(ix+004h)		;af12
	bit 6,a		;af15
	jr z,laf7bh		;af17
	and 007h		;af19
	cp 006h		;af1b
	jr nz,laf32h		;af1d
	ld a,(ix+001h)		;af1f
	add a,(ix+003h)		;af22
	ld (ix+001h),a		;af25
	cp 0e8h		;af28
	jr nc,laf46h		;af2a
	push bc			;af2c
	call sub_ad5eh		;af2d
	jr laf7ah		;af30
laf32h:
	ld a,(ix+001h)		;af32
	sub c			;af35
	add a,(ix+003h)		;af36
	ld (ix+001h),a		;af39
	jr z,laf46h		;af3c
	cp 001h		;af3e
	jr z,laf46h		;af40
	cp 002h		;af42
	jr nz,laf4ch		;af44
laf46h:
	sub a			;af46
	ld (ix+004h),a		;af47
	jr laf7bh		;af4a
laf4ch:
	push bc			;af4c
	call sub_ad5eh		;af4d
	bit 5,(ix+004h)		;af50
	jr nz,laf7ah		;af54
	ld b,(ix+001h)		;af56
	ld a,(07c01h)		;af59
	sub 008h		;af5c
	cp b			;af5e
	jr c,laf7ah		;af5f
	set 5,(ix+004h)		;af61
	ld a,(ix+004h)		;af65
	dec a			;af68
	and 007h		;af69
	add a,a			;af6b
	ld hl,lafa0h		;af6c
	ld e,a			;af6f
	ld d,000h		;af70
	add hl,de			;af72
	ld a,(hl)			;af73
	inc hl			;af74
	ld h,(hl)			;af75
	ld l,a			;af76
	call sub_909eh		;af77
laf7ah:
	pop bc			;af7a
laf7bh:
	ld de,00008h		;af7b
	add ix,de		;af7e
	djnz laf12h		;af80
	ld de,07ac0h		;af82
	ld c,0bfh		;af85
	ld a,080h		;af87
	out (c),e		;af89
	out (c),d		;af8b
	dec c			;af8d
	nop			;af8e
	nop			;af8f
	nop			;af90
	out (c),a		;af91
	nop			;af93
	nop			;af94
	nop			;af95
	nop			;af96
	out (c),a		;af97
	nop			;af99
	nop			;af9a
	nop			;af9b
	nop			;af9c
	out (c),a		;af9d
	ret			;af9f
lafa0h:
	ld d,b			;afa0
	nop			;afa1
	add a,b			;afa2
	nop			;afa3
	ld d,b			;afa4
	nop			;afa5
	nop			;afa6
	ld bc,00100h		;afa7
	nop			;afaa
	nop			;afab
	ld d,b			;afac
	nop			;afad
	nop			;afae
	nop			;afaf
lafb0h:
	ld hl,lb2f1h		;afb0
lafb3h:
	ld (07dd4h),hl		;afb3
	ld bc,00800h		;afb6
	ld de,07dcch		;afb9
	call lb10ch+1		;afbc
	ld bc,00808h		;afbf
	ld de,07dd0h		;afc2
	call lb10ch+1		;afc5
	ld l,(ix+005h)		;afc8
	ld h,000h		;afcb
	add hl,hl			;afcd
	add hl,hl			;afce
	add hl,hl			;afcf
	add hl,de			;afd0
	push hl			;afd1
	ld a,(ix+001h)		;afd2
	and 007h		;afd5
	add a,a			;afd7
	ld e,a			;afd8
	ld d,000h		;afd9
	ld hl,lb05dh		;afdb
	add hl,de			;afde
	ld e,(hl)			;afdf
	inc hl			;afe0
	ld d,(hl)			;afe1
	ld hl,(07dd4h)		;afe2
	add hl,de			;afe5
	pop de			;afe6
	ld bc,00010h		;afe7
	call 0a0dfh		;afea
	ld de,07dcch		;afed
	ld c,0beh		;aff0
	call sub_b02ch		;aff2
	call sub_b02ch		;aff5
	ld a,(ix+001h)		;aff8
	rrca			;affb
	rrca			;affc
	rrca			;affd
	and 01fh		;affe
	ld e,a			;b000
	ld d,000h		;b001
	ld hl,07a80h		;b003
	add hl,de			;b006
	ld c,0bfh		;b007
	out (c),l		;b009
	out (c),h		;b00b
	ld a,(ix+005h)		;b00d
	out (0beh),a		;b010
	inc a			;b012
	nop			;b013
	nop			;b014
	nop			;b015
	nop			;b016
	out (0beh),a		;b017
	ld de,00020h		;b019
	add hl,de			;b01c
	out (c),l		;b01d
	out (c),h		;b01f
lb021h:
	inc a			;b021
	out (0beh),a		;b022
	inc a			;b024
	nop			;b025
	nop			;b026
	nop			;b027
	nop			;b028
	out (0beh),a		;b029
	ret			;b02b
sub_b02ch:
	ld a,(de)			;b02c
	inc de			;b02d
	or (hl)			;b02e
	inc hl			;b02f
	out (c),a		;b030
	ld a,(de)			;b032
	inc de			;b033
	or (hl)			;b034
	inc hl			;b035
	out (c),a		;b036
	ld a,(de)			;b038
	inc de			;b039
	or (hl)			;b03a
	inc hl			;b03b
	out (c),a		;b03c
	ld a,(de)			;b03e
	inc de			;b03f
	or (hl)			;b040
	inc hl			;b041
	out (c),a		;b042
	nop			;b044
	nop			;b045
	nop			;b046
	nop			;b047
	outi		;b048
	nop			;b04a
	nop			;b04b
	nop			;b04c
	nop			;b04d
	outi		;b04e
	nop			;b050
	nop			;b051
	nop			;b052
	nop			;b053
	outi		;b054
	nop			;b056
	nop			;b057
	nop			;b058
	nop			;b059
	outi		;b05a
	ret			;b05c
lb05dh:
	nop			;b05d
	nop			;b05e
	jr nz,lb061h		;b05f
lb061h:
	ld b,b			;b061
	nop			;b062
	ld h,b			;b063
	nop			;b064
	add a,b			;b065
	nop			;b066
	and b			;b067
	nop			;b068
	ret nz			;b069
	nop			;b06a
	ret po			;b06b
	nop			;b06c
	ld bc,00800h		;b06d
	ld de,07dcch		;b070
	call lb10ch+1		;b073
	ld bc,00808h		;b076
	ld de,07dd0h		;b079
	call lb10ch+1		;b07c
	ld bc,00810h		;b07f
	ld de,07dd4h		;b082
	call lb10ch+1		;b085
	ld l,(ix+005h)		;b088
	ld h,000h		;b08b
	add hl,hl			;b08d
	add hl,hl			;b08e
	add hl,hl			;b08f
	add hl,de			;b090
	push hl			;b091
	ld a,(ix+001h)		;b092
	and 007h		;b095
	add a,a			;b097
	ld e,a			;b098
	ld d,000h		;b099
	ld hl,lb0fdh		;b09b
	add hl,de			;b09e
	ld e,(hl)			;b09f
	inc hl			;b0a0
	ld d,(hl)			;b0a1
	ld hl,lb3f1h		;b0a2
	add hl,de			;b0a5
	pop de			;b0a6
	ld bc,00018h		;b0a7
	call 0a0dfh		;b0aa
	ld de,07dcch		;b0ad
	ld c,0beh		;b0b0
	call sub_b02ch		;b0b2
	call sub_b02ch		;b0b5
	call sub_b02ch		;b0b8
	ld a,(ix+001h)		;b0bb
	rrca			;b0be
	rrca			;b0bf
	rrca			;b0c0
	and 01fh		;b0c1
	ld e,a			;b0c3
	ld d,000h		;b0c4
	ld hl,07a80h		;b0c6
	add hl,de			;b0c9
	ld c,0bfh		;b0ca
	out (c),l		;b0cc
	out (c),h		;b0ce
	ld a,(ix+005h)		;b0d0
	out (0beh),a		;b0d3
	inc a			;b0d5
	nop			;b0d6
	nop			;b0d7
	nop			;b0d8
	nop			;b0d9
	out (0beh),a		;b0da
	inc a			;b0dc
	nop			;b0dd
	nop			;b0de
	nop			;b0df
	nop			;b0e0
	out (0beh),a		;b0e1
	ld de,00020h		;b0e3
	add hl,de			;b0e6
	out (c),l		;b0e7
	out (c),h		;b0e9
	inc a			;b0eb
	out (0beh),a		;b0ec
	inc a			;b0ee
	nop			;b0ef
	nop			;b0f0
	nop			;b0f1
	nop			;b0f2
	out (0beh),a		;b0f3
	inc a			;b0f5
	nop			;b0f6
	nop			;b0f7
	nop			;b0f8
	nop			;b0f9
	out (0beh),a		;b0fa
	ret			;b0fc
lb0fdh:
	nop			;b0fd
	nop			;b0fe
	jr nc,lb101h		;b0ff
lb101h:
	ld h,b			;b101
	nop			;b102
	sub b			;b103
	nop			;b104
	ret nz			;b105
	nop			;b106
	ret p			;b107
	nop			;b108
	jr nz,lb10ch		;b109
	ld d,b			;b10b
lb10ch:
	ld bc,0cdd5h		;b10c
	ld h,d			;b10f
	xor c			;b110
	ld de,01000h		;b111
	add hl,de			;b114
	ld c,0bfh		;b115
	out (c),l		;b117
	out (c),h		;b119
	dec c			;b11b
	pop hl			;b11c
	ini		;b11d
	nop			;b11f
	nop			;b120
	nop			;b121
	nop			;b122
	ini		;b123
	nop			;b125
	nop			;b126
	nop			;b127
	nop			;b128
	ini		;b129
	nop			;b12b
	nop			;b12c
	nop			;b12d
	nop			;b12e
	ini		;b12f
	ret			;b131
	ld hl,lb571h		;b132
	jp lafb3h		;b135
	ld hl,lb671h		;b138
	jp lafb3h		;b13b
lb13eh:
	ld l,(ix+005h)		;b13e
	ld h,000h		;b141
	add hl,hl			;b143
	add hl,hl			;b144
	add hl,hl			;b145
	ld de,01000h		;b146
	add hl,de			;b149
	push hl			;b14a
	ld a,(ix+001h)		;b14b
	and 007h		;b14e
	add a,a			;b150
	ld e,a			;b151
	ld d,000h		;b152
	ld hl,lb17fh+2		;b154
	add hl,de			;b157
	ld e,(hl)			;b158
	inc hl			;b159
	ld d,(hl)			;b15a
	ld hl,lb771h		;b15b
	add hl,de			;b15e
	pop de			;b15f
	ld bc,00010h		;b160
	call 0a0dfh		;b163
	ld a,(ix+001h)		;b166
	rrca			;b169
	rrca			;b16a
	rrca			;b16b
	and 01fh		;b16c
	ld e,a			;b16e
	ld d,000h		;b16f
	ld hl,07a80h		;b171
	add hl,de			;b174
	ex de,hl			;b175
	ld bc,00002h		;b176
	ld hl,lb17fh		;b179
	jp 0a0dfh		;b17c
lb17fh:
	jp 000c4h		;b17f
	nop			;b182
	djnz lb185h		;b183
lb185h:
	jr nz,lb187h		;b185
lb187h:
	jr nc,lb189h		;b187
lb189h:
	ld b,b			;b189
	nop			;b18a
	ld d,b			;b18b
	nop			;b18c
	ld h,b			;b18d
	nop			;b18e
	ld (hl),b			;b18f
	nop			;b190
	ld l,(ix+005h)		;b191
	ld h,000h		;b194
	add hl,hl			;b196
	add hl,hl			;b197
	add hl,hl			;b198
	ld de,01000h		;b199
	add hl,de			;b19c
	push hl			;b19d
	ld a,(ix+001h)		;b19e
	and 007h		;b1a1
	add a,a			;b1a3
	ld e,a			;b1a4
	ld d,000h		;b1a5
	ld hl,lb05dh		;b1a7
	add hl,de			;b1aa
	ld e,(hl)			;b1ab
	inc hl			;b1ac
	ld d,(hl)			;b1ad
	ld hl,lb7f1h		;b1ae
	add hl,de			;b1b1
	pop de			;b1b2
	ld bc,00020h		;b1b3
	call 0a0dfh		;b1b6
	ld a,(ix+001h)		;b1b9
	rrca			;b1bc
	rrca			;b1bd
	rrca			;b1be
	and 01fh		;b1bf
	ld e,a			;b1c1
	ld d,000h		;b1c2
	ld hl,07a80h		;b1c4
	add hl,de			;b1c7
	ex de,hl			;b1c8
	ld hl,lb1d2h		;b1c9
	ld bc,00004h		;b1cc
	jp 0a0dfh		;b1cf
lb1d2h:
	cp a			;b1d2
	ret nz			;b1d3
	pop bc			;b1d4
	jp nz,00001h		;b1d5
	nop			;b1d8
	ld de,07dcch		;b1d9
	call lb10ch+1		;b1dc
	ld bc,00018h		;b1df
	ld de,07dd0h		;b1e2
	call lb10ch+1		;b1e5
	ld l,(ix+005h)		;b1e8
	ld h,000h		;b1eb
	add hl,hl			;b1ed
	add hl,hl			;b1ee
	add hl,hl			;b1ef
	add hl,de			;b1f0
	ld a,l			;b1f1
	out (0bfh),a		;b1f2
	ld a,h			;b1f4
	or 040h		;b1f5
	out (0bfh),a		;b1f7
	ld a,(ix+001h)		;b1f9
	and 007h		;b1fc
	add a,a			;b1fe
	ld e,a			;b1ff
	ld d,000h		;b200
	ld hl,lb05dh		;b202
	add hl,de			;b205
	ld e,(hl)			;b206
	inc hl			;b207
	ld d,(hl)			;b208
	ld hl,lb9b1h		;b209
	add hl,de			;b20c
	ld de,07dcch		;b20d
	ld c,0beh		;b210
	call sub_b2b0h		;b212
	ld bc,00010h		;b215
	call sub_a0e7h		;b218
	ld c,0beh		;b21b
	call sub_b2b0h		;b21d
	ld a,(ix+001h)		;b220
	rrca			;b223
	rrca			;b224
	rrca			;b225
	and 01fh		;b226
	ld e,a			;b228
	ld d,000h		;b229
	ld hl,07aa0h		;b22b
	add hl,de			;b22e
	ex de,hl			;b22f
	ld hl,lb239h		;b230
	ld bc,00004h		;b233
	jp 0a0dfh		;b236
lb239h:
	or l			;b239
	or (hl)			;b23a
	or a			;b23b
	cp b			;b23c
	ld bc,00000h		;b23d
	ld de,07dcch		;b240
	call lb10ch+1		;b243
	ld bc,00010h		;b246
	ld de,07dd0h		;b249
	call lb10ch+1		;b24c
	ld l,(ix+005h)		;b24f
	ld h,000h		;b252
	add hl,hl			;b254
	add hl,hl			;b255
	add hl,hl			;b256
	add hl,de			;b257
	ld a,l			;b258
	out (0bfh),a		;b259
	ld a,h			;b25b
	or 040h		;b25c
	out (0bfh),a		;b25e
	ld a,(ix+001h)		;b260
	and 007h		;b263
	add a,a			;b265
	ld e,a			;b266
	ld d,000h		;b267
	ld hl,lb2e1h		;b269
	add hl,de			;b26c
	ld e,(hl)			;b26d
	inc hl			;b26e
	ld d,(hl)			;b26f
	ld hl,lb8f1h		;b270
	add hl,de			;b273
	ld de,07dcch		;b274
	ld c,0beh		;b277
	call sub_b2b0h		;b279
	ld bc,00008h		;b27c
	call sub_a0e7h		;b27f
	ld c,0beh		;b282
	call sub_b2b0h		;b284
	ld a,(ix+001h)		;b287
	rrca			;b28a
	rrca			;b28b
	rrca			;b28c
	and 01fh		;b28d
	ld e,a			;b28f
	ld d,000h		;b290
	ld hl,07aa0h		;b292
	add hl,de			;b295
	ld c,0bfh		;b296
	out (c),l		;b298
	out (c),h		;b29a
	ld a,(ix+005h)		;b29c
	out (0beh),a		;b29f
lb2a1h:
	inc a			;b2a1
lb2a2h:
	nop			;b2a2
lb2a3h:
	nop			;b2a3
	nop			;b2a4
	nop			;b2a5
	out (0beh),a		;b2a6
	inc a			;b2a8
	nop			;b2a9
	nop			;b2aa
	nop			;b2ab
	nop			;b2ac
	out (0beh),a		;b2ad
	ret			;b2af
sub_b2b0h:
	ld a,(de)			;b2b0
	inc de			;b2b1
	and (hl)			;b2b2
	inc hl			;b2b3
	out (c),a		;b2b4
	ld a,(de)			;b2b6
	inc de			;b2b7
	and (hl)			;b2b8
	inc hl			;b2b9
	out (c),a		;b2ba
	ld a,(de)			;b2bc
	inc de			;b2bd
	and (hl)			;b2be
	inc hl			;b2bf
	out (c),a		;b2c0
	ld a,(de)			;b2c2
	inc de			;b2c3
	and (hl)			;b2c4
	inc hl			;b2c5
	out (c),a		;b2c6
	nop			;b2c8
	nop			;b2c9
	nop			;b2ca
	nop			;b2cb
	outi		;b2cc
	nop			;b2ce
	nop			;b2cf
	nop			;b2d0
	nop			;b2d1
	outi		;b2d2
	nop			;b2d4
	nop			;b2d5
	nop			;b2d6
	nop			;b2d7
	outi		;b2d8
	nop			;b2da
	nop			;b2db
	nop			;b2dc
	nop			;b2dd
	outi		;b2de
	ret			;b2e0
lb2e1h:
	nop			;b2e1
	nop			;b2e2
	jr lb2e5h		;b2e3
lb2e5h:
	jr nc,lb2e7h		;b2e5
lb2e7h:
	ld c,b			;b2e7
	nop			;b2e8
	ld h,b			;b2e9
	nop			;b2ea
	ld a,b			;b2eb
	nop			;b2ec
	sub b			;b2ed
	nop			;b2ee
	xor b			;b2ef
	nop			;b2f0
lb2f1h:
	jr nz,lb325h		;b2f1
	halt			;b2f3
	ld a,(hl)			;b2f4
	ld a,d			;b2f5
	sbc a,a			;b2f6
	rst 18h			;b2f7
	rst 20h			;b2f8
	nop			;b2f9
	nop			;b2fa
	nop			;b2fb
	nop			;b2fc
	nop			;b2fd
	nop			;b2fe
	nop			;b2ff
	nop			;b300
	ld a,(hl)			;b301
	ld a,a			;b302
	ld a,a			;b303
	rst 38h			;b304
	rst 38h			;b305
	rst 38h			;b306
	rst 38h			;b307
	rst 38h			;b308
	nop			;b309
	nop			;b30a
	add a,b			;b30b
	pop bc			;b30c
	rst 38h			;b30d
	rst 38h			;b30e
	rst 38h			;b30f
	rst 38h			;b310
	djnz lb32ch		;b311
	dec sp			;b313
	ccf			;b314
	dec a			;b315
	ld c,a			;b316
	ld l,a			;b317
	ld (hl),e			;b318
	nop			;b319
	nop			;b31a
	nop			;b31b
	nop			;b31c
	nop			;b31d
	add a,b			;b31e
	add a,b			;b31f
	add a,b			;b320
	ccf			;b321
	ccf			;b322
	ccf			;b323
	rst 38h			;b324
lb325h:
	rst 38h			;b325
	rst 38h			;b326
	rst 38h			;b327
	rst 38h			;b328
	nop			;b329
	add a,b			;b32a
	ret nz			;b32b
lb32ch:
	ret po			;b32c
	rst 38h			;b32d
	rst 38h			;b32e
	rst 38h			;b32f
	rst 38h			;b330
	ex af,af'			;b331
	inc c			;b332
	dec e			;b333
	rra			;b334
	ld e,027h		;b335
	scf			;b337
	add hl,sp			;b338
	nop			;b339
	add a,b			;b33a
	add a,b			;b33b
	add a,b			;b33c
	add a,b			;b33d
	ret nz			;b33e
	ret nz			;b33f
	ret nz			;b340
	rra			;b341
	rra			;b342
	rra			;b343
	ld a,a			;b344
	rst 38h			;b345
	rst 38h			;b346
	rst 38h			;b347
	rst 38h			;b348
	add a,b			;b349
	ret nz			;b34a
	ret po			;b34b
	ret p			;b34c
	rst 38h			;b34d
	rst 38h			;b34e
	rst 38h			;b34f
	rst 38h			;b350
	inc b			;b351
	ld b,00eh		;b352
	rrca			;b354
	rrca			;b355
	inc de			;b356
	dec de			;b357
	inc e			;b358
	nop			;b359
	ld b,b			;b35a
	ret nz			;b35b
	ret nz			;b35c
	ld b,b			;b35d
	ret po			;b35e
	ret po			;b35f
	ret po			;b360
	rrca			;b361
	rrca			;b362
	rrca			;b363
	ccf			;b364
	rst 38h			;b365
	rst 38h			;b366
	rst 38h			;b367
	rst 38h			;b368
	ret nz			;b369
	ret po			;b36a
	ret p			;b36b
	ret m			;b36c
	rst 38h			;b36d
	rst 38h			;b36e
	rst 38h			;b36f
	rst 38h			;b370
	ld (bc),a			;b371
	inc bc			;b372
	rlca			;b373
	rlca			;b374
	rlca			;b375
	add hl,bc			;b376
	dec c			;b377
	ld c,000h		;b378
	jr nz,$+98		;b37a
	ret po			;b37c
	and b			;b37d
	ret p			;b37e
	ret p			;b37f
	ld (hl),b			;b380
	rlca			;b381
	rlca			;b382
	rlca			;b383
	rra			;b384
	rst 38h			;b385
	rst 38h			;b386
	rst 38h			;b387
	rst 38h			;b388
	ret po			;b389
	ret p			;b38a
	ret m			;b38b
	call m,sub_ffffh		;b38c
	rst 38h			;b38f
	rst 38h			;b390
	ld bc,00301h		;b391
	inc bc			;b394
	inc bc			;b395
	inc b			;b396
	ld b,007h		;b397
	nop			;b399
	sub b			;b39a
	or b			;b39b
	ret p			;b39c
	ret nc			;b39d
	ret m			;b39e
	ret m			;b39f
	jr c,lb3a5h		;b3a0
	inc bc			;b3a2
lb3a3h:
	inc bc			;b3a3
	rrca			;b3a4
lb3a5h:
	rst 38h			;b3a5
	rst 38h			;b3a6
	rst 38h			;b3a7
	rst 38h			;b3a8
	ret p			;b3a9
	ret m			;b3aa
	call m,sub_fffeh		;b3ab
	rst 38h			;b3ae
	rst 38h			;b3af
	rst 38h			;b3b0
	nop			;b3b1
	nop			;b3b2
	ld bc,00101h		;b3b3
	ld (bc),a			;b3b6
	inc bc			;b3b7
	inc bc			;b3b8
	add a,b			;b3b9
	ret z			;b3ba
	ret c			;b3bb
	ret m			;b3bc
	ret pe			;b3bd
	ld a,h			;b3be
	ld a,h			;b3bf
	sbc a,h			;b3c0
	ld bc,00101h		;b3c1
	rlca			;b3c4
	rst 38h			;b3c5
	rst 38h			;b3c6
	rst 38h			;b3c7
	rst 38h			;b3c8
	ret m			;b3c9
	call m,sub_fffeh		;b3ca
	rst 38h			;b3cd
	rst 38h			;b3ce
	rst 38h			;b3cf
	rst 38h			;b3d0
	nop			;b3d1
	nop			;b3d2
	nop			;b3d3
	nop			;b3d4
	nop			;b3d5
	ld bc,00101h		;b3d6
	ld b,b			;b3d9
	ld h,h			;b3da
	call pe,sub_f4fch		;b3db
	ld a,0beh		;b3de
	adc a,000h		;b3e0
	nop			;b3e2
	nop			;b3e3
	add a,e			;b3e4
	rst 38h			;b3e5
	rst 38h			;b3e6
	rst 38h			;b3e7
	rst 38h			;b3e8
	call m,sub_fffeh		;b3e9
	rst 38h			;b3ec
	rst 38h			;b3ed
	rst 38h			;b3ee
	rst 38h			;b3ef
	rst 38h			;b3f0
lb3f1h:
	ld hl,07733h		;b3f1
	ld a,a			;b3f4
	ld e,e			;b3f5
	adc a,a			;b3f6
	rst 18h			;b3f7
	rst 20h			;b3f8
	nop			;b3f9
	sub b			;b3fa
	or b			;b3fb
	ret p			;b3fc
	ret nc			;b3fd
	ret m			;b3fe
	ret m			;b3ff
	jr c,lb402h		;b400
lb402h:
	nop			;b402
	nop			;b403
	nop			;b404
	nop			;b405
	nop			;b406
	nop			;b407
	nop			;b408
	ld a,a			;b409
	ld a,a			;b40a
	rst 38h			;b40b
	rst 38h			;b40c
	rst 38h			;b40d
	rst 38h			;b40e
	rst 38h			;b40f
	rst 38h			;b410
	ret p			;b411
	ret m			;b412
	call m,sub_fffeh		;b413
	rst 38h			;b416
	rst 38h			;b417
	rst 38h			;b418
	nop			;b419
	nop			;b41a
	nop			;b41b
	ld bc,sub_ffffh		;b41c
	rst 38h			;b41f
	rst 38h			;b420
	djnz lb43ch		;b421
	dec sp			;b423
	ccf			;b424
	dec l			;b425
	ld b,a			;b426
	ld l,a			;b427
	ld (hl),e			;b428
	add a,b			;b429
	ret z			;b42a
	ret c			;b42b
	ret m			;b42c
	ret pe			;b42d
	call m,09cfch		;b42e
	nop			;b431
	nop			;b432
	nop			;b433
	nop			;b434
	nop			;b435
	nop			;b436
	nop			;b437
	nop			;b438
	ccf			;b439
	ccf			;b43a
	ld a,a			;b43b
lb43ch:
	rst 38h			;b43c
	rst 38h			;b43d
	rst 38h			;b43e
	rst 38h			;b43f
	rst 38h			;b440
	ret m			;b441
	call m,sub_fffeh		;b442
	rst 38h			;b445
	rst 38h			;b446
	rst 38h			;b447
	rst 38h			;b448
	nop			;b449
	nop			;b44a
	nop			;b44b
	nop			;b44c
	rst 38h			;b44d
	rst 38h			;b44e
	rst 38h			;b44f
	rst 38h			;b450
	ex af,af'			;b451
	inc c			;b452
	dec e			;b453
	rra			;b454
	ld d,023h		;b455
	scf			;b457
	add hl,sp			;b458
	ld b,b			;b459
	call po,sub_fcech		;b45a
	call p,sub_fefeh		;b45d
	adc a,000h		;b460
	nop			;b462
	nop			;b463
	nop			;b464
	nop			;b465
	nop			;b466
	nop			;b467
	nop			;b468
	rra			;b469
	rra			;b46a
	ccf			;b46b
	ld a,a			;b46c
	rst 38h			;b46d
	rst 38h			;b46e
	rst 38h			;b46f
	rst 38h			;b470
	call m,sub_fffeh		;b471
	rst 38h			;b474
	rst 38h			;b475
	rst 38h			;b476
	rst 38h			;b477
	rst 38h			;b478
	nop			;b479
	nop			;b47a
	nop			;b47b
	add a,b			;b47c
	rst 38h			;b47d
	rst 38h			;b47e
	rst 38h			;b47f
	rst 38h			;b480
	inc b			;b481
	ld b,00eh		;b482
	rrca			;b484
	dec bc			;b485
	ld de,01c1bh		;b486
	jr nz,lb4fdh		;b489
	or 0feh		;b48b
	ld a,d			;b48d
	rst 38h			;b48e
	rst 38h			;b48f
	rst 20h			;b490
	nop			;b491
	nop			;b492
	nop			;b493
	nop			;b494
	nop			;b495
	nop			;b496
	nop			;b497
	nop			;b498
	rrca			;b499
	rrca			;b49a
	rra			;b49b
	ccf			;b49c
	rst 38h			;b49d
	rst 38h			;b49e
	rst 38h			;b49f
	rst 38h			;b4a0
	cp 0ffh		;b4a1
	rst 38h			;b4a3
	rst 38h			;b4a4
	rst 38h			;b4a5
	rst 38h			;b4a6
	rst 38h			;b4a7
	rst 38h			;b4a8
	nop			;b4a9
	nop			;b4aa
	add a,b			;b4ab
	ret nz			;b4ac
	rst 38h			;b4ad
	rst 38h			;b4ae
	rst 38h			;b4af
	rst 38h			;b4b0
	ld (bc),a			;b4b1
	inc bc			;b4b2
	rlca			;b4b3
	rlca			;b4b4
	dec b			;b4b5
	ex af,af'			;b4b6
	dec c			;b4b7
	ld c,010h		;b4b8
	add hl,sp			;b4ba
	ld a,e			;b4bb
	rst 38h			;b4bc
	cp l			;b4bd
	rst 38h			;b4be
	rst 38h			;b4bf
	ld (hl),e			;b4c0
	nop			;b4c1
	nop			;b4c2
	nop			;b4c3
	nop			;b4c4
	nop			;b4c5
	add a,b			;b4c6
	add a,b			;b4c7
	add a,b			;b4c8
	rlca			;b4c9
	rlca			;b4ca
	rrca			;b4cb
	rra			;b4cc
	rst 38h			;b4cd
	rst 38h			;b4ce
	rst 38h			;b4cf
	rst 38h			;b4d0
	rst 38h			;b4d1
	rst 38h			;b4d2
	rst 38h			;b4d3
	rst 38h			;b4d4
	rst 38h			;b4d5
	rst 38h			;b4d6
	rst 38h			;b4d7
	rst 38h			;b4d8
	nop			;b4d9
	add a,b			;b4da
	ret nz			;b4db
	ret po			;b4dc
	rst 38h			;b4dd
	rst 38h			;b4de
	rst 38h			;b4df
	rst 38h			;b4e0
	ld bc,00301h		;b4e1
	inc bc			;b4e4
	ld (bc),a			;b4e5
	inc b			;b4e6
	ld b,007h		;b4e7
	ex af,af'			;b4e9
	sbc a,h			;b4ea
	cp l			;b4eb
	rst 38h			;b4ec
	sbc a,07fh		;b4ed
	rst 38h			;b4ef
	add hl,sp			;b4f0
	nop			;b4f1
	add a,b			;b4f2
	add a,b			;b4f3
	add a,b			;b4f4
	add a,b			;b4f5
	ret nz			;b4f6
	ret nz			;b4f7
	ret nz			;b4f8
	inc bc			;b4f9
	inc bc			;b4fa
	rlca			;b4fb
	rrca			;b4fc
lb4fdh:
	rst 38h			;b4fd
	rst 38h			;b4fe
	rst 38h			;b4ff
	rst 38h			;b500
	rst 38h			;b501
	rst 38h			;b502
	rst 38h			;b503
	rst 38h			;b504
	rst 38h			;b505
	rst 38h			;b506
	rst 38h			;b507
	rst 38h			;b508
	add a,b			;b509
	ret nz			;b50a
	ret po			;b50b
	ret p			;b50c
	rst 38h			;b50d
	rst 38h			;b50e
	rst 38h			;b50f
	rst 38h			;b510
	nop			;b511
	nop			;b512
	ld bc,00101h		;b513
	ld (bc),a			;b516
	inc bc			;b517
	inc bc			;b518
	add a,h			;b519
	adc a,0deh		;b51a
	rst 38h			;b51c
	ld l,a			;b51d
	ccf			;b51e
	ld a,a			;b51f
	sbc a,h			;b520
	nop			;b521
	ld b,b			;b522
	ret nz			;b523
	ret nz			;b524
	ld b,b			;b525
	ret po			;b526
	ret po			;b527
	ret po			;b528
	ld bc,00301h		;b529
	rlca			;b52c
	rst 38h			;b52d
	rst 38h			;b52e
	rst 38h			;b52f
	rst 38h			;b530
	rst 38h			;b531
	rst 38h			;b532
	rst 38h			;b533
	rst 38h			;b534
	rst 38h			;b535
	rst 38h			;b536
	rst 38h			;b537
	rst 38h			;b538
	ret nz			;b539
	ret po			;b53a
	ret p			;b53b
	ret m			;b53c
	rst 38h			;b53d
	rst 38h			;b53e
	rst 38h			;b53f
	rst 38h			;b540
	nop			;b541
	nop			;b542
	nop			;b543
	nop			;b544
	nop			;b545
	ld bc,00101h		;b546
	ld b,d			;b549
	ld h,a			;b54a
	rst 28h			;b54b
	rst 38h			;b54c
	or a			;b54d
	rra			;b54e
	cp a			;b54f
	adc a,000h		;b550
	jr nz,lb5b4h		;b552
	ret po			;b554
	and b			;b555
	ret p			;b556
	ret p			;b557
	ld (hl),b			;b558
	nop			;b559
	nop			;b55a
	ld bc,lff03h		;b55b
	rst 38h			;b55e
	rst 38h			;b55f
	rst 38h			;b560
	rst 38h			;b561
	rst 38h			;b562
	rst 38h			;b563
	rst 38h			;b564
	rst 38h			;b565
	rst 38h			;b566
	rst 38h			;b567
	rst 38h			;b568
	ret po			;b569
	ret p			;b56a
	ret m			;b56b
	call m,sub_ffffh		;b56c
	rst 38h			;b56f
	rst 38h			;b570
lb571h:
	nop			;b571
	nop			;b572
	nop			;b573
	nop			;b574
	nop			;b575
	ld b,d			;b576
	inc h			;b577
	ld a,(hl)			;b578
	nop			;b579
	nop			;b57a
	nop			;b57b
	nop			;b57c
	nop			;b57d
	nop			;b57e
	nop			;b57f
	nop			;b580
	inc a			;b581
	ld a,a			;b582
	rst 38h			;b583
	rst 38h			;b584
	rst 38h			;b585
	rst 38h			;b586
	rst 38h			;b587
	rst 38h			;b588
	nop			;b589
	nop			;b58a
	nop			;b58b
	add a,c			;b58c
	rst 38h			;b58d
	rst 38h			;b58e
	rst 38h			;b58f
	rst 38h			;b590
	nop			;b591
	nop			;b592
	nop			;b593
	nop			;b594
	nop			;b595
	ld hl,03f12h		;b596
	nop			;b599
	nop			;b59a
	nop			;b59b
	nop			;b59c
	nop			;b59d
	nop			;b59e
	nop			;b59f
	nop			;b5a0
	ld e,03fh		;b5a1
	ld a,a			;b5a3
	rst 38h			;b5a4
	rst 38h			;b5a5
	rst 38h			;b5a6
	rst 38h			;b5a7
	rst 38h			;b5a8
	nop			;b5a9
	add a,b			;b5aa
	add a,b			;b5ab
	ret nz			;b5ac
	rst 38h			;b5ad
	rst 38h			;b5ae
	rst 38h			;b5af
	rst 38h			;b5b0
	nop			;b5b1
	nop			;b5b2
	nop			;b5b3
lb5b4h:
	nop			;b5b4
	nop			;b5b5
	djnz lb5c1h		;b5b6
	rra			;b5b8
	nop			;b5b9
	nop			;b5ba
	nop			;b5bb
	nop			;b5bc
	nop			;b5bd
	add a,b			;b5be
	nop			;b5bf
	add a,b			;b5c0
lb5c1h:
	rrca			;b5c1
	rra			;b5c2
	ccf			;b5c3
	ld a,a			;b5c4
	rst 38h			;b5c5
	rst 38h			;b5c6
	rst 38h			;b5c7
	rst 38h			;b5c8
	nop			;b5c9
	ret nz			;b5ca
	ret nz			;b5cb
	ret po			;b5cc
	rst 38h			;b5cd
	rst 38h			;b5ce
	rst 38h			;b5cf
	rst 38h			;b5d0
	nop			;b5d1
	nop			;b5d2
	nop			;b5d3
	nop			;b5d4
	nop			;b5d5
	ex af,af'			;b5d6
	inc b			;b5d7
	rrca			;b5d8
	nop			;b5d9
	nop			;b5da
	nop			;b5db
	nop			;b5dc
	nop			;b5dd
	ld b,b			;b5de
	add a,b			;b5df
	ret nz			;b5e0
	rlca			;b5e1
	rrca			;b5e2
	rra			;b5e3
	ccf			;b5e4
	rst 38h			;b5e5
	rst 38h			;b5e6
	rst 38h			;b5e7
	rst 38h			;b5e8
	add a,b			;b5e9
	ret po			;b5ea
	ret po			;b5eb
	ret p			;b5ec
	rst 38h			;b5ed
	rst 38h			;b5ee
	rst 38h			;b5ef
	rst 38h			;b5f0
	nop			;b5f1
	nop			;b5f2
	nop			;b5f3
	nop			;b5f4
	nop			;b5f5
	inc b			;b5f6
	ld (bc),a			;b5f7
	rlca			;b5f8
	nop			;b5f9
	nop			;b5fa
	nop			;b5fb
	nop			;b5fc
	nop			;b5fd
	jr nz,lb640h		;b5fe
	ret po			;b600
	inc bc			;b601
	rlca			;b602
	rrca			;b603
	rra			;b604
	rst 38h			;b605
	rst 38h			;b606
	rst 38h			;b607
	rst 38h			;b608
	ret nz			;b609
	ret p			;b60a
	ret p			;b60b
	ret m			;b60c
	rst 38h			;b60d
	rst 38h			;b60e
	rst 38h			;b60f
	rst 38h			;b610
	nop			;b611
	nop			;b612
	nop			;b613
	nop			;b614
	nop			;b615
	ld (bc),a			;b616
	ld bc,00003h		;b617
	nop			;b61a
	nop			;b61b
	nop			;b61c
	nop			;b61d
	djnz lb640h		;b61e
	ret p			;b620
	ld bc,00703h		;b621
	rrca			;b624
	rst 38h			;b625
	rst 38h			;b626
	rst 38h			;b627
	rst 38h			;b628
	ret po			;b629
	ret m			;b62a
	ret m			;b62b
	call m,sub_ffffh		;b62c
	rst 38h			;b62f
	rst 38h			;b630
	nop			;b631
	nop			;b632
	nop			;b633
	nop			;b634
	nop			;b635
	ld bc,00100h		;b636
	nop			;b639
	nop			;b63a
	nop			;b63b
	nop			;b63c
	nop			;b63d
	ex af,af'			;b63e
	sub b			;b63f
lb640h:
	ret m			;b640
	nop			;b641
	ld bc,00703h		;b642
	rst 38h			;b645
	rst 38h			;b646
	rst 38h			;b647
	rst 38h			;b648
	ret p			;b649
	call m,sub_fefch		;b64a
	rst 38h			;b64d
	rst 38h			;b64e
	rst 38h			;b64f
	rst 38h			;b650
	nop			;b651
	nop			;b652
	nop			;b653
	nop			;b654
	nop			;b655
	nop			;b656
	nop			;b657
	nop			;b658
	nop			;b659
	nop			;b65a
	nop			;b65b
	nop			;b65c
	nop			;b65d
	add a,h			;b65e
	ld c,b			;b65f
	call m,00000h		;b660
	ld bc,lff03h		;b663
	rst 38h			;b666
	rst 38h			;b667
	rst 38h			;b668
	ld a,b			;b669
	cp 0feh		;b66a
	rst 38h			;b66c
	rst 38h			;b66d
	rst 38h			;b66e
	rst 38h			;b66f
	rst 38h			;b670
lb671h:
	ld e,0f3h		;b671
	rst 38h			;b673
	ld e,03fh		;b674
	ld a,a			;b676
	xor d			;b677
	sub h			;b678
	nop			;b679
	add a,b			;b67a
	add a,b			;b67b
	nop			;b67c
	nop			;b67d
	nop			;b67e
	add a,b			;b67f
	add a,b			;b680
	ld l,e			;b681
	ld a,a			;b682
	rst 38h			;b683
	rst 38h			;b684
	rst 38h			;b685
	rst 38h			;b686
	rst 38h			;b687
	rst 38h			;b688
	nop			;b689
	nop			;b68a
	add a,b			;b68b
	pop bc			;b68c
	rst 38h			;b68d
	rst 38h			;b68e
	rst 38h			;b68f
	rst 38h			;b690
	rrca			;b691
	ld a,c			;b692
	ld a,a			;b693
	rrca			;b694
	rra			;b695
	ccf			;b696
	ld d,l			;b697
	ld c,d			;b698
	nop			;b699
	ret nz			;b69a
	ret nz			;b69b
	nop			;b69c
	add a,b			;b69d
	add a,b			;b69e
	ld b,b			;b69f
	ld b,b			;b6a0
	dec (hl)			;b6a1
	ccf			;b6a2
	ld a,a			;b6a3
	rst 38h			;b6a4
	rst 38h			;b6a5
	rst 38h			;b6a6
	rst 38h			;b6a7
	rst 38h			;b6a8
	add a,b			;b6a9
	add a,b			;b6aa
	ret nz			;b6ab
	ret po			;b6ac
	rst 38h			;b6ad
	rst 38h			;b6ae
	rst 38h			;b6af
	rst 38h			;b6b0
	rlca			;b6b1
	inc a			;b6b2
	ccf			;b6b3
	rlca			;b6b4
	rrca			;b6b5
	rra			;b6b6
	ld hl,(l8025h)		;b6b7
	ret po			;b6ba
	ret po			;b6bb
	add a,b			;b6bc
	ret nz			;b6bd
	ret nz			;b6be
	and b			;b6bf
	jr nz,lb6dch		;b6c0
	rra			;b6c2
	ccf			;b6c3
	ld a,a			;b6c4
	rst 38h			;b6c5
	rst 38h			;b6c6
	rst 38h			;b6c7
	rst 38h			;b6c8
	ret nz			;b6c9
	ret nz			;b6ca
	ret po			;b6cb
	ret p			;b6cc
	rst 38h			;b6cd
	rst 38h			;b6ce
	rst 38h			;b6cf
	rst 38h			;b6d0
	inc bc			;b6d1
	ld e,01fh		;b6d2
	inc bc			;b6d4
	rlca			;b6d5
	rrca			;b6d6
	dec d			;b6d7
	ld (de),a			;b6d8
	ret nz			;b6d9
	ld (hl),b			;b6da
	ret p			;b6db
lb6dch:
	ret nz			;b6dc
	ret po			;b6dd
	ret po			;b6de
	ld d,b			;b6df
	sub b			;b6e0
	dec c			;b6e1
	rrca			;b6e2
	rra			;b6e3
	ccf			;b6e4
	rst 38h			;b6e5
	rst 38h			;b6e6
	rst 38h			;b6e7
	rst 38h			;b6e8
	ld h,b			;b6e9
	ret po			;b6ea
	ret p			;b6eb
	ret m			;b6ec
	rst 38h			;b6ed
	rst 38h			;b6ee
	rst 38h			;b6ef
	rst 38h			;b6f0
	ld bc,00f0fh		;b6f1
lb6f4h:
	ld bc,00703h		;b6f4
	ld a,(bc)			;b6f7
	add hl,bc			;b6f8
	ret po			;b6f9
	jr c,lb6f4h		;b6fa
	ret po			;b6fc
	ret p			;b6fd
	ret p			;b6fe
	xor b			;b6ff
	ld c,b			;b700
	ld b,007h		;b701
	rrca			;b703
	rra			;b704
	rst 38h			;b705
	rst 38h			;b706
	rst 38h			;b707
	rst 38h			;b708
	or b			;b709
	ret p			;b70a
	ret m			;b70b
	call m,sub_ffffh		;b70c
	rst 38h			;b70f
	rst 38h			;b710
	nop			;b711
	rlca			;b712
	rlca			;b713
	nop			;b714
	ld bc,00503h		;b715
	inc b			;b718
	ret p			;b719
	sbc a,h			;b71a
	call m,sub_f8f0h		;b71b
	ret m			;b71e
	ld d,h			;b71f
	and h			;b720
	inc bc			;b721
	inc bc			;b722
	rlca			;b723
	rrca			;b724
	rst 38h			;b725
	rst 38h			;b726
	rst 38h			;b727
	rst 38h			;b728
	ld e,b			;b729
	ret m			;b72a
	call m,sub_fffeh		;b72b
	rst 38h			;b72e
	rst 38h			;b72f
	rst 38h			;b730
	nop			;b731
	inc bc			;b732
	inc bc			;b733
	nop			;b734
	nop			;b735
	ld bc,00202h		;b736
	ld a,b			;b739
	adc a,0feh		;b73a
	ld a,b			;b73c
	call m,0aafch		;b73d
	ld d,d			;b740
	ld bc,00301h		;b741
	rlca			;b744
	rst 38h			;b745
	rst 38h			;b746
	rst 38h			;b747
	rst 38h			;b748
	xor h			;b749
	call m,sub_fffeh		;b74a
	rst 38h			;b74d
	rst 38h			;b74e
	rst 38h			;b74f
	rst 38h			;b750
	nop			;b751
	ld bc,00001h		;b752
	nop			;b755
	nop			;b756
	ld bc,03c01h		;b757
	rst 20h			;b75a
	rst 38h			;b75b
	inc a			;b75c
	ld a,(hl)			;b75d
	cp 055h		;b75e
	add hl,hl			;b760
	nop			;b761
	nop			;b762
	ld bc,lff83h		;b763
	rst 38h			;b766
	rst 38h			;b767
	rst 38h			;b768
	sub 0feh		;b769
	rst 38h			;b76b
	rst 38h			;b76c
	rst 38h			;b76d
	rst 38h			;b76e
	rst 38h			;b76f
	rst 38h			;b770
lb771h:
	cp 0fch		;b771
	call m,sub_fefeh		;b773
	cp 000h		;b776
	nop			;b778
	nop			;b779
	nop			;b77a
	nop			;b77b
	nop			;b77c
	nop			;b77d
	nop			;b77e
	nop			;b77f
	nop			;b780
	ld a,a			;b781
	ld a,(hl)			;b782
	ld a,(hl)			;b783
	ld a,a			;b784
	ld a,a			;b785
	ld a,a			;b786
	nop			;b787
	nop			;b788
	nop			;b789
	nop			;b78a
	nop			;b78b
	nop			;b78c
	nop			;b78d
	nop			;b78e
	nop			;b78f
	nop			;b790
	ccf			;b791
	ccf			;b792
	ccf			;b793
	ccf			;b794
	ccf			;b795
	ccf			;b796
	nop			;b797
	nop			;b798
	add a,b			;b799
	nop			;b79a
	nop			;b79b
	add a,b			;b79c
	add a,b			;b79d
	add a,b			;b79e
	nop			;b79f
	nop			;b7a0
	rra			;b7a1
	rra			;b7a2
	rra			;b7a3
	rra			;b7a4
	rra			;b7a5
	rra			;b7a6
	nop			;b7a7
	nop			;b7a8
	ret nz			;b7a9
	add a,b			;b7aa
	add a,b			;b7ab
	ret nz			;b7ac
	ret nz			;b7ad
	ret nz			;b7ae
	nop			;b7af
	nop			;b7b0
	rrca			;b7b1
	rrca			;b7b2
	rrca			;b7b3
	rrca			;b7b4
	rrca			;b7b5
	rrca			;b7b6
	nop			;b7b7
	nop			;b7b8
	ret po			;b7b9
	ret nz			;b7ba
	ret nz			;b7bb
	ret po			;b7bc
	ret po			;b7bd
	ret po			;b7be
	nop			;b7bf
	nop			;b7c0
	rlca			;b7c1
	rlca			;b7c2
	rlca			;b7c3
	rlca			;b7c4
	rlca			;b7c5
	rlca			;b7c6
	nop			;b7c7
lb7c8h:
	nop			;b7c8
	ret p			;b7c9
	ret po			;b7ca
	ret po			;b7cb
	ret p			;b7cc
	ret p			;b7cd
	ret p			;b7ce
	nop			;b7cf
	nop			;b7d0
	inc bc			;b7d1
	inc bc			;b7d2
	inc bc			;b7d3
	inc bc			;b7d4
	inc bc			;b7d5
	inc bc			;b7d6
	nop			;b7d7
	nop			;b7d8
	ret m			;b7d9
	ret p			;b7da
	ret p			;b7db
	ret m			;b7dc
	ret m			;b7dd
	ret m			;b7de
	nop			;b7df
	nop			;b7e0
	ld bc,00101h		;b7e1
	ld bc,00101h		;b7e4
	nop			;b7e7
	nop			;b7e8
	call m,sub_f8f8h		;b7e9
	call m,sub_fcfch		;b7ec
	nop			;b7ef
	nop			;b7f0
lb7f1h:
	nop			;b7f1
	add a,b			;b7f2
	jp lf6e6h		;b7f3
	defb 0fdh,0ffh,07fh	;illegal sequence		;b7f6
	ccf			;b7f9
	ret nz			;b7fa
	ld e,00fh		;b7fb
	add a,0ffh		;b7fd
	rst 38h			;b7ff
	rst 38h			;b800
	add a,b			;b801
	ld h,b			;b802
lb803h:
	djnz lb80dh		;b803
	ld e,a			;b805
	call m,sub_f0f8h		;b806
	nop			;b809
	nop			;b80a
	nop			;b80b
	nop			;b80c
lb80dh:
	nop			;b80d
	nop			;b80e
	nop			;b80f
	nop			;b810
	nop			;b811
	ld b,b			;b812
	ld h,c			;b813
	ld (hl),e			;b814
	ld a,e			;b815
	ld a,(hl)			;b816
	ld a,a			;b817
	ccf			;b818
	rra			;b819
	ld h,b			;b81a
	adc a,a			;b81b
	rlca			;b81c
	ld h,e			;b81d
	rst 38h			;b81e
	rst 38h			;b81f
	rst 38h			;b820
	ret nz			;b821
	jr nc,lb82ch		;b822
	add a,h			;b824
	cpl			;b825
	cp 0fch		;b826
	ret m			;b828
	nop			;b829
	nop			;b82a
	nop			;b82b
lb82ch:
	nop			;b82c
	add a,b			;b82d
	nop			;b82e
	nop			;b82f
	nop			;b830
	nop			;b831
	jr nz,$+50		;b832
	add hl,sp			;b834
	dec a			;b835
	ccf			;b836
	ccf			;b837
	rra			;b838
	rrca			;b839
	jr nc,lb803h		;b83a
	add a,e			;b83c
	or c			;b83d
	ld a,a			;b83e
	rst 38h			;b83f
	rst 38h			;b840
	ret po			;b841
	jr lb7c8h		;b842
	jp nz,lff97h		;b844
	cp 0fch		;b847
	nop			;b849
	nop			;b84a
	nop			;b84b
	nop			;b84c
	ret nz			;b84d
	nop			;b84e
	nop			;b84f
	nop			;b850
	nop			;b851
	djnz lb86ch		;b852
lb854h:
	inc e			;b854
	ld e,01fh		;b855
	rra			;b857
	rrca			;b858
	rlca			;b859
	jr lb8bfh		;b85a
	pop bc			;b85c
	ret c			;b85d
	cp a			;b85e
	rst 38h			;b85f
	rst 38h			;b860
	ret p			;b861
	inc c			;b862
	jp nz,lcbe1h		;b863
	rst 38h			;b866
	rst 38h			;b867
	cp 000h		;b868
	nop			;b86a
	nop			;b86b
lb86ch:
	nop			;b86c
	ret po			;b86d
	add a,b			;b86e
	nop			;b86f
	nop			;b870
	nop			;b871
	ex af,af'			;b872
	inc c			;b873
	ld c,00fh		;b874
	rrca			;b876
	rrca			;b877
sub_b878h:
	rlca			;b878
	inc bc			;b879
	inc c			;b87a
	ld sp,06c60h		;b87b
	rst 18h			;b87e
	rst 38h			;b87f
	rst 38h			;b880
	ret m			;b881
	ld b,0e1h		;b882
	ret p			;b884
	ld h,l			;b885
	rst 38h			;b886
	rst 38h			;b887
	rst 38h			;b888
	nop			;b889
	nop			;b88a
	nop			;b88b
	add a,b			;b88c
	ret p			;b88d
	ret nz			;b88e
	add a,b			;b88f
	nop			;b890
	nop			;b891
	inc b			;b892
	ld b,007h		;b893
	rlca			;b895
	rlca			;b896
	rlca			;b897
	inc bc			;b898
	ld bc,01806h		;b899
	jr nc,lb854h		;b89c
	rst 28h			;b89e
	rst 38h			;b89f
	rst 38h			;b8a0
	call m,sub_f003h		;b8a1
	ld a,b			;b8a4
	ld (sub_ffffh),a		;b8a5
	rst 38h			;b8a8
	nop			;b8a9
	nop			;b8aa
	add a,b			;b8ab
	ld b,b			;b8ac
	ret m			;b8ad
	ret po			;b8ae
	ret nz			;b8af
	add a,b			;b8b0
	nop			;b8b1
	ld (bc),a			;b8b2
	inc bc			;b8b3
	inc bc			;b8b4
	inc bc			;b8b5
	inc bc			;b8b6
	inc bc			;b8b7
	ld bc,00300h		;b8b8
	inc c			;b8bb
	sbc a,b			;b8bc
	in a,(0f7h)		;b8bd
lb8bfh:
	rst 38h			;b8bf
	rst 38h			;b8c0
	cp 001h		;b8c1
	ld a,b			;b8c3
	inc a			;b8c4
	add hl,de			;b8c5
	rst 38h			;b8c6
	rst 38h			;b8c7
	rst 38h			;b8c8
	nop			;b8c9
	add a,b			;b8ca
	ld b,b			;b8cb
	jr nz,lb94ah		;b8cc
	ret p			;b8ce
	ret po			;b8cf
	ret nz			;b8d0
	nop			;b8d1
	ld bc,00101h		;b8d2
	ld bc,00101h		;b8d5
	nop			;b8d8
	nop			;b8d9
	ld bc,lcc86h		;b8da
	defb 0edh;next byte illegal after ed		;b8dd
	ei			;b8de
	rst 38h			;b8df
	rst 38h			;b8e0
	ld a,a			;b8e1
	add a,b			;b8e2
	inc a			;b8e3
	ld e,08ch		;b8e4
	rst 38h			;b8e6
	rst 38h			;b8e7
	rst 38h			;b8e8
	nop			;b8e9
	ret nz			;b8ea
	jr nz,lb8fdh		;b8eb
	ld a,0f8h		;b8ed
	ret p			;b8ef
	ret po			;b8f0
lb8f1h:
	nop			;b8f1
	nop			;b8f2
	nop			;b8f3
	ld b,b			;b8f4
	ret nz			;b8f5
	ret po			;b8f6
	ret p			;b8f7
	ret p			;b8f8
	nop			;b8f9
	ld bc,00303h		;b8fa
lb8fdh:
	inc bc			;b8fd
	inc bc			;b8fe
	rlca			;b8ff
	rlca			;b900
	rst 38h			;b901
	rst 38h			;b902
	rst 38h			;b903
	rst 38h			;b904
	rst 38h			;b905
	rst 38h			;b906
	rst 38h			;b907
	rst 38h			;b908
	add a,b			;b909
	add a,b			;b90a
	add a,b			;b90b
	and b			;b90c
	ret po			;b90d
	ret p			;b90e
	ret m			;b90f
	ret m			;b910
	nop			;b911
	nop			;b912
	ld bc,00101h		;b913
	ld bc,00303h		;b916
	ld a,a			;b919
	rst 38h			;b91a
	rst 38h			;b91b
	rst 38h			;b91c
	rst 38h			;b91d
	rst 38h			;b91e
	rst 38h			;b91f
	rst 38h			;b920
	ret nz			;b921
	ret nz			;b922
	ret nz			;b923
	ret nc			;b924
	ret p			;b925
	ret m			;b926
	call m,000fch		;b927
	nop			;b92a
	nop			;b92b
	nop			;b92c
	nop			;b92d
	nop			;b92e
	ld bc,03f01h		;b92f
	ld a,a			;b932
	rst 38h			;b933
	rst 38h			;b934
	rst 38h			;b935
	rst 38h			;b936
	rst 38h			;b937
	rst 38h			;b938
	ret po			;b939
	ret po			;b93a
	ret po			;b93b
	ret pe			;b93c
	ret m			;b93d
	call m,sub_fefeh		;b93e
	nop			;b941
	nop			;b942
	nop			;b943
	nop			;b944
	nop			;b945
	nop			;b946
	nop			;b947
	nop			;b948
	rra			;b949
lb94ah:
	ccf			;b94a
	ld a,a			;b94b
	ld a,a			;b94c
	ld a,a			;b94d
	ld a,a			;b94e
	rst 38h			;b94f
	rst 38h			;b950
	ret p			;b951
	ret p			;b952
	ret p			;b953
	call p,sub_fefch		;b954
	rst 38h			;b957
	rst 38h			;b958
	nop			;b959
	nop			;b95a
	nop			;b95b
	nop			;b95c
	nop			;b95d
	nop			;b95e
	nop			;b95f
	nop			;b960
	rrca			;b961
	rra			;b962
	ccf			;b963
	ccf			;b964
	ccf			;b965
	ccf			;b966
	ld a,a			;b967
	ld a,a			;b968
	ret m			;b969
	ret m			;b96a
	ret m			;b96b
	jp m,sub_fffeh		;b96c
	rst 38h			;b96f
	rst 38h			;b970
	nop			;b971
	nop			;b972
	nop			;b973
	nop			;b974
	nop			;b975
	nop			;b976
	add a,b			;b977
	add a,b			;b978
	rlca			;b979
	rrca			;b97a
	rra			;b97b
	rra			;b97c
	rra			;b97d
	rra			;b97e
	ccf			;b97f
	ccf			;b980
	call m,sub_fcfch		;b981
	defb 0fdh,0ffh,0ffh	;illegal sequence		;b984
	rst 38h			;b987
	rst 38h			;b988
	nop			;b989
	nop			;b98a
	nop			;b98b
	nop			;b98c
	nop			;b98d
	add a,b			;b98e
	ret nz			;b98f
	ret nz			;b990
	inc bc			;b991
	rlca			;b992
	rrca			;b993
	rrca			;b994
	rrca			;b995
	rrca			;b996
	rra			;b997
	rra			;b998
	cp 0feh		;b999
	cp 0feh		;b99b
	rst 38h			;b99d
	rst 38h			;b99e
	rst 38h			;b99f
	rst 38h			;b9a0
	nop			;b9a1
	nop			;b9a2
	nop			;b9a3
	add a,b			;b9a4
	add a,b			;b9a5
	ret nz			;b9a6
	ret po			;b9a7
	ret po			;b9a8
	ld bc,00703h		;b9a9
	rlca			;b9ac
	rlca			;b9ad
	rlca			;b9ae
	rrca			;b9af
	rrca			;b9b0
lb9b1h:
	nop			;b9b1
	add a,b			;b9b2
	add a,b			;b9b3
	add a,b			;b9b4
	add a,b			;b9b5
	ret nz			;b9b6
	ret nz			;b9b7
	ret po			;b9b8
	nop			;b9b9
	nop			;b9ba
	nop			;b9bb
	nop			;b9bc
	nop			;b9bd
	nop			;b9be
	nop			;b9bf
	nop			;b9c0
	nop			;b9c1
	nop			;b9c2
	nop			;b9c3
	nop			;b9c4
	nop			;b9c5
	nop			;b9c6
	ld bc,07f01h		;b9c7
	ld a,a			;b9ca
	ld a,a			;b9cb
	ld a,a			;b9cc
	rst 38h			;b9cd
	rst 38h			;b9ce
	rst 38h			;b9cf
	rst 38h			;b9d0
	add a,b			;b9d1
	ret nz			;b9d2
	ret nz			;b9d3
	ret nz			;b9d4
	ret nz			;b9d5
	ret po			;b9d6
	ret po			;b9d7
	ret p			;b9d8
	nop			;b9d9
	nop			;b9da
	nop			;b9db
	nop			;b9dc
	nop			;b9dd
	nop			;b9de
	nop			;b9df
	nop			;b9e0
	nop			;b9e1
	nop			;b9e2
	nop			;b9e3
	nop			;b9e4
	nop			;b9e5
	nop			;b9e6
	nop			;b9e7
	nop			;b9e8
	ccf			;b9e9
	ccf			;b9ea
	ccf			;b9eb
	ccf			;b9ec
	ld a,a			;b9ed
	ld a,a			;b9ee
	rst 38h			;b9ef
	rst 38h			;b9f0
	ret nz			;b9f1
	ret po			;b9f2
	ret po			;b9f3
	ret po			;b9f4
	ret po			;b9f5
	ret p			;b9f6
	ret p			;b9f7
	ret m			;b9f8
	nop			;b9f9
	nop			;b9fa
	nop			;b9fb
	nop			;b9fc
	nop			;b9fd
	nop			;b9fe
	nop			;b9ff
	nop			;ba00
	nop			;ba01
	nop			;ba02
	nop			;ba03
	nop			;ba04
	nop			;ba05
	nop			;ba06
	nop			;ba07
	nop			;ba08
	rra			;ba09
	rra			;ba0a
	rra			;ba0b
	rra			;ba0c
	ccf			;ba0d
	ccf			;ba0e
	ld a,a			;ba0f
	ld a,a			;ba10
	ret po			;ba11
	ret p			;ba12
	ret p			;ba13
	ret p			;ba14
	ret p			;ba15
	ret m			;ba16
	ret m			;ba17
	call m,00000h		;ba18
	nop			;ba1b
	nop			;ba1c
	nop			;ba1d
	nop			;ba1e
	nop			;ba1f
	nop			;ba20
	nop			;ba21
	nop			;ba22
	nop			;ba23
	nop			;ba24
	nop			;ba25
	nop			;ba26
	nop			;ba27
	nop			;ba28
	rrca			;ba29
	rrca			;ba2a
	rrca			;ba2b
	rrca			;ba2c
	rra			;ba2d
	rra			;ba2e
	ccf			;ba2f
	ccf			;ba30
	ret p			;ba31
	ret m			;ba32
	ret m			;ba33
	ret m			;ba34
	ret m			;ba35
	call m,sub_fefch		;ba36
	nop			;ba39
	nop			;ba3a
	nop			;ba3b
	nop			;ba3c
	nop			;ba3d
	nop			;ba3e
	nop			;ba3f
	nop			;ba40
	nop			;ba41
	nop			;ba42
	nop			;ba43
	nop			;ba44
	nop			;ba45
	nop			;ba46
	nop			;ba47
	nop			;ba48
	rlca			;ba49
	rlca			;ba4a
	rlca			;ba4b
	rlca			;ba4c
	rrca			;ba4d
	rrca			;ba4e
	rra			;ba4f
	rra			;ba50
	ret m			;ba51
	call m,sub_fcfch		;ba52
	call m,sub_fefeh		;ba55
	rst 38h			;ba58
	nop			;ba59
	nop			;ba5a
	nop			;ba5b
	nop			;ba5c
	nop			;ba5d
	nop			;ba5e
	nop			;ba5f
	nop			;ba60
	nop			;ba61
	nop			;ba62
	nop			;ba63
	nop			;ba64
	nop			;ba65
	nop			;ba66
	nop			;ba67
	nop			;ba68
	inc bc			;ba69
	inc bc			;ba6a
	inc bc			;ba6b
	inc bc			;ba6c
	rlca			;ba6d
	rlca			;ba6e
	rrca			;ba6f
	rrca			;ba70
	call m,sub_fefeh		;ba71
	cp 0feh		;ba74
	rst 38h			;ba76
	rst 38h			;ba77
	rst 38h			;ba78
	nop			;ba79
	nop			;ba7a
	nop			;ba7b
	nop			;ba7c
	nop			;ba7d
	nop			;ba7e
	nop			;ba7f
	add a,b			;ba80
	nop			;ba81
	nop			;ba82
	nop			;ba83
	nop			;ba84
	nop			;ba85
	nop			;ba86
	nop			;ba87
	nop			;ba88
	ld bc,00101h		;ba89
	ld bc,00303h		;ba8c
	rlca			;ba8f
	rlca			;ba90
	cp 0ffh		;ba91
	rst 38h			;ba93
	rst 38h			;ba94
	rst 38h			;ba95
	rst 38h			;ba96
	rst 38h			;ba97
	rst 38h			;ba98
	nop			;ba99
	nop			;ba9a
	nop			;ba9b
	nop			;ba9c
	nop			;ba9d
	add a,b			;ba9e
	add a,b			;ba9f
	ret nz			;baa0
	nop			;baa1
	nop			;baa2
	nop			;baa3
	nop			;baa4
	nop			;baa5
	nop			;baa6
	nop			;baa7
	nop			;baa8
	nop			;baa9
	nop			;baaa
	nop			;baab
	nop			;baac
	ld bc,00301h		;baad
	inc bc			;bab0
sub_bab1h:
	ld hl,07ca0h		;bab1
	ld de,00004h		;bab4
	ld b,004h		;bab7
lbab9h:
	ld a,(hl)			;bab9
	cp 0d1h		;baba
	jp z,lbaebh		;babc
	sub 002h		;babf
	cp 018h		;bac1
	jp nc,lbac8h		;bac3
	ld a,0d1h		;bac6
lbac8h:
	ld (hl),a			;bac8
	exx			;bac9
	call sub_ac88h		;baca
	ld a,h			;bacd
	exx			;bace
	bit 7,a		;bacf
	jp z,lbaebh		;bad1
	push hl			;bad4
	exx			;bad5
	pop bc			;bad6
	inc bc			;bad7
	inc bc			;bad8
	inc bc			;bad9
	ld a,l			;bada
	and 00fh		;badb
	ld l,a			;badd
	ld h,000h		;bade
	ld de,lbaefh		;bae0
	add hl,de			;bae3
	ld h,(hl)			;bae4
	ld a,(bc)			;bae5
	and 0f0h		;bae6
	or h			;bae8
	ld (bc),a			;bae9
	exx			;baea
lbaebh:
	add hl,de			;baeb
	djnz lbab9h		;baec
	ret			;baee
lbaefh:
	add hl,bc			;baef
	ex af,af'			;baf0
	ld b,00fh		;baf1
	add hl,bc			;baf3
	add hl,bc			;baf4
	ld bc,00904h		;baf5
	rrca			;baf8
	ld b,00fh		;baf9
	ld c,00fh		;bafb
	rrca			;bafd
	dec bc			;bafe
sub_baffh:
	ld hl,07ce7h		;baff
	bit 6,(hl)		;bb02
	ret z			;bb04
	bit 5,(hl)		;bb05
	jp z,lbb39h		;bb07
	push hl			;bb0a
	ld hl,07db2h		;bb0b
	inc (hl)			;bb0e
	ld e,(hl)			;bb0f
	ld d,000h		;bb10
	ld hl,lbc01h		;bb12
	add hl,de			;bb15
	ld a,(hl)			;bb16
	pop hl			;bb17
	or a			;bb18
	jp z,lbbe2h		;bb19
	dec hl			;bb1c
	ld (hl),a			;bb1d
	dec hl			;bb1e
	ld b,(hl)			;bb1f
	ld a,(07daeh)		;bb20
	neg		;bb23
	add a,b			;bb25
	ld (hl),a			;bb26
	ld hl,lbbebh		;bb27
	sra e		;bb2a
	sra e		;bb2c
	add hl,de			;bb2e
	ld b,(hl)			;bb2f
	ld hl,07ce7h		;bb30
	ld a,(hl)			;bb33
	and 0f0h		;bb34
	or b			;bb36
	ld (hl),a			;bb37
	ret			;bb38
lbb39h:
	push hl			;bb39
	ld hl,07db2h		;bb3a
	inc (hl)			;bb3d
	ld e,(hl)			;bb3e
	ld d,000h		;bb3f
	ld hl,0bbf1h		;bb41
	add hl,de			;bb44
	ld a,(hl)			;bb45
	pop hl			;bb46
	or a			;bb47
	jp z,lbbe2h		;bb48
	dec hl			;bb4b
	ld (hl),a			;bb4c
	dec hl			;bb4d
	cp 084h		;bb4e
	jp c,lbb5eh		;bb50
	ld b,(hl)			;bb53
	ld a,(07daeh)		;bb54
	neg		;bb57
	add a,b			;bb59
	ld (hl),a			;bb5a
	jp lbb62h		;bb5b
lbb5eh:
	ld a,(hl)			;bb5e
	add a,004h		;bb5f
	ld (hl),a			;bb61
lbb62h:
	ld ix,07ce4h		;bb62
	ld bc,00908h		;bb66
	call sub_a943h		;bb69
	jp c,lbb76h		;bb6c
	ld bc,00b09h		;bb6f
	call sub_a943h		;bb72
	ret nc			;bb75
lbb76h:
	ld a,(07dbdh)		;bb76
	cp 0f1h		;bb79
	jr c,lbb80h		;bb7b
	ld a,(07dc5h)		;bb7d
lbb80h:
	call sub_ad76h		;bb80
	ret nc			;bb83
	set 5,(ix+003h)		;bb84
	sub a			;bb88
	ld (07db2h),a		;bb89
	ld a,(iy+004h)		;bb8c
	and 007h		;bb8f
	sub 002h		;bb91
	jp nz,lbbc6h		;bb93
	ld (iy+004h),a		;bb96
	ld hl,00200h		;bb99
	call sub_909eh		;bb9c
	inc (iy+005h)		;bb9f
	ld a,(iy+001h)		;bba2
	add a,004h		;bba5
	ld (iy+001h),a		;bba7
	ld a,041h		;bbaa
	ld (iy+004h),a		;bbac
	ld hl,lafb0h		;bbaf
	ld (iy+006h),l		;bbb2
	ld (iy+007h),h		;bbb5
	jp lad1ah		;bbb8
sub_bbbbh:
	ld hl,07ce7h		;bbbb
	bit 6,(hl)		;bbbe
	ret z			;bbc0
	bit 5,(hl)		;bbc1
	jr z,lbb62h		;bbc3
	ret			;bbc5
lbbc6h:
	ld a,(iy+004h)		;bbc6
	dec a			;bbc9
	and 007h		;bbca
	add a,a			;bbcc
	ld hl,lbc1bh		;bbcd
	ld e,a			;bbd0
	ld d,000h		;bbd1
	add hl,de			;bbd3
	ld a,(hl)			;bbd4
	inc hl			;bbd5
	ld h,(hl)			;bbd6
	ld l,a			;bbd7
	call sub_909eh		;bbd8
	sub a			;bbdb
	ld (iy+004h),a		;bbdc
	jp lad1ah		;bbdf
lbbe2h:
	sub a			;bbe2
	ld (hl),a			;bbe3
	dec hl			;bbe4
	dec hl			;bbe5
	dec hl			;bbe6
	ld a,0d1h		;bbe7
	ld (hl),a			;bbe9
	ret			;bbea
lbbebh:
	ld bc,0010fh		;bbeb
	rrca			;bbee
	ld bc,07406h		;bbef
	ld (hl),h			;bbf2
	ld (hl),h			;bbf3
	ld a,b			;bbf4
	ld a,b			;bbf5
	ld a,b			;bbf6
	ld a,h			;bbf7
	ld a,h			;bbf8
	ld a,h			;bbf9
	add a,b			;bbfa
	add a,b			;bbfb
	add a,b			;bbfc
	adc a,b			;bbfd
	adc a,h			;bbfe
	sub b			;bbff
	nop			;bc00
lbc01h:
	add a,h			;bc01
	add a,h			;bc02
	add a,h			;bc03
	add a,h			;bc04
	adc a,b			;bc05
	adc a,b			;bc06
	adc a,b			;bc07
	adc a,b			;bc08
	adc a,h			;bc09
	adc a,h			;bc0a
	adc a,h			;bc0b
	adc a,h			;bc0c
	adc a,h			;bc0d
	adc a,b			;bc0e
	adc a,b			;bc0f
	adc a,h			;bc10
	adc a,b			;bc11
	adc a,b			;bc12
	adc a,h			;bc13
	adc a,h			;bc14
	adc a,h			;bc15
	sub b			;bc16
	sub b			;bc17
	sub b			;bc18
	sub b			;bc19
	nop			;bc1a
lbc1bh:
	nop			;bc1b
	ld bc,00200h		;bc1c
	nop			;bc1f
	nop			;bc20
	nop			;bc21
	ld bc,00000h		;bc22
	nop			;bc25
	dec b			;bc26
	nop			;bc27
	nop			;bc28
	nop			;bc29
	nop			;bc2a
sub_bc2bh:
	ld hl,07db1h		;bc2b
	dec (hl)			;bc2e
	ret nz			;bc2f
	inc (hl)			;bc30
	ld a,(07d96h)		;bc31
	and 040h		;bc34
	ret z			;bc36
	ld hl,07ca0h		;bc37
	ld de,00004h		;bc3a
	ld b,004h		;bc3d
lbc3fh:
	ld a,(hl)			;bc3f
	cp 0d1h		;bc40
	jp z,lbc4bh		;bc42
	add hl,de			;bc45
	djnz lbc3fh		;bc46
	jp lbc71h		;bc48
lbc4bh:
	sub a			;bc4b
	ld (07d96h),a		;bc4c
	ld a,002h		;bc4f
	ld (07d93h),a		;bc51
	ld a,(07c00h)		;bc54
	sub 00dh		;bc57
	ld (hl),a			;bc59
	inc hl			;bc5a
	ld a,(07c01h)		;bc5b
	add a,002h		;bc5e
	ld (hl),a			;bc60
	inc hl			;bc61
	ld (hl),070h		;bc62
	inc hl			;bc64
	ld (hl),04fh		;bc65
	ld a,007h		;bc67
	ld (07db1h),a		;bc69
	ld a,014h		;bc6c
	call lc629h		;bc6e
lbc71h:
	ld hl,07ce7h		;bc71
	bit 6,(hl)		;bc74
	ret nz			;bc76
	ld a,041h		;bc77
	ld (hl),a			;bc79
	dec hl			;bc7a
	ld a,074h		;bc7b
	ld (hl),a			;bc7d
	dec hl			;bc7e
	ld a,(07c01h)		;bc7f
	add a,018h		;bc82
	ld (hl),a			;bc84
	dec hl			;bc85
	ld a,(07c00h)		;bc86
	cp 098h		;bc89
	jp c,lbc90h		;bc8b
	ld a,098h		;bc8e
lbc90h:
	inc a			;bc90
	ld (hl),a			;bc91
	ld a,0ffh		;bc92
	ld (07db2h),a		;bc94
	ret			;bc97
sub_bc98h:
	push af			;bc98
	ld de,07c90h		;bc99
	ld hl,lbcb8h		;bc9c
	ldi		;bc9f
	ldi		;bca1
	ldi		;bca3
	ldi		;bca5
	pop af			;bca7
	call 0bcbch		;bca8
	ld hl,ld08eh		;bcab
	add hl,de			;bcae
	ld bc,00008h		;bcaf
	ld de,01ca0h		;bcb2
	jp 0a0dfh		;bcb5
lbcb8h:
	cp b			;bcb8
	ret m			;bcb9
	sub h			;bcba
	ld bc,01bfeh		;bcbb
	jr c,lbcc2h		;bcbe
	sub 01ah		;bcc0
lbcc2h:
	dec a			;bcc2
	add a,a			;bcc3
	add a,a			;bcc4
	add a,a			;bcc5
	ld e,a			;bcc6
	ld d,000h		;bcc7
	ret			;bcc9
	ld a,0ffh		;bcca
	ld (07ea8h),a		;bccc
	ret			;bccf
sub_bcd0h:
	ld hl,07c90h		;bcd0
	ld a,(hl)			;bcd3
	cp 0d1h		;bcd4
	ret z			;bcd6
	ld a,(07daeh)		;bcd7
	neg		;bcda
	inc hl			;bcdc
	add a,(hl)			;bcdd
	ld (hl),a			;bcde
	ld b,a			;bcdf
	jp z,lbd6bh		;bce0
	dec a			;bce3
	jp z,lbd6bh		;bce4
	inc hl			;bce7
	inc hl			;bce8
	ld a,(07ea8h)		;bce9
	or a			;bcec
	jr z,lbd01h		;bced
	ld a,(07d85h)		;bcef
	and 008h		;bcf2
	jr z,lbcfah		;bcf4
	ld c,001h		;bcf6
	jr lbcfch		;bcf8
lbcfah:
	ld c,00fh		;bcfa
lbcfch:
	ld a,(hl)			;bcfc
	and 0f0h		;bcfd
	or c			;bcff
	ld (hl),a			;bd00
lbd01h:
	bit 5,(hl)		;bd01
	ret nz			;bd03
	ld a,(07c01h)		;bd04
	cp b			;bd07
	ret c			;bd08
	set 5,(hl)		;bd09
	sub a			;bd0b
	ld (07ea8h),a		;bd0c
	ld a,(07e5dh)		;bd0f
	ld (07e19h),a		;bd12
	ld hl,(07e60h)		;bd15
	ld (07e24h),hl		;bd18
	ld hl,(07e5eh)		;bd1b
	ld (07e22h),hl		;bd1e
	push af			;bd21
	call sub_9fd7h		;bd22
	call sub_9174h		;bd25
	call sub_9fedh		;bd28
	ld a,005h		;bd2b
	call lc629h		;bd2d
	ld a,(07ea7h)		;bd30
	and 080h		;bd33
	or 014h		;bd35
	ld (07ea7h),a		;bd37
	pop af			;bd3a
	sub 005h		;bd3b
	jr z,lbd62h		;bd3d
	sub 005h		;bd3f
	jr z,lbd62h		;bd41
	sub 005h		;bd43
	jr z,lbd62h		;bd45
	sub 005h		;bd47
	jr z,lbd62h		;bd49
	sub 006h		;bd4b
	jr z,lbd62h		;bd4d
	sub 005h		;bd4f
	jr z,lbd62h		;bd51
	sub 005h		;bd53
	jr z,lbd62h		;bd55
	sub 005h		;bd57
	jr z,lbd62h		;bd59
	sub 005h		;bd5b
	jr z,lbd62h		;bd5d
	sub 006h		;bd5f
	ret nz			;bd61
lbd62h:
	call sub_988bh		;bd62
	ld a,0ffh		;bd65
	ld (07e0bh),a		;bd67
	ret			;bd6a
lbd6bh:
	dec hl			;bd6b
	ld a,0d1h		;bd6c
	ld (hl),a			;bd6e
	ret			;bd6f
	ld hl,07cb0h		;bd70
	ld de,00008h		;bd73
	ld a,(hl)			;bd76
	cp 0d1h		;bd77
	jp z,lbd84h		;bd79
	add hl,de			;bd7c
	ld a,(hl)			;bd7d
	cp 0d1h		;bd7e
	jp z,lbd84h		;bd80
	ret			;bd83
lbd84h:
	ex de,hl			;bd84
	push de			;bd85
	ld a,(lbd9bh)		;bd86
	ld (07dcch),a		;bd89
	call sub_ae9ch		;bd8c
	pop de			;bd8f
	ret nc			;bd90
	ld hl,lbd9ah		;bd91
	ld bc,00008h		;bd94
	ldir		;bd97
	ret			;bd99
lbd9ah:
	xor b			;bd9a
lbd9bh:
	ret m			;bd9b
	sbc a,b			;bd9c
	inc bc			;bd9d
	xor b			;bd9e
	ret m			;bd9f
	sbc a,h			;bda0
	ld bc,lb021h		;bda1
	ld a,h			;bda4
	ld de,00008h		;bda5
	ld a,(hl)			;bda8
	cp 0d1h		;bda9
	ret nz			;bdab
	add hl,de			;bdac
	ld a,(hl)			;bdad
	cp 0d1h		;bdae
	ret nz			;bdb0
	ld a,(lbdc8h)		;bdb1
	ld (07dcch),a		;bdb4
	call sub_aecbh		;bdb7
	ret nc			;bdba
	ld hl,lbdc7h		;bdbb
	ld de,07cb0h		;bdbe
	ld bc,00010h		;bdc1
	ldir		;bdc4
	ret			;bdc6
lbdc7h:
	xor b			;bdc7
lbdc8h:
	ret m			;bdc8
	and b			;bdc9
	inc bc			;bdca
	xor b			;bdcb
	ret m			;bdcc
	and h			;bdcd
	ld bc,008d2h		;bdce
	xor b			;bdd1
	inc bc			;bdd2
	jp nc,lac08h		;bdd3
	ld bc,021ddh		;bdd6
	or b			;bdd9
	ld a,h			;bdda
	ld de,00008h		;bddb
	ld b,002h		;bdde
lbde0h:
	ld a,(ix+000h)		;bde0
	cp 0d1h		;bde3
	jp z,lbe2fh		;bde5
	cp 0d2h		;bde8
	jp nz,lbe10h		;bdea
	ld a,(07daeh)		;bded
	neg		;bdf0
	add a,(ix+001h)		;bdf2
	ld (ix+001h),a		;bdf5
	ld (ix+005h),a		;bdf8
	cp 0f8h		;bdfb
	jp z,lbe05h		;bdfd
	cp 0f9h		;be00
	jp nz,lbe2fh		;be02
lbe05h:
	ld a,0a8h		;be05
	ld (ix+000h),a		;be07
	ld (ix+004h),a		;be0a
	jp lbe2fh		;be0d
lbe10h:
	ld a,(07daeh)		;be10
	neg		;be13
	add a,(ix+001h)		;be15
	bit 7,(ix+003h)		;be18
	jp nz,lbe3eh		;be1c
	cp 001h		;be1f
	jp z,lbe34h		;be21
	cp 000h		;be24
	jp z,lbe34h		;be26
lbe29h:
	ld (ix+001h),a		;be29
	ld (ix+005h),a		;be2c
lbe2fh:
	add ix,de		;be2f
	djnz lbde0h		;be31
	ret			;be33
lbe34h:
	add a,020h		;be34
	set 7,(ix+003h)		;be36
	set 7,(ix+007h)		;be3a
lbe3eh:
	cp 010h		;be3e
	jp z,lbe48h		;be40
	cp 011h		;be43
	jp nz,lbe29h		;be45
lbe48h:
	ld a,0d1h		;be48
	ld (ix+000h),a		;be4a
	ld (ix+004h),a		;be4d
	jp lbe2fh		;be50
sub_be53h:
	ld hl,07d00h		;be53
	ld b,009h		;be56
lbe58h:
	ld (hl),0d1h		;be58
	inc hl			;be5a
	inc hl			;be5b
	inc hl			;be5c
	inc hl			;be5d
	ld (hl),000h		;be5e
	inc hl			;be60
	djnz lbe58h		;be61
	ld hl,07ce8h		;be63
	ld de,00004h		;be66
	exx			;be69
	ld hl,07d2dh		;be6a
	ld de,00008h		;be6d
	ld b,004h		;be70
lbe72h:
	ld (hl),0d1h		;be72
	add hl,de			;be74
	exx			;be75
	ld (hl),0d1h		;be76
	add hl,de			;be78
	exx			;be79
	djnz lbe72h		;be7a
	ld hl,07ca0h		;be7c
	ld de,00004h		;be7f
	ld b,004h		;be82
lbe84h:
	ld (hl),0d1h		;be84
	add hl,de			;be86
	djnz lbe84h		;be87
	ret			;be89
sub_be8ah:
	ld a,(07d85h)		;be8a
	and 01fh		;be8d
	ret nz			;be8f
	ld de,07e68h		;be90
	ld bc,07e6bh		;be93
	ld a,(bc)			;be96
	or a			;be97
	jr z,lbe9fh		;be98
	ld a,(de)			;be9a
	cp 003h		;be9b
	jr c,lbef6h		;be9d
lbe9fh:
	inc de			;be9f
	inc bc			;bea0
	ld a,(bc)			;bea1
	or a			;bea2
	jr z,lbeaah		;bea3
	ld a,(de)			;bea5
	cp 003h		;bea6
	jr c,lbefdh		;bea8
lbeaah:
	inc de			;beaa
	inc bc			;beab
	ld a,(bc)			;beac
	or a			;bead
	ret z			;beae
	ld a,(de)			;beaf
	cp 003h		;beb0
	ret nc			;beb2
	push bc			;beb3
	push de			;beb4
	ld hl,07d22h		;beb5
lbeb8h:
	ld de,00005h		;beb8
	ld b,003h		;bebb
lbebdh:
	bit 6,(hl)		;bebd
	jr z,lbec7h		;bebf
	add hl,de			;bec1
	djnz lbebdh		;bec2
	pop hl			;bec4
	pop hl			;bec5
	ret			;bec6
lbec7h:
	ld de,00004h		;bec7
	or a			;beca
	sbc hl,de		;becb
	push hl			;becd
	ld de,lbf04h		;bece
	ex de,hl			;bed1
	ld bc,00004h		;bed2
	ldir		;bed5
	ld a,(07e73h)		;bed7
	or (hl)			;beda
	ld (de),a			;bedb
	call sub_ac88h		;bedc
	ld a,h			;bedf
	ld b,l			;bee0
	and 07fh		;bee1
	pop hl			;bee3
	inc hl			;bee4
	add a,(hl)			;bee5
	ld (hl),a			;bee6
	rrca			;bee7
	and 040h		;bee8
	ld c,a			;beea
	ld a,b			;beeb
	and 03fh		;beec
	or c			;beee
	inc hl			;beef
	ld (hl),a			;bef0
	pop hl			;bef1
	inc (hl)			;bef2
	pop hl			;bef3
	dec (hl)			;bef4
	ret			;bef5
lbef6h:
	push bc			;bef6
	push de			;bef7
	ld hl,07d04h		;bef8
	jr lbeb8h		;befb
lbefdh:
	push bc			;befd
	push de			;befe
	ld hl,07d13h		;beff
	jr lbeb8h		;bf02
lbf04h:
	ld a,(de)			;bf04
	and b			;bf05
	nop			;bf06
	ld bc,02140h		;bf07
	ld l,b			;bf0a
	ld a,(hl)			;bf0b
	ld a,(hl)			;bf0c
	inc hl			;bf0d
	add a,(hl)			;bf0e
	inc hl			;bf0f
	add a,(hl)			;bf10
	inc hl			;bf11
	add a,(hl)			;bf12
	inc hl			;bf13
	add a,(hl)			;bf14
	inc hl			;bf15
	add a,(hl)			;bf16
	ld hl,07ea7h		;bf17
	jr nz,lbf2bh		;bf1a
	ld a,(hl)			;bf1c
	and 080h		;bf1d
	jr nz,lbf32h		;bf1f
	ld a,080h		;bf21
	ld (hl),a			;bf23
	ld a,087h		;bf24
	call lc629h		;bf26
	jr lbf32h		;bf29
lbf2bh:
	ld a,(hl)			;bf2b
	and 080h		;bf2c
	jr z,lbf32h		;bf2e
	ld (hl),001h		;bf30
lbf32h:
	ld hl,07d00h		;bf32
	ld de,07cc0h		;bf35
	ld bc,00005h		;bf38
	exx			;bf3b
	ld hl,07d04h		;bf3c
	ld b,009h		;bf3f
lbf41h:
	ld a,(hl)			;bf41
	ld c,a			;bf42
	bit 6,c		;bf43
	jp z,lc06eh		;bf45
	exx			;bf48
	ld a,(hl)			;bf49
	cp 019h		;bf4a
	jr nc,lbf7dh		;bf4c
	ld a,(hl)			;bf4e
	dec a			;bf4f
	ld (hl),a			;bf50
	jp z,lc10eh		;bf51
	inc de			;bf54
	inc de			;bf55
	push hl			;bf56
	push de			;bf57
	dec a			;bf58
	sra a		;bf59
	ld e,a			;bf5b
	ld d,000h		;bf5c
	ld hl,lc102h		;bf5e
	add hl,de			;bf61
	ld a,(hl)			;bf62
	pop de			;bf63
	pop hl			;bf64
	ld (de),a			;bf65
	inc de			;bf66
	ld a,(07d8fh)		;bf67
	and 00fh		;bf6a
	jr nz,lbf70h		;bf6c
	ld a,00fh		;bf6e
lbf70h:
	ld (de),a			;bf70
	inc de			;bf71
	add hl,bc			;bf72
	exx			;bf73
	ld de,00005h		;bf74
	add hl,de			;bf77
	djnz lbf41h		;bf78
	jp lc088h		;bf7a
lbf7dh:
	exx			;bf7d
	ld a,c			;bf7e
	and 020h		;bf7f
	jp nz,lbfc4h		;bf81
	bit 4,c		;bf84
	jp nz,lbffeh		;bf86
	dec hl			;bf89
	dec hl			;bf8a
	ld d,(hl)			;bf8b
	dec hl			;bf8c
	ld e,(hl)			;bf8d
	ld a,d			;bf8e
	and 003h		;bf8f
	jr nz,lbf9fh		;bf91
	ld a,(07c01h)		;bf93
	sub e			;bf96
	jr nc,lbf9bh		;bf97
	neg		;bf99
lbf9bh:
	cp 010h		;bf9b
	jr c,lbfbah		;bf9d
lbf9fh:
	ld a,d			;bf9f
	bit 6,a		;bfa0
	jr nz,lbfb0h		;bfa2
	inc e			;bfa4
	ld (hl),e			;bfa5
	and 01fh		;bfa6
	add a,098h		;bfa8
	cp e			;bfaa
	jp nz,lc048h		;bfab
	jr lbfbah		;bfae
lbfb0h:
	dec e			;bfb0
	ld (hl),e			;bfb1
	and 01fh		;bfb2
	add a,008h		;bfb4
	cp e			;bfb6
	jp nz,lc048h		;bfb7
lbfbah:
	inc hl			;bfba
	inc hl			;bfbb
	ld (hl),008h		;bfbc
	inc hl			;bfbe
	set 4,(hl)		;bfbf
	jp lc06eh		;bfc1
lbfc4h:
	dec hl			;bfc4
	dec hl			;bfc5
	dec hl			;bfc6
	ld a,(hl)			;bfc7
	inc a			;bfc8
	ld (hl),a			;bfc9
	cp 0f8h		;bfca
	jr nz,lbff9h		;bfcc
	dec hl			;bfce
	ld (hl),0d1h		;bfcf
	inc hl			;bfd1
	inc hl			;bfd2
	inc hl			;bfd3
	inc hl			;bfd4
	ld (hl),000h		;bfd5
	push hl			;bfd7
	push de			;bfd8
	ex de,hl			;bfd9
	ld ix,07e68h		;bfda
	ld hl,07d0fh		;bfde
	or a			;bfe1
	sbc hl,de		;bfe2
	jr nc,lbff2h		;bfe4
	inc ix		;bfe6
	ld hl,07d1eh		;bfe8
	or a			;bfeb
	sbc hl,de		;bfec
	jr nc,lbff2h		;bfee
	inc ix		;bff0
lbff2h:
	dec (ix+000h)		;bff2
	pop de			;bff5
	pop hl			;bff6
	jr lc06eh		;bff7
lbff9h:
	inc hl			;bff9
	inc hl			;bffa
	inc hl			;bffb
	jr lc06eh		;bffc
lbffeh:
	dec hl			;bffe
	dec (hl)			;bfff
	jr z,lc007h		;c000
	dec hl			;c002
	ld c,(hl)			;c003
	inc hl			;c004
	jr lc05fh		;c005
lc007h:
	push hl			;c007
	inc hl			;c008
	res 4,(hl)		;c009
lc00bh:
	call sub_ac88h		;c00b
	ld a,l			;c00e
	pop hl			;c00f
	dec hl			;c010
	and 03fh		;c011
	ld e,a			;c013
	ld a,(hl)			;c014
lc015h:
	and 040h		;c015
	xor 040h		;c017
lc019h:
	or e			;c019
	ld e,a			;c01a
	dec hl			;c01b
	dec hl			;c01c
	ld a,(hl)			;c01d
	inc hl			;c01e
	inc hl			;c01f
lc020h:
	ld d,0ffh		;c020
	cp 029h		;c022
lc024h:
	jr c,lc03ah		;c024
	ld d,0a0h		;c026
	cp 030h		;c028
sub_c02ah:
	jr c,lc03ah		;c02a
	ld d,060h		;c02c
	cp 038h		;c02e
lc030h:
	jr c,lc03ah		;c030
	ld d,020h		;c032
	cp 040h		;c034
	jr c,lc03ah		;c036
	ld d,000h		;c038
lc03ah:
	ld a,(07d90h)		;c03a
	cp d			;c03d
	rra			;c03e
	and 080h		;c03f
	or e			;c041
	ld (hl),a			;c042
	inc hl			;c043
	ld (hl),001h		;c044
	jr lc06dh		;c046
lc048h:
	inc hl			;c048
	ld a,(hl)			;c049
lc04ah:
	inc hl			;c04a
	dec (hl)			;c04b
	jr nz,lc06dh		;c04c
	push hl			;c04e
	ld c,a			;c04f
	rrca			;c050
	rrca			;c051
	rrca			;c052
	and 007h		;c053
	ld e,a			;c055
	ld d,000h		;c056
	ld hl,lc0fah		;c058
	add hl,de			;c05b
	ld a,(hl)			;c05c
	pop hl			;c05d
	ld (hl),a			;c05e
lc05fh:
	dec hl			;c05f
	dec hl			;c060
	dec hl			;c061
	bit 7,c		;c062
	jr nz,lc069h		;c064
	dec (hl)			;c066
	jr lc06ah		;c067
lc069h:
	inc (hl)			;c069
lc06ah:
	inc hl			;c06a
	inc hl			;c06b
	inc hl			;c06c
lc06dh:
	inc hl			;c06d
lc06eh:
	ld de,00005h		;c06e
	add hl,de			;c071
	exx			;c072
	ld a,(hl)			;c073
	cp 028h		;c074
	jr nc,lc07ah		;c076
	inc a			;c078
	ld (hl),a			;c079
lc07ah:
	ldi		;c07a
	ldi		;c07c
	inc bc			;c07e
	inc bc			;c07f
	inc de			;c080
	inc de			;c081
	inc hl			;c082
	inc hl			;c083
	inc hl			;c084
	exx			;c085
	djnz lc0f7h		;c086
lc088h:
	ld a,(07d85h)		;c088
	and 007h		;c08b
	ret nz			;c08d
	ld hl,07cc0h		;c08e
	ld de,00004h		;c091
	ld b,003h		;c094
	ld ix,07d00h		;c096
lc09ah:
	ld a,(ix+000h)		;c09a
	cp 019h		;c09d
	jr nc,lc0a4h		;c09f
	add hl,de			;c0a1
	jr lc0ach		;c0a2
lc0a4h:
	inc hl			;c0a4
	inc hl			;c0a5
	ld (hl),024h		;c0a6
	inc hl			;c0a8
	ld (hl),006h		;c0a9
	inc hl			;c0ab
lc0ach:
	add ix,de		;c0ac
	inc ix		;c0ae
	djnz lc09ah		;c0b0
	ld b,003h		;c0b2
lc0b4h:
	ld a,(ix+000h)		;c0b4
	cp 019h		;c0b7
	jr nc,lc0beh		;c0b9
	add hl,de			;c0bb
	jr lc0ceh		;c0bc
lc0beh:
	inc hl			;c0be
	inc hl			;c0bf
	ld a,(hl)			;c0c0
	add a,004h		;c0c1
	cp 033h		;c0c3
	jr c,lc0c9h		;c0c5
	ld a,028h		;c0c7
lc0c9h:
	ld (hl),a			;c0c9
	inc hl			;c0ca
	ld (hl),00bh		;c0cb
	inc hl			;c0cd
lc0ceh:
	add ix,de		;c0ce
lc0d0h:
	inc ix		;c0d0
	djnz lc0b4h		;c0d2
	ld b,003h		;c0d4
lc0d6h:
	ld a,(ix+000h)		;c0d6
	cp 019h		;c0d9
	jr nc,lc0e0h		;c0db
	add hl,de			;c0dd
	jr lc0f0h		;c0de
lc0e0h:
	inc hl			;c0e0
	inc hl			;c0e1
	ld a,(hl)			;c0e2
	add a,004h		;c0e3
	cp 023h		;c0e5
	jr c,lc0ebh		;c0e7
	ld a,018h		;c0e9
lc0ebh:
	ld (hl),a			;c0eb
	inc hl			;c0ec
	ld (hl),00fh		;c0ed
	inc hl			;c0ef
lc0f0h:
	add ix,de		;c0f0
	inc ix		;c0f2
	djnz lc0d6h		;c0f4
	ret			;c0f6
lc0f7h:
	jp lbf41h		;c0f7
lc0fah:
	ex af,af'			;c0fa
	ld a,(bc)			;c0fb
	dec c			;c0fc
	djnz lc113h		;c0fd
	jr $+27		;c0ff
	ld b,b			;c101
lc102h:
	ld c,b			;c102
	ld c,b			;c103
	ld c,b			;c104
	ld c,b			;c105
	ld b,h			;c106
	ld b,h			;c107
	ld b,b			;c108
	ld b,h			;c109
lc10ah:
	ld b,b			;c10a
	ld b,b			;c10b
	ld b,h			;c10c
	ld b,b			;c10d
lc10eh:
	ld (hl),0d1h		;c10e
	push hl			;c110
	pop ix		;c111
lc113h:
	res 6,(ix+004h)		;c113
	exx			;c117
	jp lc06eh		;c118
sub_c11bh:
	ld hl,07e6eh		;c11b
	ld a,(hl)			;c11e
	inc hl			;c11f
	cp (hl)			;c120
	ret nc			;c121
	dec hl			;c122
	push hl			;c123
	ld hl,(07e70h)		;c124
	ld b,(hl)			;c127
	bit 6,b		;c128
	jr z,lc153h		;c12a
	ld a,(07d85h)		;c12c
lc12fh:
	and 01fh		;c12f
lc131h:
	jr z,lc135h		;c131
	pop af			;c133
	ret			;c134
lc135h:
	dec hl			;c135
	dec hl			;c136
	dec hl			;c137
	ld a,(hl)			;c138
	dec hl			;c139
	ld c,(hl)			;c13a
	inc hl			;c13b
	inc hl			;c13c
	inc hl			;c13d
	inc hl			;c13e
	cp 090h		;c13f
	jr nc,lc153h		;c141
	cp 010h		;c143
	jr c,lc153h		;c145
	ld a,c			;c147
	cp 028h		;c148
	jr c,lc153h		;c14a
	ld a,b			;c14c
	and 00fh		;c14d
	jr nz,lc168h		;c14f
	set 5,(hl)		;c151
lc153h:
	pop af			;c153
lc154h:
	ld bc,00005h		;c154
	add hl,bc			;c157
	ld de,07d1dh		;c158
	ex de,hl			;c15b
	sbc hl,de		;c15c
	jr nc,lc163h		;c15e
	ld de,07d04h		;c160
lc163h:
	ld (07e70h),de		;c163
	ret			;c167
lc168h:
	push hl			;c168
	ld hl,07d2dh		;c169
	ld de,00008h		;c16c
	ld b,003h		;c16f
lc171h:
	ld a,(hl)			;c171
	cp 0d1h		;c172
	jr z,lc17ch		;c174
	add hl,de			;c176
	djnz lc171h		;c177
	pop hl			;c179
	pop hl			;c17a
	ret			;c17b
lc17ch:
	ex de,hl			;c17c
	pop hl			;c17d
	dec (hl)			;c17e
	dec hl			;c17f
	dec hl			;c180
	dec hl			;c181
	inc de			;c182
	ld a,(hl)			;c183
	ld b,a			;c184
	ld (de),a			;c185
	dec hl			;c186
	dec de			;c187
	ld a,(hl)			;c188
	add a,004h		;c189
	ld (de),a			;c18b
	ld hl,lc1c2h		;c18c
	inc de			;c18f
	inc de			;c190
	ldi		;c191
	ldi		;c193
	ldi		;c195
	ldi		;c197
	call sub_ac88h		;c199
	ld a,l			;c19c
	and 03fh		;c19d
	sub 018h		;c19f
	ld hl,07c01h		;c1a1
	add a,(hl)			;c1a4
	sub b			;c1a5
	sra a		;c1a6
	sra a		;c1a8
	sra a		;c1aa
	and 0feh		;c1ac
	add a,010h		;c1ae
	ld c,a			;c1b0
	ld b,000h		;c1b1
	ld hl,lc1c6h		;c1b3
	add hl,bc			;c1b6
	ldi		;c1b7
	ldi		;c1b9
	pop hl			;c1bb
	inc (hl)			;c1bc
	ld hl,(07e70h)		;c1bd
	jr lc154h		;c1c0
lc1c2h:
	nop			;c1c2
	nop			;c1c3
	djnz lc1c6h		;c1c4
lc1c6h:
	add a,b			;c1c6
	cp 0a0h		;c1c7
	cp 0cdh		;c1c9
	cp 00bh		;c1cb
	rst 38h			;c1cd
	ld b,b			;c1ce
	rst 38h			;c1cf
lc1d0h:
	ld a,c			;c1d0
	rst 38h			;c1d1
	xor a			;c1d2
	rst 38h			;c1d3
	ret po			;c1d4
	rst 38h			;c1d5
	jr nz,lc1d8h		;c1d6
lc1d8h:
	ld d,c			;c1d8
	nop			;c1d9
	add a,a			;c1da
	nop			;c1db
	ret nz			;c1dc
	nop			;c1dd
	push af			;c1de
	nop			;c1df
	inc sp			;c1e0
	ld bc,00160h		;c1e1
	add a,b			;c1e4
	ld bc,02d21h		;c1e5
	ld a,l			;c1e8
	ld de,07ce8h		;c1e9
	ld bc,00004h		;c1ec
	exx			;c1ef
	ld hl,07d2dh		;c1f0
	ld b,003h		;c1f3
lc1f5h:
	ld a,(hl)			;c1f5
	cp 0d1h		;c1f6
	jp z,lc2d2h		;c1f8
	cp 09ch		;c1fb
	jp nc,lc2a7h		;c1fd
	cp 019h		;c200
	jp nc,lc212h		;c202
	inc hl			;c205
sub_c206h:
	ld a,(hl)			;c206
	dec hl			;c207
lc208h:
	or a			;c208
	jp z,lc2e1h		;c209
lc20ch:
	dec (hl)			;c20c
	jp z,lc2beh		;c20d
	jr lc246h		;c210
lc212h:
	call sub_c527h		;c212
	call sub_c549h		;c215
	ld de,00303h		;c218
	push bc			;c21b
	push hl			;c21c
lc21dh:
	ld c,(hl)			;c21d
	inc hl			;c21e
	ld b,(hl)			;c21f
	ld hl,07ca0h		;c220
	call sub_c5c1h		;c223
	jr c,lc240h		;c226
	ld hl,07ca4h		;c228
lc22bh:
	call sub_c5c1h		;c22b
lc22eh:
	jr c,lc240h		;c22e
	ld hl,07ca8h		;c230
	call sub_c5c1h		;c233
	jr c,lc240h		;c236
lc238h:
	ld hl,07cach		;c238
	call sub_c5c1h		;c23b
	jr nc,lc25fh		;c23e
lc240h:
	ld (hl),0d1h		;c240
	pop hl			;c242
	pop bc			;c243
	ld (hl),008h		;c244
lc246h:
	exx			;c246
	inc de			;c247
	inc de			;c248
	ld a,04ch		;c249
	ld (de),a			;c24b
	inc de			;c24c
	ld a,00fh		;c24d
	ld (de),a			;c24f
	inc de			;c250
lc251h:
	push de			;c251
	ld de,00008h		;c252
	add hl,de			;c255
	pop de			;c256
	exx			;c257
	ld de,00008h		;c258
	add hl,de			;c25b
lc25ch:
	djnz lc1f5h		;c25c
	ret			;c25e
lc25fh:
	pop hl			;c25f
	ld bc,(07c00h)		;c260
	ld a,00dh		;c264
	add a,b			;c266
	ld b,a			;c267
	ld a,0fah		;c268
	add a,c			;c26a
	ld c,a			;c26b
	ld de,00a06h		;c26c
	call sub_c5c1h		;c26f
	jr c,lc286h		;c272
	ld bc,(07c00h)		;c274
	inc b			;c278
	inc b			;c279
	ld a,0fch		;c27a
	add a,c			;c27c
	ld c,a			;c27d
	ld de,00805h		;c27e
	call sub_c5c1h		;c281
	jr nc,lc28bh		;c284
lc286h:
	ld a,0ffh		;c286
	ld (07e09h),a		;c288
lc28bh:
	pop bc			;c28b
lc28ch:
	ld a,(hl)			;c28c
	ld de,00008h		;c28d
	add hl,de			;c290
	exx			;c291
	ldi		;c292
	ldi		;c294
	inc bc			;c296
	inc bc			;c297
	cp 040h		;c298
	jr c,lc29fh		;c29a
	ld a,038h		;c29c
lc29eh:
	ld (de),a			;c29e
lc29fh:
	inc de			;c29f
	inc de			;c2a0
	add hl,bc			;c2a1
	inc hl			;c2a2
	inc hl			;c2a3
	exx			;c2a4
	jr lc25ch		;c2a5
lc2a7h:
	push bc			;c2a7
	push hl			;c2a8
	call sub_ad35h		;c2a9
	pop hl			;c2ac
	pop bc			;c2ad
	ld (hl),018h		;c2ae
	inc hl			;c2b0
	ld (hl),000h		;c2b1
	dec hl			;c2b3
	exx			;c2b4
	ld a,09bh		;c2b5
	ld (de),a			;c2b7
	inc de			;c2b8
	inc de			;c2b9
	inc de			;c2ba
	inc de			;c2bb
	jr lc251h		;c2bc
lc2beh:
	ld (hl),0d1h		;c2be
	ld a,(07e6eh)		;c2c0
	dec a			;c2c3
	ld (07e6eh),a		;c2c4
	exx			;c2c7
	push de			;c2c8
	exx			;c2c9
	pop ix		;c2ca
	ld (ix+003h),009h		;c2cc
	jr lc28ch		;c2d0
lc2d2h:
	ld de,00008h		;c2d2
	add hl,de			;c2d5
	exx			;c2d6
	ldi		;c2d7
	ldi		;c2d9
	inc bc			;c2db
	inc bc			;c2dc
	ld a,034h		;c2dd
	jr lc29eh		;c2df
lc2e1h:
	ld a,(hl)			;c2e1
	dec a			;c2e2
	ld (hl),a			;c2e3
	jr z,lc2beh		;c2e4
	exx			;c2e6
	inc de			;c2e7
	push af			;c2e8
	ld a,(de)			;c2e9
	ld iy,07daeh		;c2ea
	sub (iy+000h)		;c2ee
	ld (de),a			;c2f1
	pop af			;c2f2
	inc de			;c2f3
	push hl			;c2f4
	push de			;c2f5
	dec a			;c2f6
	sra a		;c2f7
	ld e,a			;c2f9
	ld d,000h		;c2fa
	ld hl,lc310h		;c2fc
	add hl,de			;c2ff
	ld a,(hl)			;c300
	ld de,0000ch		;c301
	add hl,de			;c304
	ld h,(hl)			;c305
	pop de			;c306
lc307h:
	ld (de),a			;c307
	inc de			;c308
	ld a,h			;c309
	pop hl			;c30a
	ld (de),a			;c30b
	inc de			;c30c
	jp lc251h		;c30d
lc310h:
	ld e,h			;c310
	ld e,h			;c311
lc312h:
	ld e,h			;c312
	ld e,b			;c313
	ld e,b			;c314
	ld e,b			;c315
	ld d,h			;c316
	ld d,h			;c317
	ld d,b			;c318
	ld d,h			;c319
	ld d,b			;c31a
	ld d,b			;c31b
	ld c,00eh		;c31c
sub_c31eh:
	rrca			;c31e
	rrca			;c31f
	rrca			;c320
lc321h:
	ld c,006h		;c321
	ex af,af'			;c323
	add hl,bc			;c324
	ld c,004h		;c325
	ld bc,06f3ah		;c327
	ld a,(hl)			;c32a
	or a			;c32b
	ret z			;c32c
	ld a,(07d45h)		;c32d
	cp 0d1h		;c330
	ret nz			;c332
	ld a,(07d8fh)		;c333
	and 003h		;c336
	jr z,lc35bh		;c338
	cp 001h		;c33a
	jr z,lc378h		;c33c
lc33eh:
	ld hl,07d22h		;c33e
	ld bc,07d1eh		;c341
	bit 6,(hl)		;c344
	ret z			;c346
	ld a,(bc)			;c347
	cp 028h		;c348
	ret c			;c34a
	inc bc			;c34b
	ld a,(bc)			;c34c
	cp 018h		;c34d
	ret c			;c34f
	cp 0b0h		;c350
	ret nc			;c352
	ld a,(hl)			;c353
	and 00fh		;c354
	jr nz,lc395h		;c356
	set 5,(hl)		;c358
	ret			;c35a
lc35bh:
	ld hl,07d27h		;c35b
	ld bc,07d23h		;c35e
	bit 6,(hl)		;c361
	ret z			;c363
	ld a,(bc)			;c364
	cp 028h		;c365
	ret c			;c367
	inc bc			;c368
	ld a,(bc)			;c369
	cp 018h		;c36a
	ret c			;c36c
	cp 0b0h		;c36d
	ret nc			;c36f
	ld a,(hl)			;c370
	and 00fh		;c371
	jr nz,lc395h		;c373
	set 5,(hl)		;c375
	ret			;c377
lc378h:
	ld hl,07d2ch		;c378
	ld bc,07d28h		;c37b
	bit 6,(hl)		;c37e
	ret z			;c380
	ld a,(bc)			;c381
	cp 028h		;c382
	ret c			;c384
	inc bc			;c385
	ld a,(bc)			;c386
	cp 018h		;c387
	ret c			;c389
	cp 0b0h		;c38a
	ret nc			;c38c
	ld a,(hl)			;c38d
	and 00fh		;c38e
	jr nz,lc395h		;c390
	set 5,(hl)		;c392
	ret			;c394
lc395h:
	dec a			;c395
	ld d,a			;c396
	ld a,(hl)			;c397
	and 0f0h		;c398
	or d			;c39a
	ld (hl),a			;c39b
	dec bc			;c39c
	ld a,(bc)			;c39d
	add a,004h		;c39e
	ld de,07d45h		;c3a0
	ld (de),a			;c3a3
	inc bc			;c3a4
	inc de			;c3a5
	ld a,(bc)			;c3a6
	ld (de),a			;c3a7
	sub 0b8h		;c3a8
	neg		;c3aa
	ld hl,lc1c2h		;c3ac
	inc de			;c3af
	ldi		;c3b0
	ldi		;c3b2
	ldi		;c3b4
	ldi		;c3b6
	rrca			;c3b8
	rrca			;c3b9
	rrca			;c3ba
	and 01eh		;c3bb
	ld c,a			;c3bd
	ld b,000h		;c3be
	ld hl,lc3ceh		;c3c0
lc3c3h:
	add hl,bc			;c3c3
	ldi		;c3c4
	ldi		;c3c6
	ld a,03ch		;c3c8
	ld (07cf6h),a		;c3ca
	ret			;c3cd
lc3ceh:
	nop			;c3ce
	nop			;c3cf
	ld (hl),000h		;c3d0
	ld l,l			;c3d2
	nop			;c3d3
	and e			;c3d4
	nop			;c3d5
	jp c,01100h		;c3d6
	ld bc,00147h		;c3d9
	ld a,(hl)			;c3dc
	ld bc,001b4h		;c3dd
	ex de,hl			;c3e0
	ld bc,00222h		;c3e1
	ld (02202h),hl		;c3e4
	ld (bc),a			;c3e7
	ld (02202h),hl		;c3e8
	ld (bc),a			;c3eb
	ld (02102h),hl		;c3ec
	ld b,l			;c3ef
	ld a,l			;c3f0
	ld a,(hl)			;c3f1
	cp 0d1h		;c3f2
	ret z			;c3f4
	cp 09ch		;c3f5
	jp nc,lc46dh		;c3f7
	cp 019h		;c3fa
	jp nc,lc40ch		;c3fc
	inc hl			;c3ff
	ld a,(hl)			;c400
	dec hl			;c401
	or a			;c402
	jp z,lc4b6h		;c403
	dec (hl)			;c406
	ret nz			;c407
lc408h:
	ld (hl),0d1h		;c408
sub_c40ah:
	jr lc458h		;c40a
lc40ch:
	call sub_c527h		;c40c
	call sub_c549h		;c40f
sub_c412h:
	ld de,00303h		;c412
	ld c,(hl)			;c415
lc416h:
	inc hl			;c416
sub_c417h:
	ld b,(hl)			;c417
lc418h:
	dec hl			;c418
	ld a,010h		;c419
sub_c41bh:
	cp b			;c41b
lc41ch:
	jr nc,lc408h		;c41c
	ld a,0f6h		;c41e
sub_c420h:
	cp b			;c420
sub_c421h:
	jr c,lc408h		;c421
sub_c423h:
	push hl			;c423
sub_c424h:
	ld hl,07ca0h		;c424
sub_c427h:
	call sub_c5c1h		;c427
	jr c,lc444h		;c42a
	ld hl,07ca4h		;c42c
	call sub_c5c1h		;c42f
	jr c,lc444h		;c432
	ld hl,07ca8h		;c434
	call sub_c5c1h		;c437
	jr c,lc444h		;c43a
	ld hl,07cach		;c43c
	call sub_c5c1h		;c43f
	jr nc,lc457h		;c442
lc444h:
	ld (hl),0d1h		;c444
	pop hl			;c446
	ld (hl),008h		;c447
	inc hl			;c449
	ld (hl),001h		;c44a
	ld de,07cf6h		;c44c
	ld a,04ch		;c44f
	ld (de),a			;c451
	inc de			;c452
	ld a,00fh		;c453
	ld (de),a			;c455
	ret			;c456
lc457h:
	pop hl			;c457
lc458h:
	ld de,07cf4h		;c458
	ldi		;c45b
	ldi		;c45d
	inc de			;c45f
	ld a,(07d85h)		;c460
	and 003h		;c463
	ld a,008h		;c465
	jr nz,lc46bh		;c467
	ld a,00fh		;c469
lc46bh:
	ld (de),a			;c46b
	ret			;c46c
lc46dh:
	push hl			;c46d
	push de			;c46e
	ld hl,07cb0h		;c46f
	ld de,00008h		;c472
	ld a,(hl)			;c475
	cp 0d1h		;c476
	jr z,lc480h		;c478
	add hl,de			;c47a
	ld a,(hl)			;c47b
	cp 0d1h		;c47c
	jr nz,lc4aeh		;c47e
lc480h:
	ex de,hl			;c480
	push de			;c481
	ld a,(07d46h)		;c482
	add a,002h		;c485
	ld (07dcch),a		;c487
	call sub_ae9ch		;c48a
	pop de			;c48d
	jr nc,lc4aeh		;c48e
	ld hl,lbd9ah		;c490
	ldi		;c493
	ld a,(07dcch)		;c495
	ld (de),a			;c498
	inc hl			;c499
	inc de			;c49a
	ldi		;c49b
	ldi		;c49d
	ldi		;c49f
	ld (de),a			;c4a1
	inc hl			;c4a2
	inc de			;c4a3
	ldi		;c4a4
	ldi		;c4a6
	call sub_ad35h		;c4a8
	call 0c4f1h		;c4ab
lc4aeh:
	pop de			;c4ae
	pop hl			;c4af
	ld (hl),00ch		;c4b0
	inc hl			;c4b2
	ld (hl),000h		;c4b3
	ret			;c4b5
lc4b6h:
	ld a,(hl)			;c4b6
	dec a			;c4b7
	ld (hl),a			;c4b8
	jp z,lc408h		;c4b9
	push af			;c4bc
	ld a,(07daeh)		;c4bd
	neg		;c4c0
	ld iy,07cf4h		;c4c2
	add a,(iy+001h)		;c4c6
	ld (iy+001h),a		;c4c9
	pop af			;c4cc
	dec a			;c4cd
	sra a		;c4ce
lc4d0h:
	ld e,a			;c4d0
	ld d,000h		;c4d1
	ld hl,lc4e5h		;c4d3
	add hl,de			;c4d6
	ld a,(hl)			;c4d7
	ld de,00006h		;c4d8
	add hl,de			;c4db
	ld h,(hl)			;c4dc
	ld (iy+002h),a		;c4dd
	ld a,h			;c4e0
	ld (iy+003h),a		;c4e1
	ret			;c4e4
lc4e5h:
	ld d,h			;c4e5
	ld d,h			;c4e6
	ld d,b			;c4e7
	ld d,h			;c4e8
	ld d,b			;c4e9
	ld d,b			;c4ea
	rrca			;c4eb
	ld bc,0010fh		;c4ec
	rrca			;c4ef
	ld bc,lcc3ah		;c4f0
	ld a,l			;c4f3
	ld c,a			;c4f4
	ld hl,07c19h		;c4f5
	ld de,00008h		;c4f8
	ld b,008h		;c4fb
lc4fdh:
	ld a,(hl)			;c4fd
	sub c			;c4fe
	jr c,lc50eh		;c4ff
	cp 00dh		;c501
	jr nc,lc514h		;c503
lc505h:
	dec hl			;c505
	push hl			;c506
	pop ix		;c507
	res 6,(ix+004h)		;c509
	ret			;c50d
lc50eh:
	neg		;c50e
	cp 005h		;c510
	jr c,lc505h		;c512
lc514h:
	add hl,de			;c514
	djnz lc4fdh		;c515
	ld a,(hl)			;c517
	sub c			;c518
	jr c,lc520h		;c519
	cp 00dh		;c51b
	jr c,lc505h		;c51d
	ret			;c51f
lc520h:
	neg		;c520
	cp 009h		;c522
	jr c,lc505h		;c524
	ret			;c526
sub_c527h:
	push bc			;c527
	push hl			;c528
	inc hl			;c529
	inc hl			;c52a
	inc hl			;c52b
	inc hl			;c52c
lc52dh:
	ld c,(hl)			;c52d
lc52eh:
	inc hl			;c52e
	ld b,(hl)			;c52f
lc530h:
	ex de,hl			;c530
	ld hl,00005h		;c531
	add hl,bc			;c534
	ex de,hl			;c535
	ld (hl),d			;c536
	dec hl			;c537
	ld (hl),e			;c538
	pop hl			;c539
	push hl			;c53a
	ld b,(hl)			;c53b
	inc hl			;c53c
	inc hl			;c53d
	ld c,(hl)			;c53e
	ex de,hl			;c53f
	add hl,bc			;c540
	ex de,hl			;c541
	ld (hl),e			;c542
	dec hl			;c543
	dec hl			;c544
	ld (hl),d			;c545
	pop hl			;c546
	pop bc			;c547
	ret			;c548
sub_c549h:
	push hl			;c549
	inc hl			;c54a
	ld d,(hl)			;c54b
	inc hl			;c54c
	inc hl			;c54d
	ld e,(hl)			;c54e
	inc hl			;c54f
	inc hl			;c550
	inc hl			;c551
	ld a,(hl)			;c552
	inc hl			;c553
	ld h,(hl)			;c554
	ld l,a			;c555
	add hl,de			;c556
	ex de,hl			;c557
	pop hl			;c558
	push hl			;c559
	inc hl			;c55a
	ld (hl),d			;c55b
	inc hl			;c55c
	inc hl			;c55d
	ld (hl),e			;c55e
	pop hl			;c55f
	ret			;c560
sub_c561h:
	ld hl,07ca0h		;c561
	call sub_c576h		;c564
	ld hl,07ca4h		;c567
	call sub_c576h		;c56a
	ld hl,07ca8h		;c56d
	call sub_c576h		;c570
	ld hl,07cach		;c573
sub_c576h:
	ld a,(hl)			;c576
	cp 058h		;c577
	ret nc			;c579
	ld c,a			;c57a
	push hl			;c57b
	inc hl			;c57c
	ld b,(hl)			;c57d
	push bc			;c57e
	exx			;c57f
	pop bc			;c580
	ld hl,07d00h		;c581
	exx			;c584
	ld b,009h		;c585
lc587h:
	exx			;c587
	ld de,00804h		;c588
	call sub_c5c1h		;c58b
	jr c,lc599h		;c58e
	ld de,00005h		;c590
	add hl,de			;c593
	exx			;c594
	djnz lc587h		;c595
	pop hl			;c597
	ret			;c598
lc599h:
	ld (hl),018h		;c599
	exx			;c59b
	ld c,b			;c59c
	dec c			;c59d
	ld b,000h		;c59e
	ld hl,lc5b8h		;c5a0
	add hl,bc			;c5a3
	ld c,(hl)			;c5a4
	ld hl,07e68h		;c5a5
	add hl,bc			;c5a8
	dec (hl)			;c5a9
	pop hl			;c5aa
	ld (hl),0d1h		;c5ab
	ld a,095h		;c5ad
	call lc629h		;c5af
	ld hl,00100h		;c5b2
	jp sub_909eh		;c5b5
lc5b8h:
	ld (bc),a			;c5b8
	ld (bc),a			;c5b9
	ld (bc),a			;c5ba
	ld bc,00101h		;c5bb
	nop			;c5be
	nop			;c5bf
	nop			;c5c0
sub_c5c1h:
	inc hl			;c5c1
	ld a,(hl)			;c5c2
	dec hl			;c5c3
	sub b			;c5c4
	jr nc,lc5c9h		;c5c5
	neg		;c5c7
lc5c9h:
	cp d			;c5c9
	ret nc			;c5ca
	ld a,(hl)			;c5cb
	cp 019h		;c5cc
	jr nc,lc5d2h		;c5ce
	or a			;c5d0
	ret			;c5d1
lc5d2h:
	sub c			;c5d2
	jr nc,lc5d7h		;c5d3
	neg		;c5d5
lc5d7h:
	cp e			;c5d7
	ret			;c5d8
sub_c5d9h:
	ld ix,07c60h		;c5d9
	bit 6,(ix+004h)		;c5dd
	ret z			;c5e1
	ld a,(07d85h)		;c5e2
	and 03fh		;c5e5
	cp 010h		;c5e7
	jr z,lc60ah		;c5e9
	cp 014h		;c5eb
	jr z,lc60ah		;c5ed
	cp 018h		;c5ef
	jr z,lc60ah		;c5f1
	cp 020h		;c5f3
lc5f5h:
	jr z,lc60ah		;c5f5
	cp 030h		;c5f7
	jr z,lc606h		;c5f9
	cp 034h		;c5fb
	jr z,lc606h		;c5fd
	cp 036h		;c5ff
	jr z,lc606h		;c601
	cp 03fh		;c603
	ret nz			;c605
lc606h:
	dec (ix+001h)		;c606
	ret			;c609
lc60ah:
	inc (ix+001h)		;c60a
	ret			;c60d
sub_c60eh:
	ld a,09fh		;c60e
	out (0ffh),a		;c610
	ld a,0bfh		;c612
	out (0ffh),a		;c614
	ld a,0dfh		;c616
	out (0ffh),a		;c618
	ld a,0ffh		;c61a
	out (0ffh),a		;c61c
	ld b,028h		;c61e
	ld hl,07e7ch		;c620
	sub a			;c623
lc624h:
	ld (hl),a			;c624
	inc hl			;c625
	djnz lc624h		;c626
	ret			;c628
lc629h:
	push af			;c629
	and 01fh		;c62a
	add a,a			;c62c
	ld e,a			;c62d
	ld d,000h		;c62e
	ld hl,lc752h		;c630
	add hl,de			;c633
	ld e,(hl)			;c634
	inc hl			;c635
	ld d,(hl)			;c636
	ld a,(de)			;c637
	add a,a			;c638
	ld b,a			;c639
	add a,a			;c63a
	add a,a			;c63b
	add a,b			;c63c
	ld c,a			;c63d
	ld b,000h		;c63e
	ld hl,07e7ch		;c640
	add hl,bc			;c643
	ld c,(hl)			;c644
	inc hl			;c645
	pop af			;c646
	bit 7,a		;c647
	jr nz,lc658h		;c649
	ld b,(hl)			;c64b
	ld a,b			;c64c
	or c			;c64d
	jr z,lc658h		;c64e
	push de			;c650
	ex de,hl			;c651
	and a			;c652
	sbc hl,bc		;c653
	ex de,hl			;c655
	pop de			;c656
	ret nc			;c657
lc658h:
	inc de			;c658
	ld a,(de)			;c659
	inc de			;c65a
	ld (hl),d			;c65b
	dec hl			;c65c
	ld (hl),e			;c65d
	inc hl			;c65e
	inc hl			;c65f
	ld (hl),a			;c660
	inc hl			;c661
	ld (hl),001h		;c662
	inc hl			;c664
	ld (hl),000h		;c665
	inc hl			;c667
	ld (hl),000h		;c668
	scf			;c66a
	ret			;c66b
sub_c66ch:
	ld hl,07e7ch		;c66c
	call sub_c681h		;c66f
	ld hl,07e86h		;c672
	call sub_c681h		;c675
	ld hl,07e90h		;c678
	call sub_c681h		;c67b
	ld hl,07e9ah		;c67e
sub_c681h:
	push hl			;c681
	pop bc			;c682
	ld e,(hl)			;c683
	inc hl			;c684
	ld d,(hl)			;c685
	ld a,d			;c686
	or e			;c687
	ret z			;c688
	inc hl			;c689
	ld a,(hl)			;c68a
	inc hl			;c68b
	dec (hl)			;c68c
	ret nz			;c68d
	ld (hl),a			;c68e
	ld a,(de)			;c68f
	bit 7,a		;c690
	jr z,lc6c7h		;c692
	inc de			;c694
	cp 0e8h		;c695
	jr nz,lc69eh		;c697
	sub a			;c699
	ld (bc),a			;c69a
	inc bc			;c69b
	ld (bc),a			;c69c
	ret			;c69d
lc69eh:
	out (0ffh),a		;c69e
	and 070h		;c6a0
	jr z,lc6aeh		;c6a2
	cp 020h		;c6a4
	jr z,lc6b0h		;c6a6
	cp 040h		;c6a8
	jr nz,lc6c1h		;c6aa
	jr lc6b2h		;c6ac
lc6aeh:
	jr lc6b0h		;c6ae
lc6b0h:
	push af			;c6b0
	pop af			;c6b1
lc6b2h:
	ld a,(de)			;c6b2
	bit 6,a		;c6b3
	res 6,a		;c6b5
	out (0ffh),a		;c6b7
	inc de			;c6b9
	jr z,lc6c1h		;c6ba
	call lc6c1h		;c6bc
	jr lc6d5h		;c6bf
lc6c1h:
	ld a,e			;c6c1
	ld (bc),a			;c6c2
	inc bc			;c6c3
	ld a,d			;c6c4
	ld (bc),a			;c6c5
sub_c6c6h:
	ret			;c6c6
lc6c7h:
	bit 6,a		;c6c7
	jr nz,lc6f6h		;c6c9
	and a			;c6cb
	jr nz,lc6dch		;c6cc
lc6ceh:
	inc de			;c6ce
	ld a,(de)			;c6cf
	ld (bc),a			;c6d0
	inc de			;c6d1
	inc bc			;c6d2
	ld a,(de)			;c6d3
	ld (bc),a			;c6d4
lc6d5h:
	ld (hl),001h		;c6d5
	dec bc			;c6d7
	push bc			;c6d8
	pop hl			;c6d9
	jr sub_c681h		;c6da
lc6dch:
	inc hl			;c6dc
	ex af,af'			;c6dd
	ld a,(hl)			;c6de
	and a			;c6df
	jr nz,lc6e7h		;c6e0
	ex af,af'			;c6e2
	ld (hl),a			;c6e3
	dec hl			;c6e4
	jr lc6ceh		;c6e5
lc6e7h:
	dec a			;c6e7
	ld (hl),a			;c6e8
	dec hl			;c6e9
	jr nz,lc6ceh		;c6ea
	inc de			;c6ec
	inc de			;c6ed
lc6eeh:
	inc de			;c6ee
	ld a,e			;c6ef
	ld (bc),a			;c6f0
	inc bc			;c6f1
	ld a,d			;c6f2
	ld (bc),a			;c6f3
	jr lc6d5h		;c6f4
lc6f6h:
	bit 5,a		;c6f6
	jr nz,lc70dh		;c6f8
	inc hl			;c6fa
	inc hl			;c6fb
	ex af,af'			;c6fc
	ld a,(hl)			;c6fd
	and a			;c6fe
	jr nz,lc706h		;c6ff
	ex af,af'			;c701
	and 01fh		;c702
	ld (hl),a			;c704
	ret			;c705
lc706h:
	dec a			;c706
	ld (hl),a			;c707
	ret nz			;c708
	dec hl			;c709
	dec hl			;c70a
	jr lc6eeh		;c70b
lc70dh:
	bit 4,a		;c70d
	jr nz,lc71dh		;c70f
	bit 3,a		;c711
	jr nz,lc733h		;c713
	inc hl			;c715
	inc hl			;c716
	push hl			;c717
	pop de			;c718
	dec hl			;c719
	dec hl			;c71a
	jr lc6ceh		;c71b
lc71dh:
	bit 3,a		;c71d
	jr nz,lc73fh		;c71f
	inc de			;c721
	inc de			;c722
	inc de			;c723
	inc hl			;c724
	inc hl			;c725
	inc hl			;c726
	ld (hl),e			;c727
	inc hl			;c728
	ld (hl),d			;c729
	dec de			;c72a
	dec de			;c72b
	dec de			;c72c
	dec hl			;c72d
	dec hl			;c72e
	dec hl			;c72f
	dec hl			;c730
	jr lc6ceh		;c731
lc733h:
	inc hl			;c733
	inc hl			;c734
	inc hl			;c735
	inc hl			;c736
	push hl			;c737
	pop de			;c738
	dec hl			;c739
	dec hl			;c73a
	dec hl			;c73b
	dec hl			;c73c
	jr lc6ceh		;c73d
lc73fh:
	inc de			;c73f
	inc de			;c740
	inc de			;c741
	push hl			;c742
	inc hl			;c743
	inc hl			;c744
	inc hl			;c745
	inc hl			;c746
	inc hl			;c747
	ld (hl),e			;c748
	inc hl			;c749
	ld (hl),d			;c74a
	dec de			;c74b
	dec de			;c74c
	dec de			;c74d
	pop hl			;c74e
	jp lc6ceh		;c74f
lc752h:
	inc (hl)			;c752
	ret z			;c753
	ld a,(hl)			;c754
	rst 0			;c755
	pop de			;c756
	jp z,lc92dh		;c757
	inc d			;c75a
	ret			;c75b
	ld a,c			;c75c
	jp z,lcbc3h		;c75d
	cp a			;c760
	res 1,l		;c761
	jp z,lca9fh		;c763
	or d			;c766
	jp z,lcabeh		;c767
	jp pe,049c8h		;c76a
	ret z			;c76d
	ld e,c			;c76e
	ret z			;c76f
	add a,l			;c770
	ret z			;c771
	in a,(0cah)		;c772
	ld (bc),a			;c774
	sra c		;c775
	bit 5,l		;c777
	rl c		;c779
	ret z			;c77b
	adc a,0c7h		;c77c
	ld bc,sub_af00h+1		;c77e
	ld c,b			;c781
	or a			;c782
	ld b,c			;c783
	and b			;c784
	add hl,bc			;c785
	ld b,c			;c786
	and c			;c787
	add hl,bc			;c788
	ld b,c			;c789
	and d			;c78a
	add hl,bc			;c78b
	ld b,e			;c78c
	and e			;c78d
	add hl,bc			;c78e
	ld b,d			;c78f
	and h			;c790
	add hl,bc			;c791
	ld b,d			;c792
	and l			;c793
	add hl,bc			;c794
	ld b,c			;c795
	and (hl)			;c796
	add hl,bc			;c797
	ld b,c			;c798
	and a			;c799
	add hl,bc			;c79a
	ld b,c			;c79b
	xor b			;c79c
	add hl,bc			;c79d
	ld b,c			;c79e
	xor c			;c79f
	add hl,bc			;c7a0
	ld b,c			;c7a1
	xor d			;c7a2
	add hl,bc			;c7a3
	ld b,c			;c7a4
	xor e			;c7a5
	add hl,bc			;c7a6
	ld b,c			;c7a7
	xor h			;c7a8
	add hl,bc			;c7a9
	ld b,c			;c7aa
	xor l			;c7ab
	add hl,bc			;c7ac
	ld b,c			;c7ad
	xor (hl)			;c7ae
	add hl,bc			;c7af
	ld b,d			;c7b0
	xor a			;c7b1
	add hl,bc			;c7b2
	ld b,e			;c7b3
	xor (hl)			;c7b4
	add hl,bc			;c7b5
	ld b,c			;c7b6
	xor l			;c7b7
	ld c,c			;c7b8
	cp b			;c7b9
	xor h			;c7ba
	ld c,c			;c7bb
	cp c			;c7bc
	xor e			;c7bd
	ld c,c			;c7be
	cp d			;c7bf
	xor d			;c7c0
	ld c,c			;c7c1
	cp e			;c7c2
	xor c			;c7c3
	ld c,c			;c7c4
	cp h			;c7c5
	xor b			;c7c6
	ld c,c			;c7c7
	cp l			;c7c8
	and a			;c7c9
	ld c,c			;c7ca
	cp (hl)			;c7cb
	cp a			;c7cc
	ret pe			;c7cd
	ld bc,la601h		;c7ce
	ld c,d			;c7d1
	or (hl)			;c7d2
	xor c			;c7d3
	ld c,d			;c7d4
	or a			;c7d5
	xor h			;c7d6
	ld c,d			;c7d7
	cp b			;c7d8
	and b			;c7d9
	ld c,e			;c7da
	cp c			;c7db
	and e			;c7dc
	ld c,e			;c7dd
	cp d			;c7de
	and b			;c7df
	ld c,e			;c7e0
	cp e			;c7e1
	xor h			;c7e2
	ld c,d			;c7e3
	cp c			;c7e4
	xor c			;c7e5
	ld c,d			;c7e6
	or a			;c7e7
	ld (bc),a			;c7e8
	ret nc			;c7e9
	rst 0			;c7ea
	and (hl)			;c7eb
	ld c,d			;c7ec
	cp b			;c7ed
	xor c			;c7ee
	ld c,d			;c7ef
	cp c			;c7f0
	xor h			;c7f1
	ld c,d			;c7f2
	cp d			;c7f3
	and b			;c7f4
	ld c,e			;c7f5
	cp e			;c7f6
	and e			;c7f7
	ld c,e			;c7f8
	cp h			;c7f9
	and b			;c7fa
	ld c,e			;c7fb
	cp l			;c7fc
	xor h			;c7fd
	ld c,d			;c7fe
	cp e			;c7ff
	xor c			;c800
	ld c,d			;c801
	cp c			;c802
	and (hl)			;c803
	ld c,d			;c804
	cp e			;c805
	xor c			;c806
	ld c,d			;c807
	cp h			;c808
	xor h			;c809
	ld c,d			;c80a
	cp l			;c80b
	and b			;c80c
	ld c,d			;c80d
	cp (hl)			;c80e
	cp a			;c80f
	ret pe			;c810
	ld bc,lad01h		;c811
	ld b,h			;c814
	cp c			;c815
	xor h			;c816
	inc b			;c817
	xor e			;c818
	ld b,h			;c819
	cp d			;c81a
	xor b			;c81b
	inc b			;c81c
	and (hl)			;c81d
	inc b			;c81e
	and h			;c81f
	inc b			;c820
	and d			;c821
	inc b			;c822
	xor l			;c823
	inc bc			;c824
	xor d			;c825
	inc bc			;c826
	and (hl)			;c827
	inc bc			;c828
	and d			;c829
	inc bc			;c82a
	xor (hl)			;c82b
	ld b,d			;c82c
	cp c			;c82d
	xor b			;c82e
	ld (bc),a			;c82f
	and b			;c830
	ld (bc),a			;c831
	cp a			;c832
	ret pe			;c833
	inc bc			;c834
	ld (bc),a			;c835
	push hl			;c836
	push af			;c837
	or 0f8h		;c838
	jp m,03703h		;c83a
	ret z			;c83d
	ld b,h			;c83e
	ret m			;c83f
	ld b,h			;c840
	jp m,lfc44h		;c841
	ld b,h			;c844
	cp 044h		;c845
	rst 38h			;c847
	ret pe			;c848
	inc bc			;c849
	ld bc,048ffh		;c84a
	call po,sub_fdf7h		;c84d
	rst 38h			;c850
	ld b,l			;c851
	rra			;c852
	ld c,(hl)			;c853
	ret z			;c854
	ld e,b			;c855
	nop			;c856
	call nc,001cah		;c857
	ld (bc),a			;c85a
	cp a			;c85b
	ld b,h			;c85c
	and c			;c85d
	halt			;c85e
	cp a			;c85f
	ld c,a			;c860
	cp c			;c861
	or (hl)			;c862
	cp b			;c863
	cp d			;c864
	cp h			;c865
	cp l			;c866
	cp a			;c867
	ld e,c			;c868
	cp d			;c869
	cp b			;c86a
	cp c			;c86b
lc86ch:
	cp h			;c86c
	cp a			;c86d
	ld e,e			;c86e
	cp c			;c86f
	or (hl)			;c870
	cp b			;c871
	cp d			;c872
	cp h			;c873
	cp l			;c874
	cp a			;c875
	ld e,c			;c876
	cp d			;c877
	cp b			;c878
	cp c			;c879
	cp h			;c87a
	cp a			;c87b
	ld c,e			;c87c
	cp c			;c87d
	or a			;c87e
	or (hl)			;c87f
	cp b			;c880
	cp d			;c881
	cp h			;c882
	cp a			;c883
	ret pe			;c884
	ld (bc),a			;c885
	ld (bc),a			;c886
	rst 18h			;c887
	ld b,h			;c888
	pop bc			;c889
	ld e,e			;c88a
	rst 10h			;c88b
	ld b,(hl)			;c88c
	rst 18h			;c88d
	rst 10h			;c88e
	ld b,(hl)			;c88f
	rst 18h			;c890
	jp nz,ld74fh		;c891
	ld b,l			;c894
	rst 18h			;c895
	ld b,l			;c896
	ret nz			;c897
	ld d,d			;c898
	rst 10h			;c899
	ld b,l			;c89a
	rst 18h			;c89b
	ld b,e			;c89c
	rrc d		;c89d
	call nz,0d71eh		;c89f
	ld b,e			;c8a2
	jp nz,0420fh		;c8a3
	rst 18h			;c8a6
	ret			;c8a7
	ld e,h			;c8a8
	rst 10h			;c8a9
	ld b,e			;c8aa
	call nz,0420eh		;c8ab
	rst 18h			;c8ae
	pop bc			;c8af
	ld e,e			;c8b0
	rst 10h			;c8b1
	ld b,e			;c8b2
	rst 0			;c8b3
	dec c			;c8b4
	ld b,e			;c8b5
	pop bc			;c8b6
	dec de			;c8b7
	ld b,(hl)			;c8b8
	rst 18h			;c8b9
	rst 10h			;c8ba
	ld b,a			;c8bb
	rst 18h			;c8bc
	jp nz,ld74fh		;c8bd
lc8c0h:
	ld b,l			;c8c0
	rst 18h			;c8c1
	ld b,l			;c8c2
	ret nz			;c8c3
	ld d,d			;c8c4
lc8c5h:
	rst 10h			;c8c5
	ld b,l			;c8c6
	rst 18h			;c8c7
	ld b,e			;c8c8
	rrc d		;c8c9
	call nz,0d71eh		;c8cb
	ld b,e			;c8ce
	jp nz,0420fh		;c8cf
	rst 18h			;c8d2
	ret			;c8d3
	ld e,h			;c8d4
	rst 10h			;c8d5
	ld b,e			;c8d6
	jp nz,0420fh		;c8d7
	rst 18h			;c8da
	pop bc			;c8db
	ld e,e			;c8dc
	rst 10h			;c8dd
	ld b,e			;c8de
	ret nz			;c8df
	ld (de),a			;c8e0
	ld b,e			;c8e1
	rst 0			;c8e2
	dec c			;c8e3
	ld b,l			;c8e4
	rst 18h			;c8e5
	ld c,h			;c8e6
	nop			;c8e7
	cpl			;c8e8
	ret			;c8e9
	nop			;c8ea
	inc bc			;c8eb
	add a,h			;c8ec
	ld e,(hl)			;c8ed
	sub l			;c8ee
	ld b,d			;c8ef
	add a,b			;c8f0
	jr lc935h		;c8f1
	add a,e			;c8f3
	inc d			;c8f4
	ld b,d			;c8f5
	add a,b			;c8f6
	ld de,l9f44h		;c8f7
	sub l			;c8fa
	ld b,d			;c8fb
	add a,b			;c8fc
	ld (de),a			;c8fd
	ld b,d			;c8fe
	add a,e			;c8ff
	inc d			;c900
	ld b,d			;c901
	adc a,a			;c902
	ld hl,08042h		;c903
	ld de,l8243h		;c906
	jr nz,lc94dh		;c909
	add a,c			;c90b
	djnz lc951h		;c90c
	add a,h			;c90e
	ld e,(hl)			;c90f
	sub h			;c910
	ld b,h			;c911
	sbc a,a			;c912
	ret pe			;c913
	ld (bc),a			;c914
	ld (bc),a			;c915
	rst 18h			;c916
	ld b,l			;c917
	pop bc			;c918
	ld e,e			;c919
	sub 04eh		;c91a
	sbc a,0c7h		;c91c
	ld d,l			;c91e
	sub 04eh		;c91f
	sbc a,0c0h		;c921
	ld d,e			;c923
	sub 046h		;c924
	sbc a,0c0h		;c926
	ld d,d			;c928
	rst 10h			;c929
	ld c,d			;c92a
	rst 18h			;c92b
	ret pe			;c92c
lc92dh:
	ld (bc),a			;c92d
	ld (bc),a			;c92e
	ld (hl),b			;c92f
	ld d,(hl)			;c930
	ret			;c931
	ld (hl),b			;c932
	ret po			;c933
	ret			;c934
lc935h:
	ld (hl),b			;c935
	ld d,(hl)			;c936
	ret			;c937
	ld (hl),b			;c938
	ret po			;c939
	ret			;c93a
	ld (hl),b			;c93b
	add a,h			;c93c
	ret			;c93d
	ld (hl),b			;c93e
	inc d			;c93f
	jp z,05670h		;c940
	ret			;c943
	ld (hl),b			;c944
	ret po			;c945
	ret			;c946
	ld (hl),b			;c947
	or d			;c948
	ret			;c949
	ld (hl),b			;c94a
	add a,h			;c94b
	ret			;c94c
lc94dh:
	ld (hl),b			;c94d
	ld d,(hl)			;c94e
	ret			;c94f
	ld (hl),b			;c950
lc951h:
	ld c,b			;c951
	jp z,02f00h		;c952
	ret			;c955
	pop bc			;c956
	halt			;c957
	exx			;c958
	ld a,b			;c959
	or d			;c95a
	bit 7,b		;c95b
	or c			;c95d
	set 0,c		;c95e
	ld e,e			;c960
	exx			;c961
	ld a,b			;c962
	or d			;c963
	bit 7,b		;c964
	cp d			;c966
	set 0,h		;c967
	ld e,(hl)			;c969
	exx			;c96a
	ld a,b			;c96b
	or d			;c96c
	bit 7,b		;c96d
	cp d			;c96f
	set 1,a		;c970
	ld h,e			;c972
	exx			;c973
	ld a,b			;c974
	or d			;c975
	set 0,h		;c976
	ld e,(hl)			;c978
	exx			;c979
	ld a,b			;c97a
	or d			;c97b
	set 0,c		;c97c
	ld e,e			;c97e
	exx			;c97f
	ld a,b			;c980
	or d			;c981
	bit 4,b		;c982
	push bc			;c984
	ld l,b			;c985
	exx			;c986
	ld a,b			;c987
	or d			;c988
	bit 7,b		;c989
	or c			;c98b
	set 0,e		;c98c
	ld d,h			;c98e
	exx			;c98f
	ld a,b			;c990
	or d			;c991
	bit 7,b		;c992
	cp d			;c994
	set 1,e		;c995
	ld d,(hl)			;c997
	exx			;c998
	ld a,b			;c999
	or d			;c99a
	bit 7,b		;c99b
	cp d			;c99d
	set 0,c		;c99e
	ld e,e			;c9a0
	exx			;c9a1
	ld a,b			;c9a2
	or d			;c9a3
	set 1,e		;c9a4
	ld d,(hl)			;c9a6
	exx			;c9a7
	ld a,b			;c9a8
	or d			;c9a9
	set 0,e		;c9aa
	ld d,h			;c9ac
	exx			;c9ad
	ld a,b			;c9ae
	or d			;c9af
	bit 4,b		;c9b0
	rst 8			;c9b2
	ld h,e			;c9b3
	exx			;c9b4
	ld a,b			;c9b5
	or d			;c9b6
	bit 7,b		;c9b7
	or c			;c9b9
	set 0,b		;c9ba
	ld d,d			;c9bc
	exx			;c9bd
	ld a,b			;c9be
	or d			;c9bf
	bit 7,b		;c9c0
	cp d			;c9c2
	set 0,e		;c9c3
	ld d,h			;c9c5
	exx			;c9c6
	ld a,b			;c9c7
	or d			;c9c8
	bit 7,b		;c9c9
	cp d			;c9cb
	set 0,b		;c9cc
	ld e,b			;c9ce
	exx			;c9cf
	ld a,b			;c9d0
	or d			;c9d1
	set 0,e		;c9d2
	ld d,h			;c9d4
	exx			;c9d5
	ld a,b			;c9d6
	or d			;c9d7
	set 0,b		;c9d8
	ld d,d			;c9da
	exx			;c9db
	ld a,b			;c9dc
	or d			;c9dd
	bit 4,b		;c9de
	pop bc			;c9e0
	halt			;c9e1
	exx			;c9e2
	ld a,b			;c9e3
	or d			;c9e4
	bit 7,b		;c9e5
	or c			;c9e7
	set 0,c		;c9e8
	ld e,e			;c9ea
	exx			;c9eb
	ld a,b			;c9ec
	or d			;c9ed
	bit 7,b		;c9ee
	cp d			;c9f0
	set 0,h		;c9f1
	ld e,(hl)			;c9f3
	exx			;c9f4
	ld a,b			;c9f5
	or d			;c9f6
	bit 7,b		;c9f7
	cp d			;c9f9
	set 1,a		;c9fa
	ld h,e			;c9fc
	exx			;c9fd
	ld a,b			;c9fe
	or d			;c9ff
	set 0,l		;ca00
	ld l,b			;ca02
	exx			;ca03
	ld a,b			;ca04
	cp e			;ca05
	set 0,e		;ca06
	ld h,(hl)			;ca08
	ret c			;ca09
	ld a,b			;ca0a
	cp e			;ca0b
	set 1,a		;ca0c
	ld h,e			;ca0e
	exx			;ca0f
	ld a,b			;ca10
	or d			;ca11
	bit 4,b		;ca12
	push bc			;ca14
	ld l,b			;ca15
	exx			;ca16
	ld a,b			;ca17
	or d			;ca18
	bit 7,b		;ca19
	or c			;ca1b
	set 0,e		;ca1c
	ld d,h			;ca1e
	exx			;ca1f
	ld a,b			;ca20
	or d			;ca21
	bit 7,b		;ca22
	cp d			;ca24
	set 1,e		;ca25
	ld d,(hl)			;ca27
	exx			;ca28
	ld a,b			;ca29
	or d			;ca2a
	bit 7,b		;ca2b
	cp d			;ca2d
	set 0,c		;ca2e
	ld e,e			;ca30
	exx			;ca31
	ld a,b			;ca32
	or d			;ca33
	set 0,h		;ca34
	ld e,(hl)			;ca36
	exx			;ca37
	ld a,b			;ca38
	cp e			;ca39
	set 1,c		;ca3a
	ld e,h			;ca3c
	ret c			;ca3d
	ld a,b			;ca3e
	cp e			;ca3f
	set 0,c		;ca40
	ld e,e			;ca42
	exx			;ca43
	ld a,b			;ca44
	or d			;ca45
	bit 4,b		;ca46
	pop bc			;ca48
	halt			;ca49
	ret c			;ca4a
	ld a,b			;ca4b
	cp e			;ca4c
	bit 7,b		;ca4d
	or c			;ca4f
	bit 7,b		;ca50
	cp d			;ca52
	set 1,h		;ca53
	ld l,d			;ca55
	ret c			;ca56
	ld a,b			;ca57
	cp e			;ca58
	bit 7,b		;ca59
	or c			;ca5b
	bit 7,b		;ca5c
	cp d			;ca5e
	set 0,l		;ca5f
	ld l,b			;ca61
	ret c			;ca62
	ld a,b			;ca63
	cp e			;ca64
	bit 7,b		;ca65
	or c			;ca67
	bit 7,b		;ca68
	cp d			;ca6a
	set 1,a		;ca6b
	ld h,e			;ca6d
	ret c			;ca6e
	ld a,b			;ca6f
	cp e			;ca70
	bit 7,b		;ca71
	or c			;ca73
	bit 7,b		;ca74
	cp d			;ca76
	bit 4,b		;ca77
	nop			;ca79
	ld bc,04988h		;ca7a
	sub l			;ca7d
	sub a			;ca7e
	sub (hl)			;ca7f
	sbc a,c			;ca80
	sub a			;ca81
	ld b,e			;ca82
	sbc a,c			;ca83
	ld b,e			;ca84
	sbc a,e			;ca85
	ld b,e			;ca86
	sbc a,l			;ca87
	ld b,e			;ca88
	sbc a,(hl)			;ca89
	ld b,e			;ca8a
	sbc a,a			;ca8b
	ret pe			;ca8c
	inc bc			;ca8d
	ld bc,lf5e6h		;ca8e
	or 0f5h		;ca91
	rst 30h			;ca93
	or 0f8h		;ca94
	ld sp,hl			;ca96
	push hl			;ca97
	jp m,lfcfbh		;ca98
	defb 0fdh,0feh,0ffh	;illegal sequence		;ca9b
	ret pe			;ca9e
lca9fh:
	nop			;ca9f
	ld (bc),a			;caa0
lcaa1h:
	add a,b			;caa1
	ld a,d			;caa2
	sub l			;caa3
	sbc a,c			;caa4
	add a,b			;caa5
	ld a,h			;caa6
	sub a			;caa7
	sbc a,d			;caa8
	add a,b			;caa9
	ld a,(hl)			;caaa
	sbc a,c			;caab
	sbc a,h			;caac
	adc a,a			;caad
	ld a,a			;caae
	sbc a,e			;caaf
	sbc a,a			;cab0
	ret pe			;cab1
	inc bc			;cab2
	ld (bc),a			;cab3
	and 0f7h		;cab4
	ret m			;cab6
	jp m,lfce5h		;cab7
	defb 0fdh,0feh,0ffh	;illegal sequence		;caba
	ret pe			;cabd
lcabeh:
	nop			;cabe
	ld (bc),a			;cabf
	add a,b			;cac0
	ld a,d			;cac1
	sub (hl)			;cac2
	sbc a,d			;cac3
	add a,b			;cac4
	ld a,h			;cac5
	sbc a,b			;cac6
	sbc a,h			;cac7
	add a,b			;cac8
	ld a,(hl)			;cac9
	sbc a,d			;caca
	sbc a,(hl)			;cacb
	adc a,a			;cacc
	ld a,a			;cacd
	sbc a,h			;cace
	sbc a,a			;cacf
	ret pe			;cad0
	inc bc			;cad1
	ld bc,lf9e4h		;cad2
	call m,045ffh		;cad5
	nop			;cad8
	call nc,001cah		;cad9
	add hl,bc			;cadc
	ld (hl),b			;cadd
	xor 0cah		;cade
	and a			;cae0
lcae1h:
	dec c			;cae1
lcae2h:
	and b			;cae2
	ld (de),a			;cae3
	and (hl)			;cae4
	dec d			;cae5
	ld (hl),b			;cae6
	xor 0cah		;cae7
	and c			;cae9
	dec de			;caea
	ld b,c			;caeb
	cp a			;caec
	ret pe			;caed
	and c			;caee
	ld e,e			;caef
	or a			;caf0
	and b			;caf1
	ld (de),a			;caf2
	and a			;caf3
lcaf4h:
	dec c			;caf4
	and e			;caf5
	inc d			;caf6
	and c			;caf7
	djnz lcaa1h		;caf8
	dec c			;cafa
	and b			;cafb
	ld (de),a			;cafc
	and h			;cafd
	ld c,0a0h		;cafe
	inc c			;cb00
	ld h,b			;cb01
	ld (bc),a			;cb02
	add hl,bc			;cb03
	ld (hl),b			;cb04
	dec d			;cb05
	set 0,c		;cb06
lcb08h:
	dec de			;cb08
	rst 8			;cb09
	inc hl			;cb0a
	call z,0702ah		;cb0b
	dec d			;cb0e
	set 0,c		;cb0f
	ld (hl),041h		;cb11
	rst 18h			;cb13
	ret pe			;cb14
	pop bc			;cb15
	halt			;cb16
	rst 10h			;cb17
	rst 8			;cb18
	inc hl			;cb19
	pop bc			;cb1a
	dec de			;cb1b
	push bc			;cb1c
	jr z,lcae1h		;cb1d
	jr nz,lcae2h		;cb1f
	dec de			;cb21
	rst 8			;cb22
	inc hl			;cb23
	ret			;cb24
	inc e			;cb25
	ret nz			;cb26
	jr lcb89h		;cb27
	ld bc,07009h		;cb29
	ld d,c			;cb2c
	bit 6,b		;cb2d
	ld e,a			;cb2f
	bit 6,b		;cb30
	ld d,c			;cb32
	res 4,a		;cb33
	dec c			;cb35
	and h			;cb36
	ld c,0a1h		;cb37
	djnz $-94		;cb39
	ld (de),a			;cb3b
	ld b,d			;cb3c
	ld (hl),b			;cb3d
	ld d,c			;cb3e
	bit 6,b		;cb3f
	ld e,a			;cb41
	bit 6,b		;cb42
	ld d,c			;cb44
	res 5,a		;cb45
	inc hl			;cb47
	and d			;cb48
	jr nz,lcaf4h		;cb49
	inc e			;cb4b
	and c			;cb4c
	dec de			;cb4d
	ld b,e			;cb4e
	cp a			;cb4f
	ret pe			;cb50
	and c			;cb51
	ld e,e			;cb52
lcb53h:
	or a			;cb53
	and b			;cb54
	ld (de),a			;cb55
	and a			;cb56
	dec c			;cb57
	xor e			;cb58
	ld a,(bc)			;cb59
	and a			;cb5a
	dec c			;cb5b
	and b			;cb5c
	ld (de),a			;cb5d
	ld h,b			;cb5e
	and d			;cb5f
	ld c,d			;cb60
	or a			;cb61
	and a			;cb62
	dec c			;cb63
	and c			;cb64
	djnz lcb08h		;cb65
	add hl,bc			;cb67
	and b			;cb68
	inc c			;cb69
	and h			;cb6a
	ld c,060h		;cb6b
	ld (bc),a			;cb6d
	add hl,bc			;cb6e
	ld (hl),b			;cb6f
	sub l			;cb70
	bit 6,b		;cb71
	and e			;cb73
	bit 6,b		;cb74
	sub l			;cb76
	set 0,c		;cb77
	dec de			;cb79
	ret			;cb7a
	inc e			;cb7b
	jp nz,lcf20h		;cb7c
	inc hl			;cb7f
	ld b,d			;cb80
	ld (hl),b			;cb81
	sub l			;cb82
	bit 6,b		;cb83
	and e			;cb85
	bit 6,b		;cb86
	sub l			;cb88
lcb89h:
	set 0,b		;cb89
	ld (de),a			;cb8b
	pop bc			;cb8c
	djnz lcb53h		;cb8d
	ld c,0c7h		;cb8f
	dec c			;cb91
	ld b,e			;cb92
	rst 18h			;cb93
	ret pe			;cb94
	pop bc			;cb95
	halt			;cb96
	rst 10h			;cb97
	rst 8			;cb98
	inc hl			;cb99
	pop bc			;cb9a
	dec de			;cb9b
	add a,015h		;cb9c
	pop bc			;cb9e
	dec de			;cb9f
	rst 8			;cba0
	inc hl			;cba1
	ld h,b			;cba2
	jp ld754h		;cba3
	pop bc			;cba6
	dec de			;cba7
	jp nz,lc020h		;cba8
	ld (de),a			;cbab
	ret nz			;cbac
	jr $-53		;cbad
	inc e			;cbaf
	ld h,b			;cbb0
	exx			;cbb1
	sub 0d7h		;cbb2
	rst 10h			;cbb4
	rst 10h			;cbb5
	ret c			;cbb6
	defb 0ddh,0dfh,068h	;illegal sequence		;cbb7
	ret c			;cbba
	rst 10h			;cbbb
	rst 10h			;cbbc
	sbc a,068h		;cbbd
	nop			;cbbf
	ld bc,le89fh		;cbc0
lcbc3h:
	nop			;cbc3
	ld bc,04d8ah		;cbc4
	sbc a,h			;cbc7
	ld b,d			;cbc8
	adc a,h			;cbc9
	dec c			;cbca
	ld b,d			;cbcb
	adc a,(hl)			;cbcc
	dec c			;cbcd
	ld b,c			;cbce
	add a,b			;cbcf
	ld c,(hl)			;cbd0
	sbc a,e			;cbd1
	ld b,c			;cbd2
	add a,d			;cbd3
	ld c,041h		;cbd4
	add a,h			;cbd6
	ld c,086h		;cbd7
	ld c,(hl)			;cbd9
	sbc a,d			;cbda
	adc a,b			;cbdb
	ld c,08ah		;cbdc
	ld c,041h		;cbde
	adc a,h			;cbe0
lcbe1h:
	ld c,041h		;cbe1
	adc a,(hl)			;cbe3
	ld c,(hl)			;cbe4
	sbc a,c			;cbe5
	ld b,c			;cbe6
	add a,b			;cbe7
	rrca			;cbe8
	ld b,d			;cbe9
	add a,d			;cbea
	rrca			;cbeb
	ld b,e			;cbec
	add a,b			;cbed
	rrca			;cbee
	ld b,d			;cbef
	adc a,(hl)			;cbf0
	ld c,041h		;cbf1
	adc a,h			;cbf3
	ld c,041h		;cbf4
	adc a,d			;cbf6
	ld c,041h		;cbf7
	adc a,b			;cbf9
	ld c,(hl)			;cbfa
	sbc a,d			;cbfb
	add a,(hl)			;cbfc
	ld c,084h		;cbfd
	ld c,082h		;cbff
	ld c,(hl)			;cc01
	sbc a,e			;cc02
	ld b,c			;cc03
	add a,b			;cc04
	ld c,041h		;cc05
	adc a,(hl)			;cc07
	ld c,l			;cc08
	sbc a,h			;cc09
	ld b,c			;cc0a
	adc a,h			;cc0b
	dec c			;cc0c
	nop			;cc0d
	push bc			;cc0e
	srl d		;cc0f
	ld bc,ld67ch		;cc11
	jr nz,lcc25h		;cc14
	and 01fh		;cc16
	ld l,a			;cc18
	ld h,000h		;cc19
	add hl,hl			;cc1b
	ld de,lcc25h		;cc1c
	add hl,de			;cc1f
	ld a,(hl)			;cc20
	inc hl			;cc21
	ld h,(hl)			;cc22
	ld l,a			;cc23
	ret			;cc24
lcc25h:
	or b			;cc25
	nop			;cc26
	ret nc			;cc27
	nop			;cc28
	ret po			;cc29
	nop			;cc2a
	call po,sub_e800h		;cc2b
	nop			;cc2e
	call po,sub_e000h		;cc2f
	nop			;cc32
	out (000h),a		;cc33
	ret nc			;cc35
	nop			;cc36
	jp nc,lda00h		;cc37
lcc3ah:
	nop			;cc3a
	ret po			;cc3b
	nop			;cc3c
	and 000h		;cc3d
	ex de,hl			;cc3f
	nop			;cc40
	jp p,lf700h		;cc41
	nop			;cc44
	defb 0fdh,000h,002h	;illegal sequence		;cc45
	ld bc,00107h		;cc48
	inc c			;cc4b
	ld bc,00113h		;cc4c
	jr $+3		;cc4f
	ld e,001h		;cc51
	inc hl			;cc53
	ld bc,00129h		;cc54
	cpl			;cc57
	ld bc,00134h		;cc58
	add hl,sp			;cc5b
	ld bc,00140h		;cc5c
	ld b,b			;cc5f
	ld bc,00140h		;cc60
	ld h,b			;cc63
	ld bc,010cdh		;cc64
	call z,0a922h		;cc67
	ld a,l			;cc6a
	push hl			;cc6b
	ld bc,07dabh		;cc6c
	call sub_cdb1h		;cc6f
	ld (07daeh),a		;cc72
	call sub_cd04h		;cc75
	pop hl			;cc78
	ld a,(07d88h)		;cc79
	or a			;cc7c
	ret nz			;cc7d
	srl h		;cc7e
	rr l		;cc80
	push hl			;cc82
	ld bc,07dach		;cc83
lcc86h:
	call sub_cdb1h		;cc86
	ld (07dafh),a		;cc89
	or a			;cc8c
	call nz,sub_ccbah		;cc8d
	pop hl			;cc90
	srl h		;cc91
	rr l		;cc93
	ld bc,07dadh		;cc95
	call sub_cdb1h		;cc98
	ld (07db0h),a		;cc9b
	or a			;cc9e
	ret z			;cc9f
sub_cca0h:
	ld hl,07d9ah		;cca0
	ld b,03fh		;cca3
	call sub_cdbah		;cca5
	ld hl,lcdd2h		;cca8
	call sub_cd0fh		;ccab
	ld hl,lcdfbh		;ccae
	call sub_cd0fh		;ccb1
	ld hl,0ce24h		;ccb4
	jp sub_cd0fh		;ccb7
sub_ccbah:
	ld hl,07d9dh		;ccba
	ld b,0ffh		;ccbd
	call sub_cdbah		;ccbf
	ld a,(07e26h)		;ccc2
	or a			;ccc5
	jr z,lcce8h		;ccc6
	ld hl,lcf10h		;ccc8
	call sub_cd0fh		;cccb
	ld hl,lcf51h		;ccce
	call sub_cd0fh		;ccd1
	ld hl,lcf92h		;ccd4
	call sub_cd0fh		;ccd7
	ld hl,079a0h		;ccda
	ld c,0bfh		;ccdd
	out (c),l		;ccdf
	out (c),h		;cce1
	ld hl,lcfd3h		;cce3
	jr sub_cd0fh		;cce6
lcce8h:
	ld hl,lce4dh		;cce8
	call sub_cd0fh		;cceb
	ld hl,lce8eh		;ccee
	call sub_cd0fh		;ccf1
	ld hl,lcecfh		;ccf4
	jr sub_cd0fh		;ccf7
sub_ccf9h:
	sub a			;ccf9
	push af			;ccfa
	call sub_cca0h		;ccfb
	pop af			;ccfe
	push af			;ccff
	call sub_ccbah		;cd00
	pop af			;cd03
sub_cd04h:
	ld hl,07da0h		;cd04
	ld b,03fh		;cd07
	call sub_cdbah		;cd09
	ld hl,ld014h		;cd0c
sub_cd0fh:
	add hl,de			;cd0f
	ld a,(hl)			;cd10
	add a,b			;cd11
	out (0beh),a		;cd12
	inc hl			;cd14
	ld a,(hl)			;cd15
	add a,b			;cd16
	out (0beh),a		;cd17
	inc hl			;cd19
	ld a,(hl)			;cd1a
	add a,b			;cd1b
	out (0beh),a		;cd1c
	inc hl			;cd1e
	ld a,(hl)			;cd1f
	add a,b			;cd20
	out (0beh),a		;cd21
	inc hl			;cd23
	ld a,(hl)			;cd24
	add a,b			;cd25
	out (0beh),a		;cd26
	inc hl			;cd28
	ld a,(hl)			;cd29
	add a,b			;cd2a
	out (0beh),a		;cd2b
	inc hl			;cd2d
	ld a,(hl)			;cd2e
	add a,b			;cd2f
	out (0beh),a		;cd30
	inc hl			;cd32
	ld a,(hl)			;cd33
	add a,b			;cd34
	out (0beh),a		;cd35
	inc hl			;cd37
	ld a,(hl)			;cd38
	add a,b			;cd39
	out (0beh),a		;cd3a
	inc hl			;cd3c
	ld a,(hl)			;cd3d
	add a,b			;cd3e
	out (0beh),a		;cd3f
	inc hl			;cd41
	ld a,(hl)			;cd42
	add a,b			;cd43
	out (0beh),a		;cd44
	inc hl			;cd46
	ld a,(hl)			;cd47
	add a,b			;cd48
	out (0beh),a		;cd49
	inc hl			;cd4b
	ld a,(hl)			;cd4c
	add a,b			;cd4d
	out (0beh),a		;cd4e
	inc hl			;cd50
	ld a,(hl)			;cd51
	add a,b			;cd52
	out (0beh),a		;cd53
	inc hl			;cd55
	ld a,(hl)			;cd56
	add a,b			;cd57
	out (0beh),a		;cd58
	inc hl			;cd5a
	ld a,(hl)			;cd5b
	add a,b			;cd5c
	out (0beh),a		;cd5d
	inc hl			;cd5f
	ld a,(hl)			;cd60
	add a,b			;cd61
	out (0beh),a		;cd62
	inc hl			;cd64
	ld a,(hl)			;cd65
	add a,b			;cd66
	out (0beh),a		;cd67
	inc hl			;cd69
	ld a,(hl)			;cd6a
	add a,b			;cd6b
	out (0beh),a		;cd6c
	inc hl			;cd6e
	ld a,(hl)			;cd6f
	add a,b			;cd70
	out (0beh),a		;cd71
	inc hl			;cd73
	ld a,(hl)			;cd74
	add a,b			;cd75
	out (0beh),a		;cd76
	inc hl			;cd78
	ld a,(hl)			;cd79
	add a,b			;cd7a
	out (0beh),a		;cd7b
	inc hl			;cd7d
	ld a,(hl)			;cd7e
	add a,b			;cd7f
	out (0beh),a		;cd80
	inc hl			;cd82
	ld a,(hl)			;cd83
	add a,b			;cd84
	out (0beh),a		;cd85
	inc hl			;cd87
	ld a,(hl)			;cd88
	add a,b			;cd89
	out (0beh),a		;cd8a
	inc hl			;cd8c
	ld a,(hl)			;cd8d
	add a,b			;cd8e
	out (0beh),a		;cd8f
	inc hl			;cd91
	ld a,(hl)			;cd92
	add a,b			;cd93
	out (0beh),a		;cd94
	inc hl			;cd96
	ld a,(hl)			;cd97
	add a,b			;cd98
	out (0beh),a		;cd99
	inc hl			;cd9b
	ld a,(hl)			;cd9c
	add a,b			;cd9d
	out (0beh),a		;cd9e
	inc hl			;cda0
	ld a,(hl)			;cda1
	add a,b			;cda2
	out (0beh),a		;cda3
	inc hl			;cda5
	ld a,(hl)			;cda6
	add a,b			;cda7
	out (0beh),a		;cda8
	inc hl			;cdaa
	ld a,(hl)			;cdab
	add a,b			;cdac
	out (0beh),a		;cdad
	inc hl			;cdaf
	ret			;cdb0
sub_cdb1h:
	ld a,(bc)			;cdb1
	ld e,a			;cdb2
	ld d,000h		;cdb3
	add hl,de			;cdb5
	ld a,l			;cdb6
	ld (bc),a			;cdb7
	ld a,h			;cdb8
	ret			;cdb9
sub_cdbah:
	add a,(hl)			;cdba
	and b			;cdbb
	ld (hl),a			;cdbc
	ld e,a			;cdbd
	and 007h		;cdbe
	ld b,a			;cdc0
	srl e		;cdc1
	srl e		;cdc3
	srl e		;cdc5
	ld d,000h		;cdc7
	inc hl			;cdc9
	ld a,(hl)			;cdca
	out (0bfh),a		;cdcb
	inc hl			;cdcd
	ld a,(hl)			;cdce
	out (0bfh),a		;cdcf
	ret			;cdd1
lcdd2h:
	nop			;cdd2
	ex af,af'			;cdd3
	djnz lcdeeh		;cdd4
	jr lcdf0h		;cdd6
	jr lcdf2h		;cdd8
	nop			;cdda
	ex af,af'			;cddb
	djnz lcdf6h		;cddc
	jr lcdf8h		;cdde
	jr lcdfah		;cde0
	nop			;cde2
	ex af,af'			;cde3
	djnz $+26		;cde4
	jr $+26		;cde6
	jr $+26		;cde8
	nop			;cdea
	ex af,af'			;cdeb
	djnz $+26		;cdec
lcdeeh:
	jr $+26		;cdee
lcdf0h:
	jr $+26		;cdf0
lcdf2h:
	nop			;cdf2
	ex af,af'			;cdf3
	djnz $+26		;cdf4
lcdf6h:
	jr $+26		;cdf6
lcdf8h:
	jr $+26		;cdf8
lcdfah:
	nop			;cdfa
lcdfbh:
	jr nz,lce25h		;cdfb
	jr nc,lce37h		;cdfd
	jr lce19h		;cdff
	jr lce43h		;ce01
	jr nz,lce2dh		;ce03
	jr nc,lce3fh		;ce05
	jr lce21h		;ce07
	jr lce4bh		;ce09
	jr nz,lce35h		;ce0b
	jr nc,lce47h		;ce0d
	jr lce29h		;ce0f
	jr lce53h		;ce11
	jr nz,lce3dh		;ce13
	jr nc,lce4fh		;ce15
	jr lce31h		;ce17
lce19h:
	jr lce5bh		;ce19
lce1bh:
	jr nz,lce45h		;ce1b
	jr nc,lce57h		;ce1d
	jr lce39h		;ce1f
lce21h:
	jr lce63h		;ce21
	jr nz,lce6dh		;ce23
lce25h:
	ld d,b			;ce25
	ld e,b			;ce26
	ld h,b			;ce27
	ld l,b			;ce28
lce29h:
	ld (hl),b			;ce29
	ld a,b			;ce2a
	add a,b			;ce2b
	ld c,b			;ce2c
lce2dh:
	ld d,b			;ce2d
	ld e,b			;ce2e
	ld h,b			;ce2f
	ld l,b			;ce30
lce31h:
	ld (hl),b			;ce31
	ld a,b			;ce32
	add a,b			;ce33
	ld c,b			;ce34
lce35h:
	ld d,b			;ce35
	ld e,b			;ce36
lce37h:
	ld h,b			;ce37
	ld l,b			;ce38
lce39h:
	ld (hl),b			;ce39
	ld a,b			;ce3a
	add a,b			;ce3b
	ld c,b			;ce3c
lce3dh:
	ld d,b			;ce3d
	ld e,b			;ce3e
lce3fh:
	ld h,b			;ce3f
	ld l,b			;ce40
	ld (hl),b			;ce41
	ld a,b			;ce42
lce43h:
	add a,b			;ce43
lce44h:
	ld c,b			;ce44
lce45h:
	ld d,b			;ce45
	ld e,b			;ce46
lce47h:
	ld h,b			;ce47
	ld l,b			;ce48
	ld (hl),b			;ce49
	ld a,b			;ce4a
lce4bh:
	add a,b			;ce4b
	ld c,b			;ce4c
lce4dh:
	adc a,b			;ce4d
	adc a,b			;ce4e
lce4fh:
	adc a,b			;ce4f
	adc a,b			;ce50
	adc a,b			;ce51
	adc a,b			;ce52
lce53h:
	adc a,b			;ce53
	adc a,b			;ce54
	adc a,b			;ce55
	adc a,b			;ce56
lce57h:
	adc a,b			;ce57
	adc a,b			;ce58
	adc a,b			;ce59
	adc a,b			;ce5a
lce5bh:
	adc a,b			;ce5b
	sub b			;ce5c
	sbc a,b			;ce5d
	and b			;ce5e
	xor b			;ce5f
	or b			;ce60
	cp b			;ce61
	ret nz			;ce62
lce63h:
	ret z			;ce63
	ret nc			;ce64
	sbc a,b			;ce65
	and b			;ce66
	xor b			;ce67
	or b			;ce68
	cp b			;ce69
	ret c			;ce6a
lce6bh:
	ret po			;ce6b
	adc a,b			;ce6c
lce6dh:
	adc a,b			;ce6d
	adc a,b			;ce6e
	adc a,b			;ce6f
	adc a,b			;ce70
	adc a,b			;ce71
	adc a,b			;ce72
	adc a,b			;ce73
	adc a,b			;ce74
	adc a,b			;ce75
	adc a,b			;ce76
	adc a,b			;ce77
	adc a,b			;ce78
	adc a,b			;ce79
	adc a,b			;ce7a
	adc a,b			;ce7b
	sub b			;ce7c
	sbc a,b			;ce7d
	and b			;ce7e
	xor b			;ce7f
	or b			;ce80
	cp b			;ce81
	ret nz			;ce82
	ret z			;ce83
	ret nc			;ce84
	sbc a,b			;ce85
	and b			;ce86
	xor b			;ce87
	or b			;ce88
	cp b			;ce89
	ret c			;ce8a
	ret po			;ce8b
	adc a,b			;ce8c
	adc a,b			;ce8d
lce8eh:
	adc a,b			;ce8e
	adc a,b			;ce8f
	adc a,b			;ce90
	sub b			;ce91
	sbc a,b			;ce92
	and b			;ce93
	xor b			;ce94
	or b			;ce95
	cp b			;ce96
	ret nz			;ce97
	ret z			;ce98
	ret nc			;ce99
	sbc a,b			;ce9a
	and b			;ce9b
	ret pe			;ce9c
	ret p			;ce9d
	or b			;ce9e
	or b			;ce9f
	or b			;cea0
	or b			;cea1
	or b			;cea2
	or b			;cea3
	or b			;cea4
	or b			;cea5
	or b			;cea6
	or b			;cea7
	or b			;cea8
	or b			;cea9
	or b			;ceaa
	or b			;ceab
	ret m			;ceac
	ret po			;cead
lceaeh:
	adc a,b			;ceae
	adc a,b			;ceaf
	adc a,b			;ceb0
	sub b			;ceb1
	sbc a,b			;ceb2
	and b			;ceb3
	xor b			;ceb4
	or b			;ceb5
	cp b			;ceb6
	ret nz			;ceb7
	ret z			;ceb8
	ret nc			;ceb9
	sbc a,b			;ceba
	and b			;cebb
	ret pe			;cebc
	ret p			;cebd
	or b			;cebe
	or b			;cebf
	or b			;cec0
	or b			;cec1
	or b			;cec2
	or b			;cec3
	or b			;cec4
	or b			;cec5
	or b			;cec6
	or b			;cec7
	or b			;cec8
	or b			;cec9
	or b			;ceca
	or b			;cecb
	ret m			;cecc
	ret po			;cecd
	adc a,b			;cece
lcecfh:
	nop			;cecf
	ex af,af'			;ced0
	djnz lceebh		;ced1
	jr nz,lcef5h		;ced3
	jr nz,lcef7h		;ced5
	jr nz,lcef9h		;ced7
	jr z,lcf0bh		;ced9
	jr nz,lcefdh		;cedb
	jr nz,lceffh		;cedd
	jr nz,lcf01h		;cedf
	jr nz,lcf03h		;cee1
	jr nz,lcf05h		;cee3
	jr nz,lcf07h		;cee5
	jr nz,lcf09h		;cee7
	jr nz,lcf0bh		;cee9
lceebh:
	jr nz,lcf0dh		;ceeb
	jr nz,lcf27h		;ceed
lceefh:
	nop			;ceef
	ex af,af'			;cef0
	djnz lcf0bh		;cef1
	jr nz,lcf15h		;cef3
lcef5h:
	jr nz,lcf17h		;cef5
lcef7h:
	jr nz,lcf19h		;cef7
lcef9h:
	jr z,lcf2bh		;cef9
	jr nz,lcf1dh		;cefb
lcefdh:
	jr nz,lcf1fh		;cefd
lceffh:
	jr nz,lcf21h		;ceff
lcf01h:
	jr nz,lcf23h		;cf01
lcf03h:
	jr nz,lcf25h		;cf03
lcf05h:
	jr nz,lcf27h		;cf05
lcf07h:
	jr nz,lcf29h		;cf07
lcf09h:
	jr nz,lcf2bh		;cf09
lcf0bh:
	jr nz,lcf2dh		;cf0b
lcf0dh:
	jr nz,lcf47h		;cf0d
	nop			;cf0f
lcf10h:
	adc a,b			;cf10
	ret z			;cf11
	ret nc			;cf12
	ret c			;cf13
	adc a,b			;cf14
lcf15h:
	adc a,b			;cf15
	sub b			;cf16
lcf17h:
	sbc a,b			;cf17
	and b			;cf18
lcf19h:
	and b			;cf19
	xor b			;cf1a
	or b			;cf1b
	adc a,b			;cf1c
lcf1dh:
	adc a,b			;cf1d
	sub b			;cf1e
lcf1fh:
	sbc a,b			;cf1f
lcf20h:
	and b			;cf20
lcf21h:
	and b			;cf21
	and b			;cf22
lcf23h:
	and b			;cf23
	xor b			;cf24
lcf25h:
	or b			;cf25
	adc a,b			;cf26
lcf27h:
	adc a,b			;cf27
	sub b			;cf28
lcf29h:
	sbc a,b			;cf29
	and b			;cf2a
lcf2bh:
	and b			;cf2b
	xor b			;cf2c
lcf2dh:
	or b			;cf2d
	adc a,b			;cf2e
	adc a,b			;cf2f
lcf30h:
	adc a,b			;cf30
	ret z			;cf31
	ret nc			;cf32
	ret c			;cf33
	adc a,b			;cf34
	adc a,b			;cf35
	sub b			;cf36
	sbc a,b			;cf37
	and b			;cf38
	and b			;cf39
	xor b			;cf3a
	or b			;cf3b
	adc a,b			;cf3c
	adc a,b			;cf3d
	sub b			;cf3e
	sbc a,b			;cf3f
	and b			;cf40
	and b			;cf41
	and b			;cf42
	and b			;cf43
	xor b			;cf44
	or b			;cf45
	adc a,b			;cf46
lcf47h:
	adc a,b			;cf47
	sub b			;cf48
	sbc a,b			;cf49
	and b			;cf4a
	and b			;cf4b
	xor b			;cf4c
	or b			;cf4d
	adc a,b			;cf4e
	adc a,b			;cf4f
	adc a,b			;cf50
lcf51h:
	adc a,b			;cf51
	ret pe			;cf52
	ret p			;cf53
	ret m			;cf54
	adc a,b			;cf55
	sub b			;cf56
	sbc a,b			;cf57
	and b			;cf58
	and b			;cf59
	and b			;cf5a
	and b			;cf5b
	xor b			;cf5c
	or b			;cf5d
	adc a,b			;cf5e
	adc a,b			;cf5f
	sub b			;cf60
	sbc a,b			;cf61
	and b			;cf62
	and b			;cf63
	xor b			;cf64
	or b			;cf65
	adc a,b			;cf66
	adc a,b			;cf67
	adc a,b			;cf68
	sub b			;cf69
	sbc a,b			;cf6a
	and b			;cf6b
	and b			;cf6c
	xor b			;cf6d
	or b			;cf6e
	adc a,b			;cf6f
	adc a,b			;cf70
lcf71h:
	adc a,b			;cf71
	ret pe			;cf72
	ret p			;cf73
	ret m			;cf74
	adc a,b			;cf75
	sub b			;cf76
	sbc a,b			;cf77
	and b			;cf78
	and b			;cf79
	and b			;cf7a
	and b			;cf7b
	xor b			;cf7c
	or b			;cf7d
	adc a,b			;cf7e
	adc a,b			;cf7f
	sub b			;cf80
	sbc a,b			;cf81
	and b			;cf82
	and b			;cf83
	xor b			;cf84
	or b			;cf85
	adc a,b			;cf86
	adc a,b			;cf87
	adc a,b			;cf88
	sub b			;cf89
	sbc a,b			;cf8a
	and b			;cf8b
	and b			;cf8c
	xor b			;cf8d
	or b			;cf8e
	adc a,b			;cf8f
	adc a,b			;cf90
	adc a,b			;cf91
lcf92h:
	nop			;cf92
	ex af,af'			;cf93
	djnz $+26		;cf94
	nop			;cf96
	nop			;cf97
	nop			;cf98
	jr nz,$+42		;cf99
	jr nc,lcfd5h		;cf9b
	nop			;cf9d
	nop			;cf9e
	nop			;cf9f
	nop			;cfa0
	nop			;cfa1
	jr nz,$+42		;cfa2
	jr nc,lcfdeh		;cfa4
	nop			;cfa6
	nop			;cfa7
	nop			;cfa8
	nop			;cfa9
	nop			;cfaa
	jr nz,lcfd5h		;cfab
	jr nc,lcfe7h		;cfad
	nop			;cfaf
	nop			;cfb0
	nop			;cfb1
lcfb2h:
	nop			;cfb2
	ex af,af'			;cfb3
	djnz $+26		;cfb4
	nop			;cfb6
	nop			;cfb7
	nop			;cfb8
	jr nz,lcfe3h		;cfb9
	jr nc,lcff5h		;cfbb
	nop			;cfbd
	nop			;cfbe
	nop			;cfbf
	nop			;cfc0
	nop			;cfc1
	jr nz,lcfech		;cfc2
	jr nc,lcffeh		;cfc4
	nop			;cfc6
	nop			;cfc7
	nop			;cfc8
	nop			;cfc9
	nop			;cfca
	jr nz,lcff5h		;cfcb
	jr nc,ld007h		;cfcd
sub_cfcfh:
	nop			;cfcf
	nop			;cfd0
	nop			;cfd1
	nop			;cfd2
lcfd3h:
	adc a,b			;cfd3
	adc a,b			;cfd4
lcfd5h:
	adc a,b			;cfd5
	adc a,b			;cfd6
	adc a,b			;cfd7
	adc a,b			;cfd8
	adc a,b			;cfd9
	adc a,b			;cfda
	cp b			;cfdb
	ret nz			;cfdc
	adc a,b			;cfdd
lcfdeh:
	adc a,b			;cfde
	adc a,b			;cfdf
	adc a,b			;cfe0
	adc a,b			;cfe1
	adc a,b			;cfe2
lcfe3h:
	adc a,b			;cfe3
	cp b			;cfe4
	ret nz			;cfe5
	adc a,b			;cfe6
lcfe7h:
	adc a,b			;cfe7
	adc a,b			;cfe8
	adc a,b			;cfe9
	adc a,b			;cfea
	adc a,b			;cfeb
lcfech:
	adc a,b			;cfec
	cp b			;cfed
	ret nz			;cfee
	adc a,b			;cfef
	adc a,b			;cff0
	adc a,b			;cff1
	adc a,b			;cff2
	adc a,b			;cff3
	adc a,b			;cff4
lcff5h:
	adc a,b			;cff5
	adc a,b			;cff6
	adc a,b			;cff7
	adc a,b			;cff8
	adc a,b			;cff9
lcffah:
	adc a,b			;cffa
	cp b			;cffb
	ret nz			;cffc
	adc a,b			;cffd
lcffeh:
	adc a,b			;cffe
	adc a,b			;cfff
	adc a,b			;d000
	adc a,b			;d001
	adc a,b			;d002
	adc a,b			;d003
	cp b			;d004
	ret nz			;d005
	adc a,b			;d006
ld007h:
	adc a,b			;d007
	adc a,b			;d008
ld009h:
	adc a,b			;d009
ld00ah:
	adc a,b			;d00a
	adc a,b			;d00b
	adc a,b			;d00c
	cp b			;d00d
	ret nz			;d00e
	adc a,b			;d00f
	adc a,b			;d010
	adc a,b			;d011
	adc a,b			;d012
	adc a,b			;d013
ld014h:
	ld b,b			;d014
	ld c,b			;d015
	ld d,b			;d016
	ld e,b			;d017
sub_d018h:
	ld h,b			;d018
sub_d019h:
	ld l,b			;d019
	ld (hl),b			;d01a
sub_d01bh:
	ld a,b			;d01b
sub_d01ch:
	ld b,b			;d01c
	ld c,b			;d01d
sub_d01eh:
	ld d,b			;d01e
	ld e,b			;d01f
	ld h,b			;d020
ld021h:
	ld l,b			;d021
sub_d022h:
	ld (hl),b			;d022
	ld a,b			;d023
	ld b,b			;d024
	ld c,b			;d025
	ld d,b			;d026
sub_d027h:
	ld e,b			;d027
	ld h,b			;d028
	ld l,b			;d029
	ld (hl),b			;d02a
	ld a,b			;d02b
	ld b,b			;d02c
	ld c,b			;d02d
	ld d,b			;d02e
	ld e,b			;d02f
	ld h,b			;d030
ld031h:
	ld l,b			;d031
ld032h:
	ld (hl),b			;d032
sub_d033h:
	ld a,b			;d033
ld034h:
	ld b,b			;d034
	ld c,b			;d035
	ld d,b			;d036
ld037h:
	ld e,b			;d037
ld038h:
	ld h,b			;d038
sub_d039h:
	ld l,b			;d039
	ld (hl),b			;d03a
	ld a,b			;d03b
	ld b,b			;d03c
	nop			;d03d
	jr c,ld08ch		;d03e
	add a,0c6h		;d040
ld042h:
	add a,064h		;d042
	jr c,ld046h		;d044
ld046h:
	jr $+58		;d046
ld048h:
	jr $+26		;d048
	jr ld064h		;d04a
	inc a			;d04c
	nop			;d04d
	ld a,h			;d04e
	add a,08eh		;d04f
ld051h:
	inc a			;d051
	ld (hl),b			;d052
	ret po			;d053
	cp 000h		;d054
	cp 00ch		;d056
	jr ld096h		;d058
	ld c,0ceh		;d05a
	ld a,b			;d05c
	nop			;d05d
	inc e			;d05e
	inc a			;d05f
	ld l,h			;d060
	call z,00cfeh		;d061
ld064h:
	inc c			;d064
	nop			;d065
	call m,sub_fcc0h		;d066
ld069h:
	ld c,006h		;d069
	add a,07ch		;d06b
	nop			;d06d
	inc a			;d06e
	ld h,b			;d06f
	ret nz			;d070
ld071h:
	call m,sub_c6c6h		;d071
	ld a,h			;d074
	nop			;d075
	cp 0c6h		;d076
	inc c			;d078
	jr $+50		;d079
	jr nc,ld0adh		;d07b
	nop			;d07d
	ld a,b			;d07e
	call nz,078e4h		;d07f
	sbc a,h			;d082
	adc a,h			;d083
	ld a,b			;d084
	nop			;d085
	ld a,h			;d086
	add a,0c6h		;d087
	ld a,(hl)			;d089
	ld b,00ch		;d08a
ld08ch:
	ld a,b			;d08c
ld08dh:
	nop			;d08d
ld08eh:
	jr c,ld0fch		;d08e
	add a,0c6h		;d090
	cp 0c6h		;d092
	add a,000h		;d094
ld096h:
	call m,sub_c6c6h		;d096
	call m,sub_c6c6h		;d099
	call m,03c00h		;d09c
	ld h,(hl)			;d09f
	ret nz			;d0a0
	ret nz			;d0a1
	ret nz			;d0a2
	ld h,(hl)			;d0a3
	inc a			;d0a4
	nop			;d0a5
	ret m			;d0a6
	call z,sub_c6c6h		;d0a7
	add a,0cch		;d0aa
	ret m			;d0ac
ld0adh:
	nop			;d0ad
	cp 0c0h		;d0ae
	ret nz			;d0b0
	ret m			;d0b1
	ret nz			;d0b2
	ret nz			;d0b3
	cp 000h		;d0b4
	cp 0c0h		;d0b6
	ret nz			;d0b8
	ret m			;d0b9
	ret nz			;d0ba
	ret nz			;d0bb
	ret nz			;d0bc
	nop			;d0bd
	ld a,060h		;d0be
ld0c0h:
	ret nz			;d0c0
	adc a,0c6h		;d0c1
	ld h,(hl)			;d0c3
	ld a,000h		;d0c4
	add a,0c6h		;d0c6
	add a,0feh		;d0c8
	add a,0c6h		;d0ca
	add a,000h		;d0cc
	call m,03030h		;d0ce
ld0d1h:
	jr nc,ld103h		;d0d1
	jr nc,ld0d1h		;d0d3
	nop			;d0d5
	ld b,006h		;d0d6
	ld b,006h		;d0d8
	ld b,0c6h		;d0da
	ld a,b			;d0dc
	nop			;d0dd
	add a,0cch		;d0de
	ret c			;d0e0
	ret p			;d0e1
	ret c			;d0e2
	call z,000c6h		;d0e3
	ret nz			;d0e6
	ret nz			;d0e7
	ret nz			;d0e8
	ret nz			;d0e9
	ret nz			;d0ea
	ret nz			;d0eb
	cp 000h		;d0ec
	add a,0eeh		;d0ee
	cp 0d6h		;d0f0
	add a,0c6h		;d0f2
	add a,000h		;d0f4
	add a,0e6h		;d0f6
	or 0feh		;d0f8
	sbc a,0ceh		;d0fa
ld0fch:
	add a,000h		;d0fc
	ld a,h			;d0fe
	add a,0c6h		;d0ff
	add a,0c6h		;d101
ld103h:
	add a,07ch		;d103
	nop			;d105
	call m,sub_c6c6h		;d106
	add a,0fch		;d109
	ret nz			;d10b
	ret nz			;d10c
	nop			;d10d
	ld a,h			;d10e
	add a,0c6h		;d10f
	add a,0d6h		;d111
	adc a,07ch		;d113
	nop			;d115
	call m,sub_c6c6h		;d116
	adc a,0f8h		;d119
	call c,000ceh		;d11b
	ld a,b			;d11e
	call z,07cc0h		;d11f
	ld b,0c6h		;d122
	ld a,h			;d124
	nop			;d125
	call m,03030h		;d126
	jr nc,ld15bh		;d129
	jr nc,$+50		;d12b
	nop			;d12d
	add a,0c6h		;d12e
	add a,0c6h		;d130
	add a,0c6h		;d132
	ld a,h			;d134
	nop			;d135
	add a,0c6h		;d136
	add a,0eeh		;d138
	ld l,h			;d13a
	jr c,ld14dh		;d13b
	nop			;d13d
	add a,0c6h		;d13e
	add a,0d6h		;d140
	cp 0eeh		;d142
	add a,000h		;d144
	add a,0c6h		;d146
	ld l,h			;d148
	jr c,ld1b7h		;d149
	add a,0c6h		;d14b
ld14dh:
	nop			;d14d
	call z,0cccch		;d14e
	ld a,b			;d151
	jr nc,ld184h		;d152
	jr nc,ld156h		;d154
ld156h:
	cp 00eh		;d156
	inc e			;d158
	jr c,ld1cbh		;d159
ld15bh:
	ret po			;d15b
	cp 000h		;d15c
	inc bc			;d15e
	rlca			;d15f
	ld c,01ch		;d160
	jr ld1a4h		;d162
	ld h,b			;d164
	nop			;d165
	nop			;d166
	nop			;d167
	jr ld16ah		;d168
ld16ah:
	nop			;d16a
	jr ld16dh		;d16b
ld16dh:
	nop			;d16d
	call z,0cccch		;d16e
	nop			;d171
	nop			;d172
	nop			;d173
	nop			;d174
	nop			;d175
	nop			;d176
	nop			;d177
	nop			;d178
	ld a,b			;d179
	ld a,b			;d17a
	nop			;d17b
	nop			;d17c
	nop			;d17d
	call m,sub_c6c6h		;d17e
	add a,0fch		;d181
	ret nz			;d183
ld184h:
	ret nz			;d184
	nop			;d185
	add a,(hl)			;d186
	add a,06fh		;d187
	ld l,a			;d189
	ld a,a			;d18a
	ccf			;d18b
	add hl,sp			;d18c
	jr nc,ld19fh		;d18d
	jr nc,ld1f1h		;d18f
	ld h,b			;d191
	ret po			;d192
	ret nz			;d193
	ret nz			;d194
	ret nz			;d195
	nop			;d196
	jr ld1d5h		;d197
	inc a			;d199
	inc a			;d19a
	jr ld19dh		;d19b
ld19dh:
	nop			;d19d
	nop			;d19e
ld19fh:
	nop			;d19f
	nop			;d1a0
	nop			;d1a1
	nop			;d1a2
	nop			;d1a3
ld1a4h:
	nop			;d1a4
	inc bc			;d1a5
	nop			;d1a6
	nop			;d1a7
	jr nz,ld1cah		;d1a8
	ld (hl),c			;d1aa
	daa			;d1ab
	rst 38h			;d1ac
	rst 38h			;d1ad
	nop			;d1ae
	nop			;d1af
	nop			;d1b0
	ld a,h			;d1b1
	add a,d			;d1b2
	ld bc,sub_ffffh		;d1b3
	nop			;d1b6
ld1b7h:
	nop			;d1b7
	nop			;d1b8
	nop			;d1b9
	nop			;d1ba
	nop			;d1bb
	ret nz			;d1bc
	ret po			;d1bd
	rlca			;d1be
	ld (bc),a			;d1bf
	ld bc,00101h		;d1c0
	nop			;d1c3
	nop			;d1c4
	nop			;d1c5
	rst 38h			;d1c6
	jr c,$-55		;d1c7
	ld b,l			;d1c9
ld1cah:
	rst 0			;d1ca
ld1cbh:
	nop			;d1cb
	nop			;d1cc
	nop			;d1cd
	rst 38h			;d1ce
	jp po,00a0eh		;d1cf
	ld c,000h		;d1d2
	nop			;d1d4
ld1d5h:
	nop			;d1d5
	add a,b			;d1d6
	add a,b			;d1d7
	nop			;d1d8
	nop			;d1d9
	nop			;d1da
	nop			;d1db
	nop			;d1dc
	nop			;d1dd
	nop			;d1de
	nop			;d1df
	nop			;d1e0
	inc b			;d1e1
	ld (bc),a			;d1e2
	rst 38h			;d1e3
	ld (bc),a			;d1e4
	inc b			;d1e5
	nop			;d1e6
	nop			;d1e7
	nop			;d1e8
	ret po			;d1e9
	add a,b			;d1ea
	ret nz			;d1eb
	add a,b			;d1ec
	ret po			;d1ed
	nop			;d1ee
	nop			;d1ef
	nop			;d1f0
ld1f1h:
	ld (hl),b			;d1f1
	jr nz,ld214h		;d1f2
	and b			;d1f4
	ld b,b			;d1f5
	nop			;d1f6
	nop			;d1f7
	nop			;d1f8
	ld h,b			;d1f9
	sub b			;d1fa
	sub b			;d1fb
	sub b			;d1fc
	ld h,b			;d1fd
	nop			;d1fe
	nop			;d1ff
	nop			;d200
	ret po			;d201
	ld b,b			;d202
	ld b,b			;d203
	ld b,b			;d204
	ld b,b			;d205
	nop			;d206
	nop			;d207
	nop			;d208
	rrca			;d209
	inc bc			;d20a
	ld b,00ch		;d20b
	rrca			;d20d
	nop			;d20e
	ret nz			;d20f
	ret nz			;d210
	ret nz			;d211
	ret nz			;d212
	ret nz			;d213
ld214h:
	nop			;d214
	nop			;d215
	nop			;d216
	ret p			;d217
	ret p			;d218
	ret p			;d219
	ret p			;d21a
	ret p			;d21b
	nop			;d21c
	nop			;d21d
	nop			;d21e
	call m,sub_fcfch		;d21f
	call m,000fch		;d222
	nop			;d225
	nop			;d226
	rst 38h			;d227
	rst 38h			;d228
	rst 38h			;d229
	rst 38h			;d22a
	rst 38h			;d22b
	nop			;d22c
	nop			;d22d
	nop			;d22e
	nop			;d22f
	nop			;d230
	nop			;d231
	nop			;d232
	nop			;d233
	nop			;d234
	nop			;d235
	nop			;d236
	inc bc			;d237
	inc bc			;d238
	inc bc			;d239
	inc bc			;d23a
	inc bc			;d23b
	nop			;d23c
	nop			;d23d
	nop			;d23e
	jp lc3c3h		;d23f
	jp 000c3h		;d242
	nop			;d245
	nop			;d246
	di			;d247
	di			;d248
	di			;d249
	di			;d24a
	di			;d24b
	nop			;d24c
	nop			;d24d
	nop			;d24e
	rst 38h			;d24f
	rst 38h			;d250
	rst 38h			;d251
	rst 38h			;d252
	rst 38h			;d253
	nop			;d254
	nop			;d255
	rrca			;d256
	rrca			;d257
	rrca			;d258
	rrca			;d259
	rrca			;d25a
	rrca			;d25b
	rrca			;d25c
	rrca			;d25d
	ret p			;d25e
	ret p			;d25f
	ret p			;d260
	ret p			;d261
	ret p			;d262
	ret p			;d263
	ret p			;d264
	ret p			;d265
	nop			;d266
	nop			;d267
	nop			;d268
	nop			;d269
	nop			;d26a
	call m,03030h		;d26b
	nop			;d26e
	nop			;d26f
	nop			;d270
	nop			;d271
	nop			;d272
	call m,03030h		;d273
	nop			;d276
	nop			;d277
	nop			;d278
	nop			;d279
	nop			;d27a
	add a,0eeh		;d27b
	cp 000h		;d27d
	nop			;d27f
	nop			;d280
	nop			;d281
	nop			;d282
	ccf			;d283
	jr nc,ld2b6h		;d284
	jr nc,ld2b8h		;d286
	jr nc,ld2bah		;d288
	nop			;d28a
	nop			;d28b
	nop			;d28c
	nop			;d28d
ld28eh:
	jr nc,ld2c0h		;d28e
	jr nc,ld28eh		;d290
	nop			;d292
	nop			;d293
	nop			;d294
	nop			;d295
	sub 0c6h		;d296
	add a,0c6h		;d298
	nop			;d29a
	nop			;d29b
	nop			;d29c
	nop			;d29d
	ld a,030h		;d29e
	jr nc,ld2e1h		;d2a0
	nop			;d2a2
	nop			;d2a3
	nop			;d2a4
	nop			;d2a5
	nop			;d2a6
	jr c,ld2f5h		;d2a7
	add a,000h		;d2a9
	nop			;d2ab
	nop			;d2ac
	nop			;d2ad
	nop			;d2ae
	jr $+58		;d2af
	jr ld2b3h		;d2b1
ld2b3h:
	nop			;d2b3
	nop			;d2b4
	nop			;d2b5
ld2b6h:
	nop			;d2b6
	ld a,h			;d2b7
ld2b8h:
	add a,08eh		;d2b8
ld2bah:
	nop			;d2ba
	nop			;d2bb
	nop			;d2bc
	nop			;d2bd
	nop			;d2be
	ld a,(hl)			;d2bf
ld2c0h:
	inc c			;d2c0
	jr ld2c3h		;d2c1
ld2c3h:
	nop			;d2c3
	nop			;d2c4
	nop			;d2c5
	nop			;d2c6
	inc e			;d2c7
	inc a			;d2c8
	ld l,h			;d2c9
	nop			;d2ca
	nop			;d2cb
	nop			;d2cc
	nop			;d2cd
	nop			;d2ce
	call m,sub_fcc0h		;d2cf
	nop			;d2d2
	nop			;d2d3
	nop			;d2d4
	nop			;d2d5
	nop			;d2d6
	inc a			;d2d7
	ld h,b			;d2d8
	ret nz			;d2d9
	nop			;d2da
	nop			;d2db
	nop			;d2dc
	nop			;d2dd
	nop			;d2de
	cp 0c6h		;d2df
ld2e1h:
	inc c			;d2e1
	nop			;d2e2
	nop			;d2e3
	nop			;d2e4
	nop			;d2e5
	nop			;d2e6
	ld a,b			;d2e7
	call nz,000e4h		;d2e8
	nop			;d2eb
	nop			;d2ec
	nop			;d2ed
	nop			;d2ee
	ld a,h			;d2ef
	add a,0c6h		;d2f0
	add a,0c6h		;d2f2
	ld h,h			;d2f4
ld2f5h:
	jr c,ld2f7h		;d2f5
ld2f7h:
	nop			;d2f7
	nop			;d2f8
	nop			;d2f9
	jr $+26		;d2fa
	jr ld33ah		;d2fc
	nop			;d2fe
	nop			;d2ff
	nop			;d300
	nop			;d301
	inc a			;d302
	ld (hl),b			;d303
	ret po			;d304
	cp 000h		;d305
	nop			;d307
	nop			;d308
	nop			;d309
	inc a			;d30a
	ld c,0ceh		;d30b
	ld a,b			;d30d
	nop			;d30e
	nop			;d30f
	nop			;d310
	nop			;d311
	call z,00cfeh		;d312
	inc c			;d315
	nop			;d316
	nop			;d317
	nop			;d318
	nop			;d319
	ld c,006h		;d31a
	add a,07ch		;d31c
	nop			;d31e
	nop			;d31f
	nop			;d320
	nop			;d321
	call m,sub_c6c6h		;d322
	ld a,h			;d325
	nop			;d326
	nop			;d327
	nop			;d328
	nop			;d329
	jr ld35ch		;d32a
	jr nc,ld35eh		;d32c
	nop			;d32e
	nop			;d32f
	nop			;d330
	nop			;d331
	ld a,b			;d332
	sbc a,h			;d333
	adc a,h			;d334
	ld a,b			;d335
	nop			;d336
	nop			;d337
	nop			;d338
	nop			;d339
ld33ah:
	ld a,(hl)			;d33a
	ld b,00ch		;d33b
	ld a,b			;d33d
ld33eh:
	nop			;d33e
	nop			;d33f
	nop			;d340
	nop			;d341
	nop			;d342
	nop			;d343
	nop			;d344
	nop			;d345
	ld bc,00703h		;d346
	rlca			;d349
	rrca			;d34a
	rrca			;d34b
	ccf			;d34c
	cpl			;d34d
	nop			;d34e
	nop			;d34f
	add a,b			;d350
	add a,b			;d351
	ret nz			;d352
	ret nz			;d353
	ret po			;d354
	ret p			;d355
	nop			;d356
	nop			;d357
	nop			;d358
	nop			;d359
	nop			;d35a
	nop			;d35b
ld35ch:
	nop			;d35c
	nop			;d35d
ld35eh:
	nop			;d35e
	ld bc,00303h		;d35f
	rlca			;d362
	ld e,03dh		;d363
	ld a,l			;d365
	rst 18h			;d366
	rst 18h			;d367
	cp a			;d368
	cp a			;d369
	ld a,a			;d36a
	rst 38h			;d36b
	rst 38h			;d36c
	rst 38h			;d36d
	ret p			;d36e
	call m,sub_fcf8h		;d36f
	rst 38h			;d372
	rst 38h			;d373
	rst 38h			;d374
	rst 38h			;d375
	nop			;d376
	nop			;d377
	nop			;d378
	add a,b			;d379
	add a,b			;d37a
	ret nz			;d37b
	ret nz			;d37c
	jp po,00000h		;d37d
	nop			;d380
	nop			;d381
	nop			;d382
	nop			;d383
	nop			;d384
	nop			;d385
	ei			;d386
	rst 30h			;d387
	rst 8			;d388
	scf			;d389
	ei			;d38a
	defb 0fdh,0fdh,0feh	;illegal sequence		;d38b
	rst 38h			;d38e
	rst 38h			;d38f
	rst 38h			;d390
	rst 38h			;d391
	rst 38h			;d392
	rst 38h			;d393
	rst 38h			;d394
	rst 38h			;d395
	rst 38h			;d396
	rst 38h			;d397
	rst 38h			;d398
	cp 0feh		;d399
	defb 0fdh,0fbh,0ffh	;illegal sequence		;d39b
	rst 30h			;d39e
	rst 28h			;d39f
	sbc a,a			;d3a0
	ld a,a			;d3a1
	rst 38h			;d3a2
	rst 38h			;d3a3
	rst 38h			;d3a4
	rst 38h			;d3a5
	nop			;d3a6
	ret p			;d3a7
	rst 38h			;d3a8
	rst 38h			;d3a9
	rst 38h			;d3aa
	rst 38h			;d3ab
	rst 38h			;d3ac
	rst 38h			;d3ad
	nop			;d3ae
	nop			;d3af
	nop			;d3b0
	nop			;d3b1
	ret nz			;d3b2
	ret po			;d3b3
	call m,000ffh		;d3b4
	nop			;d3b7
	nop			;d3b8
	nop			;d3b9
	inc bc			;d3ba
	inc bc			;d3bb
	rlca			;d3bc
	rrca			;d3bd
	ld bc,07f0fh		;d3be
	ld a,a			;d3c1
	cp 0fdh		;d3c2
	ei			;d3c4
	rst 30h			;d3c5
	nop			;d3c6
	nop			;d3c7
	nop			;d3c8
	nop			;d3c9
	nop			;d3ca
	nop			;d3cb
	nop			;d3cc
	nop			;d3cd
	nop			;d3ce
	nop			;d3cf
	nop			;d3d0
	nop			;d3d1
	nop			;d3d2
	nop			;d3d3
	nop			;d3d4
	nop			;d3d5
	nop			;d3d6
	nop			;d3d7
	nop			;d3d8
	nop			;d3d9
	rlca			;d3da
	rra			;d3db
	ld a,a			;d3dc
	rst 38h			;d3dd
	nop			;d3de
	nop			;d3df
	rra			;d3e0
	rst 38h			;d3e1
	rst 38h			;d3e2
	rst 38h			;d3e3
	rst 38h			;d3e4
	rst 38h			;d3e5
	nop			;d3e6
	ld a,a			;d3e7
	rst 38h			;d3e8
	rst 38h			;d3e9
	rst 38h			;d3ea
	rst 38h			;d3eb
	rst 38h			;d3ec
	rst 38h			;d3ed
	rst 38h			;d3ee
	rst 38h			;d3ef
	rst 38h			;d3f0
	rst 38h			;d3f1
	rst 38h			;d3f2
	rst 38h			;d3f3
	rst 38h			;d3f4
	rst 38h			;d3f5
	rst 38h			;d3f6
	rst 38h			;d3f7
	rst 38h			;d3f8
	rst 38h			;d3f9
	rst 38h			;d3fa
	rst 38h			;d3fb
	rst 38h			;d3fc
	rst 38h			;d3fd
	nop			;d3fe
	cp 0ffh		;d3ff
	rst 38h			;d401
	rst 38h			;d402
	rst 38h			;d403
	rst 38h			;d404
	rst 38h			;d405
	nop			;d406
	nop			;d407
	ret m			;d408
	rst 38h			;d409
	rst 38h			;d40a
	rst 38h			;d40b
	rst 38h			;d40c
	rst 38h			;d40d
	nop			;d40e
	nop			;d40f
	nop			;d410
	nop			;d411
	ret po			;d412
	ret m			;d413
	cp 0ffh		;d414
	nop			;d416
	cp 0ffh		;d417
	rst 38h			;d419
	rst 38h			;d41a
	rst 38h			;d41b
	rst 38h			;d41c
	rst 38h			;d41d
	nop			;d41e
	nop			;d41f
	ret nz			;d420
	ret po			;d421
	ret m			;d422
	call m,sub_fffch		;d423
	nop			;d426
	ld a,a			;d427
	rst 38h			;d428
	rst 38h			;d429
	rst 38h			;d42a
	rst 38h			;d42b
	rst 38h			;d42c
	rst 38h			;d42d
	cp 0fdh		;d42e
	ei			;d430
	rst 20h			;d431
	rst 18h			;d432
	rst 18h			;d433
	cp a			;d434
	cp a			;d435
	rst 38h			;d436
	rst 38h			;d437
	rst 38h			;d438
	rst 38h			;d439
	rst 38h			;d43a
	rst 38h			;d43b
	rst 38h			;d43c
	rst 38h			;d43d
ld43eh:
	ret po			;d43e
	call m,sub_ffffh		;d43f
	rst 38h			;d442
	rst 38h			;d443
	rst 38h			;d444
	rst 38h			;d445
ld446h:
	nop			;d446
	nop			;d447
	rra			;d448
	rst 38h			;d449
	rst 38h			;d44a
	rst 38h			;d44b
	rst 38h			;d44c
	rst 38h			;d44d
	nop			;d44e
	ld a,a			;d44f
	rst 38h			;d450
	rst 38h			;d451
	rst 38h			;d452
	rst 38h			;d453
	rst 38h			;d454
	rst 38h			;d455
	cp 0fdh		;d456
	ei			;d458
	rst 20h			;d459
	rst 18h			;d45a
	cp a			;d45b
	cp a			;d45c
	ld a,a			;d45d
	rst 38h			;d45e
	rst 38h			;d45f
	rst 38h			;d460
	rst 38h			;d461
	rst 38h			;d462
	rst 38h			;d463
	rst 38h			;d464
	rst 38h			;d465
	rst 38h			;d466
	rst 38h			;d467
	rst 38h			;d468
	rst 38h			;d469
	rst 38h			;d46a
	rst 38h			;d46b
	rst 38h			;d46c
	rst 38h			;d46d
	cp 0fdh		;d46e
	ei			;d470
	ei			;d471
	rst 30h			;d472
	rst 30h			;d473
	rst 28h			;d474
	rst 38h			;d475
	rst 38h			;d476
	rst 38h			;d477
	rst 38h			;d478
	rst 38h			;d479
	rst 38h			;d47a
	rst 38h			;d47b
	rst 38h			;d47c
	rst 38h			;d47d
	nop			;d47e
	ret po			;d47f
	call m,sub_ffffh		;d480
	rst 38h			;d483
	rst 38h			;d484
	rst 38h			;d485
	nop			;d486
	nop			;d487
	inc bc			;d488
	rra			;d489
	rst 38h			;d48a
	rst 38h			;d48b
	rst 38h			;d48c
	rst 38h			;d48d
	nop			;d48e
	ret po			;d48f
	di			;d490
	rst 38h			;d491
	rst 38h			;d492
	rst 38h			;d493
	rst 38h			;d494
	rst 38h			;d495
	nop			;d496
	ret po			;d497
	ret p			;d498
	call m,sub_ffffh		;d499
	rst 38h			;d49c
	rst 38h			;d49d
	nop			;d49e
	nop			;d49f
	nop			;d4a0
	nop			;d4a1
	add a,a			;d4a2
	rst 38h			;d4a3
	rst 38h			;d4a4
	rst 38h			;d4a5
	nop			;d4a6
	nop			;d4a7
	jr c,$+1		;d4a8
	rst 38h			;d4aa
	rst 38h			;d4ab
	rst 38h			;d4ac
	rst 38h			;d4ad
	nop			;d4ae
	nop			;d4af
	nop			;d4b0
	inc e			;d4b1
	rst 38h			;d4b2
	rst 38h			;d4b3
	rst 38h			;d4b4
	rst 38h			;d4b5
	nop			;d4b6
	ld bc,07f0fh		;d4b7
	rst 38h			;d4ba
	rst 38h			;d4bb
	rst 38h			;d4bc
	rst 38h			;d4bd
ld4beh:
	rst 38h			;d4be
	rst 38h			;d4bf
	rst 38h			;d4c0
	rst 38h			;d4c1
	rst 38h			;d4c2
	rst 38h			;d4c3
	rst 38h			;d4c4
	rst 38h			;d4c5
	nop			;d4c6
	nop			;d4c7
	nop			;d4c8
	nop			;d4c9
	nop			;d4ca
	nop			;d4cb
	nop			;d4cc
	nop			;d4cd
	nop			;d4ce
	nop			;d4cf
	nop			;d4d0
	nop			;d4d1
	nop			;d4d2
	nop			;d4d3
	nop			;d4d4
	nop			;d4d5
	nop			;d4d6
	nop			;d4d7
	nop			;d4d8
	nop			;d4d9
	nop			;d4da
	nop			;d4db
	nop			;d4dc
	nop			;d4dd
	inc bc			;d4de
	rrca			;d4df
	add hl,sp			;d4e0
	nop			;d4e1
	nop			;d4e2
	add hl,sp			;d4e3
	rrca			;d4e4
	inc bc			;d4e5
	rst 38h			;d4e6
	rst 20h			;d4e7
	sbc a,c			;d4e8
	sbc a,c			;d4e9
	sbc a,c			;d4ea
	rst 20h			;d4eb
	rst 38h			;d4ec
	rst 38h			;d4ed
	rst 38h			;d4ee
	rst 20h			;d4ef
	sbc a,c			;d4f0
	sbc a,c			;d4f1
	sbc a,c			;d4f2
	rst 20h			;d4f3
	rst 38h			;d4f4
	rst 38h			;d4f5
	ret nz			;d4f6
	ret p			;d4f7
	sbc a,h			;d4f8
	nop			;d4f9
	nop			;d4fa
	sbc a,h			;d4fb
	ret p			;d4fc
	ret nz			;d4fd
	nop			;d4fe
	nop			;d4ff
	nop			;d500
	nop			;d501
	nop			;d502
	nop			;d503
	nop			;d504
	nop			;d505
	nop			;d506
	ex af,af'			;d507
	djnz ld512h		;d508
	ld de,l9189h		;d50a
	adc a,c			;d50d
	nop			;d50e
	nop			;d50f
	nop			;d510
	nop			;d511
ld512h:
	nop			;d512
	nop			;d513
	nop			;d514
	nop			;d515
	inc b			;d516
	ld b,003h		;d517
	inc bc			;d519
	ld bc,00100h		;d51a
	rlca			;d51d
	djnz $+66		;d51e
	ld h,b			;d520
	add a,b			;d521
	ret nz			;d522
	ld (hl),b			;d523
	add a,b			;d524
	ret po			;d525
	nop			;d526
	nop			;d527
	nop			;d528
	nop			;d529
	nop			;d52a
	nop			;d52b
	nop			;d52c
	nop			;d52d
	nop			;d52e
	nop			;d52f
	nop			;d530
	nop			;d531
	nop			;d532
	nop			;d533
	nop			;d534
	nop			;d535
	jr c,$+46		;d536
	ld l,d			;d538
	ret			;d539
	ld l,c			;d53a
	jp z,lc86ch		;d53b
	inc e			;d53e
	inc (hl)			;d53f
	ld d,(hl)			;d540
	sub e			;d541
	sub (hl)			;d542
	ld d,e			;d543
	ld (hl),013h		;d544
ld546h:
	ld bc,00000h		;d546
	ld bc,00001h		;d549
	nop			;d54c
	nop			;d54d
	nop			;d54e
	ld bc,00303h		;d54f
	inc bc			;d552
	ld bc,00100h		;d553
	ld bc,00303h		;d556
	ld bc,00001h		;d559
	nop			;d55c
	inc bc			;d55d
	inc b			;d55e
	ld b,003h		;d55f
	inc bc			;d561
	ld bc,00100h		;d562
	rlca			;d565
	rlca			;d566
	rrca			;d567
ld568h:
	ld c,007h		;d568
	rlca			;d56a
	inc bc			;d56b
	inc bc			;d56c
	rrca			;d56d
	rrca			;d56e
	add hl,de			;d56f
	ld (hl),039h		;d570
	ccf			;d572
	rra			;d573
	ld b,01fh		;d574
	ld c,(hl)			;d576
	ccf			;d577
	rla			;d578
	ld l,(hl)			;d579
	ld a,(hl)			;d57a
	inc a			;d57b
	inc c			;d57c
	ccf			;d57d
	add a,d			;d57e
	ld h,06ch		;d57f
	inc e			;d581
	jr c,$-30		;d582
ld584h:
	jr ld604h		;d584
	jr c,ld584h		;d586
	call m,sub_f8f8h		;d588
	ret p			;d58b
	jr nc,$-2		;d58c
	ret p			;d58e
	ret m			;d58f
	call m,sub_fcfch		;d590
	ret m			;d593
	ld h,b			;d594
	ret m			;d595
	ret z			;d596
	ret p			;d597
	ret p			;d598
	ret m			;d599
	ret m			;d59a
	ret p			;d59b
	ret nz			;d59c
	ret p			;d59d
	djnz ld5e0h		;d59e
	ld h,b			;d5a0
	add a,b			;d5a1
	ret nz			;d5a2
	ld (hl),b			;d5a3
	add a,b			;d5a4
	ret po			;d5a5
	jr nz,ld568h		;d5a6
	ld b,b			;d5a8
	ld h,b			;d5a9
	ret po			;d5aa
	ret nz			;d5ab
	nop			;d5ac
	ret nz			;d5ad
	nop			;d5ae
	add a,b			;d5af
	ret nz			;d5b0
	ret nz			;d5b1
	ret nz			;d5b2
	add a,b			;d5b3
	nop			;d5b4
	add a,b			;d5b5
ld5b6h:
	nop			;d5b6
	nop			;d5b7
	nop			;d5b8
	nop			;d5b9
	nop			;d5ba
	nop			;d5bb
	nop			;d5bc
	nop			;d5bd
ld5beh:
	nop			;d5be
	nop			;d5bf
	nop			;d5c0
	nop			;d5c1
	nop			;d5c2
	nop			;d5c3
	nop			;d5c4
	nop			;d5c5
	nop			;d5c6
	nop			;d5c7
	nop			;d5c8
	nop			;d5c9
	nop			;d5ca
	nop			;d5cb
	nop			;d5cc
	nop			;d5cd
	ld l,h			;d5ce
	jp z,lce6bh		;d5cf
	ld l,h			;d5d2
	push bc			;d5d3
	ex (sp),hl			;d5d4
	pop af			;d5d5
	ld (hl),053h		;d5d6
	sub 073h		;d5d8
	ld (hl),0a3h		;d5da
	rst 0			;d5dc
	adc a,a			;d5dd
	nop			;d5de
	nop			;d5df
ld5e0h:
	nop			;d5e0
	nop			;d5e1
	nop			;d5e2
	nop			;d5e3
	nop			;d5e4
	nop			;d5e5
	nop			;d5e6
	nop			;d5e7
	nop			;d5e8
	nop			;d5e9
	ld bc,00301h		;d5ea
	rlca			;d5ed
	cp a			;d5ee
	rst 18h			;d5ef
	cp a			;d5f0
	rst 18h			;d5f1
	cp a			;d5f2
	rst 18h			;d5f3
	cp a			;d5f4
	rst 38h			;d5f5
	nop			;d5f6
	nop			;d5f7
	nop			;d5f8
	nop			;d5f9
	add a,b			;d5fa
	add a,b			;d5fb
	ret nz			;d5fc
	ret po			;d5fd
	inc a			;d5fe
	ld b,d			;d5ff
	sbc a,l			;d600
	or c			;d601
	or c			;d602
	sbc a,l			;d603
ld604h:
	ld b,d			;d604
	inc a			;d605
ld606h:
	nop			;d606
	nop			;d607
	nop			;d608
	nop			;d609
	nop			;d60a
	nop			;d60b
	nop			;d60c
	nop			;d60d
	inc bc			;d60e
	rrca			;d60f
	dec c			;d610
	ld b,00eh		;d611
	dec c			;d613
	inc bc			;d614
	inc bc			;d615
	nop			;d616
	nop			;d617
	nop			;d618
	nop			;d619
	nop			;d61a
	nop			;d61b
	nop			;d61c
	nop			;d61d
	ld h,b			;d61e
	ret po			;d61f
	or b			;d620
	ld (hl),b			;d621
	ld h,b			;d622
	or b			;d623
	ret p			;d624
	ret nz			;d625
	nop			;d626
	nop			;d627
	nop			;d628
	nop			;d629
	nop			;d62a
	nop			;d62b
	nop			;d62c
	nop			;d62d
	ld bc,00607h		;d62e
	ld c,00ch		;d631
	rlca			;d633
	rrca			;d634
	ld bc,00000h		;d635
	nop			;d638
	nop			;d639
	nop			;d63a
	nop			;d63b
	nop			;d63c
	nop			;d63d
	add a,b			;d63e
	ret p			;d63f
	ret po			;d640
	jr nc,ld6b3h		;d641
	ld h,b			;d643
	ret po			;d644
	add a,b			;d645
	nop			;d646
	nop			;d647
	nop			;d648
	nop			;d649
	nop			;d64a
	nop			;d64b
	nop			;d64c
	nop			;d64d
	ld b,007h		;d64e
	rrca			;d650
	inc c			;d651
	ld b,00eh		;d652
ld654h:
	rrca			;d654
	inc bc			;d655
	nop			;d656
	nop			;d657
	nop			;d658
	nop			;d659
	nop			;d65a
	nop			;d65b
	nop			;d65c
	nop			;d65d
	ret nz			;d65e
	ret p			;d65f
	ld (hl),b			;d660
	ld h,b			;d661
	jr nc,ld654h		;d662
	ret po			;d664
	ld h,b			;d665
	nop			;d666
	nop			;d667
	nop			;d668
	nop			;d669
	nop			;d66a
	nop			;d66b
	nop			;d66c
	nop			;d66d
	nop			;d66e
	nop			;d66f
	ld bc,00603h		;d670
	rlca			;d673
	inc bc			;d674
	ld bc,00000h		;d675
	nop			;d678
	nop			;d679
	nop			;d67a
	nop			;d67b
ld67ch:
	nop			;d67c
	nop			;d67d
	nop			;d67e
	nop			;d67f
	add a,b			;d680
	ret nz			;d681
	ld h,b			;d682
	ret po			;d683
	ret nz			;d684
	add a,b			;d685
	nop			;d686
	nop			;d687
	nop			;d688
	nop			;d689
	nop			;d68a
	nop			;d68b
	nop			;d68c
	nop			;d68d
	nop			;d68e
	nop			;d68f
	ld (bc),a			;d690
	rlca			;d691
	ld (bc),a			;d692
	inc bc			;d693
	rlca			;d694
	ld (bc),a			;d695
	nop			;d696
	nop			;d697
	nop			;d698
	nop			;d699
	nop			;d69a
	nop			;d69b
	nop			;d69c
	nop			;d69d
	nop			;d69e
	nop			;d69f
	ld b,b			;d6a0
	ret po			;d6a1
	ret nz			;d6a2
	ld b,b			;d6a3
	ret po			;d6a4
	ld b,b			;d6a5
	nop			;d6a6
	nop			;d6a7
	nop			;d6a8
	nop			;d6a9
	nop			;d6aa
	nop			;d6ab
	nop			;d6ac
	nop			;d6ad
	nop			;d6ae
	nop			;d6af
	inc bc			;d6b0
	inc bc			;d6b1
	inc bc			;d6b2
ld6b3h:
	ld b,007h		;d6b3
	nop			;d6b5
	nop			;d6b6
	nop			;d6b7
	nop			;d6b8
	nop			;d6b9
	nop			;d6ba
	nop			;d6bb
	nop			;d6bc
	nop			;d6bd
	nop			;d6be
	nop			;d6bf
ld6c0h:
	nop			;d6c0
	ret po			;d6c1
	ld h,b			;d6c2
	ret nz			;d6c3
	ret nz			;d6c4
	ret nz			;d6c5
	ld c,01fh		;d6c6
	ccf			;d6c8
	ccf			;d6c9
	ccf			;d6ca
	inc de			;d6cb
	ld c,008h		;d6cc
	inc e			;d6ce
	ld a,07fh		;d6cf
	ld a,l			;d6d1
	ld a,l			;d6d2
	ld a,01ch		;d6d3
	nop			;d6d5
	nop			;d6d6
	nop			;d6d7
	add a,b			;d6d8
	add a,b			;d6d9
	add a,b			;d6da
	ld e,h			;d6db
	ld h,07fh		;d6dc
	ld a,a			;d6de
	ld a,a			;d6df
	cp (hl)			;d6e0
	inc e			;d6e1
	nop			;d6e2
	nop			;d6e3
	nop			;d6e4
	nop			;d6e5
	nop			;d6e6
	inc e			;d6e7
	ld a,07fh		;d6e8
	ld a,a			;d6ea
	ld a,a			;d6eb
	ld (0021ch),a		;d6ec
	ld bc,00703h		;d6ef
ld6f2h:
	rlca			;d6f2
	rlca			;d6f3
	inc bc			;d6f4
	ld bc,01c00h		;d6f5
	ld a,0dfh		;d6f8
	ld e,a			;d6fa
	ld a,a			;d6fb
	ld a,01ch		;d6fc
	jr nz,ld6c0h		;d6fe
	jr nz,ld6f2h		;d700
	ret p			;d702
	ret p			;d703
	ret po			;d704
	ret nz			;d705
	ld bc,00703h		;d706
	rlca			;d709
	dec b			;d70a
	ld (bc),a			;d70b
	dec b			;d70c
	jr c,ld78bh		;d70d
	jp m,lfefbh		;d70f
	ld a,h			;d712
	jr c,ld715h		;d713
ld715h:
	nop			;d715
	ret nz			;d716
	ret po			;d717
	ret p			;d718
	ret p			;d719
	ret p			;d71a
	ret po			;d71b
	ret nz			;d71c
	jr nz,ld757h		;d71d
	ld c,h			;d71f
	cp 0feh		;d720
	cp 07ch		;d722
	jr c,ld726h		;d724
ld726h:
	nop			;d726
	nop			;d727
	nop			;d728
	nop			;d729
	inc bc			;d72a
	ld (bc),a			;d72b
	ld (bc),a			;d72c
	rrca			;d72d
	dec bc			;d72e
	dec bc			;d72f
	ccf			;d730
	cpl			;d731
	cpl			;d732
	rst 38h			;d733
	cp a			;d734
	cp a			;d735
	nop			;d736
	nop			;d737
	nop			;d738
	nop			;d739
	ret nz			;d73a
	ret nz			;d73b
	ret nz			;d73c
	ret p			;d73d
	ret p			;d73e
	ret p			;d73f
	call m,sub_fcfch		;d740
	rst 38h			;d743
	rst 38h			;d744
	rst 38h			;d745
	nop			;d746
	nop			;d747
	nop			;d748
	nop			;d749
	nop			;d74a
	nop			;d74b
	djnz ld756h		;d74c
	inc b			;d74e
ld74fh:
	rlca			;d74f
	rra			;d750
	ld a,a			;d751
	rst 38h			;d752
	rst 20h			;d753
ld754h:
	ld a,b			;d754
	rrca			;d755
ld756h:
	nop			;d756
ld757h:
	nop			;d757
	nop			;d758
	nop			;d759
	nop			;d75a
	nop			;d75b
	ex af,af'			;d75c
	djnz ld77fh		;d75d
	ret po			;d75f
	ret m			;d760
	cp 0ffh		;d761
	rst 38h			;d763
	ld a,(hl)			;d764
	ret p			;d765
	nop			;d766
	nop			;d767
	nop			;d768
	nop			;d769
	nop			;d76a
	nop			;d76b
	djnz ld776h		;d76c
	inc b			;d76e
	rlca			;d76f
	rra			;d770
	ld a,a			;d771
	rst 38h			;d772
	rst 38h			;d773
	ld a,b			;d774
	rrca			;d775
ld776h:
	nop			;d776
	nop			;d777
	nop			;d778
	nop			;d779
	nop			;d77a
	nop			;d77b
	ex af,af'			;d77c
	djnz ld79fh		;d77d
ld77fh:
	ret po			;d77f
	ret m			;d780
	cp 0ffh		;d781
	rst 38h			;d783
	ld e,0f0h		;d784
	nop			;d786
	nop			;d787
	nop			;d788
	nop			;d789
	nop			;d78a
ld78bh:
	nop			;d78b
	djnz ld796h		;d78c
	inc b			;d78e
	rlca			;d78f
	rra			;d790
	ld a,a			;d791
	rst 38h			;d792
	rst 38h			;d793
	ld a,(hl)			;d794
	rrca			;d795
ld796h:
	nop			;d796
	nop			;d797
	nop			;d798
	nop			;d799
	nop			;d79a
	nop			;d79b
	ex af,af'			;d79c
	djnz ld7bfh		;d79d
ld79fh:
	ret po			;d79f
	ret m			;d7a0
	cp 0ffh		;d7a1
	rst 20h			;d7a3
	ld e,0f0h		;d7a4
	nop			;d7a6
	nop			;d7a7
	nop			;d7a8
	nop			;d7a9
	nop			;d7aa
	nop			;d7ab
	nop			;d7ac
	nop			;d7ad
	nop			;d7ae
	nop			;d7af
	inc b			;d7b0
	inc bc			;d7b1
	inc bc			;d7b2
	inc bc			;d7b3
	nop			;d7b4
	nop			;d7b5
	nop			;d7b6
	nop			;d7b7
	nop			;d7b8
	nop			;d7b9
	nop			;d7ba
	nop			;d7bb
	nop			;d7bc
	nop			;d7bd
	nop			;d7be
ld7bfh:
	nop			;d7bf
	nop			;d7c0
	add a,b			;d7c1
	add a,b			;d7c2
	add a,b			;d7c3
	ld b,b			;d7c4
	nop			;d7c5
	nop			;d7c6
	nop			;d7c7
	nop			;d7c8
ld7c9h:
	nop			;d7c9
	nop			;d7ca
	nop			;d7cb
	nop			;d7cc
	nop			;d7cd
	nop			;d7ce
	nop			;d7cf
	ld b,003h		;d7d0
	inc bc			;d7d2
	inc bc			;d7d3
	ld bc,00001h		;d7d4
	nop			;d7d7
	nop			;d7d8
ld7d9h:
	nop			;d7d9
	nop			;d7da
	nop			;d7db
	nop			;d7dc
	nop			;d7dd
	nop			;d7de
	nop			;d7df
	ret nz			;d7e0
	add a,b			;d7e1
	add a,b			;d7e2
	add a,b			;d7e3
	nop			;d7e4
	nop			;d7e5
	nop			;d7e6
	nop			;d7e7
	nop			;d7e8
	nop			;d7e9
	nop			;d7ea
	nop			;d7eb
	nop			;d7ec
	nop			;d7ed
	nop			;d7ee
	nop			;d7ef
	nop			;d7f0
	nop			;d7f1
	nop			;d7f2
ld7f3h:
	inc bc			;d7f3
	rlca			;d7f4
	nop			;d7f5
	nop			;d7f6
	nop			;d7f7
	nop			;d7f8
	nop			;d7f9
	nop			;d7fa
	nop			;d7fb
	nop			;d7fc
	nop			;d7fd
	nop			;d7fe
	nop			;d7ff
	nop			;d800
	nop			;d801
	nop			;d802
	nop			;d803
	ret po			;d804
	ret nz			;d805
	nop			;d806
	nop			;d807
	ld de,00c09h		;d808
	dec b			;d80b
	ld (bc),a			;d80c
	dec c			;d80d
	dec b			;d80e
	ld d,00dh		;d80f
	add hl,bc			;d811
	dec d			;d812
	inc bc			;d813
	nop			;d814
	nop			;d815
	nop			;d816
	add a,b			;d817
	djnz $+34		;d818
	and b			;d81a
	ret z			;d81b
	sub b			;d81c
	or b			;d81d
	ld h,b			;d81e
	ld b,b			;d81f
	or b			;d820
	adc a,b			;d821
	ld b,b			;d822
	jr nz,ld825h		;d823
ld825h:
	nop			;d825
	nop			;d826
	ld h,060h		;d827
	ld sp,00f3ch		;d829
	ld b,l			;d82c
	ld (hl),00dh		;d82d
	ld c,a			;d82f
	dec d			;d830
	add hl,sp			;d831
	inc sp			;d832
	ld b,e			;d833
	ld (bc),a			;d834
	inc b			;d835
	ex af,af'			;d836
	jr ld7c9h		;d837
	jr nc,ld8ach		;d839
	and 05ch		;d83b
	sbc a,b			;d83d
	and b			;d83e
	ld d,b			;d83f
	ret p			;d840
	cp b			;d841
	sbc a,b			;d842
	inc c			;d843
	add a,h			;d844
	add a,b			;d845
	add a,b			;d846
	ld h,b			;d847
	nop			;d848
	ld hl,00804h		;d849
	ld b,b			;d84c
	inc h			;d84d
	ld bc,0114ch		;d84e
	jr z,ld875h		;d851
	ld b,b			;d853
	ld (bc),a			;d854
	inc b			;d855
	ex af,af'			;d856
	djnz ld7d9h		;d857
	jr nc,ld89ch		;d859
	add a,d			;d85b
	ex af,af'			;d85c
	djnz $+34		;d85d
	djnz ld8b1h		;d85f
	jr z,ld7f3h		;d861
	ld b,b			;d863
	inc b			;d864
	nop			;d865
	nop			;d866
	nop			;d867
	nop			;d868
	nop			;d869
	nop			;d86a
	nop			;d86b
	nop			;d86c
	ld bc,00409h		;d86d
	ld bc,0011bh		;d870
	inc b			;d873
	add hl,bc			;d874
ld875h:
	ld bc,00000h		;d875
	nop			;d878
	nop			;d879
	nop			;d87a
	nop			;d87b
	nop			;d87c
	nop			;d87d
	jr nz,ld8c0h		;d87e
	nop			;d880
	or b			;d881
	nop			;d882
	ld b,b			;d883
	jr nz,ld886h		;d884
ld886h:
	nop			;d886
	nop			;d887
	nop			;d888
	nop			;d889
	nop			;d88a
	djnz ld895h		;d88b
	add hl,bc			;d88d
	adc a,b			;d88e
	ld c,l			;d88f
	inc h			;d890
	ld (0171dh),hl		;d891
	ld a,e			;d894
ld895h:
	call m,00000h		;d895
	nop			;d898
	nop			;d899
	nop			;d89a
	nop			;d89b
ld89ch:
	add a,h			;d89c
	ld c,b			;d89d
	adc a,b			;d89e
	ld d,b			;d89f
	and b			;d8a0
	jp nz,07064h		;d8a1
	xor 01fh		;d8a4
	nop			;d8a6
	nop			;d8a7
	nop			;d8a8
	nop			;d8a9
	nop			;d8aa
	ex af,af'			;d8ab
ld8ach:
	add hl,bc			;d8ac
	dec c			;d8ad
	add a,l			;d8ae
	ld c,h			;d8af
	ld l,(hl)			;d8b0
ld8b1h:
	ld h,a			;d8b1
	ld a,l			;d8b2
	ld h,a			;d8b3
	ld a,l			;d8b4
	ret po			;d8b5
	add a,b			;d8b6
	nop			;d8b7
	add a,b			;d8b8
	add a,c			;d8b9
	ld (bc),a			;d8ba
	add a,b			;d8bb
	add a,h			;d8bc
	ld c,h			;d8bd
	ret z			;d8be
	ret c			;d8bf
ld8c0h:
	cp c			;d8c0
	jp p,07ad6h		;d8c1
	xor (hl)			;d8c4
	rlca			;d8c5
	nop			;d8c6
	nop			;d8c7
	nop			;d8c8
	inc b			;d8c9
	ld c,00eh		;d8ca
	dec de			;d8cc
	inc d			;d8cd
	jr z,ld900h		;d8ce
	ld (bc),a			;d8d0
	ld c,027h		;d8d1
	sbc a,l			;d8d3
	daa			;d8d4
	inc bc			;d8d5
	nop			;d8d6
	nop			;d8d7
	nop			;d8d8
	jr nz,ld90bh		;d8d9
	ld e,b			;d8db
	ld l,b			;d8dc
	jr nc,ld8ffh		;d8dd
	ret nz			;d8df
	add a,b			;d8e0
	sub b			;d8e1
	ld h,b			;d8e2
	ld a,b			;d8e3
	or h			;d8e4
	ret m			;d8e5
	nop			;d8e6
	nop			;d8e7
	nop			;d8e8
	inc b			;d8e9
	ex af,af'			;d8ea
	nop			;d8eb
	ld a,(bc)			;d8ec
	inc d			;d8ed
	ex af,af'			;d8ee
	nop			;d8ef
	nop			;d8f0
	nop			;d8f1
	ld (bc),a			;d8f2
	dec b			;d8f3
	ld (bc),a			;d8f4
	nop			;d8f5
	nop			;d8f6
	nop			;d8f7
	nop			;d8f8
	nop			;d8f9
	jr nz,ld94ch		;d8fa
	jr z,ld90eh		;d8fc
	nop			;d8fe
ld8ffh:
	nop			;d8ff
ld900h:
	nop			;d900
	sub b			;d901
	jr nz,ld954h		;d902
	and b			;d904
	nop			;d905
	nop			;d906
	nop			;d907
	nop			;d908
	nop			;d909
	nop			;d90a
ld90bh:
	nop			;d90b
	nop			;d90c
	nop			;d90d
ld90eh:
	nop			;d90e
	nop			;d90f
	nop			;d910
	nop			;d911
	nop			;d912
	nop			;d913
	nop			;d914
	nop			;d915
	nop			;d916
	nop			;d917
	nop			;d918
	nop			;d919
	nop			;d91a
	nop			;d91b
	nop			;d91c
	nop			;d91d
	nop			;d91e
	nop			;d91f
	nop			;d920
	nop			;d921
	nop			;d922
	nop			;d923
	nop			;d924
	nop			;d925
	nop			;d926
	nop			;d927
	nop			;d928
	nop			;d929
	nop			;d92a
	nop			;d92b
	nop			;d92c
	nop			;d92d
	nop			;d92e
	nop			;d92f
	nop			;d930
	nop			;d931
	nop			;d932
	nop			;d933
	nop			;d934
	nop			;d935
	nop			;d936
	nop			;d937
	nop			;d938
	nop			;d939
	nop			;d93a
	nop			;d93b
	nop			;d93c
	nop			;d93d
	nop			;d93e
	nop			;d93f
	nop			;d940
	nop			;d941
	nop			;d942
	nop			;d943
	nop			;d944
	nop			;d945
	nop			;d946
	nop			;d947
	nop			;d948
	nop			;d949
	nop			;d94a
	nop			;d94b
ld94ch:
	nop			;d94c
	nop			;d94d
	nop			;d94e
	nop			;d94f
	nop			;d950
	nop			;d951
	nop			;d952
	nop			;d953
ld954h:
	nop			;d954
	nop			;d955
	nop			;d956
	nop			;d957
	nop			;d958
	nop			;d959
	nop			;d95a
	nop			;d95b
	nop			;d95c
	nop			;d95d
	nop			;d95e
	nop			;d95f
	nop			;d960
	nop			;d961
	nop			;d962
	nop			;d963
	nop			;d964
	nop			;d965
	nop			;d966
	nop			;d967
	nop			;d968
	nop			;d969
	nop			;d96a
	nop			;d96b
	nop			;d96c
	nop			;d96d
	nop			;d96e
	nop			;d96f
	nop			;d970
	nop			;d971
	nop			;d972
	nop			;d973
	nop			;d974
	nop			;d975
	nop			;d976
	nop			;d977
	nop			;d978
	nop			;d979
	nop			;d97a
	nop			;d97b
	nop			;d97c
	nop			;d97d
	nop			;d97e
	nop			;d97f
	nop			;d980
	nop			;d981
	nop			;d982
	nop			;d983
	nop			;d984
	nop			;d985
	nop			;d986
	nop			;d987
	nop			;d988
	nop			;d989
	nop			;d98a
	nop			;d98b
	nop			;d98c
	nop			;d98d
	nop			;d98e
	nop			;d98f
	nop			;d990
	ld bc,00101h		;d991
	ld bc,00001h		;d994
	nop			;d997
	nop			;d998
	nop			;d999
	nop			;d99a
	nop			;d99b
	nop			;d99c
	nop			;d99d
	nop			;d99e
	nop			;d99f
	nop			;d9a0
	add a,b			;d9a1
	add a,b			;d9a2
	add a,b			;d9a3
	add a,b			;d9a4
	add a,b			;d9a5
	nop			;d9a6
	nop			;d9a7
	nop			;d9a8
	nop			;d9a9
	nop			;d9aa
	nop			;d9ab
	nop			;d9ac
	ld bc,00001h		;d9ad
	nop			;d9b0
	nop			;d9b1
	nop			;d9b2
	nop			;d9b3
	nop			;d9b4
	nop			;d9b5
	nop			;d9b6
	nop			;d9b7
	nop			;d9b8
	nop			;d9b9
	nop			;d9ba
	nop			;d9bb
	nop			;d9bc
	add a,b			;d9bd
	add a,b			;d9be
	nop			;d9bf
	nop			;d9c0
	nop			;d9c1
	nop			;d9c2
	nop			;d9c3
	nop			;d9c4
	nop			;d9c5
	nop			;d9c6
	nop			;d9c7
	nop			;d9c8
	nop			;d9c9
	nop			;d9ca
	nop			;d9cb
	ld bc,00303h		;d9cc
	ld bc,00000h		;d9cf
	nop			;d9d2
	nop			;d9d3
	nop			;d9d4
	nop			;d9d5
	nop			;d9d6
	nop			;d9d7
	nop			;d9d8
	nop			;d9d9
	nop			;d9da
	nop			;d9db
	add a,b			;d9dc
	ret nz			;d9dd
	ret nz			;d9de
	add a,b			;d9df
	nop			;d9e0
	nop			;d9e1
	nop			;d9e2
	nop			;d9e3
	nop			;d9e4
	nop			;d9e5
	nop			;d9e6
	nop			;d9e7
	nop			;d9e8
	nop			;d9e9
	nop			;d9ea
	nop			;d9eb
	ld bc,00707h		;d9ec
	ld bc,00000h		;d9ef
	nop			;d9f2
	nop			;d9f3
	nop			;d9f4
	nop			;d9f5
	nop			;d9f6
	nop			;d9f7
	nop			;d9f8
	nop			;d9f9
	nop			;d9fa
	nop			;d9fb
	ret nz			;d9fc
	ret po			;d9fd
	ret po			;d9fe
	ret nz			;d9ff
lda00h:
	nop			;da00
	nop			;da01
	nop			;da02
	nop			;da03
	nop			;da04
	nop			;da05
	nop			;da06
	nop			;da07
	nop			;da08
	nop			;da09
	nop			;da0a
	ld bc,00503h		;da0b
	dec b			;da0e
	inc bc			;da0f
	ld bc,00000h		;da10
	nop			;da13
	nop			;da14
	nop			;da15
	nop			;da16
	nop			;da17
	nop			;da18
	nop			;da19
	nop			;da1a
	add a,b			;da1b
	ld b,b			;da1c
	and b			;da1d
	and b			;da1e
	ld b,b			;da1f
	add a,b			;da20
	nop			;da21
	nop			;da22
	nop			;da23
	nop			;da24
	nop			;da25
	nop			;da26
	nop			;da27
	ld (01004h),hl		;da28
	inc bc			;da2b
	ld h,005h		;da2c
	dec b			;da2e
	ld h,003h		;da2f
	djnz lda37h		;da31
	ld (00000h),hl		;da33
	nop			;da36
lda37h:
	nop			;da37
	ld b,h			;da38
	djnz $+10		;da39
	ret nz			;da3b
	ld h,h			;da3c
	and b			;da3d
	and b			;da3e
	ld h,h			;da3f
	ret nz			;da40
	ex af,af'			;da41
	djnz lda88h		;da42
	nop			;da44
	nop			;da45
	nop			;da46
	nop			;da47
	nop			;da48
	rlca			;da49
	inc c			;da4a
	dec de			;da4b
	ld d,015h		;da4c
	dec d			;da4e
	ld d,01bh		;da4f
	inc c			;da51
	rlca			;da52
	nop			;da53
	nop			;da54
	nop			;da55
	nop			;da56
	nop			;da57
	nop			;da58
	ret po			;da59
	jr nc,$-38		;da5a
	ld l,b			;da5c
	xor b			;da5d
	xor b			;da5e
	ld l,b			;da5f
	ret c			;da60
	jr nc,$-30		;da61
	nop			;da63
	nop			;da64
	nop			;da65
	ld (bc),a			;da66
	ld bc,06b82h		;da67
	ld a,l			;da6a
	inc (hl)			;da6b
	add hl,de			;da6c
	ld c,d			;da6d
	ld (03e19h),a		;da6e
	inir		;da71
	dec d			;da73
	ld a,(bc)			;da74
	nop			;da75
	nop			;da76
	ex af,af'			;da77
	inc b			;da78
	jr $-30		;da79
	ld (hl),09ah		;da7b
	ld d,b			;da7d
	ld d,h			;da7e
	sbc a,b			;da7f
	ccf			;da80
	di			;da81
	xor b			;da82
	ld h,b			;da83
	djnz lda96h		;da84
	nop			;da86
	ld b,b			;da87
lda88h:
	add hl,bc			;da88
	djnz lda8bh		;da89
lda8bh:
	jr nz,$+4		;da8b
	add hl,de			;da8d
	ld bc,00082h		;da8e
	ld de,04401h		;da91
	jr nz,lda96h		;da94
lda96h:
	ld bc,00a24h		;da96
	add a,b			;da99
	and h			;da9a
	nop			;da9b
	ld b,b			;da9c
	add a,b			;da9d
	sbc a,b			;da9e
	ld b,b			;da9f
	ld (bc),a			;daa0
	ld bc,00820h		;daa1
	inc d			;daa4
	nop			;daa5
	nop			;daa6
	nop			;daa7
	nop			;daa8
	nop			;daa9
	nop			;daaa
	nop			;daab
	nop			;daac
	nop			;daad
	rst 38h			;daae
	rst 38h			;daaf
	rst 38h			;dab0
	rst 38h			;dab1
	rst 38h			;dab2
	rst 38h			;dab3
	rst 38h			;dab4
	rst 38h			;dab5
	nop			;dab6
	nop			;dab7
	nop			;dab8
	nop			;dab9
	nop			;daba
	nop			;dabb
	nop			;dabc
	nop			;dabd
	nop			;dabe
	nop			;dabf
	nop			;dac0
	nop			;dac1
	nop			;dac2
	nop			;dac3
	nop			;dac4
	nop			;dac5
	rst 38h			;dac6
	rst 38h			;dac7
	cp a			;dac8
	ccf			;dac9
	rra			;daca
	rra			;dacb
	rrca			;dacc
	rrca			;dacd
	rlca			;dace
	rlca			;dacf
	inc bc			;dad0
	nop			;dad1
	nop			;dad2
	nop			;dad3
	nop			;dad4
	nop			;dad5
	rst 38h			;dad6
	cp 0fch		;dad7
	call m,sub_f8fch		;dad9
	ret m			;dadc
	ret m			;dadd
	ret p			;dade
	ret po			;dadf
	add a,b			;dae0
	nop			;dae1
	nop			;dae2
	nop			;dae3
	nop			;dae4
	nop			;dae5
	nop			;dae6
	nop			;dae7
	ld b,b			;dae8
	add a,b			;dae9
	jr nz,ldb2ch		;daea
	jr nz,ldafeh		;daec
	jr z,ldaf8h		;daee
	inc b			;daf0
	ld bc,00000h		;daf1
	nop			;daf4
	nop			;daf5
	nop			;daf6
	nop			;daf7
ldaf8h:
	nop			;daf8
	nop			;daf9
	ld (bc),a			;dafa
ldafbh:
	inc b			;dafb
	ld (bc),a			;dafc
	nop			;dafd
ldafeh:
	ex af,af'			;dafe
	inc d			;daff
	ld b,b			;db00
	jr nz,ldb03h		;db01
ldb03h:
	nop			;db03
	nop			;db04
	nop			;db05
	rst 38h			;db06
	ld a,a			;db07
	ld a,a			;db08
	ld a,a			;db09
	ld a,a			;db0a
	ccf			;db0b
	ccf			;db0c
	rra			;db0d
	rra			;db0e
	rra			;db0f
	rlca			;db10
	rlca			;db11
	inc bc			;db12
	inc bc			;db13
	ld bc,lff00h		;db14
	rst 38h			;db17
	rst 38h			;db18
	rst 38h			;db19
	rst 38h			;db1a
	rst 38h			;db1b
	rst 38h			;db1c
	rst 38h			;db1d
	rst 38h			;db1e
	rst 38h			;db1f
	rst 38h			;db20
	rst 38h			;db21
	rst 38h			;db22
	rst 38h			;db23
	cp 078h		;db24
	nop			;db26
	nop			;db27
	nop			;db28
	add a,b			;db29
	nop			;db2a
	add a,b			;db2b
ldb2ch:
	ld b,b			;db2c
	jr nz,ldb6fh		;db2d
	jr nz,ldb81h		;db2f
	ex af,af'			;db31
	djnz ldb58h		;db32
	ld (bc),a			;db34
	nop			;db35
	nop			;db36
	nop			;db37
	nop			;db38
	nop			;db39
	nop			;db3a
	nop			;db3b
	nop			;db3c
	nop			;db3d
	nop			;db3e
	nop			;db3f
	nop			;db40
	nop			;db41
	nop			;db42
	nop			;db43
	ld bc,lff84h		;db44
	rst 38h			;db47
	rst 38h			;db48
	rst 38h			;db49
	rst 38h			;db4a
	rst 38h			;db4b
	cp 0feh		;db4c
	call m,sub_f0fch		;db4e
	ret p			;db51
	ret po			;db52
	add a,b			;db53
	nop			;db54
	nop			;db55
	ret nz			;db56
	ret nz			;db57
ldb58h:
	add a,b			;db58
	add a,b			;db59
	nop			;db5a
	nop			;db5b
	nop			;db5c
	nop			;db5d
	nop			;db5e
	nop			;db5f
	nop			;db60
	nop			;db61
	nop			;db62
	nop			;db63
	nop			;db64
	nop			;db65
	nop			;db66
	nop			;db67
	nop			;db68
	nop			;db69
	nop			;db6a
	nop			;db6b
	ld bc,00200h		;db6c
ldb6fh:
	ld bc,00804h		;db6f
	djnz ldbbch		;db72
	nop			;db74
	nop			;db75
	nop			;db76
	nop			;db77
	ld b,b			;db78
	jr nz,ldafbh		;db79
	nop			;db7b
	nop			;db7c
	nop			;db7d
	nop			;db7e
	nop			;db7f
	nop			;db80
ldb81h:
	nop			;db81
	nop			;db82
	nop			;db83
	nop			;db84
	nop			;db85
	ret p			;db86
	ret m			;db87
	call m,sub_fefch		;db88
	cp 0f7h		;db8b
	rst 30h			;db8d
	di			;db8e
	di			;db8f
	pop af			;db90
	pop af			;db91
	ret p			;db92
	ret p			;db93
	ret p			;db94
	ret p			;db95
	rrca			;db96
	rra			;db97
	ccf			;db98
	ccf			;db99
	ld a,a			;db9a
	ld a,a			;db9b
	rst 28h			;db9c
	rst 28h			;db9d
	rst 8			;db9e
	rst 8			;db9f
	adc a,a			;dba0
	adc a,a			;dba1
	rrca			;dba2
	rrca			;dba3
	rrca			;dba4
	rrca			;dba5
	nop			;dba6
	nop			;dba7
	nop			;dba8
	nop			;dba9
	dec c			;dbaa
	ccf			;dbab
	ld a,a			;dbac
	ld sp,hl			;dbad
	or 06bh		;dbae
	defb 0edh;next byte illegal after ed		;dbb0
	or 079h		;dbb1
	ld a,a			;dbb3
	ccf			;dbb4
	dec de			;dbb5
	nop			;dbb6
	nop			;dbb7
	nop			;dbb8
	nop			;dbb9
	add a,b			;dbba
	ret nz			;dbbb
ldbbch:
	ret po			;dbbc
	ret po			;dbbd
	ret p			;dbbe
	ld (hl),b			;dbbf
	ld h,b			;dbc0
	ret p			;dbc1
	ret p			;dbc2
	ret po			;dbc3
	ret nz			;dbc4
	nop			;dbc5
	nop			;dbc6
	nop			;dbc7
	nop			;dbc8
	nop			;dbc9
	rst 18h			;dbca
	rst 38h			;dbcb
	rst 38h			;dbcc
	ret p			;dbcd
	ret po			;dbce
	ret po			;dbcf
	ret po			;dbd0
	ret po			;dbd1
	ret po			;dbd2
	ret po			;dbd3
	ret po			;dbd4
	ret po			;dbd5
	nop			;dbd6
	nop			;dbd7
	nop			;dbd8
	nop			;dbd9
	add a,b			;dbda
	ret po			;dbdb
	ret po			;dbdc
	ret p			;dbdd
	ld (hl),b			;dbde
	ld (hl),b			;dbdf
	ld (hl),b			;dbe0
	ld (hl),b			;dbe1
	ld (hl),b			;dbe2
	ld (hl),b			;dbe3
	ld (hl),b			;dbe4
	ld (hl),b			;dbe5
	rst 38h			;dbe6
	rst 38h			;dbe7
	rst 38h			;dbe8
	ret p			;dbe9
	ret p			;dbea
	ret p			;dbeb
	rst 38h			;dbec
	rst 38h			;dbed
	rst 38h			;dbee
	ret m			;dbef
	ret p			;dbf0
	ret p			;dbf1
	ret p			;dbf2
	ret p			;dbf3
	ret p			;dbf4
	ret p			;dbf5
	ret nz			;dbf6
	ret p			;dbf7
	ret p			;dbf8
	ld a,b			;dbf9
	jr c,ldc74h		;dbfa
	ret p			;dbfc
	ret p			;dbfd
	ret nz			;dbfe
	nop			;dbff
	nop			;dc00
	nop			;dc01
	nop			;dc02
	nop			;dc03
	nop			;dc04
	nop			;dc05
	nop			;dc06
	nop			;dc07
	nop			;dc08
	nop			;dc09
	nop			;dc0a
	nop			;dc0b
	ld e,07fh		;dc0c
	ld a,a			;dc0e
	di			;dc0f
	pop hl			;dc10
	pop hl			;dc11
	di			;dc12
	ld a,a			;dc13
	ld a,a			;dc14
	ld e,000h		;dc15
	nop			;dc17
	nop			;dc18
	nop			;dc19
	nop			;dc1a
	nop			;dc1b
	ret nz			;dc1c
	ret nz			;dc1d
	ret nz			;dc1e
	ret nz			;dc1f
	ret nz			;dc20
	ret nz			;dc21
	ret nz			;dc22
	ret nz			;dc23
	ret nz			;dc24
	ret nz			;dc25
	nop			;dc26
	nop			;dc27
	nop			;dc28
	jr c,$+58		;dc29
	cp 0feh		;dc2b
	jr c,ldc67h		;dc2d
	jr c,ldc69h		;dc2f
	jr c,ldc6bh		;dc31
	jr c,ldc6dh		;dc33
	jr c,ldc37h		;dc35
ldc37h:
	nop			;dc37
	nop			;dc38
	nop			;dc39
	ld c,0deh		;dc3a
	ret m			;dc3c
	ret p			;dc3d
	ret p			;dc3e
	ret po			;dc3f
	ret po			;dc40
	ret po			;dc41
	ret po			;dc42
	ret po			;dc43
	ret po			;dc44
	ret po			;dc45
	nop			;dc46
	nop			;dc47
	nop			;dc48
	nop			;dc49
	nop			;dc4a
	nop			;dc4b
	ld a,(de)			;dc4c
	ld a,a			;dc4d
	ld (hl),e			;dc4e
	sbc hl,de		;dc4f
	jp nc,073edh		;dc51
	ld a,a			;dc54
	ld d,000h		;dc55
	nop			;dc57
	nop			;dc58
	nop			;dc59
	inc e			;dc5a
	inc e			;dc5b
	inc e			;dc5c
	sbc a,h			;dc5d
	sbc a,h			;dc5e
	call c,sub_9cdah+2		;dc5f
	call c,sub_9f9fh		;dc62
	rra			;dc65
	rst 38h			;dc66
ldc67h:
	rst 38h			;dc67
	rst 38h			;dc68
ldc69h:
	rst 38h			;dc69
	rst 38h			;dc6a
ldc6bh:
	rst 38h			;dc6b
	rst 38h			;dc6c
ldc6dh:
	rst 38h			;dc6d
	rst 38h			;dc6e
	rst 38h			;dc6f
	rst 38h			;dc70
	rst 38h			;dc71
	rst 38h			;dc72
	rst 38h			;dc73
ldc74h:
	rst 38h			;dc74
	rst 38h			;dc75
	rst 38h			;dc76
	rst 38h			;dc77
	rst 38h			;dc78
	call m,sub_f9f8h		;dc79
	ld sp,hl			;dc7c
	ret m			;dc7d
	call m,sub_f9ffh		;dc7e
	ret m			;dc81
	call m,sub_ffffh		;dc82
	rst 38h			;dc85
	rst 38h			;dc86
	rst 38h			;dc87
	rst 38h			;dc88
	jr nc,ldc9bh		;dc89
	sub e			;dc8b
	di			;dc8c
	jr nc,ldc9fh		;dc8d
	sub e			;dc8f
	sub e			;dc90
	djnz ldcc3h		;dc91
	rst 38h			;dc93
	rst 38h			;dc94
	rst 38h			;dc95
	rst 38h			;dc96
	rst 38h			;dc97
	rst 38h			;dc98
	daa			;dc99
	daa			;dc9a
ldc9bh:
	rst 20h			;dc9b
	rst 20h			;dc9c
	rst 20h			;dc9d
	rst 20h			;dc9e
ldc9fh:
	rst 20h			;dc9f
	rst 20h			;dca0
	jr nz,ldcc3h		;dca1
	rst 38h			;dca3
	rst 38h			;dca4
	rst 38h			;dca5
	rst 38h			;dca6
	rst 38h			;dca7
	rst 38h			;dca8
	rst 0			;dca9
	jp nz,lc8c0h		;dcaa
	call sub_cfcfh		;dcad
	rst 8			;dcb0
	ld c,a			;dcb1
	ld c,a			;dcb2
	rst 38h			;dcb3
	rst 38h			;dcb4
	rst 38h			;dcb5
	rst 38h			;dcb6
	rst 38h			;dcb7
	rst 38h			;dcb8
	jr ldccbh		;dcb9
	inc de			;dcbb
	sub e			;dcbc
	sub b			;dcbd
	sub b			;dcbe
	sub e			;dcbf
	sub e			;dcc0
	sub e			;dcc1
	sub e			;dcc2
ldcc3h:
	rst 38h			;dcc3
	rst 38h			;dcc4
	rst 38h			;dcc5
	rst 38h			;dcc6
	rst 38h			;dcc7
	rst 38h			;dcc8
	ld a,a			;dcc9
	ccf			;dcca
ldccbh:
	ccf			;dccb
	ccf			;dccc
	ccf			;dccd
	ccf			;dcce
	ccf			;dccf
	ccf			;dcd0
	ccf			;dcd1
	ccf			;dcd2
	rst 38h			;dcd3
	rst 38h			;dcd4
	rst 38h			;dcd5
	rst 38h			;dcd6
	rst 38h			;dcd7
	rst 38h			;dcd8
	rst 38h			;dcd9
	rst 38h			;dcda
	rst 38h			;dcdb
	rst 38h			;dcdc
	rst 38h			;dcdd
	rst 38h			;dcde
	rst 38h			;dcdf
	rst 38h			;dce0
	rst 38h			;dce1
	rst 38h			;dce2
	rst 38h			;dce3
	rst 38h			;dce4
	rst 38h			;dce5
ldce6h:
	add a,b			;dce6
	ld b,b			;dce7
	jr nz,ldd0ah		;dce8
	jr nc,ldd04h		;dcea
	inc e			;dcec
	rra			;dced
	rrca			;dcee
	rra			;dcef
	dec sp			;dcf0
	dec a			;dcf1
	ld a,(hl)			;dcf2
	ld a,a			;dcf3
	ld a,a			;dcf4
	ccf			;dcf5
	rrca			;dcf6
	ld e,038h		;dcf7
	jr nc,ldd5bh		;dcf9
	ld h,b			;dcfb
	ret nz			;dcfc
	ld b,b			;dcfd
	jr nz,ldd20h		;dcfe
	djnz ldd32h		;dd00
	jr nc,ldd7ch		;dd02
ldd04h:
	ld a,b			;dd04
	ret m			;dd05
	rst 38h			;dd06
	rst 30h			;dd07
	rst 28h			;dd08
	rst 18h			;dd09
ldd0ah:
	rst 38h			;dd0a
	ld a,a			;dd0b
	di			;dd0c
	call m,03effh		;dd0d
	ld a,01ch		;dd10
	inc e			;dd12
	inc c			;dd13
	inc b			;dd14
	nop			;dd15
	inc b			;dd16
	ex af,af'			;dd17
	ex af,af'			;dd18
	jr ldd53h		;dd19
	ld a,b			;dd1b
	ret p			;dd1c
	ret p			;dd1d
	cp 0feh		;dd1e
ldd20h:
	rst 28h			;dd20
	rst 18h			;dd21
	sbc a,0beh		;dd22
	ld a,h			;dd24
	cp 0f8h		;dd25
	jr c,ldd65h		;dd27
	inc e			;dd29
	inc e			;dd2a
	inc c			;dd2b
	inc b			;dd2c
	nop			;dd2d
	nop			;dd2e
	nop			;dd2f
	nop			;dd30
	nop			;dd31
ldd32h:
	nop			;dd32
	nop			;dd33
	nop			;dd34
	nop			;dd35
	nop			;dd36
	ld bc,03121h		;dd37
	add hl,de			;dd3a
	rra			;dd3b
	rra			;dd3c
	ld a,03eh		;dd3d
	rra			;dd3f
	ccf			;dd40
	rst 20h			;dd41
	dec b			;dd42
	inc c			;dd43
	djnz ldd46h		;dd44
ldd46h:
	nop			;dd46
	nop			;dd47
	nop			;dd48
	nop			;dd49
	nop			;dd4a
	nop			;dd4b
	nop			;dd4c
	nop			;dd4d
	nop			;dd4e
	ex af,af'			;dd4f
	ex af,af'			;dd50
	sbc a,h			;dd51
	sbc a,h			;dd52
ldd53h:
	rst 38h			;dd53
	rst 38h			;dd54
	rst 20h			;dd55
	rst 38h			;dd56
	ld a,(hl)			;dd57
	cp c			;dd58
	rst 38h			;dd59
	rst 38h			;dd5a
ldd5bh:
	ld h,d			;dd5b
	ld b,d			;dd5c
	add a,d			;dd5d
	nop			;dd5e
	nop			;dd5f
	nop			;dd60
	nop			;dd61
	nop			;dd62
	nop			;dd63
	nop			;dd64
ldd65h:
	nop			;dd65
	nop			;dd66
	ld b,b			;dd67
	ld h,b			;dd68
	ret nz			;dd69
	and 0fch		;dd6a
	call m,sub_b878h		;dd6c
	ld a,h			;dd6f
	cp h			;dd70
	ret m			;dd71
	jr nc,ldd7ch		;dd72
	inc b			;dd74
	nop			;dd75
	nop			;dd76
	nop			;dd77
	nop			;dd78
	nop			;dd79
	nop			;dd7a
	nop			;dd7b
ldd7ch:
	nop			;dd7c
	nop			;dd7d
	nop			;dd7e
	nop			;dd7f
	nop			;dd80
	nop			;dd81
	ld bc,00001h		;dd82
	nop			;dd85
	nop			;dd86
	ccf			;dd87
	ld a,a			;dd88
	rst 38h			;dd89
	rst 38h			;dd8a
	rst 38h			;dd8b
	ld a,a			;dd8c
	rra			;dd8d
	nop			;dd8e
	nop			;dd8f
	nop			;dd90
	nop			;dd91
	nop			;dd92
	nop			;dd93
	nop			;dd94
	nop			;dd95
	nop			;dd96
	nop			;dd97
	ld l,(hl)			;dd98
	rst 30h			;dd99
	rst 28h			;dd9a
	rst 30h			;dd9b
	rst 28h			;dd9c
	rst 30h			;dd9d
	ld a,(hl)			;dd9e
	ld a,(hl)			;dd9f
	rst 38h			;dda0
	rst 38h			;dda1
	rst 38h			;dda2
	rst 38h			;dda3
	rst 38h			;dda4
	rst 38h			;dda5
	nop			;dda6
	nop			;dda7
	nop			;dda8
	nop			;dda9
	nop			;ddaa
	nop			;ddab
	nop			;ddac
	nop			;ddad
	nop			;ddae
	nop			;ddaf
	nop			;ddb0
lddb1h:
	nop			;ddb1
	add a,b			;ddb2
	add a,b			;ddb3
	nop			;ddb4
	nop			;ddb5
	nop			;ddb6
	call m,sub_fffeh		;ddb7
	rst 38h			;ddba
	cp 0fch		;ddbb
	ret p			;ddbd
	nop			;ddbe
	nop			;ddbf
	nop			;ddc0
	nop			;ddc1
	nop			;ddc2
	nop			;ddc3
	nop			;ddc4
	inc bc			;ddc5
	rlca			;ddc6
	rrca			;ddc7
	nop			;ddc8
	nop			;ddc9
	nop			;ddca
	nop			;ddcb
	nop			;ddcc
	nop			;ddcd
	nop			;ddce
	nop			;ddcf
	rlca			;ddd0
	rra			;ddd1
	ld a,a			;ddd2
	rst 38h			;ddd3
	ld a,a			;ddd4
	ccf			;ddd5
	nop			;ddd6
	nop			;ddd7
	nop			;ddd8
	nop			;ddd9
	nop			;ddda
	nop			;dddb
	nop			;dddc
	rst 20h			;dddd
	rst 30h			;ddde
	rst 28h			;dddf
	rst 30h			;dde0
	rst 38h			;dde1
	ld a,(hl)			;dde2
	ld a,(hl)			;dde3
	inc a			;dde4
	inc a			;dde5
	inc a			;dde6
	rst 38h			;dde7
	rst 38h			;dde8
	rst 38h			;dde9
	rst 38h			;ddea
	rst 38h			;ddeb
	rst 38h			;ddec
	rst 38h			;dded
	nop			;ddee
	nop			;ddef
	nop			;ddf0
	nop			;ddf1
	nop			;ddf2
	nop			;ddf3
	nop			;ddf4
	ret nz			;ddf5
	ret po			;ddf6
	ret p			;ddf7
	nop			;ddf8
	nop			;ddf9
	nop			;ddfa
	nop			;ddfb
	nop			;ddfc
	nop			;ddfd
	nop			;ddfe
	nop			;ddff
	ret po			;de00
	ret m			;de01
	cp 0ffh		;de02
	cp 0fch		;de04
	nop			;de06
	nop			;de07
	nop			;de08
	ld e,07fh		;de09
	cp a			;de0b
	rst 38h			;de0c
	rst 38h			;de0d
	ld a,l			;de0e
	rra			;de0f
	ld (bc),a			;de10
	nop			;de11
	nop			;de12
	nop			;de13
	nop			;de14
	nop			;de15
	nop			;de16
	nop			;de17
	nop			;de18
	nop			;de19
	nop			;de1a
	inc bc			;de1b
	inc bc			;de1c
	ld bc,00000h		;de1d
	nop			;de20
	jr ldea1h		;de21
	rst 38h			;de23
	cp a			;de24
	ei			;de25
	rst 38h			;de26
	rst 38h			;de27
	cp l			;de28
	jr $+1		;de29
	inc a			;de2b
	jr lde46h		;de2c
	jr lde48h		;de2e
	inc a			;de30
	inc a			;de31
	rst 38h			;de32
	rst 38h			;de33
	rst 38h			;de34
	rst 38h			;de35
	nop			;de36
	nop			;de37
	nop			;de38
	ld a,b			;de39
	cp 0f7h		;de3a
	defb 0fdh,0ffh,0feh	;illegal sequence		;de3c
	ret m			;de3f
	ld b,b			;de40
	nop			;de41
	nop			;de42
	nop			;de43
	nop			;de44
	nop			;de45
lde46h:
	nop			;de46
	nop			;de47
lde48h:
	nop			;de48
	nop			;de49
	nop			;de4a
	ret nz			;de4b
	ret nz			;de4c
	add a,b			;de4d
	nop			;de4e
	inc bc			;de4f
	ld e,03ch		;de50
	ld l,a			;de52
	ex de,hl			;de53
	ei			;de54
	ld (hl),e			;de55
	dec bc			;de56
	inc bc			;de57
	inc bc			;de58
	nop			;de59
	nop			;de5a
	nop			;de5b
	nop			;de5c
	nop			;de5d
	nop			;de5e
	nop			;de5f
	nop			;de60
	nop			;de61
	nop			;de62
	nop			;de63
	nop			;de64
	nop			;de65
	nop			;de66
	halt			;de67
	rst 38h			;de68
	sbc a,a			;de69
	cp l			;de6a
	sbc a,e			;de6b
	exx			;de6c
	defb 0fdh,0ffh,0ffh	;illegal sequence		;de6d
	cp a			;de70
	ld a,a			;de71
	ld a,e			;de72
	ld a,c			;de73
	dec a			;de74
	ld (de),a			;de75
	inc e			;de76
	inc e			;de77
	ld a,03ch		;de78
	ld a,(hl)			;de7a
	ld a,(hl)			;de7b
	ccf			;de7c
	ld a,000h		;de7d
	jr ldebfh		;de7f
	rst 38h			;de81
	cp a			;de82
lde83h:
	cp (hl)			;de83
	sbc a,0f8h		;de84
	ret nz			;de86
	ret nz			;de87
	add a,b			;de88
	add a,b			;de89
	nop			;de8a
	nop			;de8b
	nop			;de8c
	nop			;de8d
	nop			;de8e
	nop			;de8f
	nop			;de90
	nop			;de91
	nop			;de92
	nop			;de93
	nop			;de94
	nop			;de95
	nop			;de96
	rlca			;de97
	rra			;de98
	inc a			;de99
	ld a,b			;de9a
	ld sp,hl			;de9b
	ret p			;de9c
	call p,07cf8h		;de9d
	ccf			;dea0
ldea1h:
	rrca			;dea1
	ld c,005h		;dea2
	inc b			;dea4
	ld bc,00103h		;dea5
	ld bc,00001h		;dea8
	nop			;deab
	nop			;deac
	nop			;dead
	rst 38h			;deae
	cp 0fdh		;deaf
	cp a			;deb1
	rra			;deb2
	rrca			;deb3
	ld c,04ch		;deb4
	ld e,h			;deb6
	ld a,l			;deb7
	ret m			;deb8
	ret m			;deb9
	cp l			;deba
	cp a			;debb
	ccf			;debc
	rst 38h			;debd
	rst 38h			;debe
ldebfh:
	sbc a,a			;debf
	jp (hl)			;dec0
	or 0efh		;dec1
	rst 38h			;dec3
	rst 38h			;dec4
	ld a,(hl)			;dec5
	nop			;dec6
	ret po			;dec7
	ret m			;dec8
	call m,03ffeh		;dec9
	rra			;decc
	rra			;decd
	sbc a,a			;dece
	ld e,07ch		;decf
	jr nc,lde83h		;ded1
	ret po			;ded3
	ret po			;ded4
	ret nz			;ded5
	ret nz			;ded6
	add a,b			;ded7
	add a,b			;ded8
	add a,b			;ded9
	nop			;deda
	nop			;dedb
	nop			;dedc
	nop			;dedd
	nop			;dede
	rlca			;dedf
	rra			;dee0
	ccf			;dee1
	ld a,b			;dee2
	ret po			;dee3
	ex (sp),hl			;dee4
	rlca			;dee5
	jp lc8c5h		;dee6
	ret p			;dee9
	ld (hl),b			;deea
	ccf			;deeb
	ccf			;deec
	rlca			;deed
	rlca			;deee
	rlca			;deef
	ld bc,00001h		;def0
	nop			;def3
	nop			;def4
	nop			;def5
	call m,sub_fffch		;def6
	rrca			;def9
	nop			;defa
	ld (hl),c			;defb
	pop bc			;defc
	ld b,e			;defd
	ld b,a			;defe
	ld c,01ch		;deff
	ret p			;df01
	nop			;df02
	ret nz			;df03
	ret po			;df04
	rst 38h			;df05
	rst 38h			;df06
	dec e			;df07
	ret			;df08
	ret nz			;df09
	push af			;df0a
	defb 0edh;next byte illegal after ed		;df0b
	rst 18h			;df0c
	ld a,a			;df0d
	nop			;df0e
	nop			;df0f
	nop			;df10
	add a,b			;df11
	nop			;df12
	ret m			;df13
	ret m			;df14
	call m,000ffh		;df15
	rlca			;df18
	rlca			;df19
	rrca			;df1a
	ld c,01ch		;df1b
	call m,sub_e0f0h		;df1d
	ret po			;df20
	add a,b			;df21
	add a,b			;df22
	add a,b			;df23
	nop			;df24
	nop			;df25
	nop			;df26
	nop			;df27
	nop			;df28
	nop			;df29
	rlca			;df2a
	ccf			;df2b
	call m,0c1f1h		;df2c
	ld (bc),a			;df2f
	nop			;df30
	rlca			;df31
	nop			;df32
	ret p			;df33
	call m,03f24h		;df34
	rra			;df37
	inc e			;df38
	nop			;df39
	ld d,016h		;df3a
	inc e			;df3c
	nop			;df3d
	nop			;df3e
	nop			;df3f
	nop			;df40
	ld a,(hl)			;df41
	cp 0c0h		;df42
	nop			;df44
	di			;df45
	sbc a,(hl)			;df46
	ld b,b			;df47
	ld bc,07ff1h		;df48
	rlca			;df4b
	nop			;df4c
	ld e,0ffh		;df4d
	call m,0000fh		;df4f
	jr nz,ldf74h		;df52
	ld sp,00006h		;df54
	nop			;df57
	nop			;df58
	nop			;df59
	nop			;df5a
	nop			;df5b
	nop			;df5c
	nop			;df5d
	nop			;df5e
	ld a,0eeh		;df5f
	adc a,(hl)			;df61
	ld h,b			;df62
	ret po			;df63
	ld (bc),a			;df64
	ld (bc),a			;df65
	adc a,0f8h		;df66
	ret m			;df68
	nop			;df69
	ld b,b			;df6a
	add a,b			;df6b
	nop			;df6c
	nop			;df6d
	nop			;df6e
	nop			;df6f
	nop			;df70
	nop			;df71
	nop			;df72
	nop			;df73
ldf74h:
	ld (hl),l			;df74
	ld a,(bc)			;df75
	nop			;df76
	ld bc,01800h		;df77
	rlca			;df7a
	ex af,af'			;df7b
	nop			;df7c
	inc h			;df7d
	ld a,b			;df7e
	rrca			;df7f
	ld (bc),a			;df80
	nop			;df81
	inc d			;df82
	ld a,(bc)			;df83
	djnz ldf86h		;df84
ldf86h:
	nop			;df86
	nop			;df87
	nop			;df88
	nop			;df89
	nop			;df8a
	dec h			;df8b
	ret nc			;df8c
	nop			;df8d
	ret po			;df8e
	rra			;df8f
	nop			;df90
	nop			;df91
	ld a,b			;df92
	rlca			;df93
	ld (bc),a			;df94
	nop			;df95
	nop			;df96
	adc a,e			;df97
	sbc a,000h		;df98
	nop			;df9a
	inc d			;df9b
	nop			;df9c
	nop			;df9d
	nop			;df9e
	nop			;df9f
	nop			;dfa0
	nop			;dfa1
	nop			;dfa2
	ret nz			;dfa3
	jr nc,ldfa6h		;dfa4
ldfa6h:
	nop			;dfa6
	nop			;dfa7
	inc b			;dfa8
	ld (07814h),hl		;dfa9
	ld b,b			;dfac
	nop			;dfad
	ld c,078h		;dfae
	ld d,b			;dfb0
	nop			;dfb1
	nop			;dfb2
	ex af,af'			;dfb3
	nop			;dfb4
	and b			;dfb5
	nop			;dfb6
	nop			;dfb7
	nop			;dfb8
	nop			;dfb9
	nop			;dfba
	nop			;dfbb
	nop			;dfbc
	nop			;dfbd
	nop			;dfbe
	ld d,l			;dfbf
	ex af,af'			;dfc0
	nop			;dfc1
	ld (bc),a			;dfc2
	nop			;dfc3
	djnz ldfcbh		;dfc4
	nop			;dfc6
	inc b			;dfc7
	ld d,b			;dfc8
	ld (bc),a			;dfc9
	nop			;dfca
ldfcbh:
	djnz ldfedh		;dfcb
	nop			;dfcd
	nop			;dfce
	nop			;dfcf
	nop			;dfd0
	nop			;dfd1
	nop			;dfd2
	nop			;dfd3
	nop			;dfd4
	nop			;dfd5
	dec b			;dfd6
	ld d,b			;dfd7
	nop			;dfd8
	add a,b			;dfd9
	ld hl,(00000h)		;dfda
	ld d,b			;dfdd
	dec b			;dfde
	nop			;dfdf
	nop			;dfe0
	add a,b			;dfe1
	dec h			;dfe2
	nop			;dfe3
	jr nz,ldfe6h		;dfe4
ldfe6h:
	nop			;dfe6
	nop			;dfe7
	nop			;dfe8
	nop			;dfe9
	nop			;dfea
	nop			;dfeb
	nop			;dfec
ldfedh:
	nop			;dfed
	ld b,b			;dfee
	djnz ldff1h		;dfef
ldff1h:
	nop			;dff1
	nop			;dff2
	nop			;dff3
	nop			;dff4
	inc b			;dff5
	ld d,b			;dff6
	nop			;dff7
	nop			;dff8
	inc d			;dff9
	ld b,b			;dffa
	nop			;dffb
	ex af,af'			;dffc
	add a,b			;dffd
	rst 38h			;dffe
	rst 38h			;dfff
sub_e000h:
	rst 38h			;e000
	rst 38h			;e001
	rst 38h			;e002
	rst 38h			;e003
	rst 38h			;e004
	rst 38h			;e005
	rst 38h			;e006
	rst 38h			;e007
	rst 38h			;e008
	rst 38h			;e009
	rst 38h			;e00a
	rst 38h			;e00b
	rst 38h			;e00c
	rst 38h			;e00d
	rst 38h			;e00e
	rst 38h			;e00f
	rst 38h			;e010
	rst 38h			;e011
	rst 38h			;e012
	rst 38h			;e013
	rst 38h			;e014
	rst 38h			;e015
	rst 38h			;e016
	rst 38h			;e017
	rst 38h			;e018
	rst 38h			;e019
	rst 38h			;e01a
	rst 38h			;e01b
	rst 38h			;e01c
	rst 38h			;e01d
	rst 38h			;e01e
	rst 38h			;e01f
	rst 38h			;e020
	rst 38h			;e021
	rst 38h			;e022
	rst 38h			;e023
	rst 38h			;e024
	rst 38h			;e025
	rst 38h			;e026
	rst 38h			;e027
	rst 38h			;e028
	rst 38h			;e029
	rst 38h			;e02a
	rst 38h			;e02b
	rst 38h			;e02c
	rst 38h			;e02d
	rst 38h			;e02e
	rst 38h			;e02f
	rst 38h			;e030
	rst 38h			;e031
	rst 38h			;e032
	rst 38h			;e033
	rst 38h			;e034
	rst 38h			;e035
	rst 38h			;e036
	rst 38h			;e037
	rst 38h			;e038
	rst 38h			;e039
	rst 38h			;e03a
	rst 38h			;e03b
	rst 38h			;e03c
	rst 38h			;e03d
	rst 38h			;e03e
	rst 38h			;e03f
	rst 38h			;e040
	rst 38h			;e041
	rst 38h			;e042
	rst 38h			;e043
	rst 38h			;e044
	rst 38h			;e045
	rst 38h			;e046
	rst 38h			;e047
	rst 38h			;e048
	rst 38h			;e049
	rst 38h			;e04a
	rst 38h			;e04b
	rst 38h			;e04c
	rst 38h			;e04d
	rst 38h			;e04e
	rst 38h			;e04f
	rst 38h			;e050
	rst 38h			;e051
	rst 38h			;e052
	rst 38h			;e053
	rst 38h			;e054
	rst 38h			;e055
	rst 38h			;e056
	rst 38h			;e057
	rst 38h			;e058
	rst 38h			;e059
	rst 38h			;e05a
	rst 38h			;e05b
	rst 38h			;e05c
	rst 38h			;e05d
	rst 38h			;e05e
	rst 38h			;e05f
	rst 38h			;e060
	rst 38h			;e061
	rst 38h			;e062
	rst 38h			;e063
	rst 38h			;e064
	rst 38h			;e065
	rst 38h			;e066
	rst 38h			;e067
	rst 38h			;e068
	rst 38h			;e069
	rst 38h			;e06a
	rst 38h			;e06b
	rst 38h			;e06c
	rst 38h			;e06d
	rst 38h			;e06e
	rst 38h			;e06f
	rst 38h			;e070
	rst 38h			;e071
	rst 38h			;e072
	rst 38h			;e073
	rst 38h			;e074
	rst 38h			;e075
	rst 38h			;e076
	rst 38h			;e077
	rst 38h			;e078
	rst 38h			;e079
	rst 38h			;e07a
	rst 38h			;e07b
	rst 38h			;e07c
	rst 38h			;e07d
	rst 38h			;e07e
	rst 38h			;e07f
	rst 38h			;e080
	rst 38h			;e081
	rst 38h			;e082
	rst 38h			;e083
	rst 38h			;e084
	rst 38h			;e085
	rst 38h			;e086
	rst 38h			;e087
	rst 38h			;e088
	rst 38h			;e089
	rst 38h			;e08a
	rst 38h			;e08b
	rst 38h			;e08c
	rst 38h			;e08d
	rst 38h			;e08e
	rst 38h			;e08f
	rst 38h			;e090
	rst 38h			;e091
	rst 38h			;e092
	rst 38h			;e093
	rst 38h			;e094
	rst 38h			;e095
	rst 38h			;e096
	rst 38h			;e097
	rst 38h			;e098
	rst 38h			;e099
	rst 38h			;e09a
	rst 38h			;e09b
	rst 38h			;e09c
	rst 38h			;e09d
	rst 38h			;e09e
	rst 38h			;e09f
	rst 38h			;e0a0
	rst 38h			;e0a1
	rst 38h			;e0a2
	rst 38h			;e0a3
	rst 38h			;e0a4
	rst 38h			;e0a5
	rst 38h			;e0a6
	rst 38h			;e0a7
	rst 38h			;e0a8
	rst 38h			;e0a9
	rst 38h			;e0aa
	rst 38h			;e0ab
	rst 38h			;e0ac
	rst 38h			;e0ad
	rst 38h			;e0ae
	rst 38h			;e0af
	rst 38h			;e0b0
	rst 38h			;e0b1
	rst 38h			;e0b2
	rst 38h			;e0b3
	rst 38h			;e0b4
	rst 38h			;e0b5
	rst 38h			;e0b6
	rst 38h			;e0b7
	rst 38h			;e0b8
	rst 38h			;e0b9
	rst 38h			;e0ba
	rst 38h			;e0bb
	rst 38h			;e0bc
	rst 38h			;e0bd
	rst 38h			;e0be
	rst 38h			;e0bf
	rst 38h			;e0c0
	rst 38h			;e0c1
	rst 38h			;e0c2
	rst 38h			;e0c3
	rst 38h			;e0c4
	rst 38h			;e0c5
	rst 38h			;e0c6
	rst 38h			;e0c7
	rst 38h			;e0c8
	rst 38h			;e0c9
	rst 38h			;e0ca
	rst 38h			;e0cb
	rst 38h			;e0cc
	rst 38h			;e0cd
	rst 38h			;e0ce
	rst 38h			;e0cf
	rst 38h			;e0d0
	rst 38h			;e0d1
	rst 38h			;e0d2
	rst 38h			;e0d3
	rst 38h			;e0d4
	rst 38h			;e0d5
	rst 38h			;e0d6
	rst 38h			;e0d7
	rst 38h			;e0d8
	rst 38h			;e0d9
	rst 38h			;e0da
	rst 38h			;e0db
	rst 38h			;e0dc
	rst 38h			;e0dd
	rst 38h			;e0de
	rst 38h			;e0df
	rst 38h			;e0e0
	rst 38h			;e0e1
	rst 38h			;e0e2
	rst 38h			;e0e3
	rst 38h			;e0e4
	rst 38h			;e0e5
	rst 38h			;e0e6
	rst 38h			;e0e7
	rst 38h			;e0e8
	rst 38h			;e0e9
	rst 38h			;e0ea
	rst 38h			;e0eb
	rst 38h			;e0ec
	rst 38h			;e0ed
	rst 38h			;e0ee
	rst 38h			;e0ef
sub_e0f0h:
	rst 38h			;e0f0
	rst 38h			;e0f1
	rst 38h			;e0f2
	rst 38h			;e0f3
	rst 38h			;e0f4
	rst 38h			;e0f5
	rst 38h			;e0f6
	rst 38h			;e0f7
	rst 38h			;e0f8
	rst 38h			;e0f9
	rst 38h			;e0fa
	rst 38h			;e0fb
	rst 38h			;e0fc
	rst 38h			;e0fd
	rst 38h			;e0fe
	rst 38h			;e0ff
	rst 38h			;e100
	rst 38h			;e101
	rst 38h			;e102
	rst 38h			;e103
	rst 38h			;e104
	rst 38h			;e105
	rst 38h			;e106
	rst 38h			;e107
	rst 38h			;e108
	rst 38h			;e109
	rst 38h			;e10a
	rst 38h			;e10b
	rst 38h			;e10c
	rst 38h			;e10d
	rst 38h			;e10e
	rst 38h			;e10f
	rst 38h			;e110
	rst 38h			;e111
	rst 38h			;e112
	rst 38h			;e113
	rst 38h			;e114
	rst 38h			;e115
	rst 38h			;e116
	rst 38h			;e117
	rst 38h			;e118
	rst 38h			;e119
	rst 38h			;e11a
	rst 38h			;e11b
	rst 38h			;e11c
	rst 38h			;e11d
	rst 38h			;e11e
	rst 38h			;e11f
	rst 38h			;e120
	rst 38h			;e121
	rst 38h			;e122
	rst 38h			;e123
	rst 38h			;e124
	rst 38h			;e125
	rst 38h			;e126
	rst 38h			;e127
	rst 38h			;e128
	rst 38h			;e129
	rst 38h			;e12a
	rst 38h			;e12b
	rst 38h			;e12c
	rst 38h			;e12d
	rst 38h			;e12e
	rst 38h			;e12f
	rst 38h			;e130
	rst 38h			;e131
	rst 38h			;e132
	rst 38h			;e133
	rst 38h			;e134
	rst 38h			;e135
	rst 38h			;e136
	rst 38h			;e137
	rst 38h			;e138
	rst 38h			;e139
	rst 38h			;e13a
	rst 38h			;e13b
	rst 38h			;e13c
	rst 38h			;e13d
	rst 38h			;e13e
	rst 38h			;e13f
	rst 38h			;e140
	rst 38h			;e141
	rst 38h			;e142
	rst 38h			;e143
	rst 38h			;e144
	rst 38h			;e145
	rst 38h			;e146
	rst 38h			;e147
	rst 38h			;e148
	rst 38h			;e149
	rst 38h			;e14a
	rst 38h			;e14b
	rst 38h			;e14c
	rst 38h			;e14d
	rst 38h			;e14e
	rst 38h			;e14f
	rst 38h			;e150
	rst 38h			;e151
	rst 38h			;e152
	rst 38h			;e153
	rst 38h			;e154
	rst 38h			;e155
	rst 38h			;e156
	rst 38h			;e157
	rst 38h			;e158
	rst 38h			;e159
	rst 38h			;e15a
	rst 38h			;e15b
	rst 38h			;e15c
	rst 38h			;e15d
	rst 38h			;e15e
	rst 38h			;e15f
	rst 38h			;e160
	rst 38h			;e161
	rst 38h			;e162
	rst 38h			;e163
	rst 38h			;e164
	rst 38h			;e165
	rst 38h			;e166
	rst 38h			;e167
	rst 38h			;e168
	rst 38h			;e169
	rst 38h			;e16a
	rst 38h			;e16b
	rst 38h			;e16c
	rst 38h			;e16d
	rst 38h			;e16e
	rst 38h			;e16f
	rst 38h			;e170
	rst 38h			;e171
	rst 38h			;e172
	rst 38h			;e173
	rst 38h			;e174
	rst 38h			;e175
	rst 38h			;e176
	rst 38h			;e177
	rst 38h			;e178
	rst 38h			;e179
	rst 38h			;e17a
	rst 38h			;e17b
	rst 38h			;e17c
	rst 38h			;e17d
	rst 38h			;e17e
	rst 38h			;e17f
	rst 38h			;e180
	rst 38h			;e181
	rst 38h			;e182
	rst 38h			;e183
	rst 38h			;e184
	rst 38h			;e185
	rst 38h			;e186
	rst 38h			;e187
	rst 38h			;e188
	rst 38h			;e189
	rst 38h			;e18a
	rst 38h			;e18b
	rst 38h			;e18c
	rst 38h			;e18d
	rst 38h			;e18e
	rst 38h			;e18f
	rst 38h			;e190
	rst 38h			;e191
	rst 38h			;e192
	rst 38h			;e193
	rst 38h			;e194
	rst 38h			;e195
	rst 38h			;e196
	rst 38h			;e197
	rst 38h			;e198
	rst 38h			;e199
	rst 38h			;e19a
	rst 38h			;e19b
	rst 38h			;e19c
	rst 38h			;e19d
	rst 38h			;e19e
	rst 38h			;e19f
	rst 38h			;e1a0
	rst 38h			;e1a1
	rst 38h			;e1a2
	rst 38h			;e1a3
	rst 38h			;e1a4
	rst 38h			;e1a5
	rst 38h			;e1a6
	rst 38h			;e1a7
	rst 38h			;e1a8
	rst 38h			;e1a9
	rst 38h			;e1aa
	rst 38h			;e1ab
	rst 38h			;e1ac
	rst 38h			;e1ad
	rst 38h			;e1ae
	rst 38h			;e1af
	rst 38h			;e1b0
	rst 38h			;e1b1
	rst 38h			;e1b2
	rst 38h			;e1b3
	rst 38h			;e1b4
	rst 38h			;e1b5
	rst 38h			;e1b6
	rst 38h			;e1b7
	rst 38h			;e1b8
	rst 38h			;e1b9
	rst 38h			;e1ba
	rst 38h			;e1bb
	rst 38h			;e1bc
	rst 38h			;e1bd
	rst 38h			;e1be
	rst 38h			;e1bf
	rst 38h			;e1c0
	rst 38h			;e1c1
	rst 38h			;e1c2
	rst 38h			;e1c3
	rst 38h			;e1c4
	rst 38h			;e1c5
	rst 38h			;e1c6
	rst 38h			;e1c7
	rst 38h			;e1c8
	rst 38h			;e1c9
	rst 38h			;e1ca
	rst 38h			;e1cb
	rst 38h			;e1cc
	rst 38h			;e1cd
	rst 38h			;e1ce
	rst 38h			;e1cf
	rst 38h			;e1d0
	rst 38h			;e1d1
	rst 38h			;e1d2
	rst 38h			;e1d3
	rst 38h			;e1d4
	rst 38h			;e1d5
	rst 38h			;e1d6
	rst 38h			;e1d7
	rst 38h			;e1d8
	rst 38h			;e1d9
	rst 38h			;e1da
	rst 38h			;e1db
	rst 38h			;e1dc
	rst 38h			;e1dd
	rst 38h			;e1de
	rst 38h			;e1df
	rst 38h			;e1e0
	rst 38h			;e1e1
	rst 38h			;e1e2
	rst 38h			;e1e3
	rst 38h			;e1e4
	rst 38h			;e1e5
	rst 38h			;e1e6
	rst 38h			;e1e7
	rst 38h			;e1e8
	rst 38h			;e1e9
	rst 38h			;e1ea
	rst 38h			;e1eb
	rst 38h			;e1ec
	rst 38h			;e1ed
	rst 38h			;e1ee
	rst 38h			;e1ef
	rst 38h			;e1f0
	rst 38h			;e1f1
	rst 38h			;e1f2
	rst 38h			;e1f3
	rst 38h			;e1f4
	rst 38h			;e1f5
	rst 38h			;e1f6
	rst 38h			;e1f7
	rst 38h			;e1f8
	rst 38h			;e1f9
	rst 38h			;e1fa
	rst 38h			;e1fb
	rst 38h			;e1fc
	rst 38h			;e1fd
	rst 38h			;e1fe
	rst 38h			;e1ff
	rst 38h			;e200
	rst 38h			;e201
	rst 38h			;e202
	rst 38h			;e203
	rst 38h			;e204
	rst 38h			;e205
	rst 38h			;e206
	rst 38h			;e207
	rst 38h			;e208
	rst 38h			;e209
	rst 38h			;e20a
	rst 38h			;e20b
	rst 38h			;e20c
	rst 38h			;e20d
	rst 38h			;e20e
	rst 38h			;e20f
	rst 38h			;e210
	rst 38h			;e211
	rst 38h			;e212
	rst 38h			;e213
	rst 38h			;e214
	rst 38h			;e215
	rst 38h			;e216
	rst 38h			;e217
	rst 38h			;e218
	rst 38h			;e219
	rst 38h			;e21a
	rst 38h			;e21b
	rst 38h			;e21c
	rst 38h			;e21d
	rst 38h			;e21e
	rst 38h			;e21f
	rst 38h			;e220
	rst 38h			;e221
	rst 38h			;e222
	rst 38h			;e223
	rst 38h			;e224
	rst 38h			;e225
	rst 38h			;e226
	rst 38h			;e227
	rst 38h			;e228
	rst 38h			;e229
	rst 38h			;e22a
	rst 38h			;e22b
	rst 38h			;e22c
	rst 38h			;e22d
	rst 38h			;e22e
	rst 38h			;e22f
	rst 38h			;e230
	rst 38h			;e231
	rst 38h			;e232
	rst 38h			;e233
	rst 38h			;e234
	rst 38h			;e235
	rst 38h			;e236
	rst 38h			;e237
	rst 38h			;e238
	rst 38h			;e239
	rst 38h			;e23a
	rst 38h			;e23b
	rst 38h			;e23c
	rst 38h			;e23d
	rst 38h			;e23e
	rst 38h			;e23f
	rst 38h			;e240
	rst 38h			;e241
	rst 38h			;e242
	rst 38h			;e243
	rst 38h			;e244
	rst 38h			;e245
	rst 38h			;e246
	rst 38h			;e247
	rst 38h			;e248
	rst 38h			;e249
	rst 38h			;e24a
	rst 38h			;e24b
	rst 38h			;e24c
	rst 38h			;e24d
	rst 38h			;e24e
	rst 38h			;e24f
	rst 38h			;e250
	rst 38h			;e251
	rst 38h			;e252
	rst 38h			;e253
	rst 38h			;e254
	rst 38h			;e255
	rst 38h			;e256
	rst 38h			;e257
	rst 38h			;e258
	rst 38h			;e259
	rst 38h			;e25a
	rst 38h			;e25b
	rst 38h			;e25c
	rst 38h			;e25d
	rst 38h			;e25e
	rst 38h			;e25f
	rst 38h			;e260
	rst 38h			;e261
	rst 38h			;e262
	rst 38h			;e263
	rst 38h			;e264
	rst 38h			;e265
	rst 38h			;e266
	rst 38h			;e267
	rst 38h			;e268
	rst 38h			;e269
	rst 38h			;e26a
	rst 38h			;e26b
	rst 38h			;e26c
	rst 38h			;e26d
	rst 38h			;e26e
	rst 38h			;e26f
	rst 38h			;e270
	rst 38h			;e271
	rst 38h			;e272
	rst 38h			;e273
	rst 38h			;e274
	rst 38h			;e275
	rst 38h			;e276
	rst 38h			;e277
	rst 38h			;e278
	rst 38h			;e279
	rst 38h			;e27a
	rst 38h			;e27b
	rst 38h			;e27c
	rst 38h			;e27d
	rst 38h			;e27e
	rst 38h			;e27f
	rst 38h			;e280
	rst 38h			;e281
	rst 38h			;e282
	rst 38h			;e283
	rst 38h			;e284
	rst 38h			;e285
	rst 38h			;e286
	rst 38h			;e287
	rst 38h			;e288
	rst 38h			;e289
	rst 38h			;e28a
	rst 38h			;e28b
	rst 38h			;e28c
	rst 38h			;e28d
	rst 38h			;e28e
	rst 38h			;e28f
	rst 38h			;e290
	rst 38h			;e291
	rst 38h			;e292
	rst 38h			;e293
	rst 38h			;e294
	rst 38h			;e295
	rst 38h			;e296
	rst 38h			;e297
	rst 38h			;e298
	rst 38h			;e299
	rst 38h			;e29a
	rst 38h			;e29b
	rst 38h			;e29c
	rst 38h			;e29d
	rst 38h			;e29e
	rst 38h			;e29f
	rst 38h			;e2a0
	rst 38h			;e2a1
	rst 38h			;e2a2
	rst 38h			;e2a3
	rst 38h			;e2a4
	rst 38h			;e2a5
	rst 38h			;e2a6
	rst 38h			;e2a7
	rst 38h			;e2a8
	rst 38h			;e2a9
	rst 38h			;e2aa
	rst 38h			;e2ab
	rst 38h			;e2ac
	rst 38h			;e2ad
	rst 38h			;e2ae
	rst 38h			;e2af
	rst 38h			;e2b0
	rst 38h			;e2b1
	rst 38h			;e2b2
	rst 38h			;e2b3
	rst 38h			;e2b4
	rst 38h			;e2b5
	rst 38h			;e2b6
	rst 38h			;e2b7
	rst 38h			;e2b8
	rst 38h			;e2b9
	rst 38h			;e2ba
	rst 38h			;e2bb
	rst 38h			;e2bc
	rst 38h			;e2bd
	rst 38h			;e2be
	rst 38h			;e2bf
	rst 38h			;e2c0
	rst 38h			;e2c1
	rst 38h			;e2c2
	rst 38h			;e2c3
	rst 38h			;e2c4
	rst 38h			;e2c5
	rst 38h			;e2c6
	rst 38h			;e2c7
	rst 38h			;e2c8
	rst 38h			;e2c9
	rst 38h			;e2ca
	rst 38h			;e2cb
	rst 38h			;e2cc
	rst 38h			;e2cd
	rst 38h			;e2ce
	rst 38h			;e2cf
	rst 38h			;e2d0
	rst 38h			;e2d1
	rst 38h			;e2d2
	rst 38h			;e2d3
	rst 38h			;e2d4
	rst 38h			;e2d5
	rst 38h			;e2d6
	rst 38h			;e2d7
	rst 38h			;e2d8
	rst 38h			;e2d9
	rst 38h			;e2da
	rst 38h			;e2db
	rst 38h			;e2dc
	rst 38h			;e2dd
	rst 38h			;e2de
	rst 38h			;e2df
	rst 38h			;e2e0
	rst 38h			;e2e1
	rst 38h			;e2e2
	rst 38h			;e2e3
	rst 38h			;e2e4
	rst 38h			;e2e5
	rst 38h			;e2e6
	rst 38h			;e2e7
	rst 38h			;e2e8
	rst 38h			;e2e9
	rst 38h			;e2ea
	rst 38h			;e2eb
	rst 38h			;e2ec
	rst 38h			;e2ed
	rst 38h			;e2ee
	rst 38h			;e2ef
	rst 38h			;e2f0
	rst 38h			;e2f1
	rst 38h			;e2f2
	rst 38h			;e2f3
	rst 38h			;e2f4
	rst 38h			;e2f5
	rst 38h			;e2f6
	rst 38h			;e2f7
	rst 38h			;e2f8
	rst 38h			;e2f9
	rst 38h			;e2fa
	rst 38h			;e2fb
	rst 38h			;e2fc
	rst 38h			;e2fd
	rst 38h			;e2fe
	rst 38h			;e2ff
	rst 38h			;e300
	rst 38h			;e301
	rst 38h			;e302
	rst 38h			;e303
	rst 38h			;e304
	rst 38h			;e305
	rst 38h			;e306
	rst 38h			;e307
	rst 38h			;e308
	rst 38h			;e309
	rst 38h			;e30a
	rst 38h			;e30b
	rst 38h			;e30c
	rst 38h			;e30d
	rst 38h			;e30e
	rst 38h			;e30f
	rst 38h			;e310
	rst 38h			;e311
	rst 38h			;e312
	rst 38h			;e313
	rst 38h			;e314
	rst 38h			;e315
	rst 38h			;e316
	rst 38h			;e317
	rst 38h			;e318
	rst 38h			;e319
	rst 38h			;e31a
	rst 38h			;e31b
	rst 38h			;e31c
	rst 38h			;e31d
	rst 38h			;e31e
	rst 38h			;e31f
	rst 38h			;e320
	rst 38h			;e321
	rst 38h			;e322
	rst 38h			;e323
	rst 38h			;e324
	rst 38h			;e325
	rst 38h			;e326
	rst 38h			;e327
	rst 38h			;e328
	rst 38h			;e329
	rst 38h			;e32a
	rst 38h			;e32b
	rst 38h			;e32c
	rst 38h			;e32d
	rst 38h			;e32e
	rst 38h			;e32f
	rst 38h			;e330
	rst 38h			;e331
	rst 38h			;e332
	rst 38h			;e333
	rst 38h			;e334
	rst 38h			;e335
	rst 38h			;e336
	rst 38h			;e337
	rst 38h			;e338
	rst 38h			;e339
	rst 38h			;e33a
	rst 38h			;e33b
	rst 38h			;e33c
	rst 38h			;e33d
	rst 38h			;e33e
	rst 38h			;e33f
	rst 38h			;e340
	rst 38h			;e341
	rst 38h			;e342
	rst 38h			;e343
	rst 38h			;e344
	rst 38h			;e345
	rst 38h			;e346
	rst 38h			;e347
	rst 38h			;e348
	rst 38h			;e349
	rst 38h			;e34a
	rst 38h			;e34b
	rst 38h			;e34c
	rst 38h			;e34d
	rst 38h			;e34e
	rst 38h			;e34f
	rst 38h			;e350
	rst 38h			;e351
	rst 38h			;e352
	rst 38h			;e353
	rst 38h			;e354
	rst 38h			;e355
	rst 38h			;e356
	rst 38h			;e357
	rst 38h			;e358
	rst 38h			;e359
	rst 38h			;e35a
	rst 38h			;e35b
	rst 38h			;e35c
	rst 38h			;e35d
	rst 38h			;e35e
	rst 38h			;e35f
	rst 38h			;e360
	rst 38h			;e361
	rst 38h			;e362
	rst 38h			;e363
	rst 38h			;e364
	rst 38h			;e365
	rst 38h			;e366
	rst 38h			;e367
	rst 38h			;e368
	rst 38h			;e369
	rst 38h			;e36a
	rst 38h			;e36b
	rst 38h			;e36c
	rst 38h			;e36d
	rst 38h			;e36e
	rst 38h			;e36f
	rst 38h			;e370
	rst 38h			;e371
	rst 38h			;e372
	rst 38h			;e373
	rst 38h			;e374
	rst 38h			;e375
	rst 38h			;e376
	rst 38h			;e377
	rst 38h			;e378
	rst 38h			;e379
	rst 38h			;e37a
	rst 38h			;e37b
	rst 38h			;e37c
	rst 38h			;e37d
	rst 38h			;e37e
	rst 38h			;e37f
	rst 38h			;e380
	rst 38h			;e381
	rst 38h			;e382
	rst 38h			;e383
	rst 38h			;e384
	rst 38h			;e385
	rst 38h			;e386
	rst 38h			;e387
	rst 38h			;e388
	rst 38h			;e389
	rst 38h			;e38a
	rst 38h			;e38b
	rst 38h			;e38c
	rst 38h			;e38d
	rst 38h			;e38e
	rst 38h			;e38f
	rst 38h			;e390
	rst 38h			;e391
	rst 38h			;e392
	rst 38h			;e393
	rst 38h			;e394
	rst 38h			;e395
	rst 38h			;e396
	rst 38h			;e397
	rst 38h			;e398
	rst 38h			;e399
	rst 38h			;e39a
	rst 38h			;e39b
	rst 38h			;e39c
	rst 38h			;e39d
	rst 38h			;e39e
	rst 38h			;e39f
	rst 38h			;e3a0
	rst 38h			;e3a1
	rst 38h			;e3a2
	rst 38h			;e3a3
	rst 38h			;e3a4
	rst 38h			;e3a5
	rst 38h			;e3a6
	rst 38h			;e3a7
	rst 38h			;e3a8
	rst 38h			;e3a9
	rst 38h			;e3aa
	rst 38h			;e3ab
	rst 38h			;e3ac
	rst 38h			;e3ad
	rst 38h			;e3ae
	rst 38h			;e3af
	rst 38h			;e3b0
	rst 38h			;e3b1
	rst 38h			;e3b2
	rst 38h			;e3b3
	rst 38h			;e3b4
	rst 38h			;e3b5
	rst 38h			;e3b6
	rst 38h			;e3b7
	rst 38h			;e3b8
	rst 38h			;e3b9
	rst 38h			;e3ba
	rst 38h			;e3bb
	rst 38h			;e3bc
	rst 38h			;e3bd
	rst 38h			;e3be
	rst 38h			;e3bf
	rst 38h			;e3c0
	rst 38h			;e3c1
	rst 38h			;e3c2
	rst 38h			;e3c3
	rst 38h			;e3c4
	rst 38h			;e3c5
	rst 38h			;e3c6
	rst 38h			;e3c7
	rst 38h			;e3c8
	rst 38h			;e3c9
	rst 38h			;e3ca
	rst 38h			;e3cb
	rst 38h			;e3cc
	rst 38h			;e3cd
	rst 38h			;e3ce
	rst 38h			;e3cf
	rst 38h			;e3d0
	rst 38h			;e3d1
	rst 38h			;e3d2
	rst 38h			;e3d3
	rst 38h			;e3d4
	rst 38h			;e3d5
	rst 38h			;e3d6
	rst 38h			;e3d7
	rst 38h			;e3d8
	rst 38h			;e3d9
	rst 38h			;e3da
	rst 38h			;e3db
	rst 38h			;e3dc
	rst 38h			;e3dd
	rst 38h			;e3de
	rst 38h			;e3df
	rst 38h			;e3e0
	rst 38h			;e3e1
	rst 38h			;e3e2
	rst 38h			;e3e3
	rst 38h			;e3e4
	rst 38h			;e3e5
	rst 38h			;e3e6
	rst 38h			;e3e7
	rst 38h			;e3e8
	rst 38h			;e3e9
	rst 38h			;e3ea
	rst 38h			;e3eb
	rst 38h			;e3ec
	rst 38h			;e3ed
	rst 38h			;e3ee
	rst 38h			;e3ef
	rst 38h			;e3f0
	rst 38h			;e3f1
	rst 38h			;e3f2
	rst 38h			;e3f3
	rst 38h			;e3f4
	rst 38h			;e3f5
	rst 38h			;e3f6
	rst 38h			;e3f7
	rst 38h			;e3f8
	rst 38h			;e3f9
	rst 38h			;e3fa
	rst 38h			;e3fb
	rst 38h			;e3fc
	rst 38h			;e3fd
	rst 38h			;e3fe
	rst 38h			;e3ff
	rst 38h			;e400
	rst 38h			;e401
	rst 38h			;e402
	rst 38h			;e403
	rst 38h			;e404
	rst 38h			;e405
	rst 38h			;e406
	rst 38h			;e407
	rst 38h			;e408
	rst 38h			;e409
	rst 38h			;e40a
	rst 38h			;e40b
	rst 38h			;e40c
	rst 38h			;e40d
	rst 38h			;e40e
	rst 38h			;e40f
	rst 38h			;e410
	rst 38h			;e411
	rst 38h			;e412
	rst 38h			;e413
	rst 38h			;e414
	rst 38h			;e415
	rst 38h			;e416
	rst 38h			;e417
	rst 38h			;e418
	rst 38h			;e419
	rst 38h			;e41a
	rst 38h			;e41b
	rst 38h			;e41c
	rst 38h			;e41d
	rst 38h			;e41e
	rst 38h			;e41f
	rst 38h			;e420
	rst 38h			;e421
	rst 38h			;e422
	rst 38h			;e423
	rst 38h			;e424
	rst 38h			;e425
	rst 38h			;e426
	rst 38h			;e427
	rst 38h			;e428
	rst 38h			;e429
	rst 38h			;e42a
	rst 38h			;e42b
	rst 38h			;e42c
	rst 38h			;e42d
	rst 38h			;e42e
	rst 38h			;e42f
	rst 38h			;e430
	rst 38h			;e431
	rst 38h			;e432
	rst 38h			;e433
	rst 38h			;e434
	rst 38h			;e435
	rst 38h			;e436
	rst 38h			;e437
	rst 38h			;e438
	rst 38h			;e439
	rst 38h			;e43a
	rst 38h			;e43b
	rst 38h			;e43c
	rst 38h			;e43d
	rst 38h			;e43e
	rst 38h			;e43f
	rst 38h			;e440
	rst 38h			;e441
	rst 38h			;e442
	rst 38h			;e443
	rst 38h			;e444
	rst 38h			;e445
	rst 38h			;e446
	rst 38h			;e447
	rst 38h			;e448
	rst 38h			;e449
	rst 38h			;e44a
	rst 38h			;e44b
	rst 38h			;e44c
	rst 38h			;e44d
	rst 38h			;e44e
	rst 38h			;e44f
	rst 38h			;e450
	rst 38h			;e451
	rst 38h			;e452
	rst 38h			;e453
	rst 38h			;e454
	rst 38h			;e455
	rst 38h			;e456
	rst 38h			;e457
	rst 38h			;e458
	rst 38h			;e459
	rst 38h			;e45a
	rst 38h			;e45b
	rst 38h			;e45c
	rst 38h			;e45d
	rst 38h			;e45e
	rst 38h			;e45f
	rst 38h			;e460
	rst 38h			;e461
	rst 38h			;e462
	rst 38h			;e463
	rst 38h			;e464
	rst 38h			;e465
	rst 38h			;e466
	rst 38h			;e467
	rst 38h			;e468
	rst 38h			;e469
	rst 38h			;e46a
	rst 38h			;e46b
	rst 38h			;e46c
	rst 38h			;e46d
	rst 38h			;e46e
	rst 38h			;e46f
	rst 38h			;e470
	rst 38h			;e471
	rst 38h			;e472
	rst 38h			;e473
	rst 38h			;e474
	rst 38h			;e475
	rst 38h			;e476
	rst 38h			;e477
	rst 38h			;e478
	rst 38h			;e479
	rst 38h			;e47a
	rst 38h			;e47b
	rst 38h			;e47c
	rst 38h			;e47d
	rst 38h			;e47e
	rst 38h			;e47f
	rst 38h			;e480
	rst 38h			;e481
	rst 38h			;e482
	rst 38h			;e483
	rst 38h			;e484
	rst 38h			;e485
	rst 38h			;e486
	rst 38h			;e487
	rst 38h			;e488
	rst 38h			;e489
	rst 38h			;e48a
	rst 38h			;e48b
	rst 38h			;e48c
	rst 38h			;e48d
	rst 38h			;e48e
	rst 38h			;e48f
	rst 38h			;e490
	rst 38h			;e491
	rst 38h			;e492
	rst 38h			;e493
	rst 38h			;e494
	rst 38h			;e495
	rst 38h			;e496
	rst 38h			;e497
	rst 38h			;e498
	rst 38h			;e499
	rst 38h			;e49a
	rst 38h			;e49b
	rst 38h			;e49c
	rst 38h			;e49d
	rst 38h			;e49e
	rst 38h			;e49f
	rst 38h			;e4a0
	rst 38h			;e4a1
	rst 38h			;e4a2
	rst 38h			;e4a3
	rst 38h			;e4a4
	rst 38h			;e4a5
	rst 38h			;e4a6
	rst 38h			;e4a7
	rst 38h			;e4a8
	rst 38h			;e4a9
	rst 38h			;e4aa
	rst 38h			;e4ab
	rst 38h			;e4ac
	rst 38h			;e4ad
	rst 38h			;e4ae
	rst 38h			;e4af
	rst 38h			;e4b0
	rst 38h			;e4b1
	rst 38h			;e4b2
	rst 38h			;e4b3
	rst 38h			;e4b4
	rst 38h			;e4b5
	rst 38h			;e4b6
	rst 38h			;e4b7
	rst 38h			;e4b8
	rst 38h			;e4b9
	rst 38h			;e4ba
	rst 38h			;e4bb
	rst 38h			;e4bc
	rst 38h			;e4bd
	rst 38h			;e4be
	rst 38h			;e4bf
	rst 38h			;e4c0
	rst 38h			;e4c1
	rst 38h			;e4c2
	rst 38h			;e4c3
	rst 38h			;e4c4
	rst 38h			;e4c5
	rst 38h			;e4c6
	rst 38h			;e4c7
	rst 38h			;e4c8
	rst 38h			;e4c9
	rst 38h			;e4ca
	rst 38h			;e4cb
	rst 38h			;e4cc
	rst 38h			;e4cd
	rst 38h			;e4ce
	rst 38h			;e4cf
	rst 38h			;e4d0
	rst 38h			;e4d1
	rst 38h			;e4d2
	rst 38h			;e4d3
	rst 38h			;e4d4
	rst 38h			;e4d5
	rst 38h			;e4d6
	rst 38h			;e4d7
	rst 38h			;e4d8
	rst 38h			;e4d9
	rst 38h			;e4da
	rst 38h			;e4db
	rst 38h			;e4dc
	rst 38h			;e4dd
	rst 38h			;e4de
	rst 38h			;e4df
	rst 38h			;e4e0
	rst 38h			;e4e1
	rst 38h			;e4e2
	rst 38h			;e4e3
	rst 38h			;e4e4
	rst 38h			;e4e5
	rst 38h			;e4e6
	rst 38h			;e4e7
	rst 38h			;e4e8
	rst 38h			;e4e9
	rst 38h			;e4ea
	rst 38h			;e4eb
	rst 38h			;e4ec
	rst 38h			;e4ed
	rst 38h			;e4ee
	rst 38h			;e4ef
	rst 38h			;e4f0
	rst 38h			;e4f1
	rst 38h			;e4f2
	rst 38h			;e4f3
	rst 38h			;e4f4
	rst 38h			;e4f5
	rst 38h			;e4f6
	rst 38h			;e4f7
	rst 38h			;e4f8
	rst 38h			;e4f9
	rst 38h			;e4fa
	rst 38h			;e4fb
	rst 38h			;e4fc
	rst 38h			;e4fd
	rst 38h			;e4fe
	rst 38h			;e4ff
	rst 38h			;e500
	rst 38h			;e501
	rst 38h			;e502
	rst 38h			;e503
	rst 38h			;e504
	rst 38h			;e505
	rst 38h			;e506
	rst 38h			;e507
	rst 38h			;e508
	rst 38h			;e509
	rst 38h			;e50a
	rst 38h			;e50b
	rst 38h			;e50c
	rst 38h			;e50d
	rst 38h			;e50e
	rst 38h			;e50f
	rst 38h			;e510
	rst 38h			;e511
	rst 38h			;e512
	rst 38h			;e513
	rst 38h			;e514
	rst 38h			;e515
	rst 38h			;e516
	rst 38h			;e517
	rst 38h			;e518
	rst 38h			;e519
	rst 38h			;e51a
	rst 38h			;e51b
	rst 38h			;e51c
	rst 38h			;e51d
	rst 38h			;e51e
	rst 38h			;e51f
	rst 38h			;e520
	rst 38h			;e521
	rst 38h			;e522
	rst 38h			;e523
	rst 38h			;e524
	rst 38h			;e525
	rst 38h			;e526
	rst 38h			;e527
	rst 38h			;e528
	rst 38h			;e529
	rst 38h			;e52a
	rst 38h			;e52b
	rst 38h			;e52c
	rst 38h			;e52d
	rst 38h			;e52e
	rst 38h			;e52f
	rst 38h			;e530
	rst 38h			;e531
	rst 38h			;e532
	rst 38h			;e533
	rst 38h			;e534
	rst 38h			;e535
	rst 38h			;e536
	rst 38h			;e537
	rst 38h			;e538
	rst 38h			;e539
	rst 38h			;e53a
	rst 38h			;e53b
	rst 38h			;e53c
	rst 38h			;e53d
	rst 38h			;e53e
	rst 38h			;e53f
	rst 38h			;e540
	rst 38h			;e541
	rst 38h			;e542
	rst 38h			;e543
	rst 38h			;e544
	rst 38h			;e545
	rst 38h			;e546
	rst 38h			;e547
	rst 38h			;e548
	rst 38h			;e549
	rst 38h			;e54a
	rst 38h			;e54b
	rst 38h			;e54c
	rst 38h			;e54d
	rst 38h			;e54e
	rst 38h			;e54f
	rst 38h			;e550
	rst 38h			;e551
	rst 38h			;e552
	rst 38h			;e553
	rst 38h			;e554
	rst 38h			;e555
	rst 38h			;e556
	rst 38h			;e557
	rst 38h			;e558
	rst 38h			;e559
	rst 38h			;e55a
	rst 38h			;e55b
	rst 38h			;e55c
	rst 38h			;e55d
	rst 38h			;e55e
	rst 38h			;e55f
	rst 38h			;e560
	rst 38h			;e561
	rst 38h			;e562
	rst 38h			;e563
	rst 38h			;e564
	rst 38h			;e565
	rst 38h			;e566
	rst 38h			;e567
	rst 38h			;e568
	rst 38h			;e569
	rst 38h			;e56a
	rst 38h			;e56b
	rst 38h			;e56c
	rst 38h			;e56d
	rst 38h			;e56e
	rst 38h			;e56f
	rst 38h			;e570
	rst 38h			;e571
	rst 38h			;e572
	rst 38h			;e573
	rst 38h			;e574
	rst 38h			;e575
	rst 38h			;e576
	rst 38h			;e577
	rst 38h			;e578
	rst 38h			;e579
	rst 38h			;e57a
	rst 38h			;e57b
	rst 38h			;e57c
	rst 38h			;e57d
	rst 38h			;e57e
	rst 38h			;e57f
	rst 38h			;e580
	rst 38h			;e581
	rst 38h			;e582
	rst 38h			;e583
	rst 38h			;e584
	rst 38h			;e585
	rst 38h			;e586
	rst 38h			;e587
	rst 38h			;e588
	rst 38h			;e589
	rst 38h			;e58a
	rst 38h			;e58b
	rst 38h			;e58c
	rst 38h			;e58d
	rst 38h			;e58e
	rst 38h			;e58f
	rst 38h			;e590
	rst 38h			;e591
	rst 38h			;e592
	rst 38h			;e593
	rst 38h			;e594
	rst 38h			;e595
	rst 38h			;e596
	rst 38h			;e597
	rst 38h			;e598
	rst 38h			;e599
	rst 38h			;e59a
	rst 38h			;e59b
	rst 38h			;e59c
	rst 38h			;e59d
	rst 38h			;e59e
	rst 38h			;e59f
	rst 38h			;e5a0
	rst 38h			;e5a1
	rst 38h			;e5a2
	rst 38h			;e5a3
	rst 38h			;e5a4
	rst 38h			;e5a5
	rst 38h			;e5a6
	rst 38h			;e5a7
	rst 38h			;e5a8
	rst 38h			;e5a9
	rst 38h			;e5aa
	rst 38h			;e5ab
	rst 38h			;e5ac
	rst 38h			;e5ad
	rst 38h			;e5ae
	rst 38h			;e5af
	rst 38h			;e5b0
	rst 38h			;e5b1
	rst 38h			;e5b2
	rst 38h			;e5b3
	rst 38h			;e5b4
	rst 38h			;e5b5
	rst 38h			;e5b6
	rst 38h			;e5b7
	rst 38h			;e5b8
	rst 38h			;e5b9
	rst 38h			;e5ba
	rst 38h			;e5bb
	rst 38h			;e5bc
	rst 38h			;e5bd
	rst 38h			;e5be
	rst 38h			;e5bf
	rst 38h			;e5c0
	rst 38h			;e5c1
	rst 38h			;e5c2
	rst 38h			;e5c3
	rst 38h			;e5c4
	rst 38h			;e5c5
	rst 38h			;e5c6
	rst 38h			;e5c7
	rst 38h			;e5c8
	rst 38h			;e5c9
	rst 38h			;e5ca
	rst 38h			;e5cb
	rst 38h			;e5cc
	rst 38h			;e5cd
	rst 38h			;e5ce
	rst 38h			;e5cf
	rst 38h			;e5d0
	rst 38h			;e5d1
	rst 38h			;e5d2
	rst 38h			;e5d3
	rst 38h			;e5d4
	rst 38h			;e5d5
	rst 38h			;e5d6
	rst 38h			;e5d7
	rst 38h			;e5d8
	rst 38h			;e5d9
	rst 38h			;e5da
	rst 38h			;e5db
	rst 38h			;e5dc
	rst 38h			;e5dd
	rst 38h			;e5de
	rst 38h			;e5df
	rst 38h			;e5e0
	rst 38h			;e5e1
	rst 38h			;e5e2
	rst 38h			;e5e3
	rst 38h			;e5e4
	rst 38h			;e5e5
	rst 38h			;e5e6
	rst 38h			;e5e7
	rst 38h			;e5e8
	rst 38h			;e5e9
	rst 38h			;e5ea
	rst 38h			;e5eb
	rst 38h			;e5ec
	rst 38h			;e5ed
	rst 38h			;e5ee
	rst 38h			;e5ef
	rst 38h			;e5f0
	rst 38h			;e5f1
	rst 38h			;e5f2
	rst 38h			;e5f3
	rst 38h			;e5f4
	rst 38h			;e5f5
	rst 38h			;e5f6
	rst 38h			;e5f7
	rst 38h			;e5f8
	rst 38h			;e5f9
	rst 38h			;e5fa
	rst 38h			;e5fb
	rst 38h			;e5fc
	rst 38h			;e5fd
	rst 38h			;e5fe
	rst 38h			;e5ff
	rst 38h			;e600
	rst 38h			;e601
	rst 38h			;e602
	rst 38h			;e603
	rst 38h			;e604
	rst 38h			;e605
	rst 38h			;e606
	rst 38h			;e607
	rst 38h			;e608
	rst 38h			;e609
	rst 38h			;e60a
	rst 38h			;e60b
	rst 38h			;e60c
	rst 38h			;e60d
	rst 38h			;e60e
	rst 38h			;e60f
	rst 38h			;e610
	rst 38h			;e611
	rst 38h			;e612
	rst 38h			;e613
	rst 38h			;e614
	rst 38h			;e615
	rst 38h			;e616
	rst 38h			;e617
	rst 38h			;e618
	rst 38h			;e619
	rst 38h			;e61a
	rst 38h			;e61b
	rst 38h			;e61c
	rst 38h			;e61d
	rst 38h			;e61e
	rst 38h			;e61f
	rst 38h			;e620
	rst 38h			;e621
	rst 38h			;e622
	rst 38h			;e623
	rst 38h			;e624
	rst 38h			;e625
	rst 38h			;e626
	rst 38h			;e627
	rst 38h			;e628
	rst 38h			;e629
	rst 38h			;e62a
	rst 38h			;e62b
	rst 38h			;e62c
	rst 38h			;e62d
	rst 38h			;e62e
	rst 38h			;e62f
	rst 38h			;e630
	rst 38h			;e631
	rst 38h			;e632
	rst 38h			;e633
	rst 38h			;e634
	rst 38h			;e635
	rst 38h			;e636
	rst 38h			;e637
	rst 38h			;e638
	rst 38h			;e639
	rst 38h			;e63a
	rst 38h			;e63b
	rst 38h			;e63c
	rst 38h			;e63d
	rst 38h			;e63e
	rst 38h			;e63f
	rst 38h			;e640
	rst 38h			;e641
	rst 38h			;e642
	rst 38h			;e643
	rst 38h			;e644
	rst 38h			;e645
	rst 38h			;e646
	rst 38h			;e647
	rst 38h			;e648
	rst 38h			;e649
	rst 38h			;e64a
	rst 38h			;e64b
	rst 38h			;e64c
	rst 38h			;e64d
	rst 38h			;e64e
	rst 38h			;e64f
	rst 38h			;e650
	rst 38h			;e651
	rst 38h			;e652
	rst 38h			;e653
	rst 38h			;e654
	rst 38h			;e655
	rst 38h			;e656
	rst 38h			;e657
	rst 38h			;e658
	rst 38h			;e659
	rst 38h			;e65a
	rst 38h			;e65b
	rst 38h			;e65c
	rst 38h			;e65d
	rst 38h			;e65e
	rst 38h			;e65f
	rst 38h			;e660
	rst 38h			;e661
	rst 38h			;e662
	rst 38h			;e663
	rst 38h			;e664
	rst 38h			;e665
	rst 38h			;e666
	rst 38h			;e667
	rst 38h			;e668
	rst 38h			;e669
	rst 38h			;e66a
	rst 38h			;e66b
	rst 38h			;e66c
	rst 38h			;e66d
	rst 38h			;e66e
	rst 38h			;e66f
	rst 38h			;e670
	rst 38h			;e671
	rst 38h			;e672
	rst 38h			;e673
	rst 38h			;e674
	rst 38h			;e675
	rst 38h			;e676
	rst 38h			;e677
	rst 38h			;e678
	rst 38h			;e679
	rst 38h			;e67a
	rst 38h			;e67b
	rst 38h			;e67c
	rst 38h			;e67d
	rst 38h			;e67e
	rst 38h			;e67f
	rst 38h			;e680
	rst 38h			;e681
	rst 38h			;e682
	rst 38h			;e683
	rst 38h			;e684
	rst 38h			;e685
	rst 38h			;e686
	rst 38h			;e687
	rst 38h			;e688
	rst 38h			;e689
	rst 38h			;e68a
	rst 38h			;e68b
	rst 38h			;e68c
	rst 38h			;e68d
	rst 38h			;e68e
	rst 38h			;e68f
	rst 38h			;e690
	rst 38h			;e691
	rst 38h			;e692
	rst 38h			;e693
	rst 38h			;e694
	rst 38h			;e695
	rst 38h			;e696
	rst 38h			;e697
	rst 38h			;e698
	rst 38h			;e699
	rst 38h			;e69a
	rst 38h			;e69b
	rst 38h			;e69c
	rst 38h			;e69d
	rst 38h			;e69e
	rst 38h			;e69f
	rst 38h			;e6a0
	rst 38h			;e6a1
	rst 38h			;e6a2
	rst 38h			;e6a3
	rst 38h			;e6a4
	rst 38h			;e6a5
	rst 38h			;e6a6
	rst 38h			;e6a7
	rst 38h			;e6a8
	rst 38h			;e6a9
	rst 38h			;e6aa
	rst 38h			;e6ab
	rst 38h			;e6ac
	rst 38h			;e6ad
	rst 38h			;e6ae
	rst 38h			;e6af
	rst 38h			;e6b0
	rst 38h			;e6b1
	rst 38h			;e6b2
	rst 38h			;e6b3
	rst 38h			;e6b4
	rst 38h			;e6b5
	rst 38h			;e6b6
	rst 38h			;e6b7
	rst 38h			;e6b8
	rst 38h			;e6b9
	rst 38h			;e6ba
	rst 38h			;e6bb
	rst 38h			;e6bc
	rst 38h			;e6bd
	rst 38h			;e6be
	rst 38h			;e6bf
	rst 38h			;e6c0
	rst 38h			;e6c1
	rst 38h			;e6c2
	rst 38h			;e6c3
	rst 38h			;e6c4
	rst 38h			;e6c5
	rst 38h			;e6c6
	rst 38h			;e6c7
	rst 38h			;e6c8
	rst 38h			;e6c9
	rst 38h			;e6ca
	rst 38h			;e6cb
	rst 38h			;e6cc
	rst 38h			;e6cd
	rst 38h			;e6ce
	rst 38h			;e6cf
	rst 38h			;e6d0
	rst 38h			;e6d1
	rst 38h			;e6d2
	rst 38h			;e6d3
	rst 38h			;e6d4
	rst 38h			;e6d5
	rst 38h			;e6d6
	rst 38h			;e6d7
	rst 38h			;e6d8
	rst 38h			;e6d9
	rst 38h			;e6da
	rst 38h			;e6db
	rst 38h			;e6dc
	rst 38h			;e6dd
	rst 38h			;e6de
	rst 38h			;e6df
	rst 38h			;e6e0
	rst 38h			;e6e1
	rst 38h			;e6e2
	rst 38h			;e6e3
	rst 38h			;e6e4
	rst 38h			;e6e5
	rst 38h			;e6e6
	rst 38h			;e6e7
	rst 38h			;e6e8
	rst 38h			;e6e9
	rst 38h			;e6ea
	rst 38h			;e6eb
	rst 38h			;e6ec
	rst 38h			;e6ed
	rst 38h			;e6ee
	rst 38h			;e6ef
	rst 38h			;e6f0
	rst 38h			;e6f1
	rst 38h			;e6f2
	rst 38h			;e6f3
	rst 38h			;e6f4
	rst 38h			;e6f5
	rst 38h			;e6f6
	rst 38h			;e6f7
	rst 38h			;e6f8
	rst 38h			;e6f9
	rst 38h			;e6fa
	rst 38h			;e6fb
	rst 38h			;e6fc
	rst 38h			;e6fd
	rst 38h			;e6fe
	rst 38h			;e6ff
	rst 38h			;e700
	rst 38h			;e701
	rst 38h			;e702
	rst 38h			;e703
	rst 38h			;e704
	rst 38h			;e705
	rst 38h			;e706
	rst 38h			;e707
	rst 38h			;e708
	rst 38h			;e709
	rst 38h			;e70a
	rst 38h			;e70b
	rst 38h			;e70c
	rst 38h			;e70d
	rst 38h			;e70e
	rst 38h			;e70f
	rst 38h			;e710
	rst 38h			;e711
	rst 38h			;e712
	rst 38h			;e713
	rst 38h			;e714
	rst 38h			;e715
	rst 38h			;e716
	rst 38h			;e717
	rst 38h			;e718
	rst 38h			;e719
	rst 38h			;e71a
	rst 38h			;e71b
	rst 38h			;e71c
	rst 38h			;e71d
	rst 38h			;e71e
	rst 38h			;e71f
	rst 38h			;e720
	rst 38h			;e721
	rst 38h			;e722
	rst 38h			;e723
	rst 38h			;e724
	rst 38h			;e725
	rst 38h			;e726
	rst 38h			;e727
	rst 38h			;e728
	rst 38h			;e729
	rst 38h			;e72a
	rst 38h			;e72b
	rst 38h			;e72c
	rst 38h			;e72d
	rst 38h			;e72e
	rst 38h			;e72f
	rst 38h			;e730
	rst 38h			;e731
	rst 38h			;e732
	rst 38h			;e733
	rst 38h			;e734
	rst 38h			;e735
	rst 38h			;e736
	rst 38h			;e737
	rst 38h			;e738
	rst 38h			;e739
	rst 38h			;e73a
	rst 38h			;e73b
	rst 38h			;e73c
	rst 38h			;e73d
	rst 38h			;e73e
	rst 38h			;e73f
	rst 38h			;e740
	rst 38h			;e741
	rst 38h			;e742
	rst 38h			;e743
	rst 38h			;e744
	rst 38h			;e745
	rst 38h			;e746
	rst 38h			;e747
	rst 38h			;e748
	rst 38h			;e749
	rst 38h			;e74a
	rst 38h			;e74b
	rst 38h			;e74c
	rst 38h			;e74d
	rst 38h			;e74e
	rst 38h			;e74f
	rst 38h			;e750
	rst 38h			;e751
	rst 38h			;e752
	rst 38h			;e753
	rst 38h			;e754
	rst 38h			;e755
	rst 38h			;e756
	rst 38h			;e757
	rst 38h			;e758
	rst 38h			;e759
	rst 38h			;e75a
	rst 38h			;e75b
	rst 38h			;e75c
	rst 38h			;e75d
	rst 38h			;e75e
	rst 38h			;e75f
	rst 38h			;e760
	rst 38h			;e761
	rst 38h			;e762
	rst 38h			;e763
	rst 38h			;e764
	rst 38h			;e765
	rst 38h			;e766
	rst 38h			;e767
	rst 38h			;e768
	rst 38h			;e769
	rst 38h			;e76a
	rst 38h			;e76b
	rst 38h			;e76c
	rst 38h			;e76d
	rst 38h			;e76e
	rst 38h			;e76f
	rst 38h			;e770
	rst 38h			;e771
	rst 38h			;e772
	rst 38h			;e773
	rst 38h			;e774
	rst 38h			;e775
	rst 38h			;e776
	rst 38h			;e777
	rst 38h			;e778
	rst 38h			;e779
	rst 38h			;e77a
	rst 38h			;e77b
	rst 38h			;e77c
	rst 38h			;e77d
	rst 38h			;e77e
	rst 38h			;e77f
	rst 38h			;e780
	rst 38h			;e781
	rst 38h			;e782
	rst 38h			;e783
	rst 38h			;e784
	rst 38h			;e785
	rst 38h			;e786
	rst 38h			;e787
	rst 38h			;e788
	rst 38h			;e789
	rst 38h			;e78a
	rst 38h			;e78b
	rst 38h			;e78c
	rst 38h			;e78d
	rst 38h			;e78e
	rst 38h			;e78f
	rst 38h			;e790
	rst 38h			;e791
	rst 38h			;e792
	rst 38h			;e793
	rst 38h			;e794
	rst 38h			;e795
	rst 38h			;e796
	rst 38h			;e797
	rst 38h			;e798
	rst 38h			;e799
	rst 38h			;e79a
	rst 38h			;e79b
	rst 38h			;e79c
	rst 38h			;e79d
	rst 38h			;e79e
	rst 38h			;e79f
	rst 38h			;e7a0
	rst 38h			;e7a1
	rst 38h			;e7a2
	rst 38h			;e7a3
	rst 38h			;e7a4
	rst 38h			;e7a5
	rst 38h			;e7a6
	rst 38h			;e7a7
	rst 38h			;e7a8
	rst 38h			;e7a9
	rst 38h			;e7aa
	rst 38h			;e7ab
	rst 38h			;e7ac
	rst 38h			;e7ad
	rst 38h			;e7ae
	rst 38h			;e7af
	rst 38h			;e7b0
	rst 38h			;e7b1
	rst 38h			;e7b2
	rst 38h			;e7b3
	rst 38h			;e7b4
	rst 38h			;e7b5
	rst 38h			;e7b6
	rst 38h			;e7b7
	rst 38h			;e7b8
	rst 38h			;e7b9
	rst 38h			;e7ba
	rst 38h			;e7bb
	rst 38h			;e7bc
	rst 38h			;e7bd
	rst 38h			;e7be
	rst 38h			;e7bf
	rst 38h			;e7c0
	rst 38h			;e7c1
	rst 38h			;e7c2
	rst 38h			;e7c3
	rst 38h			;e7c4
	rst 38h			;e7c5
	rst 38h			;e7c6
	rst 38h			;e7c7
	rst 38h			;e7c8
	rst 38h			;e7c9
	rst 38h			;e7ca
	rst 38h			;e7cb
	rst 38h			;e7cc
	rst 38h			;e7cd
	rst 38h			;e7ce
	rst 38h			;e7cf
	rst 38h			;e7d0
	rst 38h			;e7d1
	rst 38h			;e7d2
	rst 38h			;e7d3
	rst 38h			;e7d4
	rst 38h			;e7d5
	rst 38h			;e7d6
	rst 38h			;e7d7
	rst 38h			;e7d8
	rst 38h			;e7d9
	rst 38h			;e7da
	rst 38h			;e7db
	rst 38h			;e7dc
	rst 38h			;e7dd
	rst 38h			;e7de
	rst 38h			;e7df
	rst 38h			;e7e0
	rst 38h			;e7e1
	rst 38h			;e7e2
	rst 38h			;e7e3
	rst 38h			;e7e4
	rst 38h			;e7e5
	rst 38h			;e7e6
	rst 38h			;e7e7
	rst 38h			;e7e8
	rst 38h			;e7e9
	rst 38h			;e7ea
	rst 38h			;e7eb
	rst 38h			;e7ec
	rst 38h			;e7ed
	rst 38h			;e7ee
	rst 38h			;e7ef
	rst 38h			;e7f0
	rst 38h			;e7f1
	rst 38h			;e7f2
	rst 38h			;e7f3
	rst 38h			;e7f4
	rst 38h			;e7f5
	rst 38h			;e7f6
	rst 38h			;e7f7
	rst 38h			;e7f8
	rst 38h			;e7f9
	rst 38h			;e7fa
	rst 38h			;e7fb
	rst 38h			;e7fc
	rst 38h			;e7fd
	rst 38h			;e7fe
	rst 38h			;e7ff
sub_e800h:
	rst 38h			;e800
	rst 38h			;e801
	rst 38h			;e802
	rst 38h			;e803
	rst 38h			;e804
	rst 38h			;e805
	rst 38h			;e806
	rst 38h			;e807
	rst 38h			;e808
	rst 38h			;e809
	rst 38h			;e80a
	rst 38h			;e80b
	rst 38h			;e80c
	rst 38h			;e80d
	rst 38h			;e80e
	rst 38h			;e80f
	rst 38h			;e810
	rst 38h			;e811
	rst 38h			;e812
	rst 38h			;e813
	rst 38h			;e814
	rst 38h			;e815
	rst 38h			;e816
	rst 38h			;e817
	rst 38h			;e818
	rst 38h			;e819
	rst 38h			;e81a
	rst 38h			;e81b
	rst 38h			;e81c
	rst 38h			;e81d
	rst 38h			;e81e
	rst 38h			;e81f
	rst 38h			;e820
	rst 38h			;e821
	rst 38h			;e822
	rst 38h			;e823
	rst 38h			;e824
	rst 38h			;e825
	rst 38h			;e826
	rst 38h			;e827
	rst 38h			;e828
	rst 38h			;e829
	rst 38h			;e82a
	rst 38h			;e82b
	rst 38h			;e82c
	rst 38h			;e82d
	rst 38h			;e82e
	rst 38h			;e82f
	rst 38h			;e830
	rst 38h			;e831
	rst 38h			;e832
	rst 38h			;e833
	rst 38h			;e834
	rst 38h			;e835
	rst 38h			;e836
	rst 38h			;e837
	rst 38h			;e838
	rst 38h			;e839
	rst 38h			;e83a
	rst 38h			;e83b
	rst 38h			;e83c
	rst 38h			;e83d
	rst 38h			;e83e
	rst 38h			;e83f
	rst 38h			;e840
	rst 38h			;e841
	rst 38h			;e842
	rst 38h			;e843
	rst 38h			;e844
	rst 38h			;e845
	rst 38h			;e846
	rst 38h			;e847
	rst 38h			;e848
	rst 38h			;e849
	rst 38h			;e84a
	rst 38h			;e84b
	rst 38h			;e84c
	rst 38h			;e84d
	rst 38h			;e84e
	rst 38h			;e84f
	rst 38h			;e850
	rst 38h			;e851
	rst 38h			;e852
	rst 38h			;e853
	rst 38h			;e854
	rst 38h			;e855
	rst 38h			;e856
	rst 38h			;e857
	rst 38h			;e858
	rst 38h			;e859
	rst 38h			;e85a
	rst 38h			;e85b
	rst 38h			;e85c
	rst 38h			;e85d
	rst 38h			;e85e
	rst 38h			;e85f
	rst 38h			;e860
	rst 38h			;e861
	rst 38h			;e862
	rst 38h			;e863
	rst 38h			;e864
	rst 38h			;e865
	rst 38h			;e866
	rst 38h			;e867
	rst 38h			;e868
	rst 38h			;e869
	rst 38h			;e86a
	rst 38h			;e86b
	rst 38h			;e86c
	rst 38h			;e86d
	rst 38h			;e86e
	rst 38h			;e86f
	rst 38h			;e870
	rst 38h			;e871
	rst 38h			;e872
	rst 38h			;e873
	rst 38h			;e874
	rst 38h			;e875
	rst 38h			;e876
	rst 38h			;e877
	rst 38h			;e878
	rst 38h			;e879
	rst 38h			;e87a
	rst 38h			;e87b
	rst 38h			;e87c
	rst 38h			;e87d
	rst 38h			;e87e
	rst 38h			;e87f
	rst 38h			;e880
	rst 38h			;e881
	rst 38h			;e882
	rst 38h			;e883
	rst 38h			;e884
	rst 38h			;e885
	rst 38h			;e886
	rst 38h			;e887
	rst 38h			;e888
	rst 38h			;e889
	rst 38h			;e88a
	rst 38h			;e88b
	rst 38h			;e88c
	rst 38h			;e88d
	rst 38h			;e88e
	rst 38h			;e88f
	rst 38h			;e890
	rst 38h			;e891
	rst 38h			;e892
	rst 38h			;e893
	rst 38h			;e894
	rst 38h			;e895
	rst 38h			;e896
	rst 38h			;e897
	rst 38h			;e898
	rst 38h			;e899
	rst 38h			;e89a
	rst 38h			;e89b
	rst 38h			;e89c
	rst 38h			;e89d
	rst 38h			;e89e
le89fh:
	rst 38h			;e89f
	rst 38h			;e8a0
	rst 38h			;e8a1
	rst 38h			;e8a2
	rst 38h			;e8a3
	rst 38h			;e8a4
	rst 38h			;e8a5
	rst 38h			;e8a6
	rst 38h			;e8a7
	rst 38h			;e8a8
	rst 38h			;e8a9
	rst 38h			;e8aa
	rst 38h			;e8ab
	rst 38h			;e8ac
	rst 38h			;e8ad
	rst 38h			;e8ae
	rst 38h			;e8af
	rst 38h			;e8b0
	rst 38h			;e8b1
	rst 38h			;e8b2
	rst 38h			;e8b3
	rst 38h			;e8b4
	rst 38h			;e8b5
	rst 38h			;e8b6
	rst 38h			;e8b7
	rst 38h			;e8b8
	rst 38h			;e8b9
	rst 38h			;e8ba
	rst 38h			;e8bb
	rst 38h			;e8bc
	rst 38h			;e8bd
	rst 38h			;e8be
	rst 38h			;e8bf
	rst 38h			;e8c0
	rst 38h			;e8c1
	rst 38h			;e8c2
	rst 38h			;e8c3
	rst 38h			;e8c4
	rst 38h			;e8c5
	rst 38h			;e8c6
	rst 38h			;e8c7
	rst 38h			;e8c8
	rst 38h			;e8c9
	rst 38h			;e8ca
	rst 38h			;e8cb
	rst 38h			;e8cc
	rst 38h			;e8cd
	rst 38h			;e8ce
	rst 38h			;e8cf
	rst 38h			;e8d0
	rst 38h			;e8d1
	rst 38h			;e8d2
	rst 38h			;e8d3
	rst 38h			;e8d4
	rst 38h			;e8d5
	rst 38h			;e8d6
	rst 38h			;e8d7
	rst 38h			;e8d8
	rst 38h			;e8d9
	rst 38h			;e8da
	rst 38h			;e8db
	rst 38h			;e8dc
	rst 38h			;e8dd
	rst 38h			;e8de
	rst 38h			;e8df
	rst 38h			;e8e0
	rst 38h			;e8e1
	rst 38h			;e8e2
	rst 38h			;e8e3
	rst 38h			;e8e4
	rst 38h			;e8e5
	rst 38h			;e8e6
	rst 38h			;e8e7
	rst 38h			;e8e8
	rst 38h			;e8e9
	rst 38h			;e8ea
	rst 38h			;e8eb
	rst 38h			;e8ec
	rst 38h			;e8ed
	rst 38h			;e8ee
	rst 38h			;e8ef
	rst 38h			;e8f0
	rst 38h			;e8f1
	rst 38h			;e8f2
	rst 38h			;e8f3
	rst 38h			;e8f4
	rst 38h			;e8f5
	rst 38h			;e8f6
	rst 38h			;e8f7
	rst 38h			;e8f8
	rst 38h			;e8f9
	rst 38h			;e8fa
	rst 38h			;e8fb
	rst 38h			;e8fc
	rst 38h			;e8fd
	rst 38h			;e8fe
	rst 38h			;e8ff
	rst 38h			;e900
	rst 38h			;e901
	rst 38h			;e902
	rst 38h			;e903
	rst 38h			;e904
	rst 38h			;e905
	rst 38h			;e906
	rst 38h			;e907
	rst 38h			;e908
	rst 38h			;e909
	rst 38h			;e90a
	rst 38h			;e90b
	rst 38h			;e90c
	rst 38h			;e90d
	rst 38h			;e90e
	rst 38h			;e90f
	rst 38h			;e910
	rst 38h			;e911
	rst 38h			;e912
	rst 38h			;e913
	rst 38h			;e914
	rst 38h			;e915
	rst 38h			;e916
	rst 38h			;e917
	rst 38h			;e918
	rst 38h			;e919
	rst 38h			;e91a
	rst 38h			;e91b
	rst 38h			;e91c
	rst 38h			;e91d
	rst 38h			;e91e
	rst 38h			;e91f
	rst 38h			;e920
	rst 38h			;e921
	rst 38h			;e922
	rst 38h			;e923
	rst 38h			;e924
	rst 38h			;e925
	rst 38h			;e926
	rst 38h			;e927
	rst 38h			;e928
	rst 38h			;e929
	rst 38h			;e92a
	rst 38h			;e92b
	rst 38h			;e92c
	rst 38h			;e92d
	rst 38h			;e92e
	rst 38h			;e92f
	rst 38h			;e930
	rst 38h			;e931
	rst 38h			;e932
	rst 38h			;e933
	rst 38h			;e934
	rst 38h			;e935
	rst 38h			;e936
	rst 38h			;e937
	rst 38h			;e938
	rst 38h			;e939
	rst 38h			;e93a
	rst 38h			;e93b
	rst 38h			;e93c
	rst 38h			;e93d
	rst 38h			;e93e
	rst 38h			;e93f
	rst 38h			;e940
	rst 38h			;e941
	rst 38h			;e942
	rst 38h			;e943
	rst 38h			;e944
	rst 38h			;e945
	rst 38h			;e946
	rst 38h			;e947
	rst 38h			;e948
	rst 38h			;e949
	rst 38h			;e94a
	rst 38h			;e94b
	rst 38h			;e94c
	rst 38h			;e94d
	rst 38h			;e94e
	rst 38h			;e94f
	rst 38h			;e950
	rst 38h			;e951
	rst 38h			;e952
	rst 38h			;e953
	rst 38h			;e954
	rst 38h			;e955
	rst 38h			;e956
	rst 38h			;e957
	rst 38h			;e958
	rst 38h			;e959
	rst 38h			;e95a
	rst 38h			;e95b
	rst 38h			;e95c
	rst 38h			;e95d
	rst 38h			;e95e
	rst 38h			;e95f
	rst 38h			;e960
	rst 38h			;e961
	rst 38h			;e962
	rst 38h			;e963
	rst 38h			;e964
	rst 38h			;e965
	rst 38h			;e966
	rst 38h			;e967
	rst 38h			;e968
	rst 38h			;e969
	rst 38h			;e96a
	rst 38h			;e96b
	rst 38h			;e96c
	rst 38h			;e96d
	rst 38h			;e96e
	rst 38h			;e96f
	rst 38h			;e970
	rst 38h			;e971
	rst 38h			;e972
	rst 38h			;e973
	rst 38h			;e974
	rst 38h			;e975
	rst 38h			;e976
	rst 38h			;e977
	rst 38h			;e978
	rst 38h			;e979
	rst 38h			;e97a
	rst 38h			;e97b
	rst 38h			;e97c
	rst 38h			;e97d
	rst 38h			;e97e
	rst 38h			;e97f
	rst 38h			;e980
	rst 38h			;e981
	rst 38h			;e982
	rst 38h			;e983
	rst 38h			;e984
	rst 38h			;e985
	rst 38h			;e986
	rst 38h			;e987
	rst 38h			;e988
	rst 38h			;e989
	rst 38h			;e98a
	rst 38h			;e98b
	rst 38h			;e98c
	rst 38h			;e98d
	rst 38h			;e98e
	rst 38h			;e98f
	rst 38h			;e990
	rst 38h			;e991
	rst 38h			;e992
	rst 38h			;e993
	rst 38h			;e994
	rst 38h			;e995
	rst 38h			;e996
	rst 38h			;e997
	rst 38h			;e998
	rst 38h			;e999
	rst 38h			;e99a
	rst 38h			;e99b
	rst 38h			;e99c
	rst 38h			;e99d
	rst 38h			;e99e
	rst 38h			;e99f
	rst 38h			;e9a0
	rst 38h			;e9a1
	rst 38h			;e9a2
	rst 38h			;e9a3
	rst 38h			;e9a4
	rst 38h			;e9a5
	rst 38h			;e9a6
	rst 38h			;e9a7
	rst 38h			;e9a8
	rst 38h			;e9a9
	rst 38h			;e9aa
	rst 38h			;e9ab
	rst 38h			;e9ac
	rst 38h			;e9ad
	rst 38h			;e9ae
	rst 38h			;e9af
	rst 38h			;e9b0
	rst 38h			;e9b1
	rst 38h			;e9b2
	rst 38h			;e9b3
	rst 38h			;e9b4
	rst 38h			;e9b5
	rst 38h			;e9b6
	rst 38h			;e9b7
	rst 38h			;e9b8
	rst 38h			;e9b9
	rst 38h			;e9ba
	rst 38h			;e9bb
	rst 38h			;e9bc
	rst 38h			;e9bd
	rst 38h			;e9be
	rst 38h			;e9bf
	rst 38h			;e9c0
	rst 38h			;e9c1
	rst 38h			;e9c2
	rst 38h			;e9c3
	rst 38h			;e9c4
	rst 38h			;e9c5
	rst 38h			;e9c6
	rst 38h			;e9c7
	rst 38h			;e9c8
	rst 38h			;e9c9
	rst 38h			;e9ca
	rst 38h			;e9cb
	rst 38h			;e9cc
	rst 38h			;e9cd
	rst 38h			;e9ce
	rst 38h			;e9cf
	rst 38h			;e9d0
	rst 38h			;e9d1
	rst 38h			;e9d2
	rst 38h			;e9d3
	rst 38h			;e9d4
	rst 38h			;e9d5
	rst 38h			;e9d6
	rst 38h			;e9d7
	rst 38h			;e9d8
	rst 38h			;e9d9
	rst 38h			;e9da
	rst 38h			;e9db
	rst 38h			;e9dc
	rst 38h			;e9dd
	rst 38h			;e9de
	rst 38h			;e9df
	rst 38h			;e9e0
	rst 38h			;e9e1
	rst 38h			;e9e2
	rst 38h			;e9e3
	rst 38h			;e9e4
	rst 38h			;e9e5
	rst 38h			;e9e6
	rst 38h			;e9e7
	rst 38h			;e9e8
	rst 38h			;e9e9
	rst 38h			;e9ea
	rst 38h			;e9eb
	rst 38h			;e9ec
	rst 38h			;e9ed
	rst 38h			;e9ee
	rst 38h			;e9ef
	rst 38h			;e9f0
	rst 38h			;e9f1
	rst 38h			;e9f2
	rst 38h			;e9f3
	rst 38h			;e9f4
	rst 38h			;e9f5
	rst 38h			;e9f6
	rst 38h			;e9f7
	rst 38h			;e9f8
	rst 38h			;e9f9
	rst 38h			;e9fa
	rst 38h			;e9fb
	rst 38h			;e9fc
	rst 38h			;e9fd
	rst 38h			;e9fe
	rst 38h			;e9ff
	rst 38h			;ea00
	rst 38h			;ea01
	rst 38h			;ea02
	rst 38h			;ea03
	rst 38h			;ea04
	rst 38h			;ea05
	rst 38h			;ea06
	rst 38h			;ea07
	rst 38h			;ea08
	rst 38h			;ea09
	rst 38h			;ea0a
	rst 38h			;ea0b
	rst 38h			;ea0c
	rst 38h			;ea0d
	rst 38h			;ea0e
	rst 38h			;ea0f
	rst 38h			;ea10
	rst 38h			;ea11
	rst 38h			;ea12
	rst 38h			;ea13
	rst 38h			;ea14
	rst 38h			;ea15
	rst 38h			;ea16
	rst 38h			;ea17
	rst 38h			;ea18
	rst 38h			;ea19
	rst 38h			;ea1a
	rst 38h			;ea1b
	rst 38h			;ea1c
	rst 38h			;ea1d
	rst 38h			;ea1e
	rst 38h			;ea1f
	rst 38h			;ea20
	rst 38h			;ea21
	rst 38h			;ea22
	rst 38h			;ea23
	rst 38h			;ea24
	rst 38h			;ea25
	rst 38h			;ea26
	rst 38h			;ea27
	rst 38h			;ea28
	rst 38h			;ea29
	rst 38h			;ea2a
	rst 38h			;ea2b
	rst 38h			;ea2c
	rst 38h			;ea2d
	rst 38h			;ea2e
	rst 38h			;ea2f
	rst 38h			;ea30
	rst 38h			;ea31
	rst 38h			;ea32
	rst 38h			;ea33
	rst 38h			;ea34
	rst 38h			;ea35
	rst 38h			;ea36
	rst 38h			;ea37
	rst 38h			;ea38
	rst 38h			;ea39
	rst 38h			;ea3a
	rst 38h			;ea3b
	rst 38h			;ea3c
	rst 38h			;ea3d
	rst 38h			;ea3e
	rst 38h			;ea3f
	rst 38h			;ea40
	rst 38h			;ea41
	rst 38h			;ea42
	rst 38h			;ea43
	rst 38h			;ea44
	rst 38h			;ea45
	rst 38h			;ea46
	rst 38h			;ea47
	rst 38h			;ea48
	rst 38h			;ea49
	rst 38h			;ea4a
	rst 38h			;ea4b
	rst 38h			;ea4c
	rst 38h			;ea4d
	rst 38h			;ea4e
	rst 38h			;ea4f
	rst 38h			;ea50
	rst 38h			;ea51
	rst 38h			;ea52
	rst 38h			;ea53
	rst 38h			;ea54
	rst 38h			;ea55
	rst 38h			;ea56
	rst 38h			;ea57
	rst 38h			;ea58
	rst 38h			;ea59
	rst 38h			;ea5a
	rst 38h			;ea5b
	rst 38h			;ea5c
	rst 38h			;ea5d
	rst 38h			;ea5e
	rst 38h			;ea5f
	rst 38h			;ea60
	rst 38h			;ea61
	rst 38h			;ea62
	rst 38h			;ea63
	rst 38h			;ea64
	rst 38h			;ea65
	rst 38h			;ea66
	rst 38h			;ea67
	rst 38h			;ea68
	rst 38h			;ea69
	rst 38h			;ea6a
	rst 38h			;ea6b
	rst 38h			;ea6c
	rst 38h			;ea6d
	rst 38h			;ea6e
	rst 38h			;ea6f
	rst 38h			;ea70
	rst 38h			;ea71
	rst 38h			;ea72
	rst 38h			;ea73
	rst 38h			;ea74
	rst 38h			;ea75
	rst 38h			;ea76
	rst 38h			;ea77
	rst 38h			;ea78
	rst 38h			;ea79
	rst 38h			;ea7a
	rst 38h			;ea7b
	rst 38h			;ea7c
	rst 38h			;ea7d
	rst 38h			;ea7e
	rst 38h			;ea7f
	rst 38h			;ea80
	rst 38h			;ea81
	rst 38h			;ea82
	rst 38h			;ea83
	rst 38h			;ea84
	rst 38h			;ea85
	rst 38h			;ea86
	rst 38h			;ea87
	rst 38h			;ea88
	rst 38h			;ea89
	rst 38h			;ea8a
	rst 38h			;ea8b
	rst 38h			;ea8c
	rst 38h			;ea8d
	rst 38h			;ea8e
	rst 38h			;ea8f
	rst 38h			;ea90
	rst 38h			;ea91
	rst 38h			;ea92
	rst 38h			;ea93
	rst 38h			;ea94
	rst 38h			;ea95
	rst 38h			;ea96
	rst 38h			;ea97
	rst 38h			;ea98
	rst 38h			;ea99
	rst 38h			;ea9a
	rst 38h			;ea9b
	rst 38h			;ea9c
	rst 38h			;ea9d
	rst 38h			;ea9e
	rst 38h			;ea9f
	rst 38h			;eaa0
	rst 38h			;eaa1
	rst 38h			;eaa2
	rst 38h			;eaa3
	rst 38h			;eaa4
	rst 38h			;eaa5
	rst 38h			;eaa6
	rst 38h			;eaa7
	rst 38h			;eaa8
	rst 38h			;eaa9
	rst 38h			;eaaa
	rst 38h			;eaab
	rst 38h			;eaac
	rst 38h			;eaad
	rst 38h			;eaae
	rst 38h			;eaaf
	rst 38h			;eab0
	rst 38h			;eab1
	rst 38h			;eab2
	rst 38h			;eab3
	rst 38h			;eab4
	rst 38h			;eab5
	rst 38h			;eab6
	rst 38h			;eab7
	rst 38h			;eab8
	rst 38h			;eab9
	rst 38h			;eaba
	rst 38h			;eabb
	rst 38h			;eabc
	rst 38h			;eabd
	rst 38h			;eabe
	rst 38h			;eabf
	rst 38h			;eac0
	rst 38h			;eac1
	rst 38h			;eac2
	rst 38h			;eac3
	rst 38h			;eac4
	rst 38h			;eac5
	rst 38h			;eac6
	rst 38h			;eac7
	rst 38h			;eac8
	rst 38h			;eac9
	rst 38h			;eaca
	rst 38h			;eacb
	rst 38h			;eacc
	rst 38h			;eacd
	rst 38h			;eace
	rst 38h			;eacf
	rst 38h			;ead0
	rst 38h			;ead1
	rst 38h			;ead2
	rst 38h			;ead3
	rst 38h			;ead4
	rst 38h			;ead5
	rst 38h			;ead6
	rst 38h			;ead7
	rst 38h			;ead8
	rst 38h			;ead9
	rst 38h			;eada
	rst 38h			;eadb
	rst 38h			;eadc
	rst 38h			;eadd
	rst 38h			;eade
	rst 38h			;eadf
	rst 38h			;eae0
	rst 38h			;eae1
	rst 38h			;eae2
	rst 38h			;eae3
	rst 38h			;eae4
	rst 38h			;eae5
	rst 38h			;eae6
	rst 38h			;eae7
	rst 38h			;eae8
	rst 38h			;eae9
	rst 38h			;eaea
	rst 38h			;eaeb
	rst 38h			;eaec
	rst 38h			;eaed
	rst 38h			;eaee
	rst 38h			;eaef
	rst 38h			;eaf0
	rst 38h			;eaf1
	rst 38h			;eaf2
	rst 38h			;eaf3
	rst 38h			;eaf4
	rst 38h			;eaf5
	rst 38h			;eaf6
	rst 38h			;eaf7
	rst 38h			;eaf8
	rst 38h			;eaf9
	rst 38h			;eafa
	rst 38h			;eafb
	rst 38h			;eafc
	rst 38h			;eafd
	rst 38h			;eafe
	rst 38h			;eaff
	rst 38h			;eb00
	rst 38h			;eb01
	rst 38h			;eb02
	rst 38h			;eb03
	rst 38h			;eb04
	rst 38h			;eb05
	rst 38h			;eb06
	rst 38h			;eb07
	rst 38h			;eb08
	rst 38h			;eb09
	rst 38h			;eb0a
	rst 38h			;eb0b
	rst 38h			;eb0c
	rst 38h			;eb0d
	rst 38h			;eb0e
	rst 38h			;eb0f
	rst 38h			;eb10
	rst 38h			;eb11
	rst 38h			;eb12
	rst 38h			;eb13
	rst 38h			;eb14
	rst 38h			;eb15
	rst 38h			;eb16
	rst 38h			;eb17
	rst 38h			;eb18
	rst 38h			;eb19
	rst 38h			;eb1a
	rst 38h			;eb1b
	rst 38h			;eb1c
	rst 38h			;eb1d
	rst 38h			;eb1e
	rst 38h			;eb1f
	rst 38h			;eb20
	rst 38h			;eb21
	rst 38h			;eb22
	rst 38h			;eb23
	rst 38h			;eb24
	rst 38h			;eb25
	rst 38h			;eb26
	rst 38h			;eb27
	rst 38h			;eb28
	rst 38h			;eb29
	rst 38h			;eb2a
	rst 38h			;eb2b
	rst 38h			;eb2c
	rst 38h			;eb2d
	rst 38h			;eb2e
	rst 38h			;eb2f
	rst 38h			;eb30
	rst 38h			;eb31
	rst 38h			;eb32
	rst 38h			;eb33
	rst 38h			;eb34
	rst 38h			;eb35
	rst 38h			;eb36
	rst 38h			;eb37
	rst 38h			;eb38
	rst 38h			;eb39
	rst 38h			;eb3a
	rst 38h			;eb3b
	rst 38h			;eb3c
	rst 38h			;eb3d
	rst 38h			;eb3e
	rst 38h			;eb3f
	rst 38h			;eb40
	rst 38h			;eb41
	rst 38h			;eb42
	rst 38h			;eb43
	rst 38h			;eb44
	rst 38h			;eb45
	rst 38h			;eb46
	rst 38h			;eb47
	rst 38h			;eb48
	rst 38h			;eb49
	rst 38h			;eb4a
	rst 38h			;eb4b
	rst 38h			;eb4c
	rst 38h			;eb4d
	rst 38h			;eb4e
	rst 38h			;eb4f
	rst 38h			;eb50
	rst 38h			;eb51
	rst 38h			;eb52
	rst 38h			;eb53
	rst 38h			;eb54
	rst 38h			;eb55
	rst 38h			;eb56
	rst 38h			;eb57
	rst 38h			;eb58
	rst 38h			;eb59
	rst 38h			;eb5a
	rst 38h			;eb5b
	rst 38h			;eb5c
	rst 38h			;eb5d
	rst 38h			;eb5e
	rst 38h			;eb5f
	rst 38h			;eb60
	rst 38h			;eb61
	rst 38h			;eb62
	rst 38h			;eb63
	rst 38h			;eb64
	rst 38h			;eb65
	rst 38h			;eb66
	rst 38h			;eb67
	rst 38h			;eb68
	rst 38h			;eb69
	rst 38h			;eb6a
	rst 38h			;eb6b
	rst 38h			;eb6c
	rst 38h			;eb6d
	rst 38h			;eb6e
	rst 38h			;eb6f
	rst 38h			;eb70
	rst 38h			;eb71
	rst 38h			;eb72
	rst 38h			;eb73
	rst 38h			;eb74
	rst 38h			;eb75
	rst 38h			;eb76
	rst 38h			;eb77
	rst 38h			;eb78
	rst 38h			;eb79
	rst 38h			;eb7a
	rst 38h			;eb7b
	rst 38h			;eb7c
	rst 38h			;eb7d
	rst 38h			;eb7e
	rst 38h			;eb7f
	rst 38h			;eb80
	rst 38h			;eb81
	rst 38h			;eb82
	rst 38h			;eb83
	rst 38h			;eb84
	rst 38h			;eb85
	rst 38h			;eb86
	rst 38h			;eb87
	rst 38h			;eb88
	rst 38h			;eb89
	rst 38h			;eb8a
	rst 38h			;eb8b
	rst 38h			;eb8c
	rst 38h			;eb8d
	rst 38h			;eb8e
	rst 38h			;eb8f
	rst 38h			;eb90
	rst 38h			;eb91
	rst 38h			;eb92
	rst 38h			;eb93
	rst 38h			;eb94
	rst 38h			;eb95
	rst 38h			;eb96
	rst 38h			;eb97
	rst 38h			;eb98
	rst 38h			;eb99
	rst 38h			;eb9a
	rst 38h			;eb9b
	rst 38h			;eb9c
	rst 38h			;eb9d
	rst 38h			;eb9e
	rst 38h			;eb9f
	rst 38h			;eba0
	rst 38h			;eba1
	rst 38h			;eba2
	rst 38h			;eba3
	rst 38h			;eba4
	rst 38h			;eba5
	rst 38h			;eba6
	rst 38h			;eba7
	rst 38h			;eba8
	rst 38h			;eba9
	rst 38h			;ebaa
	rst 38h			;ebab
	rst 38h			;ebac
	rst 38h			;ebad
	rst 38h			;ebae
	rst 38h			;ebaf
	rst 38h			;ebb0
	rst 38h			;ebb1
	rst 38h			;ebb2
	rst 38h			;ebb3
	rst 38h			;ebb4
	rst 38h			;ebb5
	rst 38h			;ebb6
	rst 38h			;ebb7
	rst 38h			;ebb8
	rst 38h			;ebb9
	rst 38h			;ebba
	rst 38h			;ebbb
	rst 38h			;ebbc
	rst 38h			;ebbd
	rst 38h			;ebbe
	rst 38h			;ebbf
	rst 38h			;ebc0
	rst 38h			;ebc1
	rst 38h			;ebc2
	rst 38h			;ebc3
	rst 38h			;ebc4
	rst 38h			;ebc5
	rst 38h			;ebc6
	rst 38h			;ebc7
	rst 38h			;ebc8
	rst 38h			;ebc9
	rst 38h			;ebca
	rst 38h			;ebcb
	rst 38h			;ebcc
	rst 38h			;ebcd
	rst 38h			;ebce
	rst 38h			;ebcf
	rst 38h			;ebd0
	rst 38h			;ebd1
	rst 38h			;ebd2
	rst 38h			;ebd3
	rst 38h			;ebd4
	rst 38h			;ebd5
	rst 38h			;ebd6
	rst 38h			;ebd7
	rst 38h			;ebd8
	rst 38h			;ebd9
	rst 38h			;ebda
	rst 38h			;ebdb
	rst 38h			;ebdc
	rst 38h			;ebdd
	rst 38h			;ebde
	rst 38h			;ebdf
	rst 38h			;ebe0
	rst 38h			;ebe1
	rst 38h			;ebe2
	rst 38h			;ebe3
	rst 38h			;ebe4
	rst 38h			;ebe5
	rst 38h			;ebe6
	rst 38h			;ebe7
	rst 38h			;ebe8
	rst 38h			;ebe9
	rst 38h			;ebea
	rst 38h			;ebeb
	rst 38h			;ebec
	rst 38h			;ebed
	rst 38h			;ebee
	rst 38h			;ebef
	rst 38h			;ebf0
	rst 38h			;ebf1
	rst 38h			;ebf2
	rst 38h			;ebf3
	rst 38h			;ebf4
	rst 38h			;ebf5
	rst 38h			;ebf6
	rst 38h			;ebf7
	rst 38h			;ebf8
	rst 38h			;ebf9
	rst 38h			;ebfa
	rst 38h			;ebfb
	rst 38h			;ebfc
	rst 38h			;ebfd
	rst 38h			;ebfe
	rst 38h			;ebff
	rst 38h			;ec00
	rst 38h			;ec01
	rst 38h			;ec02
	rst 38h			;ec03
	rst 38h			;ec04
	rst 38h			;ec05
	rst 38h			;ec06
	rst 38h			;ec07
	rst 38h			;ec08
	rst 38h			;ec09
	rst 38h			;ec0a
	rst 38h			;ec0b
	rst 38h			;ec0c
	rst 38h			;ec0d
	rst 38h			;ec0e
	rst 38h			;ec0f
	rst 38h			;ec10
	rst 38h			;ec11
	rst 38h			;ec12
	rst 38h			;ec13
	rst 38h			;ec14
	rst 38h			;ec15
	rst 38h			;ec16
	rst 38h			;ec17
	rst 38h			;ec18
	rst 38h			;ec19
	rst 38h			;ec1a
	rst 38h			;ec1b
	rst 38h			;ec1c
	rst 38h			;ec1d
	rst 38h			;ec1e
	rst 38h			;ec1f
	rst 38h			;ec20
	rst 38h			;ec21
	rst 38h			;ec22
	rst 38h			;ec23
	rst 38h			;ec24
	rst 38h			;ec25
	rst 38h			;ec26
	rst 38h			;ec27
	rst 38h			;ec28
	rst 38h			;ec29
	rst 38h			;ec2a
	rst 38h			;ec2b
	rst 38h			;ec2c
	rst 38h			;ec2d
	rst 38h			;ec2e
	rst 38h			;ec2f
	rst 38h			;ec30
	rst 38h			;ec31
	rst 38h			;ec32
	rst 38h			;ec33
	rst 38h			;ec34
	rst 38h			;ec35
	rst 38h			;ec36
	rst 38h			;ec37
	rst 38h			;ec38
	rst 38h			;ec39
	rst 38h			;ec3a
	rst 38h			;ec3b
	rst 38h			;ec3c
	rst 38h			;ec3d
	rst 38h			;ec3e
	rst 38h			;ec3f
	rst 38h			;ec40
	rst 38h			;ec41
	rst 38h			;ec42
	rst 38h			;ec43
	rst 38h			;ec44
	rst 38h			;ec45
	rst 38h			;ec46
	rst 38h			;ec47
	rst 38h			;ec48
	rst 38h			;ec49
	rst 38h			;ec4a
	rst 38h			;ec4b
	rst 38h			;ec4c
	rst 38h			;ec4d
	rst 38h			;ec4e
	rst 38h			;ec4f
	rst 38h			;ec50
	rst 38h			;ec51
	rst 38h			;ec52
	rst 38h			;ec53
	rst 38h			;ec54
	rst 38h			;ec55
	rst 38h			;ec56
	rst 38h			;ec57
	rst 38h			;ec58
	rst 38h			;ec59
	rst 38h			;ec5a
	rst 38h			;ec5b
	rst 38h			;ec5c
	rst 38h			;ec5d
	rst 38h			;ec5e
	rst 38h			;ec5f
	rst 38h			;ec60
	rst 38h			;ec61
	rst 38h			;ec62
	rst 38h			;ec63
	rst 38h			;ec64
	rst 38h			;ec65
	rst 38h			;ec66
	rst 38h			;ec67
	rst 38h			;ec68
	rst 38h			;ec69
	rst 38h			;ec6a
	rst 38h			;ec6b
	rst 38h			;ec6c
	rst 38h			;ec6d
	rst 38h			;ec6e
	rst 38h			;ec6f
	rst 38h			;ec70
	rst 38h			;ec71
	rst 38h			;ec72
	rst 38h			;ec73
	rst 38h			;ec74
	rst 38h			;ec75
	rst 38h			;ec76
	rst 38h			;ec77
	rst 38h			;ec78
	rst 38h			;ec79
	rst 38h			;ec7a
	rst 38h			;ec7b
	rst 38h			;ec7c
	rst 38h			;ec7d
	rst 38h			;ec7e
	rst 38h			;ec7f
	rst 38h			;ec80
	rst 38h			;ec81
	rst 38h			;ec82
	rst 38h			;ec83
	rst 38h			;ec84
	rst 38h			;ec85
	rst 38h			;ec86
	rst 38h			;ec87
	rst 38h			;ec88
	rst 38h			;ec89
	rst 38h			;ec8a
	rst 38h			;ec8b
	rst 38h			;ec8c
	rst 38h			;ec8d
	rst 38h			;ec8e
	rst 38h			;ec8f
	rst 38h			;ec90
	rst 38h			;ec91
	rst 38h			;ec92
	rst 38h			;ec93
	rst 38h			;ec94
	rst 38h			;ec95
	rst 38h			;ec96
	rst 38h			;ec97
	rst 38h			;ec98
	rst 38h			;ec99
	rst 38h			;ec9a
	rst 38h			;ec9b
	rst 38h			;ec9c
	rst 38h			;ec9d
	rst 38h			;ec9e
	rst 38h			;ec9f
	rst 38h			;eca0
	rst 38h			;eca1
	rst 38h			;eca2
	rst 38h			;eca3
	rst 38h			;eca4
	rst 38h			;eca5
	rst 38h			;eca6
	rst 38h			;eca7
	rst 38h			;eca8
	rst 38h			;eca9
	rst 38h			;ecaa
	rst 38h			;ecab
	rst 38h			;ecac
	rst 38h			;ecad
	rst 38h			;ecae
	rst 38h			;ecaf
	rst 38h			;ecb0
	rst 38h			;ecb1
	rst 38h			;ecb2
	rst 38h			;ecb3
	rst 38h			;ecb4
	rst 38h			;ecb5
	rst 38h			;ecb6
	rst 38h			;ecb7
	rst 38h			;ecb8
	rst 38h			;ecb9
	rst 38h			;ecba
	rst 38h			;ecbb
	rst 38h			;ecbc
	rst 38h			;ecbd
	rst 38h			;ecbe
	rst 38h			;ecbf
	rst 38h			;ecc0
	rst 38h			;ecc1
	rst 38h			;ecc2
	rst 38h			;ecc3
	rst 38h			;ecc4
	rst 38h			;ecc5
	rst 38h			;ecc6
	rst 38h			;ecc7
	rst 38h			;ecc8
	rst 38h			;ecc9
	rst 38h			;ecca
	rst 38h			;eccb
	rst 38h			;eccc
	rst 38h			;eccd
	rst 38h			;ecce
	rst 38h			;eccf
	rst 38h			;ecd0
	rst 38h			;ecd1
	rst 38h			;ecd2
	rst 38h			;ecd3
	rst 38h			;ecd4
	rst 38h			;ecd5
	rst 38h			;ecd6
	rst 38h			;ecd7
	rst 38h			;ecd8
	rst 38h			;ecd9
	rst 38h			;ecda
	rst 38h			;ecdb
	rst 38h			;ecdc
	rst 38h			;ecdd
	rst 38h			;ecde
	rst 38h			;ecdf
	rst 38h			;ece0
	rst 38h			;ece1
	rst 38h			;ece2
	rst 38h			;ece3
	rst 38h			;ece4
	rst 38h			;ece5
	rst 38h			;ece6
	rst 38h			;ece7
	rst 38h			;ece8
	rst 38h			;ece9
	rst 38h			;ecea
	rst 38h			;eceb
	rst 38h			;ecec
	rst 38h			;eced
	rst 38h			;ecee
	rst 38h			;ecef
	rst 38h			;ecf0
	rst 38h			;ecf1
	rst 38h			;ecf2
	rst 38h			;ecf3
	rst 38h			;ecf4
	rst 38h			;ecf5
	rst 38h			;ecf6
	rst 38h			;ecf7
	rst 38h			;ecf8
	rst 38h			;ecf9
	rst 38h			;ecfa
	rst 38h			;ecfb
	rst 38h			;ecfc
	rst 38h			;ecfd
	rst 38h			;ecfe
	rst 38h			;ecff
	rst 38h			;ed00
	rst 38h			;ed01
	rst 38h			;ed02
	rst 38h			;ed03
	rst 38h			;ed04
	rst 38h			;ed05
	rst 38h			;ed06
	rst 38h			;ed07
	rst 38h			;ed08
	rst 38h			;ed09
	rst 38h			;ed0a
	rst 38h			;ed0b
	rst 38h			;ed0c
	rst 38h			;ed0d
	rst 38h			;ed0e
	rst 38h			;ed0f
	rst 38h			;ed10
	rst 38h			;ed11
	rst 38h			;ed12
	rst 38h			;ed13
	rst 38h			;ed14
	rst 38h			;ed15
	rst 38h			;ed16
	rst 38h			;ed17
	rst 38h			;ed18
	rst 38h			;ed19
	rst 38h			;ed1a
	rst 38h			;ed1b
	rst 38h			;ed1c
	rst 38h			;ed1d
	rst 38h			;ed1e
	rst 38h			;ed1f
	rst 38h			;ed20
	rst 38h			;ed21
	rst 38h			;ed22
	rst 38h			;ed23
	rst 38h			;ed24
	rst 38h			;ed25
	rst 38h			;ed26
	rst 38h			;ed27
	rst 38h			;ed28
	rst 38h			;ed29
	rst 38h			;ed2a
	rst 38h			;ed2b
	rst 38h			;ed2c
	rst 38h			;ed2d
	rst 38h			;ed2e
	rst 38h			;ed2f
	rst 38h			;ed30
	rst 38h			;ed31
	rst 38h			;ed32
	rst 38h			;ed33
	rst 38h			;ed34
	rst 38h			;ed35
	rst 38h			;ed36
	rst 38h			;ed37
	rst 38h			;ed38
	rst 38h			;ed39
	rst 38h			;ed3a
	rst 38h			;ed3b
	rst 38h			;ed3c
	rst 38h			;ed3d
	rst 38h			;ed3e
	rst 38h			;ed3f
	rst 38h			;ed40
	rst 38h			;ed41
	rst 38h			;ed42
	rst 38h			;ed43
	rst 38h			;ed44
	rst 38h			;ed45
	rst 38h			;ed46
	rst 38h			;ed47
	rst 38h			;ed48
	rst 38h			;ed49
	rst 38h			;ed4a
	rst 38h			;ed4b
	rst 38h			;ed4c
	rst 38h			;ed4d
	rst 38h			;ed4e
	rst 38h			;ed4f
	rst 38h			;ed50
	rst 38h			;ed51
	rst 38h			;ed52
	rst 38h			;ed53
	rst 38h			;ed54
	rst 38h			;ed55
	rst 38h			;ed56
	rst 38h			;ed57
	rst 38h			;ed58
	rst 38h			;ed59
	rst 38h			;ed5a
	rst 38h			;ed5b
	rst 38h			;ed5c
	rst 38h			;ed5d
	rst 38h			;ed5e
	rst 38h			;ed5f
	rst 38h			;ed60
	rst 38h			;ed61
	rst 38h			;ed62
	rst 38h			;ed63
	rst 38h			;ed64
	rst 38h			;ed65
	rst 38h			;ed66
	rst 38h			;ed67
	rst 38h			;ed68
	rst 38h			;ed69
	rst 38h			;ed6a
	rst 38h			;ed6b
	rst 38h			;ed6c
	rst 38h			;ed6d
	rst 38h			;ed6e
	rst 38h			;ed6f
	rst 38h			;ed70
	rst 38h			;ed71
	rst 38h			;ed72
	rst 38h			;ed73
	rst 38h			;ed74
	rst 38h			;ed75
	rst 38h			;ed76
	rst 38h			;ed77
	rst 38h			;ed78
	rst 38h			;ed79
	rst 38h			;ed7a
	rst 38h			;ed7b
	rst 38h			;ed7c
	rst 38h			;ed7d
	rst 38h			;ed7e
	rst 38h			;ed7f
	rst 38h			;ed80
	rst 38h			;ed81
	rst 38h			;ed82
	rst 38h			;ed83
	rst 38h			;ed84
	rst 38h			;ed85
	rst 38h			;ed86
	rst 38h			;ed87
	rst 38h			;ed88
	rst 38h			;ed89
	rst 38h			;ed8a
	rst 38h			;ed8b
	rst 38h			;ed8c
	rst 38h			;ed8d
	rst 38h			;ed8e
	rst 38h			;ed8f
	rst 38h			;ed90
	rst 38h			;ed91
	rst 38h			;ed92
	rst 38h			;ed93
	rst 38h			;ed94
	rst 38h			;ed95
	rst 38h			;ed96
	rst 38h			;ed97
	rst 38h			;ed98
	rst 38h			;ed99
	rst 38h			;ed9a
	rst 38h			;ed9b
	rst 38h			;ed9c
	rst 38h			;ed9d
	rst 38h			;ed9e
	rst 38h			;ed9f
	rst 38h			;eda0
	rst 38h			;eda1
	rst 38h			;eda2
	rst 38h			;eda3
	rst 38h			;eda4
	rst 38h			;eda5
	rst 38h			;eda6
	rst 38h			;eda7
	rst 38h			;eda8
	rst 38h			;eda9
	rst 38h			;edaa
	rst 38h			;edab
	rst 38h			;edac
	rst 38h			;edad
	rst 38h			;edae
	rst 38h			;edaf
	rst 38h			;edb0
	rst 38h			;edb1
	rst 38h			;edb2
	rst 38h			;edb3
	rst 38h			;edb4
	rst 38h			;edb5
	rst 38h			;edb6
	rst 38h			;edb7
	rst 38h			;edb8
	rst 38h			;edb9
	rst 38h			;edba
	rst 38h			;edbb
	rst 38h			;edbc
	rst 38h			;edbd
	rst 38h			;edbe
	rst 38h			;edbf
	rst 38h			;edc0
	rst 38h			;edc1
	rst 38h			;edc2
	rst 38h			;edc3
	rst 38h			;edc4
	rst 38h			;edc5
	rst 38h			;edc6
	rst 38h			;edc7
	rst 38h			;edc8
	rst 38h			;edc9
	rst 38h			;edca
	rst 38h			;edcb
	rst 38h			;edcc
	rst 38h			;edcd
	rst 38h			;edce
	rst 38h			;edcf
	rst 38h			;edd0
	rst 38h			;edd1
	rst 38h			;edd2
	rst 38h			;edd3
	rst 38h			;edd4
	rst 38h			;edd5
	rst 38h			;edd6
	rst 38h			;edd7
	rst 38h			;edd8
	rst 38h			;edd9
	rst 38h			;edda
	rst 38h			;eddb
	rst 38h			;eddc
	rst 38h			;eddd
	rst 38h			;edde
	rst 38h			;eddf
	rst 38h			;ede0
	rst 38h			;ede1
	rst 38h			;ede2
	rst 38h			;ede3
	rst 38h			;ede4
	rst 38h			;ede5
	rst 38h			;ede6
	rst 38h			;ede7
	rst 38h			;ede8
	rst 38h			;ede9
	rst 38h			;edea
	rst 38h			;edeb
	rst 38h			;edec
	rst 38h			;eded
	rst 38h			;edee
	rst 38h			;edef
	rst 38h			;edf0
	rst 38h			;edf1
	rst 38h			;edf2
	rst 38h			;edf3
	rst 38h			;edf4
	rst 38h			;edf5
	rst 38h			;edf6
	rst 38h			;edf7
	rst 38h			;edf8
	rst 38h			;edf9
	rst 38h			;edfa
	rst 38h			;edfb
	rst 38h			;edfc
	rst 38h			;edfd
	rst 38h			;edfe
	rst 38h			;edff
	rst 38h			;ee00
	rst 38h			;ee01
	rst 38h			;ee02
	rst 38h			;ee03
	rst 38h			;ee04
	rst 38h			;ee05
	rst 38h			;ee06
	rst 38h			;ee07
	rst 38h			;ee08
	rst 38h			;ee09
	rst 38h			;ee0a
	rst 38h			;ee0b
	rst 38h			;ee0c
	rst 38h			;ee0d
	rst 38h			;ee0e
	rst 38h			;ee0f
	rst 38h			;ee10
	rst 38h			;ee11
	rst 38h			;ee12
	rst 38h			;ee13
	rst 38h			;ee14
	rst 38h			;ee15
	rst 38h			;ee16
	rst 38h			;ee17
	rst 38h			;ee18
	rst 38h			;ee19
	rst 38h			;ee1a
	rst 38h			;ee1b
	rst 38h			;ee1c
	rst 38h			;ee1d
	rst 38h			;ee1e
	rst 38h			;ee1f
	rst 38h			;ee20
	rst 38h			;ee21
	rst 38h			;ee22
	rst 38h			;ee23
	rst 38h			;ee24
	rst 38h			;ee25
	rst 38h			;ee26
	rst 38h			;ee27
	rst 38h			;ee28
	rst 38h			;ee29
	rst 38h			;ee2a
	rst 38h			;ee2b
	rst 38h			;ee2c
	rst 38h			;ee2d
	rst 38h			;ee2e
	rst 38h			;ee2f
	rst 38h			;ee30
	rst 38h			;ee31
	rst 38h			;ee32
	rst 38h			;ee33
	rst 38h			;ee34
	rst 38h			;ee35
	rst 38h			;ee36
	rst 38h			;ee37
	rst 38h			;ee38
	rst 38h			;ee39
	rst 38h			;ee3a
	rst 38h			;ee3b
	rst 38h			;ee3c
	rst 38h			;ee3d
	rst 38h			;ee3e
	rst 38h			;ee3f
	rst 38h			;ee40
	rst 38h			;ee41
	rst 38h			;ee42
	rst 38h			;ee43
	rst 38h			;ee44
	rst 38h			;ee45
	rst 38h			;ee46
	rst 38h			;ee47
	rst 38h			;ee48
	rst 38h			;ee49
	rst 38h			;ee4a
	rst 38h			;ee4b
	rst 38h			;ee4c
	rst 38h			;ee4d
	rst 38h			;ee4e
	rst 38h			;ee4f
	rst 38h			;ee50
	rst 38h			;ee51
	rst 38h			;ee52
	rst 38h			;ee53
	rst 38h			;ee54
	rst 38h			;ee55
	rst 38h			;ee56
	rst 38h			;ee57
	rst 38h			;ee58
	rst 38h			;ee59
	rst 38h			;ee5a
	rst 38h			;ee5b
	rst 38h			;ee5c
	rst 38h			;ee5d
	rst 38h			;ee5e
	rst 38h			;ee5f
	rst 38h			;ee60
	rst 38h			;ee61
	rst 38h			;ee62
	rst 38h			;ee63
	rst 38h			;ee64
	rst 38h			;ee65
	rst 38h			;ee66
	rst 38h			;ee67
	rst 38h			;ee68
	rst 38h			;ee69
	rst 38h			;ee6a
	rst 38h			;ee6b
	rst 38h			;ee6c
	rst 38h			;ee6d
	rst 38h			;ee6e
	rst 38h			;ee6f
	rst 38h			;ee70
	rst 38h			;ee71
	rst 38h			;ee72
	rst 38h			;ee73
	rst 38h			;ee74
	rst 38h			;ee75
	rst 38h			;ee76
	rst 38h			;ee77
	rst 38h			;ee78
	rst 38h			;ee79
	rst 38h			;ee7a
	rst 38h			;ee7b
	rst 38h			;ee7c
	rst 38h			;ee7d
	rst 38h			;ee7e
	rst 38h			;ee7f
	rst 38h			;ee80
	rst 38h			;ee81
	rst 38h			;ee82
	rst 38h			;ee83
	rst 38h			;ee84
	rst 38h			;ee85
	rst 38h			;ee86
	rst 38h			;ee87
	rst 38h			;ee88
	rst 38h			;ee89
	rst 38h			;ee8a
	rst 38h			;ee8b
	rst 38h			;ee8c
	rst 38h			;ee8d
	rst 38h			;ee8e
	rst 38h			;ee8f
	rst 38h			;ee90
	rst 38h			;ee91
	rst 38h			;ee92
	rst 38h			;ee93
	rst 38h			;ee94
	rst 38h			;ee95
	rst 38h			;ee96
	rst 38h			;ee97
	rst 38h			;ee98
	rst 38h			;ee99
	rst 38h			;ee9a
	rst 38h			;ee9b
	rst 38h			;ee9c
	rst 38h			;ee9d
	rst 38h			;ee9e
	rst 38h			;ee9f
	rst 38h			;eea0
	rst 38h			;eea1
	rst 38h			;eea2
	rst 38h			;eea3
	rst 38h			;eea4
	rst 38h			;eea5
	rst 38h			;eea6
	rst 38h			;eea7
	rst 38h			;eea8
	rst 38h			;eea9
	rst 38h			;eeaa
	rst 38h			;eeab
	rst 38h			;eeac
	rst 38h			;eead
	rst 38h			;eeae
	rst 38h			;eeaf
	rst 38h			;eeb0
	rst 38h			;eeb1
	rst 38h			;eeb2
	rst 38h			;eeb3
	rst 38h			;eeb4
	rst 38h			;eeb5
	rst 38h			;eeb6
	rst 38h			;eeb7
	rst 38h			;eeb8
	rst 38h			;eeb9
	rst 38h			;eeba
	rst 38h			;eebb
	rst 38h			;eebc
	rst 38h			;eebd
	rst 38h			;eebe
	rst 38h			;eebf
	rst 38h			;eec0
	rst 38h			;eec1
	rst 38h			;eec2
	rst 38h			;eec3
	rst 38h			;eec4
	rst 38h			;eec5
	rst 38h			;eec6
	rst 38h			;eec7
	rst 38h			;eec8
	rst 38h			;eec9
	rst 38h			;eeca
	rst 38h			;eecb
	rst 38h			;eecc
	rst 38h			;eecd
	rst 38h			;eece
	rst 38h			;eecf
	rst 38h			;eed0
	rst 38h			;eed1
	rst 38h			;eed2
	rst 38h			;eed3
	rst 38h			;eed4
	rst 38h			;eed5
	rst 38h			;eed6
	rst 38h			;eed7
	rst 38h			;eed8
	rst 38h			;eed9
	rst 38h			;eeda
	rst 38h			;eedb
	rst 38h			;eedc
	rst 38h			;eedd
	rst 38h			;eede
	rst 38h			;eedf
	rst 38h			;eee0
	rst 38h			;eee1
	rst 38h			;eee2
	rst 38h			;eee3
	rst 38h			;eee4
	rst 38h			;eee5
	rst 38h			;eee6
	rst 38h			;eee7
	rst 38h			;eee8
	rst 38h			;eee9
	rst 38h			;eeea
	rst 38h			;eeeb
	rst 38h			;eeec
	rst 38h			;eeed
	rst 38h			;eeee
	rst 38h			;eeef
	rst 38h			;eef0
	rst 38h			;eef1
	rst 38h			;eef2
	rst 38h			;eef3
	rst 38h			;eef4
	rst 38h			;eef5
	rst 38h			;eef6
	rst 38h			;eef7
	rst 38h			;eef8
	rst 38h			;eef9
	rst 38h			;eefa
	rst 38h			;eefb
	rst 38h			;eefc
	rst 38h			;eefd
	rst 38h			;eefe
	rst 38h			;eeff
	rst 38h			;ef00
	rst 38h			;ef01
	rst 38h			;ef02
	rst 38h			;ef03
	rst 38h			;ef04
	rst 38h			;ef05
	rst 38h			;ef06
	rst 38h			;ef07
	rst 38h			;ef08
	rst 38h			;ef09
	rst 38h			;ef0a
	rst 38h			;ef0b
	rst 38h			;ef0c
	rst 38h			;ef0d
	rst 38h			;ef0e
	rst 38h			;ef0f
	rst 38h			;ef10
	rst 38h			;ef11
	rst 38h			;ef12
	rst 38h			;ef13
	rst 38h			;ef14
	rst 38h			;ef15
	rst 38h			;ef16
	rst 38h			;ef17
	rst 38h			;ef18
	rst 38h			;ef19
	rst 38h			;ef1a
	rst 38h			;ef1b
	rst 38h			;ef1c
	rst 38h			;ef1d
	rst 38h			;ef1e
	rst 38h			;ef1f
	rst 38h			;ef20
	rst 38h			;ef21
	rst 38h			;ef22
	rst 38h			;ef23
	rst 38h			;ef24
	rst 38h			;ef25
	rst 38h			;ef26
	rst 38h			;ef27
	rst 38h			;ef28
	rst 38h			;ef29
	rst 38h			;ef2a
	rst 38h			;ef2b
	rst 38h			;ef2c
	rst 38h			;ef2d
	rst 38h			;ef2e
	rst 38h			;ef2f
	rst 38h			;ef30
	rst 38h			;ef31
	rst 38h			;ef32
	rst 38h			;ef33
	rst 38h			;ef34
	rst 38h			;ef35
	rst 38h			;ef36
	rst 38h			;ef37
	rst 38h			;ef38
	rst 38h			;ef39
	rst 38h			;ef3a
	rst 38h			;ef3b
	rst 38h			;ef3c
	rst 38h			;ef3d
	rst 38h			;ef3e
	rst 38h			;ef3f
	rst 38h			;ef40
	rst 38h			;ef41
	rst 38h			;ef42
	rst 38h			;ef43
	rst 38h			;ef44
	rst 38h			;ef45
	rst 38h			;ef46
	rst 38h			;ef47
	rst 38h			;ef48
	rst 38h			;ef49
	rst 38h			;ef4a
	rst 38h			;ef4b
	rst 38h			;ef4c
	rst 38h			;ef4d
	rst 38h			;ef4e
	rst 38h			;ef4f
	rst 38h			;ef50
	rst 38h			;ef51
	rst 38h			;ef52
	rst 38h			;ef53
	rst 38h			;ef54
	rst 38h			;ef55
	rst 38h			;ef56
	rst 38h			;ef57
	rst 38h			;ef58
	rst 38h			;ef59
	rst 38h			;ef5a
	rst 38h			;ef5b
	rst 38h			;ef5c
	rst 38h			;ef5d
	rst 38h			;ef5e
	rst 38h			;ef5f
	rst 38h			;ef60
	rst 38h			;ef61
	rst 38h			;ef62
	rst 38h			;ef63
	rst 38h			;ef64
	rst 38h			;ef65
	rst 38h			;ef66
	rst 38h			;ef67
	rst 38h			;ef68
	rst 38h			;ef69
	rst 38h			;ef6a
	rst 38h			;ef6b
	rst 38h			;ef6c
	rst 38h			;ef6d
	rst 38h			;ef6e
	rst 38h			;ef6f
	rst 38h			;ef70
	rst 38h			;ef71
	rst 38h			;ef72
	rst 38h			;ef73
	rst 38h			;ef74
	rst 38h			;ef75
	rst 38h			;ef76
	rst 38h			;ef77
	rst 38h			;ef78
	rst 38h			;ef79
	rst 38h			;ef7a
	rst 38h			;ef7b
	rst 38h			;ef7c
	rst 38h			;ef7d
	rst 38h			;ef7e
	rst 38h			;ef7f
	rst 38h			;ef80
	rst 38h			;ef81
	rst 38h			;ef82
	rst 38h			;ef83
	rst 38h			;ef84
	rst 38h			;ef85
	rst 38h			;ef86
	rst 38h			;ef87
	rst 38h			;ef88
	rst 38h			;ef89
	rst 38h			;ef8a
	rst 38h			;ef8b
	rst 38h			;ef8c
	rst 38h			;ef8d
	rst 38h			;ef8e
	rst 38h			;ef8f
	rst 38h			;ef90
	rst 38h			;ef91
	rst 38h			;ef92
	rst 38h			;ef93
	rst 38h			;ef94
	rst 38h			;ef95
	rst 38h			;ef96
	rst 38h			;ef97
	rst 38h			;ef98
	rst 38h			;ef99
	rst 38h			;ef9a
	rst 38h			;ef9b
	rst 38h			;ef9c
	rst 38h			;ef9d
	rst 38h			;ef9e
	rst 38h			;ef9f
	rst 38h			;efa0
	rst 38h			;efa1
	rst 38h			;efa2
	rst 38h			;efa3
	rst 38h			;efa4
	rst 38h			;efa5
	rst 38h			;efa6
	rst 38h			;efa7
	rst 38h			;efa8
	rst 38h			;efa9
	rst 38h			;efaa
	rst 38h			;efab
	rst 38h			;efac
	rst 38h			;efad
	rst 38h			;efae
	rst 38h			;efaf
	rst 38h			;efb0
	rst 38h			;efb1
	rst 38h			;efb2
	rst 38h			;efb3
	rst 38h			;efb4
	rst 38h			;efb5
	rst 38h			;efb6
	rst 38h			;efb7
	rst 38h			;efb8
	rst 38h			;efb9
	rst 38h			;efba
	rst 38h			;efbb
	rst 38h			;efbc
	rst 38h			;efbd
	rst 38h			;efbe
	rst 38h			;efbf
	rst 38h			;efc0
	rst 38h			;efc1
	rst 38h			;efc2
	rst 38h			;efc3
	rst 38h			;efc4
	rst 38h			;efc5
	rst 38h			;efc6
	rst 38h			;efc7
	rst 38h			;efc8
	rst 38h			;efc9
	rst 38h			;efca
	rst 38h			;efcb
	rst 38h			;efcc
	rst 38h			;efcd
	rst 38h			;efce
	rst 38h			;efcf
	rst 38h			;efd0
	rst 38h			;efd1
	rst 38h			;efd2
	rst 38h			;efd3
	rst 38h			;efd4
	rst 38h			;efd5
	rst 38h			;efd6
	rst 38h			;efd7
	rst 38h			;efd8
	rst 38h			;efd9
	rst 38h			;efda
	rst 38h			;efdb
	rst 38h			;efdc
	rst 38h			;efdd
	rst 38h			;efde
	rst 38h			;efdf
	rst 38h			;efe0
	rst 38h			;efe1
	rst 38h			;efe2
	rst 38h			;efe3
	rst 38h			;efe4
	rst 38h			;efe5
	rst 38h			;efe6
	rst 38h			;efe7
	rst 38h			;efe8
	rst 38h			;efe9
	rst 38h			;efea
	rst 38h			;efeb
	rst 38h			;efec
	rst 38h			;efed
	rst 38h			;efee
	rst 38h			;efef
	rst 38h			;eff0
	rst 38h			;eff1
	rst 38h			;eff2
	rst 38h			;eff3
	rst 38h			;eff4
	rst 38h			;eff5
	rst 38h			;eff6
	rst 38h			;eff7
	rst 38h			;eff8
	rst 38h			;eff9
	rst 38h			;effa
	rst 38h			;effb
	rst 38h			;effc
	rst 38h			;effd
	rst 38h			;effe
	rst 38h			;efff
	rst 38h			;f000
	rst 38h			;f001
	rst 38h			;f002
sub_f003h:
	rst 38h			;f003
	rst 38h			;f004
	rst 38h			;f005
	rst 38h			;f006
	rst 38h			;f007
	rst 38h			;f008
	rst 38h			;f009
	rst 38h			;f00a
	rst 38h			;f00b
	rst 38h			;f00c
	rst 38h			;f00d
	rst 38h			;f00e
	rst 38h			;f00f
	rst 38h			;f010
	rst 38h			;f011
	rst 38h			;f012
	rst 38h			;f013
	rst 38h			;f014
	rst 38h			;f015
	rst 38h			;f016
	rst 38h			;f017
	rst 38h			;f018
	rst 38h			;f019
	rst 38h			;f01a
	rst 38h			;f01b
	rst 38h			;f01c
	rst 38h			;f01d
	rst 38h			;f01e
	rst 38h			;f01f
	rst 38h			;f020
	rst 38h			;f021
	rst 38h			;f022
	rst 38h			;f023
	rst 38h			;f024
	rst 38h			;f025
	rst 38h			;f026
	rst 38h			;f027
	rst 38h			;f028
	rst 38h			;f029
	rst 38h			;f02a
	rst 38h			;f02b
	rst 38h			;f02c
	rst 38h			;f02d
	rst 38h			;f02e
	rst 38h			;f02f
	rst 38h			;f030
	rst 38h			;f031
	rst 38h			;f032
	rst 38h			;f033
	rst 38h			;f034
	rst 38h			;f035
	rst 38h			;f036
	rst 38h			;f037
	rst 38h			;f038
	rst 38h			;f039
	rst 38h			;f03a
	rst 38h			;f03b
	rst 38h			;f03c
	rst 38h			;f03d
	rst 38h			;f03e
	rst 38h			;f03f
	rst 38h			;f040
	rst 38h			;f041
	rst 38h			;f042
	rst 38h			;f043
	rst 38h			;f044
	rst 38h			;f045
	rst 38h			;f046
	rst 38h			;f047
	rst 38h			;f048
	rst 38h			;f049
	rst 38h			;f04a
	rst 38h			;f04b
	rst 38h			;f04c
	rst 38h			;f04d
	rst 38h			;f04e
	rst 38h			;f04f
	rst 38h			;f050
	rst 38h			;f051
	rst 38h			;f052
	rst 38h			;f053
	rst 38h			;f054
	rst 38h			;f055
	rst 38h			;f056
	rst 38h			;f057
	rst 38h			;f058
	rst 38h			;f059
	rst 38h			;f05a
	rst 38h			;f05b
	rst 38h			;f05c
	rst 38h			;f05d
	rst 38h			;f05e
	rst 38h			;f05f
	rst 38h			;f060
	rst 38h			;f061
	rst 38h			;f062
	rst 38h			;f063
	rst 38h			;f064
	rst 38h			;f065
	rst 38h			;f066
	rst 38h			;f067
	rst 38h			;f068
	rst 38h			;f069
	rst 38h			;f06a
	rst 38h			;f06b
	rst 38h			;f06c
	rst 38h			;f06d
	rst 38h			;f06e
	rst 38h			;f06f
	rst 38h			;f070
	rst 38h			;f071
	rst 38h			;f072
	rst 38h			;f073
	rst 38h			;f074
	rst 38h			;f075
	rst 38h			;f076
	rst 38h			;f077
	rst 38h			;f078
	rst 38h			;f079
	rst 38h			;f07a
	rst 38h			;f07b
	rst 38h			;f07c
	rst 38h			;f07d
	rst 38h			;f07e
	rst 38h			;f07f
	rst 38h			;f080
	rst 38h			;f081
	rst 38h			;f082
	rst 38h			;f083
	rst 38h			;f084
	rst 38h			;f085
	rst 38h			;f086
	rst 38h			;f087
	rst 38h			;f088
	rst 38h			;f089
	rst 38h			;f08a
	rst 38h			;f08b
	rst 38h			;f08c
	rst 38h			;f08d
	rst 38h			;f08e
	rst 38h			;f08f
	rst 38h			;f090
	rst 38h			;f091
	rst 38h			;f092
	rst 38h			;f093
	rst 38h			;f094
	rst 38h			;f095
	rst 38h			;f096
	rst 38h			;f097
	rst 38h			;f098
	rst 38h			;f099
	rst 38h			;f09a
	rst 38h			;f09b
	rst 38h			;f09c
	rst 38h			;f09d
	rst 38h			;f09e
	rst 38h			;f09f
	rst 38h			;f0a0
	rst 38h			;f0a1
	rst 38h			;f0a2
	rst 38h			;f0a3
	rst 38h			;f0a4
	rst 38h			;f0a5
	rst 38h			;f0a6
	rst 38h			;f0a7
	rst 38h			;f0a8
	rst 38h			;f0a9
	rst 38h			;f0aa
	rst 38h			;f0ab
	rst 38h			;f0ac
	rst 38h			;f0ad
	rst 38h			;f0ae
	rst 38h			;f0af
	rst 38h			;f0b0
	rst 38h			;f0b1
	rst 38h			;f0b2
	rst 38h			;f0b3
	rst 38h			;f0b4
	rst 38h			;f0b5
	rst 38h			;f0b6
	rst 38h			;f0b7
	rst 38h			;f0b8
	rst 38h			;f0b9
	rst 38h			;f0ba
	rst 38h			;f0bb
	rst 38h			;f0bc
	rst 38h			;f0bd
	rst 38h			;f0be
	rst 38h			;f0bf
	rst 38h			;f0c0
	rst 38h			;f0c1
	rst 38h			;f0c2
	rst 38h			;f0c3
	rst 38h			;f0c4
	rst 38h			;f0c5
	rst 38h			;f0c6
	rst 38h			;f0c7
	rst 38h			;f0c8
	rst 38h			;f0c9
	rst 38h			;f0ca
	rst 38h			;f0cb
	rst 38h			;f0cc
	rst 38h			;f0cd
	rst 38h			;f0ce
	rst 38h			;f0cf
	rst 38h			;f0d0
	rst 38h			;f0d1
	rst 38h			;f0d2
	rst 38h			;f0d3
	rst 38h			;f0d4
	rst 38h			;f0d5
	rst 38h			;f0d6
	rst 38h			;f0d7
	rst 38h			;f0d8
	rst 38h			;f0d9
	rst 38h			;f0da
	rst 38h			;f0db
	rst 38h			;f0dc
	rst 38h			;f0dd
	rst 38h			;f0de
	rst 38h			;f0df
	rst 38h			;f0e0
	rst 38h			;f0e1
	rst 38h			;f0e2
	rst 38h			;f0e3
	rst 38h			;f0e4
	rst 38h			;f0e5
	rst 38h			;f0e6
	rst 38h			;f0e7
	rst 38h			;f0e8
	rst 38h			;f0e9
	rst 38h			;f0ea
	rst 38h			;f0eb
	rst 38h			;f0ec
	rst 38h			;f0ed
	rst 38h			;f0ee
	rst 38h			;f0ef
	rst 38h			;f0f0
	rst 38h			;f0f1
	rst 38h			;f0f2
	rst 38h			;f0f3
	rst 38h			;f0f4
	rst 38h			;f0f5
	rst 38h			;f0f6
	rst 38h			;f0f7
sub_f0f8h:
	rst 38h			;f0f8
	rst 38h			;f0f9
	rst 38h			;f0fa
	rst 38h			;f0fb
sub_f0fch:
	rst 38h			;f0fc
	rst 38h			;f0fd
	rst 38h			;f0fe
	rst 38h			;f0ff
	rst 38h			;f100
	rst 38h			;f101
	rst 38h			;f102
	rst 38h			;f103
	rst 38h			;f104
	rst 38h			;f105
	rst 38h			;f106
	rst 38h			;f107
	rst 38h			;f108
	rst 38h			;f109
	rst 38h			;f10a
	rst 38h			;f10b
	rst 38h			;f10c
	rst 38h			;f10d
	rst 38h			;f10e
	rst 38h			;f10f
	rst 38h			;f110
	rst 38h			;f111
	rst 38h			;f112
	rst 38h			;f113
	rst 38h			;f114
	rst 38h			;f115
	rst 38h			;f116
	rst 38h			;f117
	rst 38h			;f118
	rst 38h			;f119
	rst 38h			;f11a
	rst 38h			;f11b
	rst 38h			;f11c
	rst 38h			;f11d
	rst 38h			;f11e
	rst 38h			;f11f
	rst 38h			;f120
	rst 38h			;f121
	rst 38h			;f122
	rst 38h			;f123
	rst 38h			;f124
	rst 38h			;f125
	rst 38h			;f126
	rst 38h			;f127
	rst 38h			;f128
	rst 38h			;f129
	rst 38h			;f12a
	rst 38h			;f12b
	rst 38h			;f12c
	rst 38h			;f12d
	rst 38h			;f12e
	rst 38h			;f12f
	rst 38h			;f130
	rst 38h			;f131
	rst 38h			;f132
	rst 38h			;f133
	rst 38h			;f134
	rst 38h			;f135
	rst 38h			;f136
	rst 38h			;f137
	rst 38h			;f138
	rst 38h			;f139
	rst 38h			;f13a
	rst 38h			;f13b
	rst 38h			;f13c
	rst 38h			;f13d
	rst 38h			;f13e
	rst 38h			;f13f
	rst 38h			;f140
	rst 38h			;f141
	rst 38h			;f142
	rst 38h			;f143
	rst 38h			;f144
	rst 38h			;f145
	rst 38h			;f146
	rst 38h			;f147
	rst 38h			;f148
	rst 38h			;f149
	rst 38h			;f14a
	rst 38h			;f14b
	rst 38h			;f14c
	rst 38h			;f14d
	rst 38h			;f14e
	rst 38h			;f14f
	rst 38h			;f150
	rst 38h			;f151
	rst 38h			;f152
	rst 38h			;f153
	rst 38h			;f154
	rst 38h			;f155
	rst 38h			;f156
	rst 38h			;f157
	rst 38h			;f158
	rst 38h			;f159
	rst 38h			;f15a
	rst 38h			;f15b
	rst 38h			;f15c
	rst 38h			;f15d
	rst 38h			;f15e
	rst 38h			;f15f
	rst 38h			;f160
	rst 38h			;f161
	rst 38h			;f162
	rst 38h			;f163
	rst 38h			;f164
	rst 38h			;f165
	rst 38h			;f166
	rst 38h			;f167
	rst 38h			;f168
	rst 38h			;f169
	rst 38h			;f16a
	rst 38h			;f16b
	rst 38h			;f16c
	rst 38h			;f16d
	rst 38h			;f16e
	rst 38h			;f16f
	rst 38h			;f170
	rst 38h			;f171
	rst 38h			;f172
	rst 38h			;f173
	rst 38h			;f174
	rst 38h			;f175
	rst 38h			;f176
	rst 38h			;f177
	rst 38h			;f178
	rst 38h			;f179
	rst 38h			;f17a
	rst 38h			;f17b
	rst 38h			;f17c
	rst 38h			;f17d
	rst 38h			;f17e
	rst 38h			;f17f
	rst 38h			;f180
	rst 38h			;f181
	rst 38h			;f182
	rst 38h			;f183
	rst 38h			;f184
	rst 38h			;f185
	rst 38h			;f186
	rst 38h			;f187
	rst 38h			;f188
	rst 38h			;f189
	rst 38h			;f18a
	rst 38h			;f18b
	rst 38h			;f18c
	rst 38h			;f18d
	rst 38h			;f18e
	rst 38h			;f18f
	rst 38h			;f190
	rst 38h			;f191
	rst 38h			;f192
	rst 38h			;f193
	rst 38h			;f194
	rst 38h			;f195
	rst 38h			;f196
	rst 38h			;f197
	rst 38h			;f198
	rst 38h			;f199
	rst 38h			;f19a
	rst 38h			;f19b
	rst 38h			;f19c
	rst 38h			;f19d
	rst 38h			;f19e
	rst 38h			;f19f
	rst 38h			;f1a0
	rst 38h			;f1a1
	rst 38h			;f1a2
	rst 38h			;f1a3
	rst 38h			;f1a4
	rst 38h			;f1a5
	rst 38h			;f1a6
	rst 38h			;f1a7
	rst 38h			;f1a8
	rst 38h			;f1a9
	rst 38h			;f1aa
	rst 38h			;f1ab
	rst 38h			;f1ac
	rst 38h			;f1ad
	rst 38h			;f1ae
	rst 38h			;f1af
	rst 38h			;f1b0
	rst 38h			;f1b1
	rst 38h			;f1b2
	rst 38h			;f1b3
	rst 38h			;f1b4
	rst 38h			;f1b5
	rst 38h			;f1b6
	rst 38h			;f1b7
	rst 38h			;f1b8
	rst 38h			;f1b9
	rst 38h			;f1ba
	rst 38h			;f1bb
	rst 38h			;f1bc
	rst 38h			;f1bd
	rst 38h			;f1be
	rst 38h			;f1bf
	rst 38h			;f1c0
	rst 38h			;f1c1
	rst 38h			;f1c2
	rst 38h			;f1c3
	rst 38h			;f1c4
	rst 38h			;f1c5
	rst 38h			;f1c6
	rst 38h			;f1c7
	rst 38h			;f1c8
	rst 38h			;f1c9
	rst 38h			;f1ca
	rst 38h			;f1cb
	rst 38h			;f1cc
	rst 38h			;f1cd
	rst 38h			;f1ce
	rst 38h			;f1cf
	rst 38h			;f1d0
	rst 38h			;f1d1
	rst 38h			;f1d2
	rst 38h			;f1d3
	rst 38h			;f1d4
	rst 38h			;f1d5
	rst 38h			;f1d6
	rst 38h			;f1d7
	rst 38h			;f1d8
	rst 38h			;f1d9
	rst 38h			;f1da
	rst 38h			;f1db
	rst 38h			;f1dc
	rst 38h			;f1dd
	rst 38h			;f1de
	rst 38h			;f1df
	rst 38h			;f1e0
	rst 38h			;f1e1
	rst 38h			;f1e2
	rst 38h			;f1e3
	rst 38h			;f1e4
	rst 38h			;f1e5
	rst 38h			;f1e6
	rst 38h			;f1e7
	rst 38h			;f1e8
	rst 38h			;f1e9
	rst 38h			;f1ea
	rst 38h			;f1eb
	rst 38h			;f1ec
	rst 38h			;f1ed
	rst 38h			;f1ee
	rst 38h			;f1ef
	rst 38h			;f1f0
	rst 38h			;f1f1
	rst 38h			;f1f2
	rst 38h			;f1f3
	rst 38h			;f1f4
	rst 38h			;f1f5
	rst 38h			;f1f6
	rst 38h			;f1f7
	rst 38h			;f1f8
	rst 38h			;f1f9
	rst 38h			;f1fa
	rst 38h			;f1fb
	rst 38h			;f1fc
	rst 38h			;f1fd
	rst 38h			;f1fe
	rst 38h			;f1ff
	rst 38h			;f200
	rst 38h			;f201
	rst 38h			;f202
	rst 38h			;f203
	rst 38h			;f204
	rst 38h			;f205
	rst 38h			;f206
	rst 38h			;f207
	rst 38h			;f208
	rst 38h			;f209
	rst 38h			;f20a
	rst 38h			;f20b
	rst 38h			;f20c
	rst 38h			;f20d
	rst 38h			;f20e
	rst 38h			;f20f
	rst 38h			;f210
	rst 38h			;f211
	rst 38h			;f212
	rst 38h			;f213
	rst 38h			;f214
	rst 38h			;f215
	rst 38h			;f216
	rst 38h			;f217
	rst 38h			;f218
	rst 38h			;f219
	rst 38h			;f21a
	rst 38h			;f21b
	rst 38h			;f21c
	rst 38h			;f21d
	rst 38h			;f21e
	rst 38h			;f21f
	rst 38h			;f220
	rst 38h			;f221
	rst 38h			;f222
	rst 38h			;f223
	rst 38h			;f224
	rst 38h			;f225
	rst 38h			;f226
	rst 38h			;f227
	rst 38h			;f228
	rst 38h			;f229
	rst 38h			;f22a
	rst 38h			;f22b
	rst 38h			;f22c
	rst 38h			;f22d
	rst 38h			;f22e
	rst 38h			;f22f
	rst 38h			;f230
	rst 38h			;f231
	rst 38h			;f232
	rst 38h			;f233
	rst 38h			;f234
	rst 38h			;f235
	rst 38h			;f236
	rst 38h			;f237
	rst 38h			;f238
	rst 38h			;f239
	rst 38h			;f23a
	rst 38h			;f23b
	rst 38h			;f23c
	rst 38h			;f23d
	rst 38h			;f23e
	rst 38h			;f23f
	rst 38h			;f240
	rst 38h			;f241
	rst 38h			;f242
	rst 38h			;f243
	rst 38h			;f244
	rst 38h			;f245
	rst 38h			;f246
	rst 38h			;f247
	rst 38h			;f248
	rst 38h			;f249
	rst 38h			;f24a
	rst 38h			;f24b
	rst 38h			;f24c
	rst 38h			;f24d
	rst 38h			;f24e
	rst 38h			;f24f
	rst 38h			;f250
	rst 38h			;f251
	rst 38h			;f252
	rst 38h			;f253
	rst 38h			;f254
	rst 38h			;f255
	rst 38h			;f256
	rst 38h			;f257
	rst 38h			;f258
	rst 38h			;f259
	rst 38h			;f25a
	rst 38h			;f25b
	rst 38h			;f25c
	rst 38h			;f25d
	rst 38h			;f25e
	rst 38h			;f25f
	rst 38h			;f260
	rst 38h			;f261
	rst 38h			;f262
	rst 38h			;f263
	rst 38h			;f264
	rst 38h			;f265
	rst 38h			;f266
	rst 38h			;f267
	rst 38h			;f268
	rst 38h			;f269
	rst 38h			;f26a
	rst 38h			;f26b
	rst 38h			;f26c
	rst 38h			;f26d
	rst 38h			;f26e
	rst 38h			;f26f
	rst 38h			;f270
	rst 38h			;f271
	rst 38h			;f272
	rst 38h			;f273
	rst 38h			;f274
	rst 38h			;f275
	rst 38h			;f276
	rst 38h			;f277
	rst 38h			;f278
	rst 38h			;f279
	rst 38h			;f27a
	rst 38h			;f27b
	rst 38h			;f27c
	rst 38h			;f27d
	rst 38h			;f27e
	rst 38h			;f27f
	rst 38h			;f280
	rst 38h			;f281
	rst 38h			;f282
	rst 38h			;f283
	rst 38h			;f284
	rst 38h			;f285
	rst 38h			;f286
	rst 38h			;f287
	rst 38h			;f288
	rst 38h			;f289
	rst 38h			;f28a
	rst 38h			;f28b
	rst 38h			;f28c
	rst 38h			;f28d
	rst 38h			;f28e
	rst 38h			;f28f
	rst 38h			;f290
	rst 38h			;f291
	rst 38h			;f292
	rst 38h			;f293
	rst 38h			;f294
	rst 38h			;f295
	rst 38h			;f296
	rst 38h			;f297
	rst 38h			;f298
	rst 38h			;f299
	rst 38h			;f29a
	rst 38h			;f29b
	rst 38h			;f29c
	rst 38h			;f29d
	rst 38h			;f29e
	rst 38h			;f29f
	rst 38h			;f2a0
	rst 38h			;f2a1
	rst 38h			;f2a2
	rst 38h			;f2a3
	rst 38h			;f2a4
	rst 38h			;f2a5
	rst 38h			;f2a6
	rst 38h			;f2a7
	rst 38h			;f2a8
	rst 38h			;f2a9
	rst 38h			;f2aa
	rst 38h			;f2ab
	rst 38h			;f2ac
	rst 38h			;f2ad
	rst 38h			;f2ae
	rst 38h			;f2af
	rst 38h			;f2b0
	rst 38h			;f2b1
	rst 38h			;f2b2
	rst 38h			;f2b3
	rst 38h			;f2b4
	rst 38h			;f2b5
	rst 38h			;f2b6
	rst 38h			;f2b7
	rst 38h			;f2b8
	rst 38h			;f2b9
	rst 38h			;f2ba
	rst 38h			;f2bb
	rst 38h			;f2bc
	rst 38h			;f2bd
	rst 38h			;f2be
	rst 38h			;f2bf
	rst 38h			;f2c0
	rst 38h			;f2c1
	rst 38h			;f2c2
	rst 38h			;f2c3
	rst 38h			;f2c4
	rst 38h			;f2c5
	rst 38h			;f2c6
	rst 38h			;f2c7
	rst 38h			;f2c8
	rst 38h			;f2c9
	rst 38h			;f2ca
	rst 38h			;f2cb
	rst 38h			;f2cc
	rst 38h			;f2cd
	rst 38h			;f2ce
	rst 38h			;f2cf
	rst 38h			;f2d0
	rst 38h			;f2d1
	rst 38h			;f2d2
	rst 38h			;f2d3
	rst 38h			;f2d4
	rst 38h			;f2d5
	rst 38h			;f2d6
	rst 38h			;f2d7
	rst 38h			;f2d8
	rst 38h			;f2d9
	rst 38h			;f2da
	rst 38h			;f2db
	rst 38h			;f2dc
	rst 38h			;f2dd
	rst 38h			;f2de
	rst 38h			;f2df
	rst 38h			;f2e0
	rst 38h			;f2e1
	rst 38h			;f2e2
	rst 38h			;f2e3
	rst 38h			;f2e4
	rst 38h			;f2e5
	rst 38h			;f2e6
	rst 38h			;f2e7
	rst 38h			;f2e8
	rst 38h			;f2e9
	rst 38h			;f2ea
	rst 38h			;f2eb
	rst 38h			;f2ec
	rst 38h			;f2ed
	rst 38h			;f2ee
	rst 38h			;f2ef
	rst 38h			;f2f0
	rst 38h			;f2f1
	rst 38h			;f2f2
	rst 38h			;f2f3
	rst 38h			;f2f4
	rst 38h			;f2f5
	rst 38h			;f2f6
	rst 38h			;f2f7
	rst 38h			;f2f8
	rst 38h			;f2f9
	rst 38h			;f2fa
	rst 38h			;f2fb
	rst 38h			;f2fc
	rst 38h			;f2fd
	rst 38h			;f2fe
	rst 38h			;f2ff
	rst 38h			;f300
	rst 38h			;f301
	rst 38h			;f302
	rst 38h			;f303
	rst 38h			;f304
	rst 38h			;f305
	rst 38h			;f306
	rst 38h			;f307
	rst 38h			;f308
	rst 38h			;f309
	rst 38h			;f30a
	rst 38h			;f30b
	rst 38h			;f30c
	rst 38h			;f30d
	rst 38h			;f30e
	rst 38h			;f30f
	rst 38h			;f310
	rst 38h			;f311
	rst 38h			;f312
	rst 38h			;f313
	rst 38h			;f314
	rst 38h			;f315
	rst 38h			;f316
	rst 38h			;f317
	rst 38h			;f318
	rst 38h			;f319
	rst 38h			;f31a
	rst 38h			;f31b
	rst 38h			;f31c
	rst 38h			;f31d
	rst 38h			;f31e
	rst 38h			;f31f
	rst 38h			;f320
	rst 38h			;f321
	rst 38h			;f322
	rst 38h			;f323
	rst 38h			;f324
	rst 38h			;f325
	rst 38h			;f326
	rst 38h			;f327
	rst 38h			;f328
	rst 38h			;f329
	rst 38h			;f32a
	rst 38h			;f32b
	rst 38h			;f32c
	rst 38h			;f32d
	rst 38h			;f32e
	rst 38h			;f32f
	rst 38h			;f330
	rst 38h			;f331
	rst 38h			;f332
	rst 38h			;f333
	rst 38h			;f334
	rst 38h			;f335
	rst 38h			;f336
	rst 38h			;f337
	rst 38h			;f338
	rst 38h			;f339
	rst 38h			;f33a
	rst 38h			;f33b
	rst 38h			;f33c
	rst 38h			;f33d
	rst 38h			;f33e
	rst 38h			;f33f
	rst 38h			;f340
	rst 38h			;f341
	rst 38h			;f342
	rst 38h			;f343
	rst 38h			;f344
	rst 38h			;f345
	rst 38h			;f346
	rst 38h			;f347
	rst 38h			;f348
	rst 38h			;f349
	rst 38h			;f34a
	rst 38h			;f34b
	rst 38h			;f34c
	rst 38h			;f34d
	rst 38h			;f34e
	rst 38h			;f34f
	rst 38h			;f350
	rst 38h			;f351
	rst 38h			;f352
	rst 38h			;f353
	rst 38h			;f354
	rst 38h			;f355
	rst 38h			;f356
	rst 38h			;f357
	rst 38h			;f358
	rst 38h			;f359
	rst 38h			;f35a
	rst 38h			;f35b
	rst 38h			;f35c
	rst 38h			;f35d
	rst 38h			;f35e
	rst 38h			;f35f
	rst 38h			;f360
	rst 38h			;f361
	rst 38h			;f362
	rst 38h			;f363
	rst 38h			;f364
	rst 38h			;f365
	rst 38h			;f366
	rst 38h			;f367
	rst 38h			;f368
	rst 38h			;f369
	rst 38h			;f36a
	rst 38h			;f36b
	rst 38h			;f36c
	rst 38h			;f36d
	rst 38h			;f36e
	rst 38h			;f36f
	rst 38h			;f370
	rst 38h			;f371
	rst 38h			;f372
	rst 38h			;f373
	rst 38h			;f374
	rst 38h			;f375
	rst 38h			;f376
	rst 38h			;f377
	rst 38h			;f378
	rst 38h			;f379
	rst 38h			;f37a
	rst 38h			;f37b
	rst 38h			;f37c
	rst 38h			;f37d
	rst 38h			;f37e
	rst 38h			;f37f
	rst 38h			;f380
	rst 38h			;f381
	rst 38h			;f382
	rst 38h			;f383
	rst 38h			;f384
	rst 38h			;f385
	rst 38h			;f386
	rst 38h			;f387
	rst 38h			;f388
	rst 38h			;f389
	rst 38h			;f38a
	rst 38h			;f38b
	rst 38h			;f38c
	rst 38h			;f38d
	rst 38h			;f38e
	rst 38h			;f38f
	rst 38h			;f390
	rst 38h			;f391
	rst 38h			;f392
	rst 38h			;f393
	rst 38h			;f394
	rst 38h			;f395
	rst 38h			;f396
	rst 38h			;f397
	rst 38h			;f398
	rst 38h			;f399
	rst 38h			;f39a
	rst 38h			;f39b
	rst 38h			;f39c
	rst 38h			;f39d
	rst 38h			;f39e
	rst 38h			;f39f
	rst 38h			;f3a0
	rst 38h			;f3a1
	rst 38h			;f3a2
	rst 38h			;f3a3
	rst 38h			;f3a4
	rst 38h			;f3a5
	rst 38h			;f3a6
	rst 38h			;f3a7
	rst 38h			;f3a8
	rst 38h			;f3a9
	rst 38h			;f3aa
	rst 38h			;f3ab
	rst 38h			;f3ac
	rst 38h			;f3ad
	rst 38h			;f3ae
	rst 38h			;f3af
	rst 38h			;f3b0
	rst 38h			;f3b1
	rst 38h			;f3b2
	rst 38h			;f3b3
	rst 38h			;f3b4
	rst 38h			;f3b5
	rst 38h			;f3b6
	rst 38h			;f3b7
	rst 38h			;f3b8
	rst 38h			;f3b9
	rst 38h			;f3ba
	rst 38h			;f3bb
	rst 38h			;f3bc
	rst 38h			;f3bd
	rst 38h			;f3be
	rst 38h			;f3bf
	rst 38h			;f3c0
	rst 38h			;f3c1
	rst 38h			;f3c2
	rst 38h			;f3c3
	rst 38h			;f3c4
	rst 38h			;f3c5
	rst 38h			;f3c6
	rst 38h			;f3c7
	rst 38h			;f3c8
	rst 38h			;f3c9
	rst 38h			;f3ca
	rst 38h			;f3cb
	rst 38h			;f3cc
	rst 38h			;f3cd
	rst 38h			;f3ce
	rst 38h			;f3cf
	rst 38h			;f3d0
	rst 38h			;f3d1
	rst 38h			;f3d2
	rst 38h			;f3d3
	rst 38h			;f3d4
	rst 38h			;f3d5
	rst 38h			;f3d6
	rst 38h			;f3d7
	rst 38h			;f3d8
	rst 38h			;f3d9
	rst 38h			;f3da
	rst 38h			;f3db
	rst 38h			;f3dc
	rst 38h			;f3dd
	rst 38h			;f3de
	rst 38h			;f3df
	rst 38h			;f3e0
	rst 38h			;f3e1
	rst 38h			;f3e2
	rst 38h			;f3e3
	rst 38h			;f3e4
	rst 38h			;f3e5
	rst 38h			;f3e6
	rst 38h			;f3e7
	rst 38h			;f3e8
	rst 38h			;f3e9
	rst 38h			;f3ea
	rst 38h			;f3eb
	rst 38h			;f3ec
	rst 38h			;f3ed
	rst 38h			;f3ee
	rst 38h			;f3ef
	rst 38h			;f3f0
	rst 38h			;f3f1
	rst 38h			;f3f2
	rst 38h			;f3f3
	rst 38h			;f3f4
	rst 38h			;f3f5
	rst 38h			;f3f6
	rst 38h			;f3f7
	rst 38h			;f3f8
	rst 38h			;f3f9
	rst 38h			;f3fa
	rst 38h			;f3fb
	rst 38h			;f3fc
	rst 38h			;f3fd
	rst 38h			;f3fe
	rst 38h			;f3ff
	rst 38h			;f400
	rst 38h			;f401
	rst 38h			;f402
	rst 38h			;f403
	rst 38h			;f404
	rst 38h			;f405
	rst 38h			;f406
	rst 38h			;f407
	rst 38h			;f408
	rst 38h			;f409
	rst 38h			;f40a
	rst 38h			;f40b
	rst 38h			;f40c
	rst 38h			;f40d
	rst 38h			;f40e
	rst 38h			;f40f
	rst 38h			;f410
	rst 38h			;f411
	rst 38h			;f412
	rst 38h			;f413
	rst 38h			;f414
	rst 38h			;f415
	rst 38h			;f416
	rst 38h			;f417
	rst 38h			;f418
	rst 38h			;f419
	rst 38h			;f41a
	rst 38h			;f41b
	rst 38h			;f41c
	rst 38h			;f41d
	rst 38h			;f41e
	rst 38h			;f41f
	rst 38h			;f420
	rst 38h			;f421
	rst 38h			;f422
	rst 38h			;f423
	rst 38h			;f424
	rst 38h			;f425
	rst 38h			;f426
	rst 38h			;f427
	rst 38h			;f428
	rst 38h			;f429
	rst 38h			;f42a
	rst 38h			;f42b
	rst 38h			;f42c
	rst 38h			;f42d
	rst 38h			;f42e
	rst 38h			;f42f
	rst 38h			;f430
	rst 38h			;f431
	rst 38h			;f432
	rst 38h			;f433
	rst 38h			;f434
	rst 38h			;f435
	rst 38h			;f436
	rst 38h			;f437
	rst 38h			;f438
	rst 38h			;f439
	rst 38h			;f43a
	rst 38h			;f43b
	rst 38h			;f43c
	rst 38h			;f43d
	rst 38h			;f43e
	rst 38h			;f43f
	rst 38h			;f440
	rst 38h			;f441
	rst 38h			;f442
	rst 38h			;f443
	rst 38h			;f444
	rst 38h			;f445
	rst 38h			;f446
	rst 38h			;f447
	rst 38h			;f448
	rst 38h			;f449
	rst 38h			;f44a
	rst 38h			;f44b
	rst 38h			;f44c
	rst 38h			;f44d
	rst 38h			;f44e
	rst 38h			;f44f
	rst 38h			;f450
	rst 38h			;f451
	rst 38h			;f452
	rst 38h			;f453
	rst 38h			;f454
	rst 38h			;f455
	rst 38h			;f456
	rst 38h			;f457
	rst 38h			;f458
	rst 38h			;f459
	rst 38h			;f45a
	rst 38h			;f45b
	rst 38h			;f45c
	rst 38h			;f45d
	rst 38h			;f45e
	rst 38h			;f45f
	rst 38h			;f460
	rst 38h			;f461
	rst 38h			;f462
	rst 38h			;f463
	rst 38h			;f464
	rst 38h			;f465
	rst 38h			;f466
	rst 38h			;f467
	rst 38h			;f468
	rst 38h			;f469
	rst 38h			;f46a
	rst 38h			;f46b
	rst 38h			;f46c
	rst 38h			;f46d
	rst 38h			;f46e
	rst 38h			;f46f
	rst 38h			;f470
	rst 38h			;f471
	rst 38h			;f472
	rst 38h			;f473
	rst 38h			;f474
	rst 38h			;f475
	rst 38h			;f476
	rst 38h			;f477
	rst 38h			;f478
	rst 38h			;f479
	rst 38h			;f47a
	rst 38h			;f47b
	rst 38h			;f47c
	rst 38h			;f47d
	rst 38h			;f47e
	rst 38h			;f47f
	rst 38h			;f480
	rst 38h			;f481
	rst 38h			;f482
	rst 38h			;f483
	rst 38h			;f484
	rst 38h			;f485
	rst 38h			;f486
	rst 38h			;f487
	rst 38h			;f488
	rst 38h			;f489
	rst 38h			;f48a
	rst 38h			;f48b
	rst 38h			;f48c
	rst 38h			;f48d
	rst 38h			;f48e
	rst 38h			;f48f
	rst 38h			;f490
	rst 38h			;f491
	rst 38h			;f492
	rst 38h			;f493
	rst 38h			;f494
	rst 38h			;f495
	rst 38h			;f496
	rst 38h			;f497
	rst 38h			;f498
	rst 38h			;f499
	rst 38h			;f49a
	rst 38h			;f49b
	rst 38h			;f49c
	rst 38h			;f49d
	rst 38h			;f49e
	rst 38h			;f49f
	rst 38h			;f4a0
	rst 38h			;f4a1
	rst 38h			;f4a2
	rst 38h			;f4a3
	rst 38h			;f4a4
	rst 38h			;f4a5
	rst 38h			;f4a6
	rst 38h			;f4a7
	rst 38h			;f4a8
	rst 38h			;f4a9
	rst 38h			;f4aa
	rst 38h			;f4ab
	rst 38h			;f4ac
	rst 38h			;f4ad
	rst 38h			;f4ae
	rst 38h			;f4af
	rst 38h			;f4b0
	rst 38h			;f4b1
	rst 38h			;f4b2
	rst 38h			;f4b3
	rst 38h			;f4b4
	rst 38h			;f4b5
	rst 38h			;f4b6
	rst 38h			;f4b7
	rst 38h			;f4b8
	rst 38h			;f4b9
	rst 38h			;f4ba
	rst 38h			;f4bb
	rst 38h			;f4bc
	rst 38h			;f4bd
	rst 38h			;f4be
	rst 38h			;f4bf
	rst 38h			;f4c0
	rst 38h			;f4c1
	rst 38h			;f4c2
	rst 38h			;f4c3
	rst 38h			;f4c4
	rst 38h			;f4c5
	rst 38h			;f4c6
	rst 38h			;f4c7
	rst 38h			;f4c8
	rst 38h			;f4c9
	rst 38h			;f4ca
	rst 38h			;f4cb
	rst 38h			;f4cc
	rst 38h			;f4cd
	rst 38h			;f4ce
	rst 38h			;f4cf
	rst 38h			;f4d0
	rst 38h			;f4d1
	rst 38h			;f4d2
	rst 38h			;f4d3
	rst 38h			;f4d4
	rst 38h			;f4d5
	rst 38h			;f4d6
	rst 38h			;f4d7
	rst 38h			;f4d8
	rst 38h			;f4d9
	rst 38h			;f4da
	rst 38h			;f4db
	rst 38h			;f4dc
	rst 38h			;f4dd
	rst 38h			;f4de
	rst 38h			;f4df
	rst 38h			;f4e0
	rst 38h			;f4e1
	rst 38h			;f4e2
	rst 38h			;f4e3
	rst 38h			;f4e4
	rst 38h			;f4e5
	rst 38h			;f4e6
	rst 38h			;f4e7
	rst 38h			;f4e8
	rst 38h			;f4e9
	rst 38h			;f4ea
	rst 38h			;f4eb
	rst 38h			;f4ec
	rst 38h			;f4ed
	rst 38h			;f4ee
	rst 38h			;f4ef
	rst 38h			;f4f0
	rst 38h			;f4f1
	rst 38h			;f4f2
	rst 38h			;f4f3
	rst 38h			;f4f4
	rst 38h			;f4f5
	rst 38h			;f4f6
	rst 38h			;f4f7
	rst 38h			;f4f8
	rst 38h			;f4f9
	rst 38h			;f4fa
	rst 38h			;f4fb
sub_f4fch:
	rst 38h			;f4fc
	rst 38h			;f4fd
	rst 38h			;f4fe
	rst 38h			;f4ff
	rst 38h			;f500
	rst 38h			;f501
	rst 38h			;f502
	rst 38h			;f503
	rst 38h			;f504
	rst 38h			;f505
	rst 38h			;f506
	rst 38h			;f507
	rst 38h			;f508
	rst 38h			;f509
	rst 38h			;f50a
	rst 38h			;f50b
	rst 38h			;f50c
	rst 38h			;f50d
	rst 38h			;f50e
	rst 38h			;f50f
	rst 38h			;f510
	rst 38h			;f511
	rst 38h			;f512
	rst 38h			;f513
	rst 38h			;f514
	rst 38h			;f515
	rst 38h			;f516
	rst 38h			;f517
	rst 38h			;f518
	rst 38h			;f519
	rst 38h			;f51a
	rst 38h			;f51b
	rst 38h			;f51c
	rst 38h			;f51d
	rst 38h			;f51e
	rst 38h			;f51f
	rst 38h			;f520
	rst 38h			;f521
	rst 38h			;f522
	rst 38h			;f523
	rst 38h			;f524
	rst 38h			;f525
	rst 38h			;f526
	rst 38h			;f527
	rst 38h			;f528
	rst 38h			;f529
	rst 38h			;f52a
	rst 38h			;f52b
	rst 38h			;f52c
	rst 38h			;f52d
	rst 38h			;f52e
	rst 38h			;f52f
	rst 38h			;f530
	rst 38h			;f531
	rst 38h			;f532
	rst 38h			;f533
	rst 38h			;f534
	rst 38h			;f535
	rst 38h			;f536
	rst 38h			;f537
	rst 38h			;f538
	rst 38h			;f539
	rst 38h			;f53a
	rst 38h			;f53b
	rst 38h			;f53c
	rst 38h			;f53d
	rst 38h			;f53e
	rst 38h			;f53f
	rst 38h			;f540
	rst 38h			;f541
	rst 38h			;f542
	rst 38h			;f543
	rst 38h			;f544
	rst 38h			;f545
	rst 38h			;f546
	rst 38h			;f547
	rst 38h			;f548
	rst 38h			;f549
	rst 38h			;f54a
	rst 38h			;f54b
	rst 38h			;f54c
	rst 38h			;f54d
	rst 38h			;f54e
	rst 38h			;f54f
	rst 38h			;f550
	rst 38h			;f551
	rst 38h			;f552
	rst 38h			;f553
	rst 38h			;f554
	rst 38h			;f555
	rst 38h			;f556
	rst 38h			;f557
	rst 38h			;f558
	rst 38h			;f559
	rst 38h			;f55a
	rst 38h			;f55b
	rst 38h			;f55c
	rst 38h			;f55d
	rst 38h			;f55e
	rst 38h			;f55f
	rst 38h			;f560
	rst 38h			;f561
	rst 38h			;f562
	rst 38h			;f563
	rst 38h			;f564
	rst 38h			;f565
	rst 38h			;f566
	rst 38h			;f567
	rst 38h			;f568
	rst 38h			;f569
	rst 38h			;f56a
	rst 38h			;f56b
	rst 38h			;f56c
	rst 38h			;f56d
	rst 38h			;f56e
	rst 38h			;f56f
	rst 38h			;f570
	rst 38h			;f571
	rst 38h			;f572
	rst 38h			;f573
	rst 38h			;f574
	rst 38h			;f575
	rst 38h			;f576
	rst 38h			;f577
	rst 38h			;f578
	rst 38h			;f579
	rst 38h			;f57a
	rst 38h			;f57b
	rst 38h			;f57c
	rst 38h			;f57d
	rst 38h			;f57e
	rst 38h			;f57f
	rst 38h			;f580
	rst 38h			;f581
	rst 38h			;f582
	rst 38h			;f583
	rst 38h			;f584
	rst 38h			;f585
	rst 38h			;f586
	rst 38h			;f587
	rst 38h			;f588
	rst 38h			;f589
	rst 38h			;f58a
	rst 38h			;f58b
	rst 38h			;f58c
	rst 38h			;f58d
	rst 38h			;f58e
	rst 38h			;f58f
	rst 38h			;f590
	rst 38h			;f591
	rst 38h			;f592
	rst 38h			;f593
	rst 38h			;f594
	rst 38h			;f595
	rst 38h			;f596
	rst 38h			;f597
	rst 38h			;f598
	rst 38h			;f599
	rst 38h			;f59a
	rst 38h			;f59b
	rst 38h			;f59c
	rst 38h			;f59d
	rst 38h			;f59e
	rst 38h			;f59f
	rst 38h			;f5a0
	rst 38h			;f5a1
	rst 38h			;f5a2
	rst 38h			;f5a3
	rst 38h			;f5a4
	rst 38h			;f5a5
	rst 38h			;f5a6
	rst 38h			;f5a7
	rst 38h			;f5a8
	rst 38h			;f5a9
	rst 38h			;f5aa
	rst 38h			;f5ab
	rst 38h			;f5ac
	rst 38h			;f5ad
	rst 38h			;f5ae
	rst 38h			;f5af
	rst 38h			;f5b0
	rst 38h			;f5b1
	rst 38h			;f5b2
	rst 38h			;f5b3
	rst 38h			;f5b4
	rst 38h			;f5b5
	rst 38h			;f5b6
	rst 38h			;f5b7
	rst 38h			;f5b8
	rst 38h			;f5b9
	rst 38h			;f5ba
	rst 38h			;f5bb
	rst 38h			;f5bc
	rst 38h			;f5bd
	rst 38h			;f5be
	rst 38h			;f5bf
	rst 38h			;f5c0
	rst 38h			;f5c1
	rst 38h			;f5c2
	rst 38h			;f5c3
	rst 38h			;f5c4
	rst 38h			;f5c5
	rst 38h			;f5c6
	rst 38h			;f5c7
	rst 38h			;f5c8
	rst 38h			;f5c9
	rst 38h			;f5ca
	rst 38h			;f5cb
	rst 38h			;f5cc
	rst 38h			;f5cd
	rst 38h			;f5ce
	rst 38h			;f5cf
	rst 38h			;f5d0
	rst 38h			;f5d1
	rst 38h			;f5d2
	rst 38h			;f5d3
	rst 38h			;f5d4
	rst 38h			;f5d5
	rst 38h			;f5d6
	rst 38h			;f5d7
	rst 38h			;f5d8
	rst 38h			;f5d9
	rst 38h			;f5da
	rst 38h			;f5db
	rst 38h			;f5dc
	rst 38h			;f5dd
	rst 38h			;f5de
	rst 38h			;f5df
	rst 38h			;f5e0
	rst 38h			;f5e1
	rst 38h			;f5e2
	rst 38h			;f5e3
	rst 38h			;f5e4
	rst 38h			;f5e5
lf5e6h:
	rst 38h			;f5e6
	rst 38h			;f5e7
	rst 38h			;f5e8
	rst 38h			;f5e9
	rst 38h			;f5ea
	rst 38h			;f5eb
	rst 38h			;f5ec
	rst 38h			;f5ed
	rst 38h			;f5ee
	rst 38h			;f5ef
	rst 38h			;f5f0
	rst 38h			;f5f1
	rst 38h			;f5f2
	rst 38h			;f5f3
	rst 38h			;f5f4
	rst 38h			;f5f5
	rst 38h			;f5f6
	rst 38h			;f5f7
	rst 38h			;f5f8
	rst 38h			;f5f9
	rst 38h			;f5fa
	rst 38h			;f5fb
	rst 38h			;f5fc
	rst 38h			;f5fd
	rst 38h			;f5fe
	rst 38h			;f5ff
	rst 38h			;f600
	rst 38h			;f601
	rst 38h			;f602
	rst 38h			;f603
	rst 38h			;f604
	rst 38h			;f605
	rst 38h			;f606
	rst 38h			;f607
	rst 38h			;f608
	rst 38h			;f609
	rst 38h			;f60a
	rst 38h			;f60b
	rst 38h			;f60c
	rst 38h			;f60d
	rst 38h			;f60e
	rst 38h			;f60f
	rst 38h			;f610
	rst 38h			;f611
	rst 38h			;f612
	rst 38h			;f613
	rst 38h			;f614
	rst 38h			;f615
	rst 38h			;f616
	rst 38h			;f617
	rst 38h			;f618
	rst 38h			;f619
	rst 38h			;f61a
	rst 38h			;f61b
	rst 38h			;f61c
	rst 38h			;f61d
	rst 38h			;f61e
	rst 38h			;f61f
	rst 38h			;f620
	rst 38h			;f621
	rst 38h			;f622
	rst 38h			;f623
	rst 38h			;f624
	rst 38h			;f625
	rst 38h			;f626
	rst 38h			;f627
	rst 38h			;f628
	rst 38h			;f629
	rst 38h			;f62a
	rst 38h			;f62b
	rst 38h			;f62c
	rst 38h			;f62d
	rst 38h			;f62e
	rst 38h			;f62f
	rst 38h			;f630
	rst 38h			;f631
	rst 38h			;f632
	rst 38h			;f633
	rst 38h			;f634
	rst 38h			;f635
	rst 38h			;f636
	rst 38h			;f637
	rst 38h			;f638
	rst 38h			;f639
	rst 38h			;f63a
	rst 38h			;f63b
	rst 38h			;f63c
	rst 38h			;f63d
	rst 38h			;f63e
	rst 38h			;f63f
	rst 38h			;f640
	rst 38h			;f641
	rst 38h			;f642
	rst 38h			;f643
	rst 38h			;f644
	rst 38h			;f645
	rst 38h			;f646
	rst 38h			;f647
	rst 38h			;f648
	rst 38h			;f649
	rst 38h			;f64a
	rst 38h			;f64b
	rst 38h			;f64c
	rst 38h			;f64d
	rst 38h			;f64e
	rst 38h			;f64f
	rst 38h			;f650
	rst 38h			;f651
	rst 38h			;f652
	rst 38h			;f653
	rst 38h			;f654
	rst 38h			;f655
	rst 38h			;f656
	rst 38h			;f657
	rst 38h			;f658
	rst 38h			;f659
	rst 38h			;f65a
	rst 38h			;f65b
	rst 38h			;f65c
	rst 38h			;f65d
	rst 38h			;f65e
	rst 38h			;f65f
	rst 38h			;f660
	rst 38h			;f661
	rst 38h			;f662
	rst 38h			;f663
	rst 38h			;f664
	rst 38h			;f665
	rst 38h			;f666
	rst 38h			;f667
	rst 38h			;f668
	rst 38h			;f669
	rst 38h			;f66a
	rst 38h			;f66b
	rst 38h			;f66c
	rst 38h			;f66d
	rst 38h			;f66e
	rst 38h			;f66f
	rst 38h			;f670
	rst 38h			;f671
	rst 38h			;f672
	rst 38h			;f673
	rst 38h			;f674
	rst 38h			;f675
	rst 38h			;f676
	rst 38h			;f677
	rst 38h			;f678
	rst 38h			;f679
	rst 38h			;f67a
	rst 38h			;f67b
	rst 38h			;f67c
	rst 38h			;f67d
	rst 38h			;f67e
	rst 38h			;f67f
	rst 38h			;f680
	rst 38h			;f681
	rst 38h			;f682
	rst 38h			;f683
	rst 38h			;f684
	rst 38h			;f685
	rst 38h			;f686
	rst 38h			;f687
	rst 38h			;f688
	rst 38h			;f689
	rst 38h			;f68a
	rst 38h			;f68b
	rst 38h			;f68c
	rst 38h			;f68d
	rst 38h			;f68e
	rst 38h			;f68f
	rst 38h			;f690
	rst 38h			;f691
	rst 38h			;f692
	rst 38h			;f693
	rst 38h			;f694
	rst 38h			;f695
	rst 38h			;f696
	rst 38h			;f697
	rst 38h			;f698
	rst 38h			;f699
	rst 38h			;f69a
	rst 38h			;f69b
	rst 38h			;f69c
	rst 38h			;f69d
	rst 38h			;f69e
	rst 38h			;f69f
	rst 38h			;f6a0
	rst 38h			;f6a1
	rst 38h			;f6a2
	rst 38h			;f6a3
	rst 38h			;f6a4
	rst 38h			;f6a5
	rst 38h			;f6a6
	rst 38h			;f6a7
	rst 38h			;f6a8
	rst 38h			;f6a9
	rst 38h			;f6aa
	rst 38h			;f6ab
	rst 38h			;f6ac
	rst 38h			;f6ad
	rst 38h			;f6ae
	rst 38h			;f6af
	rst 38h			;f6b0
	rst 38h			;f6b1
	rst 38h			;f6b2
	rst 38h			;f6b3
	rst 38h			;f6b4
	rst 38h			;f6b5
	rst 38h			;f6b6
	rst 38h			;f6b7
	rst 38h			;f6b8
	rst 38h			;f6b9
	rst 38h			;f6ba
	rst 38h			;f6bb
	rst 38h			;f6bc
	rst 38h			;f6bd
	rst 38h			;f6be
	rst 38h			;f6bf
	rst 38h			;f6c0
	rst 38h			;f6c1
	rst 38h			;f6c2
	rst 38h			;f6c3
	rst 38h			;f6c4
	rst 38h			;f6c5
	rst 38h			;f6c6
	rst 38h			;f6c7
	rst 38h			;f6c8
	rst 38h			;f6c9
	rst 38h			;f6ca
	rst 38h			;f6cb
	rst 38h			;f6cc
	rst 38h			;f6cd
	rst 38h			;f6ce
	rst 38h			;f6cf
	rst 38h			;f6d0
	rst 38h			;f6d1
	rst 38h			;f6d2
	rst 38h			;f6d3
	rst 38h			;f6d4
	rst 38h			;f6d5
	rst 38h			;f6d6
	rst 38h			;f6d7
	rst 38h			;f6d8
	rst 38h			;f6d9
	rst 38h			;f6da
	rst 38h			;f6db
	rst 38h			;f6dc
	rst 38h			;f6dd
	rst 38h			;f6de
	rst 38h			;f6df
	rst 38h			;f6e0
	rst 38h			;f6e1
	rst 38h			;f6e2
	rst 38h			;f6e3
	rst 38h			;f6e4
	rst 38h			;f6e5
lf6e6h:
	rst 38h			;f6e6
	rst 38h			;f6e7
	rst 38h			;f6e8
	rst 38h			;f6e9
	rst 38h			;f6ea
	rst 38h			;f6eb
	rst 38h			;f6ec
	rst 38h			;f6ed
	rst 38h			;f6ee
	rst 38h			;f6ef
	rst 38h			;f6f0
	rst 38h			;f6f1
	rst 38h			;f6f2
	rst 38h			;f6f3
	rst 38h			;f6f4
	rst 38h			;f6f5
	rst 38h			;f6f6
	rst 38h			;f6f7
	rst 38h			;f6f8
	rst 38h			;f6f9
	rst 38h			;f6fa
	rst 38h			;f6fb
	rst 38h			;f6fc
	rst 38h			;f6fd
	rst 38h			;f6fe
	rst 38h			;f6ff
lf700h:
	rst 38h			;f700
	rst 38h			;f701
	rst 38h			;f702
	rst 38h			;f703
	rst 38h			;f704
	rst 38h			;f705
	rst 38h			;f706
	rst 38h			;f707
	rst 38h			;f708
	rst 38h			;f709
	rst 38h			;f70a
	rst 38h			;f70b
	rst 38h			;f70c
	rst 38h			;f70d
	rst 38h			;f70e
	rst 38h			;f70f
	rst 38h			;f710
	rst 38h			;f711
	rst 38h			;f712
	rst 38h			;f713
	rst 38h			;f714
	rst 38h			;f715
	rst 38h			;f716
	rst 38h			;f717
	rst 38h			;f718
	rst 38h			;f719
	rst 38h			;f71a
	rst 38h			;f71b
	rst 38h			;f71c
	rst 38h			;f71d
	rst 38h			;f71e
	rst 38h			;f71f
	rst 38h			;f720
	rst 38h			;f721
	rst 38h			;f722
	rst 38h			;f723
	rst 38h			;f724
	rst 38h			;f725
	rst 38h			;f726
	rst 38h			;f727
	rst 38h			;f728
	rst 38h			;f729
	rst 38h			;f72a
	rst 38h			;f72b
	rst 38h			;f72c
	rst 38h			;f72d
	rst 38h			;f72e
	rst 38h			;f72f
	rst 38h			;f730
	rst 38h			;f731
	rst 38h			;f732
	rst 38h			;f733
	rst 38h			;f734
	rst 38h			;f735
	rst 38h			;f736
	rst 38h			;f737
	rst 38h			;f738
	rst 38h			;f739
	rst 38h			;f73a
	rst 38h			;f73b
	rst 38h			;f73c
	rst 38h			;f73d
	rst 38h			;f73e
	rst 38h			;f73f
	rst 38h			;f740
	rst 38h			;f741
	rst 38h			;f742
	rst 38h			;f743
	rst 38h			;f744
	rst 38h			;f745
	rst 38h			;f746
	rst 38h			;f747
	rst 38h			;f748
	rst 38h			;f749
	rst 38h			;f74a
	rst 38h			;f74b
	rst 38h			;f74c
	rst 38h			;f74d
	rst 38h			;f74e
	rst 38h			;f74f
	rst 38h			;f750
	rst 38h			;f751
	rst 38h			;f752
	rst 38h			;f753
	rst 38h			;f754
	rst 38h			;f755
	rst 38h			;f756
	rst 38h			;f757
	rst 38h			;f758
	rst 38h			;f759
	rst 38h			;f75a
	rst 38h			;f75b
	rst 38h			;f75c
	rst 38h			;f75d
	rst 38h			;f75e
	rst 38h			;f75f
	rst 38h			;f760
	rst 38h			;f761
	rst 38h			;f762
	rst 38h			;f763
	rst 38h			;f764
	rst 38h			;f765
	rst 38h			;f766
	rst 38h			;f767
	rst 38h			;f768
	rst 38h			;f769
	rst 38h			;f76a
	rst 38h			;f76b
	rst 38h			;f76c
	rst 38h			;f76d
	rst 38h			;f76e
	rst 38h			;f76f
	rst 38h			;f770
	rst 38h			;f771
	rst 38h			;f772
	rst 38h			;f773
	rst 38h			;f774
	rst 38h			;f775
	rst 38h			;f776
	rst 38h			;f777
	rst 38h			;f778
	rst 38h			;f779
	rst 38h			;f77a
	rst 38h			;f77b
	rst 38h			;f77c
	rst 38h			;f77d
	rst 38h			;f77e
	rst 38h			;f77f
	rst 38h			;f780
	rst 38h			;f781
	rst 38h			;f782
	rst 38h			;f783
	rst 38h			;f784
	rst 38h			;f785
	rst 38h			;f786
	rst 38h			;f787
	rst 38h			;f788
	rst 38h			;f789
	rst 38h			;f78a
	rst 38h			;f78b
	rst 38h			;f78c
	rst 38h			;f78d
	rst 38h			;f78e
	rst 38h			;f78f
	rst 38h			;f790
	rst 38h			;f791
	rst 38h			;f792
	rst 38h			;f793
	rst 38h			;f794
	rst 38h			;f795
	rst 38h			;f796
	rst 38h			;f797
	rst 38h			;f798
	rst 38h			;f799
	rst 38h			;f79a
	rst 38h			;f79b
	rst 38h			;f79c
	rst 38h			;f79d
	rst 38h			;f79e
	rst 38h			;f79f
	rst 38h			;f7a0
	rst 38h			;f7a1
	rst 38h			;f7a2
	rst 38h			;f7a3
	rst 38h			;f7a4
	rst 38h			;f7a5
	rst 38h			;f7a6
	rst 38h			;f7a7
	rst 38h			;f7a8
	rst 38h			;f7a9
	rst 38h			;f7aa
	rst 38h			;f7ab
	rst 38h			;f7ac
	rst 38h			;f7ad
	rst 38h			;f7ae
	rst 38h			;f7af
	rst 38h			;f7b0
	rst 38h			;f7b1
	rst 38h			;f7b2
	rst 38h			;f7b3
	rst 38h			;f7b4
	rst 38h			;f7b5
	rst 38h			;f7b6
	rst 38h			;f7b7
	rst 38h			;f7b8
	rst 38h			;f7b9
	rst 38h			;f7ba
	rst 38h			;f7bb
	rst 38h			;f7bc
	rst 38h			;f7bd
	rst 38h			;f7be
	rst 38h			;f7bf
	rst 38h			;f7c0
	rst 38h			;f7c1
	rst 38h			;f7c2
	rst 38h			;f7c3
	rst 38h			;f7c4
	rst 38h			;f7c5
	rst 38h			;f7c6
	rst 38h			;f7c7
	rst 38h			;f7c8
	rst 38h			;f7c9
	rst 38h			;f7ca
	rst 38h			;f7cb
	rst 38h			;f7cc
	rst 38h			;f7cd
	rst 38h			;f7ce
	rst 38h			;f7cf
	rst 38h			;f7d0
	rst 38h			;f7d1
	rst 38h			;f7d2
	rst 38h			;f7d3
	rst 38h			;f7d4
	rst 38h			;f7d5
	rst 38h			;f7d6
	rst 38h			;f7d7
	rst 38h			;f7d8
	rst 38h			;f7d9
	rst 38h			;f7da
	rst 38h			;f7db
	rst 38h			;f7dc
	rst 38h			;f7dd
	rst 38h			;f7de
	rst 38h			;f7df
	rst 38h			;f7e0
	rst 38h			;f7e1
	rst 38h			;f7e2
	rst 38h			;f7e3
	rst 38h			;f7e4
	rst 38h			;f7e5
	rst 38h			;f7e6
	rst 38h			;f7e7
	rst 38h			;f7e8
	rst 38h			;f7e9
	rst 38h			;f7ea
	rst 38h			;f7eb
	rst 38h			;f7ec
	rst 38h			;f7ed
	rst 38h			;f7ee
	rst 38h			;f7ef
	rst 38h			;f7f0
	rst 38h			;f7f1
	rst 38h			;f7f2
	rst 38h			;f7f3
	rst 38h			;f7f4
	rst 38h			;f7f5
	rst 38h			;f7f6
	rst 38h			;f7f7
	rst 38h			;f7f8
	rst 38h			;f7f9
	rst 38h			;f7fa
	rst 38h			;f7fb
	rst 38h			;f7fc
	rst 38h			;f7fd
	rst 38h			;f7fe
	rst 38h			;f7ff
	rst 38h			;f800
	rst 38h			;f801
	rst 38h			;f802
	rst 38h			;f803
	rst 38h			;f804
	rst 38h			;f805
	rst 38h			;f806
	rst 38h			;f807
	rst 38h			;f808
	rst 38h			;f809
	rst 38h			;f80a
	rst 38h			;f80b
	rst 38h			;f80c
	rst 38h			;f80d
	rst 38h			;f80e
	rst 38h			;f80f
	rst 38h			;f810
	rst 38h			;f811
	rst 38h			;f812
	rst 38h			;f813
	rst 38h			;f814
	rst 38h			;f815
	rst 38h			;f816
	rst 38h			;f817
	rst 38h			;f818
	rst 38h			;f819
	rst 38h			;f81a
	rst 38h			;f81b
	rst 38h			;f81c
	rst 38h			;f81d
	rst 38h			;f81e
	rst 38h			;f81f
	rst 38h			;f820
	rst 38h			;f821
	rst 38h			;f822
	rst 38h			;f823
	rst 38h			;f824
	rst 38h			;f825
	rst 38h			;f826
	rst 38h			;f827
	rst 38h			;f828
	rst 38h			;f829
	rst 38h			;f82a
	rst 38h			;f82b
	rst 38h			;f82c
	rst 38h			;f82d
	rst 38h			;f82e
	rst 38h			;f82f
	rst 38h			;f830
	rst 38h			;f831
	rst 38h			;f832
	rst 38h			;f833
	rst 38h			;f834
	rst 38h			;f835
	rst 38h			;f836
	rst 38h			;f837
	rst 38h			;f838
	rst 38h			;f839
	rst 38h			;f83a
	rst 38h			;f83b
	rst 38h			;f83c
	rst 38h			;f83d
	rst 38h			;f83e
	rst 38h			;f83f
	rst 38h			;f840
	rst 38h			;f841
	rst 38h			;f842
	rst 38h			;f843
	rst 38h			;f844
	rst 38h			;f845
	rst 38h			;f846
	rst 38h			;f847
	rst 38h			;f848
	rst 38h			;f849
	rst 38h			;f84a
	rst 38h			;f84b
	rst 38h			;f84c
	rst 38h			;f84d
	rst 38h			;f84e
	rst 38h			;f84f
	rst 38h			;f850
	rst 38h			;f851
	rst 38h			;f852
	rst 38h			;f853
	rst 38h			;f854
	rst 38h			;f855
	rst 38h			;f856
	rst 38h			;f857
	rst 38h			;f858
	rst 38h			;f859
	rst 38h			;f85a
	rst 38h			;f85b
	rst 38h			;f85c
	rst 38h			;f85d
	rst 38h			;f85e
	rst 38h			;f85f
	rst 38h			;f860
	rst 38h			;f861
	rst 38h			;f862
	rst 38h			;f863
	rst 38h			;f864
	rst 38h			;f865
	rst 38h			;f866
	rst 38h			;f867
	rst 38h			;f868
	rst 38h			;f869
	rst 38h			;f86a
	rst 38h			;f86b
	rst 38h			;f86c
	rst 38h			;f86d
	rst 38h			;f86e
	rst 38h			;f86f
	rst 38h			;f870
	rst 38h			;f871
	rst 38h			;f872
	rst 38h			;f873
	rst 38h			;f874
	rst 38h			;f875
	rst 38h			;f876
	rst 38h			;f877
	rst 38h			;f878
	rst 38h			;f879
	rst 38h			;f87a
	rst 38h			;f87b
	rst 38h			;f87c
	rst 38h			;f87d
	rst 38h			;f87e
	rst 38h			;f87f
	rst 38h			;f880
	rst 38h			;f881
	rst 38h			;f882
	rst 38h			;f883
	rst 38h			;f884
	rst 38h			;f885
	rst 38h			;f886
	rst 38h			;f887
	rst 38h			;f888
	rst 38h			;f889
	rst 38h			;f88a
	rst 38h			;f88b
	rst 38h			;f88c
	rst 38h			;f88d
	rst 38h			;f88e
	rst 38h			;f88f
	rst 38h			;f890
	rst 38h			;f891
	rst 38h			;f892
	rst 38h			;f893
	rst 38h			;f894
	rst 38h			;f895
	rst 38h			;f896
	rst 38h			;f897
	rst 38h			;f898
	rst 38h			;f899
	rst 38h			;f89a
	rst 38h			;f89b
	rst 38h			;f89c
	rst 38h			;f89d
	rst 38h			;f89e
	rst 38h			;f89f
	rst 38h			;f8a0
	rst 38h			;f8a1
	rst 38h			;f8a2
	rst 38h			;f8a3
	rst 38h			;f8a4
	rst 38h			;f8a5
	rst 38h			;f8a6
	rst 38h			;f8a7
	rst 38h			;f8a8
	rst 38h			;f8a9
	rst 38h			;f8aa
	rst 38h			;f8ab
	rst 38h			;f8ac
	rst 38h			;f8ad
	rst 38h			;f8ae
	rst 38h			;f8af
	rst 38h			;f8b0
	rst 38h			;f8b1
	rst 38h			;f8b2
	rst 38h			;f8b3
	rst 38h			;f8b4
	rst 38h			;f8b5
	rst 38h			;f8b6
	rst 38h			;f8b7
	rst 38h			;f8b8
	rst 38h			;f8b9
	rst 38h			;f8ba
	rst 38h			;f8bb
	rst 38h			;f8bc
	rst 38h			;f8bd
	rst 38h			;f8be
	rst 38h			;f8bf
	rst 38h			;f8c0
	rst 38h			;f8c1
	rst 38h			;f8c2
	rst 38h			;f8c3
	rst 38h			;f8c4
	rst 38h			;f8c5
	rst 38h			;f8c6
	rst 38h			;f8c7
	rst 38h			;f8c8
	rst 38h			;f8c9
	rst 38h			;f8ca
	rst 38h			;f8cb
	rst 38h			;f8cc
	rst 38h			;f8cd
	rst 38h			;f8ce
	rst 38h			;f8cf
	rst 38h			;f8d0
	rst 38h			;f8d1
	rst 38h			;f8d2
	rst 38h			;f8d3
	rst 38h			;f8d4
	rst 38h			;f8d5
	rst 38h			;f8d6
	rst 38h			;f8d7
	rst 38h			;f8d8
	rst 38h			;f8d9
	rst 38h			;f8da
	rst 38h			;f8db
	rst 38h			;f8dc
	rst 38h			;f8dd
	rst 38h			;f8de
	rst 38h			;f8df
	rst 38h			;f8e0
	rst 38h			;f8e1
	rst 38h			;f8e2
	rst 38h			;f8e3
	rst 38h			;f8e4
	rst 38h			;f8e5
	rst 38h			;f8e6
	rst 38h			;f8e7
	rst 38h			;f8e8
	rst 38h			;f8e9
	rst 38h			;f8ea
	rst 38h			;f8eb
	rst 38h			;f8ec
	rst 38h			;f8ed
	rst 38h			;f8ee
	rst 38h			;f8ef
sub_f8f0h:
	rst 38h			;f8f0
	rst 38h			;f8f1
	rst 38h			;f8f2
	rst 38h			;f8f3
	rst 38h			;f8f4
	rst 38h			;f8f5
	rst 38h			;f8f6
	rst 38h			;f8f7
sub_f8f8h:
	rst 38h			;f8f8
	rst 38h			;f8f9
	rst 38h			;f8fa
	rst 38h			;f8fb
sub_f8fch:
	rst 38h			;f8fc
	rst 38h			;f8fd
lf8feh:
	rst 38h			;f8fe
	rst 38h			;f8ff
	rst 38h			;f900
	rst 38h			;f901
	rst 38h			;f902
	rst 38h			;f903
	rst 38h			;f904
	rst 38h			;f905
	rst 38h			;f906
	rst 38h			;f907
	rst 38h			;f908
	rst 38h			;f909
	rst 38h			;f90a
	rst 38h			;f90b
	rst 38h			;f90c
	rst 38h			;f90d
	rst 38h			;f90e
	rst 38h			;f90f
	rst 38h			;f910
	rst 38h			;f911
	rst 38h			;f912
	rst 38h			;f913
	rst 38h			;f914
	rst 38h			;f915
	rst 38h			;f916
	rst 38h			;f917
	rst 38h			;f918
	rst 38h			;f919
	rst 38h			;f91a
	rst 38h			;f91b
	rst 38h			;f91c
	rst 38h			;f91d
	rst 38h			;f91e
	rst 38h			;f91f
	rst 38h			;f920
	rst 38h			;f921
	rst 38h			;f922
	rst 38h			;f923
	rst 38h			;f924
	rst 38h			;f925
	rst 38h			;f926
	rst 38h			;f927
	rst 38h			;f928
	rst 38h			;f929
	rst 38h			;f92a
	rst 38h			;f92b
	rst 38h			;f92c
	rst 38h			;f92d
	rst 38h			;f92e
	rst 38h			;f92f
	rst 38h			;f930
	rst 38h			;f931
	rst 38h			;f932
	rst 38h			;f933
	rst 38h			;f934
	rst 38h			;f935
	rst 38h			;f936
	rst 38h			;f937
	rst 38h			;f938
	rst 38h			;f939
	rst 38h			;f93a
	rst 38h			;f93b
	rst 38h			;f93c
	rst 38h			;f93d
	rst 38h			;f93e
	rst 38h			;f93f
	rst 38h			;f940
	rst 38h			;f941
	rst 38h			;f942
	rst 38h			;f943
	rst 38h			;f944
	rst 38h			;f945
	rst 38h			;f946
	rst 38h			;f947
	rst 38h			;f948
	rst 38h			;f949
	rst 38h			;f94a
	rst 38h			;f94b
	rst 38h			;f94c
	rst 38h			;f94d
	rst 38h			;f94e
	rst 38h			;f94f
	rst 38h			;f950
	rst 38h			;f951
	rst 38h			;f952
	rst 38h			;f953
	rst 38h			;f954
	rst 38h			;f955
	rst 38h			;f956
	rst 38h			;f957
	rst 38h			;f958
	rst 38h			;f959
	rst 38h			;f95a
	rst 38h			;f95b
	rst 38h			;f95c
	rst 38h			;f95d
	rst 38h			;f95e
	rst 38h			;f95f
	rst 38h			;f960
	rst 38h			;f961
	rst 38h			;f962
	rst 38h			;f963
	rst 38h			;f964
	rst 38h			;f965
	rst 38h			;f966
	rst 38h			;f967
	rst 38h			;f968
	rst 38h			;f969
	rst 38h			;f96a
	rst 38h			;f96b
	rst 38h			;f96c
	rst 38h			;f96d
	rst 38h			;f96e
	rst 38h			;f96f
	rst 38h			;f970
	rst 38h			;f971
	rst 38h			;f972
	rst 38h			;f973
	rst 38h			;f974
	rst 38h			;f975
	rst 38h			;f976
	rst 38h			;f977
	rst 38h			;f978
	rst 38h			;f979
	rst 38h			;f97a
	rst 38h			;f97b
	rst 38h			;f97c
	rst 38h			;f97d
	rst 38h			;f97e
	rst 38h			;f97f
	rst 38h			;f980
	rst 38h			;f981
	rst 38h			;f982
	rst 38h			;f983
	rst 38h			;f984
	rst 38h			;f985
	rst 38h			;f986
	rst 38h			;f987
	rst 38h			;f988
	rst 38h			;f989
	rst 38h			;f98a
	rst 38h			;f98b
	rst 38h			;f98c
	rst 38h			;f98d
	rst 38h			;f98e
	rst 38h			;f98f
	rst 38h			;f990
	rst 38h			;f991
	rst 38h			;f992
	rst 38h			;f993
	rst 38h			;f994
	rst 38h			;f995
	rst 38h			;f996
	rst 38h			;f997
	rst 38h			;f998
	rst 38h			;f999
	rst 38h			;f99a
	rst 38h			;f99b
	rst 38h			;f99c
	rst 38h			;f99d
	rst 38h			;f99e
	rst 38h			;f99f
	rst 38h			;f9a0
	rst 38h			;f9a1
	rst 38h			;f9a2
	rst 38h			;f9a3
	rst 38h			;f9a4
	rst 38h			;f9a5
	rst 38h			;f9a6
	rst 38h			;f9a7
	rst 38h			;f9a8
	rst 38h			;f9a9
	rst 38h			;f9aa
	rst 38h			;f9ab
	rst 38h			;f9ac
	rst 38h			;f9ad
	rst 38h			;f9ae
	rst 38h			;f9af
	rst 38h			;f9b0
	rst 38h			;f9b1
	rst 38h			;f9b2
	rst 38h			;f9b3
	rst 38h			;f9b4
	rst 38h			;f9b5
	rst 38h			;f9b6
	rst 38h			;f9b7
	rst 38h			;f9b8
	rst 38h			;f9b9
	rst 38h			;f9ba
	rst 38h			;f9bb
	rst 38h			;f9bc
	rst 38h			;f9bd
	rst 38h			;f9be
	rst 38h			;f9bf
	rst 38h			;f9c0
	rst 38h			;f9c1
	rst 38h			;f9c2
	rst 38h			;f9c3
	rst 38h			;f9c4
	rst 38h			;f9c5
	rst 38h			;f9c6
	rst 38h			;f9c7
	rst 38h			;f9c8
	rst 38h			;f9c9
	rst 38h			;f9ca
	rst 38h			;f9cb
	rst 38h			;f9cc
	rst 38h			;f9cd
	rst 38h			;f9ce
	rst 38h			;f9cf
	rst 38h			;f9d0
	rst 38h			;f9d1
	rst 38h			;f9d2
	rst 38h			;f9d3
	rst 38h			;f9d4
	rst 38h			;f9d5
	rst 38h			;f9d6
	rst 38h			;f9d7
	rst 38h			;f9d8
	rst 38h			;f9d9
	rst 38h			;f9da
	rst 38h			;f9db
	rst 38h			;f9dc
	rst 38h			;f9dd
	rst 38h			;f9de
	rst 38h			;f9df
	rst 38h			;f9e0
	rst 38h			;f9e1
	rst 38h			;f9e2
	rst 38h			;f9e3
lf9e4h:
	rst 38h			;f9e4
	rst 38h			;f9e5
	rst 38h			;f9e6
	rst 38h			;f9e7
	rst 38h			;f9e8
	rst 38h			;f9e9
	rst 38h			;f9ea
	rst 38h			;f9eb
	rst 38h			;f9ec
	rst 38h			;f9ed
	rst 38h			;f9ee
	rst 38h			;f9ef
	rst 38h			;f9f0
	rst 38h			;f9f1
	rst 38h			;f9f2
	rst 38h			;f9f3
	rst 38h			;f9f4
	rst 38h			;f9f5
	rst 38h			;f9f6
	rst 38h			;f9f7
sub_f9f8h:
	rst 38h			;f9f8
	rst 38h			;f9f9
	rst 38h			;f9fa
	rst 38h			;f9fb
	rst 38h			;f9fc
	rst 38h			;f9fd
	rst 38h			;f9fe
sub_f9ffh:
	rst 38h			;f9ff
	rst 38h			;fa00
	rst 38h			;fa01
	rst 38h			;fa02
	rst 38h			;fa03
	rst 38h			;fa04
	rst 38h			;fa05
	rst 38h			;fa06
	rst 38h			;fa07
	rst 38h			;fa08
	rst 38h			;fa09
	rst 38h			;fa0a
	rst 38h			;fa0b
	rst 38h			;fa0c
	rst 38h			;fa0d
	rst 38h			;fa0e
	rst 38h			;fa0f
	rst 38h			;fa10
	rst 38h			;fa11
	rst 38h			;fa12
	rst 38h			;fa13
	rst 38h			;fa14
	rst 38h			;fa15
	rst 38h			;fa16
	rst 38h			;fa17
	rst 38h			;fa18
	rst 38h			;fa19
	rst 38h			;fa1a
	rst 38h			;fa1b
	rst 38h			;fa1c
	rst 38h			;fa1d
	rst 38h			;fa1e
	rst 38h			;fa1f
	rst 38h			;fa20
	rst 38h			;fa21
	rst 38h			;fa22
	rst 38h			;fa23
	rst 38h			;fa24
	rst 38h			;fa25
	rst 38h			;fa26
	rst 38h			;fa27
	rst 38h			;fa28
	rst 38h			;fa29
	rst 38h			;fa2a
	rst 38h			;fa2b
	rst 38h			;fa2c
	rst 38h			;fa2d
	rst 38h			;fa2e
	rst 38h			;fa2f
	rst 38h			;fa30
	rst 38h			;fa31
	rst 38h			;fa32
	rst 38h			;fa33
	rst 38h			;fa34
	rst 38h			;fa35
	rst 38h			;fa36
	rst 38h			;fa37
	rst 38h			;fa38
	rst 38h			;fa39
	rst 38h			;fa3a
	rst 38h			;fa3b
	rst 38h			;fa3c
	rst 38h			;fa3d
	rst 38h			;fa3e
	rst 38h			;fa3f
	rst 38h			;fa40
	rst 38h			;fa41
	rst 38h			;fa42
	rst 38h			;fa43
	rst 38h			;fa44
	rst 38h			;fa45
	rst 38h			;fa46
	rst 38h			;fa47
	rst 38h			;fa48
	rst 38h			;fa49
	rst 38h			;fa4a
	rst 38h			;fa4b
	rst 38h			;fa4c
	rst 38h			;fa4d
	rst 38h			;fa4e
	rst 38h			;fa4f
	rst 38h			;fa50
	rst 38h			;fa51
	rst 38h			;fa52
	rst 38h			;fa53
	rst 38h			;fa54
	rst 38h			;fa55
	rst 38h			;fa56
	rst 38h			;fa57
	rst 38h			;fa58
	rst 38h			;fa59
	rst 38h			;fa5a
	rst 38h			;fa5b
	rst 38h			;fa5c
	rst 38h			;fa5d
	rst 38h			;fa5e
	rst 38h			;fa5f
	rst 38h			;fa60
	rst 38h			;fa61
	rst 38h			;fa62
	rst 38h			;fa63
	rst 38h			;fa64
	rst 38h			;fa65
	rst 38h			;fa66
	rst 38h			;fa67
	rst 38h			;fa68
	rst 38h			;fa69
	rst 38h			;fa6a
	rst 38h			;fa6b
	rst 38h			;fa6c
	rst 38h			;fa6d
	rst 38h			;fa6e
	rst 38h			;fa6f
	rst 38h			;fa70
	rst 38h			;fa71
	rst 38h			;fa72
	rst 38h			;fa73
	rst 38h			;fa74
	rst 38h			;fa75
	rst 38h			;fa76
	rst 38h			;fa77
	rst 38h			;fa78
	rst 38h			;fa79
	rst 38h			;fa7a
	rst 38h			;fa7b
	rst 38h			;fa7c
	rst 38h			;fa7d
	rst 38h			;fa7e
	rst 38h			;fa7f
	rst 38h			;fa80
	rst 38h			;fa81
	rst 38h			;fa82
	rst 38h			;fa83
	rst 38h			;fa84
	rst 38h			;fa85
	rst 38h			;fa86
	rst 38h			;fa87
	rst 38h			;fa88
	rst 38h			;fa89
	rst 38h			;fa8a
	rst 38h			;fa8b
	rst 38h			;fa8c
	rst 38h			;fa8d
	rst 38h			;fa8e
	rst 38h			;fa8f
	rst 38h			;fa90
	rst 38h			;fa91
	rst 38h			;fa92
	rst 38h			;fa93
	rst 38h			;fa94
	rst 38h			;fa95
	rst 38h			;fa96
	rst 38h			;fa97
	rst 38h			;fa98
	rst 38h			;fa99
	rst 38h			;fa9a
	rst 38h			;fa9b
	rst 38h			;fa9c
	rst 38h			;fa9d
	rst 38h			;fa9e
	rst 38h			;fa9f
	rst 38h			;faa0
	rst 38h			;faa1
	rst 38h			;faa2
	rst 38h			;faa3
	rst 38h			;faa4
	rst 38h			;faa5
	rst 38h			;faa6
	rst 38h			;faa7
	rst 38h			;faa8
	rst 38h			;faa9
	rst 38h			;faaa
	rst 38h			;faab
	rst 38h			;faac
	rst 38h			;faad
	rst 38h			;faae
	rst 38h			;faaf
	rst 38h			;fab0
	rst 38h			;fab1
	rst 38h			;fab2
	rst 38h			;fab3
	rst 38h			;fab4
	rst 38h			;fab5
	rst 38h			;fab6
	rst 38h			;fab7
	rst 38h			;fab8
	rst 38h			;fab9
	rst 38h			;faba
	rst 38h			;fabb
	rst 38h			;fabc
	rst 38h			;fabd
	rst 38h			;fabe
	rst 38h			;fabf
	rst 38h			;fac0
	rst 38h			;fac1
	rst 38h			;fac2
	rst 38h			;fac3
	rst 38h			;fac4
	rst 38h			;fac5
	rst 38h			;fac6
	rst 38h			;fac7
	rst 38h			;fac8
	rst 38h			;fac9
	rst 38h			;faca
	rst 38h			;facb
	rst 38h			;facc
	rst 38h			;facd
	rst 38h			;face
	rst 38h			;facf
	rst 38h			;fad0
	rst 38h			;fad1
	rst 38h			;fad2
	rst 38h			;fad3
	rst 38h			;fad4
	rst 38h			;fad5
	rst 38h			;fad6
	rst 38h			;fad7
	rst 38h			;fad8
	rst 38h			;fad9
	rst 38h			;fada
	rst 38h			;fadb
	rst 38h			;fadc
	rst 38h			;fadd
	rst 38h			;fade
	rst 38h			;fadf
	rst 38h			;fae0
	rst 38h			;fae1
	rst 38h			;fae2
	rst 38h			;fae3
	rst 38h			;fae4
	rst 38h			;fae5
	rst 38h			;fae6
	rst 38h			;fae7
	rst 38h			;fae8
	rst 38h			;fae9
	rst 38h			;faea
	rst 38h			;faeb
	rst 38h			;faec
	rst 38h			;faed
	rst 38h			;faee
	rst 38h			;faef
	rst 38h			;faf0
	rst 38h			;faf1
	rst 38h			;faf2
	rst 38h			;faf3
	rst 38h			;faf4
	rst 38h			;faf5
	rst 38h			;faf6
	rst 38h			;faf7
	rst 38h			;faf8
	rst 38h			;faf9
	rst 38h			;fafa
	rst 38h			;fafb
	rst 38h			;fafc
	rst 38h			;fafd
sub_fafeh:
	rst 38h			;fafe
	rst 38h			;faff
	rst 38h			;fb00
	rst 38h			;fb01
	rst 38h			;fb02
	rst 38h			;fb03
	rst 38h			;fb04
	rst 38h			;fb05
	rst 38h			;fb06
	rst 38h			;fb07
	rst 38h			;fb08
	rst 38h			;fb09
	rst 38h			;fb0a
	rst 38h			;fb0b
	rst 38h			;fb0c
	rst 38h			;fb0d
	rst 38h			;fb0e
	rst 38h			;fb0f
	rst 38h			;fb10
	rst 38h			;fb11
	rst 38h			;fb12
	rst 38h			;fb13
	rst 38h			;fb14
	rst 38h			;fb15
	rst 38h			;fb16
	rst 38h			;fb17
	rst 38h			;fb18
	rst 38h			;fb19
	rst 38h			;fb1a
	rst 38h			;fb1b
	rst 38h			;fb1c
	rst 38h			;fb1d
	rst 38h			;fb1e
	rst 38h			;fb1f
	rst 38h			;fb20
	rst 38h			;fb21
	rst 38h			;fb22
	rst 38h			;fb23
	rst 38h			;fb24
	rst 38h			;fb25
	rst 38h			;fb26
	rst 38h			;fb27
	rst 38h			;fb28
	rst 38h			;fb29
	rst 38h			;fb2a
	rst 38h			;fb2b
	rst 38h			;fb2c
	rst 38h			;fb2d
	rst 38h			;fb2e
	rst 38h			;fb2f
	rst 38h			;fb30
	rst 38h			;fb31
	rst 38h			;fb32
	rst 38h			;fb33
	rst 38h			;fb34
	rst 38h			;fb35
	rst 38h			;fb36
	rst 38h			;fb37
	rst 38h			;fb38
	rst 38h			;fb39
	rst 38h			;fb3a
	rst 38h			;fb3b
	rst 38h			;fb3c
	rst 38h			;fb3d
	rst 38h			;fb3e
	rst 38h			;fb3f
	rst 38h			;fb40
	rst 38h			;fb41
	rst 38h			;fb42
	rst 38h			;fb43
	rst 38h			;fb44
	rst 38h			;fb45
	rst 38h			;fb46
	rst 38h			;fb47
	rst 38h			;fb48
	rst 38h			;fb49
	rst 38h			;fb4a
	rst 38h			;fb4b
	rst 38h			;fb4c
	rst 38h			;fb4d
	rst 38h			;fb4e
	rst 38h			;fb4f
	rst 38h			;fb50
	rst 38h			;fb51
	rst 38h			;fb52
	rst 38h			;fb53
	rst 38h			;fb54
	rst 38h			;fb55
	rst 38h			;fb56
	rst 38h			;fb57
	rst 38h			;fb58
	rst 38h			;fb59
	rst 38h			;fb5a
	rst 38h			;fb5b
	rst 38h			;fb5c
	rst 38h			;fb5d
	rst 38h			;fb5e
	rst 38h			;fb5f
	rst 38h			;fb60
	rst 38h			;fb61
	rst 38h			;fb62
	rst 38h			;fb63
	rst 38h			;fb64
	rst 38h			;fb65
	rst 38h			;fb66
	rst 38h			;fb67
	rst 38h			;fb68
	rst 38h			;fb69
	rst 38h			;fb6a
	rst 38h			;fb6b
	rst 38h			;fb6c
	rst 38h			;fb6d
	rst 38h			;fb6e
	rst 38h			;fb6f
	rst 38h			;fb70
	rst 38h			;fb71
	rst 38h			;fb72
	rst 38h			;fb73
	rst 38h			;fb74
	rst 38h			;fb75
	rst 38h			;fb76
	rst 38h			;fb77
	rst 38h			;fb78
	rst 38h			;fb79
	rst 38h			;fb7a
	rst 38h			;fb7b
	rst 38h			;fb7c
	rst 38h			;fb7d
	rst 38h			;fb7e
	rst 38h			;fb7f
	rst 38h			;fb80
	rst 38h			;fb81
	rst 38h			;fb82
	rst 38h			;fb83
	rst 38h			;fb84
	rst 38h			;fb85
	rst 38h			;fb86
	rst 38h			;fb87
	rst 38h			;fb88
	rst 38h			;fb89
	rst 38h			;fb8a
	rst 38h			;fb8b
	rst 38h			;fb8c
	rst 38h			;fb8d
	rst 38h			;fb8e
	rst 38h			;fb8f
	rst 38h			;fb90
	rst 38h			;fb91
	rst 38h			;fb92
	rst 38h			;fb93
	rst 38h			;fb94
	rst 38h			;fb95
	rst 38h			;fb96
	rst 38h			;fb97
	rst 38h			;fb98
	rst 38h			;fb99
	rst 38h			;fb9a
	rst 38h			;fb9b
	rst 38h			;fb9c
	rst 38h			;fb9d
	rst 38h			;fb9e
	rst 38h			;fb9f
	rst 38h			;fba0
	rst 38h			;fba1
	rst 38h			;fba2
	rst 38h			;fba3
	rst 38h			;fba4
	rst 38h			;fba5
	rst 38h			;fba6
	rst 38h			;fba7
	rst 38h			;fba8
	rst 38h			;fba9
	rst 38h			;fbaa
	rst 38h			;fbab
	rst 38h			;fbac
	rst 38h			;fbad
	rst 38h			;fbae
	rst 38h			;fbaf
	rst 38h			;fbb0
	rst 38h			;fbb1
	rst 38h			;fbb2
	rst 38h			;fbb3
	rst 38h			;fbb4
	rst 38h			;fbb5
	rst 38h			;fbb6
	rst 38h			;fbb7
	rst 38h			;fbb8
	rst 38h			;fbb9
	rst 38h			;fbba
	rst 38h			;fbbb
	rst 38h			;fbbc
	rst 38h			;fbbd
	rst 38h			;fbbe
	rst 38h			;fbbf
	rst 38h			;fbc0
	rst 38h			;fbc1
	rst 38h			;fbc2
	rst 38h			;fbc3
	rst 38h			;fbc4
	rst 38h			;fbc5
	rst 38h			;fbc6
	rst 38h			;fbc7
	rst 38h			;fbc8
	rst 38h			;fbc9
	rst 38h			;fbca
	rst 38h			;fbcb
	rst 38h			;fbcc
	rst 38h			;fbcd
	rst 38h			;fbce
	rst 38h			;fbcf
	rst 38h			;fbd0
	rst 38h			;fbd1
	rst 38h			;fbd2
	rst 38h			;fbd3
	rst 38h			;fbd4
	rst 38h			;fbd5
	rst 38h			;fbd6
	rst 38h			;fbd7
	rst 38h			;fbd8
	rst 38h			;fbd9
	rst 38h			;fbda
	rst 38h			;fbdb
	rst 38h			;fbdc
	rst 38h			;fbdd
	rst 38h			;fbde
	rst 38h			;fbdf
	rst 38h			;fbe0
	rst 38h			;fbe1
	rst 38h			;fbe2
	rst 38h			;fbe3
	rst 38h			;fbe4
	rst 38h			;fbe5
	rst 38h			;fbe6
	rst 38h			;fbe7
	rst 38h			;fbe8
	rst 38h			;fbe9
	rst 38h			;fbea
	rst 38h			;fbeb
	rst 38h			;fbec
	rst 38h			;fbed
	rst 38h			;fbee
	rst 38h			;fbef
	rst 38h			;fbf0
	rst 38h			;fbf1
	rst 38h			;fbf2
	rst 38h			;fbf3
	rst 38h			;fbf4
	rst 38h			;fbf5
	rst 38h			;fbf6
	rst 38h			;fbf7
	rst 38h			;fbf8
	rst 38h			;fbf9
	rst 38h			;fbfa
	rst 38h			;fbfb
	rst 38h			;fbfc
	rst 38h			;fbfd
	rst 38h			;fbfe
	rst 38h			;fbff
	rst 38h			;fc00
	rst 38h			;fc01
	rst 38h			;fc02
	rst 38h			;fc03
	rst 38h			;fc04
	rst 38h			;fc05
	rst 38h			;fc06
	rst 38h			;fc07
	rst 38h			;fc08
	rst 38h			;fc09
	rst 38h			;fc0a
	rst 38h			;fc0b
	rst 38h			;fc0c
	rst 38h			;fc0d
	rst 38h			;fc0e
	rst 38h			;fc0f
	rst 38h			;fc10
	rst 38h			;fc11
	rst 38h			;fc12
	rst 38h			;fc13
	rst 38h			;fc14
	rst 38h			;fc15
	rst 38h			;fc16
	rst 38h			;fc17
	rst 38h			;fc18
	rst 38h			;fc19
	rst 38h			;fc1a
	rst 38h			;fc1b
	rst 38h			;fc1c
	rst 38h			;fc1d
	rst 38h			;fc1e
	rst 38h			;fc1f
	rst 38h			;fc20
	rst 38h			;fc21
	rst 38h			;fc22
	rst 38h			;fc23
	rst 38h			;fc24
	rst 38h			;fc25
	rst 38h			;fc26
	rst 38h			;fc27
	rst 38h			;fc28
	rst 38h			;fc29
	rst 38h			;fc2a
	rst 38h			;fc2b
	rst 38h			;fc2c
	rst 38h			;fc2d
	rst 38h			;fc2e
	rst 38h			;fc2f
	rst 38h			;fc30
	rst 38h			;fc31
	rst 38h			;fc32
	rst 38h			;fc33
	rst 38h			;fc34
	rst 38h			;fc35
	rst 38h			;fc36
	rst 38h			;fc37
	rst 38h			;fc38
	rst 38h			;fc39
	rst 38h			;fc3a
	rst 38h			;fc3b
	rst 38h			;fc3c
	rst 38h			;fc3d
	rst 38h			;fc3e
	rst 38h			;fc3f
	rst 38h			;fc40
	rst 38h			;fc41
	rst 38h			;fc42
	rst 38h			;fc43
lfc44h:
	rst 38h			;fc44
	rst 38h			;fc45
	rst 38h			;fc46
	rst 38h			;fc47
	rst 38h			;fc48
	rst 38h			;fc49
	rst 38h			;fc4a
	rst 38h			;fc4b
	rst 38h			;fc4c
	rst 38h			;fc4d
	rst 38h			;fc4e
	rst 38h			;fc4f
	rst 38h			;fc50
	rst 38h			;fc51
	rst 38h			;fc52
	rst 38h			;fc53
	rst 38h			;fc54
	rst 38h			;fc55
	rst 38h			;fc56
	rst 38h			;fc57
	rst 38h			;fc58
	rst 38h			;fc59
	rst 38h			;fc5a
	rst 38h			;fc5b
	rst 38h			;fc5c
	rst 38h			;fc5d
	rst 38h			;fc5e
	rst 38h			;fc5f
	rst 38h			;fc60
	rst 38h			;fc61
	rst 38h			;fc62
	rst 38h			;fc63
	rst 38h			;fc64
	rst 38h			;fc65
	rst 38h			;fc66
	rst 38h			;fc67
	rst 38h			;fc68
	rst 38h			;fc69
	rst 38h			;fc6a
	rst 38h			;fc6b
	rst 38h			;fc6c
	rst 38h			;fc6d
	rst 38h			;fc6e
	rst 38h			;fc6f
	rst 38h			;fc70
	rst 38h			;fc71
	rst 38h			;fc72
	rst 38h			;fc73
	rst 38h			;fc74
	rst 38h			;fc75
	rst 38h			;fc76
	rst 38h			;fc77
	rst 38h			;fc78
	rst 38h			;fc79
	rst 38h			;fc7a
	rst 38h			;fc7b
	rst 38h			;fc7c
	rst 38h			;fc7d
	rst 38h			;fc7e
	rst 38h			;fc7f
	rst 38h			;fc80
	rst 38h			;fc81
	rst 38h			;fc82
	rst 38h			;fc83
	rst 38h			;fc84
	rst 38h			;fc85
	rst 38h			;fc86
	rst 38h			;fc87
	rst 38h			;fc88
	rst 38h			;fc89
	rst 38h			;fc8a
	rst 38h			;fc8b
	rst 38h			;fc8c
	rst 38h			;fc8d
	rst 38h			;fc8e
	rst 38h			;fc8f
	rst 38h			;fc90
	rst 38h			;fc91
	rst 38h			;fc92
	rst 38h			;fc93
	rst 38h			;fc94
	rst 38h			;fc95
	rst 38h			;fc96
	rst 38h			;fc97
	rst 38h			;fc98
	rst 38h			;fc99
	rst 38h			;fc9a
	rst 38h			;fc9b
	rst 38h			;fc9c
	rst 38h			;fc9d
	rst 38h			;fc9e
	rst 38h			;fc9f
	rst 38h			;fca0
	rst 38h			;fca1
	rst 38h			;fca2
	rst 38h			;fca3
	rst 38h			;fca4
	rst 38h			;fca5
	rst 38h			;fca6
	rst 38h			;fca7
	rst 38h			;fca8
	rst 38h			;fca9
	rst 38h			;fcaa
	rst 38h			;fcab
	rst 38h			;fcac
	rst 38h			;fcad
	rst 38h			;fcae
	rst 38h			;fcaf
	rst 38h			;fcb0
	rst 38h			;fcb1
	rst 38h			;fcb2
	rst 38h			;fcb3
	rst 38h			;fcb4
	rst 38h			;fcb5
	rst 38h			;fcb6
	rst 38h			;fcb7
	rst 38h			;fcb8
	rst 38h			;fcb9
	rst 38h			;fcba
	rst 38h			;fcbb
	rst 38h			;fcbc
	rst 38h			;fcbd
	rst 38h			;fcbe
	rst 38h			;fcbf
sub_fcc0h:
	rst 38h			;fcc0
	rst 38h			;fcc1
	rst 38h			;fcc2
	rst 38h			;fcc3
	rst 38h			;fcc4
	rst 38h			;fcc5
	rst 38h			;fcc6
	rst 38h			;fcc7
	rst 38h			;fcc8
	rst 38h			;fcc9
	rst 38h			;fcca
	rst 38h			;fccb
	rst 38h			;fccc
	rst 38h			;fccd
	rst 38h			;fcce
	rst 38h			;fccf
	rst 38h			;fcd0
	rst 38h			;fcd1
	rst 38h			;fcd2
	rst 38h			;fcd3
	rst 38h			;fcd4
	rst 38h			;fcd5
	rst 38h			;fcd6
	rst 38h			;fcd7
	rst 38h			;fcd8
	rst 38h			;fcd9
	rst 38h			;fcda
	rst 38h			;fcdb
	rst 38h			;fcdc
	rst 38h			;fcdd
	rst 38h			;fcde
	rst 38h			;fcdf
	rst 38h			;fce0
	rst 38h			;fce1
	rst 38h			;fce2
	rst 38h			;fce3
	rst 38h			;fce4
lfce5h:
	rst 38h			;fce5
	rst 38h			;fce6
	rst 38h			;fce7
	rst 38h			;fce8
	rst 38h			;fce9
	rst 38h			;fcea
	rst 38h			;fceb
sub_fcech:
	rst 38h			;fcec
	rst 38h			;fced
	rst 38h			;fcee
	rst 38h			;fcef
	rst 38h			;fcf0
	rst 38h			;fcf1
	rst 38h			;fcf2
	rst 38h			;fcf3
	rst 38h			;fcf4
	rst 38h			;fcf5
	rst 38h			;fcf6
	rst 38h			;fcf7
sub_fcf8h:
	rst 38h			;fcf8
	rst 38h			;fcf9
	rst 38h			;fcfa
lfcfbh:
	rst 38h			;fcfb
sub_fcfch:
	rst 38h			;fcfc
	rst 38h			;fcfd
	rst 38h			;fcfe
	rst 38h			;fcff
	rst 38h			;fd00
	rst 38h			;fd01
	rst 38h			;fd02
	rst 38h			;fd03
	rst 38h			;fd04
	rst 38h			;fd05
	rst 38h			;fd06
	rst 38h			;fd07
	rst 38h			;fd08
	rst 38h			;fd09
	rst 38h			;fd0a
	rst 38h			;fd0b
	rst 38h			;fd0c
	rst 38h			;fd0d
	rst 38h			;fd0e
	rst 38h			;fd0f
	rst 38h			;fd10
	rst 38h			;fd11
	rst 38h			;fd12
	rst 38h			;fd13
	rst 38h			;fd14
	rst 38h			;fd15
	rst 38h			;fd16
	rst 38h			;fd17
	rst 38h			;fd18
	rst 38h			;fd19
	rst 38h			;fd1a
	rst 38h			;fd1b
	rst 38h			;fd1c
	rst 38h			;fd1d
	rst 38h			;fd1e
	rst 38h			;fd1f
	rst 38h			;fd20
	rst 38h			;fd21
	rst 38h			;fd22
	rst 38h			;fd23
	rst 38h			;fd24
	rst 38h			;fd25
	rst 38h			;fd26
	rst 38h			;fd27
	rst 38h			;fd28
	rst 38h			;fd29
	rst 38h			;fd2a
	rst 38h			;fd2b
	rst 38h			;fd2c
	rst 38h			;fd2d
	rst 38h			;fd2e
	rst 38h			;fd2f
	rst 38h			;fd30
	rst 38h			;fd31
	rst 38h			;fd32
	rst 38h			;fd33
	rst 38h			;fd34
	rst 38h			;fd35
	rst 38h			;fd36
	rst 38h			;fd37
	rst 38h			;fd38
	rst 38h			;fd39
	rst 38h			;fd3a
	rst 38h			;fd3b
	rst 38h			;fd3c
	rst 38h			;fd3d
	rst 38h			;fd3e
	rst 38h			;fd3f
	rst 38h			;fd40
	rst 38h			;fd41
	rst 38h			;fd42
	rst 38h			;fd43
	rst 38h			;fd44
	rst 38h			;fd45
	rst 38h			;fd46
	rst 38h			;fd47
	rst 38h			;fd48
	rst 38h			;fd49
	rst 38h			;fd4a
	rst 38h			;fd4b
	rst 38h			;fd4c
	rst 38h			;fd4d
	rst 38h			;fd4e
	rst 38h			;fd4f
	rst 38h			;fd50
	rst 38h			;fd51
	rst 38h			;fd52
	rst 38h			;fd53
	rst 38h			;fd54
	rst 38h			;fd55
	rst 38h			;fd56
	rst 38h			;fd57
	rst 38h			;fd58
	rst 38h			;fd59
	rst 38h			;fd5a
	rst 38h			;fd5b
	rst 38h			;fd5c
	rst 38h			;fd5d
	rst 38h			;fd5e
	rst 38h			;fd5f
	rst 38h			;fd60
	rst 38h			;fd61
	rst 38h			;fd62
	rst 38h			;fd63
	rst 38h			;fd64
	rst 38h			;fd65
	rst 38h			;fd66
	rst 38h			;fd67
	rst 38h			;fd68
	rst 38h			;fd69
	rst 38h			;fd6a
	rst 38h			;fd6b
	rst 38h			;fd6c
	rst 38h			;fd6d
	rst 38h			;fd6e
	rst 38h			;fd6f
	rst 38h			;fd70
	rst 38h			;fd71
	rst 38h			;fd72
	rst 38h			;fd73
	rst 38h			;fd74
	rst 38h			;fd75
	rst 38h			;fd76
	rst 38h			;fd77
	rst 38h			;fd78
	rst 38h			;fd79
	rst 38h			;fd7a
	rst 38h			;fd7b
	rst 38h			;fd7c
	rst 38h			;fd7d
	rst 38h			;fd7e
	rst 38h			;fd7f
lfd80h:
	rst 38h			;fd80
	rst 38h			;fd81
	rst 38h			;fd82
	rst 38h			;fd83
	rst 38h			;fd84
	rst 38h			;fd85
	rst 38h			;fd86
	rst 38h			;fd87
	rst 38h			;fd88
	rst 38h			;fd89
	rst 38h			;fd8a
	rst 38h			;fd8b
	rst 38h			;fd8c
	rst 38h			;fd8d
	rst 38h			;fd8e
	rst 38h			;fd8f
	rst 38h			;fd90
	rst 38h			;fd91
	rst 38h			;fd92
	rst 38h			;fd93
	rst 38h			;fd94
	rst 38h			;fd95
	rst 38h			;fd96
	rst 38h			;fd97
	rst 38h			;fd98
	rst 38h			;fd99
	rst 38h			;fd9a
	rst 38h			;fd9b
	rst 38h			;fd9c
	rst 38h			;fd9d
	rst 38h			;fd9e
	rst 38h			;fd9f
	rst 38h			;fda0
	rst 38h			;fda1
	rst 38h			;fda2
	rst 38h			;fda3
	rst 38h			;fda4
	rst 38h			;fda5
	rst 38h			;fda6
	rst 38h			;fda7
	rst 38h			;fda8
	rst 38h			;fda9
	rst 38h			;fdaa
	rst 38h			;fdab
	rst 38h			;fdac
	rst 38h			;fdad
	rst 38h			;fdae
	rst 38h			;fdaf
	rst 38h			;fdb0
	rst 38h			;fdb1
	rst 38h			;fdb2
	rst 38h			;fdb3
	rst 38h			;fdb4
	rst 38h			;fdb5
	rst 38h			;fdb6
	rst 38h			;fdb7
	rst 38h			;fdb8
	rst 38h			;fdb9
	rst 38h			;fdba
	rst 38h			;fdbb
	rst 38h			;fdbc
	rst 38h			;fdbd
	rst 38h			;fdbe
	rst 38h			;fdbf
	rst 38h			;fdc0
	rst 38h			;fdc1
	rst 38h			;fdc2
	rst 38h			;fdc3
	rst 38h			;fdc4
	rst 38h			;fdc5
	rst 38h			;fdc6
	rst 38h			;fdc7
	rst 38h			;fdc8
	rst 38h			;fdc9
	rst 38h			;fdca
	rst 38h			;fdcb
	rst 38h			;fdcc
	rst 38h			;fdcd
	rst 38h			;fdce
	rst 38h			;fdcf
	rst 38h			;fdd0
	rst 38h			;fdd1
	rst 38h			;fdd2
	rst 38h			;fdd3
	rst 38h			;fdd4
	rst 38h			;fdd5
	rst 38h			;fdd6
	rst 38h			;fdd7
	rst 38h			;fdd8
	rst 38h			;fdd9
	rst 38h			;fdda
	rst 38h			;fddb
	rst 38h			;fddc
	rst 38h			;fddd
	rst 38h			;fdde
	rst 38h			;fddf
	rst 38h			;fde0
	rst 38h			;fde1
	rst 38h			;fde2
	rst 38h			;fde3
	rst 38h			;fde4
	rst 38h			;fde5
	rst 38h			;fde6
	rst 38h			;fde7
	rst 38h			;fde8
	rst 38h			;fde9
	rst 38h			;fdea
	rst 38h			;fdeb
	rst 38h			;fdec
	rst 38h			;fded
	rst 38h			;fdee
	rst 38h			;fdef
	rst 38h			;fdf0
	rst 38h			;fdf1
	rst 38h			;fdf2
	rst 38h			;fdf3
	rst 38h			;fdf4
	rst 38h			;fdf5
	rst 38h			;fdf6
sub_fdf7h:
	rst 38h			;fdf7
	rst 38h			;fdf8
	rst 38h			;fdf9
	rst 38h			;fdfa
	rst 38h			;fdfb
	rst 38h			;fdfc
	rst 38h			;fdfd
	rst 38h			;fdfe
	rst 38h			;fdff
	rst 38h			;fe00
	rst 38h			;fe01
	rst 38h			;fe02
	rst 38h			;fe03
	rst 38h			;fe04
	rst 38h			;fe05
	rst 38h			;fe06
	rst 38h			;fe07
	rst 38h			;fe08
	rst 38h			;fe09
	rst 38h			;fe0a
	rst 38h			;fe0b
	rst 38h			;fe0c
	rst 38h			;fe0d
	rst 38h			;fe0e
	rst 38h			;fe0f
	rst 38h			;fe10
	rst 38h			;fe11
	rst 38h			;fe12
	rst 38h			;fe13
	rst 38h			;fe14
	rst 38h			;fe15
	rst 38h			;fe16
	rst 38h			;fe17
	rst 38h			;fe18
	rst 38h			;fe19
	rst 38h			;fe1a
	rst 38h			;fe1b
	rst 38h			;fe1c
	rst 38h			;fe1d
	rst 38h			;fe1e
	rst 38h			;fe1f
	rst 38h			;fe20
	rst 38h			;fe21
	rst 38h			;fe22
	rst 38h			;fe23
	rst 38h			;fe24
	rst 38h			;fe25
	rst 38h			;fe26
	rst 38h			;fe27
	rst 38h			;fe28
	rst 38h			;fe29
	rst 38h			;fe2a
	rst 38h			;fe2b
	rst 38h			;fe2c
	rst 38h			;fe2d
	rst 38h			;fe2e
	rst 38h			;fe2f
	rst 38h			;fe30
	rst 38h			;fe31
	rst 38h			;fe32
	rst 38h			;fe33
	rst 38h			;fe34
	rst 38h			;fe35
	rst 38h			;fe36
	rst 38h			;fe37
	rst 38h			;fe38
	rst 38h			;fe39
	rst 38h			;fe3a
	rst 38h			;fe3b
	rst 38h			;fe3c
	rst 38h			;fe3d
	rst 38h			;fe3e
	rst 38h			;fe3f
	rst 38h			;fe40
	rst 38h			;fe41
	rst 38h			;fe42
	rst 38h			;fe43
	rst 38h			;fe44
	rst 38h			;fe45
	rst 38h			;fe46
	rst 38h			;fe47
	rst 38h			;fe48
	rst 38h			;fe49
	rst 38h			;fe4a
	rst 38h			;fe4b
	rst 38h			;fe4c
	rst 38h			;fe4d
	rst 38h			;fe4e
	rst 38h			;fe4f
	rst 38h			;fe50
	rst 38h			;fe51
	rst 38h			;fe52
	rst 38h			;fe53
	rst 38h			;fe54
	rst 38h			;fe55
	rst 38h			;fe56
	rst 38h			;fe57
	rst 38h			;fe58
	rst 38h			;fe59
	rst 38h			;fe5a
	rst 38h			;fe5b
	rst 38h			;fe5c
	rst 38h			;fe5d
	rst 38h			;fe5e
	rst 38h			;fe5f
	rst 38h			;fe60
	rst 38h			;fe61
	rst 38h			;fe62
	rst 38h			;fe63
	rst 38h			;fe64
	rst 38h			;fe65
	rst 38h			;fe66
	rst 38h			;fe67
	rst 38h			;fe68
	rst 38h			;fe69
	rst 38h			;fe6a
	rst 38h			;fe6b
	rst 38h			;fe6c
	rst 38h			;fe6d
	rst 38h			;fe6e
	rst 38h			;fe6f
	rst 38h			;fe70
	rst 38h			;fe71
	rst 38h			;fe72
	rst 38h			;fe73
	rst 38h			;fe74
	rst 38h			;fe75
	rst 38h			;fe76
	rst 38h			;fe77
	rst 38h			;fe78
	rst 38h			;fe79
	rst 38h			;fe7a
	rst 38h			;fe7b
	rst 38h			;fe7c
	rst 38h			;fe7d
	rst 38h			;fe7e
	rst 38h			;fe7f
	rst 38h			;fe80
	rst 38h			;fe81
	rst 38h			;fe82
	rst 38h			;fe83
	rst 38h			;fe84
	rst 38h			;fe85
	rst 38h			;fe86
	rst 38h			;fe87
	rst 38h			;fe88
	rst 38h			;fe89
	rst 38h			;fe8a
	rst 38h			;fe8b
	rst 38h			;fe8c
	rst 38h			;fe8d
	rst 38h			;fe8e
	rst 38h			;fe8f
	rst 38h			;fe90
	rst 38h			;fe91
	rst 38h			;fe92
	rst 38h			;fe93
	rst 38h			;fe94
	rst 38h			;fe95
	rst 38h			;fe96
	rst 38h			;fe97
	rst 38h			;fe98
	rst 38h			;fe99
	rst 38h			;fe9a
	rst 38h			;fe9b
	rst 38h			;fe9c
	rst 38h			;fe9d
	rst 38h			;fe9e
	rst 38h			;fe9f
	rst 38h			;fea0
	rst 38h			;fea1
	rst 38h			;fea2
	rst 38h			;fea3
	rst 38h			;fea4
	rst 38h			;fea5
	rst 38h			;fea6
	rst 38h			;fea7
	rst 38h			;fea8
	rst 38h			;fea9
	rst 38h			;feaa
	rst 38h			;feab
	rst 38h			;feac
	rst 38h			;fead
	rst 38h			;feae
	rst 38h			;feaf
	rst 38h			;feb0
	rst 38h			;feb1
	rst 38h			;feb2
	rst 38h			;feb3
	rst 38h			;feb4
	rst 38h			;feb5
	rst 38h			;feb6
	rst 38h			;feb7
	rst 38h			;feb8
	rst 38h			;feb9
	rst 38h			;feba
	rst 38h			;febb
	rst 38h			;febc
	rst 38h			;febd
	rst 38h			;febe
	rst 38h			;febf
	rst 38h			;fec0
	rst 38h			;fec1
	rst 38h			;fec2
	rst 38h			;fec3
	rst 38h			;fec4
	rst 38h			;fec5
	rst 38h			;fec6
	rst 38h			;fec7
	rst 38h			;fec8
	rst 38h			;fec9
	rst 38h			;feca
	rst 38h			;fecb
	rst 38h			;fecc
	rst 38h			;fecd
	rst 38h			;fece
	rst 38h			;fecf
	rst 38h			;fed0
	rst 38h			;fed1
	rst 38h			;fed2
	rst 38h			;fed3
	rst 38h			;fed4
	rst 38h			;fed5
	rst 38h			;fed6
	rst 38h			;fed7
	rst 38h			;fed8
	rst 38h			;fed9
	rst 38h			;feda
	rst 38h			;fedb
	rst 38h			;fedc
	rst 38h			;fedd
	rst 38h			;fede
	rst 38h			;fedf
	rst 38h			;fee0
	rst 38h			;fee1
	rst 38h			;fee2
	rst 38h			;fee3
	rst 38h			;fee4
	rst 38h			;fee5
	rst 38h			;fee6
	rst 38h			;fee7
	rst 38h			;fee8
	rst 38h			;fee9
	rst 38h			;feea
	rst 38h			;feeb
	rst 38h			;feec
	rst 38h			;feed
	rst 38h			;feee
	rst 38h			;feef
	rst 38h			;fef0
	rst 38h			;fef1
	rst 38h			;fef2
	rst 38h			;fef3
	rst 38h			;fef4
	rst 38h			;fef5
	rst 38h			;fef6
	rst 38h			;fef7
	rst 38h			;fef8
	rst 38h			;fef9
	rst 38h			;fefa
lfefbh:
	rst 38h			;fefb
sub_fefch:
	rst 38h			;fefc
	rst 38h			;fefd
sub_fefeh:
	rst 38h			;fefe
	rst 38h			;feff
lff00h:
	rst 38h			;ff00
	rst 38h			;ff01
	rst 38h			;ff02
lff03h:
	rst 38h			;ff03
	rst 38h			;ff04
	rst 38h			;ff05
	rst 38h			;ff06
lff07h:
	rst 38h			;ff07
	rst 38h			;ff08
	rst 38h			;ff09
	rst 38h			;ff0a
	rst 38h			;ff0b
	rst 38h			;ff0c
	rst 38h			;ff0d
sub_ff0eh:
	rst 38h			;ff0e
	rst 38h			;ff0f
	rst 38h			;ff10
	rst 38h			;ff11
	rst 38h			;ff12
	rst 38h			;ff13
	rst 38h			;ff14
	rst 38h			;ff15
	rst 38h			;ff16
	rst 38h			;ff17
	rst 38h			;ff18
	rst 38h			;ff19
	rst 38h			;ff1a
	rst 38h			;ff1b
	rst 38h			;ff1c
	rst 38h			;ff1d
	rst 38h			;ff1e
	rst 38h			;ff1f
	rst 38h			;ff20
	rst 38h			;ff21
	rst 38h			;ff22
	rst 38h			;ff23
	rst 38h			;ff24
	rst 38h			;ff25
	rst 38h			;ff26
	rst 38h			;ff27
	rst 38h			;ff28
	rst 38h			;ff29
	rst 38h			;ff2a
	rst 38h			;ff2b
	rst 38h			;ff2c
	rst 38h			;ff2d
	rst 38h			;ff2e
	rst 38h			;ff2f
lff30h:
	rst 38h			;ff30
	rst 38h			;ff31
	rst 38h			;ff32
	rst 38h			;ff33
	rst 38h			;ff34
	rst 38h			;ff35
	rst 38h			;ff36
	rst 38h			;ff37
	rst 38h			;ff38
	rst 38h			;ff39
	rst 38h			;ff3a
	rst 38h			;ff3b
	rst 38h			;ff3c
	rst 38h			;ff3d
	rst 38h			;ff3e
	rst 38h			;ff3f
	rst 38h			;ff40
	rst 38h			;ff41
	rst 38h			;ff42
	rst 38h			;ff43
	rst 38h			;ff44
	rst 38h			;ff45
	rst 38h			;ff46
	rst 38h			;ff47
	rst 38h			;ff48
	rst 38h			;ff49
	rst 38h			;ff4a
	rst 38h			;ff4b
	rst 38h			;ff4c
	rst 38h			;ff4d
	rst 38h			;ff4e
	rst 38h			;ff4f
	rst 38h			;ff50
	rst 38h			;ff51
	rst 38h			;ff52
	rst 38h			;ff53
	rst 38h			;ff54
	rst 38h			;ff55
	rst 38h			;ff56
	rst 38h			;ff57
	rst 38h			;ff58
	rst 38h			;ff59
	rst 38h			;ff5a
	rst 38h			;ff5b
	rst 38h			;ff5c
	rst 38h			;ff5d
	rst 38h			;ff5e
	rst 38h			;ff5f
	rst 38h			;ff60
	rst 38h			;ff61
	rst 38h			;ff62
	rst 38h			;ff63
	rst 38h			;ff64
	rst 38h			;ff65
	rst 38h			;ff66
	rst 38h			;ff67
	rst 38h			;ff68
	rst 38h			;ff69
	rst 38h			;ff6a
	rst 38h			;ff6b
	rst 38h			;ff6c
	rst 38h			;ff6d
	rst 38h			;ff6e
	rst 38h			;ff6f
	rst 38h			;ff70
	rst 38h			;ff71
	rst 38h			;ff72
	rst 38h			;ff73
	rst 38h			;ff74
	rst 38h			;ff75
	rst 38h			;ff76
	rst 38h			;ff77
	rst 38h			;ff78
	rst 38h			;ff79
	rst 38h			;ff7a
	rst 38h			;ff7b
	rst 38h			;ff7c
	rst 38h			;ff7d
	rst 38h			;ff7e
	rst 38h			;ff7f
	rst 38h			;ff80
	rst 38h			;ff81
	rst 38h			;ff82
lff83h:
	rst 38h			;ff83
lff84h:
	rst 38h			;ff84
	rst 38h			;ff85
	rst 38h			;ff86
	rst 38h			;ff87
	rst 38h			;ff88
	rst 38h			;ff89
	rst 38h			;ff8a
	rst 38h			;ff8b
	rst 38h			;ff8c
	rst 38h			;ff8d
	rst 38h			;ff8e
	rst 38h			;ff8f
	rst 38h			;ff90
	rst 38h			;ff91
	rst 38h			;ff92
	rst 38h			;ff93
	rst 38h			;ff94
	rst 38h			;ff95
	rst 38h			;ff96
lff97h:
	rst 38h			;ff97
	rst 38h			;ff98
	rst 38h			;ff99
	rst 38h			;ff9a
	rst 38h			;ff9b
	rst 38h			;ff9c
	rst 38h			;ff9d
	rst 38h			;ff9e
	rst 38h			;ff9f
	rst 38h			;ffa0
	rst 38h			;ffa1
	rst 38h			;ffa2
	rst 38h			;ffa3
	rst 38h			;ffa4
	rst 38h			;ffa5
	rst 38h			;ffa6
	rst 38h			;ffa7
	rst 38h			;ffa8
	rst 38h			;ffa9
	rst 38h			;ffaa
	rst 38h			;ffab
	rst 38h			;ffac
	rst 38h			;ffad
	rst 38h			;ffae
	rst 38h			;ffaf
	rst 38h			;ffb0
	rst 38h			;ffb1
	rst 38h			;ffb2
	rst 38h			;ffb3
	rst 38h			;ffb4
	rst 38h			;ffb5
	rst 38h			;ffb6
	rst 38h			;ffb7
	rst 38h			;ffb8
	rst 38h			;ffb9
	rst 38h			;ffba
	rst 38h			;ffbb
	rst 38h			;ffbc
	rst 38h			;ffbd
	rst 38h			;ffbe
	rst 38h			;ffbf
	rst 38h			;ffc0
	rst 38h			;ffc1
	rst 38h			;ffc2
	rst 38h			;ffc3
	rst 38h			;ffc4
	rst 38h			;ffc5
	rst 38h			;ffc6
	rst 38h			;ffc7
	rst 38h			;ffc8
	rst 38h			;ffc9
	rst 38h			;ffca
	rst 38h			;ffcb
	rst 38h			;ffcc
	rst 38h			;ffcd
	rst 38h			;ffce
	rst 38h			;ffcf
lffd0h:
	rst 38h			;ffd0
	rst 38h			;ffd1
	rst 38h			;ffd2
	rst 38h			;ffd3
	rst 38h			;ffd4
	rst 38h			;ffd5
	rst 38h			;ffd6
	rst 38h			;ffd7
	rst 38h			;ffd8
	rst 38h			;ffd9
	rst 38h			;ffda
	rst 38h			;ffdb
	rst 38h			;ffdc
	rst 38h			;ffdd
	rst 38h			;ffde
	rst 38h			;ffdf
	rst 38h			;ffe0
	rst 38h			;ffe1
	rst 38h			;ffe2
	rst 38h			;ffe3
	rst 38h			;ffe4
	rst 38h			;ffe5
	rst 38h			;ffe6
	rst 38h			;ffe7
	rst 38h			;ffe8
	rst 38h			;ffe9
	rst 38h			;ffea
	rst 38h			;ffeb
	rst 38h			;ffec
	rst 38h			;ffed
	rst 38h			;ffee
	rst 38h			;ffef
	rst 38h			;fff0
	rst 38h			;fff1
	rst 38h			;fff2
	rst 38h			;fff3
	rst 38h			;fff4
	rst 38h			;fff5
	rst 38h			;fff6
	rst 38h			;fff7
	rst 38h			;fff8
	rst 38h			;fff9
	rst 38h			;fffa
	rst 38h			;fffb
sub_fffch:
	rst 38h			;fffc
	rst 38h			;fffd
sub_fffeh:
	rst 38h			;fffe
sub_ffffh:
	rst 38h			;ffff
