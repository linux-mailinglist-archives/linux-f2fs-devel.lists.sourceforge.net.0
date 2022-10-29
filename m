Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E04861202E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 06:47:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oodkg-00029S-BP;
	Sat, 29 Oct 2022 04:47:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oodkf-00029M-PZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wzZjotK7+5OIJiKDi3Xz+q73wmrkLvQEzzD6ct2pAXc=; b=aWGH9O3YIE8ZmoMySjHUtUjEmX
 mVl/CnANlSYC90A7r2SvEBk4cfiSauaOJZ6RmltvNGUWGoqtz/KmXcZgOVLT7Kd/bRoyUZ9V/cKUN
 sc5J24iCMTaVrDJNGtjWkEr1Y3YHo6J8SbJE+GReQMopZyh/u1ucD7JD9pvxMtk1wS8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wzZjotK7+5OIJiKDi3Xz+q73wmrkLvQEzzD6ct2pAXc=; b=TgpO1ay07H6LN9xYyCJcbDqhKD
 ovAZ3ozMwlPeHbP99fXeGcSL2LPasFJk+qOLnk2qVeO8kWSGKmajefs2TsGX4BhhOUPXtqHcFa93X
 C4gq9SNh5AQQIw/08S/PCFTX8cImC4zAYC4NGbC2XSQ1Rzu09CIkyhW/SZySpZcu0194=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oodkb-004AW6-FK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:47:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E907B82C9A;
 Sat, 29 Oct 2022 04:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D26DC433C1;
 Sat, 29 Oct 2022 04:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667018828;
 bh=30H2uNbMFKcPAqFuShUf03uMolLK4p541xhuBs+CXnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gfP7Tdy8pIqM0v1DJqaGNtauH+2lb48dJX1fYQaIymUJ+CLtqqb7q9wwRAcGy2DSs
 BdOmbwNbY5OZr2xEEYKKwU2aU+9GuTOSo4R6ns36zTSUIcjAcfVL/VlZzpDeZpKME8
 JwsNjTbmlK+V7B2zgQZey1WW23pzhAP58MPZ23igfVckJhNckDLUxy6puVSkrGCoRK
 f7eGMud7OL+mzoMFyvpYEH0blFGHNsjz3+hc1IYbpOYbQAJIjaOJ/GfqfVcPe35zvS
 TRnDS1nX8jY4iti+jV9+pW0OWxMZ12yvdyJjPO1eQOSLk6K/9vEZaUEfj2WxQfgeHF
 1akF8W1Dj6/Qg==
Message-ID: <04bf9d52-e12d-f11b-558e-a6b358e4b564@kernel.org>
Date: Sat, 29 Oct 2022 12:47:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-13-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221017202451.4951-13-vishal.moola@gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/18 4:24, Vishal Moola (Oracle) wrote: > Convert
 function to use a folio_batch instead of pagevec. This is in > preparation
 for the removal of find_get_pages_tag(). > > Signed-off-by: Vishal [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oodkb-004AW6-FK
Subject: Re: [f2fs-dev] [PATCH v3 12/23] f2fs: Convert
 f2fs_flush_inline_data() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/node.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e8b72336c096..a2f477cc48c7 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1887,17 +1887,18 @@ static bool flush_dirty_inode(struct page *page)
>   void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>   {
>   	pgoff_t index = 0;
> -	struct pagevec pvec;
> -	int nr_pages;
> +	struct folio_batch fbatch;
> +	int nr_folios;
>   
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>   
> -	while ((nr_pages = pagevec_lookup_tag(&pvec,
> -			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
> +	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> +					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +					&fbatch))) {
>   		int i;
>   
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct page *page = &fbatch.folios[i]->page;
>   
>   			if (!IS_DNODE(page))
>   				continue;
> @@ -1924,7 +1925,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>   			}
>   			unlock_page(page);
>   		}
> -		pagevec_release(&pvec);
> +		folio_batch_release(&fbatch);
>   		cond_resched();
>   	}
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
