Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CEB207E8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 13:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ixyAMH8Ym4kvIvPjG1ZlkmjvbEM4szowPHISMWYoq0s=; b=jbzflCMklHQSy+UO1A1nZ4jvRq
	Gz3jP4kxKphf785MLSdLRgMO+UXHzEfv4t9YeUK50GmEfXgaPtIMWkmPZMvK3Uoo8BmSTYFQIccoS
	CReBmFXEedynJUJtyurPsMjPqdn6JXoVX8xQ0CzRIPLSD7tsx59uBseuB7YbfFMRFx3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQkI-0001j4-1v;
	Mon, 11 Aug 2025 11:31:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3d9SZaAkbANIGMN8y992FyDD61.4CC492IG2F0CBH2BH.0CA@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ulQkG-0001it-8V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgE+EVvvkNLaua8JmwQ8plRkqVotGZgzKdk4lE6tbMQ=; b=CtCf4YzJFZzJ77Y2JdFesq/5Bu
 KteV9x9F3mrQFS5VwwU/HQJiKdulpof/cgglH1j4uCmbGIEWr3uKAITCaIgfAFSkiga0SffBhorB0
 A586jcX9OgdwKqLFQYVMlnF8/25vf6/SD3u5fYy4LoX24xZCNxm4ksq8TdUqbmjGVUCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XgE+EVvvkNLaua8JmwQ8plRkqVotGZgzKdk4lE6tbMQ=; b=n
 Hf+AqHROUlZE4aA1OkLSpMB/mgIG6sScpj5y+18djmjzoQ1gCDmNXUfyxmChL/+Jrl7DndFY0UkEn
 cPZ1xU8wzglUGtDcbcgNsedtcoWz0W58tTzOw+QXc2z7qdxPjgJifKAC4AISMoRNdVLWKz7kNjDhz
 OJspOy2VmGLsESg8=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulQkE-0005bF-59 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:31:15 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3e40bc54f89so54504545ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Aug 2025 04:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754911863; x=1755516663;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgE+EVvvkNLaua8JmwQ8plRkqVotGZgzKdk4lE6tbMQ=;
 b=J6zaByStxd9o3g2FDALHmBoqSzcTqTHI29yWu7p7FjtfKpmNrPu5JnBLGowq+qHeTO
 /ovbLaS2itOKSrpFNNPivx9DStk5hOOVTldhGycCa1QEuXuv6QCuK28dcDdiJY+SznTl
 zTUN6puaKtLtFGHOekPrzxicU5C6djulSSJh6owNaHJ4w7t3Ab+6FN2bloc9mYjQeYQg
 Nm4m2ZByG595FKcWOvimSwK7SPIjvBjiXK011DwuG3CYowVTKKnQb3KqyGvKDF0i1FXV
 hw9AO754J7KolL5+PFk14029XYUfO9lAKRLOVj24wz/UQPqQosAT79xvU63J3YG9kkVt
 ZL/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Hc1pw65lbT+WAihKYt6CFLXT/ghuomwMJQbTtxAmKHYsDc2ktdX8Z5K8s4hoCCFKVOLBcRHg9SfYi/7KYPjh@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywuf+nFkAL3uK08KOQ4QJ/svW4ZSbdAvcSbbiSSVWFihdL5KrvJ
 IjX7xN/n5LIshQO9EJYCYnWiNGq2cUQD8cz9AJpyk3jiw+kUaoEqhouXUZzWcAYPcX6tTXURuxS
 qxz/k8SZJQPaNQaJGZNpdsTSeQN4pvFCtXRqdCbU29Zi2R98XD9jvOCzt3WU=
X-Google-Smtp-Source: AGHT+IEM9EUM2e51l5Z5ahh2OOI7tur559jbOo9/TloLI45WI5kBkGYPPpvIccush4rqKIkO7DX8SgIosUWhtbAsCjPinZCYghL0
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe1:b0:3e5:5081:eb8f with SMTP id
 e9e14a558f8ab-3e55081ebb0mr41793155ab.11.1754911863367; Mon, 11 Aug 2025
 04:31:03 -0700 (PDT)
