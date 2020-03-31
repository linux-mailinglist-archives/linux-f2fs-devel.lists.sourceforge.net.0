Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C0198AB1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 05:55:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJ80L-0008Uy-HN; Tue, 31 Mar 2020 03:55:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jJ80H-0008Uf-2v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 03:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GME74zyoFb5YJQa71VFenwsdy2uDNCSk+RSlLHO/clk=; b=AMOHADyX2okrSonmGzP3WX3fHV
 0dYkUrdowGmN229EE+vLhqs/lEU5geI3tvg/X8xOc6McNp6W/Q0AvEb4Ljr79bw+BflDPuMizAPRH
 0dwmcCzPiLmsmoPgiGsMwuncf+VW62N8sag+UBnw5xjXlY+Gpj/Qff53Rfrl5EbNdvLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GME74zyoFb5YJQa71VFenwsdy2uDNCSk+RSlLHO/clk=; b=i8aZrW/jyjfdImwSFcdRDqODi5
 zJFXnhypAE/0Sy/sTJy/cGWcVMOimK2R5sAa0iBfKBFMFENj00ji/0PMDVFrrQ4tCH4KUpddeTQcI
 uByXM1zdVec0AE8dotg9sYe0DNSq+ETHCRQ0KpnAzY7Xe+LVm6KHp1w/lOafocDXNMPA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJ80C-00GIaL-8x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 03:55:52 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF4802072D;
 Tue, 31 Mar 2020 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585626937;
 bh=fF6TSlgWxsY6znxycH05tV8uo9ST8k5HuEb//N9tG8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TY3vUDa9VITnTr8J9rMGyfT8o0c9XOJPRRTmzrISz+Iq2py8GjYwVxk0RdR0eMhv9
 XeFnw/m0POZm8xBUvZetblM2lIzOCQwHwOUfoWwJyjq/Plm+fftXiTi3lWFvi40A8K
 1szIvkN3SFc6PBpFMU8Hiedj0nYfGwzuTUQOudFo=
Date: Mon, 30 Mar 2020 20:55:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200331035537.GC79749@google.com>
References: <20200330100349.56127-1-yuchao0@huawei.com>
 <20200330184230.GB34947@google.com>
 <2b5ec2a6-218a-a291-a6fc-d87cd40be4db@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b5ec2a6-218a-a291-a6fc-d87cd40be4db@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jJ80C-00GIaL-8x
Subject: Re: [f2fs-dev] [PATCH] f2fs: use round_up()/DIV_ROUND_UP()
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

On 03/31, Chao Yu wrote:
> On 2020/3/31 2:42, Jaegeuk Kim wrote:
> > On 03/30, Chao Yu wrote:
> >> .i_cluster_size should be power of 2, so we can use round_up() instead
> >> of roundup() to enhance the calculation.
> >>
> >> In addition, use DIV_ROUND_UP to clean up codes.
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/data.c | 16 ++++++----------
> >>  fs/f2fs/file.c | 17 +++++------------
> >>  2 files changed, 11 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >> index 0a829a89f596..8257d5e7aa3b 100644
> >> --- a/fs/f2fs/data.c
> >> +++ b/fs/f2fs/data.c
> >> @@ -1969,8 +1969,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
> >>  					bool is_readahead)
> >>  {
> >>  	struct bio *bio = *bio_ret;
> >> -	const unsigned blkbits = inode->i_blkbits;
> >> -	const unsigned blocksize = 1 << blkbits;
> >>  	sector_t block_in_file;
> >>  	sector_t last_block;
> >>  	sector_t last_block_in_file;
> >> @@ -1979,8 +1977,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
> >>  
> >>  	block_in_file = (sector_t)page_index(page);
> >>  	last_block = block_in_file + nr_pages;
> >> -	last_block_in_file = (f2fs_readpage_limit(inode) + blocksize - 1) >>
> >> -							blkbits;
> >> +	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
> >> +								PAGE_SIZE);
> > 
> > What if PAGE_SIZE is bigger than 4KB?
> 
> We don't support 8kb+ sized-page, right?

