Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FF22BC98
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 05:46:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyofU-0000QE-Ux; Fri, 24 Jul 2020 03:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jyofT-0000Pu-3J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UMNpgyMujUfAbaooZ7BUGHu03Jeua8zlziOzEEt4UnA=; b=LJpn7xnNQISMSOYzWjaR27Dt1u
 +CnHbEWkhLjN2Vtwpxe4Hmuz5JsLlC1j89Nk5uQf17Ew3X6a5ZU9MKJNE5B1bol09XL+D//5upYwl
 Hfkzp+h4rxalXUTkQEI+wpHCR8P2Oh6xSqUmg8b8s2eKj/pqHVQzxQLyCLHoNNiW/64o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UMNpgyMujUfAbaooZ7BUGHu03Jeua8zlziOzEEt4UnA=; b=A9hHwMCc9qUBuk94UN6Ykwoe7q
 dJZLqKxxSiVrMQiKK1MIbYBRlVPolv0yNcTKpAJBoJCFUda3zl7a9jyFkI/7vidKE6xg/AW9qgw77
 6/uzhXq8bWhtTCl0+4w/DAzHyjd8xxyvG2KvFIjNYb8P8PzhmrSxPNNw9ap0z8G7FaJs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyofL-0010w6-Nt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:46:43 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2ACA020737;
 Fri, 24 Jul 2020 03:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595562390;
 bh=pPUCBb1jt6Lrxsoo0o8hKReHRYD0xJGH0DTBm1EV0nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tpm1viQaPoXsNLxNLfGtmlgtTknmnsOITffn595ampGcv9amIFI0ZJhNvRvasDZnW
 0oAungV8Khbyl5rEaMZTavzPemEejckF5v1e9cfbgMSRgjVrGUoCflgT95S77djRRO
 Lcr9KELG6LmMIXQSNoaV4Az4cPz4iR/mOOrMb7p4=
Date: Thu, 23 Jul 2020 20:46:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200724034628.GC870@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
 <20200723230345.GB870@sol.localdomain>
 <20200724013910.GH2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724013910.GH2005@dread.disaster.area>
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
X-Headers-End: 1jyofL-0010w6-Nt
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

On Fri, Jul 24, 2020 at 11:39:10AM +1000, Dave Chinner wrote:
> > fscrypt_set_bio_crypt_ctx() was introduced by
> > "fscrypt: add inline encryption support" on that branch.
> 
> Way too much static inline function abstraction.

Well, this is mostly because we're trying to be a good kernel citizen and
minimize the overhead when our feature isn't enabled or isn't being used.

Eventually we might remove CONFIG_FS_ENCRYPTION_INLINE_CRYPT and make
CONFIG_FS_ENCRYPTION always offer inline crypto support, which would simplify
things.  But for now we'd like to keep the separate option.

Also, previously people have complained about hardcoded S_ISREG() to decide
whether a file needs contents encryption, and said they prefer a helper function
fscrypt_needs_contents_encryption().  (Which is what we have now.)

So we can't make everyone happy...

> 
> fscrypt_inode_uses_inline_crypto() ends up being:
> 
> 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
> 	    inode->i_crypt_info->ci_inlinecrypt)
> 
> I note there are no checks for inode->i_crypt_info being non-null,
> and I note that S_ENCRYPTED is set on the inode when the on-disk
> encrypted flag is encountered, not when inode->i_crypt_info is set.
> 

->i_crypt_info is set when the file is opened, so it's guaranteed to be set for
any I/O.  So the case you're concerned about just doesn't happen.

If we're talking about handling a hypothetical bug where it does nevertheless
happen, there are three options:

(a) Crash (current behavior)
(b) Silently leave the file unencrypted, i.e. silently introduce a critical
    security vulnerability.
(c) Return an error, which would add a lot of code complexity because we'd have
    start returning an error from places like fscrypt_set_bio_crypt_ctx() that
    currently can't fail.  This would be dead code that's not tested.

