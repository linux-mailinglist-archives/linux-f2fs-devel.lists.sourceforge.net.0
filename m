Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87E2F7EB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 15:59:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0QZp-00011s-V7; Fri, 15 Jan 2021 14:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l0QZp-00011i-FF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 14:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=36hqgFfHboM09/hNebMC79KyKxBltnq6c5W+0RfoUPs=; b=gA8P9oZqUtr32CrxhNeQFhPJlB
 L0lH2kPaxfHwAyESL9WHmHhglBUdjdEIjBapvnMPAGSlPNYaeiR49k0yTFh7PY5PMy5n4LkDX7Elr
 L97YBJIY5jG98YP0OH3zYTeJjH+7fZYkF//xq1VxqcO3HyZpbyJ40g+bL4NqZbznLHQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=36hqgFfHboM09/hNebMC79KyKxBltnq6c5W+0RfoUPs=; b=E5S+9dbyrAIy/5cBzn5J6emD+n
 UmLOOC8ivm1pxkjj72eAq0OD+s9dpJEBaIECOXY1ca8SVhhotFS8Hs5SNTfPZxoacR+q1Jmu/6NRO
 AnlmhgLZjaqxEwDwC3xLGClkGIGW7thoApEkHD7I6/DG5vG+iXpJ7bU1pwKAAtraUYho=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0QZk-004wAZ-Ie
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 14:59:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A01952339E;
 Fri, 15 Jan 2021 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610722771;
 bh=Ik1NuJKdacrlEixUtDe19QzuGeWMixLfuUqX1mnIO50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ya1VZrVQiAR5FhLobD+bmANbGND/ZpOFLCXPd09K3tLLmEn4UpkZwVeh9fncFzsby
 GF0o7rHYblreNcHU+vj9T5uj/LvTF8WvdY622DNCo92IzS723k2UBsrPfQv7YNpRC9
 2GcMkytd9/Lv7yuQ5udDVcaNyCakKll8/h+QspOc5jVDCyZ3mNXK331Xo+Ydrt5I6I
 8r+KjnPjT6/7wI3Jft1/pSCpK7OjniA2i8Xh7qTkOmtTfGAqPXorZFtsgKdLLyHKEv
 UHkooHNui/r1M9EeRUQqxIy80QFtAYn2s+idahRRue6GwBgOMvKdhES0C0oTm1LiEZ
 ZO3FqBxlZtnuQ==
