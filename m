Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31D5A356E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:08:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRpvP-0000R0-Gz;
	Sat, 27 Aug 2022 07:08:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRpvO-0000Qu-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwQwhLELq4kl9Ud5rCxviLopa+1ka6nFqJjPx7zEF00=; b=V4KfLWvyhV/Q+aZCqNzwp0E2hD
 Qh6umpMlmxxgAls4sp5t+sYg4o9h/zHocuotWlEMg0fmJCILeQuzGd4hblDhOCR8uwjUwXjmTO1sD
 Ih4sRcgNOJ1xsJHZ8RHhgBQ64dxs7Q8G0WVVlvFnXVxwj/z3m/BzEnzpRHIosutvnfmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dwQwhLELq4kl9Ud5rCxviLopa+1ka6nFqJjPx7zEF00=; b=cFJxzBIX7Mj//XV7Bl2+gdEPe9
 ujiaQtFwDmZgrZa0t4RUlepuxfpTOX3eIdHhOpnbZfMm0xAchtaJcBnkqSsMkUs+ZhWNtSQArgbi4
 mybYDGMbUALfMRt/IfhoadnRf8xNiWlo61EFURH2rPrkcD+xBM+ecEhA9orzqqBKxA3E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRpvN-00078P-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:08:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EAE0B82783
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 07:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B027CC433C1;
 Sat, 27 Aug 2022 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661584082;
 bh=p0KRSMvvBhsJs0c03pHNWDIW9Qt/EnRrmOnfStK+zqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLvlkjUnktj26RRTEJeF29+/+JHbO8XAS/9V4Wiki8lnjsjbLKVT97mLLImiN+62c
 +EpOM247AJ37EeTTDfES3liBnoAa62LtOVdbsIQCqAZwgFhq/a3G9Q8kzPhPMxXk9m
 rI9+KpZadUhXkoHHIFuHm87iZR3ytO2piFQYvBFmhjQ2mNF3wkkcgxI7suT8JRZ2A+
 DVAmVSkYyz4wKEJ+nVPeqplcAYgBznkFuKsC7aSdTh8p6ucLWwQ57+nxuAjSNnTHyK
 qfHYoDrflvFMbCIYPiKxfJG6x9FoBVXZzhDJ9CEuhsJ3Awv6lodlmAAmAtepC2dyQo
 AvX8PSILJ/IBA==
Date: Sat, 27 Aug 2022 00:07:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YwnCz/4K8lGS91n+@sol.localdomain>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <3543250c8157c3e0e7e410b268121e4d7d3e9bc2.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3543250c8157c3e0e7e410b268121e4d7d3e9bc2.camel@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 26, 2022 at 01:19:37PM -0400, Jeff Layton wrote:
 > On Fri, 2022-07-22 at 00:12 -0700, Eric Biggers wrote: > > This patchset
 makes the statx() system call return direct I/O (DIO) > > alignm [...] 
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
X-Headers-End: 1oRpvN-00078P-Kz
Subject: Re: [f2fs-dev] [PATCH v4 0/9] make statx() return DIO alignment
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 26, 2022 at 01:19:37PM -0400, Jeff Layton wrote:
> On Fri, 2022-07-22 at 00:12 -0700, Eric Biggers wrote:
> > This patchset makes the statx() system call return direct I/O (DIO)
> > alignment information.  This allows userspace to easily determine
> > whether a file supports DIO, and if so with what alignment restrictions.
> > 
> > Patch 1 adds the basic VFS support for STATX_DIOALIGN.  Patch 2 wires it
> > up for all block device files.  The remaining patches wire it up for
> > regular files on ext4, f2fs, and xfs.  Support for regular files on
> > other filesystems can be added later.
> > 
> > I've also written a man-pages patch, which I'm sending separately.
> > 
> > Note, f2fs has one corner case where DIO reads are allowed but not DIO
> > writes.  The proposed statx fields can't represent this.  My proposal
> > (patch 6) is to just eliminate this case, as it seems much too weird.
> > But I'd appreciate any feedback on that part.
> > 
> > This patchset applies to v5.19-rc7.
> > 
> > Changed v3 => v4:
> >    - Added xfs support.
> > 
> >    - Moved the helper function for block devices into block/bdev.c.
> >    
> >    - Adjusted the ext4 patch to not introduce a bug where misaligned DIO
> >      starts being allowed on encrypted files when it gets combined with
> >      the patch "iomap: add support for dma aligned direct-io" that is
> >      queued in the block tree for 5.20.
> > 
> >    - Made a simplification in fscrypt_dio_supported().
> > 
> > Changed v2 => v3:
> >    - Dropped the stx_offset_align_optimal field, since its purpose
> >      wasn't clearly distinguished from the existing stx_blksize.
> > 
> >    - Renamed STATX_IOALIGN to STATX_DIOALIGN, to reflect the new focus
> >      on DIO only.
> > 
> >    - Similarly, renamed stx_{mem,offset}_align_dio to
> >      stx_dio_{mem,offset}_align, to reflect the new focus on DIO only.
> > 
> >    - Wired up STATX_DIOALIGN on block device files.
> > 
> > Changed v1 => v2:
> >    - No changes.
> > 
> > Eric Biggers (9):
> >   statx: add direct I/O alignment information
> >   vfs: support STATX_DIOALIGN on block devices
> >   fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
> >   ext4: support STATX_DIOALIGN
> >   f2fs: move f2fs_force_buffered_io() into file.c
> >   f2fs: don't allow DIO reads but not DIO writes
> >   f2fs: simplify f2fs_force_buffered_io()
> >   f2fs: support STATX_DIOALIGN
> >   xfs: support STATX_DIOALIGN
> > 
> >  block/bdev.c              | 25 ++++++++++++++++++++
> >  fs/crypto/inline_crypt.c  | 49 +++++++++++++++++++--------------------
> >  fs/ext4/ext4.h            |  1 +
> >  fs/ext4/file.c            | 37 ++++++++++++++++++++---------
> >  fs/ext4/inode.c           | 36 ++++++++++++++++++++++++++++
> >  fs/f2fs/f2fs.h            | 45 -----------------------------------
> >  fs/f2fs/file.c            | 45 ++++++++++++++++++++++++++++++++++-
> >  fs/stat.c                 | 14 +++++++++++
> >  fs/xfs/xfs_iops.c         |  9 +++++++
> >  include/linux/blkdev.h    |  4 ++++
> >  include/linux/fscrypt.h   |  7 ++----
> >  include/linux/stat.h      |  2 ++
> >  include/uapi/linux/stat.h |  4 +++-
> >  13 files changed, 190 insertions(+), 88 deletions(-)
> > 
> > base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
> 
> Hi Eric,
> 
> Can I ask what your plans are with this set? I didn't see it in
> linux-next yet, so I wasn't sure when you were looking to get it merged.
> I'm working on patches to add a new statx field for the i_version
> counter as well and I want to make sure that our work doesn't collide.
> 

I've just sent v5.  I guess I'll try to get it merged for 6.1.  We were a bit
stuck on the read-only DIO issue.  All things considered though, including that
Christoph thinks it's possible for f2fs to support DIO writes on zoned block
devices, I'm willing to bet that read-only DIO doesn't really matter enough for
it to be worth it to add a direction field to STATX_DIOALIGN (which would make
it harder to use STATX_DIOALIGN, as the field would always have to be checked).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
