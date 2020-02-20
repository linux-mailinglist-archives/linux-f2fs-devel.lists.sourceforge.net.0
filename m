Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC9166A72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 23:39:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4uTf-0004Be-Pq; Thu, 20 Feb 2020 22:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4uTd-0004BW-Pv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 22:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJX15g/idnsbi9mBK4m/qgB4NAR6fjeo4oenehrzb84=; b=CHgp9Tzp/N2gxkjHlCUGsxZoAy
 dgMaQeKjSXpn6ZWCJPk+3AY6CnP1DdKu2Ky/BoMxlEwr4A9O7G5Eptsy9IwKR/zJXtnagbWlATuys
 98dcWOhwo2MiLactHL9a4ET53upPz5FzWiqcIkyYJDagf36FVl4n7qsV1iUJplPNJYvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PJX15g/idnsbi9mBK4m/qgB4NAR6fjeo4oenehrzb84=; b=jheTSovkS2oQA6wqpa12g56yG/
 32kgsUCQqakaszjlllxYMuOOC3wEMmPaNJxDAg9wj3XM7QSWgWwBEPGaluaprLApTX+fT2eFdUjaL
 5ustS6LMc+TPe3q/IFNfDrfugnsGVbvkksvvcu6wF6hkl+t6jIURYDCSmNBESCPJt9cg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4uTb-002xTJ-QB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 22:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PJX15g/idnsbi9mBK4m/qgB4NAR6fjeo4oenehrzb84=; b=tRp/RfyOc8MMAOEnFbjVZPeWaN
 2KkzEKXiN/S1p09Bqu90S2Z278xQaeJcCcxdgeXrdpytnUBFOLEh/tcVUgBOZ3WDQA1fyr25gzLyH
 gRM7sCok3nV4KM0JhdGQW17PpL0/Q+08nFcey+vxgYObaAojcT6v9r7vvwC4L45gbM+E1ObajSRbu
 9fqhh3Le7FzPdJj54Iv5P1uuGStaEN80lg311yLhBq1nMBvGvQ80nBsaseT/97o8elxjyPsMZtK46
 3NBlICNdJTCPRvVzyFRBHETaOyBq9s1mCrpI3p5mh7mcYzLn6aixyJdO3+xKTmslXOd/sUkUMeqtP
 kTySNnYQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4uTN-0006hx-9M; Thu, 20 Feb 2020 22:39:09 +0000
Date: Thu, 20 Feb 2020 14:39:09 -0800
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 ocfs2-devel@oss.oracle.com, linux-xfs@vger.kernel.org
Message-ID: <20200220223909.GB24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200220175400.GB2902@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220175400.GB2902@twin.jikos.cz>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4uTb-002xTJ-QB
Subject: Re: [f2fs-dev] [PATCH v7 00/23] Change readahead API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 20, 2020 at 06:54:00PM +0100, David Sterba wrote:
> On Wed, Feb 19, 2020 at 01:00:39PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > This series adds a readahead address_space operation to eventually
> > replace the readpages operation.  The key difference is that
> > pages are added to the page cache as they are allocated (and
> > then looked up by the filesystem) instead of passing them on a
> > list to the readpages operation and having the filesystem add
> > them to the page cache.  It's a net reduction in code for each
> > implementation, more efficient than walking a list, and solves
> > the direct-write vs buffered-read problem reported by yu kuai at
> > https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/
> > 
> > The only unconverted filesystems are those which use fscache.
> > Their conversion is pending Dave Howells' rewrite which will make the
> > conversion substantially easier.
> > 
> > I want to thank the reviewers; Dave Chinner, John Hubbard and Christoph
> > Hellwig have done a marvellous job of providing constructive criticism.
> > Eric Biggers pointed out how I'd broken ext4 (which led to a substantial
> > change).  I've tried to take it all on board, but I may have missed
> > something simply because you've done such a thorough job.
> > 
> > This series can also be found at
> > http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/tags/readahead_v7
> > (I also pushed the readahead_v6 tag there in case anyone wants to diff, and
> > they're both based on 5.6-rc2 so they're easy to diff)
> > 
> > v7:
> >  - Now passes an xfstests run on ext4!
> 
> On btrfs it still chokes on the first test btrfs/001, with the following
> warning, the test is stuck there.

Thanks.  The warning actually wasn't the problem, but it did need to
be addressed.  I got a test system up & running with btrfs, and it's
currently on generic/027 with the following patch:

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 9c782c15f7f7..d23a224d2ad2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -676,7 +676,7 @@ static inline unsigned int __readahead_batch(struct readahead_control *rac,
 		struct page **array, unsigned int array_sz)
 {
 	unsigned int i = 0;
-	XA_STATE(xas, &rac->mapping->i_pages, rac->_index);
+	XA_STATE(xas, &rac->mapping->i_pages, 0);
 	struct page *page;
 
 	BUG_ON(rac->_batch_count > rac->_nr_pages);
@@ -684,6 +684,8 @@ static inline unsigned int __readahead_batch(struct readahead_control *rac,
 	rac->_index += rac->_batch_count;
 	rac->_batch_count = 0;
 
+	xas_set(&xas, rac->_index);
+	rcu_read_lock();
 	xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
 		VM_BUG_ON_PAGE(!PageLocked(page), page);
 		VM_BUG_ON_PAGE(PageTail(page), page);
@@ -702,6 +704,7 @@ static inline unsigned int __readahead_batch(struct readahead_control *rac,
 		if (i == array_sz)
 			break;
 	}
+	rcu_read_unlock();
 
 	return i;
 }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
