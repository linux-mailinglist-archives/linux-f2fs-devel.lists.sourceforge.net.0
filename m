Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9711251BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 20:22:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iheth-0001Nf-VY; Wed, 18 Dec 2019 19:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ihetg-0001NQ-C0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WeW+VRLeMZJzYni3rjboMFgKf7w4L/Z6i8nVtxefrWQ=; b=fAy7NKjIDO+LkTU4EDPy9L4NLk
 teQzgR9504gQmooa4d+ktdgvL5QiBU8n2ZgtQhqqE5PCTSu1EKIWe/0zPzvB98n0hAkQH9hE5406q
 y8YE1OXjjdoV2sBQU3r66jdvf73McXKcE5b7925/dT1enWysGDw0RO8+bHrnohRh7KMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WeW+VRLeMZJzYni3rjboMFgKf7w4L/Z6i8nVtxefrWQ=; b=OiUSkPigTVYSKQBp8077gVEK/9
 PLiW82CrNTnf2VlYqhMDMUO7TKuvqobbgw9G0wkOwi348l6YvBXA0Padt1igkRildXq4umihZSK4P
 nLQmiu0SD6XSObm3kP4y9v+dnYsnxF3e9M0OBPRP9cl4FApav0+QIDvN1hwwHWgxj070=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihete-0098Yc-2b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WeW+VRLeMZJzYni3rjboMFgKf7w4L/Z6i8nVtxefrWQ=; b=igYrT7pkArJInRCn2HvudFpeQ
 4/Y7nWsP/q4E6FIbmdEk9z42j0nBzQL58sT3RxKWiM+4Mfe8XfTHyujpdq2OPJ1DGDGUnTlH0/j+y
 xaD21T5ZNtH5dEiFNAkmc6OeEvHN4w7ufKmttR9NCHAnejfMePx79c1FgWlzrmBoxP9cDjjixWuiN
 T8sxYZjvema0JpzXyWcftkKu6eS3v6EMqpPg404NTsQvXNOQ++CzO3jeSDIp/4ATRSoec/iviYsAO
 xKhTKKHM3ZvRS0sgTZxJFFDAo3TkYjVP7QIHFU1Ercgsr6Ydnj7/FIIBkei+hXzZWygrYTCvThFkj
 T+/2P2+Rg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ihetE-0006ZI-A3; Wed, 18 Dec 2019 19:21:44 +0000
Date: Wed, 18 Dec 2019 11:21:44 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20191218192144.GF32169@bombadil.infradead.org>
References: <20191218130935.32402-1-agruenba@redhat.com>
 <20191218185216.GA7497@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218185216.GA7497@magnolia>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihete-0098Yc-2b
Subject: Re: [f2fs-dev] [PATCH v3] fs: Fix page_mkwrite off-by-one errors
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
Cc: Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 10:52:16AM -0800, Darrick J. Wong wrote:
> > @@ -9016,13 +9016,11 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> >  	ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
> >  again:
> >  	lock_page(page);
> > -	size = i_size_read(inode);
> >  
> > -	if ((page->mapping != inode->i_mapping) ||
> > -	    (page_start >= size)) {
> > -		/* page got truncated out from underneath us */
> > +	ret2 = page_mkwrite_check_truncate(page, inode);
> > +	if (ret2 < 0)
> >  		goto out_unlock;
> 
> ...here we try to return -EFAULT as vm_fault_t.  Notice how btrfs returns
> VM_FAULT_* values directly and never calls block_page_mkwrite_return?  I
> know dsterba acked this, but I cannot see how this is correct?

I think you misread it.  'ret2' is never returned; we'll end up returning
VM_FAULT_NOPAGE here.  Arguably it should be SIGBUS or something, but
I think retrying the fault will also end up giving a SIGBUS.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
