Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9837595496
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Aug 2022 10:08:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNrct-0000IX-A0;
	Tue, 16 Aug 2022 08:08:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3eFD7YgkbACUTZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oNrco-0000IQ-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 08:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FHXDhJvY2IkHhUd4tFK8q9dv+Fm/vXITFi2l3j4+4MY=; b=msQJCuKJIDMe8I65LSy/yuYQwv
 izlGZqEXEFT1A2MMUAZ1wz1xO12gC2GQtbPgDvDfvJBEnU2qTO3Q4PqxY7gLalh+ez2HzRGytCsPQ
 G10z8q1auuoJwqvdEYIsglC0JQcQYwI3QWQPkR7ly86SJDe5quW4lus1grA+CcIEOr/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FHXDhJvY2IkHhUd4tFK8q9dv+Fm/vXITFi2l3j4+4MY=; b=S
 oFy5WpCT5TZx4iy/kx5hooC2qVQ6ncotGoq8hxbXLwjHTbxuKoEiaheG2x3kOM0j90wCIFFdAX47u
 y8Og6ryCKioenVk5ErVXGC5jNZSeDUlbZGIDxKD+M24ayLcnPQgc5+tHM9iMcof2kxkEUcEJotS1Q
 ShMGnKkjwdK3XHU4=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oNrck-0006lF-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 08:08:34 +0000
Received: by mail-io1-f70.google.com with SMTP id
 g22-20020a056602249600b0067caba4f24bso5580293ioe.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Aug 2022 01:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=FHXDhJvY2IkHhUd4tFK8q9dv+Fm/vXITFi2l3j4+4MY=;
 b=YxrtXU6pdnghFp+rsIBgYDuseImbx2WoYfS8sVxv3CeS64yGyX0N59ebepshSRyq0Y
 3UaV5axZA4ic99JOa9hGhj7m5jb7Gb1LskRrEvEGzrczjnfa4Y3APSTwaS1SsDpLKhVI
 JoKfwHqGQnWskI2x6mWn2w4B18sL0PJkuSonmyygpvcElAs20fWViisE5WLwphF6i2F5
 ay/zN3zy5s44tjEJnhAO4Rm7Zg+QPU4EkJdj1XEgL2DX3toh74HxSlwhgBWiXjBRhDQP
 dxCVuUiXV3Pl10uLroRXd/pTMNxiKeEKbq27znPAcHjH9MZmDW+XQQ77pqax1e8L/ATf
 yyTw==
X-Gm-Message-State: ACgBeo39ck9ObSXlE6pZ+6pEc7PY8QMHF1aEfWaasKb//MBEbgPngkF/
 NRsf4LPCXRd6+2NPbw0FTGyZlGzYbjgjed+WYxmlzty+XHSr
X-Google-Smtp-Source: AA6agR4HGiUDpWQJy4g/los7oIZ8kAAX3mo604F5RTbiJQf/LLkvWpUdyDJZjfmzMrSzApizVJ/qlQWvT2+i4cbCt4+mlkO56fn/
MIME-Version: 1.0
X-Received: by 2002:a6b:6906:0:b0:688:b23c:7891 with SMTP id
 e6-20020a6b6906000000b00688b23c7891mr954400ioc.95.1660637304989; Tue, 16 Aug
 2022 01:08:24 -0700 (PDT)
Date: Tue, 16 Aug 2022 01:08:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aa2db405e657403f@google.com>
From: syzbot <syzbot+1a52906c5f8683d9c085@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 200e340f2196
 Merge tag 'pull-work.dcache' of git://git.ker.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1184fa3e080000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oNrck-0006lF-Hq
Subject: [f2fs-dev] [syzbot] KASAN: use-after-free Read in f2fs_write_end_io
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

HEAD commit:    200e340f2196 Merge tag 'pull-work.dcache' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1184fa3e080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f4d6985d3164cd
dashboard link: https://syzkaller.appspot.com/bug?extid=1a52906c5f8683d9c085
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1a52906c5f8683d9c085@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in instrument_atomic_read include/linux/instrumented.h:71 [inline]
BUG: KASAN: use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:27 [inline]
BUG: KASAN: use-after-free in get_pages fs/f2fs/f2fs.h:2423 [inline]
BUG: KASAN: use-after-free in f2fs_write_end_io+0x141/0x12a0 fs/f2fs/data.c:348
Read of size 4 at addr ffff8880752b4e58 by task ksoftirqd/1/23

CPU: 1 PID: 23 Comm: ksoftirqd/1 Not tainted 5.19.0-syzkaller-02972-g200e340f2196 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:71 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:27 [inline]
 get_pages fs/f2fs/f2fs.h:2423 [inline]
 f2fs_write_end_io+0x141/0x12a0 fs/f2fs/data.c:348
 bio_endio+0x5fe/0x780 block/bio.c:1562
 req_bio_endio block/blk-mq.c:695 [inline]
 blk_update_request+0x401/0x1310 block/blk-mq.c:825
 blk_mq_end_request+0x4b/0x80 block/blk-mq.c:951
 blk_flush_complete_seq+0x561/0xfd0 block/blk-flush.c:211
 flush_end_io+0x77a/0xc60 block/blk-flush.c:268
 __blk_mq_end_request+0x123/0x580 block/blk-mq.c:942
 lo_complete_rq+0x1c2/0x280 drivers/block/loop.c:370
 blk_complete_reqs+0xad/0xe0 block/blk-mq.c:1022
 __do_softirq+0x29b/0x9c2 kernel/softirq.c:571
 run_ksoftirqd kernel/softirq.c:934 [inline]
 run_ksoftirqd+0x2d/0x60 kernel/softirq.c:926
 smpboot_thread_fn+0x645/0x9c0 kernel/smpboot.c:164
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>

