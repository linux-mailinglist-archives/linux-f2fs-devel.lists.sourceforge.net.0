Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55035FAC1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Apr 2021 20:35:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWkMS-0000hH-Jc; Wed, 14 Apr 2021 18:35:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>)
 id 1lWkMR-0000gy-6N; Wed, 14 Apr 2021 18:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mrIomPVYUMuAckRC4+qq6ynMRuVw3KbxPB+ANTBSFNk=; b=UZQBkSYqZrl8qmTnu9kS8edvtW
 nGqGq8i4xzmgM4nHRMnowQ3H54kAinSN+4oYC9EpUE0Wqp6+9rJ4whevR1qHpPSxTVR+/fGgns5ar
 YymoTReEjghP1s8vqJBvRCwiNWvXac4os32/QhEkMwh7mfsxI79C3TNuvd2IaV7gI7ss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mrIomPVYUMuAckRC4+qq6ynMRuVw3KbxPB+ANTBSFNk=; b=RC5UIkyiBw8JWc/ycH4nsHiJ+y
 NoD5eArqf9gC++qDMLVfnX9Q9ZpV/2ccdp2QutP+R5GZEjapQEDDzSeTdD7enNQhCPz8S/Gtzowuv
 etRWE+2g4shVIJVxquCAWPOLxga2PequaO238ag4+JKnyR6X9nx9v1aaZnxs/f2J2h3Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lWkMP-0006n4-F6; Wed, 14 Apr 2021 18:35:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74AAE61131;
 Wed, 14 Apr 2021 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618425323;
 bh=lzR8WlTx9NeavpRLEGESjSFqtohhbfUn3GpyluskFDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ULSIl11+GjxuP+oKZFolsYNThiCyEGN64HnLfll6nqCuLk2ssqR1aZ+4/YEr6NBwb
 nAC4+rdEyw7sv6/SrtDr+zvtiviyB2PFgmmOXR/fvEOyg994MPKVd3NM+MUi4IZKA+
 rHoNgGS9ldz1Y+9Vp/OpHGDmh9Mx2IY9wRgGnFQoqBYYEJ+axduqsMszyrCg4Z3gF3
 0ovICWzsNaQjLNLBDgZeJga7eTNT3XhhjjsGhxi/RfGZDKiGI3Wbl5vyptKqRpuZRK
 NH86GSrDDV8UPGcLpOHWDtFhBxQHHHh9d7REx8wHN7rC01XVGW8wZYAQZeyxAipv0E
 eniq23B+fe37A==
Date: Wed, 14 Apr 2021 11:35:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <YHc16rz4Y/PkzNH1@gmail.com>
References: <20210330225112.496213-1-nickrterrell@gmail.com>
 <CANr2DbfL2B5Tx+k1AwVh-5dQZ+fNpucJKu9QVQat7QVvK-5AbQ@mail.gmail.com>
 <CANr2DbfZ+fV+GN7CfDi1AFmfsdnX+kGnTA6kayEchtGwfoAE-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANr2DbfZ+fV+GN7CfDi1AFmfsdnX+kGnTA6kayEchtGwfoAE-A@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lWkMP-0006n4-F6
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v9 0/3] Update to zstd-1.4.10
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
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Petr Malat <oss@malat.biz>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 14, 2021 at 11:01:29AM -0700, Nick Terrell wrote:
> Hi all,
> 
> I would really like to make some progress on this and get it merged.
> This patchset offsers:
> * 15-30% better decompression speed
> * 3 years of zstd bug fixes and code improvements
> * Allows us to import zstd directly from upstream so we don't fall 3
> years out of date again
> 
> Thanks,
> Nick
> 

I think it would help get it merged if someone actually volunteered to maintain
it.  As-is there is no entry in MAINTAINERS for this code.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
