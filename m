Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98325086B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 20:47:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAHV1-0002O0-AH; Mon, 24 Aug 2020 18:47:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>) id 1kAHUz-0002Ns-8C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 18:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UBNcspxDRR85DOgAeIa07/7AG40+efgx2oDd/oWqbeA=; b=IbEy01SKUj/91Fe2reJaQ788Lj
 YltjmGiOMAUCuF52AvB5hzj+S4/NQdnGG8xGjhkLoRX8kqpVXokyIks2yBwE4OmW4aN6dsJzSPnJY
 CgALWeFOj1l0drE+lCm6dI72XmhWWZeOjB1MkKnlJIftMu93eXQITKgBJ4xyVZ2Zx8pI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UBNcspxDRR85DOgAeIa07/7AG40+efgx2oDd/oWqbeA=; b=UZtdE5n3SDAdL83gyTzej2+ZmG
 WfmIm6/T5zxA7wNzh5d8PYr8RrKTujeCK/pQ7WVqBZ3AGZ8RIZUi3TKkvmz4hEapw1ZArgT6sWZk7
 QGfFe5wZ7nIM8Mj7o2vaVwFT8rpdN9Q3urv/g1ji9sqtgi6+2eqrOGJOFROZNGfIInT4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAHUw-002h7b-8D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 18:47:17 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3950E2065F;
 Mon, 24 Aug 2020 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598294828;
 bh=Q7rmqcK2cO9kRc9mX2R6752q1QKh7uDgYP8Nhp7kyZI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jW/d0Pp4ABd3WvH2jRkyX22o8nNqFLAVEM/VSskJLw2gvHHnZXrjOHSDgr3mVdwG0
 dV4128xFP6onTskk79j4bPFBm6QXO20H6zHsikIukfmpAWaXp/Gm48/7ic85qV5ZZQ
 GftdbOJTX3YHxf3lfJum6XjMMK0spCkkUxBerdlE=
Message-ID: <06a7d9562b84354eb72bd67c9d4b7262dac53457.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 24 Aug 2020 14:47:07 -0400
In-Reply-To: <20200824182114.GB1650861@gmail.com>
References: <20200824061712.195654-1-ebiggers@kernel.org>
 <20200824061712.195654-2-ebiggers@kernel.org>
 <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
 <20200824182114.GB1650861@gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kAHUw-002h7b-8D
Subject: Re: [f2fs-dev] [RFC PATCH 1/8] fscrypt: add
 fscrypt_prepare_new_inode() and fscrypt_set_context()
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-08-24 at 11:21 -0700, Eric Biggers wrote:
> On Mon, Aug 24, 2020 at 12:48:48PM -0400, Jeff Layton wrote:
> > > +void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> > > +			       const struct fscrypt_master_key *mk)
> > > +{
> > > +	WARN_ON(ci->ci_inode->i_ino == 0);
> > > +	WARN_ON(!mk->mk_ino_hash_key_initialized);
> > > +
> > > +	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
> > > +					      &mk->mk_ino_hash_key);
> > 
> > i_ino is an unsigned long. Will this produce a consistent results on
> > arches with 32 and 64 bit long values? I think it'd be nice to ensure
> > that we can access an encrypted directory created on a 32-bit host from
> > (e.g.) a 64-bit host.
> 
> The result is the same regardless of word size and endianness.
> siphash_1u64(v, k) is equivalent to:
> 
> 	__le64 x = cpu_to_le64(v);
> 	siphash(&x, 8, k);
> 

In the case where you have an (on-storage) inode number that is larger
than 2^32, x will almost certainly be different on a 32 vs. 64-bit
wordsize.

On the box with the 32-bit wordsize, you'll end up promoting i_ino to a
64-bit word and the upper 32 bits will be zeroed out. So it seems like
this means that if you're using inline hardware you're going to end up
with a result that won't work correctly across different wordsizes.

Maybe that's ok, but it seems like something that could be handled by
hashing a different value.

> > It may be better to base this on something besides i_ino
> 
> This code that hashes the inode number is only used when userspace used
> FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 for the directory.  IV_INO_LBLK_32 modifies
> the encryption to be optimized for eMMC inline encryption hardware.  For more
> details, see commit e3b1078bedd3 which added this feature.
> 
> We actually could have hashed the file nonce instead of the inode number.  But I
> wanted to make the eMMC-optimized format similar to IV_INO_LBLK_64, which is the
> format optimized for UFS inline encryption hardware.
> 
> Both of these flags have very specific use cases; they make it feasible to use
> inline encryption hardware
> (https://www.kernel.org/doc/html/latest/block/inline-encryption.html)
> that only supports a small number of keyslots and that limits the IV length.
> 
> You don't need to worry about these flags at all for ceph, since there won't be
> any use case to use them on ceph, and ceph won't be declaring support for them.

Ahh, good to know. Thanks!
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
