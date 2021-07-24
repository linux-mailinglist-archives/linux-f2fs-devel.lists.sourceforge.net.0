Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F53D4430
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jul 2021 03:20:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m76Kj-0007Ox-Gq; Sat, 24 Jul 2021 01:20:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m76Kh-0007Oi-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 01:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKvXPEPa41sCunAAS1VOOb6cMoePofTDLroK5jalg2w=; b=CqTAz79L+8ZkhTJGtd40ElSZrQ
 sKFyg0HznENfL9+KwYf6Qa2lYKULnLtnqyD++y1xULZK8MaFycPnhyr2TfvAaNVI7IiuKIgbJhNnq
 qLV2dTv9EhdnSftvRvTCbxKHQ3ZMOYlGe/FTbQZAE7jP2Hx9xr4eROxr53IWg0jouDZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nKvXPEPa41sCunAAS1VOOb6cMoePofTDLroK5jalg2w=; b=DSMofm1OUHfqTEc/x+oyk4W9e1
 kkxtefnIi+QgIL21IQ/VCIza+37rTO6MfCTWoAeyNL/Spm0GcYJLKws4FRPQshsEfQkTa6G18ahvm
 598X78AVPCy2G/b6egkEi7ifooQICVLdcGM+xW79aeor5KRaLWl0cgAGwzWPf7Rlc0VU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m76KV-000nM8-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 01:20:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62FDC60BD3;
 Sat, 24 Jul 2021 01:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627089580;
 bh=XuV5KnrUXo2aL81IJRXJlswdfQPfCVDznQiZ16njytg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYZlAfs8Imf/WwWcREV2GuOkNRc1EaWGErOPIpnkvXdUzt2II7cnyKnXFBHDt9a7V
 kw/3zailYAn6jYb/GE4RObeREspwBkXVmOGNFLlMLb6uHUr4a4nttMPxrPQlFg9nTD
 xoosOepTzoOMMP84uqN8C80gE9HtiKuyLxQf4ClmOx1ivsAKmRaiBs6Y1B3YuKXC5C
 qqRpsaLmnA/ncoQBIdmrdBvL7pNvGUFuOl1VvJJrD1bTWQlgjj6HmPujHCBiE3+5ca
 gu7gg0X5qZwhbm3TfOKGKXL+lfS0NiLCUdmmjt4ufRLJqagj7qqnuDdAYbJ3kThxaH
 1Ffquhf0mnaqQ==
Date: Fri, 23 Jul 2021 18:19:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPtqqkocZPNoeiCu@google.com>
References: <20210723074928.1659385-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723074928.1659385-1-daeho43@gmail.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m76KV-000nM8-Mq
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When we print out a discontinuous compression chunk, it shows like a
> continuous chunk now. To show it more correctly, I've changed the way of
> printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> info, since it is not in fiemap user api manual.
> 
> Let's assume 16KB compression cluster.
> 
> <before>
>    Logical          Physical         Length           Flags
> 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> 1:  0000000000004000 00000002c0920000 0000000000004000 1008
>   ...
> 9:  0000000000034000 0000000f8c623000 0000000000004000 1008
> 10: 0000000000038000 000000101a6eb000 0000000000004000 1008
> 
> <after>
> 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> 1:  0000000000004000 00000002c0920000 0000000000004000 1008
>   ...
> 9:  0000000000034000 0000000f8c623000 0000000000001000 1008
> 10: 0000000000035000 000000101a6ea000 0000000000003000 1008
> 11: 0000000000038000 000000101a6eb000 0000000000002000 1008
> 12: 000000000003a000 00000002c3544000 0000000000002000 1008
> 
> Flags
> 0x1000 => FIEMAP_EXTENT_MERGED
> 0x0008 => FIEMAP_EXTENT_ENCODED
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> ---
> v3: fix the missing last extent flag issue
> v2: changed the print format
> ---
>  fs/f2fs/data.c | 75 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3a01a1b50104..29b09a74cdc9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	u64 logical = 0, phys = 0, size = 0;
>  	u32 flags = 0;
>  	int ret = 0;
> -	bool compr_cluster = false;
> +	bool compr_cluster = false, compr_appended;
>  	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	unsigned int count_in_cluster;

