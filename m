Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A72C63A597
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 11:02:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozayO-0000f8-GU;
	Mon, 28 Nov 2022 10:02:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3O4eEYwkbAH4u01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ozayK-0000f1-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 10:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QTTQ1zd8bG+E/AXaRhKnQmn9Auf5fnjfJF5NgvxTVAY=; b=HCIWORzXOvS/DUwTtW/kruVDLO
 9T6gg9qdctOJ0luiZOldzKMRZfMny/Vn3k+r9m9ZK6wCRinnMqidHz1yEvxR1pFgkinTDQ/OtZlo2
 woW2CoesX25eQ3tuqTKR1ra4FeTZJ7RMXVaLHhaKl9ezeHCbZf/Ndd3phzAyZ0IyVacc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QTTQ1zd8bG+E/AXaRhKnQmn9Auf5fnjfJF5NgvxTVAY=; b=C
 qr8c7zf/svkKzIG5seBDee+G3K/HIjiJcEkK5fENAH2MRXl+pEtdKjref38Z1IBlAu2Xh9tMDRFQv
 vlkFNmyq0/b8PviUEac9DjxCwshf3Wg3L+UiAjphXVBZm530a4xdvMv/vNgX8j6XUODNaY3bQVU80
 G6i9KbwWCvLj9ucc=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ozayG-00016h-TF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 10:02:44 +0000
Received: by mail-il1-f200.google.com with SMTP id
 o10-20020a056e02102a00b003006328df7bso8502386ilj.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 02:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QTTQ1zd8bG+E/AXaRhKnQmn9Auf5fnjfJF5NgvxTVAY=;
 b=AZ9HgDHmh3L76wIejFu61/2iSYV0oRAICYvq6daeRBPoZ0wmhAQkPvUzz8qsOiP+YR
 jCW2TfCLsDW52R1hrf57/otwhyXwveP2VPRmNuCAZxlvWGSyOEWiH/Joq6teOzIeiHAX
 l6siGBqCszaLrPBfx0nghmS9jguCpIvVzFptHeOW3Mf+2PwqWQTFD3nJ+EyYiA8A+0XP
 T44NEsTVlrXVifEUp/FH1DFDuU8Q0x5S1N2zJ6VoTQLCY2pwMwvnwM/aEZTo6/RMVCCS
 upCK0X9r1dcWp9AlcXvIBc2pYduzZss7hvFHLtDLCsYkevrgytkQfgBXFELtH85+2OMQ
 oBLg==
X-Gm-Message-State: ANoB5plaCmWz9kAMjffewQIJjN49HGcnA5us83/I7QZuq7A1MntXT5xE
 nPoohL2d211vZiq1BK49IiM5xrhYf9rj/tyur40g3kF3XBCj
X-Google-Smtp-Source: AA0mqf5vzpTCEW4SWwL7JbbqzZUh+6X3T+qHItM2ye9YLuaNSnR4NxErIC3hT8ahvNZRDvMRzX8yScSY61h4tiZKZw6EadsCIf29
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216a:b0:303:129a:8157 with SMTP id
 s10-20020a056e02216a00b00303129a8157mr1513770ilv.38.1669629755302; Mon, 28
 Nov 2022 02:02:35 -0800 (PST)
Date: Mon, 28 Nov 2022 02:02:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000078aba005ee84f8e2@google.com>
From: syzbot <syzbot+fbc90a26c932581cfe6b@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 6d464646530f
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1ozayG-00016h-TF
Subject: [f2fs-dev] [syzbot] possible deadlock in f2fs_handle_error
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

syzbot found the following issue on:

HEAD commit:    6d464646530f Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=177fa381880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23eec5c79c22aaf8
dashboard link: https://syzkaller.appspot.com/bug?extid=fbc90a26c932581cfe6b
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f22d29413625/disk-6d464646.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/389f0a5f1a4a/vmlinux-6d464646.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48ddb02d82da/Image-6d464646.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fbc90a26c932581cfe6b@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 262144
F2FS-fs (loop3): Mismatch valid blocks 0 vs. 1
======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc6-syzkaller-32662-g6d464646530f #0 Not tainted
------------------------------------------------------
syz-executor.3/2078 is trying to acquire lock:
ffff00010e914088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
ffff00010e914088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_handle_error+0x9c/0x17c fs/f2fs/super.c:3898

