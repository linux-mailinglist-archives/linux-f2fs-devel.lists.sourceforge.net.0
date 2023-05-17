Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281D705DB0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 05:04:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz7Sq-0000KT-3y;
	Wed, 17 May 2023 03:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz7So-0000KM-Eb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 03:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itKI0JwrlwGqcjREtPN6fobhOH38lsiC83/nmZzWry0=; b=YGqgwnTDkrZB90U/iw96AY4yDx
 ee/Zr4o+ib3e/4JOAFi/3Um/k46vgCtTBY6n0wVALlu+2rSpy9oCjSGSLStlN34pVEE4q2LBlzOod
 11xKHdnBWWzRgRYA9yOktzJQehjeNRaCNBwfwjZ6Mj9xC5bZv+zGIn2qhEZIzH3OTFgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itKI0JwrlwGqcjREtPN6fobhOH38lsiC83/nmZzWry0=; b=MfV+pd6c4UKewMijKXjBefcYN/
 +q7HXVTJTVXEAXKHoK6NsfuB9fXSKNgb9o+Eavu5sdNBX3OOB92EvUWqW69+3cJEi4/U8yUozl7+4
 uIrsjTc6d9yUug5Spar4/mOT/dfjlH44Kzl/mzpWvSKksbLAMeXScw5Eev1CjzI8d4wo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz7Sk-00ARBI-TG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 03:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8240C64121;
 Wed, 17 May 2023 03:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F9DC433D2;
 Wed, 17 May 2023 03:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684292660;
 bh=h+pkqZ0xoAQM4QKZdhh0T9UUWsrm1cPbu/G9EqMKV34=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=lE0wf3kbq1YPRYC8UaOKDlw2pMI0WEQKynHguioFAui4gGS2BGY3fcIJE5Nn9ARvj
 8KlL21iD19CIoWluaz0FwfAK1ajKpV9FxWEDgRxltcybsUSXulIHxbbjshixg5DKj1
 XB5fPX0cCIAJN2GEI/Mo5elz9a0X9Rnmr1SZ5W/JXgQdi4FvKRIO8QxkSnOcbq1Ny2
 8dxdcENXfHOXHnZ8r2NLvNOBePT1tbfKIXyYLHQLtG5EPjJfkwjhfrOv6U0eT+470L
 30K6wnFhYrsZ7GbU6o+c4qzbfbpmceB2UFJzhFj0X3EIHUl99G7B7krVG/473gH+LR
 mT+gIvSGvMxRA==
Message-ID: <c54420ef-5d2b-75cc-2110-fdcff2e59d0e@kernel.org>
Date: Wed, 17 May 2023 11:04:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230516142722.18931-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230516142722.18931-1-guochunhai@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/16 22:27, Chunhai Guo wrote: > find_fsync_inode()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz7Sk-00ARBI-TG
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: Detect and fix looped node
 chain efficiently
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

