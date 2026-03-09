Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EKGKvCqrmntHQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 12:11:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4FF237A9A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 12:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zWCD8/vxlmCwPIpkmAtVfUFnZIInLzmUxYfqbnOiqRE=; b=iWHKrPnH+YUoEbtR6oh1ghia9g
	Q+0ePQ0Hkc7OzCp4Sg9fikreEpTqW/CN2WQ7NYBujb5YjgNP2e2Bcth07g1a/rIpszU8d6418t/WZ
	hda1dA3qLKLWHP19fv65qB4n8lgUZ4n8BWy1cVaV6Jpq+eVD2kFMrQNV305OF9HrKThg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzYWM-0007jc-Hl;
	Mon, 09 Mar 2026 11:11:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3x6quaQkbACwaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vzYVw-0007hq-RX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 11:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z05biv7HDDyvWTAZybrg4/Tgqu8avyuVtSPLUJRGL/Q=; b=hBI8kWD3b6GhEkmaQY5zcZdLkG
 oLhFMgNxcF6Tf6R8mw8GylpN87FqHibsIyEEqxDlvudFGA+l3YczpY8qFFXICmF2Ce/EaPaC0e3Vc
 C+2rwlNq+6jyRYSpBduSzlhsJMkpFNJfLY3DuZlhYOWndJWmwsrKOsExcvZQq5bR5wM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z05biv7HDDyvWTAZybrg4/Tgqu8avyuVtSPLUJRGL/Q=; b=I
 hrRLsZSEIFBaWr6CWBdWLC3Ra18aYsV3LHz3IBzDQZxsgevs23gepxLUlWNEtj+smcVw+57cZE54q
 KajFUSIQCJGtmPwVgQQFfmzlcmmlTsK8jp7xD9xaR7ieotvfVWeHmsS6Xel+Y/pCWTAXW7q8xwJ4h
 8DErPyryN0E6dPy8=;
Received: from mail-oa1-f72.google.com ([209.85.160.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzYVw-0001rC-Ts for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 11:11:09 +0000
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-40996e43ddaso30202737fac.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 04:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054663; x=1773659463;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z05biv7HDDyvWTAZybrg4/Tgqu8avyuVtSPLUJRGL/Q=;
 b=gQQffY5ogmDYrdK2PaV1iO3u7CY/4OLf9NrTYRgl+U5ciI29JMxBWIXErBQRewhoqF
 5+3HL3wr/nCCgX8doPLDOb6+01PykYZbXiN3TzKPF3yrd+gXlct7J4qv5D7vJ3mq/fwS
 rUiszFJbxIsA84b0qpBruk4+vWSPhHUzinv3RVNsM/937YaqaBexiyjLSFYjs5Yl4ep1
 xvgWK2Hov7UIPzUgllgvcMImdGgpdM7NVwmcwXnENg4aV3KDB+tL0kx/1eYk+ncqNRiK
 JQi+LL3PkDxPf6S8XLfkhE0jdJNmOQmOoegiGkSd8BSszE4gMQ7LVIPMkx+BGUJOriAj
 N9vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfH44GzZWxYXwOUQLtAf11Rzj8jBp7h0/KwlYu7EvAlxoDQVebXnRk8wEDSvVTsGpHBrqLmZ+pUO0F3l2GNMYI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5zl5GhE4WAgrY6TSU7KxsVWQ8Lk62spIVU2fdviiPTfx2VVii
 YvNHYNK+FIKXdR4ToCrKCIjn1LW+kxwqNsDXjq5VtOT/CDZ1eaVBla7UzsXBUJsX+0jY3XacW/E
 S8LaE8HvDe2nr9fGE3GG8u18rGYPD+2/NJidv9EstNl5PLlYphuINsrAEG6s=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3105:b0:679:92c7:2bfa with SMTP id
 006d021491bc7-67b9bd0fc42mr6325438eaf.45.1773054663271; Mon, 09 Mar 2026
 04:11:03 -0700 (PDT)
Date: Mon, 09 Mar 2026 04:11:03 -0700
In-Reply-To: <aa6lBQDAVnqjz_lk@hyeyoo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69aeaac7.a70a0220.52840.0014.GAE@google.com>
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
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff8881008bb900 (size 256): comm
 "swapper/0", 
 pid 0, jiffies 4294937326 hex dump (first 32 bytes): 00 e8 54 0b 81 88 ff
 ff 00 55 bf 0f 81 88 ff ff ..T......U... [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzYVw-0001rC-Ts
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
X-Rspamd-Queue-Id: DA4FF237A9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:hao.li@linux.dev,m:harry.yoo@oracle.com,m:jaegeuk@kernel.org,m:jannh@google.com,m:liam.howlett@oracle.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@kernel.org,m:vbabka@suse.cz,m:wangqing7171@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,syzkaller.appspot.com:url];
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
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff8881008bb900 (size 256):
  comm "swapper/0", pid 0, jiffies 4294937326
  hex dump (first 32 bytes):
    00 e8 54 0b 81 88 ff ff 00 55 bf 0f 81 88 ff ff  ..T......U......
    00 e1 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc e804819c):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1d2/0x260 mm/slub.c:4634
    alloc_from_pcs mm/slub.c:4725 [inline]
    slab_alloc_node mm/slub.c:4859 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x4c5/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __register_sysctl_table+0x4e/0xa60 fs/proc/proc_sysctl.c:1379
    register_sysctl_sz fs/proc/proc_sysctl.c:1436 [inline]
    __register_sysctl_init+0x30/0x70 fs/proc/proc_sysctl.c:1465
    pagecache_init+0x4e/0x70 mm/filemap.c:1095
    start_kernel+0xb33/0xb80 init/main.c:1193
    x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
    x86_64_start_kernel+0xce/0xd0 arch/x86/kernel/head64.c:291
    common_startup_64+0x13e/0x148

BUG: memory leak
unreferenced object 0xffff888104417400 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937905
  hex dump (first 32 bytes):
    00 42 a4 1c 81 88 ff ff 00 06 05 00 81 88 ff ff  .B..............
    00 16 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc db9a578f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5730
    free_to_pcs mm/slub.c:5783 [inline]
    slab_free mm/slub.c:6185 [inline]
    kfree+0x352/0x390 mm/slub.c:6498
    vfree.part.0+0x1cd/0x4d0 mm/vmalloc.c:3484
    vfree mm/vmalloc.c:3456 [inline]
    delayed_vfree_work+0x5b/0x90 mm/vmalloc.c:3398
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810ad9d600 (size 512):
  comm "syz-executor", pid 5829, jiffies 4294941807
  hex dump (first 32 bytes):
    00 72 0a 00 81 88 ff ff 00 d2 04 00 81 88 ff ff  .r..............
    00 af 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 57ea7b83):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    alloc_full_sheaf mm/slub.c:2834 [inline]
    __pcs_replace_empty_main+0x1d2/0x260 mm/slub.c:4634
    alloc_from_pcs mm/slub.c:4725 [inline]
    slab_alloc_node mm/slub.c:4859 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kvmalloc_node_noprof+0x5a7/0x770 mm/slub.c:6767
    allocate_hook_entries_size net/netfilter/core.c:58 [inline]
    nf_hook_entries_grow+0x178/0x3e0 net/netfilter/core.c:137
    __nf_register_net_hook+0xc4/0x2e0 net/netfilter/core.c:432
    nf_register_net_hook+0x8a/0x110 net/netfilter/core.c:575
    nf_register_net_hooks+0x5d/0xd0 net/netfilter/core.c:591
    ipt_register_table+0x15e/0x220 net/ipv4/netfilter/ip_tables.c:1781
    iptable_security_table_init+0x40/0x60 net/ipv4/netfilter/iptable_security.c:46
    xt_find_table_lock+0x1a3/0x270 net/netfilter/x_tables.c:1260
    xt_request_find_table_lock+0x28/0xb0 net/netfilter/x_tables.c:1285
    get_info+0x101/0x460 net/ipv4/netfilter/ip_tables.c:963
    do_ipt_get_ctl+0x9b/0x5e0 net/ipv4/netfilter/ip_tables.c:1659
    nf_getsockopt+0x61/0xa0 net/netfilter/nf_sockopt.c:116
    ip_getsockopt+0x10a/0x150 net/ipv4/ip_sockglue.c:1777

