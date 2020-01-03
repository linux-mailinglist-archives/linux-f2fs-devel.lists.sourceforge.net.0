Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780312FB07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 18:00:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inQIz-0007FU-6f; Fri, 03 Jan 2020 17:00:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1inQIy-0007F4-5D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8nWwiO7cFfrnSO+q7kd++/VqVBAyvRZUvZAdVicmBRM=; b=T1ZwcWZOMP+vBryY5DyO9EkqjG
 OwEFyjzPYfs0OyC1iAb3flOb5wm0aAgIT2pt2gV19gwGSIJstoTQ3BeoSz725dEQgaobx0jXNqFNV
 inQYcK9xudzJDL+p5Mr4LmL0SKp1kpkSjCFUXch9V4ez2DAncXg7QTFLMmIk/VEtXIU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8nWwiO7cFfrnSO+q7kd++/VqVBAyvRZUvZAdVicmBRM=; b=dny0q5OqFSR44sXZxAiYfsH977
 uYCYRkEscXXqS4s1hu2WiCx4EZSeS8plnUSXfvQ7XOb5BXlCMMA3CHSK/YPLnu7JdrBKBQT6kDNAx
 EI8sGbMxlGR7T+HBAJql8DuAdZjd+RT9gMI1kADRUxe9dJ0skMowGlwBRzLuJ3gG390Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inQIv-008iN1-Di
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:00:08 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC5C0206DB;
 Fri,  3 Jan 2020 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578070795;
 bh=ZJB44nwQCm+aExn/7YF4Pm9qKNyOqji2YX/ddgZw6MA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0ZSVo4iAU0Jg+Kfkv1mMZzq2u58fh94l/QoCV3mWj5kWbWEb1UzhtXhtNo726bmq
 AkaBMt9KkEU3NNLtx5TQsgoU/AMX1PwBNLaojqXGnkPYoY6gh4kP4e2l4RMTzNuyNb
 lMOYUHC7ztxrnnJ7QJ6IfLenIjd3r7FHx8ZMe2hU=
Date: Fri, 3 Jan 2020 08:59:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200103165953.GH19521@gmail.com>
References: <20191209205021.231767-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209205021.231767-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.7 (+)
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
X-Headers-End: 1inQIv-008iN1-Di
Subject: Re: [f2fs-dev] [PATCH] fscrypt: introduce
 fscrypt_needs_contents_encryption()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 09, 2019 at 12:50:21PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a function fscrypt_needs_contents_encryption() which takes an inode
> and returns true if it's an encrypted regular file and the kernel was
> built with fscrypt support.
> 
> This will allow replacing duplicated checks of IS_ENCRYPTED() &&
> S_ISREG() on the I/O paths in ext4 and f2fs, while also optimizing out
> unneeded code when !CONFIG_FS_ENCRYPTION.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/linux/fscrypt.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index cb18b5fbcef92..2a29f56b1a1cb 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -72,6 +72,21 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
>  	return READ_ONCE(inode->i_crypt_info) != NULL;
>  }
>  
> +/**
> + * fscrypt_needs_contents_encryption() - check whether an inode needs
> + *					 contents encryption
> + *
> + * Return: %true iff the inode is an encrypted regular file and the kernel was
> + * built with fscrypt support.
> + *
> + * If you need to know whether the encrypt bit is set even when the kernel was
> + * built without fscrypt support, you must use IS_ENCRYPTED() directly instead.
> + */
> +static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
> +{
> +	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
> +}
> +
>  static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
>  {
>  	return inode->i_sb->s_cop->dummy_context &&
> @@ -269,6 +284,11 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
>  	return false;
>  }
>  
> +static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
> +{
> +	return false;
> +}
> +
>  static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
>  {
>  	return false;
> -- 
> 2.24.0.393.g34dc348eaf-goog
> 

Applied to fscrypt.git#master for 5.6.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
