Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGkKFv779mnBawIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:40:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A58864B4CD0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nRe8rO+lNDl5chN6GehgVn67rLe4mKV6xhVxDj0fLLM=; b=aHQBMKQb/pafqvOjs4MMU9xnmo
	TLHbctexdVZRUbkqH5UmRbKgqeE3QvLTSWlPa6tMJM8PkL4MecAbOOee/ym0EW3UyJeWtOvT0yIGd
	Lw3kppXru44eYWVOKMlXX/Ho6I+/wbXlD0jjbBuQpawFk5xyF7EvWugcu5XZNSgzVfHg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJRRI-0008KD-Bu;
	Sun, 03 May 2026 07:40:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3bfb2aQkbAIw8EF0q11u7q55yt.w44w1uA8u7s439u39.s42@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wJRR3-0008Iu-DQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wBJ+nqiJeCAh7ANanxHfUmzC7i4o2jYq4KYC2pamiXg=; b=XZaZsE6uh+TobU7Io6odO35kYQ
 Dfw8n8lcUIdiMTv5yVXIY9t65nKcvzNwvyvUhqgr7qqsJfiV9fivYJeuBfibBlGL2u6JQQFGbTmaL
 qICt0akN4e0j/OJq2zEjOE1LPRGzNJZX8oPwHo9fWS6Di4bEIYUnipuYtM1u9eEe/qgM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wBJ+nqiJeCAh7ANanxHfUmzC7i4o2jYq4KYC2pamiXg=; b=A
 P1HCYWiZ5TaGGrcg3b2alQduJN/WvCEOUklNKCL9YYtIFSa0JOcXHSnO6EkGYiT6J5XGAveeCVQyb
 xNNECiP7a1DaiFBT5/Zsnen+mbR7hFRoupPk+aZ7z9GaVMfF3jfcr0lgV7ZI4Oi8+DlXkFKo66SXo
 3Rotb64u3mEKYGKk=;