Can we initialize to 0, as compiler complains?

	unsigned int count_in_cluster = 0;

>  	loff_t maxbytes;
>  
>  	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
> @@ -1892,15 +1893,17 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	map.m_next_pgofs = &next_pgofs;
>  	map.m_seg_type = NO_CHECK_TYPE;
>  
> -	if (compr_cluster)
> -		map.m_len = cluster_size - 1;
> +	if (compr_cluster) {
> +		map.m_lblk += 1;
> +		map.m_len = cluster_size - count_in_cluster;
> +	}
>  
>  	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
>  	if (ret)
>  		goto out;
>  
>  	/* HOLE */
> -	if (!(map.m_flags & F2FS_MAP_FLAGS)) {
> +	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
>  		start_blk = next_pgofs;
>  
>  		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
> @@ -1910,6 +1913,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		flags |= FIEMAP_EXTENT_LAST;
>  	}
>  
> +	compr_appended = false;
> +	/* In a case of compressed cluster, append this to the last extent */
> +	if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
> +			!(map.m_flags & F2FS_MAP_FLAGS))) {
> +		compr_appended = true;
> +		goto skip_fill;
> +	}
> +
>  	if (size) {
>  		flags |= FIEMAP_EXTENT_MERGED;
>  		if (IS_ENCRYPTED(inode))
> @@ -1926,38 +1937,36 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	if (start_blk > last_blk)
>  		goto out;
>  
> -	if (compr_cluster) {
> -		compr_cluster = false;
> -
> -
> -		logical = blks_to_bytes(inode, start_blk - 1);
> -		phys = blks_to_bytes(inode, map.m_pblk);
> -		size = blks_to_bytes(inode, cluster_size);
> -
> -		flags |= FIEMAP_EXTENT_ENCODED;
> -
> -		start_blk += cluster_size - 1;
> -
> -		if (start_blk > last_blk)
> -			goto out;
> -
> -		goto prep_next;
> -	}
> -
> +skip_fill:
>  	if (map.m_pblk == COMPRESS_ADDR) {
>  		compr_cluster = true;
> -		start_blk++;
> -		goto prep_next;
> -	}
> -
> -	logical = blks_to_bytes(inode, start_blk);
> -	phys = blks_to_bytes(inode, map.m_pblk);
> -	size = blks_to_bytes(inode, map.m_len);
> -	flags = 0;
> -	if (map.m_flags & F2FS_MAP_UNWRITTEN)
> -		flags = FIEMAP_EXTENT_UNWRITTEN;
> +		count_in_cluster = 1;
> +	} else if (compr_appended) {
> +		unsigned int appended_blks = cluster_size -
> +						count_in_cluster + 1;
> +		size += blks_to_bytes(inode, appended_blks);
> +		start_blk += appended_blks;
> +		compr_cluster = false;
> +	} else {
> +		logical = blks_to_bytes(inode, start_blk);
> +		phys = __is_valid_data_blkaddr(map.m_pblk) ?
> +			blks_to_bytes(inode, map.m_pblk) : 0;
> +		size = blks_to_bytes(inode, map.m_len);
> +		flags = 0;
> +
> +		if (compr_cluster) {
> +			flags = FIEMAP_EXTENT_ENCODED;
> +			count_in_cluster += map.m_len;
> +			if (count_in_cluster == cluster_size) {
> +				compr_cluster = false;
> +				size += blks_to_bytes(inode, 1);
> +			}
> +		} else if (map.m_flags & F2FS_MAP_UNWRITTEN) {
> +			flags = FIEMAP_EXTENT_UNWRITTEN;
> +		}
>  
> -	start_blk += bytes_to_blks(inode, size);
> +		start_blk += bytes_to_blks(inode, size);
> +	}
>  
>  prep_next:
>  	cond_resched();
> -- 
> 2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
