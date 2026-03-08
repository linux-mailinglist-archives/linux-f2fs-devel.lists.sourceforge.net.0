Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ2wFDNsrWl82wEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Mar 2026 13:31:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5D230338
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Mar 2026 13:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rIQy2XyNtSTwhVfZMs21+K0tZRJrKOZCTsbP+Mbphts=; b=Rf5srzeKRnTfzEC+J57M/9+PV0
	6aiHWrF6kUHyIYptWDSUsCyu2ZBqIceqqARY44xBpsrIxjVVViin3yFD78TxS7mNMQRXKtBcsqenM
	4X6eTslLEwGa9mGHCXnAIsL2U58ff17nJZ7HwGu7MGx7ntXRRWlREDGeSc6IB6ZJIIBw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzDIA-0006zG-8P;
	Sun, 08 Mar 2026 12:31:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3CmytaQkbAOsflmXNYYReNccVQ.TbbTYRhfRePbagRag.PbZ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vzDHs-0006yy-El for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Mar 2026 12:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eExMXBnXM4peFMhhjLeKZOOSaw7IwpgqnEj+UrfzQhQ=; b=PLYpAQMwhf2AD1YEZMVy6rcnHL
 6gam6nvFWNJqs0Cdb3+7AjBqdrsbq0Dx9v6e8kPWGzqdRGLB2b/kw+30BYx0UmF3BpM+qOFs2U+QC
 QZRLY2UyrQt3Ly4PCLxf3Xsc3XQ81BaLYQg1onlAX5kdrE5FVXi7pKQPLjbI3HHlWGn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eExMXBnXM4peFMhhjLeKZOOSaw7IwpgqnEj+UrfzQhQ=; b=S
 XQ86pDCgLgpBONvTb6/25304Cn6pqpA/B6YANdbQa6YwY4y9ZuUSJXAaaQKAIelvb7DgLt/d6IOGu
 lS8heb8tEZHMLFScEnQ3wh2QR8By8uf7gqCsLRyYM+NNXJZz0MlUb3nzcAODmSTko00DBKD9awHQi
 yfPNhSkNO9RxUSaE=;
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzDHr-00079A-NM for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Mar 2026 12:31:12 +0000
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-67bb368c757so1039763eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Mar 2026 05:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772973066; x=1773577866;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eExMXBnXM4peFMhhjLeKZOOSaw7IwpgqnEj+UrfzQhQ=;
 b=fykueqkZ72/iAlNtPyOz4lJo8Y1BuWAErFrY7ko5XXCKgkpAWu7BAHDwlD7Rc0Ul/x
 px/Z11v5Bvd5s6GUiYYMnQGVEc8oneHNlFT4Vug0xy1LUpLdF76N6Oa/XrIjEtWUFc5o
 PHDHkCprDZG1VqmTG7TADM/dOLukgamD9T67JjWirQOxw8M63pcq9LsInYvrt1aj+k4R
 UnDTeieuzjFCSCalYkTMXW9i+WIS/VkmZpzPka1gGSuG8dFbebYSciwutDC+PnEoEOtu
 v9gWwlyzPbAOW9l1TmIjCDdTz8rFuzmyOZhDlrMVtaf92A/nmz8R+K6rqAOHUHzxntIl
 VWOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMeZLY2TUxfihGYwdVPqeveMcnK4oY86z4TBqy1VKalKwEs6+Gm310+yKDUgJF2HX5LglhofJJnzNGYEgmYdSs@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxF5G/W+wz+56KwuZ7HEpRmm9KKzIZkzjbZrJp5alqJGgoOimhU
 KPrLeOFOpPU+EkOnQDiWuqeXXokMTbU4ZxTMBG81NjBdfJUQK3lAbxmR6vCth9zO0cZXISSfFKL
 QhrA8ur+1WdQ8r1IR1QWVthfJ1pHsfCTeuzLixi5z0UxBaNS7LUn9L+8RcXc=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b05:b0:67a:4fe9:a4ba with SMTP id
 006d021491bc7-67b9bd49644mr4828247eaf.63.1772973066145; Sun, 08 Mar 2026
 05:31:06 -0700 (PDT)
