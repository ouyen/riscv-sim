
riscv-test/elf/test_io.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	420000ef          	jal	ra,1051c <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11f20 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	648000ef          	jal	ra,1075c <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	65850513          	addi	a0,a0,1624 # 10658 <__libc_fini_array>
   10128:	51c0006f          	j	10644 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	ea818193          	addi	gp,gp,-344 # 11fd8 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11f38 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 11f70 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	2f8000ef          	jal	ra,10440 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	4f850513          	addi	a0,a0,1272 # 10644 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	50050513          	addi	a0,a0,1280 # 10658 <__libc_fini_array>
   10160:	4e4000ef          	jal	ra,10644 <atexit>
   10164:	240000ef          	jal	ra,103a4 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	1b4000ef          	jal	ra,10328 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11f38 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	7b850513          	addi	a0,a0,1976 # 117b8 <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11f38 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	addi	a1,gp,-152 # 11f40 <object.0>
   101d0:	7b850513          	addi	a0,a0,1976 # 117b8 <__FRAME_END__>
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
   10328:	fe010113          	addi	sp,sp,-32
   1032c:	00113c23          	sd	ra,24(sp)
   10330:	00813823          	sd	s0,16(sp)
   10334:	02010413          	addi	s0,sp,32
   10338:	000107b7          	lui	a5,0x10
   1033c:	79878513          	addi	a0,a5,1944 # 10798 <__errno+0xc>
   10340:	f7dff0ef          	jal	ra,102bc <print_string>
   10344:	f49ff0ef          	jal	ra,1028c <read_num>
   10348:	00050793          	mv	a5,a0
   1034c:	fef42623          	sw	a5,-20(s0)
   10350:	fec42783          	lw	a5,-20(s0)
   10354:	00078513          	mv	a0,a5
   10358:	eb5ff0ef          	jal	ra,1020c <print_num>
   1035c:	000107b7          	lui	a5,0x10
   10360:	7a878513          	addi	a0,a5,1960 # 107a8 <__errno+0x1c>
   10364:	f59ff0ef          	jal	ra,102bc <print_string>
   10368:	ef5ff0ef          	jal	ra,1025c <read_char>
   1036c:	00050793          	mv	a5,a0
   10370:	fef405a3          	sb	a5,-21(s0)
   10374:	feb44783          	lbu	a5,-21(s0)
   10378:	00078513          	mv	a0,a5
   1037c:	e65ff0ef          	jal	ra,101e0 <print_char>
   10380:	00a00513          	li	a0,10
   10384:	e5dff0ef          	jal	ra,101e0 <print_char>
   10388:	eb1ff0ef          	jal	ra,10238 <exit_proc>
   1038c:	00000793          	li	a5,0
   10390:	00078513          	mv	a0,a5
   10394:	01813083          	ld	ra,24(sp)
   10398:	01013403          	ld	s0,16(sp)
   1039c:	02010113          	addi	sp,sp,32
   103a0:	00008067          	ret

00000000000103a4 <__libc_init_array>:
   103a4:	fe010113          	addi	sp,sp,-32
   103a8:	00813823          	sd	s0,16(sp)
   103ac:	01213023          	sd	s2,0(sp)
   103b0:	00011437          	lui	s0,0x11
   103b4:	00011937          	lui	s2,0x11
   103b8:	7bc40793          	addi	a5,s0,1980 # 117bc <__preinit_array_end>
   103bc:	7bc90913          	addi	s2,s2,1980 # 117bc <__preinit_array_end>
   103c0:	40f90933          	sub	s2,s2,a5
   103c4:	00113c23          	sd	ra,24(sp)
   103c8:	00913423          	sd	s1,8(sp)
   103cc:	40395913          	srai	s2,s2,0x3
   103d0:	02090063          	beqz	s2,103f0 <__libc_init_array+0x4c>
   103d4:	7bc40413          	addi	s0,s0,1980
   103d8:	00000493          	li	s1,0
   103dc:	00043783          	ld	a5,0(s0)
   103e0:	00148493          	addi	s1,s1,1
   103e4:	00840413          	addi	s0,s0,8
   103e8:	000780e7          	jalr	a5
   103ec:	fe9918e3          	bne	s2,s1,103dc <__libc_init_array+0x38>
   103f0:	00011437          	lui	s0,0x11
   103f4:	00011937          	lui	s2,0x11
   103f8:	7c040793          	addi	a5,s0,1984 # 117c0 <__init_array_start>
   103fc:	7d090913          	addi	s2,s2,2000 # 117d0 <__do_global_dtors_aux_fini_array_entry>
   10400:	40f90933          	sub	s2,s2,a5
   10404:	40395913          	srai	s2,s2,0x3
   10408:	02090063          	beqz	s2,10428 <__libc_init_array+0x84>
   1040c:	7c040413          	addi	s0,s0,1984
   10410:	00000493          	li	s1,0
   10414:	00043783          	ld	a5,0(s0)
   10418:	00148493          	addi	s1,s1,1
   1041c:	00840413          	addi	s0,s0,8
   10420:	000780e7          	jalr	a5
   10424:	fe9918e3          	bne	s2,s1,10414 <__libc_init_array+0x70>
   10428:	01813083          	ld	ra,24(sp)
   1042c:	01013403          	ld	s0,16(sp)
   10430:	00813483          	ld	s1,8(sp)
   10434:	00013903          	ld	s2,0(sp)
   10438:	02010113          	addi	sp,sp,32
   1043c:	00008067          	ret

