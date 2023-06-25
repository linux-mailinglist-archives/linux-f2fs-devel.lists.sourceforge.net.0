Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274373D2C7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 19:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDToH-0003e1-Dd;
	Sun, 25 Jun 2023 17:46:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3S32YZAkbANIGMN8y992FyDD61.4CC492IG2F0CBH2BH.0CA@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qDToF-0003dg-Ca for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 17:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nMnS8yteeq908fCMk+lnJPrDlGNebwY4YZGBzDeFebs=; b=EzVo9o9q5d9+UmdvyT+IUFd2r5
 42bUG2xnBANCggDhRqYjSihfklE+/kUGFDTA8XSzWLOODyqpRArT4xAx8dXFKBYkp5HstV98JCkRd
 5J9cfvINJQ+Yde9TZhVss1bI7zkZGBqNKvw0rJSBmlWDpSfNHtXjB9XmxpSC31Rng6SQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nMnS8yteeq908fCMk+lnJPrDlGNebwY4YZGBzDeFebs=; b=J
 N/lpSn7yq/LnrczIT0ZOZluaQmx4epAFQf+GfFDlYKThLc9faeMD5Scv1JRA9/YWIf43EWmWKrCUp
 Z84+kVYqZlg+/yAmMVmqVGFa0ZY0Mlv0zSrbAdMVQIFTULizwMe2pr7FZJYb7BOJEYDkqhXnymGar
 fHMQZGJj4npEgnR0=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qDToC-00EEsN-Mh for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 17:46:00 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-345ac144755so96155ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jun 2023 10:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687715148; x=1690307148;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nMnS8yteeq908fCMk+lnJPrDlGNebwY4YZGBzDeFebs=;
 b=ltVvn6/zjvymWYq44DIPreX9i44IT5Dwwcvm7Wy+EGDfg6b8GiEQ6pr2nGpAQPe24U
 56bt+ufl4CTCUc8YluzgT529AlCe91FpnaF/OVR8KiwlAe0SbPy+QMgpPqCZkleim8M5
 PA3pXImwdFSFa+tpQgd9GDmNvUURtUpLbY8XFU0OJmY0oI9/UUKXMgAGkCYjieLRay1x
 /uBaRjgoSr+hk2aWKOPNn3FXXPQjm8JDV3d3ETj2VGpUjTIij1psFuTxcvEu4w9uc1yN
 8Vc5FgJPo/zmUbfGZc8CAQSJtpiBgvqaHggERxhpHs14Lb7ZQPJfbHSrZiKAhcgwl7jC
 w4cg==
X-Gm-Message-State: AC+VfDyjWpw9BL6S9BNIEyWIvqy323FUkoB2UdvIkzysZ9+/yyXObsRi
 ql9HYfXF8blwtgI02KZEbYCZefkrf1e6482j9jnEiP1MkPPd
X-Google-Smtp-Source: ACHHUZ7meTc6+Z+5poB65do2Ielys1kCaWw4bc2j1x7NcxiHnCpOClMs2a8om3mzT5+pT5aWWSWVhdcq3n7MnESuzK/B67HFQxgl
MIME-Version: 1.0
X-Received: by 2002:a92:d350:0:b0:345:a49a:32d7 with SMTP id
 a16-20020a92d350000000b00345a49a32d7mr608409ilh.5.1687715147862; Sun, 25 Jun
 2023 10:45:47 -0700 (PDT)
Date: Sun, 25 Jun 2023 10:45:47 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ded70105fef7cd35@google.com>
From: syzbot <syzbot+dd6352699b8027673b35@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 15e71592dbae
 Add linux-next specific files for 20230621 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=101c827b280000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qDToC-00EEsN-Mh
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_fiemap
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

HEAD commit:    15e71592dbae Add linux-next specific files for 20230621
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=101c827b280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b4e51841f618f374
dashboard link: https://syzkaller.appspot.com/bug?extid=dd6352699b8027673b35
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6b6464ef4887/disk-15e71592.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/81eba5775318/vmlinux-15e71592.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bc7983587629/bzImage-15e71592.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd6352699b8027673b35@syzkaller.appspotmail.com

