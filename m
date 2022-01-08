Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E49054880E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Jan 2022 03:21:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n61MV-0006rn-1E; Sat, 08 Jan 2022 02:21:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1n61MT-0006rg-8q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jan 2022 02:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtUXuo+hHAB+sfGbSESsl221tlomTnH+6pgXPwBA14k=; b=M0Yuuju1CNaQoeV7dR8+A+iHut
 NM4LXVrUDZRk//THeRaOo/Bpphzrb7FQVophq47cdbZ6lur4ytNF3jnPHVim8sYqhxM6peqa54675
 GKlr4b0I+yuQjbQ90CM1xoaPI/4cMPRgzxSYl0aokGAB894RYQTUazqq/eys7uWeMX7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CtUXuo+hHAB+sfGbSESsl221tlomTnH+6pgXPwBA14k=; b=AyW3e9gk1GgfhMUR6hDbXg4+Ip
 GOyXZg1Lbdz6wh3Lc8veGSN3cI/c+BALDQybBnb7awJi6ewM+BdC4l2DhNBAqhXRJpiEUrtpcR4VX
 3hVtcU0OVN+mAUsHe7bAXTBhA7IHW1YOruK/N+iy5P8lrXaYGzlaAKdMm4iMhj7n2/LQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n61MR-0004cV-EZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jan 2022 02:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 468D561F0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Jan 2022 02:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DBCC36AEB;
 Sat,  8 Jan 2022 02:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641608488;
 bh=d6tCE8L07WiRQLdTYY6Wo8RkTxESU2i1+P95PULKkIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bujMAGF6pgyHVhKQKZcmvfxdRkR7hdH8E6Z2WtaUI2kJMt7ZWdpVwY8j28eU2pjsr
 eB5noMBWxJLjXGt9AcSc0tOordHBLhAGcEG2AamuSvy68MFEZo3PDnu/ABNdOr7kNN
 eVvAoNt+VdAVYfNQvBxNV1RQ8y5vpoXfoFTsikDFRDKP5WfV+Dq2pzuon6Vvx89/GM
 pPyfOWeeIn9MFS8cyWShjIWRIulzTGoOGrlCleBvMUoCpmQAhgA4Hltgn3v/Hd9dAS
 jTjmLEi6J8oJj9mwqcFpZ+QG/nqm1jBrWQPb8QvBnh8iG8yHSi4U1PtpNz1uJALVz3
 IrBDXX/qYgtfw==
Date: Fri, 7 Jan 2022 18:21:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Ydj1JvEeLo1mrqvb@sol.localdomain>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
 <20220104212419.1879225-3-jaegeuk@kernel.org>
 <YdjJAS7Ua4aJEFhz@sol.localdomain> <YdjucBBopEDuUb5b@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdjucBBopEDuUb5b@google.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 07, 2022 at 05:52:48PM -0800, Jaegeuk Kim wrote:
 > On 01/07, Eric Biggers wrote: > > Hi Jaegeuk, > > > > On Tue, Jan 04, 2022
 at 01:24:16PM -0800, Jaegeuk Kim wrote: > > > DIO preallocates [...] 
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
X-Headers-End: 1n61MR-0004cV-EZ
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

On Fri, Jan 07, 2022 at 05:52:48PM -0800, Jaegeuk Kim wrote:
> On 01/07, Eric Biggers wrote:
> > Hi Jaegeuk,
> > 
> > On Tue, Jan 04, 2022 at 01:24:16PM -0800, Jaegeuk Kim wrote:
> > > DIO preallocates physical blocks before writing data, but if an error occurrs
> > > or power-cut happens, we can see block contents from the disk. This patch tries
> > > to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> > > unwritten blocks from error or power-cut.
> > > 
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >  fs/f2fs/data.c  |  5 ++++-
> > >  fs/f2fs/f2fs.h  |  5 +++++
> > >  fs/f2fs/file.c  | 27 ++++++++++++++++++---------
> > >  fs/f2fs/inode.c |  8 ++++++++
> > >  4 files changed, 35 insertions(+), 10 deletions(-)
> > 
> > Unfortunately, this patch doesn't completely fix the uninitialized data
> > exposure.  The problem is that it only makes DIO writes fall back to buffered
> > writes for holes, and not for reserved blocks (NEW_ADDR).  f2fs's reserved
> > blocks are *not* the same as the unwritten extents that other filesystems have;
> > f2fs's reserved blocks have to be turned into regular blocks before DIO can
> > write to them.  That immediately exposes them to concurrent reads (at least
> > buffered reads, but I think DIO reads too).
> 
> Isn't it resolved by i_size which gives the written blocks only?
> 

I'm not sure what you mean, but this is for non-extending writes, so i_size
isn't relevant.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
