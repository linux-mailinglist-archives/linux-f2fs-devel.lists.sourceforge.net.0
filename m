Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH/+CmKUlWk1SgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 11:28:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CB15572A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 11:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+SpWDpgVa7X0Tb6pO7S2/EHrLi+TjY6YbceabFbDod8=; b=XFaEvaowPL9TibpRhqAqcgbll2
	cvUHnTTHiEh/g67wS3KOy2XX+/jD4yoAyLN6eeXGpqIczetkFLmPfzuIZl2sMHwEHFyn+Ek+FxzP1
	nn8BXS7SB3COdd+JS6rlBhNzs7kB0OyUErqj5yAsAK1ovdqecOCqJnprVuu/1/8E65hc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsenQ-0000ob-V0;
	Wed, 18 Feb 2026 10:28:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3RpSVaQkbABkHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vsenE-0000oJ-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 10:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GmlLSjL++px+yEOSTzN4sl7YVs0l9bOU5hAcaYav1xc=; b=eYFKUP3XbLydT0x5dDqmF1OQbU
 HPXW74lnhbVhhAaaCCa7IPkynbn0ZsHITKPVod4MPjq/JyZXcEw0Un6Me4dBK/PqnpCHWbuleYa1D
 5coJUWolFGAUJm8+qRg/9B/slkUs4hI3GNn9C3y1HXSIEhbEhHazEbBAZ8xzJe4ccMKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GmlLSjL++px+yEOSTzN4sl7YVs0l9bOU5hAcaYav1xc=; b=j
 rMXNnye1BWG3W14F2LYNB8mHyTnx13ZV4Q3KxK2/QbF/7eGq2RAzIQuVr2UoMbi1kZWY6Ei9H/46o
 SL7V6yyC2n5vzTjU+YFmVWsozxu3NIiEbkcCQDmA+52AHxpcZDfEpRYB6kKx/S2cQC9h2rHBnkNZV
 3U9RPep9YEvQIKoY=;
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vsenE-000102-9J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 10:28:28 +0000
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-6798747187eso5892547eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Feb 2026 02:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771410502; x=1772015302;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GmlLSjL++px+yEOSTzN4sl7YVs0l9bOU5hAcaYav1xc=;
 b=Fz8Yj9KipejD4Js6M1YTTjcrvNuPuHpFM0fZgXTbCAoQe1mhyfaSEgNGrI0kIv6Fve
 fe19BSovG5/J8S9+Jc94a/HYPDQ72cl8H2OpIRGxcCARIj9PTo/YCTKXq3ZnpSjUbEOw
 e78SRGkV0i6BsFhW54iTGwQ3bc5vgpi5xa3JGLMqZ5ROHGwnb1dMCLll85DNBMtV/BM3
 o7FT5Z9w6cCk+NHaJm5d/q0VGg9wXk2WhrmLK5jVmqenZV39CEDzgFZOUiizbW/g1cT4
 OFKVg2DhNmHv74bkfay4Ewn9pD9aKQhmgIK2OhJxFVmZBcEbTTMvxiPTAELHCfKW9AC4
 xL8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm/BXTSdwRsz7UGdSOEa6qkdhO3SnLOfkk6kaUN0PQ0azsWF4OLSf1mGtLh8tVXWZbRsCHhzwAoFD8Mc4Lh88G@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzOXwIMP94AmZ7h9DuF8BE2luSFvnsOOHbo+8Gq8hjLTjaT/S/X
 /n4EGASj2hliTd2YOuUI8uLl3CbsPr4rGrdlJr5Dgk8plNDXtVQy0xZAG9VmRUIJIIArSrmWXXd
 DENDItriGAWhwu49QHjYhc+wGlwLMe2mHkmKj1RyWDaDUtLmVahvr75PPRoQ=
MIME-Version: 1.0
X-Received: by 2002:a4a:ee1a:0:b0:676:e8d1:bb57 with SMTP id
 006d021491bc7-679a74418e0mr641820eaf.58.1771410502648; Wed, 18 Feb 2026
 02:28:22 -0800 (PST)
