Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMpDFG41immhIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 20:28:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CE114145
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 20:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IlTzj0W9TSFe5DEN1zzUPTYnuo2FvViNVEtw356jcxE=; b=dYoAdnDlSUt15JeIN7wAi2Stni
	IeWxKiWnw4PlD8Bh7QV20jxO0kTYIw2ZOV1bw6c7+EOkhgOWGivK68C9r1mX4MxxQ65q4WqsHSDh9
	jBRW8jTMSVjx8phXpEwprB2sbcPcw3oyVnjmHgb3bTPSaXnCymOCedCtlFuCmcIf3MDA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpWw0-00083d-1x;
	Mon, 09 Feb 2026 19:28:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <30yaKaQkbAJwOUVG6HHAN6LLE9.CKKCHAQOAN8KJPAJP.8KI@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vpWvy-00083X-Od for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 19:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHb1csLytyyiMKOXyYY5iKGtJrwFDhra+RzcW23fs9U=; b=BmHvDogRfoX/dDJlLNYOoScrv8
 lUQNKsjT9KnMOJQy2KoldFmN/1wqZ/TxZ9qDXQm37bFogaz7yZPjAkflujC5514JJbzOxyI8VzT3b
 gW5mV2SKqLzQcu66o9TBJvo5KDFdqoODN3D7SkA1CiZKbrHaw1PSvV/dHAXovBop2/tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rHb1csLytyyiMKOXyYY5iKGtJrwFDhra+RzcW23fs9U=; b=D
 ZLbASBCVzGzwrZjvtQO5d6SXiZGAL9NoEvUjj6vZxTQ/XYjjKkoUjl1UCI9PBlg7PyaJ9xXJkfNMs
 7I1v4fQbrl9xyfNP1z6qMazBk8NgOrxmhzFMhLKKDiWgYVmrkxEBzlLYqjprs4U1vLiJef12rmdf5
 xIJnK5IiMtQ5lrE4=;
