Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F4A8A0C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 16:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4h3w-0000I0-NC;
	Tue, 15 Apr 2025 14:14:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3xmn-ZwkbANkNTUF5GG9M5KKD8.BJJBG9PN9M7JIO9IO.7JH@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u4h3v-0000Hh-R6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 14:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jVaI4aNOg3QGg9vdZU/iLIEZ2MJB4ZDSuhHpGVZGFyA=; b=CCAh9BG9EeOF2i1GazUUVI8F8J
 xWJ4O6VF2NjPzZsyhtH0p6WwZDw/cjixRZJ8ujdOqIQXPKosD0xmQd0f7kCb4yartwHJC30FbSkS3
 U4elkFbuA6DjpnxcUGomkMZi2GM/LKeCxvtDs2jDlBTObHsAhKK07/Gx77aHR4J0cCEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jVaI4aNOg3QGg9vdZU/iLIEZ2MJB4ZDSuhHpGVZGFyA=; b=K
 P+njqroc3piyNnRWx9NNxbpyg0btrhIX3E6/j+3Cg66eG2t8RN2WUWDdVBl54/W1n/p8RLn7rM8+p
 /qt1u7EqsP+pI2liHFJMYQJTJghavSDImHKGPdW7hi1Rx7VwknWBVJHkYLgANvCr8OAYA9oZ6HMuH
 VHGzK3cYZnONm+ns=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u4h3g-0007CE-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 14:14:56 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3d5bb1708e4so70937335ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Apr 2025 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744726470; x=1745331270;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jVaI4aNOg3QGg9vdZU/iLIEZ2MJB4ZDSuhHpGVZGFyA=;
 b=HK+DiIrLSUYxzJgPOCx2pssEsT2N4fhbrVeU6Ti9P7G0xI+tqYCYJTsgrFzMnc9F9L
 KW/eeBEb0R8qqno0ladjGarzXZooiR6rTXehhpZ9yxUTgv0RCnZOChCZ1NsiE8THB5Wc
 R62iFztHEiYmxQeOAG/XR9v2zGlHXaKDY4l1KOaYbSszOqmcuv3oSE/P9dEjlOlmx9Ir
 rB50RVG8ZAbMEOckS7v7EykdkuuR5wC/JjI7Z2YGeTch31LZ1fvWAkT00nMblj3rVRKy
 io3N3oKR+xX9v7vCZV9/f1F9y2M52OQ3YEx21gv425W+gifMhFd/64PU9WJR3PzsNB0J
 FD/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW13QjWUMUAx6sgMq5V//cRggmhrDjpZcq1r1710OpP0ww0GpiCRIQh3Rp5mk2hsZ7rauTJlXAzqr0e7x3iKjv1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTq6ADbnqjVckYLUHXVioUlsopteE/toAK1GWnIvP9qkuaxFfO
 JTm1ipDXhput9TKSA7QDhsGPcpdaG+VCafiDq1TANsYDjKVPx0HfTagBdCmp38rfuXDt2u6Lp8u
 dwp7T1Vh/N8zV+RtvVB+G77H78v1MsWRPXcOqYwh2TcoIQf3FxSaNilM=
X-Google-Smtp-Source: AGHT+IGNoWb8mjiEUbic2srKgNWVuuv5apmaiBpWsnnm0lLUReDXk70fxo8jFgHUzEpC2WEyYXBg/8BKwHWSNx0sGfbKJe2kdmCH
MIME-Version: 1.0
X-Received: by 2002:a92:c26a:0:b0:3d4:2306:a875 with SMTP id
 e9e14a558f8ab-3d7ec1f661fmr172171455ab.8.1744726470017; Tue, 15 Apr 2025
 07:14:30 -0700 (PDT)
Date: Tue, 15 Apr 2025 07:14:29 -0700
In-Reply-To: <67ec7e14.050a0220.31979b.0031.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe69c5.050a0220.186b78.0002.GAE@google.com>
From: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>
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
 HEAD commit: 834a4a689699 Merge tag 'for-linus' of git://git.kernel.org..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=10051a3f980000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-accredit.habeas.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
X-Headers-End: 1u4h3g-0007CE-Ni
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io
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

HEAD commit:    834a4a689699 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10051a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a972ee73c2fcf8ca
dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145a2fe4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13382470580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-834a4a68.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4454365a3050/vmlinux-834a4a68.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2d99dbd9f6f4/bzImage-834a4a68.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/89819a66cafe/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=13420b98580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:358!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 1033 Comm: kworker/u4:5 Not tainted 6.15.0-rc2-syzkaller-00037-g834a4a689699 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: loop0 loop_rootcg_workfn
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 fb d8 f0 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 81 d8 f0 fd e9 f1 fa ff ff e8 d7 9e 86 fd 90 <0f> 0b e8 9f 0a f4 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0000:ffffc90002597320 EFLAGS: 00010093
RAX: ffffffff843cb659 RBX: 0000000000000000 RCX: ffff888035d74880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc90002597430 R08: ffffffff843cb306 R09: 1ffffd4000219d7d
R10: dffffc0000000000 R11: fffff94000219d7e R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea00010cebc0
FS:  0000000000000000(0000) GS:ffff88808c593000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7f3f420000 CR3: 00000000430fc000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
 blk_flush_complete_seq+0x6bd/0xcf0 block/blk-flush.c:191
 flush_end_io+0xab4/0xdc0 block/blk-flush.c:250
 __blk_mq_end_request+0x492/0x5d0 block/blk-mq.c:1135
 loop_handle_cmd drivers/block/loop.c:1960 [inline]
 loop_process_work+0x1bdf/0x21d0 drivers/block/loop.c:1978
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 fb d8 f0 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 81 d8 f0 fd e9 f1 fa ff ff e8 d7 9e 86 fd 90 <0f> 0b e8 9f 0a f4 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0000:ffffc90002597320 EFLAGS: 00010093
RAX: ffffffff843cb659 RBX: 0000000000000000 RCX: ffff888035d74880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc90002597430 R08: ffffffff843cb306 R09: 1ffffd4000219d7d
R10: dffffc0000000000 R11: fffff94000219d7e R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea00010cebc0
FS:  0000000000000000(0000) GS:ffff88808c593000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7f3f420000 CR3: 00000000430fc000 CR4: 0000000000352ef0
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
