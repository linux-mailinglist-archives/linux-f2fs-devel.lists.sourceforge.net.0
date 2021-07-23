Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F53D30B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 02:21:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6iw1-0002rz-Sn; Fri, 23 Jul 2021 00:21:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6iw0-0002rn-07
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qjNIrRbKP0xjkT959OI6hSK7aDfbq235/GW6tUe1PJ8=; b=bLMdXI/EQAjSPYCo6HdBJB1Xsk
 2ALj3ocrfQW6QBAMswCS7zmH756VdWbCQpxHC4ZTCVFjxOyb8pNcL3EW1ruugVjF0rYhm5dYv/J3r
 sXiQhv7/RhyYjlI2KlK/a0gf91nja0H/uDT02WFiUodasMBM14fXpKKu+m273rS6J2as=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qjNIrRbKP0xjkT959OI6hSK7aDfbq235/GW6tUe1PJ8=; b=LUFfJsaDme5ihVHzKvR5KUBkEq
 utX4AuUZUCy+hPBizQSpe2+Du490W9QQDL6BVV5cRJOrpxyHR77/17mZDmot3B58QkJ0HHoOJepEG
 hPW/bvIwoeY8h3WzJLfgM6iGUqMbrVV8f7t2JpIGw/PkKW/9+SaM1y6orznYYeEYuu4I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6ivt-0004PC-Am
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:20:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D536B60EB9;
 Fri, 23 Jul 2021 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626999642;
 bh=2HgQQtMtSR554/PjR/forrASJJzw4DuYeoLT/pUBrkA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=j3jX+Jr5vybYpXx9GpjEo11rZSPP6sB0W4rJwmsjP9lXhI2CahPF5Nse1dMDXpDyi
 V3jLVst7Jj0vgQSwHMKK+SmD2lZcYBv1whDKXteIoDYalZhoSWQqb0jPBrdfQAoUal
 4rVUVNSqW8pzDIoJ/YKwzO1v9hiC1+CY8sDMwNHMqVlopUQ3lTz3YB+0fyA/yVTqCy
 2ZVrht5q2aSo3Z44VeI4TIEOxLEVgzzybeF854Dk0Ah9sKYDoX2whwuCwUu+r4sECW
 DnoJ3vO+IU6CGUKPbF7jTZgv5w2wLZrXdc0PH1dlIdaVQ4oYObjzaTHRYR56H7D1cD
 95Cno6qY1ITWg==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210722211921.3791312-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <dc7776c7-2694-5eea-fe9a-12191c833389@kernel.org>
Date: Fri, 23 Jul 2021 08:20:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722211921.3791312-1-daeho43@gmail.com>
Content-Language: en-US
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
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6ivt-0004PC-Am
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change fiemap way in printing
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

On 2021/7/23 5:19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When we print out a discontinuous compression chunk, it shows like a
> continuous chunk now. To show it more correctly, I've changed the way of
> printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> info, since it is not in fiemap user api manual.
> 
>     Logical          Physical         Length           Flags
> 0: 0000000000000000 0000000fdf692000 0000000000004000 1008
> 1: 0000000000004000 0000000fdf693000 0000000000004000 1008
> 2: 0000000000008000 0000000fdf694000 0000000000004000 1008
> 3: 000000000000c000 0000000fdf695000 0000000000004000 1008
> 4: 0000000000010000 0000000fdf696000 000000000000c000 1000
> 5: 000000000001c000 0000000f8c60d000 0000000000010000 1000
> 6: 000000000002c000 0000000f8c61d000 0000000000004000 1008
> 7: 0000000000030000 0000000f8c620000 0000000000004000 1008
> 8: 0000000000034000 0000000f8c623000 0000000000001000 1008
> 9: 0000000000035000 0000000fc7af4000 0000000000003000 1008

I wrote a file some like this:

i_addr[0x9] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0xa]                 		[0x   72800 : 468992]
i_addr[0xb] reserved flag   		[0xffffffff : 4294967295]
i_addr[0xc] reserved flag   		[0xffffffff : 4294967295]
i_addr[0xd] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0xe]                 		[0x   72801 : 468993]
i_addr[0xf] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x10] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x11]                 		[0x   72832 : 469042]
i_addr[0x12]                 		[0x   72802 : 468994]
i_addr[0x13]                 		[0x   72833 : 469043]
i_addr[0x14]                 		[0x   72834 : 469044]
i_addr[0x15] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x16]                 		[0x   72803 : 468995]
i_addr[0x17] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x18] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x19]                 		[0x   72835 : 469045]
i_addr[0x1a]                 		[0x   72804 : 468996]
i_addr[0x1b]                 		[0x   72836 : 469046]
i_addr[0x1c]                 		[0x   72837 : 469047]
i_addr[0x1d] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x1e]                 		[0x   72805 : 468997]
i_addr[0x1f] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x20] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x21] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x22]                 		[0x   72806 : 468998]
i_addr[0x23] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x24] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x25] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x26]                 		[0x   72807 : 468999]
i_addr[0x27] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x28] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x29] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x2a]                 		[0x   72808 : 469000]
i_addr[0x2b] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x2c] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x2d] cluster flag    		[0xfffffffe : 4294967294]
i_addr[0x2e]                 		[0x   72809 : 469001]
i_addr[0x2f] reserved flag   		[0xffffffff : 4294967295]
i_addr[0x30] reserved flag   		[0xffffffff : 4294967295]
i_nid[0]                      		[0x       0 : 0]
i_nid[1]                      		[0x       0 : 0]
i_nid[2]                      		[0x       0 : 0]
i_nid[3]                      		[0x       0 : 0]
i_nid[4]                      		[0x       0 : 0]

