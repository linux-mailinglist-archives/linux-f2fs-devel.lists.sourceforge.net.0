Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44465A2C9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Dec 2022 06:42:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBUd4-0005m6-16;
	Sat, 31 Dec 2022 05:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3nMuvYwkbABcFLM7x881ExCC50.3BB381HF1EzBAG1AG.zB9@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pBUd0-0005ly-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 05:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+b4Q2ge0jmo1a4pJcSTU6qUwKczaS0WXe3va4Gx1vmA=; b=MpHNTZYFAIhuTaX3M/7kjP0XLM
 ZhfGNdQwdYjqIHQJ9OpYGaYpVGQrU8XPJ1B7F5zO0MxBCbONNolcd7joqiHGWLIKfOCjLU/8WdwYO
 5kBPt3ER//zxVU2lAINV8shvdv7lleJoyBlqVVr39L4e+xiR7mXL4L9yzLrUWRkioUFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+b4Q2ge0jmo1a4pJcSTU6qUwKczaS0WXe3va4Gx1vmA=; b=U
 BWdfWWT638bIcIrT3ny+tzBLBfJWeAw8PoNpS9rt1IEeJkWpBGXRmAcoq3gQwv8M8EIq7z+lPetF1
 WqufkiwWhF0b1r9U17Rbm0CfvW68rBCFLpd0Jixm4qDCdPjvTywYZhJwZemOAPPQQofI3zYH8CC+/
 FmbrXn0gKuXabZrU=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pBUcz-000Agt-RS for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 05:41:54 +0000
Received: by mail-il1-f199.google.com with SMTP id
 a10-20020a056e02180a00b0030bc09c6b94so14287421ilv.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Dec 2022 21:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+b4Q2ge0jmo1a4pJcSTU6qUwKczaS0WXe3va4Gx1vmA=;
 b=39Oe2hJrClLLE5h1ykmQX3DIsBVkAV74yYqDKWohwmyRJG+Jm0gOpGpuy95jQ89k4z
 rjEFxq1KUYEWdGQqPxl6OwCFTfAMrdLNNfpT10Xime4cmsf6FX8olzbpACndm0zfzKjJ
 B1A5kPCRlkBqTaqGZgFikrAo3QabV21dkUuQD0+8Ild6sz6LCk1eF7HRcZbS6ubBYqjs
 os9EXqXzzLlCX9iF10yCnmkDNIcJg91gU6sEGdr05n/gZns23y3VlqHmyL2Un4UVclN1
 3KuH3AXdtOpqtDqPGHEm2bzz+VzFIR/l3lpWGd7CdSWt+X3e231TtMHLhTtQV5mv17le
 wEGg==
X-Gm-Message-State: AFqh2kqgJaC4f2b7j0eRH0CCtDdMc8e7w/7CKOde9rDZ7P3RAK2+Vj7i
 qq/2Plxj+UKKoplG00nl2CWF9ProczoKQZpF3cc2Q+aIBs1y
X-Google-Smtp-Source: AMrXdXslBA6q/l8FMrAN276zFyXmyKRhP8bCx4wVrSzLh6eY9A2hV/RQ0FK9WCIA0D5pz2zqee+erl4KJV6rKYs3ibc7Xjdy7Dho
MIME-Version: 1.0
X-Received: by 2002:a5d:8459:0:b0:6e0:1d42:74d5 with SMTP id
 w25-20020a5d8459000000b006e01d4274d5mr2119918ior.169.1672465308316; Fri, 30
 Dec 2022 21:41:48 -0800 (PST)
Date: Fri, 30 Dec 2022 21:41:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000099fc4705f1192c71@google.com>
From: syzbot <syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 1b929c02afd3
 Linux 6.2-rc1 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=14467b44480000
 kernel config: https://syzkaller.appspot.com/x/.config?x=2651619a26b [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1pBUcz-000Agt-RS
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: use-after-free Read in
 __update_extent_tree_range
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

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14467b44480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=823000d23b3400619f7c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12597238480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ae9d7f880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d562ace1a56c/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/39f000fe6b9e/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c67e48de5a0/bzImage-1b929c02.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7397ce24df87/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com

F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 753bd00b
==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x3ee7/0x56d0 kernel/locking/lockdep.c:4925
Read of size 8 at addr ffff8880728e9048 by task syz-executor277/5099