Received: from mail-ot1-f72.google.com ([209.85.210.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJRR3-0003G1-6B for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:40:18 +0000
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7dbe76e3abcso9479503a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 May 2026 00:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777794011; x=1778398811;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wBJ+nqiJeCAh7ANanxHfUmzC7i4o2jYq4KYC2pamiXg=;
 b=JF9cYLlfPWZeGsvKABEjNoCb3yTbNF583B6Xv2xcj1rgwW2xbY8EOa2t0vzJmGcQ24
 a2g+hxSSt1Y5s1tceSL6+5cnXShApuX5sy4JZLwyqh5m2BJfU+ZFkzVP38UTc57M9hM1
 EWMK3fyFAaEiNEs8mIZUJ6vyCHzJzM39h0iE6beEfZHpKP1wbbo/Ubz2C7WggMn4Be5W
 rdvpLHPhy7BsfdCFf+87/qTvFPoYTeSDa0ctEcxmZBhzyza7cWuLbesFEaB7UDPss2AA
 GQtTon2PtQWcd7NvClkgseSMPD/bsRCmmb69HxvSZxxIM/zZ+kXj9hZXrXhsLTqMPqKw
 Wyzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8V122SLh2MydOnS4t/7qxLZ60TIM2w9Khx0TflNDx3vI6v9Vt9Y+DL/7MAdxd5oOxAz0nALq9DdaZnyga5E1MQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YybfJy7rl+rJUbouJQc0keLRpZtSR6QZbX+RgqPYKMBRvQyCNvq
 aeJV6b0Ld6CMOJ4ChSQ4g/2hbqrzi4t1+R05adXOuDM3VhJsKEyTqXKaW1JKsdeoTogOJdJT9vR
 CIoEDTKPlErt5JPx0ffEulUvmdLvJA5qd/taR2IWE/ZeJQTu3/jyLQ6NIMz0=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:210e:b0:696:2674:8a18 with SMTP id
 006d021491bc7-69697c50cbcmr2729750eaf.35.1777792621895; Sun, 03 May 2026
 00:17:01 -0700 (PDT)
Date: Sun, 03 May 2026 00:17:01 -0700
In-Reply-To: <4b30ba28-6f75-43a1-a108-5c0288ab021a@dev.snart.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f6f66d.050a0220.312cd3.002c.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: dxdt@dev.snart.me, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff88810005f600 (size 512): comm
 "swapper/0", 
 pid 0, jiffies 4294937296 hex dump (first 32 bytes): e0 e2 ee 2c 81 88 ff
 ff a0 13 ad 81 ff ff ff ff ...,......... [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.72 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wJRR3-0003G1-6B
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
X-Rspamd-Queue-Id: A58864B4CD0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
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
    e0 e2 ee 2c 81 88 ff ff a0 13 ad 81 ff ff ff ff  ...,............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 2486057c):
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
    __kmalloc_cache_noprof+0x3a6/0x480 mm/slub.c:5410
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
unreferenced object 0xffff888101d04e00 (size 512):
  comm "kworker/u8:5", pid 311, jiffies 4294937428
  hex dump (first 32 bytes):
    b8 1c b8 28 81 88 ff ff a0 13 ad 81 ff ff ff ff  ...(............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 1d48d83d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5757
    free_to_pcs mm/slub.c:5810 [inline]
    slab_free mm/slub.c:6249 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6561
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888101d18800 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937813
  hex dump (first 32 bytes):
    00 c8 ec 0b 81 88 ff ff 00 18 d3 0b 81 88 ff ff  ................
    00 12 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 307f46be):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5757
    free_to_pcs mm/slub.c:5810 [inline]
    slab_free mm/slub.c:6249 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6561
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
unreferenced object 0xffff888101d2be00 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937856
  hex dump (first 32 bytes):
    c8 2c 04 00 81 88 ff ff 00 90 b7 2a 81 88 ff ff  .,.........*....
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 9ff75ca2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5757
    free_to_pcs mm/slub.c:5810 [inline]
    slab_free mm/slub.c:6249 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6561
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
unreferenced object 0xffff888101d2b000 (size 512):
  comm "kworker/u8:9", pid 4643, jiffies 4294937873
  hex dump (first 32 bytes):
    00 72 5a 03 81 88 ff ff c8 2c 04 00 81 88 ff ff  .rZ......,......
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc bcccad5b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2768
    alloc_empty_sheaf mm/slub.c:2783 [inline]
    __pcs_replace_full_main+0xdf/0x300 mm/slub.c:5757
    free_to_pcs mm/slub.c:5810 [inline]
    slab_free mm/slub.c:6249 [inline]
    kfree+0x361/0x3a0 mm/slub.c:6561
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff8881035a7400 (size 512):
  comm "udevadm", pid 4981, jiffies 4294938333
  hex dump (first 32 bytes):
    00 88 b7 2a 81 88 ff ff 00 4e d0 01 81 88 ff ff  ...*.....N......
    00 12 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 82d289ee):
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
    __kmalloc_cache_noprof+0x3a6/0x480 mm/slub.c:5410
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    kernfs_get_open_node fs/kernfs/file.c:543 [inline]
    kernfs_fop_open+0x4f4/0x580 fs/kernfs/file.c:718
    do_dentry_open+0x1fc/0x8c0 fs/open.c:947
    vfs_open+0x3d/0x1b0 fs/open.c:1079
    do_open fs/namei.c:4699 [inline]
    path_openat+0x154d/0x1e20 fs/namei.c:4858
    do_file_open+0x121/0x200 fs/namei.c:4887
    do_sys_openat2+0xa5/0x140 fs/open.c:1364
    do_sys_open fs/open.c:1370 [inline]
    __do_sys_openat fs/open.c:1386 [inline]
    __se_sys_openat fs/open.c:1381 [inline]
    __x64_sys_openat+0x82/0xf0 fs/open.c:1381
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         66edb901 Merge tag 'v7.1-p3' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13db0ad2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=153b7ece580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
