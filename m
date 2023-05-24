Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651C70EAC9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 03:29:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1dJk-0002tF-0F;
	Wed, 24 May 2023 01:29:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q1dJg-0002t8-SR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BumcOv7fjdftozE8Gxwg6ovYebfq/+Hh6ySEcj3xTIE=; b=hTaP9hLGi7N4E1B+eMwZzCywCd
 pvxEw0PViF6haWfTnfuF8COyWlt5UZmxk/RGrXb8Bo6blfzFsog8456dOBzo3UfZEu2z7xEtl7XYA
 2l4JYtbbBpMDxL5e3x7OEbTWsYFnkyJ+DVSQ76GQuPcnp4dcr3pGrd5t3fLUCuFsZumk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BumcOv7fjdftozE8Gxwg6ovYebfq/+Hh6ySEcj3xTIE=; b=H6xXDs1uQUrOPOQ9nZXSSLwLg9
 3HdHjWpvhHNw31XKifUEht7Eh1wv+5JG+knKY92/Wu4lmC9BaTrm1WTgw72xsw3dWibGTfNCRks40
 SNAPgmMRvA9S/FHKD8xYEHMjRDuXjawqyUy0RsL3GxkZ/9BHRbSPnUu7eyd4L8eZnvfo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1dJc-0005CF-1g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C287637BA;
 Wed, 24 May 2023 01:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BA4C433D2;
 Wed, 24 May 2023 01:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684891758;
 bh=Gmok4DEep/fnWHhIB/wKKtCXp6WtiEDt3L1I/UIh/BI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRZno+9qqhhvyUhxrui8sBtwrIkW+xlNsUuij79UQ/ZGREWZ+CpASosKNIqNUpWum
 8+MkWF9/to8n87uXskbYNRtcDQYGCf1/+3NUQNfAepdMfECWAusZM2SYGKqFR8vxRu
 id5+IRq5GSCAmXixoIpGgcRqolJUNuSnw0CjI08QO+gYYToDbLCHK/pSa59FSyyQ0r
 T4xsFTMhyRZCLUu6e5vIqDenfR/eHbgl7kUw0vAP+pyL8qK6JDQewKQ5rO4WTK40k5
 4UOlU4c4q794nCqGiEA2mR+5T6Q3h8GR38bC7Dvqdsq78wQpGzLNjlxUJ3dNYwjDaL
 PAybFPVaCe6PA==
Date: Tue, 23 May 2023 18:29:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <ZG1obHA7vrFzXx6r@google.com>
References: <20230523104059.78315-1-guochunhai@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523104059.78315-1-guochunhai@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/23, Chunhai Guo wrote: > find_fsync_inode() detect the
 looped node chain by comparing the loop > counter with free blocks. While
 it may take tens of seconds to quit when > the free blocks are la [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1dJc-0005CF-1g
Subject: Re: [f2fs-dev] [PATCH v7] fsck.f2fs: Detect and fix looped node
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
Cc: linux-f2fs-devel@lists.sourceforge.net, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/23, Chunhai Guo wrote:
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
>     [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
>     [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
> update superblock
>     [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
> encrypt verity extra_attr project_quota quota_ino casefold
>     [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
> 00000000000000000000000000000000
>     [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
> MB)
>     [   35.852827] fsck.f2fs:	detect looped node chain,
> blkaddr:1114802, next:1114803
>     [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
> failed
>     [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v6 -> v7 : Correct logic error to handle is_detecting return by
> 	find_node_blk_fast().
> v5 -> v6 : Simplify the code by removing unnecessary retry logic.
> v4 -> v5 : Use IS_INODE() to make the code more clear.
> v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
> 	it only if c.fix_on is 1.
> v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
> v1 -> v2 : Fix looped node chain directly after it is detected.
> ---
>  fsck/mount.c | 132 ++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 114 insertions(+), 18 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 4c7488840c7c..d7fa81f61cb7 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3518,22 +3518,90 @@ static void destroy_fsync_dnodes(struct list_head *head)
>  		del_fsync_inode(entry);
>  }
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
> +	if (IS_INODE(node_blk))
> +		err = write_inode(node_blk, blkaddr_tmp);
> +	else
> +		err = dev_write_block(node_blk, blkaddr_tmp);
> +	if (!err)
> +		FIX_MSG("Fix looped node chain on blkaddr %u\n",
> +				blkaddr_tmp);
> +	return err;
> +}
> +
>  static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>  {
>  	struct curseg_info *curseg;
> -	struct f2fs_node *node_blk;
> -	block_t blkaddr;
> -	unsigned int loop_cnt = 0;
> -	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
> -						sbi->total_valid_block_count;
> +	struct f2fs_node *node_blk, *node_blk_fast;
> +	block_t blkaddr, blkaddr_fast;
> +	bool is_detecting = true;
>  	int err = 0;
>  
> +	node_blk = calloc(F2FS_BLKSIZE, 1);
> +	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
> +	ASSERT(node_blk && node_blk_fast);
> +
>  	/* get node pages in the current segment */
>  	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
>  	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
> -
> -	node_blk = calloc(F2FS_BLKSIZE, 1);
> -	ASSERT(node_blk);
> +	blkaddr_fast = blkaddr;
>  
>  	while (1) {
>  		struct fsync_inode_entry *entry;
> @@ -3564,19 +3632,47 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>  		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
>  			entry->last_dentry = blkaddr;
>  next:
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
>  		blkaddr = next_blkaddr_of_node(node_blk);
> +
> +		/* sanity check to detect looped node chain with Floyd's cycle
> +		 * detection algorithm
> +		 */

I added this instead of the below long if body.

               if (!is_detecting)
                       continue;

> +		if (is_detecting) {
> +			err = find_node_blk_fast(sbi, &blkaddr_fast,
> +					node_blk_fast, &is_detecting);
> +			if (err)
> +				break;
> +
> +			if (!is_detecting)
> +				continue;
> +
> +			if (blkaddr_fast != blkaddr)
> +				continue;
> +
> +			ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
> +					blkaddr);
> +
> +			if (!c.fix_on) {
> +				err = -1;
> +				break;
> +			}
> +
> +			err = loop_node_chain_fix(sbi,
> +					NEXT_FREE_BLKADDR(sbi, curseg),
> +					node_blk_fast, blkaddr, node_blk);
> +			if (err)
> +				break;
> +
> +			/* Since we call get_fsync_inode() to ensure there are
> +			 * no duplicate inodes in the inode_list even if there
> +			 * are duplicate blkaddr, we can continue running
> +			 * after fixing the looped node chain.
> +			 */
> +			is_detecting = false;
> +		}
>  	}
>  
> +	free(node_blk_fast);
>  	free(node_blk);
>  	return err;
>  }
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
