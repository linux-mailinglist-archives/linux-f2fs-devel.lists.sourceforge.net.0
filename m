Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D0A86A82
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Apr 2025 05:17:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3RMQ-0002RR-6E;
	Sat, 12 Apr 2025 03:16:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Bdv5ZwkbAOgcijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u3RMP-0002RL-0m for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 03:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6zi2RrzRY7UuAAecIJ8rYOOGjA2CcvwJYV7rTH538w=; b=CeocH6qIr/qX58WapbG3tV5LFC
 ivwR/sKStYdn3bmivgfm7WduqzgVit65n4061zJBcqUArZdWCg9rIDcEo8OxfwAzMuzv8geSqjQAK
 wjrSeldjJm8n9mwfOZwmps5si2TQlOvhxdA308xGn9TpusT/iJloIIQWjekcd/Ew2yfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r6zi2RrzRY7UuAAecIJ8rYOOGjA2CcvwJYV7rTH538w=; b=M
 mlrSout6NSM0hhTNdeB8wicENe032NXS0eSvDySamDkA7QIpqj3S/bycZbvimy+fNq6kgIG8LFAiF
 zywEjhk3WOS4TZ9qUMPlxFRumrHWei1KQf3nE8EzhrW9OJWiXS9hgSS03AYENwjPKLAT2dAvLoLzx
 H/L6Y6KlwgXMaorY=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u3RM8-0002Gf-7P for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 03:16:48 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3d5b3819ff6so27104345ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Apr 2025 20:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744427781; x=1745032581;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r6zi2RrzRY7UuAAecIJ8rYOOGjA2CcvwJYV7rTH538w=;
 b=UG61PKkfhmu83k1XjC3unH14RVx5aMA7nw1Qvj9SfwdcgkSnInrpkaTRxErmU9vA5g
 9gecVuzFPqi7Ip2wTHF1JVytykk7ZpuVu6/NXHTy4bCewTgH+JJoUhfTrWnavpOvAaOK
 XKFqmfbEw5C+A1xtoiJ/6zpFJBvVoCgqdTGXOAZXxtCnGnTNDRjCna0fj/ajogyhuUyN
 SGqNYd1IhBsj4r128OYG3Y4OpiakmET/6FamLn7vQ5RqlwzDyqgqbAlb/HM/v5y44aXk
 lW4QznKtPgqeRae+lfY1LhTHxNsMZoRjSjmqa9RQ9Wns3IKn4Tu2erk6AVUkAnrxj7ZP
 lrWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4wFUOlIpK6KFzRlBuaTKGsPyDUckw0wxSdsmt1ZBhwv7nEeyxOvxNI+vRlSB1hd+i9sXrSAoom2m+dIlavEy@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyB706SJh5RDfrc1vOID0efV9+DjsOOsYCnSNNG7zfDcfsKPuop
 YA7y8nj0cqBKASURDX4lIkCxt2onJjSQVEV1oTq8aKYBGktT7bwyuKEqOBKg4HY/bjvHAVYQTV1
 rPXvUrOCkEfNGxbulTu0lwZdsPH1ByR02aaAbHkK2qhyXTocCO7s1l+w=
X-Google-Smtp-Source: AGHT+IEq826wkvnIK8SjQD79IkL4KhtGSaNCTmn1wcJNjdchRYnl5H3yFn0YXsQe6TF4pKOrIeC4ehQfzIN5dEIbI7nIlo+i8ZqJ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2603:b0:3d5:d6ad:286a with SMTP id
 e9e14a558f8ab-3d7ec225f5amr50705875ab.13.1744427781538; Fri, 11 Apr 2025
 20:16:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:16:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f9db05.050a0220.379d84.0004.GAE@google.com>
From: syzbot <syzbot+1badb065d3258a08f5e2@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 0af2f6be1b42
 Linux 6.15-rc1 git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output:
 https://syzkaller.appspot.com/x/log.txt?x=11464c04580000
 k [...] Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1u3RM8-0002Gf-7P
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_put_super (3)
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

HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11464c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7cb758c9c7b24c
dashboard link: https://syzkaller.appspot.com/bug?extid=1badb065d3258a08f5e2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d136202c0eb5/disk-0af2f6be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3adf5299bf86/vmlinux-0af2f6be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f351885eecb/Image-0af2f6be.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1badb065d3258a08f5e2@syzkaller.appspotmail.com

F2FS-fs (loop2): detect filesystem reference count leak during umount, type: 9, count: 4
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1674!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6486 Comm: syz-executor Not tainted 6.15.0-rc1-syzkaller-g0af2f6be1b42 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672
lr : f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672
sp : ffff8000a0c17960
x29: ffff8000a0c17a50 x28: ffff8000a0c17980 x27: dfff800000000000
x26: ffff700014182f30 x25: ffff0000cac24000 x24: 0000000000002ff5
x23: ffff0000cc3a6087 x22: ffff0000cc3a6087 x21: 0000000000000004
x20: 0000000000000009 x19: ffff0000c6fc0000 x18: 0000000000000008
x17: 00000000fffffffa x16: ffff8000833376cc x15: 0000000000000001
x14: 1ffff00014182e60 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000001 x10: 0000000000ff0100 x9 : 6e36701c3beb6900
x8 : 6e36701c3beb6900 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a0c16fd8 x4 : ffff800090035280 x3 : ffff8000832c7c3c
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000058
Call trace:
 f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672 (P)
 generic_shutdown_super+0x12c/0x2bc fs/super.c:642
 kill_block_super+0x44/0x90 fs/super.c:1710
 kill_f2fs_super+0x2b4/0x590 fs/f2fs/super.c:5032
 deactivate_locked_super+0xc4/0x12c fs/super.c:473
 deactivate_super+0xe0/0x100 fs/super.c:506
 cleanup_mnt+0x34c/0x3dc fs/namespace.c:1435
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1442
 task_work_run+0x230/0x2e0 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x178/0x1f4 arch/arm64/kernel/entry-common.c:151
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xac/0x168 arch/arm64/kernel/entry-common.c:745
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: aa1303e0 2a1f03e1 2a1403e3 97ff825f (d4210000) 
---[ end trace 0000000000000000 ]---


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
