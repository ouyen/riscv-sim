
riscv-test/elf/test_sort.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	598000ef          	jal	ra,10694 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	7c0000ef          	jal	ra,108d4 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	7d050513          	addi	a0,a0,2000 # 107d0 <__libc_fini_array>
   10128:	6940006f          	j	107bc <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	addi	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	470000ef          	jal	ra,105b8 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	67050513          	addi	a0,a0,1648 # 107bc <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	67850513          	addi	a0,a0,1656 # 107d0 <__libc_fini_array>
   10160:	65c000ef          	jal	ra,107bc <atexit>
   10164:	3b8000ef          	jal	ra,1051c <__libc_init_array>
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
   10328:	fb010113          	addi	sp,sp,-80
   1032c:	04113423          	sd	ra,72(sp)
   10330:	04813023          	sd	s0,64(sp)
   10334:	05010413          	addi	s0,sp,80
   10338:	000117b7          	lui	a5,0x11
   1033c:	92078793          	addi	a5,a5,-1760 # 10920 <__errno+0x1c>
   10340:	0007b583          	ld	a1,0(a5)
   10344:	0087b603          	ld	a2,8(a5)
   10348:	0107b683          	ld	a3,16(a5)
   1034c:	0187b703          	ld	a4,24(a5)
   10350:	0207b783          	ld	a5,32(a5)
   10354:	fab43c23          	sd	a1,-72(s0)
   10358:	fcc43023          	sd	a2,-64(s0)
   1035c:	fcd43423          	sd	a3,-56(s0)
   10360:	fce43823          	sd	a4,-48(s0)
   10364:	fcf43c23          	sd	a5,-40(s0)
   10368:	fe042623          	sw	zero,-20(s0)
   1036c:	fe042423          	sw	zero,-24(s0)
   10370:	fe042223          	sw	zero,-28(s0)
   10374:	000117b7          	lui	a5,0x11
   10378:	91078513          	addi	a0,a5,-1776 # 10910 <__errno+0xc>
   1037c:	f41ff0ef          	jal	ra,102bc <print_string>
   10380:	fe042623          	sw	zero,-20(s0)
   10384:	0340006f          	j	103b8 <main+0x90>
   10388:	fec42783          	lw	a5,-20(s0)
   1038c:	00279793          	slli	a5,a5,0x2
   10390:	ff078793          	addi	a5,a5,-16
   10394:	008787b3          	add	a5,a5,s0
   10398:	fc87a783          	lw	a5,-56(a5)
   1039c:	00078513          	mv	a0,a5
   103a0:	e6dff0ef          	jal	ra,1020c <print_num>
   103a4:	02000513          	li	a0,32
   103a8:	e39ff0ef          	jal	ra,101e0 <print_char>
   103ac:	fec42783          	lw	a5,-20(s0)
   103b0:	0017879b          	addiw	a5,a5,1
   103b4:	fef42623          	sw	a5,-20(s0)
   103b8:	fec42783          	lw	a5,-20(s0)
   103bc:	0007871b          	sext.w	a4,a5
   103c0:	00900793          	li	a5,9
   103c4:	fce7d2e3          	bge	a5,a4,10388 <main+0x60>
   103c8:	00a00513          	li	a0,10
   103cc:	e15ff0ef          	jal	ra,101e0 <print_char>
   103d0:	fe042623          	sw	zero,-20(s0)
   103d4:	0c00006f          	j	10494 <main+0x16c>
   103d8:	fec42783          	lw	a5,-20(s0)
   103dc:	0017879b          	addiw	a5,a5,1
   103e0:	fef42423          	sw	a5,-24(s0)
   103e4:	0940006f          	j	10478 <main+0x150>
   103e8:	fec42783          	lw	a5,-20(s0)
   103ec:	00279793          	slli	a5,a5,0x2
   103f0:	ff078793          	addi	a5,a5,-16
   103f4:	008787b3          	add	a5,a5,s0
   103f8:	fc87a703          	lw	a4,-56(a5)
   103fc:	fe842783          	lw	a5,-24(s0)
   10400:	00279793          	slli	a5,a5,0x2
   10404:	ff078793          	addi	a5,a5,-16
   10408:	008787b3          	add	a5,a5,s0
   1040c:	fc87a783          	lw	a5,-56(a5)
   10410:	04e7de63          	bge	a5,a4,1046c <main+0x144>
   10414:	fe842783          	lw	a5,-24(s0)
   10418:	00279793          	slli	a5,a5,0x2
   1041c:	ff078793          	addi	a5,a5,-16
   10420:	008787b3          	add	a5,a5,s0
   10424:	fc87a783          	lw	a5,-56(a5)
   10428:	fef42223          	sw	a5,-28(s0)
   1042c:	fec42783          	lw	a5,-20(s0)
   10430:	00279793          	slli	a5,a5,0x2
   10434:	ff078793          	addi	a5,a5,-16
   10438:	008787b3          	add	a5,a5,s0
   1043c:	fc87a703          	lw	a4,-56(a5)
   10440:	fe842783          	lw	a5,-24(s0)
   10444:	00279793          	slli	a5,a5,0x2
   10448:	ff078793          	addi	a5,a5,-16
   1044c:	008787b3          	add	a5,a5,s0
   10450:	fce7a423          	sw	a4,-56(a5)
   10454:	fec42783          	lw	a5,-20(s0)
   10458:	00279793          	slli	a5,a5,0x2
   1045c:	ff078793          	addi	a5,a5,-16
   10460:	008787b3          	add	a5,a5,s0
   10464:	fe442703          	lw	a4,-28(s0)
   10468:	fce7a423          	sw	a4,-56(a5)
   1046c:	fe842783          	lw	a5,-24(s0)
   10470:	0017879b          	addiw	a5,a5,1
   10474:	fef42423          	sw	a5,-24(s0)
   10478:	fe842783          	lw	a5,-24(s0)
   1047c:	0007871b          	sext.w	a4,a5
   10480:	00900793          	li	a5,9
   10484:	f6e7d2e3          	bge	a5,a4,103e8 <main+0xc0>
   10488:	fec42783          	lw	a5,-20(s0)
   1048c:	0017879b          	addiw	a5,a5,1
   10490:	fef42623          	sw	a5,-20(s0)
   10494:	fec42783          	lw	a5,-20(s0)
   10498:	0007871b          	sext.w	a4,a5
   1049c:	00900793          	li	a5,9
   104a0:	f2e7dce3          	bge	a5,a4,103d8 <main+0xb0>
   104a4:	000117b7          	lui	a5,0x11
   104a8:	91878513          	addi	a0,a5,-1768 # 10918 <__errno+0x14>
   104ac:	e11ff0ef          	jal	ra,102bc <print_string>
   104b0:	fe042623          	sw	zero,-20(s0)
   104b4:	0340006f          	j	104e8 <main+0x1c0>
   104b8:	fec42783          	lw	a5,-20(s0)
   104bc:	00279793          	slli	a5,a5,0x2
   104c0:	ff078793          	addi	a5,a5,-16
   104c4:	008787b3          	add	a5,a5,s0
   104c8:	fc87a783          	lw	a5,-56(a5)
   104cc:	00078513          	mv	a0,a5
   104d0:	d3dff0ef          	jal	ra,1020c <print_num>
   104d4:	02000513          	li	a0,32
   104d8:	d09ff0ef          	jal	ra,101e0 <print_char>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42783          	lw	a5,-20(s0)
   104ec:	0007871b          	sext.w	a4,a5
   104f0:	00900793          	li	a5,9
   104f4:	fce7d2e3          	bge	a5,a4,104b8 <main+0x190>
   104f8:	00a00513          	li	a0,10
   104fc:	ce5ff0ef          	jal	ra,101e0 <print_char>
   10500:	d39ff0ef          	jal	ra,10238 <exit_proc>
   10504:	00000793          	li	a5,0
   10508:	00078513          	mv	a0,a5
   1050c:	04813083          	ld	ra,72(sp)
   10510:	04013403          	ld	s0,64(sp)
   10514:	05010113          	addi	sp,sp,80
   10518:	00008067          	ret

