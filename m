Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 413413DDF13
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Aug 2021 20:23:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAcbT-00027O-Gp; Mon, 02 Aug 2021 18:23:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mAcbS-00027E-Sk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 18:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jh7Izy7MicmYiiDyQiI89IoKXEJR7Xelni9tW0o21K0=; b=S662m1M8EIzQuKJFtKaWLKwg5u
 +hQGxFa6lDRskKiyPnZkMFNpvOPlrdoTiY/EBH5SSEiFj3soTYTQ1XDPg8bXzKE6FAg/gQWT8eaKs
 YVkgBYS5n2cD0y7YVzhvRirgX8oTfUzBmLFxgvb1VNEgReAyFaNwCs9egnA0khpOdP9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jh7Izy7MicmYiiDyQiI89IoKXEJR7Xelni9tW0o21K0=; b=ht72LVVn3+/A+tFQfL2DoB2Yve
 FhuAB/wQn6C6eG+vlVHugX74DPY5P7okRW3v6hT4tcBZgCNllAyrSaOS+19zMOuRRutTBFJNyhtp/
 m3Cq9u4eKcev+alZlkNiFgAFtqOtXtYusmQUe9jGqVI+Lts2GRXgBoRlSQpF7c5mrVqY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAcbN-00ATbd-LS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 18:23:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DA2060F36;
 Mon,  2 Aug 2021 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627928624;
 bh=fAaavI+s0werBnx4XNVTbI9DFm2vApq65CJQ2LMNvp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRANRutS3dB5fxLVFYYsufg2cjZtdG0nRrYoWpkrOqaOnmJfYlYNROYkC5nxp/wHG
 EtemQ4x/xJy0S5GcJjxptCEKk87mypINtgv3jj4dpyplr2hBcXlX6OSNBrshKiHWSX
 PRkoYa+c3RYNzGnycqE9UWG0Ysbhc/6oKuwrIUPpzrqW60u77+V3qEz6WgXVFrQ9sY
 I7Uni//GPetcNNjnFfubVF7mZ0Xz5wTzDO0iyKJBkaTjzxkk0+8HOKjMKE5VT1IlBM
 DEl9ZUz/a1kvjiuvsdvFJqxG+qYrqR/jxXuT2a873B949CuCMHe9qS8iXqeKArjLYt
 vB2r3oqdKRXuQ==
Date: Mon, 2 Aug 2021 11:23:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQg4Lukc2dXX3aJc@google.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAcbN-00ATbd-LS
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/02, Chao Yu wrote:
> On 2021/8/2 12:39, Eric Biggers wrote:
> > On Fri, Jul 30, 2021 at 10:46:16PM -0400, Theodore Ts'o wrote:
> > > On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
> > > > > Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> > > > > they require preallocating blocks, but f2fs doesn't support unwritten
> > > > > blocks and therefore has to preallocate the blocks as regular blocks.
> > > > > f2fs has no way to reliably roll back such preallocations, so as a
> > > > > result, f2fs will leak uninitialized blocks to users if a DIO write
> > > > > doesn't fully complete.
> > > 
> > > There's another way of solving this problem which doesn't require
> > > supporting unwritten blocks.  What a file system *could* do is to
> > > allocate the blocks, but *not* update the on-disk data structures ---
> > > so the allocation happens in memory only, so you know that the
> > > physical blocks won't get used for another files, and then issue the
> > > data block writes.  On the block I/O completion, trigger a workqueue
> > > function which updates the on-disk metadata to assign physical blocks
> > > to the inode.
> > > 
> > > That way if you crash before the data I/O has a chance to complete,
> > > the on-disk logical block -> physical block map hasn't been updated
> > > yet, and so you don't need to worry about leaking uninitialized blocks.
> 
> Thanks for your suggestion, I think it makes sense.
> 
> > > 
> > > Cheers,
> > > 
> > > 					- Ted
> > 
> > Jaegeuk and Chao, any idea how feasible it would be for f2fs to do this?
> 
> Firstly, let's notice that below metadata will be touched during DIO
> preallocation flow:
> - log header
> - sit bitmap/count
> - free seg/sec bitmap/count
> - dirty seg/sec bitmap/count
> 
> And there is one case we need to concern about is: checkpoint() can be
> triggered randomly in between dio_preallocate() and dio_end_io(), we should
> not persist any DIO preallocation related metadata during checkpoint(),
> otherwise, sudden power-cut after the checkpoint will corrupt filesytem.
> 
> So it needs to well separate two kinds of metadata update:
> a) belong to dio preallocation
> b) the left one
> 
> After that, it will simply checkpoint() flow to just flush metadata b), for
> other flow, like GC, data/node allocation, it needs to query/update metadata
> after we combine metadata a) and b).
> 
> In addition, there is an existing in-memory log header framework in f2fs,
> based on this fwk, it's very easy for us to add a new in-memory log header
> for DIO preallocation.
> 
> So it seems feasible for me until now...
> 
> Jaegeuk, any other concerns about the implementation details?

Hmm, I'm still trying to deal with this as a corner case where the writes
haven't completed due to an error. How about keeping the preallocated block
offsets and releasing them if we get an error? Do we need to handle EIO right?

> 
> Thanks,
> 
> > 
> > - Eric
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