I very much prefer (a), since it's the simplest option, and it also makes the
bug most likely to be reported and fixed, without leaving the possibility for
data to silently be left unencrypted.  Crashing isn't good (obviously), but the
other options are worse.

> Further, I note that the local variable for ci is fetched before
> fscrypt_inode_uses_inline_crypto() is run, so leaving a landmine for
> people who try to access ci before checking if inline crypto is
> enabled. Or, indeed, if S_ENCRYPTED is set and the crypt_info has
> not been set up, fscrypt_set_bio_crypt_ctx() will oops in the DIO
> path.

Sure, this is harmless currently, but we can move the assignment to 'ci'.

> > > > always be a no-op currently (since for now, iomap_dio_zero() will never be
> > > > called with an encrypted file) and thus wouldn't be properly tested?
> > > 
> > > Same can be said for this WARN_ON_ONCE() code :)
> > > 
> > > But, in the interests of not leaving landmines, if a fscrypt context
> > > is needed to be attached to the bio for data IO in direct IO, it
> > > should be attached to all bios that are allocated in the dio path
> > > rather than leave a landmine for people in future to trip over.
> > 
> > My concern is that if we were to pass the wrong 'lblk' to
> > fscrypt_set_bio_crypt_ctx(), we wouldn't catch it because it's not tested.
> > Passing the wrong 'lblk' would cause the data to be encrypted/decrypted
> > incorrectly.
> 
> When you implement sub-block DIO alignment for fscrypt enabled
> filesystems, fsx will tell you pretty quickly if you screwed up....
> 
> > Note that currently, I don't think iomap_dio_bio_actor() would handle an
> > encrypted file with blocksize > PAGE_SIZE correctly, as the I/O could be split
> > in the middle of a filesystem block (even after the filesystem ensures that
> > direct I/O on encrypted files is fully filesystem-block-aligned, which we do ---
> > see the rest of this patchset), which isn't allowed on encrypted files.
> 
> That can already happen unless you've specifically restricted DIO
> alignments in the filesystem code. i.e. Direct IO already supports
> sub-block ranges and alignment, and we can already do user DIO on
> sub-block, sector aligned ranges just fine. And the filesystem can
> already split the iomap on sub-block alignments and ranges if it
> needs to because the iomap uses byte range addressing, not sector or
> block based addressing.
> 
> So either you already have a situation where the 2^32 offset can
> land *inside* a filesystem block, or the offset is guaranteed to be
> filesystem block aligned and so you'll never get this "break an IO
> on sub-block alignment" problem regardless of the filesystem block
> size...
> 
> Either way, it's not an iomap problem - it's a filesystem mapping
> problem...
> 

I think you're missing the point here.  Currently, the granularity of encryption
(a.k.a. "data unit size") is always filesystem blocks, so that's the minimum we
can directly read or write to an encrypted file.  This has nothing to do with
the IV wraparound case also being discussed.

For example, changing a single bit in the plaintext of a filesystem block may
result in the entire block's ciphertext changing.  (The exact behavior depends
on the cryptographic algorithm that is used.)

That's why this patchset makes ext4 only allow direct I/O on encrypted files if
the I/O is fully filesystem-block-aligned.  Note that this might be a more
strict alignment requirement than the bdev_logical_block_size().

As long as the iomap code only issues filesystem-block-aligned bios, *given
fully filesystem-block-aligned inputs*, we're fine.  That appears to be the case
currently.  I was just pointing out that some changes might be needed to
maintain this property in the blocksize > PAGE_SIZE case (which again, for
encrypted files is totally unsupported at the moment anyway).

(It's possible that in the future we'll support other encryption data unit
sizes, perhaps powers of 2 from 512 to filesystem block size.  But for now the
filesystem block size has been good enough for everyone, and there would be a
significant performance hit when using a smaller size, so there hasn't been a
need to add the extra layer of complexity.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