0000000000010440 <memset>:
   10440:	00f00313          	li	t1,15
   10444:	00050713          	mv	a4,a0
   10448:	02c37a63          	bgeu	t1,a2,1047c <memset+0x3c>
   1044c:	00f77793          	andi	a5,a4,15
   10450:	0a079063          	bnez	a5,104f0 <memset+0xb0>
   10454:	06059e63          	bnez	a1,104d0 <memset+0x90>
   10458:	ff067693          	andi	a3,a2,-16
   1045c:	00f67613          	andi	a2,a2,15
   10460:	00e686b3          	add	a3,a3,a4
   10464:	00b73023          	sd	a1,0(a4)
   10468:	00b73423          	sd	a1,8(a4)
   1046c:	01070713          	addi	a4,a4,16
   10470:	fed76ae3          	bltu	a4,a3,10464 <memset+0x24>
   10474:	00061463          	bnez	a2,1047c <memset+0x3c>
   10478:	00008067          	ret
   1047c:	40c306b3          	sub	a3,t1,a2
   10480:	00269693          	slli	a3,a3,0x2
   10484:	00000297          	auipc	t0,0x0
   10488:	005686b3          	add	a3,a3,t0
   1048c:	00c68067          	jr	12(a3)
   10490:	00b70723          	sb	a1,14(a4)
   10494:	00b706a3          	sb	a1,13(a4)
   10498:	00b70623          	sb	a1,12(a4)
   1049c:	00b705a3          	sb	a1,11(a4)
   104a0:	00b70523          	sb	a1,10(a4)
   104a4:	00b704a3          	sb	a1,9(a4)
   104a8:	00b70423          	sb	a1,8(a4)
   104ac:	00b703a3          	sb	a1,7(a4)
   104b0:	00b70323          	sb	a1,6(a4)
   104b4:	00b702a3          	sb	a1,5(a4)
   104b8:	00b70223          	sb	a1,4(a4)
   104bc:	00b701a3          	sb	a1,3(a4)
   104c0:	00b70123          	sb	a1,2(a4)
   104c4:	00b700a3          	sb	a1,1(a4)
   104c8:	00b70023          	sb	a1,0(a4)
   104cc:	00008067          	ret
   104d0:	0ff5f593          	zext.b	a1,a1
   104d4:	00859693          	slli	a3,a1,0x8
   104d8:	00d5e5b3          	or	a1,a1,a3
   104dc:	01059693          	slli	a3,a1,0x10
   104e0:	00d5e5b3          	or	a1,a1,a3
   104e4:	02059693          	slli	a3,a1,0x20
   104e8:	00d5e5b3          	or	a1,a1,a3
   104ec:	f6dff06f          	j	10458 <memset+0x18>
   104f0:	00279693          	slli	a3,a5,0x2
   104f4:	00000297          	auipc	t0,0x0
   104f8:	005686b3          	add	a3,a3,t0
   104fc:	00008293          	mv	t0,ra
   10500:	f98680e7          	jalr	-104(a3)
   10504:	00028093          	mv	ra,t0
   10508:	ff078793          	addi	a5,a5,-16
   1050c:	40f70733          	sub	a4,a4,a5
   10510:	00f60633          	add	a2,a2,a5
   10514:	f6c374e3          	bgeu	t1,a2,1047c <memset+0x3c>
   10518:	f3dff06f          	j	10454 <memset+0x14>

