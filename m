Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8D696FC7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 22:33:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pS2vZ-0002wu-9V;
	Tue, 14 Feb 2023 21:33:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <megi@xff.cz>) id 1pS2vX-0002wn-Gg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 21:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SRDj8Y6dcQUvauAaXDQOn5pzhkwFbSeQPAluXd6uBKw=; b=CdI4Y6l3L2h8JeJGeG5yR2wa5/
 iPLwenTOvfKND5aY6BQ+xoXjGHNei4u+TgOcntHkoF/aDi610+ubRr3ZUJ/O4yfWM8PViBU8iibVk
 bLsuU3xwqSgCjUk+HkYvY03X7nJh2/5oiS8mvNw+juxDtJclq6Ho895HuBp+qfm3skck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SRDj8Y6dcQUvauAaXDQOn5pzhkwFbSeQPAluXd6uBKw=; b=O
 MOHC7vIGcyJyChhw5tw+HaxGHFpTQ6IWYafXiRtrDvpprTlVXgf81ZdAonek/5ZHcM1OtFOQdr4R2
 XL3YQwO42IQpqXfU5WKR519RKUfvABu+2PMwGlk3TC9joaJf1ltQ5H/fdIAqz5AdmFIgXMpASB32V
 TS7NpJUrV0eXdH2o=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pS2vU-004WHP-6x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 21:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1676408843; bh=PXW4oQM55xrBhyhF59LUx/5K6WXp3OD/31/BFX81BN8=;
 h=Date:From:To:Subject:X-My-GPG-KeyId:From;
 b=dNbNUZktGCCFcEKawte08rZjZGht/n52n0Ym8LQmltLvtfE6/1c99pHiJ0YmrYRxr
 mtm1JfsiDBcFzWuUjw0jIUDenFVy5T7HziTr2iEkcDbeWaxvzlc5yGS2/3AWAc89L0
 q7Sbgnu35MW4jwxLFdySaayacuECrNFykRt4/qWg=
Date: Tue, 14 Feb 2023 22:07:23 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20230214210723.vxmzehsbbvrilr4c@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I'm trying 6.2-rc8 on my Orange Pi PC and noticed this
 bug in dmesg and locked-up fsync. (impossible to write to the filesystem)
 This just happened after first reboot from v6.1.11. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pS2vU-004WHP-6x
Subject: [f2fs-dev] kernel BUG at fs/f2fs/extent_cache.c:730 and subsequent
 warning (6.2-rc8)
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I'm trying 6.2-rc8 on my Orange Pi PC and noticed this bug in dmesg and
locked-up fsync. (impossible to write to the filesystem)

This just happened after first reboot from v6.1.11.

