Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103922E509
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 06:48:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzv3e-0001xc-88; Mon, 27 Jul 2020 04:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jzv3d-0001xR-6t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 04:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N8J+sL6jWif7tvjoO72D7IPhACdulJbG2T6gb8CycyI=; b=TSWo/g3BKHFYgkvIBTujvy6T9c
 HI8zQQa4gVpspWtqu9XB3F6J65Lcll4b7xHnCEtgak/lQXvSScdKzz0Z92vuvOPnIUO3EN7LEsu13
 uA/u5U7tFPng6XoQVSjJNm/RMUicJ565sBWWEiF03qN0wPDe3s+Y4jSLlSVaHOPU6FmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N8J+sL6jWif7tvjoO72D7IPhACdulJbG2T6gb8CycyI=; b=T0weTo1lzeX/uI+OSTLaAca3Ho
 vTAJNsafK71T3HbNa0sGEPigrvO3IFJLPB6hOVpmTUWqKlLkdf+IKLLLOuyINDR7iZw8/2YeypOt1
 pFQxDSV7G2RcitHRUC+8gsNWWrOd4NS5v77vDwNeD5CQKBIJ9KYFwxFMVdLuy8JSXB58=;
Received: from mail107.syd.optusnet.com.au ([211.29.132.53])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jzv3Z-000hM6-JA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 04:48:13 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail107.syd.optusnet.com.au (Postfix) with ESMTPS id 7068DD59195;
 Mon, 27 Jul 2020 14:48:00 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jzv3P-00033X-NQ; Mon, 27 Jul 2020 14:47:59 +1000
Date: Mon, 27 Jul 2020 14:47:59 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200727044759.GW2005@dread.disaster.area>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-2-satyat@google.com>
 <20200725001441.GQ2005@dread.disaster.area>
 <20200726024920.GB14321@sol.localdomain>
 <20200727005848.GV2005@dread.disaster.area>
 <20200727025946.GA29423@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727025946.GA29423@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LPwYv6e9 c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=7-415B0cAAAA:8
 a=hGWPmbNMGIjduZ9LLWoA:9 a=k7L_gtguLKiKTEZi:21 a=q013nmwojBxNOK_j:21
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzv3Z-000hM6-JA
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

