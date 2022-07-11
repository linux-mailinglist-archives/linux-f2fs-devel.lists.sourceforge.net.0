Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DF56FE62
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jul 2022 12:11:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oAqNm-00061w-3z; Mon, 11 Jul 2022 10:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oAqNk-00061p-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jul 2022 10:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BiYfTjYh9yi3nyGZSX7qRvG6anxalkcv9F4iubCie4U=; b=GLrWFROv43EQspWzNQzAdODKmQ
 454K/h/aeL8X2KWxHNwhNL0DphKOMB22mAUkz2sTOLwCG2F9o3xqU21PEG4u3RJ1obne7kXvstIn3
 2K/Kn9nQmfKZY9Ld4zRgi9Eh2fdnWQh5MtYJAa6hgXlTPZEqfzZVkdDsPufbrd8L5pAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BiYfTjYh9yi3nyGZSX7qRvG6anxalkcv9F4iubCie4U=; b=jbpSj2QFnlrfCwkvkixVNdjDJi
 nw7LJIOY3o5Sk0zFPF2Ex04ySlodmj9gIqmWYRG4QcfS40s4luMsZttvTHd2sD2RdztoWE4LsDXMa
 mM4kScRDpnTn4+KHWRnXk3w8zC8x2q97z22GoOz56IF0fWPpEvg9Yr/wSfEeVgYtoea0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oAqNi-00Di4M-OY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jul 2022 10:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58C9C61026;
 Mon, 11 Jul 2022 10:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E11C341C0;
 Mon, 11 Jul 2022 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657534264;
 bh=idsCFksABdruCiIXFIQaya/TMMFxy8GuxHYbPiCzAXw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TLImeoHNrw9FmLVO207ENeGCCNxRVx6IGTQy5+yXMs2FWIGHIvTf2vzzek4eugjNv
 gQ3bYbO2cbykBgA59eeFuArnbFUg/PbRy2JzkSp69Qr/B65fGawu2utgdldnbmL/T2
 epGoHiCzy12Tl1L1SIbfpIxjTTDEeoJDLAjAJxMrBECOdskAQ4hRWQaT2zMM3dLMDq
 hU4EoENi7zYbyffC2QKyVr86MYqPjaGeaiZZq5v9zaL16ON7d5a2WoT6AtNnC5akK4
 hApC2U+ORClQeTMeL1DmU03wIEO5p6v4nL08dqbdmKGzpS8rVxiKuSVx8/xxfB2ZgO
 Vv4w/FUWmFrwg==
Message-ID: <dbf6e418-fe9d-e20e-e29f-3bbb318ea68c@kernel.org>
Date: Mon, 11 Jul 2022 18:10:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220507081710.117162-1-changfengnan@vivo.com>
 <20220507081710.117162-4-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220507081710.117162-4-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 16:17,
 Fengnan Chang wrote: > Try to support compressed
 file write and amplifiction accounting. > > Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com> > --- > fs/f2fs/data.c | 19 +++++++ [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oAqNi-00Di4M-OY
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: support compressed file
 write/read amplifiction
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 16:17, Fengnan Chang wrote:
> Try to support compressed file write and amplifiction accounting.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c  | 19 +++++++++++++++----
>   fs/f2fs/debug.c |  7 +++++--
>   fs/f2fs/f2fs.h  | 34 ++++++++++++++++++++++++++++++++++
>   3 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0ae7819b085d..98c3d05cae1d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2234,6 +2234,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		*last_block_in_bio = blkaddr;
>   	}
>   
> +	if (cc->nr_cpages > cc->nr_rpages)
> +		f2fs_i_compr_ra_blocks_update(inode, cc->nr_cpages - cc->nr_rpages, true);
> +	else
> +		f2fs_i_compr_ra_blocks_update(inode, cc->nr_rpages - cc->nr_cpages, false);

Well, w/ COMPRESS_CACHE option, compressed block can be reused during readpage() or
readahead(), in such case, nr_cpages can be wrong here?

Thanks,

