Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C80ED166D64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 04:20:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4yrR-00088q-Ik; Fri, 21 Feb 2020 03:20:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4yrN-00088Z-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9GO24BnJ9chVyb7bjDvehilb1nYQfQG1WbFa23HlCQ=; b=IaFBWI4sjJr0fmk1XNMJ8pZIud
 E7ueTtJnAVNiqlyyzjkm13S8UGY0WeqRPJL1f0pPl6P33sCyYnw5R6FLT6wwqBS8wpG1NQMS9F/XO
 jlZ32qZKXHuYoPBiPDmhs94Y+rt1Uj+w3U1j8RuVAGTuVhsbdlThnSsr7+kmQFRtJLWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d9GO24BnJ9chVyb7bjDvehilb1nYQfQG1WbFa23HlCQ=; b=j1cbdeo1IF9/H4buJhR0DLMYqj
 nwnAo++uCLQT9+QOhI7Swfi6TrbIHcjcatRZ6qde8kI8wfHzc2QYwNg3ofe3mFTgQ/sYZhsPje+qA
 DVUavC6/xNplg2DbnXSni7x7dLZ4IuviHNc/GzM6hh36R77CgX+NUPQ5WIZmsjyZ+4uA=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4yrJ-00COFh-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:20:13 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f4c170000>; Thu, 20 Feb 2020 19:18:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 19:20:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 19:20:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 03:19:58 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-10-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
Date: Thu, 20 Feb 2020 19:19:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-10-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582255127; bh=d9GO24BnJ9chVyb7bjDvehilb1nYQfQG1WbFa23HlCQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=j8lnjXCIkqwMrXJaVVDslJxTWLAnUGO/CaWyqjQLudoTMm3i9Zx3OqJhlyB9Yyhq+
 utkP6BZFbavm1AmbhdA+XFIXY5d3Kj33MMh1p8Uk0onLlle+ytW3uHn9sEhzomIheI
 Se+a2E+KXmhwvFtDc9hHRwsk8PVOBI1/XGSQWpesFfsXpMZEAeJylOzpozmk9xhzFj
 MZfu8A1bf4E5H4WCdDcjNC/yj/pHtBcxhV2Pb4lZVU17ufmzgkLLLQQ309cKct9ZkV
 TVR///Pi86EMvWedrYrq49dcDa3rkvkyTy76J1dRBqQ1zbotcoI7AyAadLWkOyAg8u
 OWp28i0wa/20A==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4yrJ-00COFh-Mo
Subject: Re: [f2fs-dev] [PATCH v7 09/24] mm: Put readahead pages in cache
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

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> When populating the page cache for readahead, mappings that use
> ->readpages must populate the page cache themselves as the pages are
> passed on a linked list which would normally be used for the page cache's
> LRU.  For mappings that use ->readpage or the upcoming ->readahead method,
> we can put the pages into the page cache as soon as they're allocated,
> which solves a race between readahead and direct IO.  It also lets us
> remove the gfp argument from read_pages().
> 
> Use the new readahead_page() API to implement the repeated calls to
> ->readpage(), just like most filesystems will.  This iterator also
> supports huge pages, even though none of the filesystems have been
> converted to use them yet.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/pagemap.h | 20 +++++++++++++++++
>  mm/readahead.c          | 48 +++++++++++++++++++++++++----------------
>  2 files changed, 49 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 55fcea0249e6..4989d330fada 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -647,8 +647,28 @@ struct readahead_control {
>  /* private: use the readahead_* accessors instead */
>  	pgoff_t _index;
>  	unsigned int _nr_pages;
> +	unsigned int _batch_count;
>  };
>  
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +	struct page *page;
> +
> +	BUG_ON(rac->_batch_count > rac->_nr_pages);
> +	rac->_nr_pages -= rac->_batch_count;
> +	rac->_index += rac->_batch_count;
> +	rac->_batch_count = 0;


Is it intentional, to set rac->_batch_count twice (here, and below)? The
only reason I can see is if a caller needs to use ->_batch_count in the
"return NULL" case, which doesn't seem to come up...


> +
> +	if (!rac->_nr_pages)
> +		return NULL;
> +
> +	page = xa_load(&rac->mapping->i_pages, rac->_index);
> +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> +	rac->_batch_count = hpage_nr_pages(page);
> +
> +	return page;
> +}
> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 83df5c061d33..aaa209559ba2 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,15 +113,14 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
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
>  	if (!readahead_count(rac))
> -		return;
> +		goto out;
>  
>  	blk_start_plug(&plug);
>  
> @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
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
> +		rac->_index += rac->_nr_pages;
> +		rac->_nr_pages = 0;
> +	} else {
> +		while ((page = readahead_page(rac))) {
>  			aops->readpage(rac->file, page);
> -		put_page(page);
> +			put_page(page);
> +		}
>  	}
>  
> -out:
>  	blk_finish_plug(&plug);
>  
>  	BUG_ON(!list_empty(pages));
> -	rac->_nr_pages = 0;
> +	BUG_ON(readahead_count(rac));
> +
> +out:
> +	/* If we were called due to a conflicting page, skip over it */


Tiny documentation nit: What if we were *not* called due to a conflicting page? 
(And what is a "conflicting page", in this context, btw?) The next line unconditionally 
moves the index ahead, so the "if" part of the comment really confuses me.


> +	rac->_index++;
>  }
>  
>  /*
> @@ -165,9 +164,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	LIST_HEAD(page_pool);
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	bool use_list = mapping->a_ops->readpages;
>  	struct readahead_control rac = {
>  		.mapping = mapping,
>  		.file = filp,
> +		._index = index,
>  		._nr_pages = 0,
>  	};
>  	unsigned long i;
> @@ -184,6 +185,8 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		if (index + i > end_index)
>  			break;
>  
> +		BUG_ON(index + i != rac._index + rac._nr_pages);
> +
>  		page = xa_load(&mapping->i_pages, index + i);
>  		if (page && !xa_is_value(page)) {
>  			/*
> @@ -191,15 +194,22 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  			 * contiguous pages before continuing with the next
>  			 * batch.
>  			 */
> -			read_pages(&rac, &page_pool, gfp_mask);
> +			read_pages(&rac, &page_pool);
>  			continue;
>  		}
>  
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = index + i;
> -		list_add(&page->lru, &page_pool);
> +		if (use_list) {
> +			page->index = index + i;
> +			list_add(&page->lru, &page_pool);
> +		} else if (add_to_page_cache_lru(page, mapping, index + i,
> +					gfp_mask) < 0) {


I still think you'll want to compare against !=0, rather than < 0, here.


> +			put_page(page);
> +			read_pages(&rac, &page_pool);


Doing a read_pages() in the error case is because...actually, I'm not sure yet.
Why do we do this? Effectively it's a retry?


> +			continue;
> +		}
>  		if (i == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
> @@ -210,7 +220,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * uptodate then the caller will launch readpage again, and
>  	 * will then handle the error.
>  	 */
> -	read_pages(&rac, &page_pool, gfp_mask);
> +	read_pages(&rac, &page_pool);
>  }
>  
>  /*
> 

Didn't spot any actual errors, just mainly my own questions here. :)


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
