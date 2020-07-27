Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9222F667
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 19:16:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k06jn-0007qK-Az; Mon, 27 Jul 2020 17:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k06jm-0007qE-K5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 17:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iPezfk9xfssaa9eUc2HLVC1zPwzKJ/lpVDtGaugFXLg=; b=SiBJTMwilM8Wha9z/EQxKJPkC2
 g/GqYvp0Z3jYZYOfbqfvSbbpEfUffV3nC48NCDf5KuIklFXaVNWi/tq/0O1GunjQYKhmNZLPc12W8
 C7h4cF5rm0fpJ1nZYM9Ug0/cSlmA7k/WrTxyxpZ2duQ7tZkNAtADAbQ7JnthOEeHwf38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iPezfk9xfssaa9eUc2HLVC1zPwzKJ/lpVDtGaugFXLg=; b=gsaprLWl+vQhSGGx6Z35sioqWk
 flIwzl1DOMtGO1D364ZpAm0XJHHpw0eoO4SdW47Bmuy6wILDa8sWYw0ytSIy3ficWT+P14//z443Q
 rUFHw7qRHfEAh9UTH1kPn5QQbPoozylfkF/6Y50z5h0X9L4auTpsWQSu8/Ry6+Icrocw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k06jl-004Gvu-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 17:16:30 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9042206E7;
 Mon, 27 Jul 2020 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595870176;
 bh=7UCQgSoiooCyBil8fOSJp8RobRWZr1sCpOea8qGPx3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xLeAxijvamdVYBWP2+Xvnj2jRciZbuOyQV+Kr2OvyHP74SUbz5bInn0yjxVioK8iA
 8RWxuGNDB39zHQEMFVvnNN+Y241XtQ8jBcC1cBB46iXnudHmAJqjUxgGzvnF30XsHK
 t5+RylcDIYaB/36yRNq39qkw5MkMKxUWNmCGlon4=
Date: Mon, 27 Jul 2020 10:16:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200727171615.GJ1138@sol.localdomain>
References: <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
 <20200723230345.GB870@sol.localdomain>
 <20200724013910.GH2005@dread.disaster.area>
 <20200724034628.GC870@sol.localdomain>
 <20200724053130.GO2005@dread.disaster.area>
 <20200724174132.GB819@sol.localdomain>
 <20200725234751.GR2005@dread.disaster.area>
 <20200726024211.GA14321@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726024211.GA14321@sol.localdomain>
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
X-Headers-End: 1k06jl-004Gvu-Bj
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

On Sat, Jul 25, 2020 at 07:42:11PM -0700, Eric Biggers wrote:
> > Exactly my point. Requiring infrastructure and storage layers to
> > obey completely new, undefined, undiscoverable, opaque and variable
> > definition of the block devices' "atomic unit of IO", then that's
> > simply a non-starter. That requires a complete re-architecture of
> > the block layers and how things interface and transmit information
> > through them. At minimum, high level IO alignment constraints must
> > be generic and not be hidden in context specific crypto structures.
> 
> Do you have any specific examples in mind of where *encrypted* I/O may broken at
> only a logical_block_size boundary?  Remember that encrypted I/O with a
> particular data_unit_size is only issued if the request_queue has declared that
> it supports encryption with that data_unit_size.  In the case of a layered
> device, that means that every layer would have to opt-into supporting encryption
> as well as the specific data_unit_size.
> 
> Also, the alignment requirement is already passed down the stack as part of the
> bio_crypt_ctx.  If there do turn out to be places that need to use it, we could
> easily define generic helper functions:
> 
> unsigned int bio_required_alignment(struct bio *bio)
> {
>         unsigned int alignmask = queue_logical_block_size(bio->bi_disk->queue) - 1;
> 
> #ifdef CONFIG_BLK_INLINE_ENCRYPTION
>         if (bio->bi_crypt_context)
>                 alignmask |= bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size - 1;
> #endif
> 
>         return alignmask + 1;
> }
> 
> unsigned int rq_required_alignment(struct request *rq)
> {
>         unsigned int alignmask = queue_logical_block_size(rq->q) - 1;
> 
> #ifdef CONFIG_BLK_INLINE_ENCRYPTION
>         if (rq->crypt_ctx)
>                 alignmask |= rq->crypt_ctx->bc_key->crypto_cfg.data_unit_size - 1;
> #endif
> 
>         return alignmask + 1;
> }
> 
> Sure, we could also add a new alignment_required field to struct bio and struct
> request, but it would be unnecessary since all the information is already there.
> 
> > > Is it your opinion that inline encryption should only be supported when
> > > data_unit_size <= logical_block_size?  The problems with that are
> > 
> > Pretty much.
> > 
> > >     (a) Using an unnecessarily small data_unit_size degrades performance a
> > > 	lot -- for *all* I/O, not just direct I/O.  This is because there are a
> > > 	lot more separate encryptions/decryptions to do, and there's a fixed
> > > 	overhead to each one (much of which is intrinsic in the crypto
> > > 	algorithms themselves, i.e. this isn't simply an implementation quirk).
> > 
> > Performance is irrelevant if correctness is not possible.
> > 
> 
> As far as I know, data_unit_size > logical_block_size is working for everyone
> who has used it so far.
> 
> So again, I'm curious if you have any specific examples in mind.  Is this a
> real-world problem, or just a theoretical case where (in the future) someone
> could declare support for some data_unit_size in their 'struct request_queue'
> (possibly for a layered device) without correctly handling alignment in all
> cases?
> 
> I do see that logical_block_size is used for discard, write_same, and zeroout.
> But that isn't encrypted I/O.
> 
> BTW, there might very well be hardware that *only* supports
> data_unit_size > logical_block_size.

I found get_max_io_size() in block/blk-merge.c.  I'll check if that needs to be
updated.

Let me know if you have any objection to the fscrypt inline encryption patches
*without direct I/O support* going into 5.9.  Note that fscrypt doesn't directly
care about this block layer stuff at all; instead it uses
blk_crypto_config_supported() to check whether inline encryption with the
specified (crypto_mode, data_unit_size, dun_bytes) combination is supported on
the filesystem's device(s).  Only then will fscrypt use inline encryption
instead of the traditional filesystem-layer encryption.

So if blk_crypto_config_supported() is saying that some crypto configuration is
supported when it isn't, then that's a bug in the blk-crypto patches that went
into the block layer in 5.8, which we need to fix there.  (Ideally by fixing any
cases where encrypted I/O may be split in the middle of a data unit.  But in the
worst case, we could easily make blk_crypto_config_supported() return false when
'data_unit_size > logical_block_size' for now.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
