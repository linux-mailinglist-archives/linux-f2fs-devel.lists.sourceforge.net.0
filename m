Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A052E317
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 05:27:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrtIv-00025u-To; Fri, 20 May 2022 03:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nrtIt-00025n-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 03:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5kw+EBZjE7VU1oZGnaJXzP9KKs0ff2QnGmEMcPk/zFo=; b=BdBkIY7ToWfhGMcYQ4n71Cl2C2
 3JWpMUZuZ/PxK6kI4CON6qpaMxAg8d7V3ckFmkXE1AQ9Ak/UFK+yq1pNVg9VhOETXgT0ZN3uUgwpx
 4wJ0ZFN8By+Vm2/OSRRvKYVmeTHx9zjOImEefHInHJiwEElYkDh71eqr1NHvIZjdKN2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5kw+EBZjE7VU1oZGnaJXzP9KKs0ff2QnGmEMcPk/zFo=; b=SPfe0kH7HT/r961/UDtq++RztE
 XY7Xiq3AXMvz2Gk8q2+J3YGzN6DG/YL5aW84th7uFbci26+KHRJrA+PuJe9Ao9D4Li8HEzjRthcHj
 LukHlGV4qKdzXamUVIInScrhhpdO5E6rPoUjYk14m9mn9ssY63h2ZO68QyMCp73FNa5M=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nrtIp-0007Xr-55
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 03:27:50 +0000
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au
 [49.181.2.147])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 4126E10E68AE;
 Fri, 20 May 2022 13:27:41 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nrtIh-00E6GN-MT; Fri, 20 May 2022 13:27:39 +1000
Date: Fri, 20 May 2022 13:27:39 +1000
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20220520032739.GB1098723@dread.disaster.area>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
 <YobNXbYnhBiqniTH@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YobNXbYnhBiqniTH@magnolia>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=62870aad
 a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
 a=kj9zAlcOel0A:10 a=oZkIemNP1mAA:10 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8
 a=7-415B0cAAAA:8 a=-h69JAkiF4VdWyV60hkA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 19, 2022 at 04:06:05PM -0700, Darrick J. Wong
 wrote: > On Wed, May 18, 2022 at 04:50:05PM -0700, Eric Biggers wrote: > >
 From: Eric Biggers <ebiggers@google.com> > > > > Traditionally, the [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.249 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrtIp-0007Xr-55
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 19, 2022 at 04:06:05PM -0700, Darrick J. Wong wrote:
> On Wed, May 18, 2022 at 04:50:05PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Traditionally, the conditions for when DIO (direct I/O) is supported
> > were fairly simple: filesystems either supported DIO aligned to the
> > block device's logical block size, or didn't support DIO at all.
> > 
> > However, due to filesystem features that have been added over time (e.g,
> > data journalling, inline data, encryption, verity, compression,
> > checkpoint disabling, log-structured mode), the conditions for when DIO
> > is allowed on a file have gotten increasingly complex.  Whether a
> > particular file supports DIO, and with what alignment, can depend on
> > various file attributes and filesystem mount options, as well as which
> > block device(s) the file's data is located on.
> > 
> > XFS has an ioctl XFS_IOC_DIOINFO which exposes this information to
> > applications.  However, as discussed
> > (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
> > this ioctl is rarely used and not known to be used outside of
> > XFS-specific code.  It also was never intended to indicate when a file
> > doesn't support DIO at all, and it only exposes the minimum I/O
> > alignment, not the optimal I/O alignment which has been requested too.
> > 
> > Therefore, let's expose this information via statx().  Add the
> > STATX_IOALIGN flag and three fields associated with it:
> > 
> > * stx_mem_align_dio: the alignment (in bytes) required for user memory
> >   buffers for DIO, or 0 if DIO is not supported on the file.
> > 
> > * stx_offset_align_dio: the alignment (in bytes) required for file
> >   offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
> >   on the file.  This will only be nonzero if stx_mem_align_dio is
> >   nonzero, and vice versa.
> > 
> > * stx_offset_align_optimal: the alignment (in bytes) suggested for file
> >   offsets and I/O segment lengths to get optimal performance.  This
> >   applies to both DIO and buffered I/O.  It differs from stx_blocksize
> >   in that stx_offset_align_optimal will contain the real optimum I/O
> >   size, which may be a large value.  In contrast, for compatibility
> >   reasons stx_blocksize is the minimum size needed to avoid page cache
> >   read/write/modify cycles, which may be much smaller than the optimum
> >   I/O size.  For more details about the motivation for this field, see
> >   https://lore.kernel.org/r/20220210040304.GM59729@dread.disaster.area
> 
> Hmm.  So I guess this is supposed to be the filesystem's best guess at
> the IO size that will minimize RMW cycles in the entire stack?  i.e. if
> the user does not want RMW of pagecache pages, of file allocation units
> (if COW is enabled), of RAID stripes, or in the storage itself, then it
> should ensure that all IOs are aligned to this value?
> 
> I guess that means for XFS it's effectively max(pagesize, i_blocksize,
> bdev io_opt, sb_width, and (pretend XFS can reflink the realtime volume)
> the rt extent size)?  I didn't see a manpage update for statx(2) but
> that's mostly what I'm interested in. :)

Yup, xfs_stat_blksize() should give a good idea of what we should
do. It will end up being pretty much that, except without the need
to a mount option to turn on the sunit/swidth return, and always
taking into consideration extent size hints rather than just doing
that for RT inodes...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