Date: Mon, 11 Aug 2025 04:31:03 -0700
In-Reply-To: <63224c9f-fb95-4aa4-b27e-56801d249771@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6899d477.050a0220.51d73.009b.GAE@google.com>
From: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: INFO: task hung in f2fs_update_inode INFO:
 task syz.2.18:6729 blocked for more than 143 seconds. Not tainted
 6.17.0-rc1-syzkaller-g5344e5bb8255
 #0 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 task:syz.2.18 st [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1ulQkE-0005bF-59
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
INFO: task hung in f2fs_update_inode

INFO: task syz.2.18:6729 blocked for more than 143 seconds.
      Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.18        state:D stack:23736 pid:6729  tgid:6728  ppid:6450   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x1742/0x4c70 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7058
 io_schedule+0x81/0xe0 kernel/sched/core.c:7903
 folio_wait_bit_common+0x6b0/0xb90 mm/filemap.c:1317
 folio_wait_writeback+0xb0/0x100 mm/page-writeback.c:3124
 f2fs_folio_wait_writeback+0x16c/0x240 fs/f2fs/segment.c:4210
 f2fs_update_inode+0x65/0x2620 fs/f2fs/inode.c:668
 f2fs_update_inode_page+0x131/0x190 fs/f2fs/inode.c:783
 f2fs_evict_inode+0xd4a/0x19c0 fs/f2fs/inode.c:936
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 get_signal+0x11c5/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f721d78e9a9
RSP: 002b:00007f721e541038 EFLAGS: 00000246 ORIG_RAX: 000000000000004b
RAX: fffffffffffffffb RBX: 00007f721d9b5fa0 RCX: 00007f721d78e9a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007f721d810d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f721d9b5fa0 R15: 00007ffe0a9ef388
 </TASK>
INFO: task syz.1.17:6734 blocked for more than 144 seconds.
      Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.17        state:D stack:24136 pid:6734  tgid:6733  ppid:6439   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x1742/0x4c70 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7058
 io_schedule+0x81/0xe0 kernel/sched/core.c:7903
 folio_wait_bit_common+0x6b0/0xb90 mm/filemap.c:1317
 folio_wait_writeback+0xb0/0x100 mm/page-writeback.c:3124
 f2fs_folio_wait_writeback+0x16c/0x240 fs/f2fs/segment.c:4210
 f2fs_update_inode+0x65/0x2620 fs/f2fs/inode.c:668
 f2fs_update_inode_page+0x131/0x190 fs/f2fs/inode.c:783
 f2fs_evict_inode+0xd4a/0x19c0 fs/f2fs/inode.c:936
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 get_signal+0x11c5/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa12df8e9a9
RSP: 002b:00007fa12ee9c038 EFLAGS: 00000246 ORIG_RAX: 000000000000004b
RAX: fffffffffffffffb RBX: 00007fa12e1b5fa0 RCX: 00007fa12df8e9a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007fa12e010d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fa12e1b5fa0 R15: 00007ffc4eecd1e8
 </TASK>
INFO: task syz.3.19:6741 blocked for more than 145 seconds.
      Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.19        state:D stack:24600 pid:6741  tgid:6740  ppid:6451   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x1742/0x4c70 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7058
 io_schedule+0x81/0xe0 kernel/sched/core.c:7903
 folio_wait_bit_common+0x6b0/0xb90 mm/filemap.c:1317
 folio_wait_writeback+0xb0/0x100 mm/page-writeback.c:3124
 f2fs_folio_wait_writeback+0x16c/0x240 fs/f2fs/segment.c:4210
 f2fs_update_inode+0x65/0x2620 fs/f2fs/inode.c:668
 f2fs_update_inode_page+0x131/0x190 fs/f2fs/inode.c:783
 f2fs_evict_inode+0xd4a/0x19c0 fs/f2fs/inode.c:936
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 get_signal+0x11c5/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe96f58e9a9
RSP: 002b:00007fe9704b5038 EFLAGS: 00000246 ORIG_RAX: 000000000000004b
RAX: fffffffffffffffb RBX: 00007fe96f7b5fa0 RCX: 00007fe96f58e9a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007fe96f610d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fe96f7b5fa0 R15: 00007ffca3c68668
 </TASK>
