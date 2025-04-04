Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672DA7BD3A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Apr 2025 15:08:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0gma-0006KP-UG;
	Fri, 04 Apr 2025 13:08:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3kNnvZwkbAEk39Avlwwp2l00to.rzzrwp53p2nzy4py4.nzx@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u0gmA-0006JY-Qu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Apr 2025 13:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1fvMCY2JUJRG87qPby/oGePzuL1QA+lz/AMwwbDcE0=; b=exDeo1zJ7ikK0H5g/gG5d+qxLs
 jm/VC1iJWJ7HV4FHWBzcLMiKwzoF7TCw6ZBT88pxolmESUl1CXaK/Zp1vNhUBvk0KRXjC0buLT2x4
 ytzAj68Z2rYOh9APbNHsXfOy1BarCxqpTr/EHCREhRk8Rc5VNQ/teYM5VqLwzQvqeFPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l1fvMCY2JUJRG87qPby/oGePzuL1QA+lz/AMwwbDcE0=; b=I
 ZVEynGCYyS+Kg2IA3sDfWhogZArBB/VGhACsdnw0HJEa84MUfjc+bPpXUKiexbVBZKGkptMV1f2x5
 QdAOuDzTrSl5WCvCO66g/SLQkRMZBy3/q3CGZTCcLeISxUNmJ4QRWzZt2XrwSPgMASD/CqYZl9MB9
 zB5wm7wU3WnbReOA=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u0gli-00046w-0z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Apr 2025 13:07:50 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3d43b460962so38628015ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Apr 2025 06:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743772048; x=1744376848;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l1fvMCY2JUJRG87qPby/oGePzuL1QA+lz/AMwwbDcE0=;
 b=QBqaCQHWcNPbfF6IbAsBgZ3OXh7/O9pFoyhTQTvun3m7dhTexFIQ3mgViiZT06VTTj
 p5mXUt6DbAShJC0lycKGZmL6/GGTvq+C3IgGuAyWFEOddKRYgdO3Mou23cwz5Fg6GnnG
 ZJQIXJq5YQ8Mrb7rhw6gbSgJEGB7cUVGz/GElRD4sorll/HlwUTyNK8UFPce+KeKxLEA
 aeG6pk2EbrMl7ksQ3xqLdrd6a34HNUzXVo9QqzvjcC4UurAMY1bxGm2fAlZyHAoa+jtA
 0HQtH2H+6xbmcr4zw97gtl6MnMI4QFYSdmMDjJpG7QRuWIdQfTJvthiGNtrKjm5fU1+B
 am6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzZxjIxI631lBsbWUxDCxvo3ros1/gdGc4vAXNfZ78zVWuXhZy8IkLtsUfz5cEKvGObLr+7WyhkodpLd1m0FZL@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyhi0xMUrclVOwzb/hL9o4nFkeDUeGIGkjuHnbCIGLOuSklNT0q
 PCnXgJuSoiNE85CVs9HeDHeEED9ebTX9EB44bW7CF7NuADJB8aSiNcuJC0tORKb6AJUWTiaTAWo
 OWem/5YD5AKeqWy/nHqG43Ts1zT+jDsNjnbCBIRQlPXql/U/Wf6Wx5Io=
X-Google-Smtp-Source: AGHT+IGHrGv4gMDgf/BkqiwxQXwKZW9su5+LUh5CNYr3E8KbZRXr+gwIqFcuZmZ7O73uMjUrZtYhg9eGQAsB3jaGj9W6RrtaaIej
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2505:b0:3d4:3fed:81f7 with SMTP id
 e9e14a558f8ab-3d6e3f8a346mr36349305ab.19.1743772048294; Fri, 04 Apr 2025
 06:07:28 -0700 (PDT)
Date: Fri, 04 Apr 2025 06:07:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67efd990.050a0220.2dd465.0212.GAE@google.com>
From: syzbot <syzbot+9ee4dac2dd49f4cbdefc@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 4e82c87058f4
 Merge tag 'rust-6.15' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=11502404580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1u0gli-00046w-0z
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_truncate_hole
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

HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11502404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8721be6a767792
dashboard link: https://syzkaller.appspot.com/bug?extid=9ee4dac2dd49f4cbdefc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ccdcf680a51b/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/90fe1b8516ea/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ee4dac2dd49f4cbdefc@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
=======================================================
WARNING: The mand mount option has been deprecated and
         and is ignored by this kernel. Remove the mand
         option from the mount to silence this warning.
=======================================================
F2FS-fs (loop0): Invalid segment/section count (31, 24 x 150994945)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:1207!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5327 Comm: syz.0.0 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:f2fs_truncate_hole+0x511/0x520 fs/f2fs/file.c:1207
Code: 00 65 49 8b 07 48 3b 84 24 e0 00 00 00 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 00 1b 99 fd 90 <0f> 0b e8 68 3c 03 08 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d4076c0 EFLAGS: 00010283
RAX: ffffffff842a6210 RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e52a000 RSI: 00000000000034f7 RDI: 00000000000034f8
RBP: ffffc9000d4077f0 R08: ffffffff842a607d R09: 1ffff110088e93ee
R10: dffffc0000000000 R11: ffffed10088e93ef R12: 0000000000100000
R13: dffffc0000000000 R14: 00000000000006c0 R15: ffffc9000d407740
FS:  00007f8796bba6c0(0000) GS:ffff88808c5b1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9428395ed8 CR3: 0000000033d36000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_punch_hole+0x250/0x2a0 fs/f2fs/file.c:1266
 f2fs_fallocate+0x588/0xa10 fs/f2fs/file.c:1967
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8795d8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8796bba038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8795fa5fa0 RCX: 00007f8795d8d169
RDX: 0000200000000480 RSI: 0000000040305829 RDI: 0000000000000007
RBP: 00007f8795e0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f8795fa5fa0 R15: 00007ffe1a19b818
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_truncate_hole+0x511/0x520 fs/f2fs/file.c:1207
Code: 00 65 49 8b 07 48 3b 84 24 e0 00 00 00 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 00 1b 99 fd 90 <0f> 0b e8 68 3c 03 08 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d4076c0 EFLAGS: 00010283
RAX: ffffffff842a6210 RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e52a000 RSI: 00000000000034f7 RDI: 00000000000034f8
RBP: ffffc9000d4077f0 R08: ffffffff842a607d R09: 1ffff110088e93ee
R10: dffffc0000000000 R11: ffffed10088e93ef R12: 0000000000100000
R13: dffffc0000000000 R14: 00000000000006c0 R15: ffffc9000d407740
FS:  00007f8796bba6c0(0000) GS:ffff88808c5b1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005648f9c017f8 CR3: 0000000033d36000 CR4: 0000000000352ef0
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
