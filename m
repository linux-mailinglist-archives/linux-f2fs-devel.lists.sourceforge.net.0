Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB17163964
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 02:32:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4EEK-0007Rm-Hm; Wed, 19 Feb 2020 01:32:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4EEI-0007RT-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a8ZomntyDZQd4T0ETmKn7kyy8sPKQZmX4XFar/4v0t8=; b=bJfpjxH54KP8/bnou4y1tSFJpB
 Tc1a+Tx6lJiSMZbjpUwkWcT6xrEqBCushrBsiEYGLWUpQ8EFfBEDUrcrUksKTt2ZX2NOKlRaOq2GN
 be93yhIDc3qFqRe3BDk97YO5lfOB2ahmohC3lHvH/IIWsrdz3NYBQJcR+Yg/KxvF+erI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a8ZomntyDZQd4T0ETmKn7kyy8sPKQZmX4XFar/4v0t8=; b=cYhOMXDVZfvpnBIyB+f3uAXMnO
 4KtUGZdz9+GhTHCSXgxG48z+cN1lWV1z3aJugSofF4qMdChVTYcDRYaDsIne2q8KM6jtTYxr2Owq1
 w7anP79IFIEioxuZ1EBzKvHMTSe1DSq0NyQJ1izNd+GH2Dvm4HjYwIXjcQuFe3y8tsfA=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4EEE-007qFr-31
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:32:46 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c900f0000>; Tue, 18 Feb 2020 17:31:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 17:32:31 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 17:32:31 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 01:32:31 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-16-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
Date: Tue, 18 Feb 2020 17:32:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-16-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582075919; bh=a8ZomntyDZQd4T0ETmKn7kyy8sPKQZmX4XFar/4v0t8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=D1CWU0QJZ/vJUMktO/sgLa0NnHUxAzBi1kB3pVWooMjgO2jXs6q5zixf/wAqu/IOj
 hr6pMYPnaPYV3Ou3y08ljYOt3n9jfzxdK6636RtEz2ipjrYs3b4hz65TVfyMrWizE8
 BxPE/Qh4U52+XVl1w9Y1JqrHWmAs8zmb1n5IGtB0T/8XlxD4CpXKwc33AZc13ZXKhr
 j3FFEWf0HWoIz+2Nn/3nFVgupnlhaFia1orj1/9DKmtEAFVKf0ZH9VZvLLwMWQNW7A
 KAP7iN3AiTFahALL3seMXUw0/Tn+K2lQR+L66VGAqWlcnZtVglzmkuRCBxmUoAyDSr
 JDYpNY+TxVunw==
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
X-Headers-End: 1j4EEE-007qFr-31
Subject: Re: [f2fs-dev] [PATCH v6 09/19] mm: Add page_cache_readahead_limit
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
> ext4 and f2fs have duplicated the guts of the readahead code so
> they can read past i_size.  Instead, separate out the guts of the
> readahead code so they can call it directly.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/ext4/verity.c        | 35 ++---------------------
>  fs/f2fs/verity.c        | 35 ++---------------------
>  include/linux/pagemap.h |  4 +++
>  mm/readahead.c          | 61 +++++++++++++++++++++++++++++------------
>  4 files changed, 52 insertions(+), 83 deletions(-)


Just some minor ideas below, mostly documentation, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> 
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index dc5ec724d889..f6e0bf05933e 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -342,37 +342,6 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
>  	return desc_size;
>  }
>  
> -/*
> - * Prefetch some pages from the file's Merkle tree.
> - *
> - * This is basically a stripped-down version of __do_page_cache_readahead()
> - * which works on pages past i_size.
> - */
> -static void ext4_merkle_tree_readahead(struct address_space *mapping,
> -				       pgoff_t start_index, unsigned long count)
> -{
> -	LIST_HEAD(pages);
> -	unsigned int nr_pages = 0;
> -	struct page *page;
> -	pgoff_t index;
> -	struct blk_plug plug;
> -
> -	for (index = start_index; index < start_index + count; index++) {
> -		page = xa_load(&mapping->i_pages, index);
> -		if (!page || xa_is_value(page)) {
> -			page = __page_cache_alloc(readahead_gfp_mask(mapping));
> -			if (!page)
> -				break;
> -			page->index = index;
> -			list_add(&page->lru, &pages);
> -			nr_pages++;
> -		}
> -	}
> -	blk_start_plug(&plug);
> -	ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
> -	blk_finish_plug(&plug);
> -}
> -
>  static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
> @@ -386,8 +355,8 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  		if (page)
>  			put_page(page);
>  		else if (num_ra_pages > 1)
> -			ext4_merkle_tree_readahead(inode->i_mapping, index,
> -						   num_ra_pages);
> +			page_cache_readahead_limit(inode->i_mapping, NULL,
> +					index, LONG_MAX, num_ra_pages, 0);


LONG_MAX seems bold at first, but then again I can't think of anything smaller 
that makes any sense, and the previous code didn't have a limit either...OK.

I also wondered about the NULL file parameter, and wonder if we're stripping out
information that is needed for authentication, given that that's what the newly
written kerneldoc says the "file" arg is for. But it seems that if we're this 
deep in the fs code's read routines, file system authentication has long since 
been addressed.

Any actually I don't yet (still working through the patches) see any authentication,
so maybe that parameter will turn out to be unnecessary.

Anyway, It's nice to see this factored out into a single routine.


