Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCIJFLQivWmr6wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 11:34:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 780362D8BCE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 11:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZBOW9qkPDebChg5sT1a17rl382beE28XCvnAK2+eJeg=; b=YwWq0YA8TCuU4VaToigYq48QgF
	yxPaDFUKOB5pNKQTogcabsIgAyt29Ex922QZAq0M7qAmoDVxDT3lE4wsulgXP0nTUkdSFaKhoYfpA
	VNaOenk/imZr9AVLZV9fq4m816WnqLjvoqyGPao3dI1Bsvv68glQ4C/4AdaXMnYCZYds=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3XBH-0006kR-N0;
	Fri, 20 Mar 2026 10:34:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3miK9aQkbACkXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1w3XBF-0006kI-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 10:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PyurhFL0srbaHFfNujAbyanPsO6WBW5rLYYsYSOSV7A=; b=HI02O/i2+D8+hYrjN4edfR0Tm5
 XuFhb9i/CuKLOgxznRS/VX6QQnWeyiKQpX+lrZXUOu/z8h/CA4dddgI4J8eyYfDfRWbLMCrj8UaNr
 qeTkz99Qe36hUNIqTe36jHk44tSlhyiLiaPZx0R9wwSTJBJBcd4ajwTel/++F41UNzgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PyurhFL0srbaHFfNujAbyanPsO6WBW5rLYYsYSOSV7A=; b=I
 pMNT6Zgmv2BPbWuzptMCoXoIrG/rxocw/dSOF/6n7zl3G8J4/jeF4zPaJ/efdDanDmNu1ltM9jLTT
 QX3hyh1kO3iAsG7fR7B67tbu8ON0ZqArplCHjOkPK50N/DqQHkwqvgRByOu/eOo6HJ2+z8ah/DImd
 D69pQoCVXAuH7LLc=;
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w3XBE-0006Ke-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 10:34:13 +0000
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7d7c848c866so1737966a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Mar 2026 03:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774002842; x=1774607642;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PyurhFL0srbaHFfNujAbyanPsO6WBW5rLYYsYSOSV7A=;
 b=jfxpXMYnEqyGqdQLAmlHbMnE7Yg2MvZ3RUabiXjIsX0UW6ITUr1DgM1dUpy31jPEYC
 X639GQXAMSl+H4oECXhhtUCR+WD9RhRvtKV470YfIp5OwOApr3LiOFAvCOimhmOZjswT
 i9fDj5Z/pXcSz0GVZM2UIwtz+x32jYiMVC9tpXiZ1fhr6hcPTtm3OAUsHfLIy/U+oDzY
 31Na6Fmohm+c184h4W4gQhk/nYAZ46lrQfHzS4ikls3uIG0ZiyRMP2zh6fWO5bZtEH5K
 rOzgSPO/yNyvofHBI+GXlAh9MkG2veT7UtTErXFmqsuxUS3ncLi+j/14lOXgFb6xZExS
 +KAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6fqOHkhtnVABPgcEwneamea53iRPyPKEFPlthxwH6IVZEIqTwBwbBKXu5mq2Wy8+p2C79PGzyrVItqAe17I/m@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyl2DOCFgKDFqGncpIxApCbsLkWe8Mfpb2aCl+hTvCartTejYyR
 AJngFtDlZpsX7XiUvQXplmc4vR/BvQLED4e82PrAxJf5QPfbnunh5Jcm6zcm6hYKmIzsFY3Y+GH
 Bsf6yTbHmYwQ30U8p3SoV10t6K5ok6/bKgarFzI3waDTsOZ7K56cquhWvJ1I=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:818b:b0:67b:e3cf:a416 with SMTP id
 006d021491bc7-67c22ec467emr1960545eaf.25.1774002842204; Fri, 20 Mar 2026
 03:34:02 -0700 (PDT)
