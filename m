Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B9B954A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Sep 2025 11:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC3+UdZvEJG7Bm6xhHAGI+iFdm451Ry8MQd40zggLdA=; b=CCgqbleaA9t41jnOOmL56ZYFN2
	xWauMDnt6UtORuIngoGwSe2CaP2GKE5+xsPf7rezuZoIvO5yqWhyP9RgNy514pfTshj8ypIvMvHak
	p7CimdePs9R6nNMwd+ec00THfFZNBhrHzdkHnY6GMfpcWTnTecb7iGR9zI26rKIw7DJg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v0zWq-0002SR-EF;
	Tue, 23 Sep 2025 09:41:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v0zWo-0002S7-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=10myFbY4UZuYJNu1sR3h4kpIXOiW40ip2OyyCEcLlpI=; b=UsiBQ3UUElWYicpg0z+ot/Xmhl
 c7UgilAhX4kMGruafH+lBNYaJD/WbZ+LsV+wjLR4+1Vs+sc3fEgj+k9uscokleQhs4RVKXTc+8O7y
 G1aDi8ZjJVs2ALaMqaKTmVIL9lxXXYMgkacNWWDDYFVleH43my4ekIDpT7UurMU3wFhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=10myFbY4UZuYJNu1sR3h4kpIXOiW40ip2OyyCEcLlpI=; b=QTR1S11ZauTT9DgP0xdt6nxaem
 a0hISW1QcIYpbEIDz59xsSndMQAlBLSBgAcc9+GJRo7a9BNvDBe6dwTSW057hXTVzlURhxA4lxQat
 7Xp+H2zPB2U8doXl7ainzilkl5oTl4rngj+zKEfX02q9Mw1Rm8IZY1K0ySDUCtQl+NqI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v0zWo-0006BN-NS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E2CC60007;
 Tue, 23 Sep 2025 09:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00595C4CEF5;
 Tue, 23 Sep 2025 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758620491;
 bh=aXnJ9yMEsmKQf91ECghEClhJ9CbD+oIXioQZK8Gx3Io=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=q8PLeJRU97fsCnscXdjgdqTuqrDM6PZaKwOwbFpq1INyr6tj18f9gDcqegZ1IongA
 8iMOrOPt+ybbV1RElRaa97FYCM1JDImsfvq0f7CHSrVesAd0pE3cFSrlF/mM9FvJN9
 XeKZ4BkU8hUKKCUeYNBe5RdJXMXGwZWsxg89eOll5fZeC5qLHMPA7q6b96NoOvnXIe
 YLUe6EDrCeXcWOHpY/GROz2dleRHvX3K0oujnJCsh+GkIrj3HG9AJoJzHMEXqGBDA0
 X+K8Uj+p8sWa9C4nQn/nld1oOeQncmxfcTimXXuZm7vCmlehWNZzqB7FfcpUWeSYUS
 +PxbwfxR3/u9w==
Message-ID: <89f237cd-3f86-405a-8f8f-d9cad250ef00@kernel.org>
Date: Tue, 23 Sep 2025 17:41:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yunji Kang <yunji0.kang@samsung.com>, jaegeuk@kernel.org
References: <CGME20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf@epcas1p1.samsung.com>
 <20250918082023.57381-1-yunji0.kang@samsung.com>
Content-Language: en-US
In-Reply-To: <20250918082023.57381-1-yunji0.kang@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/18/25 16:20,
 Yunji Kang wrote: > In f2fs_precache_extents(), 
 For large files, It requires reading many > node blocks. Instead of reading
 each node block with synchronous I/O, > this patch applies [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v0zWo-0006BN-NS
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: linux-kernel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/18/25 16:20, Yunji Kang wrote:
> In f2fs_precache_extents(), For large files, It requires reading many
> node blocks. Instead of reading each node block with synchronous I/O,
> this patch applies readahead so that node blocks can be fetched in
> advance.
> 
> It reduces the overhead of repeated sync reads and improves efficiency
> when precaching extents of large files.
> 
> I created a file with the same largest extent and executed the test.
> For this experiment, I set the file's largest extent with an offset of 0
> and a size of 1GB. I configured the remaining area with 100MB extents.
> 
> 5GB test file:
> dd if=/dev/urandom of=test1 bs=1m count=5120
> cp test1 test2
> fsync test1
> dd if=test1 of=test2 bs=1m skip=1024 seek=1024 count=100 conv=notrunc
> dd if=test1 of=test2 bs=1m skip=1224 seek=1224 count=100 conv=notrunc
> ...
> dd if=test1 of=test2 bs=1m skip=5024 seek=5024 count=100 conv=notrunc
> reboot
> 
> I also created 10GB and 20GB files with large extents using the same
> method.
> 
> ioctl(F2FS_IOC_PRECACHE_EXTENTS) test results are as follows:
>   +-----------+---------+---------+-----------+
>   | File size | Before  | After   | Reduction |
>   +-----------+---------+---------+-----------+
>   | 5GB       | 101.8ms | 72.1ms  | 29.2%     |
>   | 10GB      | 222.9ms | 149.5ms | 32.9%     |
>   | 20GB      | 446.2ms | 276.3ms | 38.1%     |
>   +-----------+---------+---------+-----------+

Yunji,

Will we gain better performance if we readahead more node pages w/
sychronous request for precache extent case? Have you tried that?

Thanks,

> Tested on a 256GB mobile device with an SM8750 chipset.
> 
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yunji Kang <yunji0.kang@samsung.com>
> ---
> v2:
>  - Modify the readahead condition check routine for better code
> readability.
>  - Update the title from 'node block' to 'node blocks'.
> 
>  fs/f2fs/data.c | 3 +++
>  fs/f2fs/f2fs.h | 1 +
>  fs/f2fs/node.c | 5 ++++-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7961e0ddfca3..ab3117e3b24a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1572,6 +1572,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  	pgofs =	(pgoff_t)map->m_lblk;
>  	end = pgofs + maxblocks;
>  
> +	if (flag == F2FS_GET_BLOCK_PRECACHE)
> +		mode = LOOKUP_NODE_PRECACHE;
> +
>  next_dnode:
>  	if (map->m_may_create) {
>  		if (f2fs_lfs_mode(sbi))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9d3bc9633c1d..3ce41528d48e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -651,6 +651,7 @@ enum {
>  					 * look up a node with readahead called
>  					 * by get_data_block.
>  					 */
> +	LOOKUP_NODE_PRECACHE,		/* look up a node for F2FS_GET_BLOCK_PRECACHE */
>  };
>  
>  #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 4254db453b2d..d4bf3ce715c5 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -860,7 +860,10 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
>  			set_nid(parent, offset[i - 1], nids[i], i == 1);
>  			f2fs_alloc_nid_done(sbi, nids[i]);
>  			done = true;
> -		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
> +		} else if ((i == level && level > 1) &&
> +				(mode == LOOKUP_NODE_RA ||
> +				(mode == LOOKUP_NODE_PRECACHE &&
> +				offset[i - 1] % MAX_RA_NODE == 0))) {
>  			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i - 1]);
>  			if (IS_ERR(nfolio[i])) {
>  				err = PTR_ERR(nfolio[i]);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
