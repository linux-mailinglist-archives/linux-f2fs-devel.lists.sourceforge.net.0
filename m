Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35862495862
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jan 2022 03:36:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAjmo-0005nq-QN; Fri, 21 Jan 2022 02:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1nAjmm-0005nf-IG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 02:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7M5O8mZbN1sYCp7UoB7CnlfcogVIn+HO/sMinx8AaMM=; b=emeorEYmYYLZCfLYH5ehpTyW7y
 BZQRYcp7R8SllyOjkGoY5hR4BEBGyz2ti8A0/tEFwT2eNZLlMycF1DjDHnZEKfTc6QmgVglTR7rgL
 hLLDyq54LaQNbx0vr20c8Q84TAJhUWcXAU3FAM9H/ersJrWeR8UQu5Qtgz4ugZoFDyas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7M5O8mZbN1sYCp7UoB7CnlfcogVIn+HO/sMinx8AaMM=; b=QhEKegecsTiVIffk4bJ6fUsO3W
 CfzXgDm0mw+c6JqTY847vZsb5ba8akAln1SaeYqRsUuZjHqLwFwY70SnVhJDmoRMPbrg98OutdPMM
 bGmaFrRCMmq7AhfGKBRiYeJP3bUj4vTLtdkmnUisRfMSPLWSSkE+5eQLmjLPUKsBbY80=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAjmi-005oF2-F3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 02:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9A56611EC;
 Fri, 21 Jan 2022 02:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF61C340E0;
 Fri, 21 Jan 2022 02:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642732564;
 bh=7WwbHgXEEmyGk8VsUc9soyxxvD8Rd4CVOIzfWVbGxgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TJWHvQOYkvpukFEO29VsctzeUshaTt9r4j2tPBeTNRkhlOAXQFmschOiLFwTw6Vgu
 kC1CNn/nzXp7xSsldL30IPcWqUdgLtC1WKXtNmnG11pqmtpicA1Hs++8V/A012/q7x
 4mPI8QRzywjj+HqybFxooxhslpzJjRRCyU3i5ec7nJwO/9wPnVvvOmpe9SQDa/dkM7
 6rE7wpJ6XE3K4YGGCFPBxob2vexcsDcGHAPAAmhcnrY8Q5+rPbXfAIaqLMpL1a3PWT
 I0CXVQab1nmPAnsYio6Mnl6xT1TdoYFeBAUlqZdOlZCK6LiWewa1WyG/oOjDmSxpES
 btPl9CCCv+54w==
