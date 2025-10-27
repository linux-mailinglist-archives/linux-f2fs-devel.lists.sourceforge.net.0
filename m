Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4156EC0C38A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 09:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba0IgA8scsKv0ACzvyc6wHN2l9lOA4/AVb0AVSHmA+s=; b=fDfKO/tdR6JGpPwznMxhv/430T
	rq4lp1UsGp1km69y2ZENe3L8VdbMsWUzhj24bBpDwCmLwhP5ZBiGbFaX0F1PHdr3fQ6JgSHVnuoT0
	w1PdDyR8ehzowAT8aLXzkFZbSzPq7Zg5a0tVcI9Bg39CXWICzR8f1AWBlHZ5CmwAblXU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDIDa-0004qh-Ez;
	Mon, 27 Oct 2025 08:04:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDIDY-0004qV-EA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZHpjXczBPJ6RijydMTNFFUuquAX+yPRHLh01+u29O+Y=; b=ISq/+2c9yS9jdEf5BHXaEQ0O3L
 kH0WCdtVOnNLJDDQwUJjVs7zQiPgTOsek6MaPj4a1opbfidmq6Rfbhcpvc243hFjnR4CGAFcRKv1x
 wSLkk7OODoU2xfwEerFsjgDYQ62WRaEEuimdq1x5jhLatJpQYUJ5qyFC4PPRmgCLHfAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZHpjXczBPJ6RijydMTNFFUuquAX+yPRHLh01+u29O+Y=; b=WzSH18wwQ/dyBk9lHp5UIq4bpG
 jIZNcQHGhN9u51tJ6PVtKSLNtCdgMJNb4blrt1xhjAqNz7ac5tGUTfz30QU4OHoWzYl6Ouo5Q6rxW
 nXrI3nNUP4SCtbbwNDVoiP7sjMBKxFLod3a44eJ6sAgZib6NMJ+WGCTjlWa62fOS8d8s=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDIDY-0001Go-Hh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C386160457;
 Mon, 27 Oct 2025 08:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0EDC4CEF1;
 Mon, 27 Oct 2025 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761552274;
 bh=sgCne/ELFZaA17TmEA7gqxd4vbE9iXyIeLCoG+vVFZs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hkHf8N6BVg6dYETC1WA1bEveoZtCvBl2zq1xyFdk1nRHk6jwUhs8COhi7NDshHa4B
 tDf3KWacA6UyG3zU+dIHjhusWdHCZbE0bsfEXEFTVJkX387CxPzwvjZiUuA++Fo/+7
 YDWBB69TiN+qq0mHmLaTzpD75doZKL+4i1dh3WwtV86Zm5oXU2VNbZPGMqzNtU02O4
 l79jooWTgJ43CXl9hQKYZytrHy7yR5/ue9BSOIUQmcBndPEQc22NdLoGP5fcP3fd8k
 EbZs1Ektv2hhPSua125rdXESfz6XKGdtwr6JQcmqDBLiINb7EOqXTWOc4tsNtoAbIQ
 O9xtei//0F1Sg==
Message-ID: <7e7b7b9f-5909-4bb9-88ea-d3653f26c95d@kernel.org>
Date: Mon, 27 Oct 2025 16:04:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, jaegeuk@kernel.org
References: <20251023035416.7943-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251023035416.7943-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/23/25 11:54, Xiaole He wrote: > The age extent cache
 uses last_blocks (derived from > allocated_data_blocks) to determine data
 age. However, there's a > conflict between the deletion > marker (l [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDIDY-0001Go-Hh
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix age extent cache insertion skip
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/23/25 11:54, Xiaole He wrote:
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
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
>   Allocated Data Blocks: 18446744073709551612 # ULLONG_MAX - 3
>   Inner Struct Count: tree: 1(0), node: 0
> 
> Step 2: Create files and write data to trigger overflow
>   # touch /mnt/f2fs_test/{1,2,3,4}.txt; sync
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
>   Allocated Data Blocks: 18446744073709551613 # ULLONG_MAX - 2
>   Inner Struct Count: tree: 5(0), node: 1
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/1.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
>   Allocated Data Blocks: 18446744073709551614 # ULLONG_MAX - 1
>   Inner Struct Count: tree: 5(0), node: 2
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/2.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
>   Allocated Data Blocks: 18446744073709551615 # ULLONG_MAX
>   Inner Struct Count: tree: 5(0), node: 3
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/3.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
>   Allocated Data Blocks: 0 # Counter overflowed!
>   Inner Struct Count: tree: 5(0), node: 4
> 
> Step 3: Trigger the bug - next write should create node but gets skipped
>   # dd if=/dev/urandom of=/mnt/f2fs_test/4.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep "Block Age"
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

Hi Xiaole,

Can we add a Fixes line and Cc stable@kernel.org?

Thanks,

> Signed-off-by: Xiaole He <hexiaole1994@126.com>
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