but task is already holding lock:
ffff0000fd2733b8 (&array[i].journal_rwsem){++++}-{3:3}, at: build_sit_entries+0x568/0x9b8 fs/f2fs/segment.c:4412

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #6 (&array[i].journal_rwsem){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       scan_curseg_cache fs/f2fs/node.c:2401 [inline]
       __f2fs_build_free_nids fs/f2fs/node.c:2513 [inline]
       f2fs_build_free_nids+0x798/0x8f4 fs/f2fs/node.c:2528
       f2fs_build_node_manager+0x624/0x64c fs/f2fs/node.c:3313
       f2fs_fill_super+0x1470/0x1e90 fs/f2fs/super.c:4306
       mount_bdev+0x1b8/0x210 fs/super.c:1401
       f2fs_mount+0x44/0x58 fs/f2fs/super.c:4580
       legacy_get_tree+0x30/0x74 fs/fs_context.c:610
       vfs_get_tree+0x40/0x140 fs/super.c:1531
       do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
       path_mount+0x358/0x890 fs/namespace.c:3370
       do_mount fs/namespace.c:3383 [inline]
       __do_sys_mount fs/namespace.c:3591 [inline]
       __se_sys_mount fs/namespace.c:3568 [inline]
       __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #5 (&nm_i->nat_tree_lock){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_get_node_info+0x74/0x458 fs/f2fs/node.c:560
       f2fs_do_write_data_page+0x638/0x1094 fs/f2fs/data.c:2710
       f2fs_write_single_data_page+0x750/0xb24 fs/f2fs/data.c:2845
       f2fs_write_cache_pages+0x498/0xdd0 fs/f2fs/data.c:3097
       __f2fs_write_data_pages+0x3f0/0x47c fs/f2fs/data.c:3247
       f2fs_write_data_pages+0x44/0x54 fs/f2fs/data.c:3274
       do_writepages+0x144/0x27c mm/page-writeback.c:2469
       __writeback_single_inode+0x64/0x2e4 fs/fs-writeback.c:1587
       writeback_sb_inodes+0x3e4/0x85c fs/fs-writeback.c:1870
       wb_writeback+0x198/0x328 fs/fs-writeback.c:2044
       wb_do_writeback+0xc8/0x384 fs/fs-writeback.c:2187
       wb_workfn+0x70/0x15c fs/fs-writeback.c:2227
       process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
       worker_thread+0x340/0x610 kernel/workqueue.c:2436
       kthread+0x12c/0x158 kernel/kthread.c:376
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:863

