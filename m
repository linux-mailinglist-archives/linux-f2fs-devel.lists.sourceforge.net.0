Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AFB20692F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 02:55:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnthC-0005xq-2n; Wed, 24 Jun 2020 00:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jnth9-0005xj-VU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 00:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=plU283mgriunc3GrZO0jw5nUnd52uxqS/qp3IRde8Ls=; b=CB+1ua9BdC9tLzorfuPXQFar/d
 1aQ59522nbCsNzjXFp8wxpENwvS7XqcjMqVCfqwNBfpFLRO30erGkmIIj74oN6xWHRFVaGF43lPpp
 pElC/O+4eO/VYq20H1AwJtL6CscKYkrYAiMgTs/C7k/daAbyDdtz1yeuPRerT5nKpw1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=plU283mgriunc3GrZO0jw5nUnd52uxqS/qp3IRde8Ls=; b=fxIN/ZNkeNhM/eUYpyFuSbQkl4
 faCQRC8Hsp4FCDxdNgGMMBGXuZ8bjMlPIzh/T/bXAiIraPoGAkHensOCU7lwlBuB5AatGpz+i3LG4
 tnlMv1KYg7GTZM1KG+6yB4CuV8ARtwQItsEJV4qdNUaGvM9fxBA6AJQ67i7TkuBq4wOI=;
Received: from mail109.syd.optusnet.com.au ([211.29.132.80])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jnth7-00GWa3-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 00:55:19 +0000
Received: from dread.disaster.area (pa49-180-124-177.pa.nsw.optusnet.com.au
 [49.180.124.177])
 by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 3A00CD7B989;
 Wed, 24 Jun 2020 10:55:10 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jntgz-0001dO-9M; Wed, 24 Jun 2020 10:55:09 +1000
Date: Wed, 24 Jun 2020 10:55:09 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200624005509.GA5369@dread.disaster.area>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-2-satyat@google.com>
 <20200618011912.GA2040@dread.disaster.area>
 <20200618031935.GE1138@sol.localdomain>
 <20200623004636.GE2040@dread.disaster.area>
 <20200623015017.GA844@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623015017.GA844@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
 a=k3aV/LVJup6ZGWgigO6cSA==:117 a=k3aV/LVJup6ZGWgigO6cSA==:17
 a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=7-415B0cAAAA:8 a=_JHsV_7MbDpF1hl6ON4A:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnth7-00GWa3-Lj
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
Cc: linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 22, 2020 at 06:50:17PM -0700, Eric Biggers wrote:
> On Tue, Jun 23, 2020 at 10:46:36AM +1000, Dave Chinner wrote:
> > On Wed, Jun 17, 2020 at 08:19:35PM -0700, Eric Biggers wrote:
> > > Are you objecting to the use of a SB_* flag, or just to showing the flag in
> > > show_sb_opts() instead of in the individual filesystems?  Note that the SB_*
> > > flag was requested by Christoph
> > > (https://lkml.kernel.org/r/20191031183217.GF23601@infradead.org/,
> > > https://lkml.kernel.org/r/20191031212103.GA6244@infradead.org/).  We originally
> > > used a function fscrypt_operations::inline_crypt_enabled() instead.
> > 
> > I'm objecting to the layering violations of having the filesystem
> > control the mount option parsing and superblock feature flags, but
> > then having no control over whether features that the filesystem has
> > indicated to the VFS it is using get emitted as a mount option or
> > not, and then having the VFS code unconditionally override the
> > functionality that the filesystem uses because it thinks it's a
> > mount option the filesystem supports....
> > 
> > For example, the current mess that has just come to light:
> > filesystems like btrfs and XFS v5 which set SB_IVERSION
> > unconditionally (i.e. it's not a mount option!) end up having that
> > functionality turned off on remount because the VFS conflates
> > MS_IVERSION with SB_IVERSION and so unconditionally clears
> > SB_IVERSION because MS_IVERSION is not set on remount by userspace.
> > Which userspace will never set be because the filesystems don't put
> > "iversion" in their mount option strings because -its not a mount
> > option- for those filesystems.
> > 
> > See the problem?  MS_IVERSION should be passed to the filesystem to
> > deal with as a mount option, not treated as a flag to directly
> > change SB_IVERSION in the superblock.
> > 
> > We really need to stop with the "global mount options for everyone
> > at the VFS" and instead pass everything down to the filesystems to
> > parse appropriately. Yes, provide generic helper functions to deal
> > with the common flags that everything supports, but the filesystems
> > should be masking off mount options they doesn't support changing
> > before changing their superblock feature support mask....
> 
> I think the MS_* flags are best saved for mount options that are applicable to
> many/most filesystems and are mostly/entirely implementable at the VFS level.

That's the theory, but so far it's caused nothing but pain.

In reality, I think ithe only sane way forward if to stop mount
option parsing in userspace (i.e. no new MS_* flags) for any new
functionality as it only leads to future pain. i.e. all new mount
options should be parsed entirely in the kernel by the filesystem
parsing code....

> I don't think "inlinecrypt" qualifies, since while it will be shared by the
> block device-based filesystems that support fscrypt, that is only 2 filesystems
> currently; and while some of the code needed to implement it is shared in
> fs/crypto/, there are still substantial filesystem-specific hooks needed.

Right. I wasn't suggesting this patchset should use an MS_ flag -
it was pointing out the problem with the VFS code using SB_ flags to
indicate enabled filesystem functionality unconditionally as a mount
option that can be changed by userspace.

> Hence this patchset intentionally does *not* allocate an MS_INLINECRYPT flag.
> 
> I believe that already addresses half of your concern, as it means
> SB_INLINECRYPT can only be set/cleared by the filesystem itself, not by the VFS.
> (But the commit message could use an explanation of this.)
> 
> The other half would be addressed by the following change, right?

Yes, it does. Thanks, Eric!

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
