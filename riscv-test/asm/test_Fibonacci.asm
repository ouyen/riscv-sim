
riscv-test/elf/test_Fibonacci.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	46c000ef          	jal	ra,10568 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11f48 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	694000ef          	jal	ra,107a8 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	6a450513          	addi	a0,a0,1700 # 106a4 <__libc_fini_array>
   10128:	5680006f          	j	10690 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	ed018193          	addi	gp,gp,-304 # 12000 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11f60 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 11f98 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	344000ef          	jal	ra,1048c <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	54450513          	addi	a0,a0,1348 # 10690 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	54c50513          	addi	a0,a0,1356 # 106a4 <__libc_fini_array>
   10160:	530000ef          	jal	ra,10690 <atexit>
   10164:	28c000ef          	jal	ra,103f0 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	23c000ef          	jal	ra,103b0 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11f60 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	7e050513          	addi	a0,a0,2016 # 117e0 <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11f60 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	addi	a1,gp,-152 # 11f68 <object.0>
   101d0:	7e050513          	addi	a0,a0,2016 # 117e0 <__FRAME_END__>
   101d4:	00000317          	auipc	t1,0x0
   101d8:	00000067          	jr	zero # 0 <exit-0x100e8>
   101dc:	00008067          	ret

00000000000101e0 <print_char>:
   101e0:	fe010113          	addi	sp,sp,-32
   101e4:	00813c23          	sd	s0,24(sp)
   101e8:	02010413          	addi	s0,sp,32
   101ec:	00050793          	mv	a5,a0
   101f0:	fef407a3          	sb	a5,-17(s0)
   101f4:	00100893          	li	a7,1
   101f8:	00000073          	ecall
   101fc:	00000013          	nop
   10200:	01813403          	ld	s0,24(sp)
   10204:	02010113          	addi	sp,sp,32
   10208:	00008067          	ret

000000000001020c <print_num>:
   1020c:	fe010113          	addi	sp,sp,-32
   10210:	00813c23          	sd	s0,24(sp)
   10214:	02010413          	addi	s0,sp,32
   10218:	00050793          	mv	a5,a0
   1021c:	fef42623          	sw	a5,-20(s0)
   10220:	00200893          	li	a7,2
   10224:	00000073          	ecall
   10228:	00000013          	nop
   1022c:	01813403          	ld	s0,24(sp)
   10230:	02010113          	addi	sp,sp,32
   10234:	00008067          	ret

0000000000010238 <exit_proc>:
   10238:	ff010113          	addi	sp,sp,-16
   1023c:	00813423          	sd	s0,8(sp)
   10240:	01010413          	addi	s0,sp,16
   10244:	00300893          	li	a7,3
   10248:	00000073          	ecall
   1024c:	00000013          	nop
   10250:	00813403          	ld	s0,8(sp)
   10254:	01010113          	addi	sp,sp,16
   10258:	00008067          	ret

000000000001025c <read_char>:
   1025c:	fe010113          	addi	sp,sp,-32
   10260:	00813c23          	sd	s0,24(sp)
   10264:	02010413          	addi	s0,sp,32
   10268:	00400893          	li	a7,4
   1026c:	00000073          	ecall
   10270:	00050793          	mv	a5,a0
   10274:	fef407a3          	sb	a5,-17(s0)
   10278:	fef44783          	lbu	a5,-17(s0)
   1027c:	00078513          	mv	a0,a5
   10280:	01813403          	ld	s0,24(sp)
   10284:	02010113          	addi	sp,sp,32
   10288:	00008067          	ret

000000000001028c <read_num>:
   1028c:	fe010113          	addi	sp,sp,-32
   10290:	00813c23          	sd	s0,24(sp)
   10294:	02010413          	addi	s0,sp,32
   10298:	00500893          	li	a7,5
   1029c:	00000073          	ecall
   102a0:	00050793          	mv	a5,a0
   102a4:	fef42623          	sw	a5,-20(s0)
   102a8:	fec42783          	lw	a5,-20(s0)
   102ac:	00078513          	mv	a0,a5
   102b0:	01813403          	ld	s0,24(sp)
   102b4:	02010113          	addi	sp,sp,32
   102b8:	00008067          	ret