That's only assumption below. I don't think we can just replace block with PAGE
in every places.

> 
> static int __init init_f2fs_fs(void)
> {
> 	int err;
> 
> 	if (PAGE_SIZE != F2FS_BLKSIZE) {
> 		printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
> 				PAGE_SIZE, F2FS_BLKSIZE);
> 		return -EINVAL;
> 	}
> 
> Thanks,
> 
> > 
> >>  	if (last_block > last_block_in_file)
> >>  		last_block = last_block_in_file;
> >>  
> >> @@ -2062,7 +2060,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
> >>  	 */
> >>  	f2fs_wait_on_block_writeback(inode, block_nr);
> >>  
> >> -	if (bio_add_page(bio, page, blocksize, 0) < blocksize)
> >> +	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
> >>  		goto submit_and_realloc;
> >>  
> >>  	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> >> @@ -2091,16 +2089,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >>  	struct bio *bio = *bio_ret;
> >>  	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
> >>  	sector_t last_block_in_file;
> >> -	const unsigned blkbits = inode->i_blkbits;
> >> -	const unsigned blocksize = 1 << blkbits;
> >>  	struct decompress_io_ctx *dic = NULL;
> >>  	int i;
> >>  	int ret = 0;
> >>  
> >>  	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
> >>  
> >> -	last_block_in_file = (f2fs_readpage_limit(inode) +
> >> -					blocksize - 1) >> blkbits;
> >> +	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
> >> +								PAGE_SIZE);
> >>  
> >>  	/* get rid of pages beyond EOF */
> >>  	for (i = 0; i < cc->cluster_size; i++) {
> >> @@ -2197,7 +2193,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >>  
> >>  		f2fs_wait_on_block_writeback(inode, blkaddr);
> >>  
> >> -		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
> >> +		if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
> >>  			goto submit_and_realloc;
> >>  
> >>  		inc_page_count(sbi, F2FS_RD_DATA);
> >> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >> index c2d38a1c4972..0f8be076620c 100644
> >> --- a/fs/f2fs/file.c
> >> +++ b/fs/f2fs/file.c
> >> @@ -736,16 +736,9 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> >>  	 * for compressed file, only support cluster size
> >>  	 * aligned truncation.
> >>  	 */
> >> -	if (f2fs_compressed_file(inode)) {
> >> -		size_t cluster_shift = PAGE_SHIFT +
> >> -					F2FS_I(inode)->i_log_cluster_size;
> >> -		size_t cluster_mask = (1 << cluster_shift) - 1;
> >> -
> >> -		free_from = from >> cluster_shift;
> >> -		if (from & cluster_mask)
> >> -			free_from++;
> >> -		free_from <<= cluster_shift;
> >> -	}
> >> +	if (f2fs_compressed_file(inode))
> >> +		free_from = round_up(from,
> >> +				F2FS_I(inode)->i_cluster_size << PAGE_SHIFT);
> >>  #endif
> >>  
> >>  	err = f2fs_do_truncate_blocks(inode, free_from, lock);
> >> @@ -3537,7 +3530,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> >>  
> >>  		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> >>  		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
> >> -		count = roundup(count, F2FS_I(inode)->i_cluster_size);
> >> +		count = round_up(count, F2FS_I(inode)->i_cluster_size);
> >>  
> >>  		ret = release_compress_blocks(&dn, count);
> >>  
> >> @@ -3689,7 +3682,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
> >>  
> >>  		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> >>  		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
> >> -		count = roundup(count, F2FS_I(inode)->i_cluster_size);
> >> +		count = round_up(count, F2FS_I(inode)->i_cluster_size);
> >>  
> >>  		ret = reserve_compress_blocks(&dn, count);
> >>  
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
