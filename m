Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AAD51D319
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 May 2022 10:14:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmt6a-0002Bv-5n; Fri, 06 May 2022 08:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmt6O-0002BO-0H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 08:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NG4QodEOs/b4UgRAb9F/xWcJB8CxQ3TkWidkjfYoNhQ=; b=KN5N0W2GMbkYJy8s6Nbq+0E1/v
 nsq3pG5WYA09nTINVmtC7veNWbynkl/nbrXfw91JWvwImWXZbiI2PNrrkawbV8wAiaiSwWJdSpaYy
 kwj/PNi5LqeCuZl509fia6mZRBXIQPih5OcjJIooBM9Gys5Fj1Gk9CcMioG7OFxdilv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NG4QodEOs/b4UgRAb9F/xWcJB8CxQ3TkWidkjfYoNhQ=; b=MM/aJ/OnYLHPfKcxR0IY2x5CZq
 6WavVEXsztAHfqk+LwCZ/PRw1nfJ5VUfbuNhfhxMsZX12ElvcQrOUJHJZ5dj8XwIJgNZC2k4BlRdv
 NI5hB+asZ2BDebfrJUV2L3xBrbRCVVC3sMVskMTxbuXUnRhyy5nWcrhoP3DcLCXpI+1M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmt6H-0004SU-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 08:14:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11DC4B83251;
 Fri,  6 May 2022 08:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A39C385A8;
 Fri,  6 May 2022 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651824841;
 bh=NdRnHLc4sTJTVQDXoFXpoUOkiRR+YJI2goNKmE6WrCY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ps6d6TqBGmTWULKq25NBir1JJk3vx4ykMFMS/67bTRU/lw54bvd3Q5Xy/lJV0AIv7
 lPU2Xt5EwBYCmTV2ykfJwSqEXThRwgZbSdm22mkt5D7WRWrFTW2dBwSXmfNWw2Lt55
 oksmNv9R+6fi6+vx+EdyZipaUKLksD63NMZ6ffyNorSdqAAaTAk/G3N0OYa3yqosR3
 8YQThuceEnZhKPaZCYA2c25yvYxyc1DWRTaBgfErmLC1lY7p19N7kw5k/81g0tj/nV
 OWEo5v+TlRWpr1smvvklKzOazilfQijZHSahf5zVv+awChK2dnJ0qLyFt95INmJiuT
 JERXgmM8kPmVQ==
Message-ID: <d04fcb4c-fd6c-c73d-fa1e-c91628b94de1@kernel.org>
Date: Fri, 6 May 2022 16:13:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220429065446.208019-1-changfengnan@vivo.com>
 <20220429065446.208019-4-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220429065446.208019-4-changfengnan@vivo.com>
X-Spam-Score: -8.9 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/29 14:54, Fengnan Chang wrote: > Try to support
 compressed file write amplifiction accounting. Well, how about adding this
 info into iostat fwk? including read amplification? Thanks, 
 Content analysis details:   (-8.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmt6H-0004SU-Aw
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: support compressed file write
 amplifiction accounting
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

On 2022/4/29 14:54, Fengnan Chang wrote:
> Try to support compressed file write amplifiction accounting.

Well, how about adding this info into iostat fwk? including read amplification?

Thanks,

> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c  | 14 ++++++++++----
>   fs/f2fs/debug.c |  5 +++--
>   fs/f2fs/f2fs.h  | 17 +++++++++++++++++
>   3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index dd9a97f6900c..fe64f2328c97 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2900,11 +2900,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
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
> @@ -3039,7 +3039,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   #endif
>   			nwritten += submitted;
>   			wbc->nr_to_write -= submitted;
> -
>   			if (unlikely(ret)) {
>   				/*
>   				 * keep nr_to_write, since vfs uses this to
> @@ -3105,6 +3104,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
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
> @@ -3369,6 +3374,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   			err = ret;
>   			goto fail;
>   		} else if (ret) {
> +			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
>   			return 0;
>   		}
>   	}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index fcdf253cd211..d5e1ab7abedb 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -139,6 +139,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>   	si->inline_dir = atomic_read(&sbi->inline_dir);
>   	si->compr_inode = atomic_read(&sbi->compr_inode);
>   	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
> +	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
>   	si->append = sbi->im[APPEND_INO].ino_num;
>   	si->update = sbi->im[UPDATE_INO].ino_num;
>   	si->orphans = sbi->im[ORPHAN_INO].ino_num;
> @@ -389,8 +390,8 @@ static int stat_show(struct seq_file *s, void *v)
>   			   si->inline_inode);
>   		seq_printf(s, "  - Inline_dentry Inode: %u\n",
>   			   si->inline_dir);
> -		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
> -			   si->compr_inode, si->compr_blocks);
> +		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld\n",
> +			   si->compr_inode, si->compr_blocks, si->compr_wa_blocks);
>   		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
>   			   si->orphans, si->append, si->update);
>   		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4b005d7f326a..42030a8cef45 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1750,6 +1750,7 @@ struct f2fs_sb_info {
>   	atomic_t inline_dir;			/* # of inline_dentry inodes */
>   	atomic_t compr_inode;			/* # of compressed inodes */
>   	atomic64_t compr_blocks;		/* # of compressed blocks */
> +	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
>   	atomic_t vw_cnt;			/* # of volatile writes */
>   	atomic_t max_aw_cnt;			/* max # of atomic writes */
>   	atomic_t max_vw_cnt;			/* max # of volatile writes */
> @@ -3828,6 +3829,7 @@ struct f2fs_stat_info {
>   	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
>   	int compr_inode;
>   	unsigned long long compr_blocks;
> +	long long compr_wa_blocks;
>   	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
>   	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
>   	unsigned int bimodal, avg_vblocks;
> @@ -3916,6 +3918,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
>   #define stat_sub_compr_blocks(inode, blocks)				\
>   		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
> +#define stat_add_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_sub_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
>   #define stat_inc_meta_count(sbi, blkaddr)				\
>   	do {								\
>   		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
> @@ -4011,6 +4017,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>   #define stat_dec_compr_inode(inode)			do { } while (0)
>   #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
>   #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_wa_blocks(inode, blocks)	do { } while (0)
> +#define stat_sub_compr_wa_blocks(inode, blocks)	do { } while (0)
>   #define stat_update_max_atomic_write(inode)		do { } while (0)
>   #define stat_inc_volatile_write(inode)			do { } while (0)
>   #define stat_dec_volatile_write(inode)			do { } while (0)
> @@ -4445,6 +4453,15 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
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
>   static inline int block_unaligned_IO(struct inode *inode,
>   				struct kiocb *iocb, struct iov_iter *iter)
>   {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
