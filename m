Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A252CA84
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 05:44:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrX4v-0006EB-Tz; Thu, 19 May 2022 03:43:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrX4u-0006E2-92
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 03:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IVZBYU7nSxk4xgj/AOi7YGRzvAEDNCfRhm7EnuSbuMI=; b=YmdfNv0eoSwRDrUeAo66nsl49Q
 7nDSSG7x71HQBzkypU3fUsN1uKV+V1ZR69ZUuYI4doGvsY86qciWPBGdEQGmhumRwBlrNX1HDOuU5
 KKhTSJhfu1Es+dGHXYFPr8e//5ihSKWMtqPNftUXWh7uRlUF0fA8Nu6qKlntt2Pa2how=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IVZBYU7nSxk4xgj/AOi7YGRzvAEDNCfRhm7EnuSbuMI=; b=cBJ6kMePwVq4TTpPBJhrjHxuno
 TYSbRFv2eLQoaYVGW2Cfncw7llWFyLc138msxjjxYM6oqT7+Ls4lA/DRVi7660WMgw03X/w6m0eGn
 KzD+KBNRTc88Ve7bVWPRx0qlRtTtMORgAsvQWEBvdH8Wh9w9A3Miaa89jLUaIJkk8+t4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrX4s-008ABo-Av
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 03:43:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A6C86195A;
 Thu, 19 May 2022 03:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6C0C385B8;
 Thu, 19 May 2022 03:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652931827;
 bh=6Iu/4CtpYTZNyk/uv3M2H9o1IfB0D2LmMQjOXVY7ChQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYXiPZQkJgvh6ExTh17nBbK9NL7gHRPYRxIVGfqDRdqBuBLuedm0Z85PqEDngbPik
 LOebjGrM7aFraoERtOaD8pWe2hcJ/eMaXrZUCG4YmR9yPfTzry00yFW0NAbvsHfOwq
 Evx8/WIqCada6Y3u3rMUYgCLNHLZwTjAUV0797HvjAQp7j863hBQ2O7bUzNRZ/3GjJ
 ltUlg/cXrLkvZeBgNkOLa7cqa2+uAG2N4+Oping5tnkACTfPVBOKZgz9BzqzMPihLw
 odeKcIiIVgZAQz8SqwQS8TDTVCI3eezgZ/zow5VlUiYFXhtE4+LPR7W+xpVgLhWlka
 +vVcIDM72ac/w==
Date: Wed, 18 May 2022 20:43:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoW88YCdwmUi9wTt@sol.localdomain>
References: <20220519014044.508099-1-krisman@collabora.com>
 <20220519014044.508099-6-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519014044.508099-6-krisman@collabora.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 09:40:41PM -0400, Gabriel Krisman
 Bertazi wrote: > Now that ci_match is part of libfs, make f2fs reuse it instead
 of having > a different implementation. > > Signed-off-by: Gab [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.7 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
 [URIs: entry.name]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrX4s-008ABo-Av
Subject: Re: [f2fs-dev] [PATCH v6 5/8] f2fs: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 09:40:41PM -0400, Gabriel Krisman Bertazi wrote:
> Now that ci_match is part of libfs, make f2fs reuse it instead of having
> a different implementation.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> Changes since v3:
>   - Drop cast (eric)
>   - fix unused variable iff !CONFIG_UNICODE (lkp)
> ---
>  fs/f2fs/dir.c | 58 ++++-----------------------------------------------
>  1 file changed, 4 insertions(+), 54 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 167a04074a2e..4e4b2b190188 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -217,58 +217,6 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>  	return f2fs_find_target_dentry(&d, fname, max_slots);
>  }
>  
> -#if IS_ENABLED(CONFIG_UNICODE)
> -/*
> - * Test whether a case-insensitive directory entry matches the filename
> - * being searched for.
> - *
> - * Returns 1 for a match, 0 for no match, and -errno on an error.
> - */
> -static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
> -			       const u8 *de_name, u32 de_name_len)
> -{
> -	const struct super_block *sb = dir->i_sb;
> -	const struct unicode_map *um = sb->s_encoding;
> -	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
> -	struct qstr entry = QSTR_INIT(de_name, de_name_len);
> -	int res;
> -
> -	if (IS_ENCRYPTED(dir)) {
> -		const struct fscrypt_str encrypted_name =
> -			FSTR_INIT((u8 *)de_name, de_name_len);
> -
> -		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
> -			return -EINVAL;
> -
> -		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> -		if (!decrypted_name.name)
> -			return -ENOMEM;
> -		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
> -						&decrypted_name);
> -		if (res < 0)
> -			goto out;
> -		entry.name = decrypted_name.name;
> -		entry.len = decrypted_name.len;
> -	}
> -
> -	res = utf8_strncasecmp_folded(um, name, &entry);
> -	/*
> -	 * In strict mode, ignore invalid names.  In non-strict mode,
> -	 * fall back to treating them as opaque byte sequences.
> -	 */
> -	if (res < 0 && !sb_has_strict_encoding(sb)) {
> -		res = name->len == entry.len &&
> -				memcmp(name->name, entry.name, name->len) == 0;
> -	} else {
> -		/* utf8_strncasecmp_folded returns 0 on match */
> -		res = (res == 0);
> -	}
> -out:
> -	kfree(decrypted_name.name);
> -	return res;
> -}
> -#endif /* CONFIG_UNICODE */
> -
>  static inline int f2fs_match_name(const struct inode *dir,
>  				   const struct f2fs_filename *fname,
>  				   const u8 *de_name, u32 de_name_len)
> @@ -277,8 +225,10 @@ static inline int f2fs_match_name(const struct inode *dir,
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (fname->cf_name.name)
> -		return f2fs_match_ci_name(dir, &fname->cf_name,
> -					  de_name, de_name_len);
> +		return generic_ci_match(dir, fname->usr_fname,
> +					&fname->cf_name,
> +					de_name, de_name_len);
> +
>  #endif

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
