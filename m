Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8F15BF9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2020 14:43:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2EmN-0001NG-Be; Thu, 13 Feb 2020 13:43:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j2EmL-0001N8-JN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Feb 2020 13:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57P4Q/GU2ra8qTXmZpI2Z/3+4gqtkjqSHRcsBClNQtg=; b=HyziW3sNcpT1sqeB7Liv1/yjw0
 IQARdf/IqNhZ1zY8Eeux2Orw6Zg74PlgxcP/c5Bl/X7ATM07mWcXGyadPiiQeu3uR/tGuzsUWQRvr
 VBROVAjkjQmg4LowIgDWb5S+pgQXX0GGp4UM2hggKy8SFfRcp90afrpd9l3ahHr7nbH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57P4Q/GU2ra8qTXmZpI2Z/3+4gqtkjqSHRcsBClNQtg=; b=Ca3j9zRgalf5lc2PwGghIyJrvU
 7ajVkI5yZ5gopR5bE1it/RabK5GmsoX7k6jyNJa40QSLOi80Ro9bWvhBkEtWkHZ29lIisgzvadHkq
 bk7/a8YJ/lCOjv2aVwf+aB2pv2gh0D0D+lI6Zt9PxiFAMbf6r2Sho1yxamyfLz49R7F0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2EmJ-00BTaU-Tt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Feb 2020 13:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=57P4Q/GU2ra8qTXmZpI2Z/3+4gqtkjqSHRcsBClNQtg=; b=rSzaYz7/rumIfdFG+MdlTwtWLq
 KJDbhGYitV4p48O5SGrNFqm7b6XrkzPNvpJkvwLsbmPzqOjljvrrI/kGme5i39kPjSCbZwMVJj/gp
 /vZh8pgUFXWHWX8sVicFVEOt39rpppNWYqPj6hi4J8dYGEOsWyymiKiHcRkxOz883kzq6ZSKHqjk3
 fsehuyu0gDewtgLxKPXDc7teJpZ6SJQvrPw6Tb1R8zCLV/rYe5SP5WtC5ElJI7KBaqIo6dB7dEuoo
 fa9oGjFgIiPAK7v7SmERxvNZ+0wRUV+dCDxCmPFGbyPDr/p1ZkogJK5cSzTw9SfomXbDVvK3/M17m
 Yx42/x7g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j2Elw-0008Pa-QR; Thu, 13 Feb 2020 13:43:16 +0000
Date: Thu, 13 Feb 2020 05:43:16 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200213134316.GK7778@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
 <20200212203852.8b7e0b28974e41227bd97329@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212203852.8b7e0b28974e41227bd97329@linux-foundation.org>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2EmJ-00BTaU-Tt
Subject: Re: [f2fs-dev] [PATCH 00/12] Change readahead API
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
Cc: cluster-devel@redhat.com, Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 12, 2020 at 08:38:52PM -0800, Andrew Morton wrote:
> On Fri, 24 Jan 2020 17:35:41 -0800 Matthew Wilcox <willy@infradead.org> wrote:
> 
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
> 
> Unclear which patch fixes this and how it did it?

I suppose the problem isn't fixed until patch 13/13 is applied.
What yu kuai is seeing is a race where readahead allocates a page,
then passes it to iomap_readpages, which calls xfs_read_iomap_begin()
which looks up the extent.  Then thread 2 does DIO which modifies the
extent, because there's nothing to say that thread 1 is still using it.
With this patch series, the readpages code puts the locked pages in the
cache before calling iomap_readpages, so any racing write will block on
the locked page until readahead is completed.

If you're tempted to put this into -mm, I have a couple of new changes;
one to fix a kernel-doc warning for mpage_readahead() and one to add
kernel-doc for iomap_readahead():

+++ b/fs/mpage.c
@@ -339,9 +339,7 @@
 
 /**
  * mpage_readahead - start reads against pages
- * @mapping: the address_space
- * @start: The number of the first page to read.
- * @nr_pages: The number of consecutive pages to read.
+ * @rac: Describes which pages to read.
  * @get_block: The filesystem's block mapper function.
  *
  * This function walks the pages and the blocks within each page, building and

+++ b/fs/iomap/buffered-io.c
@@ -395,6 +395,21 @@
 	return done;
 }
 
+/**
+ * iomap_readahead - Attempt to read pages from a file.
+ * @rac: Describes the pages to be read.
+ * @ops: The operations vector for the filesystem.
+ *
+ * This function is for filesystems to call to implement their readahead
+ * address_space operation.
+ *
+ * Context: The file is pinned by the caller, and the pages to be read are
+ * all locked and have an elevated refcount.  This function will unlock
+ * the pages (once I/O has completed on them, or I/O has been determined to
+ * not be necessary).  It will also decrease the refcount once the pages
+ * have been submitted for I/O.  After this point, the page may be removed
+ * from the page cache, and should not be referenced.
+ */
 void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 {
 	struct inode *inode = rac->mapping->host;

I'll do a v6 with those changes soon, but I would really like a bit more
review from filesystem people, particularly ocfs2 and gfs2.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
