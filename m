Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F758454CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 11:05:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVTwO-0000qc-Gb;
	Thu, 01 Feb 2024 10:05:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rVTwN-0000qM-4S
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 10:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dbs/q3Q17RSIFUkCeRIu4naKCipoleAw8XHG2gR/xaI=; b=mp2Svflxs/0OhaOhGKGm/7fe3A
 H5pzmQTlmmPigzAGATg4afKvzLN/Q+rrf0+jRh1pejINBPCkDWxqnERIwaksGyRJO5ObPxhG9zJ2y
 bQtABZyZkIFj3L6DokO7kCD5nzkznYK1esxwNL+/erj3mXdl9y7GGZGMXi2K/3LKaokA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dbs/q3Q17RSIFUkCeRIu4naKCipoleAw8XHG2gR/xaI=; b=BIv855mQZbumSY+CM8lMRQSXTk
 GLDtGaoRCu1dKUFFj/dclE+rZWtpLm5B8pZ2Jd0eifMfIRjxHLmcHvbizMJNgs36oleIX6Ns3ECkv
 z9sJXA17t05WIc0KR4O3+2jWJthyegw6yHaSN1BELibOSWu8aN8vmy3WVvT+VmwjaKdE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVTwM-0003ej-02 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 10:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 47415CE2580;
 Thu,  1 Feb 2024 10:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B9EC433C7;
 Thu,  1 Feb 2024 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706781879;
 bh=2Y4THrW7AllqSowHG4eQ1MMYnUa2uz9wMqjt7IWXLEU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JKfyh0PCv6mlj0cNPwcFqVsMcZMhk/e6N+l0dEtYPRPZrVKedyMBcRMSOcQnnawhf
 0DnZKAVgbmowKWBX1JdRsQWTYcUXNC0ifqnNuo7ZbevayFpcTmt6S91sKArSWpO9En
 DpHQRP5xtc56QcnS6Gkk3cQPVdA1O0/tlaE57Spv2OzudCLdTpPn/ifG36FUVX4pQ1
 ydkeGyiJqix23jubnHUVyNDAC6tSeNkrlB3hXw29kJZ9z0CbQuWzrkTN9RwIlMC+ge
 7w/WA04gZiwH6chmwEjRrS92dyhOLWoVtGa4x4NKN3tiRM341L+1vs2n9HsaQuRmiE
 Z3d17AA8Th4Pw==
Message-ID: <cc9d1f72-681e-48d7-9ce8-bd0ee9f31e4a@kernel.org>
Date: Thu, 1 Feb 2024 18:04:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1706668994-7384-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1706668994-7384-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/31 10:43, Zhiguo Niu wrote: > There are some cases
 of f2fs_is_valid_blkaddr not handled as > ERROR_INVALID_BLKADDR,so unify
 the error handling about all of > f2fs_is_valid_blkaddr. > > Signe [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVTwM-0003ej-02
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/31 10:43, Zhiguo Niu wrote:
> There are some cases of f2fs_is_valid_blkaddr not handled as
> ERROR_INVALID_BLKADDR,so unify the error handling about all of
> f2fs_is_valid_blkaddr.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v2: improve patch according Chao's suggestions.
> changes of v3:
>    -rebase patch to dev-test
>    -correct return value for some f2fs_is_valid_blkaddr error case
> changes of v4: update according to the latest code
> changes of v5: improve patch according Jaegeuk's suggestiongs
>    -restore return value of some f2fs_is_valid_blkaddr error case to original
>    -remove cp_err checking in __is_bitmap_valid becasue it has done in
>     if case
>    -return true directly for case (type=DATA_GENERIC_ENHANCE_READ) in
>     __is_bitmap_valid to avoid meaningless flow
>    -rename __is_bitmap_valid to __is_bitmap_check_valid for avoiding ambiguity
>     and handling its return value in the caller uniformly, also cooperate
>     switch checking true to false in do_recover_data for error case of
>     f2fs_is_valid_blkaddr(type=DATA_GENERIC_ENHANCE_UPDATE) for more readable
> ---
> ---
>   fs/f2fs/checkpoint.c   | 53 +++++++++++++++++++++++---------------------------
>   fs/f2fs/data.c         | 22 +++------------------
>   fs/f2fs/extent_cache.c |  5 +----
>   fs/f2fs/file.c         | 16 +++------------
>   fs/f2fs/gc.c           |  2 --
>   fs/f2fs/recovery.c     |  6 +-----
>   fs/f2fs/segment.c      |  2 --
>   7 files changed, 32 insertions(+), 74 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index b85820e..e90fa46 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -134,14 +134,15 @@ struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
>   	return __get_meta_page(sbi, index, false);
>   }
>   
> -static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
> +static bool __is_bitmap_check_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>   							int type)
>   {
>   	struct seg_entry *se;
>   	unsigned int segno, offset;
>   	bool exist;
>   
> -	if (type == DATA_GENERIC)
> +	if (type == DATA_GENERIC ||
> +		type == DATA_GENERIC_ENHANCE_READ)
>   		return true;
>   
>   	segno = GET_SEGNO(sbi, blkaddr);
> @@ -149,25 +150,16 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>   	se = get_seg_entry(sbi, segno);
>   
>   	exist = f2fs_test_bit(offset, se->cur_valid_map);
> +	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
> +			(!exist && type == DATA_GENERIC_ENHANCE))
> +		goto err;
>   
> -	/* skip data, if we already have an error in checkpoint. */
> -	if (unlikely(f2fs_cp_error(sbi)))
> -		return exist;
> -
> -	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
> -		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> -			 blkaddr, exist);
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		return exist;
> -	}
> -
> -	if (!exist && type == DATA_GENERIC_ENHANCE) {
> -		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> -			 blkaddr, exist);
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		dump_stack();
> -	}
> -	return exist;
> +	return true;
> +err:
> +	f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> +		blkaddr, exist);
> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
> +	return false;

	if (unlikely((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
			(!exist && type == DATA_GENERIC_ENHANCE))) {
		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
			blkaddr, exist);
		set_sbi_flag(sbi, SBI_NEED_FSCK);
		dump_stack();
		return false;
	}
	return exist;

