Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC09H6QKpWm60AUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 04:57:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA19F1D2D37
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 04:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Uh6c6eyG4EZJHXH6FRdXk7vPEzPQOazzoHPwuuR+Jr0=; b=JDY1fI/5yZPPnZT+eQKPGnUpT0
	SHMilZ4Swb5nK1lrid1Gi9gGA15IqX8CpSdcMEg4lNIVflOIOldIib8uFik/h3Y6lzFggEZ5m4td1
	Pr/Pxu1QWREoTlLpD95CTaXDJ3UJtKsinFCnhx3xXDiHbQxuYyE+iluNp8X+c8iAfiY8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vwuPC-0006WZ-9n;
	Mon, 02 Mar 2026 03:57:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jQqlaQkbAIo6CDyozzs5o33wr.u22uzs86s5q217s17.q20@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vwuPB-0006WQ-1Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 03:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmWvfmtgAcDRz4bFImh8rJEfEmq6Cak2/bFtX09VN9Q=; b=f8zUhkulADlPrwp7tpEXalsDDU
 IbHTEyfbHjqh6gch7zMcoLYgjYJ2L7pf9sTuuY5EGJ8puulLkjUezMrA3TF/blF74sdwMX2Y8bCJV
 qxLUCC7UPUmfIXLTJ+tyx3QrUYe8RxRh5SClC9gjAQTLadwoW8vjfq0NDdFmD8pVyJ8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JmWvfmtgAcDRz4bFImh8rJEfEmq6Cak2/bFtX09VN9Q=; b=j
 j4SYDmttuFGehz7fXWDqm18OuQnVqu53RbOZJ1V6YeNCuYE5+Cf5WRshaZ0ZWd2r9CjbItne41Qv7
 DEWKcWBsJnQvb1v+AcnUslsnlTSCKwqrDmwpkkbsgXlAd15nTmjc+/q5oPnhqxiSD76Hb8c2E16hB
 iW/YhBRyDZHD/LQw=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vwuPA-00043E-C6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 03:57:12 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-679ca40278bso80368588eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 01 Mar 2026 19:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772423822; x=1773028622;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JmWvfmtgAcDRz4bFImh8rJEfEmq6Cak2/bFtX09VN9Q=;
 b=GvozigjjDpLxTegjVDx+kCFvPiyxwk7pzw3WVbWN0oh1KAfY4P7CJR+P0dh+qi7RvC
 KMbZdgJsc5ruMj3F4jwCW4e3N9tK3662PHtSgwy+KasYhIlHk7jRvJi/+4sIdTgMAAAt
 IuMWvItbi7ezGal8dfIkKNvav67Rt9XKQkfGhbfYZbxJpYb2UEw6k/fdtASrP+R83F57
 KbghFOxMjsBoq0ebc4ZwyoM7Hz96MXPc4vuy4GRa4H5U6pqdIr+n8RSfXxXnCSL0Mk5x
 LB0CNWAqAsfBhdLNltQVWn5u9aXNw7+hPDlFVysYIRdRBBsvYmGNKUxo77lrJBvBDdIg
 vhbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUue3ZcEYVZ3OSdf3HMwbYGQsRhUnbsDpF1LS3OZiioN+MukQ5CLKS4+MaPQZIYp6dg85Z+3zTKkhvCsg0lKvM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTwUfRkB0nCFyHJzAcuoHjk9lG1Y1sgdj6aTEe82EsTrm4vPov
 /k0gDmD6UOBeHUHw2INJ/pnysZZMKyALFLWjeBLF30x2cwm+vGBuI8VLlNRkjRBzdIzyk25iinA
 s/1x6opc0botMuyVV8yyJOLB18QFBJeum1/O8aLzAprf47yFSdO/35QrX4vA=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:418e:b0:67a:61f:646b with SMTP id
 006d021491bc7-67a061f67bfmr3305124eaf.74.1772423821722; Sun, 01 Mar 2026
 19:57:01 -0800 (PST)