00000000000102bc <print_string>:
   102bc:	fd010113          	addi	sp,sp,-48
   102c0:	02113423          	sd	ra,40(sp)
   102c4:	02813023          	sd	s0,32(sp)
   102c8:	03010413          	addi	s0,sp,48
   102cc:	fca43c23          	sd	a0,-40(s0)
   102d0:	fd843783          	ld	a5,-40(s0)
   102d4:	0007c783          	lbu	a5,0(a5)
   102d8:	fef407a3          	sb	a5,-17(s0)
   102dc:	0280006f          	j	10304 <print_string+0x48>
   102e0:	fd843783          	ld	a5,-40(s0)
   102e4:	00178793          	addi	a5,a5,1
   102e8:	fcf43c23          	sd	a5,-40(s0)
   102ec:	fef44783          	lbu	a5,-17(s0)
   102f0:	00078513          	mv	a0,a5
   102f4:	eedff0ef          	jal	ra,101e0 <print_char>
   102f8:	fd843783          	ld	a5,-40(s0)
   102fc:	0007c783          	lbu	a5,0(a5)
   10300:	fef407a3          	sb	a5,-17(s0)
   10304:	fef44783          	lbu	a5,-17(s0)
   10308:	0ff7f793          	zext.b	a5,a5
   1030c:	fc079ae3          	bnez	a5,102e0 <print_string+0x24>
   10310:	00000013          	nop
   10314:	00000013          	nop
   10318:	02813083          	ld	ra,40(sp)
   1031c:	02013403          	ld	s0,32(sp)
   10320:	03010113          	addi	sp,sp,48
   10324:	00008067          	ret

0000000000010328 <Fibonacci>:
   10328:	fd010113          	addi	sp,sp,-48
   1032c:	02113423          	sd	ra,40(sp)
   10330:	02813023          	sd	s0,32(sp)
   10334:	00913c23          	sd	s1,24(sp)
   10338:	03010413          	addi	s0,sp,48
   1033c:	00050793          	mv	a5,a0
   10340:	fcf42e23          	sw	a5,-36(s0)
   10344:	fdc42783          	lw	a5,-36(s0)
   10348:	0007871b          	sext.w	a4,a5
   1034c:	00100793          	li	a5,1
   10350:	00e7c663          	blt	a5,a4,1035c <Fibonacci+0x34>
   10354:	00100793          	li	a5,1
   10358:	0400006f          	j	10398 <Fibonacci+0x70>
   1035c:	fdc42783          	lw	a5,-36(s0)
   10360:	ffe7879b          	addiw	a5,a5,-2
   10364:	0007879b          	sext.w	a5,a5
   10368:	00078513          	mv	a0,a5
   1036c:	fbdff0ef          	jal	ra,10328 <Fibonacci>
   10370:	00050793          	mv	a5,a0
   10374:	00078493          	mv	s1,a5
   10378:	fdc42783          	lw	a5,-36(s0)
   1037c:	fff7879b          	addiw	a5,a5,-1
   10380:	0007879b          	sext.w	a5,a5
   10384:	00078513          	mv	a0,a5
   10388:	fa1ff0ef          	jal	ra,10328 <Fibonacci>
   1038c:	00050793          	mv	a5,a0
   10390:	00f487bb          	addw	a5,s1,a5
   10394:	0007879b          	sext.w	a5,a5
   10398:	00078513          	mv	a0,a5
   1039c:	02813083          	ld	ra,40(sp)
   103a0:	02013403          	ld	s0,32(sp)
   103a4:	01813483          	ld	s1,24(sp)
   103a8:	03010113          	addi	sp,sp,48
   103ac:	00008067          	ret

