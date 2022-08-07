
hi.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	3dc000ef          	jal	ra,104d8 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11eb8 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	604000ef          	jal	ra,10718 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	61450513          	addi	a0,a0,1556 # 10614 <__libc_fini_array>
   10128:	4d80006f          	j	10600 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	e4018193          	addi	gp,gp,-448 # 11f70 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11ed0 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 11f08 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	2b4000ef          	jal	ra,103fc <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	4b450513          	addi	a0,a0,1204 # 10600 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	4bc50513          	addi	a0,a0,1212 # 10614 <__libc_fini_array>
   10160:	4a0000ef          	jal	ra,10600 <atexit>
   10164:	1fc000ef          	jal	ra,10360 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	06c000ef          	jal	ra,101e0 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11ed0 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	75050513          	addi	a0,a0,1872 # 11750 <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11ed0 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	addi	a1,gp,-152 # 11ed8 <object.0>
   101d0:	75050513          	addi	a0,a0,1872 # 11750 <__FRAME_END__>
   101d4:	00000317          	auipc	t1,0x0
   101d8:	00000067          	jr	zero # 0 <exit-0x100e8>
   101dc:	00008067          	ret

00000000000101e0 <main>:
   101e0:	ff010113          	addi	sp,sp,-16
   101e4:	00113423          	sd	ra,8(sp)
   101e8:	00813023          	sd	s0,0(sp)
   101ec:	01010413          	addi	s0,sp,16
   101f0:	0001c7b7          	lui	a5,0x1c
   101f4:	f5278513          	addi	a0,a5,-174 # 1bf52 <__global_pointer$+0x9fe2>
   101f8:	04c000ef          	jal	ra,10244 <print_num>
   101fc:	074000ef          	jal	ra,10270 <exit_proc>
   10200:	00000793          	li	a5,0
   10204:	00078513          	mv	a0,a5
   10208:	00813083          	ld	ra,8(sp)
   1020c:	00013403          	ld	s0,0(sp)
   10210:	01010113          	addi	sp,sp,16
   10214:	00008067          	ret

0000000000010218 <print_char>:
   10218:	fe010113          	addi	sp,sp,-32
   1021c:	00813c23          	sd	s0,24(sp)
   10220:	02010413          	addi	s0,sp,32
   10224:	00050793          	mv	a5,a0
   10228:	fef407a3          	sb	a5,-17(s0)
   1022c:	00100893          	li	a7,1
   10230:	00000073          	ecall
   10234:	00000013          	nop
   10238:	01813403          	ld	s0,24(sp)
   1023c:	02010113          	addi	sp,sp,32
   10240:	00008067          	ret

0000000000010244 <print_num>:
   10244:	fe010113          	addi	sp,sp,-32
   10248:	00813c23          	sd	s0,24(sp)
   1024c:	02010413          	addi	s0,sp,32
   10250:	00050793          	mv	a5,a0
   10254:	fef42623          	sw	a5,-20(s0)
   10258:	00200893          	li	a7,2
   1025c:	00000073          	ecall
   10260:	00000013          	nop
   10264:	01813403          	ld	s0,24(sp)
   10268:	02010113          	addi	sp,sp,32
   1026c:	00008067          	ret

0000000000010270 <exit_proc>:
   10270:	ff010113          	addi	sp,sp,-16
   10274:	00813423          	sd	s0,8(sp)
   10278:	01010413          	addi	s0,sp,16
   1027c:	00300893          	li	a7,3
   10280:	00000073          	ecall
   10284:	00000013          	nop
   10288:	00813403          	ld	s0,8(sp)
   1028c:	01010113          	addi	sp,sp,16
   10290:	00008067          	ret

0000000000010294 <read_char>:
   10294:	fe010113          	addi	sp,sp,-32
   10298:	00813c23          	sd	s0,24(sp)
   1029c:	02010413          	addi	s0,sp,32
   102a0:	00400893          	li	a7,4
   102a4:	00000073          	ecall
   102a8:	00050793          	mv	a5,a0
   102ac:	fef407a3          	sb	a5,-17(s0)
   102b0:	fef44783          	lbu	a5,-17(s0)
   102b4:	00078513          	mv	a0,a5
   102b8:	01813403          	ld	s0,24(sp)
   102bc:	02010113          	addi	sp,sp,32
   102c0:	00008067          	ret

