Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364018D636
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 18:49:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFLld-0004he-TA; Fri, 20 Mar 2020 17:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFLlc-0004hR-T9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 17:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REJDSQBSjlxGvUa9yFvVpoZkbE4uGtyMxtUffkDr/yg=; b=SB+gMeOqaIyKvRA9k74JjS48zZ
 DEThZYOlt0RA5NnQf2ofxxfO/AVK5zPO66144TWldgGshbE3xvB7n+Dz9BhrrC1b6ZkXXEFvTJxbo
 U3oZSCBCJ9GGLBc0g9AiP7zPnhn+js1rVhZfS+qXrPKVCpOQIVeYJPzW31Dox/s/Btqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REJDSQBSjlxGvUa9yFvVpoZkbE4uGtyMxtUffkDr/yg=; b=JYgnNklLDXdtrFSGq0MUUWZuEJ
 OvaIzWyd/srCN1KtLnZu4MTDlOTG0G3WY8fPiMkCeYyFuztEf9xTbz9fLLrU7eoFO9wY9mbzFhaPo
 cnHFBEsgoMRN2NQvAaYzf9HYMXYgwxvVSm8imsw+fGlQ7kU4LEXNnLJ9+nAYuuOtR//I=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFLlY-00FScf-M4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 17:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=REJDSQBSjlxGvUa9yFvVpoZkbE4uGtyMxtUffkDr/yg=; b=h1KzauchMVn1GcHidDQlLm4NDv
 aK4kqaKyat0c5S0apNaFmVi2M8lBpKqc6HcaPGEx+FFNw4NjYR32w5n0WAiLlaQiNyEfedB+7qoTL
 E/THmbYmMV4oouS6HA97h/6mPTqu5anVComDHxmPW4cHFSSyakaX+gQtXZhMNNfMHvVSjwaoJ0h2L
 OUdg+DUV4zfIM1jYNB9gSyndXuMPQpPpoePO6Xnc1zLjP/inzuV8mvsbNGEKjizrXkCo/5ONaqRd7
 SqjRvCtsua+M1JEUo9eCXIRJNJsizFMS59zha5v/io1cPAKUeptHjpuXzj4A/3UtnQK12YL/XylLS
 RApjCAiA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFLlI-0000w5-Ps; Fri, 20 Mar 2020 17:48:48 +0000
Date: Fri, 20 Mar 2020 10:48:48 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320174848.GC4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-21-willy@infradead.org>
 <20200320173734.GD851@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320173734.GD851@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFLlY-00FScf-M4
Subject: Re: [f2fs-dev] [PATCH v9 20/25] ext4: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 10:37:34AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 07:22:26AM -0700, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Use the new readahead operation in ext4
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > ---
> >  fs/ext4/ext4.h     |  3 +--
> >  fs/ext4/inode.c    | 21 +++++++++------------
> >  fs/ext4/readpage.c | 22 ++++++++--------------
> >  3 files changed, 18 insertions(+), 28 deletions(-)
> > 
> 
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> 
> > +		if (rac) {
> > +			page = readahead_page(rac);
> >  			prefetchw(&page->flags);
> > -			list_del(&page->lru);
> > -			if (add_to_page_cache_lru(page, mapping, page->index,
> > -				  readahead_gfp_mask(mapping)))
> > -				goto next_page;
> >  		}
> 
> Maybe the prefetchw(&page->flags) should be included in readahead_page()?
> Most of the callers do it.

I did notice that a lot of callers do that.  I wonder whether it (still)
helps or whether it's just cargo-cult programming.  It can't possibly
have helped before because we did list_del(&page->lru) as the very next
instruction after prefetchw(), and they're in the same cacheline.  It'd
be interesting to take it out and see what happens to performance.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