Date: Sun, 01 Mar 2026 19:57:01 -0800
In-Reply-To: <20260302034102.3145719-1-wangqing7171@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a50a8d.050a0220.3a55be.006f.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, jaegeuk@kernel.org, 
 jannh@google.com, liam.howlett@oracle.com, linkinjeon@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
 pfalcato@suse.de, sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, 
 vbabka@suse.cz, wangqing7171@gmail.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff88810005fa00 (size 512): comm
 "swapper/0", 
 pid 0, jiffies 4294937296 hex dump (first 32 bytes): 00 2e c5 05 81 88 ff
 ff 00 a2 96 0a 81 88 ff ff [...] 
 Content analysis details:   (3.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vwuPA-00043E-C6
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chao@kernel.org,m:jaegeuk@kernel.org,m:jannh@google.com,m:liam.howlett@oracle.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@suse.cz,m:wangqing7171@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,google.com,oracle.com,lists.sourceforge.net,vger.kernel.org,kvack.org,suse.de,samsung.com,googlegroups.com,suse.cz,gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BA19F1D2D37
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff88810005fa00 (size 512):
  comm "swapper/0", pid 0, jiffies 4294937296
  hex dump (first 32 bytes):
    00 2e c5 05 81 88 ff ff 00 a2 96 0a 81 88 ff ff  ................
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc ee49fed0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1e4/0x260 mm/slub.c:4602
    alloc_from_pcs mm/slub.c:4695 [inline]
    slab_alloc_node mm/slub.c:4829 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5353
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __irq_domain_alloc_fwnode+0x37/0x140 kernel/irq/irqdomain.c:95
    irq_domain_alloc_named_fwnode include/linux/irqdomain.h:271 [inline]
    arch_early_irq_init+0x1c/0x70 arch/x86/kernel/apic/vector.c:803
    start_kernel+0x931/0xb80 init/main.c:1114
    x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
    x86_64_start_kernel+0xce/0xd0 arch/x86/kernel/head64.c:291
    common_startup_64+0x13e/0x148

BUG: memory leak
unreferenced object 0xffff8881008f8c00 (size 512):
  comm "kthreadd", pid 2, jiffies 4294937339
  hex dump (first 32 bytes):
    00 d6 04 00 81 88 ff ff 00 92 96 0a 81 88 ff ff  ................
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc f2ef5290):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1e4/0x260 mm/slub.c:4602
    alloc_from_pcs mm/slub.c:4695 [inline]
    slab_alloc_node mm/slub.c:4829 [inline]
    __kmalloc_cache_node_noprof+0x3ef/0x4e0 mm/slub.c:5366
    kmalloc_node_noprof include/linux/slab.h:1077 [inline]
    __get_vm_area_node+0xc6/0x1d0 mm/vmalloc.c:3221
    __vmalloc_node_range_noprof+0x1d3/0xe50 mm/vmalloc.c:4024
    __vmalloc_node_noprof+0x71/0x90 mm/vmalloc.c:4124
    alloc_thread_stack_node kernel/fork.c:355 [inline]
    dup_task_struct kernel/fork.c:924 [inline]
    copy_process+0x3e5/0x28c0 kernel/fork.c:2050
    kernel_clone+0xac/0x6e0 kernel/fork.c:2654
    kernel_thread+0x80/0xb0 kernel/fork.c:2715
    create_kthread kernel/kthread.c:490 [inline]
    kthreadd+0x186/0x250 kernel/kthread.c:848
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888105c53200 (size 512):
  comm "kworker/1:0", pid 23, jiffies 4294937917
  hex dump (first 32 bytes):
    00 a2 96 0a 81 88 ff ff 00 d4 04 00 81 88 ff ff  ................
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc d24dd055):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe9/0x2c0 mm/slub.c:5700
    free_to_pcs mm/slub.c:5753 [inline]
    slab_free mm/slub.c:6154 [inline]
    kfree+0x352/0x390 mm/slub.c:6467
    vfree.part.0+0x1d5/0x4d0 mm/vmalloc.c:3485
    vfree mm/vmalloc.c:3456 [inline]
    delayed_vfree_work+0x5b/0x90 mm/vmalloc.c:3398
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:467
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888105c52e00 (size 512):
  comm "kworker/u8:5", pid 4440, jiffies 4294937918
  hex dump (first 32 bytes):
    c8 2c 04 00 81 88 ff ff 00 fa 05 00 81 88 ff ff  .,..............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc a68b63de):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe9/0x2c0 mm/slub.c:5700
    free_to_pcs mm/slub.c:5753 [inline]
    slab_free mm/slub.c:6154 [inline]
    kfree+0x352/0x390 mm/slub.c:6467
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810a96a200 (size 512):
  comm "udevadm", pid 5177, jiffies 4294938175
  hex dump (first 32 bytes):
    00 fa 05 00 81 88 ff ff 00 32 c5 05 81 88 ff ff  .........2......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 94107438):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1e4/0x260 mm/slub.c:4602
    alloc_from_pcs mm/slub.c:4695 [inline]
    slab_alloc_node mm/slub.c:4829 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5353
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    kernfs_get_open_node fs/kernfs/file.c:543 [inline]
    kernfs_fop_open+0x4f3/0x580 fs/kernfs/file.c:718
    do_dentry_open+0x202/0x8d0 fs/open.c:949
    vfs_open+0x3d/0x1b0 fs/open.c:1081
    do_open fs/namei.c:4671 [inline]
    path_openat+0x154d/0x1e20 fs/namei.c:4830
    do_file_open+0x121/0x200 fs/namei.c:4859
    do_sys_openat2+0xa5/0x140 fs/open.c:1366
    do_sys_open fs/open.c:1372 [inline]
    __do_sys_openat fs/open.c:1388 [inline]
    __se_sys_openat fs/open.c:1383 [inline]
    __x64_sys_openat+0x82/0xf0 fs/open.c:1383
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109d58400 (size 512):
  comm "udevd", pid 5176, jiffies 4294938222
  hex dump (first 32 bytes):
    00 12 47 2a 81 88 ff ff 00 ee 46 2a 81 88 ff ff  ..G*......F*....
    00 12 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc af8b5cec):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4520 [inline]
    slab_alloc_node mm/slub.c:4844 [inline]
    __do_kmalloc_node mm/slub.c:5237 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __kfree_rcu_sheaf+0x164/0x240 mm/slub.c:5887
    kfree_rcu_sheaf mm/slab_common.c:1608 [inline]
    kvfree_call_rcu+0x1f6/0x3c0 mm/slab_common.c:1957
    kernfs_unlink_open_file+0x194/0x1b0 fs/kernfs/file.c:604
    kernfs_fop_release+0x55/0x110 fs/kernfs/file.c:783
    __fput+0x1b5/0x4f0 fs/file_table.c:469
    fput_close_sync+0x67/0x120 fs/file_table.c:574
    __do_sys_close fs/open.c:1509 [inline]
    __se_sys_close fs/open.c:1494 [inline]
    __x64_sys_close+0x4a/0xc0 fs/open.c:1494
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         11439c46 Linux 7.0-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1277a202580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13801006580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
