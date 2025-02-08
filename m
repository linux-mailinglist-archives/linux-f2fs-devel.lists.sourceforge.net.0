Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC200A2D3CA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2025 05:27:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tgcRN-0008RH-TY;
	Sat, 08 Feb 2025 04:27:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3LN2mZwkbAMU39Avlwwp2l00to.rzzrwp53p2nzy4py4.nzx@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tgcRM-0008RB-Dz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 04:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hEcdCIGgB0Vn/57Ax2iihJ0TfDTBfU1K58AmEwI4seE=; b=HQp8/ZbrropJc9gv113rDjR+gg
 E96reDlNbVje1ORrqqGQ66LchY4//eT4FoFSt1CGFnVAyr5TkqDcWV13oqyrntCioPC6taeZZJbdO
 maxfWTmQkOFM6f/kXHTBoaPV9vSbypQfr05scktUABlwNVmbkQuB4Pya435il5b/op/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hEcdCIGgB0Vn/57Ax2iihJ0TfDTBfU1K58AmEwI4seE=; b=X
 Tyo53I1m1GS4HG6zcxh+0jwel9LqnYnzKqNkc5jO6v4r4AzpAHer+Qsl4+PXOTL2EzWyywlYlJwRY
 uQHFf/XdD0+EKhoteuA3OAzZbgEC2KNtz+pV2R7NlrYx292yhni8aGjgtYG0HimvR/1VhMdVgnvoZ
 eAN1kiihJ273EX3g=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tgcRL-0002o0-6t for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 04:27:36 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3ce81a40f5cso49109745ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2025 20:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738988844; x=1739593644;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hEcdCIGgB0Vn/57Ax2iihJ0TfDTBfU1K58AmEwI4seE=;
 b=EykNnHfIud+q3C1MRe8QJQFYydq6BBZJK36smxbNz3HfAW77XDcgJ3/QPPmljQoH19
 ftG+EihNP20sLrx8bHcRcCkVLSIxPg5bxX+Xcx77O+7JRq99Iqjyz/LsNpIWmFoVuAMe
 lq4BcNM+7mk7hQpktlHDx+sHs1gECNuSuWOsEiB/2jr+sH6KjGFssuNxbeS0Fn8W2pdD
 hO4nh6FsEPsQSEbvEPnXYg3B+6ECv5DOAIZlX4uy9OlzquNTnI4TA+gzLx1idBk1JcZ0
 uJKWeo6StaETWG7C48MCupdzt8O2UA133Bc3T8xFBFTdsVY1hFtyhtPdSIndMaYcqFgh
 CrHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOSpRys/aKQV9ocHyNUzHWos8U68YHF7b9f7rf+SwBN4YCPnuxs33qh+ZQ1pC2IRsE+0rPcodTbcwTUFdaXJPS@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxulrf40kTB5j24Avuc0sz6kS3NZQZXYuQH+8dZbuIbAa+Bk1cX
 4fzO6f0OvWGS/Cx2aspVE3M+UXVjU384vEdylH6X2/sQWSj2YkZYg3lSj6ZWCT6sx5njed2Rbip
 yGkHQF679TtdhHA+IAmFULNFB4D6I7uQmSJ7HjmWSvsHMTImxOR7tTaA=
X-Google-Smtp-Source: AGHT+IGONa3WrAbCBs+aXEuwguWbD84J1vU/jPAEW3IeTBy5fJyVH1dHuEQCe9ofULEBI7Wfi/BzguJoDjtGlw0wXDHBxKdjnSZu
MIME-Version: 1.0
X-Received: by 2002:a92:c544:0:b0:3d0:47e3:40bb with SMTP id
 e9e14a558f8ab-3d13dcfd0bdmr45240225ab.4.1738988844299; Fri, 07 Feb 2025
 20:27:24 -0800 (PST)
Date: Fri, 07 Feb 2025 20:27:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a6dd2c.050a0220.110943.0008.GAE@google.com>
From: syzbot <syzbot+92895fc54ccb69ca6fa9@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 0de63bb7d919
 Merge tag 'pull-fix' of git://git.kernel.org/.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1699f5f8580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1tgcRL-0002o0-6t
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in folio_end_read
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

HEAD commit:    0de63bb7d919 Merge tag 'pull-fix' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1699f5f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1909f2f0d8e641ce
dashboard link: https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0de63bb7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1142009a30a7/vmlinux-0de63bb7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5d9e46a8998d/bzImage-0de63bb7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+92895fc54ccb69ca6fa9@syzkaller.appspotmail.com

