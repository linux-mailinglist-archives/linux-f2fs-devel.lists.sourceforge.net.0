Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C4F250751
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 20:21:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAH61-000149-QM; Mon, 24 Aug 2020 18:21:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kAH60-000142-NT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 18:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUOCoRGgX+TjrVs95R6YkR4vmbUM1GOdDiD67dZlusk=; b=OkFqD7fsins7atJOj9crmnDwzN
 nskHXCwDFL/i4wIoaYuubyyuCKNV0TIWAO0g8+2vuHdT3G4hMWfW4KsUrHc7n/gKdkpJ7g1zpQvea
 DzBmevGtOx+ULuOIj1m2PCdn4oIsaiXk32wrf3fqXpIwcDiAvjLNMKos1PSR2xvt8yXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bUOCoRGgX+TjrVs95R6YkR4vmbUM1GOdDiD67dZlusk=; b=I0udW8Piw3KG/GuqCFyv6R+KQq
 sHqRsJFhgeVPgkj5THRDCW1I3pAS/F/1fB0iqRcNV4Kda2TTBGIkkQ6eb+KwUDs3b2ZrZalv09wVa
 IYWpQ8KjYeY0vihZqB13JQXFDm3jINpwE1wnkbaE1xNCLDgr6qXhrSF4c02ZxWba4rnI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAH5x-00HHv3-VU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 18:21:28 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96FA820738;
 Mon, 24 Aug 2020 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598293275;
 bh=BPd9FqfRK57acJvZfHNixoCcKstFE02QTmcYRlfCq7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gSO2JDEBH2du9sVIqRO/ccvceJM7cC9d3CT0/1d7x0lyj5q9qdZRvB77EudGgmLBP
 DDXy3fjKwWLf31wIq1ym4KVx7/HdPpObHPD4gbEQTGggArK1CPr0EOlxDk/XQs4GGp
 MxEUAJwlx/5dWcs35/gGQek/09sGDl96J76TPivQ=
Date: Mon, 24 Aug 2020 11:21:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20200824182114.GB1650861@gmail.com>
References: <20200824061712.195654-1-ebiggers@kernel.org>
 <20200824061712.195654-2-ebiggers@kernel.org>
 <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
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
X-Headers-End: 1kAH5x-00HHv3-VU
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

On Mon, Aug 24, 2020 at 12:48:48PM -0400, Jeff Layton wrote:
> > +void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> > +			       const struct fscrypt_master_key *mk)
> > +{
> > +	WARN_ON(ci->ci_inode->i_ino == 0);
> > +	WARN_ON(!mk->mk_ino_hash_key_initialized);
> > +
> > +	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
> > +					      &mk->mk_ino_hash_key);
> 
> i_ino is an unsigned long. Will this produce a consistent results on
> arches with 32 and 64 bit long values? I think it'd be nice to ensure
> that we can access an encrypted directory created on a 32-bit host from
> (e.g.) a 64-bit host.

The result is the same regardless of word size and endianness.
siphash_1u64(v, k) is equivalent to:

	__le64 x = cpu_to_le64(v);
	siphash(&x, 8, k);

> It may be better to base this on something besides i_ino

This code that hashes the inode number is only used when userspace used
FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 for the directory.  IV_INO_LBLK_32 modifies
the encryption to be optimized for eMMC inline encryption hardware.  For more
details, see commit e3b1078bedd3 which added this feature.

We actually could have hashed the file nonce instead of the inode number.  But I
wanted to make the eMMC-optimized format similar to IV_INO_LBLK_64, which is the
format optimized for UFS inline encryption hardware.

Both of these flags have very specific use cases; they make it feasible to use
inline encryption hardware
(https://www.kernel.org/doc/html/latest/block/inline-encryption.html)
that only supports a small number of keyslots and that limits the IV length.

You don't need to worry about these flags at all for ceph, since there won't be
any use case to use them on ceph, and ceph won't be declaring support for them.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
