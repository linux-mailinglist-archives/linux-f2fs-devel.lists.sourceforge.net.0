Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34245166E8A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 05:30:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4zxg-0002jO-EO; Fri, 21 Feb 2020 04:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4zxf-0002jH-9v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Wm3044wXz/CoDYYTB4qibyZMJiORNPZJOuYKY+0G8w=; b=ZDqA8Hb5q/tcpcaVj57Yzh4Vcs
 niDe1QiDWDYXnkPoqo9dB6KGPM2+4ynfHctdgDjqIn8wck9MOe47gRYVgnLwRv5W0Kx5xiAGyGdVc
 KEor3gUn+DaOtUkv0BcJR2cCumdBiioUHGMYhwWwdnnXW47zBQTnXCUzuoJ4MjJs+NcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Wm3044wXz/CoDYYTB4qibyZMJiORNPZJOuYKY+0G8w=; b=nCxK8exyP44goVkaqFhr0nSlDM
 dQ2sJXiilCrd0qw6kvh51Gp4ci5jpgcC/7SV7Z2N6nh4TjXurM63DfT8AJqhUJDIqI704CHA/lIj+
 NNjniWRaMTOsb9kJi7LDCZYXE8xboKwcBQUbvVN1EJhnH1DlqVt3MX3qPRGwsBDnfwR0=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4zxc-00ClYC-6F
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:30:47 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f5ca50002>; Thu, 20 Feb 2020 20:29:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 20:30:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 20:30:38 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 04:30:38 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-11-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <45d67cb1-9ca3-e2b8-d71f-1f0c2e085155@nvidia.com>
Date: Thu, 20 Feb 2020 20:30:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-11-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582259366; bh=+Wm3044wXz/CoDYYTB4qibyZMJiORNPZJOuYKY+0G8w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UitvsuI1yoXnzml76+cSz7F+oTZFS/iyT7dOV5LH/5L9YZnf2JDmcICsW5QQsDOWw
 JEmxfGjJhpm6Mw0DpkQ4I97JHP2YxMVlsg4TdE5MBveHV+wfxOmkMx2E9X1fQGLWfG
 f8znlDQrWpx92I4FW23hWS3bxNs0j+rkOmq+Rdu1ptzaIP6nxGv9ByYUjCJJs79YE7
 seWhQosGZtfe20jPzoLRnPNfNQlt0kzqk9SCpCzrG7HeKnuVPkQFIfGbTqOGCn3/Pw
 /XB5cMIwzFk+62xO1plJYkkUcmyRC6IeEYi54p0+giupM67/DiXtRdSSVw1QBxLyH7
 Qd6o1BBujjHhg==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nvidia.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4zxc-00ClYC-6F
Subject: Re: [f2fs-dev] [PATCH v7 10/24] mm: Add readahead address space
 operation
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
> This replaces ->readpages with a saner interface:
>  - Return void instead of an ignored error code.
>  - Page cache is already populated with locked pages when ->readahead
>    is called.
>  - New arguments can be passed to the implementation without changing
>    all the filesystems that use a common helper function like
>    mpage_readahead().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/filesystems/locking.rst |  6 +++++-
>  Documentation/filesystems/vfs.rst     | 15 +++++++++++++++
>  include/linux/fs.h                    |  2 ++
>  include/linux/pagemap.h               | 18 ++++++++++++++++++
>  mm/readahead.c                        | 12 ++++++++++--
>  5 files changed, 50 insertions(+), 3 deletions(-)


This all looks correct to me, so: 

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA


> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 5057e4d9dcd1..0af2e0e11461 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -239,6 +239,7 @@ prototypes::
>  	int (*readpage)(struct file *, struct page *);
>  	int (*writepages)(struct address_space *, struct writeback_control *);
>  	int (*set_page_dirty)(struct page *page);
> +	void (*readahead)(struct readahead_control *);
>  	int (*readpages)(struct file *filp, struct address_space *mapping,
>  			struct list_head *pages, unsigned nr_pages);
>  	int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -271,7 +272,8 @@ writepage:		yes, unlocks (see below)
>  readpage:		yes, unlocks
>  writepages:
>  set_page_dirty		no
> -readpages:
> +readahead:		yes, unlocks
> +readpages:		no
>  write_begin:		locks the page		 exclusive
>  write_end:		yes, unlocks		 exclusive
>  bmap:
> @@ -295,6 +297,8 @@ the request handler (/dev/loop).
>  ->readpage() unlocks the page, either synchronously or via I/O
>  completion.
>  
> +->readahead() unlocks the pages that I/O is attempted on like ->readpage().
> +
>  ->readpages() populates the pagecache with the passed pages and starts
>  I/O against them.  They come unlocked upon I/O completion.
>  
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7d4d09dd5e6d..ed17771c212b 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -706,6 +706,7 @@ cache in your filesystem.  The following members are defined:
>  		int (*readpage)(struct file *, struct page *);
>  		int (*writepages)(struct address_space *, struct writeback_control *);
>  		int (*set_page_dirty)(struct page *page);
> +		void (*readahead)(struct readahead_control *);
>  		int (*readpages)(struct file *filp, struct address_space *mapping,
>  				 struct list_head *pages, unsigned nr_pages);
>  		int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -781,12 +782,26 @@ cache in your filesystem.  The following members are defined:
>  	If defined, it should set the PageDirty flag, and the
>  	PAGECACHE_TAG_DIRTY tag in the radix tree.
>  
> +``readahead``
> +	Called by the VM to read pages associated with the address_space
> +	object.  The pages are consecutive in the page cache and are
> +	locked.  The implementation should decrement the page refcount
> +	after starting I/O on each page.  Usually the page will be
> +	unlocked by the I/O completion handler.  If the filesystem decides
> +	to stop attempting I/O before reaching the end of the readahead
> +	window, it can simply return.  The caller will decrement the page
> +	refcount and unlock the remaining pages for you.  Set PageUptodate
> +	if the I/O completes successfully.  Setting PageError on any page
> +	will be ignored; simply unlock the page if an I/O error occurs.
> +
>  ``readpages``
>  	called by the VM to read pages associated with the address_space
>  	object.  This is essentially just a vector version of readpage.
>  	Instead of just one page, several pages are requested.
>  	readpages is only used for read-ahead, so read errors are
>  	ignored.  If anything goes wrong, feel free to give up.
> +	This interface is deprecated and will be removed by the end of
> +	2020; implement readahead instead.
>  
>  ``write_begin``
>  	Called by the generic buffered write code to ask the filesystem
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3cd4fe6b845e..d4e2d2964346 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -292,6 +292,7 @@ enum positive_aop_returns {
>  struct page;
>  struct address_space;
>  struct writeback_control;
> +struct readahead_control;
>  
>  /*
>   * Write life time hint values.
> @@ -375,6 +376,7 @@ struct address_space_operations {
>  	 */
>  	int (*readpages)(struct file *filp, struct address_space *mapping,
>  			struct list_head *pages, unsigned nr_pages);
> +	void (*readahead)(struct readahead_control *);
>  
>  	int (*write_begin)(struct file *, struct address_space *mapping,
>  				loff_t pos, unsigned len, unsigned flags,
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 4989d330fada..b3008605fd1b 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -669,6 +669,24 @@ static inline struct page *readahead_page(struct readahead_control *rac)
>  	return page;
>  }
>  
> +/* The byte offset into the file of this readahead block */
> +static inline loff_t readahead_pos(struct readahead_control *rac)
> +{
> +	return (loff_t)rac->_index * PAGE_SIZE;
> +}
> +
> +/* The number of bytes in this readahead block */
> +static inline loff_t readahead_length(struct readahead_control *rac)
> +{
> +	return (loff_t)rac->_nr_pages * PAGE_SIZE;
> +}
> +
> +/* The index of the first page in this readahead block */
> +static inline unsigned int readahead_index(struct readahead_control *rac)
> +{
> +	return rac->_index;
> +}
> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index aaa209559ba2..07cdfbf00f4b 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -124,7 +124,14 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  
>  	blk_start_plug(&plug);
>  
> -	if (aops->readpages) {
> +	if (aops->readahead) {
> +		aops->readahead(rac);
> +		/* Clean up the remaining pages */
> +		while ((page = readahead_page(rac))) {
> +			unlock_page(page);
> +			put_page(page);
> +		}
> +	} else if (aops->readpages) {
>  		aops->readpages(rac->file, rac->mapping, pages,
>  				readahead_count(rac));
>  		/* Clean up the remaining pages */
> @@ -234,7 +241,8 @@ void force_page_cache_readahead(struct address_space *mapping,
>  	struct file_ra_state *ra = &filp->f_ra;
>  	unsigned long max_pages;
>  
> -	if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages))
> +	if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages &&
> +			!mapping->a_ops->readahead))
>  		return;
>  
>  	/*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
