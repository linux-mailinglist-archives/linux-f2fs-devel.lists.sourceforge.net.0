Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F759711AE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 10:19:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snZcS-0008DP-U5;
	Mon, 09 Sep 2024 08:19:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3iK_eZgkbAJ8RXYJ9KKDQ9OOHC.FNNFKDTRDQBNMSDMS.BNL@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1snZcR-0008Cn-MF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 08:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9TK8D86o1H3VoOuFUaA0UFyWXWnfWkirvCcfMCQEsA=; b=mdEhRWmvv+yvjC6wfoHNJx3HtS
 e6ESKe3Qz5YURIgRo3MrnQIYltBvC6s10WKZFHpsYjrGjTaI/Xmnxk8nQ+yrqXXrS+xkCgrg3Qf/M
 NCAlgiTzbEiLyqouVVJfngxv/tN0MJMs4hb5ZcQeYB2ifku1tgrjM4nBajlVYdePvTv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q9TK8D86o1H3VoOuFUaA0UFyWXWnfWkirvCcfMCQEsA=; b=X
 GB+6vUEdKbhfWZDQ6mP1Tq2e/HOxId/YJxh2KSNwObc7NZnANkVkc6aclWw3Mv44VmNt7HAfxz4e8
 jo1VdxxY4lS2oCqGmb8JlBTfETnIdlIwuZ3CSV0j53ceMeaEML57sNnULfjlC75wzVaqJ3yxfENeY
 oWxrX8BwuL0zu3uw=;
Received: from mail-io1-f79.google.com ([209.85.166.79])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snZcR-0007Is-JO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 08:19:32 +0000
Received: by mail-io1-f79.google.com with SMTP id
 ca18e2360f4ac-82cda24c462so194529539f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 01:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725869961; x=1726474761;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q9TK8D86o1H3VoOuFUaA0UFyWXWnfWkirvCcfMCQEsA=;
 b=jS+kIy2VQbufWG6ZEHoH6vdOH/Zdp3tcAMrl+oJYWaSaBXlqXoIb1dtI86/yBbwU4Y
 +xiT5DyI17RsmOXTDnEmqkqYCFIu3uI+PMdqcoKLWK71EG6NqVuR25vqXO6bElP0567J
 PoQAlnoXThvefC3yUj1xEsmSCkyRmHA6kp/nU7LO/5lkFH1g82pKL8OvCwbYcI3lq6aw
 2qSyoqTfSKoUnqKfypvNR99rF1FmiRnup7wmc6G+64BnlXIuX4/Xc/xv4gSJukxf5SUK
 KWdHeu+phAEEbQhYB0jmp2G7srkLQLcz2bmdfvEz+3fm3vn32JS33tXjLMEtW/FsfoBH
 +pKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTRD3SPglGeGlz2XLn6YPmp85kqOgX6467lNodEFLMUo02ChPGlkcGWTMBHI2zm027eULFMSWV7B4ts91UtGb5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7iG3LDEBsT+vnjiHlH2nw534ADXyR7lpXqUvnB63M14H/cBej
 no3BnQqWMLJKXPMP4QqPOW93osmgUd4xpmsTRWwtHN31rJQuH8qofu5fnWCaVT630ZrvPJfK/w0
 AvBDBwYyu1+ClrO8DEmZBZaGAA66fhoMn1fS87jtCWs3oiGtpEZsppbs=
X-Google-Smtp-Source: AGHT+IG7kEzqFgnOnAhum1TROlVcYzIW5NwHjb6aNcqMjh+PwlS6M0OWvm/FZXOWP19qz3UN84Uc9eHJZ5zxsHt0FmtFtWGSqKBf
MIME-Version: 1.0
X-Received: by 2002:a05:6602:154f:b0:82a:2385:74a6 with SMTP id
 ca18e2360f4ac-82a9618c4f3mr1287721039f.5.1725869960780; Mon, 09 Sep 2024
 01:19:20 -0700 (PDT)
Date: Mon, 09 Sep 2024 01:19:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0ee5b0621ab694b@google.com>
From: syzbot <syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 89f5e14d05b4
 Merge tag 'timers_urgent_for_v6.11_rc7' of gi.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=14085f29980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.79 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.79 listed in wl.mailspike.net]
X-Headers-End: 1snZcR-0007Is-JO
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg
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

HEAD commit:    89f5e14d05b4 Merge tag 'timers_urgent_for_v6.11_rc7' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14085f29980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58a85aa6925a8b78
dashboard link: https://syzkaller.appspot.com/bug?extid=341e5f32ebafbb46b81c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614c807980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13854e00580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-89f5e14d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dfc310daee41/vmlinux-89f5e14d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a92f22c06568/bzImage-89f5e14d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c7aaf1741c93/mount_1.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com

F2FS-fs (loop0): inject no free segment in get_new_segment of __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
F2FS-fs (loop0): Stopped filesystem due to reason: 7
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2748!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5109 Comm: syz-executor304 Not tainted 6.11.0-rc6-syzkaller-00363-g89f5e14d05b4 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836
Code: 24 58 e8 12 b9 f2 ff eb 05 e8 4b 71 96 fd 48 8b 7c 24 70 e8 91 ac c6 07 48 8b 7c 24 10 31 f6 ba 07 00 00 00 e8 50 1e f6 ff 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000179f548 EFLAGS: 00010246
RAX: 8fb07c62f860e300 RBX: 00000000000002b2 RCX: 8fb07c62f860e300
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffff8880125250c8 R08: ffffffff817401bc R09: 1ffff920002f3e20
R10: dffffc0000000000 R11: fffff520002f3e21 R12: ffff8880008c2700
R13: ffff8880125250cc R14: 1ffff110024a4a19 R15: 00000000000002b2
FS:  0000555593e0e380(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6cf8cb40f8 CR3: 000000001255a000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
 f2fs_allocate_new_section fs/f2fs/segment.c:3181 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3195
 f2fs_expand_inode_data+0x5d6/0xbb0 fs/f2fs/file.c:1799
 f2fs_fallocate+0x448/0x960 fs/f2fs/file.c:1903
 vfs_fallocate+0x553/0x6c0 fs/open.c:334
 do_vfs_ioctl+0x2592/0x2e50 fs/ioctl.c:886
 __do_sys_ioctl fs/ioctl.c:905 [inline]
 __se_sys_ioctl+0x81/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6cf8c37229
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffeb5036b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0030656c69662f2e RCX: 00007f6cf8c37229
RDX: 00000000200000c0 RSI: 0000000040305828 RDI: 0000000000000004
RBP: 0000000000000000 R08: 00007ffeb5036b90 R09: 00007ffeb5036b90
R10: 00007ffeb5036b90 R11: 0000000000000246 R12: 00007ffeb5036b7c
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007ffeb5036bb0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836
Code: 24 58 e8 12 b9 f2 ff eb 05 e8 4b 71 96 fd 48 8b 7c 24 70 e8 91 ac c6 07 48 8b 7c 24 10 31 f6 ba 07 00 00 00 e8 50 1e f6 ff 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000179f548 EFLAGS: 00010246
RAX: 8fb07c62f860e300 RBX: 00000000000002b2 RCX: 8fb07c62f860e300
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffff8880125250c8 R08: ffffffff817401bc R09: 1ffff920002f3e20
R10: dffffc0000000000 R11: fffff520002f3e21 R12: ffff8880008c2700
R13: ffff8880125250cc R14: 1ffff110024a4a19 R15: 00000000000002b2
FS:  0000555593e0e380(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6cf8cb40f8 CR3: 000000001255a000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
