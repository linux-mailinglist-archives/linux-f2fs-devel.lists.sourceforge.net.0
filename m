Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FF66D4CA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 03:57:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHcAa-00061H-Uk;
	Tue, 17 Jan 2023 02:57:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3pQ7GYwkbAP4y45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pHcAZ-00061B-EA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 02:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HqpxAh/EoBvs9t1kZ3h25qJbgIvOUq78kZI3AqDinps=; b=fBRQuFUte3kFFN5ESABoVL77pu
 LqMfSF+GpdWIchxacnGzX8zULm7QPE5tBwzpZccSwwuaHaKGIkP6k5lNezHmEsJRB8zrXmjptR3Sr
 w1r/h12CTjNf83Ov9SxdLlb6oUnDYOCymjLCB1ZtTEBfzjacVIyupmdolXt+0kO9OjPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HqpxAh/EoBvs9t1kZ3h25qJbgIvOUq78kZI3AqDinps=; b=V
 xiC10xe9u9hxOcTWPRyQ68yOL4bqsuNWPALRK1sTOQaalVd5m1UfRGvssjrRvelpy9sE1fIhEBWJy
 PMMk7/JWmN+U5s5NFc7LnW2F51rxfI4nV+Q/Bo99tJxt+BSYzrnxG3pmXizxVVtDzImkHJMTrsDA+
 odGXYW0ZiPicmxyI=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHcAV-006K41-5M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 02:57:50 +0000
Received: by mail-il1-f197.google.com with SMTP id
 i7-20020a056e021b0700b003033a763270so22171528ilv.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Jan 2023 18:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqpxAh/EoBvs9t1kZ3h25qJbgIvOUq78kZI3AqDinps=;
 b=ZQDX4Uyjm1Z7i0w2QQv6XgsKsNOHp61TAOLTUYq1M31bdmnANQl/nzQSR4Yr0JEoES
 b6+prep39OdB96xHfDKFe2KvyEb8E1SfCBXjMJfO+2V/kb7Jz/XrydMm2cntpZpFtvtT
 kxyw6Grex1KmZggc7Z8FK/crXran8Lwo6z2wJ77luShjr3ItB0ByxhJ9G4zFtDCNtCAD
 qt64aFRBPZsoo1SafcsJmlVAuOI2bjafi4W3L5F9QerNyWRTX+bY3JKZuBE4tZ7wkrfm
 5kI7AwI8MnjGq6A/z4a9Y2FQCYhcqUtzmPSZwAx6I41qdDPKempsEyBI89I8IJLE3Iil
 8kNQ==
X-Gm-Message-State: AFqh2kqZ4/qTjZuZRrMZ83wTEw0DO9pPkpRUblPNy0MG7OageSvj+y2C
 HV+8A4FrhAMF330o3BAcHqLNi8yUZApLvq4M7aeD+HV7qeEp
X-Google-Smtp-Source: AMrXdXsIYhyAHHWYiWqoHjuIP0IP7v288ElekurC6b7CdOi0sluKEC+XMfk/M2M45jeq6Rl6jLb+o33GOInnxoBxlz+XXNUVjbUv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:ece:b0:30c:1693:594b with SMTP id
 i14-20020a056e020ece00b0030c1693594bmr134880ilk.210.1673924261614; Mon, 16
 Jan 2023 18:57:41 -0800 (PST)
Date: Mon, 16 Jan 2023 18:57:41 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe9c9d05f26cdc3c@google.com>
From: syzbot <syzbot+0d79d79c510d77a7c661@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 5dc4c995db9e
 Linux 6.2-rc4 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=11cc0da1480000
 kernel config: https://syzkaller.appspot.com/x/.config?x=2d1e01fb80d [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
X-Headers-End: 1pHcAV-006K41-5M
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in __f2fs_ioctl (2)
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

HEAD commit:    5dc4c995db9e Linux 6.2-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11cc0da1480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d1e01fb80d3df97
dashboard link: https://syzkaller.appspot.com/bug?extid=0d79d79c510d77a7c661
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e52acf94631e/disk-5dc4c995.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8ead5c940574/vmlinux-5dc4c995.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f6b43b71bf31/bzImage-5dc4c995.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d79d79c510d77a7c661@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.2.0-rc4-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor.4/7644 is trying to acquire lock:
ffff8880193935d8 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x8f/0x110 mm/memory.c:5646

