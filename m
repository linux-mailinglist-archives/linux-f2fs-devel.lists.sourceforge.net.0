Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6BC99314
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjJZA68/cn8Yyz8xUj0bLtPSW1lhTBuXfR7Cc1Ygk98=; b=ch8PjFfJ8qoOzjI7shl7LYQAL8
	SRnLHLkct8j1P8ylJLnkrEQp4eVPJ1HsRk6WzrJzH4ejwAYWHkk+ynMNZOoWZNbUBqOQMEK34f0UB
	uoljb1LVCPfg/4Y/m9X1MO7KPdKvelYCinGyFFrgjyDcDuc+Y9oVAzlPXvgx47OldCbo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBaW-0006gO-AQ;
	Mon, 01 Dec 2025 21:37:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQBaV-0006gH-6J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3CBYyM11iwp1hl06sI141D8RUrEjm/H5vw8E72easE=; b=OuKBk6sXQN9jDky2B1oYDw00K0
 oVAECKuP1KIYgG3T60VTV6GUjwq6zOX4m3zus3VXrUUE4LimNBMg0yicmOJj7kJutR6A375q7qVhk
 8jHMUlAf6W2dfpRymPre5lKZcsvUONNuI6KO0VqcYJ6atPtA2YVTex+TbO4LgZoIq998=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h3CBYyM11iwp1hl06sI141D8RUrEjm/H5vw8E72easE=; b=DhtLFBu9x3Xjt7DL5cIoK08HEF
 nYMqLYdRoT9t5gbwR3LyHN2DcEXp2AYRiQ8R7ELJb3Wo/O/5FUXG619DNLPdLVbKdMm3aCa+h7dPN
 v0dW33V9YRyGqU5goPBIo7jFbqp4NNnhSOR7hKH+5WtFQHcvZwblPuVYP1sFRA9FJ0jw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBaU-0003qy-58 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2AC60152
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 21:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8341C4CEF1;
 Mon,  1 Dec 2025 21:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764625052;
 bh=kyRsfkhokmqdntv/utmuy1Wd0O6Ks0EaBmYtBGUN5TI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iJ/VG6eRtfyfhJqtAnEJjffhtej+Tit2UzgTcNkzyInX6NbJY54d6HR3qwdKnHHLD
 SDWBgJGR3e+TiXRROp4OPyN5e+0ZHsKGalWUwr7HOadAYAU4LytygaNm84YLWx3X90
 0oJjTbtmeJA1t0nZbvfHEky3f/djkuQAjh/NY5CFJ9PFIWxnQOaxyt9rfpqRjGBuHF
 tdFn2LaF7CNogvFKzc4z7gJvUQLZ8/tYWb0+efEgm9i1dX9kwD8iumewObul2VG2Qt
 YkamOENqXSED8mZte0qdkqmWb+RWRJTqwf/DD71X+VuW7Uy3cBCPkHs0UnJPQpT2vF
 psia3ofNPM8PQ==
Message-ID: <b7ccf2fd-0124-495c-b403-30bb4d34054e@kernel.org>
Date: Mon, 1 Dec 2025 13:37:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com>
Content-Language: en-US
In-Reply-To: <aS3s98fgy80_xDuK@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 03:31, Jaegeuk Kim wrote: > This patch enables
 large folio for limited case where we can get the high-order > memory
 allocation.
 It supports the encrypted and fsverity files, which are > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQBaU-0003qy-58
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: support large folio for
 immutable non-compressed case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 03:31, Jaegeuk Kim wrote:
> This patch enables large folio for limited case where we can get the high-order
> memory allocation. It supports the encrypted and fsverity files, which are
> essential for Android environment.
> 
> How to test:
> - dd if=/dev/zero of=/mnt/test/test bs=1G count=4
> - f2fs_io setflags immutable /mnt/test/test
> - echo 3 > /proc/sys/vm/drop_caches
>   : to reload inode with large folio
> - f2fs_io read 32 0 1024 mmap 0 0 /mnt/test/test

