Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E41636EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 00:09:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4BzB-0001JE-7b; Tue, 18 Feb 2020 23:09:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4BzA-0001J6-In
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7N9Wj3+9XwAeFwQi6TOYJxPABg1BqYz4tVXoRpCkIA=; b=BnfVpAwDBJI706zFWprhTaLrxs
 GIfLQqEXaA/j8h4Aidbxq7ttrlOnrM7bKBR8BVypBPd+1QbQOmaKd5iQvK+8cS+B+J9aBe5TqcMXa
 qoC8n5uJzwtrCs8oTHjM5TjAI/r5m7E8KYkNa5diV3ecX5g3xzvwRTCW/Kvxayd8trXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7N9Wj3+9XwAeFwQi6TOYJxPABg1BqYz4tVXoRpCkIA=; b=bZJj9sxBCORNrYdcIbQgdKcXgR
 oLE/UHTNYp92pQyo9R7pj6m+ZQuQXpNhsIxkV2Y+lJuinlIRmZROsH+WjqlCNFwHlyn0KQxm4FNA5
 CvcM2hZkD377mgznGba74yDmH9WJG4qQISfiHkBTsOkQel7Yu2/rJC+UpfGxwjwn3dPk=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Bz5-007QXe-F0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:09:00 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c6e740000>; Tue, 18 Feb 2020 15:08:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 15:08:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 15:08:49 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 23:08:49 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-8-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <af3a8179-ea65-7a47-3b96-70aeceac0352@nvidia.com>
Date: Tue, 18 Feb 2020 15:08:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-8-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582067316; bh=M7N9Wj3+9XwAeFwQi6TOYJxPABg1BqYz4tVXoRpCkIA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=IeItEZERl8RgD9gMu8hyrKs9zDAELxc/pcSyWfpoGI0TB2mLKgncHMG394p6px4ju
 zmtAMOymP1/ZtJoe4HlOHDlOUZc/uVCaP5RY2LCqtWb4PFiTTWf0yQduIPEsPrRM6I
 7+ZxiupuOA683TN7ev8l4qf1ne9j9TMe9yxP+4Gnp/KCmRvKAlcJ1KhnSHEd/mtvXA
 kETqqZe9Hl6tljU3UyeJaS2R5RC2d7bjB/6ICvno2hVU7UkwwH0PxFr9ixgVpcc7ww
 OuFMigzNUu1o/1PB1x64JUqXhqwxHJk3vxspEehlY/0wVnC7QAKbRSRGKmSy0mZ60N
 Ry89dWBs1XZZg==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Bz5-007QXe-F0
Subject: Re: [f2fs-dev] [PATCH v6 05/19] mm: Remove 'page_offset' from
 readahead loop
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
> Eliminate the page_offset variable which was confusing with the
> 'offset' parameter and record the start of each consecutive run of
> pages in the readahead_control.


...presumably for the benefit of a subsequent patch, since it's not
consumed in this patch.

Thanks for breaking these up, btw, it really helps.


> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 3eca59c43a45..74791b96013f 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -162,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	struct readahead_control rac = {
>  		.mapping = mapping,
>  		.file = filp,
> +		._start = offset,
>  		._nr_pages = 0,
>  	};
>  
> @@ -175,12 +176,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 */
>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
>  		struct page *page;
> -		pgoff_t page_offset = offset + page_idx;


OK, this is still something I want to mention (I wrote the same thing when reviewing 
the wrong version of this patch, a moment ago).

You know...this ends up incrementing offset each time through the
loop, so yes, the behavior is the same as when using "offset + page_idx".
However, now it's a little harder to see that.

IMHO the page_offset variable is not actually a bad thing, here. I'd rather
keep it, all other things being equal (and I don't see any other benefits
here: line count is about the same, for example).

What do you think? (I don't feel strongly about this fine point.)


thanks,
-- 
John Hubbard
NVIDIA


>  
> -		if (page_offset > end_index)
> +		if (offset > end_index)
>  			break;
>  
> -		page = xa_load(&mapping->i_pages, page_offset);
> +		page = xa_load(&mapping->i_pages, offset);
>  		if (page && !xa_is_value(page)) {
>  			/*
>  			 * Page already present?  Kick off the current batch
> @@ -196,16 +196,18 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = page_offset;
> +		page->index = offset;
>  		list_add(&page->lru, &page_pool);
>  		if (page_idx == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
> +		offset++;
>  		continue;
>  read:
>  		if (readahead_count(&rac))
>  			read_pages(&rac, &page_pool, gfp_mask);
>  		rac._nr_pages = 0;
> +		rac._start = ++offset;
>  	}
>  
>  	/*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
