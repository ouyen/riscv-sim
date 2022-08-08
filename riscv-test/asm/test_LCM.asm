
riscv-test/elf/test_LCM.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	5c8000ef          	jal	ra,106c4 <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	7f0000ef          	jal	ra,10904 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	80050513          	addi	a0,a0,-2048 # 10800 <__libc_fini_array>
   10128:	6c40006f          	j	107ec <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00001197          	auipc	gp,0x1
   10134:	6f018193          	addi	gp,gp,1776 # 11820 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11780 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	4a0000ef          	jal	ra,105e8 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	6a050513          	addi	a0,a0,1696 # 107ec <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	6a850513          	addi	a0,a0,1704 # 10800 <__libc_fini_array>
   10160:	68c000ef          	jal	ra,107ec <atexit>
   10164:	3e8000ef          	jal	ra,1054c <__libc_init_array>
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
   10328:	fd010113          	addi	sp,sp,-48
   1032c:	02113423          	sd	ra,40(sp)
   10330:	02813023          	sd	s0,32(sp)
   10334:	03010413          	addi	s0,sp,48
   10338:	00100793          	li	a5,1
   1033c:	fef42223          	sw	a5,-28(s0)
   10340:	00c00793          	li	a5,12
   10344:	fef42623          	sw	a5,-20(s0)
   10348:	03f00793          	li	a5,63
   1034c:	fef42423          	sw	a5,-24(s0)
   10350:	fec42783          	lw	a5,-20(s0)
   10354:	00078713          	mv	a4,a5
   10358:	fe842783          	lw	a5,-24(s0)
   1035c:	0007071b          	sext.w	a4,a4
   10360:	0007879b          	sext.w	a5,a5
   10364:	00f75e63          	bge	a4,a5,10380 <main+0x58>
   10368:	fe842783          	lw	a5,-24(s0)
   1036c:	fcf42e23          	sw	a5,-36(s0)
   10370:	fec42783          	lw	a5,-20(s0)
   10374:	fef42423          	sw	a5,-24(s0)
   10378:	fdc42783          	lw	a5,-36(s0)
   1037c:	fef42623          	sw	a5,-20(s0)
   10380:	fec42783          	lw	a5,-20(s0)
   10384:	00078713          	mv	a4,a5
   10388:	fe842783          	lw	a5,-24(s0)
   1038c:	00078593          	mv	a1,a5
   10390:	00070513          	mv	a0,a4
   10394:	094000ef          	jal	ra,10428 <__muldi3>
   10398:	00050793          	mv	a5,a0
   1039c:	fcf42c23          	sw	a5,-40(s0)
   103a0:	0540006f          	j	103f4 <main+0xcc>
   103a4:	fec42783          	lw	a5,-20(s0)
   103a8:	fe842703          	lw	a4,-24(s0)
   103ac:	00070593          	mv	a1,a4
   103b0:	00078513          	mv	a0,a5
   103b4:	15c000ef          	jal	ra,10510 <__moddi3>
   103b8:	00050793          	mv	a5,a0
   103bc:	fef42223          	sw	a5,-28(s0)
   103c0:	fe842783          	lw	a5,-24(s0)
   103c4:	fef42623          	sw	a5,-20(s0)
   103c8:	fe442783          	lw	a5,-28(s0)
   103cc:	fef42423          	sw	a5,-24(s0)
   103d0:	fec42783          	lw	a5,-20(s0)
   103d4:	fcf42a23          	sw	a5,-44(s0)
   103d8:	fd842783          	lw	a5,-40(s0)
   103dc:	fd442703          	lw	a4,-44(s0)
   103e0:	00070593          	mv	a1,a4
   103e4:	00078513          	mv	a0,a5
   103e8:	0a4000ef          	jal	ra,1048c <__divdi3>
   103ec:	00050793          	mv	a5,a0
   103f0:	fef42023          	sw	a5,-32(s0)
   103f4:	fe442783          	lw	a5,-28(s0)
   103f8:	0007879b          	sext.w	a5,a5
   103fc:	fa0794e3          	bnez	a5,103a4 <main+0x7c>
   10400:	fe042783          	lw	a5,-32(s0)
   10404:	00078513          	mv	a0,a5
   10408:	e05ff0ef          	jal	ra,1020c <print_num>
   1040c:	e2dff0ef          	jal	ra,10238 <exit_proc>
   10410:	00000793          	li	a5,0
   10414:	00078513          	mv	a0,a5
   10418:	02813083          	ld	ra,40(sp)
   1041c:	02013403          	ld	s0,32(sp)
   10420:	03010113          	addi	sp,sp,48
   10424:	00008067          	ret

0000000000010428 <__muldi3>:
   10428:	00050613          	mv	a2,a0
   1042c:	00000513          	li	a0,0
   10430:	0015f693          	andi	a3,a1,1
   10434:	00068463          	beqz	a3,1043c <__muldi3+0x14>
   10438:	00c50533          	add	a0,a0,a2
   1043c:	0015d593          	srli	a1,a1,0x1
   10440:	00161613          	slli	a2,a2,0x1
   10444:	fe0596e3          	bnez	a1,10430 <__muldi3+0x8>
   10448:	00008067          	ret

000000000001044c <__udivsi3>:
   1044c:	02051513          	slli	a0,a0,0x20
   10450:	02059593          	slli	a1,a1,0x20
   10454:	00008293          	mv	t0,ra
   10458:	03c000ef          	jal	ra,10494 <__udivdi3>
   1045c:	0005051b          	sext.w	a0,a0
   10460:	00028067          	jr	t0

