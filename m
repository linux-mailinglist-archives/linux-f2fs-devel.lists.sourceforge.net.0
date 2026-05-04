Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDL/MLgL+Wks4wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 04 May 2026 23:12:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14A4C3E86
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 04 May 2026 23:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0ZJexf8Q2a5mgp6geuyCexC7QfnZWK/v+vlrh3WUW+Q=; b=JffDRHWkL++Z4KslN1thClvHZi
	krlEqQQMaUuVOPeRa7dlpsoDuGFaSJ9XkSomodQwj8q4CDCVH0MHoJvWp1tPtK13I4NcUzk26g3hq
	7GSmpIZr3HtqvpKxPLDV7C86HEkSKsK0HeK8v/GtstraKS3s+LUSoNh7aQw7EnjuExl0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wK0aO-0000j2-JY;
	Mon, 04 May 2026 21:12:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ogv5aQkbAPMntufVggZmVkkdY.bjjbgZpnZmXjioZio.Xjh@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wK0aM-0000iv-HE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 May 2026 21:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uSQFQVdI6dfDQGPwxlzx44ntf4feAWwEORf5sBnWwwc=; b=ca8WrzVBT0CmPwSkTGPWojB5He
 forKralqgOL+Jkj2fQKNI5uO+PAShtQef3aiT2w3az1EvW5KK1rJn8pbBHwNa0A7dDtKchtSSoNtI
 g6otlYFw0IylRifX4txSmdOECend3Ub5hBKOkIcg2DEq+oH82N/tzRn58Kc2peQM6B1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uSQFQVdI6dfDQGPwxlzx44ntf4feAWwEORf5sBnWwwc=; b=D
 qGziSOc2b8Nini8oEbu4VBlc6Hu5b6QbePoOw3VAzP7CCZFw/EZwnC2le8iFobVbvrG9LhGJBLYFQ
 JzYaQd6ggxQppPQKFrjLOlXgqMg8/I63p55hFMm2Mb5i8FXePQBP9Qfx6jW8Lu424BdQOeNFp8hP0
 J853FnkzgNTeIwiI=;
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wK0aL-0001ye-5w for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 May 2026 21:12:14 +0000
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7dcde7bf859so10202170a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 May 2026 14:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777929122; x=1778533922;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSQFQVdI6dfDQGPwxlzx44ntf4feAWwEORf5sBnWwwc=;
 b=ckhvRjRxsIUZ4d1Fn2xPJI3hu3x1UDZwXSFaf54e31J1sx685UYqEBXPMrjrrgRWaa
 8D/7XXyejAMV1mRIn5PxZlbZCTQG4ZCbT3x5+FtOoe6yCx6FjsdHrP29k7zyqH4ULgmH
 J3Br25ZN07z5wYCa4RWkOFiOf03hHbWFCrLoNNkrfev6KjVawX1W97Yuhzbzgwq0tRne
 sGaChvcSUNtM25TBflr7VpP+wLjvXrTmnlLAm7sHS+Qim3YZHkH9L7X0wuyKp2zGcrTz
 dl6Gyfh/hizCRB2CyL63wvLymt8GrVqXUD5WDuIpGnzW3DkCClOr1NbomEmhsG9Ifn+m
 1zsg==
X-Forwarded-Encrypted: i=1;
 AFNElJ87r2k5XosWJE2kc6EUtQ+LQs6xbqtFWDh7IKi3eBqZCKhOoZ0ZXsS49CDRKXK5xEqy3O0pbItz9EUExHuwFxdI@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwdsBTlZLJedPi4IziuqeYiNX2PYeBF4kR1N4lTcgb8pSnE4xrp
 El3kjW5Fmq6pHwMHwwV43udp5EOH2of1uvA5EP9lUSrWT19wY3nproEYuGthRqAOe7brhTzkN82
 0CDwOO3inOrO6MOIwpUMbs+dVfJZniYV3O17LfQOYeV0M+zA6d1TTz1wUsEE=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81cb:b0:695:b571:e574 with SMTP id
 006d021491bc7-69697de88c3mr6094119eaf.59.1777929122596; Mon, 04 May 2026
 14:12:02 -0700 (PDT)
