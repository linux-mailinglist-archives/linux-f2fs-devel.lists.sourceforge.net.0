Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDE3EE422
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 04:03:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFoS0-0002bM-UC; Tue, 17 Aug 2021 02:03:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mFoRz-0002b0-91
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 02:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AHrRqnZ+SnUHChQJmCz5ETv8w5JTM0+1adfZRu2Hf/4=; b=VjVHCXUuoVyGiCKT/vBaEILKH2
 i4VTh2LiZELmj1xJOZv4xwCCxcLdsrr1jfvb8y+iTIyDoXMjQGjM4Aor8SxFdyfWZnQ6gzjTP7ZxQ
 3YXuD9grzAsWH4icHInbQ8Od3JtfY+87xJYJEkTYYYYDXJwLOZK+iR/mB8hb1lScRwRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AHrRqnZ+SnUHChQJmCz5ETv8w5JTM0+1adfZRu2Hf/4=; b=b1tlf2MWXO/TdZmmA3skDzxFrt
 AUbuWKzyn5eqXn/bKNFIe1t6BY4bsdnkhf0KeVW342BZmYwWNSzYtlhhxaMN31slFbucQZlXTf32o
 aXIqyBx03K0HE+nVL4rxot0LTD+oP65gHMhl86TvTFLHYoTukLeK7xToytxYyzslu1vE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFoRx-000210-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 02:03:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B1DD60F4B;
 Tue, 17 Aug 2021 02:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629165803;
 bh=M4kPfTtv/YCNqqegGw5hhYfKzsIq9j0CDrkKB3eJQAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YHjQK8GsIwY+/8QKey2Ozcxv8CMsI7psHLUN/o2JVcJ3PCv+cyCLwnOKadOX5TwdR
 cZFxmFPTvirzcDCotfnIicTVoJsyOW6eVYJHBzid0TGlKjJZULVTLOHL1gmIbIwxGj
 lXHyAnfHDvY+8u5u07Qp4QCuhIVTUYyBCip+DSZiU1v216RhN+mlkTcG39yNtmLzSe
 /xavcGH4T0ABqmoE2MhSeuclyZ0AwumqhdK1kW/KIlAYLicwZ+4a92koP2uvsxy2Q5
 0CYD9vdnmZahKzFrYyUmV3f5fkrarm1i1WsbDrRwhETQ+c46eez/gA1j1W9AANQNv7
 9MPUo7vBMjuvg==
Date: Mon, 16 Aug 2021 19:03:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YRsY6dyHyaChkQ6n@gmail.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQidOD/zNB17fd9v@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mFoRx-000210-QZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 02, 2021 at 06:34:48PM -0700, Jaegeuk Kim wrote:
> On 08/03, Chao Yu wrote:
> > On 2021/8/3 2:23, Jaegeuk Kim wrote:
> > > On 08/02, Chao Yu wrote:
> > > > On 2021/8/2 12:39, Eric Biggers wrote:
> > > > > On Fri, Jul 30, 2021 at 10:46:16PM -0400, Theodore Ts'o wrote:
> > > > > > On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
> > > > > > > > Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> > > > > > > > they require preallocating blocks, but f2fs doesn't support unwritten
> > > > > > > > blocks and therefore has to preallocate the blocks as regular blocks.
> > > > > > > > f2fs has no way to reliably roll back such preallocations, so as a
> > > > > > > > result, f2fs will leak uninitialized blocks to users if a DIO write
> > > > > > > > doesn't fully complete.
> > > > > > 
> > > > > > There's another way of solving this problem which doesn't require
> > > > > > supporting unwritten blocks.  What a file system *could* do is to
> > > > > > allocate the blocks, but *not* update the on-disk data structures ---
> > > > > > so the allocation happens in memory only, so you know that the
> > > > > > physical blocks won't get used for another files, and then issue the
> > > > > > data block writes.  On the block I/O completion, trigger a workqueue
> > > > > > function which updates the on-disk metadata to assign physical blocks
> > > > > > to the inode.
> > > > > > 
> > > > > > That way if you crash before the data I/O has a chance to complete,
> > > > > > the on-disk logical block -> physical block map hasn't been updated
> > > > > > yet, and so you don't need to worry about leaking uninitialized blocks.
> > > > 
> > > > Thanks for your suggestion, I think it makes sense.
> > > > 
> > > > > > 
> > > > > > Cheers,
> > > > > > 
> > > > > > 					- Ted
> > > > > 
> > > > > Jaegeuk and Chao, any idea how feasible it would be for f2fs to do this?
> > > > 
> > > > Firstly, let's notice that below metadata will be touched during DIO
> > > > preallocation flow:
> > > > - log header
> > > > - sit bitmap/count
> > > > - free seg/sec bitmap/count
> > > > - dirty seg/sec bitmap/count
> > > > 
> > > > And there is one case we need to concern about is: checkpoint() can be
> > > > triggered randomly in between dio_preallocate() and dio_end_io(), we should
> > > > not persist any DIO preallocation related metadata during checkpoint(),
> > > > otherwise, sudden power-cut after the checkpoint will corrupt filesytem.
> > > > 
> > > > So it needs to well separate two kinds of metadata update:
> > > > a) belong to dio preallocation
> > > > b) the left one
> > > > 
> > > > After that, it will simply checkpoint() flow to just flush metadata b), for
> > > > other flow, like GC, data/node allocation, it needs to query/update metadata
> > > > after we combine metadata a) and b).
> > > > 
> > > > In addition, there is an existing in-memory log header framework in f2fs,
> > > > based on this fwk, it's very easy for us to add a new in-memory log header
> > > > for DIO preallocation.
> > > > 
> > > > So it seems feasible for me until now...
> > > > 
> > > > Jaegeuk, any other concerns about the implementation details?
> > > 
> > > Hmm, I'm still trying to deal with this as a corner case where the writes
> > > haven't completed due to an error. How about keeping the preallocated block
> > > offsets and releasing them if we get an error? Do we need to handle EIO right?
> > 
> > What about the case that CP + SPO following DIO preallocation? User will
> > encounter uninitialized block after recovery.
> 
> I think buffered writes as a workaround can expose the last unwritten block as
> well, if SPO happens right after block allocation. We may need to compromise
> at certain level?
> 

Freeing preallocated blocks on error would be better than nothing, although note
that the preallocated blocks may have filled an arbitrary sequence of holes --
so simply truncating past EOF would *not* be sufficient.

But really filesystems need to be designed to never expose uninitialized data,
even if I/O errors or a sudden power failure occurs.  It is unfortunate that
f2fs apparently wasn't designed with that goal in mind.

In any case, I don't think we can proceed with any other f2fs direct I/O
improvements until this data leakage bug can be solved one way or another.  If
my patch to remove support for allocating writes isn't acceptable and the
desired solution is going to require some more invasive f2fs surgery, are you or
Chao going to work on it?  I'm not sure there's much I can do here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
