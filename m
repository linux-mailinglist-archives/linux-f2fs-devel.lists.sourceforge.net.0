Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD853A9B516
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 19:16:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u80B1-00060O-3l;
	Thu, 24 Apr 2025 17:15:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3rHEKaAkbAAEtz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u80As-00060A-8c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 17:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4XGZkVz8IJF+8bxXCPgMkfaEEdIjgrT6wvdGLnJWVnE=; b=YiocZ4dG5qvwP0360r/g6clmBT
 Az8ExadP6j5hw7NRApK5B3KSZUSeiTkNcoQtnXHM+nkypeBdyGE3oBd7MU7fbbcgimHm7v4z+lm6T
 EIBdVfembWXObMNpkMrk0B+F3QfoI0cH7dUCCNMYVRIQzqeZnxGb1GrUlfF2CuEahHmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4XGZkVz8IJF+8bxXCPgMkfaEEdIjgrT6wvdGLnJWVnE=; b=F
 06exSC/BkC+GLLlWKc/3xxHuOt4gcIxDljtRBpnViQRpQzRPuRHamnniB1A+2TMCdNQMD1w32GgSB
 IgMM8wHQW91gEUXy21sZAAvY3YwcLJmSlbydObU1Nf/rxEkeCDPMe2FW6kIsBhSX2NZeEcHTv5o4c
 Aii9hUw+N1VT5s28=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u80Ac-0003xY-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 17:15:46 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3d43541a706so12066335ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 10:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745514925; x=1746119725;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XGZkVz8IJF+8bxXCPgMkfaEEdIjgrT6wvdGLnJWVnE=;
 b=UxMURHcoUgDY+aLBjDXR8OumE+U96cYD9VJv8zCPviOBp4JF+czruWdoR5K4Xw/mzP
 DAn6dY4ou8Gao61jldlQresvVQh0KqHMMVDh3FraLjEY8cUdYkC2ZO7+gxEk99vlMUT2
 6TaTagiWkd9NgprCvuw3siy3P/sCthWHtUNQmpUxLRBtj7dCjfdSPSSMW/D9SYxsxuqH
 rh3unT7kNjOuqdmL1uT/WxQLgcy39xzKe/2VjRTDvNh0WXUHLHEhFSI+90VwXpgR+uu+
 p9OilQIjbD18FZi0cfPcqkWYdhsFrznxWu6wtPQLv1gMwQ0Od0i26nGbJZKuOo49DcZK
 Qhag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTQIQHUhUYtfbdPWEgGuijceWSyI9QQQ0raaKJ3yXPGBzUJ71u/0omeqgC38AIp4Z2C5Qrv//dGDIpLnqRO+ab@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzm7cEgqDFuuauoEyhxkRfwox4agnj4gtKnwsBcToj9mJNOoGEI
 8FVqYXfpE96rbE/JFRRajdSlRtrF3PHB5DcadA43bYHaA/L/NlvZm6RDIlMJgvlyqrPEfSZaG8v
 b7QcLPS2ePhYtddaKEwmDmhPnTOxIQ2XLpGcdSMoPPLv9p3NVZYhtmxE=
X-Google-Smtp-Source: AGHT+IFlr6MPgxMuLCu+ilmcRA/lIfDHJQVCojwpG2aua/B1DzaIrdtmzwREmx3rxDgbR2kDbdzz8jOddke92Hhsl2Y/rwjh2xl3
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe4:b0:3d8:20f0:4026 with SMTP id
 e9e14a558f8ab-3d938e2bc6cmr4998195ab.1.1745514924930; Thu, 24 Apr 2025
 10:15:24 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:15:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a71ac.050a0220.317436.004e.GAE@google.com>
From: syzbot <syzbot+d05837bec7673c4a18fe@syzkaller.appspotmail.com>
To: chao@kernel.org, edumazet@google.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 sven@narfation.org, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 119009db2674
 Merge tag 'vfs-6.15-rc3.fixes.2' of git://git.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=12114c70580000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
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
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1u80Ac-0003xY-Nq
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_fallocate (5)
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

HEAD commit:    119009db2674 Merge tag 'vfs-6.15-rc3.fixes.2' of git://git..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12114c70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6bd70427e8b567f
dashboard link: https://syzkaller.appspot.com/bug?extid=d05837bec7673c4a18fe
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168cc63f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ccfbac580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2c746991d9a8/disk-119009db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7dc89ed0561e/vmlinux-119009db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4412f446b5ee/bzImage-119009db.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/ba3c3860bd1a/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=128cc63f980000)

