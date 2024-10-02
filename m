Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B998E647
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Oct 2024 00:49:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sw8A5-000857-Is;
	Wed, 02 Oct 2024 22:49:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <38839ZgkbAMQ289ukvvo1kzzsn.qyyqvo42o1myx3ox3.myw@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sw8A4-000850-96 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Oct 2024 22:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RvxOQi9xFVJyAYD4SPSaHddmEAQF1noqJDuXy5vGPT8=; b=TCjeWs3KDl/H8P73eBiByCDhFB
 kIYsH4zSrz6Nq51nvazvH+OhuYajR9xknSIUkMHxsw2mNwKq7sFsUhROnpqnLSr1g5X85rSkJXjP5
 oGZYoSkkJQFe7xRZLVrnTRPbmKMOoRXraV3wpVID/JRqTWjjzxvDc5qLbtIFTtoaOMlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RvxOQi9xFVJyAYD4SPSaHddmEAQF1noqJDuXy5vGPT8=; b=I
 EKr/CtBbM0eS0uBnIc0kD5dHoP0L/utP/13AfuJM9/9+6lW5da5/MzfGyvGhe7tXb33aGHbdTg0SH
 e0ouQuNU5xGD/zMgc2P8G+BRNBPgtVDIekVUHDl4EqnMNaJsIR/UxMASSpGqANE5jbvwmMyDjXTWv
 NrW3g0MhgSsxjkow=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sw8A2-0001Cn-EK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Oct 2024 22:49:36 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a342e872a7so4308645ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Oct 2024 15:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727909363; x=1728514163;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RvxOQi9xFVJyAYD4SPSaHddmEAQF1noqJDuXy5vGPT8=;
 b=aTLi3vLGgbzSEbwaMKaEkbQy5Vm8NIeH96vYjjAh7U7x1KuAWH3kbgibaxsiiWB9Ds
 xWFMfrmrqMTvj6q8PP5BdsEIS7F/VPe38uU+rhgJZ/sLzTGFkGP6T+3drfwTOXqQYk44
 btxQHUlfhd6LM/JyZ7iPcR8AGWlC1QklABmCr5+ut7GH9s+Xgi1Yd0EeJ1xXojevldgT
 ZL5S3ujhErFESu/Lcg2uH/ncELTlBP37cvz2nJerYAEKMegAZGo3jNUmJz4StjZHtPfq
 +JLnXfvvZ5qnOIi6KMzG7YEg9M1gArKSuIVHN1DVtHMQ/knLkpurS20LZXPupORKjy94
 60Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYtmDqQWuH/zCKFvq44t4wIAt5+iHBhFWQOWlepyh1/n7iIe10dGxENir4VTsnUinw5Gr9KVualNQzq5JEZEFV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwpJBLobSVnSFcjHZJVNR7kTPrE7/EiSvwk6qfCtdVpGW2m0ybj
 ifuNzdE8BnJ65EIc+zJsChUqb7PjU9zJrd5U+zidacudt4bgDaMGbwvzwHghp+KOWRMw/tpYuAt
 GP51arnbwuEWPO107J+6rYlDMfknzl54D7JneevJykd8PzQSVIFOFGpU=
X-Google-Smtp-Source: AGHT+IESzE9QVhHj1f9F1AwaKPFizMah9awWpUEaMFUlePyIe/uO95N8nd43A8aYOxA5fbuHh/cwX/PteqtNEEXbfnGBAGWD+Zsd
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:138a:b0:3a0:8d60:8ba7 with SMTP id
 e9e14a558f8ab-3a36592c2dfmr44271465ab.14.1727909363643; Wed, 02 Oct 2024
 15:49:23 -0700 (PDT)
Date: Wed, 02 Oct 2024 15:49:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66fdcdf3.050a0220.40bef.0025.GAE@google.com>
From: syzbot <syzbot+6653f10281a1badc749e@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.6 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: ad46e8f95e93
 Merge tag 'pm-6.12-rc1-2' of git://git.kernel.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=122b3507980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.0 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
X-Headers-End: 1sw8A2-0001Cn-EK
Subject: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 f2fs_truncate_inode_blocks
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

HEAD commit:    ad46e8f95e93 Merge tag 'pm-6.12-rc1-2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122b3507980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=62086b2fd100a029
dashboard link: https://syzkaller.appspot.com/bug?extid=6653f10281a1badc749e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-ad46e8f9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/72b7539cbeb1/vmlinux-ad46e8f9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73c9b9cebaf4/bzImage-ad46e8f9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6653f10281a1badc749e@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 40427
=======================================================
WARNING: The mand mount option has been deprecated and
         and is ignored by this kernel. Remove the mand
         option from the mount to silence this warning.
=======================================================
F2FS-fs (loop0): Invalid log_blocksize (268), supports only 12
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: 209852 bytes leftover after parsing attributes in process `syz.0.0'.
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/f2fs/node.c:1170:12
index 18446744073709550692 is out of range for type '__le32[5]' (aka 'unsigned int[5]')
CPU: 0 UID: 0 PID: 5108 Comm: syz.0.0 Not tainted 6.11.0-syzkaller-11728-gad46e8f95e93 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 f2fs_truncate_inode_blocks+0xa07/0xd30 fs/f2fs/node.c:1170
 f2fs_do_truncate_blocks+0x7bf/0x1180 fs/f2fs/file.c:769
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:797
 f2fs_truncate+0x407/0x700 fs/f2fs/file.c:847
 f2fs_setattr+0xc08/0x12d0 fs/f2fs/file.c:1066
 notify_change+0xbca/0xe90 fs/attr.c:503
 do_truncate+0x220/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3395 [inline]
 do_open fs/namei.c:3778 [inline]
 path_openat+0x2e1e/0x3590 fs/namei.c:3933
 do_filp_open+0x235/0x490 fs/namei.c:3960
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1415
 do_sys_open fs/open.c:1430 [inline]
 __do_sys_creat fs/open.c:1506 [inline]
 __se_sys_creat fs/open.c:1500 [inline]
 __x64_sys_creat+0x123/0x170 fs/open.c:1500
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fce7717dff9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fce77eec038 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007fce77335f80 RCX: 00007fce7717dff9
RDX: 0000000000000000 RSI: 000000000000000d RDI: 0000000020000240
RBP: 00007fce771f0296 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fce77335f80 R15: 00007ffca65fb488
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