Date: Fri, 20 Mar 2026 03:34:02 -0700
In-Reply-To: <abyPiI_4bCRGQLBV@hyeyoo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69bd229a.050a0220.3bf4de.001c.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, harry.yoo@oracle.com, 
 jaegeuk@kernel.org, jannh@google.com, liam.howlett@oracle.com, 
 linkinjeon@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, pfalcato@suse.de, 
 sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff88810005f800 (size 512): comm
 "swapper/0", 
 pid 0, jiffies 4294937296 hex dump (first 32 bytes): 60 bd 2a 2f 81 88 ff
 ff 30 ba ad 81 ff ff ff ff `.*/....0.... [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w3XBE-0006Ke-RQ
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chao@kernel.org,m:harry.yoo@oracle.com,m:jaegeuk@kernel.org,m:jannh@google.com,m:liam.howlett@oracle.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@suse.cz,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 780362D8BCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff88810005f800 (size 512):
  comm "swapper/0", pid 0, jiffies 4294937296
  hex dump (first 32 bytes):
    60 bd 2a 2f 81 88 ff ff 30 ba ad 81 ff ff ff ff  `.*/....0.......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 81834c79):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    alloc_full_sheaf mm/slub.c:2829 [inline]
    __pcs_replace_empty_main+0x1e0/0x2f0 mm/slub.c:4626
    alloc_from_pcs mm/slub.c:4717 [inline]
    slab_alloc_node mm/slub.c:4851 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5375
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
unreferenced object 0xffff8881008f6c00 (size 512):
  comm "kthreadd", pid 2, jiffies 4294937342
  hex dump (first 32 bytes):
    d0 16 c9 29 81 88 ff ff 30 ba ad 81 ff ff ff ff  ...)....0.......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 38b48d73):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    alloc_full_sheaf mm/slub.c:2829 [inline]
    __pcs_replace_empty_main+0x1e0/0x2f0 mm/slub.c:4626
    alloc_from_pcs mm/slub.c:4717 [inline]
    slab_alloc_node mm/slub.c:4851 [inline]
    __kmalloc_cache_node_noprof+0x3ef/0x4e0 mm/slub.c:5388
    kmalloc_node_noprof include/linux/slab.h:1077 [inline]
    __get_vm_area_node+0xc6/0x1d0 mm/vmalloc.c:3221
    __vmalloc_node_range_noprof+0x1d3/0xe50 mm/vmalloc.c:4024
    __vmalloc_node_noprof+0x71/0x90 mm/vmalloc.c:4124
    alloc_thread_stack_node kernel/fork.c:355 [inline]
    dup_task_struct kernel/fork.c:924 [inline]
    copy_process+0x3e5/0x28c0 kernel/fork.c:2050
    kernel_clone+0xac/0x6e0 kernel/fork.c:2653
    kernel_thread+0x80/0xb0 kernel/fork.c:2714
    create_kthread kernel/kthread.c:459 [inline]
    kthreadd+0x186/0x250 kernel/kthread.c:817
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888102011400 (size 512):
  comm "kworker/u8:1", pid 274, jiffies 4294937433
  hex dump (first 32 bytes):
    28 f6 7b 31 81 88 ff ff 30 ba ad 81 ff ff ff ff  (.{1....0.......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc c5ce2dfb):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5722
    free_to_pcs mm/slub.c:5775 [inline]
    slab_free mm/slub.c:6170 [inline]
    kfree+0x352/0x390 mm/slub.c:6483
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888102010600 (size 512):
  comm "kworker/1:1", pid 41, jiffies 4294937437
  hex dump (first 32 bytes):
    88 c3 c4 29 81 88 ff ff 30 ba ad 81 ff ff ff ff  ...)....0.......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 5d48f1c0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5722
    free_to_pcs mm/slub.c:5775 [inline]
    slab_free mm/slub.c:6170 [inline]
    kfree+0x352/0x390 mm/slub.c:6483
    vfree.part.0+0x1d5/0x4d0 mm/vmalloc.c:3485
    vfree mm/vmalloc.c:3456 [inline]
    delayed_vfree_work+0x5b/0x90 mm/vmalloc.c:3398
    process_one_work+0x277/0x5f0 kernel/workqueue.c:3276
    process_scheduled_works kernel/workqueue.c:3359 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3440
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888102010400 (size 512):
  comm "kworker/u8:1", pid 443, jiffies 4294937439
  hex dump (first 32 bytes):
    e8 50 dd 31 81 88 ff ff 30 ba ad 81 ff ff ff ff  .P.1....0.......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 11032afc):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5722
    free_to_pcs mm/slub.c:5775 [inline]
    slab_free mm/slub.c:6170 [inline]
    kfree+0x352/0x390 mm/slub.c:6483
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff8881095d5a00 (size 256):
  comm "swapper/0", pid 1, jiffies 4294937857
  hex dump (first 32 bytes):
    00 d4 9c 1d 81 88 ff ff 88 fc 04 00 81 88 ff ff  ................
    00 1a 04 00 81 88 ff ff 1c 00 00 00 00 00 00 00  ................
  backtrace (crc deebd371):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2764
    alloc_empty_sheaf mm/slub.c:2779 [inline]
    alloc_full_sheaf mm/slub.c:2829 [inline]
    __pcs_replace_empty_main+0x1e0/0x2f0 mm/slub.c:4626
    alloc_from_pcs mm/slub.c:4717 [inline]
    slab_alloc_node mm/slub.c:4851 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5375
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    init_srcu_struct_fields+0x29d/0x320 kernel/rcu/srcutree.c:241
    rtnl_link_register+0x81/0x1c0 net/core/rtnetlink.c:615
    ipgre_init+0x10d/0x1a0 net/ipv4/ip_gre.c:1828
    do_one_initcall+0x79/0x4c0 init/main.c:1382
    do_initcall_level init/main.c:1444 [inline]
    do_initcalls init/main.c:1460 [inline]
    do_basic_setup init/main.c:1479 [inline]
    kernel_init_freeable+0x2a4/0x340 init/main.c:1692
    kernel_init+0x1b/0x1d0 init/main.c:1582
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         0e4f8f1a Merge tag 'parisc-for-7.0-rc5' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b18cba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12608cba580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
