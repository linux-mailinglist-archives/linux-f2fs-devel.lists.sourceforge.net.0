Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604AB84C1C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 15:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bF9mW4x5iiKhZDNhLjXYuA3gsz0r67reZ0zRazHpDmY=; b=BI87jcIKN9Vf2pgcu8r5gGw682
	ZAsc6dKG2h9k4ILGQqGhyC1DnP2ML4oXC3VjGRr8wbrtJS5QsLS/kMyRj5Xq2kf6QUfMby/Z6v5kk
	DBtqdrqcyjzPMjxvQl8Cd3hQvu14cwkb7NlgbXl+pGQjEz5I48gu3lHEwsDouX/b8trA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uzESE-00068W-0W;
	Thu, 18 Sep 2025 13:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3eAXMaAkbAAEtz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uzESC-00068Q-9z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 13:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Fr32qzqsQYu3FSW8a1jhN046TIMZCnkvZ9M+6PJb3g=; b=kR7IOMBEcrSsV2luvZv/q+4UhE
 Y3RvScgzX6SvLw6exdjSoGGfgwK8zS5iQpacVfWFLsa9L/O6kFqvTVG3uRr3jN5fa3h4sM10Du51d
 9wlg2WK7y7vsGOqlLUBm8Qqmj64jpjWs37akhctA99sOOUq0+VhPripknXfWTPXTmr2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Fr32qzqsQYu3FSW8a1jhN046TIMZCnkvZ9M+6PJb3g=; b=X
 8PEbBmxr2pt8UpAByre2T6wK2dnyW/skfhTivKvvZo4Ze71cttWhrLu7PQdCOj/nwmLbIH9KEyT1t
 DlmyJpRQhHgb07IBIWKmASmKjZnbHOZnrndbNi9EJIr+udIVxktzGftnSM+aI//SLX0O/hv05Wh28
 NoPmTZCWeKXMwPs0=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uzESB-0003AQ-DK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 13:13:40 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-423f9d1ea61so20018755ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 06:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758201208; x=1758806008;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Fr32qzqsQYu3FSW8a1jhN046TIMZCnkvZ9M+6PJb3g=;
 b=GxKxud8Cy/1UDSowr/Z/FR8YPV9CjD6ENeJWOJO+sDdiPoGbagxvhHhpUn0xEanRE3
 ac/cz4MlB7zjzlKH2JN0uiU+F6PTw+XXGo1Ey/tAA9GbXRV9Mc0E6SBku0M/e/fDp60P
 zmDnSuzBrmxG3WSPWCDS61F4w29mILzFVZcFdAQ7eBal7HCCNqwgvfoz3vTA2nGfubz0
 xL009K2zqngBKl72OnCiyzqUeyHs9rJGJvjiCui3JrNptM91HKQMz4YWFdHcT/HkQIm+
 M5Bo0MbItZKBVNNlxbVdr/pFotmM0NoQZP5JmAko0DE17qN5yA9Z0FC//DdPLn+TSpjy
 Ekfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaCFtioNq9SJ26AV0RCLX0+ty01FN+55vkXGWOtsouX8LFauyv/vazn3w6c03ZmQzqmcfT0bleJTt19J/LQz6n@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwGK7lnjvzJ4uOAUQnpvh6bXq75mYwYlqroqI5mjL+tILOriwAC
 qy8Z3r0M5pVdZCBjySBIOOXTzyRF7T6RnVZy0IfmtHI3to0tdmFmfxSPnlvYi9IBd/Pvw+6IX9R
 JSFDsVYsV5BirADmYR8ImYS0B5bZcZVzTdaSRLWeAcBsTJFxDfqdcRn1Ex6w=
X-Google-Smtp-Source: AGHT+IGSHGIiZgoLQHso+5YU72ewPj69eItK53LS/pEGPOdlOmFDJCugRXh9tVjP52qdFExWNm6AfKlwiBGx08bZgtRLQaWpHMGC
MIME-Version: 1.0
X-Received: by 2002:a92:c24f:0:b0:423:fc1a:126 with SMTP id
 e9e14a558f8ab-4241a55e27emr83668035ab.32.1758201208638; Thu, 18 Sep 2025
 06:13:28 -0700 (PDT)
Date: Thu, 18 Sep 2025 06:13:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68cc0578.050a0220.28a605.0006.GAE@google.com>
From: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: f83a4f2a4d8c
 Merge tag 'erofs-for-6.17-rc6-fixes' of git:/.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=16830762580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.207 listed in wl.mailspike.net]
X-Headers-End: 1uzESB-0003AQ-DK
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in folio_end_read (2)
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

HEAD commit:    f83a4f2a4d8c Merge tag 'erofs-for-6.17-rc6-fixes' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16830762580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf99f2510ef92ba5
dashboard link: https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f83a4f2a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e6c4d9a21b6/vmlinux-f83a4f2a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7bbbc8ebb9ba/bzImage-f83a4f2a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3686758660f980b402dc@syzkaller.appspotmail.com