>   }
>   
>   static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> @@ -178,22 +170,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   		break;
>   	case META_SIT:
>   		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
> -			return false;
> +			goto err;
>   		break;
>   	case META_SSA:
>   		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
>   			blkaddr < SM_I(sbi)->ssa_blkaddr))
> -			return false;
> +			goto err;
>   		break;
>   	case META_CP:
>   		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
>   			blkaddr < __start_cp_addr(sbi)))
> -			return false;
> +			goto err;
>   		break;
>   	case META_POR:
>   		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>   			blkaddr < MAIN_BLKADDR(sbi)))
> -			return false;
> +			goto err;
>   		break;
>   	case DATA_GENERIC:
>   	case DATA_GENERIC_ENHANCE:
> @@ -209,22 +201,25 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   			f2fs_warn(sbi, "access invalid blkaddr:%u",
>   				  blkaddr);
>   			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			dump_stack();
> -			return false;
> -		} else {
> -			return __is_bitmap_valid(sbi, blkaddr, type);
> +			goto err;
> +		} else if (!__is_bitmap_check_valid(sbi, blkaddr, type)) {
> +			goto err;
>   		}
>   		break;
>   	case META_GENERIC:
>   		if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
>   			blkaddr >= MAIN_BLKADDR(sbi)))
> -			return false;
> +			goto err;
>   		break;
>   	default:
>   		BUG();
>   	}
>   
>   	return true;
> +err:
> +	dump_stack();

I don't think we need to call dump_stack() for all cases.

Thanks,

