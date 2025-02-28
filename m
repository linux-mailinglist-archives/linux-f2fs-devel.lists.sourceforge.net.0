Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E207EA49254
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 08:38:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnuwo-0003qR-FE;
	Fri, 28 Feb 2025 07:38:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tnuwk-0003oD-9U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyZ3uu4+HOzj5blDcTmwwC2/yctUAK96EB+xWVKpIfw=; b=cm8XdpzdOD1Nqf2CCRmsJmn3qk
 5TEGLAiCKDgs/rMstSGUKVY365cFuHyLfR2itoOSOOSnR2PkBE8HTMKSMHEM4izwLVQp96mnhyH69
 Skfi787MC6dA/PbW0W6kCrBJvoIOgVdQBwc/XJ3yywYT3dzHCgSLvwljl6QYO3VIFhVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyZ3uu4+HOzj5blDcTmwwC2/yctUAK96EB+xWVKpIfw=; b=YZTRKN0TSPMJJQVn4Vw0KN200+
 oBm0FgWSUFYrWmc3gYbqtxDXpdfwziG4cx6BNJcxoiMIvFdhLO6kCrb8zBL7j6VzPi8DKAnQnqoif
 jubG5D22lN8GBKzbpG2htO0xyA9pSaee+3Qj+tbquDGegWP/iF1/cJw9gZn3MN6G5xcI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnuwR-0000S1-AO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13D405C6588;
 Fri, 28 Feb 2025 07:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C000C4CED6;
 Fri, 28 Feb 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740728260;
 bh=/i7pKBavrU7LwqoFhsA71FIGQa6xI/pJc8DT9nTVvfQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V4KFZ823IH+WOsoC4pLuvmvEMJnF8QiumtVluJFWOpAqRDxL993lQnrteBU1rzxT8
 WeNxIRiGUekKR/ZsSmOSqwCrVjjutpXmjoBlaDLA1HuY18xIaD2jvLmWpiey4beExZ
 MPP2u+dj1S3JXDWbZZmDXdwekz9xXQ+e/y8g62c14CQA0n/gB+F8RMQ6PUhEL8iNnJ
 thcI0uC6GBeFTdhTitodJtaaqbdSzP8tBkWgmVsSe+1+pHOsMXSKGyshvwjGstTqG6
 CxcYLTQkCUVmuJASoBMt3Mpk0Y0keDlJYwjTbiBBcvWrjE4F6zDSD2+WWXsIqawigH
 elKF0jxIsfk9Q==
Message-ID: <ef8f19e1-208c-4196-84f5-7d6095c9846e@kernel.org>
Date: Fri, 28 Feb 2025 15:37:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-23-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250218055203.591403-23-willy@infradead.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote: > Convert
 f2fs_get_lock_data_page() to f2fs_get_lock_data_folio() and > add a
 compatibility
 wrapper. Removes three hidden calls to > compound_head(). [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnuwR-0000S1-AO
Subject: Re: [f2fs-dev] [PATCH 22/27] f2fs: Add f2fs_get_lock_data_folio()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote:
> Convert f2fs_get_lock_data_page() to f2fs_get_lock_data_folio() and
> add a compatibility wrapper.  Removes three hidden calls to
> compound_head().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   fs/f2fs/data.c | 18 +++++++++---------
>   fs/f2fs/f2fs.h | 10 +++++++++-
>   2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f0747c7f669d..e891c95bc525 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1310,23 +1310,23 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
>    * Because, the callers, functions in dir.c and GC, should be able to know
>    * whether this page exists or not.
>    */
> -struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
> +struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>   							bool for_write)
>   {
>   	struct address_space *mapping = inode->i_mapping;
> -	struct page *page;
> +	struct folio *folio;
>   
> -	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
> -	if (IS_ERR(page))
> -		return page;
> +	folio = f2fs_get_read_data_folio(inode, index, 0, for_write, NULL);
> +	if (IS_ERR(folio))
> +		return folio;
>   
>   	/* wait for read completion */
> -	lock_page(page);
> -	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
> -		f2fs_put_page(page, 1);
> +	folio_lock(folio);
> +	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
> +		f2fs_folio_put(folio, true);
>   		return ERR_PTR(-EIO);
>   	}
> -	return page;
> +	return folio;
>   }
>   
>   /*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3e02df63499e..c78ba3c7d642 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3899,7 +3899,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
>   		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
>   struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
>   							pgoff_t *next_pgofs);
> -struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
> +struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
>   			bool for_write);
>   struct page *f2fs_get_new_data_page(struct inode *inode,
>   			struct page *ipage, pgoff_t index, bool new_i_size);
> @@ -3936,6 +3936,14 @@ static inline struct page *f2fs_get_read_data_page(struct inode *inode,
>   	return &folio->page;
>   }
>   
> +static inline struct page *f2fs_get_lock_data_page(struct inode *inode,
> +		pgoff_t index, bool for_write)
> +{
> +	struct folio *folio = f2fs_get_lock_data_folio(inode, index, for_write);

	if (IS_ERR(folio))
		return ERR_CAST(folio));

> +
> +	return &folio->page;
> +}
> +
>   /*
>    * gc.c
>    */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
