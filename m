Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B236B47B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 04:21:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnZZG-0003xV-Js; Wed, 17 Jul 2019 02:21:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hnZZF-0003vH-Ci
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 02:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/gPw90NZ6vGHovHS86JOfTcTLOVOI97nybn9lCRb3NQ=; b=a5cDUW8sQPIHLhtnA2xM//pNBv
 3NL7vV8UywvW/RQLkWyen7feEqh2rEft0Eb7g+S/OYATxx34Cn6pxfK44Fd2bRBImU3Qdb58Cieck
 QERNA3pajKnj7mHZBx0MKLZ3jbRWgsbJ/4AQFTGPqOfPnAvSPWUPhlqnmwUp21Eqc1So=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/gPw90NZ6vGHovHS86JOfTcTLOVOI97nybn9lCRb3NQ=; b=k
 xxp67iuFOBrcbvhgfhQxx6qsuiDguwEbNewH78FoLjRONwlMdTGg4MlU0J903a8sIcLYSgJmT5TCS
 f23cIaRA5LZ+rSFvesXH271d8HTvsdtgn/G3teeG2xiKlTmbzDsxXe3PLyLyP9Wn3txIJideCB/ol
 v908Y0XXzObPEBzg=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnZZD-003qRo-RX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 02:21:17 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 45C2E286E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jul 2019 02:21:10 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 3A3FC28712; Wed, 17 Jul 2019 02:21:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Jul 2019 02:21:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204193-202145@https.bugzilla.kernel.org/>
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
X-Headers-End: 1hnZZD-003qRo-RX
Subject: [f2fs-dev] [Bug 204193] New: BUG: KASAN: null-ptr-deref in
 f2fs_write_end_io+0x215/0x650
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

https://bugzilla.kernel.org/show_bug.cgi?id=204193

            Bug ID: 204193
           Summary: BUG: KASAN: null-ptr-deref in
                    f2fs_write_end_io+0x215/0x650
           Product: File System
           Version: 2.5
    Kernel Version: 5.1.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: midwinter1993@gmail.com
        Regression: No

A null pointer dereference bug is triggered in f2fs under kernel-5.1.3.