Date: Sun, 08 Mar 2026 05:31:06 -0700
In-Reply-To: <aa1XX2ZXo-hc6LHG@arm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ad6c0a.a00a0220.b130.0000.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, catalin.marinas@arm.com, chao@kernel.org, 
 hao.li@linux.dev, harry.yoo@oracle.com, jaegeuk@kernel.org, jannh@google.com, 
 liam.howlett@oracle.com, linkinjeon@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
 pfalcato@suse.de, sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, 
 vbabka@kernel.org, vbabka@suse.cz, wangqing7171@gmail.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_full_main BUG:
 memory leak unreferenced object 0xffff888101d79200 (size 512): comm
 "kworker/u8:5", 
 pid 182, jiffies 4294937433 hex dump (first 32 bytes): e0 22 eb 30 81 88
 ff ff b0 b7 ad 81 ff ff ff ff .".0.... [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzDHr-00079A-NM
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
X-Rspamd-Queue-Id: 7DB5D230338
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:hao.li@linux.dev,m:harry.yoo@oracle.com,m:jaegeuk@kernel.org,m:jannh@google.com,m:liam.howlett@oracle.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@kernel.org,m:vbabka@suse.cz,m:wangqing7171@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[linux-foundation.org,arm.com,kernel.org,linux.dev,oracle.com,google.com,lists.sourceforge.net,vger.kernel.org,kvack.org,suse.de,samsung.com,googlegroups.com,suse.cz,gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_full_main

BUG: memory leak
unreferenced object 0xffff888101d79200 (size 512):
  comm "kworker/u8:5", pid 182, jiffies 4294937433
  hex dump (first 32 bytes):
    e0 22 eb 30 81 88 ff ff b0 b7 ad 81 ff ff ff ff  .".0............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 3ee28017):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5725
    free_to_pcs mm/slub.c:5778 [inline]
    slab_free mm/slub.c:6173 [inline]
    kfree+0x352/0x390 mm/slub.c:6486
    call_usermodehelper_freeinfo kernel/umh.c:43 [inline]
    umh_complete kernel/umh.c:57 [inline]
    call_usermodehelper_exec_async+0x1c7/0x1f0 kernel/umh.c:119
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888101fa6c00 (size 512):
  comm "kworker/1:1", pid 41, jiffies 4294937441
  hex dump (first 32 bytes):
    b0 1e fc 11 81 88 ff ff b0 b7 ad 81 ff ff ff ff  ................
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc a295f059):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5725
    free_to_pcs mm/slub.c:5778 [inline]
    slab_free mm/slub.c:6173 [inline]
    kfree+0x352/0x390 mm/slub.c:6486
    vfree.part.0+0x1d5/0x4d0 mm/vmalloc.c:3485
    vfree mm/vmalloc.c:3456 [inline]
    delayed_vfree_work+0x5b/0x90 mm/vmalloc.c:3398
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888109d31a00 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937949
  hex dump (first 32 bytes):
    c0 fa 74 29 81 88 ff ff b0 b7 ad 81 ff ff ff ff  ..t)............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc e073aa0b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5725
    free_to_pcs mm/slub.c:5778 [inline]
    slab_free mm/slub.c:6173 [inline]
    kfree+0x352/0x390 mm/slub.c:6486
    vfree.part.0+0x1d5/0x4d0 mm/vmalloc.c:3485
    vfree mm/vmalloc.c:3456 [inline]
    delayed_vfree_work+0x5b/0x90 mm/vmalloc.c:3398
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888109d3d800 (size 512):
  comm "udevadm", pid 5179, jiffies 4294938390
  hex dump (first 32 bytes):
    88 43 58 27 81 88 ff ff b0 b7 ad 81 ff ff ff ff  .CX'............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 37e3920):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1d2/0x260 mm/slub.c:4629
    alloc_from_pcs mm/slub.c:4720 [inline]
    slab_alloc_node mm/slub.c:4854 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5378
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
unreferenced object 0xffff88810b5a5000 (size 512):
  comm "udevd", pid 5178, jiffies 4294938454
  hex dump (first 32 bytes):
    80 c5 8e 2b 81 88 ff ff b0 b7 ad 81 ff ff ff ff  ...+............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc bce89c59):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1d2/0x260 mm/slub.c:4629
    alloc_from_pcs mm/slub.c:4720 [inline]
    slab_alloc_node mm/slub.c:4854 [inline]
    __kmalloc_cache_noprof+0x3ac/0x480 mm/slub.c:5378
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
unreferenced object 0xffff888109d3ce00 (size 512):
  comm "udevd", pid 5189, jiffies 4294938454
  hex dump (first 32 bytes):
    b0 4e 89 2b 81 88 ff ff b0 b7 ad 81 ff ff ff ff  .N.+............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc e7e352bb):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4547 [inline]
    slab_alloc_node mm/slub.c:4869 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1d2/0x260 mm/slub.c:4629
    alloc_from_pcs mm/slub.c:4720 [inline]
    slab_alloc_node mm/slub.c:4854 [inline]
    __do_kmalloc_node mm/slub.c:5262 [inline]
    __kmalloc_noprof+0x4c5/0x560 mm/slub.c:5275
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    tomoyo_encode2+0xd0/0x1e0 security/tomoyo/realpath.c:45
    tomoyo_encode+0x29/0x50 security/tomoyo/realpath.c:80
    tomoyo_realpath_from_path+0xc4/0x2c0 security/tomoyo/realpath.c:283
    tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
    tomoyo_path_perm+0x12c/0x290 security/tomoyo/file.c:827
    security_inode_getattr+0xaa/0x200 security/security.c:1869
    vfs_getattr fs/stat.c:259 [inline]
    vfs_fstat+0x48/0xe0 fs/stat.c:281
    __do_sys_newfstat+0x42/0xa0 fs/stat.c:551
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         c23719ab Merge tag 'x86-urgent-2026-03-08' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1228e75a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1310e75a580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
