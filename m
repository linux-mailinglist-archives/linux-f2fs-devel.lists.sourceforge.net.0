Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7422B92A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 00:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyjNq-0007CE-Kk; Thu, 23 Jul 2020 22:08:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jyjNp-0007C2-E7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 22:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4rDQS2uzkNtCglTKUFrYZh2Res1sjv6YWOOJYD4xC2c=; b=GddYMier8I7BjgOg3wSyzEWnwU
 QLK4j1yIQqO0Yu0TkijTLpVdbrHaRmNMSwXFaclcrLvb/tb0dCSNV2WiErDiFt+9X77FAupIrlM5I
 iqD37FASedzTWYJHcnZOwg+HaS93KX/AruShkMvKWxlfPgvY2DfOiNihABtT74g9HqIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4rDQS2uzkNtCglTKUFrYZh2Res1sjv6YWOOJYD4xC2c=; b=fMX6Zwp4pmCqEDOph7y293ceAX
 skOLzBkAHzNC2Bp9rN2s4DpFKCR4U2EpMVMpxAOHJD7yQr3RXq7c2ZFhBz8PzSmNBmf28bFmmHEoZ
 qS1KZ/jRkRf4o2oWGTpy+yvxEqcAaL+bktXE3psaf4YsUIjI3Haqn2uH3T6nz6UC5OLk=;
Received: from mail110.syd.optusnet.com.au ([211.29.132.97])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jyjNn-000ld8-1p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 22:08:09 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 84C79108342;
 Fri, 24 Jul 2020 08:07:58 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jyjNY-0000u9-BP; Fri, 24 Jul 2020 08:07:52 +1000
Date: Fri, 24 Jul 2020 08:07:52 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200723220752.GF2005@dread.disaster.area>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722223404.GA76479@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LPwYv6e9 c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8
 a=7-415B0cAAAA:8 a=o-5nuXC40d1hAW-zK1QA:9 a=lV8-eMjJ7w0CS7Ub:21
 a=2U3LBo-zXchMHvL1:21 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyjNn-000ld8-1p
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> On Thu, Jul 23, 2020 at 07:16:29AM +1000, Dave Chinner wrote:
> > On Mon, Jul 20, 2020 at 11:37:35PM +0000, Satya Tangirala wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Wire up iomap direct I/O with the fscrypt additions for direct I/O.
> > > This allows ext4 to support direct I/O on encrypted files when inline
> > > encryption is enabled.
> > > 
> > > This change consists of two parts:
> > > 
> > > - Set a bio_crypt_ctx on bios for encrypted files, so that the file
> > >   contents get encrypted (or decrypted).
> > > 
> > > - Ensure that encryption data unit numbers (DUNs) are contiguous within
> > >   each bio.  Use the new function fscrypt_limit_io_pages() for this,
> > >   since the iomap code works directly with logical ranges and thus
> > >   doesn't have a chance to call fscrypt_mergeable_bio() on each page.
> > > 
> > > Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
> > > DUNs simply increment along with the logical blocks.  But it's needed to
> > > handle an edge case in one of the fscrypt IV generation methods.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > Co-developed-by: Satya Tangirala <satyat@google.com>
> > > Signed-off-by: Satya Tangirala <satyat@google.com>
> > > ---
> > >  fs/iomap/direct-io.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > > index ec7b78e6feca..12064daa3e3d 100644
> > > --- a/fs/iomap/direct-io.c
> > > +++ b/fs/iomap/direct-io.c
> > > @@ -6,6 +6,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/compiler.h>
> > >  #include <linux/fs.h>
> > > +#include <linux/fscrypt.h>
> > >  #include <linux/iomap.h>
> > >  #include <linux/backing-dev.h>
> > >  #include <linux/uio.h>
> > > @@ -183,11 +184,16 @@ static void
> > >  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
> > >  		unsigned len)
> > >  {
> > > +	struct inode *inode = file_inode(dio->iocb->ki_filp);
> > >  	struct page *page = ZERO_PAGE(0);
> > >  	int flags = REQ_SYNC | REQ_IDLE;
> > >  	struct bio *bio;
> > >  
> > >  	bio = bio_alloc(GFP_KERNEL, 1);
> > > +
> > > +	/* encrypted direct I/O is guaranteed to be fs-block aligned */
> > > +	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));
> > 
> > Which means you are now placing a new constraint on this code in
> > that we cannot ever, in future, zero entire blocks here.
> > 
> > This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
> > blocks if necessary - so I think constraining it to only support
> > partial block zeroing by adding a warning like this is no correct.
> 
> In v3 and earlier this instead had the code to set an encryption context:
> 
> 	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> 				  GFP_KERNEL);
> 
> Would you prefer that, even though the call to fscrypt_set_bio_crypt_ctx() would

Actually, I have no idea what that function does. It's not in a
5.8-rc6 kernel, and it's not in this patchset....

> always be a no-op currently (since for now, iomap_dio_zero() will never be
> called with an encrypted file) and thus wouldn't be properly tested?

Same can be said for this WARN_ON_ONCE() code :)

But, in the interests of not leaving landmines, if a fscrypt context
is needed to be attached to the bio for data IO in direct IO, it
should be attached to all bios that are allocated in the dio path
rather than leave a landmine for people in future to trip over.

> BTW, iomap_dio_zero() is actually limited to one page, so it's not quite
> "arbitrary sizes".

Yup, but that's an implentation detail, not a design constraint.
i.e. I typically review/talk about how stuff functions at a
design/architecture level, not how it's been implemented in the
code.

e.g. block size > page size patches in progress make use of the
"arbitrary length" capability of the design:

https://lore.kernel.org/linux-xfs/20181107063127.3902-7-david@fromorbit.com/

> iomap is used for other filesystem operations too, so we need to consider when
> to actually do the limiting.  I don't think we should break up the extents
> returned FS_IOC_FIEMAP, for example.  FIEMAP already has a defined behavior.
> Also, it would be weird for the list of extents that FIEMAP returns to change
> depending on whether the filesystem is mounted with '-o inlinecrypt' or not.

We don't need to care about that in the iomap code. The caller
controls the behaviour of the mapping callbacks themselves via
the iomap_ops structure they pass into high level iomap functions.

> That also avoids any confusion between pages and blocks, which is nice.

FWIW, the latest version of the above patchset (which,
co-incidentally, I was bring up to date yesterday) abstracts away
page and block sizes. It introduces the concept of "chunk size"
which is calculated from the combination of the current page's size
and the current inode's block size.

i.e. in the near future we are going to have both variable page
sizes (on a per-page basis via Willy's current work) and per-inode
blocks sizes smaller, the same and larger than the size of the
current pager. Hence we need to get rid of any assumptions about
page sizes and block sizes in the iomap code, not introduce new
ones.

Hence if there is any limitation of filesystem functionality based
on block size vs page size, it is going to be up to the filesystem
to detect and enforce those restrictions, not the iomap
infrastructure.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
