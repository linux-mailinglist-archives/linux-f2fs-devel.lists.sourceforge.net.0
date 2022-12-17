Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276C64F674
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 01:47:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6LLr-0006vu-Hm;
	Sat, 17 Dec 2022 00:46:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3bxGdYwkbACoYefQGRRKXGVVOJ.MUUMRKaYKXIUTZKTZ.IUS@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p6LLp-0006vg-8k for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbhz5hYdc5507PTzEvKg+x5ZfnFp0eVbrdWTDciABXU=; b=a/OMSFVrM8pytaK5X0onDFP0Iu
 1ewAKkZP3JNvePCK+PHml2FVXaa8BNXbEx5uX6tXVxi9ZG+puDjeyg566FUFsL3nXTGnpZCxtALCj
 0wegLDlDLn7N0m2tstZ0t/mV7U8TBUDvaGSOxbQTw2uGrnKxq/pE6xqpNwP24cU6zFqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zbhz5hYdc5507PTzEvKg+x5ZfnFp0eVbrdWTDciABXU=; b=h
 d0bFnJYA7EVbDfiYLuZHoT7vjsUjPhPc8KDEgrmD67XspFyYc+0KuG8ekAekGB4PsUFax7AUJERnR
 jQ7sJf6xAI6ljNkv3BJj7kezuhXWpfBbp8qhc3o73dXzG20Fvi1o6tTCBgk+99/SACDUOdpXO6ZHu
 ooXQ5G48BhUosrl4=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p6LLk-0000kW-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:46:53 +0000
Received: by mail-il1-f200.google.com with SMTP id
 l13-20020a056e021c0d00b003034e24b866so2654934ilh.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 16:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zbhz5hYdc5507PTzEvKg+x5ZfnFp0eVbrdWTDciABXU=;
 b=caLxv8W+TQkOWJinVc6MC9W87AFQMaBBJpL0iqlABF/uxz/1NyCdXUjjgESH3wLRZq
 HOmvIaAnMyuAm0qdVDyN4GYxuWN8Vk0VLHdrSW7XKxNaBseoYQie9O6IoKgO3RWznDGU
 Fkhk2Xd3two5RpF1VDmwgHkKqSVN3j5xPkNvkdllDU2hFFI/DlopEM1Jc2XHlliksOTA
 ZEidwOv65s00wPFhTIHEVd4LVG3/CGNI6j5FmnRD9Kcj/WfARQV7xz/UCQ57Ug+08VC0
 tx7xgYXouL10DQNRrrkUwMt/x/s00TzECNuisgCpa+OcZAmEonOdjCIuXVPynx2dTl6p
 2w5Q==
X-Gm-Message-State: AFqh2konNKDP8t6ILsqyGKvr/kc5B1da5bvG9Dp1TTW0ibm7k+uTpSpQ
 DWv/KZQ0Cj/zRvQbG7RYeYnwJ+lZ4QuBGx2tMxnld/qhMAj1
X-Google-Smtp-Source: AMrXdXsJB8/byPFCMJ8QVcntvw73I2qlU21ExYOTd6lfA/p8HzHhQHq8TvWkqvJH9uXZMX24FLF0QgXDPID5ZXcw/REsri92Q6e1
MIME-Version: 1.0
X-Received: by 2002:a05:6638:59b:b0:38c:8ef9:c68b with SMTP id
 a27-20020a056638059b00b0038c8ef9c68bmr857481jar.298.1671237999980; Fri, 16
 Dec 2022 16:46:39 -0800 (PST)
Date: Fri, 16 Dec 2022 16:46:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000052f6ae05effb6b1f@google.com>
From: syzbot <syzbot+883ded0ab581cc190f58@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 830b3c68c1fb
 Linux 6.1 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=17951967880000
 kernel config: https://syzkaller.appspot.com/x/.config?x=26d9ba6d9b746f4
 [...] Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1p6LLk-0000kW-O8
Subject: [f2fs-dev] [syzbot] possible deadlock in
 f2fs_ioc_get_encryption_pwsalt
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

HEAD commit:    830b3c68c1fb Linux 6.1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17951967880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d9ba6d9b746f4
dashboard link: https://syzkaller.appspot.com/bug?extid=883ded0ab581cc190f58
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2c32f77928d8/disk-830b3c68.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02c35bb3112e/vmlinux-830b3c68.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fe93aa8e0468/bzImage-830b3c68.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+883ded0ab581cc190f58@syzkaller.appspotmail.com

