Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E331C34670
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 09:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQLSVJgg02B4rMb8gWq/wUpO3NwwW0qwfQ+fsNOKF0U=; b=DewzbPscRXN8AlgZ9q5CtInkcL
	DxBPhhRxkHdJgR7N8MzsHF/osZ7m2g1/lUzfBsoQXq3VmAWd6VPCK9Gi3RZ51gpD1pKdOHTJAAe+d
	EToKMYoyxS4J14JvsAys+DTQqEJYhQFau2Jh9EeUzLJJuoAaMgtermuBzrXyNsV7iL7c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGYcn-00039w-Iy;
	Wed, 05 Nov 2025 08:12:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGYcm-00039m-PR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 08:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cVTBqYiuN6lBfs+Ms/EEpDfBfvcuWwFVNz2P+HsOd5k=; b=bFNAqe/WxbfhgXK3InODMuTwvy
 +s9wtlOySVr4aERDon2wT4buRCJ14jo4sE6BbLyRJSQ4v9sA6RajwAYgW5j7QUZYjq1F0NM2rzSSs
 boNImzCRy1FwJ0WwonT1zJmkVYfu/WKlKZt7wKQktneAOf/bu98VLZdCL89WMPksfm6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cVTBqYiuN6lBfs+Ms/EEpDfBfvcuWwFVNz2P+HsOd5k=; b=H22B4F5GLEjCTIfVquPVBpePWB
 /HPjyNSBDagVMM6UO+k/jS3BQyVVUNCRNxYmu+v11GZGiEaJcaULnrV27CAD7N6amfgMDiI0gaKmk
 ti5gp0Q4+cTSk7TmSXXY4hDQQ0zWt9pTRuwXahSvF1JTvCWZxXpzA/KQR1FG2FBq4QPE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGYcm-0001Ep-Qv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 08:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0834C60203;
 Wed,  5 Nov 2025 08:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5630BC4CEF8;
 Wed,  5 Nov 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762330326;
 bh=EbYrAJibFHT+iHx8plMmLVm5+bVz7ZWJcuiRfrCiexo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=c5C5kN18K6tCLFL5yBZ5KGc6tphAkTBWVOvcD6baPBPa4uv/fQjruYXIViHgaRtEf
 PBlQP2qg7VFpRC3ZIdNLpLyojjfS1uAymd5e1Yzts2dHWj3igWLZyDueWpXtBzQ9e0
 YpiayvjOCOF3jj7E0xw6ucy9/16R0n4KfZmcZgglDWfegmoHIpALY3VKifnmPeJMS/
 oEwCbYgpUZqLduVSU5ddtdhGEwdY65irZmmgMMATtMB2e1Gg4944JASGMRnWcfqAmX
 341SP2+OdVwch05tHBUBHsm7tIxLwd74MihTsB9BVbCl9qS1wqtsEIXtM/1swUo3SF
 6wQyO7Q0aiIUw==
