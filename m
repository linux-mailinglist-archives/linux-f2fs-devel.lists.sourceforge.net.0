Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A4163A4A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 03:36:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4FDR-000801-0z; Wed, 19 Feb 2020 02:35:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1j4FDN-0007zZ-PK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/a0NQp4kWqGbQgegzo0R4F7oTaDb4qIVFekj0jtG+Vg=; b=Aj06BoOQJDWmaS8MWjAEODxAuq
 ASBUQ/IsEtKP5iw4TuSZLoSfYsPoeQv3xqVY1Eejv9e1tHP4BXIk4x2NH0eU24JtS3xiYHgw7J5vD
 dz+QN5R3g+51Wpf0xQ5Scg+de+gk1/EzIgxM3NltqvGc/rTq9HVswSjIJGSKdaFcRn6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/a0NQp4kWqGbQgegzo0R4F7oTaDb4qIVFekj0jtG+Vg=; b=gIV1YAh0AFHjk6ancpZyT46n93
 3NueCQoIJsZogU77LteACWkuMalrsArYalxRhAg7+ZNNd3EfxBjVgRE0n2JReASerL7IFQK4+unQe
 0Lb7yyIklpL+kW9EiQiiWLGgIiKnfRAkridI42hmiJK1ok/438xEJqT3it8K2O7xZ5VQ=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4FDL-007Vhf-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:35:53 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 83358F8D75B7100BDEA5;
 Wed, 19 Feb 2020 10:35:42 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 10:35:42 +0800
Received: from architecture4 (10.160.196.180) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 19 Feb 2020 10:35:41 +0800
Date: Wed, 19 Feb 2020 10:34:22 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219023422.GA83440@architecture4>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-20-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-20-willy@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.160.196.180]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j4FDL-007Vhf-Ur
Subject: Re: [f2fs-dev] [PATCH v6 11/16] erofs: Convert compressed files
 from readpages to readahead
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:46:00AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Use the new readahead operation in erofs.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

It looks good to me, although some further optimization exists
but we could make a straight-forward transform first, and
I haven't tested the whole series for now...
Will test it later.

Acked-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/zdata.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 17f45fcb8c5c..7c02015d501d 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -1303,28 +1303,23 @@ static bool should_decompress_synchronously(struct erofs_sb_info *sbi,
>  	return nr <= sbi->max_sync_decompress_pages;
>  }
>  
> -static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
> -			     struct list_head *pages, unsigned int nr_pages)
> +static void z_erofs_readahead(struct readahead_control *rac)
>  {
> -	struct inode *const inode = mapping->host;
> +	struct inode *const inode = rac->mapping->host;
>  	struct erofs_sb_info *const sbi = EROFS_I_SB(inode);
>  
> -	bool sync = should_decompress_synchronously(sbi, nr_pages);
> +	bool sync = should_decompress_synchronously(sbi, readahead_count(rac));
>  	struct z_erofs_decompress_frontend f = DECOMPRESS_FRONTEND_INIT(inode);
> -	gfp_t gfp = mapping_gfp_constraint(mapping, GFP_KERNEL);
> -	struct page *head = NULL;
> +	struct page *page, *head = NULL;
>  	LIST_HEAD(pagepool);
>  
> -	trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
> -			      nr_pages, false);
> +	trace_erofs_readpages(inode, readahead_index(rac),
> +			readahead_count(rac), false);
>  
> -	f.headoffset = (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT;
> -
> -	for (; nr_pages; --nr_pages) {
> -		struct page *page = lru_to_page(pages);
> +	f.headoffset = readahead_offset(rac);
>  
> +	readahead_for_each(rac, page) {
>  		prefetchw(&page->flags);
> -		list_del(&page->lru);
>  
>  		/*
>  		 * A pure asynchronous readahead is indicated if
> @@ -1333,11 +1328,6 @@ static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
>  		 */
>  		sync &= !(PageReadahead(page) && !head);
>  
> -		if (add_to_page_cache_lru(page, mapping, page->index, gfp)) {
> -			list_add(&page->lru, &pagepool);
> -			continue;
> -		}
> -
>  		set_page_private(page, (unsigned long)head);
>  		head = page;
>  	}
> @@ -1366,11 +1356,10 @@ static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
>  
>  	/* clean up the remaining free pages */
>  	put_pages_list(&pagepool);
> -	return 0;
>  }
>  
>  const struct address_space_operations z_erofs_aops = {
>  	.readpage = z_erofs_readpage,
> -	.readpages = z_erofs_readpages,
> +	.readahead = z_erofs_readahead,
>  };
>  
> -- 
> 2.25.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
