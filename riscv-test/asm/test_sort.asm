
riscv-test/elf/test_sort.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	5c0000ef          	jal	ra,106bc <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	7e8000ef          	jal	ra,108fc <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	7f850513          	addi	a0,a0,2040 # 107f8 <__libc_fini_array>
   10128:	6bc0006f          	j	107e4 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	addi	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	498000ef          	jal	ra,105e0 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	69850513          	addi	a0,a0,1688 # 107e4 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	6a050513          	addi	a0,a0,1696 # 107f8 <__libc_fini_array>
   10160:	684000ef          	jal	ra,107e4 <atexit>
   10164:	3e0000ef          	jal	ra,10544 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	1b4000ef          	jal	ra,10328 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11780 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00011537          	lui	a0,0x11
   1019c:	00050513          	mv	a0,a0
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11780 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00011537          	lui	a0,0x11
   101cc:	f6818593          	addi	a1,gp,-152 # 11788 <object.0>
   101d0:	00050513          	mv	a0,a0
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
   10328:	f9010113          	addi	sp,sp,-112
   1032c:	06113423          	sd	ra,104(sp)
   10330:	06813023          	sd	s0,96(sp)
   10334:	07010413          	addi	s0,sp,112
   10338:	000117b7          	lui	a5,0x11
   1033c:	94878793          	addi	a5,a5,-1720 # 10948 <__errno+0x1c>
   10340:	0007be03          	ld	t3,0(a5)
   10344:	0087b303          	ld	t1,8(a5)
   10348:	0107b883          	ld	a7,16(a5)
   1034c:	0187b803          	ld	a6,24(a5)
   10350:	0207b503          	ld	a0,32(a5)
   10354:	0287b583          	ld	a1,40(a5)
   10358:	0307b603          	ld	a2,48(a5)
   1035c:	0387b683          	ld	a3,56(a5)
   10360:	0407b703          	ld	a4,64(a5)
   10364:	0487b783          	ld	a5,72(a5)
   10368:	f9c43823          	sd	t3,-112(s0)
   1036c:	f8643c23          	sd	t1,-104(s0)
   10370:	fb143023          	sd	a7,-96(s0)
   10374:	fb043423          	sd	a6,-88(s0)
   10378:	faa43823          	sd	a0,-80(s0)
   1037c:	fab43c23          	sd	a1,-72(s0)
   10380:	fcc43023          	sd	a2,-64(s0)
   10384:	fcd43423          	sd	a3,-56(s0)
   10388:	fce43823          	sd	a4,-48(s0)
   1038c:	fcf43c23          	sd	a5,-40(s0)
   10390:	fe042623          	sw	zero,-20(s0)
   10394:	fe042423          	sw	zero,-24(s0)
   10398:	fe042223          	sw	zero,-28(s0)
   1039c:	000117b7          	lui	a5,0x11
   103a0:	93878513          	addi	a0,a5,-1736 # 10938 <__errno+0xc>
   103a4:	f19ff0ef          	jal	ra,102bc <print_string>
   103a8:	fe042623          	sw	zero,-20(s0)
   103ac:	0340006f          	j	103e0 <main+0xb8>
   103b0:	fec42783          	lw	a5,-20(s0)
   103b4:	00279793          	slli	a5,a5,0x2
   103b8:	ff078793          	addi	a5,a5,-16
   103bc:	008787b3          	add	a5,a5,s0
   103c0:	fa07a783          	lw	a5,-96(a5)
   103c4:	00078513          	mv	a0,a5
   103c8:	e45ff0ef          	jal	ra,1020c <print_num>
   103cc:	02000513          	li	a0,32
   103d0:	e11ff0ef          	jal	ra,101e0 <print_char>
   103d4:	fec42783          	lw	a5,-20(s0)
   103d8:	0017879b          	addiw	a5,a5,1
   103dc:	fef42623          	sw	a5,-20(s0)
   103e0:	fec42783          	lw	a5,-20(s0)
   103e4:	0007871b          	sext.w	a4,a5
   103e8:	01300793          	li	a5,19
   103ec:	fce7d2e3          	bge	a5,a4,103b0 <main+0x88>
   103f0:	00a00513          	li	a0,10
   103f4:	dedff0ef          	jal	ra,101e0 <print_char>
   103f8:	fe042623          	sw	zero,-20(s0)
   103fc:	0c00006f          	j	104bc <main+0x194>
   10400:	fec42783          	lw	a5,-20(s0)
   10404:	0017879b          	addiw	a5,a5,1
   10408:	fef42423          	sw	a5,-24(s0)
   1040c:	0940006f          	j	104a0 <main+0x178>
   10410:	fec42783          	lw	a5,-20(s0)
   10414:	00279793          	slli	a5,a5,0x2
   10418:	ff078793          	addi	a5,a5,-16
   1041c:	008787b3          	add	a5,a5,s0
   10420:	fa07a703          	lw	a4,-96(a5)
   10424:	fe842783          	lw	a5,-24(s0)
   10428:	00279793          	slli	a5,a5,0x2
   1042c:	ff078793          	addi	a5,a5,-16
   10430:	008787b3          	add	a5,a5,s0
   10434:	fa07a783          	lw	a5,-96(a5)
   10438:	04e7de63          	bge	a5,a4,10494 <main+0x16c>
   1043c:	fe842783          	lw	a5,-24(s0)
   10440:	00279793          	slli	a5,a5,0x2
   10444:	ff078793          	addi	a5,a5,-16
   10448:	008787b3          	add	a5,a5,s0
   1044c:	fa07a783          	lw	a5,-96(a5)
   10450:	fef42223          	sw	a5,-28(s0)
   10454:	fec42783          	lw	a5,-20(s0)
   10458:	00279793          	slli	a5,a5,0x2
   1045c:	ff078793          	addi	a5,a5,-16
   10460:	008787b3          	add	a5,a5,s0
   10464:	fa07a703          	lw	a4,-96(a5)
   10468:	fe842783          	lw	a5,-24(s0)
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	ff078793          	addi	a5,a5,-16
   10474:	008787b3          	add	a5,a5,s0
   10478:	fae7a023          	sw	a4,-96(a5)
   1047c:	fec42783          	lw	a5,-20(s0)
   10480:	00279793          	slli	a5,a5,0x2
   10484:	ff078793          	addi	a5,a5,-16
   10488:	008787b3          	add	a5,a5,s0
   1048c:	fe442703          	lw	a4,-28(s0)
   10490:	fae7a023          	sw	a4,-96(a5)
   10494:	fe842783          	lw	a5,-24(s0)
   10498:	0017879b          	addiw	a5,a5,1
   1049c:	fef42423          	sw	a5,-24(s0)
   104a0:	fe842783          	lw	a5,-24(s0)
   104a4:	0007871b          	sext.w	a4,a5
   104a8:	01300793          	li	a5,19
   104ac:	f6e7d2e3          	bge	a5,a4,10410 <main+0xe8>
   104b0:	fec42783          	lw	a5,-20(s0)
   104b4:	0017879b          	addiw	a5,a5,1
   104b8:	fef42623          	sw	a5,-20(s0)
   104bc:	fec42783          	lw	a5,-20(s0)
   104c0:	0007871b          	sext.w	a4,a5
   104c4:	01300793          	li	a5,19
   104c8:	f2e7dce3          	bge	a5,a4,10400 <main+0xd8>
   104cc:	000117b7          	lui	a5,0x11
   104d0:	94078513          	addi	a0,a5,-1728 # 10940 <__errno+0x14>
   104d4:	de9ff0ef          	jal	ra,102bc <print_string>
   104d8:	fe042623          	sw	zero,-20(s0)
   104dc:	0340006f          	j	10510 <main+0x1e8>
   104e0:	fec42783          	lw	a5,-20(s0)
   104e4:	00279793          	slli	a5,a5,0x2
   104e8:	ff078793          	addi	a5,a5,-16
   104ec:	008787b3          	add	a5,a5,s0
   104f0:	fa07a783          	lw	a5,-96(a5)
   104f4:	00078513          	mv	a0,a5
   104f8:	d15ff0ef          	jal	ra,1020c <print_num>
   104fc:	02000513          	li	a0,32
   10500:	ce1ff0ef          	jal	ra,101e0 <print_char>
   10504:	fec42783          	lw	a5,-20(s0)
   10508:	0017879b          	addiw	a5,a5,1
   1050c:	fef42623          	sw	a5,-20(s0)
   10510:	fec42783          	lw	a5,-20(s0)
   10514:	0007871b          	sext.w	a4,a5
   10518:	01300793          	li	a5,19
   1051c:	fce7d2e3          	bge	a5,a4,104e0 <main+0x1b8>
   10520:	00a00513          	li	a0,10
   10524:	cbdff0ef          	jal	ra,101e0 <print_char>
   10528:	d11ff0ef          	jal	ra,10238 <exit_proc>
   1052c:	00000793          	li	a5,0
   10530:	00078513          	mv	a0,a5
   10534:	06813083          	ld	ra,104(sp)
   10538:	06013403          	ld	s0,96(sp)
   1053c:	07010113          	addi	sp,sp,112
   10540:	00008067          	ret