On 2023/5/16 22:27, Chunhai Guo wrote:
> find_fsync_inode() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue by
> filling a NULL address in the last node of the chain.
> 
> Below is the log we encounter on a 256GB UFS storage and it takes about
> 25 seconds to detect looped node chain. After changing the algorithm, it
> takes about 20ms to finish the same job.
> 
>      [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
>      [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
> update superblock
>      [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
> encrypt verity extra_attr project_quota quota_ino casefold
>      [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
> 00000000000000000000000000000000
>      [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
> MB)
>      [   35.852827] fsck.f2fs:	detect looped node chain,
> blkaddr:1114802, next:1114803
>      [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
> failed
>      [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fsck/mount.c | 122 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 104 insertions(+), 18 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d57caf..478043035c95 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3394,22 +3394,89 @@ static void destroy_fsync_dnodes(struct list_head *head)
>   		del_fsync_inode(entry);
>   }
>   
> +static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
> +		struct f2fs_node *node_blk_fast, bool *is_detecting)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
> +			*is_detecting = false;
> +			return 0;
> +		}
> +
> +		err = dev_read_block(node_blk_fast, *blkaddr_fast);
> +		if (err)
> +			return err;
> +
> +		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
> +			*is_detecting = false;
> +			return 0;
> +		}
> +
> +		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
> +	}
> +
> +	return 0;
> +}
> +
> +static int loop_node_chain_fix(struct f2fs_sb_info *sbi,
> +		block_t blkaddr_fast, struct f2fs_node *node_blk_fast,
> +		block_t blkaddr, struct f2fs_node *node_blk)
> +{
> +	block_t blkaddr_entry, blkaddr_tmp;
> +	int err;
> +
> +	/* find the entry point of the looped node chain */
> +	while (blkaddr_fast != blkaddr) {
> +		err = dev_read_block(node_blk_fast, blkaddr_fast);
> +		if (err)
> +			return err;
> +		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
> +
> +		err = dev_read_block(node_blk, blkaddr);
> +		if (err)
> +			return err;
> +		blkaddr = next_blkaddr_of_node(node_blk);
> +	}
> +	blkaddr_entry = blkaddr;
> +
> +	/* find the last node of the chain */
> +	do {
> +		blkaddr_tmp = blkaddr;
> +		err = dev_read_block(node_blk, blkaddr);
> +		if (err)
> +			return err;
> +		blkaddr = next_blkaddr_of_node(node_blk);
> +	} while (blkaddr != blkaddr_entry);
> +
> +	/* fix the blkaddr of last node with NULL_ADDR. */
> +	node_blk->footer.next_blkaddr = NULL_ADDR;

If node_blk is inode block, the change will break its chksum.

Or we can record blkaddr_tmp into f2fs_configuration? And break
the loop once we traverse to the blkaddr during find_fsync_inode()
and traverse_dnodes()?

> +	err = dev_write_block(node_blk, blkaddr_tmp);
> +	if (!err)
> +		FIX_MSG("Fix looped node chain on blkaddr %u\n",
> +				blkaddr_tmp);
> +
> +	return err;
> +}
> +
>   static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   {
>   	struct curseg_info *curseg;
> -	struct f2fs_node *node_blk;
> -	block_t blkaddr;
> -	unsigned int loop_cnt = 0;
> -	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
> -						sbi->total_valid_block_count;
> +	struct f2fs_node *node_blk, *node_blk_fast;
> +	block_t blkaddr, blkaddr_fast;
> +	bool is_detecting = true;
>   	int err = 0;
>   
> +	node_blk = calloc(F2FS_BLKSIZE, 1);
> +	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
> +	ASSERT(node_blk && node_blk_fast);
> +
> +retry:
>   	/* get node pages in the current segment */
>   	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
>   	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
> -
> -	node_blk = calloc(F2FS_BLKSIZE, 1);
> -	ASSERT(node_blk);
> +	blkaddr_fast = blkaddr;
>   
>   	while (1) {
>   		struct fsync_inode_entry *entry;
> @@ -3440,19 +3507,38 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
>   			entry->last_dentry = blkaddr;
>   next:
> -		/* sanity check in order to detect looped node chain */
> -		if (++loop_cnt >= free_blocks ||
> -			blkaddr == next_blkaddr_of_node(node_blk)) {
> -			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
> -				    blkaddr,
> -				    next_blkaddr_of_node(node_blk));
> -			err = -1;
> -			break;
> -		}
> -
>   		blkaddr = next_blkaddr_of_node(node_blk);
> +
> +		/* sanity check to detect looped node chain with Floyd's cycle
> +		 * detection algorithm
> +		 */
> +		if (is_detecting) {
> +			err = find_node_blk_fast(sbi, &blkaddr_fast, node_blk_fast,
> +					&is_detecting);
> +			if (err)
> +				break;
> +
> +			if (blkaddr_fast == blkaddr) {
	if (blkaddr_fast != blkaddr)
		continue;

	err = loop_node_chain_fix()
	if (err)
		break;

To avoid too many indentions.

Thanks,

> +				MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
> +						blkaddr);
> +
> +				err = loop_node_chain_fix(sbi,
> +						NEXT_FREE_BLKADDR(sbi, curseg),
> +						node_blk_fast, blkaddr, node_blk);
> +				if (!err) {
> +					/* after fixing the looped node chain,
> +					 * retry agian.
> +					 */
> +					is_detecting = false;
> +					destroy_fsync_dnodes(head);
> +					goto retry;
> +				} else
> +					break;
> +			}
> +		}
>   	}
>   
> +	free(node_blk_fast);
>   	free(node_blk);
>   	return err;
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
