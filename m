Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F3AE753A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 05:26:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsBV31QnxFsah0XQRuWVGLR/JsK9T+Szpleb9bPcZe0=; b=EFc9myxU1xHSCd//PWZhkyhNRB
	IQrVNNMF1X0A2LRLaSSKILkZFrw617P6jz/Cs2UqlSr+oZ3EUx70eCyM+A5m6F1dIXBSOku7M4oiz
	bFLJD5LF5uXvnQL4+RTuris4b/heOJklgnTbitBAUpNVVKx4IO0G6luwprMn4jXKWgIo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUGmi-0005Ed-3z;
	Wed, 25 Jun 2025 03:26:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uUGmg-0005EW-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 03:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fy/bk6QklKcwuwBToZ+hV9UrOc2K7grF7aU3PH25pJw=; b=Qt3JHclN0RDnqAAVgw1X+fgbnA
 x6uyDyRQy3C4f9c/dVAnS2Vz9OrFuzqbMCov40Iyy0/hPt1cRZ9hvluoH5kNIAD1ChWkaAFF/tKfW
 DTR3Q5hX00z93ouiPSJr6VD8a2VCFg2f00q0KzBUUFv6fx2xJiwSTB4becDR7L9GBN6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fy/bk6QklKcwuwBToZ+hV9UrOc2K7grF7aU3PH25pJw=; b=W+6xcq4/LN8tfpZtyauIso7RJS
 tK+wc3BvrKItvdpQQYxyoODfOCPvYVBzhEV/JV1aXVTCh+sXgYt0O5iW1z1FWSxBQX0xVqoRJOQv3
 gXAYj/8ItcqhXA/Z7aBxTFwuBlGyEQXN8pYQQEUsWc31nUbClfZmBUjik84tN70KPWKA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUGmg-0005Ix-7i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 03:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E56144AE95;
 Wed, 25 Jun 2025 03:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F914C4CEE3;
 Wed, 25 Jun 2025 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750822004;
 bh=mU1F3RUhNdk4UiLc1UjPfNsL6ir3JdMqJQbzgDnm9HI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gvmc2jOTNq5BnKN4qV3mGOUAFbAbd7ROpWJ9PK5ReuXKS0tUxcVnZVPrw061GP1vq
 zYy/XnoAApKMZD2D2DwbD5a3nwL9SD/qgMyypwLd5zzk/pRsK6JN17thu2a1y02Aq2
 g8DlxS+Xwn60hqjTPV/t1qdzCRwNJRx9J6Qae9o+yN4DTNrOlcMUapkPqoqT7nSnZd
 ye68G98qEUsNPL+FY1BUp+ZQQ6HTjY3AVZGU0mIjDYw9nxGd58+h8taGALsxin5dTh
 LK6ZHAwHy+2Ioz6osrTR36fLs3quHMbRY4hYHeoo8K92fx/6kNgmCMYxWz/w58QyKs
 o3Pc89hCfA25w==
Message-ID: <c91bcaf4-083d-4d5c-96a7-de7d2171f576@kernel.org>
Date: Wed, 25 Jun 2025 11:26:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <20250618081705.260239-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250618081705.260239-1-huangjianan@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/18/25 16:17, Jianan Huang wrote: > When fewer pages are
 read, nr_pages may be smaller than nr_cpages. Due > to the nr_vecs limit,
 the compressed pages will be split into multiple > bios and then [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUGmg-0005Ix-7i
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid splitting bio when reading
 multiple pages
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/18/25 16:17, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
> Changes since v1:
> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
> 
>  fs/f2fs/data.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..2d948586fea0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		}
>  
>  		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
>  					f2fs_ra_op_flags(rac),
>  					folio->index, for_write);
>  			if (IS_ERR(bio)) {
> @@ -2370,12 +2370,18 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  		.nr_cpages = 0,
>  	};
>  	pgoff_t nc_cluster_idx = NULL_CLUSTER;
> -	pgoff_t index;
> +	pgoff_t index = rac ? readahead_index(rac) : folio->index;

For non-compressed file, it's redundant.

>  #endif
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode))

index = rac ? readahead_index(rac) : folio->index;

Thanks,

> +		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
> +				round_down(index, cc.cluster_size);
> +#endif
> +
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
>  	map.m_len = 0;
> @@ -2385,7 +2391,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> -	for (; nr_pages; nr_pages--) {
> +	for (; nr_pages; nr_pages--, max_nr_pages--) {
>  		if (rac) {
>  			folio = readahead_folio(rac);
>  			prefetchw(&folio->flags);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