CPU: 0 PID: 5099 Comm: syz-executor277 Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:306 [inline]
 print_report+0x15e/0x45d mm/kasan/report.c:417
 kasan_report+0xbf/0x1f0 mm/kasan/report.c:517
 __lock_acquire+0x3ee7/0x56d0 kernel/locking/lockdep.c:4925
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 __raw_write_lock include/linux/rwlock_api_smp.h:209 [inline]
 _raw_write_lock+0x2e/0x40 kernel/locking/spinlock.c:300
 __update_extent_tree_range+0x9c2/0x1740 fs/f2fs/extent_cache.c:692
 __update_extent_cache fs/f2fs/extent_cache.c:960 [inline]
 f2fs_update_read_extent_cache+0x287/0x360 fs/f2fs/extent_cache.c:1050
 f2fs_outplace_write_data+0x1eb/0x280 fs/f2fs/segment.c:3454
 f2fs_do_write_data_page+0x9c7/0x1e20 fs/f2fs/data.c:2745
 f2fs_write_single_data_page+0x13f0/0x1920 fs/f2fs/data.c:2863
 f2fs_write_cache_pages+0xaa8/0x2010 fs/f2fs/data.c:3115
 __f2fs_write_data_pages fs/f2fs/data.c:3265 [inline]
 f2fs_write_data_pages+0x4c7/0x1230 fs/f2fs/data.c:3292
 do_writepages+0x1af/0x690 mm/page-writeback.c:2581
 filemap_fdatawrite_wbc mm/filemap.c:388 [inline]
 filemap_fdatawrite_wbc+0x147/0x1b0 mm/filemap.c:378
 __filemap_fdatawrite_range+0xb8/0xf0 mm/filemap.c:421
 file_write_and_wait_range+0xce/0x140 mm/filemap.c:777
 f2fs_do_sync_file+0x3a4/0x2a20 fs/f2fs/file.c:275
 f2fs_sync_file+0x13a/0x190 fs/f2fs/file.c:393
 vfs_fsync_range+0x13e/0x230 fs/sync.c:188
 generic_write_sync include/linux/fs.h:2882 [inline]
 f2fs_file_write_iter+0x1840/0x31c0 fs/f2fs/file.c:4721
 call_write_iter include/linux/fs.h:2186 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x9ed/0xdd0 fs/read_write.c:584
 ksys_write+0x12b/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7faeb95879a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007faeb9524208 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007faeb9614708 RCX: 00007faeb95879a9
RDX: 000000000000fd14 RSI: 0000000020000080 RDI: 0000000000000005
RBP: 00007faeb9614700 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007faeb961470c
R13: 00007ffe6bd47dff R14: 00007faeb9524300 R15: 0000000000022000
 </TASK>

Allocated by task 5105:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 __kasan_slab_alloc+0x82/0x90 mm/kasan/common.c:325
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slab.h:761 [inline]
 slab_alloc_node mm/slub.c:3452 [inline]
 slab_alloc mm/slub.c:3460 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3467 [inline]
 kmem_cache_alloc+0x1e4/0x430 mm/slub.c:3476
 f2fs_kmem_cache_alloc_nofail fs/f2fs/f2fs.h:2796 [inline]
 f2fs_kmem_cache_alloc fs/f2fs/f2fs.h:2806 [inline]
 __grab_extent_tree+0x278/0x5a0 fs/f2fs/extent_cache.c:423
 f2fs_init_extent_tree+0x57/0x80 fs/f2fs/extent_cache.c:533
 f2fs_new_inode+0xdfa/0x2760 fs/f2fs/namei.c:312
 __f2fs_tmpfile+0xba/0x440 fs/f2fs/namei.c:852
 f2fs_ioc_start_atomic_write+0x409/0x1260 fs/f2fs/file.c:2098
 __f2fs_ioctl+0x3f2a/0xaaf0 fs/f2fs/file.c:4150
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 5105:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2e/0x40 mm/kasan/generic.c:518
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x160/0x1c0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:177 [inline]
 slab_free_hook mm/slub.c:1781 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1807
 slab_free mm/slub.c:3787 [inline]
 kmem_cache_free+0xee/0x5c0 mm/slub.c:3809
 __destroy_extent_tree+0x1f8/0x7f0 fs/f2fs/extent_cache.c:1191
 f2fs_destroy_extent_tree+0x17/0x30 fs/f2fs/extent_cache.c:1202
 f2fs_evict_inode+0x38b/0x1df0 fs/f2fs/inode.c:789
 evict+0x2ed/0x6b0 fs/inode.c:664
 iput_final fs/inode.c:1747 [inline]
 iput.part.0+0x59b/0x880 fs/inode.c:1773
 iput+0x5c/0x80 fs/inode.c:1763
 f2fs_abort_atomic_write+0xea/0x4f0 fs/f2fs/segment.c:196
 f2fs_file_flush+0x79/0xa0 fs/f2fs/file.c:1884
 filp_close+0xb8/0x160 fs/open.c:1420
 __range_close fs/file.c:714 [inline]
 __close_range+0x454/0x980 fs/file.c:776
 __do_sys_close_range fs/open.c:1465 [inline]
 __se_sys_close_range fs/open.c:1462 [inline]
 __x64_sys_close_range+0x73/0xb0 fs/open.c:1462
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff8880728e9000
 which belongs to the cache f2fs_extent_tree of size 144