[    5.908783] ------------[ cut here ]------------
[    5.908809] kernel BUG at fs/f2fs/extent_cache.c:730!
[    5.908823] Internal error: Oops - BUG: 0 [#1] SMP ARM
[    5.908833] Modules linked in:
[    5.908845] CPU: 1 PID: 170 Comm: systemd-hwdb Not tainted 6.2.0-rc8-00439-g5af5ffe2dcc6 #6
[    5.908856] Hardware name: Allwinner sun8i Family
[    5.908862] PC is at __update_extent_tree_range+0x3f8/0x5c4
[    5.908881] LR is at 0xc21066b0
[    5.908889] pc : [<c069cb7c>]    lr : [<c21066b0>]    psr: 60070013
[    5.908896] sp : f15b5a98  ip : f15b5b18  fp : 00000000
[    5.908901] r10: c21066a0  r9 : 00000001  r8 : c2119100
[    5.908907] r7 : 00000002  r6 : 00000001  r5 : 00000000  r4 : c2106690
[    5.908913] r3 : 00000000  r2 : 0016c7e3  r1 : 00001000  r0 : 00000000
[    5.908920] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[    5.908929] Control: 30c5387d  Table: 439252c0  DAC: 1e4456a8
[    5.908934] Register r0 information: NULL pointer
[    5.908946] Register r1 information: non-paged memory
[    5.908953] Register r2 information: non-paged memory
[    5.908960] Register r3 information: NULL pointer
[    5.908967] Register r4 information: slab f2fs_extent_node start c2106690 pointer offset 0 size 56
[    5.908993] Register r5 information: NULL pointer
[    5.909000] Register r6 information: non-paged memory
[    5.909008] Register r7 information: non-paged memory
[    5.909015] Register r8 information: slab kmalloc-rcl-64 start c2119100 pointer offset 0 size 64
[    5.909034] Register r9 information: non-paged memory
[    5.909042] Register r10 information: slab f2fs_extent_node start c2106690 pointer offset 16 size 56
[    5.909061] Register r11 information: NULL pointer
[    5.909069] Register r12 information: 2-page vmalloc region starting at 0xf15b4000 allocated at kernel_clone+0x84/0x2e8
[    5.909091] Process systemd-hwdb (pid: 170, stack limit = 0xf893aa64)
[    5.909103] Stack: (0xf15b5a98 to 0xf15b6000)
[    5.909111] 5a80:                                                       f15b5ae4 f15b5ae8
[    5.909121] 5aa0: f15b5aec 00000000 f15b5adf 00000000 ef780af0 00000001 00000000 00000000
[    5.909130] 5ac0: c2ad7000 00000001 c211911c c2146b98 f15b5b50 00000001 00000000 01000000
[    5.909139] 5ae0: 00000000 00000000 c2106698 c2106690 c2fd6600 c068dfd0 00011d39 00000b30
[    5.909148] 5b00: 00000000 00001000 00000000 00000001 0016c7e3 00000000 00000000 00001000
[    5.909157] 5b20: c2b56000 f15b5bfc 00000000 c2ad7000 00000000 00001000 00000000 00000001
[    5.909167] 5b40: 00000001 c069cf50 f15b5c54 c067e65c 00000001 00000001 0016c7e4 00000000
[    5.909176] 5b60: 00000000 00000000 ef780af0 c22fc3f0 c22fc3f0 00000000 00001000 c03517d4
[    5.909185] 5b80: ef780af0 f15b5c54 f15b5bfc c2ad7000 00000000 00001000 00000000 00000001
[    5.909194] 5ba0: 00000001 c06943e0 00000000 f15b5c54 011d3914 00010000 f15b5c54 ef780b14
[    5.909204] 5bc0: c2146d50 f15b5bfc f15b5d1c c0682f90 00011d39 00011d39 ffffffff c068d700
[    5.909213] 5be0: 00000000 00000000 00000000 00000000 00000000 00000000 c2ad7000 c2146b98
[    5.909222] 5c00: ef780af0 ef780af0 00011d39 00000001 00000001 0016c7e4 00011d3b c2146b98
[    5.909232] 5c20: ef780b14 f15b5e78 c2ad7000 00000b2f f15b5d1c c068349c 00000000 c0687688
[    5.909241] 5c40: 00000000 f15b5d14 00b2fe98 00000001 00000000 c2ad7000 00011d39 00000000
[    5.909250] 5c60: 00000001 00000001 00000800 0016c7e4 ffffffff ef780b14 00000000 00000000
[    5.909259] 5c80: 00000100 00000122 00000001 00000000 00000001 00000000 00000000 00000006
[    5.909269] 5ca0: f15b5e78 f15b5d14 f15b5d28 00000000 00001000 ef780b14 c2146b98 f15b5e78
[    5.909278] 5cc0: 00000001 f15b5d70 fffff000 c2146ca0 00000000 c06838d8 f15b5e78 00000006
[    5.909287] 5ce0: 00000000 00000001 ffffffff 00000001 c2ad7000 00000010 00000000 00000002
[    5.909296] 5d00: 00000006 00000001 00000000 00000001 00000000 00000000 00000010 00000001
[    5.909305] 5d20: 00000000 00000001 00000000 00000000 ef780af0 c2146b98 ffffffff 00000000
[    5.909313] 5d40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.909323] 5d60: 00000000 00000000 00000000 00000000 effbc638 ef780b14 ef780b38 ef780b5c
[    5.909332] 5d80: ef780b80 ef780ba4 ef780bc8 ef780bec ef780c10 ef780c34 ef780c58 ef780c7c
[    5.909341] 5da0: ef780ca0 ef780cc4 ef780ce8 ef780d0c 00000000 c2146b98 f15b5e78 c2146ca0
[    5.909351] 5dc0: c2ad7000 c2ad702c 00000006 c034e4fc 7fffffff c0683f80 00000000 00000000
[    5.909360] 5de0: 00000001 c0000000 f15b5de8 f15b5de8 00000000 fffea756 f15b5e78 c2146ca0
[    5.909369] 5e00: c18f1f40 c3832800 c1803d40 c0351268 00000000 c2146ca0 f15b5f20 c0346030
[    5.909379] 5e20: 00000050 00000050 effbc638 00000000 c374e6c0 00000000 00000000 c2de2f80
[    5.909388] 5e40: c2146b98 c2146ca0 f15b5e78 c374e6c0 7fffffff ffffffff c2146ca0 c0345e7c
[    5.909397] 5e60: 00000000 00000000 00000000 c0346584 00000050 00000000 7ffffffe 00000000
[    5.909406] 5e80: 00000000 00000000 ffffffff 7fffffff 00000001 00000000 00000000 c3832800
[    5.909416] 5ea0: c2146b98 00000013 00000000 00000000 00002000 00000000 00000000 00000000
[    5.909425] 5ec0: c374e6c0 c2146b98 00000000 c2ad7000 00000000 00011d39 ffffffff c065d6e8
[    5.909434] 5ee0: ffffffff 7fffffff c2146b98 c2146d50 f15b5f88 00000000 7fffffff 00000000
[    5.909443] 5f00: 00000000 00000000 00000000 00000000 00000001 00000000 00000000 00000000
[    5.909451] 5f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.909461] 5f40: c2b55c00 ffffffff 7fffffff c374e6c0 00000076 c0200298 c2de2f80 00000076
[    5.909470] 5f60: 00e9b148 c065dd64 ffffffff 7fffffff 00000000 00000000 00000000 c374e6c0
[    5.909479] 5f80: 00000000 c03f5440 ffffffff 7fffffff 00000000 00000050 00ebcbc8 b6f3c400
[    5.909489] 5fa0: 00000020 c0200060 00ebcbc8 b6f3c400 00000003 00000202 00000000 00000000
[    5.909498] 5fc0: 00ebcbc8 b6f3c400 00000020 00000076 00000000 00b2fe98 00e9b166 00e9b148
[    5.909507] 5fe0: bee10ba0 bee11ba0 b6cc35ec b6b166a4 60070010 00000003 00000000 00000000
[    5.909523]  __update_extent_tree_range from __update_extent_cache+0x208/0x300
[    5.909536]  __update_extent_cache from f2fs_outplace_write_data+0x68/0x90
[    5.909554]  f2fs_outplace_write_data from f2fs_do_write_data_page+0x424/0x500
[    5.909572]  f2fs_do_write_data_page from f2fs_write_single_data_page+0x430/0x614
[    5.909585]  f2fs_write_single_data_page from f2fs_write_cache_pages+0x258/0x72c
[    5.909599]  f2fs_write_cache_pages from f2fs_write_data_pages+0x1d4/0x268
[    5.909612]  f2fs_write_data_pages from do_writepages+0x60/0x19c
[    5.909627]  do_writepages from filemap_fdatawrite_wbc+0x64/0x84
[    5.909643]  filemap_fdatawrite_wbc from file_write_and_wait_range+0x80/0xe4
[    5.909658]  file_write_and_wait_range from f2fs_do_sync_file+0xc0/0x700
[    5.909675]  f2fs_do_sync_file from f2fs_sync_file+0x3c/0x4c
[    5.909688]  f2fs_sync_file from do_fsync+0x40/0x74
[    5.909704]  do_fsync from ret_fast_syscall+0x0/0x4c
[    5.909717] Exception stack(0xf15b5fa8 to 0xf15b5ff0)
[    5.909726] 5fa0:                   00ebcbc8 b6f3c400 00000003 00000202 00000000 00000000
[    5.909735] 5fc0: 00ebcbc8 b6f3c400 00000020 00000076 00000000 00b2fe98 00e9b166 00e9b148
[    5.909743] 5fe0: bee10ba0 bee11ba0 b6cc35ec b6b166a4
[    5.909755] Code: e0873003 e0433005 e58d3060 eaffffb9 (e7f001f2) 
[    5.909765] ---[ end trace 0000000000000000 ]---
[    5.909773] ------------[ cut here ]------------
[    5.909778] WARNING: CPU: 1 PID: 170 at kernel/exit.c:812 do_exit+0x75c/0x8a4
[    5.909792] Modules linked in:
[    5.909800] CPU: 1 PID: 170 Comm: systemd-hwdb Tainted: G      D            6.2.0-rc8-00439-g5af5ffe2dcc6 #6
[    5.909809] Hardware name: Allwinner sun8i Family
[    5.909815]  unwind_backtrace from show_stack+0x10/0x14
[    5.909830]  show_stack from dump_stack_lvl+0x40/0x4c
[    5.909844]  dump_stack_lvl from __warn+0x88/0xc8
[    5.909860]  __warn from warn_slowpath_fmt+0x50/0x98
[    5.909878]  warn_slowpath_fmt from do_exit+0x75c/0x8a4
[    5.909893]  do_exit from make_task_dead+0x9c/0x144
[    5.909905]  make_task_dead from die+0x370/0x420
[    5.909916]  die from __und_svc_finish+0x0/0x38
[    5.909926] Exception stack(0xf15b5a48 to 0xf15b5a90)
[    5.909935] 5a40:                   00000000 00001000 0016c7e3 00000000 c2106690 00000000
[    5.909945] 5a60: 00000001 00000002 c2119100 00000001 c21066a0 00000000 f15b5b18 f15b5a98
[    5.909952] 5a80: c21066b0 c069cb7c 60070013 ffffffff
[    5.909958]  __und_svc_finish from __update_extent_tree_range+0x3f8/0x5c4
[    5.909971]  __update_extent_tree_range from __update_extent_cache+0x208/0x300
[    5.909982]  __update_extent_cache from f2fs_outplace_write_data+0x68/0x90
[    5.909998]  f2fs_outplace_write_data from f2fs_do_write_data_page+0x424/0x500
[    5.910014]  f2fs_do_write_data_page from f2fs_write_single_data_page+0x430/0x614
[    5.910027]  f2fs_write_single_data_page from f2fs_write_cache_pages+0x258/0x72c
[    5.910040]  f2fs_write_cache_pages from f2fs_write_data_pages+0x1d4/0x268
[    5.910053]  f2fs_write_data_pages from do_writepages+0x60/0x19c
[    5.910065]  do_writepages from filemap_fdatawrite_wbc+0x64/0x84
[    5.910077]  filemap_fdatawrite_wbc from file_write_and_wait_range+0x80/0xe4
[    5.910092]  file_write_and_wait_range from f2fs_do_sync_file+0xc0/0x700
[    5.910106]  f2fs_do_sync_file from f2fs_sync_file+0x3c/0x4c
[    5.910118]  f2fs_sync_file from do_fsync+0x40/0x74
[    5.910132]  do_fsync from ret_fast_syscall+0x0/0x4c
[    5.910143] Exception stack(0xf15b5fa8 to 0xf15b5ff0)
[    5.910152] 5fa0:                   00ebcbc8 b6f3c400 00000003 00000202 00000000 00000000
[    5.910161] 5fc0: 00ebcbc8 b6f3c400 00000020 00000076 00000000 00b2fe98 00e9b166 00e9b148
[    5.910168] 5fe0: bee10ba0 bee11ba0 b6cc35ec b6b166a4
[    5.910174] ---[ end trace 0000000000000000 ]---

