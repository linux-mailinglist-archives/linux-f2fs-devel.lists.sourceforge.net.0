Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1455163C75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 06:22:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Hov-0000vK-Jc; Wed, 19 Feb 2020 05:22:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4Hou-0000vE-Du
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 05:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3wjYvTxIvyqdBjcTZbZ6V6XXTZeeNXrItglyOMcggo=; b=mSVxbuxdxVbW9TQcSufvektrMa
 GWZv8ZL5wA67rI2P+W8d3Br5Y94zG0EVD0RpQsiPQOESsca7H3+/h/5afS0UnTm0GXDyCJ9vZFdB/
 fX+wvAIceTHXj1i0G7JZTKdQop/zC6rQq6BQMli5ZlyW0zD1+DBvj9/5jZPW7vMUTPo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v3wjYvTxIvyqdBjcTZbZ6V6XXTZeeNXrItglyOMcggo=; b=c6OGcCX/yaMOo72ucZ1bc9N+WH
 YgsPHfRbGFeKi9u1CYl1mPPtIHkZNxohvQqGSbEk1sHfBnHqGT1OqQprz/TRx/YGA9UBWGNFtB9ov
 uKxRIvc4XEJcFiwxHkzlNrhHW8la1dSReX0h3YbPCRFuFknx4AeXvwr2phYwSNcmq4tg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Hoq-007v9D-PR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 05:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v3wjYvTxIvyqdBjcTZbZ6V6XXTZeeNXrItglyOMcggo=; b=Auyp6lhSbAEYNk7jcncbMkY0Ws
 XinG1c/KH2WIappKRapF9o4axpn9L8oQskBlHlBLw9XQ0nXbJnkDsqfh2SkyzmQK0YhzpKp/QBFO0
 bpEGyHFQ+YA3qxJU00WEU/tiwjkGuEnVYcW0g3zXVubgFDKWaDvoJvN6VkjVPrCo/uQ+QP9jf8QO3
 9qiXCqAzx7Awla3qaJlBefBlwM8EQeYBIUB12k8qt69YC/AIm0vwjb3K/41acVQTK6Lg81YYNgtrt
 gWZkFfEHpJDHCeifbBhNb09jKli8nY0l/0Vau09mO9a0Cb/TiGxAZcwsAaM0Zi6C3GyPPjl+GKcMg
 Evj5uHjQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4Hoc-0008Pr-3p; Wed, 19 Feb 2020 05:22:30 +0000
Date: Tue, 18 Feb 2020 21:22:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219052230.GM24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-33-willy@infradead.org>
 <20200219034324.GG10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219034324.GG10776@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Hoq-007v9D-PR
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

On Wed, Feb 19, 2020 at 02:43:24PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:46:13AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Ensure that memory allocations in the readahead path do not attempt to
> > reclaim file-backed pages, which could lead to a deadlock.  It is
> > possible, though unlikely this is the root cause of a problem observed
> > by Cong Wang.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
> > Suggested-by: Michal Hocko <mhocko@suse.com>
> > ---
> >  mm/readahead.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 94d499cfb657..8f9c0dba24e7 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/mm_inline.h>
> >  #include <linux/blk-cgroup.h>
> >  #include <linux/fadvise.h>
> > +#include <linux/sched/mm.h>
> >  
> >  #include "internal.h"
> >  
> > @@ -174,6 +175,18 @@ void page_cache_readahead_limit(struct address_space *mapping,
> >  		._nr_pages = 0,
> >  	};
> >  
> > +	/*
> > +	 * Partway through the readahead operation, we will have added
> > +	 * locked pages to the page cache, but will not yet have submitted
> > +	 * them for I/O.  Adding another page may need to allocate memory,
> > +	 * which can trigger memory reclaim.  Telling the VM we're in
> > +	 * the middle of a filesystem operation will cause it to not
> > +	 * touch file-backed pages, preventing a deadlock.  Most (all?)
> > +	 * filesystems already specify __GFP_NOFS in their mapping's
> > +	 * gfp_mask, but let's be explicit here.
> > +	 */
> > +	unsigned int nofs = memalloc_nofs_save();
> > +
> 
> So doesn't this largely remove the need for all the gfp flag futzing
> in the readahead path? i.e. almost all readahead allocations are now
> going to be GFP_NOFS | GFP_NORETRY | GFP_NOWARN ?

I don't think it ensures the GFP_NORETRY | GFP_NOWARN, just the GFP_NOFS
part.  IOW, we'll still need a readahead_gfp() macro at some point ... I
don't want to add that to this already large series though.

Michal also wants to kill mapping->gfp_mask, btw.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
