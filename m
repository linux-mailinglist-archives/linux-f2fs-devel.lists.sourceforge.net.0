Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B052339D2A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 03:36:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lq4C5-0004JH-DM; Mon, 07 Jun 2021 01:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lq4C2-0004J3-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oO9hE3OgTC3C8k06FQVIsaExZAPX0hEq/wKHE5K9Wus=; b=VIYl8I0CmwsxC07KirRUVXHdX4
 CTj6+qo7z2whoCzrGeRH9RrAwGwX0iET6U/jLE8CIAqKR5XvfuPPBcVJbU9Nb6Qi96w70QsASVtg8
 cy85r4O3qt7a6rzCEHgUNaNs7AK4EmJJftU47oVXqlkWAaN7ipN+VWqXF0oxsIitADGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oO9hE3OgTC3C8k06FQVIsaExZAPX0hEq/wKHE5K9Wus=; b=OZR48UzRyjAuBoBsDq3d6bry8u
 7vJIs0361GdpBFD0bh/Q3ZufX0mAakNMAbrCjQGDUW8agtJIkVu4C+6T+ez/9jQ4TKDmVWwl+5PiQ
 gCudjw9dvY9qPulzifQkICABkcfq7bjdGxjeXFTB+hIEW6ZEIWX2kDFScK7l2YER3xCY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lq4Bx-0008H4-H6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:36:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4CCB613E3;
 Sat,  5 Jun 2021 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622878162;
 bh=sD4FdAhELqS0DLQbiQk64DhfSNBtsMQjztudND1DlMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fz96jY/xij6RRMc+vj4SXRnz8YYgUg2aniupthXfB8pM8hH2eptOK+d6xLlHdPp7t
 wXjv6c6M2kVt3k68qhGNLn2pB882j/HYyleAHHyO5S8MmXebYY9odATWmXGp1sxMy9
 fumMv3DxqCMp+/blHZKRuVG37XXlhyhTr+kyApjRctqiFcZnP/uf4MxJ+v89//2BfG
 8QJp1B+3TjUcEsJ30qA57YHjxXP2ATWyS5BpCMw2q3Pf3OVqsKYZKHPnEGfvp5Ue4f
 mwMYCWxPo745PN7jwWIQ4r/XWVyPRrSZ4SHpFM/MLkmxLGl0FapoxtGBuyRXqcEYwx
 rk/NXw35NFXeg==
Date: Sat, 5 Jun 2021 00:29:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YLsn0cws61VUrawv@sol.localdomain>
References: <20210527225525.2365513-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527225525.2365513-1-ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lq4Bx-0008H4-H6
Subject: Re: [f2fs-dev] [PATCH] fscrypt: fix derivation of SipHash keys on
 big endian CPUs
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
Cc: linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 27, 2021 at 03:55:25PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Typically, the cryptographic APIs that fscrypt uses take keys as byte
> arrays, which avoids endianness issues.  However, siphash_key_t is an
> exception.  It is defined as 'u64 key[2];', i.e. the 128-bit key is
> expected to be given directly as two 64-bit words in CPU endianness.
> 
> fscrypt_derive_dirhash_key() forgot to take this into account.
> Therefore, the SipHash keys used to index encrypted+casefolded
> directories differ on big endian vs. little endian platforms.
> This makes such directories non-portable between these platforms.
> 
> Fix this by always using the little endian order.  This is a breaking
> change for big endian platforms, but this should be fine in practice
> since the encrypt+casefold support isn't known to actually be used on
> any big endian platforms yet.
> 
> Fixes: aa408f835d02 ("fscrypt: derive dirhash key for casefolded directories")
> Cc: <stable@vger.kernel.org> # v5.6+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/keysetup.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I missed that fscrypt_setup_iv_ino_lblk_32_key() has the same bug too.
I'll send out a new patch which fixes both of these...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
