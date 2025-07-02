Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DEAF14E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 14:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFSJCQ2yD4o+M0SH/xbd0EHjChqHTvI3d6g+AVrc8tc=; b=jcczfLYNYn+TjqPHZn/QB0+MuK
	FpMclK1v16vjfL9N4anMoCHcqPS/6wP7p007TmG/qOZeCRlTCFjv5ratPBciP/yfobn7cURWnsfid
	tHCKluUtOv3DIn9iScL7AuAz8EkEHdUdWoAbi/EjxsJzVUVSnF5KEAXZm64R/7xH78vU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWwBh-0008M4-Ca;
	Wed, 02 Jul 2025 12:03:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWwBg-0008Lr-4H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 12:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MjU2Viej+Wg6ZomWk1Q+e/KWMutx/BivOVvlxJf59pc=; b=MB4XpAkAkjhgT/z+vXqQuvmMLj
 9MwKV0fReHaoNS0WhdAJMKnRq0bpSNU1k3nhHOgipTFYvGEIyPPYVu4YcyZZGtJMgmRKsKp3v4d60
 tlbDFa1nLZcNVM+M3zyz2ryzZ7ME/y1fIjjc0bx7fZdAdC6uX4yQw2dTMr2CUyfE0unY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MjU2Viej+Wg6ZomWk1Q+e/KWMutx/BivOVvlxJf59pc=; b=K
 vLUA5W8AU9CpMCNvS2Cj6wutkNZ2X7bMlUpHhrEBy2i11nDeTBn7ydgyY9Sz5bX5KMRtSWZL+zjR9
 vX7//J0PIek+K+7bsazKP9EQ3fPrXijRlpWD5SXOjxSbF8ePcgvXz24Hh9wdmpPnXoK6XaCs81kZM
 Oxa9IRvVCgaM+ARc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWwBe-0005Fz-Q7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 12:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12E66A53679
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Jul 2025 12:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92295C4CEED;
 Wed,  2 Jul 2025 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751457807;
 bh=WmY+JUfUvwROD+mbFZAOWnPgdjyfSc8zKpixiZNeoBo=;
 h=From:To:Cc:Subject:Date:From;
 b=qmMlghfh1SwXMeQnNJYnpfbOFif/th/D4xB3rIY6OQqR0xizBxhWoX2kOJdVQo02n
 YObqjyBskpth6pk/sHxA/DqYydR0/toDYNaBNVJC0TgJo89wsBvdChVsVzaqNn0fF0
 vigHmXRllpTcnFfMpHAdFa9L7/ubllcbViRL14W4FPDBC2i3QcFf5VBi/eK0KQ8y+5
 5AL0QlyQWIdgACCODvbN8/0sAgruiz8RRXHBXzJVSqha1cAAuHBkR84szwDG7aJT4Z
 9HbMQEDLk/EJQzPh/th+4o4pT6yKda4Xl30b3tQPjPmLk4MmtrhyFyFs7Df7nPy+8x
 L3DUnqy4ZZdhg==
