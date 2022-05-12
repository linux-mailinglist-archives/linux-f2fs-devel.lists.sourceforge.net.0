Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A943452450E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 07:35:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np1UG-0003N2-Oy; Thu, 12 May 2022 05:35:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np1UF-0003Mw-CV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RUNZPLCuRfY+n43AHqV4mAgtG01NkiO3cyjGVUxOCk=; b=QnVt3YzuuLCpMzuJai+T7WDLdX
 py6l1vbLoInAmSFFVEmMp0ea2l7euVhSy6Gs/pxdF8cqHQBRc1Z7o3EiqZqyvKkhe6AmeZxRcReTF
 WqEO9U9dWGXAArAAtFonwNNxnnMJYUV78kcR6juQ73/eTOqLmS/dPOGpMnNbY7X1tTCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RUNZPLCuRfY+n43AHqV4mAgtG01NkiO3cyjGVUxOCk=; b=Kdq6hBsejtEKg/2KpMZNji/Sqp
 W8+qnSyj4YlVpEORIYsjMO6+AchEH5de+uUjWHXIEeTD4ppD7/mms68PqmujQUikBMmJjDHjcLUVy
 uFfWDaVP5XLfZlp64+LCotKashkuz2XL/Ihhdd4lK42fDbcoPL1OTB0FU7pzjIYLqOrk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np1UD-0007FV-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:35:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A893FCE2801;
 Thu, 12 May 2022 05:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4873C385B8;
 Thu, 12 May 2022 05:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652333725;
 bh=AwCtH7W0dgnTgSMtMptk9ywFg+YBr6/XSt7DxhBAiVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQXmENY4DebI6FSjkjhTuMVDV27oAWk2RdCnXtyGQ71knCRTTKoDIM0L7h9DZ5H79
 3XznMQfpqSAgZ6CTa919mW2DQcJFxLoONHzL//0ZmcOu/NEGbyjZVCEdFeyiJ3iz5b
 9OnIzrOPKewZZ/xFluVu6SiHUCdO3SwJE/0L/GWcVnfZ2bglNBNjPY7dt/2+5fH/BW
 I6rl29V+v5NE2CDFutUDSxiCNYDQ9zqM+qAbStMAIMFkyWkXgMEaNq4Z9bboXTu4IX
 r/ip7vyHQE678FEDbk/GUyh3i9MaP390UX24Kd2CZ1PY9qkpvdJu7lnucdNn40hyLG
 uCjReFaApr4EA==
Date: Wed, 11 May 2022 22:35:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <Ynycm9QGS7MIU4io@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-5-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-5-krisman@collabora.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:40PM -0400, Gabriel Krisman
 Bertazi wrote: > By using a new type here, we can hide most of the caching
 casefold logic > from ext4. The condition in ext4_match is now quit [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np1UD-0007FV-Qw
Subject: Re: [f2fs-dev] [PATCH v4 04/10] ext4: Implement ci comparison using
 unicode_name
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

On Wed, May 11, 2022 at 03:31:40PM -0400, Gabriel Krisman Bertazi wrote:
> By using a new type here, we can hide most of the caching casefold logic
> from ext4.  The condition in ext4_match is now quite redundant, but this
> is addressed in the next patch.
> 
> This doesn't use ext4_filename to keep it generic, since the function
> will be moved to libfs to be shared with f2fs.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> --
> Changes since v1:
>   - Instead of (ab)using fscrypt_name, create a new type (ebiggers).
> ---
>  fs/ext4/namei.c    | 32 +++++++++++++++-----------------
>  include/linux/fs.h |  5 +++++
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 84fdb23f09b8..5296ced2e43e 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1321,20 +1321,19 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
>  /**
>   * ext4_match_ci() - Match (case-insensitive) a name with a dirent.
>   * @parent: Inode of the parent of the dentry.
> - * @name: name under lookup.
> + * @uname: name under lookup.
>   * @de_name: Dirent name.
>   * @de_name_len: dirent name length.
> - * @quick: whether @name is already casefolded.
>   *
>   * Test whether a case-insensitive directory entry matches the filename
> - * being searched.  If quick is set, the @name being looked up is
> - * already in the casefolded form.
> + * being searched.
>   *
>   * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
>   * < 0 on error.
>   */
> -static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
> -			 u8 *de_name, size_t de_name_len, bool quick)
> +static int ext4_match_ci(const struct inode *parent,
> +			 const struct unicode_name *uname,
> +			 u8 *de_name, size_t de_name_len)
>  {
>  	const struct super_block *sb = parent->i_sb;
>  	const struct unicode_map *um = sb->s_encoding;
> @@ -1357,10 +1356,10 @@ static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
>  		entry.len = decrypted_name.len;
>  	}
>  
> -	if (quick)
> -		ret = utf8_strncasecmp_folded(um, name, &entry);
> +	if (uname->folded_name->name)
> +		ret = utf8_strncasecmp_folded(um, uname->folded_name, &entry);
>  	else
> -		ret = utf8_strncasecmp(um, name, &entry);
> +		ret = utf8_strncasecmp(um, uname->usr_name, &entry);
>  
>  	if (!ret)
>  		match = true;
> @@ -1370,8 +1369,8 @@ static int ext4_match_ci(const struct inode *parent, const struct qstr *name,
>  		 * the names have invalid characters.
>  		 */
>  		ret = 0;
> -		match = ((name->len == entry.len) &&
> -			 !memcmp(name->name, entry.name, entry.len));
> +		match = ((uname->usr_name->len == entry.len) &&
> +			 !memcmp(uname->usr_name->name, entry.name, entry.len));
>  	}
>  
>  out:
> @@ -1441,6 +1440,10 @@ static bool ext4_match(struct inode *parent,
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
>  	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
> +		struct unicode_name u = {
> +			.folded_name = &fname->cf_name,
> +			.usr_name = fname->usr_fname
> +		};
>  		int ret;
>  
>  		if (fname->cf_name.name) {
> @@ -1452,14 +1455,9 @@ static bool ext4_match(struct inode *parent,
>  					return false;
>  				}
>  			}
> -
> -			ret = ext4_match_ci(parent, &fname->cf_name, de->name,
> -					    de->name_len, true);
> -		} else {
> -			ret = ext4_match_ci(parent, fname->usr_fname,
> -					    de->name, de->name_len, false);
>  		}
>  
> +		ret = ext4_match_ci(parent, &u, de->name, de->name_len);
>  		if (ret < 0) {
>  			/*
>  			 * Treat comparison errors as not a match.  The
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index e2d892b201b0..3f76a18a5f40 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3358,6 +3358,11 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
>  
>  extern int generic_check_addressable(unsigned, u64);
>  
> +struct unicode_name {
> +	const struct qstr *folded_name;
> +	const struct qstr *usr_name;
> +};
> +
>  extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>  
>  #ifdef CONFIG_MIGRATION

I don't really see the point of this.  The only times struct unicode_name gets
used are when one is initialized on the stack for a single call to
generic_ci_match().  So the end result is just that the function prototype is:

int generic_ci_match(const struct inode *parent,
		     const struct unicode_name *uname,
		     const u8 *de_name, size_t de_name_len);

... instead of:

int generic_ci_match(const struct inode *parent, const struct qstr *usr_fname,
		     const struct qstr *folded_name,
		     const u8 *de_name, size_t de_name_len);

So the only effect is to consolidate two parameters into one.  I don't think
it's worth it, given that the struct is being created on-demand.

Also note that filenames are not necessarily valid Unicode, so "unicode_name" is
a bit misleading.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
