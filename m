Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC9647FE0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 10:09:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3ZNu-0000BU-23;
	Fri, 09 Dec 2022 09:09:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3FvuSYwkbAHsrxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p3ZNB-0000Ag-9p for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 09:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ijsm07zxCBrVTgqLExNAgXLfYVJ4tHyHwAv61EC2Joc=; b=l+ycGQvXMqFS/Nuyc+JA5Kio+/
 TYsa+dHxh7JW60hH9iIKDh6GuloKfcWCS8m25EVIJzySlV68PagSmzIOVxbXWhIR3cus5tJNuzVdP
 J/gu4TXNfoOpbRF6VtIfRG2MBwCU4gbLBsiuyweVM+yHEoY8GvpiI0Ui2Sd0tdmXuuuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ijsm07zxCBrVTgqLExNAgXLfYVJ4tHyHwAv61EC2Joc=; b=N
 r3u72PzbFr06o75R6KezaaqCFDzbWoJLkkUmJb6wETnnA4BLqtKkfbQ7XtdM+ehSR5AxhzwvPeBTd
 7P0XdpNA4rnbnKAh41c9BZ7XUc002u+UaMKVnLZPbKfYqAAAL1lq4qXpLDCaabaeAKblyCLajSEsU
 Vok+KvAzTU4Z1pV4=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p3ZN6-0003w8-5L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 09:08:47 +0000
Received: by mail-io1-f69.google.com with SMTP id
 z9-20020a6be009000000b006e0577c3686so1800832iog.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 09 Dec 2022 01:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ijsm07zxCBrVTgqLExNAgXLfYVJ4tHyHwAv61EC2Joc=;
 b=WWpitwzcp5sD8onUD+pUn2vzUJfDIjcxFJzgTszhLOcm0lniWQUHEicavJeXtpCC+R
 pys24h/ZANHMQK0pp8385bWPeWm20WD9zz4mHYdWWC+O0Xv2uc0kL0Td0t1LMO72jCxW
 yKk969i5RGFh3PoPug0uM9ydspURhXznAbPGQKBORIstq/rBrlRnHkrofeNsqUW7P+WL
 c6bzE2iIjStJCI/Xe7xBoc5A33b/lDojFgyCXhFoqpJKs3J/wNAtO8qk9N/hUwWm5a6L
 f3dG6pz6uA+R6pj7uk5j5T39XIfvmbgg6c7cbESUhsfy4nkQngxRnfIye4mRNGpTmMcP
 3A8Q==
X-Gm-Message-State: ANoB5pk5T5ZXGYXjmK4p1oiLMFb2D/v65ZY6tz0/UmeoZrFJfYFPiqvR
 4f3lu4ZFRRHt495Y5cEuXhx1ux5emsiPiEfsEomMx6HjHAgo
X-Google-Smtp-Source: AA0mqf60VSWSPW5mFCxe8omoF9Anxi4OSnGlKYiePOP8wWu0US2fLoCsDtd1tHbg8cx/3tNcLpwm9Aui48vNM0qBKSbwWho2H0OY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2206:b0:302:d141:bf84 with SMTP id
 j6-20020a056e02220600b00302d141bf84mr35387770ilf.287.1670576918582; Fri, 09
 Dec 2022 01:08:38 -0800 (PST)
Date: Fri, 09 Dec 2022 01:08:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cd5fe305ef617fe2@google.com>
From: syzbot <syzbot+4793f6096d174c90b4f7@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: a5541c0811a0
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1p3ZN6-0003w8-5L
Subject: [f2fs-dev] [syzbot] possible deadlock in __f2fs_ioctl
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

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13a6e7cb880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=4793f6096d174c90b4f7
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4793f6096d174c90b4f7@syzkaller.appspotmail.com

F2FS-fs (loop2): invalid crc value
F2FS-fs (loop2): Found nat_bits in checkpoint
F2FS-fs (loop2): Mounted with checkpoint version = 48b305e4
======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0 Not tainted
------------------------------------------------------
syz-executor.2/32123 is trying to acquire lock:
ffff0000c0e1a608 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x54/0xb4 mm/memory.c:5644

