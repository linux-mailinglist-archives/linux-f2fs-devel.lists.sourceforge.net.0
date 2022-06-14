Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790E54A8B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 07:25:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0z3Q-0000eX-PN; Tue, 14 Jun 2022 05:25:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o0z3P-0000eR-E6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dXfurU28sLHzeCbvqjuLN38AwqiSQGSBuu39ysOpKC8=; b=gSac8cByvLkv6jLd6jhwdSW+MJ
 gfdQxkXpTZV/xsP3pGzVLgDTqTo5oslhDO5L2uTSgZGFqEiLbPY600P5EpFLyLnYWnNaZlo0f5gfN
 GoEjCR8RxzS3EtStxpdBot370io4aNUUma6v4T9ig3CgfB8IElZeInHEi2YCixfaj/iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dXfurU28sLHzeCbvqjuLN38AwqiSQGSBuu39ysOpKC8=; b=Pl09RHOsfOblv1SvhWFsdN8xmS
 GTXT4MR7MfxnbQHu1ZAi9MwRdT28oW4CPdg9G+CvYBQrD+vFXBhHCbEealxIeTFkia1OXb/Bl5E9P
 C1GXmVicu5wy1xJ1bpJapUnA2LBFomHZpk6iM05rGix7V/xNyvO9//VM/5CoxJbcaG/s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0z3N-000s8y-QY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:25:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 958A661647;
 Tue, 14 Jun 2022 05:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9603C3411B;
 Tue, 14 Jun 2022 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655184315;
 bh=yVv5NBSoS8jRKy5ozRnvXgCu1M0fCe/nJRys6szNJx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3vMc4a/nCEXDbFNP/4wKJ/IRtOdNoppRm3KT6glab4LkOZA75EmhzGbtaA1xJ+t3
 zvkLdo81p05dnXKT+qKQuo6DrZwA4lYN2s4XqyUV53L250GdKda6QGguEubwN+2Tiu
 d4A9dR7WcBIqi94WqvepH+Mo3dRm4pzTy62UhK2d0tWAEz0EaNQA/qG3VSjqGh/ZGP
 BfUQkMRf8IKtoMh07F+Bm4ksrN2SWxyqmzziAxnkoynG7uOflh+qdDkUkyMvYFq2EJ
 VUGOVK9SwNY9c0UT3JGvInxETeshxNeq+5qJGUa9Q4x+rKmPDCLKDNxg8c1GJk61r1
 KqP5kl72VRMGw==
Date: Mon, 13 Jun 2022 22:25:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <YqgbuDbdH2OLcbC7@sol.localdomain>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
 <YobNXbYnhBiqniTH@magnolia>
 <20220520032739.GB1098723@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520032739.GB1098723@dread.disaster.area>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 20, 2022 at 01:27:39PM +1000, Dave Chinner wrote:
 > > > * stx_offset_align_optimal: the alignment (in bytes) suggested for
 file > > > offsets and I/O segment lengths to get optimal perform [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o0z3N-000s8y-QY
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-api@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 20, 2022 at 01:27:39PM +1000, Dave Chinner wrote:
> > > * stx_offset_align_optimal: the alignment (in bytes) suggested for file
> > >   offsets and I/O segment lengths to get optimal performance.  This
> > >   applies to both DIO and buffered I/O.  It differs from stx_blocksize
> > >   in that stx_offset_align_optimal will contain the real optimum I/O
> > >   size, which may be a large value.  In contrast, for compatibility
> > >   reasons stx_blocksize is the minimum size needed to avoid page cache
> > >   read/write/modify cycles, which may be much smaller than the optimum
> > >   I/O size.  For more details about the motivation for this field, see
> > >   https://lore.kernel.org/r/20220210040304.GM59729@dread.disaster.area
> > 
> > Hmm.  So I guess this is supposed to be the filesystem's best guess at
> > the IO size that will minimize RMW cycles in the entire stack?  i.e. if
> > the user does not want RMW of pagecache pages, of file allocation units
> > (if COW is enabled), of RAID stripes, or in the storage itself, then it
> > should ensure that all IOs are aligned to this value?
> > 
> > I guess that means for XFS it's effectively max(pagesize, i_blocksize,
> > bdev io_opt, sb_width, and (pretend XFS can reflink the realtime volume)
> > the rt extent size)?  I didn't see a manpage update for statx(2) but
> > that's mostly what I'm interested in. :)
> 
> Yup, xfs_stat_blksize() should give a good idea of what we should
> do. It will end up being pretty much that, except without the need
> to a mount option to turn on the sunit/swidth return, and always
> taking into consideration extent size hints rather than just doing
> that for RT inodes...

While working on the man-pages update, I'm having second thoughts about the
stx_offset_align_optimal field.  Does any filesystem other than XFS actually
want stx_offset_align_optimal, when st[x]_blksize already exists?  Many network
filesystems, as well as tmpfs when hugepages are enabled, already report large
(megabytes) sizes in st[x]_blksize.  And all documentation I looked at (man
pages for Linux, POSIX, FreeBSD, NetBSD, macOS) documents st_blksize as
something like "the preferred blocksize for efficient I/O".  It's never
documented as being limited to PAGE_SIZE, which makes sense because it's not.

So stx_offset_align_optimal seems redundant, and it is going to confuse
application developers who will have to decide when to use st[x]_blksize and
when to use stx_offset_align_optimal.

Also, applications that don't work well with huge reported optimal I/O sizes
would still continue to exist, as it will remain possible for applications to
only be tested on filesystems that report a small optimal I/O size.

Perhaps for now we should just add STATX_DIOALIGN instead of STATX_IOALIGN,
leaving out the stx_offset_align_optimal field?  What do people think?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