> +
>   	if (from_dnode)
>   		f2fs_put_dnode(&dn);
>   
> @@ -2900,11 +2905,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	int range_whole = 0;
>   	xa_mark_t tag;
>   	int nwritten = 0;
> -	int submitted = 0;
> +	int submitted = 0, raw_dirty_pages = 0;
>   	int i;
>   
> -	if (get_dirty_pages(mapping->host) <=
> -				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
> +	raw_dirty_pages = get_dirty_pages(mapping->host);
> +	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
>   		set_inode_flag(mapping->host, FI_HOT_DATA);
>   	else
>   		clear_inode_flag(mapping->host, FI_HOT_DATA);
> @@ -3039,7 +3044,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   #endif
>   			nwritten += submitted;
>   			wbc->nr_to_write -= submitted;
> -
>   			if (unlikely(ret)) {
>   				/*
>   				 * keep nr_to_write, since vfs uses this to
> @@ -3105,6 +3109,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	if (bio)
>   		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
>   
> +	if (f2fs_compressed_file(inode)) {
> +		if (nwritten > raw_dirty_pages)
> +			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
> +		else
> +			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
> +	}
>   	return ret;
>   }
>   
> @@ -3369,6 +3379,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   			err = ret;
>   			goto fail;
>   		} else if (ret) {
> +			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
>   			return 0;
>   		}
>   	}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index fcdf253cd211..32d06990b1a6 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -139,6 +139,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>   	si->inline_dir = atomic_read(&sbi->inline_dir);
>   	si->compr_inode = atomic_read(&sbi->compr_inode);
>   	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
> +	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
> +	si->compr_ra_blocks = atomic64_read(&sbi->compr_ra_blocks);
>   	si->append = sbi->im[APPEND_INO].ino_num;
>   	si->update = sbi->im[UPDATE_INO].ino_num;
>   	si->orphans = sbi->im[ORPHAN_INO].ino_num;
> @@ -389,8 +391,9 @@ static int stat_show(struct seq_file *s, void *v)
>   			   si->inline_inode);
>   		seq_printf(s, "  - Inline_dentry Inode: %u\n",
>   			   si->inline_dir);
> -		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
> -			   si->compr_inode, si->compr_blocks);
> +		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld, RA Blocks %lld\n",
> +			   si->compr_inode, si->compr_blocks,
> +			   si->compr_wa_blocks, si->compr_ra_blocks);
>   		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
>   			   si->orphans, si->append, si->update);
>   		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d9c2795dd34d..ab09281c28bb 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1751,6 +1751,8 @@ struct f2fs_sb_info {
>   	atomic_t inline_dir;			/* # of inline_dentry inodes */
>   	atomic_t compr_inode;			/* # of compressed inodes */
>   	atomic64_t compr_blocks;		/* # of compressed blocks */
> +	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
> +	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
>   	atomic_t vw_cnt;			/* # of volatile writes */
>   	atomic_t max_aw_cnt;			/* max # of atomic writes */
>   	atomic_t max_vw_cnt;			/* max # of volatile writes */
> @@ -3829,6 +3831,8 @@ struct f2fs_stat_info {
>   	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
>   	int compr_inode;
>   	unsigned long long compr_blocks;
> +	long long compr_wa_blocks;
> +	long long compr_ra_blocks;
>   	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
>   	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
>   	unsigned int bimodal, avg_vblocks;
> @@ -3917,6 +3921,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
>   #define stat_sub_compr_blocks(inode, blocks)				\
>   		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
> +#define stat_add_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_sub_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_add_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
> +#define stat_sub_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
>   #define stat_inc_meta_count(sbi, blkaddr)				\
>   	do {								\
>   		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
> @@ -4012,6 +4024,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>   #define stat_dec_compr_inode(inode)			do { } while (0)
>   #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
>   #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_wa_blocks(inode, blocks)	do { } while (0)
> +#define stat_sub_compr_wa_blocks(inode, blocks)	do { } while (0)
> +#define stat_add_compr_ra_blocks(inode, blocks)	do { } while (0)
> +#define stat_sub_compr_ra_blocks(inode, blocks)	do { } while (0)
>   #define stat_update_max_atomic_write(inode)		do { } while (0)
>   #define stat_inc_volatile_write(inode)			do { } while (0)
>   #define stat_dec_volatile_write(inode)			do { } while (0)
> @@ -4444,6 +4460,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   }
>   
> +static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_wa_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_wa_blocks(inode, blocks);
> +}
> +
> +static inline void f2fs_i_compr_ra_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_ra_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_ra_blocks(inode, blocks);
> +}
> +
>   static inline int block_unaligned_IO(struct inode *inode,
>   				struct kiocb *iocb, struct iov_iter *iter)
>   {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
