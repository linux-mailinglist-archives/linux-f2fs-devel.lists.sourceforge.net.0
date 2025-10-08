Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8DBC3306
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Oct 2025 05:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yuIF484SixNYD8UlqERqQCPvsPXjyKlQWs0tMNPNUJA=; b=U32jYaaKkSdGZcXzmKmOMMNLSt
	ASk4gR1tnj/mivdAXSpvU0vUmX4M03WG0+H3IlcjGZspr4FMNVJUqUgtj3mOBBMIBkZ/ZvAytiy9x
	iOoF8a7jCCGtN+mRET53svFXN2kYJlSwIwnKfhB/PqHQyeBkGQ95a3+3MR6jm9WMcD+U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6KbU-0001vt-VZ;
	Wed, 08 Oct 2025 03:12:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3mNblaAkbACsZfgRHSSLYHWWPK.NVVNSLbZLYJVUaLUa.JVT@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v6KbT-0001vn-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Oct 2025 03:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MwTLc9AEDgMWzLb+oR9MzDN6KMGy+Scrkcp5Out2arU=; b=IT52vPhdNNCUrVWKEWYWRws5DO
 7bcN6uxfnrN7ZFCQxGt5OX6GWrBU89goT4/6QKm6R0mViizBIB63Bx3r8UzgsD8te6DqadblMBm5G
 XSLPEstC8EVXQZRvj2cedTbtRP0MuBWZ1faKdGZxVRL29pYN97H6SfGQPBHSqstdvneU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MwTLc9AEDgMWzLb+oR9MzDN6KMGy+Scrkcp5Out2arU=; b=U
 z1a8lRx4r4MYiscNiQvkeI6ZiBVUrCnhBZmumydVQ9w3JaHZXJ3LRajSya1BEIR2ge/Y/fdbs7Nec
 IOR15JKyJkwB0DTOUsF9MpMaBY3OBqWcTQBCHAkI3hdlE4Wx2uG+yQA173t9xdMJIHHEOKXOP1Fnk
 3GbXKB7nqmJngJv8=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v6KbT-000103-18 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Oct 2025 03:12:35 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-925332ba890so1924245139f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Oct 2025 20:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759893144; x=1760497944;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MwTLc9AEDgMWzLb+oR9MzDN6KMGy+Scrkcp5Out2arU=;
 b=jYKOmSYwD355YTAoIGnfmt8YQOWO2QsFsNO1HDiGh+U1UxNKwVNkQLyJENPPSdNZo5
 B1FjdEb6a570pNdv11sIwBtYqmU/JKNN9r/swToo7waloiBIr6l1+009scl9ctGjQ1P7
 NmJBds5WveYtQghw7m3K9na5lOEpvHEqVQcyqB4XN21wwX47TOmbna0mozY4hvYtXEKT
 ARBu+Sj1Aw8EvAGT1UCYNy0o07Wy/5HTCzForv2sZW2dnYm8cATLZ44FhPXhXEsBsqEq
 A0z0Q3kmqy9p5YUx3N5ttFrQAj4bONaKRJwk4Qd9C1Ywdu4F0BeqH5uS7R8pb//wUhqI
 F1Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwmwCjx6F8uJL5EYQapSlU1V77/js+4FSVvMGTXpXDxpuTV/18ZzdxdXLOeltPh1Qwl8cdP8AB5n6w1mvt8u1p@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzrL1fSoxhov4/pxK106wGWOHZ4xdnqgrKjSb0uqcowaEM68k+4
 5DgWCqMqxK1x6AAFLv1P0S9BzPdojmA7+dceF/ENk7QwjpQol2hgf6cqnjoTk8f4rGwIRqG/rWN
 eFv6rr23JMBkjYLrZR/rxYQAYlYt48Zppd1wc83TA/GHhGgk7Iqcdc3bq/Ug=
X-Google-Smtp-Source: AGHT+IHmcsQj2dWrBzBGYQBWtULG+EjlZGzb57hXahEETnTDtOXPKLZMimsmY+Rf1v9++8MfERfpMU6ba2KtDSvQstedRcq0i/6Q
MIME-Version: 1.0
X-Received: by 2002:a05:6602:60cc:b0:93b:b7e9:95c2 with SMTP id
 ca18e2360f4ac-93bd182ef7bmr178972639f.2.1759893144252; Tue, 07 Oct 2025
 20:12:24 -0700 (PDT)
Date: Tue, 07 Oct 2025 20:12:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e5d698.050a0220.256323.0032.GAE@google.com>
From: syzbot <syzbot+24124df3170c3638b35f@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 2ccb4d203fe4
 Merge tag 'for-linus' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=130b4458580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1v6KbT-000103-18
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in __update_extent_tree_range
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