INFO: task syz.4.20:6754 blocked for more than 147 seconds.
      Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.20        state:D stack:24632 pid:6754  tgid:6753  ppid:6452   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x1742/0x4c70 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7058
 io_schedule+0x81/0xe0 kernel/sched/core.c:7903
 folio_wait_bit_common+0x6b0/0xb90 mm/filemap.c:1317
 folio_wait_writeback+0xb0/0x100 mm/page-writeback.c:3124
 f2fs_folio_wait_writeback+0x16c/0x240 fs/f2fs/segment.c:4210
 f2fs_update_inode+0x65/0x2620 fs/f2fs/inode.c:668
 f2fs_update_inode_page+0x131/0x190 fs/f2fs/inode.c:783
 f2fs_evict_inode+0xd4a/0x19c0 fs/f2fs/inode.c:936
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 get_signal+0x11c5/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff9cc98e9a9
RSP: 002b:00007ff9cd7f2038 EFLAGS: 00000246 ORIG_RAX: 000000000000004b
RAX: fffffffffffffffb RBX: 00007ff9ccbb5fa0 RCX: 00007ff9cc98e9a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007ff9cca10d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff9ccbb5fa0 R15: 00007ffee71ef8b8
 </TASK>
INFO: task syz.0.21:6781 blocked for more than 148 seconds.
      Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.21        state:D stack:24136 pid:6781  tgid:6780  ppid:6438   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x1742/0x4c70 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7058
 io_schedule+0x81/0xe0 kernel/sched/core.c:7903
 folio_wait_bit_common+0x6b0/0xb90 mm/filemap.c:1317
 folio_wait_writeback+0xb0/0x100 mm/page-writeback.c:3124
 f2fs_folio_wait_writeback+0x16c/0x240 fs/f2fs/segment.c:4210
 f2fs_update_inode+0x65/0x2620 fs/f2fs/inode.c:668
 f2fs_update_inode_page+0x131/0x190 fs/f2fs/inode.c:783
 f2fs_evict_inode+0xd4a/0x19c0 fs/f2fs/inode.c:936
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 get_signal+0x11c5/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9d4a38e9a9
RSP: 002b:00007f9d4b2c5038 EFLAGS: 00000246 ORIG_RAX: 000000000000004b
RAX: fffffffffffffffb RBX: 00007f9d4a5b5fa0 RCX: 00007f9d4a38e9a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007f9d4a410d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f9d4a5b5fa0 R15: 00007ffcd0c959d8
 </TASK>

Showing all locks held in the system:
5 locks held by kworker/u8:1/13:
2 locks held by ksoftirqd/1/23:
 #0: ffff8880b8739e18 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:636
 #1: ffff8880b8724008 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x53/0x880 kernel/sched/psi.c:933
1 lock held by khungtaskd/31:
 #0: ffffffff8e139ee0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e139ee0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e139ee0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
4 locks held by kworker/u8:2/36:
2 locks held by getty/5617:
 #0: ffff8880304d30a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
1 lock held by syz.2.18/6729:
 #0: ffff8880628e4618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.1.17/6734:
 #0: ffff888026c9a618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.3.19/6741:
 #0: ffff888029132618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.4.20/6754:
 #0: ffff88802c33e618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.0.21/6781:
 #0: ffff888059ebe618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
