Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA18F793312
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Sep 2023 02:53:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdgnE-000538-7x;
	Wed, 06 Sep 2023 00:53:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3cs33ZAkbABsJPQB1CC5I1GG94.7FF7C5LJ5I3FEK5EK.3FD@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qdgnC-000531-An for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 00:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kdwrxuKw3aDgC7TsPyfzDkWDKgXCuVtFUYAIf25m1dw=; b=bFlLewqfYAvzlTAl00OxwmS9x3
 4fMXAYAq4ACNlAmSWQdFo5KNvsgoWoXhgyxDd7rlOnuIeYTLPojP+5tcsD5+ikOfSaulvBoXMulZK
 xkz4KJ7wosZxJU5Hw+BSwssrKx0844VXm8AH2aYil11eEgIESA7ZK376/p0Zab4jJWsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kdwrxuKw3aDgC7TsPyfzDkWDKgXCuVtFUYAIf25m1dw=; b=H
 HmeoOYfEF1fMWTdGu3v2OTujoDMvZx3XjcqBL5fCqpOcyDoZGH/htC2h91TFIKneUlpZLPksGZNyv
 HSRGHAJ6ZH843JzLcjrn5s7CO/BRV04xrYIcDHMaO3ez5Qrtt3XBi9NYAFhYCUUdJO81ysLYw6IlT
 5AHszmyV+iTAJBMU=;
Received: from mail-pl1-f206.google.com ([209.85.214.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdgnA-00065K-4N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 00:53:15 +0000
Received: by mail-pl1-f206.google.com with SMTP id
 d9443c01a7336-1c097e8a175so32826075ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Sep 2023 17:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693961586; x=1694566386;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdwrxuKw3aDgC7TsPyfzDkWDKgXCuVtFUYAIf25m1dw=;
 b=VFARRasjNnLoF/5ferUoJZ2JTfOsgDr27OMEWCsi/sYsANop2eJDQ3sE4Hc7+RsByF
 H6iWU2myjB5MmcLIP0LsvZ/KKetB69h+NXpdo19eL3fTjAMuTF1mA9jq8XeyrKvoQozo
 KFaVi0xw+bUhEsoCZ2nOzMz216NAtAEExrqvRraJal5bxxgOq6tlXLPfCpxL/rLKrYYq
 AbR8sperV08bsE2glwSvWQXW2D8CknUH5Y6gO/2m2nYUrPDf7wMLsrDSUcuL2O6M07Vk
 BTnJH2g3LMBodA2DYIMS4Q5Z4zxG775x+LSEv/vodP0Zc+zYIbKkg69jTyJAkESOuBK3
 MyJw==
X-Gm-Message-State: AOJu0YzqXGXnQp5sQ4a0MDeZrWp+DjxsB6pg+de8Cs4lMr2zIyHvbdJ0
 w0XGHTltgGfjlrXSFRYrCc9KV1bl3p1QP/LfSlUSvI5n5o0T
X-Google-Smtp-Source: AGHT+IGt/gmyyr1MtBbz39IpBNMgCLuXvqFPZKZJCsUwhDll6WqgzQZK3CV9ezLZYRftQtuSHkSBKMqpkwEC0WI6XQQ+CDGaVU2/
MIME-Version: 1.0
X-Received: by 2002:a17:902:e803:b0:1b9:e8e5:b0a4 with SMTP id
 u3-20020a170902e80300b001b9e8e5b0a4mr5009843plg.8.1693961586558; Tue, 05 Sep
 2023 17:53:06 -0700 (PDT)
Date: Tue, 05 Sep 2023 17:53:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a14f020604a62a98@google.com>
From: syzbot <syzbot+ebd7072191e2eddd7d6e@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 terrelln@fb.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: e0152e7481c6
 Merge tag 'riscv-for-linus-6.6-mw1' of git://.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=11072fdfa80000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.206 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.206 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qdgnA-00065K-4N
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_put_super
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

HEAD commit:    e0152e7481c6 Merge tag 'riscv-for-linus-6.6-mw1' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11072fdfa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=30b036635ccf91ce
dashboard link: https://syzkaller.appspot.com/bug?extid=ebd7072191e2eddd7d6e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-e0152e74.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8159e43fa183/vmlinux-e0152e74.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b0ced23e91f7/bzImage-e0152e74.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ebd7072191e2eddd7d6e@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1639!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 15451 Comm: syz-executor.1 Not tainted 6.5.0-syzkaller-09338-ge0152e7481c6 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:f2fs_put_super+0xce1/0xed0 fs/f2fs/super.c:1639
Code: 03 0f b6 14 02 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 27 48 63 0b 89 ea 48 c7 c6 40 f9 ba 8a 4c 89 e7 e8 ff 77 ff ff <0f> 0b 4c 89 ee 48 c7 c7 c0 d2 18 8d e8 5e bd a1 00 eb a6 48 89 df
RSP: 0018:ffffc9000420fc00 EFLAGS: 00010282

RAX: 0000000000000000 RBX: ffff888058dd4f80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff816a3a30 RDI: 0000000000000005
RBP: 000000000000000a R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 2073662d53463246 R12: ffff888058dd4000
R13: 000000000000000a R14: dffffc0000000000 R15: 0000000000000001
FS:  00007fbbc86656c0(0000) GS:ffff88806b600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f621a85f000 CR3: 0000000111785000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 generic_shutdown_super+0x161/0x3c0 fs/super.c:693
 kill_block_super+0x3b/0x70 fs/super.c:1646
 kill_f2fs_super+0x2b7/0x3d0 fs/f2fs/super.c:4879
 deactivate_locked_super+0x9a/0x170 fs/super.c:481
 deactivate_super+0xde/0x100 fs/super.c:514
 cleanup_mnt+0x222/0x3d0 fs/namespace.c:1254
 task_work_run+0x14d/0x240 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x1d/0x60 kernel/entry/common.c:296
 do_syscall_64+0x44/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fbbc787e1ea
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 09 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbbc8664ee8 EFLAGS: 00000202
 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffec RBX: 00007fbbc8664f80 RCX: 00007fbbc787e1ea
RDX: 0000000020000040 RSI: 0000000020000080 RDI: 00007fbbc8664f40
RBP: 0000000020000040 R08: 00007fbbc8664f80 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000080
R13: 00007fbbc8664f40 R14: 00000000000054f4 R15: 0000000020000540
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_put_super+0xce1/0xed0 fs/f2fs/super.c:1639
Code: 03 0f b6 14 02 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 27 48 63 0b 89 ea 48 c7 c6 40 f9 ba 8a 4c 89 e7 e8 ff 77 ff ff <0f> 0b 4c 89 ee 48 c7 c7 c0 d2 18 8d e8 5e bd a1 00 eb a6 48 89 df
RSP: 0018:ffffc9000420fc00 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888058dd4f80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff816a3a30 RDI: 0000000000000005
RBP: 000000000000000a R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 2073662d53463246 R12: ffff888058dd4000
R13: 000000000000000a R14: dffffc0000000000 R15: 0000000000000001
FS:  00007fbbc86656c0(0000) GS:ffff88806b600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fffb061dfa8 CR3: 0000000111785000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
