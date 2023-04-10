Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD766DCB0A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 20:47:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plwXw-0004jl-Bm;
	Mon, 10 Apr 2023 18:47:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1plwXv-0004je-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 18:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+9JZMGpuYmtP8jsjhCbTZpZH/QIGsHn/5sekgmOBPOc=; b=k55slkUYYTrU3pg/FRbFay3YDB
 uif44xoXtCh8ChnTm91Y+ZZ5BtWSQnJlRVa6UC3DMeGeJ34Y6LEgsU8UOMCMB8Np5ny0D47D7dZSl
 E4hpKo+hMDeCtLx+OUKD62KUJtEbKKNsFF1AdL7v3TJbsWMvVtvWKwe0ZHEG+FinyNyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+9JZMGpuYmtP8jsjhCbTZpZH/QIGsHn/5sekgmOBPOc=; b=LYbjcRlSTGdBbakU13BO0WYw0c
 JQs5pzh2Fq7kAJ0YwaxQ4RzOKESi/Z0nGJtVdO63fu7ovbU9BHff2QZ2vAB4eVJM3t/OFLXkMFpHL
 meGrYf0eMgqZjjtJ94N80A5B7ZidnvzVC0OXq+KfKKzCIH4l20Ikez6VfBY+AlktYwO8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plwXv-0036FY-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 18:47:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 221C1612DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 18:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C509C433D2;
 Mon, 10 Apr 2023 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681152433;
 bh=aBlz48YZds82/29V67b+Ke52jVh21IHmdlaHPojy2Dc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z4wjBtCAzOKa0ez6iqWFoe5dQU5GMSeAX5jfjGQqwkjja/7yJLEcW1cKePmXmZ92G
 pB/WHCQodK0KP8a+Q9HqjOU3TdbOcAjVBUhcx2jLRjEjZ+7RR+ts+9Cy9q8zDzKedo
 wnVuVLbVElnyY9Eef84UTm1BzqzqCgxBqOOnhIAptNFuzrX6AhZQIrjo0ghnXHqGgO
 6eP6hifqJzuDZTlnpSQhQJ0B9pbr7cjFRpk6SS9J2YNekuFW4d/IZDajopKzIjcFs/
 iuAL4JmwBXIgJLl7H5yiVo4LhtKeaI3o/3cUfU/RwDEmKATMItv9koRy2mJQKJgdYg
 bbWMEfdPipU3A==
Date: Mon, 10 Apr 2023 11:47:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDRZrzROjW5z935R@google.com>
References: <20230410022418.1843178-1-chao@kernel.org>
 <20230410022418.1843178-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410022418.1843178-2-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/10,
 Chao Yu wrote: > No logic changes. > > Signed-off-by:
 Chao Yu <chao@kernel.org> > --- > fs/f2fs/f2fs.h | 32 ++++++++ > 1 file
 changed, 8 insertions(+), 24 deletions(- [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plwXv-0036FY-Gd
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: clean up with {attach,
 detach}_page_private()
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

On 04/10, Chao Yu wrote:
> No logic changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ec8387da7f74..c378aedcadea 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1416,11 +1416,8 @@ static inline bool page_private_##name(struct page *page) \
>  #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
>  static inline void set_page_private_##name(struct page *page) \
>  { \
> -	if (!PagePrivate(page)) { \
> -		get_page(page); \
> -		SetPagePrivate(page); \
> -		set_page_private(page, 0); \
> -	} \
> +	if (!PagePrivate(page)) \
> +		attach_page_private(page, (void *)page->private); \

		attach_page_private(page, (void *)0);

>  	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>  	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>  }
> @@ -1429,13 +1426,8 @@ static inline void set_page_private_##name(struct page *page) \
>  static inline void clear_page_private_##name(struct page *page) \
>  { \
>  	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
> -		set_page_private(page, 0); \
> -		if (PagePrivate(page)) { \
> -			ClearPagePrivate(page); \
> -			put_page(page); \
> -		}\
> -	} \
> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
> +		detach_page_private(page); \
>  }
>  
>  PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
> @@ -1464,11 +1456,8 @@ static inline unsigned long get_page_private_data(struct page *page)
>  
>  static inline void set_page_private_data(struct page *page, unsigned long data)
>  {
> -	if (!PagePrivate(page)) {
> -		get_page(page);
> -		SetPagePrivate(page);
> -		set_page_private(page, 0);
> -	}
> +	if (!PagePrivate(page))
> +		attach_page_private(page, 0);
>  	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
>  	page_private(page) |= data << PAGE_PRIVATE_MAX;
>  }
> @@ -1476,13 +1465,8 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
>  static inline void clear_page_private_data(struct page *page)
>  {
>  	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
> -		set_page_private(page, 0);
> -		if (PagePrivate(page)) {
> -			ClearPagePrivate(page);
> -			put_page(page);
> -		}
> -	}
> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
> +		detach_page_private(page);
>  }
>  
>  /* For compression */
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
