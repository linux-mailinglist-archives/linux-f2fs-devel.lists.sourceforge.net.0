Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C949009D7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 18:02:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFc2g-0005TO-PP;
	Fri, 07 Jun 2024 16:02:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sFc2f-0005TH-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 16:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCTR4eCQnyDJGr3WoiKlq3Zd4xvRFUfx0w1DxTE2FHk=; b=Iv8NRgrS93L9xP1R/fqwIg9yzF
 vh8T7ELhq9uGYLrsFEZ2h0xjS11uSU/3OM8Ues1N+06umn1rIk4rgY6uo9Z7bPa7sGwCA8CWaGFpB
 T8xPfaJ5jAibUWEzZN/O871CZ/rZyXn05ew+5jehFrc5Kxh6JwsBxwMvlywQbNAdqn4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCTR4eCQnyDJGr3WoiKlq3Zd4xvRFUfx0w1DxTE2FHk=; b=kjyQd1ZOiB60ZMMJKgAEOO3ekN
 OCbqLaqHNuULYPsihTyJeddTAbPx+nSLEorWqQlsWZQWkxjGZCk+ZskwtjSM8OBZ+s9Hm9soGZYm9
 4A+mLimHjpLkFD+HmCdErGDN3lPNm/bRvTVE2paLu7SKGbsbPzOSMxHTOnAY60xpkQgM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFc2g-0008T2-FP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 16:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eCTR4eCQnyDJGr3WoiKlq3Zd4xvRFUfx0w1DxTE2FHk=; b=ty0t64Zdm+td/YOTBVUkZPDwzU
 M7TU31sGn1m9AbG7scYTTj89O6P47eFre0P1XyqEm1C4Uo7n5uq5f4jv+JZtgn3MGp6+til+mO9cz
 XG414ub1uno8xMDJcLQIgIOTLNxklDaaW3397qu3Q9rSYpGbJCPlhh6DtuxCG0+HUGTY3s0POD5nQ
 8KJ2FF4ZNboZsDXFiymYpaXNhDNp9z17dHfYwWdOADhqCK+FVLzyjeUxpTss022hzyHfqHKOgiPfs
 jU4Rs/tDvhRSnntiOTDPcc3DiWkr5K0CviCLv93oiheSC1SGJ61AbJFC5FaVGOzIhhBo+C7cj0mBw
 SPg7c1Gw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sFc2Z-00000006NPs-02yC;
 Fri, 07 Jun 2024 16:02:07 +0000
Date: Fri, 7 Jun 2024 17:02:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZmMu_tnbqZtGJCsE@casper.infradead.org>
References: <20240607101829.389015-1-chao@kernel.org>
 <ZmMMDy9eeCU2igqj@casper.infradead.org>
 <e56b6166-1bb4-411a-a701-51bf452d2369@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e56b6166-1bb4-411a-a701-51bf452d2369@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 07, 2024 at 10:10:52PM +0800, Chao Yu wrote: >
 On 2024/6/7 21:33, Matthew Wilcox wrote: > > On Fri, Jun 07, 2024 at 06:18:29PM
 +0800, Chao Yu wrote: > > > @@ -1990,6 +1989,12 @@ static inl [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFc2g-0008T2-FP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: get rid of buffer_head use
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 07, 2024 at 10:10:52PM +0800, Chao Yu wrote:
> On 2024/6/7 21:33, Matthew Wilcox wrote:
> > On Fri, Jun 07, 2024 at 06:18:29PM +0800, Chao Yu wrote:
> > > @@ -1990,6 +1989,12 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
> > >   	return (struct f2fs_super_block *)(sbi->raw_super);
> > >   }
> > > +static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio)
> > > +{
> > > +	return (struct f2fs_super_block *)(page_address(folio_page(folio, 0)) +
> > > +							F2FS_SUPER_OFFSET);
> > > +}
> > 
> > This assumes that the superblock is in the first page of the folio.
> > That's not necessarily guaranteed; let's say you have a 64KiB folio
> > that covers the start of the bdev.
> 
> Oh, I missed to add large folio support in this version.
> 
> For the case: page size is 4KiB, and folio size is 64KiB,
> read_mapping_folio(mapping, 0, NULL) and read_mapping_folio(mapping,
> 1, NULL) will return the same #0 folio, right?

That's right.  If you want to pass a page into F2FS_SUPER_BLOCK, that
would be fine.  Assuming you're not trying to support fs blocksize !=
PAGE_SIZE.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
