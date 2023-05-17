Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF46706A06
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 15:37:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzHKr-00088k-Js;
	Wed, 17 May 2023 13:36:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzHKq-00088b-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 13:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R9gUm5j6PTavyEx/UfJanmMk6fkJwkAafuBoGLaDNrA=; b=jsebwS6X7T+W0Hr8+AJsPGliKt
 +farfRUC8xbt2R3mTatz7av1pa764T9IgH/lb/sPQXpjTQq7/q4fo1QDmfFlmFHlNw+J+bNf/TtYr
 R+OSrtLx4fdVG+8tZJypo+AAOI+KNuZWU5Bt2KcB/HCFpzK3/5Ay9RchfciOD2PboAWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R9gUm5j6PTavyEx/UfJanmMk6fkJwkAafuBoGLaDNrA=; b=ikikpsZO60oXQcjFNgGOjR7KQ9
 v+M1gb2jHaJpulnbPrQWLc/duKNYUeEhy6f3SCQoFi8j5XIQwxMaMBdnMoqwBV+2/amGbGTTv/661
 q4CSfLKZaxP7oFaSSkygSR6ZGIluFNVTPhUBCvNbYFMW4mSn+y5R7/K+UgZeS7UsPQ+I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzHKp-00B5xr-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 13:36:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EAC86476A;
 Wed, 17 May 2023 13:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FC0C433EF;
 Wed, 17 May 2023 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684330609;
 bh=lO144r6CK1TPpau9g2vp5xuGnLY2p7oRGdi8Zd3Nqu8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gVVdMtf/uLoQFJQ2AbSYAYGVuiFwGpw45kVaWTmvlloRgBuVwfMBql2R5WrU+Rnjf
 78ckd2jhmmwHSwTfrV2N28bcu0R6gbMnUrEFdTtaumj8rEySxPZ7V+/Guj1emax3pn
 TkT7aSyC+qDNiM5wp55t3xM0fFXkXYQIxhcpfgmvY42jUJGJpJP9c6M7omfXEaZGyW
 Zk4Yydo9BZ5nB/jBG2MX2m7xZoojaLf9PVDcWQvATdC2yeu/W9LLcIuWTNQgv9E6B0
 s2ykRJzIQSzYMT14l/2QoZnzoxOR5sGBqacIvoE6Ab8T+i4Z0x9VHzImV2VdpCCTWh
 0ddRGP35mdDZQ==
Message-ID: <394fcfcd-c680-f76d-a590-95f815eec033@kernel.org>
Date: Wed, 17 May 2023 21:36:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230517124600.66160-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230517124600.66160-1-guochunhai@vivo.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/17 20:46, Chunhai Guo wrote: > find_fsync_inode()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzHKp-00B5xr-LJ
Subject: Re: [f2fs-dev] [PATCH v3] fsck.f2fs: Detect and fix looped node
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

On 2023/5/17 20:46, Chunhai Guo wrote:
> find_fsync_inode() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue in the
> last node of the chain.
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
>   fsck/mount.c | 123 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 105 insertions(+), 18 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d57caf..f89c44c3c00b 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3394,22 +3394,91 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
> +	if (node_blk->footer.nid == node_blk->footer.ino)
> +		err = write_inode(node_blk, blkaddr_tmp);
> +	else
> +		err = dev_write_block(node_blk, blkaddr_tmp);
> +	if (!err)
> +		FIX_MSG("Fix looped node chain on blkaddr %u\n",
> +				blkaddr_tmp);
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
> @@ -3440,19 +3509,37 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
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
> +			err = find_node_blk_fast(sbi, &blkaddr_fast,
> +					node_blk_fast, &is_detecting);
> +			if (err)
> +				break;
> +
> +			if (blkaddr_fast != blkaddr)
> +				continue;
> +
> +			MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
> +					blkaddr);

ASSERT_MSG() to set c.bug_on.

> +
> +			err = loop_node_chain_fix(sbi,
> +					NEXT_FREE_BLKADDR(sbi, curseg),
> +					node_blk_fast, blkaddr, node_blk);

Call loop_node_chain_fix() only if c.fix_on is 1.

Thanks,

> +			if (err)
> +				break;
> +
> +			/* After fixing the looped node chain, retry agian. */
> +			is_detecting = false;
> +			destroy_fsync_dnodes(head);
> +			goto retry;
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
