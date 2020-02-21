Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC8166E7E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 05:25:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4zs8-0002Ui-6J; Fri, 21 Feb 2020 04:25:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4zs6-0002UW-5f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ASKxt3bijyoYwdw1pDufntJpHzO9oNcu8Dw674S+ZbU=; b=RLXs9l+DF32K0kt3YuLLuMTp38
 6jTXpfQTyWGVnX3UfVvVK4QNTwJS26eDK279fJbV9BYF1JgjKBt52TYvtlDDiefqvALxn0TdyJHlS
 C/nra5dbklvKUdYpY9fNGtPHLsWqPAolF6eqtky555VggetHj99bFoR07mv5vm7m7hho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ASKxt3bijyoYwdw1pDufntJpHzO9oNcu8Dw674S+ZbU=; b=EfIEpaqTEGdMiAIXRtiwNgDHp3
 euZnvqVHIDM/eh0MoaUZkGpOUTdW0hSLjMGAVFU4SrdcHlGUV5dX/8XznsbS57erOZwat3CFny0jd
 DWf7gY559WSX1WcrTAFQrT6CnLGKBCkAPslG6ATJm5lkIPwfJUjmBgusaMDtLS025FN4=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4zs5-00Cgg1-1M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:25:02 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f5b870000>; Thu, 20 Feb 2020 20:24:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 20:24:53 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 20:24:53 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 04:24:52 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-5-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <89a2e3d1-df95-f006-24d9-76a4b7dd230b@nvidia.com>
Date: Thu, 20 Feb 2020 20:24:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-5-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582259079; bh=ASKxt3bijyoYwdw1pDufntJpHzO9oNcu8Dw674S+ZbU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=heUrjhw3xqeEYQuBuoBasbu56gpWlnwZt+AdI2wq+B9NZbvczA0FSHtDGsaVb4Naf
 bnLZHSctgsoXIEuM1CeqQs2bSg86B5wpOR88JYaRMGaVNCFZ0llOWVBqfWBe1dfYIU
 BUwh2YAMS+RWhS/AXveX566mq203Kwd9VMWWIOhSUurQzAI72ujnD9tt6+SnD57HYI
 MgI6ngKNa6Eh0y5HdQDTDz6lnM06+eXX5yP8YrN+QsAaNtRrwPlFUiL3IiVJfgaM4Y
 DJpi7QNVd6PQYwtQElVUeLezKB5OQAGRgilG6WKFgkE2WbMHVP2VGJNm3q3F0+FJmu
 6lrj9yx0IYl2Q==
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
X-Headers-End: 1j4zs5-00Cgg1-1M
Subject: Re: [f2fs-dev] [PATCH v7 04/24] mm: Move readahead nr_pages check
 into read_pages
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
> Simplify the callers by moving the check for nr_pages and the BUG_ON
> into read_pages().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Looks nice,

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

> diff --git a/mm/readahead.c b/mm/readahead.c
> index 61b15b6b9e72..9fcd4e32b62d 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -119,6 +119,9 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>  	struct blk_plug plug;
>  	unsigned page_idx;
>  
> +	if (!nr_pages)
> +		return;
> +
>  	blk_start_plug(&plug);
>  
>  	if (mapping->a_ops->readpages) {
> @@ -138,6 +141,8 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>  
>  out:
>  	blk_finish_plug(&plug);
> +
> +	BUG_ON(!list_empty(pages));
>  }
>  
>  /*
> @@ -180,8 +185,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  			 * contiguous pages before continuing with the next
>  			 * batch.
>  			 */
> -			if (nr_pages)
> -				read_pages(mapping, filp, &page_pool, nr_pages,
> +			read_pages(mapping, filp, &page_pool, nr_pages,
>  						gfp_mask);
>  			nr_pages = 0;
>  			continue;
> @@ -202,9 +206,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * uptodate then the caller will launch readpage again, and
>  	 * will then handle the error.
>  	 */
> -	if (nr_pages)
> -		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
> -	BUG_ON(!list_empty(&page_pool));
> +	read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
>  }
>  
>  /*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
