Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BFECA57
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 22:38:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQed1-00049X-7r; Fri, 01 Nov 2019 21:38:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1iQecz-00049Q-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 21:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEmJV9WeWOqf2xSOyAoNknPa5qQJ8NCtsrO2kMD5ZS0=; b=FJPi085uXnS9KjrMbZHQNHl1hT
 k9cT5DCQvuuiWL8zVQdH05APG6TgLkXJYx3GVVhg0Fhhiwv0mjoHlLZaER7Gt2qhNdnWMT3NcYqiY
 8x8mrItPbaNP+2H07vr/dn4BOVkBySYxleZyvYNh4lFoQaZdyfWKr0lWdxkhK40aCyG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEmJV9WeWOqf2xSOyAoNknPa5qQJ8NCtsrO2kMD5ZS0=; b=bqKMzlAxY7RsHFgz/38IDR2abB
 QQ8UEsoEAgNj0j5ZeCG9jnts/yUru3/ulRja6bt443RG98Tn+Is6nmtJ2V4o40JuSwgqj/6L2jKWv
 oGH6NANu9x5XqXg/F9qpA+GIkLjvBwrEt5k8gGo0pm7ngNiiAeOfBO+6HOlWZXAxYZg8=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iQecw-00EQwg-RM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 21:38:41 +0000
Received: from dread.disaster.area (pa49-180-67-183.pa.nsw.optusnet.com.au
 [49.180.67.183])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 239EF3A03EA;
 Sat,  2 Nov 2019 08:38:26 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1iQech-0006ba-Hr; Sat, 02 Nov 2019 08:38:23 +1100
Date: Sat, 2 Nov 2019 08:38:23 +1100
From: Dave Chinner <david@fromorbit.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20191101213823.GW4614@dread.disaster.area>
References: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
 <CAMuHMdXzyVBa4TZEc5eRaBzu50thgJ2TrHJLZqwhbQ=JASgWOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXzyVBa4TZEc5eRaBzu50thgJ2TrHJLZqwhbQ=JASgWOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=D+Q3ErZj c=1 sm=1 tr=0
 a=3wLbm4YUAFX2xaPZIabsgw==:117 a=3wLbm4YUAFX2xaPZIabsgw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=MeAgGD-zjQ4A:10
 a=7-415B0cAAAA:8 a=aJW9rHtRmq1v9DlCOwQA:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQecw-00EQwg-RM
Subject: Re: [f2fs-dev] [RFC] errno.h: Provide EFSCORRUPTED for everybody
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Gao Xiang <xiang@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 01, 2019 at 09:57:31PM +0100, Geert Uytterhoeven wrote:
> Hi Valdis,
> 
> On Thu, Oct 31, 2019 at 2:11 AM Valdis Kletnieks
> <valdis.kletnieks@vt.edu> wrote:
> > Three questions: (a) ACK/NAK on this patch, (b) should it be all in one
> > patch, or one to add to errno.h and 6 patches for 6 filesystems?), and
> > (c) if one patch, who gets to shepherd it through?
> >
> > There's currently 6 filesystems that have the same #define. Move it
> > into errno.h so it's defined in just one place.
> >
> > Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
> 
> Thanks for your patch!
> 
> > --- a/include/uapi/asm-generic/errno.h
> > +++ b/include/uapi/asm-generic/errno.h
> > @@ -98,6 +98,7 @@
> >  #define        EINPROGRESS     115     /* Operation now in progress */
> >  #define        ESTALE          116     /* Stale file handle */
> >  #define        EUCLEAN         117     /* Structure needs cleaning */
> > +#define        EFSCORRUPTED    EUCLEAN
> 
> I have two questions:
> a) Why not use EUCLEAN everywhere instead?
>     Having two different names for the same errno complicates grepping.

Because:
	a) EUCLEAN is horrible for code documentation. EFSCORRUPTED
	describes exactly the error being returned and/or checked for.

	b) we've used EFSCORRUPTED in XFS since 1993. i.e. it was an
	official, published error value on Irix, and we've kept it
	in the linux code for the past ~20 years because of a)

	c) Userspace programs that include filesystem specific
	headers have already been exposed to and use EFSCORRUPTED,
	so we can't remove/change it without breaking userspace.

	d) EUCLEAN has a convenient userspace string description
	that is appropriate for filesystem corruption: "Structure
	needs cleaning" is precisely what needs to happen. Repair of
	the filesystem (i.e. recovery to a clean state) is what is
	required to fix the error....

> b) Perhaps both errors should use different values?

That horse bolted to userspace years ago - this is just formalising
the practice that has spread across multiple linux filesystems from
XFS over the past ~10 years..

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
