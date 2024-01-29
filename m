Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F578413D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 20:54:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUXhv-0000Z0-FI;
	Mon, 29 Jan 2024 19:54:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rUXhu-0000Yt-2U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 19:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8kPzOuGWOF1iNz1ybj8PbL0BC0akt9QKOeffJ7uOnfg=; b=DHIBfvK0WCEnatEpoIPLwmyI0P
 FZbjb+/iIJ/EAwh8ZkReBH8u6fmHsaMpNLuN25iumv0ZeCrVnvn7Nc6cU9dzL583Y4LZ7L94IG4gs
 PTTegXT2uToMFAcceRTINgNAtZbGFunTf9EoceQSCWfvWHH0R2I+5W1S2e44L7wzC4M8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8kPzOuGWOF1iNz1ybj8PbL0BC0akt9QKOeffJ7uOnfg=; b=JxxFOLyM7BiCPfz+J1+UDX1zDP
 zCKTWVErFNslXwBzcILwo7KPCgTL43c9uF79pngYyptjMg9wFz5WbE6w4eh2kKMjVL8VCD56yuVpT
 Nza4/JJSYmyUAi0ap0XhLqOOAM+MQFUNLWNVPP0IQgbjezrRlLTLjDgJtCuyJ1YbJVj0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUXhp-0006kb-6m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 19:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 66F9B62474;
 Mon, 29 Jan 2024 19:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C0AC43394;
 Mon, 29 Jan 2024 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706558039;
 bh=npHC4i+lAx+mIv8vQ7YRcagptNHb6liBAAHMk099ZFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kEM2rPBRMHlp6yQv/h/ByzQBRDRU8Fm3i+n01lo6aJAhLBLzgQ5kiYEu+ZVa8eYMt
 uzxZMKN7n4xAYCrDWom/OuuiNeTEIvm7FsgdsqfUDMHPWiEY/AYd78fOjWsvW9X5vO
 mC/Nk1xkNd2yiVKq4oqarsiI8ywRLzOoUrbXQYWK4MycgJsxsiWFEXMpXs1TmM2evl
 vwnnF6s090x4y79zk+DiUXYclwMai2MET0FDGNtPLIIIEvoWXPJ9jNHv1ZJvevO67o
 rABOsy71fVMduHk8bWaWk7jO8NbXxOoEAvRR//Zjri6mHFc1fD5ZVLCMW1l8O1bZ7Y
 gqCfztdRurJkQ==
Date: Mon, 29 Jan 2024 11:53:57 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Message-ID: <ZbgCVfZfl7s14dM7@google.com>
References: <1706011734-1617-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1706011734-1617-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/23,
 Zhiguo Niu wrote: > There are some cases of f2fs_is_valid_blkaddr
 not handled as > ERROR_INVALID_BLKADDR,so unify the error handling about
 all of > f2fs_is_valid_blkaddr. > > Signed-off-by: [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUXhp-0006kb-6m
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: unify the error handling of
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/23, Zhiguo Niu wrote:
> There are some cases of f2fs_is_valid_blkaddr not handled as
> ERROR_INVALID_BLKADDR,so unify the error handling about all of
> f2fs_is_valid_blkaddr.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v2: improve patch according Chao's suggestions.
> changes of v3:
> 	-rebase patch to dev-test
> 	-correct return value for some f2fs_is_valid_blkaddr error case
> changes of v4: update according to the latest code
> ---
> ---
>  fs/f2fs/checkpoint.c   | 37 +++++++++++++++++++------------------
>  fs/f2fs/data.c         | 24 ++++--------------------
>  fs/f2fs/extent_cache.c |  7 ++-----
>  fs/f2fs/file.c         | 16 +++-------------
>  fs/f2fs/gc.c           |  2 --
>  fs/f2fs/node.c         |  2 +-
>  fs/f2fs/recovery.c     |  4 ----
>  fs/f2fs/segment.c      |  2 --
>  8 files changed, 29 insertions(+), 65 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index b85820e..b9bafd7 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -154,19 +154,17 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>  	if (unlikely(f2fs_cp_error(sbi)))
>  		return exist;
> -	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
> -		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> -			 blkaddr, exist);
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		return exist;
> -	}
> +	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
> +			(!exist && type == DATA_GENERIC_ENHANCE))
> +		goto err;

	if (unlikely((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
			(!exist && type == DATA_GENERIC_ENHANCE))) {
		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
			blkaddr, exist);
		set_sbi_flag(sbi, SBI_NEED_FSCK);
		dump_stack();

		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
		 ^-- remove and done by caller below.
	}
	return exist;