00000000000103b0 <main>:
   103b0:	ff010113          	addi	sp,sp,-16
   103b4:	00113423          	sd	ra,8(sp)
   103b8:	00813023          	sd	s0,0(sp)
   103bc:	01010413          	addi	s0,sp,16
   103c0:	00f00513          	li	a0,15
   103c4:	f65ff0ef          	jal	ra,10328 <Fibonacci>
   103c8:	00050793          	mv	a5,a0
   103cc:	00078513          	mv	a0,a5
   103d0:	e3dff0ef          	jal	ra,1020c <print_num>
   103d4:	e65ff0ef          	jal	ra,10238 <exit_proc>
   103d8:	00000793          	li	a5,0
   103dc:	00078513          	mv	a0,a5
   103e0:	00813083          	ld	ra,8(sp)
   103e4:	00013403          	ld	s0,0(sp)
   103e8:	01010113          	addi	sp,sp,16
   103ec:	00008067          	ret

00000000000103f0 <__libc_init_array>:
   103f0:	fe010113          	addi	sp,sp,-32
   103f4:	00813823          	sd	s0,16(sp)
   103f8:	01213023          	sd	s2,0(sp)
   103fc:	00011437          	lui	s0,0x11
   10400:	00011937          	lui	s2,0x11
   10404:	7e440793          	addi	a5,s0,2020 # 117e4 <__preinit_array_end>
   10408:	7e490913          	addi	s2,s2,2020 # 117e4 <__preinit_array_end>
   1040c:	40f90933          	sub	s2,s2,a5
   10410:	00113c23          	sd	ra,24(sp)
   10414:	00913423          	sd	s1,8(sp)
   10418:	40395913          	srai	s2,s2,0x3
   1041c:	02090063          	beqz	s2,1043c <__libc_init_array+0x4c>
   10420:	7e440413          	addi	s0,s0,2020
   10424:	00000493          	li	s1,0
   10428:	00043783          	ld	a5,0(s0)
   1042c:	00148493          	addi	s1,s1,1
   10430:	00840413          	addi	s0,s0,8
   10434:	000780e7          	jalr	a5
   10438:	fe9918e3          	bne	s2,s1,10428 <__libc_init_array+0x38>
   1043c:	00011437          	lui	s0,0x11
   10440:	00011937          	lui	s2,0x11
   10444:	7e840793          	addi	a5,s0,2024 # 117e8 <__init_array_start>
   10448:	7f890913          	addi	s2,s2,2040 # 117f8 <__do_global_dtors_aux_fini_array_entry>
   1044c:	40f90933          	sub	s2,s2,a5
   10450:	40395913          	srai	s2,s2,0x3
   10454:	02090063          	beqz	s2,10474 <__libc_init_array+0x84>
   10458:	7e840413          	addi	s0,s0,2024
   1045c:	00000493          	li	s1,0
   10460:	00043783          	ld	a5,0(s0)
   10464:	00148493          	addi	s1,s1,1
   10468:	00840413          	addi	s0,s0,8
   1046c:	000780e7          	jalr	a5
   10470:	fe9918e3          	bne	s2,s1,10460 <__libc_init_array+0x70>
   10474:	01813083          	ld	ra,24(sp)
   10478:	01013403          	ld	s0,16(sp)
   1047c:	00813483          	ld	s1,8(sp)
   10480:	00013903          	ld	s2,0(sp)
   10484:	02010113          	addi	sp,sp,32
   10488:	00008067          	ret