00000000000102c4 <read_num>:
   102c4:	fe010113          	addi	sp,sp,-32
   102c8:	00813c23          	sd	s0,24(sp)
   102cc:	02010413          	addi	s0,sp,32
   102d0:	00500893          	li	a7,5
   102d4:	00000073          	ecall
   102d8:	00050793          	mv	a5,a0
   102dc:	fef42623          	sw	a5,-20(s0)
   102e0:	fec42783          	lw	a5,-20(s0)
   102e4:	00078513          	mv	a0,a5
   102e8:	01813403          	ld	s0,24(sp)
   102ec:	02010113          	addi	sp,sp,32
   102f0:	00008067          	ret

00000000000102f4 <print_string>:
   102f4:	fd010113          	addi	sp,sp,-48
   102f8:	02113423          	sd	ra,40(sp)
   102fc:	02813023          	sd	s0,32(sp)
   10300:	03010413          	addi	s0,sp,48
   10304:	fca43c23          	sd	a0,-40(s0)
   10308:	fd843783          	ld	a5,-40(s0)
   1030c:	0007c783          	lbu	a5,0(a5)
   10310:	fef407a3          	sb	a5,-17(s0)
   10314:	0280006f          	j	1033c <print_string+0x48>
   10318:	fd843783          	ld	a5,-40(s0)
   1031c:	00178793          	addi	a5,a5,1
   10320:	fcf43c23          	sd	a5,-40(s0)
   10324:	fef44783          	lbu	a5,-17(s0)
   10328:	00078513          	mv	a0,a5
   1032c:	eedff0ef          	jal	ra,10218 <print_char>
   10330:	fd843783          	ld	a5,-40(s0)
   10334:	0007c783          	lbu	a5,0(a5)
   10338:	fef407a3          	sb	a5,-17(s0)
   1033c:	fef44783          	lbu	a5,-17(s0)
   10340:	0ff7f793          	zext.b	a5,a5
   10344:	fc079ae3          	bnez	a5,10318 <print_string+0x24>
   10348:	00000013          	nop
   1034c:	00000013          	nop
   10350:	02813083          	ld	ra,40(sp)
   10354:	02013403          	ld	s0,32(sp)
   10358:	03010113          	addi	sp,sp,48
   1035c:	00008067          	ret

0000000000010360 <__libc_init_array>:
   10360:	fe010113          	addi	sp,sp,-32
   10364:	00813823          	sd	s0,16(sp)
   10368:	01213023          	sd	s2,0(sp)
   1036c:	00011437          	lui	s0,0x11
   10370:	00011937          	lui	s2,0x11
   10374:	75440793          	addi	a5,s0,1876 # 11754 <__preinit_array_end>
   10378:	75490913          	addi	s2,s2,1876 # 11754 <__preinit_array_end>
   1037c:	40f90933          	sub	s2,s2,a5
   10380:	00113c23          	sd	ra,24(sp)
   10384:	00913423          	sd	s1,8(sp)
   10388:	40395913          	srai	s2,s2,0x3
   1038c:	02090063          	beqz	s2,103ac <__libc_init_array+0x4c>
   10390:	75440413          	addi	s0,s0,1876
   10394:	00000493          	li	s1,0
   10398:	00043783          	ld	a5,0(s0)
   1039c:	00148493          	addi	s1,s1,1
   103a0:	00840413          	addi	s0,s0,8
   103a4:	000780e7          	jalr	a5
   103a8:	fe9918e3          	bne	s2,s1,10398 <__libc_init_array+0x38>
   103ac:	00011437          	lui	s0,0x11
   103b0:	00011937          	lui	s2,0x11
   103b4:	75840793          	addi	a5,s0,1880 # 11758 <__init_array_start>
   103b8:	76890913          	addi	s2,s2,1896 # 11768 <__do_global_dtors_aux_fini_array_entry>
   103bc:	40f90933          	sub	s2,s2,a5
   103c0:	40395913          	srai	s2,s2,0x3
   103c4:	02090063          	beqz	s2,103e4 <__libc_init_array+0x84>
   103c8:	75840413          	addi	s0,s0,1880
   103cc:	00000493          	li	s1,0
   103d0:	00043783          	ld	a5,0(s0)
   103d4:	00148493          	addi	s1,s1,1
   103d8:	00840413          	addi	s0,s0,8
   103dc:	000780e7          	jalr	a5
   103e0:	fe9918e3          	bne	s2,s1,103d0 <__libc_init_array+0x70>
   103e4:	01813083          	ld	ra,24(sp)
   103e8:	01013403          	ld	s0,16(sp)
   103ec:	00813483          	ld	s1,8(sp)
   103f0:	00013903          	ld	s2,0(sp)
   103f4:	02010113          	addi	sp,sp,32
   103f8:	00008067          	ret

