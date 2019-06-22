Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CF4F8B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:44:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heojr-0001jY-SO; Sat, 22 Jun 2019 22:44:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heojp-0001iw-DH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=70M119sgCdkQVsqwrqyBy1GZYcJMkC05SKJlHGZQiCo=; b=Qe5b/1hjSqhEoLhACk6oInwqQe
 Tq+kLNtza1mauhDXF91dYlJamPa00onUPrdaBBGFBqcbK80gbaw9QDbivnBuWpUhY/L8Yf8A6WAlt
 shan6ssBpyi5Fe7LpZKu1CGPGPpE6M1tpyGks3KTxrtozzxnVlYuxF7V9iFCkuFphN9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=70M119sgCdkQVsqwrqyBy1GZYcJMkC05SKJlHGZQiCo=; b=nCnmpJeDNAnY7LPnfTpXBrT6KR
 JiLrZ6cwG+3NtDMWJ7O3LmqPtblXrE+NI9TPW0O3rM4M4+JxOoe2jxBw4APXRxm5s2K+xzE7G6GLM
 jKWzFtLjSdHMtRs664GuGmKmTIo7W0YfdOPvqWOGnoOgZty9f3FZH81CsQ7sxIplDGoU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoju-009cAd-8V
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:44:07 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 997D32084E;
 Sat, 22 Jun 2019 22:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561243440;
 bh=iYQDhANCCK0G30rvhkm7fehvp1qj9IVh4v7axFSmMDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v9rm9f4UnXG+IojsZCZMQscfYooXc2HeSrZMJbIbGXrZyS/a1XJ6VTTDKpvfOnwns
 Lo520pl0gERcKUUoy99M9nG6hAJQeL2sjSizQbFjzqRtTlq7tIJNAaeU/O6WmhbU3n
 cGGui0kXq2U+i05PpLOii8UzoX3BBopulnSWFURc=
Date: Sat, 22 Jun 2019 15:44:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622224400.GL19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-13-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-13-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1heoju-009cAd-8V
Subject: Re: [f2fs-dev] [PATCH v5 12/16] fs-verity: add SHA-512 support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/20, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add SHA-512 support to fs-verity.  This is primarily a demonstration of
> the trivial changes needed to support a new hash algorithm in fs-verity;
> most users will still use SHA-256, due to the smaller space required to
> store the hashes.  But some users may prefer SHA-512.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/fsverity_private.h  | 2 +-
>  fs/verity/hash_algs.c         | 5 +++++
>  include/uapi/linux/fsverity.h | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index eaa2b3b93bbf6b..02a547f0667c13 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -29,7 +29,7 @@ struct ahash_request;
>   * Largest digest size among all hash algorithms supported by fs-verity.
>   * Currently assumed to be <= size of fsverity_descriptor::root_hash.
>   */
> -#define FS_VERITY_MAX_DIGEST_SIZE	SHA256_DIGEST_SIZE
> +#define FS_VERITY_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
>  
>  /* A hash algorithm supported by fs-verity */
>  struct fsverity_hash_alg {
> diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
> index 46df17094fc252..e0462a010cabfb 100644
> --- a/fs/verity/hash_algs.c
> +++ b/fs/verity/hash_algs.c
> @@ -17,6 +17,11 @@ struct fsverity_hash_alg fsverity_hash_algs[] = {
>  		.digest_size = SHA256_DIGEST_SIZE,
>  		.block_size = SHA256_BLOCK_SIZE,
>  	},
> +	[FS_VERITY_HASH_ALG_SHA512] = {
> +		.name = "sha512",
> +		.digest_size = SHA512_DIGEST_SIZE,
> +		.block_size = SHA512_BLOCK_SIZE,
> +	},
>  };
>  
>  /**
> diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
> index 57d1d7fc0c345a..da0daf6c193b4b 100644
> --- a/include/uapi/linux/fsverity.h
> +++ b/include/uapi/linux/fsverity.h
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  
>  #define FS_VERITY_HASH_ALG_SHA256	1
> +#define FS_VERITY_HASH_ALG_SHA512	2
>  
>  struct fsverity_enable_arg {
>  	__u32 version;
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
