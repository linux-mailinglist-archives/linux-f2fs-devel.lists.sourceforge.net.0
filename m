Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31A950E25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 22:49:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdySW-0003RT-HX;
	Tue, 13 Aug 2024 20:49:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <32Ma7ZgkbAJEDJK5v66zCvAA3y.19916zFDzCx98Ez8E.x97@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sdySU-0003RJ-PT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 20:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c5Kkke9tL3v4lVVfPkmFG8izoAwG1RpBwsTReLWE04I=; b=cnKB9cWcbNz9gLK39OJAG0ThTv
 D6HPuLsx44iPR5z43/8dEG7e85q8oRNQEnaaYGjC7Mqqh9riQ+7YbUsNTZ/oRpkBILgKbBTzKNE2v
 rVZCPAmAZFpI2Jo3F+HKZWQFBOb39MOsd1XzlQD0YvZ5ntfjlPqn0Fh+ZhAlQTrtof/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c5Kkke9tL3v4lVVfPkmFG8izoAwG1RpBwsTReLWE04I=; b=B
 CF65wUIN7np5X9iDz8yrxM/3rlwN7YWBwGG1fBPRSiX3dSgCgm/YkNrTKqLiStO0IFkMF0tzL7aGs
 NGBvH7JziH2woXFgZHl5NnHTD0mU6AoHx0jQszU/iu5MHbyUOtXhkuApA1bQbIprwhePu2B0TuHZJ
 ft50rvla0aBYW2Mg=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdySU-0004yi-OR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 20:49:35 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-39ad7e6b4deso76086675ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2024 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723582169; x=1724186969;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c5Kkke9tL3v4lVVfPkmFG8izoAwG1RpBwsTReLWE04I=;
 b=o7sKhkxIRC92dPIPOD08i4njfnhWUDP3L2rfabIQH5uVLDPgxkwb7FV24tWD8JylC7
 z+P5+HYtM6zFEGhVeAqgAkSrcHtnABlmH0bq+baakNeIkmppJU6KjjOMgYBUMTHybvlv
 Q1r/3o5+ubm+2XjrVycVMd3kaG3p5HEmlS1XUAjG+xKR2oZ4lPPOaogzjLzsIk1X0Xhv
 DGcD3NTsCtdxtS2bdrbaLN9UldkYHP1dMiheFX0KaTF3KK3nbQMqciHfvGNyzBPDSY8m
 AEBdT2yCJStDKt0eXG1H/m2JxQLoT+bJpIbSXnreUHU8AmnK3e+99xngfuYLIrQMrUqe
 gz2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/rybxOaX2UjtxorjYy8jhsUCJbVYF07jBkeIyUR6/h4kRkjwzbQTojwWAYW1VKp/yGZ4DQL2IgLDEbMLRdz+b8DaE51NGsXjIR/Z7VwVVWD3z4OMBUg==
X-Gm-Message-State: AOJu0Yzh61555EwOhTBkEhzRoLqriLvqO6Qig/qjVWq46c1PEZohgc/E
 AZZForMs5dSRTnVSCsVHB802TQbNwFp8Bx4l/6xVncRy1p7vJD7OBt/pmd6phUGtF5SqS86puzV
 qYofFPubVkvvAsd3MLGZSBpO5/5IYJk34OJqRKw2A74FQvVGiPEGicLM=
X-Google-Smtp-Source: AGHT+IHxnlYeDkxLzfdRvriRh4COdW9nBQXt9nEoPN/DpZLTo0V4Qzu1bzwzXUiRALbjaRfvOPOYfvwMrEdFz5GhjZY2J4mGlAdS
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca7:b0:39a:ea89:22e8 with SMTP id
 e9e14a558f8ab-39d1245851dmr454095ab.2.1723582168930; Tue, 13 Aug 2024
 13:49:28 -0700 (PDT)
Date: Tue, 13 Aug 2024 13:49:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ebae95061f96be85@google.com>
From: syzbot <syzbot+78ff2855f26377625419@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9e6869691724
 Add linux-next specific files for 20240812 git tree: linux-next
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=177ea68d980000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.200 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 FROM_LOCAL_DIGITS      From: localpart has long digit sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdySU-0004yi-OR
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning to
 user space in f2fs_commit_atomic_write
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

HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=177ea68d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
dashboard link: https://syzkaller.appspot.com/bug?extid=78ff2855f26377625419
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13deecd5980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c1fdd9980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/a0c7f05fa485/mount_0.gz

The issue was bisected to:

commit 7566a155c666dd23b413a002a50cd9ae7b95f053
Author: Chao Yu <chao@kernel.org>
Date:   Tue Jun 25 03:13:49 2024 +0000

    f2fs: atomic: fix to not allow GC to pollute atomic_file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1255068d980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1155068d980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1655068d980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+78ff2855f26377625419@syzkaller.appspotmail.com
Fixes: 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomic_file")

F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
syz-executor306: attempt to access beyond end of device
loop0: rw=2049, sector=45096, nr_sectors = 64 limit=40427
================================================
WARNING: lock held when returning to user space!
6.11.0-rc3-next-20240812-syzkaller #0 Not tainted
------------------------------------------------
syz-executor306/5229 is leaving the kernel with locks still held!
1 lock held by syz-executor306/5229:
 #0: ffff8880473a18b0 (&fi->i_gc_rwsem[WRITE]){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
 #0: ffff8880473a18b0 (&fi->i_gc_rwsem[WRITE]){+.+.}-{3:3}, at: f2fs_commit_atomic_write+0x105/0x1510 fs/f2fs/segment.c:388


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
