Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233BCFCFB4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 10:51:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0s6kgtuZmJ8nJ20FBcH8qkHhWIWzxBS2AvZtPtRNXM=; b=lI6GbHR/eYtxgzPG6roHJemn+n
	AFye9MdF2qyFStxspgHQX8r/MQOn3CwGe249GFFl6SZewOOFNqJ9VCtkjSPvRLHwGbpWG8hejTJX7
	TxPr1bj/Jix/0rui1S1oLkGy+my3NyVybFL1+xPsQFRBBJnObuHG8Uc1jPNrrnXBHRtk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdQBu-00019x-3W;
	Wed, 07 Jan 2026 09:50:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdQBs-00019i-Ow
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 09:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJRoaMj6FxsokWaSD2u6YVT1whFSpDIBdBCb6KUlbEo=; b=OjpB7OdRfwbx8+7XBc/++FmUXy
 XTbrUyEfIz4gw2darJcNfIuHd5a9V0IS2N5ekqZhugyc9LGD4esvdjsuRqbQb3lt1HeHsGr0vdlgJ
 R1HcwRHvGiZGHGT9hcGRNgsNF8gWONGpmX2HtgNo8tm1ZhyTFz6B2RaYJUG+hNtgZZP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJRoaMj6FxsokWaSD2u6YVT1whFSpDIBdBCb6KUlbEo=; b=Vo1CAygA5q1fDl9f+HBtSfMVfC
 gtlbN5K08bxJMZramJmeFWbLvDeKJhBhj2yD2boDO8eoQVDu/QLOHmHJf+YH4OYJ+/rg8rLGRNCfA
 84FZODpGseZw4pLpwzv1NUewWq8gvvvlWoCq4iUWfpwaY793yZe7XN9ln6n66W2m6gOg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdQBr-0006Or-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 09:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C1C543784;
 Wed,  7 Jan 2026 09:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4069CC4CEF7;
 Wed,  7 Jan 2026 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767779450;
 bh=pEYGd2hxr80YeIRz25FEgaox97gwuqJtA+Zp64YQC5w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VYgFp5/uuOawo0HLl0x4BlyhOjS8gZ/nWM7tGpSY3jKX4Vib5/6APiUf0uA7AsV2K
 kUtRkCc3sx8apPYVxUxCLuhAyhn0H5ukRrr31NaqQKc5KlTL7PmKYRLKw4c0ezwOlR
 cCeQBGbf6p/w68Eqx9oiBsqM/nu4JHV1UAZ6V6IaBDQo6Q/J46uWuBUpQShL8qEfNc
 rBN1v/LP4avyCyB9MsdSJRonSEI57BDywYpbaXqEhHYWzXiFBVrgYgs5/9MbMQqFAa
 3wbZ9Rql10dQPKifA5tEMq8Hg4vBS0oHEGdIhhiuPk2uhEjzuSmy2WnmhNtRr/L0s0
 /261XPPvHoJ+A==
Message-ID: <bec27999-93fa-49bf-86c2-1c6c007ccf35@kernel.org>
Date: Wed, 7 Jan 2026 17:50:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6948c441.a70a0220.25eec0.007f.GAE@google.com>
Content-Language: en-US
In-Reply-To: <6948c441.a70a0220.25eec0.007f.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/syzbot On 12/22/2025 12:08 PM, syzbot wrote: > Hello, > > syzbot found
 the following issue on: > > HEAD commit: 765b233a9b94 Merge tag
 'i2c-for-6.19-rc2'
 of git://git.ker.. > git tree: upstream > console out [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdQBr-0006Or-Nx
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: use-after-free Read in
 f2fs_write_end_io (2)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot

On 12/22/2025 12:08 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    765b233a9b94 Merge tag 'i2c-for-6.19-rc2' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17a56b1a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
> dashboard link: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174b0b58580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162f8b1a580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-765b233a.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f8288fd6c7cc/vmlinux-765b233a.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2a2ef1044b19/bzImage-765b233a.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/333719a5e15d/mount_1.gz
>    fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=17faddb4580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:68 [inline]
> BUG: KASAN: slab-use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
> BUG: KASAN: slab-use-after-free in get_pages fs/f2fs/f2fs.h:2718 [inline]
> BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60 fs/f2fs/data.c:364
> Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
> 
> CPU: 0 UID: 0 PID: 45 Comm: kworker/u4:4 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: loop0 loop_workfn
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0xca/0x240 mm/kasan/report.c:482
>   kasan_report+0x118/0x150 mm/kasan/report.c:595
>   check_region_inline mm/kasan/generic.c:-1 [inline]
>   kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
>   instrument_atomic_read include/linux/instrumented.h:68 [inline]
>   atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
>   get_pages fs/f2fs/f2fs.h:2718 [inline]
>   f2fs_write_end_io+0x9b9/0xb60 fs/f2fs/data.c:364
>   blk_update_request+0x57e/0xe60 block/blk-mq.c:1007
>   blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1169
>   lo_rw_aio_complete drivers/block/loop.c:337 [inline]
>   lo_rw_aio+0xcd1/0xef0 drivers/block/loop.c:410
>   do_req_filebacked drivers/block/loop.c:-1 [inline]
>   loop_handle_cmd drivers/block/loop.c:1926 [inline]
>   loop_process_work+0x8fe/0x10b0 drivers/block/loop.c:1961
>   process_one_work kernel/workqueue.c:3257 [inline]
>   process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
>   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
>   kthread+0x711/0x8a0 kernel/kthread.c:463
>   ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
>   </TASK>
> 
> Allocated by task 5484:
>   kasan_save_stack mm/kasan/common.c:56 [inline]
>   kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
>   poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
>   __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
>   kasan_kmalloc include/linux/kasan.h:262 [inline]
>   __kmalloc_cache_noprof+0x3e2/0x700 mm/slub.c:5776
>   kmalloc_noprof include/linux/slab.h:957 [inline]
>   kzalloc_noprof include/linux/slab.h:1094 [inline]
>   f2fs_fill_super+0x8c/0x6ec0 fs/f2fs/super.c:4895
>   get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1691
>   vfs_get_tree+0x92/0x2a0 fs/super.c:1751
>   fc_mount fs/namespace.c:1199 [inline]
>   do_new_mount_fc fs/namespace.c:3636 [inline]
>   do_new_mount+0x302/0xa10 fs/namespace.c:3712
>   do_mount fs/namespace.c:4035 [inline]
>   __do_sys_mount fs/namespace.c:4224 [inline]
>   __se_sys_mount+0x313/0x410 fs/namespace.c:4201
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Freed by task 5484:
>   kasan_save_stack mm/kasan/common.c:56 [inline]
>   kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
>   kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
>   poison_slab_object mm/kasan/common.c:252 [inline]
>   __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
>   kasan_slab_free include/linux/kasan.h:234 [inline]
>   slab_free_hook mm/slub.c:2540 [inline]
>   slab_free mm/slub.c:6670 [inline]
>   kfree+0x1c0/0x660 mm/slub.c:6878
>   kill_f2fs_super+0x5b6/0x6c0 fs/f2fs/super.c:5458
>   deactivate_locked_super+0xbc/0x130 fs/super.c:474
>   cleanup_mnt+0x425/0x4c0 fs/namespace.c:1318
>   task_work_run+0x1d4/0x260 kernel/task_work.c:233
>   exit_task_work include/linux/task_work.h:40 [inline]
>   do_exit+0x694/0x22f0 kernel/exit.c:971
>   do_group_exit+0x21c/0x2d0 kernel/exit.c:1112
>   __do_sys_exit_group kernel/exit.c:1123 [inline]
>   __se_sys_exit_group kernel/exit.c:1121 [inline]
>   __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1121
>   __pfx_syscall_get_nr+0x0/0x10 arch/x86/include/generated/asm/syscalls_64.h:232
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Last potentially related work creation:
>   kasan_save_stack+0x3e/0x60 mm/kasan/common.c:56
>   kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
>   insert_work+0x3d/0x330 kernel/workqueue.c:2180
>   __queue_work+0xcd0/0xf90 kernel/workqueue.c:2335
>   queue_work_on+0x106/0x1c0 kernel/workqueue.c:2386
>   queue_work include/linux/workqueue.h:669 [inline]
>   schedule_work include/linux/workqueue.h:730 [inline]
>   f2fs_handle_critical_error+0x255/0x540 fs/f2fs/super.c:4624
>   f2fs_write_end_io+0x886/0xb60 fs/f2fs/data.c:351
>   __submit_merged_bio+0x256/0x660 fs/f2fs/data.c:540
>   __f2fs_submit_merged_write fs/f2fs/data.c:635 [inline]
>   __submit_merged_write_cond+0x471/0x530 fs/f2fs/data.c:657
>   f2fs_sync_node_pages+0x1479/0x15e0 fs/f2fs/node.c:2166
>   block_operations fs/f2fs/checkpoint.c:1276 [inline]
>   f2fs_write_checkpoint+0xdd5/0x2430 fs/f2fs/checkpoint.c:1678
>   kill_f2fs_super+0x2d2/0x6c0 fs/f2fs/super.c:5448
>   deactivate_locked_super+0xbc/0x130 fs/super.c:474
>   cleanup_mnt+0x425/0x4c0 fs/namespace.c:1318
>   task_work_run+0x1d4/0x260 kernel/task_work.c:233
>   exit_task_work include/linux/task_work.h:40 [inline]
>   do_exit+0x694/0x22f0 kernel/exit.c:971
>   do_group_exit+0x21c/0x2d0 kernel/exit.c:1112
>   __do_sys_exit_group kernel/exit.c:1123 [inline]
>   __se_sys_exit_group kernel/exit.c:1121 [inline]
>   __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1121
>   __pfx_syscall_get_nr+0x0/0x10 arch/x86/include/generated/asm/syscalls_64.h:232
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Second to last potentially related work creation:
>   kasan_save_stack+0x3e/0x60 mm/kasan/common.c:56
>   kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
>   insert_work+0x3d/0x330 kernel/workqueue.c:2180
>   __queue_work+0xcd0/0xf90 kernel/workqueue.c:2335
>   queue_work_on+0x106/0x1c0 kernel/workqueue.c:2386
>   sanity_check_node_footer fs/f2fs/node.c:1536 [inline]
>   __get_node_folio+0xcaf/0x14f0 fs/f2fs/node.c:1581
>   do_read_inode fs/f2fs/inode.c:425 [inline]
>   f2fs_iget+0x77c/0x5640 fs/f2fs/inode.c:596
>   f2fs_nfs_get_inode+0x76/0x110 fs/f2fs/super.c:3723
>   generic_fh_to_dentry+0x9f/0xf0 fs/libfs.c:1498
>   exportfs_decode_fh_raw+0x178/0x6e0 fs/exportfs/expfs.c:456
>   do_handle_to_path+0xa4/0x1a0 fs/fhandle.c:276
>   handle_to_path fs/fhandle.c:400 [inline]
>   do_handle_open+0x6a1/0x930 fs/fhandle.c:424
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff88804357c000
>   which belongs to the cache kmalloc-8k of size 8192
> The buggy address is located 4464 bytes inside of
>   freed 8192-byte region [ffff88804357c000, ffff88804357e000)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x43578
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 04fff00000000040 ffff88801a442280 ffffea000046b000 0000000000000002
> raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 04fff00000000040 ffff88801a442280 ffffea000046b000 0000000000000002
> head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 04fff00000000003 ffffea00010d5e01 00000000ffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 3, migratetype Unmovable, gfp_mask 0x528c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP), pid 5411, tgid 5411 (syz-executor), ts 97414573985, free_ts 95403368329
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
>   prep_new_page mm/page_alloc.c:1854 [inline]
>   get_page_from_freelist+0x24e0/0x2580 mm/page_alloc.c:3915
>   __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
>   alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2486
>   alloc_slab_page mm/slub.c:3075 [inline]
>   allocate_slab+0x86/0x3b0 mm/slub.c:3248
>   new_slab mm/slub.c:3302 [inline]
>   ___slab_alloc+0xe53/0x1820 mm/slub.c:4656
>   __slab_alloc+0x65/0x100 mm/slub.c:4779
>   __slab_alloc_node mm/slub.c:4855 [inline]
>   slab_alloc_node mm/slub.c:5251 [inline]
>   __do_kmalloc_node mm/slub.c:5656 [inline]
>   __kvmalloc_node_noprof+0x6b6/0x920 mm/slub.c:7136
>   kvmalloc_array_node_noprof include/linux/slab.h:1122 [inline]
>   __ptr_ring_init_queue_alloc_noprof include/linux/ptr_ring.h:481 [inline]
>   ptr_ring_init_noprof include/linux/ptr_ring.h:499 [inline]
>   wg_packet_queue_init+0xbc/0x320 drivers/net/wireguard/queueing.c:32
>   wg_newlink+0x2f6/0x670 drivers/net/wireguard/device.c:352
>   rtnl_newlink_create+0x310/0xb00 net/core/rtnetlink.c:3840
>   __rtnl_newlink net/core/rtnetlink.c:3957 [inline]
>   rtnl_newlink+0x16e7/0x1c90 net/core/rtnetlink.c:4072
>   rtnetlink_rcv_msg+0x7cf/0xb70 net/core/rtnetlink.c:6958
>   netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2550
>   netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
>   netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
>   netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
> page last free pid 4363 tgid 4363 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   free_pages_prepare mm/page_alloc.c:1395 [inline]
>   __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
>   unix_net_exit+0x6b/0xb0 net/unix/af_unix.c:3837
>   ops_exit_list net/core/net_namespace.c:199 [inline]
>   ops_undo_list+0x49a/0x990 net/core/net_namespace.c:252
>   cleanup_net+0x4d8/0x7a0 net/core/net_namespace.c:696
>   process_one_work kernel/workqueue.c:3257 [inline]
>   process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
>   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
>   kthread+0x711/0x8a0 kernel/kthread.c:463
>   ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
> 
> Memory state around the buggy address:
>   ffff88804357d000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff88804357d080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffff88804357d100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                               ^
>   ffff88804357d180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff88804357d200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
