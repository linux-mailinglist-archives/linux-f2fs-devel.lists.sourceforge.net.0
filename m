Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442D204619
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2020 02:47:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnX5Z-0001Dy-1u; Tue, 23 Jun 2020 00:47:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jnX5Y-0001Ds-2a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 00:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qo8MCIFs2eM5LBgnQoBw9JUzGhTh+IniqK5z+UPlciY=; b=HaDXDnq8XKdJOBuAXkrS5PXbMa
 5FE2RD7DLF24FdGcvdY2YUv5YzXaWufub10ckU3bAjggd2fvJhIFuAwtahozQexFVwIhPP8dGreIn
 86h6e95U39lm3+vtAOTT9ud87+NXc6odV+p3gVD+On6PlyWhDbzhCRq5CEUbOllkWHG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qo8MCIFs2eM5LBgnQoBw9JUzGhTh+IniqK5z+UPlciY=; b=P46YfyxKeN/ifmMQtZMpVuFIXC
 SMgMnyj1hEB2hMDMbIRPnXdo2ibe5NCjEWxwzQeFbdeUKlNgtHy99AxxoEocU3SvCITLAlPIMk1r2
 3VuRW5LP/e2gSkIBWGMZxPdDejxYQZMRLYsElpdLrE6o7/tsJOFKKpZ+WBvhaV+sGDvk=;
Received: from mail110.syd.optusnet.com.au ([211.29.132.97])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jnX5V-00CRTr-D6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 00:47:00 +0000
Received: from dread.disaster.area (pa49-180-124-177.pa.nsw.optusnet.com.au
 [49.180.124.177])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 55F0410E30E;
 Tue, 23 Jun 2020 10:46:43 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jnX5A-0001Xm-Kw; Tue, 23 Jun 2020 10:46:36 +1000
Date: Tue, 23 Jun 2020 10:46:36 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200623004636.GE2040@dread.disaster.area>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-2-satyat@google.com>
 <20200618011912.GA2040@dread.disaster.area>
 <20200618031935.GE1138@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618031935.GE1138@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
 a=k3aV/LVJup6ZGWgigO6cSA==:117 a=k3aV/LVJup6ZGWgigO6cSA==:17
 a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=c4diDk9UUco1MpDPBz8A:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.7 RCVD_IN_MSPIKE_L4      RBL: Bad reputation (-4)
 [211.29.132.97 listed in bl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 -1.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnX5V-00CRTr-D6
Subject: Re: [f2fs-dev] [PATCH 1/4] fs: introduce SB_INLINECRYPT
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 08:19:35PM -0700, Eric Biggers wrote:
> On Thu, Jun 18, 2020 at 11:19:12AM +1000, Dave Chinner wrote:
> > On Wed, Jun 17, 2020 at 07:57:29AM +0000, Satya Tangirala wrote:
> > > Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
> > > blk-crypto for file content en/decryption. This flag maps to the
> > > '-o inlinecrypt' mount option which multiple filesystems will implement,
> > > and code in fs/crypto/ needs to be able to check for this mount option
> > > in a filesystem-independent way.
> > > 
> > > Signed-off-by: Satya Tangirala <satyat@google.com>
> > > ---
> > >  fs/proc_namespace.c | 1 +
> > >  include/linux/fs.h  | 1 +
> > >  2 files changed, 2 insertions(+)
> > > 
> > > diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> > > index 3059a9394c2d..e0ff1f6ac8f1 100644
> > > --- a/fs/proc_namespace.c
> > > +++ b/fs/proc_namespace.c
> > > @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
> > >  		{ SB_DIRSYNC, ",dirsync" },
> > >  		{ SB_MANDLOCK, ",mand" },
> > >  		{ SB_LAZYTIME, ",lazytime" },
> > > +		{ SB_INLINECRYPT, ",inlinecrypt" },
> > >  		{ 0, NULL }
> > >  	};
> > >  	const struct proc_fs_opts *fs_infop;
> > 
> > NACK.
> > 
> > SB_* flgs are for functionality enabled on the superblock, not for
> > indicating mount options that have been set by the user.
> 
> That's an interesting claim, given that most SB_* flags are for mount options.
> E.g.:
> 
> 	ro => SB_RDONLY
> 	nosuid => SB_NOSUID
> 	nodev => SB_NODEV
> 	noexec => SB_NOEXEC
> 	sync => SB_SYNCHRONOUS
> 	mand => SB_MANDLOCK
> 	noatime => SB_NOATIME
> 	nodiratime => SB_NODIRATIME
> 	lazytime => SB_LAZYTIME

Yes, they *reflect* options set by mount options, but this is all so
screwed up because the split of superblock functionality from the
mount option API (i.e. the MS_* flag introduction to avoid having
the superblock feature flags being directly defined by the userspace
mount API) was never followed through to properly separate the
implementation of *active superblock feature flags* from the *user
specified mount API flags*.

Yes, the UAPI definitions were separated, but the rest of the
interface wasn't and only works because of the "MS* flag exactly
equal to the SB* flag" hack that was used. So now people have no
idea when to use one or the other and we're repeatedly ending up
with broken mount option parsing because SB flags are used where MS
flags should be used and vice versa.

We've made a damn mess of mount options, and the fscontext stuff
hasn't fixed any of this ... mess. It's just stirred it around and so
nobody really knows what they are supposed to with mount options
right now.

> > If the mount options are directly parsed by the filesystem option
> > parser (as is done later in this patchset), then the mount option
> > setting should be emitted by the filesystem's ->show_options
> > function, not a generic function.
> > 
> > The option string must match what the filesystem defines, not
> > require separate per-filesystem and VFS definitions of the same
> > option that people could potentially get wrong (*cough* i_version vs
> > iversion *cough*)....
> 
> Are you objecting to the use of a SB_* flag, or just to showing the flag in
> show_sb_opts() instead of in the individual filesystems?  Note that the SB_*
> flag was requested by Christoph
> (https://lkml.kernel.org/r/20191031183217.GF23601@infradead.org/,
> https://lkml.kernel.org/r/20191031212103.GA6244@infradead.org/).  We originally
> used a function fscrypt_operations::inline_crypt_enabled() instead.

I'm objecting to the layering violations of having the filesystem
control the mount option parsing and superblock feature flags, but
then having no control over whether features that the filesystem has
indicated to the VFS it is using get emitted as a mount option or
not, and then having the VFS code unconditionally override the
functionality that the filesystem uses because it thinks it's a
mount option the filesystem supports....

For example, the current mess that has just come to light:
filesystems like btrfs and XFS v5 which set SB_IVERSION
unconditionally (i.e. it's not a mount option!) end up having that
functionality turned off on remount because the VFS conflates
MS_IVERSION with SB_IVERSION and so unconditionally clears
SB_IVERSION because MS_IVERSION is not set on remount by userspace.
Which userspace will never set be because the filesystems don't put
"iversion" in their mount option strings because -its not a mount
option- for those filesystems.

See the problem?  MS_IVERSION should be passed to the filesystem to
deal with as a mount option, not treated as a flag to directly
change SB_IVERSION in the superblock.

We really need to stop with the "global mount options for everyone
at the VFS" and instead pass everything down to the filesystems to
parse appropriately. Yes, provide generic helper functions to deal
with the common flags that everything supports, but the filesystems
should be masking off mount options they doesn't support changing
before changing their superblock feature support mask....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
