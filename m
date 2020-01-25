Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83914978B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jan 2020 20:45:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ivRMj-0006Kl-CC; Sat, 25 Jan 2020 19:45:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ivRMi-0006Kc-01
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 19:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ZMGv3oBke4qgEgEWLJ/O03PCwZbetUWl8MszuyJc3E=; b=aExO2WMPn8SmsRayUsk2V8u8Pn
 TXo4CyXVNchs/qrdIQKoq+18Q/UkA3PVq+v51Ec43md6lyNWQzC4rw4dLwaBLTBE2SbOEqB0001W0
 Pm7gFJequJO47AzH1eog4+yIv1PYDKyGwzcj4aZY7dlOuNRuq94X46Iz6eJFuCDU12Do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ZMGv3oBke4qgEgEWLJ/O03PCwZbetUWl8MszuyJc3E=; b=jWc5xnvh3P7jcqZH6gt+KZTxbd
 GwjU+rSAt00Sf3rRQqmuq2INJos8Xgj0P46ZDVGtl8oA17m6xWz983ZD18nStiz46fa6p5SUVLW+0
 pNPQXlHYHLx13SfaRh4iT/lN5NYj3m8izKk2Nvm+ZalBo2yjLBWvfr5aoinHgc6tRCXI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ivRMg-005S1B-0r
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 19:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ZMGv3oBke4qgEgEWLJ/O03PCwZbetUWl8MszuyJc3E=; b=iukevvX9wHFfu3JIg1tr6gVc/
 JwJE61o+VY7KxTDz9InYcyVcbamX1y02guAD3rWE2GMFBd6m2M560rZ9H3IdzZ7mREF8HfqjNOxF7
 HlJjW/HzTAr+MQDnqg4+ap4KCIzzg0CvE0iBtGvOYLNOiEVgKse1AFNaAcpAnsLdvzyQ+tS0PerbZ
 t5ty0p/lHmff1/2YUFwEYdYp9wzoQkDc38nEKsZ+jm2E8oJgAiMXjCButFfqjsPdn0CHgtX1TFbzu
 4tuijwgd1IjFP1Dl0+zEUez39wsvlMoBZL+xtptLXo4jcPUPXyt9UU4IzOBc+Dq2WViHshRY6wYB0
 R5QNBIB6A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ivRMP-0004OA-SC; Sat, 25 Jan 2020 19:44:49 +0000
Date: Sat, 25 Jan 2020 11:44:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20200125194449.GO4675@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
 <20200125013553.24899-4-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125013553.24899-4-willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ivRMg-005S1B-0r
Subject: Re: [f2fs-dev] [PATCH 03/12] readahead: Put pages in cache earlier
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 05:35:44PM -0800, Matthew Wilcox wrote:
> @@ -192,8 +194,18 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = page_offset;
> -		list_add(&page->lru, &page_pool);
> +		if (use_list) {
> +			page->index = page_offset;
> +			list_add(&page->lru, &page_pool);
> +		} else if (!add_to_page_cache_lru(page, mapping, page_offset,
> +					gfp_mask)) {
> +			if (nr_pages)
> +				read_pages(mapping, filp, &page_pool,
> +						page_offset - nr_pages,
> +						nr_pages);
> +			nr_pages = 0;

This is missing a call to put_page().

> +			continue;
> +		}
>  		if (page_idx == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		nr_pages++;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
