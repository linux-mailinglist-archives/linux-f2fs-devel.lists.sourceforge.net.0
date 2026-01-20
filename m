Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFAD3C080
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 08:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qtz0dDQllWOGtQb/pp4g4Nhg+DDtafaYW1dYBIubcC0=; b=lPdGWH6Bq5w3PgnvZdtT6nUjKX
	U48rbFwvHQAqIT/FLg2v4bXN7L+pAmSBHbRyKV/ethzSxv/7J1iVYGl1sxROa/AyZ8vrsiPIH4p/x
	fFr9zz/1jyH6tFpwmYVXoM9pbNqSz7YXG/BZvPRH1Wv7ZRnR1/jO9vGIbMuNO8JD2c58=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi6E7-0004CA-Qy;
	Tue, 20 Jan 2026 07:32:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vi6E6-0004C3-BN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 07:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+cmV3yhsQRYGtB0FUejfAjTNNy8eNglXdUeEW+gc8LY=; b=NvXxSGvbD7WivO0u5ZxuH3Oafp
 W0gSRDyXtbKwzDafseFfDK5pc27a21TRyvrDHsHfYUZhQ5xQv7ng99e37u8NG1Jr90XAEdFcE3dZ/
 IwS1OnP1jJE9ucBrAm67AU4ZpP0nCHTd9I6n19PnNIddV5M3NNnPjc4iPaJ6pHZSCSZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+cmV3yhsQRYGtB0FUejfAjTNNy8eNglXdUeEW+gc8LY=; b=EvBfkSL/Kbl6Zqly2i13EAAIFI
 NybhdB8Ju/cLcYIjsDwuvNjMQ15truWL3MxXnFL0Rd10bvObuv+KDy+u8KYCYU29IsXt9Y31gOPbP
 6T0Kvx8DgCVsv9DO8Ij/wcdjE7e2btPailwHqi2d4VRiAhpgmp3U7X8ac6KCr645bRao=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi6E5-0007jM-Kp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 07:32:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B21F5227AA8; Tue, 20 Jan 2026 08:32:18 +0100 (CET)
Date: Tue, 20 Jan 2026 08:32:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260120073218.GA6757@lst.de>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de> <20260119193242.GB13800@sol>
 <20260119195816.GA15583@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119195816.GA15583@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong
 wrote: > > > a) not all architectures are reasonable. As Darrick pointed out
 > > > hexagon seems to support page size up to 1MiB. While I don' [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vi6E5-0007jM-Kp
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, aalbersh@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, david@fromorbit.com,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote:
> > >  a) not all architectures are reasonable.  As Darrick pointed out
> > >     hexagon seems to support page size up to 1MiB.  While I don't know
> > >     if they exist in real life, powerpc supports up to 256kiB pages,
> > >     and I know they are used for real in various embedded settings
> 
> They *did* way back in the day, I worked with some seekrit PPC440s early
> in my career.  I don't know that any of them still exist, but the code
> is still there...

Sorry, I meant I don't really know how real the hexagon large page
sizes are.  I know about the ppcs one personally, too.

> > If we do need to fix this, there are a couple things we could consider
> > doing without changing the on-disk format in ext4 or f2fs: putting the
> > data in the page cache at a different offset than it exists on-disk, or
> > using "small" pages for EOF specifically.
> 
> I'd leave the ondisk offset as-is, but change the pagecache offset to
> roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
> file data and fsverity metadata completely separate.

Can we find a way to do that in common code and make ext4 and f2fs do
the same?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
