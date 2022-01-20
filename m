Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF33495653
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 23:23:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAfqF-0007i9-DM; Thu, 20 Jan 2022 22:23:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nAfqD-0007i3-K6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 22:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dk4kHQ+1/+rBe40XR/gSaYfkfVYITdqKtlXorumFRc8=; b=X7cjfPUHn9LebFK7c9qd/oaFMC
 jIkvmmrKgCzMv1/kneGRunpsokrqwAzdf01ljvylMu92SrChtudoVrxd0sCB/RRNZ5euNUTxZAikS
 nVr6q4EYBVpB6KIsHAAn9XdbjEuqoo2e9YbiUWRVRzhF13TGOq1G1or043VuQ0GeJdYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dk4kHQ+1/+rBe40XR/gSaYfkfVYITdqKtlXorumFRc8=; b=RfLuciKQoKuSW0MQijSgwv0fMP
 BAiPZ7wbI8h2cO8S1+GmAhOsKjhS9YZBYLgwav1hlMV3vRLSGA5br4ZIyiepzR3Qz65/Ls8NEYEcu
 +p6ZNbWt5Bj2zCK3CNACyGd6hndQ/9gXMWYDIN5E922M2xuamygAJHYPzeTHE9yy0v0c=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1nAfqA-005VnY-EN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 22:23:36 +0000
Received: from dread.disaster.area (pa49-179-45-11.pa.nsw.optusnet.com.au
 [49.179.45.11])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 2234D62C0DC;
 Fri, 21 Jan 2022 09:04:15 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nAfXS-002ETb-Cy; Fri, 21 Jan 2022 09:04:14 +1100
Date: Fri, 21 Jan 2022 09:04:14 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20220120220414.GH59729@dread.disaster.area>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120210027.GQ13540@magnolia>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=deDjYVbe c=1 sm=1 tr=0 ts=61e9dc60
 a=Eslsx4mF8WGvnV49LKizaA==:117 a=Eslsx4mF8WGvnV49LKizaA==:17
 a=kj9zAlcOel0A:10 a=DghFqjY3_ZEA:10 a=7-415B0cAAAA:8
 a=9QqxFJIFzbBQP3I7X9sA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 01:00:27PM -0800, Darrick J. Wong
 wrote: > On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote: > >
 On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote: > [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.246 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1nAfqA-005VnY-EN
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

On Thu, Jan 20, 2022 at 01:00:27PM -0800, Darrick J. Wong wrote:
> On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote:
> > On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote:
> > > On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote:
> > > > On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> > > > > 
> > > > > Given the above, as far as I know the only remaining objection to this
> > > > > patchset would be that DIO constraints aren't sufficiently discoverable
> > > > > by userspace.  Now, to put this in context, this is a longstanding issue
> > > > > with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> > > > > not specific to this feature, and it doesn't actually seem to be too
> > > > > important in practice; many other filesystem features place constraints
> > > > > on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> > > > > (And for better or worse, many systems using fscrypt already have
> > > > > out-of-tree patches that enable DIO support, and people don't seem to
> > > > > have trouble with the FS block size alignment requirement.)
> > > > 
> > > > It might make sense to use this as an opportunity to implement
> > > > XFS_IOC_DIOINFO for ext4 and f2fs.
> > > 
> > > Hmm.  A potential problem with DIOINFO is that it doesn't explicitly
> > > list the /file/ position alignment requirement:
> > > 
> > > struct dioattr {
> > > 	__u32		d_mem;		/* data buffer memory alignment */
> > > 	__u32		d_miniosz;	/* min xfer size		*/
> > > 	__u32		d_maxiosz;	/* max xfer size		*/
> > > };
> > 
> > Well, the comment above struct dioattr says:
> > 
> > 	/*
> > 	 * Direct I/O attribute record used with XFS_IOC_DIOINFO
> > 	 * d_miniosz is the min xfer size, xfer size multiple and file seek offset
> > 	 * alignment.
> > 	 */
> > 
> > So d_miniosz serves that purpose already.
> > 
> > > 
> > > Since I /think/ fscrypt requires that directio writes be aligned to file
> > > block size, right?
> > 
> > The file position must be a multiple of the filesystem block size, yes.
> > Likewise for the "minimum xfer size" and "xfer size multiple", and the "data
> > buffer memory alignment" for that matter.  So I think XFS_IOC_DIOINFO would be
> > good enough for the fscrypt direct I/O case.
> 
> Oh, ok then.  In that case, just hoist XFS_IOC_DIOINFO to the VFS and
> add a couple of implementations for ext4 and f2fs, and I think that'll
> be enough to get the fscrypt patchset moving again.

On the contrary, I'd much prefer to see this information added to
statx(). The file offset alignment info is a property of the current
file (e.g. XFS can have different per-file requirements depending on
whether the file data is hosted on the data or RT device, etc) and
so it's not a fixed property of the filesystem.

statx() was designed to be extended with per-file property
information, and we already have stuff like filesystem block size in
that syscall. Hence I would much prefer that we extend it with the
DIO properties we need to support rather than "create" a new VFS
ioctl to extract this information. We already have statx(), so let's
use it for what it was intended for.

> > The real question is whether there are any direct I/O implementations where
> > XFS_IOC_DIOINFO would *not* be good enough, for example due to "xfer size
> > multiple" != "file seek offset alignment" being allowed.  In that case we would
> > need to define a new ioctl that is more general (like the one you described
> > below) rather than simply uplifting XFS_IOC_DIOINFO.
> 
> I don't think there are any currently, but if anyone ever redesigns
> DIOINFO we might as well make all those pieces explicit.
> 
> > More general is nice, but it's not helpful if no one will actually use the extra
> > information.  So we need to figure out what is actually useful.
> 
> <nod> Clearly I haven't wanted d_opt_fpos badly enough to propose
> revving the ioctl. ;)

I think the number of applications that use DIOINFO outside of
xfsprogs/xfsdump/fstests can probably be counted on one hand.

Debian code search tells me:
-qemu (under ifdef CONFIG_XFS)
-ceph 16.2 (seastar database support?)
-diod contains a copy of fsstress
-e2fsprogs contains a copy of fsstress
-openmpi (under ifdef SGIMPI)
-partclone - actually, that has a complete copy of the xfsprogs
	     libxfs/ iand include/ directory in it, so it's using
	     the old libxfs_device_alignment() call that uses
	     XFS_IOC_DIOINFOD, and only when builing the xfsclone
	     binary.

Yup, I can count them on one 6 fingered hand, and their only use is
when XFS filesystems are specifically discovered. :)

Hence I think it would be much more useful to application developers
to include the IO alignment information in statx(), not to lift an
ioctl that is pretty much unused and unknown outside the core XFS
development environment....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
