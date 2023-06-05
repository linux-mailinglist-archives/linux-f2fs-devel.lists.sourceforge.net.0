Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85793722FDD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 21:36:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6G0J-0004br-9a;
	Mon, 05 Jun 2023 19:36:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q6G0F-0004bl-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 19:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=269IZPfvLlbo4SEoNTUCvaCsuryykTYLzS00KqFpZQ8=; b=XN/jxDHcAfGi1Zf13c3I+AtWSL
 YJyx2+PMZqosS1GeZAZAgvpIhe31eqoQPoieEZHqBJEVbi9jjOSRYGSqTKSOCx9YzGoTd9pNaajAH
 VVP0LaDvL+Bp2quBj1OdkWOmxFhaE4BXRjJHCBYmx1HO2TZjwRm0kt+LNm+87J/3rwIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=269IZPfvLlbo4SEoNTUCvaCsuryykTYLzS00KqFpZQ8=; b=AW7n+qdrUPDecRx6iksXTEWqZZ
 UuFW9l6Be3zstRwrXNEw5w3EZrwIMwYkdkMBeWnJ6XuzCyF0deM2eupFWvw5FtfkEWFu8a26Mn5zP
 AZAEyCUmlmPTVWBLi+aFLByZs0wceeHoeJyxqHtAs/cbm4UFdHGtXP0DJ8kFXDrVvo2U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6G0F-0002KY-91 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 19:36:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5EDA621AA;
 Mon,  5 Jun 2023 19:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25F6C433D2;
 Mon,  5 Jun 2023 19:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685993785;
 bh=+giQO/41KfxmdSnorRAH0Il/f9FFoxZF4d9pD94EDJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFvpg46EjKT6rlArh7FE5yHdzcwCoiL7dygFJIOy94thjJU54tsBaqO+IWf8fwnRJ
 brfN7KFimR08CQoqNhKSuK54kqIT4MYFEoB1fRYs5AqP+0nZHN9vpBVD4yIdn6hXnp
 5J2vS1+bNNQQdeoibSfhPWOsZfjvTIbkVtMd4/5NHYGHKXeHgAL2WaHX0SaozHnrO2
 Xp6+52t6mrXEwruD18ZlFMz4qFJZXE09lQ1IKwGWvFwNeFS4MUt86x1gt/U7iVI2Ze
 jG3u5yF5whPRTAANvDpp7S2Es0GLnMF3zC+4V/GvFe6q8lWpu+LQPE0gYczwE1OG/v
 lZZdhuK6o5k+A==
Date: Mon, 5 Jun 2023 12:36:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Hans Holmberg <Hans.Holmberg@wdc.com>
Message-ID: <ZH45N4nsqxCnhnoU@google.com>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
 <ZBhisCo7gTitmKeO@infradead.org> <ZBzPYwcoLXkFngz8@google.com>
 <402cc90ce5defa81c937c3fcd09de1f6497459ee.camel@wdc.com>
 <ZBzkzg+lr+TOXZcW@google.com>
 <8207efb81cd1e9322ad608d313eb4b4bd5740e80.camel@wdc.com>
 <ZBzy7RHlCqmApxUe@google.com> <ZCDXnuV7oZwcYvRP@infradead.org>
 <20230605115638.GA23662@gsv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605115638.GA23662@gsv>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/05, Hans Holmberg wrote: > > On Sun, Mar 26, 2023 at
 04:39:10PM -0700, hch@infradead.org wrote: > > On Thu, Mar 23,
 2023 at 05:46:37PM
 -0700, Jaegeuk Kim wrote: > > > > Yes, and that was exactly [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6G0F-0002KY-91
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics
 when buffering is forced
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/05, Hans Holmberg wrote:
> 
> On Sun, Mar 26, 2023 at 04:39:10PM -0700, hch@infradead.org wrote:
> > On Thu, Mar 23, 2023 at 05:46:37PM -0700, Jaegeuk Kim wrote:
> > > > Yes, and that was exactly my point: with LFS mode, O_DIRECT write
> > > > should never overwrite anything. So I do not see why direct writes
> > > > should be handled as buffered writes with zoned devices. Am I missing
> > > > something here ?
> > > 
> > > That's an easiest way to serialize block allocation and submit_bio when users
> > > are calling buffered writes and direct writes in parallel. :)
> > > I just felt that if we can manage both of them in direct write path along with
> > > buffered write path, we may be able to avoid memcpy.
> > 
> > Yes.  Note that right now f2fs doesn't really support proper O_DIRECT
> > for buffered I/O either, as non-overwrites require a feature similar
> > to unwritten extents, or a split of the allocation phase and the record
> > metdata phase.  If we'd go for the second choice for f2fs, which is the
> > more elegant thing to do, you'll get the zoned direct I/O write support
> > almost for free.
> 
> So, Jaegeuk, do you think suporting direct io proper is the way to do to fix this
> issue? That looks like a better solution to me (at least long term).
> 
> Until that would be put into place, do you want my fix (with your code
> style fixes) rebased and resent?

Yes, it's already landed in 6.4-rc1 of Linus tree, and surely I have the topic
in my long term plan.

Thanks,

> 
> Cheers,
> Hans


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