-> #4 (&sbi->cp_rwsem){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
       f2fs_do_truncate_blocks+0x98/0x384 fs/f2fs/file.c:687
       f2fs_truncate_blocks+0x9c/0x1d8 fs/f2fs/file.c:750
       f2fs_truncate+0x1b8/0x2a8 fs/f2fs/file.c:802
       f2fs_setattr+0x5c8/0x788 fs/f2fs/file.c:1009
       notify_change+0x758/0x7f0 fs/attr.c:420
       do_truncate+0x108/0x150 fs/open.c:65
       handle_truncate+0xf4/0x154 fs/namei.c:3216
       do_open fs/namei.c:3561 [inline]
       path_openat+0xee0/0x11c4 fs/namei.c:3713
       do_filp_open+0xdc/0x1b8 fs/namei.c:3740
       do_sys_openat2+0xb8/0x22c fs/open.c:1310
       do_sys_open fs/open.c:1326 [inline]
       __do_sys_openat fs/open.c:1342 [inline]
       __se_sys_openat fs/open.c:1337 [inline]
       __arm64_sys_openat+0xb0/0xe0 fs/open.c:1337
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #3 (mapping.invalidate_lock#4){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       filemap_invalidate_lock_shared include/linux/fs.h:811 [inline]
       f2fs_vm_page_mkwrite+0x18c/0x9a4 fs/f2fs/file.c:104
       do_page_mkwrite+0x74/0x288 mm/memory.c:2978
       wp_page_shared+0x8c/0x364 mm/memory.c:3324
       do_wp_page+0x794/0xd10 mm/memory.c:3474
       handle_pte_fault mm/memory.c:4973 [inline]
       __handle_mm_fault mm/memory.c:5097 [inline]
       handle_mm_fault+0x880/0xa48 mm/memory.c:5218
       __do_page_fault arch/arm64/mm/fault.c:512 [inline]
       do_page_fault+0x428/0x79c arch/arm64/mm/fault.c:612
       do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:831
       el0_da+0x70/0x16c arch/arm64/kernel/entry-common.c:515
       el0t_64_sync_handler+0xcc/0xf0 arch/arm64/kernel/entry-common.c:658
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #2 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write+0x84/0x1f4 include/linux/fs.h:1826
       sb_start_pagefault include/linux/fs.h:1930 [inline]
       f2fs_vm_page_mkwrite+0x160/0x9a4 fs/f2fs/file.c:99
       do_page_mkwrite+0x74/0x288 mm/memory.c:2978
       wp_page_shared+0x8c/0x364 mm/memory.c:3324
       do_wp_page+0x794/0xd10 mm/memory.c:3474
       handle_pte_fault mm/memory.c:4973 [inline]
       __handle_mm_fault mm/memory.c:5097 [inline]
       handle_mm_fault+0x880/0xa48 mm/memory.c:5218
       __do_page_fault arch/arm64/mm/fault.c:512 [inline]
       do_page_fault+0x428/0x79c arch/arm64/mm/fault.c:612
       do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:831
       el0_da+0x70/0x16c arch/arm64/kernel/entry-common.c:515
       el0t_64_sync_handler+0xcc/0xf0 arch/arm64/kernel/entry-common.c:658
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #1 (&mm->mmap_lock){++++}-{3:3}:
       __might_fault+0x7c/0xb4 mm/memory.c:5646
       _copy_to_user include/linux/uaccess.h:143 [inline]
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2349 [inline]
       __f2fs_ioctl+0x3204/0x3318 fs/f2fs/file.c:4151
       f2fs_ioctl+0x74/0xbc fs/f2fs/file.c:4224
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __arm64_sys_ioctl+0xd0/0x140 fs/ioctl.c:856
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #0 (&sbi->sb_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x1530/0x3084 kernel/locking/lockdep.c:5055
       lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
       down_write+0x5c/0x88 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
       f2fs_handle_error+0x9c/0x17c fs/f2fs/super.c:3898
       check_block_count+0x210/0x268
       build_sit_entries+0x638/0x9b8 fs/f2fs/segment.c:4432
       f2fs_build_segment_manager+0x354/0x408 fs/f2fs/segment.c:5123
       f2fs_fill_super+0x1438/0x1e90 fs/f2fs/super.c:4300
       mount_bdev+0x1b8/0x210 fs/super.c:1401
       f2fs_mount+0x44/0x58 fs/f2fs/super.c:4580
       legacy_get_tree+0x30/0x74 fs/fs_context.c:610
       vfs_get_tree+0x40/0x140 fs/super.c:1531
       do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
       path_mount+0x358/0x890 fs/namespace.c:3370
       do_mount fs/namespace.c:3383 [inline]
       __do_sys_mount fs/namespace.c:3591 [inline]
       __se_sys_mount fs/namespace.c:3568 [inline]
       __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

other info that might help us debug this:

Chain exists of:
  &sbi->sb_lock --> &nm_i->nat_tree_lock --> &array[i].journal_rwsem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&array[i].journal_rwsem);
                               lock(&nm_i->nat_tree_lock);
                               lock(&array[i].journal_rwsem);
  lock(&sbi->sb_lock);

 *** DEADLOCK ***

2 locks held by syz-executor.3/2078:
 #0: ffff000144b030e0 (&type->s_umount_key#53/1){+.+.}-{3:3}, at: alloc_super+0xf8/0x430 fs/super.c:228
 #1: ffff0000fd2733b8 (&array[i].journal_rwsem){++++}-{3:3}, at: build_sit_entries+0x568/0x9b8 fs/f2fs/segment.c:4412

stack backtrace:
CPU: 0 PID: 2078 Comm: syz-executor.3 Not tainted 6.1.0-rc6-syzkaller-32662-g6d464646530f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 print_circular_bug+0x2c4/0x2c8 kernel/locking/lockdep.c:2055
 check_noncircular+0x14c/0x154 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x1530/0x3084 kernel/locking/lockdep.c:5055
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
 down_write+0x5c/0x88 kernel/locking/rwsem.c:1562
 f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
 f2fs_handle_error+0x9c/0x17c fs/f2fs/super.c:3898
 check_block_count+0x210/0x268
 build_sit_entries+0x638/0x9b8 fs/f2fs/segment.c:4432
 f2fs_build_segment_manager+0x354/0x408 fs/f2fs/segment.c:5123
 f2fs_fill_super+0x1438/0x1e90 fs/f2fs/super.c:4300
 mount_bdev+0x1b8/0x210 fs/super.c:1401
 f2fs_mount+0x44/0x58 fs/f2fs/super.c:4580
 legacy_get_tree+0x30/0x74 fs/fs_context.c:610
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
F2FS-fs (loop3): Failed to initialize F2FS segment manager (-117)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