loop4: detected capacity change from 0 to 40427
F2FS-fs (loop4): Found nat_bits in checkpoint
F2FS-fs (loop4): Mounted with checkpoint version = 48b305e5
======================================================
WARNING: possible circular locking dependency detected
6.4.0-rc7-next-20230621-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor.4/7658 is trying to acquire lock:
ffff888012869e20 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0xb2/0x190 mm/memory.c:5716

but task is already holding lock:
ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:771 [inline]
ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: f2fs_fiemap+0x1e3/0x1670 fs/f2fs/data.c:1998

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}:
       down_write+0x92/0x200 kernel/locking/rwsem.c:1573
       inode_lock include/linux/fs.h:771 [inline]
       f2fs_file_mmap+0x154/0x290 fs/f2fs/file.c:527
       call_mmap include/linux/fs.h:1876 [inline]
       mmap_region+0x6cf/0x2570 mm/mmap.c:2669
       do_mmap+0x850/0xee0 mm/mmap.c:1373
       vm_mmap_pgoff+0x1a2/0x3b0 mm/util.c:543
       ksys_mmap_pgoff+0x42b/0x5b0 mm/mmap.c:1419
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3142 [inline]
       check_prevs_add kernel/locking/lockdep.c:3261 [inline]
       validate_chain kernel/locking/lockdep.c:3876 [inline]
       __lock_acquire+0x2e9d/0x5e20 kernel/locking/lockdep.c:5144
       lock_acquire.part.0+0x11c/0x370 kernel/locking/lockdep.c:5761
       __might_fault mm/memory.c:5717 [inline]
       __might_fault+0x115/0x190 mm/memory.c:5710
       _copy_to_user+0x2b/0xc0 lib/usercopy.c:36
       copy_to_user include/linux/uaccess.h:191 [inline]
       fiemap_fill_next_extent+0x217/0x370 fs/ioctl.c:144
       f2fs_fiemap+0x5a5/0x1670 fs/f2fs/data.c:2066
       ioctl_fiemap fs/ioctl.c:219 [inline]
       do_vfs_ioctl+0x478/0x16c0 fs/ioctl.c:810
       __do_sys_ioctl fs/ioctl.c:868 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __x64_sys_ioctl+0x10c/0x210 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#23);
                               lock(&mm->mmap_lock);
                               lock(&sb->s_type->i_mutex_key#23);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz-executor.4/7658:
 #0: ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:771 [inline]
 #0: ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: f2fs_fiemap+0x1e3/0x1670 fs/f2fs/data.c:1998

stack backtrace:
CPU: 1 PID: 7658 Comm: syz-executor.4 Not tainted 6.4.0-rc7-next-20230621-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 check_noncircular+0x2df/0x3b0 kernel/locking/lockdep.c:2195
 check_prev_add kernel/locking/lockdep.c:3142 [inline]
 check_prevs_add kernel/locking/lockdep.c:3261 [inline]
 validate_chain kernel/locking/lockdep.c:3876 [inline]
 __lock_acquire+0x2e9d/0x5e20 kernel/locking/lockdep.c:5144
 lock_acquire.part.0+0x11c/0x370 kernel/locking/lockdep.c:5761
 __might_fault mm/memory.c:5717 [inline]
 __might_fault+0x115/0x190 mm/memory.c:5710
 _copy_to_user+0x2b/0xc0 lib/usercopy.c:36
 copy_to_user include/linux/uaccess.h:191 [inline]
 fiemap_fill_next_extent+0x217/0x370 fs/ioctl.c:144
 f2fs_fiemap+0x5a5/0x1670 fs/f2fs/data.c:2066
 ioctl_fiemap fs/ioctl.c:219 [inline]
 do_vfs_ioctl+0x478/0x16c0 fs/ioctl.c:810
 __do_sys_ioctl fs/ioctl.c:868 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x10c/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f3f8028c389
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3f81084168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f3f803abf80 RCX: 00007f3f8028c389
RDX: 00000000200000c0 RSI: 00000000c020660b RDI: 0000000000000004
RBP: 00007f3f802d7493 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffe04349abf R14: 00007f3f81084300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to change bug's subsystems, reply with:
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
