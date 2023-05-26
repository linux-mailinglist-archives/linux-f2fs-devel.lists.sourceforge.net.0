Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4E711E71
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 05:28:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2O8I-00026h-Kf;
	Fri, 26 May 2023 03:28:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2O8H-00026b-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 03:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lAOdr13d1ZWItJaWdF0wjJqZnxR5BsQ1sAujkiDYj9w=; b=Oev9/14bODPLjI8AmI/YbgWb84
 K1l9Qt8EHqe1BVpXO5eXij4xf0TT/ozrdWFtRWRdpAJxQMOAlTt0g5H4doLQZmHsinHBl/AQIy//b
 39UFKHTrF1b4DGBseN0tWg9LI6EXz4f0JosIa7hnnhAwsfbmCeYpvxun6pMakRwhWikU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lAOdr13d1ZWItJaWdF0wjJqZnxR5BsQ1sAujkiDYj9w=; b=ZmYIncLvz63CdAnPfDec2bH7p3
 wzgX9bB/5MqpEegw9YbylCUW+Tx5HOFDYJ9AyhqQg0xSB2gkRqT2korMM/Ybb1aLIJ8XdoawhxM28
 Vv3l5M0CGaTv4O9A9MrUzZJrLXBOd+nK7l0LoxFXQv4Y1y2KhvmlOIJjH9NrEFU4KgiE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2O7x-0006Gn-7C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 03:28:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA07460AB4;
 Fri, 26 May 2023 03:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C077C433EF;
 Fri, 26 May 2023 03:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685071703;
 bh=hOkTUhX7SLqXrGQMJon5UdIGGFM35WQqlJV4qp28fzQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X4Uq15t0xbUan1sWiYt/XrgvuPDVEBJkJ+U5C0OP9sfkNFD/c+Nq6Fyb+hVIqmpLy
 NBm2xjRAvo442Cs6B0d5m12JEQJ4nMc9uMPEvVMIK/S8+FQQxC2WPgBSKuEuVe95zD
 CDw8/Sb+Ix4ql7yB/xt4P8Yn+UHbxcC1xBTZVaB/e+2Gc75CW+OPH/jaocmkmUnCxs
 dGGM815ZeT/Qz81UA/MUD31xTsr507/xR7bA1TH4SkLrZpQaUXZQ7P/tNzQbgy0H+m
 8SaZFL4+EjeiVAI3UcF7DG3RQZmEZ9P+9BhGllDdF9yr174LbIqRTURAC/BzC6CsGZ
 JtApabKEQPU5g==