00000000000103fc <memset>:
   103fc:	00f00313          	li	t1,15
   10400:	00050713          	mv	a4,a0
   10404:	02c37a63          	bgeu	t1,a2,10438 <memset+0x3c>
   10408:	00f77793          	andi	a5,a4,15
   1040c:	0a079063          	bnez	a5,104ac <memset+0xb0>
   10410:	06059e63          	bnez	a1,1048c <memset+0x90>
   10414:	ff067693          	andi	a3,a2,-16
   10418:	00f67613          	andi	a2,a2,15
   1041c:	00e686b3          	add	a3,a3,a4
   10420:	00b73023          	sd	a1,0(a4)
   10424:	00b73423          	sd	a1,8(a4)
   10428:	01070713          	addi	a4,a4,16
   1042c:	fed76ae3          	bltu	a4,a3,10420 <memset+0x24>
   10430:	00061463          	bnez	a2,10438 <memset+0x3c>
   10434:	00008067          	ret
   10438:	40c306b3          	sub	a3,t1,a2
   1043c:	00269693          	slli	a3,a3,0x2
   10440:	00000297          	auipc	t0,0x0
   10444:	005686b3          	add	a3,a3,t0
   10448:	00c68067          	jr	12(a3)
   1044c:	00b70723          	sb	a1,14(a4)
   10450:	00b706a3          	sb	a1,13(a4)
   10454:	00b70623          	sb	a1,12(a4)
   10458:	00b705a3          	sb	a1,11(a4)
   1045c:	00b70523          	sb	a1,10(a4)
   10460:	00b704a3          	sb	a1,9(a4)
   10464:	00b70423          	sb	a1,8(a4)
   10468:	00b703a3          	sb	a1,7(a4)
   1046c:	00b70323          	sb	a1,6(a4)
   10470:	00b702a3          	sb	a1,5(a4)
   10474:	00b70223          	sb	a1,4(a4)
   10478:	00b701a3          	sb	a1,3(a4)
   1047c:	00b70123          	sb	a1,2(a4)
   10480:	00b700a3          	sb	a1,1(a4)
   10484:	00b70023          	sb	a1,0(a4)
   10488:	00008067          	ret
   1048c:	0ff5f593          	zext.b	a1,a1
   10490:	00859693          	slli	a3,a1,0x8
   10494:	00d5e5b3          	or	a1,a1,a3
   10498:	01059693          	slli	a3,a1,0x10
   1049c:	00d5e5b3          	or	a1,a1,a3
   104a0:	02059693          	slli	a3,a1,0x20
   104a4:	00d5e5b3          	or	a1,a1,a3
   104a8:	f6dff06f          	j	10414 <memset+0x18>
   104ac:	00279693          	slli	a3,a5,0x2
   104b0:	00000297          	auipc	t0,0x0
   104b4:	005686b3          	add	a3,a3,t0
   104b8:	00008293          	mv	t0,ra
   104bc:	f98680e7          	jalr	-104(a3)
   104c0:	00028093          	mv	ra,t0
   104c4:	ff078793          	addi	a5,a5,-16
   104c8:	40f70733          	sub	a4,a4,a5
   104cc:	00f60633          	add	a2,a2,a5
   104d0:	f6c374e3          	bgeu	t1,a2,10438 <memset+0x3c>
   104d4:	f3dff06f          	j	10410 <memset+0x14>

