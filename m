Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D64880B8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Jan 2022 02:53:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n60un-0006GY-H3; Sat, 08 Jan 2022 01:53:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n60um-0006GR-8v
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jan 2022 01:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=et0HO4KA1iDGusx4yIZ8m6B+IAw2Q4JX/PKsGqLkTrI=; b=d3AHNvgqRcBE10cW4vH2TkvZBv
 p3OLcFD6VpKnOt93MhXF5YeNFIm01sJPKlr296AXUku1wX5YhTSR2a/4z2/MtM71cwi8H3QtQDQ9O
 GdC1eQ1HsG4UHxsX5PWwmeiUIoyw/VJ5bcjTeBfhuFuEvLhPG1+93fCHNuqj/PVwTIGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=et0HO4KA1iDGusx4yIZ8m6B+IAw2Q4JX/PKsGqLkTrI=; b=m3ecofaeGG8iepum65jJfJIEme
 0ztquhVngx/6GW7UeHZfwJ/Hlkr15R4hZudAeEM0YwmNinN32Nv9KH2lluGJPo6ud2seN7b/p10Bw
 dbIcH/w2wos5gbbcKrLSefyLsGRANqqg/P67zSrsZRgGulR0GX2qVguxWCaP5GHBxKDY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n60uk-005eJD-Nz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jan 2022 01:53:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBA9F61B39
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Jan 2022 01:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BFEC36AEB;
 Sat,  8 Jan 2022 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641606770;
 bh=Es3KcRJYeo4WYUt7uvzyaMb8+DZadMOEldXQ+MRPcd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gchM24idoCJoPGt2asNzcIP3kWP39zlQ4PvlVML7pkf00mbFjUdFiuDxL4ZR5Ah4Y
 sQ8nbBAUqnWX9qIb9rgZAFLWCCDRSTumkjlH17APKNuSiF9JyyEjYdWbvduXayytoR
 wRwTFBG4P8aQXmFrjpLRpzHLDLK26gAzKL1+IloG+vcu/U7lDwtdepON6DcbFhbBMz
 dlG/VnpwpPWPWvNiZsfxQ6LSadDiQzdqVhzCuL1ai6TjhamclU7bkxOPfl9GP+QB5K
 Jtrw0h3Sr4rDxmziWt3ngGguh6hgUOFKL83Lc1P1FmIjrcNtWrGrGmA8YsA8y6ppQX
 /n/WIBSjKQ2iw==
Date: Fri, 7 Jan 2022 17:52:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YdjucBBopEDuUb5b@google.com>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
 <20220104212419.1879225-3-jaegeuk@kernel.org>
 <YdjJAS7Ua4aJEFhz@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdjJAS7Ua4aJEFhz@sol.localdomain>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/07, Eric Biggers wrote: > Hi Jaegeuk, > > On Tue, Jan
 04, 2022 at 01:24:16PM -0800, Jaegeuk Kim wrote: > > DIO preallocates physical
 blocks before writing data, but if an error occurrs > > or po [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n60uk-005eJD-Nz
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: do not expose unwritten blocks to
 user by DIO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/07, Eric Biggers wrote:
> Hi Jaegeuk,
> 
> On Tue, Jan 04, 2022 at 01:24:16PM -0800, Jaegeuk Kim wrote:
> > DIO preallocates physical blocks before writing data, but if an error occurrs
> > or power-cut happens, we can see block contents from the disk. This patch tries
> > to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> > unwritten blocks from error or power-cut.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/data.c  |  5 ++++-
> >  fs/f2fs/f2fs.h  |  5 +++++
> >  fs/f2fs/file.c  | 27 ++++++++++++++++++---------
> >  fs/f2fs/inode.c |  8 ++++++++
> >  4 files changed, 35 insertions(+), 10 deletions(-)
> 
> Unfortunately, this patch doesn't completely fix the uninitialized data
> exposure.  The problem is that it only makes DIO writes fall back to buffered
> writes for holes, and not for reserved blocks (NEW_ADDR).  f2fs's reserved
> blocks are *not* the same as the unwritten extents that other filesystems have;
> f2fs's reserved blocks have to be turned into regular blocks before DIO can
> write to them.  That immediately exposes them to concurrent reads (at least
> buffered reads, but I think DIO reads too).

Isn't it resolved by i_size which gives the written blocks only?

> 
> This can be reproduced using the aiodio_sparse program from LTP, as follows:
> 
> 	aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 6
> 
> This was reported at
> https://lore.kernel.org/r/20211226132851.GC34518@xsang-OptiPlex-9020 as a
> regression from the commit "f2fs: use iomap for direct I/O", but it actually
> failed before too.  Note that it's nondeterministic; writing random data to the
> block device before creating the filesystem helps with reproduction.
> 
> I see only three possible solutions:
> 
> * Make DIO writes to reserved blocks fall back to buffered writes, just like
>   writes to holes.  This would mean that a file would have to be written to
>   before direct writes would work; fallocate() wouldn't be enough.  Note that my
>   patch https://lore.kernel.org/r/20210728015154.171507-1-ebiggers@kernel.org
>   would have done this.
> 
> * Or, change the f2fs on-disk format to support unwritten extents.
> 
> * Or, split up block allocation into two parts, so that blocks could be
>   preliminarily allocated and not exposed to reads yet.  This would be like
>   Ted's suggestion here: https://lore.kernel.org/r/YQS5eBljtztWwOFE@mit.edu
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