0000000000010544 <__libc_init_array>:
   10544:	fe010113          	addi	sp,sp,-32
   10548:	00813823          	sd	s0,16(sp)
   1054c:	01213023          	sd	s2,0(sp)
   10550:	00011437          	lui	s0,0x11
   10554:	00011937          	lui	s2,0x11
   10558:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   1055c:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10560:	40f90933          	sub	s2,s2,a5
   10564:	00113c23          	sd	ra,24(sp)
   10568:	00913423          	sd	s1,8(sp)
   1056c:	40395913          	srai	s2,s2,0x3
   10570:	02090063          	beqz	s2,10590 <__libc_init_array+0x4c>
   10574:	00440413          	addi	s0,s0,4
   10578:	00000493          	li	s1,0
   1057c:	00043783          	ld	a5,0(s0)
   10580:	00148493          	addi	s1,s1,1
   10584:	00840413          	addi	s0,s0,8
   10588:	000780e7          	jalr	a5
   1058c:	fe9918e3          	bne	s2,s1,1057c <__libc_init_array+0x38>
   10590:	00011437          	lui	s0,0x11
   10594:	00011937          	lui	s2,0x11
   10598:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1059c:	01890913          	addi	s2,s2,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   105a0:	40f90933          	sub	s2,s2,a5
   105a4:	40395913          	srai	s2,s2,0x3
   105a8:	02090063          	beqz	s2,105c8 <__libc_init_array+0x84>
   105ac:	00840413          	addi	s0,s0,8
   105b0:	00000493          	li	s1,0
   105b4:	00043783          	ld	a5,0(s0)
   105b8:	00148493          	addi	s1,s1,1
   105bc:	00840413          	addi	s0,s0,8
   105c0:	000780e7          	jalr	a5
   105c4:	fe9918e3          	bne	s2,s1,105b4 <__libc_init_array+0x70>
   105c8:	01813083          	ld	ra,24(sp)
   105cc:	01013403          	ld	s0,16(sp)
   105d0:	00813483          	ld	s1,8(sp)
   105d4:	00013903          	ld	s2,0(sp)
   105d8:	02010113          	addi	sp,sp,32
   105dc:	00008067          	ret