BUG: memory leak
unreferenced object 0xffff88810fbf5500 (size 256):
  comm "kworker/u8:0", pid 12, jiffies 4294942140
  hex dump (first 32 bytes):
    00 b9 8b 00 81 88 ff ff 00 72 02 01 81 88 ff ff  .........r......
    00 e1 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 88397b4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5730
    free_to_pcs mm/slub.c:5783 [inline]
    slab_free mm/slub.c:6185 [inline]
    kfree+0x352/0x390 mm/slub.c:6498
    netif_free_tx_queues net/core/dev.c:11206 [inline]
    free_netdev+0x71/0x380 net/core/dev.c:12183
    netdev_run_todo+0x5ec/0x770 net/core/dev.c:11726
    ops_exit_rtnl_list net/core/net_namespace.c:189 [inline]
    ops_undo_list+0x2bd/0x300 net/core/net_namespace.c:248
    cleanup_net+0x287/0x570 net/core/net_namespace.c:704
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810b540200 (size 512):
  comm "kworker/u8:2", pid 34, jiffies 4294942151
  hex dump (first 32 bytes):
    00 8a 51 27 81 88 ff ff 00 2e 7a 2e 81 88 ff ff  ..Q'......z.....
    00 18 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 8700e7f7):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5730
    free_to_pcs mm/slub.c:5783 [inline]
    slab_free mm/slub.c:6185 [inline]
    kfree+0x352/0x390 mm/slub.c:6498
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888127522c00 (size 512):
  comm "kworker/u8:7", pid 1176, jiffies 4294942410
  hex dump (first 32 bytes):
    00 7a 54 0b 81 88 ff ff 00 e6 b9 0f 81 88 ff ff  .zT.............
    00 18 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc c4b7e6cc):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4552 [inline]
    slab_alloc_node mm/slub.c:4874 [inline]
    __do_kmalloc_node mm/slub.c:5267 [inline]
    __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5280
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    __alloc_empty_sheaf+0x35/0x50 mm/slub.c:2771
    alloc_empty_sheaf mm/slub.c:2786 [inline]
    __pcs_replace_full_main+0xe8/0x300 mm/slub.c:5730
    free_to_pcs mm/slub.c:5783 [inline]
    slab_free mm/slub.c:6185 [inline]
    kfree+0x352/0x390 mm/slub.c:6498
    process_one_work+0x26c/0x5d0 kernel/workqueue.c:3275
    process_scheduled_works kernel/workqueue.c:3358 [inline]
    worker_thread+0x243/0x490 kernel/workqueue.c:3439
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         1f318b96 Linux 7.0-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=117b875a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b8375a580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