Allocated by task 16300:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:437 [inline]
 ____kasan_kmalloc mm/kasan/common.c:516 [inline]
 ____kasan_kmalloc mm/kasan/common.c:475 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:525
 kmalloc include/linux/slab.h:600 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 f2fs_fill_super+0xf9/0x75d0 fs/f2fs/super.c:3999
 mount_bdev+0x34d/0x410 fs/super.c:1367
 legacy_get_tree+0x105/0x220 fs/fs_context.c:610
 vfs_get_tree+0x89/0x2f0 fs/super.c:1497
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __ia32_sys_mount+0x27e/0x300 fs/namespace.c:3568
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

Freed by task 3896:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:367 [inline]
 ____kasan_slab_free+0x166/0x1a0 mm/kasan/common.c:329
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1754 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1780
 slab_free mm/slub.c:3534 [inline]
 kfree+0xe2/0x4d0 mm/slub.c:4562
 f2fs_put_super+0x7d4/0xc10 fs/f2fs/super.c:1603
 generic_shutdown_super+0x14c/0x400 fs/super.c:462
 kill_block_super+0x97/0xf0 fs/super.c:1394
 kill_f2fs_super+0x2b3/0x3c0 fs/f2fs/super.c:4516
 deactivate_locked_super+0x94/0x160 fs/super.c:332
 deactivate_super+0xad/0xd0 fs/super.c:363
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1186
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:294
 __do_fast_syscall_32+0x72/0xf0 arch/x86/entry/common.c:181
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

The buggy address belongs to the object at ffff8880752b4000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 3672 bytes inside of
 8192-byte region [ffff8880752b4000, ffff8880752b6000)

The buggy address belongs to the physical page:
page:ffffea0001d4ac00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x752b0
head:ffffea0001d4ac00 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x4fff00000010200(slab|head|node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000010200 ffffea0000864200 dead000000000002 ffff888011843180
raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x1d20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_HARDWALL), pid 15655, tgid 15654 (syz-executor.0), ts 723661245241, free_ts 723629165352
 prep_new_page mm/page_alloc.c:2457 [inline]
 get_page_from_freelist+0x1298/0x3b80 mm/page_alloc.c:4203
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5431
 alloc_pages+0x1aa/0x310 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1824 [inline]
 allocate_slab+0x26c/0x3c0 mm/slub.c:1969
 new_slab mm/slub.c:2029 [inline]
 ___slab_alloc+0x99f/0xe10 mm/slub.c:3031
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3118
 slab_alloc_node mm/slub.c:3209 [inline]
 slab_alloc mm/slub.c:3251 [inline]
 __kmalloc_track_caller+0x36f/0x450 mm/slub.c:4924
 copy_array+0xc5/0xe0 kernel/bpf/verifier.c:991
 copy_stack_state kernel/bpf/verifier.c:1037 [inline]
 copy_func_state kernel/bpf/verifier.c:1154 [inline]
 copy_verifier_state+0x71e/0xb80 kernel/bpf/verifier.c:1190
 is_state_visited kernel/bpf/verifier.c:11876 [inline]
 do_check kernel/bpf/verifier.c:11991 [inline]
 do_check_common+0x19f5/0xd010 kernel/bpf/verifier.c:14371
 do_check_main kernel/bpf/verifier.c:14434 [inline]
 bpf_check+0x8538/0xb680 kernel/bpf/verifier.c:15003
 bpf_prog_load+0xfb2/0x2250 kernel/bpf/syscall.c:2575
 __sys_bpf+0x11a1/0x5700 kernel/bpf/syscall.c:4917
 __do_sys_bpf kernel/bpf/syscall.c:5021 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:5019 [inline]
 __ia32_sys_bpf+0x74/0xc0 kernel/bpf/syscall.c:5019
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1371 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1421
 free_unref_page_prepare mm/page_alloc.c:3344 [inline]
 free_unref_page+0x19/0x6a0 mm/page_alloc.c:3439
 __unfreeze_partials+0x17c/0x1a0 mm/slub.c:2548
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:447
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:727 [inline]
 slab_alloc_node mm/slub.c:3243 [inline]
 slab_alloc mm/slub.c:3251 [inline]
 kmem_cache_alloc_trace+0x271/0x3f0 mm/slub.c:3282
 kmalloc include/linux/slab.h:600 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 kernfs_fop_open+0x317/0xda0 fs/kernfs/file.c:621
 do_dentry_open+0x4a1/0x12d0 fs/open.c:878
 do_open fs/namei.c:3499 [inline]
 path_openat+0x1c92/0x28f0 fs/namei.c:3632
 do_filp_open+0x1b6/0x400 fs/namei.c:3659
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_openat fs/open.c:1342 [inline]
 __se_sys_openat fs/open.c:1337 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1337
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Memory state around the buggy address:
 ffff8880752b4d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880752b4d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880752b4e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff8880752b4e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880752b4f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