Date: Wed, 18 Feb 2026 02:28:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69959446.050a0220.2eeac1.014d.GAE@google.com>
From: syzbot <syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 2961f841b025
 Merge tag 'turbostat-2026.02.14' of git://git.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=12c5db3a580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vsenE-000102-9J
Subject: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_in_warm_node_list
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=65722f41f7edc17e];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[6e4cb1cac5efc96ea0ca];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,appspotmail.com:email,storage.googleapis.com:url,googlegroups.com:email];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 581CB15572A
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    2961f841b025 Merge tag 'turbostat-2026.02.14' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12c5db3a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65722f41f7edc17e
dashboard link: https://syzkaller.appspot.com/bug?extid=6e4cb1cac5efc96ea0ca
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ac695a580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2961f841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/19ffd1a88c42/vmlinux-2961f841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/621dc0fadd96/bzImage-2961f841.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7ce23d543372/mount_5.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=110fbeef980000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 UID: 0 PID: 1041 Comm: kworker/u4:7 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: loop0 loop_workfn
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xbd/0x290 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 61 3b f9 fd 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 44 3b f9 fd 4d 3b 37 74 19 e8 7a
RSP: 0018:ffffc90005347488 EFLAGS: 00010206
RAX: 0000000000000006 RBX: ffffea0001521080 RCX: ffff88803683c900
RDX: 0000000000000000 RSI: ffffea0001521080 RDI: ffff8880546fc000
RBP: ffffea0001521098 R08: ffffffff901194b7 R09: 1ffffffff2023296
R10: dffffc0000000000 R11: fffffbfff2023297 R12: ffff888023ebe638
R13: dffffc0000000000 R14: ffff8880474d9490 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff88808ca5b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbdbfabe000 CR3: 0000000056bbf000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_write_end_io+0x7ab/0xff0 fs/f2fs/data.c:400
 blk_update_request+0x57e/0xe60 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1178
 lo_rw_aio_complete drivers/block/loop.c:337 [inline]
 lo_rw_aio+0xcde/0xf00 drivers/block/loop.c:410
 do_req_filebacked drivers/block/loop.c:434 [inline]
 loop_handle_cmd drivers/block/loop.c:1926 [inline]
 loop_process_work+0x61d/0x11a0 drivers/block/loop.c:1961
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
 worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
 kthread+0x388/0x470 kernel/kthread.c:467
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:2260 [inline]
RIP: 0010:is_node_folio fs/f2fs/f2fs.h:2270 [inline]
RIP: 0010:f2fs_in_warm_node_list+0xbd/0x290 fs/f2fs/node.c:330
Code: 00 00 4d 03 3c 24 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 61 3b f9 fd 4d 8b 3f 49 83 c7 30 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 44 3b f9 fd 4d 3b 37 74 19 e8 7a
RSP: 0018:ffffc90005347488 EFLAGS: 00010206
RAX: 0000000000000006 RBX: ffffea0001521080 RCX: ffff88803683c900
RDX: 0000000000000000 RSI: ffffea0001521080 RDI: ffff8880546fc000
RBP: ffffea0001521098 R08: ffffffff901194b7 R09: 1ffffffff2023296
R10: dffffc0000000000 R11: fffffbfff2023297 R12: ffff888023ebe638
R13: dffffc0000000000 R14: ffff8880474d9490 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff88808ca5b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbdbf9d3000 CR3: 0000000050969000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	4d 03 3c 24          	add    (%r12),%r15
   6:	4c 89 f8             	mov    %r15,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
  12:	74 08                	je     0x1c
  14:	4c 89 ff             	mov    %r15,%rdi
  17:	e8 61 3b f9 fd       	call   0xfdf93b7d
  1c:	4d 8b 3f             	mov    (%r15),%r15
  1f:	49 83 c7 30          	add    $0x30,%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 44 3b f9 fd       	call   0xfdf93b7d
  39:	4d 3b 37             	cmp    (%r15),%r14
  3c:	74 19                	je     0x57
  3e:	e8                   	.byte 0xe8
  3f:	7a                   	.byte 0x7a


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