Date: Mon, 04 May 2026 14:12:02 -0700
In-Reply-To: <13bb1c13-98b6-4a4a-b03d-ba0f88680f1e@dev.snart.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f90ba2.170a0220.bb392.0007.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: dxdt@dev.snart.me, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff88810005f600 (size 512): comm
 "swapper/0", 
 pid 0, jiffies 4294937296 hex dump (first 32 bytes): 40 a0 ce 2f 81 88 ff
 ff e0 13 ad 81 ff ff ff ff @../......... [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: syzkaller.appspot.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.70 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wK0aL-0001ye-5w
Subject: Re: [f2fs-dev] [syzbot] [mm?] [exfat?] [f2fs?] memory leak in
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
X-Rspamd-Queue-Id: 0F14A4C3E86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dxdt@dev.snart.me,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff88810005f600 (size 512):
  comm "swapper/0", pid 0, jiffies 4294937296
  hex dump (first 32 bytes):
    40 a0 ce 2f 81 88 ff ff e0 13 ad 81 ff ff ff ff  @../............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 6fa78c59):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_empty_main+0x22a/0x2a0 mm/slub.c:4646
    alloc_from_pcs mm/slub.c:4749 [inline]
    slab_alloc_node mm/slub.c:4883 [inline]
    __kmalloc_cache_noprof+0x3a6/0x480 mm/slub.c:5414
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __irq_domain_alloc_fwnode+0x37/0x140 kernel/irq/irqdomain.c:95
    irq_domain_alloc_named_fwnode include/linux/irqdomain.h:271 [inline]
    arch_early_irq_init+0x1c/0x70 arch/x86/kernel/apic/vector.c:803
    start_kernel+0x931/0xb80 init/main.c:1123
    x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
    x86_64_start_kernel+0xce/0xd0 arch/x86/kernel/head64.c:291
    common_startup_64+0x13e/0x148

BUG: memory leak
unreferenced object 0xffff888100902c00 (size 512):
  comm "kthreadd", pid 2, jiffies 4294937340
  hex dump (first 32 bytes):
    70 09 2a 29 81 88 ff ff e0 13 ad 81 ff ff ff ff  p.*)............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 638a9d9a):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_empty_main+0x22a/0x2a0 mm/slub.c:4646
    alloc_from_pcs mm/slub.c:4749 [inline]
    slab_alloc_node mm/slub.c:4883 [inline]
    __kmalloc_cache_node_noprof+0x3e9/0x4d0 mm/slub.c:5427
    kmalloc_node_noprof include/linux/slab.h:1077 [inline]
    __get_vm_area_node+0xc6/0x1d0 mm/vmalloc.c:3215
    __vmalloc_node_range_noprof+0x1bc/0xdf0 mm/vmalloc.c:4024
    __vmalloc_node_noprof+0x71/0x90 mm/vmalloc.c:4124
    alloc_thread_stack_node kernel/fork.c:357 [inline]
    dup_task_struct kernel/fork.c:926 [inline]
    copy_process+0x51f/0x2c90 kernel/fork.c:2090
    kernel_clone+0xde/0x700 kernel/fork.c:2721
    kernel_thread+0x80/0xb0 kernel/fork.c:2782
    create_kthread kernel/kthread.c:459 [inline]
    kthreadd+0x186/0x250 kernel/kthread.c:817
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888100f8fa00 (size 512):
  comm "kworker/1:1", pid 41, jiffies 4294937424
  hex dump (first 32 bytes):
    38 42 0d 30 81 88 ff ff e0 13 ad 81 ff ff ff ff  8B.0............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 185e046f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5761
    free_to_pcs mm/slub.c:5814 [inline]
    slab_free mm/slub.c:6253 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6565
    vfree mm/vmalloc.c:3476 [inline]
    vfree+0x14d/0x3d0 mm/vmalloc.c:3436
    delayed_vfree_work+0x29/0x40 mm/vmalloc.c:3392
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810255bc00 (size 512):
  comm "kworker/u8:2", pid 498, jiffies 4294937434
  hex dump (first 32 bytes):
    80 35 67 2e 81 88 ff ff e0 13 ad 81 ff ff ff ff  .5g.............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 804b7261):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5761
    free_to_pcs mm/slub.c:5814 [inline]
    slab_free mm/slub.c:6253 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6565
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810256da00 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937506
  hex dump (first 32 bytes):
    40 40 38 2d 81 88 ff ff e0 13 ad 81 ff ff ff ff  @@8-............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc e83216dd):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5761
    free_to_pcs mm/slub.c:5814 [inline]
    slab_free mm/slub.c:6253 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6565
    blk_free_flush_queue+0x28/0x40 block/blk-flush.c:514
    srcu_invoke_callbacks+0x11a/0x1c0 kernel/rcu/srcutree.c:1917
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff8881069d1400 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937917
  hex dump (first 32 bytes):
    78 b7 d0 2f 81 88 ff ff e0 13 ad 81 ff ff ff ff  x../............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 927c2de1):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5761
    free_to_pcs mm/slub.c:5814 [inline]
    slab_free mm/slub.c:6253 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6565
    vfree mm/vmalloc.c:3476 [inline]
    vfree+0x14d/0x3d0 mm/vmalloc.c:3436
    delayed_vfree_work+0x29/0x40 mm/vmalloc.c:3392
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         c7e4e4d5 Merge tag 'for-linus-7.1-2' of https://github..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16963a36580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1650eb26580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
