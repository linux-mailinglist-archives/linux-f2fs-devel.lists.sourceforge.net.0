Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4EF9F3572
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 17:11:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNDgq-0000K9-Du;
	Mon, 16 Dec 2024 16:11:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tNDgp-0000K1-1M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/dS2koCFgvRTs2qL0H3owc/c3q3KXceZMPOHWXB8q14=; b=URHweREzez+gFCGoRg3AlVH8tN
 d15VoeSdZv0qg2hRDRu1BzhkWIhFAxByNWLpJQzvN8Agnx9DvFuAAhrsC08irIkoZsf+1OsBR3zMY
 9yAYEA+qbBe8wuH+6Qgufo9aUo4I4v7wL2IZUsL/ZpsMhIvF5gHxB1cySBCxiYQRoQDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/dS2koCFgvRTs2qL0H3owc/c3q3KXceZMPOHWXB8q14=; b=kwsIS2ogZcFgSroT4JMFeSvEYK
 IBnjS0wQR0pObrbeKWzd8dAHJNIIwH5YPcHOeREMk/bIl7xoaFJfPFvK58hr5xwwNzhYi7VAW/J6D
 ST8/Ns4PyGlW69+y9EKDpedHk5540OOY14ZOl8pKNoN5teojEHo3OElOH4/HEpm2R0Jo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNDgn-0006z4-4n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0667A41875;
 Mon, 16 Dec 2024 16:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DA8C4CED0;
 Mon, 16 Dec 2024 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734365470;
 bh=Vv8Vz2MilHMuBabxpOuAiURfESwScQwqdJ2zOBjyvzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P2WGTI2mRgv693LU4gBKoeDmDRlAEYFy9fFByTLSnCAzqTh2gj+e7Dzrt6iPXxI39
 0IYbROq+F5HIjhLHFlQW9Mhxd9INnwNziP7ZSyhs+cPv0C4yB+Aed8gQ2UkdK2IS9N
 PN3nASJwChtkVKif4RzyVJNWTMfC/cA+DeZq6TLlrJ7PihyEK/3MJm+6LyN8rtAFtp
 y55pWMseWUlWal/SI9I2Xeb7B1VFFL679uFrZ/uffb59adYGr+OBYG0mRRFjrxqZuP
 pErk3yXL6MwNZ+vYM6wKlOcC1uYln/8gITu+eTKsQBatCPAiZZiqma76s0AwFEq9GS
 xETK7H4T+PTbg==
Date: Mon, 16 Dec 2024 16:11:08 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z2BRHO_OqNZSv8FG@google.com>
References: <20241128045828.527559-1-willy@infradead.org>
 <Z2AyQFgxRthSJpFJ@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2AyQFgxRthSJpFJ@casper.infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, Matthew Wilcox wrote: > On Thu, Nov 28, 2024 at
 04:58:15AM +0000, Matthew Wilcox (Oracle) wrote: > > This round of f2fs patches
 accomplishes two things: > > Ping. It's been two weeks and the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNDgn-0006z4-4n
Subject: Re: [f2fs-dev] [PATCH 00/11] f2fs folio patches
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16, Matthew Wilcox wrote:
> On Thu, Nov 28, 2024 at 04:58:15AM +0000, Matthew Wilcox (Oracle) wrote:
> > This round of f2fs patches accomplishes two things:
> 
> Ping.  It's been two weeks and these patches aren't in linux-next yet.

I was testing the series in dev-test.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

> 
> >  - Removal of all references to page->index in f2fs.  I'm looking to
> >    finish this conversion in the January merge window.
> >  - Removal of all calls to page_file_mapping() and folio_file_mapping()
> > 
> > I have only compile-tested these patches.
> > 
> > Matthew Wilcox (Oracle) (11):
> >   f2fs: Use a folio in f2fs_all_cluster_page_ready()
> >   f2fs: Use a folio in f2fs_compress_write_end()
> >   f2fs: Use a folio in f2fs_truncate_partial_cluster()
> >   f2fs: Use a folio in f2fs_write_compressed_pages()
> >   f2fs: Convert submit tracepoints to take a folio
> >   f2fs: Add F2FS_F_SB()
> >   f2fs: Convert f2fs_finish_read_bio() to use folios
> >   f2fs: Use a folio more in f2fs_submit_page_bio()
> >   f2fs: Use a data folio in f2fs_submit_page_bio()
> >   f2fs: Convert __read_io_type() to take a folio
> >   f2fs: Remove calls to folio_file_mapping()
> > 
> >  fs/f2fs/compress.c          | 28 ++++++++++++--------
> >  fs/f2fs/data.c              | 53 +++++++++++++++----------------------
> >  fs/f2fs/f2fs.h              |  7 ++++-
> >  fs/f2fs/inline.c            |  2 +-
> >  include/trace/events/f2fs.h | 39 +++++++++++++--------------
> >  5 files changed, 65 insertions(+), 64 deletions(-)
> > 
> > -- 
> > 2.45.2
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