000000000001051c <__libc_init_array>:
   1051c:	fe010113          	addi	sp,sp,-32
   10520:	00813823          	sd	s0,16(sp)
   10524:	01213023          	sd	s2,0(sp)
   10528:	00011437          	lui	s0,0x11
   1052c:	00011937          	lui	s2,0x11
   10530:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   10534:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10538:	40f90933          	sub	s2,s2,a5
   1053c:	00113c23          	sd	ra,24(sp)
   10540:	00913423          	sd	s1,8(sp)
   10544:	40395913          	srai	s2,s2,0x3
   10548:	02090063          	beqz	s2,10568 <__libc_init_array+0x4c>
   1054c:	00440413          	addi	s0,s0,4
   10550:	00000493          	li	s1,0
   10554:	00043783          	ld	a5,0(s0)
   10558:	00148493          	addi	s1,s1,1
   1055c:	00840413          	addi	s0,s0,8
   10560:	000780e7          	jalr	a5
   10564:	fe9918e3          	bne	s2,s1,10554 <__libc_init_array+0x38>
   10568:	00011437          	lui	s0,0x11
   1056c:	00011937          	lui	s2,0x11
   10570:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   10574:	01890913          	addi	s2,s2,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10578:	40f90933          	sub	s2,s2,a5
   1057c:	40395913          	srai	s2,s2,0x3
   10580:	02090063          	beqz	s2,105a0 <__libc_init_array+0x84>
   10584:	00840413          	addi	s0,s0,8
   10588:	00000493          	li	s1,0
   1058c:	00043783          	ld	a5,0(s0)
   10590:	00148493          	addi	s1,s1,1
   10594:	00840413          	addi	s0,s0,8
   10598:	000780e7          	jalr	a5
   1059c:	fe9918e3          	bne	s2,s1,1058c <__libc_init_array+0x70>
   105a0:	01813083          	ld	ra,24(sp)
   105a4:	01013403          	ld	s0,16(sp)
   105a8:	00813483          	ld	s1,8(sp)
   105ac:	00013903          	ld	s2,0(sp)
   105b0:	02010113          	addi	sp,sp,32
   105b4:	00008067          	ret

