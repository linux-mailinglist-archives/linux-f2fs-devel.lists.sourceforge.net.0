Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EE22E42B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 05:00:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jztN1-0005pO-AX; Mon, 27 Jul 2020 03:00:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jztMu-0005ot-Rw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 03:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTJGB/7iH701RDl2JA98y9P197+ITdReNQhOaAmmtEo=; b=a/b4tfU1jfehY7ag0Pwq3Saw9E
 L00F93kxd0qtDiU5I8D3k+Uc3HvSuNhuIOycYTHSbh3zA48Tdg2TuMRwLuqVAVGDmn+rHVjJw2UbY
 0fxn6A8qkZN7MtKfgo9bd6PSyPHkbPrQOLPNWfhYlNtGSpLD7GZ+WeSyUczQawftTvIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aTJGB/7iH701RDl2JA98y9P197+ITdReNQhOaAmmtEo=; b=Qo++ZtlW1lgGDzmOXHlkIkg6pE
 O84RJeQ+JBf7IhQxrjLSktsA1nYyO01nzTGmLZZwyifZTqtLmtoynBm/zO+2AkDUBNtp4SUuYAbtD
 7QDbJ+/vwRx4xeaxdKXAXWBuQtMX2rlHnZMr0CGieCi9GE+4ep5Nx9vRM/CUvysrq4Ns=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jztMs-003dM7-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 03:00:00 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D97E204EA;
 Mon, 27 Jul 2020 02:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595818788;
 bh=6VsbD9L/bKNxYlOOkshUhbWnCY7Jw3yGIZKV+/p6WHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROOfzvIfVMpRQEJLZWPEzo8LYx85Zxn/pM8XtRf/VRrr3VtRv3Pmx6tK7aXCfbSYf
 S6/eKyb1opVWxXT3i5ldAs/v3xtl6cBd5CypAS4gjNc/Ro1hbyvODZ/BE4WQcxbHXG
 mLrZESYgIHSRa9fIb2+MbwxjYjCjrPNEGC6Tfn+8=
Date: Sun, 26 Jul 2020 19:59:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200727025946.GA29423@sol.localdomain>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-2-satyat@google.com>
 <20200725001441.GQ2005@dread.disaster.area>
 <20200726024920.GB14321@sol.localdomain>
 <20200727005848.GV2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727005848.GV2005@dread.disaster.area>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jztMs-003dM7-Ec
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fscrypt: Add functions for direct I/O
 support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 27, 2020 at 10:58:48AM +1000, Dave Chinner wrote:
> On Sat, Jul 25, 2020 at 07:49:20PM -0700, Eric Biggers wrote:
> > On Sat, Jul 25, 2020 at 10:14:41AM +1000, Dave Chinner wrote:
> > > > +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> > > > +{
> > > > +	const struct inode *inode = file_inode(iocb->ki_filp);
> > > > +	const unsigned int blocksize = i_blocksize(inode);
> > > > +
> > > > +	/* If the file is unencrypted, no veto from us. */
> > > > +	if (!fscrypt_needs_contents_encryption(inode))
> > > > +		return true;
> > > > +
> > > > +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> > > > +	if (!fscrypt_inode_uses_inline_crypto(inode))
> > > > +		return false;
> > > > +
> > > > +	/*
> > > > +	 * Since the granularity of encryption is filesystem blocks, the I/O
> > > > +	 * must be block aligned -- not just disk sector aligned.
> > > > +	 */
> > > > +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> > > > +		return false;
> > > 
> > > Doesn't this force user buffers to be filesystem block size aligned,
> > > instead of 512 byte aligned as is typical for direct IO?
> > > 
> > > That's going to cause applications that work fine on normal
> > > filesystems becaues the memalign() buffers to 512 bytes or logical
> > > block device sector sizes (as per the open(2) man page) to fail on
> > > encrypted volumes, and it's not going to be obvious to users as to
> > > why this happens.
> > 
> > The status quo is that direct I/O on encrypted files falls back to buffered I/O.
> 
> Largely irrelevant.
> 
> You claimed in another thread that performance is a key feature that
> inline encryption + DIO provides. Now you're implying that failing
> to provide that performance doesn't really matter at all.
> 
> > So this patch is strictly an improvement; it's making direct I/O work in a case
> > where previously it didn't work.
> 
> Improvements still need to follow longstanding conventions. And,
> IMO, it's not an improvement if the feature results in 
> unpredictable performance for userspace applications.
> 
> i.e. there is no point in enabling direct IO if it is unpredictably
> going to fall back to the buffered IO path when applications are
> coded to the guidelines the man page said they should use. Such
> problems are an utter PITA to diagnose in the field, and on those
> grounds alone the current implementation gets a NACK.
> 
> > Note that there are lots of other cases where ext4 and f2fs fall back to
> > buffered I/O; see ext4_dio_supported() and f2fs_force_buffered_io().  So this
> > isn't a new problem.
> 
> No shit, sherlock. But that's also irrelevant to the discussion at
> hand - claiming "we can fall back to buffered IO" doesn't address
> the problem I've raised. It's just an excuse for not fixing it.

Actually we never specifically discussed the motivation for DIO on encrypted
files, but yes there are some specific applications that need it for performance
reasons (e.g., zram writeback to a loop device backed by an encrypted file), as
well as benchmarking applications.  These applications aren't expected to have
much trouble (if any) dealing with a fs blocksize alignment requirement.

We always try to make encrypted files behave just like unencrypted files, but
sometimes it's just not possible to do so.  We document the exceptions in
Documentation/filesystems/fscrypt.rst, which this patchset updates to document
the conditions for direct I/O working.  Note that these conditions include more
than just the alignment requirement.

The open() man page does mention that O_DIRECT I/O typically needs to be aligned
to logical_block_size; however it also says "In Linux alignment restrictions
vary by filesystem and kernel version and might be absent entirely."

The other examples of falling back to buffered I/O are relevant, since they show
that similar issues are already being dealt with in the (rare) use cases of
O_DIRECT.  So I don't think the convention is as strong as you think it is...

> Indeed, the problem is easy to fix - fscrypt only cares that the
> user IO offset and length is DUN aligned.  fscrypt does not care
> that the user memory buffer is filesystem block aligned - user
> memory buffer alignment is an underlying hardware DMA constraint -
> and so fscrypt_dio_supported() needs to relax or remove the user
> memroy buffer alignment constraint so that it follows existing
> conventions....

Relaxing the user buffer alignment requirement would mean that a single
encryption data unit could be discontiguous in memory.  I'm not sure that's
allowed -- it *might* be, but we'd have to verify it on every vendor's inline
encryption hardware, as well as handle this case in block/blk-crypto-fallback.c.
It's much easier to just require proper alignment.

Also, would relaxing the user buffer alignment really address your concern,
given that the file offset and length would still have to be fs-block aligned?
Applications might also align the offset and length to logical_block_size only.

So I don't see how this is "easy to fix" at all, other than by limiting direct
I/O support to data_unit_size == logical_block_size (which we could do for now
if it gets you to stop nacking the DIO patches, though I'm pretty sure that
restriction won't work for some people so would need to be re-visited later...).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