0000000000010464 <__umodsi3>:
   10464:	02051513          	slli	a0,a0,0x20
   10468:	02059593          	slli	a1,a1,0x20
   1046c:	02055513          	srli	a0,a0,0x20
   10470:	0205d593          	srli	a1,a1,0x20
   10474:	00008293          	mv	t0,ra
   10478:	01c000ef          	jal	ra,10494 <__udivdi3>
   1047c:	0005851b          	sext.w	a0,a1
   10480:	00028067          	jr	t0

0000000000010484 <__divsi3>:
   10484:	fff00293          	li	t0,-1
   10488:	0a558c63          	beq	a1,t0,10540 <__moddi3+0x30>

000000000001048c <__divdi3>:
   1048c:	06054063          	bltz	a0,104ec <__umoddi3+0x10>
   10490:	0605c663          	bltz	a1,104fc <__umoddi3+0x20>

0000000000010494 <__udivdi3>:
   10494:	00058613          	mv	a2,a1
   10498:	00050593          	mv	a1,a0
   1049c:	fff00513          	li	a0,-1
   104a0:	02060c63          	beqz	a2,104d8 <__udivdi3+0x44>
   104a4:	00100693          	li	a3,1
   104a8:	00b67a63          	bgeu	a2,a1,104bc <__udivdi3+0x28>
   104ac:	00c05863          	blez	a2,104bc <__udivdi3+0x28>
   104b0:	00161613          	slli	a2,a2,0x1
   104b4:	00169693          	slli	a3,a3,0x1
   104b8:	feb66ae3          	bltu	a2,a1,104ac <__udivdi3+0x18>
   104bc:	00000513          	li	a0,0
   104c0:	00c5e663          	bltu	a1,a2,104cc <__udivdi3+0x38>
   104c4:	40c585b3          	sub	a1,a1,a2
   104c8:	00d56533          	or	a0,a0,a3
   104cc:	0016d693          	srli	a3,a3,0x1
   104d0:	00165613          	srli	a2,a2,0x1
   104d4:	fe0696e3          	bnez	a3,104c0 <__udivdi3+0x2c>
   104d8:	00008067          	ret

00000000000104dc <__umoddi3>:
   104dc:	00008293          	mv	t0,ra
   104e0:	fb5ff0ef          	jal	ra,10494 <__udivdi3>
   104e4:	00058513          	mv	a0,a1
   104e8:	00028067          	jr	t0
   104ec:	40a00533          	neg	a0,a0
   104f0:	00b04863          	bgtz	a1,10500 <__umoddi3+0x24>
   104f4:	40b005b3          	neg	a1,a1
   104f8:	f9dff06f          	j	10494 <__udivdi3>
   104fc:	40b005b3          	neg	a1,a1
   10500:	00008293          	mv	t0,ra
   10504:	f91ff0ef          	jal	ra,10494 <__udivdi3>
   10508:	40a00533          	neg	a0,a0
   1050c:	00028067          	jr	t0

0000000000010510 <__moddi3>:
   10510:	00008293          	mv	t0,ra
   10514:	0005ca63          	bltz	a1,10528 <__moddi3+0x18>
   10518:	00054c63          	bltz	a0,10530 <__moddi3+0x20>
   1051c:	f79ff0ef          	jal	ra,10494 <__udivdi3>
   10520:	00058513          	mv	a0,a1
   10524:	00028067          	jr	t0
   10528:	40b005b3          	neg	a1,a1
   1052c:	fe0558e3          	bgez	a0,1051c <__moddi3+0xc>
   10530:	40a00533          	neg	a0,a0
   10534:	f61ff0ef          	jal	ra,10494 <__udivdi3>
   10538:	40b00533          	neg	a0,a1
   1053c:	00028067          	jr	t0
   10540:	01f29293          	slli	t0,t0,0x1f
   10544:	f45514e3          	bne	a0,t0,1048c <__divdi3>
   10548:	00008067          	ret

000000000001054c <__libc_init_array>:
   1054c:	fe010113          	addi	sp,sp,-32
   10550:	00813823          	sd	s0,16(sp)
   10554:	01213023          	sd	s2,0(sp)
   10558:	00011437          	lui	s0,0x11
   1055c:	00011937          	lui	s2,0x11
   10560:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   10564:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10568:	40f90933          	sub	s2,s2,a5
   1056c:	00113c23          	sd	ra,24(sp)
   10570:	00913423          	sd	s1,8(sp)
   10574:	40395913          	srai	s2,s2,0x3
   10578:	02090063          	beqz	s2,10598 <__libc_init_array+0x4c>
   1057c:	00440413          	addi	s0,s0,4
   10580:	00000493          	li	s1,0
   10584:	00043783          	ld	a5,0(s0)
   10588:	00148493          	addi	s1,s1,1
   1058c:	00840413          	addi	s0,s0,8
   10590:	000780e7          	jalr	a5
   10594:	fe9918e3          	bne	s2,s1,10584 <__libc_init_array+0x38>
   10598:	00011437          	lui	s0,0x11
   1059c:	00011937          	lui	s2,0x11
   105a0:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   105a4:	01890913          	addi	s2,s2,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   105a8:	40f90933          	sub	s2,s2,a5
   105ac:	40395913          	srai	s2,s2,0x3
   105b0:	02090063          	beqz	s2,105d0 <__libc_init_array+0x84>
   105b4:	00840413          	addi	s0,s0,8
   105b8:	00000493          	li	s1,0
   105bc:	00043783          	ld	a5,0(s0)
   105c0:	00148493          	addi	s1,s1,1
   105c4:	00840413          	addi	s0,s0,8
   105c8:	000780e7          	jalr	a5
   105cc:	fe9918e3          	bne	s2,s1,105bc <__libc_init_array+0x70>
   105d0:	01813083          	ld	ra,24(sp)
   105d4:	01013403          	ld	s0,16(sp)
   105d8:	00813483          	ld	s1,8(sp)
   105dc:	00013903          	ld	s2,0(sp)
   105e0:	02010113          	addi	sp,sp,32
   105e4:	00008067          	ret