Date: Fri, 15 Jan 2021 06:59:30 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YAGt0i244dWXym4H@google.com>
References: <cdd681ad-462d-cb37-2b4b-8f9d547bc718@huawei.com>
 <b44c2af4-d142-baff-387c-6b967f76065c@huawei.com>
 <X/0DxG+AcX54730W@google.com>
 <160f2cf9-73ca-18cd-6ad0-2498821b8db6@huawei.com>
 <X/4kYf11oyoMY8P+@google.com>
 <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
 <X/8UtJU9Dy30kC7I@google.com>
 <37ba41db-2589-e155-c416-d0c8832026cb@huawei.com>
 <X//DPI10+ZXvHkYH@google.com>
 <8e88b1e2-0176-9487-b925-9c7a31a7e5cd@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e88b1e2-0176-9487-b925-9c7a31a7e5cd@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0QZk-004wAZ-Ie
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/15, Chao Yu wrote:
> On 2021/1/14 12:06, Jaegeuk Kim wrote:
> > On 01/14, Chao Yu wrote:
> > > On 2021/1/13 23:41, Jaegeuk Kim wrote:
> > > > [58690.961685] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of f2fs_quota_write+0x150/0x1f0 [f2fs]
> > > > [58691.071481] F2FS-fs (vdb): Inconsistent error blkaddr:31058, sit bitmap:0
> > > > [58691.077338] ------------[ cut here ]------------
> > > > [58691.081461] WARNING: CPU: 5 PID: 8308 at fs/f2fs/checkpoint.c:151 f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
> > > > [58691.086734] Modules linked in: f2fs(O) quota_v2 quota_tree dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua ppdev intel_rapl_msr intel_rapl_common sb_edac kvm_intel kvm irqbypass joydev parport_pc parport input_leds serio_raw mac_hid qemu_fw_cfg sch_fq_codel ip_tables x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy asy
> > > > [58691.120632] CPU: 5 PID: 8308 Comm: kworker/u17:5 Tainted: G      D    O      5.11.0-rc3-custom #1
> > > > [58691.125438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
> > > > [58691.129625] Workqueue: f2fs_post_read_wq f2fs_post_read_work [f2fs]
> > > > [58691.133142] RIP: 0010:f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
> > > > [58691.136221] Code: 3c 07 b8 01 00 00 00 d3 e0 21 f8 75 57 83 fa 07 75 52 89 f2 31 c9 48 c7 c6 20 6a a7 c0 48 89 df e8 bc d6 03 00 f0 80 4b 48 04 <0f> 0b 31 c0 e9 5e fe ff ff 48 8b 57 10 8b 42 30 d3 e0 03 42 48 39
> > > > [58691.143142] RSP: 0018:ffffb429047afd40 EFLAGS: 00010206
> > > > [58691.145639] RAX: 0000000000000000 RBX: ffff9c3b84041000 RCX: 0000000000000000
> > > > [58691.148899] RDX: 0000000000000000 RSI: ffff9c3bbbd58940 RDI: ffff9c3bbbd58940
> > > > [58691.152130] RBP: ffffb429047afd48 R08: ffff9c3bbbd58940 R09: ffffb429047afaa8
> > > > [58691.155266] R10: 00000000001ba090 R11: 0000000000000003 R12: 0000000000007952
> > > > [58691.158304] R13: fffff5cc81266ac0 R14: 00000000000000db R15: 0000000000000000
> > > > [58691.161160] FS:  0000000000000000(0000) GS:ffff9c3bbbd40000(0000) knlGS:0000000000000000
> > > > [58691.164286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [58691.166869] CR2: 00007f0fee9d3000 CR3: 000000005ee76001 CR4: 0000000000370ee0
> > > > [58691.169714] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > [58691.173102] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > [58691.176163] Call Trace:
> > > > [58691.177948]  f2fs_cache_compressed_page+0x69/0x280 [f2fs]
> > > > [58691.180549]  ? newidle_balance+0x253/0x3d0
> > > > [58691.183238]  f2fs_end_read_compressed_page+0x5a/0x70 [f2fs]
> > > > [58691.188205]  f2fs_post_read_work+0x11d/0x120 [f2fs]
> > > > [58691.192489]  process_one_work+0x221/0x3a0
> > > > [58691.194482]  worker_thread+0x4d/0x3f0
> > > > [58691.198867]  kthread+0x114/0x150
> > > > [58691.202243]  ? process_one_work+0x3a0/0x3a0
> > > > [58691.205367]  ? kthread_park+0x90/0x90
> > > > [58691.208244]  ret_from_fork+0x22/0x30
> > > 
> > > Below patch fixes two issues, I expect this can fix above warning at least.
> > 
> > [106115.591837] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73: 0000 [#1] SMP PTI
> > [106115.595584] CPU: 3 PID: 10109 Comm: fsstress Tainted: G           O      5.11.0-rc3-custom #1
> > [106115.601087] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
> > [106115.601087] RIP: 0010:f2fs_read_multi_pages+0x415/0xa70 [f2fs]
> 
> Jaegeuk,
> 
> Could you please help to run:
> 
> gdb f2fs.ko
> (gdb) l *(f2fs_read_multi_pages+0x415)
> 
> to see where we hit the panic.

It's fs/f2fs/data.c:2203

2199                 goto out_put_dnode;
2200         }
2201
2202         for (i = 0; i < dic->nr_cpages; i++) {
2203                 struct page *page = dic->cpages[i];
2204                 block_t blkaddr;
2205                 struct bio_post_read_ctx *ctx;
2206
2207                 blkaddr = data_blkaddr(dn.inode, dn.node_page,
2208                                                 dn.ofs_in_node + i + 1);


> 
> Thanks,
> 
> > [106115.601087] Code: ff ff ff 45 31 ff f7 d0 25 00 00 08 00 89 45 80 48 8b 45 a0 48 83 c0 6c 48 89 85 78 ff ff ff 48 8b 7d a0 49 63 c7 48 8b 57 30 <48> 8b 1c c2 8b 45 c4 8d 50 01 48 8b 45 b8 48 2b 05 c6 55 92 dc 48
> > [106115.601087] RSP: 0018:ffffc0a4822f7710 EFLAGS: 00010206
> > [106115.620978] RAX: 0000000000000001 RBX: ffffe801820034c0 RCX: 0000000000200000
> > [106115.620978] RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc09487af RDI: ffff9bc1d87c4200
> > [106115.627351] RBP: ffffc0a4822f77c0 R08: 0000000000000000 R09: 0000000000000000
> > [106115.627351] R10: ffff9bc1d87c4200 R11: 0000000000000001 R12: 0000000000105343
> > [106115.627351] R13: ffff9bc2d2184000 R14: 0000000000000000 R15: 0000000000000001
> > [106115.635587] FS:  00007f188e909b80(0000) GS:ffff9bc2fbcc0000(0000) knlGS:0000000000000000
> > [106115.635587] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [106115.635587] CR2: 000056446d88b358 CR3: 00000000534b4002 CR4: 0000000000370ee0
> > [106115.635587] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [106115.635587] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [106115.635587] Call Trace:
> > [106115.635587]  f2fs_mpage_readpages+0x4e4/0xac0 [f2fs]
> > [106115.635587]  f2fs_readahead+0x47/0x90 [f2fs]
> > [106115.635587]  read_pages+0x8e/0x280
> > [106115.635587]  page_cache_ra_unbounded+0x11f/0x1f0
> > [106115.665909]  do_page_cache_ra+0x3d/0x40
> > [106115.670756]  ondemand_readahead+0x2c1/0x2e0
> > [106115.671682]  page_cache_sync_ra+0xd4/0xe0
> > [106115.675622]  generic_file_buffered_read_get_pages+0x126/0x8d0
> > [106115.679158]  generic_file_buffered_read+0x113/0x4a0
> > [106115.679158]  ? __filemap_fdatawrite_range+0xd8/0x110
> > [106115.685672]  ? __mark_inode_dirty+0x98/0x330
> > [106115.691168]  ? f2fs_direct_IO+0x80/0x6f0 [f2fs]
> > [106115.691168]  generic_file_read_iter+0xdf/0x140
> > [106115.691168]  f2fs_file_read_iter+0x34/0xb0 [f2fs]
> > [106115.699450]  aio_read+0xef/0x1b0
> > [106115.699450]  ? do_user_addr_fault+0x1b8/0x450
> > [106115.699450]  io_submit_one+0x217/0xbc0
> > [106115.699450]  ? io_submit_one+0x217/0xbc0
> > [106115.699450]  __x64_sys_io_submit+0x8d/0x180
> > [106115.699450]  ? __x64_sys_io_submit+0x8d/0x180
> > [106115.712018]  ? exit_to_user_mode_prepare+0x3d/0x1a0
> > [106115.717468]  do_syscall_64+0x38/0x90
> > [106115.723157]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > 
> > > 
> > > - detect truncation during f2fs_cache_compressed_page()
> > > - don't set PageUptodate for temporary page in f2fs_load_compressed_page()
> > > 
> > > From: Chao Yu <yuchao0@huawei.com>
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fs/f2fs/compress.c | 20 +++++++++++++-------
> > >   fs/f2fs/data.c     |  3 +--
> > >   fs/f2fs/f2fs.h     |  6 +++---
> > >   3 files changed, 17 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > index 0fec71e40001..f364c10c506c 100644
> > > --- a/fs/f2fs/compress.c
> > > +++ b/fs/f2fs/compress.c
> > > @@ -1741,7 +1741,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   	if (!test_opt(sbi, COMPRESS_CACHE))
> > >   		return;
> > > 
> > > -	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
> > > +	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
> > >   		return;
> > > 
> > >   	si_meminfo(&si);
> > > @@ -1774,21 +1774,25 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   		return;
> > >   	}
> > > 
> > > -	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
> > > -	SetPageUptodate(cpage);
> > > -
> > >   	f2fs_set_page_private(cpage, ino);
> > > 
> > > +	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
> > > +		goto out;
> > > +
> > > +	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
> > > +	SetPageUptodate(cpage);
> > > +out:
> > >   	f2fs_put_page(cpage, 1);
> > >   }
> > > 
> > > -void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > > +bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   								block_t blkaddr)
> > >   {
> > >   	struct page *cpage;
> > > +	bool hitted = false;
> > > 
> > >   	if (!test_opt(sbi, COMPRESS_CACHE))
> > > -		return;
> > > +		return false;
> > > 
> > >   	cpage = f2fs_pagecache_get_page(COMPRESS_MAPPING(sbi),
> > >   				blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS);
> > > @@ -1797,10 +1801,12 @@ void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   			atomic_inc(&sbi->compress_page_hit);
> > >   			memcpy(page_address(page),
> > >   				page_address(cpage), PAGE_SIZE);
> > > -			SetPageUptodate(page);
> > > +			hitted = true;
> > >   		}
> > >   		f2fs_put_page(cpage, 1);
> > >   	}
> > > +
> > > +	return hitted;
> > >   }
> > > 
> > >   void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
> > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > index b3973494b102..3705c272b76a 100644
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -2211,8 +2211,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> > >   		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> > >   						dn.ofs_in_node + i + 1);
> > > 
> > > -		f2fs_load_compressed_page(sbi, page, blkaddr);
> > > -		if (PageUptodate(page)) {
> > > +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
> > >   			if (atomic_dec_and_test(&dic->remaining_pages))
> > >   				f2fs_decompress_cluster(dic);
> > >   			continue;
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 9f79a6825f06..b807970d67b1 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -3951,7 +3951,7 @@ struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
> > >   void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
> > >   void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   						nid_t ino, block_t blkaddr);
> > > -void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > > +bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > >   								block_t blkaddr);
> > >   void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
> > >   #else
> > > @@ -3990,8 +3990,8 @@ static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
> > >   				block_t blkaddr) { }
> > >   static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
> > >   				struct page *page, nid_t ino, block_t blkaddr) { }
> > > -static inline void f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
> > > -				struct page *page, block_t blkaddr) { }
> > > +static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
> > > +				struct page *page, block_t blkaddr) { return false; }
> > >   static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
> > >   							nid_t ino) { }
> > >   #endif
> > > -- 
> > > 2.29.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
