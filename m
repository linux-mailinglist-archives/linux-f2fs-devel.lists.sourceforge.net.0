Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B0331B3B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 01:02:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJPp2-0001FT-BX; Tue, 09 Mar 2021 00:02:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lJPp0-0001FL-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 00:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apaq8xTeaBG3VIxr4GFVUSZ6qmwvFWJ1cN6BtfBN4G4=; b=lZoI4dT4KYiD5mz9X6ft0bHCks
 Bnh30vhIwI4ocdbDIuzU9aEpINpLWhvwx2pphDLGQtMxkgccNbALnqrVfiCGRi3KiZLqbM09D7GxU
 xXJnm3Asxkjnbdz2RTLMOfT3zSwSSaalJqNFZEluLnQb9V8DfnNx1x5iEDHixQh1u4RI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=apaq8xTeaBG3VIxr4GFVUSZ6qmwvFWJ1cN6BtfBN4G4=; b=h7RMB17UMX4tUq6fnKlvipFbAR
 UzA7jAJSJ7mcrc6v1k2cdcQDy/D02sOjFQao0aAasQ/yD8vyizbYX3PrJkRWdkQU39o9GSj9sjuD6
 K7cvXTJ3aKF1/Wd1QhGf/EMLRWCFxDLPZ6vwBHiWFBj8lWP9jaTBl1dmXOEw5I7CFAoE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lJPou-002E5U-2O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 00:01:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B7C16527E;
 Tue,  9 Mar 2021 00:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615248106;
 bh=xeqxDdYK18R1n0feuHusfVZYz5TdTUy3aLCw7hpI/SU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OijRaZoB4HY4hVZ5/77kt8rRf822M9ZQxDr4dVHscKtagt8fBfPrPFGGvXJQKZ+0A
 J3M+U5FlKM67MfX8dHKQ3bIbPM9wVPh5l0kikHcSDWEcyZhXH7Llh5B+vKurotCpHs
 2QCYD5Tdi8B8mg9CLbfYjbcbk0mJBaqxgF2UWaqnSmMojKtt6ZXrSiCGq0KBwi8tsh
 Xaie7EQcsCaQTvkfREgQD86GDQ0F3kjpYCuYVP0WHrv0HHJ0hv1pcMjYl2qnh3VNfp
 40TXVV1fZVpjOherMMf/CE6T3wn6yOY5qqsopJxuySACLukJPybQF0t2QA7k2yb29O
 no+jZBWRC8g2A==
Date: Mon, 8 Mar 2021 16:01:45 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YEa66ekikyuPWSyd@google.com>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lJPou-002E5U-2O
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 03/05, Chao Yu wrote:
> On 2021/3/5 4:20, Jaegeuk Kim wrote:
> > On 02/27, Jaegeuk Kim wrote:
> > > On 02/04, Chao Yu wrote:
> > > > Jaegeuk,
> > > > 
> > > > On 2021/2/2 16:00, Chao Yu wrote:
> > > > > -	for (i = 0; i < dic->nr_cpages; i++) {
> > > > > +	for (i = 0; i < cc->nr_cpages; i++) {
> > > > >    		struct page *page = dic->cpages[i];
> > > > 
> > > > por_fsstress still hang in this line?
> > > 
> > > I'm stuck on testing the patches, since the latest kernel is panicking somehow.
> > > Let me update later, once I can test a bit. :(
> > 
> > It seems this works without error.
> > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
> 
> Ah, good news.
> 
> Thanks for helping to test the patch. :)

Hmm, I hit this again. Let me check w/o compress_cache back. :(

[159210.201131] ------------[ cut here ]------------
[159210.204241] kernel BUG at fs/f2fs/compress.c:1082!
[159210.207321] invalid opcode: 0000 [#1] SMP PTI
[159210.209407] CPU: 4 PID: 2753477 Comm: kworker/u16:2 Tainted: G           OE     5.12.0-rc1-custom #1
[159210.212737] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
[159210.224800] Workqueue: writeback wb_workfn (flush-252:16)
[159210.226851] RIP: 0010:prepare_compress_overwrite+0x4c0/0x760 [f2fs]
[159210.229506] Code: 8b bf 90 0a 00 00 be 40 0d 00 00 e8 4a 92 4f c4 49 89 44 24 18 48 85 c0 0f 84 85 02 00 00 41 8b 54 24 10 e9 c5 fb ff ff 0f 0b <0f> 0b 41 8b 44 24 20 85 c0 0f 84 2a ff ff ff 48 8
[159210.236311] RSP: 0018:ffff9fa782177858 EFLAGS: 00010246
[159210.238517] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[159210.240734] RDX: 000000000000001c RSI: 0000000000000000 RDI: 0000000000000000
[159210.242941] RBP: ffff9fa7821778f0 R08: ffff93b9c89cb232 R09: 0000000000000003
[159210.245107] R10: ffffffff86873420 R11: 0000000000000001 R12: ffff9fa782177900
[159210.247319] R13: ffff93b906dca578 R14: 000000000000031c R15: 0000000000000000
[159210.249492] FS:  0000000000000000(0000) GS:ffff93b9fbd00000(0000) knlGS:0000000000000000
[159210.254724] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[159210.258709] CR2: 00007f0367d33738 CR3: 000000012bc0c004 CR4: 0000000000370ee0
[159210.261608] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[159210.264614] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[159210.267476] Call Trace:
[159210.269075]  ? f2fs_compress_write_end+0xa2/0x100 [f2fs]
[159210.271165]  f2fs_prepare_compress_overwrite+0x5f/0x80 [f2fs]
[159210.273017]  f2fs_write_cache_pages+0x468/0x8a0 [f2fs]
[159210.274848]  f2fs_write_data_pages+0x2a4/0x2f0 [f2fs]
[159210.276612]  ? from_kgid+0x12/0x20
[159210.277994]  ? f2fs_update_inode+0x3cb/0x510 [f2fs]
[159210.279748]  do_writepages+0x38/0xc0
[159210.281183]  ? f2fs_write_inode+0x11c/0x300 [f2fs]
[159210.282877]  __writeback_single_inode+0x44/0x2a0
[159210.284526]  writeback_sb_inodes+0x223/0x4d0
[159210.286105]  __writeback_inodes_wb+0x56/0xf0
[159210.287740]  wb_writeback+0x1dd/0x290
[159210.289182]  wb_workfn+0x309/0x500
[159210.290553]  process_one_work+0x220/0x3c0
[159210.292048]  worker_thread+0x53/0x420
[159210.293403]  kthread+0x12f/0x150
[159210.294716]  ? process_one_work+0x3c0/0x3c0
[159210.296204]  ? __kthread_bind_mask+0x70/0x70
[159210.297702]  ret_from_fork+0x22/0x30


> 
> Thanks,
> 
> > 
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > >    		block_t blkaddr;
> > > > >    		struct bio_post_read_ctx *ctx;
> > > > > @@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> > > > >    		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> > > > >    						dn.ofs_in_node + i + 1);
> > > > > +		f2fs_wait_on_block_writeback(inode, blkaddr);
> > > > > +
> > > > > +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
> > > > > +			if (atomic_dec_and_test(&dic->remaining_pages))
> > > > > +				f2fs_decompress_cluster(dic);
> > > > > +			continue;
> > > > > +		}
> > > > > +
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
