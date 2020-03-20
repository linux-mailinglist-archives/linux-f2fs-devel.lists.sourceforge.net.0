Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491D18D524
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 17:58:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFKys-0000iH-KH; Fri, 20 Mar 2020 16:58:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFKyr-0000iA-32
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 16:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uldx6Ea6/vxZz7IfE/zze5N1ijt++ahSPx73ZUelM5I=; b=LEHyXVfr0ynxUNsbjo0c2PSyCr
 ecpzlLmr9hzsRCtz4Mdok0LWttWUSrjQuNpg8uoeynmoDrUWgCjBJq2Pkji0C10qRXglwZt/mr44S
 ptyuvC3e1g4BELmwsMZew3McA16Inm/SZwa/LauMtSF0ptqUxt+r30tfHzkji8CjAnaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uldx6Ea6/vxZz7IfE/zze5N1ijt++ahSPx73ZUelM5I=; b=RMsxZUOIT1egydqrVrtajzHySJ
 INwScXKM0oUYK9Tc4cDw4NTGN/D7LrjUf9Nd3RqIuMej6kABpk+aYYkNVVf6rtVm3voH9HpcV3REA
 4z3Uk2hWcX2r4551I36xBrN/ylR0pAIgM6K75shizcNQDIaJOdi8kgLeWsrLVbYN7Ncg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFKyn-00FN49-9b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 16:58:45 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6434C20753;
 Fri, 20 Mar 2020 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584723510;
 bh=AxLDPN4LwuxzW4xjwlSgsVf6rtc0JFVKxbo5//wmPgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRbat8REA7EmmJnmLCrWxRoNW5LgyCKm+4EsNDf5E4lY0nLcYrSE6Jyr+LkCnKmyi
 n3W2x46nv8ZHmzqeZMc86Mj56kXxAhIEwG1PHXCTucYL5iivPYgJLLRVtDE0DPEV3X
 iA5d4+HsRZ/BNe0ydHe/SfLeiRxRKGyEVqIcRkok=
Date: Fri, 20 Mar 2020 09:58:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320165828.GB851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-13-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320142231.2402-13-willy@infradead.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFKyn-00FN49-9b
Subject: Re: [f2fs-dev] [PATCH v9 12/25] mm: Move end_index check out of
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> By reducing nr_to_read, we can eliminate this check from inside the loop.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  mm/readahead.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index d01531ef9f3c..a37b68f66233 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -167,8 +167,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> -	struct page *page;
> -	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> @@ -178,22 +176,29 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		._index = index,
>  	};
>  	unsigned long i;
> +	pgoff_t end_index;	/* The last page we want to read */
>  
>  	if (isize == 0)
>  		return;
>  
> -	end_index = ((isize - 1) >> PAGE_SHIFT);
> +	end_index = (isize - 1) >> PAGE_SHIFT;
> +	if (index > end_index)
> +		return;
> +	/* Avoid wrapping to the beginning of the file */
> +	if (index + nr_to_read < index)
> +		nr_to_read = ULONG_MAX - index + 1;
> +	/* Don't read past the page containing the last byte of the file */
> +	if (index + nr_to_read >= end_index)
> +		nr_to_read = end_index - index + 1;

There seem to be a couple off-by-one errors here.  Shouldn't it be:

	/* Avoid wrapping to the beginning of the file */
	if (index + nr_to_read < index)
		nr_to_read = ULONG_MAX - index;
	/* Don't read past the page containing the last byte of the file */
	if (index + nr_to_read > end_index)
		nr_to_read = end_index - index + 1;

I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.

Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >= end_index',
since otherwise nr_to_read can be increased by 1 rather than decreased or stay
the same as expected.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
