Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F059A9C5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 02:06:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPC0N-0000C5-U9;
	Sat, 20 Aug 2022 00:06:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPC0M-0000Bz-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 00:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cdCQzDGa61hh81U45NHpUJso43Z1SvCimXw2Adfl0rs=; b=VoSp3gflM0WEyQCYFjRKnEOiL/
 icPxGNu64yB4v0mrDIwbAAvn4Qp2jdhKRfJHt/fpf6CMWXBp3hl5DmYJHyJfzkCsBjP+5MGPU48ft
 NxDX8PW8SivPeYgakyXvtei9ALqJFlwabwarAucsF9JZKoIEVbFML4A6syoseNeqXMz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cdCQzDGa61hh81U45NHpUJso43Z1SvCimXw2Adfl0rs=; b=bvYBC+KCV0tbHRT22RDg6dgSlC
 23QB6bJTlNRAMzLHeWgD6cpPKJf0wuqiaE++YuxbtEeYZLzs63558ZY3sgCTjcoS+F4gJPjZhv76C
 5dSxZLaR6/H+KD48kc0QuUkbV2Ekrvh0glXVLLnP+/Wo0pGu53/2x4HVdLKjGBHpPXQs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPC0L-009yFV-V8 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 00:06:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A9FDB829A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 Aug 2022 00:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D478C433C1;
 Sat, 20 Aug 2022 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660953968;
 bh=bmY/rIg42sR+LftATW/o/kfBdIvBcTzPrp7h7embqQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K39ZSV5fNmgcRWBMZwUdCZgWzZRx4KVPEHSqxIley39L2Z2hiBNBanX22WpWOfWNs
 d15Ey+rZNSUwYf9js/7cqs3A2H+wTTFG5Ulkcy2RBlXLdCbePeSt/bQ6E6l4p/9SQ8
 5Z8Ootp22+495DSeGwxqd6Zey02VUyOk2E8NmN5bnBdBNvz/ATRGex/EvcGPFBBDqH
 VWc0FYVM4JTIZR6ahlo6DQ557864VIumRlzwgMuKA4bMr4nvtcd5M74wghck1FjlAp
 HNWOgSTuJ7GIeSjlruT3QD0a7HzWwm2oGlU1QsG4ts4QbGQiWKUrmeFQbyTMBzplYu
 tBO/GigY85Mow==
Date: Fri, 19 Aug 2022 17:06:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YwAlbsorBsshkxfU@google.com>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
 <YtyoF89iOg8gs7hj@google.com> <Yt7dCcG0ns85QqJe@sol.localdomain>
 <YuXyKh8Zvr56rR4R@google.com> <YvrrEcw4E+rpDLwM@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvrrEcw4E+rpDLwM@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/15, Eric Biggers wrote: > On Sat, Jul 30,
 2022 at 08:08:26PM
 -0700, Jaegeuk Kim wrote: > > On 07/25, Eric Biggers wrote: > > > On Sat,
 Jul 23, 2022 at 07:01:59PM -0700, Jaegeuk Kim wrote: > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPC0L-009yFV-V8
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/15, Eric Biggers wrote:
> On Sat, Jul 30, 2022 at 08:08:26PM -0700, Jaegeuk Kim wrote:
> > On 07/25, Eric Biggers wrote:
> > > On Sat, Jul 23, 2022 at 07:01:59PM -0700, Jaegeuk Kim wrote:
> > > > On 07/22, Eric Biggers wrote:
> > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > 
> > > > > Currently, if an f2fs filesystem is mounted with the mode=lfs and
> > > > > io_bits mount options, DIO reads are allowed but DIO writes are not.
> > > > > Allowing DIO reads but not DIO writes is an unusual restriction, which
> > > > > is likely to be surprising to applications, namely any application that
> > > > > both reads and writes from a file (using O_DIRECT).  This behavior is
> > > > > also incompatible with the proposed STATX_DIOALIGN extension to statx.
> > > > > Given this, let's drop the support for DIO reads in this configuration.
> > > > 
> > > > IIRC, we allowed DIO reads since applications complained a lower performance.
> > > > So, I'm afraid this change will make another confusion to users. Could
> > > > you please apply the new bahavior only for STATX_DIOALIGN?
> > > > 
> > > 
> > > Well, the issue is that the proposed STATX_DIOALIGN fields cannot represent this
> > > weird case where DIO reads are allowed but not DIO writes.  So the question is
> > > whether this case actually matters, in which case we should make STATX_DIOALIGN
> > > distinguish between DIO reads and DIO writes, or whether it's some odd edge case
> > > that doesn't really matter, in which case we could just fix it or make
> > > STATX_DIOALIGN report that DIO is unsupported.  I was hoping that you had some
> > > insight here.  What sort of applications want DIO reads but not DIO writes?
> > > Is this common at all?
> > 
> > I think there's no specific application to use the LFS mode at this
> > moment, but I'd like to allow DIO read for zoned device which will be
> > used for Android devices.
> > 
> 
> So if the zoned device feature becomes widely adopted, then STATX_DIOALIGN will
> be useless on all Android devices?  That sounds undesirable. 

Do you have a plan to adopt STATX_DIOALIGN in android?

> Are you sure that
> supporting DIO reads but not DIO writes actually works?  Does it not cause
> problems for existing applications?

I haven't heard any issue so far.

> 
> What we need to do is make a decision about whether this means we should build
> in a stx_dio_direction field (indicating no support / readonly support /
> writeonly support / readwrite support) into the API from the beginning.  If we
> don't do that, then I don't think we could simply add such a field later, as the
> statx_dio_*_align fields will have already been assigned their meaning.  I think
> we'd instead have to "duplicate" the API, with STATX_DIOROALIGN and
> statx_dio_ro_*_align fields.  That seems uglier than building a directional
> indicator into the API from the beginning.  On the other hand, requiring all
> programs to check stx_dio_direction would add complexity to using the API.
> 
> Any thoughts on this?

I haven't seen the details of the implementation tho, why not supporting it
only if filesystem has the same DIO RW policy?

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