>  
> -	if (!exist && type == DATA_GENERIC_ENHANCE) {
> -		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> -			 blkaddr, exist);
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		dump_stack();
> -	}
> +	return exist;
> +err:
> +	f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> +		blkaddr, exist);
> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
> +	dump_stack();
> +	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  	return exist;
>  }
>  
> @@ -178,22 +176,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  		break;
>  	case META_SIT:
>  		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
> -			return false;
> +			goto err;
>  		break;
>  	case META_SSA:
>  		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
>  			blkaddr < SM_I(sbi)->ssa_blkaddr))
> -			return false;
> +			goto err;
>  		break;
>  	case META_CP:
>  		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
>  			blkaddr < __start_cp_addr(sbi)))
> -			return false;
> +			goto err;
>  		break;
>  	case META_POR:
>  		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>  			blkaddr < MAIN_BLKADDR(sbi)))
> -			return false;
> +			goto err;
>  		break;
>  	case DATA_GENERIC:
>  	case DATA_GENERIC_ENHANCE:
> @@ -210,7 +208,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  				  blkaddr);
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			dump_stack();
> -			return false;
> +			goto err;
>  		} else {
>  			return __is_bitmap_valid(sbi, blkaddr, type);

			if (!__is_bitmap_valid())
				goto err;

>  		}
> @@ -218,13 +216,16 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  	case META_GENERIC:
>  		if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
>  			blkaddr >= MAIN_BLKADDR(sbi)))
> -			return false;
> +			goto err;
>  		break;
>  	default:
>  		BUG();
>  	}
>  
>  	return true;
> +err:
> +	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +	return false;
>  }
>  
>  bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 65fe48b..0f9a657 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -738,10 +738,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			fio->is_por ? META_POR : (__is_meta_io(fio) ?
> -			META_GENERIC : DATA_GENERIC_ENHANCE))) {
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
> +			META_GENERIC : DATA_GENERIC_ENHANCE)))
>  		return -EFSCORRUPTED;
> -	}
>  
>  	trace_f2fs_submit_page_bio(page, fio);
>  
> @@ -946,10 +944,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  			fio->encrypted_page : fio->page;
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> -			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
> +			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
>  		return -EFSCORRUPTED;
> -	}
>  
>  	trace_f2fs_submit_page_bio(page, fio);
>  
> @@ -1287,8 +1283,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>  		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
>  						DATA_GENERIC_ENHANCE_READ)) {
>  			err = -EFSCORRUPTED;
> -			f2fs_handle_error(F2FS_I_SB(inode),
> -						ERROR_INVALID_BLKADDR);
>  			goto put_err;
>  		}
>  		goto got_it;
> @@ -1314,8 +1308,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>  						dn.data_blkaddr,
>  						DATA_GENERIC_ENHANCE)) {
>  		err = -EFSCORRUPTED;
> -		f2fs_handle_error(F2FS_I_SB(inode),
> -					ERROR_INVALID_BLKADDR);
>  		goto put_err;
>  	}
>  got_it:
> @@ -1643,7 +1635,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  	if (!is_hole &&
>  	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
>  		err = -EFSCORRUPTED;
> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  		goto sync_out;
>  	}
>  
> @@ -2167,8 +2158,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
>  						DATA_GENERIC_ENHANCE_READ)) {
>  			ret = -EFSCORRUPTED;
> -			f2fs_handle_error(F2FS_I_SB(inode),
> -						ERROR_INVALID_BLKADDR);
>  			goto out;
>  		}
>  	} else {
> @@ -2301,7 +2290,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  			break;
>  
>  		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC)) {
> -			ret = -EFAULT;
> +			ret = -EFSCORRUPTED;

I'd prefer not to change anything.

>  			goto out_put_dnode;
>  		}
>  		cc->nr_cpages++;
> @@ -2708,11 +2697,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	    f2fs_lookup_read_extent_cache_block(inode, page->index,
>  						&fio->old_blkaddr)) {
>  		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
> -						DATA_GENERIC_ENHANCE)) {
> -			f2fs_handle_error(fio->sbi,
> -						ERROR_INVALID_BLKADDR);
> +						DATA_GENERIC_ENHANCE))
>  			return -EFSCORRUPTED;
> -		}
>  
>  		ipu_force = true;
>  		fio->need_lock = LOCK_DONE;
> @@ -2740,7 +2726,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>  						DATA_GENERIC_ENHANCE)) {
>  		err = -EFSCORRUPTED;
> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
>  		goto out_writepage;
>  	}
>  
> @@ -3707,7 +3692,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>  				DATA_GENERIC_ENHANCE_READ)) {
>  			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			goto fail;
>  		}
>  		err = f2fs_submit_page_read(use_cow ?
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index ad8dfac7..99d0442 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -43,7 +43,6 @@ bool sanity_check_extent_cache(struct inode *inode)
>  	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
>  	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>  					DATA_GENERIC_ENHANCE)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);