> +	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +	return false;
>   }
>   
>   bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 05158f8..300f9ae 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -738,10 +738,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>   
>   	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>   			fio->is_por ? META_POR : (__is_meta_io(fio) ?
> -			META_GENERIC : DATA_GENERIC_ENHANCE))) {
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
> +			META_GENERIC : DATA_GENERIC_ENHANCE)))
>   		return -EFSCORRUPTED;
> -	}
>   
>   	trace_f2fs_submit_page_bio(page, fio);
>   
> @@ -946,10 +944,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   			fio->encrypted_page : fio->page;
>   
>   	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> -			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
> +			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
>   		return -EFSCORRUPTED;
> -	}
>   
>   	trace_f2fs_submit_page_bio(page, fio);
>   
> @@ -1286,8 +1282,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>   		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
>   						DATA_GENERIC_ENHANCE_READ)) {
>   			err = -EFSCORRUPTED;
> -			f2fs_handle_error(F2FS_I_SB(inode),
> -						ERROR_INVALID_BLKADDR);
>   			goto put_err;
>   		}
>   		goto got_it;
> @@ -1313,8 +1307,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>   						dn.data_blkaddr,
>   						DATA_GENERIC_ENHANCE)) {
>   		err = -EFSCORRUPTED;
> -		f2fs_handle_error(F2FS_I_SB(inode),
> -					ERROR_INVALID_BLKADDR);
>   		goto put_err;
>   	}
>   got_it:
> @@ -1642,7 +1634,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>   	if (!is_hole &&
>   	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
>   		err = -EFSCORRUPTED;
> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   		goto sync_out;
>   	}
>   
> @@ -2166,8 +2157,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>   		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
>   						DATA_GENERIC_ENHANCE_READ)) {
>   			ret = -EFSCORRUPTED;
> -			f2fs_handle_error(F2FS_I_SB(inode),
> -						ERROR_INVALID_BLKADDR);
>   			goto out;
>   		}
>   	} else {
> @@ -2707,11 +2696,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>   	    f2fs_lookup_read_extent_cache_block(inode, page->index,
>   						&fio->old_blkaddr)) {
>   		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
> -						DATA_GENERIC_ENHANCE)) {
> -			f2fs_handle_error(fio->sbi,
> -						ERROR_INVALID_BLKADDR);
> +						DATA_GENERIC_ENHANCE))
>   			return -EFSCORRUPTED;
> -		}
>   
>   		ipu_force = true;
>   		fio->need_lock = LOCK_DONE;
> @@ -2739,7 +2725,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>   		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>   						DATA_GENERIC_ENHANCE)) {
>   		err = -EFSCORRUPTED;
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
>   		goto out_writepage;
>   	}
>   
> @@ -3706,7 +3691,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>   				DATA_GENERIC_ENHANCE_READ)) {
>   			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			goto fail;
>   		}
>   		err = f2fs_submit_page_read(use_cow ?
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index ad8dfac7..48048fa 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -43,7 +43,6 @@ bool sanity_check_extent_cache(struct inode *inode)
>   	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
>   	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>   					DATA_GENERIC_ENHANCE)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>   		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
>   			  __func__, inode->i_ino,
>   			  ei->blk, ei->fofs, ei->len);
> @@ -856,10 +855,8 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
>   		goto out;
>   
>   	if (__is_valid_data_blkaddr(blkaddr) &&
> -	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
> -		f2fs_bug_on(sbi, 1);
> +	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
>   		return -EINVAL;
> -	}
>   out:
>   	/*
>   	 * init block age with zero, this can happen when the block age extent
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 25b119cf..23cd6a1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -593,10 +593,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
>   				continue;
>   			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
> -						DATA_GENERIC_ENHANCE)) {
> -				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +						DATA_GENERIC_ENHANCE))
>   				continue;
> -			}
>   			if (compressed_cluster)
>   				valid_blocks++;
>   		}
> @@ -1196,7 +1194,6 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
>   			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
>   					DATA_GENERIC_ENHANCE)) {
>   			f2fs_put_dnode(&dn);
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			return -EFSCORRUPTED;
>   		}
>   
> @@ -1482,7 +1479,6 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
>   		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
>   					DATA_GENERIC_ENHANCE)) {
>   			ret = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			break;
>   		}
>   
> @@ -3442,10 +3438,8 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>   		if (!__is_valid_data_blkaddr(blkaddr))
>   			continue;
>   		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))) {
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +					DATA_GENERIC_ENHANCE)))
>   			return -EFSCORRUPTED;
> -		}
>   	}
>   
>   	while (count) {
> @@ -3607,10 +3601,8 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>   		if (!__is_valid_data_blkaddr(blkaddr))
>   			continue;
>   		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))) {
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +					DATA_GENERIC_ENHANCE)))
>   			return -EFSCORRUPTED;
> -		}
>   	}
>   
>   	while (count) {
> @@ -3894,8 +3886,6 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>   						DATA_GENERIC_ENHANCE)) {
>   				ret = -EFSCORRUPTED;
>   				f2fs_put_dnode(&dn);
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>   				goto out;
>   			}
>   
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a079eeb..30e93d8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1197,7 +1197,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>   		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>   						DATA_GENERIC_ENHANCE_READ))) {
>   			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			goto put_page;
>   		}
>   		goto got_it;
> @@ -1216,7 +1215,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>   	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>   						DATA_GENERIC_ENHANCE))) {
>   		err = -EFSCORRUPTED;
> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   		goto put_page;
>   	}
>   got_it:
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index aad1d1a..73d81e0 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -693,14 +693,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>   		if (__is_valid_data_blkaddr(src) &&
>   			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
>   			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			goto err;
>   		}
>   
>   		if (__is_valid_data_blkaddr(dest) &&
>   			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
>   			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			goto err;
>   		}
>   
> @@ -750,13 +748,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>   				goto err;
>   			}
>   
> -			if (f2fs_is_valid_blkaddr(sbi, dest,
> +			if (!f2fs_is_valid_blkaddr(sbi, dest,
>   					DATA_GENERIC_ENHANCE_UPDATE)) {
>   				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
>   					dest, inode->i_ino, dn.ofs_in_node);
>   				err = -EFSCORRUPTED;
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>   				goto err;
>   			}
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 7901ede..ad6511f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -334,8 +334,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>   					DATA_GENERIC_ENHANCE)) {
>   				f2fs_put_dnode(&dn);
>   				ret = -EFSCORRUPTED;
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>   				goto out;
>   			}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
