Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCiXKCG28WngjwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 09:41:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C038349098F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 09:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svIiVyzh/Cehtj/wGc7SVDklEqMcVmPlDC8MCwTQ3iI=; b=PdHErn+tv/KBDlrFIzVFqJVk3a
	z19A7S4myQezCceS09EHm4wYAOZ06TT2xQmpT4mEh3aJhTFBYuq3pLHcsedF3j+oo4DgHTdjnX3VC
	2DmIyHEf80tW52ZiUyR/FmNq+7qyfDMGdLTp1cShP+9khc0ElGGfk+2kr0wlan7n8wbI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHzXf-0006dQ-Sx;
	Wed, 29 Apr 2026 07:41:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wHzXe-0006dK-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 07:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMvQgvyYZ31N/L4bd8suSZxLOdIYkXvndCj1ncQHCRM=; b=d4UuMacdJhAO4eT0BPfzS9HRyI
 J9l5lu94/oxhcZBJd6eUzbW1Ki/t8PXjXbLGAoAyXy71VkSQuE8VrpptW6U/yOXdFIAzqB+VVl5f9
 Sodj225bD0RgWxfePIyfKKezPhCXnFRsHmITz0ldHI1eq7o/x+PjHwRFBJ+qt48cu8zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TMvQgvyYZ31N/L4bd8suSZxLOdIYkXvndCj1ncQHCRM=; b=BCNH6Pje92BM5PXFVo39w1tYqJ
 Zm6SmFqvlWVQdvfdE7hrSdlhXRDKVc07uhU27NLFi6FuBii5RxmBadj+15R5FyVvls0AhAId5vgsu
 9ued/BDNQAPDb+/mx/d7EzAO/TDQWJ1FzS14G2a0cKsB0LnSmbGJyNDVJ7A/BsAVsGB0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHzXd-0000p8-EU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 07:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CB5660018;
 Wed, 29 Apr 2026 07:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF68C19425;
 Wed, 29 Apr 2026 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777448459;
 bh=I8c/tz/JamJde8CBVpYuI+nwBjWL0uESkEiXsvHZp0M=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=CSjwpSjHGnbf68KALGQNYkBk61jgwllnke4z09lz1g6vhIIZmt4NpGiM0frB0crZO
 +Ea9NJpYpYxnS/h9HSXdhcT4qqfN+mgELr3LhOar3SsR1Cw+Nd/VFOQn43gK+YMiIX
 ClExlHoNEMIk1+tqpWDJ/GZKRUmx12PtC5ri2s9LiccI0FRPboz4aNo97ZDm3KJ6XB
 eliWXViX5uvIm0hsYQUUytJb3/LyOgdsHyNfxM22oLp3Hquo+zXaEpIPfqm1LHSUQk
 YCWkEOzIkbZFocSZ3EjHdujquP6P6vXRa6MYgixBXxsmGyrkvh7zjAALb/mwhP83h3
 oOB5YqEzbAapg==
Message-ID: <7b290a95-d488-4c48-ad4b-ca2b371cbdff@kernel.org>
Date: Wed, 29 Apr 2026 15:40:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+337ec6af661bd91fa43a@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <69ddb064.a00a0220.468cb.0057.GAE@google.com>
Content-Language: en-US
In-Reply-To: <69ddb064.a00a0220.468cb.0057.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz fix f2fs: avoid reading already updated pages during
 GC On 4/14/2026 11:11 AM, syzbot wrote: > Hello, > > syzbot found the following
 issue on: > > HEAD commit: a55f7f5f29b3 Merge tag 'net-7.0-rc8' of
 git://git.kernel.o.. > git tree: upstream > console outp [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: goo.gl]
 [URI: storage.googleapis.com] [URI: syzkaller.appspot.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wHzXd-0000p8-EU
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in folio_end_read (3)
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C038349098F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d46eab0cfd31c214];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:syzbot+337ec6af661bd91fa43a@syzkaller.appspotmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,googlegroups.com:email,storage.googleapis.com:url,goo.gl:url,syzkaller.appspot.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,337ec6af661bd91fa43a];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REDIRECTOR_URL(0.00)[goo.gl];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]

#syz fix f2fs: avoid reading already updated pages during GC

