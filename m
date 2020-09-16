Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BEE26C77D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 20:28:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIcA4-0002DO-2I; Wed, 16 Sep 2020 18:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>)
 id 1kIcA2-0002DD-5E; Wed, 16 Sep 2020 18:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ENNAw7vteSaIBRfcKJsTENt7PmtS5uoFGz0clRqvvY=; b=By2GuAuxcEufkoZ9yq0IxG1GD2
 OHFOFZi6xYkoz4Ywjk7ufeYwtr12esgk0u0GyaNplHvr+0lNK/jUxFJg+uyRcayguq5+0ZOVxh4Yn
 myy8kDLwdsZv0zQBdszJc2pmjPOzXk/QlA3cQ8wqj/CRj2J46eF0i53qOC/C1bI3XQxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ENNAw7vteSaIBRfcKJsTENt7PmtS5uoFGz0clRqvvY=; b=kT7bPilfDDwW4OqNaPsma0jMMA
 B1pnJ1eMqbzSihq8SFPaP+Hgs80n7H3cm7HXN01F/XSusCzWZdS+zacRR4WkGWh1vHs3oO5aVjBrt
 2BCjRH2wFaQ2byiEeJLEe6DRx8dt1jv7lohi/fCMMKpGGwGiecNXWXnOeHDMuzzPoLDI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIc9x-00BkUt-VH; Wed, 16 Sep 2020 18:28:06 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37BA722208;
 Wed, 16 Sep 2020 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600280864;
 bh=8qlak/iJZ1weobruO4cvNi1WhYgt0OC+6iovuMs7szE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AprUEuZQ7/3taf12uhi7pHpICffnF/MiMUikckj/6bEyw1ldvY9YVR8uPSnE2o7Ab
 rqf84Nw0IPvGCvX3Z9U8gIkBsFHGMF/SQYTojHEP9zH7Ewkx2/fMmeJWmLc4oPmffC
 zCInOFKGiYQDzrft/0Y1uKrDkkbWlaA92OD/H6Ps=
Date: Wed, 16 Sep 2020 11:27:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200916182742.GB4373@sol.localdomain>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
 <20200916144618.GB16392@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916144618.GB16392@infradead.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIc9x-00BkUt-VH
Subject: Re: [f2fs-dev] [PATCH 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 16, 2020 at 03:46:18PM +0100, Christoph Hellwig wrote:
> On Wed, Sep 16, 2020 at 10:43:04AM -0400, Chris Mason wrote:
> > Otherwise we just end up with drift and kernel-specific bugs that are harder
> > to debug.  To the extent those APIs make us contort the kernel code, I???m
> > sure Nick is interested in improving things in both places.
> 
> Seriously, we do not care elsewhere.  Why would zlib be any different?
> 
> > There are probably 1000 constructive ways to have that conversation.  Please
> > choose one of those instead of being an asshole.
> 
> I think you are the asshole here by ignoring the practices we are using
> elsewhere and think your employers pet project is somehow special.  It
> is not, and claiming so is everything but constructive.
> 

The userspace Zstandard library is widely used and has been heavily reviewed,
tested, and fuzzed.

The options are either (a) write and maintain a separate kernel implementation
of Zstandard, or (b) periodically sync from upstream and make minimal, easily
reviewable changes to integrate with the kernel.

I don't see option (a) working for Zstandard.  For short and simple code, it's
the usual Linux kernel practice and it works fine.  But it's far too hard to
write and maintain a good implementation of Zstandard -- meaning correct, fast,
fully fuzzed, and supporting all needed compression levels.  Optimizing
compressors and decompressors is really hard.  A "naive" implementation wouldn't
be too hard, but it would be slow and wouldn't support high compression ratios.

Similarly, some of the crypto assembly code in the kernel is taken from the
OpenSSL project, since the kernel community doesn't have the capacity to
properly optimize algorithms like Poly1305 for x86, arm, arm64, mips, ...

If your main concern is about the camel case function naming, that doesn't seem
very important, relatively speaking.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
