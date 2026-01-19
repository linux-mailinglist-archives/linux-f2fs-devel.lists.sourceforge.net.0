Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B58D39F0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bweT0mFmRXKBP38RZQyiTYyfAce8uiezgqZ6PXkpxuw=; b=OK78mGoHn0hKhK1x9n4hcZvt8k
	f3Usu9A4Dp3Vrf0zjvUBQsiuvdmezYJAsnIb1TLly9tova5JdtWm1w85qbL7iYrc+CkCcbMcElE8y
	y1ln8UauAoeLMDQz9QM83T1rcmdaTq6BMiNDGEwZPm7MselA70QVobgPOlHjNzJw4q9c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhj7g-00081I-J1;
	Mon, 19 Jan 2026 06:52:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vhj7f-000813-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSlfgFGPfCbX6JZ0iz1hunpLIGPypEAYkYHGA8eZeXc=; b=Ug7QrfcLv93Di/QzwTehDDKb2B
 0m2nx/HZ5bFzvLCBlZcI2sb3xyqJtQR1kjCC7JMpMLE0MrxvTQ0IjKl3uJcyBqYEif8Kta9u182kZ
 CJNZYVbiIynEoM78AKBhIMLd8pi2uwGQj8CAv+iuMwsdYxmuO6+Q8l3IFC3vI6pvlslw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tSlfgFGPfCbX6JZ0iz1hunpLIGPypEAYkYHGA8eZeXc=; b=QUE70+toI+Bx4oycR23wsUo+FR
 7z39mFCdMGnTqJilRtZuTeLY04sbijlWeT4xIj4yMGh2yy5dJwiQsS9on70izh/zKSgndw5nVshsp
 7qkci8pMPc5FQbcw03Si6sPGChQWZwd4lbEcDtZPUB7+Df5jMYHzxghRzFVoM44SM290=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhj7f-0007qo-6O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:52:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B8DD9227A88; Mon, 19 Jan 2026 07:33:49 +0100 (CET)
Date: Mon, 19 Jan 2026 07:33:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260119063349.GA643@lst.de>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: While looking at fsverity I'd like to understand the choise
 of offset in ext4 and f2fs, and wonder about an issue. Both ext4 and f2fs
 round up the inode size to the next 64k boundary and place the metadata there.
 Both use the 65536 magic number for that instead of a well documented constant
 unfortunately. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vhj7f-0007qo-6O
Subject: [f2fs-dev] fsverity metadata offset,
 was: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF
 merkle tree
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org,
 tytso@mit.edu, linux-ext4@vger.kernel.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While looking at fsverity I'd like to understand the choise of offset
in ext4 and f2fs, and wonder about an issue.

Both ext4 and f2fs round up the inode size to the next 64k boundary
and place the metadata there.  Both use the 65536 magic number for that
instead of a well documented constant unfortunately.

I assume this was picked to align up to the largest reasonable page
size?  Unfortunately for that:

 a) not all architectures are reasonable.  As Darrick pointed out
    hexagon seems to support page size up to 1MiB.  While I don't know
    if they exist in real life, powerpc supports up to 256kiB pages,
    and I know they are used for real in various embedded settings
 b) with large folio support in the page cache, the folios used to
    map files can be much larger than the base page size, with all
    the same issues as a larger page size

So assuming that fsverity is trying to avoid the issue of a page/folio
that covers both data and fsverity metadata, how does it copy with that?
Do we need to disable fsverity on > 64k page size and disable large
folios on fsverity files?  The latter would mean writing back all cached
data first as well.

And going forward, should we have a v2 format that fixes this?  For that
we'd still need a maximum folio size of course.   And of course I'd like
to get all these things right from the start in XFS, while still being as
similar as possible to ext4/f2fs.

On Wed, Jan 14, 2026 at 10:53:00AM +0100, Andrey Albershteyn wrote:
> On 2026-01-14 09:20:34, Andrey Albershteyn wrote:
> > On 2026-01-13 22:15:36, Darrick J. Wong wrote:
> > > On Wed, Jan 14, 2026 at 05:00:47AM +0000, Matthew Wilcox wrote:
> > > > On Tue, Jan 13, 2026 at 07:45:47PM +0100, Andrey Albershteyn wrote:
> > > > > On 2026-01-13 16:36:44, Matthew Wilcox wrote:
> > > > > > On Mon, Jan 12, 2026 at 03:49:44PM +0100, Andrey Albershteyn wrote:
> > > > > > > The tree is read by iomap into page cache at offset 1 << 53. This is far
> > > > > > > enough to handle any supported file size.
> > > > > > 
> > > > > > What happens on 32-bit systems?  (I presume you mean "offset" as
> > > > > > "index", so this is 1 << 65 bytes on machines with a 4KiB page size)
> > > > > > 
> > > > > it's in bytes, yeah I missed 32-bit systems, I think I will try to
> > > > > convert this offset to something lower on 32-bit in iomap, as
> > > > > Darrick suggested.
> > > > 
> > > > Hm, we use all 32 bits of folio->index on 32-bit plaftorms.  That's
> > > > MAX_LFS_FILESIZE.  Are you proposing reducing that?
> > > > 
> > > > There are some other (performance) penalties to using 1<<53 as the lowest
> > > > index for metadata on 64-bit.  The radix tree is going to go quite high;
> > > > we use 6 bits at each level, so if you have a folio at 0 and a folio at
> > > > 1<<53, you'll have a tree of height 9 and use 17 nodes.
> > > > 
> > > > That's going to be a lot of extra cache misses when walking the XArray
> > > > to find any given folio.  Allowing the filesystem to decide where the
> > > > metadata starts for any given file really is an important optimisation.
> > > > Even if it starts at index 1<<29, you'll almost halve the number of
> > > > nodes needed.
> > 
> > Thanks for this overview!
> > 
> > > 
> > > 1<<53 is only the location of the fsverity metadata in the ondisk
> > > mapping.  For the incore mapping, in theory we could load the fsverity
> > > anywhere in the post-EOF part of the pagecache to save some bits.
> > > 
> > > roundup(i_size_read(), 1<<folio_max_order)) would work, right?
> > 
> > Then, there's probably no benefits to have ondisk mapping differ,
> > no?
> 
> oh, the fixed ondisk offset will help to not break if filesystem
> would be mounted by machine with different page size.
> 
> -- 
> - Andrey
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