000000000001048c <memset>:
   1048c:	00f00313          	li	t1,15
   10490:	00050713          	mv	a4,a0
   10494:	02c37a63          	bgeu	t1,a2,104c8 <memset+0x3c>
   10498:	00f77793          	andi	a5,a4,15
   1049c:	0a079063          	bnez	a5,1053c <memset+0xb0>
   104a0:	06059e63          	bnez	a1,1051c <memset+0x90>
   104a4:	ff067693          	andi	a3,a2,-16
   104a8:	00f67613          	andi	a2,a2,15
   104ac:	00e686b3          	add	a3,a3,a4
   104b0:	00b73023          	sd	a1,0(a4)
   104b4:	00b73423          	sd	a1,8(a4)
   104b8:	01070713          	addi	a4,a4,16
   104bc:	fed76ae3          	bltu	a4,a3,104b0 <memset+0x24>
   104c0:	00061463          	bnez	a2,104c8 <memset+0x3c>
   104c4:	00008067          	ret
   104c8:	40c306b3          	sub	a3,t1,a2
   104cc:	00269693          	slli	a3,a3,0x2
   104d0:	00000297          	auipc	t0,0x0
   104d4:	005686b3          	add	a3,a3,t0
   104d8:	00c68067          	jr	12(a3)
   104dc:	00b70723          	sb	a1,14(a4)
   104e0:	00b706a3          	sb	a1,13(a4)
   104e4:	00b70623          	sb	a1,12(a4)
   104e8:	00b705a3          	sb	a1,11(a4)
   104ec:	00b70523          	sb	a1,10(a4)
   104f0:	00b704a3          	sb	a1,9(a4)
   104f4:	00b70423          	sb	a1,8(a4)
   104f8:	00b703a3          	sb	a1,7(a4)
   104fc:	00b70323          	sb	a1,6(a4)
   10500:	00b702a3          	sb	a1,5(a4)
   10504:	00b70223          	sb	a1,4(a4)
   10508:	00b701a3          	sb	a1,3(a4)
   1050c:	00b70123          	sb	a1,2(a4)
   10510:	00b700a3          	sb	a1,1(a4)
   10514:	00b70023          	sb	a1,0(a4)
   10518:	00008067          	ret
   1051c:	0ff5f593          	zext.b	a1,a1
   10520:	00859693          	slli	a3,a1,0x8
   10524:	00d5e5b3          	or	a1,a1,a3
   10528:	01059693          	slli	a3,a1,0x10
   1052c:	00d5e5b3          	or	a1,a1,a3
   10530:	02059693          	slli	a3,a1,0x20
   10534:	00d5e5b3          	or	a1,a1,a3
   10538:	f6dff06f          	j	104a4 <memset+0x18>
   1053c:	00279693          	slli	a3,a5,0x2
   10540:	00000297          	auipc	t0,0x0
   10544:	005686b3          	add	a3,a3,t0
   10548:	00008293          	mv	t0,ra
   1054c:	f98680e7          	jalr	-104(a3)
   10550:	00028093          	mv	ra,t0
   10554:	ff078793          	addi	a5,a5,-16
   10558:	40f70733          	sub	a4,a4,a5
   1055c:	00f60633          	add	a2,a2,a5
   10560:	f6c374e3          	bgeu	t1,a2,104c8 <memset+0x3c>
   10564:	f3dff06f          	j	104a0 <memset+0x14>

