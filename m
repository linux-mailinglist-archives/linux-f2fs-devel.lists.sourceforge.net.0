Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4E169D02
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 05:34:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j65Rl-0007z9-FP; Mon, 24 Feb 2020 04:34:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j65Rk-0007yv-8L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 04:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZOe8S6XU8WPAzzWKK+7v8HQwuSfqOL+eNbf+Acq4Wc=; b=hLtv8RUf8Lz5iXFlxvw+0ZtrRs
 IU6s0CYmQz38YwUgHPK8YM/kIZM7UeLvAtIhIgyT2kTiXX3hXyIgvWY9QBInEfgP2OKxKcOQwDHrn
 HKgELh/hkDDvYEGHHk9eZrPn2QXuSey4+V8ax3CYXAbg/2Km00WcOpk/MuXgQ90HTvVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oZOe8S6XU8WPAzzWKK+7v8HQwuSfqOL+eNbf+Acq4Wc=; b=f3PSl87yUSkTI4YsYKzZMCJ7Np
 w95TPk+8eYIXS5gcO8Wy3b+FkQw6OUO8w1YQDV+4hX0tyMadxqlvUnn+gJQS3AjFE/CVgYLMOb1kd
 9l3LC8DZvw465WXe5lfyu/LjW7kRds2O5FWTwwloCiJOCE9Cnh2y8LxM2DmWjILwiLAs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j65Ri-004tI7-8i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 04:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oZOe8S6XU8WPAzzWKK+7v8HQwuSfqOL+eNbf+Acq4Wc=; b=ALNrh1EBEZbPI0eohwoy43k7IJ
 XJ2e9816/Cs/vRrqDf3S6gKYY5tNTkWN4kjJFPML+eVKwmz8Ej5/NJIR097xCbOVGT4n/3FVCtY3O
 gn/yNbyTTS/qLVvgD8a/9uv4J4ws/6B3fng445cylTypcWambS3YaUfmoMD+/TOtojzWbjZpE6/zo
 ghV8g3yRtNrjP80Aoo51Pd9fIJz1CgBzZuRDbL9STCkWsJuA7Fz9M8l7mClCERunvUnwRHI/iy7J0
 DR9XgSFpwQPqfjwVfkmT0/g0k3jsyI3Efuhg2HSWlBcxnyFp7l7jjt1QI9lutMTR51+hhwlnhGP9z
 +ZZz/7SQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j65RL-0000Cd-GT; Mon, 24 Feb 2020 04:33:55 +0000
Date: Sun, 23 Feb 2020 20:33:55 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200224043355.GL24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-23-willy@infradead.org>
 <20200220154912.GC19577@infradead.org>
 <20200220165734.GZ24185@bombadil.infradead.org>
 <20200222010013.GH9506@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222010013.GH9506@magnolia>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j65Ri-004tI7-8i
Subject: Re: [f2fs-dev] [PATCH v7 22/24] iomap: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 05:00:13PM -0800, Darrick J. Wong wrote:
> On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> > On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
> > +/**
> > + * iomap_readahead - Attempt to read pages from a file.
> > + * @rac: Describes the pages to be read.
> > + * @ops: The operations vector for the filesystem.
> > + *
> > + * This function is for filesystems to call to implement their readahead
> > + * address_space operation.
> > + *
> > + * Context: The file is pinned by the caller, and the pages to be read are
> > + * all locked and have an elevated refcount.  This function will unlock
> > + * the pages (once I/O has completed on them, or I/O has been determined to
> > + * not be necessary).  It will also decrease the refcount once the pages
> > + * have been submitted for I/O.  After this point, the page may be removed
> > + * from the page cache, and should not be referenced.
> > + */
> > 
> > > Isn't the context documentation something that belongs into the aop
> > > documentation?  I've never really seen the value of duplicating this
> > > information in method instances, as it is just bound to be out of date
> > > rather sooner than later.
> > 
> > I'm in two minds about it as well.  There's definitely no value in
> > providing kernel-doc for implementations of a common interface ... so
> > rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
> > isn't just the implementation, like nilfs2_readahead() is, it's a library
> > function for filesystems to call, so it deserves documentation.  On the
> > other hand, there's no real thought to this on the part of the filesystem;
> > the implementation just calls this with the appropriate ops pointer.
> > 
> > Then again, I kind of feel like we need more documentation of iomap to
> > help filesystems convert to using it.  But maybe kernel-doc isn't the
> > mechanism to provide that.
> 
> I think we need more documentation of the parts of iomap where it can
> call back into the filesystem (looking at you, iomap_dio_ops).
> 
> I'm not opposed to letting this comment stay, though I don't see it as
> all that necessary since iomap_readahead implements a callout that's
> documented in vfs.rst and is thus subject to all the constraints listed
> in the (*readahead) documentation.

Right.  And that's not currently in kernel-doc format, but should be.
Something for a different patchset, IMO.

What we need documenting _here_ is the conditions under which the
iomap_ops are called so the filesystem author doesn't need to piece them
together from three different places.  Here's what I currently have:

 * Context: The @ops callbacks may submit I/O (eg to read the addresses of
 * blocks from disc), and may wait for it.  The caller may be trying to
 * access a different page, and so sleeping excessively should be avoided.
 * It may allocate memory, but should avoid large allocations.  This
 * function is called with memalloc_nofs set, so allocations will not cause
 * the filesystem to be reentered.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
