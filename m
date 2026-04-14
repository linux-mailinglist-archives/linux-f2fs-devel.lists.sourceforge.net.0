Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNLzG3ew3WmLhwkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 05:11:51 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990C3F52DC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 05:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9ZjFJrnTQry2tWDfXMfZmt0mWSRp21UkCu4GYSn+Ng=; b=hxTBbejuP0SJYIdV+wQeJ4nhj+
	k/rQeDRYWR6otWPEgXFKz6pGZCLtW6ixkB2vXvoPyZxjU9+r7WScfHTyMQnM92rCEuwnVBb1rCWyS
	Lr/bX8wyvxI70haWTnj2q6Krj9wM/689Sfll+JnFH4UC9qv6e0Zw7l9oah+Yx/jUtSpE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCUBg-0006r3-03;
	Tue, 14 Apr 2026 03:11:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ZLDdaQkbAJEDJK5v66zCvAA3y.19916zFDzCx98Ez8E.x97@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wCUBe-0006ql-5W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 03:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+B1KEo7delsyE/AUU8oPIzOKC4rQ3Va38z5bj+QTbcQ=; b=eE2CI/2mBhlf6BXGlbAsR6dyyw
 sKfftaa+SLmlJaRS2+5DXiAoIXXVSHWzHg9CKjDrqina3oJmt1uviHNng038TgwUPeW2LqwtSvHOp
 lplxcGNuyv7bFTbCLORszdcOfQyTswhw+bRn4TslHqTxjRRyWCQS+d7m3jn+QJbzoFYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+B1KEo7delsyE/AUU8oPIzOKC4rQ3Va38z5bj+QTbcQ=; b=L
 xsMlXkQclYujjWXppAfLXOqVs6s0MYIRffewC0LnP1fhQMCd2pgcUEp7lLSffYS2I3dvk0OEgBAZm
 bx5oz91g4KdTmWR9HVUTMRVV4WxLrh6TS9i7+jskT+JRcqnxIHLaGooccTVyRV+d5GJF5Rslh3A5l
 2/lnTR1UJFr2iGBY=;
Received: from mail-oo1-f80.google.com ([209.85.161.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wCUBe-0003Qr-AU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 03:11:38 +0000
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-686e8d94970so9986206eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 20:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776136292; x=1776741092;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+B1KEo7delsyE/AUU8oPIzOKC4rQ3Va38z5bj+QTbcQ=;
 b=kGPba3WrKDTo/wsQU3AgM6p4mKx+IlkYbFrCHnyEl4KCaiWeGojtCcDTr46NpDu3B5
 5SFiFjmt3wIxSphXUAODZ8qEFaTUJc1UvjyLXTk0CyU+K5EFaf0XKwZgCI31JG5ruKgW
 DfNutLvxcgwx6/GjwO7nI4/uNF7p/WbOmnCdI7dgV/1pEQzalK+cR/PjnS10c1QzceCl
 OyTY2ZSAUoxHd0ITCqg7iWqq/Oxk+dj3T72tE6G8tCr554XmkAGCp1338QHtXNUnq02f
 XogvVBHYtN5kzUAjHJH3gKpya8qmd0MhGluXa7Bt+cjYhVR9VlLTFvgTK6nEOYhjN8UG
 BTZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/YCFc7+G/PM5GeJPRIWWrx+ZXFZXyoX+89kKqHNjyVMiNr1ngZSutUJcXqR0eYfxcwpjgF2A7f4VGMDEHYkMIO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxqOr5uDVzWUbdqotElXrzNag95wuyYNdztHYXF0J0+sosm+Jh4
 bd+0FtMKI5KGB/AIjChERfZi23ylfAYQYhJGtwnd087oeJWXD9t4GtBAHDbRzWA0+SJqHxpSa0y
 j5Hm86nZFt9fpCS9cuRWyG79s4QhBJJLwL0sC/skpOgrQMw89ozeuzH6hb78=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:308e:b0:685:7678:b537 with SMTP id
 006d021491bc7-68be7ee1957mr8561597eaf.34.1776136292720; Mon, 13 Apr 2026
 20:11:32 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:11:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ddb064.a00a0220.468cb.0057.GAE@google.com>
From: syzbot <syzbot+337ec6af661bd91fa43a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: a55f7f5f29b3
 Merge tag 'net-7.0-rc8' of git://git.kernel.o.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=15cc7bd6580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.80 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wCUBe-0003Qr-AU
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in folio_end_read (3)
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d46eab0cfd31c214];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[337ec6af661bd91fa43a];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,appspotmail.com:email,storage.googleapis.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 9990C3F52DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    a55f7f5f29b3 Merge tag 'net-7.0-rc8' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15cc7bd6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d46eab0cfd31c214
dashboard link: https://syzkaller.appspot.com/bug?extid=337ec6af661bd91fa43a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a55f7f5f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6392912f99d3/vmlinux-a55f7f5f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9d6fd8c7dfa0/bzImage-a55f7f5f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+337ec6af661bd91fa43a@syzkaller.appspotmail.com

page: refcount:2 mapcount:0 mapping:ffff888046f3e788 index:0x1507 pfn:0x32d0e
memcg:ffff88801c6c8d40
aops:f2fs_meta_aops ino:2
flags: 0x4fff400000000a9(locked|waiters|uptodate|lru|node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff400000000a9 ffffea0000d1b988 ffff888030450a80 ffff888046f3e788
raw: 0000000000001507 0000000000000000 00000002ffffffff ffff88801c6c8d40
page dumped because: VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio))
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x40c40(GFP_NOFS|__GFP_COMP), pid 5318, tgid 5316 (syz.0.0), ts 76502021566, free_ts 42035680990
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1889
 prep_new_page mm/page_alloc.c:1897 [inline]
 get_page_from_freelist+0x24dc/0x2580 mm/page_alloc.c:3962
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5250
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2490
 alloc_frozen_pages_noprof mm/mempolicy.c:2561 [inline]
 alloc_pages_noprof+0xa8/0x1a0 mm/mempolicy.c:2581
 folio_alloc_noprof+0x1e/0x30 mm/mempolicy.c:2591
 filemap_alloc_folio_noprof+0x111/0x470 mm/filemap.c:1013
 __filemap_get_folio_mpol+0x3fc/0xb00 mm/filemap.c:2011
 __filemap_get_folio include/linux/pagemap.h:763 [inline]
 f2fs_filemap_get_folio fs/f2fs/f2fs.h:3065 [inline]
 ra_data_block+0x544/0xd00 fs/f2fs/gc.c:1277
 gc_data_segment fs/f2fs/gc.c:1648 [inline]
 do_garbage_collect+0x358d/0x7080 fs/f2fs/gc.c:1874
 f2fs_gc+0xca2/0x2570 fs/f2fs/gc.c:1981
 f2fs_balance_fs+0x657/0x840 fs/f2fs/segment.c:467
 f2fs_map_blocks+0x2958/0x4340 fs/f2fs/data.c:1826
 f2fs_iomap_begin+0x3bd/0x8f0 fs/f2fs/data.c:4527
 iomap_iter+0x600/0x1020 fs/iomap/iter.c:110
 __iomap_dio_rw+0x1360/0x1ea0 fs/iomap/direct-io.c:795
