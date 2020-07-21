Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284C2289A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 22:11:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxycC-0006Yb-QB; Tue, 21 Jul 2020 20:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jxycB-0006YR-Et
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 20:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNskwB8qF7W/kWJV2APEOlfB4w2NNa+tbSq1/3qyd78=; b=deBbRdRdOyrod+hc/vMOKUINpl
 PiuUrgelUvSbmfBCghEC3I4o8ooq36OE0eOQ2hkG44mDVmzzdPWfmO8Q5HUI0IbXjHZ8kYFmRdXS8
 Q/iAaufrO6SQ5U+WYWgJtDkvCdGIKEj1gStyhIakPHGFzNS06a20uhE7YF1/QPfvbtGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fNskwB8qF7W/kWJV2APEOlfB4w2NNa+tbSq1/3qyd78=; b=cTWnF+hlLgqG4k9Wv0/REF47KS
 g6mGtnExIaQVL74/JTn1RS5ZD5pmtA4gOkUKgdIZzs1eSeGs/1inR+SM13Xzzt38n2vHVePlhiOTK
 4nUxP4Gxri8F0+Ah8+JHhsxyEvc0Z48PIm2xOnngTny1gxJwmyj0zmXzBkHmPt0po1Ws=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxycA-00FYhh-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 20:11:51 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 066C320684;
 Tue, 21 Jul 2020 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595362304;
 bh=qoQKgWZhAvGtgKCUrR3MgpQoIvX416jAmXkYrTf5C4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bMWyWlB/11MTlbsMxh/UBrlE+PK1UfU+8098QuYaeXP4gnmt57SZVQ4oHkG5Bmx7c
 y37NhSgDyEyTuRp2QUZ0i/ZCMWvbKfqv2HTlM7bvw7DIE9G9y9s15zy03EMcbENl7E
 Yyq19zoKHdpAYxs4E/ewwfdjJbbRCSXhjDWvFOtw=
Date: Tue, 21 Jul 2020 13:11:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200721201143.GB43066@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-6-satyat@google.com>
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
X-Headers-End: 1jxycA-00FYhh-Bl
Subject: Re: [f2fs-dev] [PATCH v4 5/7] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
> only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
> have been enabled, the 'inlinecrypt' mount option must have been specified,
> and either hardware inline encryption support must be present or
> CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
> direct I/O on encrypted files is only supported when I/O is aligned
> to the filesystem block size (which is *not* necessarily the same as the
> block device's block size).
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/f2fs.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b35a50f4953c..978130b5a195 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4082,7 +4082,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int rw = iov_iter_rw(iter);
>  
> -	if (f2fs_post_read_required(inode))
> +	if (!fscrypt_dio_supported(iocb, iter))
> +		return true;
> +	if (fsverity_active(inode))
> +		return true;
> +	if (f2fs_compressed_file(inode))
>  		return true;
>  	if (f2fs_is_multi_device(sbi))
>  		return true;
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