Received: from mail-qv1-f77.google.com ([209.85.219.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vpWvy-0008Cm-1R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 19:28:34 +0000
Received: by mail-qv1-f77.google.com with SMTP id
 6a1803df08f44-896f84e69b6so97826126d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Feb 2026 11:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770665303; x=1771270103;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHb1csLytyyiMKOXyYY5iKGtJrwFDhra+RzcW23fs9U=;
 b=HUGGjGWIfKbygDxt+x3c5pup9Jpzh34ZlaQ3FxVXyT+XlvGU5ISl8R4dQ5TpUJbgRR
 +dlJacQrJEdpMpmxar6lYJ6YIZdBEa9qFO2E7tEqe4LDTzNBzwv9Min+v9NxXbeZOz77
 2dRVtD8tpS873XKdJOKekk+74v1mHIdXrX9RYmVluypzzqw7eiEpKJJ4HkhaH1/nli8e
 KjCekzyP010S2cPnkY50vevrNOC2kh+u5ePhQFbBCexaZOFGSuplBXjQN3T1v6I1Scks
 vvN0PN8/HdkmwfQeI+ioaGpM2E/5tSDTxj2OiuxoDFWWYH7fUGi3aO8RKZbBxrpIlhdH
 i2ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7DvppNZDTmDBWcsrIhPqq5uhGHkBvppmNw23FPlvWq6gCS9H8ERSsfzFMfflmTdwbph2YcgEJDf6aQMRA3xb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwjrYbdwBxCsvadN/iF5gqNnyxkuHRMgaQoz6d6wgZyNvhbFBN1
 PKdFQZdn8Hei3KvvfZj4lSQEDJaiKd2S84jBlhbiUK6pwNf+lezowgx100k+Kyl+ZI9MVfGb08u
 m9buBGBS5t8uN2LvNiCLHkPVa+cJK2RHYsJH5L3MSP7/DztVubL0sk7YuZZE=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1614:b0:663:bad:9727 with SMTP id
 006d021491bc7-66d0d10b432mr5479618eaf.78.1770661587911; Mon, 09 Feb 2026
 10:26:27 -0800 (PST)
Date: Mon, 09 Feb 2026 10:26:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, chao@kernel.org, 
 jaegeuk@kernel.org, jannh@google.com, linkinjeon@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
 pfalcato@suse.de, sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, 
 vbabka@suse.cz
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: e7aa57247700
 Merge tag 'spi-fix-v6.19-rc8' of git://git.ke.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=122ae7fa580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.77 listed in wl.mailspike.net]
X-Headers-End: 1vpWvy-0008Cm-1R
Subject: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
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
X-Spamd-Result: default: False [0.39 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:chao@kernel.org,m:jaegeuk@kernel.org,m:jannh@google.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@suse.cz,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,syzkaller.appspot.com:url,storage.googleapis.com:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 705CE114145
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    e7aa57247700 Merge tag 'spi-fix-v6.19-rc8' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122ae7fa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130e2944580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/28d29c9b5ae2/disk-e7aa5724.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0683244c7a0f/vmlinux-e7aa5724.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cd8cc5cb8b94/bzImage-e7aa5724.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f78f58e821b0/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10f7165a580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888113218600 (size 512):
  comm "sed", pid 6046, jiffies 4294945902
  hex dump (first 32 bytes):
    00 8e 13 29 81 88 ff ff 00 12 86 27 81 88 ff ff  ...).......'....
    00 5a 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  .Z..............
  backtrace (crc 49909e19):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    alloc_empty_sheaf+0x36/0x50 mm/slub.c:2618
    __kfree_rcu_sheaf+0x155/0x210 mm/slub.c:6304
    kfree_rcu_sheaf mm/slab_common.c:1631 [inline]
    kvfree_call_rcu+0x202/0x3d0 mm/slab_common.c:1981
    ma_free_rcu lib/maple_tree.c:208 [inline]
    ma_free_rcu+0x29/0x40 lib/maple_tree.c:205
    mas_free lib/maple_tree.c:1174 [inline]
    mas_replace_node lib/maple_tree.c:1581 [inline]
    mas_wr_node_store+0x5fc/0x730 lib/maple_tree.c:3553
    mas_wr_store_entry+0x4eb/0x760 lib/maple_tree.c:3764
    mas_store_prealloc+0x358/0x740 lib/maple_tree.c:5169
    vma_iter_store_overwrite mm/vma.h:544 [inline]
    commit_merge+0x28e/0x490 mm/vma.c:763
    vma_expand+0x264/0x460 mm/vma.c:1200
    vma_merge_new_range+0xe3/0x350 mm/vma.c:1099
    __mmap_region+0x54b/0x15b0 mm/vma.c:2747
    mmap_region+0xfb/0x1e0 mm/vma.c:2830
    do_mmap+0x7ac/0xb80 mm/mmap.c:558
    vm_mmap_pgoff+0x1a6/0x2d0 mm/util.c:581
    ksys_mmap_pgoff+0x233/0x2d0 mm/mmap.c:604

BUG: memory leak
unreferenced object 0xffff888127861200 (size 512):
  comm "udevd", pid 6236, jiffies 4294948784
  hex dump (first 32 bytes):
    00 86 21 13 81 88 ff ff 18 e0 05 00 81 88 ff ff  ..!.............
    00 5a 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  .Z..............
  backtrace (crc 5b72581e):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    alloc_empty_sheaf+0x36/0x50 mm/slub.c:2618
    __kfree_rcu_sheaf+0x155/0x210 mm/slub.c:6304
    kfree_rcu_sheaf mm/slab_common.c:1631 [inline]
    kvfree_call_rcu+0x202/0x3d0 mm/slab_common.c:1981
    ma_free_rcu lib/maple_tree.c:208 [inline]
    ma_free_rcu+0x29/0x40 lib/maple_tree.c:205
    mas_topiary_node lib/maple_tree.c:2311 [inline]
    mas_topiary_node lib/maple_tree.c:2299 [inline]
    mas_topiary_replace+0xb0f/0x1400 lib/maple_tree.c:2410
    mas_wmb_replace lib/maple_tree.c:2433 [inline]
    mas_spanning_rebalance+0x14e1/0x24b0 lib/maple_tree.c:2738
    mas_wr_spanning_store+0x983/0x10d0 lib/maple_tree.c:3479
    mas_wr_store_entry+0x4d5/0x760 lib/maple_tree.c:3767
    mas_store_gfp+0x341/0x640 lib/maple_tree.c:5138
    vma_iter_clear_gfp include/linux/mm.h:1141 [inline]
    do_vmi_align_munmap+0x259/0x2d0 mm/vma.c:1574
    do_vmi_munmap+0x17c/0x280 mm/vma.c:1627
    __vm_munmap+0xec/0x200 mm/vma.c:3247
    __do_sys_munmap mm/mmap.c:1077 [inline]
    __se_sys_munmap mm/mmap.c:1074 [inline]
    __x64_sys_munmap+0x1f/0x30 mm/mmap.c:1074
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88812c458000 (size 4480):
  comm "udevd", pid 5181, jiffies 4294950983
  hex dump (first 32 bytes):
    01 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 80 00 00 00 00 00 00 00  ................
  backtrace (crc ad4af9e6):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    kmem_cache_alloc_node_noprof+0x422/0x590 mm/slub.c:5315
    alloc_task_struct_node kernel/fork.c:184 [inline]
    dup_task_struct kernel/fork.c:915 [inline]
    copy_process+0x286/0x2870 kernel/fork.c:2052
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881274a1540 (size 184):
  comm "udevd", pid 5181, jiffies 4294950983
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 54e589bc):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    kmem_cache_alloc_noprof+0x412/0x580 mm/slub.c:5270
    prepare_creds+0x22/0x600 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109639020 (size 32):
  comm "udevd", pid 5181, jiffies 4294950983
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 52 86 00 81 88 ff ff 00 00 00 00 00 00 00 00  .R..............
  backtrace (crc 336e1c5f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:192
    lsm_cred_alloc security/security.c:209 [inline]
    security_prepare_creds+0x2d/0x290 security/security.c:2763
    prepare_creds+0x395/0x600 kernel/cred.c:215
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126fdbd80 (size 64):
  comm "udevd", pid 5181, jiffies 4294950983
  hex dump (first 32 bytes):
    c0 c3 4e 46 81 88 ff ff 00 00 00 00 00 00 00 00  ..NF............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 508a43e4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:192
    lsm_task_alloc security/security.c:244 [inline]
    security_task_alloc+0x2a/0x260 security/security.c:2682
    copy_process+0xf07/0x2870 kernel/fork.c:2203
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