000000000001051c <__call_exitprocs>:
   1051c:	fb010113          	addi	sp,sp,-80
   10520:	03413023          	sd	s4,32(sp)
   10524:	f481ba03          	ld	s4,-184(gp) # 11f20 <_global_impure_ptr>
   10528:	03213823          	sd	s2,48(sp)
   1052c:	04113423          	sd	ra,72(sp)
   10530:	1f8a3903          	ld	s2,504(s4)
   10534:	04813023          	sd	s0,64(sp)
   10538:	02913c23          	sd	s1,56(sp)
   1053c:	03313423          	sd	s3,40(sp)
   10540:	01513c23          	sd	s5,24(sp)
   10544:	01613823          	sd	s6,16(sp)
   10548:	01713423          	sd	s7,8(sp)
   1054c:	01813023          	sd	s8,0(sp)
   10550:	04090063          	beqz	s2,10590 <__call_exitprocs+0x74>
   10554:	00050b13          	mv	s6,a0
   10558:	00058b93          	mv	s7,a1
   1055c:	00100a93          	li	s5,1
   10560:	fff00993          	li	s3,-1
   10564:	00892483          	lw	s1,8(s2)
   10568:	fff4841b          	addiw	s0,s1,-1
   1056c:	02044263          	bltz	s0,10590 <__call_exitprocs+0x74>
   10570:	00349493          	slli	s1,s1,0x3
   10574:	009904b3          	add	s1,s2,s1
   10578:	040b8463          	beqz	s7,105c0 <__call_exitprocs+0xa4>
   1057c:	2084b783          	ld	a5,520(s1)
   10580:	05778063          	beq	a5,s7,105c0 <__call_exitprocs+0xa4>
   10584:	fff4041b          	addiw	s0,s0,-1
   10588:	ff848493          	addi	s1,s1,-8
   1058c:	ff3416e3          	bne	s0,s3,10578 <__call_exitprocs+0x5c>
   10590:	04813083          	ld	ra,72(sp)
   10594:	04013403          	ld	s0,64(sp)
   10598:	03813483          	ld	s1,56(sp)
   1059c:	03013903          	ld	s2,48(sp)
   105a0:	02813983          	ld	s3,40(sp)
   105a4:	02013a03          	ld	s4,32(sp)
   105a8:	01813a83          	ld	s5,24(sp)
   105ac:	01013b03          	ld	s6,16(sp)
   105b0:	00813b83          	ld	s7,8(sp)
   105b4:	00013c03          	ld	s8,0(sp)
   105b8:	05010113          	addi	sp,sp,80
   105bc:	00008067          	ret
   105c0:	00892783          	lw	a5,8(s2)
   105c4:	0084b703          	ld	a4,8(s1)
   105c8:	fff7879b          	addiw	a5,a5,-1
   105cc:	06878263          	beq	a5,s0,10630 <__call_exitprocs+0x114>
   105d0:	0004b423          	sd	zero,8(s1)
   105d4:	fa0708e3          	beqz	a4,10584 <__call_exitprocs+0x68>
   105d8:	31092783          	lw	a5,784(s2)
   105dc:	008a96bb          	sllw	a3,s5,s0
   105e0:	00892c03          	lw	s8,8(s2)
   105e4:	00d7f7b3          	and	a5,a5,a3
   105e8:	0007879b          	sext.w	a5,a5
   105ec:	02079263          	bnez	a5,10610 <__call_exitprocs+0xf4>
   105f0:	000700e7          	jalr	a4
   105f4:	00892703          	lw	a4,8(s2)
   105f8:	1f8a3783          	ld	a5,504(s4)
   105fc:	01871463          	bne	a4,s8,10604 <__call_exitprocs+0xe8>
   10600:	f92782e3          	beq	a5,s2,10584 <__call_exitprocs+0x68>
   10604:	f80786e3          	beqz	a5,10590 <__call_exitprocs+0x74>
   10608:	00078913          	mv	s2,a5
   1060c:	f59ff06f          	j	10564 <__call_exitprocs+0x48>
   10610:	31492783          	lw	a5,788(s2)
   10614:	1084b583          	ld	a1,264(s1)
   10618:	00d7f7b3          	and	a5,a5,a3
   1061c:	0007879b          	sext.w	a5,a5
   10620:	00079c63          	bnez	a5,10638 <__call_exitprocs+0x11c>
   10624:	000b0513          	mv	a0,s6
   10628:	000700e7          	jalr	a4
   1062c:	fc9ff06f          	j	105f4 <__call_exitprocs+0xd8>
   10630:	00892423          	sw	s0,8(s2)
   10634:	fa1ff06f          	j	105d4 <__call_exitprocs+0xb8>
   10638:	00058513          	mv	a0,a1
   1063c:	000700e7          	jalr	a4
   10640:	fb5ff06f          	j	105f4 <__call_exitprocs+0xd8>

