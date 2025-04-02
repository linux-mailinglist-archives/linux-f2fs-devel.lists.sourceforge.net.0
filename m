Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F55A78567
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 02:00:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzlXE-0002UQ-T8;
	Wed, 02 Apr 2025 00:00:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3FH7sZwkbAAk178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tzlXD-0002UJ-Nn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsM3Ilm2N3CBIYDrmEbMx4uh1PJkyy+Bbjo8v8OIzH8=; b=l3liLsJ7kaCH3qc7linsHJSXOi
 hpd00xGMZUt0tdVU0QCfgvJwBKHY9eqrSzXp9sn4jTgmk4topTONRRgN/xoIxqvJM9uy6UcKzytba
 Q0Kz74I4bWd9YsIvnaZYXf20GmAjOUvuGWPwjtO9mauxl2kPpcz7BtjABKYiazywuyHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GsM3Ilm2N3CBIYDrmEbMx4uh1PJkyy+Bbjo8v8OIzH8=; b=O
 OyMN3Pija/wQ18G8+IzQhJ7VW4zZfpffwM3gY6vmLLXvY0wBiWGW3KWtr/fh/1tAWO/cF9X65rUJJ
 JApqeyWVgqK+70rcok1C8Cwo4E7081h3V75PYZ3hMAbC1Z+HUhAYCd1SJP8JHvRLnQzewnZ0gwRNW
 NLU85nemMjpmH2RE=;
Received: from mail-io1-f78.google.com ([209.85.166.78])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tzlWx-0006JB-A3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:00:48 +0000
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-85b5e46a526so651350139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Apr 2025 17:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743552020; x=1744156820;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GsM3Ilm2N3CBIYDrmEbMx4uh1PJkyy+Bbjo8v8OIzH8=;
 b=YFvYaBEiq8TG0CcS6MJi4mwMGFaJvF5jMcUBNF2SSYr7YiB0/l0/5HEh2+2TwsstUY
 E9PmCJkHbLLFoSkpWpfdp6YqEiILOCVceY4n6H5hb/p/k4048HkU6JT9VeDfnEh7gwsy
 KLHaLkEQpOd9whLHj7cM7ivpJT9HkevFUx8NPx8naLkkTxLH3EoBBZdarJg+cLCCONa1
 RpkdslNYTkgAQvFKMMHxzdGjRiC+dN23yd/1xrAh2xSjcNGKmv4m7cYRX4E/pqIVfyrR
 JvYBrs2oJDcTzXWkF4xyR/Hd9DiMspbig7k6l7TSLUnIkuiSRYeaS0ZzgcEN0I99hYow
 1YYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA4MjsF51So8+F5eDdPCPiOwK5WzAPTEL6YFJ0/QzVd7xV4/XXBj7b+ZA0DgXC17W1IqtnCKRu5gXDwOOOeiCq@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwMj+ZYoUvQoCb4orNH9uIrDbfFY13BDZDpkeXGIuQpIDrK0D07
 D0c6GtHkrdmR4XlIN5xspymuu89DkJ/cRGdT7Ys1CFoMLK/VTrgBWAUTbdx8MlF/k2g8sgpi2NO
 vrRgbvmD4hdcLrxBqB971WlEFsKyYV3yKTZVYeP2hPLPr3nlVHJcx7W8=
X-Google-Smtp-Source: AGHT+IHeZKlpXHH1suOWjsbDsdSn84HHpn0TaUzLiOwfkGj943XDNLMffuhXk6TJOAS1x1S/0YTZ4f3JLmdC8mvSh96YQiSAILA6
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:746:b0:3d3:f27a:9101 with SMTP id
 e9e14a558f8ab-3d5e08e9ec2mr181422665ab.1.1743552020538; Tue, 01 Apr 2025
 17:00:20 -0700 (PDT)
Date: Tue, 01 Apr 2025 17:00:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ec7e14.050a0220.31979b.0031.GAE@google.com>
From: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 4e82c87058f4
 Merge tag 'rust-6.15' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=17007198580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.78 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.78 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.78 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.78 listed in wl.mailspike.net]
X-Headers-End: 1tzlWx-0006JB-A3
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io
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
console output: https://syzkaller.appspot.com/x/log.txt?x=17007198580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4253e469c0d32ef6
dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5e6f1c2744e3/disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5c1a60744d62/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/228bbd75bd12/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:358!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
 blk_complete_reqs block/blk-mq.c:1220 [inline]
 blk_done_softirq+0x100/0x150 block/blk-mq.c:1225
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 run_ksoftirqd+0xcf/0x130 kernel/softirq.c:968
 smpboot_thread_fn+0x576/0xaa0 kernel/smpboot.c:164
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
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
