Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684D22DB5E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jul 2020 04:42:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzWcO-0002ue-FA; Sun, 26 Jul 2020 02:42:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jzWcN-0002uX-97
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 02:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OTwWm7PxjRqLvKos4bTC0fkHc+WD4G+mAvQfE8yoBbc=; b=N2WpOWZ8RPvfOzfUkcVaJK8uI0
 y7LsBmgVXm3SWE49oQPqvcbyMZqJXBSTgJcKhM4Ha5vSi5khs0hTfVcXQAhi1EOu2p6pE3pNqHo/5
 MUXB3QBOWxR83qXlcVK/I/NIAZoPJMPZeObuKz+lrSY9Y9dWadKdM2D2PR7JUaEzoEcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OTwWm7PxjRqLvKos4bTC0fkHc+WD4G+mAvQfE8yoBbc=; b=UaeXVtgOD7OVVYBQ9GRTjmWUFn
 oZac3nudLbwLUSwcfklHlhrVdGnMLJ6J+yZ1hezSvDj6SR40k61iP3jhj/vKWdYJuJRUfbuJBxMJf
 2zA35x7jykPdm1BfHBvqpUXE50OtdalzbRMKtmOdGMMpRmkOV300NHjfP0XQm/yAXYFY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jzWcJ-00HMk5-Na
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 02:42:27 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F71C2053B;
 Sun, 26 Jul 2020 02:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595731333;
 bh=r6b24B5TP36DnaItn/ANfGK890hXU36em6nR4qXbsug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stX6VazfwisM+7xssrGWvic+5W8MtEBK1X6UcgnAJPWbofeHNfpOYYY7TUiOwhLEA
 HvKTjRFiEIv4bk1jD1lL+o4j5pTir0oWMSJ8zJ7htMZbCDsswkpBKDaLYGfRwSdLFq
 5DqGzXlLQdynTZOtjnvG+pAjC3t5K33igzuJnCWQ=
Date: Sat, 25 Jul 2020 19:42:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200726024211.GA14321@sol.localdomain>
References: <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
 <20200723230345.GB870@sol.localdomain>
 <20200724013910.GH2005@dread.disaster.area>
 <20200724034628.GC870@sol.localdomain>
 <20200724053130.GO2005@dread.disaster.area>
 <20200724174132.GB819@sol.localdomain>
 <20200725234751.GR2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725234751.GR2005@dread.disaster.area>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzWcJ-00HMk5-Na
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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

On Sun, Jul 26, 2020 at 09:47:51AM +1000, Dave Chinner wrote:
> > > > I think you're missing the point here.  Currently, the granularity of encryption
> > > > (a.k.a. "data unit size") is always filesystem blocks, so that's the minimum we
> > > > can directly read or write to an encrypted file.  This has nothing to do with
> > > > the IV wraparound case also being discussed.
> > > 
> > > So when you change the subject, please make it *really obvious* so
> > > that people don't think you are still talking about the same issue.
> > > 
> > > > For example, changing a single bit in the plaintext of a filesystem block may
> > > > result in the entire block's ciphertext changing.  (The exact behavior depends
> > > > on the cryptographic algorithm that is used.)
> > > > 
> > > > That's why this patchset makes ext4 only allow direct I/O on encrypted files if
> > > > the I/O is fully filesystem-block-aligned.  Note that this might be a more
> > > > strict alignment requirement than the bdev_logical_block_size().
> > > > 
> > > > As long as the iomap code only issues filesystem-block-aligned bios, *given
> > > > fully filesystem-block-aligned inputs*, we're fine.  That appears to be the case
> > > > currently.
> > > 
> > > The actual size and shape of the bios issued by direct IO (both old
> > > code and newer iomap code) is determined by the user supplied iov,
> > > the size of the biovec array allocated in the bio, and the IO
> > > constraints of the underlying hardware.  Hence direct IO does not
> > > guarantee alignment to anything larger than the underlying block
> > > device logical sector size because there's no guarantee when or
> > > where a bio will fill up.
> > > 
> > > To guarantee alignment of what ends up at the hardware, you have to
> > > set the block device parameters (e.g. logical sector size)
> > > appropriately all the way down the stack. You also need to ensure
> > > that the filesystem is correctly aligned on the block device so that
> > > filesystem blocks don't overlap things like RAID stripe boundaires,
> > > linear concat boundaries, etc.
> > > 
> > > IOWs, to constrain alignment in the IO path, you need to configure
> > > you system correct so that the information provided to iomap for IO
> > > alignment matches your requirements. This is not somethign iomap can
> > > do itself; everything from above needs to be constrained by the
> > > filesystem using iomap, everything sent below by iomap is
> > > constrained by the block device config.
> > 
> > That way of thinking about things doesn't entirely work for inline encryption.
> 
> Then the inline encryption design is flawed. Block devices tell the
> layers above what the minimum unit of atomic IO is via the logical
> block size of the device is. Everything above the block device
> assumes that it can align and size IO to this size, and the IO will
> succeed.
> 
> > Hardware can support multiple encryption "data unit sizes", some of which may be
> > larger than the logical block size.  (The data unit size is the granularity of
> > encryption.  E.g. if software selects data_unit_size=4096, then each invocation
> > of the encryption/decryption algorithm is passed 4096 bytes.  You can't then
> > later encrypt/decrypt just part of that; that's not how the algorithms work.)
> 
> I know what a DUN is. The problem here is that it's the unit of
> atomic IO the hardware supports when encryption is enabled....
> 
> > For example hardware might *in general* support addressing 512-byte sectors and
> > thus have logical_block_size=512.  But it could also support encryption data
> > unit sizes [512, 1024, 2048, 4096].  Encrypted I/O has to be aligned to the data
> > unit size, not just to the logical block size.  The data unit size to use, and
> > whether to use encryption or not, is decided on a per-I/O basis.
> 
> And that is the fundamental problem here: DUN > logical block size
> of the underlying device. i.e. The storage stack does not guarantee
> atomicity of such IOs.
> 
> If inline encryption increases the size of the atomic unit of IO,
> then the logical block size of the device must increase to match it.
> If you do that, then the iomap and storage layers will guarantee
> that IOs are *always* aligned to DUN boundaries.
> 
> > So in this case technically it's the filesystem (and later the
> > bio::bi_crypt_context which the filesystem sets) that knows about the alignment
> > needed -- *not* the request_queue.
> 
> Exactly my point. Requiring infrastructure and storage layers to
> obey completely new, undefined, undiscoverable, opaque and variable
> definition of the block devices' "atomic unit of IO", then that's
> simply a non-starter. That requires a complete re-architecture of
> the block layers and how things interface and transmit information
> through them. At minimum, high level IO alignment constraints must
> be generic and not be hidden in context specific crypto structures.

