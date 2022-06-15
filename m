Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31B54C97C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 15:12:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1Sov-0001pp-ES; Wed, 15 Jun 2022 13:12:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+cd04db8a85bff7cd13dc+6870+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o1Sot-0001pi-1V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 13:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FHOVdTg6NKnoEjJkArBOs1GnjsYN72M8SV5hUzpqtrM=; b=a/RFugMSexbQZbnETwBKRlw22s
 J95J3EFI8vQjFz3x+OWLzTOZMpqm6vD9FXIFcs3RjLUJM8FBTDXSLGtsQevOn46Ocf8/N9tY1hOXh
 NZ+A80GBYN+sttYgmgq4eldVi7DCibYw4sJFcZjrVbPiQ3Hu73pWqCEbRW1P5mSGfcAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FHOVdTg6NKnoEjJkArBOs1GnjsYN72M8SV5hUzpqtrM=; b=ZV0+YBemW9ZavX+ULniLbxGyy7
 wqvpP8tazVWhW7bt9Np/MO6SC5LgwbUz+kazSWJMciy6vEqetOoMZvK+HfO3yf+zqUhv3/XLdqupD
 AqU7Dp85AVggY4NL5US9xUlesRYHj+yVbN5cPGd/UxPGbY22XG0DLRSTpZDOpgxwJv44=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1Sol-002PSi-VS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 13:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FHOVdTg6NKnoEjJkArBOs1GnjsYN72M8SV5hUzpqtrM=; b=2XD3XMBMNnkMfNTbWofuI16L1y
 ibePJHi5dvh74MnJpzG/u7S4aY3orURjcbZttxdDGEus2CPnup5s5KOGh1tezdDut2pv1x+NGhPuQ
 X+3q7hkUy7zDSvVK2F4TppQrdIPlffoCN0T5tf11PK7u3/D8dclNIN8z91X7ihwHu8RuY3cc7wDnT
 d43ZIT49HPtGxdcjxsIboQvMIdqXM3LrRBtzzeyXMjMyX991d/c4srAjBj5WAi/1DhB92Ucde0Xdx
 naUR1vNfJj/V/p7q3PNpvUcCQ6o6WE2NrGm2l1MnAHXJhZcTWN19ICW2w0WfNwRcn01j35hhvNYIv
 H6BuzbSQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1SoW-00EdqR-Tk; Wed, 15 Jun 2022 13:12:04 +0000
Date: Wed, 15 Jun 2022 06:12:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YqnapOLvHDmX/3py@infradead.org>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
 <YobNXbYnhBiqniTH@magnolia>
 <20220520032739.GB1098723@dread.disaster.area>
 <YqgbuDbdH2OLcbC7@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqgbuDbdH2OLcbC7@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 13, 2022 at 10:25:12PM -0700, Eric Biggers wrote:
 > While working on the man-pages update, I'm having second thoughts about
 the > stx_offset_align_optimal field. Does any filesystem other [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o1Sol-002PSi-VS
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 13, 2022 at 10:25:12PM -0700, Eric Biggers wrote:
> While working on the man-pages update, I'm having second thoughts about the
> stx_offset_align_optimal field.  Does any filesystem other than XFS actually
> want stx_offset_align_optimal, when st[x]_blksize already exists?  Many network
> filesystems, as well as tmpfs when hugepages are enabled, already report large
> (megabytes) sizes in st[x]_blksize.  And all documentation I looked at (man
> pages for Linux, POSIX, FreeBSD, NetBSD, macOS) documents st_blksize as
> something like "the preferred blocksize for efficient I/O".  It's never
> documented as being limited to PAGE_SIZE, which makes sense because it's not.

Yes.  While st_blksize is utterly misnamed, it has always aways been
the optimal I/O size.

> Perhaps for now we should just add STATX_DIOALIGN instead of STATX_IOALIGN,
> leaving out the stx_offset_align_optimal field?  What do people think?

Yes, this sounds like a good plan.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
