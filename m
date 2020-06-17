Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 195731FC413
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 04:22:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlNib-0006tL-09; Wed, 17 Jun 2020 02:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jlNiZ-0006sx-Q1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 02:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BEusnUbR+/cmrBB9bk/xdvHCANKyUH/aAcSZAMuW5OE=; b=KTewJNqDHRjzBe+Aj2nGgKdWv0
 gt/YZZi8Pl+OTNTnVRv1qvQxaHsDTrY+7K4qaxKVXvraFeHS0xFZctZWgnx0njgjBSKHsxqmLzXLW
 Du2evApnfs2owQY5sYsQLC4wDbFX2H9Izy3Njs4TiV+7QmxgCNZDhtaynRNNff3jGFJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BEusnUbR+/cmrBB9bk/xdvHCANKyUH/aAcSZAMuW5OE=; b=Mz6enkjSYtgB6u5eTzKGyL5sPZ
 whrCYzTfR3IUxhdx8JiUXFKX1Hx4pVndqjAcpw8GDkL6OWn0fj1Kxl4SNFdK3CL2J/kK+NJ7bAM6F
 atgT2EFlkVueubH3RDeiqncT5ZTCXOUBonKHmXcc7owTHXeCo6VBCv6qSMXn24cuit4Y=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlNiW-006AHc-72
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 02:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BEusnUbR+/cmrBB9bk/xdvHCANKyUH/aAcSZAMuW5OE=; b=Pw7h6Zurn3kEfvE1eYLcuqezpS
 6dv6YNzk6+f6NL9T5b1t5Q3S1oT5qqAMDEOxHE+1wGzAU1/UvkbHdNz07Ga1WaCWGzhKUCRSeZ6QZ
 o0I5/jAy2zGLAu1G4S3MZdS3qCqGws/6WiA4NRqQjbA9SmyY+Nnm0QKGoSQJFNIHsS2xUI0I9Udce
 qOHpLfYIPOR526dlzyvkD4gq0Xo6OO+YQA5h+uvfTaDDzfQbzfntE6t8KKL/bdGZugpf9j96kxyXi
 uqj9bm92o25yQodA2+9jXT7MN6tTeGOpuEujbqml8NcV0guvi1GGbOd5RpsedFvm4bLu4W95FUUfR
 YKCs+4uQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlNi9-0002wT-UP; Wed, 17 Jun 2020 02:21:57 +0000
Date: Tue, 16 Jun 2020 19:21:57 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20200617022157.GF8681@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
 <20200617003216.GC8681@bombadil.infradead.org>
 <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
X-Spam-Score: 0.1 (/)
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
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlNiW-006AHc-72
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
 Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 Steven Whitehouse <swhiteho@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 02:57:14AM +0200, Andreas Gr=FCnbacher wrote:
> Am Mi., 17. Juni 2020 um 02:33 Uhr schrieb Matthew Wilcox <willy@infradea=
d.org>:
> >
> > On Wed, Jun 17, 2020 at 12:36:13AM +0200, Andreas Gruenbacher wrote:
> > > Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infr=
adead.org>:
> > > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > >
> > > > Implement the new readahead aop and convert all callers (block_dev,
> > > > exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> > > > reiserfs & udf).  The callers are all trivial except for GFS2 & OCF=
S2.
> > >
> > > This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.
> > >
> > > Our lock hierarchy is such that the inode cluster lock ("inode glock")
> > > for an inode needs to be taken before any page locks in that inode's
> > > address space.
> >
> > How does that work for ...
> >
> > writepage:              yes, unlocks (see below)
> > readpage:               yes, unlocks
> > invalidatepage:         yes
> > releasepage:            yes
> > freepage:               yes
> > isolate_page:           yes
> > migratepage:            yes (both)
> > putback_page:           yes
> > launder_page:           yes
> > is_partially_uptodate:  yes
> > error_remove_page:      yes
> >
> > Is there a reason that you don't take the glock in the higher level
> > ops which are called before readhead gets called?  I'm looking at XFS,
> > and it takes the xfs_ilock SHARED in xfs_file_buffered_aio_read()
> > (called from xfs_file_read_iter).
> =

> Right, the approach from the following thread might fix this:
> =

> https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@red=
hat.com/T/#t

In general, I think this is a sound approach.

Specifically, I think FAULT_FLAG_CACHED can go away.  map_pages()
will bring in the pages which are in the page cache, so when we get to
gfs2_fault(), we know there's a reason to acquire the glock.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
