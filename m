Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7F22B9E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 01:04:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jykFp-0005ug-M8; Thu, 23 Jul 2020 23:03:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jykFo-0005uU-HD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 23:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3R0nHszQbWqU/bYmdEpmh6L++tKSM+C0P7h1/xsipqQ=; b=W/qwlEnNk1lvqRux25J5Wb2qJ8
 ST0QuCC9JpPFxafq+7fWviKbQMCTeOVj46A4ZgTLb4gX7UDiu2Adx3kAoJ8hhcknJ8ZzWxErNB/q2
 Inoxx34wj1YK6W7SGovFJffOgEzKfoDyuysdeK6k+70y29mPcXHcqXMqpsXxXi92o+kY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3R0nHszQbWqU/bYmdEpmh6L++tKSM+C0P7h1/xsipqQ=; b=ZHdrtPL+h3lVykvV0xoATnUDhx
 mTANEUmODYCWmtaBU8AWiEwAE7TlDP7XyvB3kQQR9qCkwRkxnnzGmKlWuR78fc3hoR8cn1G422w3v
 +3yJn+zLmWZaMz11RAN0YaMtdumDNiUaUE2OS7zybfe+J3QABoV5mmIVs3JOU42LGnBU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jykFk-000pY9-Rv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 23:03:56 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 620A820792;
 Thu, 23 Jul 2020 23:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595545426;
 bh=QdWGY5VWHK7mBRakapXRiqkUhSKLEr/EpXz7hEPCeOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zgCWqZE8YbJridmeImBcwHYZxkbMVaZPXdjbpZWqRCtqM2u3NGbPlP0/wAzyL4AkR
 aiX3qiKoTwFpxcxzjmEJAbAL0MhuOdBEHs72MaUBwf/aWj0fQiXqfv3NJQyJDKAZJ7
 SfA+wShcolHGd/UxOChRhVHThL3dmPwnezq2IUM0=
Date: Thu, 23 Jul 2020 16:03:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200723230345.GB870@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723220752.GF2005@dread.disaster.area>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jykFk-000pY9-Rv
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

Hi Dave,

On Fri, Jul 24, 2020 at 08:07:52AM +1000, Dave Chinner wrote:
> > > > @@ -183,11 +184,16 @@ static void
> > > >  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
> > > >  		unsigned len)
> > > >  {
> > > > +	struct inode *inode = file_inode(dio->iocb->ki_filp);
> > > >  	struct page *page = ZERO_PAGE(0);
> > > >  	int flags = REQ_SYNC | REQ_IDLE;
> > > >  	struct bio *bio;
> > > >  
> > > >  	bio = bio_alloc(GFP_KERNEL, 1);
> > > > +
> > > > +	/* encrypted direct I/O is guaranteed to be fs-block aligned */
> > > > +	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));
> > > 
> > > Which means you are now placing a new constraint on this code in
> > > that we cannot ever, in future, zero entire blocks here.
> > > 
> > > This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
> > > blocks if necessary - so I think constraining it to only support
> > > partial block zeroing by adding a warning like this is no correct.
> > 
> > In v3 and earlier this instead had the code to set an encryption context:
> > 
> > 	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> > 				  GFP_KERNEL);
> > 
> > Would you prefer that, even though the call to fscrypt_set_bio_crypt_ctx() would
> 
> Actually, I have no idea what that function does. It's not in a
> 5.8-rc6 kernel, and it's not in this patchset....

The cover letter mentions that this patchset is based on fscrypt/master.

That is, "master" of https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git

fscrypt_set_bio_crypt_ctx() was introduced by
"fscrypt: add inline encryption support" on that branch.

> 
> > always be a no-op currently (since for now, iomap_dio_zero() will never be
> > called with an encrypted file) and thus wouldn't be properly tested?
> 
> Same can be said for this WARN_ON_ONCE() code :)
> 
> But, in the interests of not leaving landmines, if a fscrypt context
> is needed to be attached to the bio for data IO in direct IO, it
> should be attached to all bios that are allocated in the dio path
> rather than leave a landmine for people in future to trip over.

My concern is that if we were to pass the wrong 'lblk' to
fscrypt_set_bio_crypt_ctx(), we wouldn't catch it because it's not tested.
Passing the wrong 'lblk' would cause the data to be encrypted/decrypted
incorrectly.

It's not a big deal though, as it's "obviously correct".  So we can just go
with that if you prefer it.

> 
> > BTW, iomap_dio_zero() is actually limited to one page, so it's not quite
> > "arbitrary sizes".
> 
> Yup, but that's an implentation detail, not a design constraint.
> i.e. I typically review/talk about how stuff functions at a
> design/architecture level, not how it's been implemented in the
> code.
> 
> e.g. block size > page size patches in progress make use of the
> "arbitrary length" capability of the design:
> 
> https://lore.kernel.org/linux-xfs/20181107063127.3902-7-david@fromorbit.com/
> 
> > iomap is used for other filesystem operations too, so we need to consider when
> > to actually do the limiting.  I don't think we should break up the extents
> > returned FS_IOC_FIEMAP, for example.  FIEMAP already has a defined behavior.
> > Also, it would be weird for the list of extents that FIEMAP returns to change
> > depending on whether the filesystem is mounted with '-o inlinecrypt' or not.
> 
> We don't need to care about that in the iomap code. The caller
> controls the behaviour of the mapping callbacks themselves via
> the iomap_ops structure they pass into high level iomap functions.

Sure, I wasn't saying we need to.  I was talking about what we need to do in
ext4.

> 
> > That also avoids any confusion between pages and blocks, which is nice.
> 
> FWIW, the latest version of the above patchset (which,
> co-incidentally, I was bring up to date yesterday) abstracts away
> page and block sizes. It introduces the concept of "chunk size"
> which is calculated from the combination of the current page's size
> and the current inode's block size.
> 
> i.e. in the near future we are going to have both variable page
> sizes (on a per-page basis via Willy's current work) and per-inode
> blocks sizes smaller, the same and larger than the size of the
> current pager. Hence we need to get rid of any assumptions about
> page sizes and block sizes in the iomap code, not introduce new
> ones.
> 
> Hence if there is any limitation of filesystem functionality based
> on block size vs page size, it is going to be up to the filesystem
> to detect and enforce those restrictions, not the iomap
> infrastructure.

Sure, again I was talking about what we'll be doing in ext4, since with the
proposed change, it will be ext4 that does fscrypt_limit_io_blocks().  The limit
is based on blocks, not pages, so "fscrypt_limit_io_pages()" was a bit weird.

Note that currently, I don't think iomap_dio_bio_actor() would handle an
encrypted file with blocksize > PAGE_SIZE correctly, as the I/O could be split
in the middle of a filesystem block (even after the filesystem ensures that
direct I/O on encrypted files is fully filesystem-block-aligned, which we do ---
see the rest of this patchset), which isn't allowed on encrypted files.

However we currently don't support blocksize > PAGE_SIZE in ext4, f2fs, or
fs/crypto/ at all, so I don't think we should add extra logic to fs/iomap/ to
try to handle that case for encrypted files when we'd have no way to test it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
