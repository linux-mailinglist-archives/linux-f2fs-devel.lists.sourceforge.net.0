Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E222A2E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 01:13:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyNvC-00085s-J7; Wed, 22 Jul 2020 23:13:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jyNvB-00085l-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zjsTvegCAnRTKuHtvRNxydKnJbRp01HdLAKD+yf1En4=; b=ImQf00zz+tgcvVcUENqoJ8O7ID
 nyACFygnTX04fpmIdxTv0xUgYSZQjPd6rfPr+qmiNvXYSnRSFiyxsBH75lQPqimgfXUEXt6kCl64f
 EVOs6DXAqrZrqNweFAjyDnrZ4p74bT6ODYbbEnIQr6E4ilZYzW5yIjkwrTPa9WAL7IO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zjsTvegCAnRTKuHtvRNxydKnJbRp01HdLAKD+yf1En4=; b=LIQfVzm3y9WZTaIBxovqR9EUcO
 ww7UwzsG2UQlNDpg2yTZ77NsTzmkDmDynyHswM0PutIdfvCGWCSHnyAC4JVUPKsOQlR1tqT/rmV0D
 9rj4ABiVQ1hvKiWLcbHj4ym2aZKWyl0yW5dB9reRWp29EH0tBbLhAcEpozU2CeUHcOC4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyNv7-005T8Z-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:13:09 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CEF92071A;
 Wed, 22 Jul 2020 23:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595459580;
 bh=HEvt8lyCEN3ZmLCF1F3YI7aqWFAeXTGaHSadk319KrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOcLVkNzY1Ih1PYGRteI/48NgDjzPpJqhAiy3Bm1rKFbQ0/Ap0D+Keuc67pI0xPfH
 WtJquG4oOQM+/LW67fiuUTw1FSgP5jMtxtE4E30+47Xas9p2xkDjq/33ONaWvi6f+a
 qjZUV7jHG81quN/uhS1slSRH/l6c+hJF2U2ijJTg=
Date: Wed, 22 Jul 2020 16:12:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200722231258.GA83434@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200722224407.GR15516@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722224407.GR15516@casper.infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyNv7-005T8Z-Pn
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
Cc: Satya Tangirala <satyat@google.com>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 11:44:07PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> > > Which means you are now placing a new constraint on this code in
> > > that we cannot ever, in future, zero entire blocks here.
> > > 
> > > This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
> > > blocks if necessary - so I think constraining it to only support
> > > partial block zeroing by adding a warning like this is no correct.
> > 
> > In v3 and earlier this instead had the code to set an encryption context:
> > 
> > 	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> > 				  GFP_KERNEL);
> > 
> > Would you prefer that, even though the call to fscrypt_set_bio_crypt_ctx() would
> > always be a no-op currently (since for now, iomap_dio_zero() will never be
> > called with an encrypted file) and thus wouldn't be properly tested?
> > 
> > BTW, iomap_dio_zero() is actually limited to one page, so it's not quite
> > "arbitrary sizes".
> 
> I have a patch for that
> 
> http://git.infradead.org/users/willy/pagecache.git/commitdiff/1a4d72a890ca9c2ea3d244a6153511ae674ce1d8

No you don't :-)  Your patch is for iomap_zero_range() in
fs/iomap/buffered-io.c.  It doesn't touch fs/iomap/direct-io.c which is what
we're talking about here.

> It's not going to cause a problem for crossing a 2^32 boundary because
> pages are naturally aligned and don't get that big.

Well, the boundary can actually occur at any block.  But it's not relevant here
because (a) fs/iomap/buffered-io.c doesn't yet support encryption anyway, since
neither ext4 nor f2fs use it; and (b) iomap_zero_range() just writes to the
pagecache, and the bios aren't actually issued until ->writepages().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
