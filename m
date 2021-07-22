Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B98033D2789
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 18:26:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6bWv-0003iJ-TM; Thu, 22 Jul 2021 16:26:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6bWt-0003hu-Vp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=839kT4LEdcU/8TNBptpAK5PcP9WbBjnX3dzgxR5SBtE=; b=ZArvOGiD9wmOkgoDrs18S8ilfz
 bDzP5p5H8nCqwOxm8D75Qn5pMmmheJj6/x2E9efcx4k7RKVI9bLNOdOEuThrhwDCKakYDQZcYsdKm
 2Ds3m1EMKFB9pc13XSpYFgWwAzPKMWwdPs6yh6fDG1AQy7n6HcxuPiWhdO1fXzBBkjZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=839kT4LEdcU/8TNBptpAK5PcP9WbBjnX3dzgxR5SBtE=; b=djAevB7Ab8ujg6sK+Qu3bmwD3G
 SyyvSdYnPZUKNc5GJFwA1ewuXw0rpZREWjQ2ITwewUc9dQiyeIXhLmREZK+UAuLeGSLeyj0X37nP7
 7PQb/OGG/tZCOORjWUA6g/tB5oB0h8KjyjG0socxyKlcqtHxZ0wE5+1Z6Pvr6by1xKuE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6bWr-0000KU-NF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:26:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB1336128A;
 Thu, 22 Jul 2021 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626971188;
 bh=ReSngzQRM1EVd4PbtxVwN7rJBYPrOKyD3MGXTwtpE7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LosXpKjFdRxdnNlHBT1UswL6mBDpPzZObuDygaalVy3lk/XEJPPrYCtGFCBGuy0Ke
 DbKmBfJcvO9PKfkUzusrawom/8CPj/YeK/HU8tCI3ku+cR3T7bqFTLtKeKMtL9qxqP
 jnp4MIRFD9Qg5GE7TIIbC7fVB7hq/Wk1Om3oXNZAhTMTWoWv6DmpkCurIHauDhMdAL
 kDzDGQGQKDl3bMwwdASUFIf8HnWBU3NSV/zLsb0DiS+2kGDlUoBCOf32a3V2P00ZmH
 VJGgYJGOi0t15iF83EVDEMV9nUIAfujInN02GuBZYXV69lLG6WRGF0YDy3b2lec2vf
 VxGSTRtJ0KbXw==
Date: Thu, 22 Jul 2021 09:26:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPmcMpbv3kxSZOs8@gmail.com>
References: <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
 <CACOAw_yfG494AK=XH_xzeTDWn-a1mYF+537=VTT6oX6RgLGxnw@mail.gmail.com>
 <YPmB8etJZ+vN0fDT@gmail.com>
 <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
 <YPmaMFlR6/tJTmpQ@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPmaMFlR6/tJTmpQ@gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6bWr-0000KU-NF
Subject: Re: [f2fs-dev] [PATCH] f2fs: change fiemap way in printing
 compression chunk
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 09:17:54AM -0700, Eric Biggers wrote:
> > I think it matches with FIEMAP_EXTENT_UNWRITTEN. Otherwise, we should
> > shorten the last extent like below.
> > 
> >         fe_logical=0    fe_physical=16384  length=4096
> >         fe_logical=4096 fe_physical=81920  length=4096
> >         fe_logical=8192 fe_physical=147456 length=4096
> > 
> > 
> >   Unwritten extent - the extent is allocated but its data has not been
> >   initialized.  This indicates the extent's data will be all zero if read
> >   through the filesystem but the contents are undefined if read directly from
> >   the device.
> 
> Well, as I said before, using UNWRITTEN isn't appropriate because it indicates
> that the data is all zeroes, which in this case it is not.  Similarly, reporting
> a hole isn't appropriate because it also indicates that the data is all zeroes
> and also that it has no space allocated on-disk at all.
> 
> I think we should just over-report the physical length of the last extent in the
> cluster, which is what btrfs does...
> 

Also keep in mind that as far as fiemap is concerned, when FIEMAP_EXTENT_ENCODED
is set (indicating that the data is compressed or encrypted), then reading the
data from disk will have "undefined results"; see
Documentation/filesystems/fiemap.rst.  As such, when someone decides to do so
anyway (which is necessary for encryption testing), they really need to know
*exactly* what they're doing.  So I think it's less bad to bend the rules on
extents where FIEMAP_EXTENT_ENCODED is already set.

In contrast, your suggestion would incorreectly report some parts of the file as
standard extents (or holes) without FIEMAP_EXTENT_ENCODED, so it would be
expected that the standard meaning would apply to those parts.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