00000000000105b8 <memset>:
   105b8:	00f00313          	li	t1,15
   105bc:	00050713          	mv	a4,a0
   105c0:	02c37a63          	bgeu	t1,a2,105f4 <memset+0x3c>
   105c4:	00f77793          	andi	a5,a4,15
   105c8:	0a079063          	bnez	a5,10668 <memset+0xb0>
   105cc:	06059e63          	bnez	a1,10648 <memset+0x90>
   105d0:	ff067693          	andi	a3,a2,-16
   105d4:	00f67613          	andi	a2,a2,15
   105d8:	00e686b3          	add	a3,a3,a4
   105dc:	00b73023          	sd	a1,0(a4)
   105e0:	00b73423          	sd	a1,8(a4)
   105e4:	01070713          	addi	a4,a4,16
   105e8:	fed76ae3          	bltu	a4,a3,105dc <memset+0x24>
   105ec:	00061463          	bnez	a2,105f4 <memset+0x3c>
   105f0:	00008067          	ret
   105f4:	40c306b3          	sub	a3,t1,a2
   105f8:	00269693          	slli	a3,a3,0x2
   105fc:	00000297          	auipc	t0,0x0
   10600:	005686b3          	add	a3,a3,t0
   10604:	00c68067          	jr	12(a3)
   10608:	00b70723          	sb	a1,14(a4)
   1060c:	00b706a3          	sb	a1,13(a4)
   10610:	00b70623          	sb	a1,12(a4)
   10614:	00b705a3          	sb	a1,11(a4)
   10618:	00b70523          	sb	a1,10(a4)
   1061c:	00b704a3          	sb	a1,9(a4)
   10620:	00b70423          	sb	a1,8(a4)
   10624:	00b703a3          	sb	a1,7(a4)
   10628:	00b70323          	sb	a1,6(a4)
   1062c:	00b702a3          	sb	a1,5(a4)
   10630:	00b70223          	sb	a1,4(a4)
   10634:	00b701a3          	sb	a1,3(a4)
   10638:	00b70123          	sb	a1,2(a4)
   1063c:	00b700a3          	sb	a1,1(a4)
   10640:	00b70023          	sb	a1,0(a4)
   10644:	00008067          	ret
   10648:	0ff5f593          	zext.b	a1,a1
   1064c:	00859693          	slli	a3,a1,0x8
   10650:	00d5e5b3          	or	a1,a1,a3
   10654:	01059693          	slli	a3,a1,0x10
   10658:	00d5e5b3          	or	a1,a1,a3
   1065c:	02059693          	slli	a3,a1,0x20
   10660:	00d5e5b3          	or	a1,a1,a3
   10664:	f6dff06f          	j	105d0 <memset+0x18>
   10668:	00279693          	slli	a3,a5,0x2
   1066c:	00000297          	auipc	t0,0x0
   10670:	005686b3          	add	a3,a3,t0
   10674:	00008293          	mv	t0,ra
   10678:	f98680e7          	jalr	-104(a3)
   1067c:	00028093          	mv	ra,t0
   10680:	ff078793          	addi	a5,a5,-16
   10684:	40f70733          	sub	a4,a4,a5
   10688:	00f60633          	add	a2,a2,a5
   1068c:	f6c374e3          	bgeu	t1,a2,105f4 <memset+0x3c>
   10690:	f3dff06f          	j	105cc <memset+0x14>

