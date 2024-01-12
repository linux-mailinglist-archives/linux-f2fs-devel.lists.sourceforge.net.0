Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418282C548
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 19:14:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOM3F-0007Yd-Bw;
	Fri, 12 Jan 2024 18:14:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3g4GhZQkbAEAu01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rOM3E-0007YX-0E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 18:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dn0NAT9KKp1lDvsGjAjdrB4QOsBdH8xKOqrmNmdRpT8=; b=WL81U4CeC997OcWAYfrK3kNWfq
 rEVE4mELo6FUMCULZjsbptxc/ENw9j3s+h2Ca89W7c9aih4GNS8jxM72NSxWzatqv+GIHwT7BUgSe
 rw20o6IuWRU112UAbiv1EjDSHRvs30s/HJWHC/LCu5JONHDXHp/OYr34gU+td4+TuYEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dn0NAT9KKp1lDvsGjAjdrB4QOsBdH8xKOqrmNmdRpT8=; b=k
 RHiFGkxLWzGhTwqLDh5GgAJp18SFWAT6zDe0MQtt30JGC9y/e5lP54PpBC75H8I9EUZfG49dJcRfM
 C/ZaQOZ3UUAFCn20bYix7YKT0zOon64DBd4AnwB/YLHpR3E6kc1y2sWGLPw6yiwtSRtxkNFfIg0PF
 uc6+edskWN/1U0aI=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOM3B-0004Ve-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 18:14:39 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-360a85e5e82so24591725ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 10:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083267; x=1705688067;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dn0NAT9KKp1lDvsGjAjdrB4QOsBdH8xKOqrmNmdRpT8=;
 b=J/AXSUw24iGkU9SMZdCZrOU6RYYtcuoX4rDLsnaQZgB/BHWhY2RsToH7s0iFfe714T
 spAt8AxwDIkC9QGREbzGgC6IvCIMSVPrITj3UIoLx7bUXJIJ8fVPlS8nlEnIaI53nQwC
 zh0A4ek20/XQMU9Gql2q4kAJb73H7x3QDsN8AZdC1ZTa07Vz5XZwXU+6x/UcZq+7uj1+
 RZ3NY0sfL9U3kw6YkQipy10kTHs5KkXo33pkbDpZmtpvWdlrPS1deeIjb7JsilE/nEEn
 0G7XtbAqaamHhLTfeYOOap1TSLiQ/2SI+fkiShqe2LtYLNi5gttq6/OPnyjXXMI/v3Ha
 EIcw==
X-Gm-Message-State: AOJu0YzUmOkNSL2jbhCwiBtLds0dZMHR25FGOXFw3TVA0/FZ4YOjDsAw
 KCgqxbxsDiGwVqoyP7qjCBm9T6Apu1E/QGdnoaNMKSOcPUIO
X-Google-Smtp-Source: AGHT+IGdks1e1+QL2R7X04qDDlaPjy9qkKlH/SXAgtmCrm+aMzbKgAWO63RMbV9GTmpz5bg6+hcDAYwCPQZHD+E5oj1joYqpbjRU
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1690:b0:46e:565d:2e76 with SMTP id
 f16-20020a056638169000b0046e565d2e76mr127352jat.4.1705083267622; Fri, 12 Jan
 2024 10:14:27 -0800 (PST)
Date: Fri, 12 Jan 2024 10:14:27 -0800
In-Reply-To: <0000000000006cb174060ec34502@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ab192060ec3a224@google.com>
From: syzbot <syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ker..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=13973ca5e80000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOM3B-0004Ve-Oa
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 kill_f2fs_super
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13973ca5e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4607bc15d1c4bb90
dashboard link: https://syzkaller.appspot.com/bug?extid=8f477ac014ff5b32d81f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b910ede80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4faf0f99e43c/disk-70d201a4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/23f59e40d2ef/vmlinux-70d201a4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a0bc6007f0a4/bzImage-70d201a4.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/47520ebdcfe6/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/bc946d522410/mount_1.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in destroy_device_list fs/f2fs/super.c:1606 [inline]
BUG: KASAN: slab-use-after-free in kill_f2fs_super+0x618/0x690 fs/f2fs/super.c:4932
Read of size 4 at addr ffff88801c6bd77c by task syz-executor.0/5218