How about adding large folio usage in f2fs documentation for user guidance?
including how to enable/disable large folio feature in file.

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   Change log from v1:
>    - return error when trying open an inode having large folio
> 
>   fs/f2fs/data.c  | 247 ++++++++++++++++++++++++++++++++++++++++++++++--
>   fs/f2fs/f2fs.h  |  16 ++++
>   fs/f2fs/file.c  |   4 +
>   fs/f2fs/inode.c |   6 +-
>   4 files changed, 263 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 48c20386f031..acc4ef511bfb 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -31,9 +31,15 @@
>   
>   static struct kmem_cache *bio_post_read_ctx_cache;
>   static struct kmem_cache *bio_entry_slab;
> +static struct kmem_cache *ffs_entry_slab;
>   static mempool_t *bio_post_read_ctx_pool;
>   static struct bio_set f2fs_bioset;
>   
> +struct f2fs_folio_state {
> +	spinlock_t		state_lock;
> +	unsigned int		read_pages_pending;
> +};
> +
>   #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
>   
>   int __init f2fs_init_bioset(void)
> @@ -138,11 +144,15 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   {
>   	struct folio_iter fi;
>   	struct bio_post_read_ctx *ctx = bio->bi_private;
> +	unsigned long flags;
>   
>   	bio_for_each_folio_all(fi, bio) {
>   		struct folio *folio = fi.folio;
> +		unsigned nr_pages = fi.length >> PAGE_SHIFT;
> +		bool finished = true;
>   
> -		if (f2fs_is_compressed_page(folio)) {
> +		if (!folio_test_large(folio) &&
> +		    f2fs_is_compressed_page(folio)) {
>   			if (ctx && !ctx->decompression_attempted)
>   				f2fs_end_read_compressed_page(folio, true, 0,
>   							in_task);
> @@ -156,8 +166,20 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   				bio->bi_status = BLK_STS_IOERR;
>   		}
>   
> -		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
> -		folio_end_read(folio, bio->bi_status == BLK_STS_OK);
> +		if (folio_test_large(folio)) {
> +			struct f2fs_folio_state *ffs = folio->private;
> +
> +			spin_lock_irqsave(&ffs->state_lock, flags);
> +			ffs->read_pages_pending -= nr_pages;
> +			finished = !ffs->read_pages_pending;
> +			spin_unlock_irqrestore(&ffs->state_lock, flags);
> +		}
> +
> +		while (nr_pages--)
> +			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
> +
> +		if (finished)
> +			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
>   	}
>   
>   	if (ctx)
> @@ -518,6 +540,9 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
>   void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
>   				 enum page_type type)
>   {
> +	if (!bio)
> +		return;
> +
>   	WARN_ON_ONCE(!is_read_io(bio_op(bio)));
>   	trace_f2fs_submit_read_bio(sbi->sb, type, bio);
>   
> @@ -1209,11 +1234,21 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>   	struct dnode_of_data dn;
>   	struct folio *folio;
>   	int err;
> -
> +retry:
>   	folio = f2fs_grab_cache_folio(mapping, index, for_write);
>   	if (IS_ERR(folio))
>   		return folio;
>   
> +	if (folio_test_large(folio)) {
> +		pgoff_t folio_index = mapping_align_index(mapping, index);
> +
> +		f2fs_folio_put(folio, true);
> +		invalidate_inode_pages2_range(mapping, folio_index,
> +				folio_index + folio_nr_pages(folio) - 1);
> +		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +		goto retry;
> +	}
> +
>   	if (f2fs_lookup_read_extent_cache_block(inode, index,
>   						&dn.data_blkaddr)) {
>   		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
> @@ -2341,6 +2376,179 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   }
>   #endif
>   
> +static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
> +{
> +	struct f2fs_folio_state *ffs = folio->private;
> +
> +	if (ffs)
> +		return ffs;
> +
> +	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO, true, NULL);
> +
> +	spin_lock_init(&ffs->state_lock);
> +	folio_attach_private(folio, ffs);
> +	return ffs;
> +}
> +
> +static void ffs_detach_free(struct folio *folio)
> +{
> +	struct f2fs_folio_state *ffs;
> +
> +	if (!folio_test_large(folio)) {
> +		folio_detach_private(folio);
> +		return;
> +	}
> +
> +	ffs = folio_detach_private(folio);
> +	if (!ffs)
> +		return;
> +
> +	WARN_ON_ONCE(ffs->read_pages_pending != 0);
> +	kmem_cache_free(ffs_entry_slab, ffs);
> +}
> +
> +static int f2fs_read_data_large_folio(struct inode *inode,
> +		struct readahead_control *rac, struct folio *folio)
> +{
> +	struct bio *bio = NULL;
> +	sector_t last_block_in_bio = 0;
> +	struct f2fs_map_blocks map = {0, };
> +	pgoff_t index, offset;
> +	unsigned max_nr_pages = rac ? readahead_count(rac) :
> +				folio_nr_pages(folio);
> +	unsigned nrpages;
> +	struct f2fs_folio_state *ffs;
> +	int ret = 0;
> +
> +	if (!IS_IMMUTABLE(inode))
> +		return -EOPNOTSUPP;
> +
> +	if (f2fs_compressed_file(inode))
> +		return -EOPNOTSUPP;
> +
> +	map.m_seg_type = NO_CHECK_TYPE;
> +
> +	if (rac)
> +		folio = readahead_folio(rac);
> +next_folio:
> +	if (!folio)
> +		goto out;
> +
> +	index = folio->index;
> +	offset = 0;
> +	ffs = NULL;
> +	nrpages = folio_nr_pages(folio);
> +
> +	for (; nrpages; nrpages--) {
> +		sector_t block_nr;
> +		/*
> +		 * Map blocks using the previous result first.
> +		 */
> +		if ((map.m_flags & F2FS_MAP_MAPPED) &&
> +				index > map.m_lblk &&
> +				index < (map.m_lblk + map.m_len))
> +			goto got_it;
> +
> +		/*
> +		 * Then do more f2fs_map_blocks() calls until we are
> +		 * done with this page.
> +		 */
> +		memset(&map, 0, sizeof(map));
> +		map.m_seg_type = NO_CHECK_TYPE;
> +		map.m_lblk = index;
> +		map.m_len = max_nr_pages;
> +
> +		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
> +		if (ret)
> +			goto err_out;
> +got_it:
> +		if ((map.m_flags & F2FS_MAP_MAPPED)) {
> +			block_nr = map.m_pblk + index - map.m_lblk;
> +			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> +						DATA_GENERIC_ENHANCE_READ)) {
> +				ret = -EFSCORRUPTED;
> +				goto err_out;
> +			}
> +		} else {
> +			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
> +			if (f2fs_need_verity(inode, index) &&
> +			    !fsverity_verify_page(folio_file_page(folio,
> +								index))) {
> +				ret = -EIO;
> +				goto err_out;
> +			}
> +			continue;
> +		}
> +
> +		/*
> +		 * This page will go to BIO.  Do we need to send this
> +		 * BIO off first?
> +		 */
> +		if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
> +						last_block_in_bio, block_nr) ||
> +			!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
> +submit_and_realloc:
> +			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> +			bio = NULL;
> +		}
> +		if (bio == NULL)
> +			bio = f2fs_grab_read_bio(inode, block_nr,
> +					max_nr_pages,
> +					f2fs_ra_op_flags(rac),
> +					index, false);
> +
> +		/*
> +		 * If the page is under writeback, we need to wait for
> +		 * its completion to see the correct decrypted data.
> +		 */
> +		f2fs_wait_on_block_writeback(inode, block_nr);
> +
> +		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
> +					offset << PAGE_SHIFT))
> +			goto submit_and_realloc;
> +
> +		if (folio_test_large(folio)) {
> +			ffs = ffs_find_or_alloc(folio);
> +
> +			/* set the bitmap to wait */
> +			spin_lock_irq(&ffs->state_lock);
> +			ffs->read_pages_pending++;
> +			spin_unlock_irq(&ffs->state_lock);
> +		}
> +
> +		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> +		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
> +				F2FS_BLKSIZE);
> +		last_block_in_bio = block_nr;
> +		index++;
> +		offset++;
> +	}
> +	if (rac) {
> +		folio = readahead_folio(rac);
> +		goto next_folio;
> +	}
> +err_out:
> +	/* Nothing was submitted. */
> +	if (!bio) {
> +		if (!ret)
> +			folio_mark_uptodate(folio);
> +		folio_unlock(folio);
> +		return ret;
> +	}
> +
> +	if (ret) {
> +		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> +
> +		/* Wait bios and clear uptodate. */
> +		folio_lock(folio);
> +		folio_clear_uptodate(folio);
> +		folio_unlock(folio);
> +	}
> +out:
> +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> +	return ret;
> +}
> +
>   /*
>    * This function was originally taken from fs/mpage.c, and customized for f2fs.
>    * Major change was from block_size == page_size in f2fs by default.
> @@ -2366,9 +2574,13 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   	pgoff_t index;
>   #endif
>   	unsigned nr_pages = rac ? readahead_count(rac) : 1;
> +	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
>   	unsigned max_nr_pages = nr_pages;
>   	int ret = 0;
>   
> +	if (mapping_large_folio_support(mapping))
> +		return f2fs_read_data_large_folio(inode, rac, folio);
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	if (f2fs_compressed_file(inode)) {
>   		index = rac ? readahead_index(rac) : folio->index;
> @@ -2459,8 +2671,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   		}
>   #endif
>   	}
> -	if (bio)
> -		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>   	return ret;
>   }
>   
> @@ -3747,7 +3958,12 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
>   			f2fs_remove_dirty_inode(inode);
>   		}
>   	}
> -	folio_detach_private(folio);
> +
> +	if (offset || length != folio_size(folio))
> +		return;
> +
> +	folio_cancel_dirty(folio);
> +	ffs_detach_free(folio);
>   }
>   
>   bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> @@ -3756,7 +3972,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
>   	if (folio_test_dirty(folio))
>   		return false;
>   
> -	folio_detach_private(folio);
> +	ffs_detach_free(folio);
>   	return true;
>   }
>   
> @@ -4162,12 +4378,25 @@ int __init f2fs_init_bio_entry_cache(void)
>   {
>   	bio_entry_slab = f2fs_kmem_cache_create("f2fs_bio_entry_slab",
>   			sizeof(struct bio_entry));
> -	return bio_entry_slab ? 0 : -ENOMEM;
> +
> +	if (!bio_entry_slab)
> +		return -ENOMEM;
> +
> +	ffs_entry_slab = f2fs_kmem_cache_create("f2fs_ffs_slab",
> +			sizeof(struct f2fs_folio_state));
> +
> +	if (!ffs_entry_slab) {
> +		kmem_cache_destroy(bio_entry_slab);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
>   }
>   
>   void f2fs_destroy_bio_entry_cache(void)
>   {
>   	kmem_cache_destroy(bio_entry_slab);
> +	kmem_cache_destroy(ffs_entry_slab);
>   }
>   
>   static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5f104518c414..71adfacaca45 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4921,6 +4921,22 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
>   	return false;
>   }
>   
> +static inline bool f2fs_quota_file(struct inode *inode)
> +{
> +#ifdef CONFIG_QUOTA
> +	int i;
> +
> +	if (!f2fs_sb_has_quota_ino(F2FS_I_SB(inode)))
> +		return false;
> +
> +	for (i = 0; i < MAXQUOTAS; i++) {
> +		if (f2fs_qf_ino(F2FS_I_SB(inode)->sb, i) == inode->i_ino)
> +			return true;
> +	}
> +#endif
> +	return false;
> +}
> +
>   static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
>   {
>   	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d7047ca6b98d..e75e61ac50d7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -624,6 +624,10 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>   	if (!f2fs_is_compress_backend_ready(inode))
>   		return -EOPNOTSUPP;
>   
> +	if (mapping_large_folio_support(inode->i_mapping) &&
> +	    filp->f_mode & FMODE_WRITE)
> +		return -EOPNOTSUPP;
> +
>   	err = fsverity_file_open(inode, filp);
>   	if (err)
>   		return err;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index e2405b79b3cc..9162154d5211 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -597,6 +597,8 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   	if (ret)
>   		goto bad_inode;
>   make_now:
> +	f2fs_set_inode_flags(inode);
> +
>   	if (ino == F2FS_NODE_INO(sbi)) {
>   		inode->i_mapping->a_ops = &f2fs_node_aops;
>   		mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
> @@ -618,6 +620,9 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   		inode->i_op = &f2fs_file_inode_operations;
>   		inode->i_fop = &f2fs_file_operations;
>   		inode->i_mapping->a_ops = &f2fs_dblock_aops;
> +		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
> +		    !f2fs_quota_file(inode))
> +			mapping_set_folio_min_order(inode->i_mapping, 0);
>   	} else if (S_ISDIR(inode->i_mode)) {
>   		inode->i_op = &f2fs_dir_inode_operations;
>   		inode->i_fop = &f2fs_dir_operations;
> @@ -638,7 +643,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   		ret = -EIO;
>   		goto bad_inode;
>   	}
> -	f2fs_set_inode_flags(inode);
>   
>   	unlock_new_inode(inode);
>   	trace_f2fs_iget(inode);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
