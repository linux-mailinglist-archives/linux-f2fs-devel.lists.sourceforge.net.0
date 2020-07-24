Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30F22CC65
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 19:41:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz1hb-0001W8-7s; Fri, 24 Jul 2020 17:41:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jz1hZ-0001W0-Vb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 17:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VisFN3jfNpm725NbHrwycUIofvzdy81POEsFjQesTw4=; b=FVvc5cunsYruJYLy6jOvf2YY8h
 H2hKkCcpcl4XyObc9OMo3/ilmWoJU1MdWUvAB36c8BeXU0Rjc6b4150wOS3WMTGj8eTEXlkw4FNXm
 thAz7LjPkAURps1dkhmeT/YbeaO9LayGB6SVJetnyQvDkOmTYuoaL+ut3NXbYhTnCVlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VisFN3jfNpm725NbHrwycUIofvzdy81POEsFjQesTw4=; b=Jgsp976+SS555nbAy+scAtorAP
 bbk2q/oHPBSEWIgcMx1zG1poHqi/WcgcI1PTwRbzEMBLt+FHwbJzJnMSZ4dh7J2cBZqlI1cKQzGEN
 av8O4BeF/xC7LfLflfwF1t48H4YmYV40zMVcb+EaGHsCGFiGpO3p5owiVBqmXgp9Ht1E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jz1hT-007ncf-JE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 17:41:45 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 016BE2067D;
 Fri, 24 Jul 2020 17:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595612494;
 bh=aRMgYqgvo4BFbSMRZ6izOXZzYw7jYpwFPgZM1in6fMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jBZM5Y0g+E10PwoCqRC6t5F6HCknVy62WPLNvcAzxDV15X1J6NGfRf+WZ3Tdv4vEC
 PZev737/sUJJ5pcIQHzYt4uiOTtESBBEHz5SbsJhuZlXHLnK9gUZqLgGp/kHfWMDCs
 FfrARJduO1G+dnwJjrvvMzKNmhVqqtK6ncu1eGWg=
Date: Fri, 24 Jul 2020 10:41:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200724174132.GB819@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
 <20200723230345.GB870@sol.localdomain>
 <20200724013910.GH2005@dread.disaster.area>
 <20200724034628.GC870@sol.localdomain>
 <20200724053130.GO2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724053130.GO2005@dread.disaster.area>
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
X-Headers-End: 1jz1hT-007ncf-JE
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

On Fri, Jul 24, 2020 at 03:31:30PM +1000, Dave Chinner wrote:
> On Thu, Jul 23, 2020 at 08:46:28PM -0700, Eric Biggers wrote:
> > On Fri, Jul 24, 2020 at 11:39:10AM +1000, Dave Chinner wrote:
> > > fscrypt_inode_uses_inline_crypto() ends up being:
> > > 
> > > 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
> > > 	    inode->i_crypt_info->ci_inlinecrypt)
> > > 
> > > I note there are no checks for inode->i_crypt_info being non-null,
> > > and I note that S_ENCRYPTED is set on the inode when the on-disk
> > > encrypted flag is encountered, not when inode->i_crypt_info is set.
> > > 
> > 
> > ->i_crypt_info is set when the file is opened, so it's guaranteed to be set for
> > any I/O.  So the case you're concerned about just doesn't happen.
> 
> Ok. The connection is not obvious to someone who doesn't know the
> fscrypt code inside out.
> 
> > > > Note that currently, I don't think iomap_dio_bio_actor() would handle an
> > > > encrypted file with blocksize > PAGE_SIZE correctly, as the I/O could be split
> > > > in the middle of a filesystem block (even after the filesystem ensures that
> > > > direct I/O on encrypted files is fully filesystem-block-aligned, which we do ---
> > > > see the rest of this patchset), which isn't allowed on encrypted files.
> > > 
> > > That can already happen unless you've specifically restricted DIO
> > > alignments in the filesystem code. i.e. Direct IO already supports
> > > sub-block ranges and alignment, and we can already do user DIO on
> > > sub-block, sector aligned ranges just fine. And the filesystem can
> > > already split the iomap on sub-block alignments and ranges if it
> > > needs to because the iomap uses byte range addressing, not sector or
> > > block based addressing.
> > > 
> > > So either you already have a situation where the 2^32 offset can
> > > land *inside* a filesystem block, or the offset is guaranteed to be
> > > filesystem block aligned and so you'll never get this "break an IO
> > > on sub-block alignment" problem regardless of the filesystem block
> > > size...
> > > 
> > > Either way, it's not an iomap problem - it's a filesystem mapping
> > > problem...
> > > 
> > 
> > I think you're missing the point here.  Currently, the granularity of encryption
> > (a.k.a. "data unit size") is always filesystem blocks, so that's the minimum we
> > can directly read or write to an encrypted file.  This has nothing to do with
> > the IV wraparound case also being discussed.
> 
> So when you change the subject, please make it *really obvious* so
> that people don't think you are still talking about the same issue.
> 
> > For example, changing a single bit in the plaintext of a filesystem block may
> > result in the entire block's ciphertext changing.  (The exact behavior depends
> > on the cryptographic algorithm that is used.)
> > 
> > That's why this patchset makes ext4 only allow direct I/O on encrypted files if
> > the I/O is fully filesystem-block-aligned.  Note that this might be a more
> > strict alignment requirement than the bdev_logical_block_size().
> > 
> > As long as the iomap code only issues filesystem-block-aligned bios, *given
> > fully filesystem-block-aligned inputs*, we're fine.  That appears to be the case
> > currently.
> 
> The actual size and shape of the bios issued by direct IO (both old
> code and newer iomap code) is determined by the user supplied iov,
> the size of the biovec array allocated in the bio, and the IO
> constraints of the underlying hardware.  Hence direct IO does not
> guarantee alignment to anything larger than the underlying block
> device logical sector size because there's no guarantee when or
> where a bio will fill up.
> 
> To guarantee alignment of what ends up at the hardware, you have to
> set the block device parameters (e.g. logical sector size)
> appropriately all the way down the stack. You also need to ensure
> that the filesystem is correctly aligned on the block device so that
> filesystem blocks don't overlap things like RAID stripe boundaires,
> linear concat boundaries, etc.
> 
> IOWs, to constrain alignment in the IO path, you need to configure
> you system correct so that the information provided to iomap for IO
> alignment matches your requirements. This is not somethign iomap can
> do itself; everything from above needs to be constrained by the
> filesystem using iomap, everything sent below by iomap is
> constrained by the block device config.

