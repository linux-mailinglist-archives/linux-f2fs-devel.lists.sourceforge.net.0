Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FCC96558
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 10:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnsnsDaV9wRBcrOneb6GlhYzylLmgKABv+aP8rE1a1I=; b=k6sVl45HWDRfnvSCOKcwvMnX5l
	RHtHj8Ybf1AJxYZuV1kZ54nc+nCcouemmLibIuMoSQF4XTkIfTjmiIxfcLsJ4eY2bbjqncTMxZaTj
	TzGAi6HJ4Uhh25LwTSWB8R8+xwhPItDxNdHErqFcdZzERuNjR6QivyT+9MdgyY0C8qsw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vPzvb-0000nF-Iw;
	Mon, 01 Dec 2025 09:10:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hlstaQkbAEMx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vPzvZ-0000n8-HY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 09:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2k8qgKEljILzjtJ0XiwoKDif96chIg+72naIXv3DA8k=; b=adYPENnv77ed8o5hUailqqJOhL
 oYRKbegIOr9Tlk33D5hkoF+IJpx5B93pjmrbakoAe9rA8GtxZ3Gk5Qfy3zqfxZNWeK030fpwYTLYH
 4HmuzEFIpAMYSgIevcB5tZ/eZM1y95sWT9wfug4hGTd7TQ27YVqPopzwRb/CGEZzE/Ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2k8qgKEljILzjtJ0XiwoKDif96chIg+72naIXv3DA8k=; b=V
 HuVaVBKO5SAHEH8w6Rh/pO95vhX82SD7F+LL06B5o54m3aFTyh3tQoQ1HmktTzMGsvCjE2W1z79E3
 LULtKBYrqCMSNdVeYvu8cuc1wsrwZ66sGcOw9XlYSOmnOunmGNPwp2K7LSNaZ8y6ZIfjcbJ6UPO4H
 Y3s7FbClDcqNQWaQ=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vPzvY-0006mu-BD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 09:10:37 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-43329b607e0so28277965ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Dec 2025 01:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764580230; x=1765185030;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2k8qgKEljILzjtJ0XiwoKDif96chIg+72naIXv3DA8k=;
 b=K7o2tB0SLvKZGEGvINnnvFdc4Oq22wk+sXXfdGyvKahfPqy0gzUMTsGY2/Sk891BHN
 qehJv1ltrfCw08slMeEBHvn6z41t/RDwF7A2h1OJ1E2/p825m4mQeiJRf7M0mD6Snj9X
 3n09NRbNbhxF0YzKqQzj80xTaRawxaYyEWk/zQHmyzbgmQbnA0KCsf7HJ649VEsOE1Oz
 +kY3AVePLae7M1YE/JIALRIeTV9OCw3FrHZxe1/1n5O32zIDL5pvvBm4F3vFIiDDcKIt
 jrvGOAggZPuK6UwJ6AkKrG9/4T7HKfKflx5JAyCkZDvzK8vJwOjFPQNw2VohlRYAli6k
 jDhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXEfuXL7tGfhPuKTP02YL7zORc9lBQAqucDgvxxme/lLCC6rMLJzFPIBGWKtuiI9DeWjhbKA081/V5gZre0VKR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzyvEbgcBAP5t69ck/jX6d8vZ9fWCZFNWhu9oWuPhbI5qT/TTFK
 o6tDUmmAiAcLmjHcpyOfFFtwYmc7hFs5DvOmk04RCj2utS+0at8OkaHANsLTo1QqvXaalK5m+eT
 j+6j9D+wDz/2MjjWSL5jCW3N13O15+F5Td+PmLv+pQmTeBM03/IP3AzPR+Qc=
X-Google-Smtp-Source: AGHT+IF1aiVSH614pBQ3hs1nPzsc2B+J5eeNE/ihojUPrFJ1N/dEtQVWGqnK4rp6t/El90t6QaZPsw1QXFfAbBWwvS/FyQQLIGGr
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:433:7a7c:e2a2 with SMTP id
 e9e14a558f8ab-435b8c18056mr332777245ab.7.1764580230601; Mon, 01 Dec 2025
 01:10:30 -0800 (PST)
