Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 694325B711
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 10:44:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhrvM-0007AZ-Gh; Mon, 01 Jul 2019 08:44:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hhrvL-0007AP-Q0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 08:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3h+AfmgVYYRs8k0bprTRihYCLwxKlanSbA4RiTb29s=; b=KZiYEMvUJnFclkOSH1E2URwJEN
 apFXWSR/GqhCpMQ225CMruQJQd1xNBAa+bHpqM984lJCl9pq42rTghUEZUV0P2YQeHbmaQOhis7PR
 ZTikPjkmzZiIFoYWBBjlq+yzVyaRuvx4jPjLsdWC8/nOdi96YIulfxTjGsGZ/yqZdrGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T3h+AfmgVYYRs8k0bprTRihYCLwxKlanSbA4RiTb29s=; b=V
 uCbP3rxzhVz1zt30XJd6QHOSqv3JSJ0kSiB9LBTJcVNBVpsJvfBo/bnqK9xNMTcKk3yf9UKy/o21q
 ZyVCN2eDK9kTPc1h2ki98FPns7HKdKQi+dzMZL9oHvUogwIciYMaiHez/ImMQvcj/S5VNHWYtysBi
 AQgBseX3kCkPzRvg=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhrvS-002x5p-IY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 08:44:40 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6D85028514
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Jul 2019 08:44:31 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 6223528516; Mon,  1 Jul 2019 08:44:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 01 Jul 2019 08:44:30 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204043-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hhrvS-002x5p-IY
Subject: [f2fs-dev] [Bug 204043] New: F2fs kernel BUG at fs/f2fs/data.c:317!
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

            Bug ID: 204043
           Summary: F2fs kernel BUG at fs/f2fs/data.c:317!
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

Created attachment 283507
  --> https://bugzilla.kernel.org/attachment.cgi?id=283507&action=edit
syscall in C code

I mounted an f2fs image and did some operations, then, a bug occurred.
This bug does not occur every time, but according to my attempts, it occurs at
least 1/5 (hitting once in five runnings).

The attached file is the syscall I did in C code.

The triggering script follows: (it should be run by root)
```
#!/bin/bash

DISK_NAME=xx.img

dd if=/dev/zero of=xx.img bs=1M count=196
mkfs.f2fs -a 0 -o 0 -t 0 -z 9 -f -q $DISK_NAME

g++ -static 2.c

losetup "/dev/loop0" $DISK_NAME

mkdir /root/mnt

./a.out

umount /root/mnt
losetup -D
```