page: refcount:2 mapcount:0 mapping:ffff888043b30220 index:0x1201 pfn:0x1145b
memcg:ffff88801c6a8d00
aops:f2fs_meta_aops ino:2
flags: 0xfff200000000a9(locked|waiters|uptodate|lru|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff200000000a9 ffffea00006927c8 ffffea0000472b08 ffff888043b30220
raw: 0000000000001201 0000000000000000 00000002ffffffff ffff88801c6a8d00
page dumped because: VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio))
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x40c40(GFP_NOFS|__GFP_COMP), pid 5369, tgid 5367 (syz.0.0), ts 88439663476, free_ts 88354226936
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5148
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_frozen_pages_noprof mm/mempolicy.c:2487 [inline]
 alloc_pages_noprof+0xa9/0x190 mm/mempolicy.c:2507
 folio_alloc_noprof+0x1e/0x30 mm/mempolicy.c:2517
 filemap_alloc_folio_noprof+0xdf/0x470 mm/filemap.c:1007
 __filemap_get_folio+0x3f2/0xaf0 mm/filemap.c:1981
 pagecache_get_page+0x2a/0x130 mm/folio-compat.c:81
 f2fs_pagecache_get_page fs/f2fs/f2fs.h:2908 [inline]
 ra_data_block+0x505/0xc90 fs/f2fs/gc.c:1266
 gc_data_segment fs/f2fs/gc.c:1630 [inline]
 do_garbage_collect+0x2f1f/0x6410 fs/f2fs/gc.c:1826
 f2fs_gc+0xc87/0x2590 fs/f2fs/gc.c:1931
 f2fs_balance_fs+0x5f7/0x7f0 fs/f2fs/segment.c:466
 f2fs_write_single_data_page+0xfaf/0x16a0 fs/f2fs/data.c:2906
 f2fs_write_cache_pages fs/f2fs/data.c:3141 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3290 [inline]
 f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3317
 do_writepages+0x32b/0x550 mm/page-writeback.c:2634
page last free pid 4841 tgid 4841 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2895
 __slab_free+0x303/0x3c0 mm/slub.c:4606
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:340
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4191 [inline]
 slab_alloc_node mm/slub.c:4240 [inline]
 __kmalloc_cache_noprof+0x1be/0x3d0 mm/slub.c:4402
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nsim_fib6_rt_create drivers/net/netdevsim/fib.c:547 [inline]
 nsim_fib6_rt_insert drivers/net/netdevsim/fib.c:752 [inline]
 nsim_fib6_event drivers/net/netdevsim/fib.c:856 [inline]
 nsim_fib_event drivers/net/netdevsim/fib.c:889 [inline]
 nsim_fib_event_work+0x1174/0x3180 drivers/net/netdevsim/fib.c:1493
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x436/0x7d0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1525!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 3024 Comm: kworker/u4:11 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: loop0 loop_workfn
RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1525
Code: a5 c7 ff 48 89 df 48 c7 c6 c0 4f b4 8b e8 aa d3 2f ff 90 0f 0b e8 d2 a5 c7 ff 48 89 df 48 c7 c6 20 48 b4 8b e8 93 d3 2f ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
RSP: 0018:ffffc9000daa7328 EFLAGS: 00010246
RAX: 914fe16334449200 RBX: ffffea00004516c0 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8dbbcae2 RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff8fc3c537 R09: 1ffffffff1f878a6
R10: dffffc0000000000 R11: fffffbfff1f878a7 R12: 1ffffd400008a2d9
R13: 1ffffd400008a2d8 R14: ffffea00004516c8 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88808d00a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200001000000 CR3: 0000000011f6e000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_finish_read_bio+0x2e1/0x3e0 fs/f2fs/data.c:154
 f2fs_read_end_io+0x360/0x980 fs/f2fs/data.c:-1
 blk_update_request+0x57e/0xe60 block/blk-mq.c:989
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1151
 lo_rw_aio_complete drivers/block/loop.c:337 [inline]
 lo_rw_aio+0xd75/0xfa0 drivers/block/loop.c:411
 do_req_filebacked drivers/block/loop.c:-1 [inline]
 loop_handle_cmd drivers/block/loop.c:1919 [inline]
 loop_process_work+0x835/0xf90 drivers/block/loop.c:1954
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x436/0x7d0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1525
Code: a5 c7 ff 48 89 df 48 c7 c6 c0 4f b4 8b e8 aa d3 2f ff 90 0f 0b e8 d2 a5 c7 ff 48 89 df 48 c7 c6 20 48 b4 8b e8 93 d3 2f ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
RSP: 0018:ffffc9000daa7328 EFLAGS: 00010246
RAX: 914fe16334449200 RBX: ffffea00004516c0 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8dbbcae2 RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff8fc3c537 R09: 1ffffffff1f878a6
R10: dffffc0000000000 R11: fffffbfff1f878a7 R12: 1ffffd400008a2d9
R13: 1ffffd400008a2d8 R14: ffffea00004516c8 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88808d00a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200001000000 CR3: 00000000114b2000 CR4: 0000000000352ef0


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
