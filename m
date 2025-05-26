Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3BAC3F5A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 14:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DcD+nPFWzmToPRKPozRopmfLSpDVPQa0IvcLLu0kcs=; b=CYkM7+n41uqBELq7ZjIjMN8tlT
	+KpmI0X6ZvwN3C2eIoCBGhy6aiSXNUJHFyLPqLdv7ssbNOHK55oIzxbT88ArWkTi7cC+f1+0bummf
	pN8oxZsEDuXA628XLSNrSR7zHxjb3tjxdSF08yiZYlZApk6udT8ohhQDalq7/5I5G8JY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJWwD-0007qx-43;
	Mon, 26 May 2025 12:28:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jVw0aAkbAGAQWXI8JJCP8NNGB.EMMEJCSQCPAMLRCLR.AMK@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uJWwB-0007qq-PE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 12:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ZFRirMrvovkvR0p68pHt3VbOxANt86tu4o2mfiacfc=; b=nBUJXf3KyA+qpRnI86PREZT2Xv
 x0VW0bmFSbv0D6rp+IXm2lBMtisc2DNBxqSVSJY4OJ0/eE3ekHx6PS1VZ7KXGmz73NmxdvEOB0qzV
 Z9ZXI5YD5kp4wIGuD4I9i4IqMAIIxoxxYuEzUjJVGwQkCQfpcNQfwyLzhm2xaLkXo5g0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3ZFRirMrvovkvR0p68pHt3VbOxANt86tu4o2mfiacfc=; b=n
 L6e2HxV0Xf5UWIsWBzSaBD59Q43j6ZwCMvB932jEsWJP0RZrJYQwkTHuJVSb/sAzx4fscqcvSkVZH
 0l1FRagwpOkRNT8ycJxG6QqwIJU6FyOk/hDvNcqldjBYr7YKQHr/yDwSWmJBkZhz0GjDxU4MXNiYl
 E5Ycs7+5Y8a5wTfc=;
