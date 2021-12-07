Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD646C740
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 23:10:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muifH-0001yN-56; Tue, 07 Dec 2021 22:10:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1muifF-0001xo-1H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 22:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6FBz8h9Hfwmp4vfPtk6n+6xSOrV5+Vaq0b6Jyl3zD1o=; b=W/NeVRt3iwS+hu1SjuHZVkt8bN
 e0noGhg20u+SNsRC/kTYhQU+aD5JECT9R0xyxPM36c0lPAEYksYkX/uBHQMdv7E3EMbt1DBu+qDmo
 +T2pxiZKEm6iMGfNKTQ9sdKEgiULatKhziHF+P+QVWWbOtCWp5Gm+FH+F9gla8ZbGiIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6FBz8h9Hfwmp4vfPtk6n+6xSOrV5+Vaq0b6Jyl3zD1o=; b=iPonV+0kTH4VdG3kysN4KwdxSa
 3cxi0tQRjd0ZYgh9cuaph6DCEYtKI4GlFUq8hv9QjHmxeYnKKcvdcb7kuuWrcjlPp9M0LAOVLDWqg
 jICGE0foeIo/Go8/2bcP8oPbjYiLUWhzgXjOb3iFERfwL8zgIIMwRs3RIZQMRLklfFzA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muifE-0008OE-26
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 22:10:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3F4D8CE1D6A;
 Tue,  7 Dec 2021 22:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B93C341C3;
 Tue,  7 Dec 2021 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638915008;
 bh=BHjSZ4MPBPA5I9nGCjac++vO6q6E/wPGv/taWiOLqC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1fhtZrqvH8Zx9ctt1zYNJd1LPUsVopxNKFnFxUNZzMF4Cvluz2LX1SGjQgqD1GWu
 dr4+XRiQCFgarAiLpvOC2iER4TNB5wV8VX8CSYybdv89JdOWg40qJ/Mz+r4DLHO6Gx
 lJfCoELEFCu7VqfUydGGDKBO+EWFt4hPsptz8GyA48Dg+Nq6+VCuKmCjspIVR9Dn89
 kgj6Js7ladxfNfBqXM3zyovYc8wo4qRM3A9DqjoTnAQ3I4059pEkBpbDj+2cZ8UclU
 15w/X4djzH3e7J3FEmMRO62DCIHmSAa1n40v2qLEQPFWZ1V3d+stXA0QnVKZESDo7c
 X6aCn+855SZwA==
Date: Tue, 7 Dec 2021 14:10:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Ya/bviwnMPsSnOcy@google.com>
References: <0000000000005f297e05d24f05f6@google.com>
 <20211206175631.5d0c3caefa96f0479f0fc2e8@linux-foundation.org>
 <Ya7jYRDwQqftGLtW@casper.infradead.org>
 <Ya/Ueh7MWyvV2zdg@google.com>
 <Ya/ZaxznaTmrIvdO@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ya/ZaxznaTmrIvdO@casper.infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/07, Matthew Wilcox wrote: > On Tue, Dec 07, 2021 at
 01:39:06PM -0800, Jaegeuk Kim wrote: > > On 12/07, Matthew Wilcox wrote: >
 > > > > Call Trace: > > > > > <TASK> > > > > > folio_mark_dirty+0x1 [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muifE-0008OE-26
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in folio_mark_dirty
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
Cc: syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/07, Matthew Wilcox wrote:
> On Tue, Dec 07, 2021 at 01:39:06PM -0800, Jaegeuk Kim wrote:
> > On 12/07, Matthew Wilcox wrote:
> > > > > Call Trace:
> > > > >  <TASK>
> > > > >  folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639
> > > 
> > >         if (likely(mapping)) {
> > > ...
> > >                 if (folio_test_reclaim(folio))
> > >                         folio_clear_reclaim(folio);
> > >                 return mapping->a_ops->set_page_dirty(&folio->page);
> > > 
> > > how do we get to a NULL ->set_page_dirty for a metadata page's
> > > mapping->a_ops?  This is definitely an f2fs expert question.
> > 
> > I can't find anything in f2fs, since that page was got by f2fs_grab_meta_page
> > along with grab_cache_page() that we never unlocked it.
> > 
> >   40 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
> >   41 {
> >   42         struct address_space *mapping = META_MAPPING(sbi);
> >   43         struct page *page;
> >   44 repeat:
> >   45         page = f2fs_grab_cache_page(mapping, index, false);
> > 
> >                     -> grab_cache_page(mapping, index);
> > 
> >   46         if (!page) {
> >   47                 cond_resched();
> >   48                 goto repeat;
> >   49         }
> >   50         f2fs_wait_on_page_writeback(page, META, true, true);
> >   51         if (!PageUptodate(page))
> >   52                 SetPageUptodate(page);
> >   53         return page;
> >   54 }
> > 
> > 
> > Suspecting something in folio wrt folio_mapping()?
> > 
> >  81 bool set_page_dirty(struct page *page)
> >  82 {
> >  83         return folio_mark_dirty(page_folio(page));
> >  84 }
> 
> ... huh?  How could folio_mapping() be getting this wrong?

Dunno.

> page_folio() does the same thing as compound_head() -- as far as I know
> you don't use compound pages for f2fs metadata, so this basically just
> casts the page to a struct folio.
> 
> folio_mapping() is just like the old page_mapping() (see commit
> 2f52578f9c64).  Unless you've done something like set the swapcache
> bit on your metadata page, it's just going to return folio->mapping
> (ie the same as page->mapping).

Hmm, I've never seen this call stack before, so simply started to suspect
folio.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