00000000000104d8 <__call_exitprocs>:
   104d8:	fb010113          	addi	sp,sp,-80
   104dc:	03413023          	sd	s4,32(sp)
   104e0:	f481ba03          	ld	s4,-184(gp) # 11eb8 <_global_impure_ptr>
   104e4:	03213823          	sd	s2,48(sp)
   104e8:	04113423          	sd	ra,72(sp)
   104ec:	1f8a3903          	ld	s2,504(s4)
   104f0:	04813023          	sd	s0,64(sp)
   104f4:	02913c23          	sd	s1,56(sp)
   104f8:	03313423          	sd	s3,40(sp)
   104fc:	01513c23          	sd	s5,24(sp)
   10500:	01613823          	sd	s6,16(sp)
   10504:	01713423          	sd	s7,8(sp)
   10508:	01813023          	sd	s8,0(sp)
   1050c:	04090063          	beqz	s2,1054c <__call_exitprocs+0x74>
   10510:	00050b13          	mv	s6,a0
   10514:	00058b93          	mv	s7,a1
   10518:	00100a93          	li	s5,1
   1051c:	fff00993          	li	s3,-1
   10520:	00892483          	lw	s1,8(s2)
   10524:	fff4841b          	addiw	s0,s1,-1
   10528:	02044263          	bltz	s0,1054c <__call_exitprocs+0x74>
   1052c:	00349493          	slli	s1,s1,0x3
   10530:	009904b3          	add	s1,s2,s1
   10534:	040b8463          	beqz	s7,1057c <__call_exitprocs+0xa4>
   10538:	2084b783          	ld	a5,520(s1)
   1053c:	05778063          	beq	a5,s7,1057c <__call_exitprocs+0xa4>
   10540:	fff4041b          	addiw	s0,s0,-1
   10544:	ff848493          	addi	s1,s1,-8
   10548:	ff3416e3          	bne	s0,s3,10534 <__call_exitprocs+0x5c>
   1054c:	04813083          	ld	ra,72(sp)
   10550:	04013403          	ld	s0,64(sp)
   10554:	03813483          	ld	s1,56(sp)
   10558:	03013903          	ld	s2,48(sp)
   1055c:	02813983          	ld	s3,40(sp)
   10560:	02013a03          	ld	s4,32(sp)
   10564:	01813a83          	ld	s5,24(sp)
   10568:	01013b03          	ld	s6,16(sp)
   1056c:	00813b83          	ld	s7,8(sp)
   10570:	00013c03          	ld	s8,0(sp)
   10574:	05010113          	addi	sp,sp,80
   10578:	00008067          	ret
   1057c:	00892783          	lw	a5,8(s2)
   10580:	0084b703          	ld	a4,8(s1)
   10584:	fff7879b          	addiw	a5,a5,-1
   10588:	06878263          	beq	a5,s0,105ec <__call_exitprocs+0x114>
   1058c:	0004b423          	sd	zero,8(s1)
   10590:	fa0708e3          	beqz	a4,10540 <__call_exitprocs+0x68>
   10594:	31092783          	lw	a5,784(s2)
   10598:	008a96bb          	sllw	a3,s5,s0
   1059c:	00892c03          	lw	s8,8(s2)
   105a0:	00d7f7b3          	and	a5,a5,a3
   105a4:	0007879b          	sext.w	a5,a5
   105a8:	02079263          	bnez	a5,105cc <__call_exitprocs+0xf4>
   105ac:	000700e7          	jalr	a4
   105b0:	00892703          	lw	a4,8(s2)
   105b4:	1f8a3783          	ld	a5,504(s4)
   105b8:	01871463          	bne	a4,s8,105c0 <__call_exitprocs+0xe8>
   105bc:	f92782e3          	beq	a5,s2,10540 <__call_exitprocs+0x68>
   105c0:	f80786e3          	beqz	a5,1054c <__call_exitprocs+0x74>
   105c4:	00078913          	mv	s2,a5
   105c8:	f59ff06f          	j	10520 <__call_exitprocs+0x48>
   105cc:	31492783          	lw	a5,788(s2)
   105d0:	1084b583          	ld	a1,264(s1)
   105d4:	00d7f7b3          	and	a5,a5,a3
   105d8:	0007879b          	sext.w	a5,a5
   105dc:	00079c63          	bnez	a5,105f4 <__call_exitprocs+0x11c>
   105e0:	000b0513          	mv	a0,s6
   105e4:	000700e7          	jalr	a4
   105e8:	fc9ff06f          	j	105b0 <__call_exitprocs+0xd8>
   105ec:	00892423          	sw	s0,8(s2)
   105f0:	fa1ff06f          	j	10590 <__call_exitprocs+0xb8>
   105f4:	00058513          	mv	a0,a1
   105f8:	000700e7          	jalr	a4
   105fc:	fb5ff06f          	j	105b0 <__call_exitprocs+0xd8>