but task is already holding lock:
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2334 [inline]
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: __f2fs_ioctl+0x1370/0x3318 fs/f2fs/file.c:4151

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&sbi->sb_lock){++++}-{3:3}:
       down_write+0x5c/0x88 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
       f2fs_handle_error+0x9c/0x17c fs/f2fs/super.c:3898
       f2fs_check_nid_range fs/f2fs/node.c:39 [inline]
       add_free_nid+0x4d8/0x50c fs/f2fs/node.c:2282
       scan_nat_page fs/f2fs/node.c:2384 [inline]
       __f2fs_build_free_nids fs/f2fs/node.c:2490 [inline]
       f2fs_build_free_nids+0x680/0x8f4 fs/f2fs/node.c:2528
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
       do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #2 (&nm_i->nat_tree_lock){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_get_node_info+0x74/0x458 fs/f2fs/node.c:560
       read_node_page+0x100/0x7a4 fs/f2fs/node.c:1358
       __get_node_page+0x1b4/0xa3c fs/f2fs/node.c:1419
       f2fs_get_node_page fs/f2fs/node.c:1468 [inline]
       f2fs_get_dnode_of_data+0xc8/0xad0 fs/f2fs/node.c:776
       f2fs_remove_inode_page+0x50/0x288 fs/f2fs/node.c:1225
       f2fs_evict_inode+0x348/0x978 fs/f2fs/inode.c:813
       evict+0xec/0x334 fs/inode.c:664
       iput_final fs/inode.c:1747 [inline]
       iput+0x2c4/0x324 fs/inode.c:1773
       f2fs_new_inode+0x284/0x7bc fs/f2fs/namei.c:152
       f2fs_create+0xa4/0x4b0 fs/f2fs/namei.c:355
       lookup_open fs/namei.c:3413 [inline]
       open_last_lookups fs/namei.c:3481 [inline]
       path_openat+0x804/0x11c4 fs/namei.c:3711
       do_filp_open+0xdc/0x1b8 fs/namei.c:3741
       do_sys_openat2+0xb8/0x22c fs/open.c:1310
       do_sys_open fs/open.c:1326 [inline]
       __do_sys_openat fs/open.c:1342 [inline]
       __se_sys_openat fs/open.c:1337 [inline]
       __arm64_sys_openat+0xb0/0xe0 fs/open.c:1337
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #1 (&sbi->cp_rwsem){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
       f2fs_convert_inline_inode+0x1e8/0x2e4 fs/f2fs/inline.c:219
       f2fs_vm_page_mkwrite+0xb4/0x9a4 fs/f2fs/file.c:79
       do_page_mkwrite+0x74/0x288 mm/memory.c:2977
       wp_page_shared+0x8c/0x364 mm/memory.c:3323
       do_wp_page+0x794/0xd10 mm/memory.c:3473
       handle_pte_fault mm/memory.c:4972 [inline]
       __handle_mm_fault mm/memory.c:5096 [inline]
       handle_mm_fault+0x880/0xa48 mm/memory.c:5217
       __do_page_fault arch/arm64/mm/fault.c:508 [inline]
       do_page_fault+0x428/0x79c arch/arm64/mm/fault.c:608
       do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:827
       el0_da+0x70/0x16c arch/arm64/kernel/entry-common.c:515
       el0t_64_sync_handler+0xcc/0xf0 arch/arm64/kernel/entry-common.c:658
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x1530/0x3084 kernel/locking/lockdep.c:5055
       lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
       __might_fault+0x7c/0xb4 mm/memory.c:5645
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
       do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> &nm_i->nat_tree_lock --> &sbi->sb_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->sb_lock);
                               lock(&nm_i->nat_tree_lock);
                               lock(&sbi->sb_lock);
  lock(&mm->mmap_lock);

 *** DEADLOCK ***

2 locks held by syz-executor.2/32123:
 #0: ffff000112968460 (sb_writers#13){.+.+}-{0:0}, at: mnt_want_write_file+0x28/0xd8 fs/namespace.c:437
 #1: ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
 #1: ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2334 [inline]
 #1: ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: __f2fs_ioctl+0x1370/0x3318 fs/f2fs/file.c:4151

stack backtrace:
CPU: 1 PID: 32123 Comm: syz-executor.2 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:163
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
 __might_fault+0x7c/0xb4 mm/memory.c:5645
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
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584


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