On 4/14/2026 11:11 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a55f7f5f29b3 Merge tag 'net-7.0-rc8' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15cc7bd6580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d46eab0cfd31c214
> dashboard link: https://syzkaller.appspot.com/bug?extid=337ec6af661bd91fa43a
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a55f7f5f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6392912f99d3/vmlinux-a55f7f5f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9d6fd8c7dfa0/bzImage-a55f7f5f.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+337ec6af661bd91fa43a@syzkaller.appspotmail.com
> 
> page: refcount:2 mapcount:0 mapping:ffff888046f3e788 index:0x1507 pfn:0x32d0e
> memcg:ffff88801c6c8d40
> aops:f2fs_meta_aops ino:2
> flags: 0x4fff400000000a9(locked|waiters|uptodate|lru|node=1|zone=1|lastcpupid=0x7ff)
> raw: 04fff400000000a9 ffffea0000d1b988 ffff888030450a80 ffff888046f3e788
> raw: 0000000000001507 0000000000000000 00000002ffffffff ffff88801c6c8d40
> page dumped because: VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio))
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0x40c40(GFP_NOFS|__GFP_COMP), pid 5318, tgid 5316 (syz.0.0), ts 76502021566, free_ts 42035680990
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x231/0x280 mm/page_alloc.c:1889
>   prep_new_page mm/page_alloc.c:1897 [inline]
>   get_page_from_freelist+0x24dc/0x2580 mm/page_alloc.c:3962
>   __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5250
>   alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2490
>   alloc_frozen_pages_noprof mm/mempolicy.c:2561 [inline]
>   alloc_pages_noprof+0xa8/0x1a0 mm/mempolicy.c:2581
>   folio_alloc_noprof+0x1e/0x30 mm/mempolicy.c:2591
>   filemap_alloc_folio_noprof+0x111/0x470 mm/filemap.c:1013
>   __filemap_get_folio_mpol+0x3fc/0xb00 mm/filemap.c:2011
>   __filemap_get_folio include/linux/pagemap.h:763 [inline]
>   f2fs_filemap_get_folio fs/f2fs/f2fs.h:3065 [inline]
>   ra_data_block+0x544/0xd00 fs/f2fs/gc.c:1277
>   gc_data_segment fs/f2fs/gc.c:1648 [inline]
>   do_garbage_collect+0x358d/0x7080 fs/f2fs/gc.c:1874
>   f2fs_gc+0xca2/0x2570 fs/f2fs/gc.c:1981
>   f2fs_balance_fs+0x657/0x840 fs/f2fs/segment.c:467
>   f2fs_map_blocks+0x2958/0x4340 fs/f2fs/data.c:1826
>   f2fs_iomap_begin+0x3bd/0x8f0 fs/f2fs/data.c:4527
>   iomap_iter+0x600/0x1020 fs/iomap/iter.c:110
>   __iomap_dio_rw+0x1360/0x1ea0 fs/iomap/direct-io.c:795
> page last free pid 15 tgid 15 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   __free_pages_prepare mm/page_alloc.c:1433 [inline]
>   __free_frozen_pages+0xc2b/0xdb0 mm/page_alloc.c:2978
>   __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
>   tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
>   rcu_do_batch kernel/rcu/tree.c:2617 [inline]
>   rcu_core+0x7cd/0x1070 kernel/rcu/tree.c:2869
>   handle_softirqs+0x22a/0x870 kernel/softirq.c:622
>   run_ksoftirqd+0x36/0x60 kernel/softirq.c:1063
>   smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
>   kthread+0x388/0x470 kernel/kthread.c:436
>   ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> ------------[ cut here ]------------
> kernel BUG at mm/filemap.c:1536!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 42 Comm: kworker/u4:3 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: loop0 loop_workfn
> RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1536
> Code: 6f c3 ff 48 89 df 48 c7 c6 e0 c4 d7 8b e8 ba ba 25 ff 90 0f 0b e8 02 6f c3 ff 48 89 df 48 c7 c6 40 bb d7 8b e8 a3 ba 25 ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
> RSP: 0018:ffffc90000447478 EFLAGS: 00010246
> RAX: b965f80585da9300 RBX: ffffea0000cb4380 RCX: 0000000000000000
> RDX: 0000000000000006 RSI: ffffffff8deff28a RDI: 00000000ffffffff
> RBP: 0000000000000001 R08: ffffffff9011feb7 R09: 1ffffffff2023fd6
> R10: dffffc0000000000 R11: fffffbfff2023fd7 R12: 1ffffd4000196871
> R13: 1ffffd4000196870 R14: ffffea0000cb4388 R15: 0000000000000008
> FS:  0000000000000000(0000) GS:ffff88808ca49000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f8b147ff000 CR3: 0000000038c3d000 CR4: 0000000000352ef0
> Call Trace:
>   <TASK>
>   f2fs_finish_read_bio+0x4fc/0x940 fs/f2fs/data.c:182
>   blk_update_request+0x57e/0xe60 block/blk-mq.c:1016
>   blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1178
>   lo_rw_aio_complete drivers/block/loop.c:337 [inline]
>   lo_rw_aio+0xcde/0xf00 drivers/block/loop.c:409
>   do_req_filebacked drivers/block/loop.c:435 [inline]
>   loop_handle_cmd drivers/block/loop.c:1925 [inline]
>   loop_process_work+0x958/0x11a0 drivers/block/loop.c:1960
>   process_one_work kernel/workqueue.c:3276 [inline]
>   process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
>   worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
>   kthread+0x388/0x470 kernel/kthread.c:436
>   ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:folio_end_read+0x22e/0x230 mm/filemap.c:1536
> Code: 6f c3 ff 48 89 df 48 c7 c6 e0 c4 d7 8b e8 ba ba 25 ff 90 0f 0b e8 02 6f c3 ff 48 89 df 48 c7 c6 40 bb d7 8b e8 a3 ba 25 ff 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
> RSP: 0018:ffffc90000447478 EFLAGS: 00010246
> RAX: b965f80585da9300 RBX: ffffea0000cb4380 RCX: 0000000000000000
> RDX: 0000000000000006 RSI: ffffffff8deff28a RDI: 00000000ffffffff
> RBP: 0000000000000001 R08: ffffffff9011feb7 R09: 1ffffffff2023fd6
> R10: dffffc0000000000 R11: fffffbfff2023fd7 R12: 1ffffd4000196871
> R13: 1ffffd4000196870 R14: ffffea0000cb4388 R15: 0000000000000008
> FS:  0000000000000000(0000) GS:ffff88808ca49000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f8b147ff000 CR3: 0000000038c3d000 CR4: 0000000000352ef0
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