0000000000010600 <atexit>:
   10600:	00050593          	mv	a1,a0
   10604:	00000693          	li	a3,0
   10608:	00000613          	li	a2,0
   1060c:	00000513          	li	a0,0
   10610:	0600006f          	j	10670 <__register_exitproc>

0000000000010614 <__libc_fini_array>:
   10614:	fe010113          	addi	sp,sp,-32
   10618:	00813823          	sd	s0,16(sp)
   1061c:	000117b7          	lui	a5,0x11
   10620:	00011437          	lui	s0,0x11
   10624:	76878793          	addi	a5,a5,1896 # 11768 <__do_global_dtors_aux_fini_array_entry>
   10628:	77040413          	addi	s0,s0,1904 # 11770 <impure_data>
   1062c:	40f40433          	sub	s0,s0,a5
   10630:	00913423          	sd	s1,8(sp)
   10634:	00113c23          	sd	ra,24(sp)
   10638:	40345493          	srai	s1,s0,0x3
   1063c:	02048063          	beqz	s1,1065c <__libc_fini_array+0x48>
   10640:	ff840413          	addi	s0,s0,-8
   10644:	00f40433          	add	s0,s0,a5
   10648:	00043783          	ld	a5,0(s0)
   1064c:	fff48493          	addi	s1,s1,-1
   10650:	ff840413          	addi	s0,s0,-8
   10654:	000780e7          	jalr	a5
   10658:	fe0498e3          	bnez	s1,10648 <__libc_fini_array+0x34>
   1065c:	01813083          	ld	ra,24(sp)
   10660:	01013403          	ld	s0,16(sp)
   10664:	00813483          	ld	s1,8(sp)
   10668:	02010113          	addi	sp,sp,32
   1066c:	00008067          	ret

0000000000010670 <__register_exitproc>:
   10670:	f481b703          	ld	a4,-184(gp) # 11eb8 <_global_impure_ptr>
   10674:	1f873783          	ld	a5,504(a4)
   10678:	06078063          	beqz	a5,106d8 <__register_exitproc+0x68>
   1067c:	0087a703          	lw	a4,8(a5)
   10680:	01f00813          	li	a6,31
   10684:	08e84663          	blt	a6,a4,10710 <__register_exitproc+0xa0>
   10688:	02050863          	beqz	a0,106b8 <__register_exitproc+0x48>
   1068c:	00371813          	slli	a6,a4,0x3
   10690:	01078833          	add	a6,a5,a6
   10694:	10c83823          	sd	a2,272(a6)
   10698:	3107a883          	lw	a7,784(a5)
   1069c:	00100613          	li	a2,1
   106a0:	00e6163b          	sllw	a2,a2,a4
   106a4:	00c8e8b3          	or	a7,a7,a2
   106a8:	3117a823          	sw	a7,784(a5)
   106ac:	20d83823          	sd	a3,528(a6)
   106b0:	00200693          	li	a3,2
   106b4:	02d50863          	beq	a0,a3,106e4 <__register_exitproc+0x74>
   106b8:	00270693          	addi	a3,a4,2
   106bc:	00369693          	slli	a3,a3,0x3
   106c0:	0017071b          	addiw	a4,a4,1
   106c4:	00e7a423          	sw	a4,8(a5)
   106c8:	00d787b3          	add	a5,a5,a3
   106cc:	00b7b023          	sd	a1,0(a5)
   106d0:	00000513          	li	a0,0
   106d4:	00008067          	ret
   106d8:	20070793          	addi	a5,a4,512
   106dc:	1ef73c23          	sd	a5,504(a4)
   106e0:	f9dff06f          	j	1067c <__register_exitproc+0xc>
   106e4:	3147a683          	lw	a3,788(a5)
   106e8:	00000513          	li	a0,0
   106ec:	00c6e6b3          	or	a3,a3,a2
   106f0:	30d7aa23          	sw	a3,788(a5)
   106f4:	00270693          	addi	a3,a4,2
   106f8:	00369693          	slli	a3,a3,0x3
   106fc:	0017071b          	addiw	a4,a4,1
   10700:	00e7a423          	sw	a4,8(a5)
   10704:	00d787b3          	add	a5,a5,a3
   10708:	00b7b023          	sd	a1,0(a5)
   1070c:	00008067          	ret
   10710:	fff00513          	li	a0,-1
   10714:	00008067          	ret