4 locks held by syz.6.23/7017:
 #0: ffff888062b55478 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2296 [inline]
 #0: ffff888062b55478 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_issue_checkpoint+0x3a8/0x610 fs/f2fs/checkpoint.c:1902
 #1: ffff888062b54318 (&sbi->cp_global_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2296 [inline]
 #1: ffff888062b54318 (&sbi->cp_global_sem){+.+.}-{4:4}, at: f2fs_write_checkpoint+0x27f/0x2440 fs/f2fs/checkpoint.c:1672
 #2: ffff888062b543b0 (&sbi->cp_rwsem){++++}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2296 [inline]
 #2: ffff888062b543b0 (&sbi->cp_rwsem){++++}-{4:4}, at: f2fs_lock_all fs/f2fs/f2fs.h:2376 [inline]
 #2: ffff888062b543b0 (&sbi->cp_rwsem){++++}-{4:4}, at: block_operations fs/f2fs/checkpoint.c:1221 [inline]
 #2: ffff888062b543b0 (&sbi->cp_rwsem){++++}-{4:4}, at: f2fs_write_checkpoint+0x55f/0x2440 fs/f2fs/checkpoint.c:1687
 #3: ffff888062b54448 (&sbi->node_write){++++}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2296 [inline]
 #3: ffff888062b54448 (&sbi->node_write){++++}-{4:4}, at: block_operations fs/f2fs/checkpoint.c:1271 [inline]
 #3: ffff888062b54448 (&sbi->node_write){++++}-{4:4}, at: f2fs_write_checkpoint+0xe29/0x2440 fs/f2fs/checkpoint.c:1687
1 lock held by syz.5.22/7014:
 #0: ffff88802ffba618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.7.24/7016:
 #0: ffff88807dda4618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.8.25/7019:
 #0: ffff88805beaa618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.9.26/7021:
 #0: ffff8880339fe618 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x898/0x19c0 fs/f2fs/inode.c:892
1 lock held by syz.2.497/8114:
 #0: ffff8880b8739e18 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:636
2 locks held by syz.4.499/8118:
2 locks held by syz.1.500/8120:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:328 [inline]
 watchdog+0xf93/0xfe0 kernel/hung_task.c:491
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 16 Comm: rcu_preempt Not tainted 6.17.0-rc1-syzkaller-g5344e5bb8255 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:lookup_object lib/debugobjects.c:423 [inline]
RIP: 0010:lookup_object_or_alloc lib/debugobjects.c:662 [inline]
RIP: 0010:debug_object_assert_init+0xf8/0x380 lib/debugobjects.c:1008
Code: fd 4c 89 34 24 4c 8b 6d 00 45 31 f6 eb 07 4d 8b 6d 00 41 ff c6 4d 85 ed 74 3c 4d 8d 65 18 4c 89 e0 48 c1 e8 03 42 80 3c 38 00 <74> 08 4c 89 e7 e8 0e b4 58 fd 49 39 1c 24 0f 84 ef 00 00 00 4c 89
RSP: 0018:ffffc900001578b8 EFLAGS: 00000046
RAX: 1ffff110082b7c26 RBX: ffffc90000157a80 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffc900001577a0
RBP: ffffffff99d4d290 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff5200002aef4 R12: ffff8880415be130
R13: ffff8880415be118 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125d54000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f449da77000 CR3: 0000000076c48000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 debug_timer_assert_init kernel/time/timer.c:803 [inline]
 debug_assert_init kernel/time/timer.c:848 [inline]
 __try_to_del_timer_sync+0x29/0x3a0 kernel/time/timer.c:1457
 __timer_delete_sync+0x1fe/0x2d0 kernel/time/timer.c:1620
 schedule_timeout+0x133/0x270 kernel/time/sleep_timeout.c:100
 rcu_gp_fqs_loop+0x301/0x1540 kernel/rcu/tree.c:2083
 rcu_gp_kthread+0x99/0x390 kernel/rcu/tree.c:2285
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         5344e5bb f2fs: cover f2fs_update_inode_page() w/ node_..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
console output: https://syzkaller.appspot.com/x/log.txt?x=1683f9a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f6e4cb78ac1b7bb
dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
