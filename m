Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C65C115D0A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 04:36:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2Rma-000739-Io; Fri, 14 Feb 2020 03:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j2RmY-00072s-BP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 03:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jodX0tIvBxH/fc59T73o9SPk6S3e+yDpKWnaNwpeJKk=; b=MfD/LjU8iPB3A0pFMUldaUoxcw
 AiKoyDF20B7ANjAzY3tBFxNRE0umXx4CajIIQLMjZpJ8yzQ+CD2WT+QR7KDysHCpVogV42kcbgNJK
 axkZmibWNNjZk9JDUbF0B42pQT+ou4sS6dHxTnfvUu5XTa9HrMLAaE3yMepTNt3YGrcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jodX0tIvBxH/fc59T73o9SPk6S3e+yDpKWnaNwpeJKk=; b=hAm3l3YgkqdNUbLITVGSFdJ/I4
 cbUBa2CaVGrNjV2O36AORWrTUByJ/ZQ2F55HC2qgh6VzvwbF/12hc7eanY0tC3IOZDR+FSD5dfYiR
 DcyFtawDxPpW1FktXJnWb19Rqj1dvxok13wbGTrmhHOeNjh7l3paYb/VAIakh/pmBr4c=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2RmW-003duO-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 03:36:46 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4615b90000>; Thu, 13 Feb 2020 19:36:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Feb 2020 19:36:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Feb 2020 19:36:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 03:36:39 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-4-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
Date: Thu, 13 Feb 2020 19:36:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211010348.6872-4-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581651385; bh=jodX0tIvBxH/fc59T73o9SPk6S3e+yDpKWnaNwpeJKk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TZf2FK1bESe06GQrr3QWPstwI5CI6ADgd3ekfkEEBCxsznAzp/43OrXvLIdUwk6v9
 4PvhXV9KA2GzBIO5FVXywx6Yx4JZowfMDze3Z/5j54bStQRS61QiScPwZCgRgQ9xzt
 7ai4uLewCJr+qbdYGw8j6AC1KIuz1sHeXguO+TyPFfs/5Cwmjn/6ETP0ytHeXfze8x
 aZXVC6Py5XJwaXp8pJ7Om4/J3JPHPE/2VYV1PRSOmD236D2IEEGhBl9TBFg0OLQxCY
 GWBBoVBH3FzkluFiC7gp+exF/Tlgdi2RCth1YbNLQQ91aeVldSsZAblIBpXwiH2ihX
 ePKdIST/oKi4w==
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2RmW-003duO-Sg
Subject: Re: [f2fs-dev] [PATCH v5 03/13] mm: Put readahead pages in cache
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

On 2/10/20 5:03 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> At allocation time, put the pages in the cache unless we're using
> ->readpages.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 66 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index fc77d13af556..96c6ca68a174 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -114,10 +114,10 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
>  EXPORT_SYMBOL(read_cache_pages);
>  
>  static void read_pages(struct address_space *mapping, struct file *filp,
> -		struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
> +		struct list_head *pages, pgoff_t start,
> +		unsigned int nr_pages)
>  {
>  	struct blk_plug plug;
> -	unsigned page_idx;
>  
>  	blk_start_plug(&plug);
>  
> @@ -125,18 +125,17 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>  		mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
>  		/* Clean up the remaining pages */
>  		put_pages_list(pages);
> -		goto out;
> -	}
> +	} else {
> +		struct page *page;
> +		unsigned long index;
>  
> -	for (page_idx = 0; page_idx < nr_pages; page_idx++) {
> -		struct page *page = lru_to_page(pages);
> -		list_del(&page->lru);
> -		if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
> +		xa_for_each_range(&mapping->i_pages, index, page, start,
> +				start + nr_pages - 1) {
>  			mapping->a_ops->readpage(filp, page);
> -		put_page(page);
> +			put_page(page);
> +		}
>  	}
>  
> -out:
>  	blk_finish_plug(&plug);
>  }
>  
> @@ -149,17 +148,18 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>   * Returns the number of pages requested, or the maximum amount of I/O allowed.
>   */
>  unsigned long __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> +		struct file *filp, pgoff_t start, unsigned long nr_to_read,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> -	struct page *page;
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	int page_idx;
> +	pgoff_t page_offset = start;
>  	unsigned long nr_pages = 0;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	bool use_list = mapping->a_ops->readpages;
>  
>  	if (isize == 0)
>  		goto out;
> @@ -170,7 +170,7 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> -		pgoff_t page_offset = offset + page_idx;
> +		struct page *page;

I see two distinct things happening in this patch, and I think they want to each be
in their own patch:

1) A significant refactoring of the page loop, and

2) Changing the place where the page is added to the page cache. (Only this one is 
   mentioned in the commit description.)

We'll be more likely to spot any errors if these are teased apart.


thanks,
-- 
John Hubbard
NVIDIA

>  
>  		if (page_offset > end_index)
>  			break;
> @@ -178,25 +178,43 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  		page = xa_load(&mapping->i_pages, page_offset);
>  		if (page && !xa_is_value(page)) {
>  			/*
> -			 * Page already present?  Kick off the current batch of
> -			 * contiguous pages before continuing with the next
> -			 * batch.
> +			 * Page already present?  Kick off the current batch
> +			 * of contiguous pages before continuing with the
> +			 * next batch.
> +			 * It's possible this page is the page we should
> +			 * be marking with PageReadahead.  However, we
> +			 * don't have a stable ref to this page so it might
> +			 * be reallocated to another user before we can set
> +			 * the bit.  There's probably another page in the
> +			 * cache marked with PageReadahead from the other
> +			 * process which accessed this file.
>  			 */
> -			if (nr_pages)
> -				read_pages(mapping, filp, &page_pool, nr_pages,
> -						gfp_mask);
> -			nr_pages = 0;
> -			continue;
> +			goto skip;
>  		}
>  
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = page_offset;
> -		list_add(&page->lru, &page_pool);
> +		if (use_list) {
> +			page->index = page_offset;
> +			list_add(&page->lru, &page_pool);
> +		} else if (add_to_page_cache_lru(page, mapping, page_offset,
> +					gfp_mask) < 0) {
> +			put_page(page);
> +			goto skip;
> +		}
> +
>  		if (page_idx == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		nr_pages++;
> +		page_offset++;
> +		continue;
> +skip:
> +		if (nr_pages)
> +			read_pages(mapping, filp, &page_pool, start, nr_pages);
> +		nr_pages = 0;
> +		page_offset++;
> +		start = page_offset;
>  	}
>  
>  	/*
> @@ -205,7 +223,7 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  	 * will then handle the error.
>  	 */
>  	if (nr_pages)
> -		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
> +		read_pages(mapping, filp, &page_pool, start, nr_pages);
>  	BUG_ON(!list_empty(&page_pool));
>  out:
>  	return nr_pages;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
