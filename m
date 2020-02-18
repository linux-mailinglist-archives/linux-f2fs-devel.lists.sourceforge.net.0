Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAEC1636F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 00:11:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4C1q-0003Lz-In; Tue, 18 Feb 2020 23:11:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4C1p-0003Ls-ND
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Akrlss92FgzkovaQxMkVJdSsymeHgaqEmFb5c836i2c=; b=M/EjKH6OgDmBsWMblFm6BW8D/W
 X/Fxbv8fZ1+yM3JwpJstKr2qwc09Y+iUNLR/mx3zIEtHNnmAedRHcjX5iDFJ3Jditwq6ZEAZGmXct
 u4FEKVOjq1nzTYi+BrrDwmmJJu4LufNjCXREWWGgg1N6+Klzy2pQQZzEYoscy4k1Gs+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Akrlss92FgzkovaQxMkVJdSsymeHgaqEmFb5c836i2c=; b=V5djUjpwXA/JlREGpXDeToe8Zk
 6fbal7VlsR8EyUOgSXNlznVomA9vgMK5f2CkS4JBDw33EBn70HICkspD027Pv8Nxbij3jSgBEDAAJ
 VNbXbiCwIls8YxzjcvnURn2EjC9suaOw2rQCtmKB852BpYwTxmafOAcWnkve2uWyZ0Jo=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4C1o-007mJs-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:11:45 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c6f1d0000>; Tue, 18 Feb 2020 15:11:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 15:11:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 15:11:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 23:11:38 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-10-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <64b98d0d-d281-fe34-8dbb-a04ac719d74d@nvidia.com>
Date: Tue, 18 Feb 2020 15:11:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-10-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582067485; bh=Akrlss92FgzkovaQxMkVJdSsymeHgaqEmFb5c836i2c=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=asIzv0ojJMKF80DvWYkbSq9xGWJ7ZLdUAYVyRhXJBGnn4nPGzSL5rIS/ovTNr0scc
 gs7mPgZCbIGuN21UlJlaqg82EidFL/bBRrnN1h9FnqQChjvgbS/geskVhNeO2W1sV/
 biiNK98/SqvU14elddMK8D4ixbdxkqTNwCfXZWhbo6lz6fqouGkCodOHr15m9WoBPg
 I43na5oYhdKOUUcTc0axj14qTc0xmCQmt8qsSWiZWW3MAxOJzAv21qXLCylvpn+L1Q
 UamfH/UvbmkELot1FHszYWOU7zMxTj/3Gq6drvkO89R/67fyfce8YR2j0Jl0ROIySV
 t1Mvpfops1WHQ==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4C1o-007mJs-GQ
Subject: Re: [f2fs-dev] [PATCH v6 06/19] mm: rename readahead loop variable
 to 'i'
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Change the type of page_idx to unsigned long, and rename it -- it's
> just a loop counter, not a page index.
> 
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Looks good,

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

> diff --git a/mm/readahead.c b/mm/readahead.c
> index 74791b96013f..bdc5759000d3 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -156,7 +156,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	struct inode *inode = mapping->host;
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
> -	int page_idx;
> +	unsigned long i;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  	struct readahead_control rac = {
> @@ -174,7 +174,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
> -	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> +	for (i = 0; i < nr_to_read; i++) {
>  		struct page *page;
>  
>  		if (offset > end_index)
> @@ -198,7 +198,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  			break;
>  		page->index = offset;
>  		list_add(&page->lru, &page_pool);
> -		if (page_idx == nr_to_read - lookahead_size)
> +		if (i == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
>  		offset++;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