00000000000105e0 <memset>:
   105e0:	00f00313          	li	t1,15
   105e4:	00050713          	mv	a4,a0
   105e8:	02c37a63          	bgeu	t1,a2,1061c <memset+0x3c>
   105ec:	00f77793          	andi	a5,a4,15
   105f0:	0a079063          	bnez	a5,10690 <memset+0xb0>
   105f4:	06059e63          	bnez	a1,10670 <memset+0x90>
   105f8:	ff067693          	andi	a3,a2,-16
   105fc:	00f67613          	andi	a2,a2,15
   10600:	00e686b3          	add	a3,a3,a4
   10604:	00b73023          	sd	a1,0(a4)
   10608:	00b73423          	sd	a1,8(a4)
   1060c:	01070713          	addi	a4,a4,16
   10610:	fed76ae3          	bltu	a4,a3,10604 <memset+0x24>
   10614:	00061463          	bnez	a2,1061c <memset+0x3c>
   10618:	00008067          	ret
   1061c:	40c306b3          	sub	a3,t1,a2
   10620:	00269693          	slli	a3,a3,0x2
   10624:	00000297          	auipc	t0,0x0
   10628:	005686b3          	add	a3,a3,t0
   1062c:	00c68067          	jr	12(a3)
   10630:	00b70723          	sb	a1,14(a4)
   10634:	00b706a3          	sb	a1,13(a4)
   10638:	00b70623          	sb	a1,12(a4)
   1063c:	00b705a3          	sb	a1,11(a4)
   10640:	00b70523          	sb	a1,10(a4)
   10644:	00b704a3          	sb	a1,9(a4)
   10648:	00b70423          	sb	a1,8(a4)
   1064c:	00b703a3          	sb	a1,7(a4)
   10650:	00b70323          	sb	a1,6(a4)
   10654:	00b702a3          	sb	a1,5(a4)
   10658:	00b70223          	sb	a1,4(a4)
   1065c:	00b701a3          	sb	a1,3(a4)
   10660:	00b70123          	sb	a1,2(a4)
   10664:	00b700a3          	sb	a1,1(a4)
   10668:	00b70023          	sb	a1,0(a4)
   1066c:	00008067          	ret
   10670:	0ff5f593          	zext.b	a1,a1
   10674:	00859693          	slli	a3,a1,0x8
   10678:	00d5e5b3          	or	a1,a1,a3
   1067c:	01059693          	slli	a3,a1,0x10
   10680:	00d5e5b3          	or	a1,a1,a3
   10684:	02059693          	slli	a3,a1,0x20
   10688:	00d5e5b3          	or	a1,a1,a3
   1068c:	f6dff06f          	j	105f8 <memset+0x18>
   10690:	00279693          	slli	a3,a5,0x2
   10694:	00000297          	auipc	t0,0x0
   10698:	005686b3          	add	a3,a3,t0
   1069c:	00008293          	mv	t0,ra
   106a0:	f98680e7          	jalr	-104(a3)
   106a4:	00028093          	mv	ra,t0
   106a8:	ff078793          	addi	a5,a5,-16
   106ac:	40f70733          	sub	a4,a4,a5
   106b0:	00f60633          	add	a2,a2,a5
   106b4:	f6c374e3          	bgeu	t1,a2,1061c <memset+0x3c>
   106b8:	f3dff06f          	j	105f4 <memset+0x14>