Full dmesg: https://megous.com/dl/tmp/6.2-f2fs-bug

I had to cut power to shutdown the SBC. Afterwards I did run fsck.f2fs
on the uSD card from my PC which did not reveal any errors.

Info: [/dev/sdh3] Disk Model: Storage Device
Info: MKFS version
  "Linux version 4.18.16-arch1-1-ARCH (builduser@heftig-28760) (gcc version 8.2.1 20180831 (GCC)) #1 SMP PREEMPT Sat Oct 20 22:06:45 UTC 2018"
Info: FSCK version
  from "Linux version 5.3.10-00132-gf93775405cf5 (megi@core) (gcc version 9.2.1 20191013 (GCC)) #8 SMP Mon Nov 11 04:41:31 CET 2019"
    to "Linux version 6.1.11-arch1-1 (linux@archlinux) (gcc (GCC) 12.2.1 20230201, GNU ld (GNU Binutils) 2.40) #1 SMP PREEMPT_DYNAMIC Thu, 09 Feb 2023 20:06:08 +0000"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 29019136 (14169 MB)
Info: CKPT version = 2482aff0
Info: checkpoint state = 40 :  crc sudden-power-off
[FSCK] Check node 1 / 56743 (0.00%)
[FSCK] Check node 5675 / 56743 (10.00%)
[FSCK] Check node 11349 / 56743 (20.00%)
[FSCK] Check node 17023 / 56743 (30.00%)
[FSCK] Check node 22697 / 56743 (40.00%)
[FSCK] Check node 28371 / 56743 (50.00%)
[FSCK] Check node 34045 / 56743 (60.00%)
[FSCK] Check node 39719 / 56743 (70.00%)
[FSCK] Check node 45393 / 56743 (80.00%)
[FSCK] Check node 51067 / 56743 (90.00%)
[FSCK] Check node 56741 / 56743 (100.00%)

