Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 403081637F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 01:02:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4CoP-0003Wt-81; Wed, 19 Feb 2020 00:01:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4CoO-0003We-CT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 00:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z3Bzj/5bgrV9fPnuzsXFxX0FOV0H+b7fZfF2f3wUJhE=; b=JT2Ztx6a83fs7xcP18lxWWJO7o
 yaaq5B7E2EAdK+X4EPgkucUyh5rGzS3x/rEm3t8EClJ5pIWliSXDrQFf7XcFjWbcTd8hhB4id4KzJ
 T+KTou6bqpQF3jAAf1OnjaevDkwb/t5DQx5OTv6prdl/MoEaLUhPh5ocr54cVem6WgAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z3Bzj/5bgrV9fPnuzsXFxX0FOV0H+b7fZfF2f3wUJhE=; b=jFZL7l1Sl5td8Zkg7+3s37BqRZ
 TNkKSgdGzS8PU+SRMuaZin4m1zba/FUU2NULoNfRXV2y3BgLsg9jv34QY8ECf9M8WTP3M+nPsVGWr
 w0V+wAzOHpWPPQ0dvyyCGwoP436F2i1RIXtJ1uUkxULyDmn4Efnd4060Y96mib2AWjCc=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4CoM-00H3v6-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 00:01:56 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c7ac80000>; Tue, 18 Feb 2020 16:01:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 16:01:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 16:01:44 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 00:01:43 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
Date: Tue, 18 Feb 2020 16:01:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-12-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582070472; bh=z3Bzj/5bgrV9fPnuzsXFxX0FOV0H+b7fZfF2f3wUJhE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=CDXm5ZINDvSMkAMnjJBonRkzIb7iakoxvVztr5ii0adNdeG78Anh8llJWS1Oc3ute
 ciu9+xmTJ9a50yl/a+pixD46BgV6xF+09QnP10UJd4Zpp0lWUdTmM7aBiLhSZDw6Hf
 wCP/rAeJW8P45k+lakQ0Jakmz74bgXZE1S//J77o6oOO3+7Jggx7PzOpoJM5AKYTOZ
 KfIQU7OmVVxsb6VxM6AEe7fCrs6vPu0hc+FYSwUN2mgoONMaQPVhKQI/fdMA+wED9M
 GVdeSW/kF97kpNzr8blN78Wpo/oC7ggjF0inN752QvrA2QkM3LFiAvFbOOfAivj44D
 cOxpPLMH8VOBg==
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
X-Headers-End: 1j4CoM-00H3v6-DJ
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
 earlier
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
> At allocation time, put the pages in the cache unless we're using
> ->readpages.  Add the readahead_for_each() iterator for the benefit of
> the ->readpage fallback.  This iterator supports huge pages, even though
> none of the filesystems to be converted do yet.
> 


"Also, remove the gfp argument from read_pages(), now that read_pages()
no longer does allocation."

Generally looks accurate, just a few notes below:


> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/pagemap.h | 24 ++++++++++++++++++++++++
>  mm/readahead.c          | 34 +++++++++++++++++-----------------
>  2 files changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 982ecda2d4a2..3613154e79e4 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -639,8 +639,32 @@ struct readahead_control {
>  /* private: use the readahead_* accessors instead */
>  	pgoff_t _start;
>  	unsigned int _nr_pages;
> +	unsigned int _batch_count;
>  };
>  
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +	struct page *page;
> +
> +	if (!rac->_nr_pages)
> +		return NULL;
> +
> +	page = xa_load(&rac->mapping->i_pages, rac->_start);
> +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> +	rac->_batch_count = hpage_nr_pages(page);
> +
> +	return page;
> +}
> +
> +static inline void readahead_next(struct readahead_control *rac)
> +{
> +	rac->_nr_pages -= rac->_batch_count;
> +	rac->_start += rac->_batch_count;
> +}
> +
> +#define readahead_for_each(rac, page)					\
> +	for (; (page = readahead_page(rac)); readahead_next(rac))
> +


How about this instead? It uses the "for" loop fully and more naturally,
and is easier to read. And it does the same thing:

static inline struct page *readahead_page(struct readahead_control *rac)
{
	struct page *page;

	if (!rac->_nr_pages)
		return NULL;

	page = xa_load(&rac->mapping->i_pages, rac->_start);
	VM_BUG_ON_PAGE(!PageLocked(page), page);
	rac->_batch_count = hpage_nr_pages(page);

	return page;
}

static inline struct page *readahead_next(struct readahead_control *rac)
{
	rac->_nr_pages -= rac->_batch_count;
	rac->_start += rac->_batch_count;

	return readahead_page(rac);
}

#define readahead_for_each(rac, page)			\
	for (page = readahead_page(rac); page != NULL;	\
	     page = readahead_page(rac))




>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index bdc5759000d3..9e430daae42f 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,12 +113,11 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
>  
>  EXPORT_SYMBOL(read_cache_pages);
>  
> -static void read_pages(struct readahead_control *rac, struct list_head *pages,
> -		gfp_t gfp)
> +static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  {
>  	const struct address_space_operations *aops = rac->mapping->a_ops;
> +	struct page *page;
>  	struct blk_plug plug;
> -	unsigned page_idx;
>  
>  	blk_start_plug(&plug);
>  
> @@ -127,19 +126,13 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>  				readahead_count(rac));
>  		/* Clean up the remaining pages */
>  		put_pages_list(pages);
> -		goto out;
> -	}
> -
> -	for (page_idx = 0; page_idx < readahead_count(rac); page_idx++) {
> -		struct page *page = lru_to_page(pages);
> -		list_del(&page->lru);
> -		if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> -				gfp))
> +	} else {
> +		readahead_for_each(rac, page) {
>  			aops->readpage(rac->file, page);
> -		put_page(page);
> +			put_page(page);
> +		}
>  	}
>  
> -out:
>  	blk_finish_plug(&plug);
>  }
>  
> @@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	unsigned long i;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	bool use_list = mapping->a_ops->readpages;


fwiw, "bool have_readpages" seems like a better name (after all, that's how read_pages() 
effectively is written: "if you have .readpages, then..."), but I can see both sides 
of that bikeshed. :)


>  	struct readahead_control rac = {
>  		.mapping = mapping,
>  		.file = filp,
> @@ -196,8 +190,14 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = offset;
> -		list_add(&page->lru, &page_pool);
> +		if (use_list) {
> +			page->index = offset;
> +			list_add(&page->lru, &page_pool);
> +		} else if (add_to_page_cache_lru(page, mapping, offset,
> +					gfp_mask) < 0) {


It would be a little safer from a maintenance point of view, to check for !=0, rather
than checking for < 0.  Most (all?) existing callers check that way, and it's good
to stay with the pack there.


> +			put_page(page);
> +			goto read;
> +		}
>  		if (i == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
> @@ -205,7 +205,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		continue;
>  read:
>  		if (readahead_count(&rac))
> -			read_pages(&rac, &page_pool, gfp_mask);
> +			read_pages(&rac, &page_pool);
>  		rac._nr_pages = 0;
>  		rac._start = ++offset;
>  	}
> @@ -216,7 +216,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * will then handle the error.
>  	 */
>  	if (readahead_count(&rac))
> -		read_pages(&rac, &page_pool, gfp_mask);
> +		read_pages(&rac, &page_pool);
>  	BUG_ON(!list_empty(&page_pool));
>  }
>  
> 


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