but task is already holding lock:
ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2350 [inline]
ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: __f2fs_ioctl+0x3572/0xb540 fs/f2fs/file.c:4169

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&sbi->sb_lock){++++}-{3:3}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       down_write+0x9c/0x270 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
       f2fs_handle_error+0xe0/0x230 fs/f2fs/super.c:3926
       scan_nat_page fs/f2fs/node.c:2387 [inline]
       __f2fs_build_free_nids fs/f2fs/node.c:2493 [inline]
       f2fs_build_free_nids+0xb8c/0x1190 fs/f2fs/node.c:2531
       f2fs_fill_super+0x4a5f/0x6ee0 fs/f2fs/super.c:4334
       mount_bdev+0x26c/0x3a0 fs/super.c:1359
       legacy_get_tree+0xea/0x180 fs/fs_context.c:610
       vfs_get_tree+0x88/0x270 fs/super.c:1489
       do_new_mount+0x289/0xad0 fs/namespace.c:3145
       do_mount fs/namespace.c:3488 [inline]
       __do_sys_mount fs/namespace.c:3697 [inline]
       __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #2 (&nm_i->nat_tree_lock){++++}-{3:3}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       down_read+0x39/0x50 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
       f2fs_get_node_info+0x100/0x1720 fs/f2fs/node.c:564
       f2fs_new_node_page+0x402/0xea0 fs/f2fs/node.c:1295
       f2fs_get_dnode_of_data+0x5b0/0x1da0 fs/f2fs/node.c:810
       f2fs_reserve_block+0x50/0x240 fs/f2fs/data.c:1199
       f2fs_get_new_data_page+0x180/0x7b0 fs/f2fs/data.c:1387
       f2fs_add_regular_entry+0x687/0xea0 fs/f2fs/dir.c:754
       f2fs_add_dentry fs/f2fs/dir.c:816 [inline]
       f2fs_do_add_link+0x2a7/0x470 fs/f2fs/dir.c:855
       f2fs_add_link fs/f2fs/f2fs.h:3564 [inline]
       f2fs_create+0x324/0x530 fs/f2fs/namei.c:363
       lookup_open fs/namei.c:3413 [inline]
       open_last_lookups fs/namei.c:3481 [inline]
       path_openat+0x12ac/0x2dd0 fs/namei.c:3711
       do_filp_open+0x264/0x4f0 fs/namei.c:3741
       do_sys_openat2+0x124/0x4e0 fs/open.c:1310
       do_sys_open fs/open.c:1326 [inline]
       __do_sys_creat fs/open.c:1402 [inline]
       __se_sys_creat fs/open.c:1396 [inline]
       __x64_sys_creat+0x11f/0x160 fs/open.c:1396
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&sbi->cp_rwsem){++++}-{3:3}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       down_read+0x39/0x50 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2231 [inline]
       f2fs_convert_inline_inode+0x55f/0x820 fs/f2fs/inline.c:219
       f2fs_vm_page_mkwrite+0x2d8/0x1350 fs/f2fs/file.c:79
       do_page_mkwrite+0x19e/0x5e0 mm/memory.c:2947
       wp_page_shared+0x15e/0x380 mm/memory.c:3295
       handle_pte_fault mm/memory.c:4949 [inline]
       __handle_mm_fault mm/memory.c:5073 [inline]
       handle_mm_fault+0x1b79/0x26b0 mm/memory.c:5219
       do_user_addr_fault+0x69b/0xcb0 arch/x86/mm/fault.c:1428
       handle_page_fault arch/x86/mm/fault.c:1519 [inline]
       exc_page_fault+0x7a/0x110 arch/x86/mm/fault.c:1575
       asm_exc_page_fault+0x22/0x30 arch/x86/include/asm/idtentry.h:570

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
       __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       __might_fault+0xb2/0x110 mm/memory.c:5647
       _copy_to_user+0x26/0x130 lib/usercopy.c:29
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2365 [inline]
       __f2fs_ioctl+0xaf72/0xb540 fs/f2fs/file.c:4169
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

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

2 locks held by syz-executor.4/7644:
 #0: ffff888029ce0460 (sb_writers#30){.+.+}-{0:0}, at: mnt_want_write_file+0x5a/0x1f0 fs/namespace.c:552
 #1: ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
 #1: ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2350 [inline]
 #1: ffff88802babc088 (&sbi->sb_lock){++++}-{3:3}, at: __f2fs_ioctl+0x3572/0xb540 fs/f2fs/file.c:4169

stack backtrace:
CPU: 1 PID: 7644 Comm: syz-executor.4 Not tainted 6.2.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 check_noncircular+0x2cc/0x390 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
 __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
 lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
 __might_fault+0xb2/0x110 mm/memory.c:5647
 _copy_to_user+0x26/0x130 lib/usercopy.c:29
 copy_to_user include/linux/uaccess.h:169 [inline]
 f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2365 [inline]
 __f2fs_ioctl+0xaf72/0xb540 fs/f2fs/file.c:4169
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f84dbc8c0c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f84dc990168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f84dbdac050 RCX: 00007f84dbc8c0c9
RDX: 0000000020000680 RSI: 0000000040106614 RDI: 0000000000000006
RBP: 00007f84dbce7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fffc413f05f R14: 00007f84dc990300 R15: 0000000000022000
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
