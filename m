Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839C6F7C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 05:11:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpOj5-0004SD-MH; Mon, 22 Jul 2019 03:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hpOj4-0004Rz-C3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 03:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3+ljjVLynx11xnku97j40DQaYZwaRNlvnjXCz9iDiLs=; b=TMV8Ib2rZGiQSxJqmOLofQOSo6
 rQfvn57PiFOufaHruFSmMU3IGkOsBQNOjiJhU0KsTIAi+gsK7KHnBAz8AarD9k4wUWBM2IoAkFCaJ
 szsnEC44hoWnIOrmgYCFwpDF+7dK+RyGbc3R6X45cQV7RVTGzL/aeRZlgdxbWNVU1+oI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3+ljjVLynx11xnku97j40DQaYZwaRNlvnjXCz9iDiLs=; b=LDPT4rLasQvg1R5idMsp36zStR
 cg1I1+/F//YRpGLeNWhp6IJ8DGzVlGJhs3aNRawHF0/MHwj02CI/NzJyHzi2M2yuDQLv9lwH5x8yS
 oaQqhgw0N5u8OmNbbouuNBJrAJ64tJUwI31g0xUUO67DTU/F1GSUsZJLjacdIqbnpLd8=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpOj0-009pdr-AS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 03:10:58 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 9B1B21FF29
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jul 2019 03:10:48 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 8A6CE20572; Mon, 22 Jul 2019 03:10:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 22 Jul 2019 03:10:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204043-202145-zbLnRjVBdS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204043-202145@https.bugzilla.kernel.org/>
References: <bug-204043-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpOj0-009pdr-AS
Subject: [f2fs-dev] [Bug 204043] F2fs kernel BUG at fs/f2fs/data.c:317!
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

https://bugzilla.kernel.org/show_bug.cgi?id=204043

