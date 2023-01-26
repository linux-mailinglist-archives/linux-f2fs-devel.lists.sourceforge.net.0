Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F467CDF8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Jan 2023 15:24:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pL3Aa-0002Jx-D6;
	Thu, 26 Jan 2023 14:24:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-ozSYwkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pL3AZ-0002Jr-DV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jan 2023 14:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fokMFk2aHN6zddqQgmkFpmX2jguDNP9PGOuf1Cbb47M=; b=X9RlisESkDfWqyV3dT7ab+QG6K
 C53UeWPNhpxLLmEY0KCMjeOd/MCsHx/NVUnG+Xj3VgSmfBFxeMgxDFJxgIOt0Kbb/BKKlHp13vljx
 nvcs+43oEg23YhXVYlKdXbMggAdSjKyc520z6XaaXaGAtFceD7EkZ3SwqwBIjGJAmC6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fokMFk2aHN6zddqQgmkFpmX2jguDNP9PGOuf1Cbb47M=; b=W
 v1fnvy/j5xmCvuw+CeBVYzc2ynL1Rv/InRc3qzYVMUQf5Itk/DYOAztqAPAtwbCMjhSy60naz97BK
 slGGWx+QZtMYRLQiZDLnUIrMTuHnGAkWxhmSp91LqAb/Zy+NenTNLtw+fZsm1Y9lrFDpY3+tmYokG
 IzqACn4tO9cOMLvE=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pL3AV-00Gonk-W6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jan 2023 14:24:01 +0000
Received: by mail-io1-f70.google.com with SMTP id
 y21-20020a5ec815000000b00707f2611335so971382iol.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Jan 2023 06:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fokMFk2aHN6zddqQgmkFpmX2jguDNP9PGOuf1Cbb47M=;
 b=hp3OYDS/g+TE7eVcoXm8NYYJnXHnLlOqY4+hb9KxHwMvqavGDtpiCnyPxn64iMbiAS
 iIfAWCWgK011nzL5nvdtBZSzhGpEYb/MI6ue6kF2GY3+rb/OPqR2lA/uprIgYQyRQ0Ys
 I9xc/yGWevfdY9d4OsgzNK42nHJwOsEUnSMK3HVLJU/MQii2fWqUJui0UQW8Za3iGntU
 q/pIJHagZ4S6zQxKlyGyyPUBy8RfP0pepJhZhtYK3LsKPRyP83Hpa+b7u1T2nnM0/4vS
 NhZaTxtTRJS0GW9fA6Oz8O8HvPKlydcN3QTsxbka2TbWzF5nNXA9inh6HYtSU1BaJhYW
 as4A==
X-Gm-Message-State: AFqh2kpAbJpOy1B7RD0GNj+rrL3MAy55FYLlFUNk8jjU45wK5yokWu6I
 TlXDWaMs2oSSnfdeTtRRQAPj294d5PgkjP7EG2lBB3GIJONS
X-Google-Smtp-Source: AMrXdXuAP/1Zy0f6YvtK7tUCnhizwYl81TIxyNzmzuoWRm8Y1WgcEv9smpIJCYZZCf6SxEUZnq2XtevM42BDdOwXjgCSH/JblIeR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:d8e:b0:30f:5c46:f30d with SMTP id
 i14-20020a056e020d8e00b0030f5c46f30dmr2633257ilj.146.1674743034437; Thu, 26
 Jan 2023 06:23:54 -0800 (PST)
Date: Thu, 26 Jan 2023 06:23:54 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a86a7c05f32b7f91@google.com>
From: syzbot <syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 2241ab53cbb5
 Linux 6.2-rc5 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=11e678a9480000
 kernel config: https://syzkaller.appspot.com/x/.config?x=c5d89b670f0 [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pL3AV-00Gonk-W6
Subject: [f2fs-dev] [syzbot] [f2fs?] UBSAN: shift-out-of-bounds in
 f2fs_fill_super (2)
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

HEAD commit:    2241ab53cbb5 Linux 6.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11e678a9480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c5d89b670f0458d
dashboard link: https://syzkaller.appspot.com/bug?extid=fea4bcda5eb938ee88ed
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e370de928a15/disk-2241ab53.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a32aa1a12bc4/vmlinux-2241ab53.xz
kernel image: https://storage.googleapis.com/syzbot-assets/914736862f98/bzImage-2241ab53.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com

F2FS-fs (loop0): Fix alignment : internally, start(4096) end(16896) block(12288)
F2FS-fs (loop0): Magic Mismatch, valid(0xf2f52010) - read(0xe8b)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
================================================================================
UBSAN: shift-out-of-bounds in fs/f2fs/super.c:4184:41
shift exponent 613 is too large for 64-bit type 'loff_t' (aka 'long long')
CPU: 1 PID: 5467 Comm: syz-executor.0 Not tainted 6.2.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x33d/0x3a0 lib/ubsan.c:321
 f2fs_fill_super+0x5518/0x6ee0 fs/f2fs/super.c:4184
 mount_bdev+0x26c/0x3a0 fs/super.c:1359
 legacy_get_tree+0xea/0x180 fs/fs_context.c:610
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7ad2e8d5fa
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7ad3bccf88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000000054f7 RCX: 00007f7ad2e8d5fa
RDX: 0000000020000040 RSI: 0000000020000080 RDI: 00007f7ad3bccfe0
RBP: 00007f7ad3bcd020 R08: 00007f7ad3bcd020 R09: 0000000000000003
R10: 0000000000000003 R11: 0000000000000202 R12: 0000000020000040
R13: 0000000020000080 R14: 00007f7ad3bccfe0 R15: 00000000200056c0
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