The issue was bisected to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11aa263f980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13aa263f980000
console output: https://syzkaller.appspot.com/x/log.txt?x=15aa263f980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d05837bec7673c4a18fe@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

INFO: task syz-executor529:5852 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor529 state:D stack:27024 pid:5852  tgid:5847  ppid:5846   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x1b33/0x51f0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x163/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_write_slowpath+0xedd/0x1420 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1da/0x220 kernel/locking/rwsem.c:1578
 inode_lock include/linux/fs.h:867 [inline]
 f2fs_fallocate+0x26d/0xa10 fs/f2fs/file.c:1940
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f55dfb43589
RSP: 002b:00007f55dfad7218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f55dfbcf618 RCX: 00007f55dfb43589
RDX: 0000200000000000 RSI: 0000000040305828 RDI: 0000000000000004
RBP: 00007f55dfbcf610 R08: 00007ffec02c2d87 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f55dfb9c6f0
R13: 0000200000000140 R14: 0000200000000020 R15: 0000200000000000
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x30/0x180 kernel/locking/lockdep.c:6764
1 lock held by syslogd/5183:
2 locks held by getty/5583:
 #0: ffff88814d6370a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036cb2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5bb/0x1700 drivers/tty/n_tty.c:2222
5 locks held by syz-executor529/5849:
2 locks held by syz-executor529/5852:
 #0: ffff888036082420 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
 #0: ffff888036082420 (sb_writers#8){.+.+}-{0:0}, at: vfs_fallocate+0x5a1/0x7a0 fs/open.c:337
 #1: ffff888079270a38 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #1: ffff888079270a38 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x26d/0xa10 fs/f2fs/file.c:1940

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x4ab/0x4e0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0x1058/0x10a0 kernel/hung_task.c:437
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5849 Comm: syz-executor529 Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:check_preemption_disabled+0x6a/0x120 lib/smp_processor_id.c:19
Code: 00 00 00 89 d8 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 c7 04 24 00 00 00 00 9c 8f 04 24 f7 04 24 00 02 00 00 <74> c7 49 89 f6 49 89 ff 65 4c 8b 2c 25 08 10 65 93 41 f6 45 2f 04
RSP: 0018:ffffc90003f5f2d8 EFLAGS: 00000046
RAX: 0000000080000000 RBX: 0000000000000000 RCX: ffff888030afbc00
RDX: 0000000000000000 RSI: ffffffff8e4c7ff1 RDI: ffffffff8ca0e180
RBP: ffffffff93651020 R08: ffff88807c6bc34f R09: 1ffff1100f8d7869
R10: dffffc0000000000 R11: ffffed100f8d786a R12: ffffffff93651020
R13: 0000000000000246 R14: 00000000ffffffff R15: ffffffff8ed3df80
FS:  00007f55dfaf86c0(0000) GS:ffff888124fcf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff2eb77468 CR3: 0000000027afe000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lockdep_recursion_finish kernel/locking/lockdep.c:472 [inline]
 lock_is_held_type+0x112/0x1a0 kernel/locking/lockdep.c:5939
 lock_is_held include/linux/lockdep.h:249 [inline]
 __might_resched+0xa8/0x6c0 kernel/sched/core.c:8780
 down_read+0x90/0xa50 kernel/locking/rwsem.c:1523
 f2fs_down_read fs/f2fs/f2fs.h:2197 [inline]
 f2fs_allocate_new_section fs/f2fs/segment.c:3293 [inline]
 f2fs_allocate_pinning_section+0xac/0x4e0 fs/f2fs/segment.c:3309
 f2fs_expand_inode_data+0x6ed/0xde0 fs/f2fs/file.c:1865
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1975
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f55dfb43589
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 81 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f55dfaf8218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f55dfbcf608 RCX: 00007f55dfb43589
RDX: 0000200000000140 RSI: 0000000040305828 RDI: 0000000000000005
RBP: 00007f55dfbcf600 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f55dfb9c6f0
R13: 0000200000000140 R14: 0000200000000020 R15: 0000200000000000
 </TASK>
INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 1.186 msecs


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
