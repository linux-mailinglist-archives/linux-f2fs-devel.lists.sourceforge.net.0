Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED63DC0EE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 00:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9ar7-00062n-79; Fri, 30 Jul 2021 22:19:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m9ar5-00062b-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YStP4IybFMAIIzs9BdBzBhLowyjk+qJliMtZZlo9feo=; b=W+fcTExivfeWG0XLvg34j/h2qH
 6MnnS38EX2Al6FkLKktyLo6NaX9ZyrA6VAuy0xnDwzq+tjbTnEBDlQOvxEpNtxHvk6iiPjMhy+f1X
 tZZx6Qhmeuoy/XDkw89gTpUttedYn5NUavkw40M8XetIi54bQzs7o1UYe80Pbci0wGe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YStP4IybFMAIIzs9BdBzBhLowyjk+qJliMtZZlo9feo=; b=bABzm+hBQIiID+ML6AC6DzdIYO
 BRFTgFoakOgli8N7G6TGTRjb8cTpNR8+QCnBnxC9f2rtq/eG74MCiYtvjZoSoNcCXpVx7QG192mkk
 cO7lnpkjX+nH4tZYX6C91p+HrJvEpUhSMFtJfyAY3oNBrXPUlblquMrXllzhiXgjOsEg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9ar3-0088r5-IY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:19:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63BE76103B;
 Fri, 30 Jul 2021 22:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627683574;
 bh=4VKfcpb8qAKuyVWq8IH8w3NNv3+Ftr3X6OmmhKffEVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0xvD9yioLv4AFX/uD/lZJ760hM93+P+CYC30btjoU30gqtw+qyTljeGiL5mP7HHv
 ZDhIRzciAJRIrmlHbjhk75Eemzb1Rr+OV4LaHsWzegR4DsOKTvBhL84LHDfh9QReRq
 h5LXDFYsBIkORSwT1K4y2aAB6EItuzcDeXj1F2TRMQZSV9JR4hYFCQJyHctba5Pae8
 m8SnKau/s2urdMWcUDEGKngkUbIXQ4vV0KTVN2R/bVGcpdt0so+BBJwKT6vT/qRY06
 JsI1Q8Mod8JJJVHR8NoLcGQ/8lFedbjb5vltZq4MGfAz3PMoOIUwRU8sO4wMip6qFp
 BrOazGH7Ed+8Q==
Date: Fri, 30 Jul 2021 15:19:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YQR69fzcv2vkgtfT@gmail.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQR5P6aMxhOL+6os@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQR5P6aMxhOL+6os@google.com>
X-Spam-Score: -0.5 (/)
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
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9ar3-0088r5-IY
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
Cc: linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 30, 2021 at 03:12:15PM -0700, Jaegeuk Kim wrote:
> On 07/30, Eric Biggers wrote:
> > On Tue, Jul 27, 2021 at 06:51:54PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> > > they require preallocating blocks, but f2fs doesn't support unwritten
> > > blocks and therefore has to preallocate the blocks as regular blocks.
> > > f2fs has no way to reliably roll back such preallocations, so as a
> 
> Hmm, I'm still wondering why this becomes a problem. And, do we really need
> to roll back the preallocated blocks?
> 
> > > result, f2fs will leak uninitialized blocks to users if a DIO write
> > > doesn't fully complete.  This can be easily reproduced by issuing a DIO
> > > write that will fail due to misalignment, e.g.:
> 
> If there's any error, truncating blocks having NEW_ADDR could address this?
> 

My understanding is that the "NEW_ADDR" block address in f2fs means that space
was reserved for the block, but not allocated in any particular place yet.
Buffered writes reserve blocks in this way, but DIO writes cannot because DIO by
definition has to directly write to a specific on-disk location.  Therefore DIO
writes require that the blocks be preallocated for real.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