Date: Thu, 20 Jan 2022 18:36:03 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20220121023603.GH13563@magnolia>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
 <Yenm1Ipx87JAlyXg@sol.localdomain>
 <20220120235755.GI59729@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120235755.GI59729@dread.disaster.area>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 21, 2022 at 10:57:55AM +1100, Dave Chinner wrote:
 > On Thu, Jan 20, 2022 at 02:48:52PM -0800, Eric Biggers wrote: > > On Fri,
 Jan 21, 2022 at 09:04:14AM +1100, Dave Chinner wrote: > > > On [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nAjmi-005oF2-F3
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 21, 2022 at 10:57:55AM +1100, Dave Chinner wrote:
> On Thu, Jan 20, 2022 at 02:48:52PM -0800, Eric Biggers wrote:
> > On Fri, Jan 21, 2022 at 09:04:14AM +1100, Dave Chinner wrote:
> > > On Thu, Jan 20, 2022 at 01:00:27PM -0800, Darrick J. Wong wrote:
> > > > On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote:
> > > > > On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote:
> > > > > > On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote:
> > > > > > > On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> > > > > > > > 
> > > > > > > > Given the above, as far as I know the only remaining objection to this
> > > > > > > > patchset would be that DIO constraints aren't sufficiently discoverable
> > > > > > > > by userspace.  Now, to put this in context, this is a longstanding issue
> > > > > > > > with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> > > > > > > > not specific to this feature, and it doesn't actually seem to be too
> > > > > > > > important in practice; many other filesystem features place constraints
> > > > > > > > on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> > > > > > > > (And for better or worse, many systems using fscrypt already have
> > > > > > > > out-of-tree patches that enable DIO support, and people don't seem to
> > > > > > > > have trouble with the FS block size alignment requirement.)
> > > > > > > 
> > > > > > > It might make sense to use this as an opportunity to implement
> > > > > > > XFS_IOC_DIOINFO for ext4 and f2fs.
> > > > > > 
> > > > > > Hmm.  A potential problem with DIOINFO is that it doesn't explicitly
> > > > > > list the /file/ position alignment requirement:
> > > > > > 
> > > > > > struct dioattr {
> > > > > > 	__u32		d_mem;		/* data buffer memory alignment */
> > > > > > 	__u32		d_miniosz;	/* min xfer size		*/
> > > > > > 	__u32		d_maxiosz;	/* max xfer size		*/
> > > > > > };
> > > > > 
> > > > > Well, the comment above struct dioattr says:
> > > > > 
> > > > > 	/*
> > > > > 	 * Direct I/O attribute record used with XFS_IOC_DIOINFO
> > > > > 	 * d_miniosz is the min xfer size, xfer size multiple and file seek offset
> > > > > 	 * alignment.
> > > > > 	 */
> > > > > 
> > > > > So d_miniosz serves that purpose already.
> > > > > 
> > > > > > 
> > > > > > Since I /think/ fscrypt requires that directio writes be aligned to file
> > > > > > block size, right?
> > > > > 
> > > > > The file position must be a multiple of the filesystem block size, yes.
> > > > > Likewise for the "minimum xfer size" and "xfer size multiple", and the "data
> > > > > buffer memory alignment" for that matter.  So I think XFS_IOC_DIOINFO would be
> > > > > good enough for the fscrypt direct I/O case.
> > > > 
> > > > Oh, ok then.  In that case, just hoist XFS_IOC_DIOINFO to the VFS and
> > > > add a couple of implementations for ext4 and f2fs, and I think that'll
> > > > be enough to get the fscrypt patchset moving again.
> > > 
> > > On the contrary, I'd much prefer to see this information added to
> > > statx(). The file offset alignment info is a property of the current
> > > file (e.g. XFS can have different per-file requirements depending on
> > > whether the file data is hosted on the data or RT device, etc) and
> > > so it's not a fixed property of the filesystem.
> > > 
> > > statx() was designed to be extended with per-file property
> > > information, and we already have stuff like filesystem block size in
> > > that syscall. Hence I would much prefer that we extend it with the
> > > DIO properties we need to support rather than "create" a new VFS
> > > ioctl to extract this information. We already have statx(), so let's
> > > use it for what it was intended for.

Eh, ok.  Let's do that instead.

> > > 
> > 
> > I assumed that XFS_IOC_DIOINFO *was* per-file.  XFS's *implementation* of it
> > looks at the filesystem only,
> 
> You've got that wrong.
> 
>         case XFS_IOC_DIOINFO: {
> >>>>>>          struct xfs_buftarg      *target = xfs_inode_buftarg(ip);
>                 struct dioattr          da;
> 
>                 da.d_mem =  da.d_miniosz = target->bt_logical_sectorsize;
> 
> xfs_inode_buftarg() is determining which block device the inode is
> storing it's data on, so the returned dioattr values can be
> different for different inodes in the filesystem...
> 
> It's always been that way since the early Irix days - XFS RT devices
> could have very different IO constraints than the data device and
> DIO had to conform to the hardware limits underlying the filesystem.
> Hence the dioattr information has -always- been per-inode
> information.
> 
> > (Per-file state is required for encrypted
> > files.  It's also required for other filesystem features; e.g., files that use
> > compression or fs-verity don't support direct I/O at all.)
> 
> Which is exactly why is should be a property of statx(), rather than
> try to re-use a ~30 year old filesystem specific API from a
> different OS that was never intended to indicate things like "DIO
> not supported on this file at all"....

Heh.  You mean like ALLOCSP?  Ok ok point taken.

> We've been bitten many times by this "lift a rarely used filesystem
> specific ioctl to the VFS because it exists" method of API
> promotion. It almost always ends up in us discovering further down
> the track that there's something wrong with the API, it doesn't
> quite do what we need, we have to extend it anyway, or it's just
> plain borken, etc. And then we have to create a new, fit for purpose
> API anyway, and there's two VFS APIs we have to maintain forever
> instead of just one...
> 
> Can we learn from past mistakes this time instead of repeating them
> yet again?

Sure.  How's this?  I couldn't think of a real case of directio
requiring different alignments for pos and bytecount, so the only real
addition here is the alignment requirements for best performance.

struct statx {
...
	/* 0x90 */
	__u64	stx_mnt_id;

	/* Memory buffer alignment required for directio, in bytes. */
	__u32	stx_dio_mem_align;

	/* File range alignment required for directio, in bytes. */
	__u32	stx_dio_fpos_align_min;

	/* 0xa0 */

	/* File range alignment needed for best performance, in bytes. */
	__u32	stx_dio_fpos_align_opt;

	/* Maximum size of a directio request, in bytes. */
	__u32	stx_dio_max_iosize;

	__u64	__spare3[11];	/* Spare space for future expansion */
	/* 0x100 */
};

Along with:

#define STATX_DIRECTIO	0x00001000U	/* Want/got directio geometry */

How about that?

--D

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
