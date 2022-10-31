Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 391766134F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Oct 2022 12:54:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opTMi-0008I7-7B;
	Mon, 31 Oct 2022 11:54:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UbdfYwkbAGAQWXI8JJCP8NNGB.EMMEJCSQCPAMLRCLR.AMK@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1opTMh-0008Hq-2A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 11:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAFMAvxlxMoFnG+XfsZSIIGrHwoTQNmkec9dxETMnqg=; b=RcX9mG26ufty57ONQ2Kh+/77ZO
 vjW5NC3WVcrNC61CcbyrwdQ7nPEpN57rFZ8dlkXdoxZ8M7P3aYqt9ZLxFtW18G8fgwik+gNXORJud
 ieOzM1dGxAZgfkQsJC0q8WC/LtI3FLBFAU+Z4Jvf6NgIUtuM9r3GUjrCZ4CktWGV5OeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yAFMAvxlxMoFnG+XfsZSIIGrHwoTQNmkec9dxETMnqg=; b=b
 wMvVEOht5klMSbjJUDLX04fBuDHtAyVOwyAVWots+98idJ6U8oPi9s5txGOZyBcdd+8tMaUay1hrr
 VTBzwiCCgnuWwUaLktSskbuR7Mf0R4YIhvoOPKyFnGL/2lUEyq6vyEOtvTQw56Cx3mqT/eeGKhR7c
 SFLsQnsXYPkKkZQg=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opTMc-006lnM-UC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 11:54:02 +0000
Received: by mail-io1-f70.google.com with SMTP id
 j17-20020a5d93d1000000b006bcdc6b49cbso7848143ioo.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Oct 2022 04:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yAFMAvxlxMoFnG+XfsZSIIGrHwoTQNmkec9dxETMnqg=;
 b=NvSjRvaWkkrCocV84Lr5Qm5MjVVI5ML5dzp1eK82BNEk4AtWAtAEJ/lkvJkubtodKX
 JBPfQTEVE8HLyuFW+5zET7QQb02KyGjUW4KaMsuUpz0jXws+4DvbHEqHIqP/cSF3bAyM
 GXa3nmgJMQxQKJvD48fGVC8Af97Cc1T5xsFEcOM9aDzwZ8zCuSf8kIWX+fn8T9rp8pWS
 v0iXJeArx+Sg6ZNot8cjjPV8aKLjh0ICwpvP1n7jO8gpKw7r0BivlnzC3gPHU8pZh25S
 PkN/8VE2wYnhwOiFoml1Jucb3Vjj2r7wPtnpDBrf6FADbLHeFLk13FWPVEbI6YhOVThL
 1B8Q==
X-Gm-Message-State: ACrzQf0JCv8+s7nioNbBbFLoXe5OXlP647jrUDV8HTTaZM+hIP29MY9u
 PscOeWdo5oa5wegiKiMXjdDETobascnTZ9XvzrAihq2zWa0A
X-Google-Smtp-Source: AMsMyM49tlFv28uXTo2fsgxAWnme+TK3gmDlYPlvAU8F9RaO83DOKQFXKH4yBGTt1MQ8KgsG/zYIpHxg7WUn5vIjASQhNFhXbu3C
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3795:b0:375:cca:7024 with SMTP id
 w21-20020a056638379500b003750cca7024mr7142594jal.103.1667217233315; Mon, 31
 Oct 2022 04:53:53 -0700 (PDT)
Date: Mon, 31 Oct 2022 04:53:53 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f48ffe05ec534218@google.com>
From: syzbot <syzbot+8c1c6ffb39e290968f8d@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: b229b6ca5abb
 Merge tag 'perf-tools-fixes-for-v6.1-2022-10-.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=133b675a880000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
X-Headers-End: 1opTMc-006lnM-UC
Subject: [f2fs-dev] [syzbot] INFO: task hung in f2fs_issue_checkpoint
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

HEAD commit:    b229b6ca5abb Merge tag 'perf-tools-fixes-for-v6.1-2022-10-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133b675a880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
dashboard link: https://syzkaller.appspot.com/bug?extid=8c1c6ffb39e290968f8d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ba5b49fa77de/disk-b229b6ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c061f2ae4dc/vmlinux-b229b6ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bc45c1300e9b/bzImage-b229b6ca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c1c6ffb39e290968f8d@syzkaller.appspotmail.com

INFO: task syz-executor.0:4475 blocked for more than 143 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:27384 pid:4475  ppid:3641   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc11668b5a9
RSP: 002b:00007fc1173be168 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 00007fc1167abf80 RCX: 00007fc11668b5a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fc1166e67b0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd5b7e66ff R14: 00007fc1173be300 R15: 0000000000022000
 </TASK>
INFO: lockdep is turned off.
NMI backtrace for cpu 1
CPU: 1 PID: 27 Comm: khungtaskd Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 nmi_cpu_backtrace.cold+0x24/0x18a lib/nmi_backtrace.c:111
 nmi_trigger_cpumask_backtrace+0x32f/0x3c0 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:220 [inline]
 watchdog+0xc71/0xfc0 kernel/hung_task.c:377
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Workqueue: phy10 ieee80211_iface_work
RIP: 0010:_compound_head include/linux/page-flags.h:255 [inline]
RIP: 0010:virt_to_folio include/linux/mm.h:892 [inline]
RIP: 0010:kfree+0x61/0x1a0 mm/slab_common.c:999
Code: 0f 86 33 01 00 00 4c 89 e7 e8 ab 13 86 ff 48 bf 00 00 00 00 00 ea ff ff 48 c1 e8 0c 48 89 c5 48 c1 e5 06 48 01 fd 48 8b 45 08 <a8> 01 0f 85 19 01 00 00 66 90 48 89 ef e8 ad f2 ff ff 48 8b 00 f6
RSP: 0018:ffffc900000e7960 EFLAGS: 00000282
RAX: ffffea000073f401 RBX: ffff8880888af874 RCX: 0000000000000000
RDX: ffff888011a50000 RSI: ffffffff8136c4f4 RDI: ffffea0000000000
RBP: ffffea000073f480 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 000000000008c07e R12: ffff88801cfd2800
R13: 0000000000000028 R14: ffff88801d0b0de0 R15: ffff88801cfd2800
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f110a37f1b8 CR3: 000000002118d000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 ieee80211_bss_info_update+0x49e/0xaf0 net/mac80211/scan.c:223
 ieee80211_rx_bss_info net/mac80211/ibss.c:1120 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1609 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x1a31/0x3190 net/mac80211/ibss.c:1638
 ieee80211_iface_process_skb net/mac80211/iface.c:1630 [inline]
 ieee80211_iface_work+0xa47/0xd30 net/mac80211/iface.c:1684
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
