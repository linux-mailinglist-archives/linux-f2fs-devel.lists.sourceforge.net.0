Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96C7A78D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 12:14:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiuDr-0001cR-8P;
	Wed, 20 Sep 2023 10:14:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <30bcKZQkbAJoMSTE4FF8L4JJC7.AIIAF8OM8L6IHN8HN.6IG@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qiuDb-0001cG-Il for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 10:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MYc13qqB3tD/OD1Pa2Ke0nB1FsDzfJe/sKki19kiKtg=; b=T5QR3FnQlYuK2d66GcePZdQAbp
 3zMQzs1vpXRYAknkqooTC+NxkUlz9nB2CG5DhEyBN47L3xL/6X2GB1pN+QKPn/ZtudrY8G5UrAuLT
 hhUKiFAkWUOvizOWL3alSPBvsL2YCYf6SUVPSYw6QqEUMv3xF2R1MyoJptlOC7rNLebY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MYc13qqB3tD/OD1Pa2Ke0nB1FsDzfJe/sKki19kiKtg=; b=Z
 aOjiyPSlmxXWNL392xdl33QP4f4ykgOgXxqMrJn5vRH7W4j/fHf9IuMi/atrYw+12KPTBwvkgJ9w1
 1AixVWd4/6z3VQhEvTRKuIgyNUhHjIojkjhXhwfdbVZS3gRspTaziSqYft8y7F6E/6uBL+tExX1j5
 xiTll71RU+3PKh3Q=;
Received: from mail-ot1-f79.google.com ([209.85.210.79])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qiuDb-00GUvj-3t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 10:14:04 +0000
Received: by mail-ot1-f79.google.com with SMTP id
 46e09a7af769-6b9efedaeebso8636291a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 03:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695204836; x=1695809636;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MYc13qqB3tD/OD1Pa2Ke0nB1FsDzfJe/sKki19kiKtg=;
 b=wq89kPkqOjZ+jGYDzw7EpqfmDBQAQBPwiW37LVC80WG9a9LTNon3hX9hC9RQaof+oh
 sT18y0BvL6qF/WrfBmECI4Xkl/6bTrqxy3e0LFOyAa5Y3YQ590+0npfges4p/bFKl0cG
 UPWvWtsyg/psqDhcoft12TNW1axz0zzaGIEKrmSAcSZMzxF6yWlmcK/uPQH6kNjUZbny
 kNn07pOOZ/ZurSe2sRh5KbENZW3Ib572P3Y/bc9jYAQSfMJ2L1QdguBa21uLguymKt7W
 ncWQWG6hjzWHIKDxI1SCTvyYPHEU4sI2Izkr5vooTlSJs+o0A7ukDhLvj2/wWAqEcyQ9
 YjXg==
X-Gm-Message-State: AOJu0Yy/wlORmlabiu5eZdGnNheo3gZuCEcEmFjptzu3ggBqSVeT6Q6Z
 ULyx8WP4ctNWgBUltXfp3nq1r/ftFQiQPkKVrjoGqE/PWxYj
X-Google-Smtp-Source: AGHT+IGnkRhf0BB9462sdDksqrJicJYdtvgm2CIVnM8QjWR6Wkj/FJpakV3zZ7L/kcGFhxuufUaSK6koGHxGcA7gyUtLv6/AybI1
MIME-Version: 1.0
X-Received: by 2002:a05:6870:954c:b0:1dc:27f6:b866 with SMTP id
 v12-20020a056870954c00b001dc27f6b866mr846903oal.1.1695201233864; Wed, 20 Sep
 2023 02:13:53 -0700 (PDT)
Date: Wed, 20 Sep 2023 02:13:53 -0700
In-Reply-To: <0000000000001825ce06047bf2a6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005e0f2b0605c6cb3e@google.com>
From: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
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
 HEAD commit: 2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=12780282680000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.79 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.79 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qiuDb-00GUvj-3t
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

HEAD commit:    2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12780282680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f48f4ed701b8/disk-2cf0f715.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5b8491e29a2d/vmlinux-2cf0f715.xz
kernel image: https://storage.googleapis.com/syzbot-assets/90faa04d6558/bzImage-2cf0f715.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c98194587df7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.6.0-rc2-syzkaller-00018-g2cf0f7156238 #0 Not tainted
------------------------------------------------------
syz-executor.0/8792 is trying to acquire lock:
ffff88807993a0e0 (&type->s_umount_key#25){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
ffff88807993a0e0 (&type->s_umount_key#25){++++}-{3:3}, at: super_lock+0x23c/0x380 fs/super.c:117

but task is already holding lock:
ffff888148439388 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:370 [inline]
ffff888148439388 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x14e9/0x1ce0 block/ioctl.c:502

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
       kill_block_super+0x58/0x70 fs/super.c:1649
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
       mount_bdev+0x1f3/0x2e0 fs/super.c:1629
       legacy_get_tree+0x109/0x220 fs/fs_context.c:638
       vfs_get_tree+0x8c/0x370 fs/super.c:1750
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
       super_lock_shared_active fs/super.c:1431 [inline]
       fs_bdev_sync+0x94/0x1b0 fs/super.c:1466
       blkdev_flushbuf block/ioctl.c:372 [inline]
       blkdev_common_ioctl+0x1550/0x1ce0 block/ioctl.c:502
       blkdev_ioctl+0x249/0x770 block/ioctl.c:624
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

1 lock held by syz-executor.0/8792:
 #0: ffff888148439388 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_flushbuf block/ioctl.c:370 [inline]
 #0: ffff888148439388 (&bdev->bd_holder_lock){+.+.}-{3:3}, at: blkdev_common_ioctl+0x14e9/0x1ce0 block/ioctl.c:502

stack backtrace:
CPU: 0 PID: 8792 Comm: syz-executor.0 Not tainted 6.6.0-rc2-syzkaller-00018-g2cf0f7156238 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
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
 super_lock_shared_active fs/super.c:1431 [inline]
 fs_bdev_sync+0x94/0x1b0 fs/super.c:1466
 blkdev_flushbuf block/ioctl.c:372 [inline]
 blkdev_common_ioctl+0x1550/0x1ce0 block/ioctl.c:502
 blkdev_ioctl+0x249/0x770 block/ioctl.c:624
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f18ae67cae9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f18af4830c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f18ae79bf80 RCX: 00007f18ae67cae9
RDX: 0000000000000003 RSI: 0000000000001261 RDI: 0000000000000003
RBP: 00007f18ae6c847a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f18ae79bf80 R15: 00007ffc4185a478
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
