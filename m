Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F757BCF0A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Oct 2023 17:15:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qpVV1-00025k-Ix;
	Sun, 08 Oct 2023 15:15:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3bsciZQkbALcpvwhXiiboXmmfa.dlldibrpboZlkqbkq.Zlj@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qpVUm-00025b-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Oct 2023 15:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2DHDDUtctSCqtMBQ2VyhSBX6FAyheiTLePTjZGIw1w=; b=haoH2kffwdgOnmBYS4B6aRN9jM
 sxJ28ms/LToWDYJFXnDvLgxnREtGAJs6597sLNMnoYUrdP8kp0oOLO5bkGYDuBmE4CZq71ICsJwvy
 5Zfur66YGbvfHTr51jjk/SJaXOGEgEEt91J4JtFqjwRxsfLniD96htItqZFKYsWSQnl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M2DHDDUtctSCqtMBQ2VyhSBX6FAyheiTLePTjZGIw1w=; b=l
 Ow3S51nqL+vkYsehwiE0sGc9Zy8FIFxrwLiS7xWF6omMm8zn36Z95PrkxYLA3bCy5sEnDQJKmDcTk
 RRN/n14GgXMxt4XFGrFpKKB6uV5cYOGPw0YJdLiwKgNDwrtrcb3XYrdj+dHrIP8oD8COfYOEcdQU1
 9jvItrnMDg8mNULI=;
