Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CFAAC3DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 12:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQ4f5gJxO/DfouaeaW1u8t7DkHkk4jPYYIqy9DSSXqY=; b=TEC4EquE4b7kMqADRg6szNeIP/
	Uiw4ZK5slfWUxJSoHb4wLgfmhH4h1WvNefvbR+ojk2igyG8FoNeMfg6xyafR9nxZHlzF6DfPTPzgd
	Yg1ACnfo3eZQ35v/Vt4qmNVK/1rBC6gphR7+OAVToHOH/+yZiINN7YUnMEe0yTx09OiY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJUmT-0000U5-3m;
	Mon, 26 May 2025 10:10:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3biY0aAkbANMHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uJUmR-0000Ty-KF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 10:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiQRlfDNtqOi24rme/9r0diFS+WzZzezNtRBnIppWFI=; b=Fm39R7M3loKUxcSNdYY86gTCUq
 Lb3MIx5eA+BseDT3cTk1A3/2BFnX+sd9X2RP2gEWNUr0SKg6OPkCxilHC+rpR7lum/mu58waRfpQM
 RKYhObS2tNw/z++Ue5ztdVizYv7g1JtqsBXSQ2Ut5W4Y4sV7iyV3BzDEG81Ru887/GYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IiQRlfDNtqOi24rme/9r0diFS+WzZzezNtRBnIppWFI=; b=J
 ZQNXDQK+Kl0D4Y1qY4Czd43v4QqvQxXr3MinRxlQosNFt3DwCtw2c2NRuZEkjEXhnyuTfsuevgw02
 fKfVwHVw7sfjLbM8kyERs+nJmqzOkVcCOhZBkcbyxAZ5dgiaxlBkelkQzQfpgF1E+kcj6ALItiQVx
 zvDXUuPJM9dHWgiw=;
