Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40B163B84
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:43:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GGt-0000tB-3k; Wed, 19 Feb 2020 03:43:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4GGq-0000st-TK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iDIONmUrBaB7r5zUuv5snGrDpvxivUl1aby6uV9IKbY=; b=AvVbvAq5jMYrDS+1oM+PdXN9pw
 k3sf4LjFOEypp38eTkaeIPJLENJtNvYaYbvSBAD8VKLuG29BH/R7urgV7k+a9FdmPVb/gB95ael9W
 5x2BqAEyPz3Jipu5WZ0xOFlNTGNxC4krOyKAheFSpx9PaMC6mA7qpDs3MvdtFD8jycdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iDIONmUrBaB7r5zUuv5snGrDpvxivUl1aby6uV9IKbY=; b=GZpI/ICr281jPsTVKSKwZo5iCS
 Kq3fGVGSocjH2dv5O3L5Q+Weyee4k7hXqmGpTuyaEwtInCwldCa2dKRmGuLmlcrSBmRcNHBLb2QPZ
 gevyeWiyZYqkKfDxK2IU11b1+wyAt2UP7o2jvtFdFT4S48Cia/eYD2XyJzLZNfsMAqXo=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4GGp-007Wzq-L1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:43:32 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 880BB3A1C09;
 Wed, 19 Feb 2020 14:43:25 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4GGi-0005Z3-WB; Wed, 19 Feb 2020 14:43:25 +1100
Date: Wed, 19 Feb 2020 14:43:24 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219034324.GG10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-33-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-33-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=7-415B0cAAAA:8
 a=EUu7BJ-CshYY2WUz2RUA:9 a=Ins956pMss7IOATM:21 a=TqZTP-Om_uFHSJHF:21
 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4GGp-007Wzq-L1
Subject: Re: [f2fs-dev] [PATCH v6 19/19] mm: Use memalloc_nofs_save in
 readahead path
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
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:46:13AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Ensure that memory allocations in the readahead path do not attempt to
> reclaim file-backed pages, which could lead to a deadlock.  It is
> possible, though unlikely this is the root cause of a problem observed
> by Cong Wang.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
> Suggested-by: Michal Hocko <mhocko@suse.com>
> ---
>  mm/readahead.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 94d499cfb657..8f9c0dba24e7 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -22,6 +22,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/blk-cgroup.h>
>  #include <linux/fadvise.h>
> +#include <linux/sched/mm.h>
>  
>  #include "internal.h"
>  
> @@ -174,6 +175,18 @@ void page_cache_readahead_limit(struct address_space *mapping,
>  		._nr_pages = 0,
>  	};
>  
> +	/*
> +	 * Partway through the readahead operation, we will have added
> +	 * locked pages to the page cache, but will not yet have submitted
> +	 * them for I/O.  Adding another page may need to allocate memory,
> +	 * which can trigger memory reclaim.  Telling the VM we're in
> +	 * the middle of a filesystem operation will cause it to not
> +	 * touch file-backed pages, preventing a deadlock.  Most (all?)
> +	 * filesystems already specify __GFP_NOFS in their mapping's
> +	 * gfp_mask, but let's be explicit here.
> +	 */
> +	unsigned int nofs = memalloc_nofs_save();
> +

So doesn't this largely remove the need for all the gfp flag futzing
in the readahead path? i.e. almost all readahead allocations are now
going to be GFP_NOFS | GFP_NORETRY | GFP_NOWARN ?

If so, shouldn't we just strip all the gfp flags and masking out of
the readahead path altogether?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