00000000000106bc <__call_exitprocs>:
   106bc:	fb010113          	addi	sp,sp,-80
   106c0:	03413023          	sd	s4,32(sp)
   106c4:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   106c8:	03213823          	sd	s2,48(sp)
   106cc:	04113423          	sd	ra,72(sp)
   106d0:	1f8a3903          	ld	s2,504(s4)
   106d4:	04813023          	sd	s0,64(sp)
   106d8:	02913c23          	sd	s1,56(sp)
   106dc:	03313423          	sd	s3,40(sp)
   106e0:	01513c23          	sd	s5,24(sp)
   106e4:	01613823          	sd	s6,16(sp)
   106e8:	01713423          	sd	s7,8(sp)
   106ec:	01813023          	sd	s8,0(sp)
   106f0:	04090063          	beqz	s2,10730 <__call_exitprocs+0x74>
   106f4:	00050b13          	mv	s6,a0
   106f8:	00058b93          	mv	s7,a1
   106fc:	00100a93          	li	s5,1
   10700:	fff00993          	li	s3,-1
   10704:	00892483          	lw	s1,8(s2)
   10708:	fff4841b          	addiw	s0,s1,-1
   1070c:	02044263          	bltz	s0,10730 <__call_exitprocs+0x74>
   10710:	00349493          	slli	s1,s1,0x3
   10714:	009904b3          	add	s1,s2,s1
   10718:	040b8463          	beqz	s7,10760 <__call_exitprocs+0xa4>
   1071c:	2084b783          	ld	a5,520(s1)
   10720:	05778063          	beq	a5,s7,10760 <__call_exitprocs+0xa4>
   10724:	fff4041b          	addiw	s0,s0,-1
   10728:	ff848493          	addi	s1,s1,-8
   1072c:	ff3416e3          	bne	s0,s3,10718 <__call_exitprocs+0x5c>
   10730:	04813083          	ld	ra,72(sp)
   10734:	04013403          	ld	s0,64(sp)
   10738:	03813483          	ld	s1,56(sp)
   1073c:	03013903          	ld	s2,48(sp)
   10740:	02813983          	ld	s3,40(sp)
   10744:	02013a03          	ld	s4,32(sp)
   10748:	01813a83          	ld	s5,24(sp)
   1074c:	01013b03          	ld	s6,16(sp)
   10750:	00813b83          	ld	s7,8(sp)
   10754:	00013c03          	ld	s8,0(sp)
   10758:	05010113          	addi	sp,sp,80
   1075c:	00008067          	ret
   10760:	00892783          	lw	a5,8(s2)
   10764:	0084b703          	ld	a4,8(s1)
   10768:	fff7879b          	addiw	a5,a5,-1
   1076c:	06878263          	beq	a5,s0,107d0 <__call_exitprocs+0x114>
   10770:	0004b423          	sd	zero,8(s1)
   10774:	fa0708e3          	beqz	a4,10724 <__call_exitprocs+0x68>
   10778:	31092783          	lw	a5,784(s2)
   1077c:	008a96bb          	sllw	a3,s5,s0
   10780:	00892c03          	lw	s8,8(s2)
   10784:	00d7f7b3          	and	a5,a5,a3
   10788:	0007879b          	sext.w	a5,a5
   1078c:	02079263          	bnez	a5,107b0 <__call_exitprocs+0xf4>
   10790:	000700e7          	jalr	a4
   10794:	00892703          	lw	a4,8(s2)
   10798:	1f8a3783          	ld	a5,504(s4)
   1079c:	01871463          	bne	a4,s8,107a4 <__call_exitprocs+0xe8>
   107a0:	f92782e3          	beq	a5,s2,10724 <__call_exitprocs+0x68>
   107a4:	f80786e3          	beqz	a5,10730 <__call_exitprocs+0x74>
   107a8:	00078913          	mv	s2,a5
   107ac:	f59ff06f          	j	10704 <__call_exitprocs+0x48>
   107b0:	31492783          	lw	a5,788(s2)
   107b4:	1084b583          	ld	a1,264(s1)
   107b8:	00d7f7b3          	and	a5,a5,a3
   107bc:	0007879b          	sext.w	a5,a5
   107c0:	00079c63          	bnez	a5,107d8 <__call_exitprocs+0x11c>
   107c4:	000b0513          	mv	a0,s6
   107c8:	000700e7          	jalr	a4
   107cc:	fc9ff06f          	j	10794 <__call_exitprocs+0xd8>
   107d0:	00892423          	sw	s0,8(s2)
   107d4:	fa1ff06f          	j	10774 <__call_exitprocs+0xb8>
   107d8:	00058513          	mv	a0,a1
   107dc:	000700e7          	jalr	a4
   107e0:	fb5ff06f          	j	10794 <__call_exitprocs+0xd8>