Received: from mail-qk1-f206.google.com ([209.85.222.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uJUlv-00032f-T9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 10:10:03 +0000
Received: by mail-qk1-f206.google.com with SMTP id
 af79cd13be357-7c791987cf6so430330685a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 May 2025 03:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748254161; x=1748858961;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IiQRlfDNtqOi24rme/9r0diFS+WzZzezNtRBnIppWFI=;
 b=W3fkGYoWgtpkKNXoF30xgL34dBdNmsOcaiMLzXQDUj1XYdSzrCgefCjTcmK+cl7dOp
 0rCvJ3kyFumT5xNP5QacuZEOAvAlXfwzV2Q8ZW+SUsERtpT2d/gzWt7x8QfqQsHjVa8x
 7TU0jJjHFhhkyqNG4H4KMax/nGAsHE53vaduqQQsSP0+PFyhPfyW03qTQ/FHJ8A3kE6C
 J2gow0wz3DfEA1Qo2kNmx/SRYcxVks2EN385Rk931n/u7lNoQPybhnsXtZqxxPWUjfrG
 LLFztusINn3tjANM1Bf4xO+xdUn0Qcu3aERWs2BqnAzs49SZ2t9xxR+lFEiGLDwA58lp
 xWmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKykJJBEGHgCwMBJNnbMCEvIWlVYLWpEtF8Qqvf0s1qOxE1qUggcpoN1FYp5BuwoMptRsxbJWkRIduKO3jHPH0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTPdX8MuQUMxRsykF2pf8p5+n0sh1TvAqEJMyCMm8uiUYxISih
 eNZ12h1Wuu8C7fB/zBB2nRx9FXSxytECfjazqi6g2x49yAMHuKoMjuMXfYrTFc61/QS/Frf4mrT
 OiHC8JDhtBrQraufX4UQSrRVPRMf4p0Kly4DiWX0AGDfBir9ePUDzDeeeVuw=
X-Google-Smtp-Source: AGHT+IFpKdYWxZJdtg4Aw7uHYN3AyKfkhOo6oOeNCczYE8xOadwo7fAIisGx+r16uXef5MudZK4reH7t/W0KHdg8fQKIdGsBdBnI
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a08:b0:3dc:7f3b:acb1 with SMTP id
 e9e14a558f8ab-3dc9b698537mr47334285ab.13.1748248174200; Mon, 26 May 2025
 01:29:34 -0700 (PDT)
Date: Mon, 26 May 2025 01:29:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6834266e.a70a0220.1765ec.0164.GAE@google.com>
From: syzbot <syzbot+240643026e8cd9ddfaf2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Headers-End: 1uJUlv-00032f-T9
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_invalidate_blocks (2)
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

HEAD commit:    d608703fcdd9 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15d18170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1de0d8596cea805
dashboard link: https://syzkaller.appspot.com/bug?extid=240643026e8cd9ddfaf2
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103d19f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111550e8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/62f880b05e70/disk-d608703f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/48229a0ebcc2/vmlinux-d608703f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/376656c50345/bzImage-d608703f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f95e4c8e6c27/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=134279f4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+240643026e8cd9ddfaf2@syzkaller.appspotmail.com

syz-executor274: attempt to access beyond end of device
loop0: rw=2049, sector=45096, nr_sectors = 64 limit=40427
F2FS-fs (loop0): inject inconsistent footer in sanity_check_node_footer of f2fs_get_inode_folio fs/f2fs/node.c:1547 [inline]
F2FS-fs (loop0): inject inconsistent footer in sanity_check_node_footer of f2fs_get_inode_page fs/f2fs/node.c:1552 [inline]
F2FS-fs (loop0): inject inconsistent footer in sanity_check_node_footer of f2fs_get_dnode_of_data+0x251/0x1c30 fs/f2fs/node.c:781
F2FS-fs (loop0): inconsistent node block, node_type:1, nid:10, node_footer[nid:10,ino:10,ofs:0,cpver:10241045589465957861,blkaddr:4615]
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2586!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5825 Comm: syz-executor274 Not tainted 6.15.0-rc7-syzkaller-00014-gd608703fcdd9 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:f2fs_invalidate_blocks+0xa02/0xa10 fs/f2fs/segment.c:2586
Code: 89 d1 80 e1 07 80 c1 03 38 c1 0f 8c eb fa ff ff 48 8b 7c 24 08 e8 be c9 1a fe 48 8b 54 24 08 e9 d7 fa ff ff e8 5f f4 ba fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000419f5d8 EFLAGS: 00010293
RAX: ffffffff8404fc81 RBX: ffff8880340fcc00 RCX: ffff8880332a8000
RDX: 0000000000000000 RSI: ffffffff8e53f220 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff8880332a8000 R09: 0000000000000003
R10: 00000000ffffffff R11: 0000000000000000 R12: dffffc0000000000
R13: ffff88806e92c000 R14: 00000000ffffffff R15: 0000000000000000
FS:  00005555846a3380(0000) GS:ffff8881261f6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000006000 CR3: 000000006ed52000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __replace_atomic_write_block+0x498/0x1240 fs/f2fs/segment.c:254
 __complete_revoke_list fs/f2fs/segment.c:293 [inline]
 __f2fs_commit_atomic_write fs/f2fs/segment.c:385 [inline]
 f2fs_commit_atomic_write+0xefc/0x11b0 fs/f2fs/segment.c:403
 f2fs_ioc_commit_atomic_write fs/f2fs/file.c:2318 [inline]
 __f2fs_ioctl+0x3f11/0xae80 fs/f2fs/file.c:4551
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7566ed5b59
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef05ec848 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7566ed5b59
RDX: 0000000000000000 RSI: 000000000000f502 RDI: 0000000000000004
RBP: 00007f7566f4e5f0 R08: 00005555846a44c0 R09: 00005555846a44c0
R10: 00005555846a44c0 R11: 0000000000000246 R12: 00007ffef05ec870
R13: 00007ffef05eca98 R14: 431bde82d7b634db R15: 00007f7566f1e03b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_invalidate_blocks+0xa02/0xa10 fs/f2fs/segment.c:2586
Code: 89 d1 80 e1 07 80 c1 03 38 c1 0f 8c eb fa ff ff 48 8b 7c 24 08 e8 be c9 1a fe 48 8b 54 24 08 e9 d7 fa ff ff e8 5f f4 ba fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000419f5d8 EFLAGS: 00010293
RAX: ffffffff8404fc81 RBX: ffff8880340fcc00 RCX: ffff8880332a8000
RDX: 0000000000000000 RSI: ffffffff8e53f220 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff8880332a8000 R09: 0000000000000003
R10: 00000000ffffffff R11: 0000000000000000 R12: dffffc0000000000
R13: ffff88806e92c000 R14: 00000000ffffffff R15: 0000000000000000
FS:  00005555846a3380(0000) GS:ffff8881260f6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f684d7f8000 CR3: 000000006ed52000 CR4: 00000000003526f0
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
