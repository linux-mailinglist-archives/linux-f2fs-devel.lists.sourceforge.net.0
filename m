Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66513A3D37A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2025 09:42:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tl28l-0001cD-Pf;
	Thu, 20 Feb 2025 08:42:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <37eq2ZwkbAOIWcdOEPPIVETTMH.KSSKPIYWIVGSRXIRX.GSQ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tl28e-0001ba-6m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Feb 2025 08:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tspJAAykuhA+T1wvtVtZTwQlwpV9zuUPnroEWvAUycg=; b=W0cb5PT8UfQzwWyOTkp16U21Qg
 RqYJWeDy4OwXnPvzznI7F6ZvhRDxRW/JSPtM1gnfl48av2JM9TwJ1/sBfiq3414E4Qk90uyo5Xynu
 noQBKraTQBM1kuHXGtgmhmeS4lbFA80RVGHF6j+U1XNDFeTdC5g8ZG2r6ddjBitIKPG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tspJAAykuhA+T1wvtVtZTwQlwpV9zuUPnroEWvAUycg=; b=W
 jztV2qm7+nWwnka3GCj/KVPvhKS118VsU1L+d3enRm2e7I7f2D+EcL/27FXmxIN336+S2cmIovSGk
 tBONNWTH9d9ntJKbzApu3A2VlVf/GD+2KuMLXg7azAA756dt9NVJJ0ox1sUHvUTo6dzRjzapPgExb
 fL2KIb94mWrZ3LOM=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tl28d-0002Vq-Om for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Feb 2025 08:42:32 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3d2a379bbf0so13069685ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Feb 2025 00:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740040941; x=1740645741;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tspJAAykuhA+T1wvtVtZTwQlwpV9zuUPnroEWvAUycg=;
 b=pndIKyjTdDVppxoDNpaDD4fTGBurJvN2KCVCscq220I99LkplHjmZZAh8oRD6UfbE8
 zAv7ml8Isp5MsWh95OJ2gFDn/xpbWPIrKBoTr5xUZmzzu5BbaAvwm2Gu+taZ2ecg7lBK
 xFgJ5QjpF2YKdM3G+n5MZIXIwXO6nfORAZAF0mjgduVMlzqr4rjSvSnn8nquHpIhz3Sl
 6mVs8Cjir3krwz9X4XudwrRPtmS76TR2p65vNG5KvHqhk5iwTzoI2PTnmbA11xwWFK8w
 KHc3nkojnIZjPoOwOi+I5AD459882YTgM00Mh5T6WwupscjwSFtBCEd0tqiKdqqsil7J
 XoRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ixC6KaU9LN1zEdRw/NnKZvZm6AoeXlkJJMidVjTnCoBRVkcGwoxETdadtFjlMzgkUqng6ph8k+RX7qmhRvqd@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwX7sj6HMzmQRJU7poiGRj7qaDiXrACUr0qq4HcCm3N65jti29E
 9OHB2mD4TvFQF9AR5QAtw802mrq/mCWfRC9R59JtaHdvXoQ27ofQS0tk7LWStnXf+LRSYiADt4V
 WWr+I8nnm1d2+NhDo7gRO04Id1cjIlMznR32ROpUo2I46Fhl+Gepd/eg=
X-Google-Smtp-Source: AGHT+IGAC6WwtHen8etce11Gn8GZe12LsA5KARfnqzzs6ZLUcjWb8ey0gede7mxguW4WO4Z2h9dhjHZxdeb7dDytEUbtpIDs8/rY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4519:b0:3d2:a5a0:8b06 with SMTP id
 e9e14a558f8ab-3d2a5a08d00mr132769895ab.2.1740040941067; Thu, 20 Feb 2025
 00:42:21 -0800 (PST)
Date: Thu, 20 Feb 2025 00:42:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b6eaed.050a0220.14d86d.0163.GAE@google.com>
From: syzbot <syzbot+51d857eed5614c310da0@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 6537cfb395f3
 Merge tag 'sound-6.14-rc4' of git://git.kerne.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=13f8b5b0580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1tl28d-0002Vq-Om
Subject: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 f2fs_truncate_inode_blocks (2)
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

HEAD commit:    6537cfb395f3 Merge tag 'sound-6.14-rc4' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13f8b5b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7bde34acd8f53b1
dashboard link: https://syzkaller.appspot.com/bug?extid=51d857eed5614c310da0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-6537cfb3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f0fee59b531/vmlinux-6537cfb3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ebf361d1fa57/bzImage-6537cfb3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+51d857eed5614c310da0@syzkaller.appspotmail.com

F2FS-fs (loop0): access invalid blkaddr:1
CPU: 0 UID: 0 PID: 5318 Comm: syz.0.0 Not tainted 6.14.0-rc3-syzkaller-00060-g6537cfb395f3 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 __f2fs_is_valid_blkaddr+0xe16/0x1460 fs/f2fs/checkpoint.c:213
 f2fs_map_blocks+0xd93/0x4e70 fs/f2fs/data.c:1586
 f2fs_preallocate_blocks fs/f2fs/file.c:4836 [inline]
 f2fs_file_write_iter+0x1125/0x2550 fs/f2fs/file.c:5072
 aio_write+0x56b/0x7c0 fs/aio.c:1633
 io_submit_one+0x8a7/0x18a0 fs/aio.c:2052
 __do_sys_io_submit fs/aio.c:2111 [inline]
 __se_sys_io_submit+0x171/0x2e0 fs/aio.c:2081
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f238798cde9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f23888cc038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
RAX: ffffffffffffffda RBX: 00007f2387ba5fa0 RCX: 00007f238798cde9
RDX: 0000400000000700 RSI: 0000000000001417 RDI: 00007f2388883000
RBP: 00007f2387a0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2387ba5fa0 R15: 00007ffc34e50188
 </TASK>
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/f2fs/node.h:381:10
index 18446744073709550692 is out of range for type '__le32[5]' (aka 'unsigned int[5]')
CPU: 0 UID: 0 PID: 5318 Comm: syz.0.0 Not tainted 6.14.0-rc3-syzkaller-00060-g6537cfb395f3 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 get_nid fs/f2fs/node.h:381 [inline]
 f2fs_truncate_inode_blocks+0xa5e/0xf60 fs/f2fs/node.c:1181
 f2fs_do_truncate_blocks+0x782/0x1030 fs/f2fs/file.c:808
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:836
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:886
 f2fs_file_write_iter+0x1bdb/0x2550 fs/f2fs/file.c:5093
 aio_write+0x56b/0x7c0 fs/aio.c:1633
 io_submit_one+0x8a7/0x18a0 fs/aio.c:2052
 __do_sys_io_submit fs/aio.c:2111 [inline]
 __se_sys_io_submit+0x171/0x2e0 fs/aio.c:2081
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f238798cde9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f23888cc038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
RAX: ffffffffffffffda RBX: 00007f2387ba5fa0 RCX: 00007f238798cde9
RDX: 0000400000000700 RSI: 0000000000001417 RDI: 00007f2388883000
RBP: 00007f2387a0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2387ba5fa0 R15: 00007ffc34e50188
 </TASK>
---[ end trace ]---


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
