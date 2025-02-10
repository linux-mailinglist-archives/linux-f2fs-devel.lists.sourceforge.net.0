Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC6A2FC75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 22:42:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thbXy-0006TP-FL;
	Mon, 10 Feb 2025 21:42:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3v3KqZwkbAJIEKL6w770DwBB4z.2AA270GE0DyA9F09F.yA8@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1thbXx-0006TE-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 21:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SqQhy0Y5TgYDcezr1M85ge+33MjYrfp7G29IZMuuK4o=; b=BaAJwOOsTfFFIb1E9kr4xFm7xe
 qk0Grnw+NQGR3k0e1odzb7wGc9dcdYVHCY5zVBqA/zeNIayaYIjtosFd8lMRu1SOVEu/KoSm1cSiK
 ly2mNal6ihCo31z3tHQWRejhAHTrhQgYWgUMKrCHix6SKagKq2zED4fawdOKIqPe+oxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SqQhy0Y5TgYDcezr1M85ge+33MjYrfp7G29IZMuuK4o=; b=l
 fynNRK6JLClU7+Th7bhLIPxYJ4ZRzJPD7fRaEQIy3Y54TAvFckemS3Fwht72YHt58bjUCiZf7T3Je
 jZVH9PV9qMV19wsh1bJZPOFeR+6alGWt0v9PAbLtY9QqOBuj1fuM1SGpW+62N9r7rahI41nXskbYc
 ui7sFdLXuHlfrB5Y=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1thbXx-0001Ko-JS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 21:42:30 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3d0225c44e8so98291305ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 13:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223744; x=1739828544;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SqQhy0Y5TgYDcezr1M85ge+33MjYrfp7G29IZMuuK4o=;
 b=vOFh3oeLklOxNwqnZxSUKqEdVrn81QQcU/XplgT4xfI1lDkntAUVczl2uJTtrT3aAk
 ky93k3GdGu+IX8wwEqJObMQvtYCQPndD9ZmGMcFEgCUGbu1GPnEj75RwfdWdZK6H6yFV
 g/O7ZYtyyYWgjAb0CllxUcd8T0pKmJWAVXVhfdBdopvcUPPMXhXZMr2P7ZI97IXEamRJ
 9D/G+BeZpQFLMf2zKWYlMZQuSGhSSYZtsoUzvL51AosbPw9FNRKPhI7gaFIMJy0oXHNg
 ++HP5IxVXd4ZdUmCfBNdwy4/MixDL+fQSp7v6AEkfGp/B8zW3cG+A6SrcZHdhe2IJOEa
 s/qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsksDs1LA0tE01tkEZLvnN7kUsEmQiRUOKLq7dE9Eo2ibzNr/rjZflWtRR5Afd62A4wEkZL2Zl1D3fufwJ9fFR@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz68JUPlaVWyBpNES63bNiVwJR14yBDLoiXy93A19uuICq095zf
 zm8GtK+abPGB8YA4sBOmvsORUg4YIQSnX2RqSpsMy02JRZi6CxsYUvnlKuI71uRL5f6ZV/zF0k3
 9BcTjGg+qgHEVdLjl2twxgKJ0P0fZtggkOsfVStAOrRnuL8VBckbtJ04=
X-Google-Smtp-Source: AGHT+IF/4qbOPnFVF9FI6fwKawHD7t0BOiqv2OpCMB0bJaybSvZMmJzf5ueFPa+4k+L7aSw0dBP8zRZhH7Avosa5X9pA0o6IcVNf
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3421:b0:3d0:3851:c3cc with SMTP id
 e9e14a558f8ab-3d13df2249bmr135265685ab.16.1739223743937; Mon, 10 Feb 2025
 13:42:23 -0800 (PST)
Date: Mon, 10 Feb 2025 13:42:23 -0800
In-Reply-To: <675cd64e.050a0220.37aaf.00bb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aa72bf.050a0220.110943.0035.GAE@google.com>
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
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
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: a64dcfb451e2 Linux 6.14-rc2 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=17297b18580000 kernel config:
 https://syzkaller.appspot.com/x/.config?x=7f246b548e [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.207 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.207 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.207 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.207 listed in wl.mailspike.net]
X-Headers-End: 1thbXx-0001Ko-JS
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg (2)
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    a64dcfb451e2 Linux 6.14-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17297b18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f246b548ed0635a
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103943f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da1bdf980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a64dcfb4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a816640d31b/vmlinux-a64dcfb4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5cb42ffa4f6/bzImage-a64dcfb4.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/caba9b9b8f24/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14da1bdf980000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/270c3c4c1558/mount_6.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=121672a4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com

F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Start checkpoint disabled!
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e6
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2809!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5304 Comm: syz-executor274 Not tainted 6.14.0-rc2-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3273
 f2fs_allocate_new_section fs/f2fs/segment.c:3287 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3301
 f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1849
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1959
 vfs_fallocate+0x623/0x7a0 fs/open.c:338
 do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffbafdefd99
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffecbc98b98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000400000000080 RCX: 00007ffbafdefd99
RDX: 00004000000000c0 RSI: 0000000040305828 RDI: 0000000000000005
RBP: 0030656c69662f2e R08: 000055556f0154c0 R09: 000055556f0154c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00004000000000c0
R13: 00004000000000e0 R14: 00004000000000c2 R15: 00007ffbafe3903b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