The buggy address is located 72 bytes inside of
 144-byte region [ffff8880728e9000, ffff8880728e9090)

The buggy address belongs to the physical page:
page:ffffea0001ca3a40 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x728e9
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffff88801be69a00 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080130013 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Reclaimable, gfp_mask 0x12c50(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_RECLAIMABLE), pid 5105, tgid 5098 (syz-executor277), ts 675484271130, free_ts 11304318576
 prep_new_page mm/page_alloc.c:2531 [inline]
 get_page_from_freelist+0x119c/0x2ce0 mm/page_alloc.c:4283
 __alloc_pages+0x1cb/0x5b0 mm/page_alloc.c:5549
 alloc_pages+0x1aa/0x270 mm/mempolicy.c:2286
 alloc_slab_page mm/slub.c:1851 [inline]
 allocate_slab+0x25f/0x350 mm/slub.c:1998
 new_slab mm/slub.c:2051 [inline]
 ___slab_alloc+0xa91/0x1400 mm/slub.c:3193
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3292
 __slab_alloc_node mm/slub.c:3345 [inline]
 slab_alloc_node mm/slub.c:3442 [inline]
 slab_alloc mm/slub.c:3460 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3467 [inline]
 kmem_cache_alloc+0x379/0x430 mm/slub.c:3476
 f2fs_kmem_cache_alloc_nofail fs/f2fs/f2fs.h:2796 [inline]
 f2fs_kmem_cache_alloc fs/f2fs/f2fs.h:2806 [inline]
 __grab_extent_tree+0x278/0x5a0 fs/f2fs/extent_cache.c:423
 f2fs_init_extent_tree+0x57/0x80 fs/f2fs/extent_cache.c:533
 f2fs_new_inode+0xdfa/0x2760 fs/f2fs/namei.c:312
 __f2fs_tmpfile+0xba/0x440 fs/f2fs/namei.c:852
 f2fs_ioc_start_atomic_write+0x409/0x1260 fs/f2fs/file.c:2098
 __f2fs_ioctl+0x3f2a/0xaaf0 fs/f2fs/file.c:4150
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1446 [inline]
 free_pcp_prepare+0x65c/0xc00 mm/page_alloc.c:1496
 free_unref_page_prepare mm/page_alloc.c:3369 [inline]
 free_unref_page+0x1d/0x490 mm/page_alloc.c:3464
 free_contig_range+0xb5/0x180 mm/page_alloc.c:9485
 destroy_args+0xa8/0x64c mm/debug_vm_pgtable.c:998
 debug_vm_pgtable+0x28de/0x296f mm/debug_vm_pgtable.c:1318
 do_one_initcall+0x141/0x790 init/main.c:1306
 do_initcall_level init/main.c:1379 [inline]
 do_initcalls init/main.c:1395 [inline]
 do_basic_setup init/main.c:1414 [inline]
 kernel_init_freeable+0x6f9/0x782 init/main.c:1634
 kernel_init+0x1e/0x1d0 init/main.c:1522
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

Memory state around the buggy address:
 ffff8880728e8f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880728e8f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880728e9000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff8880728e9080: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880728e9100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
