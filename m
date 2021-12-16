Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF9477CA4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Dec 2021 20:36:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxwYg-0001wD-QW; Thu, 16 Dec 2021 19:36:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mxwYf-0001w6-CW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 19:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oyIa2ie6k7h/naNtVqLSZF0dBuj3PfskW33LRtOQEAY=; b=V1PjhsjaPAdQ2OpgkKYCzqj70R
 Z9OhOAboJ7Zd226YQ+AIZwd+PInV6abywwUgw5wRnb5ip9Y7mXQHUP75Ftg7s4yIJ+4J9cIUzsv8u
 Mgq9V7fPrLfy5+8C2a2DHPpqYSjXYWRvwTVFFg1vy7eer2eUxQvhwhvlwpKRriambFV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oyIa2ie6k7h/naNtVqLSZF0dBuj3PfskW33LRtOQEAY=; b=bshRq4tCdv8FSUbV239d8bCB1X
 KX3VmJfEx9rTB4gj5jRbBoh8kpc+c7MLAuioMEKPVnet3OxksV9qSb7Mvs/lQTShwgjIKbLkh7gUg
 lOWu7aNTJzH0sTAzv65ApWZ2YzR6daLN7sgbXloa0JzZI7guIZSJFmHch+mW4UkmY3mk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxwYf-000GnP-Th
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 19:36:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DF3061F56
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Dec 2021 19:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CAAC36AE2;
 Thu, 16 Dec 2021 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639683408;
 bh=Qyw3k44XmmD/B4tMrbx+Jw+nDCLMzGQs36DXFyLRNjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GNVB7HSE8P9bK5KDQZZx3XzRZ21zowlaPyqwiHGY8RDCdEQo2AhWPr418XRfMY6l9
 d0SwoTfryCEYTceLgzNPC2nTGsh4X+SU1zmsD9uOuJXqq09fZ3SN2xPjN+QR5RAAnD
 OYzfAriOxuWabL8Tmqan31TxbuIsLxFVwQz5vUB87qPuQ2jUacGfQ7hqwK5ezwY+lM
 LfwvPRHsIiK17nM1kRDk8wetP4nrwGVEQ5m5iLu8uU+Nb8lQrYmB41INbF2uIMP5C+
 ykQrZPuwPPXFLweQIE/neb2mh1vyz5mTQmtV3xBGh9Wecn/2udLtorWlKDaWKDAA/S
 2/Bl/ISF90tAQ==
Date: Thu, 16 Dec 2021 11:36:46 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YbuVTuA5ivCjra40@google.com>
References: <20211216091356.6643-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216091356.6643-1-chao@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, Chao Yu wrote: > For compressed inode,
 in .{invalidate, release}page, 
 we will call > f2fs_invalidate_compress_pages() to drop all compressed page
 cache of > current inode. > > But we don't ne [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxwYf-000GnP-Th
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't drop compressed page cache in
 .{invalidate, release}page
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16, Chao Yu wrote:
> For compressed inode, in .{invalidate,release}page, we will call
> f2fs_invalidate_compress_pages() to drop all compressed page cache of
> current inode.
> 
> But we don't need to drop compressed page cache synchronously in
> .invalidatepage, because, all trancation paths of compressed physical
> block has been covered with f2fs_invalidate_compress_page().
> 
> And also we don't need to drop compressed page cache synchronously
> in .releasepage, because, if there is out-of-memory, we can count
> on page cache reclaim on sbi->compress_inode.
> 
> BTW, this patch may fix the issue reported below:
> 
> https://lore.kernel.org/linux-f2fs-devel/20211202092812.197647-1-changfengnan@vivo.com/T/#u

I think this patch makes more sense to me.

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix compile error.
>  fs/f2fs/data.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2737fcc0dbcf..0fc6e0245732 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3528,12 +3528,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
>  
>  	clear_page_private_gcing(page);
>  
> -	if (test_opt(sbi, COMPRESS_CACHE)) {
> -		if (f2fs_compressed_file(inode))
> -			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
> -		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
> -			clear_page_private_data(page);
> -	}
> +	if (test_opt(sbi, COMPRESS_CACHE) &&
> +			inode->i_ino == F2FS_COMPRESS_INO(sbi))
> +		clear_page_private_data(page);
>  
>  	if (page_private_atomic(page))
>  		return f2fs_drop_inmem_page(inode, page);
> @@ -3553,12 +3550,9 @@ int f2fs_release_page(struct page *page, gfp_t wait)
>  		return 0;
>  
>  	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE)) {
> -		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
>  		struct inode *inode = page->mapping->host;
>  
> -		if (f2fs_compressed_file(inode))
> -			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
> -		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
> +		if (inode->i_ino == F2FS_COMPRESS_INO(F2FS_I_SB(inode)))
>  			clear_page_private_data(page);
>  	}
>  
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