0000000000010644 <atexit>:
   10644:	00050593          	mv	a1,a0
   10648:	00000693          	li	a3,0
   1064c:	00000613          	li	a2,0
   10650:	00000513          	li	a0,0
   10654:	0600006f          	j	106b4 <__register_exitproc>

0000000000010658 <__libc_fini_array>:
   10658:	fe010113          	addi	sp,sp,-32
   1065c:	00813823          	sd	s0,16(sp)
   10660:	000117b7          	lui	a5,0x11
   10664:	00011437          	lui	s0,0x11
   10668:	7d078793          	addi	a5,a5,2000 # 117d0 <__do_global_dtors_aux_fini_array_entry>
   1066c:	7d840413          	addi	s0,s0,2008 # 117d8 <impure_data>
   10670:	40f40433          	sub	s0,s0,a5
   10674:	00913423          	sd	s1,8(sp)
   10678:	00113c23          	sd	ra,24(sp)
   1067c:	40345493          	srai	s1,s0,0x3
   10680:	02048063          	beqz	s1,106a0 <__libc_fini_array+0x48>
   10684:	ff840413          	addi	s0,s0,-8
   10688:	00f40433          	add	s0,s0,a5
   1068c:	00043783          	ld	a5,0(s0)
   10690:	fff48493          	addi	s1,s1,-1
   10694:	ff840413          	addi	s0,s0,-8
   10698:	000780e7          	jalr	a5
   1069c:	fe0498e3          	bnez	s1,1068c <__libc_fini_array+0x34>
   106a0:	01813083          	ld	ra,24(sp)
   106a4:	01013403          	ld	s0,16(sp)
   106a8:	00813483          	ld	s1,8(sp)
   106ac:	02010113          	addi	sp,sp,32
   106b0:	00008067          	ret

00000000000106b4 <__register_exitproc>:
   106b4:	f481b703          	ld	a4,-184(gp) # 11f20 <_global_impure_ptr>
   106b8:	1f873783          	ld	a5,504(a4)
   106bc:	06078063          	beqz	a5,1071c <__register_exitproc+0x68>
   106c0:	0087a703          	lw	a4,8(a5)
   106c4:	01f00813          	li	a6,31
   106c8:	08e84663          	blt	a6,a4,10754 <__register_exitproc+0xa0>
   106cc:	02050863          	beqz	a0,106fc <__register_exitproc+0x48>
   106d0:	00371813          	slli	a6,a4,0x3
   106d4:	01078833          	add	a6,a5,a6
   106d8:	10c83823          	sd	a2,272(a6)
   106dc:	3107a883          	lw	a7,784(a5)
   106e0:	00100613          	li	a2,1
   106e4:	00e6163b          	sllw	a2,a2,a4
   106e8:	00c8e8b3          	or	a7,a7,a2
   106ec:	3117a823          	sw	a7,784(a5)
   106f0:	20d83823          	sd	a3,528(a6)
   106f4:	00200693          	li	a3,2
   106f8:	02d50863          	beq	a0,a3,10728 <__register_exitproc+0x74>
   106fc:	00270693          	addi	a3,a4,2
   10700:	00369693          	slli	a3,a3,0x3
   10704:	0017071b          	addiw	a4,a4,1
   10708:	00e7a423          	sw	a4,8(a5)
   1070c:	00d787b3          	add	a5,a5,a3
   10710:	00b7b023          	sd	a1,0(a5)
   10714:	00000513          	li	a0,0
   10718:	00008067          	ret
   1071c:	20070793          	addi	a5,a4,512
   10720:	1ef73c23          	sd	a5,504(a4)
   10724:	f9dff06f          	j	106c0 <__register_exitproc+0xc>
   10728:	3147a683          	lw	a3,788(a5)
   1072c:	00000513          	li	a0,0
   10730:	00c6e6b3          	or	a3,a3,a2
   10734:	30d7aa23          	sw	a3,788(a5)
   10738:	00270693          	addi	a3,a4,2
   1073c:	00369693          	slli	a3,a3,0x3
   10740:	0017071b          	addiw	a4,a4,1
   10744:	00e7a423          	sw	a4,8(a5)
   10748:	00d787b3          	add	a5,a5,a3
   1074c:	00b7b023          	sd	a1,0(a5)
   10750:	00008067          	ret
   10754:	fff00513          	li	a0,-1
   10758:	00008067          	ret

