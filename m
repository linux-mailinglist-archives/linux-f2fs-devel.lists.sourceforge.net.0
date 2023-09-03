Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A84790F09
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 00:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcvk4-0007QA-01;
	Sun, 03 Sep 2023 22:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3GQn1ZAkbAC4cijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qcvk2-0007Q3-PK for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Sep 2023 22:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uvjNZ30LBEHGWu5hFTDkWGufH/rb9S8Ay/l9GigndY=; b=GGYCireirVFAP2T2GzeqgnCsms
 2QnMzWhZDPNIq1L79QZ4vZaq6NaK8qdAeTDW36W9ePgyOOAhm9II8zhKcZqdWL7aDt1B8fXVQ5M1d
 2fULgB9BcCc/MvnS3xzNzhP1S+z69vN80OeeoTjYWkWfngBSbjfbCue8QpHjOO3uyXmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9uvjNZ30LBEHGWu5hFTDkWGufH/rb9S8Ay/l9GigndY=; b=e
 jdvxv0p/K0BbFtJphiScuPKqILG28YNZY2tCQy2nA08FhsXmZSKo/G4NaelduxaLuRde0J84dpFGd
 DtUMIfpkfyFlduS0in5J1K++mc7HYbT2GmDhKeC0N8Kd8apEovTOHeMgmyUej74uJUFWZ7CoiAzg6
 J15yBAjmXrT1oiDo=;
