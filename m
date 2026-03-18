Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NHnAiUXumnyRQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 04:08:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC12B568C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 04:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z81zG45dvaGVSRzHvNkCCIJ+k+PfaB2vUIYzl1+pgAs=; b=g7arKu3gKAn+c31WQbwKBsN6rJ
	Vmdk8qiYd53YWb28quI+u45ZX0gC6D+vcRlOmBdzTROZqagVafj2nEtwe5j2xa49IuZe+e6ESdNFn
	b1/5nclbHGhitm+84xHK08yuEVKGKaQoemfQ0eWuOMESUhVnGDEzl+fn3TMjZwitR/rY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2hGU-00066I-PO;
	Wed, 18 Mar 2026 03:08:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Exe6aQkbAH4u01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1w2hGT-000660-1o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 03:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gxvOJNpri5w4RKCQDfdsWJpDQ+y1OdANJaHF9wxYFME=; b=P7rg0p97JnL9pQT/gAl83xm7SO
 antaCvcj+PMf0WHuGNE8Z7xc1ifv7rukcZXDo/Znbe7+ZrREi7J/94HrZV1LJOi0Izqot7IxNo/jf
 0cUXtOvjfrMQEZbdXOaXk6ugiz/nc5myvcykfeQqH/9iLlu10ylb4dg+tpGW/WQ4PJxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gxvOJNpri5w4RKCQDfdsWJpDQ+y1OdANJaHF9wxYFME=; b=A
 YDYbtD8eGq8XkoEaCdesaBvqHw42rYmhueYTB2qmdcMqxutd4t+ZMzlUwktSoK66VFHdfaT+2OIsn
 TSy6FZ1dbgx5urX0g5jj7cQ3QqEWGWX5McRbMkXfVLv4y7fPEBYxkjdYaX8e/RV2uZA1N1dHx9qo6
 /jcF2hEqMo0tigbk=;
