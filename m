Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE670595652
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Aug 2022 11:31:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNsvG-00010Q-Lm;
	Tue, 16 Aug 2022 09:31:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1oNsvF-00010J-Sq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 09:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ez1qmC7ExMnT+w0jTyQHoecbYQMuIA6BfS1nbjNkRwA=; b=P3fUWXziyczoinoUGmgpzItVVw
 CIKbiJSKiCkov5/u0JmuwnsNXvUGJZ8QqjXV4z3ZO1FcECllGnSQZWyC0jo9HPbMExyPnlgjRrUzb
 i5MVZqAnO7aF3Z6nPQXiDj8aEEPCs7Z4XS3bW4Cls1qLAkNhGEiWXL55BUTOWSaImGKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ez1qmC7ExMnT+w0jTyQHoecbYQMuIA6BfS1nbjNkRwA=; b=RYascPOp6sG+xIsnm7U1S32LoZ
 oKtIneub3ghNdqutGjlqVEiyrqV3aXk/XfimM/PhyppQoEvl7QgTH71KVN+KnnLQEi9ZUTF+Y6mBf
 Mg892FVt81uXwDzfPvf6UpHO2EsL6rWTC8g5mhV8Dex6vZfz2sUajIOiFbY4ZiMvQ32A=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1oNsvD-004EeO-OM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Aug 2022 09:31:41 +0000
Received: from dread.disaster.area (pa49-181-52-176.pa.nsw.optusnet.com.au
 [49.181.52.176])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 7B45B62D403;
 Tue, 16 Aug 2022 19:03:13 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oNsTg-00Dk22-Ca; Tue, 16 Aug 2022 19:03:12 +1000
Date: Tue, 16 Aug 2022 19:03:12 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220816090312.GU3600936@dread.disaster.area>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
 <YtyoF89iOg8gs7hj@google.com> <Yt7dCcG0ns85QqJe@sol.localdomain>
 <YuXyKh8Zvr56rR4R@google.com> <YvrrEcw4E+rpDLwM@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvrrEcw4E+rpDLwM@sol.localdomain>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=62fb5d51
 a=O3n/kZ8kT9QBBO3sWHYIyw==:117 a=O3n/kZ8kT9QBBO3sWHYIyw==:17
 a=kj9zAlcOel0A:10 a=biHskzXt2R4A:10 a=1XWaLZrsAAAA:8 a=7-415B0cAAAA:8
 a=0f_GdJSvYQN_4D2ffm4A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 15, 2022 at 05:55:45PM -0700, Eric Biggers wrote:
 > On Sat, Jul 30, 2022 at 08:08:26PM -0700, Jaegeuk Kim wrote: > > On 07/25,
 Eric Biggers wrote: > > > On Sat, Jul 23, 2022 at 07:01:59PM [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [211.29.132.246 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oNsvD-004EeO-OM
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
 DIO writes
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
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 15, 2022 at 05:55:45PM -0700, Eric Biggers wrote:
> On Sat, Jul 30, 2022 at 08:08:26PM -0700, Jaegeuk Kim wrote:
> > On 07/25, Eric Biggers wrote:
> > > On Sat, Jul 23, 2022 at 07:01:59PM -0700, Jaegeuk Kim wrote:
> > > > On 07/22, Eric Biggers wrote:
> > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > 
> > > > > Currently, if an f2fs filesystem is mounted with the mode=lfs and
> > > > > io_bits mount options, DIO reads are allowed but DIO writes are not.
> > > > > Allowing DIO reads but not DIO writes is an unusual restriction, which
> > > > > is likely to be surprising to applications, namely any application that
> > > > > both reads and writes from a file (using O_DIRECT).  This behavior is
> > > > > also incompatible with the proposed STATX_DIOALIGN extension to statx.
> > > > > Given this, let's drop the support for DIO reads in this configuration.
> > > > 
> > > > IIRC, we allowed DIO reads since applications complained a lower performance.
> > > > So, I'm afraid this change will make another confusion to users. Could
> > > > you please apply the new bahavior only for STATX_DIOALIGN?
> > > > 
> > > 
> > > Well, the issue is that the proposed STATX_DIOALIGN fields cannot represent this
> > > weird case where DIO reads are allowed but not DIO writes.  So the question is
> > > whether this case actually matters, in which case we should make STATX_DIOALIGN
> > > distinguish between DIO reads and DIO writes, or whether it's some odd edge case
> > > that doesn't really matter, in which case we could just fix it or make
> > > STATX_DIOALIGN report that DIO is unsupported.  I was hoping that you had some
> > > insight here.  What sort of applications want DIO reads but not DIO writes?
> > > Is this common at all?
> > 
> > I think there's no specific application to use the LFS mode at this
> > moment, but I'd like to allow DIO read for zoned device which will be
> > used for Android devices.
> > 
> 
> So if the zoned device feature becomes widely adopted, then STATX_DIOALIGN will
> be useless on all Android devices?  That sounds undesirable.  Are you sure that
> supporting DIO reads but not DIO writes actually works?  Does it not cause
> problems for existing applications?

What purpose does DIO in only one direction actually serve? All it
means is that we're forcibly mixing buffered and direct IO to the
same file and that simply never ends well from a data coherency POV.

Hence I'd suggest that mixing DIO reads and buffered writes like
this ends up exposing uses to the worst of both worlds - all of the
problems with none of the benefits...

> What we need to do is make a decision about whether this means we should build
> in a stx_dio_direction field (indicating no support / readonly support /
> writeonly support / readwrite support) into the API from the beginning.  If we
> don't do that, then I don't think we could simply add such a field later, as the
> statx_dio_*_align fields will have already been assigned their meaning.  I think
> we'd instead have to "duplicate" the API, with STATX_DIOROALIGN and
> statx_dio_ro_*_align fields.  That seems uglier than building a directional
> indicator into the API from the beginning.  On the other hand, requiring all
> programs to check stx_dio_direction would add complexity to using the API.
> 
> Any thoughts on this?

Decide whether partial, single direction DIO serves a useful purpose
before trying to work out what is needed in the API to indicate that
this sort of crazy will be supported....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
