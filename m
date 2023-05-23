Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D819970DA01
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 12:08:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1Owf-0005XX-Jn;
	Tue, 23 May 2023 10:08:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q1Owe-0005XR-JS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 10:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3KWgDG+Xxz0fai/faUEIDiw0AIQUomY9UU/EXtLm/4=; b=dAq6fqFzrj7UZuvO0VDales2uI
 RtSCaNHJeHdNuM4viJuAP6wD6mzUzYPIFRhkl4PxEagZd8Im7BdF+SR6KGAEhH07SRyBq02K7UOMB
 6vvYoMPQRwn6Sfpht5rm1n1Sp0mntlur4vF8DVysS9JiSEAIABxkGcdBEKsmQcTxSoag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j3KWgDG+Xxz0fai/faUEIDiw0AIQUomY9UU/EXtLm/4=; b=B4JwsLJsR8Rt4uz/kTEFj5t3Hj
 cKs1ytoJVFMLf/U3e4352inKj3Bk3I8lxxosL4dlUqrfONklMNM+x82jrJQvNztPfGTd+lmP4BU0l
 /87jZR3cAj9joZPmd02M7adIACBT60qfeKQ//aXb2DvlQ26DeLAN5qBQld3/Nh810a7Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1Owd-0001Rb-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 10:08:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BED96305B;
 Tue, 23 May 2023 10:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEF8C433EF;
 Tue, 23 May 2023 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684836517;
 bh=xlBi4QCX/eU81aU10Cqwr/vC7cIKsUtxPSS07ojts5I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LYpQavBbXb+ybwnRXCiFzMFGBKm4iimMxllxKR3p+SHe8oWq9PBUEmCZBTlOTg7H9
 t2cBBc6dHT1gP9EcIsShcS6IzST7nWvaJ4kaWbFJDDV/LlItl8fR52gfodJq8htUzW
 0GJQNvqTsOEweGeQAuSv1jp8hIOSjIbxlDBgJ27PFEfHtyw1NdxH7cR0u3La7+igVz
 HIJgZ6FoFpFgJ8rHi4ZL6WDCEDCUqJs2i4K+94/0UJgPeLwLquFEMVt6UnzRpcqHQ0
 Gct9PN6WViwoPwpAmX5JPBXaspxoiAjdjh2r3EfxYrTj3sUFQO5XXq4pZ5VYbRtBK7
 VaspY1MJqT3Ww==
Message-ID: <16b7949b-708e-53e8-bf3b-3bbee04f8299@kernel.org>
Date: Tue, 23 May 2023 18:08:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230522103411.20413-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230522103411.20413-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/22 18:34, Chunhai Guo wrote: > find_fsync_inode()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1Owd-0001Rb-PK
Subject: Re: [f2fs-dev] [PATCH v6] fsck.f2fs: Detect and fix looped node
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

On 2023/5/22 18:34, Chunhai Guo wrote:
> find_fsync_inode() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue by
> filling a NULL address in the last node of the chain.
> 
> Below is the log we encounter on a 256GB UFS storage and it takes about 25
> seconds to detect looped node chain. After changing the algorithm, it takes
> about 20ms to finish the same job.
> 
>      [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
>      [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to update
> superblock
>      [   10.822953] fsck.f2fs: Info: superblock features = 1499 :  encrypt
> verity extra_attr project_quota quota_ino casefold
>      [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
> 00000000000000000000000000000000
>      [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444 MB)
>      [   35.852827] fsck.f2fs:	detect looped node chain, blkaddr:1114802,
> next:1114803
>      [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data failed
>      [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v5 -> v6 : Simplify the code by removing unnecessary retry logic.
> v4 -> v5 : Use IS_INODE() to make the code more clear.
> v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
> 	it only if c.fix_on is 1.
> v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
> v1 -> v2 : Fix looped node chain directly after it is detected.
> ---
>   fsck/mount.c | 129 ++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 111 insertions(+), 18 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 4c7488840c7c..2b5937cdba7f 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3518,22 +3518,90 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
> @@ -3564,19 +3632,44 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
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

if (!is_detecing)
	continue;

Otherwise, in first round, blkaddr moves forward by one step, and blkaddr_fast may
moves forward by one step as well, if find_node_blk_fast() breaks when
f2fs_is_valid_blkaddr() or is_recoverable_dnode() returns false, then blkaddr_fast
will be equal to blkaddr?

Thanks,

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
> +			 * are duplicate blkaddr, we can continue running from
> +			 * here after fixing the looped node chain.
> +			 */
> +			is_detecting = false;
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