Received: from mail-oi1-f208.google.com ([209.85.167.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qpVUi-0000Cl-BO for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Oct 2023 15:15:02 +0000
Received: by mail-oi1-f208.google.com with SMTP id
 5614622812f47-3af5fca6527so6216835b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Oct 2023 08:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696778095; x=1697382895;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2DHDDUtctSCqtMBQ2VyhSBX6FAyheiTLePTjZGIw1w=;
 b=LW0qN7ruzbZ5Z1UXaezCxa6CxHrPZBf8MKyirfbJFgwvp1Wj9CIrLbd8XT00M6L9jr
 ScI3kzbCUdvpL5qn6T+Gb5msdSs5u8P3+5YyRxWNLf7i8BLG8ARGKna+JT+4G4+rO/K/
 fy8Jlm5ySBFwYKI3GeCllSafK1eJIEJE1YE4A1nOeiKN5StRhZIWPv6MLDDCEohVppy7
 FgB2EsqC7Yeroo1qheAtz1Y8yTYPINrXeB7G5BXQyYPH9wwXvnovbuXFLjbJnWKbH5WK
 yLj/fzIdVWlUrQP04VwltYIkAQYFIMeLFpnieRTIZsOn/rE0ypVdGp/xaf2w7g133H8L
 6QDw==
X-Gm-Message-State: AOJu0Yz8zWzq8ynIY1xZfCn4a2cmnT8cP31ASuNDBBVPYitoCeT3QHCP
 d0LoOD7OFxE2PEZorlqO1QRqVjYuqx/JWykalMumnOpZzljU
X-Google-Smtp-Source: AGHT+IHE8AI0usO+B36Eq4atL4szUnnGaud+yd+4gTI/lyVZ+p5zavEblfDupESWFZtTFtrjfh+vR+1OnvMb/LoVkqBWd8HeU7hu
MIME-Version: 1.0
X-Received: by 2002:a05:6808:201c:b0:3a7:7e66:2197 with SMTP id
 q28-20020a056808201c00b003a77e662197mr6743245oiw.2.1696778094870; Sun, 08 Oct
 2023 08:14:54 -0700 (PDT)
Date: Sun, 08 Oct 2023 08:14:54 -0700
In-Reply-To: <0000000000001825ce06047bf2a6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009b8520060735ef76@google.com>
From: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To: chao@kernel.org, hdanton@sina.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 19af4a4ed414 Merge branch 'for-next/core', remote-tracking..
 git tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.208 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.208 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1qpVUi-0000Cl-BO
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] possible deadlock in super_lock
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    19af4a4ed414 Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1627a911680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=80eedef55cd21fa4
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13deb1c9680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1006a759680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/702d996331e0/disk-19af4a4e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2a48ce0aeb32/vmlinux-19af4a4e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/332eb4a803d2/Image-19af4a4e.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/97d89134ed25/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.6.0-rc4-syzkaller-g19af4a4ed414 #0 Not tainted
------------------------------------------------------
syz-executor254/6025 is trying to acquire lock:
ffff0000db54a0e0 (&type->s_umount_key#25){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
ffff0000db54a0e0 (&type->s_umount_key#25){++++}-{3:3}, at: super_lock+0x160/0x328 fs/super.c:117

but task is already holding lock:
ffff0000c1540c88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:370 [inline]
ffff0000c1540c88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x7fc/0x2884 block/ioctl.c:502

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&bdev->bd_holder_lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:799
       bd_finish_claiming+0x218/0x3dc block/bdev.c:566
       blkdev_get_by_dev+0x3f4/0x55c block/bdev.c:799
       setup_bdev_super+0x68/0x51c fs/super.c:1484
       mount_bdev+0x1a0/0x2b4 fs/super.c:1626
       get_super_block+0x44/0x58 fs/reiserfs/super.c:2601
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:638
       vfs_get_tree+0x90/0x288 fs/super.c:1750
       do_new_mount+0x25c/0x8c8 fs/namespace.c:3335
       path_mount+0x590/0xe04 fs/namespace.c:3662
       init_mount+0xe4/0x144 fs/init.c:25
       do_mount_root+0x104/0x3e4 init/do_mounts.c:166
       mount_root_generic+0x1f0/0x594 init/do_mounts.c:205
       mount_block_root+0x6c/0x7c init/do_mounts.c:378
       mount_root+0xb4/0xe4 init/do_mounts.c:405
       prepare_namespace+0xdc/0x11c init/do_mounts.c:489
       kernel_init_freeable+0x35c/0x474 init/main.c:1560
       kernel_init+0x24/0x29c init/main.c:1437
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:857

-> #2 (bdev_lock
){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:799
       bd_finish_claiming+0x84/0x3dc block/bdev.c:557
       blkdev_get_by_dev+0x3f4/0x55c block/bdev.c:799
       setup_bdev_super+0x68/0x51c fs/super.c:1484
       mount_bdev+0x1a0/0x2b4 fs/super.c:1626
       get_super_block+0x44/0x58 fs/reiserfs/super.c:2601
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:638
       vfs_get_tree+0x90/0x288 fs/super.c:1750
       do_new_mount+0x25c/0x8c8 fs/namespace.c:3335
       path_mount+0x590/0xe04 fs/namespace.c:3662
       init_mount+0xe4/0x144 fs/init.c:25
       do_mount_root+0x104/0x3e4 init/do_mounts.c:166
       mount_root_generic+0x1f0/0x594 init/do_mounts.c:205
       mount_block_root+0x6c/0x7c init/do_mounts.c:378
       mount_root+0xb4/0xe4 init/do_mounts.c:405
       prepare_namespace+0xdc/0x11c init/do_mounts.c:489
       kernel_init_freeable+0x35c/0x474 init/main.c:1560
       kernel_init+0x24/0x29c init/main.c:1437
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:857

-> #1 (&disk->open_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:799
       blkdev_get_by_dev+0x114/0x55c block/bdev.c:786
       journal_init_dev fs/reiserfs/journal.c:2626 [inline]
       journal_init+0xa60/0x1e44 fs/reiserfs/journal.c:2786
       reiserfs_fill_super+0xd50/0x2028 fs/reiserfs/super.c:2022
       mount_bdev+0x1e8/0x2b4 fs/super.c:1629
       get_super_block+0x44/0x58 fs/reiserfs/super.c:2601
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:638
       vfs_get_tree+0x90/0x288 fs/super.c:1750
       do_new_mount+0x25c/0x8c8 fs/namespace.c:3335
       path_mount+0x590/0xe04 fs/namespace.c:3662
       do_mount fs/namespace.c:3675 [inline]
       __do_sys_mount fs/namespace.c:3884 [inline]
       __se_sys_mount fs/namespace.c:3861 [inline]
       __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3861
       __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
       el0_svc+0x58/0x16c arch/arm64/kernel/entry-common.c:678
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595

-> #0 (&type->s_umount_key#25){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3868 [inline]
       __lock_acquire+0x3370/0x75e8 kernel/locking/lockdep.c:5136
       lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5753
       down_read+0x58/0x2fc kernel/locking/rwsem.c:1520
       __super_lock fs/super.c:58 [inline]
       super_lock+0x160/0x328 fs/super.c:117
       super_lock_shared fs/super.c:146 [inline]
       super_lock_shared_active fs/super.c:1431 [inline]
       fs_bdev_sync+0xa4/0x168 fs/super.c:1466
       blkdev_flushbuf block/ioctl.c:372 [inline]
       blkdev_common_ioctl+0x848/0x2884 block/ioctl.c:502
       blkdev_ioctl+0x35c/0xae4 block/ioctl.c:624
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:871 [inline]
       __se_sys_ioctl fs/ioctl.c:857 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
       __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
       el0_svc+0x58/0x16c arch/arm64/kernel/entry-common.c:678
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595

other info that might help us debug this:

Chain exists of:
  &type->s_umount_key#25 --> bdev_lock --> &bdev->bd_holder_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&bdev->bd_holder_lock);
                               lock(bdev_lock);
                               lock(&bdev->bd_holder_lock);
  rlock(&type->s_umount_key#25);

 *** DEADLOCK ***

1 lock held by syz-executor254/6025:
 #0: ffff0000c1540c88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:370 [inline]
 #0: ffff0000c1540c88 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x7fc/0x2884 block/ioctl.c:502

stack backtrace:
CPU: 0 PID: 6025 Comm: syz-executor254 Not tainted 6.6.0-rc4-syzkaller-g19af4a4ed414 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
 show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3868 [inline]
 __lock_acquire+0x3370/0x75e8 kernel/locking/lockdep.c:5136
 lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5753
 down_read+0x58/0x2fc kernel/locking/rwsem.c:1520
 __super_lock fs/super.c:58 [inline]
 super_lock+0x160/0x328 fs/super.c:117
 super_lock_shared fs/super.c:146 [inline]
 super_lock_shared_active fs/super.c:1431 [inline]
 fs_bdev_sync+0xa4/0x168 fs/super.c:1466
 blkdev_flushbuf block/ioctl.c:372 [inline]
 blkdev_common_ioctl+0x848/0x2884 block/ioctl.c:502
 blkdev_ioctl+0x35c/0xae4 block/ioctl.c:624
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
 el0_svc+0x58/0x16c arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
