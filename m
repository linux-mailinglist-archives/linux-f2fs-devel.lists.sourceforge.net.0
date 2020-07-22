Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C222A269
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 00:34:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyNJX-0006BI-6U; Wed, 22 Jul 2020 22:34:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jyNJV-0006B7-L1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 22:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iAzFLSXCCbfHr7KsBCH7Mv+Q/UrydboqviIcPnG/7ag=; b=cRXWr9BsXsrI5mOmCvTOtendAp
 3tl4XFzXAJNMnCS8NJHcFdZ5DSa+Pd+IjWFrMFlrll/jpFbLwOKXaHZuq842/sCO9Vth5FU63DTzy
 TKOt/6UWfnttMnjD8mEyCAFGB8FlT0fuXdjTL80KWhI6GM+la1tdF1LgK8355HEitaq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iAzFLSXCCbfHr7KsBCH7Mv+Q/UrydboqviIcPnG/7ag=; b=Jp2rnqopjPkB5SJrhchDHABs+N
 yMMxQtxaPvI7rm5BPIq2mwOgDriE1vz2f8cDl2DgClP4feOIWtNRyamPHiCnNptSWuQD9lZnlB1/+
 yJmkBzcjPT5KFxqYHzHTc1M70wRVKaJv2lBasIppuZntQo8fug37n2IkGAdfMXCgTsr4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyNJU-00H9J0-4A
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 22:34:13 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E0E92071A;
 Wed, 22 Jul 2020 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595457246;
 bh=i6hBv/i9scmmpbAGTC0H3ugXMQf4f1tSC3XJweNkVwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dnx0SjfojEkPJG6IU8BxxYBRx4TPyCIl+eNmbzvebTMbC4CkvoePdp02WXiio6tmF
 zthZPCiUISxyzAgWujz/daL5e/dFL5pCZ2Afzpmqoe9YWDk10IzjkuWmw1mU4X2US4
 D3e6JZ/K50R5zvQgxwwpURIjADIbr2T8sjrg4cCE=
Date: Wed, 22 Jul 2020 15:34:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200722223404.GA76479@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722211629.GE2005@dread.disaster.area>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyNJU-00H9J0-4A
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

On Thu, Jul 23, 2020 at 07:16:29AM +1000, Dave Chinner wrote:
> On Mon, Jul 20, 2020 at 11:37:35PM +0000, Satya Tangirala wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Wire up iomap direct I/O with the fscrypt additions for direct I/O.
> > This allows ext4 to support direct I/O on encrypted files when inline
> > encryption is enabled.
> > 
> > This change consists of two parts:
> > 
> > - Set a bio_crypt_ctx on bios for encrypted files, so that the file
> >   contents get encrypted (or decrypted).
> > 
> > - Ensure that encryption data unit numbers (DUNs) are contiguous within
> >   each bio.  Use the new function fscrypt_limit_io_pages() for this,
> >   since the iomap code works directly with logical ranges and thus
> >   doesn't have a chance to call fscrypt_mergeable_bio() on each page.
> > 
> > Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
> > DUNs simply increment along with the logical blocks.  But it's needed to
> > handle an edge case in one of the fscrypt IV generation methods.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Co-developed-by: Satya Tangirala <satyat@google.com>
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> > ---
> >  fs/iomap/direct-io.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index ec7b78e6feca..12064daa3e3d 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/module.h>
> >  #include <linux/compiler.h>
> >  #include <linux/fs.h>
> > +#include <linux/fscrypt.h>
> >  #include <linux/iomap.h>
> >  #include <linux/backing-dev.h>
> >  #include <linux/uio.h>
> > @@ -183,11 +184,16 @@ static void
> >  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
> >  		unsigned len)
> >  {
> > +	struct inode *inode = file_inode(dio->iocb->ki_filp);
> >  	struct page *page = ZERO_PAGE(0);
> >  	int flags = REQ_SYNC | REQ_IDLE;
> >  	struct bio *bio;
> >  
> >  	bio = bio_alloc(GFP_KERNEL, 1);
> > +
> > +	/* encrypted direct I/O is guaranteed to be fs-block aligned */
> > +	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));
> 
> Which means you are now placing a new constraint on this code in
> that we cannot ever, in future, zero entire blocks here.
> 
> This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
> blocks if necessary - so I think constraining it to only support
> partial block zeroing by adding a warning like this is no correct.

In v3 and earlier this instead had the code to set an encryption context:

	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
				  GFP_KERNEL);

Would you prefer that, even though the call to fscrypt_set_bio_crypt_ctx() would
always be a no-op currently (since for now, iomap_dio_zero() will never be
called with an encrypted file) and thus wouldn't be properly tested?

BTW, iomap_dio_zero() is actually limited to one page, so it's not quite
"arbitrary sizes".
	
> 
> > @@ -253,6 +259,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
> >  		ret = nr_pages;
> >  		goto out;
> >  	}
> > +	nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
> 
> So if "pos" overlaps a 2^32 offset when a certain mode is used, we
> have to break up the IO?

More or less.  It's actually when 'hashed_ino + (pos >> i_blkbits)' overlaps a
2^32 offset.  But yes, we have to break up the I/O when it happens.

> 
> If true, I'm not sure that this belongs here. Limiting the size of
> the IOs because of filesytem contraints belongs in the filesystem
> extent mapping code. That's the point where the IO is broken up into
> maximally sized chunks the filesystem can issue as a contiguous
> range. If the fscrypt code is breaking that "contiguous IO range"
> because of the mode being used, the fs mapping code should break
> the mapping at the boundery where the IO needs to be broken.
> 
> Hence the dio mapping code here will never build IOs that cross this
> -filesystem- encryption limitation, and we don't need this fscrypt
> code in the direct IO path at all.
> 

I think that would work.

iomap is used for other filesystem operations too, so we need to consider when
to actually do the limiting.  I don't think we should break up the extents
returned FS_IOC_FIEMAP, for example.  FIEMAP already has a defined behavior.
Also, it would be weird for the list of extents that FIEMAP returns to change
depending on whether the filesystem is mounted with '-o inlinecrypt' or not.

So, something like this:

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 44bad4bb8831..2816194db46c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3437,6 +3437,15 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	map.m_len = min_t(loff_t, (offset + length - 1) >> blkbits,
 			  EXT4_MAX_LOGICAL_BLOCK) - map.m_lblk + 1;
 
+	/*
+	 * When inline encryption is enabled, sometimes I/O to an encrypted file
+	 * has to be broken up to guarantee DUN contiguity.  Handle this by
+	 * limiting the length of the mapping returned.
+	 */
+	if (!(flags & IOMAP_REPORT))
+		map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk,
+						    map.m_len);
+
 	if (flags & IOMAP_WRITE)
 		ret = ext4_iomap_alloc(inode, &map, flags);
 	else


That also avoids any confusion between pages and blocks, which is nice.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