0000000000010694 <__call_exitprocs>:
   10694:	fb010113          	addi	sp,sp,-80
   10698:	03413023          	sd	s4,32(sp)
   1069c:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   106a0:	03213823          	sd	s2,48(sp)
   106a4:	04113423          	sd	ra,72(sp)
   106a8:	1f8a3903          	ld	s2,504(s4)
   106ac:	04813023          	sd	s0,64(sp)
   106b0:	02913c23          	sd	s1,56(sp)
   106b4:	03313423          	sd	s3,40(sp)
   106b8:	01513c23          	sd	s5,24(sp)
   106bc:	01613823          	sd	s6,16(sp)
   106c0:	01713423          	sd	s7,8(sp)
   106c4:	01813023          	sd	s8,0(sp)
   106c8:	04090063          	beqz	s2,10708 <__call_exitprocs+0x74>
   106cc:	00050b13          	mv	s6,a0
   106d0:	00058b93          	mv	s7,a1
   106d4:	00100a93          	li	s5,1
   106d8:	fff00993          	li	s3,-1
   106dc:	00892483          	lw	s1,8(s2)
   106e0:	fff4841b          	addiw	s0,s1,-1
   106e4:	02044263          	bltz	s0,10708 <__call_exitprocs+0x74>
   106e8:	00349493          	slli	s1,s1,0x3
   106ec:	009904b3          	add	s1,s2,s1
   106f0:	040b8463          	beqz	s7,10738 <__call_exitprocs+0xa4>
   106f4:	2084b783          	ld	a5,520(s1)
   106f8:	05778063          	beq	a5,s7,10738 <__call_exitprocs+0xa4>
   106fc:	fff4041b          	addiw	s0,s0,-1
   10700:	ff848493          	addi	s1,s1,-8
   10704:	ff3416e3          	bne	s0,s3,106f0 <__call_exitprocs+0x5c>
   10708:	04813083          	ld	ra,72(sp)
   1070c:	04013403          	ld	s0,64(sp)
   10710:	03813483          	ld	s1,56(sp)
   10714:	03013903          	ld	s2,48(sp)
   10718:	02813983          	ld	s3,40(sp)
   1071c:	02013a03          	ld	s4,32(sp)
   10720:	01813a83          	ld	s5,24(sp)
   10724:	01013b03          	ld	s6,16(sp)
   10728:	00813b83          	ld	s7,8(sp)
   1072c:	00013c03          	ld	s8,0(sp)
   10730:	05010113          	addi	sp,sp,80
   10734:	00008067          	ret
   10738:	00892783          	lw	a5,8(s2)
   1073c:	0084b703          	ld	a4,8(s1)
   10740:	fff7879b          	addiw	a5,a5,-1
   10744:	06878263          	beq	a5,s0,107a8 <__call_exitprocs+0x114>
   10748:	0004b423          	sd	zero,8(s1)
   1074c:	fa0708e3          	beqz	a4,106fc <__call_exitprocs+0x68>
   10750:	31092783          	lw	a5,784(s2)
   10754:	008a96bb          	sllw	a3,s5,s0
   10758:	00892c03          	lw	s8,8(s2)
   1075c:	00d7f7b3          	and	a5,a5,a3
   10760:	0007879b          	sext.w	a5,a5
   10764:	02079263          	bnez	a5,10788 <__call_exitprocs+0xf4>
   10768:	000700e7          	jalr	a4
   1076c:	00892703          	lw	a4,8(s2)
   10770:	1f8a3783          	ld	a5,504(s4)
   10774:	01871463          	bne	a4,s8,1077c <__call_exitprocs+0xe8>
   10778:	f92782e3          	beq	a5,s2,106fc <__call_exitprocs+0x68>
   1077c:	f80786e3          	beqz	a5,10708 <__call_exitprocs+0x74>
   10780:	00078913          	mv	s2,a5
   10784:	f59ff06f          	j	106dc <__call_exitprocs+0x48>
   10788:	31492783          	lw	a5,788(s2)
   1078c:	1084b583          	ld	a1,264(s1)
   10790:	00d7f7b3          	and	a5,a5,a3
   10794:	0007879b          	sext.w	a5,a5
   10798:	00079c63          	bnez	a5,107b0 <__call_exitprocs+0x11c>
   1079c:	000b0513          	mv	a0,s6
   107a0:	000700e7          	jalr	a4
   107a4:	fc9ff06f          	j	1076c <__call_exitprocs+0xd8>
   107a8:	00892423          	sw	s0,8(s2)
   107ac:	fa1ff06f          	j	1074c <__call_exitprocs+0xb8>
   107b0:	00058513          	mv	a0,a1
   107b4:	000700e7          	jalr	a4
   107b8:	fb5ff06f          	j	1076c <__call_exitprocs+0xd8>