Message-ID: <ea199c99-7f5f-4381-a4ae-9527792c3122@kernel.org>
Date: Wed, 5 Nov 2025 16:12:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20251023035416.7943-1-hexiaole1994@126.com>
 <20251027092341.5011-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251027092341.5011-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Just in case, you may missed this patch. On 10/27/25
 17:23, Xiaole He wrote: > The age extent cache uses last_blocks (derived
 from > allocated_data_blocks) to determine data age. However, there's a >
 conflict between the deletion > marker (l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGYcm-0001Ep-Qv
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix age extent cache insertion skip
 on counter overflow
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Xiaole He <hexiaole1994@126.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Just in case, you may missed this patch.

On 10/27/25 17:23, Xiaole He wrote:
> The age extent cache uses last_blocks (derived from
> allocated_data_blocks) to determine data age. However, there's a
> conflict between the deletion
> marker (last_blocks=0) and legitimate last_blocks=0 cases when
> allocated_data_blocks overflows to 0 after reaching ULLONG_MAX.
> 
> In this case, valid extents are incorrectly skipped due to the
> "if (!tei->last_blocks)" check in __update_extent_tree_range().
> 
> This patch fixes the issue by:
> 1. Reserving ULLONG_MAX as an invalid/deletion marker
> 2. Limiting allocated_data_blocks to range [0, ULLONG_MAX-1]
> 3. Using F2FS_EXTENT_AGE_INVALID for deletion scenarios
> 4. Adjusting overflow age calculation from ULLONG_MAX to (ULLONG_MAX-1)
> 
> Reproducer (using a patched kernel with allocated_data_blocks
> initialized to ULLONG_MAX - 3 for quick testing):
> 
> Step 1: Mount and check initial state
>   # dd if=/dev/zero of=/tmp/test.img bs=1M count=100
>   # mkfs.f2fs -f /tmp/test.img
>   # mkdir -p /mnt/f2fs_test
>   # mount -t f2fs -o loop,age_extent_cache /tmp/test.img /mnt/f2fs_test
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551612 # ULLONG_MAX - 3
>   Inner Struct Count: tree: 1(0), node: 0
> 
> Step 2: Create files and write data to trigger overflow
>   # touch /mnt/f2fs_test/{1,2,3,4}.txt; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551613 # ULLONG_MAX - 2
>   Inner Struct Count: tree: 5(0), node: 1
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/1.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551614 # ULLONG_MAX - 1
>   Inner Struct Count: tree: 5(0), node: 2
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/2.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551615 # ULLONG_MAX
>   Inner Struct Count: tree: 5(0), node: 3
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/3.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 0 # Counter overflowed!
>   Inner Struct Count: tree: 5(0), node: 4
> 
> Step 3: Trigger the bug - next write should create node but gets skipped
>   # dd if=/dev/urandom of=/mnt/f2fs_test/4.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 1
>   Inner Struct Count: tree: 5(0), node: 4
> 
>   Expected: node: 5 (new extent node for 4.txt)
>   Actual: node: 4 (extent insertion was incorrectly skipped due to
>   last_blocks = allocated_data_blocks = 0 in __get_new_block_age)
> 
> After this fix, the extent node is correctly inserted and node count
> becomes 5 as expected.
> 
> Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>
> ---
> Changes in v2:
> - Added Fixes tag and Cc stable
> - Updated reproducer to use 'grep -A 4' for better output clarity
> ---
>  fs/f2fs/extent_cache.c | 5 +++--
>  fs/f2fs/f2fs.h         | 6 ++++++
>  fs/f2fs/segment.c      | 9 +++++++--
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 33e09c453c70..0ed84cc065a7 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -808,7 +808,7 @@ static void __update_extent_tree_range(struct inode *inode,
>  	}
>  	goto out_read_extent_cache;
>  update_age_extent_cache:
> -	if (!tei->last_blocks)
> +	if (tei->last_blocks == F2FS_EXTENT_AGE_INVALID)
>  		goto out_read_extent_cache;
>  
>  	__set_extent_info(&ei, fofs, len, 0, false,
> @@ -912,7 +912,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
>  			cur_age = cur_blocks - tei.last_blocks;
>  		else
>  			/* allocated_data_blocks overflow */
> -			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
> +			cur_age = (ULLONG_MAX - 1) - tei.last_blocks + cur_blocks;
>  
>  		if (tei.age)
>  			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
> @@ -1114,6 +1114,7 @@ void f2fs_update_age_extent_cache_range(struct dnode_of_data *dn,
>  	struct extent_info ei = {
>  		.fofs = fofs,
>  		.len = len,
> +		.last_blocks = F2FS_EXTENT_AGE_INVALID,
>  	};
>  
>  	if (!__may_extent_tree(dn->inode, EX_BLOCK_AGE))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5b4e9548a231..fa3c676adc30 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -707,6 +707,12 @@ enum extent_type {
>  	NR_EXTENT_CACHES,
>  };
>  
> +/*
> + * Reserved value to mark invalid age extents, hence valid block range
> + * from 0 to ULLONG_MAX-1
> + */
> +#define F2FS_EXTENT_AGE_INVALID	ULLONG_MAX
> +
>  struct extent_info {
>  	unsigned int fofs;		/* start offset in a file */
>  	unsigned int len;		/* length of the extent */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45eace879d7..a473cd1fb37d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3863,8 +3863,13 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
>  	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
>  	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
>  
> -	if (IS_DATASEG(curseg->seg_type))
> -		atomic64_inc(&sbi->allocated_data_blocks);
> +	if (IS_DATASEG(curseg->seg_type)) {
> +		unsigned long long new_val;
> +
> +		new_val = atomic64_inc_return(&sbi->allocated_data_blocks);
> +		if (unlikely(new_val == ULLONG_MAX))
> +			atomic64_set(&sbi->allocated_data_blocks, 0);
> +	}
>  
>  	up_write(&sit_i->sentry_lock);
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
