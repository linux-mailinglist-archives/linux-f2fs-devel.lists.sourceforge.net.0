Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 175909F321D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 14:59:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNBdM-00034V-FJ;
	Mon, 16 Dec 2024 13:59:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tNBdK-00034N-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 13:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mdENWut5ljQOWMMpCorUb1lLuQxX1oYH2fYLrSL5UCw=; b=NtnZ/UcHpXaYC2P7GYQkuBA2JX
 QhAnouDL0XRZaa474Qp8ygvRp+x1DpG8PgkZqnkr32A3B2S6kCd6+h+5keWbTLxN0BXEvWH8gpXSi
 V59WffAqdbClYQPOqep4BTMGMmNVUrXsbdnsHDK2ud+FT/Le8e5KAZ9xLIbF5Ru2PX8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mdENWut5ljQOWMMpCorUb1lLuQxX1oYH2fYLrSL5UCw=; b=nK9SE5CAm0vhR61E6nG1GCkgsA
 jduXXDHXfhShT6DMDDjHOUS0+rLjkcGZmb5HSvCsTYYQteapAgPNYrQyT/qa88TpO4aPdVGgy/FPI
 AJ3xwVfrIi4LtnG+gFeRzp2anfcz6CCLvG22sVaU7L76Gis9BSlisCaa1jEs2QDnUubA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNBdI-0004ly-9w for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 13:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mdENWut5ljQOWMMpCorUb1lLuQxX1oYH2fYLrSL5UCw=; b=eSzaj1cUzWC8dbXUIEviauMiCy
 lHnvhHm1ny9xsCvZbYwmPLE1guUiiu5iRFvUoq/3VQITStxidF6unlPCCVLzeDvHCqp4Iz4V2+h7c
 Xw9gmaVm7PgFqGYXN9wW1WcO3ubNlUsAT+5XafI5Fpg19LBEi4uMyXoUCoNE4wCF9hggQmFvZWGI3
 GnJ5kTEhY0eNdPhWsf3H4kQx8POhlykc9qGij2SPSG7OFSyomoilQwBYHbvcOMKSFuGsY0xRLfsqp
 eS7tDNDgxyIu8NY6ovUQdRfIxVzaNfhSs0/HFGeqT4oMc6voQ3jUhIY2uYgHC0BVKen7Tx9uSWDf1
 sOQ/XfKw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tNBdA-0000000GpLo-1QHo; Mon, 16 Dec 2024 13:59:28 +0000
Date: Mon, 16 Dec 2024 13:59:28 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <Z2AyQFgxRthSJpFJ@casper.infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 28, 2024 at 04:58:15AM +0000,
 Matthew Wilcox (Oracle)
 wrote: > This round of f2fs patches accomplishes two things: Ping. It's been
 two weeks and these patches aren't in linux-next yet. > - Removal of all
 references to page->index in f2fs. I'm looking to > finish this conversion
 in the January merge window. > - Removal of all calls to page_file_mapping()
 and folio_file_mapping() > > [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tNBdI-0004ly-9w
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 28, 2024 at 04:58:15AM +0000, Matthew Wilcox (Oracle) wrote:
> This round of f2fs patches accomplishes two things:

Ping.  It's been two weeks and these patches aren't in linux-next yet.

>  - Removal of all references to page->index in f2fs.  I'm looking to
>    finish this conversion in the January merge window.
>  - Removal of all calls to page_file_mapping() and folio_file_mapping()
> 
> I have only compile-tested these patches.
> 
> Matthew Wilcox (Oracle) (11):
>   f2fs: Use a folio in f2fs_all_cluster_page_ready()
>   f2fs: Use a folio in f2fs_compress_write_end()
>   f2fs: Use a folio in f2fs_truncate_partial_cluster()
>   f2fs: Use a folio in f2fs_write_compressed_pages()
>   f2fs: Convert submit tracepoints to take a folio
>   f2fs: Add F2FS_F_SB()
>   f2fs: Convert f2fs_finish_read_bio() to use folios
>   f2fs: Use a folio more in f2fs_submit_page_bio()
>   f2fs: Use a data folio in f2fs_submit_page_bio()
>   f2fs: Convert __read_io_type() to take a folio
>   f2fs: Remove calls to folio_file_mapping()
> 
>  fs/f2fs/compress.c          | 28 ++++++++++++--------
>  fs/f2fs/data.c              | 53 +++++++++++++++----------------------
>  fs/f2fs/f2fs.h              |  7 ++++-
>  fs/f2fs/inline.c            |  2 +-
>  include/trace/events/f2fs.h | 39 +++++++++++++--------------
>  5 files changed, 65 insertions(+), 64 deletions(-)
> 
> -- 
> 2.45.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
