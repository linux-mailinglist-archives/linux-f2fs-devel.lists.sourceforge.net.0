Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96969AB40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Feb 2023 13:19:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSzho-00026x-9d;
	Fri, 17 Feb 2023 12:19:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3q3DvYwkbAHAgmnYOZZSfOddWR.UccUZSigSfQcbhSbh.Qca@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pSzhc-00026U-28 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Feb 2023 12:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wjKkIIUXCi57ViLebZZIDh9oWKEiXoND5Lk++abfRI=; b=iLrNlxhawETiEvK8AfYr7GKE1d
 nWMTg6wxTCEHqWs9R0s9KrfmH3mQ1fc7HNTIXe31BQ3h4zwmmx5x2gyv2GiWtwwUzdQb+xM1k+bJj
 iMuFYF7f1g/RWUAwR1Dj7UbtyfnpbN6Y66Zkrlaeaq+9/TbeWEpbYjKgvK+t1ze5of5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3wjKkIIUXCi57ViLebZZIDh9oWKEiXoND5Lk++abfRI=; b=J
 eONNIMXHlxb9ykfigQFK0SmFtnqSjiFwL3Af0H4kjqVSjLMrO/B1Leda0QcGNfH9yyGqTPaEXD0np
 uigSytdD7AUjal7usNqS6+X3gtN/9ExxGiybNr4QupJnNX6qlnd8N2Y4hqAMLOtko5BvpHPlSpWsW
 tRNhAgyz68BYeVeg=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pSzhY-007ItW-Of for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Feb 2023 12:18:57 +0000
Received: by mail-io1-f70.google.com with SMTP id
 b12-20020a6b670c000000b00745698ddf10so1861584ioc.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Feb 2023 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3wjKkIIUXCi57ViLebZZIDh9oWKEiXoND5Lk++abfRI=;
 b=GRRjk0W3mGjdxX4anfKog54sHAEXuOc8F8ZLOgl1IgfmYCdFJ+dT80+/09ft0+gBlx
 YBGtyJ6KfM7gNtQvKrLXwSh7HpkkSKzgy1Tv/ec38aDEVqVptDUMZ/0R8DRimpX/GbfX
 yIWNDZEk/6GR07DcdTPSXIYc4nUGfKSXWTfJ8rDcgCFlQPOu67j61z12FqJ8bAK/6/iO
 RIyJ8BIR9bq+qLTHj+shrgQ85wcOQcU85bjsPp6ZgFQ3Va1fvMZGBFw2jYBkXavn1VXc
 hCtrNp9G+TMtth4EgQpllQGSxA8hWX+YXCqGOH1ItNRq3GbsAjONtYOAHI0mGXISM9zQ
 NLYQ==
X-Gm-Message-State: AO0yUKWOhQw+Hbh2GG8C8QgRQzV7G+6ihyDpFCzIh/qkPDUqFLyNS4RS
 5/HkO4s6ZTfWx5hO5VLUBzWqnXxgYIA5DMpiJIEXrR9F1xVC
X-Google-Smtp-Source: AK7set9ANx5RYXxJHOuQ3jbiisOvgUrhKeK0Qz9erBBYL3PaeATLM5Z/q0eo/zHBqMV8Xn2UE+poI8d29NADuLvQuSyZH5583arj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1304:b0:314:24e2:5189 with SMTP id
 g4-20020a056e02130400b0031424e25189mr158674ilr.0.1676636331204; Fri, 17 Feb
 2023 04:18:51 -0800 (PST)
Date: Fri, 17 Feb 2023 04:18:51 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0674605f4e450c3@google.com>
From: syzbot <syzbot+ad111ebee58835908498@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: ceaa837f96ad
 Linux 6.2-rc8 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=14b3b900c80000
 kernel config: https://syzkaller.appspot.com/x/.config?x=8d9381ac81f [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FROM_LOCAL_DIGITS      From: localpart has long digit sequence
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pSzhY-007ItW-Of
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_get_node_info
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

HEAD commit:    ceaa837f96ad Linux 6.2-rc8
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b3b900c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d9381ac81f4ac15
dashboard link: https://syzkaller.appspot.com/bug?extid=ad111ebee58835908498
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ad111ebee58835908498@syzkaller.appspotmail.com

WARNING: possible circular locking dependency detected
6.2.0-rc8-syzkaller #0 Not tainted
------------------------------------------------------
kswapd1/111 is trying to acquire lock:
ffff88806914b130 (&nm_i->nat_tree_lock){++++}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
ffff88806914b130 (&nm_i->nat_tree_lock){++++}-{3:3}, at: f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:564

