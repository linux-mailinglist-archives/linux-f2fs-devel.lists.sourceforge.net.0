Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F17130EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 02:43:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2i25-0001Bu-AL;
	Sat, 27 May 2023 00:43:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2i23-0001Bn-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWg7kRz02k7bFUJv4RBoGT8SC0fBBTQbHu0XlUAIHTQ=; b=ZhmlDDDQNFJHPFT8h/YKHaNVeO
 sUQxqvvQdwnS9hMY5NW1hLgo2rOlCnWw0e6cK6V1dOiTkdE/cbDWZ+UVyiN02mFXOb5y+kPOsFj7n
 qbsJbv2oyQK5jpcTbFW9mGn9xUO7aFQ6ktKoHhxHPdNDHA9VXfoOflaVw69MJLIgjchI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWg7kRz02k7bFUJv4RBoGT8SC0fBBTQbHu0XlUAIHTQ=; b=AaGkXPUdybjdHY32dFWLjedFe8
 VPMOIVMNMcV6vLRb9hmENXT7PGDvXZObNIf4TB3fJ+DC144Z4QfgKK9DXgQf79ei/aj4QkQ5llmhJ
 Pc5HAnafVVY9myX2PAS/393GLc/LgISmoMcQ/3/jCTb/Bz8KvyV4beibAhOfjxRjHGME=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2i23-003kEo-I2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:43:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B51C65489;
 Sat, 27 May 2023 00:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF3DC433D2;
 Sat, 27 May 2023 00:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685148217;
 bh=iDm/L+DSociOsP/ZxeZqglVE0nG2j5OXPlLgVmZipxg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qBST0u4IkyK9To2rB6R7vcKAtGycysF7vIYp9hNrSHt6yFplOPT5k20KQX12JOOsc
 D429nrrlmYO9VPoji8QoFeZYzuJoRpxPDUIj8t2zEU8AE85seq47AhkOnTmcwzD1nt
 gT93ZEQUpOScAa0D79k+us/etkOQ2zvUDTg0pivc5WypRpaPV0aKkfX9SBTcCFvgNR
 ADiYDsh4q7qzP4En6yoNn3bl8jMbp3VJuSYHVbHzBRs3XKKncNg2sV/ZFZJqgYgtpe
 zIc5JznGe6R7d2S5VhB8/BVzzR8Vbz7bZVzb28nO0WmRND0vZ8gzVwn1ZBF9oSnbf4
 m2TpVmam6vK9A==
Message-ID: <99887a03-85d8-51dc-a67a-43cc02e6ceb2@kernel.org>
Date: Sat, 27 May 2023 08:43:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230526090820.64114-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230526090820.64114-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/26 17:08, Chunhai Guo wrote: > find_fsync_dnodes()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free bl [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2i23-003kEo-I2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Detect looped node chain efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/26 17:08, Chunhai Guo wrote:
> find_fsync_dnodes() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v1 -> v2 : Bail out if a looped is found in a chain and do repair in fsck.
> ---
>   fs/f2fs/recovery.c | 78 ++++++++++++++++++++++++++++++++++------------
>   1 file changed, 58 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 58c1a0096f7d..c1dceda54a4f 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -360,21 +360,54 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
>   	return ra_blocks;
>   }
>   

What about this?

return value:
- 0: continue the loop
- < 0: break and return

static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
				block_t *blkaddr_fast, bool *is_detecting)
{
	if (!is_detecting)
		return 0;

	for (i = 0; i < 2; i++) {
	...
	}

	if (*blkaddr_fast == blkaddr) {
		f2fs_notice();
		return -EINVAL;
	}

	return 0;
}

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
> @@ -431,25 +464,30 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
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
> -			err = -EINVAL;
> -			break;
> -		}
> -
> -		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
> -						next_blkaddr_of_node(page));
> -
>   		/* check next segment */
>   		blkaddr = next_blkaddr_of_node(page);
>   		f2fs_put_page(page, 1);
>   
> -		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
> +		/* Below we will detect looped node chain with Floyd's cycle
> +		 * detection algorithm.
> +		 */
> +		if (!is_detecting)
> +			continue;
> +
> +		err = find_node_blk_fast(sbi, &blkaddr_fast, &is_detecting);

		/* ... */
		err = sanity_check_node_chain();
		if (err)
			break;

Thanks,

> +		if (err)
> +			break;
> +
> +		if (!is_detecting)
> +			continue;
> +
> +		if (blkaddr_fast == blkaddr) {
> +			f2fs_notice(sbi, "%s: Detect looped node chain on "
> +					"blkaddr:%u. Run fsck to fix it.",
> +					__func__, blkaddr);
> +			err = -EINVAL;
> +			break;
> +		}
>   	}
>   	return err;
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
