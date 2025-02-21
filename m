Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A692A3EC00
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 05:55:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlL4b-0004sn-Cw;
	Fri, 21 Feb 2025 04:55:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tlL4U-0004sc-MV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 04:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDzCMNB4JM4Tu+Cwz6uhVkh3rFLcrdRL8yhtjBgWd4s=; b=gEDoY9pL8ZHf8LA7W3gRAuN2vZ
 9gizus1T1+pH3/vaUpWKhLGor5lj8MoRWEdKIIkC1MaecGWYpx/ES0OdtsCgdFsfnnlM06QQZcKqq
 qHX/TqkgIFHHLrZXYBuASBnjEFYp4P80H5pVQwLiQsptCk+kxXxQdqyrJvjCjn+89n7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDzCMNB4JM4Tu+Cwz6uhVkh3rFLcrdRL8yhtjBgWd4s=; b=K1NKHW1Ktd1UveA9BE2RHWIZod
 qD+XxYVhbzBFk89Fjdehla8kQYkFxMLJGpOcjOrFvrBoZId6hK/l+idc7QpnZla1SzshyFLo4hb9c
 rtz8TFAkvF4z7UOIq9yeO8q2cpdOQ5sRu5H9xsY0xiM2G/SpaA093dn9Y52rRFCZgj00=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tlL4T-00044U-EU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 04:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DDA1F6111F;
 Fri, 21 Feb 2025 04:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E556C4CEE2;
 Fri, 21 Feb 2025 04:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740113718;
 bh=TRrzP0CzcVFMmpJmC4JuqExk9+bEFTrmjzrUl7P32zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pREs7JkFO7CYYWH8ZpiN7cqx7xyHHCRaPb2iyeGo0yAlDCJtRaFsU4akHKcaEwXlG
 QHOqiH75KyJoSXzpBxSukeffFi/B3HcJEjLMArOOBCqtFf+i7gzHQI7Pd4Dj7sDE/n
 dbYDxP9h7sAWRC2hofXAIfLVb8t42TulN+taDuxEqU0K4IZVGVPp7c+xmRmtZ+ewSO
 yWH7vwPrXx6kF0CXRN1PNIKeo7K3ZDX1xtISS4YmYmxvo67ZnNdpu8dW3Huap10RZj
 ++yaDHIvpCLoVA/5LlxIvAkaR5p01adyV65/egDNhzeTc/90SJurTcb16i61yDAA6h
 zbwi7l/PDCOVA==
Date: Fri, 21 Feb 2025 04:55:16 +0000
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <Z7gHNEBYx5XdfQw5@google.com>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-4-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218055203.591403-4-willy@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/18,
 Matthew Wilcox (Oracle) wrote: > Convert f2fs_put_page()
 to f2fs_folio_put() and add a wrapper. > Replaces three calls to
 compound_head()
 with one. > > Signed-off-by: Matthew Wilcox (Oracle) [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tlL4T-00044U-EU
Subject: Re: [f2fs-dev] [PATCH 03/27] f2fs: Add f2fs_folio_put()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/18, Matthew Wilcox (Oracle) wrote:
> Convert f2fs_put_page() to f2fs_folio_put() and add a wrapper.
> Replaces three calls to compound_head() with one.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/f2fs.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b05653f196dd..5e01a08afbd7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2806,16 +2806,21 @@ static inline struct page *f2fs_pagecache_get_page(
>  	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
>  }
>  
> -static inline void f2fs_put_page(struct page *page, int unlock)
> +static inline void f2fs_folio_put(struct folio *folio, bool unlock)
>  {
> -	if (!page)
> +	if (!folio)
>  		return;
>  
>  	if (unlock) {
> -		f2fs_bug_on(F2FS_P_SB(page), !PageLocked(page));
> -		unlock_page(page);
> +		f2fs_bug_on(F2FS_F_SB(folio), !folio_test_locked(folio));
> +		folio_unlock(folio);
>  	}
> -	put_page(page);
> +	folio_put(folio);
> +}
> +
> +static inline void f2fs_put_page(struct page *page, int unlock)
> +{

I got a kernel panic, since there are still several places to pass a null
page pointer, which feeds to page_folio() which doesn't expect the null.

Applying this can avoid the panic.

	if (!page)
		return;

> +	f2fs_folio_put(page_folio(page), unlock);
>  }
>  
>  static inline void f2fs_put_dnode(struct dnode_of_data *dn)
> -- 
> 2.47.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
