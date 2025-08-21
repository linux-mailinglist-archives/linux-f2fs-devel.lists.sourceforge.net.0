Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A6B2EBB1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Aug 2025 05:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OndQl2AbQZnqffxERO6d4QrxyxFaXSiGg+nMXVkTkMs=; b=dKQkbYhP5lcYWgcGHFoqx9FJVT
	pTVt5r7OzDIrgaejnw3kyJ1kbjMO3jg98D0mcp3c1bDeQX8UZHFLnzZVbDutfvDAHQw8epyBzvlI1
	ag6srvKiv67BT1nw6T2uIVXU3fHn7K2oqzgiTWTaK24vbC/Jp/5+xN7nm0vKx33UfbVM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uovhL-0006dU-Oo;
	Thu, 21 Aug 2025 03:10:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3J46maAkbACoYefQGRRKXGVVOJ.MUUMRKaYKXIUTZKTZ.IUS@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uovhK-0006dO-L3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 03:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2TkSh0oWm1yzX3q/7Wu1wD7ClTaGjDasGuUAyNwNdE=; b=KNQleF849dqYYGXGEVgYqclESw
 TsexKC/WuGVj3fxfC5iAMYLAewrebkDtP4lz90UcNlBaAQUJ9BR29C11oS0SRx+LvVmWtIHQaqx+8
 ClKniCPm3Tf6M/TiNjDGcXeE1dvDomoYflFFZL1N7u/DjmyESQXHaG01ca+jp4p8njwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+2TkSh0oWm1yzX3q/7Wu1wD7ClTaGjDasGuUAyNwNdE=; b=S
 ch56nC45KiWUHuvgDxRkLEEr1yKqpKivLmDeC2ORCPND01H10FxVEVHDXBg5B6GSRIDLwA5g9WIb+
 VH2R5U8RblTey/o14ED370kN2EIJUjispt3MmwOjB2RWw1D42019f8N4ID23G5+sW3ipRUNaNXrSN
 O+UMUFVhMB7YtDmw=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uovhJ-0006Ld-WF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 03:10:42 +0000
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-88432ccc211so50038639f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 20:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755745831; x=1756350631;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+2TkSh0oWm1yzX3q/7Wu1wD7ClTaGjDasGuUAyNwNdE=;
 b=B+IfKJXrf/ul7OklSi8B0nuT718x6SpQzQgErcive8Ar05Y26VLojWk3H31SQIU/6T
 3rNS0zI0w4k1Hb/+9Za4u94X22Eo1qqarYSnFgzAV9DbFOnfXWmtOWPmVEphfy0kQ29W
 JAdM7cqnX4BiR/wbUx0euIsEoWfOkw9e3FTN4iEXUEE6p2G/75xK/rP/tLVfNVzUQiuO
 Cjfz9qyWcQ4ZfLu0jmKSf4G9tn+CVIqSI7KDsLd+v67kJuijo19GbWX0Mv/s5/h0U8MH
 U67Wwwhzpl7dRQ1xT3kOoemx8TvHuFzz31KKv+ZlkRjjQujZCiqKjk7P6L27dHZpkkvt
 Yepg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBgZFlGiorl0PQxHxD7BwedYGfmX+gf+Siwg/E1TBkqN0cjpIIFSoNj8XVGA/GaKn6SPbS907JxABr/wkLtgmo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxN0qVvtksQOZzY9oSsBByEdJ2nOduo9fLJHsQBgosJNZF4cPY7
 YTvMvBUCenTOnDcYLgHi356HpE+nt6wv8YLqpW8fojl3BQ2Z7FJkCBKJnNrp5Q18YBV7bry9W7B
 tY9loZhaBmAidfQQGCFN2t23/UE1Af6mggmnCrC5QteKIEGQkqpvnujG06X4=
X-Google-Smtp-Source: AGHT+IHJBx+pHXtqdXW2m7y4tfiioh4VHwENWS66uPISpek5YUtvXCyaOq581Tq3aRHa35gt4fxGdgBGRjyBUe5+v6OnZG4SE3fe
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168b:b0:3e5:738c:3f3a with SMTP id
 e9e14a558f8ab-3e6d7865148mr15392445ab.21.1755745831301; Wed, 20 Aug 2025
 20:10:31 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:10:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68a68e27.050a0220.1a3988.0002.GAE@google.com>
From: syzbot <syzbot+b9c7ffd609c3f09416ab@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 90d970cade8e
 Merge tag 'ata-ata-6.17-rc2' of git://git.ker.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=118fb3a2580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
X-Headers-End: 1uovhJ-0006Ld-WF
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_truncate_hole (2)
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

HEAD commit:    90d970cade8e Merge tag 'ata-ata-6.17-rc2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118fb3a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f81850843b877ed
dashboard link: https://syzkaller.appspot.com/bug?extid=b9c7ffd609c3f09416ab
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-90d970ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/746014c1cf11/vmlinux-90d970ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f69411b895d/bzImage-90d970ca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9c7ffd609c3f09416ab@syzkaller.appspotmail.com

 </TASK>