0000000000010568 <__call_exitprocs>:
   10568:	fb010113          	addi	sp,sp,-80
   1056c:	03413023          	sd	s4,32(sp)
   10570:	f481ba03          	ld	s4,-184(gp) # 11f48 <_global_impure_ptr>
   10574:	03213823          	sd	s2,48(sp)
   10578:	04113423          	sd	ra,72(sp)
   1057c:	1f8a3903          	ld	s2,504(s4)
   10580:	04813023          	sd	s0,64(sp)
   10584:	02913c23          	sd	s1,56(sp)
   10588:	03313423          	sd	s3,40(sp)
   1058c:	01513c23          	sd	s5,24(sp)
   10590:	01613823          	sd	s6,16(sp)
   10594:	01713423          	sd	s7,8(sp)
   10598:	01813023          	sd	s8,0(sp)
   1059c:	04090063          	beqz	s2,105dc <__call_exitprocs+0x74>
   105a0:	00050b13          	mv	s6,a0
   105a4:	00058b93          	mv	s7,a1
   105a8:	00100a93          	li	s5,1
   105ac:	fff00993          	li	s3,-1
   105b0:	00892483          	lw	s1,8(s2)
   105b4:	fff4841b          	addiw	s0,s1,-1
   105b8:	02044263          	bltz	s0,105dc <__call_exitprocs+0x74>
   105bc:	00349493          	slli	s1,s1,0x3
   105c0:	009904b3          	add	s1,s2,s1
   105c4:	040b8463          	beqz	s7,1060c <__call_exitprocs+0xa4>
   105c8:	2084b783          	ld	a5,520(s1)
   105cc:	05778063          	beq	a5,s7,1060c <__call_exitprocs+0xa4>
   105d0:	fff4041b          	addiw	s0,s0,-1
   105d4:	ff848493          	addi	s1,s1,-8
   105d8:	ff3416e3          	bne	s0,s3,105c4 <__call_exitprocs+0x5c>
   105dc:	04813083          	ld	ra,72(sp)
   105e0:	04013403          	ld	s0,64(sp)
   105e4:	03813483          	ld	s1,56(sp)
   105e8:	03013903          	ld	s2,48(sp)
   105ec:	02813983          	ld	s3,40(sp)
   105f0:	02013a03          	ld	s4,32(sp)
   105f4:	01813a83          	ld	s5,24(sp)
   105f8:	01013b03          	ld	s6,16(sp)
   105fc:	00813b83          	ld	s7,8(sp)
   10600:	00013c03          	ld	s8,0(sp)
   10604:	05010113          	addi	sp,sp,80
   10608:	00008067          	ret
   1060c:	00892783          	lw	a5,8(s2)
   10610:	0084b703          	ld	a4,8(s1)
   10614:	fff7879b          	addiw	a5,a5,-1
   10618:	06878263          	beq	a5,s0,1067c <__call_exitprocs+0x114>
   1061c:	0004b423          	sd	zero,8(s1)
   10620:	fa0708e3          	beqz	a4,105d0 <__call_exitprocs+0x68>
   10624:	31092783          	lw	a5,784(s2)
   10628:	008a96bb          	sllw	a3,s5,s0
   1062c:	00892c03          	lw	s8,8(s2)
   10630:	00d7f7b3          	and	a5,a5,a3
   10634:	0007879b          	sext.w	a5,a5
   10638:	02079263          	bnez	a5,1065c <__call_exitprocs+0xf4>
   1063c:	000700e7          	jalr	a4
   10640:	00892703          	lw	a4,8(s2)
   10644:	1f8a3783          	ld	a5,504(s4)
   10648:	01871463          	bne	a4,s8,10650 <__call_exitprocs+0xe8>
   1064c:	f92782e3          	beq	a5,s2,105d0 <__call_exitprocs+0x68>
   10650:	f80786e3          	beqz	a5,105dc <__call_exitprocs+0x74>
   10654:	00078913          	mv	s2,a5
   10658:	f59ff06f          	j	105b0 <__call_exitprocs+0x48>
   1065c:	31492783          	lw	a5,788(s2)
   10660:	1084b583          	ld	a1,264(s1)
   10664:	00d7f7b3          	and	a5,a5,a3
   10668:	0007879b          	sext.w	a5,a5
   1066c:	00079c63          	bnez	a5,10684 <__call_exitprocs+0x11c>
   10670:	000b0513          	mv	a0,s6
   10674:	000700e7          	jalr	a4
   10678:	fc9ff06f          	j	10640 <__call_exitprocs+0xd8>
   1067c:	00892423          	sw	s0,8(s2)
   10680:	fa1ff06f          	j	10620 <__call_exitprocs+0xb8>
   10684:	00058513          	mv	a0,a1
   10688:	000700e7          	jalr	a4
   1068c:	fb5ff06f          	j	10640 <__call_exitprocs+0xd8>

0000000000010690 <atexit>:
   10690:	00050593          	mv	a1,a0
   10694:	00000693          	li	a3,0
   10698:	00000613          	li	a2,0
   1069c:	00000513          	li	a0,0
   106a0:	0600006f          	j	10700 <__register_exitproc>

