Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF21B2086D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 14:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YcGncHNUa95s8pwoJ6Asjn670NyPLynk/4hlPUWy+Nw=; b=bOLPmklfSokhd6VahW1vMrE8ZG
	HKHtJHunco+ZDQHz3b7G8ITOx1ubnd1mQH7MQakYJAEH8t31raX6X0K6u6SJTArh57kE3POLW0fxB
	wCHPh72P/ilHRM0uBKOlS9PXMkbZbT3uMhafTQs0UQJh55xHgvBETbUDG1CokgXDy0X0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulRM0-0005QU-08;
	Mon, 11 Aug 2025 12:10:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3mt2ZaAkbAAk178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ulRLy-0005QO-0T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 12:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CixOtvGZ44uJvm8NlZgJ9QgLrtaQdbBbTc3WcQWcOEY=; b=Azx/9BLuByIGyOCmw6uEcUPjVE
 aDP9dVIGzxa1iWxpMxqUJTMS9c5JmvHgjhwJ8+egtVU8IUyk71P/ThWRI6wiKSEQa+xcDmgV7zbJQ
 rteOAvKpeP+E4BrgffG4KFmdK6e/EEuno1Y/933VnBNLiVXo1oiDen/YVlOgj7Vfj21M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CixOtvGZ44uJvm8NlZgJ9QgLrtaQdbBbTc3WcQWcOEY=; b=Q
 7+63p/+8V2zDCqSIDRd2LB4y1zK5l9vByJXUYfsNlaFfgM3kRIn1hWCxIwbLgNE7VqcVgYdxUfZEd
 misRF911VP37B3aOApGy950lTVIy7zF81ERNaz3G7vH1L2KD+SWjAQ1Npe+meMWLCFJ+nqzow/eiw
 KY9P5/q4k2fRiSro=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulRLw-0004Xe-PQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 12:10:13 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-881a05b0846so394718139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Aug 2025 05:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754914202; x=1755519002;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CixOtvGZ44uJvm8NlZgJ9QgLrtaQdbBbTc3WcQWcOEY=;
 b=Zq9QAeCxmIjiEgDosVfIGc/juDmVDbpZEylOdwUuzKoCsWmZ4oIMWIb4FwvbaJAHAC
 WPoqyJCtTTicYMef3Ge7wB92M2oRUSmEBanxk38tUi5dNMATyG/LthQJLCOA1yaCSnIw
 K4nnHc+XUTdqpAzhaS1tFZePj6kGV1AuNO9AmCrBgdc0GQ6HZ3H/c5xRBljUdRIMmGyU
 ql8nZWpf+OCf/4JEqDmHsHh+G9m2uuU0d41Pcc1jBqQ0xTPxYLZApUqRbuG2TxslJWgu
 9J2KaV4SGNY+m1KCLaSpwwbzwkpLXHp7qdAu7Pc/xo2UaLx+JBw5UC7NCp9OL7ZWcUiJ
 t1aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmEvjxGP7rn1eZzrrUp0c0rbUgOReq7nxvTOcCkLIcZ+jfT5fo6ikEXn0SQ2Bzw7324v7efqFHwu4I3+me1UX@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx64udiIJzg7C6XjoXQdjkgvSyaoffeHpA6BpnJhqEpC9zw0wCz
 5fargKhN7DROZWKKd/y+KzH99o7wTexwo2buGTqDVLYFEr7m4RRGpvAoksSSLtIIyYgQ2dyCKuX
 2C5vhYjtx0jKKaEjCy5Fo83TmPbd4QTTbCCXPs1PbYvVd9qgIdtE1FRC20zM=
X-Google-Smtp-Source: AGHT+IFFaSSqcK2VVcYkcpHOcQ04/ZKBNEPCi2ZO/mBAqvFdf64pnCfIxm+g6ma5g3Sg9n/oRSz/MJ5ncwcmQrnshBzA6lcRqvVT
MIME-Version: 1.0
X-Received: by 2002:a05:6602:168c:b0:881:9f3e:803d with SMTP id
 ca18e2360f4ac-883f10d943amr2377308639f.0.1754914202044; Mon, 11 Aug 2025
 05:10:02 -0700 (PDT)
