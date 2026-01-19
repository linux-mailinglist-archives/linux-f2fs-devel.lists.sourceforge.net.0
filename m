Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D3D3B7D5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 20:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ye7L0r4H02I9TZCBTFT4WPhvBJnZ1lLhPtYsiAQk5p4=; b=WyopMaBdyslKZkbt8pDi4F2jjo
	6K6odtaV3j1fzNIPGMDqoe55C8nLuf5jPjBVtVkaAj7beY5Sc8w+NgmrqMIOoY0Ru7Bz5Y8o7AS3Z
	pcGZXEea0iPCOKAs4Oex/sQXKvLiLzgH5OrJ1J2FqrDgxjsrCr/VJbZqNW/Rkha7Ib+Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhvOO-0001gh-QV;
	Mon, 19 Jan 2026 19:58:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vhvON-0001gb-Qa
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 19:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slhpHFy2rqUWj+1P6J97RE33kt+IplTE/nLO0vXQElA=; b=gG3Iv7zOIVaiyN9Detvfz3qHdz
 r1yQhFWT7tsrs+fP+5Y5dEw17ygVtq7Ij+fNE5usiO2iDuLT6jU3TTAduTzLjnjitVq2Cp59QIADZ
 QnndlmG/uquoPQjDzgzRIg9YPQdgaJ2SJDWlKl0jeX1Uw8vdNOyzf38545ApA6fa/82k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slhpHFy2rqUWj+1P6J97RE33kt+IplTE/nLO0vXQElA=; b=H0hToCCXXKilUpaOn4fKY5vbVA
 hOr2ECNllPzXglLbvNmwRzaUVReEnqnYF4MHv0dQgwz0FsnIBQ+sXNWx7xjZJI+9rRqX7oU2/2mjQ
 AdwcvhfadWsJTYFRZvnQvwqL7XtZ4RfDspUksneCwBgKUpYMj60YKQpaFkpXhkhv5tkU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhvON-000186-4a for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 19:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB1E1442B3;
 Mon, 19 Jan 2026 19:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C41C116C6;
 Mon, 19 Jan 2026 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768852696;
 bh=ekOFZ1V/tiINPTPwNqibbQ8QbrvjFe8w7udiVRxxOpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=opDvoJ/BL/3HrZfozw1vZeKcO2AfiVX13r49Js/xnBacs6lr4J69698T5qbJFoPhF
 Hyquvzbftvy/unT3a0r1kjS6KNIgKv7cQKog+t4/oKmvO88Qmns5MDAyoVhCx/nt7G
 SGljfyFAEKsRfUkMW4C+U9oVuWWD8KTo1ibgj11x2nzHPjE3W7Wsum+qqMKkewExvi
 ckt9ZWbVueWQ9DxcFk2y+iL4TuQlVTaNsaf7z7mI5iDn4tofUa5zVp3Krc10rnpvFR
 wuUpIG34bLSpOJmi2Me11FYjEDGSlLfA7WN2BXNAMtELS/MunAAvCPK/Xvngs3kgiW
 bdFwpeWLWxW/g==
Date: Mon, 19 Jan 2026 11:58:16 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260119195816.GA15583@frogsfrogsfrogs>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de> <20260119193242.GB13800@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119193242.GB13800@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 11:32:42AM -0800, Eric Biggers wrote:
 > On Mon, Jan 19, 2026 at 07:33:49AM +0100, Christoph Hellwig wrote: > >
 While looking at fsverity I'd like to understand the choise of of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhvON-000186-4a
Subject: Re: [f2fs-dev] fsverity metadata offset,
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, aalbersh@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, david@fromorbit.com,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org,
 tytso@mit.edu, linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 11:32:42AM -0800, Eric Biggers wrote:
> On Mon, Jan 19, 2026 at 07:33:49AM +0100, Christoph Hellwig wrote:
> > While looking at fsverity I'd like to understand the choise of offset
> > in ext4 and f2fs, and wonder about an issue.
> > 
> > Both ext4 and f2fs round up the inode size to the next 64k boundary
> > and place the metadata there.  Both use the 65536 magic number for that
> > instead of a well documented constant unfortunately.
> > 
> > I assume this was picked to align up to the largest reasonable page
> > size?  Unfortunately for that:
> > 
> >  a) not all architectures are reasonable.  As Darrick pointed out
> >     hexagon seems to support page size up to 1MiB.  While I don't know
> >     if they exist in real life, powerpc supports up to 256kiB pages,
> >     and I know they are used for real in various embedded settings

They *did* way back in the day, I worked with some seekrit PPC440s early
in my career.  I don't know that any of them still exist, but the code
is still there...

> >  b) with large folio support in the page cache, the folios used to
> >     map files can be much larger than the base page size, with all
> >     the same issues as a larger page size
> > 
> > So assuming that fsverity is trying to avoid the issue of a page/folio
> > that covers both data and fsverity metadata, how does it copy with that?
> > Do we need to disable fsverity on > 64k page size and disable large
> > folios on fsverity files?  The latter would mean writing back all cached
> > data first as well.
> > 
> > And going forward, should we have a v2 format that fixes this?  For that
> > we'd still need a maximum folio size of course.   And of course I'd like
> > to get all these things right from the start in XFS, while still being as
> > similar as possible to ext4/f2fs.
> 
> Yes, if I recall correctly it was intended to be the "largest reasonable
> page size".  It looks like PAGE_SIZE > 65536 can't work as-is, so indeed
> we should disable fsverity support in that configuration.
> 
> I don't think large folios are quite as problematic.
> ext4_read_merkle_tree_page() and f2fs_read_merkle_tree_page() read a
> folio and return the appropriate page in it, and fs/verity/verify.c
> operates on the page.  If it's a page in the folio that spans EOF, I
> think everything will actually still work, except userspace will be able
> to see Merkle tree data after a 64K boundary past EOF if the file is
> mmapped using huge pages.

We don't allow mmapping file data beyond the EOF basepage, even if the
underlying folio is a large folio.  See generic/749, though recently
Kiryl Shutsemau tried to remove that restriction[1], until dchinner and
willy told him no.

> The mmap issue isn't great, but I'm not sure how much it matters,
> especially when the zeroes do still go up to a 64K boundary.

I'm concerned that post-eof zeroing of a 256k folio could accidentally
obliterate merkle tree content that was somehow previously loaded.
Though afaict from the existing codebases, none of them actually make
that mistake.

> If we do need to fix this, there are a couple things we could consider
> doing without changing the on-disk format in ext4 or f2fs: putting the
> data in the page cache at a different offset than it exists on-disk, or
> using "small" pages for EOF specifically.

I'd leave the ondisk offset as-is, but change the pagecache offset to
roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
file data and fsverity metadata completely separate.

> But yes, XFS should choose a larger alignment than 64K.

The roundup() formula above is what I'd choose for the pagecache offset
for xfs.  The ondisk offset of 1<<53 is ok with me.

--D

[1] https://lore.kernel.org/linux-fsdevel/20251014175214.GW6188@frogsfrogsfrogs/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
