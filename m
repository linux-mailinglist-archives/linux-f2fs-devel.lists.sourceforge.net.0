Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E446C70C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 23:01:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muiWH-0001hB-HS; Tue, 07 Dec 2021 22:01:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1muiW2-0001gb-IM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 22:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHEajNctGC/0vOa+hsD34nlStTkJcznyOuhwQaT4q4g=; b=jGzRD3JwDMbfriA0fcQrrVlpu5
 euVqZNOTz2nujLHvKK0kl7BCv0hDJuX2EsArz1qCyzfuy47KhJhfjq2gkRchkbuD7V2Ef0fbeRpsI
 To1pI7p/QMbxX+24Cl5JPe5yd3kvQeEEHDng4v2Mw4y+a5T8BHHSqaXZ2NLu1As7kbso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GHEajNctGC/0vOa+hsD34nlStTkJcznyOuhwQaT4q4g=; b=lo/H/SRBERJ7PGYLf4mPJfAR+8
 rBZ/mRj4LQ32vxYll782NM8xQd4iqKquTh/EHR/UFKOQ6IQ0wPD0s3No0bgiplkMd3C3yk80AhF5d
 pt0H/UM2j3IMuYk+hwVmgLzD4SqObttIikz0qcqWbZLPVWBYhKbvcnu+T6KKnS7yJ+kg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muiVy-00800v-8l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 22:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GHEajNctGC/0vOa+hsD34nlStTkJcznyOuhwQaT4q4g=; b=K2Y4wmD4zAtxximZgUNDXpho8L
 fWTnDiuYs07KfvI3SAraPm1N0ivCZMHZmfSBxvPa/xdIrr8otukEfujBImdOkRNlz0bsfdQ+xZagz
 BSvSmQYirm+FoXpyQQd6G0lBunqbdYChti0pmG5MBaCzGJmFVFZD+jFs1CMF17qhhNLtjwUIIj+WU
 eKvz5nVc8QV6XLVcR+kdECZ9Jm+KziR0mZ+IDPpzm/4gVYR+QhAcVco0JQLFYhmLinwD/BSvQyS/f
 rSbNUzyKy85A/z4uA37+FqUnfmYW5noQ9E9edJ7zeCbTPoguVB0GcxvD2cc0R3sJ6rarsaH/lBtPk
 UG78sNCA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1muiVP-007obU-UA; Tue, 07 Dec 2021 22:00:11 +0000
Date: Tue, 7 Dec 2021 22:00:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Ya/ZaxznaTmrIvdO@casper.infradead.org>
References: <0000000000005f297e05d24f05f6@google.com>
 <20211206175631.5d0c3caefa96f0479f0fc2e8@linux-foundation.org>
 <Ya7jYRDwQqftGLtW@casper.infradead.org>
 <Ya/Ueh7MWyvV2zdg@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ya/Ueh7MWyvV2zdg@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 07, 2021 at 01:39:06PM -0800, Jaegeuk Kim wrote:
 > On 12/07, Matthew Wilcox wrote: > > > > Call Trace: > > > > <TASK> > >
 > > folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639 > > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1muiVy-00800v-8l
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

On Tue, Dec 07, 2021 at 01:39:06PM -0800, Jaegeuk Kim wrote:
> On 12/07, Matthew Wilcox wrote:
> > > > Call Trace:
> > > >  <TASK>
> > > >  folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639
> > 
> >         if (likely(mapping)) {
> > ...
> >                 if (folio_test_reclaim(folio))
> >                         folio_clear_reclaim(folio);
> >                 return mapping->a_ops->set_page_dirty(&folio->page);
> > 
> > how do we get to a NULL ->set_page_dirty for a metadata page's
> > mapping->a_ops?  This is definitely an f2fs expert question.
> 
> I can't find anything in f2fs, since that page was got by f2fs_grab_meta_page
> along with grab_cache_page() that we never unlocked it.
> 
>   40 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
>   41 {
>   42         struct address_space *mapping = META_MAPPING(sbi);
>   43         struct page *page;
>   44 repeat:
>   45         page = f2fs_grab_cache_page(mapping, index, false);
> 
>                     -> grab_cache_page(mapping, index);
> 
>   46         if (!page) {
>   47                 cond_resched();
>   48                 goto repeat;
>   49         }
>   50         f2fs_wait_on_page_writeback(page, META, true, true);
>   51         if (!PageUptodate(page))
>   52                 SetPageUptodate(page);
>   53         return page;
>   54 }
> 
> 
> Suspecting something in folio wrt folio_mapping()?
> 
>  81 bool set_page_dirty(struct page *page)
>  82 {
>  83         return folio_mark_dirty(page_folio(page));
>  84 }

... huh?  How could folio_mapping() be getting this wrong?
page_folio() does the same thing as compound_head() -- as far as I know
you don't use compound pages for f2fs metadata, so this basically just
casts the page to a struct folio.

folio_mapping() is just like the old page_mapping() (see commit
2f52578f9c64).  Unless you've done something like set the swapcache
bit on your metadata page, it's just going to return folio->mapping
(ie the same as page->mapping).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
