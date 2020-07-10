Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D821AD81
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:29:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjj7-0000Wt-UZ; Fri, 10 Jul 2020 03:29:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtjj6-0000Wl-Ux
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNFFItOfaXD7ERVrwZbtC8Lty7deqfll5JNqU2bkwBI=; b=ZcQaYBklLsz0X94Kx1L+FF7JZQ
 Du1+rpZPZGM2CnK189/SCgI2q8NCYvU04TvzBCrumtJlvapBrAR5X4BHKoYYh1rr393EVmgTkYigr
 vGxfizm2qEN8iO65lZygJ5QMvNcjKMAB3J55v3rCsXmvv/kpzdrdPAljJsy7SR3FzFlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fNFFItOfaXD7ERVrwZbtC8Lty7deqfll5JNqU2bkwBI=; b=AR7D7upRHzo52bQ4A3GKnTEz1i
 YueUskTKgmECuk7eWU0zyu5WKn7fC6njm2bZccnKJKAEtZwQ4FT6wzYNcOg+MicqW5mGnxWsEEPmW
 DT36Cp4xzseVgT5oCLuxYtSQuTmeA5+qjw6qZEYkZCZtf6tGarF+Ic6II8drl5vmpees=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjj4-00Fon6-TA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:29:28 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A4E42065C;
 Fri, 10 Jul 2020 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594351760;
 bh=e7RrwGkXqrVSsYzdSn+lpqfjZspSHu0zRla4RDNhDKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j7Gxs+TtA7tcTqK+OqXwVqHq5m+V05mq3vs44EP/PBsF46VVLvI8lMOzmXef/0xaJ
 iwOGuS6uXF9bGw+HJCo9VBoIVz5mVd2sYaYZW8j/VelURm+t8Rgw3MoqE0NfILThLl
 Q1yQF2EZLRYB2VswIrhnZmBgKGaOjkJi6oK1pn88=
Date: Thu, 9 Jul 2020 20:29:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200710032920.GD545837@google.com>
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
 <CACOAw_yJvQgDsLRd0-iJqXN06wDXmC3_OqKgKey7p=WeqxzMFA@mail.gmail.com>
 <20200710032035.GB545837@google.com>
 <20200710032531.GA2805@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710032531.GA2805@sol.localdomain>
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
X-Headers-End: 1jtjj4-00Fon6-TA
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/09, Eric Biggers wrote:
> On Thu, Jul 09, 2020 at 08:20:35PM -0700, Jaegeuk Kim wrote:
> > On 07/10, Daeho Jeong wrote:
> > > 1. The valid data will be within i_size.
> > > 2. All the trim operations will be done in a unit of block, even if
> > > i_size is not aligned with BLKSIZE like the below.
> > > 
> > >         index = F2FS_BYTES_TO_BLK(range.start);
> > >         pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);     <= BLKSIZE aligned
> > > 
> > > Are you worried about the case that sudden power-off occurs while a
> > > file is being truncated?
> > > ex) 1GB file is being truncated to 4KB -> sudden power-off ->
> > > i_size(4KB), i_blocks(maybe somewhere between 4KB and 1GB)
> > 
> > Yes. Basically, I believe we can have some data beyond i_size like fsverity.
> > 
> 
> Note that fs-verity files are read-only, and therefore this ioctl can't be used
> on them (since it requires a writable file descriptor).  So that case doesn't
> need to be handled here.

I meant it as an example of valid data beyond i_size.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
