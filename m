Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB631A90D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 04:18:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOXdJ-0000lO-E8; Wed, 15 Apr 2020 02:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jOXdH-0000lE-G8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9KHPxu7QAhV1u3S2ZqCIoyxy4Ym3v0RLTChLW2Oikv4=; b=HoDgUWs6JCxR40RdV07jeK0FD+
 gOXP4k2+NQeZW/ui+0ugocms8OQMZazenkWNX1DW4/MjdnzT1OngSPmwKTPePowfdDGEOzHY0Stsv
 1/x5R68aSOsjm8nIYlApNmZpLWAYlF/6cXZOGoM61phucKzz8WSBSV5G1+9elGxVpqsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9KHPxu7QAhV1u3S2ZqCIoyxy4Ym3v0RLTChLW2Oikv4=; b=Uv93uNexspGokYXiUj7iTzynJr
 l9KC+0oSx+czreBFLmQavgNCdsI/8KeiYEtI1q5LNUA4/1jnr6YCNOe9Z767nYVOVkMk8/oxs+DDJ
 QbLpx0pdYVbfR2tdWFcTQGfJsvWRfF/vgjhU99UrmMrP3YR9ivZtdBjA/paz8LMW82v0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOXdF-001X4h-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9KHPxu7QAhV1u3S2ZqCIoyxy4Ym3v0RLTChLW2Oikv4=; b=b6QEUePWGS20adBA91jd/5eoL3
 1qB1boh/lSdpZeSbJhBYeTpNJWWSCLq/Ywu3dBodJxi69s/hE26m1v0lWCZh7exlrHGttrDxBld0R
 o0U22RBR4IM2REf02o5LLzkjtrvAsrb1SUhVA+XUN1jZuoZiPyNDNgaCQZNFu+XzGieExeS3WoTq2
 HzrFZ6dcg3d7xLfboVDKIEwwlftwgdF2HBHdSLAnbd4RZD6VJwLdDQuDS9fhums2rjg8iZoJwG8r3
 xi29XIpXU8O6p96+bY4jKHquY1oQY/ApSWHiG2HS0U86jqAf8CD/BieGTpXmH+rAb1cb1EZx8mhzT
 VkdvlHpQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jOXcu-0000tf-4k; Wed, 15 Apr 2020 02:18:11 +0000
Date: Tue, 14 Apr 2020 19:18:08 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200415021808.GA5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-6-willy@infradead.org>
 <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOXdF-001X4h-Ln
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

On Tue, Apr 14, 2020 at 06:17:05PM -0700, Andrew Morton wrote:
> On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org> wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Filesystems which implement the upcoming ->readahead method will get
> > their pages by calling readahead_page() or readahead_page_batch().
> > These functions support large pages, even though none of the filesystems
> > to be converted do yet.
> > 
> > +static inline struct page *readahead_page(struct readahead_control *rac)
> > +static inline unsigned int __readahead_batch(struct readahead_control *rac,
> > +		struct page **array, unsigned int array_sz)
> 
> These are large functions.  Was it correct to inline them?

Hmm.  They don't seem that big to me.

readahead_page, stripped of its sanity checks:

+       rac->_nr_pages -= rac->_batch_count;
+       rac->_index += rac->_batch_count;
+       if (!rac->_nr_pages) {
+               rac->_batch_count = 0;
+               return NULL;
+       }
+       page = xa_load(&rac->mapping->i_pages, rac->_index);
+       rac->_batch_count = hpage_nr_pages(page);

__readahead_batch is much bigger, but it's only used by btrfs and fuse,
and it seemed unfair to make everybody pay the cost for a function only
used by two filesystems.

> The batching API only appears to be used by fuse?  If so, do we really
> need it?  Does it provide some functional need, or is it a performance
> thing?  If the latter, how significant is it?

I must confess to not knowing the performance impact.  If the code uses
xa_load() repeatedly, it costs O(log n) each time as we walk down the tree
(mitigated to a large extent by cache, of course).  Using xas_for_each()
keeps us at the bottom of the tree and each iteration is O(1).
I'm interested to see if filesystem maintainers start to use the batch
function or if they're happier sticking with the individual lookups.

The batch API was originally written for use with btrfs, but it was a
significant simplification to convert fuse to use it.

> The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
> them at some stage?  Such as, before Linus shouts at us :)

I'd be happy to remove them.  Various reviewers said things like "are you
sure this can't happen?"



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