Date: Mon, 01 Dec 2025 01:10:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692d5b86.a70a0220.2ea503.00b1.GAE@google.com>
From: syzbot <syzbot+e818dd42ada3b583bed1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 663d0d1af3fa
 Add linux-next specific files for 20251126 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=17c8de12580000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1vPzvY-0006mu-BD
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 seq_show_option
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

HEAD commit:    663d0d1af3fa Add linux-next specific files for 20251126
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17c8de12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf77a4e0e3514deb
dashboard link: https://syzkaller.appspot.com/bug?extid=e818dd42ada3b583bed1
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b0d3a605c657/disk-663d0d1a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/599c0318b349/vmlinux-663d0d1a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3194a0948cbf/bzImage-663d0d1a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e818dd42ada3b583bed1@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in strlen+0x57/0x70 lib/string.c:420
Read of size 1 at addr ffff8880334b0000 by task syz.5.1156/11313

CPU: 1 UID: 0 PID: 11313 Comm: syz.5.1156 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 strlen+0x57/0x70 lib/string.c:420
 __fortify_strlen include/linux/fortify-string.h:268 [inline]
 seq_escape_str include/linux/seq_file.h:146 [inline]
 seq_escape include/linux/seq_file.h:162 [inline]
 seq_show_option+0x61/0x90 include/linux/seq_file.h:272
 f2fs_show_quota_options fs/f2fs/super.c:2246 [inline]
 f2fs_show_options+0xc50/0x1990 fs/f2fs/super.c:2431
 show_vfsmnt+0x545/0x690 fs/proc_namespace.c:129
 seq_read_iter+0x9bb/0xe20 fs/seq_file.c:272
 new_sync_read fs/read_write.c:491 [inline]
 vfs_read+0x55a/0xa30 fs/read_write.c:572
 ksys_pread64 fs/read_write.c:763 [inline]
 __do_sys_pread64 fs/read_write.c:771 [inline]
 __se_sys_pread64 fs/read_write.c:768 [inline]
 __x64_sys_pread64+0x193/0x220 fs/read_write.c:768
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f380eb8f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f380faed038 EFLAGS: 00000246 ORIG_RAX: 0000000000000011
RAX: ffffffffffffffda RBX: 00007f380ede6090 RCX: 00007f380eb8f749
RDX: 0000000000001000 RSI: 0000200000002240 RDI: 0000000000000009
RBP: 00007f380ec13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000000000ff R11: 0000000000000246 R12: 0000000000000000
R13: 00007f380ede6128 R14: 00007f380ede6090 R15: 00007ffe3d747e18
 </TASK>