--- Core dump ---
[   54.834378] kernel BUG at fs/f2fs/data.c:317!
[   54.835035] invalid opcode: 0000 [#1] SMP KASAN PTI
[   54.835727] CPU: 1 PID: 1094 Comm: kworker/u4:4 Not tainted 5.1.3 #7
[   54.836608] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   54.837998] Workqueue: writeback wb_workfn (flush-7:0)
[   54.838732] RIP: 0010:__submit_merged_bio+0x8b0/0x8c0
[   54.839453] Code: 8b 54 24 1c 4c 89 f1 4c 89 e6 e8 2b 75 33 01 48 89 ef e8
e3 c4 8a ff 4c 8b 6d 00 4d 85 ed 75 ca e9 cc fd ff ff e8 10 89 74 ff <0f> 0b 0f
1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 41 57 41 56 41 55
[   54.842001] RSP: 0018:ffff888069af7158 EFLAGS: 00010293
[   54.842732] RAX: ffff888069ad9980 RBX: ffff88806a2624c0 RCX:
ffffffffaf2c9ca0
[   54.843738] RDX: 0000000000000000 RSI: 0000000000000fff RDI:
0000000000000005
[   54.844718] RBP: 0000000000000000 R08: ffff888069ad9980 R09:
ffff8880594a0000
[   54.845709] R10: ffffed100b2941ff R11: ffff8880594a0fff R12:
ffff88805a0b2200
[   54.846702] R13: 0000000000000001 R14: ffff88805a171600 R15:
ffff88806a2624c8
[   54.847700] FS:  0000000000000000(0000) GS:ffff88806d300000(0000)
knlGS:0000000000000000
[   54.848817] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   54.849602] CR2: 00007fddbb634d30 CR3: 00000000698d2000 CR4:
00000000000006e0
[   54.850570] Call Trace:
[   54.850946]  f2fs_submit_page_write+0x3cd/0xdd0
[   54.851577]  do_write_page+0x15d/0x360
[   54.852137]  f2fs_outplace_write_data+0xd7/0x210
[   54.852776]  ? f2fs_do_write_node_page+0x190/0x190
[   54.853449]  ? __save_stack_trace+0x7a/0xf0
[   54.854033]  f2fs_do_write_data_page+0x43b/0xf30
[   54.854672]  ? f2fs_should_update_outplace+0x1c0/0x1c0
[   54.855386]  ? kmem_cache_alloc+0xab/0x1b0
[   54.855956]  ? add_free_nid+0x5d/0x390
[   54.856479]  ? f2fs_write_node_pages+0xf5/0x5c0
[   54.857109]  ? do_writepages+0xbb/0x1e0
[   54.857650]  __write_data_page+0xcf6/0x1140
[   54.858234]  ? page_mapped+0xf8/0x1f0
[   54.858748]  ? f2fs_do_write_data_page+0xf30/0xf30
[   54.859419]  ? page_referenced+0x3d0/0x3d0
[   54.859985]  f2fs_write_cache_pages+0x3ba/0xb40
[   54.860617]  ? __write_data_page+0x1140/0x1140
[   54.861238]  ? xas_start+0xbf/0x1c0
[   54.861728]  ? __mutex_lock_slowpath+0x10/0x10
[   54.862349]  f2fs_write_data_pages+0x3dd/0x8b0
[   54.862975]  ? f2fs_write_cache_pages+0xb40/0xb40
[   54.863627]  ? f2fs_set_node_page_dirty+0x175/0x3a0
[   54.864299]  ? f2fs_inode_synced+0x1c7/0x200
[   54.864891]  ? memset+0x20/0x40
[   54.865336]  ? f2fs_write_cache_pages+0xb40/0xb40
[   54.865987]  do_writepages+0xbb/0x1e0
[   54.866504]  ? page_writeback_cpu_online+0x10/0x10
[   54.867175]  ? _raw_spin_lock+0x75/0xd0
[   54.867712]  ? _raw_spin_lock_irq+0xd0/0xd0
[   54.868311]  ? __wake_up_bit+0x84/0xe0
[   54.868867]  __writeback_single_inode+0xb6/0x800
[   54.869511]  ? inode_add_lru+0xd9/0x110
[   54.870046]  writeback_sb_inodes+0x441/0x910
[   54.870640]  ? sync_inode_metadata+0x100/0x100
[   54.871251]  ? queue_io+0x16b/0x220
[   54.871737]  wb_writeback+0x261/0x650
[   54.872237]  ? __writeback_inodes_wb+0x170/0x170
[   54.872874]  ? cwt_wakefn+0x60/0x60
[   54.873360]  ? _raw_spin_lock_bh+0x80/0xd0
[   54.873924]  ? _raw_read_unlock_irqrestore+0x20/0x20
[   54.874604]  ? __switch_to_asm+0x34/0x70
[   54.875151]  ? wb_workfn+0xc4/0x7a0
[   54.875644]  wb_workfn+0x1f9/0x7a0
[   54.876118]  ? inode_wait_for_writeback+0x40/0x40
[   54.876765]  ? __schedule+0x481/0xc80
[   54.877271]  ? _raw_spin_lock_irq+0x76/0xd0
[   54.877847]  ? read_word_at_a_time+0xe/0x20
[   54.878427]  ? strscpy+0xb2/0x180
[   54.878896]  process_one_work+0x503/0x970
[   54.879449]  worker_thread+0x7d/0x820
[   54.879952]  kthread+0x1ad/0x210
[   54.880400]  ? process_one_work+0x970/0x970
[   54.880960]  ? kthread_park+0x130/0x130
[   54.881395]  ret_from_fork+0x35/0x40
[   54.881741] Modules linked in:
[   54.882041] Dumping ftrace buffer:
[   54.882380]    (ftrace buffer empty)
[   54.882768] ---[ end trace 06d1c400edad9651 ]---
[   54.883254] RIP: 0010:__submit_merged_bio+0x8b0/0x8c0
[   54.883749] Code: 8b 54 24 1c 4c 89 f1 4c 89 e6 e8 2b 75 33 01 48 89 ef e8
e3 c4 8a ff 4c 8b 6d 00 4d 85 ed 75 ca e9 cc fd ff ff e8 10 89 74 ff <0f> 0b 0f
1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 41 57 41 56 41 55
[   54.885518] RSP: 0018:ffff888069af7158 EFLAGS: 00010293
[   54.886037] RAX: ffff888069ad9980 RBX: ffff88806a2624c0 RCX:
ffffffffaf2c9ca0
[   54.886717] RDX: 0000000000000000 RSI: 0000000000000fff RDI:
0000000000000005
[   54.887470] RBP: 0000000000000000 R08: ffff888069ad9980 R09:
ffff8880594a0000
[   54.888228] R10: ffffed100b2941ff R11: ffff8880594a0fff R12:
ffff88805a0b2200
[   54.888983] R13: 0000000000000001 R14: ffff88805a171600 R15:
ffff88806a2624c8
[   54.889723] FS:  0000000000000000(0000) GS:ffff88806d300000(0000)
knlGS:0000000000000000
[   54.890572] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   54.891199] CR2: 00007fddbb634d30 CR3: 00000000698d2000 CR4:
00000000000006e0
[   54.891972] Kernel panic - not syncing: Fatal exception
[   54.892717] Dumping ftrace buffer:
[   54.893200]    (ftrace buffer empty)
[   54.893646] Kernel Offset: 0x2d800000 from 0xffffffff81000000 (relocation
range: 0xffffffff80000000-0xffffffffbfffffff)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