>  		page = read_mapping_page(inode->i_mapping, index, NULL);
>  	}
>  	return page;
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index d7d430a6f130..71a3e36721fa 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -222,37 +222,6 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  	return size;
>  }
>  
> -/*
> - * Prefetch some pages from the file's Merkle tree.
> - *
> - * This is basically a stripped-down version of __do_page_cache_readahead()
> - * which works on pages past i_size.
> - */
> -static void f2fs_merkle_tree_readahead(struct address_space *mapping,
> -				       pgoff_t start_index, unsigned long count)
> -{
> -	LIST_HEAD(pages);
> -	unsigned int nr_pages = 0;
> -	struct page *page;
> -	pgoff_t index;
> -	struct blk_plug plug;
> -
> -	for (index = start_index; index < start_index + count; index++) {
> -		page = xa_load(&mapping->i_pages, index);
> -		if (!page || xa_is_value(page)) {
> -			page = __page_cache_alloc(readahead_gfp_mask(mapping));
> -			if (!page)
> -				break;
> -			page->index = index;
> -			list_add(&page->lru, &pages);
> -			nr_pages++;
> -		}
> -	}
> -	blk_start_plug(&plug);
> -	f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
> -	blk_finish_plug(&plug);
> -}
> -
>  static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
> @@ -266,8 +235,8 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  		if (page)
>  			put_page(page);
>  		else if (num_ra_pages > 1)
> -			f2fs_merkle_tree_readahead(inode->i_mapping, index,
> -						   num_ra_pages);
> +			page_cache_readahead_limit(inode->i_mapping, NULL,
> +					index, LONG_MAX, num_ra_pages, 0);
>  		page = read_mapping_page(inode->i_mapping, index, NULL);
>  	}
>  	return page;
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index bd4291f78f41..4f36c06d064d 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -389,6 +389,10 @@ extern struct page * read_cache_page_gfp(struct address_space *mapping,
>  				pgoff_t index, gfp_t gfp_mask);
>  extern int read_cache_pages(struct address_space *mapping,
>  		struct list_head *pages, filler_t *filler, void *data);
> +void page_cache_readahead_limit(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, pgoff_t end_index,
> +		unsigned long nr_to_read, unsigned long lookahead_size);
> +
>  
>  static inline struct page *read_mapping_page(struct address_space *mapping,
>  				pgoff_t index, void *data)
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 975ff5e387be..94d499cfb657 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -142,35 +142,38 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  	blk_finish_plug(&plug);
>  }
>  
> -/*
> - * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
> - * the pages first, then submits them for I/O. This avoids the very bad
> - * behaviour which would occur if page allocations are causing VM writeback.
> - * We really don't want to intermingle reads and writes like that.
> +/**
> + * page_cache_readahead_limit - Start readahead beyond a file's i_size.


Maybe: 

    "Start readahead to a caller-specified end point" ?

(It's only *potentially* beyond files's i_size.)


> + * @mapping: File address space.
> + * @file: This instance of the open file; used for authentication.
> + * @offset: First page index to read.
> + * @end_index: The maximum page index to read.
> + * @nr_to_read: The number of pages to read.


How about:

    "The number of pages to read, as long as end_index is not exceeded."


> + * @lookahead_size: Where to start the next readahead.


Pre-existing, but...it's hard to understand how a size is "where to start".
Should we rename this arg?

> + *
> + * This function is for filesystems to call when they want to start
> + * readahead potentially beyond a file's stated i_size.  If you want
> + * to start readahead on a normal file, you probably want to call
> + * page_cache_async_readahead() or page_cache_sync_readahead() instead.
> + *
> + * Context: File is referenced by caller.  Mutexes may be held by caller.
> + * May sleep, but will not reenter filesystem to reclaim memory.


In fact, can we say "must not reenter filesystem"? 


>   */
> -void __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> -		unsigned long lookahead_size)
> +void page_cache_readahead_limit(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, pgoff_t end_index,
> +		unsigned long nr_to_read, unsigned long lookahead_size)
>  {
> -	struct inode *inode = mapping->host;
> -	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	unsigned long i;
> -	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  	bool use_list = mapping->a_ops->readpages;
>  	struct readahead_control rac = {
>  		.mapping = mapping,
> -		.file = filp,
> +		.file = file,
>  		._start = offset,
>  		._nr_pages = 0,
>  	};
>  
> -	if (isize == 0)
> -		return;
> -
> -	end_index = ((isize - 1) >> PAGE_SHIFT);
> -
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
> @@ -225,6 +228,30 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		read_pages(&rac, &page_pool);
>  	BUG_ON(!list_empty(&page_pool));
>  }
> +EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
> +
> +/*
> + * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
> + * the pages first, then submits them for I/O. This avoids the very bad
> + * behaviour which would occur if page allocations are causing VM writeback.
> + * We really don't want to intermingle reads and writes like that.
> + */
> +void __do_page_cache_readahead(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, unsigned long nr_to_read,
> +		unsigned long lookahead_size)
> +{
> +	struct inode *inode = mapping->host;
> +	unsigned long end_index;	/* The last page we want to read */
> +	loff_t isize = i_size_read(inode);
> +
> +	if (isize == 0)
> +		return;
> +
> +	end_index = ((isize - 1) >> PAGE_SHIFT);
> +
> +	page_cache_readahead_limit(mapping, file, offset, end_index,
> +			nr_to_read, lookahead_size);
> +}
>  
>  /*
>   * Chunk the readahead into 2 megabyte units, so that we don't pin too much
> 


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
