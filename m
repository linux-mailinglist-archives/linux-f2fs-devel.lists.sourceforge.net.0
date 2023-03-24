Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDC6C74B2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 01:46:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfVZy-0006eg-5t;
	Fri, 24 Mar 2023 00:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfVZx-0006ea-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 00:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZTxBa0kT5vPLldd0MPPyKOJ+tSnZyEE9vXgyM1U3Ng=; b=avZTgX5Y1W29GNsCcAfLH5ob2K
 iMx18SYInWnmlNso7EmlXjyGMf+IOOjbi8zT7uD2g2d1pIYJm1Vu+oCKePCiQwW5PN9jTWZSOTede
 zyfIuI/aS85ShGeeyHfoYWZDgTh3rYJk+UTLNandGhonA/i1KP3pl1JR0Do9bMfMxJnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vZTxBa0kT5vPLldd0MPPyKOJ+tSnZyEE9vXgyM1U3Ng=; b=AU1sqWDPybReViKxa++DUovCFZ
 qPJFGtkOv0lc81w+q3U9jP8ET5lJjxCaIeWlWdT+lpeoVACr3nX8rargJMSwwlsFNu8I3oOeGJd++
 cw+a3r8h1ZpH98G5Yxpl7AkCRckoTesL/5CvlWLbjLB8vziCqW1VAaDe0CzQlU5N1aVY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfVZw-000s0Z-Nv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 00:46:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22B0F628EC;
 Fri, 24 Mar 2023 00:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40100C433EF;
 Fri, 24 Mar 2023 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679618799;
 bh=o+500o1W/tmKTD52ErdN6cCtWOuSwEJCYhyr4GzTzrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFSW9108Gr1OWZPUXrn2wD9LQpzPpmz9gSHNU6I66cwJr88MRANJE6syVlImnX7d6
 VrEJvSp3cnivvWHlDfm7455R31V6xaHpNIY47XArDhjeBc1u4HrIVBYgtJd3EZf3rT
 NdPv1H9W7y+jD89e4rsETC5uQDXI29/517EQYaFE1gvqF0sd4QpLSXwMyjw03QEzFG
 8CQ8WAOfnNJc3Ngz8cBhgjwC0isOHrbTB1FfjdqNisY6FRcHPMbybQOVcAjhDutVXI
 9O62i9dVPaLawnGzU2bcAhrZqRuOUBA9QsXCx/RXWawAPvm7ARoa7MUrDPWk8kq9UB
 ewH9SYQWKzDQg==
Date: Thu, 23 Mar 2023 17:46:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <ZBzy7RHlCqmApxUe@google.com>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
 <ZBhisCo7gTitmKeO@infradead.org> <ZBzPYwcoLXkFngz8@google.com>
 <402cc90ce5defa81c937c3fcd09de1f6497459ee.camel@wdc.com>
 <ZBzkzg+lr+TOXZcW@google.com>
 <8207efb81cd1e9322ad608d313eb4b4bd5740e80.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8207efb81cd1e9322ad608d313eb4b4bd5740e80.camel@wdc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/24, Damien Le Moal wrote: > On Thu, 2023-03-23 at 16:46
 -0700, Jaegeuk Kim wrote: > > On 03/23, Damien Le Moal wrote: > > > On Thu,
 2023-03-23 at 15:14 -0700, Jaegeuk Kim wrote: > > > > On 03/20 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfVZw-000s0Z-Nv
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/24, Damien Le Moal wrote:
> On Thu, 2023-03-23 at 16:46 -0700, Jaegeuk Kim wrote:
> > On 03/23, Damien Le Moal wrote:
> > > On Thu, 2023-03-23 at 15:14 -0700, Jaegeuk Kim wrote:
> > > > On 03/20, Christoph Hellwig wrote:
> > > > > On Mon, Feb 20, 2023 at 01:20:04PM +0100, Hans Holmberg wrote:
> > > > > > A) Supporting proper direct writes for zoned block devices
> > > > > > would
> > > > > > be the best, but it is currently not supported (probably for
> > > > > > a good but non-obvious reason). Would it be feasible to
> > > > > > implement proper direct IO?
> > > > > =

> > > > > I don't think why not.=A0 In many ways direct writes to zoned
> > > > > devices
> > > > > should be easier than non-direct writes.
> > > > > =

> > > > > Any comments from the maintainers why the direct I/O writes to
> > > > > zoned
> > > > > devices are disabled?=A0 I could not find anything helpful in the
> > > > > comments
> > > > > or commit logs.
> > > > =

> > > > The direct IO wants to overwrite the data on the same block
> > > > address,
> > > > while
> > > > zoned device does not support it?
> > > =

> > > Surely that is not the case with LFS mode, doesn't it ? Otherwise,
> > > even
> > > buffered overwrites would have an issue.
> > =

> > Zoned device only supports LFS mode.
> =

> Yes, and that was exactly my point: with LFS mode, O_DIRECT write
> should never overwrite anything. So I do not see why direct writes
> should be handled as buffered writes with zoned devices. Am I missing
> something here ?

That's an easiest way to serialize block allocation and submit_bio when use=
rs
are calling buffered writes and direct writes in parallel. :)
I just felt that if we can manage both of them in direct write path along w=
ith
buffered write path, we may be able to avoid memcpy.

> =

> > =

> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