HEAD commit:    2ccb4d203fe4 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=130b4458580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0e74def2d38a839
dashboard link: https://syzkaller.appspot.com/bug?extid=24124df3170c3638b35f
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2ccb4d20.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/749f87aeac3d/vmlinux-2ccb4d20.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0c8888fbaabd/bzImage-2ccb4d20.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+24124df3170c3638b35f@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
F2FS-fs (loop0): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
F2FS-fs (loop0): Mounted with checkpoint version = 1b41e955
F2FS-fs (loop0): access invalid blkaddr:16711680
CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __f2fs_is_valid_blkaddr+0xe52/0x14f0 fs/f2fs/checkpoint.c:213
 f2fs_do_zero_range fs/f2fs/file.c:1647 [inline]
 f2fs_zero_range+0xef0/0x1580 fs/f2fs/file.c:1737
 f2fs_fallocate+0x583/0x990 fs/f2fs/file.c:2030
 vfs_fallocate+0x669/0x7e0 fs/open.c:342
 ioctl_preallocate fs/ioctl.c:289 [inline]
 file_ioctl+0x611/0x780 fs/ioctl.c:-1
 do_vfs_ioctl+0xb33/0x1430 fs/ioctl.c:576
 __do_sys_ioctl fs/ioctl.c:595 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f07bc58eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f07bd4f2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f07bc7e5fa0 RCX: 00007f07bc58eec9
RDX: 0000200000000040 RSI: 0000000040305839 RDI: 0000000000000004
RBP: 00007f07bc611f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f07bc7e6038 R14: 00007f07bc7e5fa0 R15: 00007ffdf7c46b18
 </TASK>
F2FS-fs (loop0): __update_extent_tree_range: extent len is zero, type: 0, extent [0, 0, 0], age [0, 0]
------------[ cut here ]------------
kernel BUG at fs/f2fs/extent_cache.c:678!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__update_extent_tree_range+0x13bc/0x1500 fs/f2fs/extent_cache.c:678
Code: 48 c7 c2 60 62 93 8b 48 c7 c1 a4 09 6c 8d 44 8b 44 24 0c 4c 8b 4c 24 30 41 ff 37 41 56 6a 00 53 e8 89 09 ef ff 48 83 c4 20 90 <0f> 0b f3 0f 1e fa 65 44 8b 3d 5a 3e 2e 0e bf 07 00 00 00 44 89 fe
RSP: 0018:ffffc9000d47f4e0 EFLAGS: 00010282
RAX: 2b7eb175dbc53d00 RBX: 0000000000000000 RCX: 2b7eb175dbc53d00
RDX: ffffc9000e052000 RSI: 00000000000125e2 RDI: 00000000000125e3
RBP: ffffc9000d47f6b0 R08: ffffc9000d47f0a7 R09: 1ffff92001a8fe14
R10: dffffc0000000000 R11: fffff52001a8fe15 R12: 1ffff92001a8fec0
R13: ffff8880123b9ae8 R14: 0000000000000000 R15: ffffc9000d47f6d8
FS:  00007f07bd4f26c0(0000) GS:ffff88808d97f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f54bb84ad50 CR3: 00000000420fe000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_update_read_extent_cache_range+0x192/0x3e0 fs/f2fs/extent_cache.c:1085
 f2fs_do_zero_range fs/f2fs/file.c:1657 [inline]
 f2fs_zero_range+0x10c1/0x1580 fs/f2fs/file.c:1737
 f2fs_fallocate+0x583/0x990 fs/f2fs/file.c:2030
 vfs_fallocate+0x669/0x7e0 fs/open.c:342
 ioctl_preallocate fs/ioctl.c:289 [inline]
 file_ioctl+0x611/0x780 fs/ioctl.c:-1
 do_vfs_ioctl+0xb33/0x1430 fs/ioctl.c:576
 __do_sys_ioctl fs/ioctl.c:595 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f07bc58eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f07bd4f2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f07bc7e5fa0 RCX: 00007f07bc58eec9
RDX: 0000200000000040 RSI: 0000000040305839 RDI: 0000000000000004
RBP: 00007f07bc611f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f07bc7e6038 R14: 00007f07bc7e5fa0 R15: 00007ffdf7c46b18
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__update_extent_tree_range+0x13bc/0x1500 fs/f2fs/extent_cache.c:678
Code: 48 c7 c2 60 62 93 8b 48 c7 c1 a4 09 6c 8d 44 8b 44 24 0c 4c 8b 4c 24 30 41 ff 37 41 56 6a 00 53 e8 89 09 ef ff 48 83 c4 20 90 <0f> 0b f3 0f 1e fa 65 44 8b 3d 5a 3e 2e 0e bf 07 00 00 00 44 89 fe
RSP: 0018:ffffc9000d47f4e0 EFLAGS: 00010282
RAX: 2b7eb175dbc53d00 RBX: 0000000000000000 RCX: 2b7eb175dbc53d00
RDX: ffffc9000e052000 RSI: 00000000000125e2 RDI: 00000000000125e3
RBP: ffffc9000d47f6b0 R08: ffffc9000d47f0a7 R09: 1ffff92001a8fe14
R10: dffffc0000000000 R11: fffff52001a8fe15 R12: 1ffff92001a8fec0
R13: ffff8880123b9ae8 R14: 0000000000000000 R15: ffffc9000d47f6d8
FS:  00007f07bd4f26c0(0000) GS:ffff88808d97f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f07bd4d19a0 CR3: 00000000420fe000 CR4: 0000000000352ef0


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