--- Comment #7 from midwinter1993@gmail.com ---
(In reply to Chao Yu from comment #6)
> You mean it failed when you apply those patches to kernel 5.1.3?
> 
> I made patches based on last dev branch below:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev
> 
> Could you download last code for test? Last code should has issues you
> reported.

Hi! I cloned the repo and patched the latest dev branch.
The aforementioned kernel bug does not manifest again with the provided script.

But my original(complex/long) script triggers another bug; I'm not sure whether
this bug was introduced by the patch.

--- Core dump ---
[   17.678583] ------------[ cut here ]------------
[   17.679405] kernel BUG at fs/f2fs/segment.c:2391!
[   17.680654] invalid opcode: 0000 [#1] SMP KASAN PTI
[   17.681394] CPU: 0 PID: 461 Comm: runner-1 Not tainted 5.2.0+ #5
[   17.682279] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   17.683674] RIP: 0010:new_curseg+0xbb5/0xf10
[   17.684309] Code: 14 11 84 d2 74 09 80 fa 03 0f 8e 19 03 00 00 44 0f af ad
00 04 00 00 44 39 e8 0f 83 7f f7 ff ff e9 45 fa ff ff e8 8b 61 80 ff <0f> 0b e8
84 61 80 ff 44 89 e8 31 d2 f7 74 24 08 89 c3 e9 5a f6 ff
[   17.687001] RSP: 0018:ffff888110c0f360 EFLAGS: 00010293
[   17.687772] RAX: ffff88811514b400 RBX: 0000000000000000 RCX:
ffffffffb93585b5
[   17.688792] RDX: 0000000000000000 RSI: 0000000000000048 RDI:
ffff88810f9fe900
[   17.689771] RBP: ffff888112b2aa80 R08: 0000000000000000 R09:
ffffed1022181e62
[   17.690804] R10: ffffed1022181e61 R11: 0000000000000003 R12:
ffff888111f4ff30
[   17.691852] R13: 0000000000000048 R14: ffff88810f9fe900 R15:
0000000000000048
[   17.692894] FS:  00005555571fe8c0(0000) GS:ffff88811b200000(0000)
knlGS:0000000000000000
[   17.694066] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.694926] CR2: 0000555557302000 CR3: 0000000110406000 CR4:
00000000000006f0
[   17.695981] Call Trace:
[   17.696372]  ? f2fs_need_SSR+0x4fe/0x670
[   17.696973]  allocate_segment_by_default+0x222/0x440
[   17.697717]  f2fs_allocate_data_block+0x649/0x2720
[   17.698409]  ? f2fs_submit_page_write+0xc25/0x19c0
[   17.699035]  do_write_page+0x1c1/0x590
[   17.699628]  f2fs_outplace_write_data+0x157/0x3d0
[   17.700439]  ? f2fs_do_write_node_page+0x280/0x280
[   17.701188]  ? f2fs_is_valid_blkaddr+0x1f8/0xe70
[   17.701807]  f2fs_do_write_data_page+0xa60/0x13f0
[   17.702353]  ? f2fs_should_update_outplace+0x330/0x330
[   17.703017]  ? _raw_spin_lock+0x75/0xd0
[   17.703556]  ? percpu_counter_add_batch+0xc1/0x110
[   17.704215]  ? f2fs_remove_dirty_inode+0x191/0x520
[   17.704873]  move_data_page+0x5bc/0x990
[   17.705405]  ? get_victim_by_default+0x21d0/0x21d0
[   17.705986]  ? down_read_trylock+0x170/0x170
[   17.706402]  ? __radix_tree_lookup+0x1a9/0x220
[   17.706834]  do_garbage_collect+0x14cd/0x4020
[   17.707339]  ? __switch_to_asm+0x40/0x70
[   17.707797]  ? mutex_lock+0x89/0xd0
[   17.708167]  ? mutex_unlock+0x18/0x40
[   17.708555]  ? move_data_block+0x2500/0x2500
[   17.709004]  ? preempt_schedule_common+0x36/0x50
[   17.709488]  ? down_read+0x1f0/0x1f0
[   17.709869]  f2fs_gc+0x69b/0x37e0
[   17.710224]  ? f2fs_start_bidx_of_node+0x40/0x40
[   17.710709]  ? delete_node+0x1ef/0x820
[   17.711114]  ? node_tag_clear+0x8a/0x1b0
[   17.711530]  ? mutex_lock+0x89/0xd0
[   17.711901]  ? __mutex_lock_slowpath+0x10/0x10
[   17.712368]  ? f2fs_balance_fs+0x5ae/0x19c0
[   17.712809]  f2fs_balance_fs+0x5ae/0x19c0
[   17.713232]  ? __d_instantiate+0x320/0x430
[   17.713664]  f2fs_mkdir+0x40a/0x5e0
[   17.714034]  ? security_inode_mkdir+0xca/0x100
[   17.714501]  vfs_mkdir+0x351/0x560
[   17.714864]  do_mkdirat+0x11b/0x210
[   17.715242]  ? __ia32_sys_mknod+0xb0/0xb0
[   17.715687]  ? schedule+0x9c/0x230
[   17.716051]  do_syscall_64+0x9a/0x330
[   17.716440]  ? prepare_exit_to_usermode+0x142/0x1d0
[   17.716953]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   17.717485] RIP: 0033:0x50eaf7
[   17.717813] Code: 1f 40 00 b8 89 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 2d
f5 f8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 53 00 00 00 0f 05 <48> 3d 01
f0 ff ff 0f 83 0d f5 f8 ff c3 66 2e 0f 1f 84 00 00 00 00
[   17.719740] RSP: 002b:00007ffff7965da8 EFLAGS: 00000202 ORIG_RAX:
0000000000000053
[   17.720531] RAX: ffffffffffffffda RBX: 0000000000400328 RCX:
000000000050eaf7
[   17.721273] RDX: 0000555557337f90 RSI: 00000000000001fd RDI:
0000555557337f90
[   17.722015] RBP: 00007ffff7965de0 R08: 0000000000000000 R09:
000000000000003e
[   17.722963] R10: 0000000000000035 R11: 0000000000000202 R12:
000000000049e490
[   17.723941] R13: 000000000049e520 R14: 0000000000000000 R15:
0000000000000000
[   17.724914] Modules linked in:
[   17.725343] Dumping ftrace buffer:
[   17.725816]    (ftrace buffer empty)
[   17.726356] ---[ end trace 110112c63ed78316 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
