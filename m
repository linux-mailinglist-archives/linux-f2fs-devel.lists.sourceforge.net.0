Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D705B536942
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 May 2022 01:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nujne-0007xu-S2; Fri, 27 May 2022 23:55:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nujnc-0007xj-SR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 23:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sGgkSMjY/pNDIVp/2hPYu28vjSE1+bH/Ysf16SyaKys=; b=GhoGAeV2mAJyfBFSUyRLv4aEXO
 CiyfzRCW80JE//+Ny1NcpmMGdzhLBW71m6J8f0PrljjVzqPgQ8P+u+j87VDWbKIdQ1d/eyUDBnJdx
 jN0R47yztx9kN7Kdzn25Qy6aU60AZr8YqDNPCTQAsYvEUlQvOYCyzeYH2cucPtlKa0rQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sGgkSMjY/pNDIVp/2hPYu28vjSE1+bH/Ysf16SyaKys=; b=lqF4zg1g9zlDzrKfrw9Wu1dNnv
 usS86OW9EEtPsqS9iW3501jY7U9T2yQjaQLN1VOuU/WsZzXOKvAkggXry8E/9jP6Ihoe3H1DBKitR
 w3w/2zbDl8Ec5EIsbXPa6mbKyaHqOvE2jdyMBMWFAZMKSPcunbcb8s/8O5Mx5hSeS2+E=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nujnZ-005qdF-3Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 23:55:21 +0000
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au
 [49.181.2.147])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id CE065538A2A;
 Sat, 28 May 2022 09:55:10 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nujnR-00HD7K-5X; Sat, 28 May 2022 09:55:09 +1000
Date: Sat, 28 May 2022 09:55:09 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220527235509.GW1098723@dread.disaster.area>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
 <YpFDw3mQjN1LBd2j@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpFDw3mQjN1LBd2j@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=629164de
 a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
 a=kj9zAlcOel0A:10 a=oZkIemNP1mAA:10 a=VwQbUJbxAAAA:8 a=7-415B0cAAAA:8
 a=SVjUjkoNg4n66X4JJ_kA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 27, 2022 at 09:33:55PM +0000, Eric Biggers wrote:
 > [+Cc linux-block for FUA, and linux-xfs for iomap] linux-fsdevel should
 really be used for iomap stuff... > > On Fri, May 27, 2022 at 01:59:55PM
 -0700, Jaegeuk Kim wrote: > > Some UFS storage gives slower performance on
 FUA than write+cache_flush. > > Let's give a way to manage it. > > > >
 Signed-off-by: [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.246 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nujnZ-005qdF-3Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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
Cc: linux-block@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 27, 2022 at 09:33:55PM +0000, Eric Biggers wrote:
> [+Cc linux-block for FUA, and linux-xfs for iomap]

linux-fsdevel should really be used for iomap stuff...

> 
> On Fri, May 27, 2022 at 01:59:55PM -0700, Jaegeuk Kim wrote:
> > Some UFS storage gives slower performance on FUA than write+cache_flush.
> > Let's give a way to manage it.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Should the driver even be saying that it has FUA support in this case?  If the
> driver didn't claim FUA support, that would also solve this problem.

Agreed, this is a hardware problem that need to addressed with a
driver quirk to stop it advertising FUA support. The high level
fs/iomap code should always issue FUA writes where possible and
the lower layers tell the block layer whether to issue the FUA as
a FUA or write+cache flush pair.

And, quite frankly, exposing this sort of "hardware needs help" knob
as a sysfs variable is exactly the sort of thing we should never do.

Users have no idea how to tune stuff like this correctly (even if
they knew it existed!), yet we know exactly what hardware has this
problem and the kernel already has mechanisms that would allow it to
just Do The Right Thing. IOWs, we can fix this without the user even
having to know that they have garbage hardware that needs special
help....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