F2FS-fs (loop0): access invalid blkaddr:1818846767
CPU: 0 UID: 0 PID: 5354 Comm: syz.0.0 Not tainted 6.17.0-rc1-syzkaller-00211-g90d970cade8e #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __f2fs_is_valid_blkaddr+0xe52/0x14f0 fs/f2fs/checkpoint.c:213
 f2fs_truncate_data_blocks_range+0x790/0x1390 fs/f2fs/file.c:674
 f2fs_truncate_hole+0x3f2/0x6c0 fs/f2fs/file.c:1245
 f2fs_punch_hole+0x2db/0x330 fs/f2fs/file.c:1306
 f2fs_fallocate+0x546/0x990 fs/f2fs/file.c:2018
 vfs_fallocate+0x666/0x7e0 fs/open.c:342
 ksys_fallocate fs/open.c:366 [inline]
 __do_sys_fallocate fs/open.c:371 [inline]
 __se_sys_fallocate fs/open.c:369 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:369
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e65f8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1e66dd1038 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f1e661b6090 RCX: 00007f1e65f8ebe9
RDX: 0000000000000003 RSI: 0000000000000003 RDI: 000000000000000a
RBP: 00007f1e66011e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000404042bbe R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1e661b6128 R14: 00007f1e661b6090 R15: 00007ffe98c9dc98
 </TASK>
F2FS-fs (loop0): Inconsistent error blkaddr:12389, sit bitmap:0
CPU: 0 UID: 0 PID: 5354 Comm: syz.0.0 Not tainted 6.17.0-rc1-syzkaller-00211-g90d970cade8e #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __is_bitmap_valid fs/f2fs/checkpoint.c:168 [inline]
 __f2fs_is_valid_blkaddr+0xd84/0x14f0 fs/f2fs/checkpoint.c:216
 f2fs_truncate_data_blocks_range+0x790/0x1390 fs/f2fs/file.c:674
 f2fs_truncate_hole+0x3f2/0x6c0 fs/f2fs/file.c:1245
 f2fs_punch_hole+0x2db/0x330 fs/f2fs/file.c:1306
 f2fs_fallocate+0x546/0x990 fs/f2fs/file.c:2018
 vfs_fallocate+0x666/0x7e0 fs/open.c:342
 ksys_fallocate fs/open.c:366 [inline]
 __do_sys_fallocate fs/open.c:371 [inline]
 __se_sys_fallocate fs/open.c:369 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:369
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e65f8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1e66dd1038 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f1e661b6090 RCX: 00007f1e65f8ebe9
RDX: 0000000000000003 RSI: 0000000000000003 RDI: 000000000000000a
RBP: 00007f1e66011e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000404042bbe R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1e661b6128 R14: 00007f1e661b6090 R15: 00007ffe98c9dc98
 </TASK>
------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:1243!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5354 Comm: syz.0.0 Not tainted 6.17.0-rc1-syzkaller-00211-g90d970cade8e #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:f2fs_truncate_hole+0x69e/0x6c0 fs/f2fs/file.c:1243
Code: 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d e9 55 7b 7d 07 cc e8 af fa be fd eb a4 e8 58 96 7a 07 e8 a3 fa be fd 90 <0f> 0b e8 9b fa be fd 4c 89 ef 48 c7 c6 20 8c d1 8b e8 cc 3b 27 fd
RSP: 0018:ffffc9000eddfbe0 EFLAGS: 00010287
RAX: ffffffff8400c09d RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e523000 RSI: 0000000000072bb6 RDI: 0000000000072bb7
RBP: ffffc9000eddfd18 R08: ffff8880433a2887 R09: 1ffff11008674510
R10: dffffc0000000000 R11: ffffed1008674511 R12: 0000000000000360
R13: ffffffffffffffff R14: 0000000000404042 R15: 00000000000006c0
FS:  00007f1e66dd16c0(0000) GS:ffff88808d210000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1e65fec470 CR3: 000000003f147000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_punch_hole+0x2db/0x330 fs/f2fs/file.c:1306
 f2fs_fallocate+0x546/0x990 fs/f2fs/file.c:2018
 vfs_fallocate+0x666/0x7e0 fs/open.c:342
 ksys_fallocate fs/open.c:366 [inline]
 __do_sys_fallocate fs/open.c:371 [inline]
 __se_sys_fallocate fs/open.c:369 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:369
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e65f8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1e66dd1038 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f1e661b6090 RCX: 00007f1e65f8ebe9
RDX: 0000000000000003 RSI: 0000000000000003 RDI: 000000000000000a
RBP: 00007f1e66011e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000404042bbe R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1e661b6128 R14: 00007f1e661b6090 R15: 00007ffe98c9dc98
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_truncate_hole+0x69e/0x6c0 fs/f2fs/file.c:1243
Code: 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d e9 55 7b 7d 07 cc e8 af fa be fd eb a4 e8 58 96 7a 07 e8 a3 fa be fd 90 <0f> 0b e8 9b fa be fd 4c 89 ef 48 c7 c6 20 8c d1 8b e8 cc 3b 27 fd
RSP: 0018:ffffc9000eddfbe0 EFLAGS: 00010287
RAX: ffffffff8400c09d RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e523000 RSI: 0000000000072bb6 RDI: 0000000000072bb7
RBP: ffffc9000eddfd18 R08: ffff8880433a2887 R09: 1ffff11008674510
R10: dffffc0000000000 R11: ffffed1008674511 R12: 0000000000000360
R13: ffffffffffffffff R14: 0000000000404042 R15: 00000000000006c0
FS:  00007f1e66dd16c0(0000) GS:ffff88808d210000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1e65fec470 CR3: 000000003f147000 CR4: 0000000000352ef0


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