Received: from mail-oo1-f71.google.com ([209.85.161.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2hGT-0003cn-Av for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 03:08:09 +0000
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-67bf2b72878so34307013eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Mar 2026 20:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773803283; x=1774408083;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxvOJNpri5w4RKCQDfdsWJpDQ+y1OdANJaHF9wxYFME=;
 b=iUxMXGitYcQpX0nsZiQ5EcvoodXaLzUaUJW4r61MraRg3QTGxzNevg7JSaOXJc43sE
 2BaH57kNKt2o2pofDJ2rdkwU1LdsA4i8p7zfSWd3NXmtyFsJMF3CuNyIiEIlXqfq/dOR
 H9nrl7zVGfTN4dcRd76xpKbEM72wvAGmbuFUVvGNbfj4Lty6yNMPhRMZJ1/8ABCcuDho
 ZlUDzmGP7gk9nN7pJYDpR6sivBPOVPu75gjEL9vlWnnepXLyz3WYJHl57HbRXmUkkD8h
 aiwH/nC7XxBytwTAiaBM5uz0el1DRdowWdC2nXENbO1qMryN1kjrJH7KM/vn2alpZdsh
 5ZNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpTZlA6F8/AfJP76HDowLHebZtVgvzqb1qgZPvhDe9vDzUBfsA1cTuOwcwIu14FCnxjvwRwh1ZZHgTN7XI53tY@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwZL3jsK13YW49n1GBPUWwH98XCStHgJGHrhxN0HgfyD8qg++t1
 Ze4LerhDgUpJcFBGoo5xcrO+/TnrVQLwf4ndGcdpivIajW5G4qZJoZqabt50Jd/Z+5ZSd1YILDC
 waRegJHkvQd1IVKhKgy0RXa5x5aTLAWoBFIb1Ry60gAbr5pf7507qAa0rPSk=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca9:b0:67b:a489:3b6f with SMTP id
 006d021491bc7-67c0db5551fmr1348347eaf.66.1773803283716; Tue, 17 Mar 2026
 20:08:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 20:08:03 -0700
In-Reply-To: <aboPKERGvOniN-OK@hyeyoo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ba1713.050a0220.3077e3.0001.GAE@google.com>
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
 memory leak unreferenced object 0xffff88810e983c00 (size 512): comm "softirq", 
 pid 0, jiffies 4294948614 hex dump (first 32 bytes): c8 2c 04 00 81 88 ff
 ff 00 a4 98 0e 81 88 ff ff ., [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.71 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2hGT-0003cn-Av
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 44FC12B568C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff88810e983c00 (size 512):
  comm "softirq", pid 0, jiffies 4294948614
  hex dump (first 32 bytes):
    c8 2c 04 00 81 88 ff ff 00 a4 98 0e 81 88 ff ff  .,..............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 8f5c2bf9):
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
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x4c5/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    cfg80211_inform_single_bss_data+0x21d/0xa70 net/wireless/scan.c:2344
    cfg80211_inform_bss_data+0x13f/0x1dc0 net/wireless/scan.c:3226
    cfg80211_inform_bss_frame_data+0x108/0x340 net/wireless/scan.c:3317
    ieee80211_bss_info_update+0x13a/0x320 net/mac80211/scan.c:230
    ieee80211_scan_rx+0x269/0x3b0 net/mac80211/scan.c:364
    __ieee80211_rx_handle_packet net/mac80211/rx.c:5305 [inline]
    ieee80211_rx_list+0x111b/0x1850 net/mac80211/rx.c:5588
    ieee80211_rx_napi+0x50/0x110 net/mac80211/rx.c:5611
    ieee80211_rx include/net/mac80211.h:5267 [inline]
    ieee80211_handle_queued_frames+0x9c/0xf0 net/mac80211/main.c:452
    tasklet_action_common+0xb7/0x270 kernel/softirq.c:925
    handle_softirqs+0xdf/0x2c0 kernel/softirq.c:622
    __do_softirq kernel/softirq.c:656 [inline]
    invoke_softirq kernel/softirq.c:496 [inline]
    __irq_exit_rcu+0x91/0xb0 kernel/softirq.c:723
    instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
    sysvec_apic_timer_interrupt+0x73/0x80 arch/x86/kernel/apic/apic.c:1056

BUG: memory leak
unreferenced object 0xffff88810e98a400 (size 512):
  comm "kworker/u8:7", pid 1022, jiffies 4294952987
  hex dump (first 32 bytes):
    00 3c 98 0e 81 88 ff ff 00 68 cd 2a 81 88 ff ff  .<.......h.*....
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc b6e2f12f):
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
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_noprof+0x4c5/0x560 mm/slub.c:5272
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    cfg80211_inform_single_bss_data+0x21d/0xa70 net/wireless/scan.c:2344
    cfg80211_inform_bss_data+0x13f/0x1dc0 net/wireless/scan.c:3226
    cfg80211_inform_bss_frame_data+0x108/0x340 net/wireless/scan.c:3317
    ieee80211_bss_info_update+0x13a/0x320 net/mac80211/scan.c:230
    ieee80211_rx_bss_info net/mac80211/ibss.c:1094 [inline]
    ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1575 [inline]
    ieee80211_ibss_rx_queued_mgmt+0xb75/0x1230 net/mac80211/ibss.c:1602
    ieee80211_iface_process_skb net/mac80211/iface.c:1748 [inline]
    ieee80211_iface_work+0x6af/0x9b0 net/mac80211/iface.c:1802
    cfg80211_wiphy_work+0x1db/0x280 net/wireless/core.c:440
    process_one_work+0x277/0x5f0 kernel/workqueue.c:3276
    process_scheduled_works kernel/workqueue.c:3359 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3440
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x23c/0x4b0 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         a989fde7 Merge tag 'libnvdimm-fixes-7.0-rc5' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1005f8da580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1405b406580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
