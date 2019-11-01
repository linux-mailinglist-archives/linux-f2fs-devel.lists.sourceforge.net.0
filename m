Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48050EC0F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 11:02:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQTl7-0007Yy-MZ; Fri, 01 Nov 2019 10:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iQTl6-0007Yr-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 10:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmnKKUuOzyssZ85M/17mNaicfQy9Iq+sxXpy1cMv3/s=; b=NM65M9Hx5tCBvTH18wq0ZulgnA
 PVHxcQxFxqwzLMijkD9g9Einj8v9OIKDskFFV558h7riXPzwa5rxV0Yctnu/AfDDbLPZkwRIUZSOw
 af1bHl2BWA3lJ6DdJj5c9kzAVs46aJHy9LuFflOZNIqlNnvxLSk0DgdRUKWXtoNhafCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MmnKKUuOzyssZ85M/17mNaicfQy9Iq+sxXpy1cMv3/s=; b=V9w0/KXZitLWdI4iLGmC2i/Zbb
 B28b5ZwyZfNO+zFS+iRDHCvsteGnZJ9BWJ6klITfTTNK2n+Odv7fFK79w8EdxRwh1uvRuDY+fxGYM
 8ASNejpUpUWOPjK6NHjPv/oiZNqM1wZiSMTI5Dxx8IWUztFFBlfzCm7P6l0Yh6BJYTEo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQTl4-00CKrW-7T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 10:02:20 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AC3E763A57DF29D7BE31;
 Fri,  1 Nov 2019 18:02:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019
 18:02:09 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030165056.GA693@sol.localdomain>
 <a2586ef0-9f0d-d2e1-ecf0-e6e946c20a7a@huawei.com>
 <20191031153521.GB60005@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <966d94fa-fd5e-e5c4-b7e3-761b193fd5c4@huawei.com>
Date: Fri, 1 Nov 2019 18:02:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191031153521.GB60005@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iQTl4-00CKrW-7T
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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

Hi Jaegeuk,

On 2019/10/31 23:35, Jaegeuk Kim wrote:
> Hi Chao,
> 
> On 10/31, Chao Yu wrote:
>> On 2019/10/31 0:50, Eric Biggers wrote:
>>> No, just use kvmalloc().  The whole point of kvmalloc() is that it tries
>>> kmalloc() and then falls back to vmalloc() if it fails.
>>
>> Okay, it's fine to me, let me fix this in another patch.
> 
> I've fixed some bugs. (e.g., mmap) Please apply this in your next patch, so that
> I can continue to test new version as early as possible.

Applied with some fixes as below comments.

> 
> With this patch, I could boot up a device and install some apps successfully
> with "compress_extension=*".

Ah, '*' can trigger big pressure on compression paths.

> 
> ---
>  fs/f2fs/compress.c | 229 +++++++++++++++++++++++----------------------
>  fs/f2fs/data.c     | 109 +++++++++++++--------
>  fs/f2fs/f2fs.h     |  22 +++--
>  fs/f2fs/file.c     |  71 +++++++++-----
>  fs/f2fs/namei.c    |  20 +++-
>  5 files changed, 264 insertions(+), 187 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index f276d82a67aa..e03d57396ea2 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -77,8 +77,9 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
>  
> -	if (cc->rpages)
> +	if (cc->nr_rpages)
>  		return 0;
> +
>  	cc->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) * cc->cluster_size,
>  								GFP_KERNEL);
>  	if (!cc->rpages)
> @@ -88,7 +89,9 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
>  
>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
>  {
> -	kvfree(cc->rpages);
> +	f2fs_reset_compress_ctx(cc);
> +	WARN_ON(cc->nr_rpages);

f2fs_reset_compress_ctx() will reset cc->nr_rpages to zero, I removed it for now.

> +	kfree(cc->rpages);
>  }
>  
>  int f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
> @@ -224,16 +227,6 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
>  	.decompress_pages	= lz4_decompress_pages,
>  };
>  
> -static void f2fs_release_cluster_pages(struct compress_ctx *cc)
> -{
> -	int i;
> -
> -	for (i = 0; i < cc->nr_rpages; i++) {
> -		inode_dec_dirty_pages(cc->inode);
> -		unlock_page(cc->rpages[i]);
> -	}
> -}
> -
>  static struct page *f2fs_grab_page(void)
>  {
>  	struct page *page;
> @@ -321,6 +314,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>  	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
>  							cc->clen, ret);
>  	return 0;
> +
>  out_vunmap_cbuf:
>  	vunmap(cc->cbuf);
>  out_vunmap_rbuf:
> @@ -393,10 +387,9 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>  	vunmap(dic->rbuf);
>  out_free_dic:
>  	f2fs_set_cluster_uptodate(dic->rpages, dic->cluster_size, ret, verity);
> -	f2fs_free_dic(dic);
> -
>  	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
>  							dic->clen, ret);
> +	f2fs_free_dic(dic);
>  }
>  
>  static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
> @@ -443,51 +436,25 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
>  			return false;
>  		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  			return false;
> -		if (f2fs_is_drop_cache(cc->inode))
> -			return false;
> -		if (f2fs_is_volatile_file(cc->inode))
> -			return false;
>  
>  		offset = i_size & (PAGE_SIZE - 1);
>  		if ((page->index > end_index) ||
>  			(page->index == end_index && !offset))
>  			return false;
> +		if (page->index != start_idx_of_cluster(cc) + i)
> +			return false;