0000000000010718 <_exit>:
   10718:	05d00893          	li	a7,93
   1071c:	00000073          	ecall
   10720:	00054463          	bltz	a0,10728 <_exit+0x10>
   10724:	0000006f          	j	10724 <_exit+0xc>
   10728:	ff010113          	addi	sp,sp,-16
   1072c:	00813023          	sd	s0,0(sp)
   10730:	00050413          	mv	s0,a0
   10734:	00113423          	sd	ra,8(sp)
   10738:	4080043b          	negw	s0,s0
   1073c:	00c000ef          	jal	ra,10748 <__errno>
   10740:	00852023          	sw	s0,0(a0)
   10744:	0000006f          	j	10744 <_exit+0x2c>

0000000000010748 <__errno>:
   10748:	f581b503          	ld	a0,-168(gp) # 11ec8 <_impure_ptr>
   1074c:	00008067          	ret

Disassembly of section .eh_frame:

0000000000011750 <__FRAME_END__>:
   11750:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

0000000000011758 <__init_array_start>:
   11758:	0118                	.2byte	0x118
   1175a:	0001                	.2byte	0x1
   1175c:	0000                	.2byte	0x0
	...

0000000000011760 <__frame_dummy_init_array_entry>:
   11760:	01c0                	.2byte	0x1c0
   11762:	0001                	.2byte	0x1
   11764:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

0000000000011768 <__do_global_dtors_aux_fini_array_entry>:
   11768:	017c                	.2byte	0x17c
   1176a:	0001                	.2byte	0x1
   1176c:	0000                	.2byte	0x0
	...

Disassembly of section .data:

0000000000011770 <impure_data>:
	...
   11778:	1ca8                	.2byte	0x1ca8
   1177a:	0001                	.2byte	0x1
   1177c:	0000                	.2byte	0x0
   1177e:	0000                	.2byte	0x0
   11780:	1d58                	.2byte	0x1d58
   11782:	0001                	.2byte	0x1
   11784:	0000                	.2byte	0x0
   11786:	0000                	.2byte	0x0
   11788:	1e08                	.2byte	0x1e08
   1178a:	0001                	.2byte	0x1
	...
   11858:	0001                	.2byte	0x1
   1185a:	0000                	.2byte	0x0
   1185c:	0000                	.2byte	0x0
   1185e:	0000                	.2byte	0x0
   11860:	330e                	.2byte	0x330e
   11862:	abcd                	.2byte	0xabcd
   11864:	1234                	.2byte	0x1234
   11866:	e66d                	.2byte	0xe66d
   11868:	deec                	.2byte	0xdeec
   1186a:	0005                	.2byte	0x5
   1186c:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011eb8 <_global_impure_ptr>:
   11eb8:	1770                	.2byte	0x1770
   11eba:	0001                	.2byte	0x1
   11ebc:	0000                	.2byte	0x0
	...

0000000000011ec0 <__dso_handle>:
	...

0000000000011ec8 <_impure_ptr>:
   11ec8:	1770                	.2byte	0x1770
   11eca:	0001                	.2byte	0x1
   11ecc:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011ed0 <completed.1>:
	...

0000000000011ed8 <object.0>:
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