CPU: 1 PID: 5218 Comm: syz-executor.0 Not tainted 6.7.0-syzkaller-06264-g70d201a40823 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x163/0x540 mm/kasan/report.c:488
 kasan_report+0x142/0x170 mm/kasan/report.c:601
 destroy_device_list fs/f2fs/super.c:1606 [inline]
 kill_f2fs_super+0x618/0x690 fs/f2fs/super.c:4932
 deactivate_locked_super+0xc1/0x130 fs/super.c:477
 mount_bdev+0x222/0x2d0 fs/super.c:1665
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7ff92ca7e4aa
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 09 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd484f9b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fffd484fa40 RCX: 00007ff92ca7e4aa
RDX: 0000000020000040 RSI: 0000000020000080 RDI: 00007fffd484fa00
RBP: 0000000020000040 R08: 00007fffd484fa40 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000020000080
R13: 00007fffd484fa00 R14: 00000000000054f9 R15: 00000000200004c0
 </TASK>

Allocated by task 5218:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x70 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:372 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:389
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 kmalloc_trace+0x1d6/0x360 mm/slub.c:4012
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 f2fs_fill_super+0xce/0x8170 fs/f2fs/super.c:4397
 mount_bdev+0x206/0x2d0 fs/super.c:1663
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Freed by task 5218:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x70 mm/kasan/common.c:68
 kasan_save_free_info+0x4e/0x60 mm/kasan/generic.c:634
 poison_slab_object+0xa6/0xe0 mm/kasan/common.c:241
 __kasan_slab_free+0x34/0x60 mm/kasan/common.c:257
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2121 [inline]
 slab_free mm/slub.c:4299 [inline]
 kfree+0x14a/0x380 mm/slub.c:4409
 f2fs_fill_super+0x6b04/0x8170 fs/f2fs/super.c:4882
 mount_bdev+0x206/0x2d0 fs/super.c:1663
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

The buggy address belongs to the object at ffff88801c6bc000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6012 bytes inside of
 freed 8192-byte region [ffff88801c6bc000, ffff88801c6be000)

The buggy address belongs to the physical page:
page:ffffea000071ae00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1c6b8
head:ffffea000071ae00 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000840(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000840 ffff888012c42280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x1d20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_HARDWALL), pid 5217, tgid 5217 (syz-executor.2), ts 94314184798, free_ts 94276562119
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x1e6/0x210 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0x33ea/0x3570 mm/page_alloc.c:3311
 __alloc_pages+0x255/0x680 mm/page_alloc.c:4567
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page+0x5f/0x160 mm/slub.c:2190
 allocate_slab mm/slub.c:2354 [inline]
 new_slab+0x84/0x2f0 mm/slub.c:2407
 ___slab_alloc+0xd17/0x13d0 mm/slub.c:3540
 __slab_alloc mm/slub.c:3625 [inline]
 __slab_alloc_node mm/slub.c:3678 [inline]
 slab_alloc_node mm/slub.c:3850 [inline]
 __do_kmalloc_node mm/slub.c:3980 [inline]
 __kmalloc_node+0x2d2/0x4e0 mm/slub.c:3988
 kmalloc_node include/linux/slab.h:610 [inline]
 kvmalloc_node+0x72/0x180 mm/util.c:617
 build_sit_info fs/f2fs/segment.c:4402 [inline]
 f2fs_build_segment_manager+0x1036/0x3270 fs/f2fs/segment.c:5252
 f2fs_fill_super+0x5792/0x8170 fs/f2fs/super.c:4609
 mount_bdev+0x206/0x2d0 fs/super.c:1663
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
page last free pid 4503 tgid 4503 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x959/0xa80 mm/page_alloc.c:2346
 free_unref_page+0x37/0x3f0 mm/page_alloc.c:2486
 discard_slab mm/slub.c:2453 [inline]
 __put_partials+0xeb/0x130 mm/slub.c:2922
 put_cpu_partial+0x17b/0x250 mm/slub.c:2997
 __slab_free+0x2fe/0x410 mm/slub.c:4166
 qlink_free mm/kasan/quarantine.c:160 [inline]
 qlist_free_all+0x6d/0xd0 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x14b/0x160 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0x23/0x70 mm/kasan/common.c:324
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3813 [inline]
 slab_alloc_node mm/slub.c:3860 [inline]
 kmem_cache_alloc+0x16f/0x340 mm/slub.c:3867
 getname_flags+0xbc/0x4f0 fs/namei.c:140
 user_path_at_empty+0x2c/0x60 fs/namei.c:2909
 do_readlinkat+0x118/0x3b0 fs/stat.c:499
 __do_sys_readlink fs/stat.c:532 [inline]
 __se_sys_readlink fs/stat.c:529 [inline]
 __x64_sys_readlink+0x7f/0x90 fs/stat.c:529
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Memory state around the buggy address:
 ffff88801c6bd600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801c6bd680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801c6bd700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88801c6bd780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801c6bd800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
