Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFF65253
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 09:18:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlTLX-0007wm-36; Thu, 11 Jul 2019 07:18:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hlTLL-0007wJ-KP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 07:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+28dHjQjQAOZVLFUBQ5IEjruGFyct3ydrAAfE9H7Qk=; b=Z/oIX9qCdGKusV+T4Lrq4SblrM
 VIHdOLm4Ggs1YRF7ElP069XaZBpua1IC9e8uE040zfSJkMvShZb/rovAp6cv0bT1vlo1PWzss7Bju
 De2XTu8aJB5QTyezbB/YPMejEXNOgKH0wJKQEVlt3TbEn4XabjRC8qwtJoEB26xhzbY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8+28dHjQjQAOZVLFUBQ5IEjruGFyct3ydrAAfE9H7Qk=; b=b
 MN43mCPG3/nVofC3m6Q4lhjsSB1j8K2UkYAM8QFQvQ7UY8G+QbLvHNzLN2zTFXC6mAMKevtkOCFY2
 X6EWBmGrjVWHuE3lkAWpUNz3LELUXmvfLDRlaNlFrvH47/OEiYw5vYw5g+zizixhCsUkkQs8ECsjl
 65XzT1KFsH5TOM+U=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlTLK-00Er2w-06
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 07:18:15 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 605202882C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 07:18:07 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 513A428A0B; Thu, 11 Jul 2019 07:18:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 11 Jul 2019 07:18:06 +0000
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
Message-ID: <bug-204135-202145@https.bugzilla.kernel.org/>
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
X-Headers-End: 1hlTLK-00Er2w-06
Subject: [f2fs-dev] [Bug 204135] New: F2FS: BUG: KASAN: null-ptr-deref in
 mempool_alloc+0xd8/0x2e0
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

https://bugzilla.kernel.org/show_bug.cgi?id=204135

            Bug ID: 204135
           Summary: F2FS: BUG: KASAN: null-ptr-deref in
                    mempool_alloc+0xd8/0x2e0
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

The following script triggers a KASAN null pointer dereference in f2fs file
system.

I tested under kernel 5.1.3 using Qemu; this bug may not happen every time but
according to my tries, it almost happens deterministically.

```
#!/bin/bash

MOUNT_DIR=/root/mnt
DISK=xx.img

dd if=/dev/zero of=$DISK bs=1M count=192
mkfs.f2fs -a 0 -o 19 -t 1 -z 3 -f -q $DISK


mkdir -pv $MOUNT_DIR

mount $DISK $MOUNT_DIR -o "noextent_cache"

mkdir $MOUNT_DIR/Umfoo_28

mount $DISK $MOUNT_DIR -o "remount,noextent_cache,mode=lfs,io_bits=7" # BUG
OCCURS

umount $MOUNT_DIR
```