Allocated by task 11266:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __do_kmalloc_node mm/slub.c:5652 [inline]
 __kmalloc_node_track_caller_noprof+0x575/0x820 mm/slub.c:5759
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x42/0x100 mm/util.c:84
 f2fs_apply_quota_options fs/f2fs/super.c:1575 [inline]
 f2fs_apply_options+0x1297/0x1f00 fs/f2fs/super.c:1715
 f2fs_fill_super+0x258d/0x6ec0 fs/f2fs/super.c:4949
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1691
 vfs_get_tree+0x92/0x2a0 fs/super.c:1751
 fc_mount fs/namespace.c:1209 [inline]
 do_new_mount_fc fs/namespace.c:3646 [inline]
 do_new_mount+0x302/0xa10 fs/namespace.c:3722
 do_mount fs/namespace.c:4045 [inline]
 __do_sys_mount fs/namespace.c:4234 [inline]
 __se_sys_mount+0x313/0x410 fs/namespace.c:4211
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 11266:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6663 [inline]
 kfree+0x1c0/0x660 mm/slub.c:6871
 __f2fs_remount fs/f2fs/super.c:2998 [inline]
 f2fs_reconfigure+0x568/0x1770 fs/f2fs/super.c:5398
 reconfigure_super+0x227/0x880 fs/super.c:1077
 do_remount fs/namespace.c:3274 [inline]
 path_mount+0xd29/0xff0 fs/namespace.c:4024
 do_mount fs/namespace.c:4045 [inline]
 __do_sys_mount fs/namespace.c:4234 [inline]
 __se_sys_mount+0x313/0x410 fs/namespace.c:4211
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880334b0000
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff8880334b0000, ffff8880334b0010)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x334b0
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813fe26640 ffffea0000baf900 dead000000000002
raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5825, tgid 5825 (syz-executor), ts 125816652236, free_ts 125816563208
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
 prep_new_page mm/page_alloc.c:1854 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_slab_page mm/slub.c:3077 [inline]
 allocate_slab+0x7a/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xf2b/0x1960 mm/slub.c:4651
 __slab_alloc+0x65/0x100 mm/slub.c:4774
 __slab_alloc_node mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:5246 [inline]
 __do_kmalloc_node mm/slub.c:5651 [inline]
 __kvmalloc_node_noprof+0x6b6/0x920 mm/slub.c:7129
 xt_jumpstack_alloc net/netfilter/x_tables.c:1356 [inline]
 xt_replace_table+0x18a/0x7c0 net/netfilter/x_tables.c:1395
 __do_replace+0x15a/0x980 net/ipv6/netfilter/ip6_tables.c:1081
 do_replace net/ipv6/netfilter/ip6_tables.c:1158 [inline]
 do_ip6t_set_ctl+0xa16/0xce0 net/ipv6/netfilter/ip6_tables.c:1644
 nf_setsockopt+0x26f/0x290 net/netfilter/nf_sockopt.c:101
 do_sock_setsockopt+0x17c/0x1b0 net/socket.c:2353
 __sys_setsockopt net/socket.c:2378 [inline]
 __do_sys_setsockopt net/socket.c:2384 [inline]
 __se_sys_setsockopt net/socket.c:2381 [inline]
 __x64_sys_setsockopt+0x13f/0x1b0 net/socket.c:2381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5825 tgid 5825 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
 ___free_pages_bulk mm/kasan/shadow.c:333 [inline]
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:385 [inline]
 __kasan_populate_vmalloc+0x137/0x1d0 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:579 [inline]
 alloc_vmap_area+0xdc4/0x14e0 mm/vmalloc.c:2124
 __get_vm_area_node+0x1f8/0x300 mm/vmalloc.c:3219
 __vmalloc_node_range_noprof+0x371/0x16a0 mm/vmalloc.c:4011
 __vmalloc_node_noprof mm/vmalloc.c:4111 [inline]
 vzalloc_noprof+0xb2/0xf0 mm/vmalloc.c:4189
 __do_replace+0xab/0x980 net/ipv6/netfilter/ip6_tables.c:1063
 do_replace net/ipv6/netfilter/ip6_tables.c:1158 [inline]
 do_ip6t_set_ctl+0xa16/0xce0 net/ipv6/netfilter/ip6_tables.c:1644
 nf_setsockopt+0x26f/0x290 net/netfilter/nf_sockopt.c:101
 do_sock_setsockopt+0x17c/0x1b0 net/socket.c:2353
 __sys_setsockopt net/socket.c:2378 [inline]
 __do_sys_setsockopt net/socket.c:2384 [inline]
 __se_sys_setsockopt net/socket.c:2381 [inline]
 __x64_sys_setsockopt+0x13f/0x1b0 net/socket.c:2381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880334aff00: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
 ffff8880334aff80: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
>ffff8880334b0000: fa fb fc fc 00 03 fc fc 00 00 fc fc 00 00 fc fc
                   ^
 ffff8880334b0080: 00 07 fc fc 00 00 fc fc 00 00 fc fc 00 03 fc fc
 ffff8880334b0100: 00 00 fc fc 00 00 fc fc 00 00 fc fc 00 00 fc fc
==================================================================


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
