Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2FBB3D147
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Aug 2025 10:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAV9pLPSTp+Ug3jDYpbh6IVqhOPYuJe5RZLfIdKy/Uw=; b=leHaWsoobdL/3/WWFvP+umDLLu
	t9JZ5a7+imLnLGn5iLBxU4ufhnUCKSaYndZlEDPOyHswMYUPmh6LHSzjYsCo/6qlsVKjru+eY3Lqq
	WoUqMU+TrU7jLL4v8HgNJEUPYT+FlAOL/fcGQ+FIX6aFZQU3iCsYHqwA9sDi9zO+355w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usd2j-0002KD-0A;
	Sun, 31 Aug 2025 08:04:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <31wG0aAkbAPYqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1usd2Q-0002Jj-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 Aug 2025 08:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFx4RHsZpPKOi6j9JvrbO6GmWcfK8WFdE3b5KFAfu0M=; b=Jb+2G/hV3MGzDrtZsdKgeo4GP0
 hUb/HfS1OQAV2oggW3WT+RMoXps9aDh+hwQtmVQIwZK2m+qTS6tDuQg0zUaIZ3qHmiZJaHfMYelHR
 kfNbtuN0x722WM9omHQshe1u44AXYscbGlE/cG0DUAUhBgIHcntbyBxiqXOLaRkPFnF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VFx4RHsZpPKOi6j9JvrbO6GmWcfK8WFdE3b5KFAfu0M=; b=W
 Oq6GL1QszEIY+NZVnA1WoxOMehCUNKecTdbNEdeT0OmwVWv16Mp66scLPB2vB/P4RswJKzWT4KIKh
 NvVBfZs1df7Xysn3n9pW54tLKYOkJsuqbVA/mKi5xd3+N3rrMhmkezm5/UZKI3xj/hGicDpe5qoi4
 XPn7nYwVGk9byGZc=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1usd2Q-00086o-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 Aug 2025 08:03:46 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3f05a805d9bso92404865ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Aug 2025 01:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756627415; x=1757232215;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VFx4RHsZpPKOi6j9JvrbO6GmWcfK8WFdE3b5KFAfu0M=;
 b=ba9fyK+l0LSya5yMkDCKQQM6SRJBMDrjI1ieuEro9NxH2KAddz+aH3BfWBTdwmbEbC
 y+6FXj0d1/6HZy1VuO8JziIv1xpzb5Z8kSgh7dfsCr2eFlQvE9pC/TljL4U3a3Uou1WQ
 hbomAqqDc7gfQeEbALGTorQUZ00JYWm3qs6iqOqL0DcPV0P2Ro7htPAbmGxeFDwYpFQY
 a5jzQsu9M5dTM9JRll5Umvqzrj24AS4yiImR4pZKbMSyj/NJqo+P4ygW33/dD0eBHolq
 8TD7CtJV+9frRH9oNkqHn/rKRVpdQkoJur92FK6PTWDFdmAL0tyxif19nOvr3JReV3bR
 hBwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf8TO+vVJvoRNlN1aXcnXU71P/cScj2Mlc2Ki93k1305npXMIIM9F5YM0dh2nktz9YcdwENNkAS5FMUobFhG7c@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx2tCiYT1GZamkWjtgg4yO7gx6vb8SCtb9Ctpu6GCaAWOozfmIi
 atvgUKJ3ldspvyYO+u8x8n6MMh8IAyfKbw4hH/RvFcu7ymGZ7PVijm4Crys2T1rBbJHSUoaUPDE
 zf4ckEhiWzaJRHAq86eby1aTdgoWhCCuVJZT7cw7A26ylpRjtzZioqbJ6bRo=
X-Google-Smtp-Source: AGHT+IFOMPYqbusZKfCaCax85hfhBNOHdlVthWhDIu+EXr2ccRdGQMldqZJ6d9KgYylWT7oKT7xZBWdeAdVM4dzNxo7tSqEb6xFU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6a:b0:3f2:1ba1:1caf with SMTP id
 e9e14a558f8ab-3f4006758e8mr97305025ab.14.1756627415725; Sun, 31 Aug 2025
 01:03:35 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:03:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b401d7.a00a0220.1337b0.0031.GAE@google.com>
From: syzbot <syzbot+1867a378155795cb1680@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: fab1beda7597
 Merge tag 'devicetree-fixes-for-6.17-1' of gi.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=14b6c634580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1usd2Q-00086o-Bw
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_do_truncate_blocks
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