--- Core dump ---
[   81.996211] BUG: KASAN: null-ptr-deref in f2fs_write_end_io+0x215/0x650
[   81.997150] Read of size 8 at addr 0000000000000030 by task swapper/1/0
[   81.998084] 
[   81.998312] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.1.3 #10
[   81.999142] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   82.000470] Call Trace:
[   82.000829]  <IRQ>
[   82.001133]  dump_stack+0x8a/0xce
[   82.001616]  ? f2fs_write_end_io+0x215/0x650
[   82.002234]  ? f2fs_write_end_io+0x215/0x650
[   82.002848]  kasan_report.cold+0x5/0x32
[   82.003403]  ? f2fs_write_end_io+0x215/0x650
[   82.004017]  f2fs_write_end_io+0x215/0x650
[   82.004606]  ? __read_end_io+0x360/0x360
[   82.005176]  bio_endio+0x26e/0x320
[   82.005671]  blk_update_request+0x209/0x5d0
[   82.006286]  blk_mq_end_request+0x2e/0x230
[   82.006881]  lo_complete_rq+0x12c/0x190
[   82.007437]  blk_done_softirq+0x14a/0x1a0
[   82.008015]  ? blk_try_merge+0x120/0x120
[   82.008584]  ? pvclock_clocksource_read+0xd9/0x1a0
[   82.009273]  __do_softirq+0x119/0x3e5
[   82.009801]  ? blk_done_softirq+0x1a0/0x1a0
[   82.010409]  ? flush_smp_call_function_queue+0x10d/0x220
[   82.011164]  irq_exit+0x94/0xe0
[   82.011621]  call_function_single_interrupt+0xf/0x20
[   82.012327]  </IRQ>
[   82.012639] RIP: 0010:default_idle+0x64/0x1f0
[   82.013263] Code: c7 c7 a0 c8 99 85 e8 9b 9a 82 fe 48 c7 c7 a0 c8 99 85 e8
bf b6 82 fe 8b 05 e9 1e c5 01 85 c0 7e 07 0f 00 2d 7e 45 4d 00 fb f4 <65> 8b 2d
65 d7 2c 7c be 04 00 00 00 48 c7 c7 88 53 07 85 e8 64 9a
[   82.015868] RSP: 0018:ffff88811ab9fdf0 EFLAGS: 00000246 ORIG_RAX:
ffffffffffffff04
[   82.016933] RAX: 0000000000000000 RBX: ffff88811ab88cc0 RCX:
ffffffff83d4a9b1
[   82.017932] RDX: 0000000000000003 RSI: dffffc0000000000 RDI:
ffffffff8599c8a0
[   82.018940] RBP: 0000000000000001 R08: ffff88811ab88cc0 R09:
fffffbfff0b33915
[   82.019936] R10: fffffbfff0b33914 R11: 0000000000000003 R12:
ffff88811ab88cc0
[   82.020936] R13: 0000000000000000 R14: 0000000000000000 R15:
ffff88811ab88cc0
[   82.021941]  ? default_idle+0x51/0x1f0
[   82.022489]  do_idle+0x25a/0x2b0
[   82.022958]  ? arch_cpu_idle_exit+0x30/0x30
[   82.023557]  ? schedule_idle+0x34/0x50
[   82.024095]  cpu_startup_entry+0x14/0x20
[   82.024657]  start_secondary+0x206/0x250
[   82.025219]  ? set_cpu_sibling_map+0x970/0x970
[   82.025855]  secondary_startup_64+0xa4/0xb0
[   82.026455]
==================================================================
[   82.027466] Disabling lock debugging due to kernel taint
[   82.028266] BUG: unable to handle kernel NULL pointer dereference at
0000000000000030
[   82.029367] #PF error: [normal kernel read fault]
[   82.030038] PGD 0 P4D 0 
[   82.030412] Oops: 0000 [#1] SMP KASAN PTI
[   82.030985] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G    B             5.1.3
#10
[   82.032008] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   82.033335] RIP: 0010:f2fs_write_end_io+0x21e/0x650
[   82.034035] Code: 00 e8 a6 83 74 ff 48 8d 7d 78 e8 5d bf 8a ff 48 8b 45 78
48 8d 78 30 48 89 44 24 08 e8 4b bf 8a ff 48 8b 44 24 08 48 8b 0c 24 <48> 39 48
30 0f 84 35 03 00 00 e8 73 83 74 ff 4e 8d a4 a5 28 04 00
[   82.036593] RSP: 0018:ffff88811b507d70 EFLAGS: 00010286
[   82.037337] RAX: 0000000000000000 RBX: ffffea0004276c00 RCX:
ffff8881098bc160
[   82.038349] RDX: 1ffffffff0b41557 RSI: 0000000000000246 RDI:
ffffffff85a0aab8
[   82.039345] RBP: ffff88810a4a9100 R08: 000000000000002c R09:
ffffed10236a3c9b
[   82.040349] R10: ffffed10236a3c9a R11: ffff88811b51e4d7 R12:
0000000000000007
[   82.041350] R13: ffff888116b1ac00 R14: 0000000000000000 R15:
0000000000000001
[   82.042357] FS:  0000000000000000(0000) GS:ffff88811b500000(0000)
knlGS:0000000000000000
[   82.043488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   82.044305] CR2: 0000000000000030 CR3: 000000010c12c000 CR4:
00000000000006e0
[   82.045307] Call Trace:
[   82.045665]  <IRQ>
[   82.045957]  ? __read_end_io+0x360/0x360
[   82.046523]  bio_endio+0x26e/0x320
[   82.047002]  blk_update_request+0x209/0x5d0
[   82.047607]  blk_mq_end_request+0x2e/0x230
[   82.048176]  lo_complete_rq+0x12c/0x190
[   82.048713]  blk_done_softirq+0x14a/0x1a0
[   82.049324]  ? blk_try_merge+0x120/0x120
[   82.049889]  ? pvclock_clocksource_read+0xd9/0x1a0
[   82.050573]  __do_softirq+0x119/0x3e5
[   82.051096]  ? blk_done_softirq+0x1a0/0x1a0
[   82.051691]  ? flush_smp_call_function_queue+0x10d/0x220
[   82.052439]  irq_exit+0x94/0xe0
[   82.052892]  call_function_single_interrupt+0xf/0x20
[   82.053586]  </IRQ>
[   82.053893] RIP: 0010:default_idle+0x64/0x1f0
[   82.054523] Code: c7 c7 a0 c8 99 85 e8 9b 9a 82 fe 48 c7 c7 a0 c8 99 85 e8
bf b6 82 fe 8b 05 e9 1e c5 01 85 c0 7e 07 0f 00 2d 7e 45 4d 00 fb f4 <65> 8b 2d
65 d7 2c 7c be 04 00 00 00 48 c7 c7 88 53 07 85 e8 64 9a
[   82.057132] RSP: 0018:ffff88811ab9fdf0 EFLAGS: 00000246 ORIG_RAX:
ffffffffffffff04
[   82.058203] RAX: 0000000000000000 RBX: ffff88811ab88cc0 RCX:
ffffffff83d4a9b1
[   82.059209] RDX: 0000000000000003 RSI: dffffc0000000000 RDI:
ffffffff8599c8a0
[   82.060234] RBP: 0000000000000001 R08: ffff88811ab88cc0 R09:
fffffbfff0b33915
[   82.061239] R10: fffffbfff0b33914 R11: 0000000000000003 R12:
ffff88811ab88cc0
[   82.062252] R13: 0000000000000000 R14: 0000000000000000 R15:
ffff88811ab88cc0
[   82.063263]  ? default_idle+0x51/0x1f0
[   82.063808]  do_idle+0x25a/0x2b0
[   82.064280]  ? arch_cpu_idle_exit+0x30/0x30
[   82.064883]  ? schedule_idle+0x34/0x50
[   82.065424]  cpu_startup_entry+0x14/0x20
[   82.065990]  start_secondary+0x206/0x250
[   82.066562]  ? set_cpu_sibling_map+0x970/0x970
[   82.067202]  secondary_startup_64+0xa4/0xb0
[   82.067804] Modules linked in:
[   82.068252] Dumping ftrace buffer:
[   82.068752]    (ftrace buffer empty)
[   82.069270] CR2: 0000000000000030
[   82.069754] ---[ end trace 6f7cea09b723ae50 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
