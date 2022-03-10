Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6D4D3EDA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 02:41:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS7oO-00074E-BD; Thu, 10 Mar 2022 01:41:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nS7oM-000747-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 01:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tiShq+7q4wvh+LtcX3eKlfeYmKTYxulAgpIPEFJEnW4=; b=TYAAHCmWQLtefaWHihPvOZ2QJn
 2CZVv+AT7+nUmS0YwCFGhH01RG9SF3+ibnIMRO23Pj2Oce9Qj21sU9+qmERA9swQlUjFT7Xrunwcb
 1pgo5FoJSm9kzl/Op7bWbDE446E5NXA63Wm+79QCkZNIQasb7p9WRzfK8v4CA0SAXrqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tiShq+7q4wvh+LtcX3eKlfeYmKTYxulAgpIPEFJEnW4=; b=bxsheOJaqngTv3Axl+VpKvlVAy
 Wk5mR/SycV6MhB/7L5lx9Rg+r45IQiRuipcg++D3VN+1GcCy4u+bHQXgIVbpGf68ffCw5R0fa/YpK
 I8MkM6ERreHMxzt1xL85jryHX7aXMoc+bfMXdn0JvCThd7X9lSYW4ZvRLksaWQ5SNRIk=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nS7oJ-00AOjp-RL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 01:41:48 +0000
Received: from dread.disaster.area (pa49-186-150-27.pa.vic.optusnet.com.au
 [49.186.150.27])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 4906010E2BEC;
 Thu, 10 Mar 2022 12:41:40 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nS7oB-003bhG-DU; Thu, 10 Mar 2022 12:41:39 +1100
Date: Thu, 10 Mar 2022 12:41:39 +1100
From: Dave Chinner <david@fromorbit.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20220310014139.GZ3927073@dread.disaster.area>
References: <20220228035719.4102745-1-sunke32@huawei.com>
 <cd2a245e-b9d2-c09c-0f8c-a7ca9157ca9f@oppo.com>
 <20220309062223.GY3927073@dread.disaster.area>
 <0a5c5efd-597e-7d13-9008-195cf6cf83f1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a5c5efd-597e-7d13-9008-195cf6cf83f1@kernel.org>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=62295756
 a=sPqof0Mm7fxWrhYUF33ZaQ==:117 a=sPqof0Mm7fxWrhYUF33ZaQ==:17
 a=kj9zAlcOel0A:10 a=o8Y5sQTvuykA:10 a=i0EeH86SAAAA:8 a=7-415B0cAAAA:8
 a=NuAcnk6cltMIAt2ZYeMA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 09, 2022 at 03:34:27PM +0800, Chao Yu wrote: >
 On 2022/3/9 14:22, Dave Chinner wrote: > > On Wed, Mar 09, 2022 at 12:31:17PM
 +0800, Chao Yu wrote: > > > On 2022/2/28 11:57, Sun Ke via Linu [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.249 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1nS7oJ-00AOjp-RL
Subject: Re: [f2fs-dev] [PATCH] generic/066: attr1 is still there after log
 replay on f2fs
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
Cc: jaegeuk@kernel.org, Sun Ke <sunke32@huawei.com>, guan@eryu.me,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 09, 2022 at 03:34:27PM +0800, Chao Yu wrote:
> On 2022/3/9 14:22, Dave Chinner wrote:
> > On Wed, Mar 09, 2022 at 12:31:17PM +0800, Chao Yu wrote:
> > > On 2022/2/28 11:57, Sun Ke via Linux-f2fs-devel wrote:
> > > > The test fail on f2fs:
> > > >        xattr names and values after second fsync log replay:
> > > >        # file: SCRATCH_MNT/foobar
> > > >       +user.attr1="val1"
> > > >        user.attr3="val3"
> > > > 
> > > > attr1 is still there after log replay.
> > > > I guess it is f2fs's special feature to improve the performance.
> > > > 
> > > > Signed-off-by: Sun Ke <sunke32@huawei.com>
> > > > ---
> > > > 
> > > > Is it a BUG on f2fs?
> > > 
> > > I don't think so, it fails due to f2fs doesn't follow recovery rule which
> > > btrfs/ext4/xfs does, but it doesn't mean f2fs has break posix semantics of
> > > fsync().
> > 
> > I disagree.  A failure in this test is indicative of non-conformance
> > with the Linux definition of fsync() behaviour.
> > 
> > You are right in that it does not break POSIX fsync semantics, but
> > POSIX allows "do nothing" as a valid implementation. However,
> > because of this loophole, the POSIX definition is complete garbage
> > and we do not use it.
> > 
> > That behaviour that Linux filesytsems are supposed to implement is
> > defined in the Linux fsync() man page, and it goes way beyond what
> > POSIX requires:
> > 
> > $ man fsync
> > ....
> > DESCRIPTION
> >      fsync() transfers ("flushes") all modified in-core data of
> >      (i.e., modified buffer cache pages for) the file referred to by
> >      the file descriptor fd to the disk device (or other permanent
> >      storage device) so that all changed information can be retrieved
> >      even if the  system  crashes  or  is rebooted.  This includes
> >      writing through or flushing a disk cache if present.  The call
> >      blocks until the device reports that the transfer has
> >      completed.
> > 
> >      As well as flushing the file data, fsync() also flushes the
> >      metadata information associated with the file (see inode(7)).
> > ....
> > 
> > IOWs, fsync() on Linux is supposed to persist all data and
> > metadata associated with the inode to stable storage such that it
> > can be retreived after a crash or reboot. "metadata information"
> > includes xattrs attached to the inode that is being fsync()d.
> 
> Quoted from g/066:
> 
> echo "hello world!" >> $SCRATCH_MNT/foobar
> $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/foobar
> $SETFATTR_PROG -x user.attr1 $SCRATCH_MNT/foobar
> ln $SCRATCH_MNT/foobar $SCRATCH_MNT/foobar_link
> touch $SCRATCH_MNT/qwerty
> $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/qwerty
> 
> IIUC, to match what Linux fsync() manual restricts, if we want to persist the
> xattr removal, we should call fsync() on $SCRATCH_MNT/foobar after
> "$SETFATTR_PROG -x user.attr1 $SCRATCH_MNT/foobar"? rather than calling fsync()
> on unrelated $SCRATCH_MNT/qwerty.

It might look that way, but it's not that straight forward: there's
a carefully constructed object dependency chain in this test that
defines what the correct behaviour should be here.

What's the link count of $SCRATCH_MNT/foobar when
$SCRATCH_MNT/qwerty is present after recovery? Is it 1 or 2?  Does
$SCRATCH_MNT/foobar_link exist?  And if $SCRATCH_MNT/foobar_link
exists, and the link count is 2. The test doesn't even look at these
things, but if user.attr1 is not present, it means that foobar_link
and qwerty are present, $SCRATCH_MNT has a link count of 5 and
foobar has a link count of 2 because that's the dependency chain
that leads to the user.attr1 removal being recovered correctly.

So what does SCRATCH_MNT actually contain when f2fs fails this test?

These depedencies exist because we can't just randomly re-order
recovery of modifications to individual inodes and certain
operations create atomic change dependencies between inodes. It's
those atomic change dependencies that this test is actually
exercising.  i.e. the link count changes tie directory modifications
to inode modifications and this creates cross-object ordering
dependencies down the line that fsync then exposes. That's what the
second part of this test is actually exercising....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
