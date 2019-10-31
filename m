Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC986EB9AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 23:25:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQIsZ-0007VX-5b; Thu, 31 Oct 2019 22:25:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iQIsX-0007VO-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 22:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVPVKnuPWZDMfmuP85ENbhVxMobP2aZ5AWb6b/NH0qI=; b=RAzKT+Zh5kjQM5+I2rXQHGcQ+x
 s+fC+dj4KswTrZ4wwgkBvDqJJKKmw6B3Imr/nn8im9DpFYtn+hWuNUeZD24VTJJIDOjivl+d5zzwx
 OjqmEbrJsuUofDqchfQxM9QDCUHfztOFMhf6VDCap1Bg0ofMq5FmfXf+oM5ka5M/j0xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVPVKnuPWZDMfmuP85ENbhVxMobP2aZ5AWb6b/NH0qI=; b=VhhAwTQr1iZ/YDZ+HtweJmZMfR
 nrN8ZajXUZ76++HGCHGRx6IAY46nBlJwIwLpP4nSia8b1DqsA18W7p+47AvolbgaEz9Z2Lw/klCCm
 J8Llp/yjDMJc/QueWmLxnsJjuMEZN58eOrFz3wIJSSDhh1YmGPIqV6BkWCObqFIaMNg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQIsT-00D64c-2J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 22:25:17 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E73562080F;
 Thu, 31 Oct 2019 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572560705;
 bh=ftYhWj4O4+ImXsZ36eQsPiXlqWILGWsZJF3VA/2bPe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxrpMWOZi/jca6U4O0ffuqvB0mi6Hjw9uCnz33WOlQcUfN2d++AGFEaDrQv6W8FkU
 kKJpvd5fHygSqAPexEN/vOxQnp+sb1OHcalAvJOW2V+chhq+UrBufMHIOJkKNDCzuz
 XpNn9I+zWcBk3MwpOZndqUfdhbhYyMt4lgDpWtys=
Date: Thu, 31 Oct 2019 15:25:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191031222500.GB111219@gmail.com>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 Satya Tangirala <satyat@google.com>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-8-satyat@google.com>
 <20191031183217.GF23601@infradead.org>
 <20191031202125.GA111219@gmail.com>
 <20191031212103.GA6244@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031212103.GA6244@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQIsT-00D64c-2J
Subject: Re: [f2fs-dev] [PATCH v5 7/9] fscrypt: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 02:21:03PM -0700, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 01:21:26PM -0700, Eric Biggers wrote:
> > > > +	/* The file must need contents encryption, not filenames encryption */
> > > > +	if (!S_ISREG(inode->i_mode))
> > > > +		return false;
> > > 
> > > But that isn't really what the check checks for..
> > 
> > This is how fscrypt has always worked.  The type of encryption to do is
> > determined as follows:
> > 
> > S_ISREG() => contents encryption
> > S_ISDIR() || S_ISLNK() => filenames encryption
> > 
> > See e.g. select_encryption_mode(), and similar checks elsewhere in
> > fs/{crypto,ext4,f2fs}/.
> > 
> > Do you have a suggestion to make it clearer?
> 
> Maybe have a fscrypt_content_encryption helper that currently
> evaluates to S_ISREG(inode->i_mode) as that documents the intent?

It's more important to clean up the IS_ENCRYPTED(inode) &&
S_ISREG(inode->i_mode) checks that are duplicated in fs/{ext4,f2fs}/, so I've
been thinking of adding a helper:

static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
{
        return IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENCRYPTED(inode) &&
               S_ISREG(inode->i_mode);
}

It could be used here too, though only S_ISREG() is actually needed here, so it
wouldn't be as good of a fit.

Anyway, this will need to be a separate cleanup.

> 
> > > > +	/* The filesystem must be mounted with -o inlinecrypt */
> > > > +	if (!sb->s_cop->inline_crypt_enabled ||
> > > > +	    !sb->s_cop->inline_crypt_enabled(sb))
> > > > +		return false;
> > > 
> > > So please add a SB_* flag for that option instead of the weird
> > > indirection.
> > 
> > IMO it's not really "weird" given that the point of the fscrypt_operations is to
> > expose filesystem-specific stuff to fs/crypto/.  But yes, using one of the SB_*
> > bits would make it simpler, so if people are fine with that we'll do that.
> 
> I think that is much simpler.  Additionally it could also replace the
> need for the has_stable_inodes and get_ino_and_lblk_bits methods, which
> are pretty weird.  Instead just document the requirements for the
> SB_INLINE_CRYPT flag and handle the rest in the file system.  That is
> for f2f always set it, and for ext4 set it based on s_inodes_count.
> Which brings me to:
> 

I don't think combining these things is a good idea because it would restrict
the use of inline encryption to filesystems that allow IV_INO_LBLK_64 encryption
policies, i.e. filesystems that have stable inode numbers, 32-bit inodes, and
32-bit file logical block numbers.

The on-disk format (i.e. the type of encryption policy chosen) and the
implementation (inline or filesystem-layer crypto) are really two separate
things.  This was one of the changes in v4 => v5 of this patchset; these two
things used to be conflated but now they are separate.  Now you can use inline
encryption with the existing fscrypt policies too.

We could use two separate SB_* flags, like SB_INLINE_CRYPT and
SB_IV_INO_LBLK_64_SUPPORT.  However, the ->has_stable_inodes() and
->get_ino_and_lblk_bits() methods are nice because they separate the filesystem
properties from the question of "is this encryption policy supported".
Declaring the filesystem properties is easier to do because it doesn't require
any fscrypt-specific knowledge.  Also, fs/crypto/ could use these properties in
different ways in the future, e.g. if another IV generation scheme is added.

> > > 
> > > Btw, I'm not happy about the 8-byte IV assumptions everywhere here.
> > > That really should be a parameter, not hardcoded.
> > 
> > To be clear, the 8-byte IV assumption doesn't really come from fs/crypto/, but
> > rather in what the blk-crypto API provides.  If blk-crypto were to provide
> > longer IV support, fs/crypto/ would pretty easily be able to make use of it.
> 
> That's what I meant - we hardcode the value in fscrypt.  Instead we need
> to expose the size from blk-crypt and check for it.
> 

If we add variable-length IV support, I think it should be handled in the same
way as crypto algorithms.  The current model is that the bio submitter doesn't
need to check whether the crypto algorithm is supported by the device, because
blk-crypto will fall back to the crypto API if needed.  Unsupported IV lengths
could be handled in the same way.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