To: jaegeuk@kernel.org
Date: Wed,  2 Jul 2025 20:03:21 +0800
Message-ID: <20250702120321.1080759-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported an UAF issue as below: [1] [2] [1]
 https://syzkaller.appspot.com/text?tag=CrashReport&x=16594c60580000
 ================================================================== BUG: KASAN:
 use-after-free in __list_del_entry_valid+0xa6/0x130 lib/list_debug.c:62 Read
 of size 8 at addr ffff888100567dc8 by task k [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HEXHASH_WORD           Multiple instances of word + hexadecimal hash
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWwBe-0005Fz-Q7
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reported an UAF issue as below: [1] [2]

[1] https://syzkaller.appspot.com/text?tag=CrashReport&x=16594c60580000

==================================================================
BUG: KASAN: use-after-free in __list_del_entry_valid+0xa6/0x130 lib/list_debug.c:62
Read of size 8 at addr ffff888100567dc8 by task kworker/u4:0/8

CPU: 1 PID: 8 Comm: kworker/u4:0 Tainted: G        W          6.1.129-syzkaller-00017-g642656a36791 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: writeback wb_workfn (flush-7:0)
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x151/0x1b7 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:316 [inline]
 print_report+0x158/0x4e0 mm/kasan/report.c:427
 kasan_report+0x13c/0x170 mm/kasan/report.c:531
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/report_generic.c:351
 __list_del_entry_valid+0xa6/0x130 lib/list_debug.c:62
 __list_del_entry include/linux/list.h:134 [inline]
 list_del_init include/linux/list.h:206 [inline]
 f2fs_inode_synced+0x100/0x2e0 fs/f2fs/super.c:1553
 f2fs_update_inode+0x72/0x1c40 fs/f2fs/inode.c:588
 f2fs_update_inode_page+0x135/0x170 fs/f2fs/inode.c:706
 f2fs_write_inode+0x416/0x790 fs/f2fs/inode.c:734
 write_inode fs/fs-writeback.c:1460 [inline]
 __writeback_single_inode+0x4cf/0xb80 fs/fs-writeback.c:1677
 writeback_sb_inodes+0xb32/0x1910 fs/fs-writeback.c:1903
 __writeback_inodes_wb+0x118/0x3f0 fs/fs-writeback.c:1974
 wb_writeback+0x3da/0xa00 fs/fs-writeback.c:2081
 wb_check_background_flush fs/fs-writeback.c:2151 [inline]
 wb_do_writeback fs/fs-writeback.c:2239 [inline]
 wb_workfn+0xbba/0x1030 fs/fs-writeback.c:2266
 process_one_work+0x73d/0xcb0 kernel/workqueue.c:2299
 worker_thread+0xa60/0x1260 kernel/workqueue.c:2446
 kthread+0x26d/0x300 kernel/kthread.c:386
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>

Allocated by task 298:
 kasan_save_stack mm/kasan/common.c:45 [inline]
 kasan_set_track+0x4b/0x70 mm/kasan/common.c:52
 kasan_save_alloc_info+0x1f/0x30 mm/kasan/generic.c:505
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:333
 kasan_slab_alloc include/linux/kasan.h:202 [inline]
 slab_post_alloc_hook+0x53/0x2c0 mm/slab.h:768
 slab_alloc_node mm/slub.c:3421 [inline]
 slab_alloc mm/slub.c:3431 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3438 [inline]
 kmem_cache_alloc_lru+0x102/0x270 mm/slub.c:3454
 alloc_inode_sb include/linux/fs.h:3255 [inline]
 f2fs_alloc_inode+0x2d/0x350 fs/f2fs/super.c:1437
 alloc_inode fs/inode.c:261 [inline]
 iget_locked+0x18c/0x7e0 fs/inode.c:1373
 f2fs_iget+0x55/0x4ca0 fs/f2fs/inode.c:486
 f2fs_lookup+0x3c1/0xb50 fs/f2fs/namei.c:484
 __lookup_slow+0x2b9/0x3e0 fs/namei.c:1689
 lookup_slow+0x5a/0x80 fs/namei.c:1706
 walk_component+0x2e7/0x410 fs/namei.c:1997
 lookup_last fs/namei.c:2454 [inline]
 path_lookupat+0x16d/0x450 fs/namei.c:2478
 filename_lookup+0x251/0x600 fs/namei.c:2507
 vfs_statx+0x107/0x4b0 fs/stat.c:229
 vfs_fstatat fs/stat.c:267 [inline]
 vfs_lstat include/linux/fs.h:3434 [inline]
 __do_sys_newlstat fs/stat.c:423 [inline]
 __se_sys_newlstat+0xda/0x7c0 fs/stat.c:417
 __x64_sys_newlstat+0x5b/0x70 fs/stat.c:417
 x64_sys_call+0x52/0x9a0 arch/x86/include/generated/asm/syscalls_64.h:7
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x3b/0x80 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x68/0xd2

Freed by task 0:
 kasan_save_stack mm/kasan/common.c:45 [inline]
 kasan_set_track+0x4b/0x70 mm/kasan/common.c:52
 kasan_save_free_info+0x2b/0x40 mm/kasan/generic.c:516
 ____kasan_slab_free+0x131/0x180 mm/kasan/common.c:241
 __kasan_slab_free+0x11/0x20 mm/kasan/common.c:249
 kasan_slab_free include/linux/kasan.h:178 [inline]
 slab_free_hook mm/slub.c:1745 [inline]
 slab_free_freelist_hook mm/slub.c:1771 [inline]
 slab_free mm/slub.c:3686 [inline]
 kmem_cache_free+0x291/0x560 mm/slub.c:3711
 f2fs_free_inode+0x24/0x30 fs/f2fs/super.c:1584
 i_callback+0x4b/0x70 fs/inode.c:250
 rcu_do_batch+0x552/0xbe0 kernel/rcu/tree.c:2297
 rcu_core+0x502/0xf40 kernel/rcu/tree.c:2557
 rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2574
 handle_softirqs+0x1db/0x650 kernel/softirq.c:624
 __do_softirq kernel/softirq.c:662 [inline]
 invoke_softirq kernel/softirq.c:479 [inline]
 __irq_exit_rcu+0x52/0xf0 kernel/softirq.c:711
 irq_exit_rcu+0x9/0x10 kernel/softirq.c:723
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1118 [inline]
 sysvec_apic_timer_interrupt+0xa9/0xc0 arch/x86/kernel/apic/apic.c:1118
 asm_sysvec_apic_timer_interrupt+0x1b/0x20 arch/x86/include/asm/idtentry.h:691

Last potentially related work creation:
 kasan_save_stack+0x3b/0x60 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xb4/0xc0 mm/kasan/generic.c:486
 kasan_record_aux_stack_noalloc+0xb/0x10 mm/kasan/generic.c:496
 __call_rcu_common kernel/rcu/tree.c:2807 [inline]
 call_rcu+0xdc/0x10f0 kernel/rcu/tree.c:2926
 destroy_inode fs/inode.c:316 [inline]
 evict+0x87d/0x930 fs/inode.c:720
 iput_final fs/inode.c:1834 [inline]
 iput+0x616/0x690 fs/inode.c:1860
 do_unlinkat+0x4e1/0x920 fs/namei.c:4396
 __do_sys_unlink fs/namei.c:4437 [inline]
 __se_sys_unlink fs/namei.c:4435 [inline]
 __x64_sys_unlink+0x49/0x50 fs/namei.c:4435
 x64_sys_call+0x289/0x9a0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x3b/0x80 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x68/0xd2

The buggy address belongs to the object at ffff888100567a10
 which belongs to the cache f2fs_inode_cache of size 1360
The buggy address is located 952 bytes inside of
 1360-byte region [ffff888100567a10, ffff888100567f60)

The buggy address belongs to the physical page:
page:ffffea0004015800 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x100560
head:ffffea0004015800 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x4000000000010200(slab|head|zone=1)
raw: 4000000000010200 0000000000000000 dead000000000122 ffff8881002c4d80
raw: 0000000000000000 0000000080160016 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Reclaimable, gfp_mask 0xd2050(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_RECLAIMABLE), pid 298, tgid 298 (syz-executor330), ts 26489303743, free_ts 0
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x213/0x220 mm/page_alloc.c:2637
 prep_new_page+0x1b/0x110 mm/page_alloc.c:2644
 get_page_from_freelist+0x3a98/0x3b10 mm/page_alloc.c:4539
 __alloc_pages+0x234/0x610 mm/page_alloc.c:5837
 alloc_slab_page+0x6c/0xf0 include/linux/gfp.h:-1
 allocate_slab mm/slub.c:1962 [inline]
 new_slab+0x90/0x3e0 mm/slub.c:2015
 ___slab_alloc+0x6f9/0xb80 mm/slub.c:3203
 __slab_alloc+0x5d/0xa0 mm/slub.c:3302
 slab_alloc_node mm/slub.c:3387 [inline]
 slab_alloc mm/slub.c:3431 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3438 [inline]
 kmem_cache_alloc_lru+0x149/0x270 mm/slub.c:3454
 alloc_inode_sb include/linux/fs.h:3255 [inline]
 f2fs_alloc_inode+0x2d/0x350 fs/f2fs/super.c:1437
 alloc_inode fs/inode.c:261 [inline]
 iget_locked+0x18c/0x7e0 fs/inode.c:1373
 f2fs_iget+0x55/0x4ca0 fs/f2fs/inode.c:486
 f2fs_fill_super+0x5360/0x6dc0 fs/f2fs/super.c:4488
 mount_bdev+0x282/0x3b0 fs/super.c:1445
 f2fs_mount+0x34/0x40 fs/f2fs/super.c:4743
 legacy_get_tree+0xf1/0x190 fs/fs_context.c:632
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888100567c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888100567d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888100567d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff888100567e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888100567e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

[2] https://syzkaller.appspot.com/text?tag=CrashLog&x=13654c60580000

[   24.675720][   T28] audit: type=1400 audit(1745327318.732:72): avc:  denied  { write } for  pid=298 comm="syz-executor399" name="/" dev="loop0" ino=3 scontext=root:sysadm_r:sysadm_t tcontext=system_u:object_r:unlabeled_t tclass=dir permissive=1
[   24.705426][  T296] ------------[ cut here ]------------
[   24.706608][   T28] audit: type=1400 audit(1745327318.732:73): avc:  denied  { remove_name } for  pid=298 comm="syz-executor399" name="file0" dev="loop0" ino=4 scontext=root:sysadm_r:sysadm_t tcontext=system_u:object_r:unlabeled_t tclass=dir permissive=1
[   24.711550][  T296] WARNING: CPU: 0 PID: 296 at fs/f2fs/inode.c:847 f2fs_evict_inode+0x1262/0x1540
[   24.734141][   T28] audit: type=1400 audit(1745327318.732:74): avc:  denied  { rename } for  pid=298 comm="syz-executor399" name="file0" dev="loop0" ino=4 scontext=root:sysadm_r:sysadm_t tcontext=system_u:object_r:unlabeled_t tclass=dir permissive=1
[   24.742969][  T296] Modules linked in:
[   24.765201][   T28] audit: type=1400 audit(1745327318.732:75): avc:  denied  { add_name } for  pid=298 comm="syz-executor399" name="bus" scontext=root:sysadm_r:sysadm_t tcontext=system_u:object_r:unlabeled_t tclass=dir permissive=1
[   24.768847][  T296] CPU: 0 PID: 296 Comm: syz-executor399 Not tainted 6.1.129-syzkaller-00017-g642656a36791 #0
[   24.799506][  T296] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
[   24.809401][  T296] RIP: 0010:f2fs_evict_inode+0x1262/0x1540
[   24.815018][  T296] Code: 34 70 4a ff eb 0d e8 2d 70 4a ff 4d 89 e5 4c 8b 64 24 18 48 8b 5c 24 28 4c 89 e7 e8 78 38 03 00 e9 84 fc ff ff e8 0e 70 4a ff <0f> 0b 4c 89 f7 be 08 00 00 00 e8 7f 21 92 ff f0 41 80 0e 04 e9 61
[   24.834584][  T296] RSP: 0018:ffffc90000db7a40 EFLAGS: 00010293
[   24.840465][  T296] RAX: ffffffff822aca42 RBX: 0000000000000002 RCX: ffff888110948000
[   24.848291][  T296] RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
[   24.856064][  T296] RBP: ffffc90000db7bb0 R08: ffffffff822ac6a8 R09: ffffed10200b005d
[   24.864073][  T296] R10: 0000000000000000 R11: dffffc0000000001 R12: ffff888100580000
[   24.871812][  T296] R13: dffffc0000000000 R14: ffff88810fef4078 R15: 1ffff920001b6f5c

The root cause is w/ a fuzzed image, f2fs may missed to clear FI_DIRTY_INODE
flag for target inode, after f2fs_evict_inode(), the inode is still linked in
sbi->inode_list[DIRTY_META] global list, once it triggers checkpoint,
f2fs_sync_inode_meta() may access the released inode.

In f2fs_evict_inode(), let's always call f2fs_inode_synced() to clear
FI_DIRTY_INODE flag and drop inode from global dirty list to avoid this
UAF issue.

Cc: stable@kernel.org
Closes: https://syzkaller.appspot.com/bug?extid=849174b2efaf0d8be6ba
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0a9462b51b75..7b4780d5e00e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -951,8 +951,12 @@ void f2fs_evict_inode(struct inode *inode)
 	if (likely(!f2fs_cp_error(sbi) &&
 				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
-	else
-		f2fs_inode_synced(inode);
+
+	/*
+	 * anyway, it needs to remove the inode from sbi->inode_list[DIRTY_META]
+	 * list to avoid UAF in f2fs_sync_inode_meta() during checkpoint.
+	 */
+	f2fs_inode_synced(inode);
 
 	/* for the case f2fs_new_inode() was failed, .i_ino is zero, skip it */
 	if (inode->i_ino)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
