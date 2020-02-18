Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FA163626
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 23:33:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4BQm-0001pG-CA; Tue, 18 Feb 2020 22:33:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4BQl-0001p8-4m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yWG75TuvaIkixcYjAReAuF+49IUj/8WtcUdupEFzEyw=; b=ULnxsCUXRcQAYoAuojX7IaU9uJ
 mJC6i95ytWy7ea9YJJX3HsJtwoAgScMwXN0e2rz6yopA4neJZbizBmXu8b8vcJtmO0qw46eilgnsm
 KN4jkCt97u40v1VdlnTeceQud7mQxUYLwHyiXQOmGs7wWrWaZsocv0q2S3wgMGR0sPcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yWG75TuvaIkixcYjAReAuF+49IUj/8WtcUdupEFzEyw=; b=PrflMhLayAPnjGCYGLdsbSHFKY
 L7DMVT/usZQtia3ZmdCqOEEvqCJlCM1MNhTNkqNb03ecA3NuR8DnqeJV+NTFyWosBoaaBseF9ZOFb
 ApHuwIKOIcjut/PmXrStTP3dc24m4OGPtZLBOLIKdprhvTg5wPpNSQN+iXRc3EAE+kuI=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4BQj-007kto-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:33:27 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c65e90000>; Tue, 18 Feb 2020 14:32:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 14:33:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 14:33:20 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 22:33:19 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-5-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <6ecedc28-a999-8673-e4b1-349b0c23fdfd@nvidia.com>
Date: Tue, 18 Feb 2020 14:33:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-5-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582065129; bh=yWG75TuvaIkixcYjAReAuF+49IUj/8WtcUdupEFzEyw=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=klykhDzbfDnFoiAzHG0F/sl3+zuD/yu0U05wkkG5YL25K0mXMn/SZDKS/OPYoMjVi
 mBSMyFlXKKo4UAQQuQv/lsdIWAvE7WxiS+oOmcGMSJDykk7YuHI6JFzdcykchFj71k
 zIa5A9cfCBqyTcR6zGjigkGmcGSCKI7dxvmn+IuKHqErApkB59r3L/Gj+RxcTKKVSI
 +btrOqRw+4ZZVhqAz1RhfcawzguTRlv7l99v2wGxH6VlakfW2nQLeICs16ez9TeiWQ
 ZpdA450G/HarSR+IiezZDL9QVYoCyXag0rX4h00yKEt9Soza8Wdn/b85Sc2AMZZmq3
 fR1BnLTnbzkPg==
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
X-Headers-End: 1j4BQj-007kto-Sx
Subject: Re: [f2fs-dev] [PATCH v6 04/19] mm: Rearrange readahead loop
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
> Move the declaration of 'page' to inside the loop and move the 'kick
> off a fresh batch' code to the end of the function for easier use in
> subsequent patches.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 15329309231f..3eca59c43a45 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -154,7 +154,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> -	struct page *page;
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	int page_idx;
> @@ -175,6 +174,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> +		struct page *page;
>  		pgoff_t page_offset = offset + page_idx;
>  
>  		if (page_offset > end_index)
> @@ -183,14 +183,14 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		page = xa_load(&mapping->i_pages, page_offset);
>  		if (page && !xa_is_value(page)) {
>  			/*
> -			 * Page already present?  Kick off the current batch of
> -			 * contiguous pages before continuing with the next
> -			 * batch.
> +			 * Page already present?  Kick off the current batch
> +			 * of contiguous pages before continuing with the
> +			 * next batch.  This page may be the one we would
> +			 * have intended to mark as Readahead, but we don't
> +			 * have a stable reference to this page, and it's
> +			 * not worth getting one just for that.
>  			 */
> -			if (readahead_count(&rac))
> -				read_pages(&rac, &page_pool, gfp_mask);
> -			rac._nr_pages = 0;
> -			continue;


A fine point:  you'll get better readability and a less complex function by
factoring that into a static subroutine, instead of jumping around with 
goto's. (This clearly wants to be a subroutine, and in fact you've effectively 
created one inside this function, at the "read:" label. Either way, though...


> +			goto read;
>  		}
>  
>  		page = __page_cache_alloc(gfp_mask);
> @@ -201,6 +201,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		if (page_idx == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
> +		continue;
> +read:
> +		if (readahead_count(&rac))
> +			read_pages(&rac, &page_pool, gfp_mask);
> +		rac._nr_pages = 0;
>  	}
>  
>  	/*
> 

...no errors spotted, I'm confident that this patch is correct,

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
