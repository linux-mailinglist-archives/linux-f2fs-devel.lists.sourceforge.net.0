Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D258166D24
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 03:49:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4yN7-0006vP-99; Fri, 21 Feb 2020 02:48:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4yN6-0006vI-JG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 02:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gmfdyhcpJt+pBNU3bTcP5EePBtsYdA7QQljwhD15aZ8=; b=hH8hKcpHhcAiWWSLer2xwEJLui
 wDDKnYjUvKH/wq3ELR9UszjoTqOIdq4KNL4kFuEkAkIWpjn9DseRjaEmw6yqDmUOrO9vSv1YromkA
 AQocrBT7PGFLJMnj1K6a8u5vaI4dhioQef0zw5YfqqOI3I+X5km+zJTMrUIKSbl2uRXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gmfdyhcpJt+pBNU3bTcP5EePBtsYdA7QQljwhD15aZ8=; b=i9XqjqBHsU8iEEIVZcub3/QKI4
 hpxdX/1tFktnzUdFc51KopDA/peuz1ZUq41BKXY/tKaiLL2REQBX5efZcPu8w+yDv5VLOaNAvfS64
 8NNe0uQK7LHX6gUYIeRWlt0mkXkQjkAJkipk7JNqijwOoC+/LKGHr9lCqjMqulljG4xM=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4yN4-00AeBr-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 02:48:56 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f44ed0000>; Thu, 20 Feb 2020 18:48:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 18:48:46 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 18:48:46 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 02:48:46 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-9-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f4b720f3-9084-e767-8983-2b6c3d1b9c5a@nvidia.com>
Date: Thu, 20 Feb 2020 18:48:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-9-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582253293; bh=gmfdyhcpJt+pBNU3bTcP5EePBtsYdA7QQljwhD15aZ8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lGad9Ixy041U0MYecQt0DfT6SncKVN2EOLZ29mYRvVDtt2aq6TqrxPJR8TMuJSaad
 Sf0lEeaQzvox+v3yW0OUuzvdFwxSDyG9lbjTxWRUsSvRhWgXl4PGmx8w1zH0v3/Anz
 7OGjxiCcNgwAqYNikq07yTd+FWj7rotnm2RxO6BeKmwoAyu72NsTjt/Aws/jl1+VDb
 gidPLdBL3rFobDzVrAM0BRsGLnZvwIVNpIFkbSxWq3GXQUnGvaG5/Oa4b3gvDJqRV4
 dhZygTiRiM9cZ/T8pikRs94s6xAWpKSZwdHCDaH9VF4Fk4VBE06sR4tyTxoAMcKxEH
 57AfR8UVRKKKA==
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
X-Headers-End: 1j4yN4-00AeBr-Bt
Subject: Re: [f2fs-dev] [PATCH v7 08/24] mm: Remove 'page_offset' from
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

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Replace the page_offset variable with 'index + i'.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 8a25fc7e2bf2..83df5c061d33 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -181,12 +181,10 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (i = 0; i < nr_to_read; i++) {
> -		pgoff_t page_offset = index + i;


ha, the naming mismatch I complained about in an earlier patch gets deleted
here, so we're good after all. :)

Looks good,

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

> -
> -		if (page_offset > end_index)
> +		if (index + i > end_index)
>  			break;
>  
> -		page = xa_load(&mapping->i_pages, page_offset);
> +		page = xa_load(&mapping->i_pages, index + i);
>  		if (page && !xa_is_value(page)) {
>  			/*
>  			 * Page already present?  Kick off the current batch of
> @@ -200,7 +198,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = page_offset;
> +		page->index = index + i;
>  		list_add(&page->lru, &page_pool);
>  		if (i == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
> 




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