000000000001075c <_exit>:
   1075c:	05d00893          	li	a7,93
   10760:	00000073          	ecall
   10764:	00054463          	bltz	a0,1076c <_exit+0x10>
   10768:	0000006f          	j	10768 <_exit+0xc>
   1076c:	ff010113          	addi	sp,sp,-16
   10770:	00813023          	sd	s0,0(sp)
   10774:	00050413          	mv	s0,a0
   10778:	00113423          	sd	ra,8(sp)
   1077c:	4080043b          	negw	s0,s0
   10780:	00c000ef          	jal	ra,1078c <__errno>
   10784:	00852023          	sw	s0,0(a0)
   10788:	0000006f          	j	10788 <_exit+0x2c>

000000000001078c <__errno>:
   1078c:	f581b503          	ld	a0,-168(gp) # 11f30 <_impure_ptr>
   10790:	00008067          	ret

Disassembly of section .rodata:

0000000000010798 <.rodata>:
   10798:	6e69                	.2byte	0x6e69
   1079a:	7570                	.2byte	0x7570
   1079c:	2074                	.2byte	0x2074
   1079e:	6e69                	.2byte	0x6e69
   107a0:	2074                	.2byte	0x2074
   107a2:	0a78                	.2byte	0xa78
   107a4:	0000                	.2byte	0x0
   107a6:	0000                	.2byte	0x0
   107a8:	690a                	.2byte	0x690a
   107aa:	706e                	.2byte	0x706e
   107ac:	7475                	.2byte	0x7475
   107ae:	6320                	.2byte	0x6320
   107b0:	6168                	.2byte	0x6168
   107b2:	2072                	.2byte	0x2072
   107b4:	63 0a 00            	Address 0x00000000000107b4 is out of bounds.


Disassembly of section .eh_frame:

00000000000117b8 <__FRAME_END__>:
   117b8:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

00000000000117c0 <__init_array_start>:
   117c0:	0118                	.2byte	0x118
   117c2:	0001                	.2byte	0x1
   117c4:	0000                	.2byte	0x0
	...

00000000000117c8 <__frame_dummy_init_array_entry>:
   117c8:	01c0                	.2byte	0x1c0
   117ca:	0001                	.2byte	0x1
   117cc:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

00000000000117d0 <__do_global_dtors_aux_fini_array_entry>:
   117d0:	017c                	.2byte	0x17c
   117d2:	0001                	.2byte	0x1
   117d4:	0000                	.2byte	0x0
	...

Disassembly of section .data:

00000000000117d8 <impure_data>:
	...
   117e0:	1d10                	.2byte	0x1d10
   117e2:	0001                	.2byte	0x1
   117e4:	0000                	.2byte	0x0
   117e6:	0000                	.2byte	0x0
   117e8:	1dc0                	.2byte	0x1dc0
   117ea:	0001                	.2byte	0x1
   117ec:	0000                	.2byte	0x0
   117ee:	0000                	.2byte	0x0
   117f0:	1e70                	.2byte	0x1e70
   117f2:	0001                	.2byte	0x1
	...
   118c0:	0001                	.2byte	0x1
   118c2:	0000                	.2byte	0x0
   118c4:	0000                	.2byte	0x0
   118c6:	0000                	.2byte	0x0
   118c8:	330e                	.2byte	0x330e
   118ca:	abcd                	.2byte	0xabcd
   118cc:	1234                	.2byte	0x1234
   118ce:	e66d                	.2byte	0xe66d
   118d0:	deec                	.2byte	0xdeec
   118d2:	0005                	.2byte	0x5
   118d4:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011f20 <_global_impure_ptr>:
   11f20:	17d8                	.2byte	0x17d8
   11f22:	0001                	.2byte	0x1
   11f24:	0000                	.2byte	0x0
	...

0000000000011f28 <__dso_handle>:
	...

0000000000011f30 <_impure_ptr>:
   11f30:	17d8                	.2byte	0x17d8
   11f32:	0001                	.2byte	0x1
   11f34:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011f38 <completed.1>:
	...

0000000000011f40 <object.0>:
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
