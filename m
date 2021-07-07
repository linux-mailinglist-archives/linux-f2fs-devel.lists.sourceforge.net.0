Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BA3BE610
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jul 2021 11:57:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m14JC-0002vU-D8; Wed, 07 Jul 2021 09:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mgorman@techsingularity.net>) id 1m14JA-0002vN-0C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 09:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+J8+H+XP2lnThul4AcwL0D7Xua4/Rywc5hBcnmemopI=; b=BebL9tLbXfqCL2YeRt12ZaspXx
 NKDgnOxkGLAokdfnWVUb2pYPIOrxy6lp7oeqUb72wxBWFKrIfQiqZ0dakxrKJ5yLMwVAUWK6cA2iP
 JSPUuXRyO8HuTQ5qyiTDe6ndYnbcWKwuykeayqJN8Lty7FsU6mBg0dvPyHPwGUjFpIGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+J8+H+XP2lnThul4AcwL0D7Xua4/Rywc5hBcnmemopI=; b=NL0//GcaJHEz8mkrUjk4SkNlX+
 fXvQ7Qfaa2u2sFy/57Bcz814tGUmiI9/fn7aVSd5szLIUtCACfngQW3lHi95cQgECwmaiXTyjld4I
 yEYL/N3munC9JFThNiFKgQGtXKRsR0POHoM+KWOTXnN0HBRSHu7IIgJSPMHsGrDFnDAc=;
Received: from outbound-smtp27.blacknight.com ([81.17.249.195])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m14Iy-0001ic-KF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 09:57:31 +0000
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
 by outbound-smtp27.blacknight.com (Postfix) with ESMTPS id 5DDEFCAD10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jul 2021 10:57:08 +0100 (IST)
Received: (qmail 30476 invoked from network); 7 Jul 2021 09:57:08 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.255])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 7 Jul 2021 09:57:08 -0000
Date: Wed, 7 Jul 2021 10:57:06 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Chao Yu <chao@kernel.org>
Message-ID: <20210707095706.GT3840@techsingularity.net>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
 <YONJpQapR7BRnW/J@google.com>
 <YONTRlrJugeVq6Fj@casper.infradead.org>
 <20210706091211.GR3840@techsingularity.net>
 <85bb893b-0dc4-5f57-23ec-3f84814b7072@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85bb893b-0dc4-5f57-23ec-3f84814b7072@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1m14Iy-0001ic-KF
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
Cc: linux-mm@kvack.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 07, 2021 at 08:48:28AM +0800, Chao Yu wrote:
> On 2021/7/6 17:12, Mel Gorman wrote:
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d6e94cc8066c..be87c4be481f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3515,8 +3515,13 @@ void split_page(struct page *page, unsigned int order)
>  	VM_BUG_ON_PAGE(PageCompound(page), page);
>  	VM_BUG_ON_PAGE(!page_count(page), page);
> 
> -	for (i = 1; i < (1 << order); i++)
> -		set_page_refcounted(page + i);
> +	for (i = 1; i < (1 << order); i++) {
> +		struct page *tail_page = page + i;
> +
> +		set_page_refcounted(tail_page);
> +		if (WARN_ON_ONCE(tail_page->private))
> +			pr_info("order:%x, tailpage.private:%x", order, tail_page->private);
> +	}
>  	split_page_owner(page, 1 << order);
>  	split_page_memcg(page, 1 << order);
>  }
> -- 
> 2.22.1
> 
> With above diff, I got this:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 57 at mm/page_alloc.c:3363 split_page.cold+0x8/0x3b
> CPU: 3 PID: 57 Comm: kcompactd0 Tainted: G           O      5.13.0-rc1+ #67
> <SNIP>
> order:7, tailpage.private:d0000
> order:7, tailpage.private:d0000
> order:7, tailpage.private:d0000
> order:7, tailpage.private:200000
> order:7, tailpage.private:d0000
> order:7, tailpage.private:d0000
> order:7, tailpage.private:d0000
> 
> So how about adding set_page_private(page, 0) in split_page() to clear
> stall data left in tailpages' private field?
> 

I think it would work but it would be preferable to find out why the
tail page has an order set in the first place. I've looked over
mm/page_alloc.c and mm/compaction.c a few times and did not spot where
set_private_page(page, 0) is missed when it should be covered by
clear_page_guard or del_page_from_free_list :(

-- 
Mel Gorman
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
