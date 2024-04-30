Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8328B6F09
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Apr 2024 12:04:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s1kLo-00058F-KY;
	Tue, 30 Apr 2024 10:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3K8IwZgkbAKocijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1s1kLn-000589-4p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Apr 2024 10:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUCPXypqaDI7RZVA4dxNhXYP7Sd0MesVoRSUyJp0RhA=; b=f/UXqL8wNc8Wkj4D1ZBQ+F2OW9
 3gxxd8bX6wOInVV2ZVxXxHIbnYvzZ7jy6YjOQxhHY8rZKpo/TnVwDnDD4UK1AAf0vzOIF5OofeCa4
 fr0wrPpNRvC6MTmaOR8EYySYIoRe5AKOURhfaoExYM5NNZrd4C+t/R+HkgJ70lSvut+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WUCPXypqaDI7RZVA4dxNhXYP7Sd0MesVoRSUyJp0RhA=; b=F
 wBWsj/KYksDaPnxSa2RxWZ4henQMtbMSqamCu3HijwupOj7uEuvEVehSrAvymzVgF4qLy7R0bcD7D
 lo6K+oyuqaW2v0EU0/VbmFARCqLanHu1JOhuDW7QEoEiy48kZeStDnC0L8Xe0DTacmgtsUcymHkBx
 c1hnH9KXyc/bBs3w=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s1kLm-0003wL-0z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Apr 2024 10:04:39 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-36b2eee85edso61983985ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Apr 2024 03:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714471468; x=1715076268;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUCPXypqaDI7RZVA4dxNhXYP7Sd0MesVoRSUyJp0RhA=;
 b=E+BnwbXHxzWz2MKkHZblJC1UCXWTfNCxbb2/eGupwUaktpB3zjswBa/NLJDose+3sh
 3btcgVPilCVzG3TnBLOqXhoLHia7IUQACf2N0wEzeHEUa7nYXyH5EGsZAGNmqm4qoSh4
 NIgl6KoJZYQnYOwYt4z6UHFpeFuto9EzvxBTVqc5C7CMoBRC4tlWbLYGGlyo5Jh90qsA
 fmoCzrrXvhmm+QMS7e//7mmWzuLrKDz8J2Uv27Jqh6S2FGmqWgOEOCwQy4amZxBd0ouh
 o3XENmoLoPaLr8JdHu49DuBkb2HOAaaO8ei4llK5MdXD2QONzAGnu0AS9n069oBoi79U
 V4Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn4oyZUns87zFQRIgk1NPozpaBi0XXlY5BrhAM8WSVrZsmIZ+euwrQE512lpq6BfxqfPoqbj2DXo9iPzClE8Ja/r9NR1gB8IvZ9wTvJ5NXe4+Ij/1qYg==
X-Gm-Message-State: AOJu0Yyu269ZRoiNaZTjmO7qEs+CJD4lcv9TCalQVTvoHmp2h88m0RRK
 fUdGfQYY2fbcu1Wx0efESCPv0gi72qI/Fk7G3w2OeSLbz3S11FE0QM+MbrukXYckKwCb1b225IF
 9F5HVQZTZ6NnZ7Ohld9z29830piTWxZLVIE+dJXLmOXxlovOdvfX0Wkg=
X-Google-Smtp-Source: AGHT+IEo04hPMGUrxInQkQx/yfDEgwz6h0WPyzDNg0oyZM5zMoVchRHknLBbO2rLRAo281Gmc6VQ8z3oGoSlRvV/50dMH0ujfhwm
MIME-Version: 1.0
X-Received: by 2002:a05:6638:450b:b0:487:4ad0:def3 with SMTP id
 bs11-20020a056638450b00b004874ad0def3mr531033jab.0.1714471467806; Tue, 30 Apr
 2024 03:04:27 -0700 (PDT)
Date: Tue, 30 Apr 2024 03:04:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d103ce06174d7ec3@google.com>
From: syzbot <syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9e4bc4bcae01
 Merge tag 'nfs-for-6.9-2' of git://git.linux-.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=10937af8980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.197 listed in list.dnswl.org]
X-Headers-End: 1s1kLm-0003wL-0z
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_inline_data
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

HEAD commit:    9e4bc4bcae01 Merge tag 'nfs-for-6.9-2' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10937af8980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3714fc09f933e505
dashboard link: https://syzkaller.appspot.com/bug?extid=848062ba19c8782ca5c8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b98a742ff5ed/disk-9e4bc4bc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/207a8191df7c/vmlinux-9e4bc4bc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7dd86c3ad0ba/bzImage-9e4bc4bc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inline.c:258!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 1 PID: 34 Comm: kworker/u8:2 Not tainted 6.9.0-rc6-syzkaller-00012-g9e4bc4bcae01 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: writeback wb_workfn (flush-7:2)
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 6f a5 0b fe e9 d6 fc ff ff e8 25 33 91 07 e8 f0 05 a7 fd 90 <0f> 0b e8 e8 05 a7 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc90000aa68e0 EFLAGS: 00010293
RAX: ffffffff83ef09c0 RBX: 0000000000000001 RCX: ffff888017ebbc00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90000aa6a10 R08: ffffffff83ef0485 R09: 1ffff1100c270ef5
R10: dffffc0000000000 R11: ffffed100c270ef6 R12: ffffc90000aa6968
R13: 1ffff1100c270ef5 R14: ffffc90000aa6960 R15: ffffc90000aa6970
FS:  0000000000000000(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc5425ff000 CR3: 000000000e134000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 f2fs_write_single_data_page+0xb65/0x1d60 fs/f2fs/data.c:2834
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3288 [inline]
 f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3315
 do_writepages+0x35b/0x870 mm/page-writeback.c:2612
 __writeback_single_inode+0x165/0x10b0 fs/fs-writeback.c:1650
 writeback_sb_inodes+0x905/0x1260 fs/fs-writeback.c:1941
 wb_writeback+0x457/0xce0 fs/fs-writeback.c:2117
 wb_do_writeback fs/fs-writeback.c:2264 [inline]
 wb_workfn+0x410/0x1090 fs/fs-writeback.c:2304
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa12/0x17c0 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f2/0x390 kernel/kthread.c:388
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 6f a5 0b fe e9 d6 fc ff ff e8 25 33 91 07 e8 f0 05 a7 fd 90 <0f> 0b e8 e8 05 a7 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc90000aa68e0 EFLAGS: 00010293
RAX: ffffffff83ef09c0 RBX: 0000000000000001 RCX: ffff888017ebbc00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90000aa6a10 R08: ffffffff83ef0485 R09: 1ffff1100c270ef5
R10: dffffc0000000000 R11: ffffed100c270ef6 R12: ffffc90000aa6968
R13: 1ffff1100c270ef5 R14: ffffc90000aa6960 R15: ffffc90000aa6970
FS:  0000000000000000(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e628000 CR3: 0000000049462000 CR4: 0000000000350ef0


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
