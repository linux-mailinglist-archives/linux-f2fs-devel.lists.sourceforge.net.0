Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1403D536965
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 May 2022 02:27:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nukIC-0008UK-B4; Sat, 28 May 2022 00:26:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nukIA-0008UB-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 00:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dPis73HBQo9a0FxL5Ft3buWdk1V5Ow4ivM0BihDVe1Y=; b=BitNNdAVPAgbOfRGT//2R901gf
 PC9D9mCU2Y0C4xCaTLZ0PRLwl3TDvERi6JomOjshfR83MRJ7voJoB8dLtVnb1DmNxcBZ38jAfGsK/
 XQHxwy78Nlp6LicHtKRHEYUctyqQnsLxc+BisMlQBNkz5t4B3JCDJeKWnfPIpUppbqI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dPis73HBQo9a0FxL5Ft3buWdk1V5Ow4ivM0BihDVe1Y=; b=buZPpWk6BR4l2TtzcmcIX0jDm8
 qBdQsPjUQeiBWf8AktNq/jXOXn3lB8JqhVo5uZxajTRNr829cPFtV+XUqDh1ossFAvlfAognVE5x8
 7iVm4K9YfTNVV5C1p0PnM0HAf5NvQ0MpTyybtc+khPL8+1uTloBLO0jtzIOusdQVvoJE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nukI9-005y0j-J6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 00:26:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93F48B82652;
 Sat, 28 May 2022 00:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA5EC385A9;
 Sat, 28 May 2022 00:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653697594;
 bh=v97sikmwzDyAsEzqE9wN8Xw6wJ6O7aw4Guu8y1BBzCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z/baBl8wZ6FycigoHdy9I/Xm92oP5Ku7LvlZtmd46lBpML5Mtk61WZwXDY3MDCrQM
 fn40TtaqoJeW3zwa31G20nWpx6lZWgbcIE9aUitvgoZOQmoNEVXqVo7S7AzaECVfeX
 7Hh+a1YFDGrR+U2kYyfeR7ZURDo9DM3bM2ej77PmGjh+tYZhl2cWbmgH/xLN9QMLw4
 pni/z9FcoJrZGC9N89MTQ3r+FrURKDIJiWP2Xxv2YsYSC67HhEEAVbuRaPCO1bdz9t
 qOh9/iRm7X2FpVu8n6vqb3vaaQMVtwdAt6ShaLq5HMywVsCeQFS816KZItagq4jLVU
 PmTcNMJHgWBLw==
Date: Fri, 27 May 2022 17:26:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <YpFsOLz/GScXvhkb@google.com>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
 <YpFDw3mQjN1LBd2j@gmail.com>
 <20220527235509.GW1098723@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527235509.GW1098723@dread.disaster.area>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/28, Dave Chinner wrote: > On Fri, May 27,
 2022 at 09:33:55PM
 +0000, Eric Biggers wrote: > > [+Cc linux-block for FUA, and linux-xfs for
 iomap] > > linux-fsdevel should really be used for iomap s [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nukI9-005y0j-J6
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-block@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/28, Dave Chinner wrote:
> On Fri, May 27, 2022 at 09:33:55PM +0000, Eric Biggers wrote:
> > [+Cc linux-block for FUA, and linux-xfs for iomap]
> 
> linux-fsdevel should really be used for iomap stuff...
> 
> > 
> > On Fri, May 27, 2022 at 01:59:55PM -0700, Jaegeuk Kim wrote:
> > > Some UFS storage gives slower performance on FUA than write+cache_flush.
> > > Let's give a way to manage it.
> > > 
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > 
> > Should the driver even be saying that it has FUA support in this case?  If the
> > driver didn't claim FUA support, that would also solve this problem.
> 
> Agreed, this is a hardware problem that need to addressed with a
> driver quirk to stop it advertising FUA support. The high level
> fs/iomap code should always issue FUA writes where possible and
> the lower layers tell the block layer whether to issue the FUA as
> a FUA or write+cache flush pair.

I was thinking to turn off FUA in driver side quickly tho, one concern
was the bandwidth vs. latency. What if the device can support FUA having
short latency while giving low bandwidth? In that case, we still have
a room to utilize FUA for small-sized  writes such as filesystem metadata
writes, but avoid DIO w/ FUA for sequential write stream. Is this just
HW problem? Or, does SW need to use FUA more efficiently?

> 
> And, quite frankly, exposing this sort of "hardware needs help" knob
> as a sysfs variable is exactly the sort of thing we should never do.
> 
> Users have no idea how to tune stuff like this correctly (even if
> they knew it existed!), yet we know exactly what hardware has this
> problem and the kernel already has mechanisms that would allow it to
> just Do The Right Thing. IOWs, we can fix this without the user even
> having to know that they have garbage hardware that needs special
> help....
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
