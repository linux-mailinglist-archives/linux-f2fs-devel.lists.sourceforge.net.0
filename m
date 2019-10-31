Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB0EB8DC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 22:21:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQHse-00038W-Ul; Thu, 31 Oct 2019 21:21:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iQHsb-00037w-1H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 21:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRZ+nTg/oBAxQOyMgulFSF0uTIrqlXXuEUAWLYjYp6Q=; b=aVqnIHO14tiAVzV/kkDXzsJRE5
 w5nTzEjU6S8+gLRBfofqv02+nhBTDohMBeG5r5WC3apoPcT3P4fVL0ZbyMVvkHjwNutMrcmw+8s9c
 YA2FPLlJcOvyly+3LY//yYn51AiVksTBIn5KiZdbio1C4nJb9E/G8daclfbjd+UIex2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRZ+nTg/oBAxQOyMgulFSF0uTIrqlXXuEUAWLYjYp6Q=; b=BaJNBUbGfhEaCdJXyyqUs1C5si
 RFyREPYl+BQBiwONnLKbpRRqSqWV/j+fZj/dUbVKMwQ6rj6N6UTC6v1LDsDp4gIU/DK+CCGD9PmJG
 rmXK1uPrbzFGPft+cC2UgHPw6GcoiLzEL6QXutavsYcfWkF1KuYVS3LMe/2JOcKwGSg8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQHsZ-00BNvw-0w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 21:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRZ+nTg/oBAxQOyMgulFSF0uTIrqlXXuEUAWLYjYp6Q=; b=C32SpKuxySxEeI5or3GY09+IG
 Ykcm2m1sSvMQQNPubmhrBYcD+aJ4810Jl/59sm7P/pHN1RpIdqQi7lSHLNc17qVdCfNGbNKJW7NDq
 cliqM6glMTyF6yIvMfzHclmo9CFUyLzhbr5cT8D9iKSzkjFTxrzVHcmULQs4+Yp7Fp5C7IxGt9Yje
 x9/GoOmHikPm2M/1LP0KSYfzOPa4GYz7qZLpRMwnrwwwTk9garomR5i7qqxo6NGGkoxLcHaBfe+I4
 IDaJnQ6TGUeikahzJ5XoLUc378+gd/JDDymwVtJ67mLIILUZ9eIw4U4IXbGjYXAsOX4vtSG4zzUby
 tfkO7Guow==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQHsN-0008J2-Tj; Thu, 31 Oct 2019 21:21:03 +0000
Date: Thu, 31 Oct 2019 14:21:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>, Satya Tangirala <satyat@google.com>,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Message-ID: <20191031212103.GA6244@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-8-satyat@google.com>
 <20191031183217.GF23601@infradead.org>
 <20191031202125.GA111219@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031202125.GA111219@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQHsZ-00BNvw-0w
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 01:21:26PM -0700, Eric Biggers wrote:
> > > +	/* The file must need contents encryption, not filenames encryption */
> > > +	if (!S_ISREG(inode->i_mode))
> > > +		return false;
> > 
> > But that isn't really what the check checks for..
> 
> This is how fscrypt has always worked.  The type of encryption to do is
> determined as follows:
> 
> S_ISREG() => contents encryption
> S_ISDIR() || S_ISLNK() => filenames encryption
> 
> See e.g. select_encryption_mode(), and similar checks elsewhere in
> fs/{crypto,ext4,f2fs}/.
> 
> Do you have a suggestion to make it clearer?

Maybe have a fscrypt_content_encryption helper that currently
evaluates to S_ISREG(inode->i_mode) as that documents the intent?

> > > +	/* The filesystem must be mounted with -o inlinecrypt */
> > > +	if (!sb->s_cop->inline_crypt_enabled ||
> > > +	    !sb->s_cop->inline_crypt_enabled(sb))
> > > +		return false;
> > 
> > So please add a SB_* flag for that option instead of the weird
> > indirection.
> 
> IMO it's not really "weird" given that the point of the fscrypt_operations is to
> expose filesystem-specific stuff to fs/crypto/.  But yes, using one of the SB_*
> bits would make it simpler, so if people are fine with that we'll do that.

I think that is much simpler.  Additionally it could also replace the
need for the has_stable_inodes and get_ino_and_lblk_bits methods, which
are pretty weird.  Instead just document the requirements for the
SB_INLINE_CRYPT flag and handle the rest in the file system.  That is
for f2f always set it, and for ext4 set it based on s_inodes_count.
Which brings me to:

> > 
> > Btw, I'm not happy about the 8-byte IV assumptions everywhere here.
> > That really should be a parameter, not hardcoded.
> 
> To be clear, the 8-byte IV assumption doesn't really come from fs/crypto/, but
> rather in what the blk-crypto API provides.  If blk-crypto were to provide
> longer IV support, fs/crypto/ would pretty easily be able to make use of it.

That's what I meant - we hardcode the value in fscrypt.  Instead we need
to expose the size from blk-crypt and check for it.

> 
> (And if IVs >= 24 bytes were supported and we added AES-128-CBC-ESSIV and
> Adiantum support to blk-crypto.c, then inline encryption would be able to do
> everything that the existing filesystem-layer contents encryption can do.)
> 
> Do you have anything in mind for how to make the API support longer IVs in a
> clean way?  Are you thinking of something like:
> 
> 	#define BLK_CRYPTO_MAX_DUN_SIZE	24
> 
> 	u8 dun[BLK_CRYPTO_MAX_DUN_SIZE];
> 	int dun_size;
> 
> We do have to perform arithmetic operations on it, so a byte array would make it
> ugly and slower, but it should be possible...

Well, we could make it an array of u64s, which means we can do all the
useful arithmetics on components on one of them.  But I see the point,
this adds significant complexity for no real short term gain, and we
should probably postponed it until needed.  Maybe just document the
assumptions a little better.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