page: refcount:2 mapcount:0 mapping:ffff8880455a0220 index:0x3807 pfn:0x5806b
memcg:ffff888036be0000
aops:f2fs_meta_aops ino:2
flags: 0x4fff400000000a9(locked|waiters|uptodate|lru|node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff400000000a9 ffffea0001184188 ffff88804368b240 ffff8880455a0220
raw: 0000000000003807 0000000000000000 00000002ffffffff ffff888036be0000
page dumped because: VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio))
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x40c40(GFP_NOFS|__GFP_COMP), pid 5320, tgid 5319 (syz.0.0), ts 62351716889, free_ts 62334302156
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_frozen_pages_noprof mm/mempolicy.c:2341 [inline]
 alloc_pages_noprof+0x121/0x190 mm/mempolicy.c:2361
 folio_alloc_noprof+0x1e/0x30 mm/mempolicy.c:2371
 filemap_alloc_folio_noprof+0xe1/0x540 mm/filemap.c:1019
 __filemap_get_folio+0x438/0xae0 mm/filemap.c:1970
 pagecache_get_page+0x2c/0x130 mm/folio-compat.c:87
 f2fs_pagecache_get_page fs/f2fs/f2fs.h:2804 [inline]
 ra_data_block+0x674/0xb40 fs/f2fs/gc.c:1263
 gc_data_segment fs/f2fs/gc.c:1627 [inline]
 do_garbage_collect+0x3b55/0x80e0 fs/f2fs/gc.c:1825
 f2fs_gc+0xf3a/0x2f60 fs/f2fs/gc.c:1929
 f2fs_balance_fs+0x5f1/0x810 fs/f2fs/segment.c:456
 f2fs_write_single_data_page+0x12ed/0x1bd0 fs/f2fs/data.c:2896
 f2fs_write_cache_pages fs/f2fs/data.c:3154 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3309 [inline]
 f2fs_write_data_pages+0x1e03/0x3670 fs/f2fs/data.c:3336
 do_writepages+0x35f/0x880 mm/page-writeback.c:2687
page last free pid 1037 tgid 1037 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0xe0d/0x10e0 mm/page_alloc.c:2660
 fscrypt_finalize_bounce_page include/linux/fscrypt.h:1119 [inline]
 f2fs_write_end_io+0x3cd/0x9a0 fs/f2fs/data.c:335
 blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
 loop_handle_cmd drivers/block/loop.c:1946 [inline]
 loop_process_work+0x1bc8/0x21c0 drivers/block/loop.c:1964
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1526!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 27 Comm: kworker/u4:2 Not tainted 6.14.0-rc1-syzkaller-00020-g0de63bb7d919 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: loop0 loop_workfn
RIP: 0010:folio_end_read+0x239/0x240 mm/filemap.c:1526
Code: 4f c7 ff 4c 89 ef 48 c7 c6 e0 d3 13 8c e8 6f 64 11 00 90 0f 0b e8 c7 4f c7 ff 4c 89 ef 48 c7 c6 20 cc 13 8c e8 58 64 11 00 90 <0f> 0b 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900004e73e8 EFLAGS: 00010246
RAX: df44434cf2d67900 RBX: 0000000000000008 RCX: 0000000000000001
RDX: dffffc0000000000 RSI: ffffffff8c0aa680 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffffffff942f9947 R09: 1ffffffff285f328
R10: dffffc0000000000 R11: fffffbfff285f329 R12: ffffea0001601ac8
R13: ffffea0001601ac0 R14: 1ffffd40002c0359 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f716e9b0fe0 CR3: 0000000011832000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_finish_read_bio+0x3bb/0x850 fs/f2fs/data.c:154
 blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
 loop_handle_cmd drivers/block/loop.c:1946 [inline]
 loop_process_work+0x1bc8/0x21c0 drivers/block/loop.c:1964
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_end_read+0x239/0x240 mm/filemap.c:1526
Code: 4f c7 ff 4c 89 ef 48 c7 c6 e0 d3 13 8c e8 6f 64 11 00 90 0f 0b e8 c7 4f c7 ff 4c 89 ef 48 c7 c6 20 cc 13 8c e8 58 64 11 00 90 <0f> 0b 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900004e73e8 EFLAGS: 00010246
RAX: df44434cf2d67900 RBX: 0000000000000008 RCX: 0000000000000001
RDX: dffffc0000000000 RSI: ffffffff8c0aa680 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffffffff942f9947 R09: 1ffffffff285f328
R10: dffffc0000000000 R11: fffffbfff285f329 R12: ffffea0001601ac8
R13: ffffea0001601ac0 R14: 1ffffd40002c0359 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f716e9b0fe0 CR3: 0000000043542000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
