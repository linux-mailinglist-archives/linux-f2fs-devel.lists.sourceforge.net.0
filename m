Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD9/LeqVr2kragIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 04:54:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00634245132
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 04:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ry6Q5DQ6cWSGcj9T5CYzi6Li0ErJ3b3E9NqhiylYPDc=; b=h0+S3aonIowpB3AjolRKKRYnRu
	vkt2x10HHgB8wGyv6sF2Zhcc21TPOWSgo9ywbQlv9fnAstUiQG4x9cCbIK5IN8KrJb+3QUK6cHSKe
	clx+9g2wfCDOCtm5Bg8BGJWhCIMTj81A/3Hkh3KjGIoiRFzjGIVk+V2sm37S5FH1TXJI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzoAc-000666-3b;
	Tue, 10 Mar 2026 03:54:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <325WvaQkbABoIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vzoAb-00065w-Bv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 03:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIx85w9W7IsG0j4v1Wx1+1hfwFsNA9DgmZnpX/ajWn4=; b=BCzOsCavFwdtGp7K4/KNzSSa42
 3QjeMOQGSm59LcYn/gr8hBCpCAoXko0S5Wc6K442yECEj17wYXG+ephAidf6JtCiywzyBZTKrzTL1
 0GRWwkmt/xtwkM3UGFJOmMiK5spT6t7TrJgXBvaxFvL2QmlmaYpytH/meI5qSKB1PEcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oIx85w9W7IsG0j4v1Wx1+1hfwFsNA9DgmZnpX/ajWn4=; b=T
 eMg6nJK96cgtItwpEW3952VorOBp1+UQYBFz/BXPBuj5j7ZnmKIQOkdhVF433lQeVDqMnypXSjwoR
 ufnIE5YCer7iDS54Bg3Mp0oVWcm0V40hfwg9vH4GKjlTI/X9WWdg+K+hP3ZG06PmjOfWXEn8xVkAA
 w/+0j6FpZAYb678A=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzoAb-0004kG-GP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 03:54:10 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-67bb47e6846so22967043eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 20:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773114844; x=1773719644;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIx85w9W7IsG0j4v1Wx1+1hfwFsNA9DgmZnpX/ajWn4=;
 b=SvzFa4+g/NslTwagO0/HoJZBGcESqQBmcj5iME7V0TIAZr+hmqaI4YnfKY3GVmakwy
 J+R6rlTF+LW8i4mrvkQ++pSt+DzOYplGdbPyWgBYYOGoilOvTfAzOBPXu/nlJqs9IvdY
 x/Df50GGQZ5EQPumtwljp8GBUzf+MJYfFvWZ3udLrDZWnxFOEU6jb2IougaRHfr3xBZp
 4SGZ69wnb30q0/7oFqVKKa/98rkaqXyp0RumGWsq1GNgfOw1ufei/blyqShhtQ5lUwyS
 84ZecwDqKWKrbxQ8lDrqgwqH7AcfC4iNeMTFp435D7KqY4I9c0SRH6zx+GSAmnF1b4y6
 38Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEgEmFl4Pacw7bMnC7d6ah9K9h12DUozl02N1a1gys8dKgRQyVqUxvFjTyaYAnKQ+3lwYk5oVrPaDIx9V14RFB@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3Rkq3F9sr5RzWB8SY/ZQqEv2JjW1cFi2kkbU+bvyps1cmTHOT
 idGMK6WGJDR22XY6+Kc+aK5baosgoiU1e+avgdjx+dKm9fG/QMq3o1gVeIQHxBLrrWWuDuk3d1z
 m022jXxPdmNOA0vZWpZoru7Js+PWKQltkfojALg1LfVMIwl4499RjwAHi3jk=
MIME-Version: 1.0
X-Received: by 2002:a4a:edc8:0:b0:662:f763:c539 with SMTP id
 006d021491bc7-67b9bc6ad80mr8703060eaf.14.1773114843722; Mon, 09 Mar 2026
 20:54:03 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:54:03 -0700
