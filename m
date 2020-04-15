Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043B1A921A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 06:56:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOa6C-0001pk-Q8; Wed, 15 Apr 2020 04:56:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1jOa6B-0001pZ-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 04:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBLUnTzyvWlPuhYcJ2fwocT8s+k/dtmRP9/WnuKWHDE=; b=ASYU9wD2WmLJ49+BoN2Q79v7S1
 1XXKinyh/oIc7t24zKdHOWwZiILL4/m3TRlsYd9hSmvXdkPX4ZbvK0SkN0DrO3Hje5gAn6wi9Qn4J
 pR+uzC2DRgYfFAx3S2hCfocDF1ZJbYTUIhUikgujUjTrg0KvLbilLqh83c95wF3Vjcl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zBLUnTzyvWlPuhYcJ2fwocT8s+k/dtmRP9/WnuKWHDE=; b=R2RwG/VpnKpLRQONKixqEizZVN
 wLPyKJDHPle7p3ocgkzWIDJHNTMY+TbzTdW/rVWZELZlRpJ89YsYLXfgjJFTGz7HnBkg/FliJGo/T
 cfr7g3sapPBO4JADN6lUq94p2ZAdVOmjvXZHpM50uaKYAp4dqDi/0kHZW1geVBq6kK0U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOa63-001eZi-B2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 04:56:31 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BD0920784;
 Wed, 15 Apr 2020 04:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586926577;
 bh=7/cyAEWqRIoOXcFZNvYgjU7w3cE8iC6Fh8sNAEooM88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o7nTdRDWnBos1+imCHuZl8B8uuGul0yLnN9eMfYMaDqOlB+cl/NgjLOckV0vY0hpP
 Ucm/O1A9vtop3dW0jo3wEyrWUTI/eFT4pIPVlWkKKNR0Qa5IVvC7y0T9VVsiPyVZ+6
 YcmvoJe/CEGPjhSZX5DnQnSB/tg3reced0fueZDI=
Date: Tue, 14 Apr 2020 21:56:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Message-Id: <20200414215616.f665d12f8549f52606784d1e@linux-foundation.org>
In-Reply-To: <20200415021808.GA5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-6-willy@infradead.org>
 <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
 <20200415021808.GA5820@bombadil.infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOa63-001eZi-B2
Subject: Re: [f2fs-dev] [PATCH v11 05/25] mm: Add new readahead_control API
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 14 Apr 2020 19:18:08 -0700 Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Apr 14, 2020 at 06:17:05PM -0700, Andrew Morton wrote:
> > On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org> wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > Filesystems which implement the upcoming ->readahead method will get
> > > their pages by calling readahead_page() or readahead_page_batch().
> > > These functions support large pages, even though none of the filesystems
> > > to be converted do yet.
> > > 
> > > +static inline struct page *readahead_page(struct readahead_control *rac)
> > > +static inline unsigned int __readahead_batch(struct readahead_control *rac,
> > > +		struct page **array, unsigned int array_sz)
> > 
> > These are large functions.  Was it correct to inline them?
> 
> Hmm.  They don't seem that big to me.

They're really big!

> readahead_page, stripped of its sanity checks:

Well, the sanity checks still count for cache footprint.

otoh, I think a function which is expected to be called from a single
site per filesystem is OK to be inlined, because there's not likely to
be much icache benefit unless different filesystem types are
simultaneously being used heavily, which sounds unlikely.  Although
there's still a bit of overall code size bloat.

> +       rac->_index += rac->_batch_count;
> +       if (!rac->_nr_pages) {
> +               rac->_batch_count = 0;
> +               return NULL;
> +       }
> +       page = xa_load(&rac->mapping->i_pages, rac->_index);
> +       rac->_batch_count = hpage_nr_pages(page);
> 
> __readahead_batch is much bigger, but it's only used by btrfs and fuse,
> and it seemed unfair to make everybody pay the cost for a function only
> used by two filesystems.

Do we expect more filesystems to use these in the future?

These function are really big!

> > The batching API only appears to be used by fuse?  If so, do we really
> > need it?  Does it provide some functional need, or is it a performance
> > thing?  If the latter, how significant is it?
> 
> I must confess to not knowing the performance impact.  If the code uses
> xa_load() repeatedly, it costs O(log n) each time as we walk down the tree
> (mitigated to a large extent by cache, of course).  Using xas_for_each()
> keeps us at the bottom of the tree and each iteration is O(1).
> I'm interested to see if filesystem maintainers start to use the batch
> function or if they're happier sticking with the individual lookups.
> 
> The batch API was originally written for use with btrfs, but it was a
> significant simplification to convert fuse to use it.

hm, OK.  It's not clear that its inclusion is justified?

> > The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
> > them at some stage?  Such as, before Linus shouts at us :)
> 
> I'd be happy to remove them.  Various reviewers said things like "are you
> sure this can't happen?"

Yeah, these things tend to live for ever.  Please add a todo to remove
them after the code has matured?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