--- Core dump ---
[   35.256703]
==================================================================
[   35.257772] BUG: KASAN: null-ptr-deref in mempool_alloc+0xd8/0x2e0
[   35.258646] Read of size 8 at addr 0000000000000020 by task umount/2161
[   35.259591] 
[   35.259833] CPU: 0 PID: 2161 Comm: umount Not tainted 5.1.3 #8
[   35.260646] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   35.261953] Call Trace:
[   35.262315]  dump_stack+0x8a/0xce
[   35.262787]  ? mempool_alloc+0xd8/0x2e0
[   35.263330]  ? mempool_alloc+0xd8/0x2e0
[   35.263819]  kasan_report.cold+0x5/0x32
[   35.264199]  ? mempool_alloc+0xd8/0x2e0
[   35.264678]  mempool_alloc+0xd8/0x2e0
[   35.265197]  ? mempool_resize+0x410/0x410
[   35.265760]  ? blk_init_request_from_bio+0xd0/0xd0
[   35.266439]  ? __write_data_page+0x4c9/0x1140
[   35.267063]  __submit_merged_bio+0x519/0x8c0
[   35.267671]  __submit_merged_write_cond+0x41a/0x520
[   35.268373]  f2fs_write_cache_pages+0xb08/0xb40
[   35.269021]  ? __write_data_page+0x1140/0x1140
[   35.269658]  ? update_group_capacity+0x340/0x340
[   35.270320]  f2fs_write_data_pages+0x796/0x8b0
[   35.270962]  ? f2fs_write_cache_pages+0xb40/0xb40
[   35.271631]  ? deref_stack_reg+0x84/0xd0
[   35.272195]  ? __read_once_size_nocheck.constprop.0+0x10/0x10
[   35.273005]  ? __orc_find+0x63/0xc0
[   35.273499]  ? unwind_next_frame+0x8a8/0x9b0
[   35.274104]  ? f2fs_write_cache_pages+0xb40/0xb40
[   35.274767]  do_writepages+0xbb/0x1e0
[   35.275287]  ? page_writeback_cpu_online+0x10/0x10
[   35.275970]  ? __orc_find+0x63/0xc0
[   35.276464]  ? stack_access_ok+0x35/0x90
[   35.277039]  ? unwind_next_frame+0x8a8/0x9b0
[   35.277644]  ? __update_load_avg_cfs_rq+0x2f/0x4a0
[   35.278340]  ? rb_next+0x33/0x80
[   35.278800]  __filemap_fdatawrite_range+0x142/0x1d0
[   35.279488]  ? delete_from_page_cache_batch+0x650/0x650
[   35.280239]  ? _raw_spin_lock_irq+0xd0/0xd0
[   35.280833]  f2fs_sync_dirty_inodes+0x167/0x490
[   35.281475]  f2fs_write_checkpoint+0x462/0x2f70
[   35.282115]  ? __schedule+0x481/0xc80
[   35.282633]  ? update_cfs_group+0x1d/0x1a0
[   35.283213]  ? __enqueue_entity+0xae/0xe0
[   35.283786]  ? pci_mmcfg_check_reserved+0x130/0x130
[   35.284478]  ? _raw_spin_lock_irq+0x76/0xd0
[   35.285073]  ? f2fs_wait_on_all_pages_writeback+0x1a0/0x1a0
[   35.285859]  ? try_to_wake_up+0xa4/0x750
[   35.286416]  ? bit_wait_io_timeout+0xc0/0xc0
[   35.287021]  ? __migrate_task.isra.0+0xa0/0xa0
[   35.287650]  ? pin_kill+0x121/0x260
[   35.288152]  ? pin_insert+0x30/0x30
[   35.288648]  ? kthread_stop+0x11b/0x260
[   35.289191]  kill_f2fs_super+0x1e7/0x210
[   35.289746]  ? __f2fs_commit_super+0xc0/0xc0
[   35.290347]  ? xas_start+0xbf/0x1c0
[   35.290846]  ? unregister_shrinker+0x9e/0xc0
[   35.291446]  ? kfree+0x9b/0x1c0
[   35.291899]  deactivate_locked_super+0x69/0xc0
[   35.292525]  deactivate_super+0x14e/0x160
[   35.293094]  ? iterate_supers_type+0x1c0/0x1c0
[   35.293723]  cleanup_mnt+0x71/0xc0
[   35.294207]  task_work_run+0x100/0x120
[   35.294663]  exit_to_usermode_loop+0x175/0x180
[   35.295149]  do_syscall_64+0x1f1/0x230
[   35.295560]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   35.296114] RIP: 0033:0x7fe8e01f6d77
[   35.296509] Code: 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f1 00 2b 00 f7 d8 64 89 01 48
[   35.298601] RSP: 002b:00007ffff47cec68 EFLAGS: 00000246 ORIG_RAX:
00000000000000a6
[   35.299401] RAX: 0000000000000000 RBX: 000055f947ec7080 RCX:
00007fe8e01f6d77
[   35.300151] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
000055f947ec7260
[   35.300950] RBP: 000055f947ec7260 R08: 000055f947ec7280 R09:
0000000000000014
[   35.301707] R10: 00000000000006b4 R11: 0000000000000246 R12:
00007fe8e06f8e64
[   35.302455] R13: 0000000000000000 R14: 0000000000000000 R15:
00007ffff47ceef0
[   35.303258]
==================================================================
[   35.304025] Disabling lock debugging due to kernel taint
[   35.305229] BUG: unable to handle kernel NULL pointer dereference at
0000000000000020
[   35.306356] #PF error: [normal kernel read fault]
[   35.307004] PGD 0 P4D 0 
[   35.307364] Oops: 0000 [#1] SMP KASAN PTI
[   35.307914] CPU: 1 PID: 2161 Comm: umount Tainted: G    B             5.1.3
#8
[   35.308879] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   35.310142] RIP: 0010:mempool_alloc+0xd8/0x2e0
[   35.310749] Code: 81 cb 00 20 09 00 4d 8d 74 24 18 89 44 24 08 65 48 8b 04
25 40 dd 01 00 48 89 44 24 10 e8 20 d9 f5 ff 4c 89 ff e8 d8 14 0c 00 <49> 8b 44
24 20 4c 89 f7 48 89 04 24 e8 c7 14 0c 00 49 8b 74 24 18
[   35.313330] RSP: 0018:ffff8881129af3a0 EFLAGS: 00010286
[   35.314034] RAX: 0000000000000000 RBX: 000000000009a800 RCX:
ffffffff9694c53d
[   35.314959] RDX: 1ffffffff30c1557 RSI: 0000000000000246 RDI:
ffffffff9860aab8
[   35.315914] RBP: 1ffff11022535e79 R08: 000000000000002c R09:
ffffed1022e03c9b
[   35.316865] R10: ffffed1022e03c9a R11: ffff88811701e4d7 R12:
0000000000000000
[   35.317811] R13: 0000000000000400 R14: 0000000000000018 R15:
0000000000000020
[   35.318759] FS:  00007fe8e0914e40(0000) GS:ffff888117100000(0000)
knlGS:0000000000000000
[   35.319845] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.320620] CR2: 00007f2f50033048 CR3: 00000001137d6000 CR4:
00000000000006e0
[   35.321568] Call Trace:
[   35.321914]  ? mempool_resize+0x410/0x410
[   35.322460]  ? blk_init_request_from_bio+0xd0/0xd0
[   35.323108]  ? __write_data_page+0x4c9/0x1140
[   35.323701]  __submit_merged_bio+0x519/0x8c0
[   35.324287]  __submit_merged_write_cond+0x41a/0x520
[   35.325004]  f2fs_write_cache_pages+0xb08/0xb40
[   35.325621]  ? __write_data_page+0x1140/0x1140
[   35.326226]  ? update_group_capacity+0x340/0x340
[   35.326853]  f2fs_write_data_pages+0x796/0x8b0
[   35.327459]  ? f2fs_write_cache_pages+0xb40/0xb40
[   35.328101]  ? deref_stack_reg+0x84/0xd0
[   35.328635]  ? __read_once_size_nocheck.constprop.0+0x10/0x10
[   35.329404]  ? __orc_find+0x63/0xc0
[   35.329879]  ? unwind_next_frame+0x8a8/0x9b0
[   35.330458]  ? f2fs_write_cache_pages+0xb40/0xb40
[   35.331092]  do_writepages+0xbb/0x1e0
[   35.331592]  ? page_writeback_cpu_online+0x10/0x10
[   35.332249]  ? __orc_find+0x63/0xc0
[   35.332730]  ? stack_access_ok+0x35/0x90
[   35.333270]  ? unwind_next_frame+0x8a8/0x9b0
[   35.333855]  ? __update_load_avg_cfs_rq+0x2f/0x4a0
[   35.334508]  ? rb_next+0x33/0x80
[   35.334958]  __filemap_fdatawrite_range+0x142/0x1d0
[   35.335622]  ? delete_from_page_cache_batch+0x650/0x650
[   35.336330]  ? _raw_spin_lock_irq+0xd0/0xd0
[   35.336898]  f2fs_sync_dirty_inodes+0x167/0x490
[   35.337509]  f2fs_write_checkpoint+0x462/0x2f70
[   35.338123]  ? __schedule+0x481/0xc80
[   35.338622]  ? update_cfs_group+0x1d/0x1a0
[   35.339176]  ? __enqueue_entity+0xae/0xe0
[   35.339721]  ? pci_mmcfg_check_reserved+0x130/0x130
[   35.340390]  ? _raw_spin_lock_irq+0x76/0xd0
[   35.340967]  ? f2fs_wait_on_all_pages_writeback+0x1a0/0x1a0
[   35.341726]  ? try_to_wake_up+0xa4/0x750
[   35.342267]  ? bit_wait_io_timeout+0xc0/0xc0
[   35.342854]  ? __migrate_task.isra.0+0xa0/0xa0
[   35.343465]  ? pin_kill+0x121/0x260
[   35.343953]  ? pin_insert+0x30/0x30
[   35.344438]  ? kthread_stop+0x11b/0x260
[   35.344967]  kill_f2fs_super+0x1e7/0x210
[   35.345509]  ? __f2fs_commit_super+0xc0/0xc0
[   35.346095]  ? xas_start+0xbf/0x1c0
[   35.346579]  ? unregister_shrinker+0x9e/0xc0
[   35.347165]  ? kfree+0x9b/0x1c0
[   35.347601]  deactivate_locked_super+0x69/0xc0
[   35.348189]  deactivate_super+0x14e/0x160
[   35.348740]  ? iterate_supers_type+0x1c0/0x1c0
[   35.349351]  cleanup_mnt+0x71/0xc0
[   35.349824]  task_work_run+0x100/0x120
[   35.350342]  exit_to_usermode_loop+0x175/0x180
[   35.350954]  do_syscall_64+0x1f1/0x230
[   35.351472]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   35.352165] RIP: 0033:0x7fe8e01f6d77
[   35.352659] Code: 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f1 00 2b 00 f7 d8 64 89 01 48
[   35.355180] RSP: 002b:00007ffff47cec68 EFLAGS: 00000246 ORIG_RAX:
00000000000000a6
[   35.356208] RAX: 0000000000000000 RBX: 000055f947ec7080 RCX:
00007fe8e01f6d77
[   35.357171] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
000055f947ec7260
[   35.358134] RBP: 000055f947ec7260 R08: 000055f947ec7280 R09:
0000000000000014
[   35.359097] R10: 00000000000006b4 R11: 0000000000000246 R12:
00007fe8e06f8e64
[   35.360062] R13: 0000000000000000 R14: 0000000000000000 R15:
00007ffff47ceef0
[   35.361021] Modules linked in:
[   35.361446] Dumping ftrace buffer:
[   35.361914]    (ftrace buffer empty)
[   35.362406] CR2: 0000000000000020
[   35.363006] ---[ end trace d88b774adc80a9fc ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
