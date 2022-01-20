Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD84955BA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 22:00:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAeXw-0006T6-GX; Thu, 20 Jan 2022 21:00:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1nAeXv-0006Sz-7a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 21:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewLJMskgDDEUEezxNTdCaVuJ9OMAq9BkCWpgJLO79rE=; b=b9INV/DN6d7qbooX2zU4vSWPwt
 RLubkIAH9Vy/a89LdPvrf2qYTLsG6uYp6ZnStv2c7CoiDZSXbUpKWPxALbI2+5VwHnWbHIXi2CI3T
 JY3mzZ1JKsw1V8j63jW06P4vGsWjSFDmZKSGF/CDkLGSpD68NZH1RJCUw4BRknaRXJvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ewLJMskgDDEUEezxNTdCaVuJ9OMAq9BkCWpgJLO79rE=; b=XR+RSVTET7SUDqBsWfBIrX0BS6
 MObTl9WGslV6u8vG30D5XEXDRAAKXUPD2U8/FPD35LDCtddXgUJGRnOD8QT67RCSTZNSSzPzmyKKf
 lXjflomqWkBZ8J+o2im7BAVINMyXeIFbIgFpWo1Zi0ahhMOdG27cOMrCJCikqKE9anls=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAeXp-005PX9-Sk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 21:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87C1B61874;
 Thu, 20 Jan 2022 21:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F31C340E0;
 Thu, 20 Jan 2022 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642712428;
 bh=Sgn6vsiQaVTZl6FA2Bi6v2vMumeBHvXQ8WnUp3/OgOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rg3DWs5KzBBcatjdrT34CEMOazOi9A8JaCoVRLZDvRuX6uUX4LDihsBfpqnhGACwl
 mQLMV34CpRp6JgYQYU7oc8ZvkXFlU98cUhrfsyxCO3aBZplrE4JLcxYjp4X2zouMD3
 a4iHIGG0S+HYkf4bJxKU/LwG2k9Z+r4GRYbpZQnHts0hmDLKtEj7dn5Yg6JQC8jYSF
 9s6uhJa5exrDusE53neADlAA1qMvq2PTuiBnYrkBDgrSRiIVaSuRDqHpqPSSvAv6YT
 rzHDLupGZd3WwwUNnWYYQ7TfYZaszzj3iKB6iAztLjBX6WklwqP0O0mc7x2TYX1AMS
 gnCMv9pVePpTQ==
Date: Thu, 20 Jan 2022 13:00:27 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220120210027.GQ13540@magnolia>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YenIcshA706d/ziV@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote:
 > On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote: > > On
 Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote: [...] 
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
X-Headers-End: 1nAeXp-005PX9-Sk
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
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 12:39:14PM -0800, Eric Biggers wrote:
> On Thu, Jan 20, 2022 at 09:10:27AM -0800, Darrick J. Wong wrote:
> > On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote:
> > > On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> > > > 
> > > > Given the above, as far as I know the only remaining objection to this
> > > > patchset would be that DIO constraints aren't sufficiently discoverable
> > > > by userspace.  Now, to put this in context, this is a longstanding issue
> > > > with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> > > > not specific to this feature, and it doesn't actually seem to be too
> > > > important in practice; many other filesystem features place constraints
> > > > on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> > > > (And for better or worse, many systems using fscrypt already have
> > > > out-of-tree patches that enable DIO support, and people don't seem to
> > > > have trouble with the FS block size alignment requirement.)
> > > 
> > > It might make sense to use this as an opportunity to implement
> > > XFS_IOC_DIOINFO for ext4 and f2fs.
> > 
> > Hmm.  A potential problem with DIOINFO is that it doesn't explicitly
> > list the /file/ position alignment requirement:
> > 
> > struct dioattr {
> > 	__u32		d_mem;		/* data buffer memory alignment */
> > 	__u32		d_miniosz;	/* min xfer size		*/
> > 	__u32		d_maxiosz;	/* max xfer size		*/
> > };
> 
> Well, the comment above struct dioattr says:
> 
> 	/*
> 	 * Direct I/O attribute record used with XFS_IOC_DIOINFO
> 	 * d_miniosz is the min xfer size, xfer size multiple and file seek offset
> 	 * alignment.
> 	 */
> 
> So d_miniosz serves that purpose already.
> 
> > 
> > Since I /think/ fscrypt requires that directio writes be aligned to file
> > block size, right?
> 
> The file position must be a multiple of the filesystem block size, yes.
> Likewise for the "minimum xfer size" and "xfer size multiple", and the "data
> buffer memory alignment" for that matter.  So I think XFS_IOC_DIOINFO would be
> good enough for the fscrypt direct I/O case.

Oh, ok then.  In that case, just hoist XFS_IOC_DIOINFO to the VFS and
add a couple of implementations for ext4 and f2fs, and I think that'll
be enough to get the fscrypt patchset moving again.

> The real question is whether there are any direct I/O implementations where
> XFS_IOC_DIOINFO would *not* be good enough, for example due to "xfer size
> multiple" != "file seek offset alignment" being allowed.  In that case we would
> need to define a new ioctl that is more general (like the one you described
> below) rather than simply uplifting XFS_IOC_DIOINFO.

I don't think there are any currently, but if anyone ever redesigns
DIOINFO we might as well make all those pieces explicit.

> More general is nice, but it's not helpful if no one will actually use the extra
> information.  So we need to figure out what is actually useful.

<nod> Clearly I haven't wanted d_opt_fpos badly enough to propose
revving the ioctl. ;)

--D

> 
> > How about something like this:
> > 
> > struct dioattr2 {
> > 	__u32		d_mem;		/* data buffer memory alignment */
> > 	__u32		d_miniosz;	/* min xfer size		*/
> > 	__u32		d_maxiosz;	/* max xfer size		*/
> > 
> > 	/* file range must be aligned to this value */
> > 	__u32		d_min_fpos;
> > 
> > 	/* for optimal performance, align file range to this */
> > 	__u32		d_opt_fpos;
> > 
> > 	__u32		d_padding[11];
> > };
> > 
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