00000000000107e4 <atexit>:
   107e4:	00050593          	mv	a1,a0
   107e8:	00000693          	li	a3,0
   107ec:	00000613          	li	a2,0
   107f0:	00000513          	li	a0,0
   107f4:	0600006f          	j	10854 <__register_exitproc>

00000000000107f8 <__libc_fini_array>:
   107f8:	fe010113          	addi	sp,sp,-32
   107fc:	00813823          	sd	s0,16(sp)
   10800:	000117b7          	lui	a5,0x11
   10804:	00011437          	lui	s0,0x11
   10808:	01878793          	addi	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   1080c:	02040413          	addi	s0,s0,32 # 11020 <impure_data>
   10810:	40f40433          	sub	s0,s0,a5
   10814:	00913423          	sd	s1,8(sp)
   10818:	00113c23          	sd	ra,24(sp)
   1081c:	40345493          	srai	s1,s0,0x3
   10820:	02048063          	beqz	s1,10840 <__libc_fini_array+0x48>
   10824:	ff840413          	addi	s0,s0,-8
   10828:	00f40433          	add	s0,s0,a5
   1082c:	00043783          	ld	a5,0(s0)
   10830:	fff48493          	addi	s1,s1,-1
   10834:	ff840413          	addi	s0,s0,-8
   10838:	000780e7          	jalr	a5
   1083c:	fe0498e3          	bnez	s1,1082c <__libc_fini_array+0x34>
   10840:	01813083          	ld	ra,24(sp)
   10844:	01013403          	ld	s0,16(sp)
   10848:	00813483          	ld	s1,8(sp)
   1084c:	02010113          	addi	sp,sp,32
   10850:	00008067          	ret