Why do you remove this?

>  		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
>  			  __func__, inode->i_ino,
>  			  ei->blk, ei->fofs, ei->len);
> @@ -856,10 +855,8 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
>  		goto out;
>  
>  	if (__is_valid_data_blkaddr(blkaddr) &&
> -	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
> -		f2fs_bug_on(sbi, 1);
> -		return -EINVAL;
> -	}
> +	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
> +		return -EFSCORRUPTED;

Let's keep EINVAL first.

>  out:
>  	/*
>  	 * init block age with zero, this can happen when the block age extent
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 25b119cf..23cd6a1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -593,10 +593,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
>  				continue;
>  			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
> -						DATA_GENERIC_ENHANCE)) {
> -				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +						DATA_GENERIC_ENHANCE))
>  				continue;
> -			}
>  			if (compressed_cluster)
>  				valid_blocks++;
>  		}
> @@ -1196,7 +1194,6 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
>  			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
>  					DATA_GENERIC_ENHANCE)) {
>  			f2fs_put_dnode(&dn);
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			return -EFSCORRUPTED;
>  		}
>  
> @@ -1482,7 +1479,6 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
>  		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
>  					DATA_GENERIC_ENHANCE)) {
>  			ret = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			break;
>  		}
>  
> @@ -3442,10 +3438,8 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  		if (!__is_valid_data_blkaddr(blkaddr))
>  			continue;
>  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))) {
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +					DATA_GENERIC_ENHANCE)))
>  			return -EFSCORRUPTED;
> -		}
>  	}
>  
>  	while (count) {
> @@ -3607,10 +3601,8 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  		if (!__is_valid_data_blkaddr(blkaddr))
>  			continue;
>  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))) {
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +					DATA_GENERIC_ENHANCE)))
>  			return -EFSCORRUPTED;
> -		}
>  	}
>  
>  	while (count) {
> @@ -3894,8 +3886,6 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  						DATA_GENERIC_ENHANCE)) {
>  				ret = -EFSCORRUPTED;
>  				f2fs_put_dnode(&dn);
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>  				goto out;
>  			}
>  
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a079eeb..30e93d8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1197,7 +1197,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>  						DATA_GENERIC_ENHANCE_READ))) {
>  			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			goto put_page;
>  		}
>  		goto got_it;
> @@ -1216,7 +1215,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>  						DATA_GENERIC_ENHANCE))) {
>  		err = -EFSCORRUPTED;
> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  		goto put_page;
>  	}
>  got_it:
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 9b546fd..541c4ad 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -612,7 +612,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  	blkaddr = le32_to_cpu(ne.block_addr);
>  	if (__is_valid_data_blkaddr(blkaddr) &&
>  		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
> -		return -EFAULT;
> +		return -EFSCORRUPTED;

Ditto.

>  
>  	/* cache nat entry */
>  	cache_nat_entry(sbi, nid, &ne);
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index d0f24cc..21381b7 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -680,14 +680,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  		if (__is_valid_data_blkaddr(src) &&
>  			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
>  			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			goto err;
>  		}
>  
>  		if (__is_valid_data_blkaddr(dest) &&
>  			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
>  			err = -EFSCORRUPTED;
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  			goto err;
>  		}
>  
> @@ -756,8 +754,6 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
>  					dest, inode->i_ino, dn.ofs_in_node);
>  				err = -EFSCORRUPTED;
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>  				goto err;
>  			}
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 7901ede..ad6511f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -334,8 +334,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>  					DATA_GENERIC_ENHANCE)) {
>  				f2fs_put_dnode(&dn);
>  				ret = -EFSCORRUPTED;
> -				f2fs_handle_error(sbi,
> -						ERROR_INVALID_BLKADDR);
>  				goto out;
>  			}
>  
> -- 
> 1.9.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
