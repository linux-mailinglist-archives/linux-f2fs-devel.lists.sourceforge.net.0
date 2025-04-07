Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B5A7DD42
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 14:11:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1lJX-0005LD-Mp;
	Mon, 07 Apr 2025 12:10:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ssDzZwkbAEk39Avlwwp2l00to.rzzrwp53p2nzy4py4.nzx@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u1lJW-0005L7-01 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 12:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ek3zenkEspUnPBFxUqi4hppRRFoyjsM8PYzyIlaXi+M=; b=d0/2anq5sAy7H62SKMicGlbb9x
 7oJcjZMp0mmKw520tu1/qvFa2BAjQk3MHs3SzblOHXWrDMS9kBp9qFMa4agCyX5aPtGQo25gxfihA
 BlcduEVizHx0NBfYZvj7RrWYc0Bt33iq/Ki2l4TR2KD0zn7OcpNQ33QqKxty6aSD5QAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ek3zenkEspUnPBFxUqi4hppRRFoyjsM8PYzyIlaXi+M=; b=B
 zKL9kmI51/rQUhsESwk9sq2gEYYjrrk6rEkELAo0ptwjXHlfs34IiJThFw19zQbikrFf75l6sKgDM
 X0jnHuWnylb08K+Zvvik/zUlKvEKeqhdzRDPp7ulWPNmyW49w608JiY/+bCt5hm7LyPR/v7ElqVyU
 Z0EiQ3zMwwlJtGVM=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u1lJF-0007bK-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 12:10:53 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3d43621bb7eso53804485ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Apr 2025 05:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744027826; x=1744632626;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ek3zenkEspUnPBFxUqi4hppRRFoyjsM8PYzyIlaXi+M=;
 b=rUkTm/eS+U/S/1f4Wvb0Yaz5PS3r2dS/06PL2RjCJefApVY138Q1mg+XEF4LdVhsm/
 4oD9M80rNmPe3dgCmqG0fm8vujTR9P+hrU7rrQCAgVqxOM0ng+tXQFbJgNIiKqxuiYjk
 vLbt3p206WicTAhUhPKnNNyLkmSvGvMz0NxbIX0kJGp3tk5G7dGQfYEkMOEaPnTjaXTW
 eDJmvEoTJbtxfM2HhvLnH/eDBdHUwqJiPm2An36a72oniAuZl9qwFLOdvTF6nblRj9Dd
 Zmyde1fOpo6Qn7OEginYLjc6wu75ijbLrh0GMrPus2QXZWcb2B/gJKLRrlyXF+4fZoEx
 QJOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcyzfGSf9XifdfmrBS9XaDD4ELPhdSN3UwGWRwxq8mhJ+xuWIc12ElY2cmTgAXAnIaC8GiHJtNzCfH1XGzwZHt@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzzAz8g6hdkLVI7K0mjQSvp4FUwHKlqgmIK6Jv5VyNcn50r0n/1
 UTrhdpx6OFXTJdM+q76c3bETjtgAmCPEZd8gQPt/pHLcPCwjboqz/6kIoSDLrRyrr2DJgV2brwo
 mbsqE6dPOnd9XoONbRkR/z4Fp3x2KGV3gwNbcnGIP9jqT1xQkUdCgDKw=
X-Google-Smtp-Source: AGHT+IFYM5ksmjv1b4OvqMewkWsrKU9taPe63uEt219GP6/ajJ6mPw1jBDvuYCsKtLpSchTvjyEO2E9mY5CGHO+mOYX6kJJccGw4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e90:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d6e3fea50fmr107239995ab.6.1744027826656; Mon, 07 Apr 2025
 05:10:26 -0700 (PDT)
Date: Mon, 07 Apr 2025 05:10:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3c0b2.050a0220.396535.0547.GAE@google.com>
From: syzbot <syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: a1b5bd45d4ee
 Merge tag 'usb-6.15-rc1' of git://git.kernel... git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=174ffc3f980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
X-Headers-End: 1u1lJF-0007bK-Ct
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in dec_valid_block_count
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

HEAD commit:    a1b5bd45d4ee Merge tag 'usb-6.15-rc1' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174ffc3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe3b5e6a2cb1cc2
dashboard link: https://syzkaller.appspot.com/bug?extid=8b376a77b2f364097fbe
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148427cf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c9f7b0580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a1b5bd45.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8b14e02f603d/vmlinux-a1b5bd45.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cc06cac05b38/bzImage-a1b5bd45.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/697f78a4edc0/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10ffca74580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/f2fs.h:2521!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5312 Comm: syz-executor407 Not tainted 6.14.0-syzkaller-12886-ga1b5bd45d4ee #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Code: 8a 01 fe e9 80 fd ff ff e8 db 64 97 fd 48 c7 c7 60 6e 31 8f 4c 89 e6 48 89 da e8 39 aa 14 01 e9 73 fe ff ff e8 bf 64 97 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d39f078 EFLAGS: 00010293
RAX: ffffffff842bf2c1 RBX: 00000000fffffcda RCX: ffff88801f41a440
RDX: 0000000000000000 RSI: 00000000000003fa RDI: 00000000000000d4
RBP: 1ffff110082999f4 R08: ffffffff842bef72 R09: fffff52001a73e00
R10: dffffc0000000000 R11: fffff52001a73e00 R12: ffff8880414ccfa4
R13: dffffc0000000000 R14: ffff8880414cc000 R15: 00000000000003fa
FS:  00007f5c4fc216c0(0000) GS:ffff88808c599000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5c4fc00d58 CR3: 0000000043b00000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
 truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
 truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
 f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
 f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
 f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
 notify_change+0xbca/0xe90 fs/attr.c:552
 do_truncate+0x222/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3466 [inline]
 do_open fs/namei.c:3849 [inline]
 path_openat+0x2e4f/0x35d0 fs/namei.c:4004
 do_filp_open+0x284/0x4e0 fs/namei.c:4031
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_creat fs/open.c:1522 [inline]
 __se_sys_creat fs/open.c:1516 [inline]
 __x64_sys_creat+0x124/0x170 fs/open.c:1516
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5c4fc6c839
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 81 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5c4fc21218 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007f5c4fcf8608 RCX: 00007f5c4fc6c839
RDX: 00007f5c4fc6c839 RSI: 0000000000000009 RDI: 0000200000000080
RBP: 00007f5c4fcf8600 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5c4fcc58f4
R13: 0000200000000100 R14: 0031656c69662f2e R15: 0000200000000080
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Code: 8a 01 fe e9 80 fd ff ff e8 db 64 97 fd 48 c7 c7 60 6e 31 8f 4c 89 e6 48 89 da e8 39 aa 14 01 e9 73 fe ff ff e8 bf 64 97 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d39f078 EFLAGS: 00010293
RAX: ffffffff842bf2c1 RBX: 00000000fffffcda RCX: ffff88801f41a440
RDX: 0000000000000000 RSI: 00000000000003fa RDI: 00000000000000d4
RBP: 1ffff110082999f4 R08: ffffffff842bef72 R09: fffff52001a73e00
R10: dffffc0000000000 R11: fffff52001a73e00 R12: ffff8880414ccfa4
R13: dffffc0000000000 R14: ffff8880414cc000 R15: 00000000000003fa
FS:  00007f5c4fc216c0(0000) GS:ffff88808c599000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5c4fc00d58 CR3: 0000000043b00000 CR4: 0000000000352ef0
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