0000000000010854 <__register_exitproc>:
   10854:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10858:	1f873783          	ld	a5,504(a4)
   1085c:	06078063          	beqz	a5,108bc <__register_exitproc+0x68>
   10860:	0087a703          	lw	a4,8(a5)
   10864:	01f00813          	li	a6,31
   10868:	08e84663          	blt	a6,a4,108f4 <__register_exitproc+0xa0>
   1086c:	02050863          	beqz	a0,1089c <__register_exitproc+0x48>
   10870:	00371813          	slli	a6,a4,0x3
   10874:	01078833          	add	a6,a5,a6
   10878:	10c83823          	sd	a2,272(a6)
   1087c:	3107a883          	lw	a7,784(a5)
   10880:	00100613          	li	a2,1
   10884:	00e6163b          	sllw	a2,a2,a4
   10888:	00c8e8b3          	or	a7,a7,a2
   1088c:	3117a823          	sw	a7,784(a5)
   10890:	20d83823          	sd	a3,528(a6)
   10894:	00200693          	li	a3,2
   10898:	02d50863          	beq	a0,a3,108c8 <__register_exitproc+0x74>
   1089c:	00270693          	addi	a3,a4,2
   108a0:	00369693          	slli	a3,a3,0x3
   108a4:	0017071b          	addiw	a4,a4,1
   108a8:	00e7a423          	sw	a4,8(a5)
   108ac:	00d787b3          	add	a5,a5,a3
   108b0:	00b7b023          	sd	a1,0(a5)
   108b4:	00000513          	li	a0,0
   108b8:	00008067          	ret
   108bc:	20070793          	addi	a5,a4,512
   108c0:	1ef73c23          	sd	a5,504(a4)
   108c4:	f9dff06f          	j	10860 <__register_exitproc+0xc>
   108c8:	3147a683          	lw	a3,788(a5)
   108cc:	00000513          	li	a0,0
   108d0:	00c6e6b3          	or	a3,a3,a2
   108d4:	30d7aa23          	sw	a3,788(a5)
   108d8:	00270693          	addi	a3,a4,2
   108dc:	00369693          	slli	a3,a3,0x3
   108e0:	0017071b          	addiw	a4,a4,1
   108e4:	00e7a423          	sw	a4,8(a5)
   108e8:	00d787b3          	add	a5,a5,a3
   108ec:	00b7b023          	sd	a1,0(a5)
   108f0:	00008067          	ret
   108f4:	fff00513          	li	a0,-1
   108f8:	00008067          	ret

00000000000108fc <_exit>:
   108fc:	05d00893          	li	a7,93
   10900:	00000073          	ecall
   10904:	00054463          	bltz	a0,1090c <_exit+0x10>
   10908:	0000006f          	j	10908 <_exit+0xc>
   1090c:	ff010113          	addi	sp,sp,-16
   10910:	00813023          	sd	s0,0(sp)
   10914:	00050413          	mv	s0,a0
   10918:	00113423          	sd	ra,8(sp)
   1091c:	4080043b          	negw	s0,s0
   10920:	00c000ef          	jal	ra,1092c <__errno>
   10924:	00852023          	sw	s0,0(a0) # 11000 <__FRAME_END__>
   10928:	0000006f          	j	10928 <_exit+0x2c>

000000000001092c <__errno>:
   1092c:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10930:	00008067          	ret

Disassembly of section .rodata:

0000000000010938 <.rodata>:
   10938:	7270                	.2byte	0x7270
   1093a:	7665                	.2byte	0x7665
   1093c:	203a                	.2byte	0x203a
   1093e:	0000                	.2byte	0x0
   10940:	6661                	.2byte	0x6661
   10942:	6574                	.2byte	0x6574
   10944:	3a72                	.2byte	0x3a72
   10946:	0020                	.2byte	0x20
   10948:	0008                	.2byte	0x8
   1094a:	0000                	.2byte	0x0
   1094c:	000c                	.2byte	0xc
   1094e:	0000                	.2byte	0x0
   10950:	00000003          	lb	zero,0(zero) # 0 <exit-0x100e8>
   10954:	0005                	.2byte	0x5
   10956:	0000                	.2byte	0x0
   10958:	0002                	.2byte	0x2
   1095a:	0000                	.2byte	0x0
   1095c:	002d                	.2byte	0x2d
   1095e:	0000                	.2byte	0x0
   10960:	0000                	.2byte	0x0
   10962:	0000                	.2byte	0x0
   10964:	000e                	.2byte	0xe
   10966:	0000                	.2byte	0x0
   10968:	0002                	.2byte	0x2
   1096a:	0000                	.2byte	0x0
   1096c:	0009                	.2byte	0x9
   1096e:	0000                	.2byte	0x0
   10970:	0001                	.2byte	0x1
   10972:	0000                	.2byte	0x0
   10974:	00000007          	.4byte	0x7
   10978:	0006                	.2byte	0x6
   1097a:	0000                	.2byte	0x0
   1097c:	0004                	.2byte	0x4
   1097e:	0000                	.2byte	0x0
   10980:	00000013          	nop
   10984:	0000000b          	.4byte	0xb
   10988:	0011                	.2byte	0x11
   1098a:	0000                	.2byte	0x0
   1098c:	0000000f          	fence	unknown,unknown
   10990:	ffff                	.2byte	0xffff
   10992:	ffff                	.2byte	0xffff
   10994:	ffee                	.2byte	0xffee
   10996:	ffff                	.2byte	0xffff

Disassembly of section .eh_frame:

0000000000011000 <__FRAME_END__>:
   11000:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

0000000000011008 <__init_array_start>:
   11008:	0118                	.2byte	0x118
   1100a:	0001                	.2byte	0x1
   1100c:	0000                	.2byte	0x0
	...

0000000000011010 <__frame_dummy_init_array_entry>:
   11010:	01c0                	.2byte	0x1c0
   11012:	0001                	.2byte	0x1
   11014:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

0000000000011018 <__do_global_dtors_aux_fini_array_entry>:
   11018:	017c                	.2byte	0x17c
   1101a:	0001                	.2byte	0x1
   1101c:	0000                	.2byte	0x0
	...

Disassembly of section .data:

0000000000011020 <impure_data>:
	...
   11028:	1558                	.2byte	0x1558
   1102a:	0001                	.2byte	0x1
   1102c:	0000                	.2byte	0x0
   1102e:	0000                	.2byte	0x0
   11030:	1608                	.2byte	0x1608
   11032:	0001                	.2byte	0x1
   11034:	0000                	.2byte	0x0
   11036:	0000                	.2byte	0x0
   11038:	16b8                	.2byte	0x16b8
   1103a:	0001                	.2byte	0x1
	...
   11108:	0001                	.2byte	0x1
   1110a:	0000                	.2byte	0x0
   1110c:	0000                	.2byte	0x0
   1110e:	0000                	.2byte	0x0
   11110:	330e                	.2byte	0x330e
   11112:	abcd                	.2byte	0xabcd
   11114:	1234                	.2byte	0x1234
   11116:	e66d                	.2byte	0xe66d
   11118:	deec                	.2byte	0xdeec
   1111a:	0005                	.2byte	0x5
   1111c:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011768 <_global_impure_ptr>:
   11768:	1020                	.2byte	0x1020
   1176a:	0001                	.2byte	0x1
   1176c:	0000                	.2byte	0x0
	...

0000000000011770 <__dso_handle>:
	...

0000000000011778 <_impure_ptr>:
   11778:	1020                	.2byte	0x1020
   1177a:	0001                	.2byte	0x1
   1177c:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011780 <completed.1>:
	...

0000000000011788 <object.0>:
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
