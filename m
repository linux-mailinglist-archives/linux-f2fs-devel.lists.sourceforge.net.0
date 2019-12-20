Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1312743B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2019 04:52:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ii9LL-00040G-Iu; Fri, 20 Dec 2019 03:52:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ii9LK-000409-1j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 03:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgfZ86qt+iUj7jnLhv2n/rdbDcvzeSfTo5fnW58zsLo=; b=jCOOW8yFaPZ+lktb4H7Fj917jK
 ACF7z4pBpP23w0pieU0pGXt5a42p5alDOovRYLpaxzpK2y5wQ0N6InBq5MZm6/e8CR9tFSl2O2nan
 FKRGGJ9LJMNhu2T59sdKizgWuRy99xDeN2LJqw410d+6nSPhkg02KwvsqS8MLXVrXuYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rgfZ86qt+iUj7jnLhv2n/rdbDcvzeSfTo5fnW58zsLo=; b=FJWoV+OFD2D5U+wNW33oRX0G0z
 95rHoo+rH20OqpfbUh46RFEVIOYn7mmVs5K5/R32wpi5KPbyJ9TN8ElHsLm2ADLn65AbWhcc+sK+A
 sWQipUEQCNBm9nRObyONPIcA4raHO4BBA6FTw8NtQY3R2G1qHOL3HXz1G77kMfAh9WrQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ii9LI-008Dx3-OH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 03:52:45 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D677A24676;
 Fri, 20 Dec 2019 03:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576813959;
 bh=+1rZOJ+7YGgXyzuEyadBtswufhH8eKBcvvIK/5ZNDfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNXd7r0dbNYQXrn4m6q2F7iH6ZyG9RfuebAAQBSWQBSZkNOwCcuv1lOFyrSDHGAdD
 OLk1O9Ps/vEl1vGN0C0iEpW0X0bTi69Y57BOa2dWkpFgnufQ6YTgDxV2oS0vyoc5Me
 g7p/eFJ5xJXx0MDG5zhAjZxC4vSSD6zVVSiSbuCI=
Date: Thu, 19 Dec 2019 19:52:37 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20191220035237.GB718@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1fthhdttv.fsf@oracle.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ii9LI-008Dx3-OH
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-scsi@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 07:47:56PM -0500, Martin K. Petersen wrote:
> 
> Eric,
> 
> > There's not really any such thing as "use the bio integrity plumbing".
> > blk-integrity just does blk-integrity; it's not a plumbing layer that
> > allows other features to be supported.  Well, in theory we could
> > refactor and rename all the hooks to "blk-extra" and make them
> > delegate to either blk-integrity or blk-crypto, but I think that would
> > be overkill.
> 
> I certainly don't expect your crypto stuff to plug in without any
> modification to what we currently have. I'm just observing that the
> existing plumbing is designed to have pluggable functions that let
> filesystems attach additional information to bios on writes and process
> additional attached information on reads. And the block layer already
> handles slicing and dicing these attachments as the I/O traverses the
> stack.
> 
> There's also other stuff that probably won't be directly applicable or
> interesting for your use case. It just seems like identifying actual
> commonalities and differences would be worthwhile.
> 
> Note that substantial changes to the integrity code would inevitably
> lead to a lot of pain and suffering for me. So from that perspective I
> am very happy if you leave it alone. From an architectural viewpoint,
> however, it seems that there are more similarities than differences
> between crypto and integrity. And we should avoid duplication where
> possible. That's all.

There are some similarities, like both being optional features that need extra
per-bio information and hooks for bio merging, freeing, cloning, and advancing.

However, the nature of the per-bio information is very different.  Most of the
complexity in blk-integrity is around managing of a separate integrity
scatterlist for each bio, alongside the regular data scatterlist.

That's not something we need or want for inline encryption.  For each bio we
just need a key, algorithm, data unit number, and data unit size.  Since the
data unit number (IV) is automatically incremented for each sector and the
encryption is length-preserving, there's no per-sector data.

(Granted, from a crypto perspective ideally one would use authenticated
encryption, which does require per-sector data.  However, no one seems
interested in building hardware that supports it.  So for the forseeable future,
only length-preserving encryption is in scope for this.)

Also, blk-crypto actually transforms the data whereas blk-integrity does not.

> > What we could do, though, is say that at most one of blk-crypto and
> > blk-integrity can be used at once on a given bio, and put the
> > bi_integrity and bi_crypt_context pointers in union.  (That would
> > require allocating a REQ_INLINECRYPT bit so that we can tell what the
> > pointer points to.)
> 
> Absolutely. That's why it's a union. Putting your stuff there is a
> prerequisite as far as I'm concerned. No need to grow the bio when the
> two features are unlikely to coexist. We can revisit that later should
> the need arise.

There are some ways the two features could be supported simultaneously without
using more space, like making the pointer point to a linked list of tagged
structs, or making the struct contain both a bio_crypt_ctx and
bio_integrity_payload (or whichever combination is enabled in kconfig).

But it would be painful and I don't think people need this for now.  So if
people really aren't willing to accept the extra 8 bytes per bio even behind a
kconfig option, my vote is we that we put bi_crypt_context in the union with
bi_integrity, and add a flag REQ_INLINECRYPT (like REQ_INTEGRITY) that indicates
that the bi_crypt_context member of the union is valid.

We'd also need some error-handling to prevent the two features from actually
being used together.  It looks like there are several cases to consider.  One of
them is what happens if bio_crypt_set_ctx() is called when blk-integrity
verification or generation is enabled for the disk.  I suppose it could either
return an error, or we could make blk-crypto use the crypto API fallback
provided that it was modified to make the decryption stop relying on
->bi_crypt_context, which could be done by cloning the bio and using
->bi_private instead.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