In-Reply-To: <aa-SinLe2jrtO1pS@hyeyoo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69af95db.a00a0220.d013.0001.GAE@google.com>
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
 is still triggering an issue: memory leak in __pcs_replace_empty_main BUG:
 memory leak unreferenced object 0xffff888100b60200 (size 512): comm "kthreadd",
 pid 2, jiffies 4294937343 hex dump (first 32 bytes): 00 6c c3 09 81 88 ff
 ff 00 9a 9d 0a 81 88 ff ff .l [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzoAb-0004kG-GP
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
X-Rspamd-Queue-Id: 00634245132
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
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
unreferenced object 0xffff888100b60200 (size 512):
  comm "kthreadd", pid 2, jiffies 4294937343
  hex dump (first 32 bytes):
    00 6c c3 09 81 88 ff ff 00 9a 9d 0a 81 88 ff ff  .l..............
    00 16 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 8a95531e):
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
    __kmalloc_node_noprof+0x57e/0x5d0 mm/slub.c:5274
    kmalloc_node_noprof include/linux/slab.h:1081 [inline]
    __vmalloc_area_node mm/vmalloc.c:3855 [inline]
    __vmalloc_node_range_noprof+0x284/0xe50 mm/vmalloc.c:4064
    __vmalloc_node_noprof+0x71/0x90 mm/vmalloc.c:4124
    alloc_thread_stack_node kernel/fork.c:355 [inline]
    dup_task_struct kernel/fork.c:924 [inline]
    copy_process+0x3e5/0x28c0 kernel/fork.c:2050
    kernel_clone+0xac/0x6e0 kernel/fork.c:2654
    kernel_thread+0x80/0xb0 kernel/fork.c:2715
    create_kthread kernel/kthread.c:459 [inline]
    kthreadd+0x186/0x250 kernel/kthread.c:817
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810438c200 (size 512):
  comm "swapper/0", pid 1, jiffies 4294937794
  hex dump (first 32 bytes):
    00 02 10 0e 81 88 ff ff 00 56 c3 09 81 88 ff ff  .........V......
    00 17 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 3e1bb722):
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
    v4l2_ctrl_handler_free drivers/media/v4l2-core/v4l2-ctrls-core.c:1756 [inline]
    v4l2_ctrl_handler_free+0x92/0x290 drivers/media/v4l2-core/v4l2-ctrls-core.c:1736
    vivid_dev_release+0x26/0x90 drivers/media/test-drivers/vivid/vivid-core.c:857
    v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:51 [inline]
    kref_put include/linux/kref.h:65 [inline]
    v4l2_device_put+0x6b/0xa0 drivers/media/v4l2-core/v4l2-device.c:56
    vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:2070 [inline]
    vivid_probe.cold+0x55a/0x386d drivers/media/test-drivers/vivid/vivid-core.c:2095
    platform_probe+0x86/0xf0 drivers/base/platform.c:1446
    call_driver_probe drivers/base/dd.c:583 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:661
    __driver_probe_device+0xc7/0x160 drivers/base/dd.c:803
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:833
    __driver_attach drivers/base/dd.c:1227 [inline]
    __driver_attach+0x10a/0x200 drivers/base/dd.c:1167
    bus_for_each_dev+0xb8/0x120 drivers/base/bus.c:383
    bus_add_driver+0x122/0x280 drivers/base/bus.c:715
    driver_register+0xb1/0x140 drivers/base/driver.c:249

BUG: memory leak
unreferenced object 0xffff888109c35c00 (size 512):
  comm "kworker/0:1", pid 10, jiffies 4294937868
  hex dump (first 32 bytes):
    00 68 d4 09 81 88 ff ff 00 9c de 09 81 88 ff ff  .h..............
    00 16 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 9ab54a7c):
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
unreferenced object 0xffff88810a9d9a00 (size 512):
  comm "swapper/0", pid 1, jiffies 4294937887
  hex dump (first 32 bytes):
    00 02 b6 00 81 88 ff ff 00 98 9d 0a 81 88 ff ff  ................
    00 16 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 368f6316):
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
    slab_sysfs_init+0xce/0xf0 mm/slub.c:9613
    do_one_initcall+0x79/0x4c0 init/main.c:1382
    do_initcall_level init/main.c:1444 [inline]
    do_initcalls init/main.c:1460 [inline]
    do_basic_setup init/main.c:1479 [inline]
    kernel_init_freeable+0x2a4/0x340 init/main.c:1692
    kernel_init+0x1b/0x1d0 init/main.c:1582
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810a9d9600 (size 512):
  comm "swapper/0", pid 1, jiffies 4294937887
  hex dump (first 32 bytes):
    00 b6 34 0a 81 88 ff ff 00 6c c3 09 81 88 ff ff  ..4......l......
    00 16 04 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc d6fcd7dc):
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
    slab_sysfs_init+0xce/0xf0 mm/slub.c:9613
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

commit:         1f318b96 Linux 7.0-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17bde806580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c6ad6fefffa76b1
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1065375a580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
