Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D172E1FC2BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 02:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlM0P-0004cy-U4; Wed, 17 Jun 2020 00:32:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jlM0O-0004cq-KS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 00:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ul7ITLaJhl7BsoMKtdcDyvgigCHM96XtVRL3WZUxjm4=; b=PQLTT6SbEPHrxFccljYrE6OVgH
 1CM/bnCQlinRs/tCWbjIXCPkIi9zCUTk6s4T4hKns7GGqUBQw5T5c8RpCGUpCTYl3g5sz5IKk11KF
 Y3LHQYm3XpaYM2BnpzBbNtNZV+57wkQtKlOjJxMZjR032j1ztHeqor88O7mNyp4ByAX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ul7ITLaJhl7BsoMKtdcDyvgigCHM96XtVRL3WZUxjm4=; b=Gt10YfhnSNgV6zZFh3o/QJlEgj
 8g9n3lMdPzkr9cVb2UATw7aWDUYX5UU/2xl4y6nmPl6bWDIG/pKbMzVwNiAC/7UHrDTjv706OpSlX
 kKqaeHbsxwZumEzix3SnrXSrJFb0H7u/WsZe1Cw8EsqMuaj5kqm7Hgz5vt9A4YG7c1HM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlM0K-005jVl-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 00:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ul7ITLaJhl7BsoMKtdcDyvgigCHM96XtVRL3WZUxjm4=; b=CSK/ewZv8HSv35avMFwiF1ehwB
 cD9mARby3Jnsxd2q3NU3WJbfxBPOO30ro5qSxuYd1xuUmacXibygc00a8IbXIFvF7taoDFPnbpYuD
 DspL7NDCqcdY9m8XhgG2DT+PlJcmnkpmPylMCkguzGzZ65Dyubhcoa3OtmmWBSATkM9jl1AHXL+4t
 4LA1dKT87umE7qVTpcf9AA7jo/byH2G5bi260qB7PIgEqpqUHOWSlQ/hjwPtFV4VscOSErmfVg2bp
 2WpES85a2aN+/K7Swg7SVGaQfGxlW1Z8c1tR65W+NyTJdrLuyMHceQujiU5Bncj2oO0nUpIXtJDmZ
 6tMkn0Mw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlM00-0001Vc-Jp; Wed, 17 Jun 2020 00:32:16 +0000
Date: Tue, 16 Jun 2020 17:32:16 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200617003216.GC8681@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
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
X-Headers-End: 1jlM0K-005jVl-Sy
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v11 16/25] fs: Convert
 mpage_readpages to mpage_readahead
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 Steven Whitehouse <swhiteho@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 12:36:13AM +0200, Andreas Gruenbacher wrote:
> Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >
> > Implement the new readahead aop and convert all callers (block_dev,
> > exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> > reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
> 
> This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.
> 
> Our lock hierarchy is such that the inode cluster lock ("inode glock")
> for an inode needs to be taken before any page locks in that inode's
> address space.

How does that work for ...

writepage:              yes, unlocks (see below)
readpage:               yes, unlocks
invalidatepage:         yes
releasepage:            yes
freepage:               yes
isolate_page:           yes
migratepage:            yes (both)
putback_page:           yes
launder_page:           yes
is_partially_uptodate:  yes
error_remove_page:      yes

Is there a reason that you don't take the glock in the higher level
ops which are called before readhead gets called?  I'm looking at XFS,
and it takes the xfs_ilock SHARED in xfs_file_buffered_aio_read()
(called from xfs_file_read_iter).

Not that after -rc1 is a great time to be upending the locking model in
a filesystem ... but then, this has been baking in -mm for ten weeks and
the GFS2 mailing list has been on the cc for the patches for five months,
so I don't have a lot of sympathy for this.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
