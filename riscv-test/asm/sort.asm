
riscv-test/elf/sort.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	430000ef          	jal	ra,1052c <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11f40 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	658000ef          	jal	ra,1076c <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	66850513          	addi	a0,a0,1640 # 10668 <__libc_fini_array>
   10128:	52c0006f          	j	10654 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	ec818193          	addi	gp,gp,-312 # 11ff8 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11f58 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 11f90 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	308000ef          	jal	ra,10450 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	50850513          	addi	a0,a0,1288 # 10654 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	51050513          	addi	a0,a0,1296 # 10668 <__libc_fini_array>
   10160:	4f4000ef          	jal	ra,10654 <atexit>
   10164:	250000ef          	jal	ra,103b4 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	1b4000ef          	jal	ra,10328 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11f58 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	7d850513          	addi	a0,a0,2008 # 117d8 <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11f58 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	addi	a1,gp,-152 # 11f60 <object.0>
   101d0:	7d850513          	addi	a0,a0,2008 # 117d8 <__FRAME_END__>
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

0000000000010328 <main>:
   10328:	fc010113          	addi	sp,sp,-64
   1032c:	02113c23          	sd	ra,56(sp)
   10330:	02813823          	sd	s0,48(sp)
   10334:	04010413          	addi	s0,sp,64
   10338:	000107b7          	lui	a5,0x10
   1033c:	7b078793          	addi	a5,a5,1968 # 107b0 <__errno+0x14>
   10340:	0007b583          	ld	a1,0(a5)
   10344:	0087b603          	ld	a2,8(a5)
   10348:	0107b683          	ld	a3,16(a5)
   1034c:	0187b703          	ld	a4,24(a5)
   10350:	0207b783          	ld	a5,32(a5)
   10354:	fcb43023          	sd	a1,-64(s0)
   10358:	fcc43423          	sd	a2,-56(s0)
   1035c:	fcd43823          	sd	a3,-48(s0)
   10360:	fce43c23          	sd	a4,-40(s0)
   10364:	fef43023          	sd	a5,-32(s0)
   10368:	000107b7          	lui	a5,0x10
   1036c:	7a878513          	addi	a0,a5,1960 # 107a8 <__errno+0xc>
   10370:	f4dff0ef          	jal	ra,102bc <print_string>
   10374:	fe042623          	sw	zero,-20(s0)
   10378:	0100006f          	j	10388 <main+0x60>
   1037c:	fec42783          	lw	a5,-20(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	fef42623          	sw	a5,-20(s0)
   10388:	fec42783          	lw	a5,-20(s0)
   1038c:	0007871b          	sext.w	a4,a5
   10390:	00900793          	li	a5,9
   10394:	fee7d4e3          	bge	a5,a4,1037c <main+0x54>
   10398:	ea1ff0ef          	jal	ra,10238 <exit_proc>
   1039c:	00000793          	li	a5,0
   103a0:	00078513          	mv	a0,a5
   103a4:	03813083          	ld	ra,56(sp)
   103a8:	03013403          	ld	s0,48(sp)
   103ac:	04010113          	addi	sp,sp,64
   103b0:	00008067          	ret

00000000000103b4 <__libc_init_array>:
   103b4:	fe010113          	addi	sp,sp,-32
   103b8:	00813823          	sd	s0,16(sp)
   103bc:	01213023          	sd	s2,0(sp)
   103c0:	00011437          	lui	s0,0x11
   103c4:	00011937          	lui	s2,0x11
   103c8:	7dc40793          	addi	a5,s0,2012 # 117dc <__preinit_array_end>
   103cc:	7dc90913          	addi	s2,s2,2012 # 117dc <__preinit_array_end>
   103d0:	40f90933          	sub	s2,s2,a5
   103d4:	00113c23          	sd	ra,24(sp)
   103d8:	00913423          	sd	s1,8(sp)
   103dc:	40395913          	srai	s2,s2,0x3
   103e0:	02090063          	beqz	s2,10400 <__libc_init_array+0x4c>
   103e4:	7dc40413          	addi	s0,s0,2012
   103e8:	00000493          	li	s1,0
   103ec:	00043783          	ld	a5,0(s0)
   103f0:	00148493          	addi	s1,s1,1
   103f4:	00840413          	addi	s0,s0,8
   103f8:	000780e7          	jalr	a5
   103fc:	fe9918e3          	bne	s2,s1,103ec <__libc_init_array+0x38>
   10400:	00011437          	lui	s0,0x11
   10404:	00011937          	lui	s2,0x11
   10408:	7e040793          	addi	a5,s0,2016 # 117e0 <__init_array_start>
   1040c:	7f090913          	addi	s2,s2,2032 # 117f0 <__do_global_dtors_aux_fini_array_entry>
   10410:	40f90933          	sub	s2,s2,a5
   10414:	40395913          	srai	s2,s2,0x3
   10418:	02090063          	beqz	s2,10438 <__libc_init_array+0x84>
   1041c:	7e040413          	addi	s0,s0,2016
   10420:	00000493          	li	s1,0
   10424:	00043783          	ld	a5,0(s0)
   10428:	00148493          	addi	s1,s1,1
   1042c:	00840413          	addi	s0,s0,8
   10430:	000780e7          	jalr	a5
   10434:	fe9918e3          	bne	s2,s1,10424 <__libc_init_array+0x70>
   10438:	01813083          	ld	ra,24(sp)
   1043c:	01013403          	ld	s0,16(sp)
   10440:	00813483          	ld	s1,8(sp)
   10444:	00013903          	ld	s2,0(sp)
   10448:	02010113          	addi	sp,sp,32
   1044c:	00008067          	ret

0000000000010450 <memset>:
   10450:	00f00313          	li	t1,15
   10454:	00050713          	mv	a4,a0
   10458:	02c37a63          	bgeu	t1,a2,1048c <memset+0x3c>
   1045c:	00f77793          	andi	a5,a4,15
   10460:	0a079063          	bnez	a5,10500 <memset+0xb0>
   10464:	06059e63          	bnez	a1,104e0 <memset+0x90>
   10468:	ff067693          	andi	a3,a2,-16
   1046c:	00f67613          	andi	a2,a2,15
   10470:	00e686b3          	add	a3,a3,a4
   10474:	00b73023          	sd	a1,0(a4)
   10478:	00b73423          	sd	a1,8(a4)
   1047c:	01070713          	addi	a4,a4,16
   10480:	fed76ae3          	bltu	a4,a3,10474 <memset+0x24>
   10484:	00061463          	bnez	a2,1048c <memset+0x3c>
   10488:	00008067          	ret
   1048c:	40c306b3          	sub	a3,t1,a2
   10490:	00269693          	slli	a3,a3,0x2
   10494:	00000297          	auipc	t0,0x0
   10498:	005686b3          	add	a3,a3,t0
   1049c:	00c68067          	jr	12(a3)
   104a0:	00b70723          	sb	a1,14(a4)
   104a4:	00b706a3          	sb	a1,13(a4)
   104a8:	00b70623          	sb	a1,12(a4)
   104ac:	00b705a3          	sb	a1,11(a4)
   104b0:	00b70523          	sb	a1,10(a4)
   104b4:	00b704a3          	sb	a1,9(a4)
   104b8:	00b70423          	sb	a1,8(a4)
   104bc:	00b703a3          	sb	a1,7(a4)
   104c0:	00b70323          	sb	a1,6(a4)
   104c4:	00b702a3          	sb	a1,5(a4)
   104c8:	00b70223          	sb	a1,4(a4)
   104cc:	00b701a3          	sb	a1,3(a4)
   104d0:	00b70123          	sb	a1,2(a4)
   104d4:	00b700a3          	sb	a1,1(a4)
   104d8:	00b70023          	sb	a1,0(a4)
   104dc:	00008067          	ret
   104e0:	0ff5f593          	zext.b	a1,a1
   104e4:	00859693          	slli	a3,a1,0x8
   104e8:	00d5e5b3          	or	a1,a1,a3
   104ec:	01059693          	slli	a3,a1,0x10
   104f0:	00d5e5b3          	or	a1,a1,a3
   104f4:	02059693          	slli	a3,a1,0x20
   104f8:	00d5e5b3          	or	a1,a1,a3
   104fc:	f6dff06f          	j	10468 <memset+0x18>
   10500:	00279693          	slli	a3,a5,0x2
   10504:	00000297          	auipc	t0,0x0
   10508:	005686b3          	add	a3,a3,t0
   1050c:	00008293          	mv	t0,ra
   10510:	f98680e7          	jalr	-104(a3)
   10514:	00028093          	mv	ra,t0
   10518:	ff078793          	addi	a5,a5,-16
   1051c:	40f70733          	sub	a4,a4,a5
   10520:	00f60633          	add	a2,a2,a5
   10524:	f6c374e3          	bgeu	t1,a2,1048c <memset+0x3c>
   10528:	f3dff06f          	j	10464 <memset+0x14>

000000000001052c <__call_exitprocs>:
   1052c:	fb010113          	addi	sp,sp,-80
   10530:	03413023          	sd	s4,32(sp)
   10534:	f481ba03          	ld	s4,-184(gp) # 11f40 <_global_impure_ptr>
   10538:	03213823          	sd	s2,48(sp)
   1053c:	04113423          	sd	ra,72(sp)
   10540:	1f8a3903          	ld	s2,504(s4)
   10544:	04813023          	sd	s0,64(sp)
   10548:	02913c23          	sd	s1,56(sp)
   1054c:	03313423          	sd	s3,40(sp)
   10550:	01513c23          	sd	s5,24(sp)
   10554:	01613823          	sd	s6,16(sp)
   10558:	01713423          	sd	s7,8(sp)
   1055c:	01813023          	sd	s8,0(sp)
   10560:	04090063          	beqz	s2,105a0 <__call_exitprocs+0x74>
   10564:	00050b13          	mv	s6,a0
   10568:	00058b93          	mv	s7,a1
   1056c:	00100a93          	li	s5,1
   10570:	fff00993          	li	s3,-1
   10574:	00892483          	lw	s1,8(s2)
   10578:	fff4841b          	addiw	s0,s1,-1
   1057c:	02044263          	bltz	s0,105a0 <__call_exitprocs+0x74>
   10580:	00349493          	slli	s1,s1,0x3
   10584:	009904b3          	add	s1,s2,s1
   10588:	040b8463          	beqz	s7,105d0 <__call_exitprocs+0xa4>
   1058c:	2084b783          	ld	a5,520(s1)
   10590:	05778063          	beq	a5,s7,105d0 <__call_exitprocs+0xa4>
   10594:	fff4041b          	addiw	s0,s0,-1
   10598:	ff848493          	addi	s1,s1,-8
   1059c:	ff3416e3          	bne	s0,s3,10588 <__call_exitprocs+0x5c>
   105a0:	04813083          	ld	ra,72(sp)
   105a4:	04013403          	ld	s0,64(sp)
   105a8:	03813483          	ld	s1,56(sp)
   105ac:	03013903          	ld	s2,48(sp)
   105b0:	02813983          	ld	s3,40(sp)
   105b4:	02013a03          	ld	s4,32(sp)
   105b8:	01813a83          	ld	s5,24(sp)
   105bc:	01013b03          	ld	s6,16(sp)
   105c0:	00813b83          	ld	s7,8(sp)
   105c4:	00013c03          	ld	s8,0(sp)
   105c8:	05010113          	addi	sp,sp,80
   105cc:	00008067          	ret
   105d0:	00892783          	lw	a5,8(s2)
   105d4:	0084b703          	ld	a4,8(s1)
   105d8:	fff7879b          	addiw	a5,a5,-1
   105dc:	06878263          	beq	a5,s0,10640 <__call_exitprocs+0x114>
   105e0:	0004b423          	sd	zero,8(s1)
   105e4:	fa0708e3          	beqz	a4,10594 <__call_exitprocs+0x68>
   105e8:	31092783          	lw	a5,784(s2)
   105ec:	008a96bb          	sllw	a3,s5,s0
   105f0:	00892c03          	lw	s8,8(s2)
   105f4:	00d7f7b3          	and	a5,a5,a3
   105f8:	0007879b          	sext.w	a5,a5
   105fc:	02079263          	bnez	a5,10620 <__call_exitprocs+0xf4>
   10600:	000700e7          	jalr	a4
   10604:	00892703          	lw	a4,8(s2)
   10608:	1f8a3783          	ld	a5,504(s4)
   1060c:	01871463          	bne	a4,s8,10614 <__call_exitprocs+0xe8>
   10610:	f92782e3          	beq	a5,s2,10594 <__call_exitprocs+0x68>
   10614:	f80786e3          	beqz	a5,105a0 <__call_exitprocs+0x74>
   10618:	00078913          	mv	s2,a5
   1061c:	f59ff06f          	j	10574 <__call_exitprocs+0x48>
   10620:	31492783          	lw	a5,788(s2)
   10624:	1084b583          	ld	a1,264(s1)
   10628:	00d7f7b3          	and	a5,a5,a3
   1062c:	0007879b          	sext.w	a5,a5
   10630:	00079c63          	bnez	a5,10648 <__call_exitprocs+0x11c>
   10634:	000b0513          	mv	a0,s6
   10638:	000700e7          	jalr	a4
   1063c:	fc9ff06f          	j	10604 <__call_exitprocs+0xd8>
   10640:	00892423          	sw	s0,8(s2)
   10644:	fa1ff06f          	j	105e4 <__call_exitprocs+0xb8>
   10648:	00058513          	mv	a0,a1
   1064c:	000700e7          	jalr	a4
   10650:	fb5ff06f          	j	10604 <__call_exitprocs+0xd8>

0000000000010654 <atexit>:
   10654:	00050593          	mv	a1,a0
   10658:	00000693          	li	a3,0
   1065c:	00000613          	li	a2,0
   10660:	00000513          	li	a0,0
   10664:	0600006f          	j	106c4 <__register_exitproc>

0000000000010668 <__libc_fini_array>:
   10668:	fe010113          	addi	sp,sp,-32
   1066c:	00813823          	sd	s0,16(sp)
   10670:	000117b7          	lui	a5,0x11
   10674:	00011437          	lui	s0,0x11
   10678:	7f078793          	addi	a5,a5,2032 # 117f0 <__do_global_dtors_aux_fini_array_entry>
   1067c:	7f840413          	addi	s0,s0,2040 # 117f8 <impure_data>
   10680:	40f40433          	sub	s0,s0,a5
   10684:	00913423          	sd	s1,8(sp)
   10688:	00113c23          	sd	ra,24(sp)
   1068c:	40345493          	srai	s1,s0,0x3
   10690:	02048063          	beqz	s1,106b0 <__libc_fini_array+0x48>
   10694:	ff840413          	addi	s0,s0,-8
   10698:	00f40433          	add	s0,s0,a5
   1069c:	00043783          	ld	a5,0(s0)
   106a0:	fff48493          	addi	s1,s1,-1
   106a4:	ff840413          	addi	s0,s0,-8
   106a8:	000780e7          	jalr	a5
   106ac:	fe0498e3          	bnez	s1,1069c <__libc_fini_array+0x34>
   106b0:	01813083          	ld	ra,24(sp)
   106b4:	01013403          	ld	s0,16(sp)
   106b8:	00813483          	ld	s1,8(sp)
   106bc:	02010113          	addi	sp,sp,32
   106c0:	00008067          	ret

00000000000106c4 <__register_exitproc>:
   106c4:	f481b703          	ld	a4,-184(gp) # 11f40 <_global_impure_ptr>
   106c8:	1f873783          	ld	a5,504(a4)
   106cc:	06078063          	beqz	a5,1072c <__register_exitproc+0x68>
   106d0:	0087a703          	lw	a4,8(a5)
   106d4:	01f00813          	li	a6,31
   106d8:	08e84663          	blt	a6,a4,10764 <__register_exitproc+0xa0>
   106dc:	02050863          	beqz	a0,1070c <__register_exitproc+0x48>
   106e0:	00371813          	slli	a6,a4,0x3
   106e4:	01078833          	add	a6,a5,a6
   106e8:	10c83823          	sd	a2,272(a6)
   106ec:	3107a883          	lw	a7,784(a5)
   106f0:	00100613          	li	a2,1
   106f4:	00e6163b          	sllw	a2,a2,a4
   106f8:	00c8e8b3          	or	a7,a7,a2
   106fc:	3117a823          	sw	a7,784(a5)
   10700:	20d83823          	sd	a3,528(a6)
   10704:	00200693          	li	a3,2
   10708:	02d50863          	beq	a0,a3,10738 <__register_exitproc+0x74>
   1070c:	00270693          	addi	a3,a4,2
   10710:	00369693          	slli	a3,a3,0x3
   10714:	0017071b          	addiw	a4,a4,1
   10718:	00e7a423          	sw	a4,8(a5)
   1071c:	00d787b3          	add	a5,a5,a3
   10720:	00b7b023          	sd	a1,0(a5)
   10724:	00000513          	li	a0,0
   10728:	00008067          	ret
   1072c:	20070793          	addi	a5,a4,512
   10730:	1ef73c23          	sd	a5,504(a4)
   10734:	f9dff06f          	j	106d0 <__register_exitproc+0xc>
   10738:	3147a683          	lw	a3,788(a5)
   1073c:	00000513          	li	a0,0
   10740:	00c6e6b3          	or	a3,a3,a2
   10744:	30d7aa23          	sw	a3,788(a5)
   10748:	00270693          	addi	a3,a4,2
   1074c:	00369693          	slli	a3,a3,0x3
   10750:	0017071b          	addiw	a4,a4,1
   10754:	00e7a423          	sw	a4,8(a5)
   10758:	00d787b3          	add	a5,a5,a3
   1075c:	00b7b023          	sd	a1,0(a5)
   10760:	00008067          	ret
   10764:	fff00513          	li	a0,-1
   10768:	00008067          	ret

000000000001076c <_exit>:
   1076c:	05d00893          	li	a7,93
   10770:	00000073          	ecall
   10774:	00054463          	bltz	a0,1077c <_exit+0x10>
   10778:	0000006f          	j	10778 <_exit+0xc>
   1077c:	ff010113          	addi	sp,sp,-16
   10780:	00813023          	sd	s0,0(sp)
   10784:	00050413          	mv	s0,a0
   10788:	00113423          	sd	ra,8(sp)
   1078c:	4080043b          	negw	s0,s0
   10790:	00c000ef          	jal	ra,1079c <__errno>
   10794:	00852023          	sw	s0,0(a0)
   10798:	0000006f          	j	10798 <_exit+0x2c>

000000000001079c <__errno>:
   1079c:	f581b503          	ld	a0,-168(gp) # 11f50 <_impure_ptr>
   107a0:	00008067          	ret

Disassembly of section .rodata:

00000000000107a8 <.rodata>:
   107a8:	7270                	.2byte	0x7270
   107aa:	7665                	.2byte	0x7665
   107ac:	203a                	.2byte	0x203a
   107ae:	0000                	.2byte	0x0
   107b0:	0008                	.2byte	0x8
   107b2:	0000                	.2byte	0x0
   107b4:	000c                	.2byte	0xc
   107b6:	0000                	.2byte	0x0
   107b8:	00000003          	lb	zero,0(zero) # 0 <exit-0x100e8>
   107bc:	0005                	.2byte	0x5
   107be:	0000                	.2byte	0x0
   107c0:	0002                	.2byte	0x2
   107c2:	0000                	.2byte	0x0
   107c4:	002d                	.2byte	0x2d
   107c6:	0000                	.2byte	0x0
   107c8:	0000                	.2byte	0x0
   107ca:	0000                	.2byte	0x0
   107cc:	000e                	.2byte	0xe
   107ce:	0000                	.2byte	0x0
   107d0:	0002                	.2byte	0x2
   107d2:	0000                	.2byte	0x0
   107d4:	0009                	.2byte	0x9
	...

Disassembly of section .eh_frame:

00000000000117d8 <__FRAME_END__>:
   117d8:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

00000000000117e0 <__init_array_start>:
   117e0:	0118                	.2byte	0x118
   117e2:	0001                	.2byte	0x1
   117e4:	0000                	.2byte	0x0
	...

00000000000117e8 <__frame_dummy_init_array_entry>:
   117e8:	01c0                	.2byte	0x1c0
   117ea:	0001                	.2byte	0x1
   117ec:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

00000000000117f0 <__do_global_dtors_aux_fini_array_entry>:
   117f0:	017c                	.2byte	0x17c
   117f2:	0001                	.2byte	0x1
   117f4:	0000                	.2byte	0x0
	...

Disassembly of section .data:

00000000000117f8 <impure_data>:
	...
   11800:	1d30                	.2byte	0x1d30
   11802:	0001                	.2byte	0x1
   11804:	0000                	.2byte	0x0
   11806:	0000                	.2byte	0x0
   11808:	1de0                	.2byte	0x1de0
   1180a:	0001                	.2byte	0x1
   1180c:	0000                	.2byte	0x0
   1180e:	0000                	.2byte	0x0
   11810:	1e90                	.2byte	0x1e90
   11812:	0001                	.2byte	0x1
	...
   118e0:	0001                	.2byte	0x1
   118e2:	0000                	.2byte	0x0
   118e4:	0000                	.2byte	0x0
   118e6:	0000                	.2byte	0x0
   118e8:	330e                	.2byte	0x330e
   118ea:	abcd                	.2byte	0xabcd
   118ec:	1234                	.2byte	0x1234
   118ee:	e66d                	.2byte	0xe66d
   118f0:	deec                	.2byte	0xdeec
   118f2:	0005                	.2byte	0x5
   118f4:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011f40 <_global_impure_ptr>:
   11f40:	17f8                	.2byte	0x17f8
   11f42:	0001                	.2byte	0x1
   11f44:	0000                	.2byte	0x0
	...

0000000000011f48 <__dso_handle>:
	...

0000000000011f50 <_impure_ptr>:
   11f50:	17f8                	.2byte	0x17f8
   11f52:	0001                	.2byte	0x1
   11f54:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011f58 <completed.1>:
	...

0000000000011f60 <object.0>:
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
