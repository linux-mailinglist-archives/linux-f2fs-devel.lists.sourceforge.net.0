Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E53C45B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jul 2021 08:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FUN4iUug8acMD3KAaCddXdo0LasP9K/pvtwh40E7Ew=; b=FwvnUaItmNirmd9lIL/kUfwrt
	qTVsHqtTWMrkXhaxBo3TzTFuFDQS5rbZPXvGPJ5L9su35VzhxdG58ncyrKF8i+Kk8ciSqHRHgdoLb
	JuUs3FR1Bfjgv4XA2qGcvZGBDIfTz/mSUb1imK0VgflbHQrz66lrMnEQbday25MhON4ns=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2poy-0000ej-BI; Mon, 12 Jul 2021 06:53:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhocko@suse.com>) id 1m2pox-0000eY-0n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 06:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNwOMLlKi66VGmHIEbOBTG2Q2a8j2sNDoQXhXFwpAR4=; b=ksLPP/1HQ85eFkDVyDdHSSFgPc
 eHttlnJITptHMMpvdZLCqNDh+xv+EY4XTusP/BPwljXWi2eP+s5phI8nfdAQ7U1ybJpktXgJi3A3o
 EYyhuUIcwP1p0Ngl4RDlHTOXzQN1h8NglefSgH36kTpz3l/yKn3jrlEFTKEI9voAu4pI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNwOMLlKi66VGmHIEbOBTG2Q2a8j2sNDoQXhXFwpAR4=; b=J1VymNSpTGBpzzJds+8JEM7vwx
 UOHopIPJw+30e4slCDVctugGTXn0vk/97WaRck6AoacKYJmEYzUrfK9BDWD0yi1Fw6w0yxn1ppTNO
 PKg6o+2dAIO3Cjo8TJOEQME5CYzFGGcLHcrN7H7prwjFDQtpVpDZ10gHYENaO2dRWeUU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2pog-005NdX-4U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 06:53:38 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 30F8E1FD58;
 Mon, 12 Jul 2021 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626072794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FNwOMLlKi66VGmHIEbOBTG2Q2a8j2sNDoQXhXFwpAR4=;
 b=IXDNvguctsJNRlVZYB5/iqcdnyk4ksoJh4wgcYvvL38b8rwNbkaY4dKfOL5OnDhQfvOoGQ
 5yvc4yGRQrtqcLYd07XqgUI3n0eoIdPpe090BX+65Bgwo8Hd8ecuhgY1S4aAT3YL7DJGGe
 aaLWCt+/xHFLyzo26PEr6ZdyUAtGMyM=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D6BF5A4E93;
 Mon, 12 Jul 2021 06:53:13 +0000 (UTC)
Date: Mon, 12 Jul 2021 08:53:13 +0200
To: Chao Yu <chao@kernel.org>
Message-ID: <YOvm2faBUjKmZI7Q@dhcp22.suse.cz>
References: <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
 <YONJpQapR7BRnW/J@google.com>
 <YONTRlrJugeVq6Fj@casper.infradead.org>
 <20210706091211.GR3840@techsingularity.net>
 <85bb893b-0dc4-5f57-23ec-3f84814b7072@kernel.org>
 <20210707095706.GT3840@techsingularity.net>
 <fc0de0c2-a3b6-df91-5b90-524768a85d82@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc0de0c2-a3b6-df91-5b90-524768a85d82@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2pog-005NdX-4U
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize page->private when using
 for our internal use
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
From: Michal Hocko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Mel Gorman <mgorman@techsingularity.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat 10-07-21 16:11:38, Chao Yu wrote:
> On 2021/7/7 17:57, Mel Gorman wrote:
> > I think it would work but it would be preferable to find out why the
> > tail page has an order set in the first place. I've looked over
> 
> Agreed.
> 
> > mm/page_alloc.c and mm/compaction.c a few times and did not spot where
> > set_private_page(page, 0) is missed when it should be covered by
> > clear_page_guard or del_page_from_free_list :(
> 
> I didn't enable CONFIG_DEBUG_PAGEALLOC, so we will expect page private
> should be cleared by del_page_from_free_list(), but I guess it only clears
> the buddy's private field rather than original page's, so I added below
> diff and check the dmesg, it looks stall private value in original page
> will be left commonly... Let me know if I missed something?

Page private should be cleared when the page is freed to the allocator.
Have a look at PAGE_FLAGS_CHECK_AT_FREE.

> ---
>  mm/page_alloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index a06bcfe6f786..1e7031ff548e 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1029,6 +1029,7 @@ static inline void __free_one_page(struct page *page,
>  	unsigned long combined_pfn;
>  	unsigned int max_order;
>  	struct page *buddy;
> +	struct page *orig_page = page;
>  	bool to_tail;
> 
>  	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
> @@ -1097,6 +1098,10 @@ static inline void __free_one_page(struct page *page,
> 
>  done_merging:
>  	set_buddy_order(page, order);
> +	if (orig_page != page) {
> +		if (WARN_ON_ONCE(orig_page->private))
> +			pr_info("2order:%x, origpage.private:%x", order, orig_page->private);
> +	}

Why is this expected? Buddy allocator uses page private to store order.
Whether we are merging to the freed page or coalesce it to a different
page is not all that important.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
