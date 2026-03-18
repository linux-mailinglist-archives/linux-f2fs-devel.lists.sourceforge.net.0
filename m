Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMo4D98xumnaSgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 06:02:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA02B5DCC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 06:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eSMRt36/m//yzgC2fhTSDYJ4Tt8eA6PPu1jMZ4N2BOI=; b=Ov1do5gDOmLEM2zFNC4wzflhho
	woENhLTTIY9w1Ps2J7A4bHibIPv2GDiwSDQvVQhpU0PmYystH8jU50EKNxp5oAy7LOu59XHYQ9CGK
	xNC8Rq1oOyPaD7dJW7EwTnT+pa5Rky+7f1MzXJ/aKqLmPD/GQIj9Jz5gH29MID6dk+UE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2j2m-0005mr-PG;
	Wed, 18 Mar 2026 05:02:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3yTG6aQkbAGoaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1w2j2l-0005ml-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 05:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XP4T4iMaCErg7kQXZBXgUrqdcl4Ozy9ZpxYT+MtYY3I=; b=HCnODj66YpYQFOJV8RLR5XiqpS
 +vtEDruMwqOwA/mgiKiX+eNSkwxDo5pknYXRmuCLN0nIaEm7APxM32IC9U0O6YWDziW/iNYuIebxj
 d1D5gqzx9YOpjjFGbpkE0J44ZjgDU9/XC9T61dtpjwzcw4+859IEvvux5k+/BHjoT+LI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XP4T4iMaCErg7kQXZBXgUrqdcl4Ozy9ZpxYT+MtYY3I=; b=Z
 ny/PdCZYPgdY5IGJq5rziIKWZwb1h4YfKqsepJV/lUU4AoHK8Ac3d04CiTBCj9X5RKEz9Gk/SUS88
 PCTD8ZFuryRHztc8iqHBZzSzdZhsu4U4VDcsof5LVG9Y0gaLqHiKXy4I76vn/Wq2OkVvYqX6Qi1s+
 QZsG5NjhPtKv3G8Q=;
Received: from mail-oo1-f71.google.com ([209.85.161.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2j2l-0008D5-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 05:02:07 +0000
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-672c40f3873so147449864eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Mar 2026 22:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773810122; x=1774414922;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XP4T4iMaCErg7kQXZBXgUrqdcl4Ozy9ZpxYT+MtYY3I=;
 b=eJqxsGGcGh5NaTjgkJwcEcxcb8tM+hgga85hHkvzywfAZH6lK3RiLMV3skfLD7fZVI
 BwV6V9ujLgT7oe1wHUgcM8mQ8Zadzklght7tij4FD8mW+lX8Z8qyJqx7flSsSmG2I2u5
 84ThjCBYfNen0cgW8+QU1Yi+vGQK9YZ8Q8k5pKwUVRhv4tWazM0C4y7bpwvN5o/IKH5w
 sCByAfjrss+7lFPupZ02/m9CXNtmpHZhvr2dW0AeaHXtmZ7IKvfLHf1UkBLAfVzKlqi/
 q6zu+Akd0bElfEhqFd+Esw7SOz3E0d/3hijmaHGV0+DInQ9xdUqUC9NN+zFYLJRofRTo
 bGlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcI8a7+22M6trDuG5t/xP3foWg6Ud+peL8OIblfhbckP9xCUbqTN/HJHulU75u7n3xhkr+cRU6olDAlWXMaHNN@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzx3m/rxaBq8U/6tOFLYZ8Vr+xfrdjYEyQ5OhT2ozO+c8UdacBQ
 VH134qU4+IAXA7W7lxWqV8uYT9LEpKjk6nXs8mg+UNN2Ms0w9BwPLluHsZ13ssSzTrTSD4ZtJ9e
 cvR2EkYT0Ea4fQC8IqCqvwEd3ue+IQ/yL/XEsv2J30/pNLm6Z1rplqjZ9Jeo=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4887:b0:66b:6862:18d5 with SMTP id
 006d021491bc7-67c0da588ddmr1007794eaf.8.1773810121701; Tue, 17 Mar 2026
 22:02:01 -0700 (PDT)
Date: Tue, 17 Mar 2026 22:02:01 -0700
In-Reply-To: <abolyGbAyynUANDB@hyeyoo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ba31c9.050a0220.3077e3.0002.GAE@google.com>
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
 memory leak unreferenced object 0xffff888129413800 (size 512): comm
 "kworker/u8:3", 
 pid 58, jiffies 4294947638 hex dump (first 32 bytes): 00 ac 98 1c 81 88 ff
 ff 00 18 6b 0a 81 88 ff ff ......... [...] 
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
X-Headers-End: 1w2j2l-0008D5-Bu
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 7BBA02B5DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __pcs_replace_empty_main

BUG: memory leak
unreferenced object 0xffff888129413800 (size 512):
  comm "kworker/u8:3", pid 58, jiffies 4294947638
  hex dump (first 32 bytes):
    00 ac 98 1c 81 88 ff ff 00 18 6b 0a 81 88 ff ff  ..........k.....
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 10da2a4f):
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

BUG: memory leak
unreferenced object 0xffff88812a621a00 (size 512):
  comm "kworker/u8:3", pid 58, jiffies 4294950606
  hex dump (first 32 bytes):
    00 18 62 2a 81 88 ff ff 00 d6 04 00 81 88 ff ff  ..b*............
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 231cde90):
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

BUG: memory leak
unreferenced object 0xffff88812a621800 (size 512):
  comm "kworker/u8:6", pid 932, jiffies 4294950638
  hex dump (first 32 bytes):
    00 18 6b 0a 81 88 ff ff 00 1a 62 2a 81 88 ff ff  ..k.......b*....
    00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00  ........<.......
  backtrace (crc 9a0f4a55):
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
console output: https://syzkaller.appspot.com/x/log.txt?x=15c4974a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=178fc216580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
