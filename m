Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9BA495679
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 23:49:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAgEq-0001mo-BJ; Thu, 20 Jan 2022 22:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nAgEo-0001mM-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 22:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTPIBJKzMg86UnlUEY4PqsGzwwAoR9nxAX4f6qsSIv8=; b=jslD2TPnSrU2DS7nDX1pXVcg2q
 b4Ea3B1cNcLVF4XHeQoMrQ91gU5Zi4xVkcofo+LLKMtADQSONoc7HK6cm2dP4VjPSqdg4zzXBsRRx
 yZdeP9ojjUnPRVLToHwo6n1UA2nyltDutsItj6iEyEgjYtkmC4ApSWvkahZrwgwX73ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cTPIBJKzMg86UnlUEY4PqsGzwwAoR9nxAX4f6qsSIv8=; b=HjPYsZAVoNF6CXK9MdIuGuULRk
 FnPjdLR9augpnqJAMbh4j4cuB+JFD5SoerN6qVCyKo4o9QFgTnxOZdxReiQvjsaULQq9lMga3MjXe
 B2q4RTEPFkPtvwL0pdGBzpynzFbvuTUiRgadSQ2ViX24G0W408OxSVaDtrdMgl2FJ9xo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAgEm-0001aN-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 22:49:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F627618E8;
 Thu, 20 Jan 2022 22:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B20C340E0;
 Thu, 20 Jan 2022 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642718934;
 bh=R2iHnMQoN78/8C8ZNGY75u8Jki974eki9FfAL/hTqOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n77d2NNiMJcXQpEvyxAHtn+/C0DDdnVmN7s8HZlcyGGcZjb46P7bzWCKn7Xwe26HR
 x2TzhtJAvq0zwaHfs7NCI2Clhz6zp9cL1Yke5OnV6I62amkJ4qTzIrMJo7J/kzbGqv
 /ySSgqb+zN2Iv7LvIcfUFZz3Tpux2Pty9KiagvByWB8Cfn7IOt6ivAIUhOZhL5Mh6+
 ct8YrBTiKgmVWKtUcEf8Ntbj1aaFywP/t8XTm+w4yPU/C8YWwy9qfW0BxtNbPOcZ8Z
 NaPbCzEK9fY2Bz5aDAFgOqC6Hxd/v1W2zpj9CgNLZ1KICOYEJk4L4ypF6sdtwEdn38
 8mf1AuIJTTDrQ==
Date: Thu, 20 Jan 2022 14:48:52 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Yenm1Ipx87JAlyXg@sol.localdomain>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120220414.GH59729@dread.disaster.area>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 21, 2022 at 09:04:14AM +1100, Dave Chinner wrote:
 > On Thu, Jan 20, 2022 at 01:00:27PM -0800, Darrick J. Wong wrote: > > On
 Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote: > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nAgEm-0001aN-HZ
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 21, 2022 at 09:04:14AM +1100, Dave Chinner wrote:
> On Thu, Jan 20, 2022 at 01:00:27PM -0800, Darrick J. Wong wrote:
> > On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote:
> > > On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote:
> > > > On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote:
> > > > > On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> > > > > > 
> > > > > > Given the above, as far as I know the only remaining objection to this
> > > > > > patchset would be that DIO constraints aren't sufficiently discoverable
> > > > > > by userspace.  Now, to put this in context, this is a longstanding issue
> > > > > > with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> > > > > > not specific to this feature, and it doesn't actually seem to be too
> > > > > > important in practice; many other filesystem features place constraints
> > > > > > on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> > > > > > (And for better or worse, many systems using fscrypt already have
> > > > > > out-of-tree patches that enable DIO support, and people don't seem to
> > > > > > have trouble with the FS block size alignment requirement.)
> > > > > 
> > > > > It might make sense to use this as an opportunity to implement
> > > > > XFS_IOC_DIOINFO for ext4 and f2fs.
> > > > 
> > > > Hmm.  A potential problem with DIOINFO is that it doesn't explicitly
> > > > list the /file/ position alignment requirement:
> > > > 
> > > > struct dioattr {
> > > > 	__u32		d_mem;		/* data buffer memory alignment */
> > > > 	__u32		d_miniosz;	/* min xfer size		*/
> > > > 	__u32		d_maxiosz;	/* max xfer size		*/
> > > > };
> > > 
> > > Well, the comment above struct dioattr says:
> > > 
> > > 	/*
> > > 	 * Direct I/O attribute record used with XFS_IOC_DIOINFO
> > > 	 * d_miniosz is the min xfer size, xfer size multiple and file seek offset
> > > 	 * alignment.
> > > 	 */
> > > 
> > > So d_miniosz serves that purpose already.
> > > 
> > > > 
> > > > Since I /think/ fscrypt requires that directio writes be aligned to file
> > > > block size, right?
> > > 
> > > The file position must be a multiple of the filesystem block size, yes.
> > > Likewise for the "minimum xfer size" and "xfer size multiple", and the "data
> > > buffer memory alignment" for that matter.  So I think XFS_IOC_DIOINFO would be
> > > good enough for the fscrypt direct I/O case.
> > 
> > Oh, ok then.  In that case, just hoist XFS_IOC_DIOINFO to the VFS and
> > add a couple of implementations for ext4 and f2fs, and I think that'll
> > be enough to get the fscrypt patchset moving again.
> 
> On the contrary, I'd much prefer to see this information added to
> statx(). The file offset alignment info is a property of the current
> file (e.g. XFS can have different per-file requirements depending on
> whether the file data is hosted on the data or RT device, etc) and
> so it's not a fixed property of the filesystem.
> 
> statx() was designed to be extended with per-file property
> information, and we already have stuff like filesystem block size in
> that syscall. Hence I would much prefer that we extend it with the
> DIO properties we need to support rather than "create" a new VFS
> ioctl to extract this information. We already have statx(), so let's
> use it for what it was intended for.
> 

I assumed that XFS_IOC_DIOINFO *was* per-file.  XFS's *implementation* of it
looks at the filesystem only, but that would be the expected implementation if
the DIO constraints don't currently vary between different files in XFS.

If DIO constraints do in fact already vary between different files in XFS, is
this just a bug in the XFS implementation of XFS_IOC_DIOINFO?  Or was
XFS_IOC_DIOINFO only ever intended to report per-filesystem state?  If the
latter, then yes, that would mean it wouldn't really be suitable to reuse to
start reporting per-file state.  (Per-file state is required for encrypted
files.  It's also required for other filesystem features; e.g., files that use
compression or fs-verity don't support direct I/O at all.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