00000000000105e8 <memset>:
   105e8:	00f00313          	li	t1,15
   105ec:	00050713          	mv	a4,a0
   105f0:	02c37a63          	bgeu	t1,a2,10624 <memset+0x3c>
   105f4:	00f77793          	andi	a5,a4,15
   105f8:	0a079063          	bnez	a5,10698 <memset+0xb0>
   105fc:	06059e63          	bnez	a1,10678 <memset+0x90>
   10600:	ff067693          	andi	a3,a2,-16
   10604:	00f67613          	andi	a2,a2,15
   10608:	00e686b3          	add	a3,a3,a4
   1060c:	00b73023          	sd	a1,0(a4)
   10610:	00b73423          	sd	a1,8(a4)
   10614:	01070713          	addi	a4,a4,16
   10618:	fed76ae3          	bltu	a4,a3,1060c <memset+0x24>
   1061c:	00061463          	bnez	a2,10624 <memset+0x3c>
   10620:	00008067          	ret
   10624:	40c306b3          	sub	a3,t1,a2
   10628:	00269693          	slli	a3,a3,0x2
   1062c:	00000297          	auipc	t0,0x0
   10630:	005686b3          	add	a3,a3,t0
   10634:	00c68067          	jr	12(a3)
   10638:	00b70723          	sb	a1,14(a4)
   1063c:	00b706a3          	sb	a1,13(a4)
   10640:	00b70623          	sb	a1,12(a4)
   10644:	00b705a3          	sb	a1,11(a4)
   10648:	00b70523          	sb	a1,10(a4)
   1064c:	00b704a3          	sb	a1,9(a4)
   10650:	00b70423          	sb	a1,8(a4)
   10654:	00b703a3          	sb	a1,7(a4)
   10658:	00b70323          	sb	a1,6(a4)
   1065c:	00b702a3          	sb	a1,5(a4)
   10660:	00b70223          	sb	a1,4(a4)
   10664:	00b701a3          	sb	a1,3(a4)
   10668:	00b70123          	sb	a1,2(a4)
   1066c:	00b700a3          	sb	a1,1(a4)
   10670:	00b70023          	sb	a1,0(a4)
   10674:	00008067          	ret
   10678:	0ff5f593          	zext.b	a1,a1
   1067c:	00859693          	slli	a3,a1,0x8
   10680:	00d5e5b3          	or	a1,a1,a3
   10684:	01059693          	slli	a3,a1,0x10
   10688:	00d5e5b3          	or	a1,a1,a3
   1068c:	02059693          	slli	a3,a1,0x20
   10690:	00d5e5b3          	or	a1,a1,a3
   10694:	f6dff06f          	j	10600 <memset+0x18>
   10698:	00279693          	slli	a3,a5,0x2
   1069c:	00000297          	auipc	t0,0x0
   106a0:	005686b3          	add	a3,a3,t0
   106a4:	00008293          	mv	t0,ra
   106a8:	f98680e7          	jalr	-104(a3)
   106ac:	00028093          	mv	ra,t0
   106b0:	ff078793          	addi	a5,a5,-16
   106b4:	40f70733          	sub	a4,a4,a5
   106b8:	00f60633          	add	a2,a2,a5
   106bc:	f6c374e3          	bgeu	t1,a2,10624 <memset+0x3c>
   106c0:	f3dff06f          	j	105fc <memset+0x14>

