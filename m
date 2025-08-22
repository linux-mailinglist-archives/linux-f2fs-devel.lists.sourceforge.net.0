Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F98B3227D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Aug 2025 20:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vzz55JljvutOLdzfiPHnBtAP8GieSG+0CYeBslaFUAk=; b=jAAZ8+0K2rnHdBY5kzlFt4UJU4
	fqejIsmJAKA0a15V6XHxKHT6UxfDpcNFVBKSiD2rU6Anlm++QDP6obDMWPs7HMMrX56Fe2GkIBooG
	VmBKfTUm5P1hxhACoRheRYeLV/ZPhmI81+RFUgi3p9qa/P6YMZPoAkA435hs2QPjRAyo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1upWwJ-0002VZ-OR;
	Fri, 22 Aug 2025 18:56:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3W72oaAkbAMQ289ukvvo1kzzsn.qyyqvo42o1myx3ox3.myw@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1upWwI-0002VT-LF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Aug 2025 18:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gO1uvurb7E5+bUOrRjbFRLqMNNGI5Dg/3J6JpBb+3S4=; b=W/dxtgYiKqklM6q9WkMarVYLv4
 fmjJ7W2Txor8G4a42kSwE5RxmOxGx6mUFDVDODwLph1nmk/RpbYWZzDr95cquViALY/Y28J+7uQ46
 B28Y3L+vKkPtse9QsY6X6b0TdAVgjH1MBhX04VuZ4CHYyE1fEkAVttuTarBOJA48J5EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gO1uvurb7E5+bUOrRjbFRLqMNNGI5Dg/3J6JpBb+3S4=; b=H
 HlCvLh3ErY/UXPk4O+YOKSeIYgkoWTbWc4KtGjGmA44eTDq58O2A7oE8mDmvoYv50bmCfKn/QGj6X
 YbPHH5tBCnxzCvTXGnWFJN4J3yF7p8YhW3GkxipLZ/krqKth+PpB94jTf1LrAxLmMSReuo8M1GQe4
 cvDuKyqdbgjx6ZcI=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1upWwI-0007rE-0J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Aug 2025 18:56:38 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3e6e61caf71so53596345ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Aug 2025 11:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755888987; x=1756493787;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gO1uvurb7E5+bUOrRjbFRLqMNNGI5Dg/3J6JpBb+3S4=;
 b=on9T6llA7XDkhKmoK6PfMSuJIEeGKMtWYf6BvkqHneW4cT4y37hLMtW5HaOgkMqQ4C
 PbrKz9hrGzUwzgbGbCKGNO8VETxcubvg+iL8/ZeCobK+YRjKslz/muMAZilKAZ59Y35Q
 hqMEWFgbMLr4OhgqUYp/KmprcfzXp7+NGp+QdVFXiPeJTFU3zmuLUEw0995k278kUyfL
 IEzQDeyTlk3ZfY+Cat66oIQDi0fCUA5Dr42YtneEn7twvIPEFk9EZb82Q6IA2M3sJPpx
 g6RtQLJ3S9/cjPB6PvoQtVissIPgV/QfZL3xJH4JGKANYuEKPct+gfOJo9jo8sexBr9b
 aYOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4kYFi6tTVvpL+kHF3vqo8iqfrJB5sqVzrkMvp/TVYzn1KnCwVaEzJW+ScL3DFZ0IOw4RrIPg259VrZI0qEphB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwWoELRzsDAeEwKhlTQLg0aFmZuSyQOovqVLxC6e5LfKrK1b+VJ
 L/kfWqIKq7R+Xj3ved454NMSaQoQ/qlkwNDjQjcLM8qS+KcS25AItw1JS/9VBMmheclfjip8/2z
 qrsneZlQWUNT3SIkngnjvFtVUrAhxUDRav6TmTAkSY6a2/9GYCm3rXKWk8nk=
X-Google-Smtp-Source: AGHT+IHi9yUm+mHc7c+4BkmiVIW0r739bRnAUSs/tGpm9X2Og6PI9yNeLlFrST7C92Vb5wK7Gh0RIh+tkupOJKun9IlH1ypM8ODG
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184c:b0:3e9:eec4:9b7e with SMTP id
 e9e14a558f8ab-3e9eec49f8amr30758855ab.29.1755888987328; Fri, 22 Aug 2025
 11:56:27 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:56:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68a8bd5b.050a0220.37038e.005b.GAE@google.com>
From: syzbot <syzbot+942fb6ce3ac2843a1420@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 3957a5720157
 Merge tag 'cgroup-for-6.17-rc2-fixes' of git:.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=13e20c42580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1upWwI-0007rE-0J
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_llseek
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

HEAD commit:    3957a5720157 Merge tag 'cgroup-for-6.17-rc2-fixes' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e20c42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
dashboard link: https://syzkaller.appspot.com/bug?extid=942fb6ce3ac2843a1420
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17db07bc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f62a34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c5cbe8650b9a/disk-3957a572.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/51911bea9855/vmlinux-3957a572.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b07279b5fcc2/bzImage-3957a572.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f35e0e9a079a/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10a5dfa2580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+942fb6ce3ac2843a1420@syzkaller.appspotmail.com

