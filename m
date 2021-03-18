Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED44C340B85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Mar 2021 18:18:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMwHZ-0004dv-UO; Thu, 18 Mar 2021 17:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lMwHT-0004dg-A0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Mar 2021 17:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iDp//PKAV4Sjo56KnAqgLYa0tid7A8GS2x1jiL572RM=; b=A38LGYk8v18DHm2ztodUQA06KF
 hLJHQHYWkDAtaG8faUVKMa9Wx+uDMlE47JJbDoDlmkZfyXzMyHqiLw3ZCU9TK+2y3hh3vP+1AItJV
 oz65F7P0+hTjOfjqtlAhpZi/oGCmxmdjOK5xTji1LKAd6oJ4egmecZ+NqQqE/InOb+Tk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iDp//PKAV4Sjo56KnAqgLYa0tid7A8GS2x1jiL572RM=; b=d4PbvpcYAErVzJZx06U0Dhfx3T
 edub242q/WaJZJHXrJD9GEsb+4YBQQjC3jWh/RGtHtW8rS8kdgQVPhSGmsUuNP6P3mTd1M/9v33Uj
 M9TC1U9gNrmICYfcX3lKs0nBIsV6xg/0w42/pgzT3Y4z/5QAHwoQMh3PWvDVhGQgSQg0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lMwHL-00Fgd0-Ce
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Mar 2021 17:17:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1D5464EF6;
 Thu, 18 Mar 2021 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616087862;
 bh=NUnPDKzhQeaSoqgrIqhWRHlq+IUR51l4CsCRg8M4VCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HI7lJteHsflfTFzGXv7EWlusKHSAslONvXEL+tT01xU5gm4ulM/uW5Rrp3ugbXbkm
 JtNeEPEuwN5pOLkof/GHvk+nFXVwvC/dW2ZCmfDCRZK0nGoGYVXOAhdezAiGzRSVYx
 TwwX40FMevDIMw46jwBmGZnS0NjTpSQbN2qivPfLVm9rBoIv0JbIX1x0R07F7Kb2yd
 paCh9thU8rVmYsoiPi1jzaNjBfXjMZ5cJus5ZvQh6sW0O82nIkAYgiP6KTxJDTu6v7
 gt/NADZNwAe/t/7Ch3A94ww9/K5UJYAd7sG5iIf3aH9YsUM4cYypWYIGc8ChWfdol4
 6vrQJ44Bqku4A==
Date: Thu, 18 Mar 2021 10:17:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YFOLNGo+/8sKQ7si@google.com>
References: <20210220094052.64905-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210220094052.64905-1-yuchao0@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lMwHL-00Fgd0-Ce
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix to avoid selecting full
 segment w/ {AT, }SSR allocator
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

On 02/20, Chao Yu wrote:
> In cp disabling mode, there could be a condition
> - target segment has 128 ckpt valid blocks
> - GC migrates 128 valid blocks to other segment (segment is still in
> dirty list)
> - GC migrates 384 blocks to target segment (segment has 128 cp_vblocks
> and 384 vblocks)
> - If GC selects target segment via {AT,}SSR allocator, however there is
> no free space in targe segment.
> 
> Fixes: 4354994f097d ("f2fs: checkpoint disabling")
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/gc.c      | 17 +++++++++++++----
>  fs/f2fs/segment.c | 20 ++++++++++++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ed7807103c8e..9c753eff0814 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3376,6 +3376,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
>  int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
>  void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
>  void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>  void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>  void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 86ba8ed0b8a7..a1d8062cdace 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -392,10 +392,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>  		if (p->gc_mode == GC_AT &&
>  			get_valid_blocks(sbi, segno, true) == 0)
>  			return;
> -
> -		if (p->alloc_mode == AT_SSR &&
> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
> -			return;
>  	}
>  
>  	for (i = 0; i < sbi->segs_per_sec; i++)
> @@ -736,6 +732,19 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>  			goto next;
>  
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +			/*
> +			 * to avoid selecting candidate which has below valid
> +			 * block distribution:
> +			 * partial blocks are valid and all left ones are valid
> +			 * in previous checkpoint.
> +			 */
> +			if (p.alloc_mode == SSR || p.alloc_mode == AT_SSR) {
> +				if (!segment_has_free_slot(sbi, segno))
> +					goto next;

Do we need to change this to check free_slot instead of get_ckpt_valid_blocks()?

 732                 if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 733                                         get_ckpt_valid_blocks(sbi, segno) &&
 734                                         p.alloc_mode == LFS))


> +			}
> +		}
> +
>  		if (is_atgc) {
>  			add_victim_entry(sbi, &p, segno);
>  			goto next;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 2d5a82c4ca15..deaf57e13125 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2650,6 +2650,26 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>  		seg->next_blkoff++;
>  }
>  
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
> +{
> +	struct sit_info *sit = SIT_I(sbi);
> +	struct seg_entry *se = get_seg_entry(sbi, segno);
> +	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> +	unsigned long *target_map = SIT_I(sbi)->tmp_map;
> +	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
> +	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> +	int i, pos;
> +
> +	down_write(&sit->sentry_lock);
> +	for (i = 0; i < entries; i++)
> +		target_map[i] = ckpt_map[i] | cur_map[i];
> +
> +	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
> +	up_write(&sit->sentry_lock);
> +
> +	return pos < sbi->blocks_per_seg;
> +}
> +
>  /*
>   * This function always allocates a used segment(from dirty seglist) by SSR
>   * manner, so it should recover the existing segment information of valid blocks
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