00000000000106c4 <__call_exitprocs>:
   106c4:	fb010113          	addi	sp,sp,-80
   106c8:	03413023          	sd	s4,32(sp)
   106cc:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   106d0:	03213823          	sd	s2,48(sp)
   106d4:	04113423          	sd	ra,72(sp)
   106d8:	1f8a3903          	ld	s2,504(s4)
   106dc:	04813023          	sd	s0,64(sp)
   106e0:	02913c23          	sd	s1,56(sp)
   106e4:	03313423          	sd	s3,40(sp)
   106e8:	01513c23          	sd	s5,24(sp)
   106ec:	01613823          	sd	s6,16(sp)
   106f0:	01713423          	sd	s7,8(sp)
   106f4:	01813023          	sd	s8,0(sp)
   106f8:	04090063          	beqz	s2,10738 <__call_exitprocs+0x74>
   106fc:	00050b13          	mv	s6,a0
   10700:	00058b93          	mv	s7,a1
   10704:	00100a93          	li	s5,1
   10708:	fff00993          	li	s3,-1
   1070c:	00892483          	lw	s1,8(s2)
   10710:	fff4841b          	addiw	s0,s1,-1
   10714:	02044263          	bltz	s0,10738 <__call_exitprocs+0x74>
   10718:	00349493          	slli	s1,s1,0x3
   1071c:	009904b3          	add	s1,s2,s1
   10720:	040b8463          	beqz	s7,10768 <__call_exitprocs+0xa4>
   10724:	2084b783          	ld	a5,520(s1)
   10728:	05778063          	beq	a5,s7,10768 <__call_exitprocs+0xa4>
   1072c:	fff4041b          	addiw	s0,s0,-1
   10730:	ff848493          	addi	s1,s1,-8
   10734:	ff3416e3          	bne	s0,s3,10720 <__call_exitprocs+0x5c>
   10738:	04813083          	ld	ra,72(sp)
   1073c:	04013403          	ld	s0,64(sp)
   10740:	03813483          	ld	s1,56(sp)
   10744:	03013903          	ld	s2,48(sp)
   10748:	02813983          	ld	s3,40(sp)
   1074c:	02013a03          	ld	s4,32(sp)
   10750:	01813a83          	ld	s5,24(sp)
   10754:	01013b03          	ld	s6,16(sp)
   10758:	00813b83          	ld	s7,8(sp)
   1075c:	00013c03          	ld	s8,0(sp)
   10760:	05010113          	addi	sp,sp,80
   10764:	00008067          	ret
   10768:	00892783          	lw	a5,8(s2)
   1076c:	0084b703          	ld	a4,8(s1)
   10770:	fff7879b          	addiw	a5,a5,-1
   10774:	06878263          	beq	a5,s0,107d8 <__call_exitprocs+0x114>
   10778:	0004b423          	sd	zero,8(s1)
   1077c:	fa0708e3          	beqz	a4,1072c <__call_exitprocs+0x68>
   10780:	31092783          	lw	a5,784(s2)
   10784:	008a96bb          	sllw	a3,s5,s0
   10788:	00892c03          	lw	s8,8(s2)
   1078c:	00d7f7b3          	and	a5,a5,a3
   10790:	0007879b          	sext.w	a5,a5
   10794:	02079263          	bnez	a5,107b8 <__call_exitprocs+0xf4>
   10798:	000700e7          	jalr	a4
   1079c:	00892703          	lw	a4,8(s2)
   107a0:	1f8a3783          	ld	a5,504(s4)
   107a4:	01871463          	bne	a4,s8,107ac <__call_exitprocs+0xe8>
   107a8:	f92782e3          	beq	a5,s2,1072c <__call_exitprocs+0x68>
   107ac:	f80786e3          	beqz	a5,10738 <__call_exitprocs+0x74>
   107b0:	00078913          	mv	s2,a5
   107b4:	f59ff06f          	j	1070c <__call_exitprocs+0x48>
   107b8:	31492783          	lw	a5,788(s2)
   107bc:	1084b583          	ld	a1,264(s1)
   107c0:	00d7f7b3          	and	a5,a5,a3
   107c4:	0007879b          	sext.w	a5,a5
   107c8:	00079c63          	bnez	a5,107e0 <__call_exitprocs+0x11c>
   107cc:	000b0513          	mv	a0,s6
   107d0:	000700e7          	jalr	a4
   107d4:	fc9ff06f          	j	1079c <__call_exitprocs+0xd8>
   107d8:	00892423          	sw	s0,8(s2)
   107dc:	fa1ff06f          	j	1077c <__call_exitprocs+0xb8>
   107e0:	00058513          	mv	a0,a1
   107e4:	000700e7          	jalr	a4
   107e8:	fb5ff06f          	j	1079c <__call_exitprocs+0xd8>

00000000000107ec <atexit>:
   107ec:	00050593          	mv	a1,a0
   107f0:	00000693          	li	a3,0
   107f4:	00000613          	li	a2,0
   107f8:	00000513          	li	a0,0
   107fc:	0600006f          	j	1085c <__register_exitproc>

0000000000010800 <__libc_fini_array>:
   10800:	fe010113          	addi	sp,sp,-32
   10804:	00813823          	sd	s0,16(sp)
   10808:	000117b7          	lui	a5,0x11
   1080c:	00011437          	lui	s0,0x11
   10810:	01878793          	addi	a5,a5,24 # 11018 <__do_global_dtors_aux_fini_array_entry>
   10814:	02040413          	addi	s0,s0,32 # 11020 <impure_data>
   10818:	40f40433          	sub	s0,s0,a5
   1081c:	00913423          	sd	s1,8(sp)
   10820:	00113c23          	sd	ra,24(sp)
   10824:	40345493          	srai	s1,s0,0x3
   10828:	02048063          	beqz	s1,10848 <__libc_fini_array+0x48>
   1082c:	ff840413          	addi	s0,s0,-8
   10830:	00f40433          	add	s0,s0,a5
   10834:	00043783          	ld	a5,0(s0)
   10838:	fff48493          	addi	s1,s1,-1
   1083c:	ff840413          	addi	s0,s0,-8
   10840:	000780e7          	jalr	a5
   10844:	fe0498e3          	bnez	s1,10834 <__libc_fini_array+0x34>
   10848:	01813083          	ld	ra,24(sp)
   1084c:	01013403          	ld	s0,16(sp)
   10850:	00813483          	ld	s1,8(sp)
   10854:	02010113          	addi	sp,sp,32
   10858:	00008067          	ret

000000000001085c <__register_exitproc>:
   1085c:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10860:	1f873783          	ld	a5,504(a4)
   10864:	06078063          	beqz	a5,108c4 <__register_exitproc+0x68>
   10868:	0087a703          	lw	a4,8(a5)
   1086c:	01f00813          	li	a6,31
   10870:	08e84663          	blt	a6,a4,108fc <__register_exitproc+0xa0>
   10874:	02050863          	beqz	a0,108a4 <__register_exitproc+0x48>
   10878:	00371813          	slli	a6,a4,0x3
   1087c:	01078833          	add	a6,a5,a6
   10880:	10c83823          	sd	a2,272(a6)
   10884:	3107a883          	lw	a7,784(a5)
   10888:	00100613          	li	a2,1
   1088c:	00e6163b          	sllw	a2,a2,a4
   10890:	00c8e8b3          	or	a7,a7,a2
   10894:	3117a823          	sw	a7,784(a5)
   10898:	20d83823          	sd	a3,528(a6)
   1089c:	00200693          	li	a3,2
   108a0:	02d50863          	beq	a0,a3,108d0 <__register_exitproc+0x74>
   108a4:	00270693          	addi	a3,a4,2
   108a8:	00369693          	slli	a3,a3,0x3
   108ac:	0017071b          	addiw	a4,a4,1
   108b0:	00e7a423          	sw	a4,8(a5)
   108b4:	00d787b3          	add	a5,a5,a3
   108b8:	00b7b023          	sd	a1,0(a5)
   108bc:	00000513          	li	a0,0
   108c0:	00008067          	ret
   108c4:	20070793          	addi	a5,a4,512
   108c8:	1ef73c23          	sd	a5,504(a4)
   108cc:	f9dff06f          	j	10868 <__register_exitproc+0xc>
   108d0:	3147a683          	lw	a3,788(a5)
   108d4:	00000513          	li	a0,0
   108d8:	00c6e6b3          	or	a3,a3,a2
   108dc:	30d7aa23          	sw	a3,788(a5)
   108e0:	00270693          	addi	a3,a4,2
   108e4:	00369693          	slli	a3,a3,0x3
   108e8:	0017071b          	addiw	a4,a4,1
   108ec:	00e7a423          	sw	a4,8(a5)
   108f0:	00d787b3          	add	a5,a5,a3
   108f4:	00b7b023          	sd	a1,0(a5)
   108f8:	00008067          	ret
   108fc:	fff00513          	li	a0,-1
   10900:	00008067          	ret