Received: from mail-pl1-f207.google.com ([209.85.214.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qcvjx-0001Tm-Eq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Sep 2023 22:38:50 +0000
Received: by mail-pl1-f207.google.com with SMTP id
 d9443c01a7336-1bf56d92231so7778025ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Sep 2023 15:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780720; x=1694385520;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uvjNZ30LBEHGWu5hFTDkWGufH/rb9S8Ay/l9GigndY=;
 b=D5sYe/5tbs3q1xoesKLzk0q9ZZbbiHfa36ueyvqtNUeW6ktxiqGHUalu3PAoKCdCwb
 cPXav9HqTUWv6u7g8bFmzqepEcPAqDs8SmPVzU7zJB3ftM2whc2CsQLey3mC3ugfCFlr
 R4HjbC4usNvPIU6hY/MvFRlhtPKFaXLUSRo8xTqg01oqO5AhMi7kNhewqrtfVIN9A0lP
 wti+n/GdllB4Bzv46LKmRO+Q4aNA/Yq2RcaEArVN/BAwPQLbfDcIGX2gO4U+G/IJOgkc
 GufGARVxH7nGWlPke7ol/1+opcCwEl5hh/pXnVKRLMZu28jgT78HQrajLJq08jGdnlgC
 rLrw==
X-Gm-Message-State: AOJu0YwDvYx0Fb4upuypxIyTkXkEss26s6sDQtioFF+IrwOKmD8Cme74
 m1MQsjREMuAr3Ft3QggTyq4gjZ62h6sishsAGvmscHawNmZK
X-Google-Smtp-Source: AGHT+IEXT2qrOqWzU6OZ8OLjQpbiKOTHuAbsdErDcr6GxN7nF7gabr/2juLru+7RCP9ARrdnz9DEVUrHMi9NILSo63+dEF/0gfHe
MIME-Version: 1.0
X-Received: by 2002:a63:3dc9:0:b0:564:1f95:71f1 with SMTP id
 k192-20020a633dc9000000b005641f9571f1mr1995310pga.3.1693780249419; Sun, 03
 Sep 2023 15:30:49 -0700 (PDT)
Date: Sun, 03 Sep 2023 15:30:49 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001825ce06047bf2a6@google.com>
From: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 terrelln@fb.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 6c1b980a7e79
 Merge tag 'dma-mapping-6.6-2023-08-29' of git.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=13a9669fa80000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.207 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.207 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qcvjx-0001Tm-Eq
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in super_lock
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

HEAD commit:    6c1b980a7e79 Merge tag 'dma-mapping-6.6-2023-08-29' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a9669fa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2212484c18930a61
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6e2281f5cb6b/disk-6c1b980a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5fc2481dcded/vmlinux-6c1b980a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/283bb76567da/bzImage-6c1b980a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.5.0-syzkaller-04808-g6c1b980a7e79 #0 Not tainted
------------------------------------------------------
syz-executor.4/22893 is trying to acquire lock:
ffff888039b740e0 (&type->s_umount_key#25){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
ffff888039b740e0 (&type->s_umount_key#25){++++}-{3:3}, at: super_lock+0x23c/0x380 fs/super.c:117

but task is already holding lock:
ffff88801e60ba88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:368 [inline]
ffff88801e60ba88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x14e9/0x1ce0 block/ioctl.c:500

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&bdev->bd_holder_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x181/0x1340 kernel/locking/mutex.c:747
       bdev_mark_dead+0x25/0x230 block/bdev.c:961
       disk_force_media_change+0x51/0x80 block/disk-events.c:303
       __loop_clr_fd+0x3ab/0x8f0 drivers/block/loop.c:1174
       lo_release+0x188/0x1c0 drivers/block/loop.c:1743
       blkdev_put_whole+0xa5/0xe0 block/bdev.c:663
       blkdev_put+0x40f/0x8e0 block/bdev.c:898
       kill_block_super+0x58/0x70 fs/super.c:1623
       kill_f2fs_super+0x2b7/0x3d0 fs/f2fs/super.c:4879
       deactivate_locked_super+0x9a/0x170 fs/super.c:481
       deactivate_super+0xde/0x100 fs/super.c:514
       cleanup_mnt+0x222/0x3d0 fs/namespace.c:1254
       task_work_run+0x14d/0x240 kernel/task_work.c:179
       resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
       exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204
       __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
       syscall_exit_to_user_mode+0x1d/0x60 kernel/entry/common.c:296
       do_syscall_64+0x44/0xb0 arch/x86/entry/common.c:86
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&disk->open_mutex){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x181/0x1340 kernel/locking/mutex.c:747
       blkdev_get_by_dev.part.0+0x4f0/0xb20 block/bdev.c:786
       blkdev_get_by_dev+0x75/0x80 block/bdev.c:829
       journal_init_dev fs/reiserfs/journal.c:2626 [inline]
       journal_init+0xbb8/0x64b0 fs/reiserfs/journal.c:2786
       reiserfs_fill_super+0xcc6/0x3150 fs/reiserfs/super.c:2022
       mount_bdev+0x1f3/0x2e0 fs/super.c:1603
       legacy_get_tree+0x109/0x220 fs/fs_context.c:638
       vfs_get_tree+0x8c/0x370 fs/super.c:1724
       do_new_mount fs/namespace.c:3335 [inline]
       path_mount+0x1492/0x1ed0 fs/namespace.c:3662
       do_mount fs/namespace.c:3675 [inline]
       __do_sys_mount fs/namespace.c:3884 [inline]
       __se_sys_mount fs/namespace.c:3861 [inline]
       __x64_sys_mount+0x293/0x310 fs/namespace.c:3861
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&type->s_umount_key#25){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3868 [inline]
       __lock_acquire+0x2e3d/0x5de0 kernel/locking/lockdep.c:5136
       lock_acquire kernel/locking/lockdep.c:5753 [inline]
       lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5718
       down_read+0x9c/0x470 kernel/locking/rwsem.c:1520
       __super_lock fs/super.c:58 [inline]
       super_lock+0x23c/0x380 fs/super.c:117
       super_lock_shared fs/super.c:146 [inline]
       super_lock_shared_active fs/super.c:1387 [inline]
       fs_bdev_sync+0x94/0x1b0 fs/super.c:1422
       blkdev_flushbuf block/ioctl.c:370 [inline]
       blkdev_common_ioctl+0x1550/0x1ce0 block/ioctl.c:500
       blkdev_ioctl+0x249/0x770 block/ioctl.c:622
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:871 [inline]
       __se_sys_ioctl fs/ioctl.c:857 [inline]
       __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

Chain exists of:
  &type->s_umount_key#25 --> &disk->open_mutex --> &bdev->bd_holder_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&bdev->bd_holder_lock);
                               lock(&disk->open_mutex);
                               lock(&bdev->bd_holder_lock);
  rlock(&type->s_umount_key#25);

 *** DEADLOCK ***

1 lock held by syz-executor.4/22893:
 #0: ffff88801e60ba88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:368 [inline]
 #0: ffff88801e60ba88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x14e9/0x1ce0 block/ioctl.c:500

stack backtrace:
CPU: 1 PID: 22893 Comm: syz-executor.4 Not tainted 6.5.0-syzkaller-04808-g6c1b980a7e79 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 check_noncircular+0x311/0x3f0 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3868 [inline]
 __lock_acquire+0x2e3d/0x5de0 kernel/locking/lockdep.c:5136
 lock_acquire kernel/locking/lockdep.c:5753 [inline]
 lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5718
 down_read+0x9c/0x470 kernel/locking/rwsem.c:1520
 __super_lock fs/super.c:58 [inline]
 super_lock+0x23c/0x380 fs/super.c:117
 super_lock_shared fs/super.c:146 [inline]
 super_lock_shared_active fs/super.c:1387 [inline]
 fs_bdev_sync+0x94/0x1b0 fs/super.c:1422
 blkdev_flushbuf block/ioctl.c:370 [inline]
 blkdev_common_ioctl+0x1550/0x1ce0 block/ioctl.c:500
 blkdev_ioctl+0x249/0x770 block/ioctl.c:622
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f6f9f67cae9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6fa03670c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6f9f79bf80 RCX: 00007f6f9f67cae9
RDX: ffffffffffffffff RSI: 0000000000001261 RDI: 0000000000000003
RBP: 00007f6f9f6c847a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f6f9f79bf80 R15: 00007ffc6e219ec8
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
