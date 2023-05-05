Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB076F8290
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 14:08:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puuEH-00085K-7o;
	Fri, 05 May 2023 12:08:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puuE8-000851-PJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 12:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VE05OMdYR55qpiK1nxSfF9ArhVjAMM8h1kTYWP6Glho=; b=cQNhQyoaRxedIq9dOqy88ekRjE
 aEWoABcf9qMcvMAccwS83G6uTsEl3U83peYbQNxvz5ht9YetEeZSM5a+Tq9VVJfA2Tmi1SEKZ2Z3A
 KCpfYFlgcAjk1dRg0chJ24GoqP2NojTO96KqA1mDQMywsweAXieB8SavFELnvjT1C/qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VE05OMdYR55qpiK1nxSfF9ArhVjAMM8h1kTYWP6Glho=; b=hzecM21opB5QxrLqdIPacZGVwE
 J841lDJ02chgYQiPFmUQ0+uG5/XMij24NeC2aT0HsJVoJVJnJGOzf+AINkob65sBTnl8BsmPrV3bb
 eBF++nO6pWZeJm1XGQd62CU9Yo+0uG9Hp78zQfRKStGnkjYUYoVfqj2e+lvcCNJRVvtM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puuE7-0003cP-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 12:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D63863DA7;
 Fri,  5 May 2023 12:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405C7C433D2;
 Fri,  5 May 2023 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683288470;
 bh=kxuFnp56Va2nSsCuCw2fQRqHerhGWS5+9BN8wx6tKRc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qsh7UA810gbij11juFPVBmXm6YVQeUuZKwZ6Q+hwOMsSW0lB+EcTSqQmdTgxhqfot
 RaPLGsHLiRMWdYHyWZ+n7ixKOtu06n4SvKL4uBJvzHcKG/o8QYGW8/XYEk6QfUvAKs
 gOLc22RMVlN+9P8dwM5EuUjZ0jipMqSAaIsDgMXCC5A8BOmLOeRToKrSHLEDnc0/C7
 8JxMjvwPL89VDwMn4/mklyIV9pGXiSAFS9wIjpZ8O9/MzKIz3pxGubYk3A32Q8NDjn
 /0VsoEhqnRPVYX6fBlXNjVurE6UC9wmt6/fFmXUOx/psQ9/dlnqXY019OSQKYBOqYz
 8O2rSfSb8NC3g==
Message-ID: <bc63bd8f-860c-568e-71cd-ba1d3bd1fc7d@kernel.org>
Date: Fri, 5 May 2023 20:07:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230504033043.55761-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230504033043.55761-1-guochunhai@vivo.com>
X-Spam-Score: -9.7 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/4 11:30, Chunhai Guo wrote: > Now we detect the
 looped node chain by comparing the loop counter with > free blocks. While
 it may take tens of seconds to quit when the free > blocks are large [...]
 Content analysis details:   (-9.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puuE7-0003cP-Uj
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Detect looped node chain more
 efficiently.
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

On 2023/5/4 11:30, Chunhai Guo wrote:
> Now we detect the looped node chain by comparing the loop counter with
> free blocks. While it may take tens of seconds to quit when the free
> blocks are large enough. We can use Floyd's cycle detection algorithm to
> make it more efficient.
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

The patch is clean, but as it is fsck, so any way to fix this issue if we
want to keep fsynced data rather than dropping them w/ norecovery during
mount.

Thanks,

> ---
>   fsck/mount.c | 57 ++++++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d..2e919d9 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3394,22 +3394,48 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
>   	/* get node pages in the current segment */
>   	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
>   	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
> +	blkaddr_fast = blkaddr;
>   
>   	node_blk = calloc(F2FS_BLKSIZE, 1);
> -	ASSERT(node_blk);
> +	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
> +	ASSERT(node_blk && node_blk_fast);
>   
>   	while (1) {
>   		struct fsync_inode_entry *entry;
> @@ -3424,6 +3450,16 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   		if (!is_recoverable_dnode(sbi, node_blk))
>   			break;
>   
> +		/* Here we use Floyd's cycle detection algorithm to detect
> +		 * looped node chain more effeciently.
> +		 */
> +		if (is_detecting) {
> +			err = find_node_blk_fast(sbi, &blkaddr_fast,
> +					node_blk_fast, &is_detecting);
> +			if (err)
> +				break;
> +		}
> +
>   		if (!is_fsync_dnode(node_blk))
>   			goto next;
>   
> @@ -3441,11 +3477,9 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   			entry->last_dentry = blkaddr;
>   next:
>   		/* sanity check in order to detect looped node chain */
> -		if (++loop_cnt >= free_blocks ||
> -			blkaddr == next_blkaddr_of_node(node_blk)) {
> -			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
> -				    blkaddr,
> -				    next_blkaddr_of_node(node_blk));
> +		if (is_detecting && (blkaddr_fast == blkaddr)) {
> +			MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
> +				    blkaddr);
>   			err = -1;
>   			break;
>   		}
> @@ -3453,6 +3487,7 @@ next:
>   		blkaddr = next_blkaddr_of_node(node_blk);
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
