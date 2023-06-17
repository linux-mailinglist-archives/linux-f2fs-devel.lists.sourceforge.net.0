Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AF9733FD0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jun 2023 11:01:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qARo3-0005aa-2c;
	Sat, 17 Jun 2023 09:01:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3U3aNZAkbAKASYZKALLERAPPID.GOOGLEUSERCONTENT.COM@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qARo1-0005aT-Fc for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Jun 2023 09:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCZf97Eox4u67Klmj8lmXvnCId2RnzbotAfmTDKMiNg=; b=l9MQviqYU92rh+yiM59UxEoPkc
 vUBhVsrUIlOhW6AdYB0UMcAxtgH8m7IlhMqbzLcRcZTL63sfqkS6rxGs1z4gw69shGLWgBlqqVSqi
 1n1VLAuH2h9qh1Ssq2zzWuvDTiEf6app+8v6SEf12w10/qRASjYiqkJfNVLvA/FlF788=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kCZf97Eox4u67Klmj8lmXvnCId2RnzbotAfmTDKMiNg=; b=g
 jyUboS2PundKs7pmW7kdprNpL7SCLRZnw2ZjuSC3U1QPGU4Ebh9Aaf7uKQLCs2LknzfVkpotpaZfA
 HzQRdSflVIXxu+taP1b041Ux8zBAhb7SeUhx4SQEdhna9/3j3BHQ0EDYWJH0UyvaPrdChoPJ9XxEb
 1CA73CuuwR6eHRlM=;