page last free pid 15 tgid 15 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xc2b/0xdb0 mm/page_alloc.c:2978
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2617 [inline]
 rcu_core+0x7cd/0x1070 kernel/rcu/tree.c:2869
 handle_softirqs+0x22a/0x870 kernel/softirq.c:622
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1063
 smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1536!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 42 Comm: kworker/u4:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: loop0 loop_workfn
RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1536
Code: 6f c3 ff 48 89 df 48 c7 c6 e0 c4 d7 8b e8 ba ba 25 ff 90 0f 0b e8 02 6f c3 ff 48 89 df 48 c7 c6 40 bb d7 8b e8 a3 ba 25 ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
RSP: 0018:ffffc90000447478 EFLAGS: 00010246
RAX: b965f80585da9300 RBX: ffffea0000cb4380 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8deff28a RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff9011feb7 R09: 1ffffffff2023fd6
R10: dffffc0000000000 R11: fffffbfff2023fd7 R12: 1ffffd4000196871
R13: 1ffffd4000196870 R14: ffffea0000cb4388 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88808ca49000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8b147ff000 CR3: 0000000038c3d000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_finish_read_bio+0x4fc/0x940 fs/f2fs/data.c:182
 blk_update_request+0x57e/0xe60 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1178
 lo_rw_aio_complete drivers/block/loop.c:337 [inline]
 lo_rw_aio+0xcde/0xf00 drivers/block/loop.c:409
 do_req_filebacked drivers/block/loop.c:435 [inline]
 loop_handle_cmd drivers/block/loop.c:1925 [inline]
 loop_process_work+0x958/0x11a0 drivers/block/loop.c:1960
 process_one_work kernel/workqueue.c:3276 [inline]
 process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1536
Code: 6f c3 ff 48 89 df 48 c7 c6 e0 c4 d7 8b e8 ba ba 25 ff 90 0f 0b e8 02 6f c3 ff 48 89 df 48 c7 c6 40 bb d7 8b e8 a3 ba 25 ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
RSP: 0018:ffffc90000447478 EFLAGS: 00010246
RAX: b965f80585da9300 RBX: ffffea0000cb4380 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8deff28a RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff9011feb7 R09: 1ffffffff2023fd6
R10: dffffc0000000000 R11: fffffbfff2023fd7 R12: 1ffffd4000196871
R13: 1ffffd4000196870 R14: ffffea0000cb4388 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88808ca49000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8b147ff000 CR3: 0000000038c3d000 CR4: 0000000000352ef0


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