INFO: task syz.1.23:6086 blocked for more than 143 seconds.
      Tainted: G        W           syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.23        state:D stack:29352 pid:6086  tgid:6081  ppid:6062   task_flags:0x400040 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5357 [inline]
 __schedule+0x16f3/0x4c20 kernel/sched/core.c:6961
 __schedule_loop kernel/sched/core.c:7043 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7339
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1e04/0x25e0 kernel/locking/rtmutex.c:1760
 __rwbase_read_lock+0xbc/0x180 kernel/locking/rwbase_rt.c:114
 rwbase_read_lock kernel/locking/rwbase_rt.c:147 [inline]
 __down_read kernel/locking/rwsem.c:1466 [inline]
 down_read+0x127/0x1f0 kernel/locking/rwsem.c:1539
 inode_lock_shared include/linux/fs.h:884 [inline]
 f2fs_seek_block fs/f2fs/file.c:458 [inline]
 f2fs_llseek+0x1e5/0x1840 fs/f2fs/file.c:545
 vfs_llseek fs/read_write.c:389 [inline]
 ksys_lseek fs/read_write.c:402 [inline]
 __do_sys_lseek fs/read_write.c:412 [inline]
 __se_sys_lseek fs/read_write.c:410 [inline]
 __x64_sys_lseek+0x155/0x1f0 fs/read_write.c:410
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7c9077ebe9
RSP: 002b:00007f7c8fdcd038 EFLAGS: 00000246 ORIG_RAX: 0000000000000008
RAX: ffffffffffffffda RBX: 00007f7c909a6090 RCX: 00007f7c9077ebe9
RDX: 0000000000000004 RSI: 0000000000000008 RDI: 0000000000000004
RBP: 00007f7c90801e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7c909a6128 R14: 00007f7c909a6090 R15: 00007fffeb5fe138
 </TASK>
INFO: lockdep is turned off.
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 39 Comm: khungtaskd Tainted: G        W           syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:328 [inline]
 watchdog+0xf93/0xfe0 kernel/hung_task.c:491
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6274 Comm: syz.3.43 Tainted: G        W           syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:unwind_next_frame+0x175d/0x2390 arch/x86/kernel/unwind_orc.c:648
Code: 28 84 c0 0f 85 19 0b 00 00 48 89 d0 48 c1 e8 03 0f b6 04 28 84 c0 0f 85 2b 0b 00 00 48 0f bf 03 49 01 c4 49 8d 56 40 4c 89 f7 <4c> 89 e6 eb 5d 49 8d 5e 40 48 89 d8 48 c1 e8 03 80 3c 28 00 74 08
RSP: 0018:ffffc90003b06438 EFLAGS: 00000283
RAX: fffffffffffffff0 RBX: ffffffff8fd32106 RCX: 0000000000000000
RDX: ffffc90003b06548 RSI: 0000000000000001 RDI: ffffc90003b06508
RBP: dffffc0000000000 R08: ffffc90003b06567 R09: 0000000000000000
R10: ffffc90003b06558 R11: fffff52000760cad R12: ffffc90003b069d0
R13: ffffc90003b06558 R14: ffffc90003b06508 R15: 1ffffffff1fa6421
FS:  00007f0008c3c6c0(0000) GS:ffff8881268c4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8cae82bf98 CR3: 000000005b1bc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:548
 slab_free_hook mm/slub.c:2378 [inline]
 slab_free mm/slub.c:4680 [inline]
 kmem_cache_free+0x3ef/0x510 mm/slub.c:4782
 f2fs_read_end_io+0x398/0x9d0 fs/f2fs/data.c:-1
 f2fs_submit_page_read+0x116/0x190 fs/f2fs/data.c:1110
 f2fs_get_read_data_folio+0x4a4/0x7d0 fs/f2fs/data.c:1268
 gc_data_segment fs/f2fs/gc.c:1641 [inline]
 do_garbage_collect+0x3898/0x6410 fs/f2fs/gc.c:1826
 f2fs_gc+0xca9/0x2580 fs/f2fs/gc.c:1931
 f2fs_balance_fs+0x5fb/0x7f0 fs/f2fs/segment.c:466
 f2fs_map_blocks+0x345f/0x4130 fs/f2fs/data.c:1792
 f2fs_expand_inode_data+0x5b1/0xa60 fs/f2fs/file.c:1923
 f2fs_fallocate+0x4f8/0x990 fs/f2fs/file.c:2026
 vfs_fallocate+0x672/0x7f0 fs/open.c:342
 ioctl_preallocate fs/ioctl.c:290 [inline]
 file_ioctl+0x61d/0x780 fs/ioctl.c:-1
 do_vfs_ioctl+0xb36/0x1440 fs/ioctl.c:577
 __do_sys_ioctl fs/ioctl.c:596 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f000960ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0008c3c038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f0009836180 RCX: 00007f000960ebe9
RDX: 0000200000000000 RSI: 0000000040305828 RDI: 0000000000000005
RBP: 00007f0009691e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0009836218 R14: 00007f0009836180 R15: 00007ffee123ac28
 </TASK>


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
