Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0F6CAA7C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 18:23:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgpcb-000073-2M;
	Mon, 27 Mar 2023 16:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1pgpcZ-00006o-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5gk+dREm5bLSsqD3YSf3yyJg/yMmvA9kxHAGuA6QyKw=; b=kkBCh+O4DxO9mbgJNZRPV2ABXQ
 wmPrPZ3FOBpUTI/UFq1WeZFBXxS/29XZnVMdMuWFPPgX1um4h7DM/xPRChDtGUke2U+Op2uXCvlDj
 +X2ReyrH4A2nsJOlWrcEup1XpyyPokDzi0MjTIQ8TZyngAtVWB3MHoWiy6rNTNWaCNIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5gk+dREm5bLSsqD3YSf3yyJg/yMmvA9kxHAGuA6QyKw=; b=g5SUaVZMBrfIYSZnoq56ggKLY8
 mPooFaYtZXwDAdHmi5AcUuEABdFFLbzWc1eSoejoBm1JscqHC6+oyyDvyj2oD2D/fjPtqaai9YAfp
 eHkjC7sXC4B+cLcXbC59BLgVeMBUXP1K7nZXkgqonr7FkM/xcxUDfsoywhKvNrHgWQiY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgpcU-005wBJ-4A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5gk+dREm5bLSsqD3YSf3yyJg/yMmvA9kxHAGuA6QyKw=; b=tbNGl/HFxlKsfgEwkgvNpIQn1V
 EdFym+Rjoi4yvX/tWDfz8RvIXF9lhk1mHVi+3eFpp7xfuz2NYmQBhx2Z5xIkl/XI4rtizrcOh5466
 iN0epzVbsqEQaqiskLE4Ug2xJgG+h43clnv8CDF/ky7GbSnm6EtS2+P5oAuGwZFjZFKuJMLNC7fwP
 v7/LVa4xzJSmuP5A8LfURjrU5rU9F7nHAzjJrB6xCpFrq+NTNqckBPoVcfSaLSq5eKvTm8wnM88AP
 LlTAZN9+V2xZRHD03aJoBvsD/bHdkQMoqOyfrCX5G1CGvM8FSDu4aE6t2Lt1+DA7wghy4HTX71opC
 LjtvfiNw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pgpcA-007Y5s-B2; Mon, 27 Mar 2023 16:22:34 +0000
Date: Mon, 27 Mar 2023 17:22:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ZCHCykI/BLcfDzt7@casper.infradead.org>
References: <20230323213919.1876157-1-jaegeuk@kernel.org>
 <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
 <ZCG2mfviZfY1dqb4@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCG2mfviZfY1dqb4@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 27, 2023 at 08:30:33AM -0700, Jaegeuk Kim wrote:
 > On 03/26, Chao Yu wrote: > > On 2023/3/24 5:39, Jaegeuk Kim wrote: > >
 > https://bugzilla.kernel.org/show_bug.cgi?id=216050 > > > > > > S [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pgpcU-005wBJ-4A
Subject: Re: [f2fs-dev] [PATCH] f2fs: get out of a repeat loop when getting
 a locked data page
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 27, 2023 at 08:30:33AM -0700, Jaegeuk Kim wrote:
> On 03/26, Chao Yu wrote:
> > On 2023/3/24 5:39, Jaegeuk Kim wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=216050
> > > 
> > > Somehow we're getting a page which has a different mapping.
> > > Let's avoid the infinite loop.
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >   fs/f2fs/data.c | 8 ++------
> > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > index bf51e6e4eb64..80702c93e885 100644
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
> > >   {
> > >   	struct address_space *mapping = inode->i_mapping;
> > >   	struct page *page;
> > > -repeat:
> > > +
> > >   	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
> > >   	if (IS_ERR(page))
> > >   		return page;
> > >   	/* wait for read completion */
> > >   	lock_page(page);
> > > -	if (unlikely(page->mapping != mapping)) {
> > 
> > How about using such logic only for move_data_page() to limit affect for
> > other paths?
> 
> Why move_data_page() only? If this happens, we'll fall into a loop in anywhere?
> 
> > 
> > Jaegeuk, any thoughts about why mapping is mismatch in between page's one and
> > inode->i_mapping?
> 
> > 
> > After several times code review, I didn't get any clue about why f2fs always
> > get the different mapping in a loop.
> 
> I couldn't find the path to happen this. So weird. Please check the history in the
> bug.
> 
> > 
> > Maybe we can loop MM guys to check whether below folio_file_page() may return
> > page which has different mapping?
> 
> Matthew may have some idea on this?

There's a lot of comments in the bug ... hard to come into this one
cold.

I did notice this one (#119):
: Interestingly, ref count is 514, which looks suspiciously as a binary
: flag 1000000010. Is it possible that during 5.17/5.18 implementation
: of a "pin", somehow binary flag was written to ref count, or something
: like '1 << ...' happens?

That indicates to me that somehow you've got hold of a THP that is in
the page cache.  Probably shmem/tmpfs.  That indicate to me a refcount
problem that looks something like this:

f2fs allocates a page
f2fs adds the page to the page cache
f2fs puts the reference to the page without removing it from the
page cache (how?)
page is now free, gets reallocated into a THP
lookup from the f2fs file finds the new THP
things explode messily

Checking page->mapping is going to avoid the messy explosion, but
you'll still have a page in the page cache which doesn't actually
belong to you, and that's going to lead to subtle data corruption.

This should be caught by page_expected_state(), called from
free_page_is_bad(), called from free_pages_prepare().  Do your testers
have CONFIG_DEBUG_VM enabled?  That might give you a fighting chance at
finding the last place which called put_page().  It won't necessarily be
the _wrong_ place to call put_page() (that may have happened earlier),
but it may give you a clue.

> > 
> > struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
> > 		int fgp_flags, gfp_t gfp)
> > {
> > 	struct folio *folio;
> > 
> > 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
> > 	if (IS_ERR(folio))
> > 		return NULL;
> > 	return folio_file_page(folio, index);
> > }
> > 
> > Thanks,
> > 
> > > -		f2fs_put_page(page, 1);
> > > -		goto repeat;
> > > -	}
> > > -	if (unlikely(!PageUptodate(page))) {
> > > +	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
> > >   		f2fs_put_page(page, 1);
> > >   		return ERR_PTR(-EIO);
> > >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
