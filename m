Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8E10CC04
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 16:45:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaLzH-0000Ni-M2; Thu, 28 Nov 2019 15:45:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+27774d78ce0bfd674370+5940+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iaLzG-0000N4-1h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 15:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Ua9kzhqWdT/XmuB+JkZPQ/zR7CbGzhbDxmS9/PUHRg=; b=WD0gBMn9ZRN8RDIA6sqQazE7+e
 Iad5pN/PuXUcD33y4bB7vqTiFBxOQnj1o5+sxibqS1FoNS/WrYkhW45+mfXJ8r//hf5ExclaAAovx
 y54MemuknkMzQgpZmJ9BeXcjrodZ0LT+52EDKaJ4xT9deZ8pmZmQBb+kpUjLJpa/D3qQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Ua9kzhqWdT/XmuB+JkZPQ/zR7CbGzhbDxmS9/PUHRg=; b=fw/srnCpoTlNCRq9AY7BTV1E/0
 Jz6Qxy1EC6ORrrHldCbn3bK70Ao7TLt8EKL8qqu/Rj+y4/WKrqdyux2ZqXlLxDtZuPxB7yNBW18VR
 qj6pi+TCdzOUn3qPHzxrHhXVmVKQLjiSvvRItNbYiPDto+eu0fyoPHTd3fyxx7vMmugI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaLzE-00GH5p-4P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 15:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Ua9kzhqWdT/XmuB+JkZPQ/zR7CbGzhbDxmS9/PUHRg=; b=lYn5QAbbuOgCVzO0wK72zGcGg
 mQTVtUtKdl4KYiJHp4I5I3FXK/6FWZhfra4tUuTFV7QC78oDUm8NKzHIrgasl+8sbPlrCdG0T67u3
 kgAQ57kaMp3R3h1Z+mwXZn4SMTDknO5FcjPcWJhT6kEGYu4yyJ+8h7G98UfdWJKrqUQljjAF2xpQv
 RhfjlbJLk4dNosXzbNYjYOLiCEP2PZWfBnLjpu5EMP/cgJOBC3HTYk0zTcErIw08z7ffMbdnD/r09
 tSSlveUJqScNNE8ME81M1Rd4A954YOsGafxeRRIk7ktZ64V53SmN+UKMgMG5kfHDds764Ihn7lkwx
 SsNl980Fw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iaLym-0005vg-OI; Thu, 28 Nov 2019 15:45:16 +0000
Date: Thu, 28 Nov 2019 07:45:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20191128154516.GA17166@infradead.org>
References: <20191127151811.9229-1-agruenba@redhat.com>
 <20191127154954.GT6219@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127154954.GT6219@magnolia>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1iaLzE-00GH5p-4P
Subject: Re: [f2fs-dev] [PATCH] fs: Fix page_mkwrite off-by-one errors
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
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 27, 2019 at 07:49:54AM -0800, Darrick J. Wong wrote:
> On Wed, Nov 27, 2019 at 04:18:11PM +0100, Andreas Gruenbacher wrote:
> > Fix a check in block_page_mkwrite meant to determine whether an offset
> > is within the inode size.  This error has spread to several filesystems
> > and to iomap_page_mkwrite, so fix those instances as well.
> 
> Seeing how this has gotten screwed up at least six times in the kernel,
> maybe we need a static inline helper to do this for us?

Yes.  I think we really want a little helper that checks the mapping
and the offset.  That also gives us the opportunity to document the
semantics.

> 
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> 
> The iomap part looks ok,
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> (I might just extract the iomap part and put it in the iomap tree if
> someone doesn't merge this one before I get to it...)

I think we should just pull in the helper and conversions through
some tree after all iomap bits are merged.  It might as well be
the iomap tree as that seems to the place for file system read/write
infrastructure these days.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