but task is already holding lock:
ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: try_to_freeze include/linux/freezer.h:56 [inline]
ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: try_to_freeze include/linux/freezer.h:51 [inline]
ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xb88/0x1530 mm/vmscan.c:7165

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4674 [inline]
       fs_reclaim_acquire+0x11d/0x160 mm/page_alloc.c:4688
       might_alloc include/linux/sched/mm.h:271 [inline]
       prepare_alloc_pages+0x159/0x570 mm/page_alloc.c:5320
       __alloc_pages+0x149/0x5b0 mm/page_alloc.c:5538
       __folio_alloc+0x16/0x40 mm/page_alloc.c:5581
       vma_alloc_folio+0x155/0x870 mm/mempolicy.c:2248
       alloc_page_vma include/linux/gfp.h:284 [inline]
       do_anonymous_page mm/memory.c:4074 [inline]
       handle_pte_fault mm/memory.c:4929 [inline]
       __handle_mm_fault+0x1822/0x3c90 mm/memory.c:5073
       handle_mm_fault+0x1b6/0x850 mm/memory.c:5219
       do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
       handle_page_fault arch/x86/mm/fault.c:1519 [inline]
       exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
       copy_user_short_string+0xd/0x40 arch/x86/lib/copy_user_64.S:232
       copy_user_generic arch/x86/include/asm/uaccess_64.h:37 [inline]
       raw_copy_to_user arch/x86/include/asm/uaccess_64.h:58 [inline]
       _copy_to_user lib/usercopy.c:34 [inline]
       _copy_to_user+0x127/0x150 lib/usercopy.c:27
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt+0x2b2/0x370 fs/f2fs/file.c:2365
       __f2fs_ioctl+0x29f1/0xaaf0 fs/f2fs/file.c:4169
       f2fs_compat_ioctl+0x399/0x630 fs/f2fs/file.c:4867
       __do_compat_sys_ioctl+0x255/0x2b0 fs/ioctl.c:968
       do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
       __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
       do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
       entry_SYSENTER_compat_after_hwframe+0x70/0x82

-> #1 (&sbi->sb_lock
){++++}-{3:3}:
       down_write+0x94/0x220 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
       f2fs_handle_error+0x8e/0x200 fs/f2fs/super.c:3926
       f2fs_check_nid_range.part.0+0x4d/0x60 fs/f2fs/node.c:39
       f2fs_check_nid_range fs/f2fs/node.c:2278 [inline]
       add_free_nid.isra.0+0x781/0x940 fs/f2fs/node.c:2285
       scan_nat_page fs/f2fs/node.c:2387 [inline]
       __f2fs_build_free_nids+0x5b5/0xe10 fs/f2fs/node.c:2493
       f2fs_build_free_nids fs/f2fs/node.c:2531 [inline]
       f2fs_build_node_manager+0x2007/0x2fb0 fs/f2fs/node.c:3316
       f2fs_fill_super+0x3ade/0x7680 fs/f2fs/super.c:4334
       mount_bdev+0x351/0x410 fs/super.c:1359
       legacy_get_tree+0x109/0x220 fs/fs_context.c:610
       vfs_get_tree+0x8d/0x2f0 fs/super.c:1489
       do_new_mount fs/namespace.c:3145 [inline]
       path_mount+0x132a/0x1e20 fs/namespace.c:3475
       do_mount fs/namespace.c:3488 [inline]
       __do_sys_mount fs/namespace.c:3697 [inline]
       __se_sys_mount fs/namespace.c:3674 [inline]
       __ia32_sys_mount+0x282/0x300 fs/namespace.c:3674
       do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
       __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
       do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
       entry_SYSENTER_compat_after_hwframe+0x70/0x82

-> #0 (&nm_i->nat_tree_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
       f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:564
       __write_node_page+0x89f/0x2140 fs/f2fs/node.c:1616
       f2fs_write_node_page+0x2c/0x40 fs/f2fs/node.c:1725
       pageout+0x38a/0xa70 mm/vmscan.c:1298
       shrink_folio_list+0x2bf3/0x3a60 mm/vmscan.c:1947
       shrink_inactive_list mm/vmscan.c:2526 [inline]
       shrink_list mm/vmscan.c:2767 [inline]
       shrink_lruvec+0xd0e/0x27a0 mm/vmscan.c:5954
       shrink_node_memcgs mm/vmscan.c:6141 [inline]
       shrink_node+0x8f2/0x1f40 mm/vmscan.c:6172
       kswapd_shrink_node mm/vmscan.c:6961 [inline]
       balance_pgdat+0x8f5/0x1530 mm/vmscan.c:7151
       kswapd+0x70b/0xfc0 mm/vmscan.c:7411
       kthread+0x2e8/0x3a0 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

other info that might help us debug this:

Chain exists of:
  &nm_i->nat_tree_lock --> &sbi->sb_lock --> fs_reclaim

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&sbi->sb_lock);
                               lock(fs_reclaim);
  lock(&nm_i->nat_tree_lock);

 *** DEADLOCK ***

1 lock held by kswapd1/111:
 #0: ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: try_to_freeze include/linux/freezer.h:56 [inline]
 #0: ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: try_to_freeze include/linux/freezer.h:51 [inline]
 #0: ffffffff8c8d7080 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xb88/0x1530 mm/vmscan.c:7165

stack backtrace:
CPU: 1 PID: 111 Comm: kswapd1 Not tainted 6.2.0-rc8-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
 f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
 f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:564
 __write_node_page+0x89f/0x2140 fs/f2fs/node.c:1616
 f2fs_write_node_page+0x2c/0x40 fs/f2fs/node.c:1725
 pageout+0x38a/0xa70 mm/vmscan.c:1298
 shrink_folio_list+0x2bf3/0x3a60 mm/vmscan.c:1947
 shrink_inactive_list mm/vmscan.c:2526 [inline]
 shrink_list mm/vmscan.c:2767 [inline]
 shrink_lruvec+0xd0e/0x27a0 mm/vmscan.c:5954
 shrink_node_memcgs mm/vmscan.c:6141 [inline]
 shrink_node+0x8f2/0x1f40 mm/vmscan.c:6172
 kswapd_shrink_node mm/vmscan.c:6961 [inline]
 balance_pgdat+0x8f5/0x1530 mm/vmscan.c:7151
 kswapd+0x70b/0xfc0 mm/vmscan.c:7411
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
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