That way of thinking about things doesn't entirely work for inline encryption.

Hardware can support multiple encryption "data unit sizes", some of which may be
larger than the logical block size.  (The data unit size is the granularity of
encryption.  E.g. if software selects data_unit_size=4096, then each invocation
of the encryption/decryption algorithm is passed 4096 bytes.  You can't then
later encrypt/decrypt just part of that; that's not how the algorithms work.)

For example hardware might *in general* support addressing 512-byte sectors and
thus have logical_block_size=512.  But it could also support encryption data
unit sizes [512, 1024, 2048, 4096].  Encrypted I/O has to be aligned to the data
unit size, not just to the logical block size.  The data unit size to use, and
whether to use encryption or not, is decided on a per-I/O basis.

So in this case technically it's the filesystem (and later the
bio::bi_crypt_context which the filesystem sets) that knows about the alignment
needed -- *not* the request_queue.

Is it your opinion that inline encryption should only be supported when
data_unit_size <= logical_block_size?  The problems with that are

    (a) Using an unnecessarily small data_unit_size degrades performance a
	lot -- for *all* I/O, not just direct I/O.  This is because there are a
	lot more separate encryptions/decryptions to do, and there's a fixed
	overhead to each one (much of which is intrinsic in the crypto
	algorithms themselves, i.e. this isn't simply an implementation quirk).

    (b) fscrypt currently only supports data_unit_size == filesystem_block_size.
	(OFC, filesystem_block_size may be greater than logical_block_size.)

    (c) Filesystem images would be less portable, unless the minimum
	data_unit_size were used everywhere which would degrade performance.

(We could address (b) by allowing users to specify data_unit_size when
encrypting a directory.  That would add complexity, but it's possible.)

But again, as far as I can tell, fs/iomap/direct-io.c currently *does* guarantee
that *if* the input is fully filesystem-block-aligned and if blocksize <=
PAGE_SIZE, then the issued I/O is also filesystem-block-aligned.

So as far as I can tell, there isn't really any problem there, at least not now.
I just want to make sure we're on the same page...

> 
> > (It's possible that in the future we'll support other encryption data unit
> > sizes, perhaps powers of 2 from 512 to filesystem block size.  But for now the
> > filesystem block size has been good enough for everyone,
> 
> Not the case. fscrypt use in enterprise environments needs support
> for block size < page size so that it can be deployed on 64kB page
> size machines without requiring 64kB filesystem block sizes.
> 

It's already supported (on ext4 since Linux v5.5).

What's not supported (yet) is data_unit_size < filesystem_block_size.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