Should this be a bug?

>  	}
>  	return true;
>  }
>  
> -int f2fs_is_cluster_existed(struct compress_ctx *cc)
> -{
> -	struct dnode_of_data dn;
> -	unsigned int start_idx = start_idx_of_cluster(cc);
> -	int ret;
> -	int i;
> -
> -	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> -	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> -	if (ret)
> -		return ret;
> -
> -	for (i = 0; i < cc->cluster_size; i++, dn.ofs_in_node++) {
> -		block_t blkaddr = datablock_addr(dn.inode, dn.node_page,
> -							dn.ofs_in_node);
> -		if (blkaddr == COMPRESS_ADDR) {
> -			ret = 1;
> -			break;
> -		}
> -		if (__is_valid_data_blkaddr(blkaddr)) {
> -			ret = 2;
> -			break;
> -		}
> -	}
> -	f2fs_put_dnode(&dn);
> -	return ret;
> -}
> -
>  static bool cluster_may_compress(struct compress_ctx *cc)
>  {
>  	if (!f2fs_compressed_file(cc->inode))
>  		return false;
> +	if (f2fs_is_atomic_file(cc->inode))
> +		return false;
> +	if (f2fs_is_mmap_file(cc->inode))
> +		return false;
>  	if (!f2fs_cluster_is_full(cc))
>  		return false;
>  	return __cluster_may_compress(cc);
> @@ -495,19 +462,59 @@ static bool cluster_may_compress(struct compress_ctx *cc)
>  
>  void f2fs_reset_compress_ctx(struct compress_ctx *cc)
>  {
> -	if (cc->rpages)
> -		memset(cc->rpages, 0, sizeof(struct page *) * cc->cluster_size);
>  	cc->nr_rpages = 0;
>  	cc->nr_cpages = 0;
>  	cc->cluster_idx = NULL_CLUSTER;
>  }
>  
> +int is_compressed_cluster(struct compress_ctx *cc, pgoff_t index)
> +{
> +	struct dnode_of_data dn;
> +	unsigned int start_idx = cluster_idx(cc, index) * cc->cluster_size;
> +	int ret, i;
> +
> +	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> +	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> +	if (ret) {
> +		if (ret == -ENOENT)
> +			ret = 0;
> +		goto fail;
> +	}
> +	if (dn.data_blkaddr == COMPRESS_ADDR) {
> +		ret = CLUSTER_IS_FULL;
> +		for (i = 1; i < cc->cluster_size; i++) {
> +			block_t blkaddr;
> +
> +			blkaddr = datablock_addr(dn.inode,
> +					dn.node_page, dn.ofs_in_node + i);
> +			if (blkaddr == NULL_ADDR) {
> +				ret = CLUSTER_HAS_SPACE;
> +				break;
> +			}
> +		}
> +	}
> +fail:
> +	f2fs_put_dnode(&dn);
> +	return ret;
> +}
> +
> +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
> +{
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +	};
> +
> +	return is_compressed_cluster(&cc, index);
> +}
> +
>  static void set_cluster_writeback(struct compress_ctx *cc)
>  {
>  	int i;
>  
>  	for (i = 0; i < cc->cluster_size; i++)
> -		set_page_writeback(cc->rpages[i]);
> +		if (cc->rpages[i])
> +			set_page_writeback(cc->rpages[i]);
>  }
>  
>  static void set_cluster_dirty(struct compress_ctx *cc)
> @@ -515,17 +522,17 @@ static void set_cluster_dirty(struct compress_ctx *cc)
>  	int i;
>  
>  	for (i = 0; i < cc->cluster_size; i++)
> -		set_page_dirty(cc->rpages[i]);
> +		if (cc->rpages[i])
> +			set_page_dirty(cc->rpages[i]);
>  }
>  
> -int f2fs_prepare_compress_overwrite(struct compress_ctx *cc,
> -					struct page **pagep, pgoff_t index,
> -					void **fsdata, bool prealloc)
> +static int prepare_compress_overwrite(struct compress_ctx *cc,
> +		struct page **pagep, pgoff_t index, void **fsdata,
> +		bool prealloc)
>  {
> -	struct inode *inode = cc->inode;
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
>  	struct bio *bio = NULL;
> -	struct address_space *mapping = inode->i_mapping;
> +	struct address_space *mapping = cc->inode->i_mapping;
>  	struct page *page;
>  	struct dnode_of_data dn;
>  	sector_t last_block_in_bio;
> @@ -586,13 +593,12 @@ int f2fs_prepare_compress_overwrite(struct compress_ctx *cc,
>  			}
>  			goto retry;
>  		}
> -
>  	}
>  
>  	if (prealloc) {
>  		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
>  
> -		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
>  
>  		for (i = cc->cluster_size - 1; i > 0; i--) {
>  			ret = f2fs_get_block(&dn, start_idx + i);
> @@ -609,7 +615,8 @@ int f2fs_prepare_compress_overwrite(struct compress_ctx *cc,
>  
>  	*fsdata = cc->rpages;
>  	*pagep = cc->rpages[offset_in_cluster(cc, index)];
> -	return 0;
> +	return CLUSTER_IS_FULL;
> +
>  unlock_pages:
>  	for (idx = 0; idx < i; idx++) {
>  		if (cc->rpages[idx])
> @@ -626,13 +633,34 @@ int f2fs_prepare_compress_overwrite(struct compress_ctx *cc,
>  	return ret;
>  }
>  
> -void f2fs_compress_write_end(struct inode *inode, void *fsdata,
> -							bool written)
> +int f2fs_prepare_compress_overwrite(struct inode *inode,
> +		struct page **pagep, pgoff_t index, void **fsdata)
> +{
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +		.cluster_idx = NULL_CLUSTER,
> +		.rpages = NULL,
> +		.nr_rpages = 0,
> +	};
> +	int ret = is_compressed_cluster(&cc, index);
> +
> +	if (ret <= 0)
> +		return ret;
> +
> +	/* compressed case */
> +	return prepare_compress_overwrite(&cc, pagep, index,
> +			fsdata, ret == CLUSTER_HAS_SPACE);
> +}
> +
> +bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> +		pgoff_t index, bool written)
>  {
>  	struct compress_ctx cc = {
>  		.cluster_size = F2FS_I(inode)->i_cluster_size,
>  		.rpages = fsdata,
>  	};
> +	bool first_index = (index == cc.rpages[0]->index);
>  	int i;
>  
>  	if (written)
> @@ -640,6 +668,11 @@ void f2fs_compress_write_end(struct inode *inode, void *fsdata,
>  
>  	for (i = 0; i < cc.cluster_size; i++)
>  		f2fs_put_page(cc.rpages[i], 1);
> +
> +	f2fs_destroy_compress_ctx(&cc);
> +
> +	return first_index;
> +
>  }
>  
>  static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> @@ -723,6 +756,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  
>  		blkaddr = datablock_addr(dn.inode, dn.node_page,
>  							dn.ofs_in_node);
> +		fio.page = cc->rpages[i];
> +		fio.old_blkaddr = blkaddr;
>  
>  		/* cluster header */
>  		if (i == 0) {
> @@ -731,7 +766,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  			if (__is_valid_data_blkaddr(blkaddr))
>  				f2fs_invalidate_blocks(sbi, blkaddr);
>  			f2fs_update_data_blkaddr(&dn, COMPRESS_ADDR);
> -			continue;
> +			goto unlock_continue;
>  		}
>  
>  		if (pre_compressed_blocks && __is_valid_data_blkaddr(blkaddr))
> @@ -742,13 +777,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  				f2fs_invalidate_blocks(sbi, blkaddr);
>  				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
>  			}
> -			continue;
> +			goto unlock_continue;
>  		}
>  
>  		f2fs_bug_on(fio.sbi, blkaddr == NULL_ADDR);
>  
> -		fio.page = cc->rpages[i];
> -		fio.old_blkaddr = blkaddr;
>  
>  		if (fio.encrypted)
>  			fio.encrypted_page = cc->cpages[i - 1];
> @@ -759,6 +792,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		cc->cpages[i - 1] = NULL;
>  		f2fs_outplace_write_data(&dn, &fio);
>  		(*submitted)++;
> +unlock_continue:
> +		inode_dec_dirty_pages(cc->inode);
> +		unlock_page(fio.page);
>  	}
>  
>  	if (pre_compressed_blocks) {
> @@ -778,10 +814,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  	f2fs_put_dnode(&dn);
>  	f2fs_unlock_op(sbi);
>  
> -	f2fs_release_cluster_pages(cc);
> -
> -	cc->rpages = NULL;
> -
>  	if (err) {
>  		file_set_keep_isize(inode);
>  	} else {
> @@ -791,6 +823,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		up_write(&fi->i_sem);
>  	}
>  	return 0;
> +
>  out_destroy_crypt:
>  	for (i -= 1; i >= 0; i--)
>  		fscrypt_finalize_bounce_page(&cc->cpages[i]);
> @@ -824,12 +857,13 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
>  		return;
>  
>  	for (i = 0; i < cic->nr_rpages; i++) {
> +		WARN_ON(!cic->rpages[i]);
>  		clear_cold_data(cic->rpages[i]);
>  		end_page_writeback(cic->rpages[i]);
>  	}
>  
> -	kvfree(cic->rpages);
> -	kvfree(cic);
> +	kfree(cic->rpages);
> +	kfree(cic);
>  }
>  
>  static int f2fs_write_raw_pages(struct compress_ctx *cc,
> @@ -843,6 +877,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  	for (i = 0; i < cc->cluster_size; i++) {
>  		if (!cc->rpages[i])
>  			continue;
> +		BUG_ON(!PageLocked(cc->rpages[i]));
>  		ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
>  						NULL, NULL, wbc, io_type);
>  		if (ret) {
> @@ -855,9 +890,10 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  		*submitted += _submitted;
>  	}
>  	return 0;
> +
>  out_fail:
>  	/* TODO: revoke partially updated block addresses */
> -	for (i += 1; i < cc->cluster_size; i++) {
> +	for (++i; i < cc->cluster_size; i++) {
>  		if (!cc->rpages[i])
>  			continue;
>  		redirty_page_for_writepage(wbc, cc->rpages[i]);
> @@ -890,9 +926,14 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  	}
>  write:
>  	if (err == -EAGAIN) {
> +		bool compressed = false;
> +
>  		f2fs_bug_on(F2FS_I_SB(cc->inode), *submitted);
> +		if (is_compressed_cluster(cc, start_idx_of_cluster(cc)))
> +			compressed = true;
> +
>  		err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
> -		if (f2fs_is_cluster_existed(cc) == 1) {
> +		if (compressed) {
>  			stat_sub_compr_blocks(cc->inode, *submitted);
>  			F2FS_I(cc->inode)->i_compressed_blocks -= *submitted;
>  			f2fs_mark_inode_dirty_sync(cc->inode, true);
> @@ -902,37 +943,6 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  	return err;
>  }
>  
> -int f2fs_is_compressed_cluster(struct compress_ctx *cc, pgoff_t index)
> -{
> -	struct dnode_of_data dn;
> -	unsigned int start_idx = cluster_idx(cc, index) * cc->cluster_size;
> -	int ret, i;
> -
> -	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> -	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> -	if (ret) {
> -		if (ret == -ENOENT)
> -			ret = 0;
> -		goto fail;
> -	}
> -	if (dn.data_blkaddr == COMPRESS_ADDR) {
> -		ret = CLUSTER_IS_FULL;
> -		for (i = 1; i < cc->cluster_size; i++) {
> -			block_t blkaddr;
> -
> -			blkaddr = datablock_addr(dn.inode,
> -					dn.node_page, dn.ofs_in_node + i);
> -			if (blkaddr == NULL_ADDR) {
> -				ret = CLUSTER_HAS_SPACE;
> -				break;
> -			}
> -		}
> -	}
> -fail:
> -	f2fs_put_dnode(&dn);
> -	return ret;
> -}
> -
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> @@ -991,9 +1001,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  
>  	dic->rpages = cc->rpages;
>  	dic->nr_rpages = cc->cluster_size;
> -
> -	cc->rpages = NULL;
>  	return dic;
> +
>  out_free:
>  	f2fs_free_dic(dic);
>  out:
> @@ -1011,7 +1020,7 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
>  			unlock_page(dic->tpages[i]);
>  			put_page(dic->tpages[i]);
>  		}
> -		kvfree(dic->tpages);
> +		kfree(dic->tpages);
>  	}
>  
>  	if (dic->cpages) {
> @@ -1020,11 +1029,11 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
>  				continue;
>  			f2fs_put_compressed_page(dic->cpages[i]);
>  		}
> -		kvfree(dic->cpages);
> +		kfree(dic->cpages);
>  	}
>  
> -	kvfree(dic->rpages);
> -	kvfree(dic);
> +	kfree(dic->rpages);
> +	kfree(dic);
>  }
>  
>  void f2fs_set_cluster_uptodate(struct page **rpages,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index bac96c3a8bc9..b8e0431747b1 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1925,18 +1925,18 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	last_block_in_file = (i_size_read(inode) + blocksize - 1) >> blkbits;
>  
>  	/* get rid of pages beyond EOF */
> -	for (i = cc->nr_rpages - 1; i >= 0; i--) {
> +	for (i = 0; i < cc->cluster_size; i++) {
>  		struct page *page = cc->rpages[i];
>  
>  		if (!page)
>  			continue;
> -		if ((sector_t)page->index < last_block_in_file)
> -			break;
> -
> -		zero_user_segment(page, 0, PAGE_SIZE);
> -		if (!PageUptodate(page))
> -			SetPageUptodate(page);
> -
> +		if ((sector_t)page->index >= last_block_in_file) {
> +			zero_user_segment(page, 0, PAGE_SIZE);
> +			if (!PageUptodate(page))
> +				SetPageUptodate(page);
> +		} else if (!PageUptodate(page)) {
> +			continue;
> +		}
>  		unlock_page(page);
>  		cc->rpages[i] = NULL;
>  		cc->nr_rpages--;
> @@ -2031,6 +2031,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	f2fs_reset_compress_ctx(cc);
>  	*bio_ret = bio;
>  	return 0;
> +
>  out_put_dnode:
>  	f2fs_put_dnode(&dn);
>  out:
> @@ -2100,7 +2101,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
>  				if (ret)
>  					goto set_error_page;
>  			}
> -			ret = f2fs_is_compressed_cluster(&cc, page->index);
> +			ret = f2fs_is_compressed_cluster(inode, page->index);
>  			if (ret < 0)
>  				goto set_error_page;
>  			else if (!ret)
> @@ -2457,7 +2458,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		goto redirty_out;
>  
> -	if (page->index < end_index || f2fs_verity_in_progress(inode))
> +	if (f2fs_compressed_file(inode) ||
> +		page->index < end_index || f2fs_verity_in_progress(inode))
>  		goto write;
>  
>  	/*
> @@ -2533,7 +2535,6 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  		f2fs_remove_dirty_inode(inode);
>  		submitted = NULL;
>  	}
> -
>  	unlock_page(page);
>  	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
>  					!F2FS_I(inode)->cp_task)
> @@ -2567,6 +2568,15 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  static int f2fs_write_data_page(struct page *page,
>  					struct writeback_control *wbc)
>  {
> +	struct inode *inode = page->mapping->host;
> +
> +	if (f2fs_compressed_file(inode)) {
> +		if (f2fs_is_compressed_cluster(inode, page->index)) {
> +			redirty_page_for_writepage(wbc, page);
> +			return AOP_WRITEPAGE_ACTIVATE;
> +		}
> +	}
> +
>  	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
>  						wbc, FS_DATA_IO);
>  }
> @@ -2581,7 +2591,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  					enum iostat_type io_type)
>  {
>  	int ret = 0;
> -	int done = 0;
> +	int done = 0, retry = 0;
>  	struct pagevec pvec;
>  	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
>  	struct bio *bio = NULL;
> @@ -2639,10 +2649,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	else
>  		tag = PAGECACHE_TAG_DIRTY;
>  retry:
> +	retry = 0;
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>  		tag_pages_for_writeback(mapping, index, end);
>  	done_index = index;
> -	while (!done && (index <= end)) {
> +	while (!done && !retry && (index <= end)) {
>  		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
>  				tag);
>  		if (nr_pages == 0)
> @@ -2650,25 +2661,42 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  
>  		for (i = 0; i < nr_pages; i++) {
>  			struct page *page = pvec.pages[i];
> -			bool need_readd = false;
> -
> +			bool need_readd;
>  readd:
> +			need_readd = false;
>  			if (f2fs_compressed_file(inode)) {
> +				void *fsdata = NULL;
> +				struct page *pagep;
> +				int ret2;
> +
>  				ret = f2fs_init_compress_ctx(&cc);
>  				if (ret) {
>  					done = 1;
>  					break;
>  				}
>  
> -				if (!f2fs_cluster_can_merge_page(&cc,
> -							page->index)) {
> -					need_readd = true;
> +				if (!f2fs_cluster_can_merge_page(&cc, page->index)) {
>  					ret = f2fs_write_multi_pages(&cc,
> -						&submitted, wbc, io_type);
> +							&submitted, wbc, io_type);
> +					if (!ret)
> +						need_readd = true;
>  					goto result;
>  				}
> +				if (f2fs_cluster_is_empty(&cc)) {
> +					ret2 = f2fs_prepare_compress_overwrite(inode,
> +							&pagep, page->index, &fsdata);
> +					if (ret2 < 0) {
> +						ret = ret2;
> +						done = 1;
> +						break;
> +					} else if (ret2 &&
> +							!f2fs_compress_write_end(inode, fsdata,
> +								page->index, true)) {
> +						retry = 1;
> +						break;
> +					}
> +				}
>  			}
> -
>  			/* give a priority to WB_SYNC threads */
>  			if (atomic_read(&sbi->wb_sync_req[DATA]) &&
>  					wbc->sync_mode == WB_SYNC_NONE) {
> @@ -2702,7 +2730,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			if (!clear_page_dirty_for_io(page))
>  				goto continue_unlock;
>  
> -			if (f2fs_compressed_file(mapping->host)) {
> +			if (f2fs_compressed_file(inode)) {
>  				ret = f2fs_compress_ctx_add_page(&cc, page);
>  				f2fs_bug_on(sbi, ret);
>  				continue;
> @@ -2754,7 +2782,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  		/* TODO: error handling */
>  	}
>  
> -	if (!cycled && !done) {
> +	if ((!cycled && !done) || retry) {
>  		cycled = 1;
>  		index = 0;
>  		end = writeback_index - 1;
> @@ -2770,8 +2798,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	if (bio)
>  		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
>  
> -	f2fs_destroy_compress_ctx(&cc);
> -
>  	return ret;
>  }
>  
> @@ -3017,26 +3043,18 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  	}
>  
>  	if (f2fs_compressed_file(inode)) {
> -		struct compress_ctx cc = {
> -			.inode = inode,
> -			.cluster_size = F2FS_I(inode)->i_cluster_size,
> -			.cluster_idx = NULL_CLUSTER,
> -			.rpages = NULL,
> -			.nr_rpages = 0,
> -		};
> +		int ret;
>  
>  		*fsdata = NULL;
>  
> -		err = f2fs_is_compressed_cluster(&cc, index);
> -		if (err < 0)
> +		ret = f2fs_prepare_compress_overwrite(inode, pagep,
> +				index, fsdata);
> +		if (ret < 0) {
> +			err = ret;
>  			goto fail;
> -		if (!err)
> -			goto repeat;
> -
> -		err = f2fs_prepare_compress_overwrite(&cc, pagep, index, fsdata,
> -						err == CLUSTER_HAS_SPACE);
> -		/* need to goto fail? */
> -		return err;
> +		} else if (ret) {
> +			return 0;
> +		}
>  	}
>  
>  repeat:
> @@ -3139,7 +3157,7 @@ static int f2fs_write_end(struct file *file,
>  
>  	/* overwrite compressed file */
>  	if (f2fs_compressed_file(inode) && fsdata) {
> -		f2fs_compress_write_end(inode, fsdata, copied);
> +		f2fs_compress_write_end(inode, fsdata, page->index, copied);
>  		goto update_time;
>  	}
>  
> @@ -3534,6 +3552,15 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  	if (ret)
>  		return ret;
>  
> +	if (f2fs_compressed_file(inode)) {
> +		if (F2FS_I(inode)->i_compressed_blocks)
> +			return -EINVAL;
> +
> +		F2FS_I(inode)->i_flags &= ~FS_COMPR_FL;
> +		clear_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_dec_compr_inode(inode);
> +	}
> +
>  	ret = check_swap_activate(file, sis->max);
>  	if (ret)
>  		return ret;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d22a4e2bb8b8..9c3399fdd6c1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2541,6 +2541,7 @@ enum {
>  	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
>  	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
>  	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
> +	FI_MMAP_FILE,		/* indicate file was mmapped */
>  };
>  
>  static inline void __mark_inode_dirty_flag(struct inode *inode,
> @@ -2766,6 +2767,11 @@ static inline int f2fs_has_inline_dots(struct inode *inode)
>  	return is_inode_flag_set(inode, FI_INLINE_DOTS);
>  }
>  
> +static inline int f2fs_is_mmap_file(struct inode *inode)
> +{
> +	return is_inode_flag_set(inode, FI_MMAP_FILE);
> +}
> +
>  static inline bool f2fs_is_pinned_file(struct inode *inode)
>  {
>  	return is_inode_flag_set(inode, FI_PIN_FILE);
> @@ -3609,7 +3615,7 @@ void f2fs_destroy_root_stats(void);
>  #define stat_inc_atomic_write(inode)			do { } while (0)
>  #define stat_dec_atomic_write(inode)			do { } while (0)
>  #define stat_inc_compr_blocks(inode)			do { } while (0)
> -#define stat_dec_compr_blocks(inode)			do { } while (0)
> +#define stat_sub_compr_blocks(inode)			do { } while (0)
>  #define stat_update_max_atomic_write(inode)		do { } while (0)
>  #define stat_inc_volatile_write(inode)			do { } while (0)
>  #define stat_dec_volatile_write(inode)			do { } while (0)
> @@ -3755,13 +3761,13 @@ static inline bool f2fs_post_read_required(struct inode *inode)
>   * compress.c
>   */
>  bool f2fs_is_compressed_page(struct page *page);
> +int is_compressed_cluster(struct compress_ctx *cc, pgoff_t index);
>  struct page *f2fs_compress_control_page(struct page *page);
>  void f2fs_reset_compress_ctx(struct compress_ctx *cc);
> -int f2fs_prepare_compress_overwrite(struct compress_ctx *cc,
> -					struct page **page_ret, pgoff_t index,
> -					void **fsdata, bool prealloc);
> -void f2fs_compress_write_end(struct inode *inode, void *fsdata,
> -							bool written);
> +int f2fs_prepare_compress_overwrite(struct inode *inode,
> +		struct page **pagep, pgoff_t index, void **fsdata);
> +bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> +		pgoff_t index, bool written);
>  void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>  void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
>  bool f2fs_cluster_is_empty(struct compress_ctx *cc);
> @@ -3771,7 +3777,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  						int *submitted,
>  						struct writeback_control *wbc,
>  						enum iostat_type io_type);
> -int f2fs_is_compressed_cluster(struct compress_ctx *cc, pgoff_t index);
> +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
>  int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  				unsigned nr_pages, sector_t *last_block_in_bio,
>  				bool is_readahead);
> @@ -3923,6 +3929,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  		return true;
>  	if (f2fs_is_multi_device(sbi))
>  		return true;
> +	if (f2fs_compressed_file(inode))
> +		return true;
>  	/*
>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>  	 * all IOs can be serialized by log-structured write.
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8a92e8fd648c..99380c419b87 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -51,7 +51,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct dnode_of_data dn = { .node_changed = false };
> -	int err;
> +	bool need_alloc = true;
> +	int err = 0;
>  
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		err = -EIO;
> @@ -63,6 +64,18 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		goto err;
>  	}
>  
> +	if (f2fs_compressed_file(inode)) {
> +		int ret = f2fs_is_compressed_cluster(inode, page->index);
> +
> +		if (ret < 0) {
> +			err = ret;
> +			goto err;
> +		} else if (ret) {
> +			f2fs_bug_on(sbi, ret == CLUSTER_HAS_SPACE);
> +			need_alloc = false;
> +		}
> +	}
> +
>  	sb_start_pagefault(inode->i_sb);
>  
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> @@ -78,15 +91,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		goto out_sem;
>  	}
>  
> -	/* block allocation */
> -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	err = f2fs_get_block(&dn, page->index);
> -	f2fs_put_dnode(&dn);
> -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> -	if (err) {
> -		unlock_page(page);
> -		goto out_sem;
> +	if (need_alloc) {
> +		/* block allocation */
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		err = f2fs_get_block(&dn, page->index);
> +		f2fs_put_dnode(&dn);
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> +		if (err) {
> +			unlock_page(page);
> +			goto out_sem;
> +		}
>  	}
>  
>  	/* fill the page */
> @@ -492,6 +507,7 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  
>  	file_accessed(file);
>  	vma->vm_ops = &f2fs_file_vm_ops;
> +	set_inode_flag(inode, FI_MMAP_FILE);
>  	return 0;
>  }
>  
> @@ -1781,8 +1797,18 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  			return -EINVAL;
>  		if (iflags & FS_NOCOMP_FL)
>  			return -EINVAL;
> -		if (S_ISREG(inode->i_mode))
> -			clear_inode_flag(inode, FI_INLINE_DATA);
> +		if (fi->i_flags & FS_COMPR_FL) {

i_flags & F2FS_COMPR_FL

Need to change all FS_{COMPR, NOCOMP}_FL to F2FS_{COMPR, NOCOMP}_FL

> +			int err = f2fs_convert_inline_inode(inode);
> +
> +			if (err)
> +				return err;
> +
> +			if (!f2fs_may_compress(inode))
> +				return -EINVAL;
> +
> +			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +			stat_inc_compr_inode(inode);
> +		}
>  	}
>  	if ((iflags ^ fi->i_flags) & FS_NOCOMP_FL) {
>  		if (fi->i_flags & FS_COMPR_FL)
> @@ -1793,19 +1819,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & FS_COMPR_FL) &&
>  					(fi->i_flags & FS_NOCOMP_FL));
>  
> -	if (fi->i_flags & FS_COMPR_FL) {
> -		int err = f2fs_convert_inline_inode(inode);
> -
> -		if (err)
> -			return err;
> -
> -		if (!f2fs_may_compress(inode))
> -			return -EINVAL;
> -
> -		set_inode_flag(inode, FI_COMPRESSED_FILE);
> -		stat_inc_compr_inode(inode);
> -	}
> -
>  	if (fi->i_flags & F2FS_PROJINHERIT_FL)
>  		set_inode_flag(inode, FI_PROJ_INHERIT);
>  	else
> @@ -1988,6 +2001,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  
>  	inode_lock(inode);
>  
> +	if (f2fs_compressed_file(inode) && !fi->i_compressed_blocks) {
> +		fi->i_flags &= ~FS_COMPR_FL;
> +		clear_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_dec_compr_inode(inode);
> +	}
> +
>  	if (f2fs_is_atomic_file(inode)) {
>  		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
>  			ret = -EINVAL;
> @@ -3190,7 +3209,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  	}
>  
>  	if (f2fs_compressed_file(inode)) {
> -		if (F2FS_HAS_BLOCKS(inode) || i_size_read(inode)) {
> +		if (F2FS_I(inode)->i_compressed_blocks) {
>  			ret = -EOPNOTSUPP;
>  			goto out;
>  		}
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 9f37e95c4a4b..ac0c51cefca2 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -128,9 +128,11 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  				1 << F2FS_I(inode)->i_log_cluster_size;
>  
>  		/* Inherit the compression flag in directory */
> -		if ((F2FS_I(inode)->i_flags & FS_COMPR_FL) &&
> -					f2fs_may_compress(inode))
> +		if ((F2FS_I(dir)->i_flags & FS_COMPR_FL) &&
> +					f2fs_may_compress(inode)) {
> +			F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
>  			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +		}
>  	}
>  
>  	f2fs_set_inode_flags(inode);
> @@ -282,6 +284,7 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
>  static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>  						const unsigned char *name)
>  {
> +	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
>  	unsigned char (*ext)[F2FS_EXTENSION_LEN];
>  	unsigned int ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
>  	int i, cold_count, hot_count;
> @@ -292,13 +295,24 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>  			!f2fs_may_compress(inode))
>  		return;
>  
> +	down_read(&sbi->sb_lock);
> +
>  	ext = F2FS_OPTION(sbi).extensions;
>  
>  	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>  	hot_count = sbi->raw_super->hot_ext_count;
>  
> +	for (i = cold_count; i < cold_count + hot_count; i++) {
> +		if (is_extension_exist(name, extlist[i])) {
> +			up_read(&sbi->sb_lock);
> +			return;
> +		}
> +	}
> +
> +	up_read(&sbi->sb_lock);
> +
>  	for (i = 0; i < ext_cnt; i++) {
> -		if (is_extension_exist(name, ext[i]) && !file_is_hot(inode)) {
> +		if (is_extension_exist(name, ext[i])) {
>  			F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
>  			set_inode_flag(inode, FI_COMPRESSED_FILE);
>  			return;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
