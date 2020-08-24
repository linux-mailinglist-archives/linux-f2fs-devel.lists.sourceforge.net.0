Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F58250A4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 22:49:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAJPD-0003hI-Ps; Mon, 24 Aug 2020 20:49:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kAJPC-0003hA-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 20:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EIkdVfYAXZ0nF63I2+0jyZKFVY03yR4ihWoXcoRKcn8=; b=VXcOGZ15y9ClIiWmZKOBGRtOwO
 RKyZ2937QpQ+PiUV9mPMIACnltcpMmkuIdXkhpXnNJRONjdedhj6qnTvRK0Tt0lZAhwssJc65V3v6
 CIlf40IKjBU15yalrkJl3e5H3A4sRWh+tsILspFXoqis6N0EEQ4d2jM6u928UCpTBiRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EIkdVfYAXZ0nF63I2+0jyZKFVY03yR4ihWoXcoRKcn8=; b=lv6lkzsm2ndhvveyQFc4RzFXOj
 SOhMoKYH0bzlJ00GA09yPr+JmsXpkJd5CupvvRqCwA6XEpyOzT6Y1bG/knS9C/RxFcbJ0J7awp7mk
 I21cMEx5XnXAW74au/cwrQKDt3wUpGg6nHTg2u21RYC5MU65QPbg1UJFtcoLAaRpklp0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAJPA-005a6r-He
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 20:49:26 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 195B02067C;
 Mon, 24 Aug 2020 20:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598302154;
 bh=PDF5FB3f/iX6KmB9XrlWFrnk42OQsjSRBtJ1FLkbKmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jUh/EXYBZSsJDdmVjLNI9Ide1YTidVvRvP57Wf4SyWXTEaa/Oq3Sun1fEYKw2zPbo
 aKCpyYiHp520+hjmEuKybQsRGqMfFfEWdJnjuX5r1U5Kobvoccm1Wqv2sA2JRBKfsY
 /d8CDZHgd3G1/Lq1Dw0aWx5EI4uNe9CYC6tcvDpQ=
Date: Mon, 24 Aug 2020 13:49:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20200824204912.GD1650861@gmail.com>
References: <20200824061712.195654-1-ebiggers@kernel.org>
 <20200824061712.195654-2-ebiggers@kernel.org>
 <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
 <20200824182114.GB1650861@gmail.com>
 <06a7d9562b84354eb72bd67c9d4b7262dac53457.camel@kernel.org>
 <20200824190221.GC1650861@gmail.com>
 <fe81c713ed827b91004b0e2838800684da33e60c.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe81c713ed827b91004b0e2838800684da33e60c.camel@kernel.org>
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
X-Headers-End: 1kAJPA-005a6r-He
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

On Mon, Aug 24, 2020 at 03:42:59PM -0400, Jeff Layton wrote:
> On Mon, 2020-08-24 at 12:02 -0700, Eric Biggers wrote:
> > On Mon, Aug 24, 2020 at 02:47:07PM -0400, Jeff Layton wrote:
> > > On Mon, 2020-08-24 at 11:21 -0700, Eric Biggers wrote:
> > > > On Mon, Aug 24, 2020 at 12:48:48PM -0400, Jeff Layton wrote:
> > > > > > +void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> > > > > > +			       const struct fscrypt_master_key *mk)
> > > > > > +{
> > > > > > +	WARN_ON(ci->ci_inode->i_ino == 0);
> > > > > > +	WARN_ON(!mk->mk_ino_hash_key_initialized);
> > > > > > +
> > > > > > +	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
> > > > > > +					      &mk->mk_ino_hash_key);
> > > > > 
> > > > > i_ino is an unsigned long. Will this produce a consistent results on
> > > > > arches with 32 and 64 bit long values? I think it'd be nice to ensure
> > > > > that we can access an encrypted directory created on a 32-bit host from
> > > > > (e.g.) a 64-bit host.
> > > > 
> > > > The result is the same regardless of word size and endianness.
> > > > siphash_1u64(v, k) is equivalent to:
> > > > 
> > > > 	__le64 x = cpu_to_le64(v);
> > > > 	siphash(&x, 8, k);
> > > > 
> > > 
> > > In the case where you have an (on-storage) inode number that is larger
> > > than 2^32, x will almost certainly be different on a 32 vs. 64-bit
> > > wordsize.
> > > 
> > > On the box with the 32-bit wordsize, you'll end up promoting i_ino to a
> > > 64-bit word and the upper 32 bits will be zeroed out. So it seems like
> > > this means that if you're using inline hardware you're going to end up
> > > with a result that won't work correctly across different wordsizes.
> > 
> > That's only possible if the VFS is truncating the inode number, which would also
> > break userspace in lots of ways like making applications think that files are
> > hard-linked together when they aren't.  Also, IV_INO_LBLK_64 would break.
> > 
> > The correct fix for that would be to make inode::i_ino 64-bit.
> > 
> 
> ...or just ask the filesystem for the 64-bit inode number via ->getattr
> or a new op. You could also just truncate it down to 32 bits or xor the
> top and bottom bits together first, etc...
> 
> > Note that ext4 and f2fs (currently the only filesystems that support the
> > IV_INO_LBLK_* flags) only support 32-bit inode numbers.
> > 
> 
> Ahh, ok. That explains why it's not been an issue so far. Still, if
> you're reworking this code anyway, you might want to consider avoiding
> i_ino here.

Let's just enforce ino_bits <= 32 for IV_INO_LBLK_32 for now,
like is done for IV_INO_LBLK_64:
https://lkml.kernel.org/r/20200824203841.1707847-1-ebiggers@kernel.org

There's no need to add extra complexity for something that no one wants yet.

(And as mentioned, this won't prevent ceph or other filesystems with 64-bit
inode numbers from adding support for fscrypt, as IV_INO_LBLK_32 support is
optional and has a pretty specific use case.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