00000000000107bc <atexit>:
   107bc:	00050593          	mv	a1,a0
   107c0:	00000693          	li	a3,0
   107c4:	00000613          	li	a2,0
   107c8:	00000513          	li	a0,0
   107cc:	0600006f          	j	1082c <__register_exitproc>

00000000000107d0 <__libc_fini_array>:
   107d0:	fe010113          	addi	sp,sp,-32
   107d4:	00813823          	sd	s0,16(sp)
   107d8:	000117b7          	lui	a5,0x11
   107dc:	00011437          	lui	s0,0x11
   107e0:	01878793          	addi	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   107e4:	02040413          	addi	s0,s0,32 # 11020 <impure_data>
   107e8:	40f40433          	sub	s0,s0,a5
   107ec:	00913423          	sd	s1,8(sp)
   107f0:	00113c23          	sd	ra,24(sp)
   107f4:	40345493          	srai	s1,s0,0x3
   107f8:	02048063          	beqz	s1,10818 <__libc_fini_array+0x48>
   107fc:	ff840413          	addi	s0,s0,-8
   10800:	00f40433          	add	s0,s0,a5
   10804:	00043783          	ld	a5,0(s0)
   10808:	fff48493          	addi	s1,s1,-1
   1080c:	ff840413          	addi	s0,s0,-8
   10810:	000780e7          	jalr	a5
   10814:	fe0498e3          	bnez	s1,10804 <__libc_fini_array+0x34>
   10818:	01813083          	ld	ra,24(sp)
   1081c:	01013403          	ld	s0,16(sp)
   10820:	00813483          	ld	s1,8(sp)
   10824:	02010113          	addi	sp,sp,32
   10828:	00008067          	ret