[FSCK] Max image size: 5969 MB, Free space: 11907 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x4f6]
[FSCK] valid_block_count matching with CP             [Ok..] [0x68aad]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0xdda7]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0xdda7]
[FSCK] valid_inode_count matched with CP              [Ok..] [0xdd04]
[FSCK] free segment_count matched with CP             [Ok..] [0x1832]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.000000 secs


After next reboot, I got further weird errors (corrupted files,
invalid ELF headers on one .so file, etc.): 

https://megous.com/dl/tmp/d409787d4dcb366a.png

Rebooting back to 6.1 fixes the errors and zle.so that had invalid
ELF header is again readable, and zsh works fine:

root@l1[zsh/5.9/zsh] ldd zle.so                                                                                                                                                                                                          OK #
	linux-vdso.so.1 (0xbeef9000)
	libncursesw.so.6 => /usr/lib/libncursesw.so.6 (0xb6e60000)
	libc.so.6 => /usr/lib/libc.so.6 (0xb6cc0000)
	/usr/lib/ld-linux-armhf.so.3 (0xb6f27000)
	libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0xb6c90000)

Other filesystems (I have linux kernel on VFAT /boot partition seem
to work fine). I can update the kernel on VFAT partition and just reboot,
and it correctly reflects the changes and doesn't lock up.

The particular f2fs_bug_on itself seems to be a new thing in
6.2 https://megous.com/dl/tmp/d7b48ff75a19f285.png
This is a 32bit system.

Any ideas or suggestions?

kind regards,
	o.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
