Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB5D3B7DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 21:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge8kuzsDFh4/PMePHMayB9eI8a6LpVJpE9UT8b6yRs8=; b=D1E2KlXSwrdv3u4mje8OVCX+Dz
	PA+sMb56xqRbeEhvC+wwMibRCpVc3WKhi9GkqVlMrn4i+adwDscjyXEpY86mePs1uiQpPanJQrfxu
	aCqy8ohgvm/7puUqFJyHJg+ogFX5a7mfZSUMh4UBSV7zcIxA3LGsWRrbq8AGLL6fN0gQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhvQs-0006Ct-0l;
	Mon, 19 Jan 2026 20:01:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vhvQo-0006CX-IX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 20:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FRKiCSA7rKWJel5+3BbX0cg/N3+Hr+jXkHWboVk9B18=; b=AjRgYLyyVLWUJqVlLoIwm8pBkF
 w6ZnbSaS0jLy8lRxU9QcxYC/H+DnUtbFwy/mQrHZKPkLv+Y+PD16xSip1JwuikRaobpG63nupE1Rj
 L4tFLpqctavd0t7PV+smYwP7v/gHCRgmX892UviUwvGUYDCNLPD9MOKZkPWcN5Gmu/jM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FRKiCSA7rKWJel5+3BbX0cg/N3+Hr+jXkHWboVk9B18=; b=b7vGKGFtTeWD3fYpBGRTeyAM6M
 U/aekNM2hiI9SPbMk6CzTX3hnMK+xTiVSrJPt47wVn1VBoE//yethywjxSYeVrczjhgn8tngLoFv7
 ncIySnZlTAyejuWp+wwZkJoes+goLLmDCM9l6tXc3tMHA3XiFOfWcMTjZbpbtNtjx+60=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhvQo-0001F2-Fm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 20:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FRKiCSA7rKWJel5+3BbX0cg/N3+Hr+jXkHWboVk9B18=; b=PkKWgeLGDbX9229PwsBfHnNC6a
 ZROjbZ37Pu5RNnsaags+fn2KGYNRtGURT3Yq5twxJPoK5wMdWmchHOvhQlfZt1P20IV8EgAP/hx3G
 ti6u8FqNn8o9ukls4Okp+XGa60zPjLmljUjTpdwweu1/af3IsRxrczqc9kSR0s3pld+FYJUEbtt3o
 s+/pHjiU1na8EvCU77e7YSAW8VvnquMWFGWuaXgCYu6G8Cm5VG0gGhl9/e6xYDgjG4Arb3qs5HhnT
 dmD6zT7a0lOMeAfQjo+drREd0Aen4TUdsje40EyK1i4GHDjZTw9J0iiccD208K6+AltBGN0+JJr9A
 SN6zcziQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vhvQe-0000000DlZy-0U4y;
 Mon, 19 Jan 2026 20:00:48 +0000
Date: Mon, 19 Jan 2026 20:00:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aW6NbyQgCMnjkFZ8@casper.infradead.org>
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
X-Headers-End: 1vhvQo-0001F2-Fm
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
Cc: fsverity@lists.linux.dev, aalbersh@kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org, tytso@mit.edu,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
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

I don't think anybody will weep for lack of fsverity support in these
weirdo large PAGE_SIZE configurations.

> I don't think large folios are quite as problematic.
> ext4_read_merkle_tree_page() and f2fs_read_merkle_tree_page() read a
> folio and return the appropriate page in it, and fs/verity/verify.c
> operates on the page.  If it's a page in the folio that spans EOF, I
> think everything will actually still work, except userspace will be able
> to see Merkle tree data after a 64K boundary past EOF if the file is
> mmapped using huge pages.
> 
> The mmap issue isn't great, but I'm not sure how much it matters,
> especially when the zeroes do still go up to a 64K boundary.

We actually refuse to map pages after EOF.  See filemap_map_pages()

        if ((file_end >= folio_next_index(folio) || shmem_mapping(mapping)) &&
            filemap_map_pmd(vmf, folio, start_pgoff)) {
                ret = VM_FAULT_NOPAGE;
                goto out;
        }

along with the other treatment of end_pgoff.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
