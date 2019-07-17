Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1D6B47C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 04:26:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnZdo-0001P4-GI; Wed, 17 Jul 2019 02:26:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hnZdm-0001Ox-Vg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 02:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ocR7i8MsV0XR0UDszBU6cixrZs8EyirAGVaitzZQyU=; b=KwHOdTzUIisCAeiIFYeXaL/HbK
 Jb2Qlh05UjU0xcYvNai91lNK3npbw+9/CjZ3Ld/zJSkbVPQ9iwkokiaeofTeHcKqnC0U+qwWJlq21
 iZUsFYXXof2FCyw2bBkBygd5wb/6buxdWfsLSH9ev2FPu1soNtMrqUegNtJLe04zwUoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/ocR7i8MsV0XR0UDszBU6cixrZs8EyirAGVaitzZQyU=; b=M
 7ON+TZV4Ye06royKYVnMhB0AELec0TARxunQFdA2dYjrdcNapAUZHZVk+MR24HzzE6Wwm4YQIO9Be
 xVY+CRNyia8+2Z2tAQrv4nZ54oR8AzXVvTK7I31BGJdPu+bVlpHbxgnnkauITjvpVt/PBJRO7wPPw
 OgqmJsbUqZx77GFU=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnZdl-004D0R-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 02:25:58 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 03ACB285BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jul 2019 02:25:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id EC9B6285D5; Wed, 17 Jul 2019 02:25:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Jul 2019 02:25:51 +0000
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
Message-ID: <bug-204197-202145@https.bugzilla.kernel.org/>
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
X-Headers-End: 1hnZdl-004D0R-JJ
Subject: [f2fs-dev] [Bug 204197] New: F2FS: kernel BUG at
 fs/f2fs/inode.c:722!
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

https://bugzilla.kernel.org/show_bug.cgi?id=204197

            Bug ID: 204197
           Summary: F2FS: kernel BUG at fs/f2fs/inode.c:722!
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

A bug was triggered in f2fs.
I will provide the triggering script soon.



--- Core dump ---
[   47.368206] kernel BUG at fs/f2fs/inode.c:722!
[   47.368833] invalid opcode: 0000 [#1] SMP KASAN PTI
[   47.369378] CPU: 0 PID: 2232 Comm: umount Not tainted 5.1.3 #10
[   47.370041] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   47.371214] RIP: 0010:f2fs_evict_inode+0xa13/0xa60
[   47.371792] Code: e9 04 f9 ff ff 4c 8b 6c 24 38 e8 78 58 78 ff 31 ff 89 de
e8 df 59 78 ff 85 db 0f 84 7e fd ff ff e9 1c ff ff ff e8 5d 58 78 ff <0f> 0b e8
56 58 78 ff 48 c7 c7 48 e0 ca 84 48 8b 5c 24 70 e8 05 94
[   47.374202] RSP: 0018:ffff888116897b50 EFLAGS: 00010293
[   47.374875] RAX: ffff888106af8000 RBX: 0000000000000001 RCX:
ffffffff82c8cd53
[   47.375790] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000007
[   47.376708] RBP: ffff8880b9f5dc80 R08: ffff888106af8000 R09:
ffffed1021198ab1
[   47.377651] R10: ffffed1021198ab0 R11: ffff888108cc5587 R12:
ffff88811a576600
[   47.378545] R13: ffff8880b9f5ded0 R14: ffff8880b9f5df20 R15:
ffff8880b9f5df00
[   47.379461] FS:  00007f151521ae40(0000) GS:ffff88811b400000(0000)
knlGS:0000000000000000
[   47.380517] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.381229] CR2: 00007f1514df0cb1 CR3: 0000000106418000 CR4:
00000000000006f0
[   47.382131] Call Trace:
[   47.382404]  ? _raw_spin_lock_irq+0xd0/0xd0
[   47.382933]  ? f2fs_write_inode+0x5d0/0x5d0
[   47.383450]  evict+0x19c/0x340
[   47.383791]  dispose_list+0x72/0xa0
[   47.384239]  evict_inodes+0x2ce/0x310
[   47.384688]  ? dispose_list+0xa0/0xa0
[   47.385126]  ? filemap_write_and_wait+0x88/0xc0
[   47.385695]  ? __sync_blockdev+0x54/0x90
[   47.386140]  generic_shutdown_super+0x6c/0x1d0
[   47.386716]  kill_block_super+0x54/0x90
[   47.387170]  kill_f2fs_super+0x172/0x210
[   47.387632]  ? __f2fs_commit_super+0xc0/0xc0
[   47.388153]  ? xas_start+0xbf/0x1c0
[   47.388572]  ? unregister_shrinker+0x9e/0xc0
[   47.389009]  ? kfree+0x9b/0x1c0
[   47.389321]  deactivate_locked_super+0x69/0xc0
[   47.389751]  deactivate_super+0x14e/0x160
[   47.390141]  ? iterate_supers_type+0x1c0/0x1c0
[   47.390573]  cleanup_mnt+0x71/0xc0
[   47.390911]  task_work_run+0x100/0x120
[   47.391279]  exit_to_usermode_loop+0x175/0x180
[   47.391709]  do_syscall_64+0x1f1/0x230
[   47.392076]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   47.392668] RIP: 0033:0x7f1514afcd77
[   47.393272] Code: 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f1 00 2b 00 f7 d8 64 89 01 48
[   47.395802] RSP: 002b:00007fffe97ea0e8 EFLAGS: 00000246 ORIG_RAX:
00000000000000a6
[   47.396839] RAX: 0000000000000000 RBX: 0000557449b4c500 RCX:
00007f1514afcd77
[   47.397809] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
0000557449b4c6e0
[   47.398773] RBP: 0000557449b4c6e0 R08: 0000557449b4c700 R09:
0000000000000014
[   47.399735] R10: 00000000000006b4 R11: 0000000000000246 R12:
00007f1514ffee64
[   47.400703] R13: 0000000000000000 R14: 0000000000000000 R15:
00007fffe97ea370
[   47.401665] Modules linked in:
[   47.402092] Dumping ftrace buffer:
[   47.402562]    (ftrace buffer empty)
[   47.403089] ---[ end trace 6f7cea09b723ae50 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
