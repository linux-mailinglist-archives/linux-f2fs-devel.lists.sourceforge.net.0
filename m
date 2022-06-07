Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 570635400F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 16:12:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyZwD-0004rt-2t; Tue, 07 Jun 2022 14:12:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyZwB-0004rb-Gb; Tue, 07 Jun 2022 14:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nUpYTI4YzQUWe3MX/DeuqIdjPgTHj7mksBWnabO8pk=; b=J5Otw9dDfq9FxnBKeTM+ISyV9x
 mQ5Vv+jQ4j2LbkoPrF2ftfXDtRX8f2I4u9QPBptb95v0XMIv8w2mUPz/WwJFMRAlqJGQYY0u9Itte
 SpTJ2WG+PqF9X8FXPv/wHeQcUAsG4IcwzLXc+QE1utU41Jk24UOAhcWUCYpCATA/9JLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nUpYTI4YzQUWe3MX/DeuqIdjPgTHj7mksBWnabO8pk=; b=JzakT+xOiMdL/kbtBMgWRy45fj
 zOY/e6G8/1f7qxOIlytmLbPQcWP2fssfbYVUEf9Z5LlVPV68Ebj9cKaQFJTMfPlMV9qLo2tKXPAhH
 YHl5RrWFZWMlsDS4QnKmjV+Fj30IFoksK88jJ0mUCWe57GcQYSHeY9Qs8JCGK63RM4qE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyZw5-0000Ow-0d; Tue, 07 Jun 2022 14:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4nUpYTI4YzQUWe3MX/DeuqIdjPgTHj7mksBWnabO8pk=; b=IoritkaL90aqbR+RUHZKoSo8fb
 np1ux4ttns5tYj2sJk/FAj12Ak/CQ/wW4eIuwXN5ulK6rhUSeL7wfME8a6K9gYUgIYgqg08BNe9+I
 tus3kQ04SmPJZl9V4GH+E2xTibe280AETqIE3sbtSug/TUXDR0128c42jRa/+qeI8q7uri0dQOk1f
 wWHM11+pgzBreVL8bkL3da/JDGIf99g2HUm8tnTrzT4cPM9I17c3dxlon1CkQMKJOgWEf9FbWmKJ9
 h7TOtnv+jsL8ABFyKBR86bb03b2ZVDj0NIek4XcowncLGE0YjVino+xsZhqucJvOU+7lO9abDpL7s
 BM8iPWpg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyZvo-00BhC6-Sq; Tue, 07 Jun 2022 14:11:40 +0000
Date: Tue, 7 Jun 2022 15:11:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Brian Foster <bfoster@redhat.com>
Message-ID: <Yp9cnCaZ1O4qHFEp@casper.infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-6-willy@infradead.org>
 <Yp9VpZDsUEAZHEuy@bfoster>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yp9VpZDsUEAZHEuy@bfoster>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 07, 2022 at 09:41:57AM -0400, Brian Foster wrote:
 > On Mon, Jun 06, 2022 at 09:40:35PM +0100, Matthew Wilcox (Oracle) wrote:
 > > -static int expected_page_refs(struct address_space *mappin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyZw5-0000Ow-0d
Subject: Re: [f2fs-dev] [PATCH 05/20] mm/migrate: Convert
 expected_page_refs() to folio_expected_refs()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 07, 2022 at 09:41:57AM -0400, Brian Foster wrote:
> On Mon, Jun 06, 2022 at 09:40:35PM +0100, Matthew Wilcox (Oracle) wrote:
> > -static int expected_page_refs(struct address_space *mapping, struct page *page)
> > +static int folio_expected_refs(struct address_space *mapping,
> > +		struct folio *folio)
> >  {
> > -	int expected_count = 1;
> > +	int refs = 1;
> > +	if (!mapping)
> > +		return refs;
> >  
> > -	if (mapping)
> > -		expected_count += compound_nr(page) + page_has_private(page);
> > -	return expected_count;
> > +	refs += folio_nr_pages(folio);
> > +	if (folio_get_private(folio))
> > +		refs++;
> 
> Why not folio_has_private() (as seems to be used for later
> page_has_private() conversions) here?

We have a horrid confusion that I'm trying to clean up stealthily
without anyone noticing.  I would have gotten away with it too if it
weren't for you pesky kids.

#define PAGE_FLAGS_PRIVATE                              \
        (1UL << PG_private | 1UL << PG_private_2)

static inline int page_has_private(struct page *page)
{
        return !!(page->flags & PAGE_FLAGS_PRIVATE);
}

So what this function is saying is that there is one extra refcount
expected on the struct page if PG_private _or_ PG_private_2 is set.

How are filesystems expected to manage their page's refcount with this
rule?  Increment the refcount when setting PG_private unless
PG_private_2 is already set?  Decrement the refcount when clearing
PG_private_2 unless PG_private is set?

This is garbage.  IMO, PG_private_2 should have no bearing on the page's
refcount.  Only btrfs and the netfs's use private_2 and neither of them
do anything to the refcount when setting/clearing it.  So that's what
I'm implementing here.

> > +
> > +	return refs;;
> 
> Nit: extra ;

Oh, that's where it went ;-)  I had a compile error due to a missing
semicolon at some point, and thought it was just a typo ...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