Do you have any specific examples in mind of where *encrypted* I/O may broken at
only a logical_block_size boundary?  Remember that encrypted I/O with a
particular data_unit_size is only issued if the request_queue has declared that
it supports encryption with that data_unit_size.  In the case of a layered
device, that means that every layer would have to opt-into supporting encryption
as well as the specific data_unit_size.

Also, the alignment requirement is already passed down the stack as part of the
bio_crypt_ctx.  If there do turn out to be places that need to use it, we could
easily define generic helper functions:

unsigned int bio_required_alignment(struct bio *bio)
{
        unsigned int alignmask = queue_logical_block_size(bio->bi_disk->queue) - 1;

#ifdef CONFIG_BLK_INLINE_ENCRYPTION
        if (bio->bi_crypt_context)
                alignmask |= bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size - 1;
#endif

        return alignmask + 1;
}

unsigned int rq_required_alignment(struct request *rq)
{
        unsigned int alignmask = queue_logical_block_size(rq->q) - 1;

#ifdef CONFIG_BLK_INLINE_ENCRYPTION
        if (rq->crypt_ctx)
                alignmask |= rq->crypt_ctx->bc_key->crypto_cfg.data_unit_size - 1;
#endif

        return alignmask + 1;
}

Sure, we could also add a new alignment_required field to struct bio and struct
request, but it would be unnecessary since all the information is already there.

> > Is it your opinion that inline encryption should only be supported when
> > data_unit_size <= logical_block_size?  The problems with that are
> 
> Pretty much.
> 
> >     (a) Using an unnecessarily small data_unit_size degrades performance a
> > 	lot -- for *all* I/O, not just direct I/O.  This is because there are a
> > 	lot more separate encryptions/decryptions to do, and there's a fixed
> > 	overhead to each one (much of which is intrinsic in the crypto
> > 	algorithms themselves, i.e. this isn't simply an implementation quirk).
> 
> Performance is irrelevant if correctness is not possible.
> 

As far as I know, data_unit_size > logical_block_size is working for everyone
who has used it so far.

So again, I'm curious if you have any specific examples in mind.  Is this a
real-world problem, or just a theoretical case where (in the future) someone
could declare support for some data_unit_size in their 'struct request_queue'
(possibly for a layered device) without correctly handling alignment in all
cases?

I do see that logical_block_size is used for discard, write_same, and zeroout.
But that isn't encrypted I/O.

BTW, there might very well be hardware that *only* supports
data_unit_size > logical_block_size.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