Received: from mail-io1-f78.google.com ([209.85.166.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qARo1-006k34-2W for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Jun 2023 09:01:13 +0000
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-77ac4aa24eeso150125339f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 17 Jun 2023 02:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686992467; x=1689584467;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kCZf97Eox4u67Klmj8lmXvnCId2RnzbotAfmTDKMiNg=;
 b=faAf72mpDQxY8jLvFaUmcEJXg5PxJtt8+OXX3Aej2eC6rfGGoxOKu2Ml//HkWEz+gl
 5UGh7/6VCYPQYBMfjGFgAWc/NFg/8Sm3Cv6sKExCflsBvDRhub3dF1+8QYQRMgtyaZ/V
 +ve7EqtHF/tdqO+63WePnq6e1S5FwPLr0mB4JX9ymKRUZGlmiKeM0DlB5+jIJ556eGLg
 xHXgVjTKfKL2t8W3Jb+rps6fHo7RuspIj/H8qoCpN/oBM6fD0dXPI/fTESFUlT3UKorq
 BAoKopuPpCIdTmFIzrfxXlbTbg0qG4Nokv4uK7AqjnAO4Pm0xNFUv5vu4ciVa8tUsSYf
 Ivag==
X-Gm-Message-State: AC+VfDwSNl0U21yCgTDg4yvRVFfwN861+OD/nDmZ04V6VLWGNkmcMQ1u
 ysSF9jlNnwQF/4PuouPEhBdXNWRFA7/zdHVSm7YafqinwQSc
X-Google-Smtp-Source: ACHHUZ7cft+FCmnH2pEaVea26oLExDWClBt0nq4LlTvkudLqcfpayVBixd6cQrP8GJx3Xh/TEnyWRwL+ojZSl47nFVcoJ39KXwiF
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:790:b0:335:ba2a:c3d with SMTP id
 q16-20020a056e02079000b00335ba2a0c3dmr1097467ils.5.1686992467471; Sat, 17 Jun
 2023 02:01:07 -0700 (PDT)
Date: Sat, 17 Jun 2023 02:01:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3329c05fe4f8aa0@google.com>
From: syzbot <syzbot+c0e3db4f9cd6e05cadd3@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: b16049b21162
 Add linux-next specific files for 20230614 git tree: linux-next
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=134b968d280000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.78 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.78 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qARo1-006k34-2W
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_file_mmap
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

HEAD commit:    b16049b21162 Add linux-next specific files for 20230614
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=134b968d280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d103d5f9125e9fe9
dashboard link: https://syzkaller.appspot.com/bug?extid=c0e3db4f9cd6e05cadd3
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1620a663280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1327629b280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a21dda01fc71/disk-b16049b2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f31e3fc32b7a/vmlinux-b16049b2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3967bcf93010/bzImage-b16049b2.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/8deff423ac75/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c0e3db4f9cd6e05cadd3@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.4.0-rc6-next-20230614-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor407/5033 is trying to acquire lock:
ffff888076c40a28 (&sb->s_type->i_mutex_key#15){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:768 [inline]
ffff888076c40a28 (&sb->s_type->i_mutex_key#15){+.+.}-{3:3}, at: f2fs_file_mmap+0x154/0x290 fs/f2fs/file.c:527

but task is already holding lock:
ffff8880787d3768 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:110 [inline]
ffff8880787d3768 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x158/0x3b0 mm/util.c:541

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&mm->mmap_lock){++++}-{3:3}:
       down_read+0x9c/0x480 kernel/locking/rwsem.c:1520
       mmap_read_lock include/linux/mmap_lock.h:142 [inline]
       do_user_addr_fault+0xb3d/0x1210 arch/x86/mm/fault.c:1391
       handle_page_fault arch/x86/mm/fault.c:1534 [inline]
       exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1590
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
       fault_in_readable+0x129/0x210 mm/gup.c:1928
       fault_in_iov_iter_readable+0x252/0x2c0 lib/iov_iter.c:216
       f2fs_preallocate_blocks fs/f2fs/file.c:4508 [inline]
       f2fs_file_write_iter+0x516/0x2500 fs/f2fs/file.c:4744
       call_write_iter include/linux/fs.h:1865 [inline]
       new_sync_write fs/read_write.c:491 [inline]
       vfs_write+0x960/0xd70 fs/read_write.c:584
       ksys_write+0x122/0x250 fs/read_write.c:637
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&sb->s_type->i_mutex_key#15){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3142 [inline]
       check_prevs_add kernel/locking/lockdep.c:3261 [inline]
       validate_chain kernel/locking/lockdep.c:3876 [inline]
       __lock_acquire+0x2e9d/0x5e20 kernel/locking/lockdep.c:5144
       lock_acquire.part.0+0x11c/0x370 kernel/locking/lockdep.c:5761
       down_write+0x92/0x200 kernel/locking/rwsem.c:1573
       inode_lock include/linux/fs.h:768 [inline]
       f2fs_file_mmap+0x154/0x290 fs/f2fs/file.c:527
       call_mmap include/linux/fs.h:1870 [inline]
       mmap_region+0x99c/0x2770 mm/mmap.c:2675
       do_mmap+0x850/0xee0 mm/mmap.c:1367
       vm_mmap_pgoff+0x1a2/0x3b0 mm/util.c:543
       ksys_mmap_pgoff+0x42b/0x5b0 mm/mmap.c:1413
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mm->mmap_lock);
                               lock(&sb->s_type->i_mutex_key#15);
                               lock(&mm->mmap_lock);
  lock(&sb->s_type->i_mutex_key#15);

 *** DEADLOCK ***

1 lock held by syz-executor407/5033:
 #0: ffff8880787d3768 (&mm->mmap_lock){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:110 [inline]
 #0: ffff8880787d3768 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x158/0x3b0 mm/util.c:541

stack backtrace:
CPU: 1 PID: 5033 Comm: syz-executor407 Not tainted 6.4.0-rc6-next-20230614-syzkaller #0
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
 down_write+0x92/0x200 kernel/locking/rwsem.c:1573
 inode_lock include/linux/fs.h:768 [inline]
 f2fs_file_mmap+0x154/0x290 fs/f2fs/file.c:527
 call_mmap include/linux/fs.h:1870 [inline]
 mmap_region+0x99c/0x2770 mm/mmap.c:2675
 do_mmap+0x850/0xee0 mm/mmap.c:1367
 vm_mmap_pgoff+0x1a2/0x3b0 mm/util.c:543
 ksys_mmap_pgoff+0x42b/0x5b0 mm/mmap.c:1413
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f5f44cdf4d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5f3dc292f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007f5f44d696f8 RCX: 00007f5f44cdf4d9
RDX: 000000000000000b RSI: 0000000000b36000 RDI: 0000000020000000
RBP: 00007f5f44d696f0 R08: 0000000000000004 R09: 0000000000000000
R10: 0000000000028011 R11: 0000000000000246 R12: 00007f5f44d696fc
R13: 656d6974797a616c R14: 746e657478656f6e R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
