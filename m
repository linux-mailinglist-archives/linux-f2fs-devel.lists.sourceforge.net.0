Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F211667E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 21:02:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4s1M-00004x-Rh; Thu, 20 Feb 2020 20:02:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4s1L-0008WO-F8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qHvBZa6xH4q8QoO0XjztoHEsiwUeumDdhpQiwafJ4fA=; b=IEay/d4/XxCkZrdAe6AZaDSXIT
 4jAdja0UbiVcjklm6IghxNdRKGirgYtatRZ+liZm41mtkn4mBXmrVditlWgur2WkNznCY/AC9O9XT
 EcTtvcdhzLOUhTFQ3KttiCcPYX08zXwZ8xS42rg+7Z6tBbGR/oe471+WTLOeR1JIw0hc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qHvBZa6xH4q8QoO0XjztoHEsiwUeumDdhpQiwafJ4fA=; b=Un/15Nm2l11fA24vMc4ExmuO3R
 wAbR5C1zDKlKTYI9y7jF1HSIA6FH9hHwP1R33IdP80TtJvAekBXqKtJhaIPAq/n91RP95hJXd50P5
 x3LK7vy0dLLrEkpE+f/MW1GhbYjnfW1WSb3n2j/4zyQGGozlxswXWXArE3e0s7Y1utyw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4s1K-00C9cy-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qHvBZa6xH4q8QoO0XjztoHEsiwUeumDdhpQiwafJ4fA=; b=XxNghq7rFzqnKm0SVydd0tHTdn
 n4s70eVOvmXv6xE4upQLTZABvYZeabWIKMlGk6r1YJRae6i8tpYXe5dtM9zo+Nvpbtu1wnMIhCRDY
 nXaWx7ub/Z7OzeYS+E/BNUzS6JOhGzIvL1BAO8xZgolQ++p6TjxSiG17Yqf5R/+hI5Tk6WktBEQFl
 ALA1Z2m00fN67lT/dRb+VmatCW5BfMt0zqFVJecwEgC4ipDl7wtLI+budHd68slvGKbN8MEQRduxB
 hi02UijAGWWe/BHat9owg4eLO9dGnV9K9muMrZ8ZBwLUooYgWOvcD2lcfCIagHu0PZetNNM4A6azz
 Ltap/rvQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4p8p-0005KC-2B; Thu, 20 Feb 2020 16:57:35 +0000
Date: Thu, 20 Feb 2020 08:57:34 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200220165734.GZ24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-23-willy@infradead.org>
 <20200220154912.GC19577@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220154912.GC19577@infradead.org>
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
X-Headers-End: 1j4s1K-00C9cy-6R
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
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
> 
> Isn't the context documentation something that belongs into the aop
> documentation?  I've never really seen the value of duplicating this
> information in method instances, as it is just bound to be out of date
> rather sooner than later.

I'm in two minds about it as well.  There's definitely no value in
providing kernel-doc for implementations of a common interface ... so
rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
isn't just the implementation, like nilfs2_readahead() is, it's a library
function for filesystems to call, so it deserves documentation.  On the
other hand, there's no real thought to this on the part of the filesystem;
the implementation just calls this with the appropriate ops pointer.

Then again, I kind of feel like we need more documentation of iomap to
help filesystems convert to using it.  But maybe kernel-doc isn't the
mechanism to provide that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