xfs_io file -c "fiemap -v" shows:

before:
  EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
    0: [0..31]:         3751936..3751967    32 0x1008
    1: [32..63]:        3751944..3751975    32 0x1008
    2: [64..71]:        3752336..3752343     8 0x1000
    3: [72..79]:        3751952..3751959     8 0x1000
    4: [80..95]:        3752344..3752359    16 0x1000
    5: [96..127]:       3751960..3751991    32 0x1008
    6: [128..135]:      3752360..3752367     8 0x1000
    7: [136..143]:      3751968..3751975     8 0x1000
    8: [144..159]:      3752368..3752383    16 0x1000
    9: [160..191]:      3751976..3752007    32 0x1008
   10: [192..223]:      3751984..3752015    32 0x1008
   11: [224..255]:      3751992..3752023    32 0x1008
   12: [256..287]:      3752000..3752031    32 0x1008
   13: [288..319]:      3752008..3752039    32 0x1009

after:
    0: [0..31]:         3751936..3751967    32 0x1008
    1: [32..63]:        3751944..3751975    32 0x1008
    2: [64..71]:        3752336..3752343     8 0x1000
    3: [72..79]:        3751952..3751959     8 0x1000
    4: [80..95]:        3752344..3752359    16 0x1000
    5: [96..127]:       3751960..3751991    32 0x1008
    6: [128..135]:      3752360..3752367     8 0x1000
    7: [136..143]:      3751968..3751975     8 0x1000
    8: [144..159]:      3752368..3752383    16 0x1000
    9: [160..191]:      3751976..3752007    32 0x1008
   10: [192..223]:      3751984..3752015    32 0x1008
   11: [224..255]:      3751992..3752023    32 0x1008
   12: [256..287]:      3752000..3752031    32 0x1008
   13: [288..319]:      3752008..3752039    32 0x1008

I don't see any obvious difference, except w/ current patch, last
FIEMAP_EXTENT_LAST is missing.

Sorry, I didn't get the point of this patch, could you please explain
more details for that problem this patch tries to fix and show the
difference before/after the patch in commit message?

Thanks,

> 
> Flags
> 0x1000 => FIEMAP_EXTENT_MERGED
> 0x0008 => FIEMAP_EXTENT_ENCODED
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> ---
> v2: changed the print format
> ---
>   fs/f2fs/data.c | 76 ++++++++++++++++++++++++++++----------------------
>   1 file changed, 42 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3a01a1b50104..058dc751e3a6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   	u64 logical = 0, phys = 0, size = 0;
>   	u32 flags = 0;
>   	int ret = 0;
> -	bool compr_cluster = false;
> +	bool compr_cluster = false, compr_appended;
>   	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	unsigned int count_in_cluster;
>   	loff_t maxbytes;
>   
>   	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
> @@ -1892,8 +1893,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   	map.m_next_pgofs = &next_pgofs;
>   	map.m_seg_type = NO_CHECK_TYPE;
>   
> -	if (compr_cluster)
> -		map.m_len = cluster_size - 1;
> +	if (compr_cluster) {
> +		map.m_lblk += 1;
> +		map.m_len = cluster_size - count_in_cluster;
> +	}
>   
>   	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
>   	if (ret)
> @@ -1903,11 +1906,23 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   	if (!(map.m_flags & F2FS_MAP_FLAGS)) {
>   		start_blk = next_pgofs;
>   
> -		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
> +		if (blks_to_bytes(inode, start_blk) >= blks_to_bytes(inode,
>   						max_inode_blocks(inode)))
> +			flags |= FIEMAP_EXTENT_LAST;
> +		else if (!compr_cluster)
>   			goto prep_next;
> +	}
> +
> +	compr_appended = false;
> +	/* In a case of compressed cluster, append this to the last extent */
> +	if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
> +			!(map.m_flags & F2FS_MAP_FLAGS))) {
> +		unsigned int appended_blks = cluster_size - count_in_cluster + 1;
>   
> -		flags |= FIEMAP_EXTENT_LAST;
> +		size += blks_to_bytes(inode, appended_blks);
> +		if (map.m_flags & F2FS_MAP_UNWRITTEN)
> +			start_blk += appended_blks;
> +		compr_appended = true;
>   	}
>   
>   	if (size) {
> @@ -1926,38 +1941,31 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   	if (start_blk > last_blk)
>   		goto out;
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
>   	if (map.m_pblk == COMPRESS_ADDR) {
>   		compr_cluster = true;
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
>   prep_next:
>   	cond_resched();
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