Received: from mail-qk1-f207.google.com ([209.85.222.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uJWwA-0001RV-OY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 12:28:15 +0000
Received: by mail-qk1-f207.google.com with SMTP id
 af79cd13be357-7c5e2872e57so463296385a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 May 2025 05:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748262489; x=1748867289;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZFRirMrvovkvR0p68pHt3VbOxANt86tu4o2mfiacfc=;
 b=sCMTk/uf/GvqSQ8JaUslxiu+zySMLL9JK47re5kE4FmVaTw3b6uVJnyrFhkpf0gTci
 ZV76e8RTfs79tci3rIMFgjVhJ7PRwx0am+gCFGco5mAtxIbfq9+2UUkWCzYn+o/1bx32
 kPcpm2sLlPeWcChLm4zAHYAggmBRMFrhvMWs2jA4NH+03EBgsEmmf64HjEqtTmcuzK0c
 Oo0+/UzPKbORrr9LRIKLT47h18sEJcHAoDAN5YsDBtapLYoVcHM+laACkL1QksFz/C9o
 iSwXnCJZNBEyEyuh7vYw9a0WqiB5bRx6oDiT3nkDOz6E2LMpy2s9a+k/VjvfC8397UdI
 SDmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX86IHpy8RwjI+aLuByK9p0lC1UMwdR8GZsiHgpW5JZNR1gBfjyRhIIWciiaPwcEjnpjnUS7bpg1mBKIVLdgGEF@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy31wnKxbIM1FeLCfy7KTxCVEbOOnmNTvKmbC5+EIf3jJcex8tA
 P+0FDhtgY/CjZpVMNpr+nDtKJ5Jxw5RtaQtWOt2QGyM643sXcDej+gI7xXGYnf16ZXB4L7LPT1z
 +je3G5h0cZeC4zBAQziUrsVR+X8lSOEcoZVxBxtcPtpyhO7Kf19P/zQXpuTM=
X-Google-Smtp-Source: AGHT+IE53qGmkRTlRpiqAjt7FN6tu0ny6mUmqw9514wvPqae75aJ2FctWgsScppsWX2JZL7Y2P8NxAsVTp01ZwlvJD9gotM4d12I
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4011:b0:862:fe54:df4e with SMTP id
 ca18e2360f4ac-86cbb7fc4ffmr861566839f.7.1748262029990; Mon, 26 May 2025
 05:20:29 -0700 (PDT)
Date: Mon, 26 May 2025 05:20:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68345c8d.a70a0220.253bc2.0097.GAE@google.com>
From: syzbot <syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 176e917e010c
 Add linux-next specific files for 20250523 git tree: linux-next
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=148c2170580000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.207 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.207 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.207 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.207 listed in wl.mailspike.net]
X-Headers-End: 1uJWwA-0001RV-OY
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 build_sit_entries
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

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=148c2170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=1fa48dc6faf1ff972d7d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128bead4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100288e8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/81e56747f56a/mount_2.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=138f59f4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 262144
==================================================================
BUG: KASAN: slab-out-of-bounds in sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
BUG: KASAN: slab-out-of-bounds in build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
Read of size 4 at addr ffff888024798a20 by task syz-executor138/5840

CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
 build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
 f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff3b36f7e6a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc20c3a528 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc20c3a540 RCX: 00007ff3b36f7e6a
RDX: 0000200000020440 RSI: 0000200000020480 RDI: 00007ffc20c3a540
RBP: 0000200000020480 R08: 00007ffc20c3a580 R09: 0000000000020419
R10: 0000000000000000 R11: 0000000000000286 R12: 0000200000020440
R13: 00007ffc20c3a580 R14: 0000000000000003 R15: 0000000000000000
 </TASK>

Allocated by task 5840:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kvmalloc_node_noprof+0x30d/0x5f0 mm/slub.c:5014
 f2fs_kvmalloc fs/f2fs/f2fs.h:3527 [inline]
 f2fs_kvzalloc fs/f2fs/f2fs.h:3533 [inline]
 build_sit_info fs/f2fs/segment.c:4779 [inline]
 f2fs_build_segment_manager+0x1485/0x49f0 fs/f2fs/segment.c:5696
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888024798000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 allocated 2592-byte region [ffff888024798000, ffff888024798a20)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x24798
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea000091e601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5840, tgid 5840 (syz-executor138), ts 92190833917, free_ts 90155481941
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kvmalloc_node_noprof+0x429/0x5f0 mm/slub.c:5014
 f2fs_kvmalloc fs/f2fs/f2fs.h:3527 [inline]
 f2fs_kvzalloc fs/f2fs/f2fs.h:3533 [inline]
 build_sit_info fs/f2fs/segment.c:4779 [inline]
 f2fs_build_segment_manager+0x1485/0x49f0 fs/f2fs/segment.c:5696
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5833 tgid 5833 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 discard_slab mm/slub.c:2716 [inline]
 __put_partials+0x161/0x1c0 mm/slub.c:3185
 put_cpu_partial+0x17c/0x250 mm/slub.c:3260
 __slab_free+0x2f7/0x400 mm/slub.c:4512
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_node_noprof+0x1bb/0x3c0 mm/slub.c:4248
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:660
 alloc_skb_fclone include/linux/skbuff.h:1386 [inline]
 tcp_stream_alloc_skb+0x3d/0x340 net/ipv4/tcp.c:894
 tcp_sendmsg_locked+0x115c/0x5550 net/ipv4/tcp.c:1204
 tcp_sendmsg+0x2f/0x50 net/ipv4/tcp.c:1400
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x19c/0x270 net/socket.c:727
 sock_write_iter+0x258/0x330 net/socket.c:1131
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738

Memory state around the buggy address:
 ffff888024798900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888024798980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888024798a00: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
                               ^
 ffff888024798a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888024798b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