On Sun, Jul 26, 2020 at 07:59:46PM -0700, Eric Biggers wrote:
> On Mon, Jul 27, 2020 at 10:58:48AM +1000, Dave Chinner wrote:
> > On Sat, Jul 25, 2020 at 07:49:20PM -0700, Eric Biggers wrote:
> > > On Sat, Jul 25, 2020 at 10:14:41AM +1000, Dave Chinner wrote:
> > > > > +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> > > > > +{
> > > > > +	const struct inode *inode = file_inode(iocb->ki_filp);
> > > > > +	const unsigned int blocksize = i_blocksize(inode);
> > > > > +
> > > > > +	/* If the file is unencrypted, no veto from us. */
> > > > > +	if (!fscrypt_needs_contents_encryption(inode))
> > > > > +		return true;
> > > > > +
> > > > > +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> > > > > +	if (!fscrypt_inode_uses_inline_crypto(inode))
> > > > > +		return false;
> > > > > +
> > > > > +	/*
> > > > > +	 * Since the granularity of encryption is filesystem blocks, the I/O
> > > > > +	 * must be block aligned -- not just disk sector aligned.
> > > > > +	 */
> > > > > +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> > > > > +		return false;
> > > > 
> > > > Doesn't this force user buffers to be filesystem block size aligned,
> > > > instead of 512 byte aligned as is typical for direct IO?
> > > > 
> > > > That's going to cause applications that work fine on normal
> > > > filesystems becaues the memalign() buffers to 512 bytes or logical
> > > > block device sector sizes (as per the open(2) man page) to fail on
> > > > encrypted volumes, and it's not going to be obvious to users as to
> > > > why this happens.
> > > 
> > > The status quo is that direct I/O on encrypted files falls back to buffered I/O.
> > 
> > Largely irrelevant.
> > 
> > You claimed in another thread that performance is a key feature that
> > inline encryption + DIO provides. Now you're implying that failing
> > to provide that performance doesn't really matter at all.
> > 
> > > So this patch is strictly an improvement; it's making direct I/O work in a case
> > > where previously it didn't work.
> > 
> > Improvements still need to follow longstanding conventions. And,
> > IMO, it's not an improvement if the feature results in 
> > unpredictable performance for userspace applications.
.....

> The open() man page does mention that O_DIRECT I/O typically needs to be aligned
> to logical_block_size; however it also says "In Linux alignment restrictions
> vary by filesystem and kernel version and might be absent entirely."

Now you are just language-laywering. I'll quote from the next
paragraph in the man page:

	"Since Linux 2.6.0, alignment to the logical block size of
	the underlying storage (typically 512 bytes) suffices. The
	logi cal block size can be determined using the ioctl(2)
	BLKSSZGET operation [...]"

There's the longstanding convention I've been talking about, clearly
splet out. Applications that follow this convention (and there are
lots) should just work. Having code that works correctly on one file
but not on another -on the same filesystem- despite doing all the
right things is not at all user friendly.

What I really care about is that new functionality works without
requiring applications to be rewritten to cater specifically for
some whacky foilble in a new feature.

fscrypt is generic functionality and hardware acceleration of crypt
functions are only going to get more common in future. Hence the
combination of the two needs to *play nicely* with the vast library
of existing userspace software that is already out there.

We need to get this stuff correct right from the start, otherwise
we're just leaving a huge mountain of technical debt for our future
selfs to have to clean up.

> The other examples of falling back to buffered I/O are relevant, since they show
> that similar issues are already being dealt with in the (rare) use cases of
> O_DIRECT.  So I don't think the convention is as strong as you think it is...

The convention is there so that applications that *expect* to be
using direct IO can do so -reliably-. Breaking conventions that
people have become accustomed to just because it is convenient for
you is pretty damn selfish act.

> > Indeed, the problem is easy to fix - fscrypt only cares that the
> > user IO offset and length is DUN aligned.  fscrypt does not care
> > that the user memory buffer is filesystem block aligned - user
> > memory buffer alignment is an underlying hardware DMA constraint -
> > and so fscrypt_dio_supported() needs to relax or remove the user
> > memroy buffer alignment constraint so that it follows existing
> > conventions....
> 
> Relaxing the user buffer alignment requirement would mean that a single
> encryption data unit could be discontiguous in memory. I'm not sure that's
> allowed -- it *might* be, but we'd have to verify it on every vendor's inline
> encryption hardware, as well as handle this case in block/blk-crypto-fallback.c.
> It's much easier to just require proper alignment.

If the hardware can't handle logical block size aligned DMA
addresses for any operation they might be are asked to perform, then
the hardware has not specified it's blk_queue_logical_block_size()
correctly. This is not something the fscrypt layer should be trying
to enforce - that's a massive layering violation.

Seriously, if the hardware can't support discontiguous memory
addresses for critical operations, then it needs to tell the rest of
the IO stack about these limitations that so that the higher layers
will either align things correctly or bounce buffer IOs that aren't
memory aligned properly.

> Also, would relaxing the user buffer alignment really address your concern,
> given that the file offset and length would still have to be fs-block aligned?

Isn't that exactly what I just suggested you do?

> Applications might also align the offset and length to logical_block_size only.

And so fscrypt_dio_supported() rejects them if they they don't align
to the DUN requirements of fscrypt. That's the only -fscrypt
specific restriction- on direct IO.

> So I don't see how this is "easy to fix" at all, other than by limiting direct
> I/O support to data_unit_size == logical_block_size (which we could do for now
> if it gets you to stop nacking the DIO patches,

I'm saying now because I think these things need to be fixed before
the code gets merged, not because I think they are easy to fix.

I'm just asking you layer your checks the way the rest of the
storage stack does them (i.e. user data IO constraints applied at
the fscrypt level, DMA address requirements propagate up from the
hardware) so that they behave as existing applications expect them
to.

i.e. if crypted data requires contiguous memory for the DMA, then
usrespace needs to be told that via BLKSSZGET. Filesystem mkfs apps
need to be told this so they can set up their internal block sizes
and alignments correctly. Everything that issues IO to the storage
needs to know this.

> though I'm pretty sure that
> restriction won't work for some people so would need to be re-visited later...).

That's entirely my point. You need to fix the architectural flaws
right now so we don't have to deal with trying to fix them in future
when we are limited by constraints such as "thou shalt not break
userspace"....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