Date: Mon, 11 Aug 2025 05:10:02 -0700
In-Reply-To: <5a259275-e284-49b5-80d4-929c60b5c1cc@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6899dd9a.a70a0220.7865.003d.GAE@google.com>
From: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: kernel BUG in f2fs_write_end_io F2FS-fs (loop3):
 inconsistent node block, node_type:0, nid:11, node_footer[nid:0, ino:0, ofs:0,
 cpver:0, blkaddr:0]
 [ cut here ] kernel BUG at fs/f2fs/data.c:362! Oops: invalid opc [...] 
 Content analysis details:   (3.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.71 listed in psbl.surriel.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
X-Headers-End: 1ulRLw-0004Xe-PQ
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

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in f2fs_write_end_io

F2FS-fs (loop3): inconsistent node block, node_type:0, nid:11, node_footer[nid:0,ino:0,ofs:0,cpver:0,blkaddr:0]
------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:362!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6596 Comm: udevd Not tainted 6.17.0-rc1-syzkaller-00023-g637a17c27a3d #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:f2fs_write_end_io+0xb52/0xb60 fs/f2fs/data.c:361
Code: e8 d3 f8 14 fe e9 91 f6 ff ff 89 d9 80 e1 07 38 c1 0f 8c e3 f6 ff ff 48 89 df e8 49 f9 14 fe e9 d6 f6 ff ff e8 2f bc b3 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90000a08c98 EFLAGS: 00010246
RAX: ffffffff840bee61 RBX: 0000000000000000 RCX: ffff88802bcc1e00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000b
RBP: ffff888032b70780 R08: ffffea0001c68b47 R09: 1ffffd400038d168
R10: dffffc0000000000 R11: fffff9400038d169 R12: 0000000000000006
R13: ffffea0001c68b40 R14: 000000000000000b R15: dffffc0000000000
FS:  00007ff87043e880(0000) GS:ffff888125d54000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555555da2608 CR3: 00000000297cc000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 blk_update_request+0x57e/0xe60 block/blk-mq.c:989
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1151
 blk_complete_reqs block/blk-mq.c:1226 [inline]
 blk_done_softirq+0x107/0x160 block/blk-mq.c:1231
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_release+0x2b5/0x3e0 kernel/locking/lockdep.c:5893
Code: 51 48 c7 44 24 20 00 00 00 00 9c 8f 44 24 20 f7 44 24 20 00 02 00 00 75 56 f7 c3 00 02 00 00 74 01 fb 65 48 8b 05 8b 52 ff 10 <48> 3b 44 24 28 0f 85 8b 00 00 00 48 83 c4 30 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc9000405f7f0 EFLAGS: 00000206
RAX: c28614321895e300 RBX: 0000000000000202 RCX: c28614321895e300
RDX: 0000000000000000 RSI: ffffffff8db908ee RDI: ffffffff8be25680
RBP: ffff88802bcc28f0 R08: ffffc9000405fc88 R09: 0000000000000000
R10: ffffc9000405f978 R11: fffff5200080bf31 R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff8e139ee0 R15: ffff88802bcc1e00
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:871 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0x19a9/0x2390 arch/x86/kernel/unwind_orc.c:680
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:243 [inline]
 __kasan_slab_free+0x5b/0x80 mm/kasan/common.c:275
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2417 [inline]
 slab_free mm/slub.c:4680 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4782
 vfs_fstatat+0x122/0x170 fs/stat.c:376
 __do_sys_newfstatat fs/stat.c:542 [inline]
 __se_sys_newfstatat fs/stat.c:536 [inline]
 __x64_sys_newfstatat+0x116/0x190 fs/stat.c:536
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff86fd11b0a
Code: 48 8b 15 f1 f2 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 41 89 ca b8 06 01 00 00 0f 05 <3d> 00 f0 ff ff 77 07 31 c0 c3 0f 1f 40 00 48 8b 15 b9 f2 0d 00 f7
RSP: 002b:00007ffe39f06778 EFLAGS: 00000246 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 00007ffe39f06c10 RCX: 00007ff86fd11b0a
RDX: 00007ffe39f06780 RSI: 00007ffe39f06c10 RDI: 00000000ffffff9c
RBP: 0000559859a37910 R08: 0000000000000000 R09: 0000000000000020
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe39f06810
R13: 00007ffe39f07045 R14: 00005598470f0ca4 R15: 00005598470f0bcc
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_io+0xb52/0xb60 fs/f2fs/data.c:361
Code: e8 d3 f8 14 fe e9 91 f6 ff ff 89 d9 80 e1 07 38 c1 0f 8c e3 f6 ff ff 48 89 df e8 49 f9 14 fe e9 d6 f6 ff ff e8 2f bc b3 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90000a08c98 EFLAGS: 00010246
RAX: ffffffff840bee61 RBX: 0000000000000000 RCX: ffff88802bcc1e00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000b
RBP: ffff888032b70780 R08: ffffea0001c68b47 R09: 1ffffd400038d168
R10: dffffc0000000000 R11: fffff9400038d169 R12: 0000000000000006
R13: ffffea0001c68b40 R14: 000000000000000b R15: dffffc0000000000
FS:  00007ff87043e880(0000) GS:ffff888125d54000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555555da2608 CR3: 00000000297cc000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	51                   	push   %rcx
   1:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
   8:	00 00
   a:	9c                   	pushf
   b:	8f 44 24 20          	pop    0x20(%rsp)
   f:	f7 44 24 20 00 02 00 	testl  $0x200,0x20(%rsp)
  16:	00
  17:	75 56                	jne    0x6f
  19:	f7 c3 00 02 00 00    	test   $0x200,%ebx
  1f:	74 01                	je     0x22
  21:	fb                   	sti
  22:	65 48 8b 05 8b 52 ff 	mov    %gs:0x10ff528b(%rip),%rax        # 0x10ff52b5
  29:	10
* 2a:	48 3b 44 24 28       	cmp    0x28(%rsp),%rax <-- trapping instruction
  2f:	0f 85 8b 00 00 00    	jne    0xc0
  35:	48 83 c4 30          	add    $0x30,%rsp
  39:	5b                   	pop    %rbx
  3a:	41 5c                	pop    %r12
  3c:	41 5d                	pop    %r13
  3e:	41 5e                	pop    %r14


Tested on:

commit:         637a17c2 f2fs: fix to do sanity check on node footer i..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
console output: https://syzkaller.appspot.com/x/log.txt?x=1026f434580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f6e4cb78ac1b7bb
dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