HEAD commit:    fab1beda7597 Merge tag 'devicetree-fixes-for-6.17-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b6c634580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a7016efe6aaa498c
dashboard link: https://syzkaller.appspot.com/bug?extid=1867a378155795cb1680
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fab1beda.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/07d60c58352f/vmlinux-fab1beda.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b6d2b98f110e/bzImage-fab1beda.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1867a378155795cb1680@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
F2FS-fs (loop0): QUOTA feature is enabled, so ignore qf_name
F2FS-fs (loop0): build fault injection rate: 7
F2FS-fs (loop0): build fault injection type: 0x40004
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of __get_meta_folio+0x157/0x4f0 fs/f2fs/checkpoint.c:77
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of f2fs_ra_meta_pages+0x615/0x970 fs/f2fs/checkpoint.c:303
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of f2fs_ra_meta_pages+0x615/0x970 fs/f2fs/checkpoint.c:303
F2FS-fs (loop0): inject invalid blkaddr in f2fs_is_valid_blkaddr of f2fs_ra_meta_pages+0x1cb/0x970 fs/f2fs/checkpoint.c:275
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of __get_meta_folio+0x157/0x4f0 fs/f2fs/checkpoint.c:77
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of __get_meta_folio+0x157/0x4f0 fs/f2fs/checkpoint.c:77
------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:824!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5364 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:f2fs_do_truncate_blocks+0x1075/0x10c0 fs/f2fs/file.c:824
Code: 27 fd 90 0f 0b e8 bb 30 bf fd 90 0f 0b e8 b3 30 bf fd 48 89 df 48 c7 c6 00 8c d1 8b e8 e4 71 27 fd 90 0f 0b e8 9c 30 bf fd 90 <0f> 0b e8 94 30 bf fd 90 0f 0b 90 e9 dd fd ff ff e8 86 30 bf fd 90
RSP: 0018:ffffc9000d387620 EFLAGS: 00010287
RAX: ffffffff84008aa4 RBX: 0000000000000003 RCX: 0000000000100000
RDX: ffffc9000e2d2000 RSI: 00000000000385b6 RDI: 00000000000385b7
RBP: ffffc9000d387740 R08: ffff888000714880 R09: 0000000000000002
R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000001 R15: 00000000ffff039c
FS:  00007f95562866c0(0000) GS:ffff88808d210000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f38293909c0 CR3: 0000000042d26000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:861
 f2fs_truncate+0x452/0x780 fs/f2fs/file.c:911
 f2fs_evict_inode+0x9aa/0x19c0 fs/f2fs/inode.c:897
 evict+0x501/0x9c0 fs/inode.c:810
 f2fs_fill_super+0x563c/0x6ff0 fs/f2fs/super.c:5047
 get_tree_bdev_flags+0x40b/0x4d0 fs/super.c:1692
 vfs_get_tree+0x92/0x2b0 fs/super.c:1815
 do_new_mount+0x2a2/0x9e0 fs/namespace.c:3808
 do_mount fs/namespace.c:4136 [inline]
 __do_sys_mount fs/namespace.c:4347 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4324
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f955539038a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9556285e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f9556285ef0 RCX: 00007f955539038a
RDX: 0000200000010580 RSI: 00002000000105c0 RDI: 00007f9556285eb0
RBP: 0000200000010580 R08: 00007f9556285ef0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00002000000105c0
R13: 00007f9556285eb0 R14: 0000000000010595 R15: 0000200000000100
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_do_truncate_blocks+0x1075/0x10c0 fs/f2fs/file.c:824
Code: 27 fd 90 0f 0b e8 bb 30 bf fd 90 0f 0b e8 b3 30 bf fd 48 89 df 48 c7 c6 00 8c d1 8b e8 e4 71 27 fd 90 0f 0b e8 9c 30 bf fd 90 <0f> 0b e8 94 30 bf fd 90 0f 0b 90 e9 dd fd ff ff e8 86 30 bf fd 90
RSP: 0018:ffffc9000d387620 EFLAGS: 00010287
RAX: ffffffff84008aa4 RBX: 0000000000000003 RCX: 0000000000100000
RDX: ffffc9000e2d2000 RSI: 00000000000385b6 RDI: 00000000000385b7
RBP: ffffc9000d387740 R08: ffff888000714880 R09: 0000000000000002
R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000001 R15: 00000000ffff039c
FS:  00007f95562866c0(0000) GS:ffff88808d210000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f38293909c0 CR3: 0000000042d26000 CR4: 0000000000352ef0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

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