0000000000010904 <_exit>:
   10904:	05d00893          	li	a7,93
   10908:	00000073          	ecall
   1090c:	00054463          	bltz	a0,10914 <_exit+0x10>
   10910:	0000006f          	j	10910 <_exit+0xc>
   10914:	ff010113          	addi	sp,sp,-16
   10918:	00813023          	sd	s0,0(sp)
   1091c:	00050413          	mv	s0,a0
   10920:	00113423          	sd	ra,8(sp)
   10924:	4080043b          	negw	s0,s0
   10928:	00c000ef          	jal	ra,10934 <__errno>
   1092c:	00852023          	sw	s0,0(a0) # 11000 <__FRAME_END__>
   10930:	0000006f          	j	10930 <_exit+0x2c>

0000000000010934 <__errno>:
   10934:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10938:	00008067          	ret

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

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	002c                	.2byte	0x2c
   2:	0000                	.2byte	0x0
   4:	0002                	.2byte	0x2
   6:	0000                	.2byte	0x0
   8:	0000                	.2byte	0x0
   a:	0008                	.2byte	0x8
   c:	0000                	.2byte	0x0
   e:	0000                	.2byte	0x0
  10:	0428                	.2byte	0x428
  12:	0001                	.2byte	0x1
  14:	0000                	.2byte	0x0
  16:	0000                	.2byte	0x0
  18:	0024                	.2byte	0x24
	...
  2e:	0000                	.2byte	0x0
  30:	002c                	.2byte	0x2c
  32:	0000                	.2byte	0x0
  34:	0002                	.2byte	0x2
  36:	0028                	.2byte	0x28
  38:	0000                	.2byte	0x0
  3a:	0008                	.2byte	0x8
  3c:	0000                	.2byte	0x0
  3e:	0000                	.2byte	0x0
  40:	044c                	.2byte	0x44c
  42:	0001                	.2byte	0x1
  44:	0000                	.2byte	0x0
  46:	0000                	.2byte	0x0
  48:	0100                	.2byte	0x100
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	0024                	.2byte	0x24
   2:	0000                	.2byte	0x0
   4:	0005                	.2byte	0x5
   6:	0801                	.2byte	0x801
   8:	0000                	.2byte	0x0
   a:	0000                	.2byte	0x0
   c:	0001                	.2byte	0x1
   e:	0000                	.2byte	0x0
  10:	2800                	.2byte	0x2800
  12:	0104                	.2byte	0x104
  14:	0000                	.2byte	0x0
  16:	0000                	.2byte	0x0
  18:	2400                	.2byte	0x2400
  1a:	0000                	.2byte	0x0
  1c:	0000                	.2byte	0x0
  1e:	00000033          	add	zero,zero,zero
  22:	0090                	.2byte	0x90
  24:	0000                	.2byte	0x0
  26:	8001                	.2byte	0x8001
  28:	0025                	.2byte	0x25
  2a:	0000                	.2byte	0x0
  2c:	0005                	.2byte	0x5
  2e:	0801                	.2byte	0x801
  30:	0014                	.2byte	0x14
  32:	0000                	.2byte	0x0
  34:	7e01                	.2byte	0x7e01
  36:	0000                	.2byte	0x0
  38:	4c00                	.2byte	0x4c00
  3a:	0104                	.2byte	0x104
  3c:	0000                	.2byte	0x0
  3e:	0000                	.2byte	0x0
  40:	8000                	.2byte	0x8000
  42:	9c02                	.2byte	0x9c02
  44:	0000                	.2byte	0x0
  46:	3300                	.2byte	0x3300
  48:	0000                	.2byte	0x0
  4a:	9000                	.2byte	0x9000
  4c:	0000                	.2byte	0x0
  4e:	0100                	.2byte	0x100
  50:	80              	Address 0x0000000000000050 is out of bounds.


Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	1101                	.2byte	0x1101
   2:	1000                	.2byte	0x1000
   4:	12011117          	auipc	sp,0x12011
   8:	1b0e030f          	.4byte	0x1b0e030f
   c:	250e                	.2byte	0x250e
   e:	130e                	.2byte	0x130e
  10:	0005                	.2byte	0x5
  12:	0000                	.2byte	0x0
  14:	1101                	.2byte	0x1101
  16:	1000                	.2byte	0x1000
  18:	12011117          	auipc	sp,0x12011
  1c:	1b0e030f          	.4byte	0x1b0e030f
  20:	250e                	.2byte	0x250e
  22:	130e                	.2byte	0x130e
  24:	0005                	.2byte	0x5
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	007a                	.2byte	0x7a
   2:	0000                	.2byte	0x0
   4:	0005                	.2byte	0x5
   6:	0008                	.2byte	0x8
   8:	002e                	.2byte	0x2e
   a:	0000                	.2byte	0x0
   c:	0101                	.2byte	0x101
   e:	fb01                	.2byte	0xfb01
  10:	0d0e                	.2byte	0xd0e
  12:	0100                	.2byte	0x100
  14:	0101                	.2byte	0x101
  16:	0001                	.2byte	0x1
  18:	0000                	.2byte	0x0
  1a:	0001                	.2byte	0x1
  1c:	0100                	.2byte	0x100
  1e:	0101                	.2byte	0x101
  20:	021f 0000 0000      	.byte	0x1f, 0x02, 0x00, 0x00, 0x00, 0x00
  26:	005d                	.2byte	0x5d
  28:	0000                	.2byte	0x0
  2a:	0102                	.2byte	0x102
  2c:	021f 020f 0087      	.byte	0x1f, 0x02, 0x0f, 0x02, 0x87, 0x00
  32:	0000                	.2byte	0x0
  34:	8701                	.2byte	0x8701
  36:	0000                	.2byte	0x0
  38:	0100                	.2byte	0x100
  3a:	0900                	.2byte	0x900
  3c:	2802                	.2byte	0x2802
  3e:	0104                	.2byte	0x104
  40:	0000                	.2byte	0x0
  42:	0000                	.2byte	0x0
  44:	0300                	.2byte	0x300
  46:	0124                	.2byte	0x124
  48:	04090103          	lb	sp,64(s2)
  4c:	0100                	.2byte	0x100
  4e:	04090203          	lb	tp,64(s2)
  52:	0100                	.2byte	0x100
  54:	04090103          	lb	sp,64(s2)
  58:	0100                	.2byte	0x100
  5a:	04090103          	lb	sp,64(s2)
  5e:	0100                	.2byte	0x100
  60:	04090203          	lb	tp,64(s2)
  64:	0100                	.2byte	0x100
  66:	04090103          	lb	sp,64(s2)
  6a:	0100                	.2byte	0x100
  6c:	04090103          	lb	sp,64(s2)
  70:	0100                	.2byte	0x100
  72:	04090103          	lb	sp,64(s2)
  76:	0100                	.2byte	0x100
  78:	0409                	.2byte	0x409
  7a:	0000                	.2byte	0x0
  7c:	0101                	.2byte	0x101
  7e:	01c4                	.2byte	0x1c4
  80:	0000                	.2byte	0x0
  82:	0005                	.2byte	0x5
  84:	0008                	.2byte	0x8
  86:	002e                	.2byte	0x2e
  88:	0000                	.2byte	0x0
  8a:	0101                	.2byte	0x101
  8c:	fb01                	.2byte	0xfb01
  8e:	0d0e                	.2byte	0xd0e
  90:	0100                	.2byte	0x100
  92:	0101                	.2byte	0x101
  94:	0001                	.2byte	0x1
  96:	0000                	.2byte	0x0
  98:	0001                	.2byte	0x1
  9a:	0100                	.2byte	0x100
  9c:	0101                	.2byte	0x101
  9e:	021f 0000 0000      	.byte	0x1f, 0x02, 0x00, 0x00, 0x00, 0x00
  a4:	005d                	.2byte	0x5d
  a6:	0000                	.2byte	0x0
  a8:	0102                	.2byte	0x102
  aa:	021f 020f 0090      	.byte	0x1f, 0x02, 0x0f, 0x02, 0x90, 0x00
  b0:	0000                	.2byte	0x0
  b2:	9001                	.2byte	0x9001
  b4:	0000                	.2byte	0x0
  b6:	0100                	.2byte	0x100
  b8:	0900                	.2byte	0x900
  ba:	4c02                	.2byte	0x4c02
  bc:	0104                	.2byte	0x104
  be:	0000                	.2byte	0x0
  c0:	0000                	.2byte	0x0
  c2:	0300                	.2byte	0x300
  c4:	01030127          	.4byte	0x1030127
  c8:	0409                	.2byte	0x409
  ca:	0100                	.2byte	0x100
  cc:	04090103          	lb	sp,64(s2)
  d0:	0100                	.2byte	0x100
  d2:	04090103          	lb	sp,64(s2)
  d6:	0100                	.2byte	0x100
  d8:	04090103          	lb	sp,64(s2)
  dc:	0100                	.2byte	0x100
  de:	04090103          	lb	sp,64(s2)
  e2:	0100                	.2byte	0x100
  e4:	04090503          	lb	a0,64(s2)
  e8:	0100                	.2byte	0x100
  ea:	04090103          	lb	sp,64(s2)
  ee:	0100                	.2byte	0x100
  f0:	04090103          	lb	sp,64(s2)
  f4:	0100                	.2byte	0x100
  f6:	04090103          	lb	sp,64(s2)
  fa:	0100                	.2byte	0x100
  fc:	04090103          	lb	sp,64(s2)
 100:	0100                	.2byte	0x100
 102:	04090103          	lb	sp,64(s2)
 106:	0100                	.2byte	0x100
 108:	04090103          	lb	sp,64(s2)
 10c:	0100                	.2byte	0x100
 10e:	04090103          	lb	sp,64(s2)
 112:	0100                	.2byte	0x100
 114:	04090703          	lb	a4,64(s2)
 118:	0100                	.2byte	0x100
 11a:	04090103          	lb	sp,64(s2)
 11e:	0100                	.2byte	0x100
 120:	04090403          	lb	s0,64(s2)
 124:	0100                	.2byte	0x100
 126:	04090103          	lb	sp,64(s2)
 12a:	0100                	.2byte	0x100
 12c:	04090403          	lb	s0,64(s2)
 130:	0100                	.2byte	0x100
 132:	04090103          	lb	sp,64(s2)
 136:	0100                	.2byte	0x100
 138:	04090103          	lb	sp,64(s2)
 13c:	0100                	.2byte	0x100
 13e:	04090103          	lb	sp,64(s2)
 142:	0100                	.2byte	0x100
 144:	04090103          	lb	sp,64(s2)
 148:	0100                	.2byte	0x100
 14a:	04090103          	lb	sp,64(s2)
 14e:	0100                	.2byte	0x100
 150:	04090203          	lb	tp,64(s2)
 154:	0100                	.2byte	0x100
 156:	04090103          	lb	sp,64(s2)
 15a:	0100                	.2byte	0x100
 15c:	04090103          	lb	sp,64(s2)
 160:	0100                	.2byte	0x100
 162:	04090103          	lb	sp,64(s2)
 166:	0100                	.2byte	0x100
 168:	04090203          	lb	tp,64(s2)
 16c:	0100                	.2byte	0x100
 16e:	04090203          	lb	tp,64(s2)
 172:	0100                	.2byte	0x100
 174:	04090103          	lb	sp,64(s2)
 178:	0100                	.2byte	0x100
 17a:	04090103          	lb	sp,64(s2)
 17e:	0100                	.2byte	0x100
 180:	04090203          	lb	tp,64(s2)
 184:	0100                	.2byte	0x100
 186:	04090103          	lb	sp,64(s2)
 18a:	0100                	.2byte	0x100
 18c:	04090103          	lb	sp,64(s2)
 190:	0100                	.2byte	0x100
 192:	04090203          	lb	tp,64(s2)
 196:	0100                	.2byte	0x100
 198:	04090503          	lb	a0,64(s2)
 19c:	0100                	.2byte	0x100
 19e:	04090103          	lb	sp,64(s2)
 1a2:	0100                	.2byte	0x100
 1a4:	04090103          	lb	sp,64(s2)
 1a8:	0100                	.2byte	0x100
 1aa:	04090103          	lb	sp,64(s2)
 1ae:	0100                	.2byte	0x100
 1b0:	04090503          	lb	a0,64(s2)
 1b4:	0100                	.2byte	0x100
 1b6:	04090203          	lb	tp,64(s2)
 1ba:	0100                	.2byte	0x100
 1bc:	04090203          	lb	tp,64(s2)
 1c0:	0100                	.2byte	0x100
 1c2:	04090103          	lb	sp,64(s2)
 1c6:	0100                	.2byte	0x100
 1c8:	04090203          	lb	tp,64(s2)
 1cc:	0100                	.2byte	0x100
 1ce:	04090203          	lb	tp,64(s2)
 1d2:	0100                	.2byte	0x100
 1d4:	04090103          	lb	sp,64(s2)
 1d8:	0100                	.2byte	0x100
 1da:	04090103          	lb	sp,64(s2)
 1de:	0100                	.2byte	0x100
 1e0:	04090103          	lb	sp,64(s2)
 1e4:	0100                	.2byte	0x100
 1e6:	04090403          	lb	s0,64(s2)
 1ea:	0100                	.2byte	0x100
 1ec:	04090103          	lb	sp,64(s2)
 1f0:	0100                	.2byte	0x100
 1f2:	04090103          	lb	sp,64(s2)
 1f6:	0100                	.2byte	0x100
 1f8:	04090203          	lb	tp,64(s2)
 1fc:	0100                	.2byte	0x100
 1fe:	04090103          	lb	sp,64(s2)
 202:	0100                	.2byte	0x100
 204:	04090103          	lb	sp,64(s2)
 208:	0100                	.2byte	0x100
 20a:	04090203          	lb	tp,64(s2)
 20e:	0100                	.2byte	0x100
 210:	04090103          	lb	sp,64(s2)
 214:	0100                	.2byte	0x100
 216:	04090203          	lb	tp,64(s2)
 21a:	0100                	.2byte	0x100
 21c:	04090103          	lb	sp,64(s2)
 220:	0100                	.2byte	0x100
 222:	04090103          	lb	sp,64(s2)
 226:	0100                	.2byte	0x100
 228:	04090103          	lb	sp,64(s2)
 22c:	0100                	.2byte	0x100
 22e:	04090603          	lb	a2,64(s2)
 232:	0100                	.2byte	0x100
 234:	04090103          	lb	sp,64(s2)
 238:	0100                	.2byte	0x100
 23a:	04090103          	lb	sp,64(s2)
 23e:	0100                	.2byte	0x100
 240:	0409                	.2byte	0x409
 242:	0000                	.2byte	0x0
 244:	0101                	.2byte	0x101

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	2e2e                	.2byte	0x2e2e
   2:	2f2e2e2f          	.4byte	0x2f2e2e2f
   6:	2e2e                	.2byte	0x2e2e
   8:	2f2e2e2f          	.4byte	0x2f2e2e2f
   c:	6972                	.2byte	0x6972
   e:	2d766373          	csrrsi	t1,0x2d7,12
  12:	2f636367          	.4byte	0x2f636367
  16:	696c                	.2byte	0x696c
  18:	6762                	.2byte	0x6762
  1a:	632f6363          	bltu	t5,s2,640 <exit-0xfaa8>
  1e:	69666e6f          	jal	t3,666b4 <__global_pointer$+0x54e94>
  22:	69722f67          	.4byte	0x69722f67
  26:	2f766373          	csrrsi	t1,0x2f7,12
  2a:	756d                	.2byte	0x756d
  2c:	646c                	.2byte	0x646c
  2e:	3369                	.2byte	0x3369
  30:	532e                	.2byte	0x532e
  32:	2f00                	.2byte	0x2f00
  34:	6f68                	.2byte	0x6f68
  36:	656d                	.2byte	0x656d
  38:	7177712f          	.4byte	0x7177712f
  3c:	7369722f          	.4byte	0x7369722f
  40:	672d7663          	bgeu	s10,s2,6ac <exit-0xfa3c>
  44:	756e                	.2byte	0x756e
  46:	742d                	.2byte	0x742d
  48:	636c6f6f          	jal	t5,c667e <__global_pointer$+0xb4e5e>
  4c:	6168                	.2byte	0x6168
  4e:	6e69                	.2byte	0x6e69
  50:	6975622f          	.4byte	0x6975622f
  54:	646c                	.2byte	0x646c
  56:	722d                	.2byte	0x722d
  58:	3676                	.2byte	0x3676
  5a:	6934                	.2byte	0x6934
  5c:	6975622f          	.4byte	0x6975622f
  60:	646c                	.2byte	0x646c
  62:	672d                	.2byte	0x672d
  64:	6e2d6363          	bltu	s10,sp,74a <exit-0xf99e>
  68:	7765                	.2byte	0x7765
  6a:	696c                	.2byte	0x696c
  6c:	2d62                	.2byte	0x2d62
  6e:	67617473          	csrrci	s0,0x676,2
  72:	3265                	.2byte	0x3265
  74:	7369722f          	.4byte	0x7369722f
  78:	34367663          	bgeu	a2,gp,3c4 <exit-0xfd24>
  7c:	752d                	.2byte	0x752d
  7e:	6b6e                	.2byte	0x6b6e
  80:	6f6e                	.2byte	0x6f6e
  82:	652d6e77          	.4byte	0x652d6e77
  86:	666c                	.2byte	0x666c
  88:	62696c2f          	.4byte	0x62696c2f
  8c:	00636367          	.4byte	0x636367
  90:	20554e47          	.4byte	0x20554e47
  94:	5341                	.2byte	0x5341
  96:	3220                	.2byte	0x3220
  98:	332e                	.2byte	0x332e
  9a:	0038                	.2byte	0x38
  9c:	2e2e                	.2byte	0x2e2e
  9e:	2f2e2e2f          	.4byte	0x2f2e2e2f
  a2:	2e2e                	.2byte	0x2e2e
  a4:	2f2e2e2f          	.4byte	0x2f2e2e2f
  a8:	6972                	.2byte	0x6972
  aa:	2d766373          	csrrsi	t1,0x2d7,12
  ae:	2f636367          	.4byte	0x2f636367
  b2:	696c                	.2byte	0x696c
  b4:	6762                	.2byte	0x6762
  b6:	632f6363          	bltu	t5,s2,6dc <exit-0xfa0c>
  ba:	69666e6f          	jal	t3,66750 <__global_pointer$+0x54f30>
  be:	69722f67          	.4byte	0x69722f67
  c2:	2f766373          	csrrsi	t1,0x2f7,12
  c6:	6964                	.2byte	0x6964
  c8:	2e76                	.2byte	0x2e76
  ca:	53 00             	Address 0x00000000000000ca is out of bounds.


Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	6d6f682f          	.4byte	0x6d6f682f
   4:	2f65                	.2byte	0x2f65
   6:	7771                	.2byte	0x7771
   8:	2f71                	.2byte	0x2f71
   a:	6972                	.2byte	0x6972
   c:	2d766373          	csrrsi	t1,0x2d7,12
  10:	2d756e67          	.4byte	0x2d756e67
  14:	6f74                	.2byte	0x6f74
  16:	68636c6f          	jal	s8,3669c <__global_pointer$+0x24e7c>
  1a:	6961                	.2byte	0x6961
  1c:	2f6e                	.2byte	0x2f6e
  1e:	7562                	.2byte	0x7562
  20:	6c69                	.2byte	0x6c69
  22:	2d64                	.2byte	0x2d64
  24:	7672                	.2byte	0x7672
  26:	3436                	.2byte	0x3436
  28:	2f69                	.2byte	0x2f69
  2a:	7562                	.2byte	0x7562
  2c:	6c69                	.2byte	0x6c69
  2e:	2d64                	.2byte	0x2d64
  30:	2d636367          	.4byte	0x2d636367
  34:	656e                	.2byte	0x656e
  36:	62696c77          	.4byte	0x62696c77
  3a:	732d                	.2byte	0x732d
  3c:	6174                	.2byte	0x6174
  3e:	2f326567          	.4byte	0x2f326567
  42:	6972                	.2byte	0x6972
  44:	36766373          	csrrsi	t1,0x367,12
  48:	2d34                	.2byte	0x2d34
  4a:	6e75                	.2byte	0x6e75
  4c:	776f6e6b          	.4byte	0x776f6e6b
  50:	2d6e                	.2byte	0x2d6e
  52:	6c65                	.2byte	0x6c65
  54:	2f66                	.2byte	0x2f66
  56:	696c                	.2byte	0x696c
  58:	6762                	.2byte	0x6762
  5a:	2e006363          	bltu	zero,zero,340 <exit-0xfda8>
  5e:	2f2e                	.2byte	0x2f2e
  60:	2e2e                	.2byte	0x2e2e
  62:	2f2e2e2f          	.4byte	0x2f2e2e2f
  66:	2e2e                	.2byte	0x2e2e
  68:	7369722f          	.4byte	0x7369722f
  6c:	672d7663          	bgeu	s10,s2,6d8 <exit-0xfa10>
  70:	6c2f6363          	bltu	t5,sp,736 <exit-0xf9b2>
  74:	6269                	.2byte	0x6269
  76:	2f636367          	.4byte	0x2f636367
  7a:	666e6f63          	bltu	t3,t1,6f8 <exit-0xf9f0>
  7e:	6769                	.2byte	0x6769
  80:	7369722f          	.4byte	0x7369722f
  84:	6d007663          	bgeu	zero,a6,750 <exit-0xf998>
  88:	6c75                	.2byte	0x6c75
  8a:	6964                	.2byte	0x6964
  8c:	00532e33          	slt	t3,t1,t0
  90:	6964                	.2byte	0x6964
  92:	2e76                	.2byte	0x2e76
  94:	53 00             	Address 0x0000000000000094 is out of bounds.