F2FS-fs (loop4): Try to recover 2th superblock, ret: 0
F2FS-fs (loop4): Mounted with checkpoint version = 753bd00b
======================================================
WARNING: possible circular locking dependency detected
6.1.0-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor.4/21588 is trying to acquire lock:
ffff88807d6cc9d8 (&mm->mmap_lock#2){++++}-{3:3}, at: __might_fault+0xa9/0x180 mm/memory.c:5644

but task is already holding lock:
ffff888021560088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
ffff888021560088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt+0x174/0x370 fs/f2fs/file.c:2334

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&sbi->sb_lock){++++}-{3:3}:
       down_write+0x94/0x220 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
       f2fs_handle_error+0x8e/0x200 fs/f2fs/super.c:3898
       f2fs_check_nid_range.part.0+0x4d/0x60 fs/f2fs/node.c:39
       f2fs_check_nid_range fs/f2fs/node.c:2275 [inline]
       add_free_nid.isra.0+0x781/0x940 fs/f2fs/node.c:2282
       scan_nat_page fs/f2fs/node.c:2384 [inline]
       __f2fs_build_free_nids+0x5b5/0xe10 fs/f2fs/node.c:2490
       f2fs_build_free_nids fs/f2fs/node.c:2528 [inline]
       f2fs_build_node_manager+0x2007/0x2fb0 fs/f2fs/node.c:3313
       f2fs_fill_super+0x3a95/0x77a0 fs/f2fs/super.c:4306
       mount_bdev+0x351/0x410 fs/super.c:1401
       legacy_get_tree+0x109/0x220 fs/fs_context.c:610
       vfs_get_tree+0x8d/0x2f0 fs/super.c:1531
       do_new_mount fs/namespace.c:3040 [inline]
       path_mount+0x132a/0x1e20 fs/namespace.c:3370
       do_mount fs/namespace.c:3383 [inline]
       __do_sys_mount fs/namespace.c:3591 [inline]
       __se_sys_mount fs/namespace.c:3568 [inline]
       __x64_sys_mount+0x283/0x300 fs/namespace.c:3568
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #3 (&nm_i->nat_tree_lock){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:560
       f2fs_new_node_page+0x249/0xac0 fs/f2fs/node.c:1291
       f2fs_get_dnode_of_data+0x530/0x2480 fs/f2fs/node.c:806
       f2fs_reserve_block+0x4d/0x430 fs/f2fs/data.c:1184
       f2fs_get_block+0x131/0x150 fs/f2fs/data.c:1205
       f2fs_vm_page_mkwrite+0x12b2/0x1c90 fs/f2fs/file.c:118
       do_page_mkwrite+0x19b/0x680 mm/memory.c:2977
       wp_page_shared mm/memory.c:3323 [inline]
       do_wp_page+0xde5/0x1930 mm/memory.c:3473
       handle_pte_fault mm/memory.c:4972 [inline]
       __handle_mm_fault+0x181b/0x3a40 mm/memory.c:5096
       handle_mm_fault+0x1cc/0x780 mm/memory.c:5217
       faultin_page mm/gup.c:1009 [inline]
       __get_user_pages+0x497/0xf10 mm/gup.c:1230
       __get_user_pages_locked mm/gup.c:1434 [inline]
       __get_user_pages_remote+0x18f/0x830 mm/gup.c:2187
       pin_user_pages_remote+0x70/0xb0 mm/gup.c:3245
       process_vm_rw_single_vec mm/process_vm_access.c:105 [inline]
       process_vm_rw_core.constprop.0+0x43b/0x980 mm/process_vm_access.c:215
       process_vm_rw+0x29c/0x300 mm/process_vm_access.c:283
       __do_sys_process_vm_writev mm/process_vm_access.c:303 [inline]
       __se_sys_process_vm_writev mm/process_vm_access.c:298 [inline]
       __x64_sys_process_vm_writev+0xe3/0x1b0 mm/process_vm_access.c:298
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #2 (&sbi->node_change){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
       f2fs_do_map_lock+0x4e/0x80 fs/f2fs/data.c:1442
       f2fs_vm_page_mkwrite+0x1253/0x1c90 fs/f2fs/file.c:116
       do_page_mkwrite+0x19b/0x680 mm/memory.c:2977
       do_shared_fault mm/memory.c:4618 [inline]
       do_fault mm/memory.c:4686 [inline]
       handle_pte_fault mm/memory.c:4954 [inline]
       __handle_mm_fault+0x2280/0x3a40 mm/memory.c:5096
       handle_mm_fault+0x1cc/0x780 mm/memory.c:5217
       faultin_page mm/gup.c:1009 [inline]
       __get_user_pages+0x497/0xf10 mm/gup.c:1230
       __get_user_pages_locked mm/gup.c:1494 [inline]
       __get_user_pages_remote+0x326/0x830 mm/gup.c:2187
       pin_user_pages_remote+0x70/0xb0 mm/gup.c:3245
       process_vm_rw_single_vec mm/process_vm_access.c:105 [inline]
       process_vm_rw_core.constprop.0+0x43b/0x980 mm/process_vm_access.c:215
       process_vm_rw+0x29c/0x300 mm/process_vm_access.c:283
       __do_sys_process_vm_writev mm/process_vm_access.c:303 [inline]
       __se_sys_process_vm_writev mm/process_vm_access.c:298 [inline]
       __x64_sys_process_vm_writev+0xe3/0x1b0 mm/process_vm_access.c:298
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (mapping.invalidate_lock#3){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       filemap_invalidate_lock_shared include/linux/fs.h:811 [inline]
       filemap_fault+0xba2/0x2400 mm/filemap.c:3127
       f2fs_filemap_fault+0x82/0x3e0 fs/f2fs/file.c:44
       __do_fault+0x107/0x600 mm/memory.c:4202
       do_shared_fault mm/memory.c:4608 [inline]
       do_fault mm/memory.c:4686 [inline]
       handle_pte_fault mm/memory.c:4954 [inline]
       __handle_mm_fault+0x2200/0x3a40 mm/memory.c:5096
       handle_mm_fault+0x1cc/0x780 mm/memory.c:5217
       faultin_page mm/gup.c:1009 [inline]
       __get_user_pages+0x497/0xf10 mm/gup.c:1230
       __get_user_pages_locked mm/gup.c:1434 [inline]
       __get_user_pages_remote+0x18f/0x830 mm/gup.c:2187
       pin_user_pages_remote+0x70/0xb0 mm/gup.c:3245
       process_vm_rw_single_vec mm/process_vm_access.c:105 [inline]
       process_vm_rw_core.constprop.0+0x43b/0x980 mm/process_vm_access.c:215
       process_vm_rw+0x29c/0x300 mm/process_vm_access.c:283
       __do_sys_process_vm_writev mm/process_vm_access.c:303 [inline]
       __se_sys_process_vm_writev mm/process_vm_access.c:298 [inline]
       __x64_sys_process_vm_writev+0xe3/0x1b0 mm/process_vm_access.c:298
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&mm->mmap_lock#2){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       __might_fault mm/memory.c:5645 [inline]
       __might_fault+0x10c/0x180 mm/memory.c:5638
       _copy_to_user+0x29/0x150 lib/usercopy.c:29
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt+0x2b2/0x370 fs/f2fs/file.c:2349
       __f2fs_ioctl+0x1755/0xa800 fs/f2fs/file.c:4151
       f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4224
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock#2 --> &nm_i->nat_tree_lock --> &sbi->sb_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->sb_lock);
                               lock(&nm_i->nat_tree_lock);
                               lock(&sbi->sb_lock);
  lock(&mm->mmap_lock#2);

 *** DEADLOCK ***

2 locks held by syz-executor.4/21588:
 #0: ffff88801bc5e460 (sb_writers#21){.+.+}-{0:0}, at: f2fs_ioc_get_encryption_pwsalt+0x136/0x370 fs/f2fs/file.c:2330
 #1: ffff888021560088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
 #1: ffff888021560088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt+0x174/0x370 fs/f2fs/file.c:2334

stack backtrace:
CPU: 1 PID: 21588 Comm: syz-executor.4 Not tainted 6.1.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 __might_fault mm/memory.c:5645 [inline]
 __might_fault+0x10c/0x180 mm/memory.c:5638
 _copy_to_user+0x29/0x150 lib/usercopy.c:29
 copy_to_user include/linux/uaccess.h:169 [inline]
 f2fs_ioc_get_encryption_pwsalt+0x2b2/0x370 fs/f2fs/file.c:2349
 __f2fs_ioctl+0x1755/0xa800 fs/f2fs/file.c:4151
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4224
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f4c6808c0d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4c66bfe168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f4c681abf80 RCX: 00007f4c6808c0d9
RDX: 0000000000000000 RSI: 0000000040106614 RDI: 0000000000000003
RBP: 00007f4c680e7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff2fcbd3ff R14: 00007f4c66bfe300 R15: 0000000000022000
 </TASK>


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