00000000000106a4 <__libc_fini_array>:
   106a4:	fe010113          	addi	sp,sp,-32
   106a8:	00813823          	sd	s0,16(sp)
   106ac:	000117b7          	lui	a5,0x11
   106b0:	00012437          	lui	s0,0x12
   106b4:	7f878793          	addi	a5,a5,2040 # 117f8 <__do_global_dtors_aux_fini_array_entry>
   106b8:	80040413          	addi	s0,s0,-2048 # 11800 <impure_data>
   106bc:	40f40433          	sub	s0,s0,a5
   106c0:	00913423          	sd	s1,8(sp)
   106c4:	00113c23          	sd	ra,24(sp)
   106c8:	40345493          	srai	s1,s0,0x3
   106cc:	02048063          	beqz	s1,106ec <__libc_fini_array+0x48>
   106d0:	ff840413          	addi	s0,s0,-8
   106d4:	00f40433          	add	s0,s0,a5
   106d8:	00043783          	ld	a5,0(s0)
   106dc:	fff48493          	addi	s1,s1,-1
   106e0:	ff840413          	addi	s0,s0,-8
   106e4:	000780e7          	jalr	a5
   106e8:	fe0498e3          	bnez	s1,106d8 <__libc_fini_array+0x34>
   106ec:	01813083          	ld	ra,24(sp)
   106f0:	01013403          	ld	s0,16(sp)
   106f4:	00813483          	ld	s1,8(sp)
   106f8:	02010113          	addi	sp,sp,32
   106fc:	00008067          	ret

0000000000010700 <__register_exitproc>:
   10700:	f481b703          	ld	a4,-184(gp) # 11f48 <_global_impure_ptr>
   10704:	1f873783          	ld	a5,504(a4)
   10708:	06078063          	beqz	a5,10768 <__register_exitproc+0x68>
   1070c:	0087a703          	lw	a4,8(a5)
   10710:	01f00813          	li	a6,31
   10714:	08e84663          	blt	a6,a4,107a0 <__register_exitproc+0xa0>
   10718:	02050863          	beqz	a0,10748 <__register_exitproc+0x48>
   1071c:	00371813          	slli	a6,a4,0x3
   10720:	01078833          	add	a6,a5,a6
   10724:	10c83823          	sd	a2,272(a6)
   10728:	3107a883          	lw	a7,784(a5)
   1072c:	00100613          	li	a2,1
   10730:	00e6163b          	sllw	a2,a2,a4
   10734:	00c8e8b3          	or	a7,a7,a2
   10738:	3117a823          	sw	a7,784(a5)
   1073c:	20d83823          	sd	a3,528(a6)
   10740:	00200693          	li	a3,2
   10744:	02d50863          	beq	a0,a3,10774 <__register_exitproc+0x74>
   10748:	00270693          	addi	a3,a4,2
   1074c:	00369693          	slli	a3,a3,0x3
   10750:	0017071b          	addiw	a4,a4,1
   10754:	00e7a423          	sw	a4,8(a5)
   10758:	00d787b3          	add	a5,a5,a3
   1075c:	00b7b023          	sd	a1,0(a5)
   10760:	00000513          	li	a0,0
   10764:	00008067          	ret
   10768:	20070793          	addi	a5,a4,512
   1076c:	1ef73c23          	sd	a5,504(a4)
   10770:	f9dff06f          	j	1070c <__register_exitproc+0xc>
   10774:	3147a683          	lw	a3,788(a5)
   10778:	00000513          	li	a0,0
   1077c:	00c6e6b3          	or	a3,a3,a2
   10780:	30d7aa23          	sw	a3,788(a5)
   10784:	00270693          	addi	a3,a4,2
   10788:	00369693          	slli	a3,a3,0x3
   1078c:	0017071b          	addiw	a4,a4,1
   10790:	00e7a423          	sw	a4,8(a5)
   10794:	00d787b3          	add	a5,a5,a3
   10798:	00b7b023          	sd	a1,0(a5)
   1079c:	00008067          	ret
   107a0:	fff00513          	li	a0,-1
   107a4:	00008067          	ret

00000000000107a8 <_exit>:
   107a8:	05d00893          	li	a7,93
   107ac:	00000073          	ecall
   107b0:	00054463          	bltz	a0,107b8 <_exit+0x10>
   107b4:	0000006f          	j	107b4 <_exit+0xc>
   107b8:	ff010113          	addi	sp,sp,-16
   107bc:	00813023          	sd	s0,0(sp)
   107c0:	00050413          	mv	s0,a0
   107c4:	00113423          	sd	ra,8(sp)
   107c8:	4080043b          	negw	s0,s0
   107cc:	00c000ef          	jal	ra,107d8 <__errno>
   107d0:	00852023          	sw	s0,0(a0)
   107d4:	0000006f          	j	107d4 <_exit+0x2c>