000000000001082c <__register_exitproc>:
   1082c:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10830:	1f873783          	ld	a5,504(a4)
   10834:	06078063          	beqz	a5,10894 <__register_exitproc+0x68>
   10838:	0087a703          	lw	a4,8(a5)
   1083c:	01f00813          	li	a6,31
   10840:	08e84663          	blt	a6,a4,108cc <__register_exitproc+0xa0>
   10844:	02050863          	beqz	a0,10874 <__register_exitproc+0x48>
   10848:	00371813          	slli	a6,a4,0x3
   1084c:	01078833          	add	a6,a5,a6
   10850:	10c83823          	sd	a2,272(a6)
   10854:	3107a883          	lw	a7,784(a5)
   10858:	00100613          	li	a2,1
   1085c:	00e6163b          	sllw	a2,a2,a4
   10860:	00c8e8b3          	or	a7,a7,a2
   10864:	3117a823          	sw	a7,784(a5)
   10868:	20d83823          	sd	a3,528(a6)
   1086c:	00200693          	li	a3,2
   10870:	02d50863          	beq	a0,a3,108a0 <__register_exitproc+0x74>
   10874:	00270693          	addi	a3,a4,2
   10878:	00369693          	slli	a3,a3,0x3
   1087c:	0017071b          	addiw	a4,a4,1
   10880:	00e7a423          	sw	a4,8(a5)
   10884:	00d787b3          	add	a5,a5,a3
   10888:	00b7b023          	sd	a1,0(a5)
   1088c:	00000513          	li	a0,0
   10890:	00008067          	ret
   10894:	20070793          	addi	a5,a4,512
   10898:	1ef73c23          	sd	a5,504(a4)
   1089c:	f9dff06f          	j	10838 <__register_exitproc+0xc>
   108a0:	3147a683          	lw	a3,788(a5)
   108a4:	00000513          	li	a0,0
   108a8:	00c6e6b3          	or	a3,a3,a2
   108ac:	30d7aa23          	sw	a3,788(a5)
   108b0:	00270693          	addi	a3,a4,2
   108b4:	00369693          	slli	a3,a3,0x3
   108b8:	0017071b          	addiw	a4,a4,1
   108bc:	00e7a423          	sw	a4,8(a5)
   108c0:	00d787b3          	add	a5,a5,a3
   108c4:	00b7b023          	sd	a1,0(a5)
   108c8:	00008067          	ret
   108cc:	fff00513          	li	a0,-1
   108d0:	00008067          	ret

00000000000108d4 <_exit>:
   108d4:	05d00893          	li	a7,93
   108d8:	00000073          	ecall
   108dc:	00054463          	bltz	a0,108e4 <_exit+0x10>
   108e0:	0000006f          	j	108e0 <_exit+0xc>
   108e4:	ff010113          	addi	sp,sp,-16
   108e8:	00813023          	sd	s0,0(sp)
   108ec:	00050413          	mv	s0,a0
   108f0:	00113423          	sd	ra,8(sp)
   108f4:	4080043b          	negw	s0,s0
   108f8:	00c000ef          	jal	ra,10904 <__errno>
   108fc:	00852023          	sw	s0,0(a0) # 11000 <__FRAME_END__>
   10900:	0000006f          	j	10900 <_exit+0x2c>

0000000000010904 <__errno>:
   10904:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10908:	00008067          	ret

Disassembly of section .rodata:

0000000000010910 <.rodata>:
   10910:	7270                	.2byte	0x7270
   10912:	7665                	.2byte	0x7665
   10914:	203a                	.2byte	0x203a
   10916:	0000                	.2byte	0x0
   10918:	6661                	.2byte	0x6661
   1091a:	6574                	.2byte	0x6574
   1091c:	3a72                	.2byte	0x3a72
   1091e:	0020                	.2byte	0x20
   10920:	0008                	.2byte	0x8
   10922:	0000                	.2byte	0x0
   10924:	000c                	.2byte	0xc
   10926:	0000                	.2byte	0x0
   10928:	00000003          	lb	zero,0(zero) # 0 <exit-0x100e8>
   1092c:	0005                	.2byte	0x5
   1092e:	0000                	.2byte	0x0
   10930:	0002                	.2byte	0x2
   10932:	0000                	.2byte	0x0
   10934:	002d                	.2byte	0x2d
   10936:	0000                	.2byte	0x0
   10938:	0000                	.2byte	0x0
   1093a:	0000                	.2byte	0x0
   1093c:	000e                	.2byte	0xe
   1093e:	0000                	.2byte	0x0
   10940:	0002                	.2byte	0x2
   10942:	0000                	.2byte	0x0
   10944:	0009                	.2byte	0x9
	...

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