Message-ID: <031ec210-7806-1bfc-9786-c246f2d1ae50@kernel.org>
Date: Fri, 26 May 2023 11:28:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230524083329.10494-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230524083329.10494-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/24 16:33, Chunhai Guo wrote: > find_fsync_dnodes()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free bl [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2O7x-0006Gn-7C
Subject: Re: [f2fs-dev] [PATCH] f2fs: Detect and fix looped node chain
 efficiently
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
Cc: linux-f2fs-devel@lists.sourceforge.net, frank.li@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/24 16:33, Chunhai Guo wrote:
> find_fsync_dnodes() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue by
> filling a NULL address in the last node of the chain.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fs/f2fs/recovery.c | 135 ++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 116 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 58c1a0096f7d..1b94078947cb 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -360,21 +360,98 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
>   	return ra_blocks;
>   }
>   
> +static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
> +		bool *is_detecting)
> +{
> +	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
> +	struct page *page = NULL;
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
> +			*is_detecting = false;
> +			return 0;
> +		}
> +
> +		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +
> +		if (!is_recoverable_dnode(page)) {
> +			f2fs_put_page(page, 1);
> +			*is_detecting = false;
> +			return 0;
> +		}
> +
> +		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
> +						next_blkaddr_of_node(page));
> +
> +		*blkaddr_fast = next_blkaddr_of_node(page);
> +		f2fs_put_page(page, 1);
> +
> +		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
> +	}
> +
> +	return 0;
> +}
> +
> +static int loop_node_chain_fix(struct f2fs_sb_info *sbi, block_t blkaddr_fast,
> +		block_t blkaddr)
> +{
> +	struct page *page = NULL;
> +	block_t blkaddr_entry, blkaddr_tmp;
> +	struct f2fs_node *rn;
> +
> +	/* find the entry point of the looped node chain */
> +	while (blkaddr_fast != blkaddr) {
> +		page = f2fs_get_tmp_page(sbi, blkaddr_fast);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +		blkaddr_fast = next_blkaddr_of_node(page);
> +		f2fs_put_page(page, 1);
> +
> +		page = f2fs_get_tmp_page(sbi, blkaddr);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +		blkaddr = next_blkaddr_of_node(page);
> +		f2fs_put_page(page, 1);
> +	}
> +	blkaddr_entry = blkaddr;
> +
> +	/* find the last node of the chain */
> +	do {
> +		blkaddr_tmp = blkaddr;
> +		page = f2fs_get_tmp_page(sbi, blkaddr);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +		blkaddr = next_blkaddr_of_node(page);
> +		if (blkaddr != blkaddr_entry)
> +			f2fs_put_page(page, 1);
> +	} while (blkaddr != blkaddr_entry);
> +
> +	/* fix the blkaddr of last node with NULL_ADDR. */
> +	rn = F2FS_NODE(page);
> +	rn->footer.next_blkaddr = NULL_ADDR;
> +	f2fs_inode_chksum_set(sbi, page);
> +	set_page_dirty(page);
> +	f2fs_put_page(page, 1);
> +	f2fs_notice(sbi, "Fix looped node chain on blkaddr %u\n", blkaddr_tmp);
> +	return 0;
> +}
> +
>   static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
>   				bool check_only)
>   {
>   	struct curseg_info *curseg;
>   	struct page *page = NULL;
> -	block_t blkaddr;
> -	unsigned int loop_cnt = 0;
> -	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
> -	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
> -						valid_user_blocks(sbi);
> +	block_t blkaddr, blkaddr_fast;
> +	bool is_detecting = true;
>   	int err = 0;
>   
>   	/* get node pages in the current segment */
>   	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
>   	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
> +	blkaddr_fast = blkaddr;
>   
>   	while (1) {
>   		struct fsync_inode_entry *entry;
> @@ -431,25 +508,45 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
>   		if (IS_INODE(page) && is_dent_dnode(page))
>   			entry->last_dentry = blkaddr;
>   next:
> -		/* sanity check in order to detect looped node chain */
> -		if (++loop_cnt >= free_blocks ||
> -			blkaddr == next_blkaddr_of_node(page)) {
> -			f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u, next:%u",
> -				    __func__, blkaddr,
> -				    next_blkaddr_of_node(page));
> -			f2fs_put_page(page, 1);
> +		/* check next segment */
> +		blkaddr = next_blkaddr_of_node(page);
> +		f2fs_put_page(page, 1);
> +
> +		/* Below we will detect looped node chain with Floyd's cycle
> +		 * detection algorithm.
> +		 */
> +		if (!is_detecting)
> +			continue;
> +
> +		err = find_node_blk_fast(sbi, &blkaddr_fast, &is_detecting);
> +		if (err)
> +			break;
> +
> +		if (!is_detecting)
> +			continue;
> +
> +		if (blkaddr_fast != blkaddr)
> +			continue;
> +
> +		f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u",
> +				__func__, blkaddr);
> +
> +		if (check_only) {
>   			err = -EINVAL;
>   			break;
>   		}
>   
> -		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
> -						next_blkaddr_of_node(page));

What about just bailing out if there is a loop in chain and do repair in fsck?

Thanks,

> -
> -		/* check next segment */
> -		blkaddr = next_blkaddr_of_node(page);
> -		f2fs_put_page(page, 1);
> +		err = loop_node_chain_fix(sbi, blkaddr,
> +				NEXT_FREE_BLKADDR(sbi, curseg));
> +		if (err)
> +			break;
>   
> -		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
> +		/* Since we call get_fsync_inode() to ensure there are
> +		 * no duplicate inodes in the inode_list even if there
> +		 * are duplicate blkaddr, we can continue running
> +		 * after fixing the looped node chain.
> +		 */
> +		is_detecting = false;
>   	}
>   	return err;
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