00000000000107d8 <__errno>:
   107d8:	f581b503          	ld	a0,-168(gp) # 11f58 <_impure_ptr>
   107dc:	00008067          	ret

Disassembly of section .eh_frame:

00000000000117e0 <__FRAME_END__>:
   117e0:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

00000000000117e8 <__init_array_start>:
   117e8:	0118                	.2byte	0x118
   117ea:	0001                	.2byte	0x1
   117ec:	0000                	.2byte	0x0
	...

00000000000117f0 <__frame_dummy_init_array_entry>:
   117f0:	01c0                	.2byte	0x1c0
   117f2:	0001                	.2byte	0x1
   117f4:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

00000000000117f8 <__do_global_dtors_aux_fini_array_entry>:
   117f8:	017c                	.2byte	0x17c
   117fa:	0001                	.2byte	0x1
   117fc:	0000                	.2byte	0x0
	...

Disassembly of section .data:

0000000000011800 <impure_data>:
	...
   11808:	1d38                	.2byte	0x1d38
   1180a:	0001                	.2byte	0x1
   1180c:	0000                	.2byte	0x0
   1180e:	0000                	.2byte	0x0
   11810:	1de8                	.2byte	0x1de8
   11812:	0001                	.2byte	0x1
   11814:	0000                	.2byte	0x0
   11816:	0000                	.2byte	0x0
   11818:	1e98                	.2byte	0x1e98
   1181a:	0001                	.2byte	0x1
	...
   118e8:	0001                	.2byte	0x1
   118ea:	0000                	.2byte	0x0
   118ec:	0000                	.2byte	0x0
   118ee:	0000                	.2byte	0x0
   118f0:	330e                	.2byte	0x330e
   118f2:	abcd                	.2byte	0xabcd
   118f4:	1234                	.2byte	0x1234
   118f6:	e66d                	.2byte	0xe66d
   118f8:	deec                	.2byte	0xdeec
   118fa:	0005                	.2byte	0x5
   118fc:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011f48 <_global_impure_ptr>:
   11f48:	1800                	.2byte	0x1800
   11f4a:	0001                	.2byte	0x1
   11f4c:	0000                	.2byte	0x0
	...

0000000000011f50 <__dso_handle>:
	...

0000000000011f58 <_impure_ptr>:
   11f58:	1800                	.2byte	0x1800
   11f5a:	0001                	.2byte	0x1
   11f5c:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011f60 <completed.1>:
	...

0000000000011f68 <object.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347          	.4byte	0x3a434347
   4:	2820                	.2byte	0x2820
   6:	2029                	.2byte	0x2029
   8:	3131                	.2byte	0x3131
   a:	312e                	.2byte	0x312e
   c:	302e                	.2byte	0x302e
   e:	4700                	.2byte	0x4700
  10:	203a4343          	.4byte	0x203a4343
  14:	4728                	.2byte	0x4728
  16:	554e                	.2byte	0x554e
  18:	2029                	.2byte	0x2029
  1a:	3131                	.2byte	0x3131
  1c:	312e                	.2byte	0x312e
  1e:	302e                	.2byte	0x302e
	...

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	1b41                	.2byte	0x1b41
   2:	0000                	.2byte	0x0
   4:	7200                	.2byte	0x7200
   6:	7369                	.2byte	0x7369
   8:	01007663          	bgeu	zero,a6,14 <exit-0x100d4>
   c:	0011                	.2byte	0x11
   e:	0000                	.2byte	0x0
  10:	1004                	.2byte	0x1004
  12:	7205                	.2byte	0x7205
  14:	3676                	.2byte	0x3676
  16:	6934                	.2byte	0x6934
  18:	7032                	.2byte	0x7032
  1a:	0030                	.2byte	0x30
