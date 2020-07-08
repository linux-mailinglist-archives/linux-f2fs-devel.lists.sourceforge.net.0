Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF76217CAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 03:41:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsz5b-0005QR-9Q; Wed, 08 Jul 2020 01:41:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jsz5Z-0005QI-Ip
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjyjEH9kshElZBPMCE6toRsX+v4R/pL3SafFdqSs4i0=; b=Dnwfohq0XRP6Z0wmW5QRKQy7lm
 xd1+YMa0sDKlaV1RRkg4uVTFg4Im0ng68+aStESEZp+WL/3WuAuCmmVOLMEJ2yZEP/fEGFit39I2z
 naOnnKbznZhJSaLYq8VnyLTvdypZtzaSkIWvBrhF30lVwbqFZFCN6S9mc0e1VNUsQTCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VjyjEH9kshElZBPMCE6toRsX+v4R/pL3SafFdqSs4i0=; b=kYkMj5Kf4atgTEit1S+fP8H7nb
 IIKdhuRrw/MSw98+65OWTfccTBBVnxlpl3UXv/KqpJOB8s6aquTO8yshpvmHV7ip2opP4H5xdM481
 lsN1s1fN7YR1KFpntGWFd6++3yVtOOZvGxKxSXH7oFu9Cba2talrJVPbTncH2dS//Lo8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsz5Y-00DkiU-3c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:41:33 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3A74206DF;
 Wed,  8 Jul 2020 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594172479;
 bh=KAvFbnLGnnoN00vC1m9a7iUoWjJr1jCD7u4eNPmMldM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oxcXuBLgev+EmuOUJZ9xxnkt0hBRav9qYoi7+9qx2aRXuk3wI+obdTPMA4wLc01Ub
 qRgbpbnRamihiDOUJM0sRoCQ9boGhBrJGnqhrXYv9YQKgmYSMLDIb02Ix9DqzOy+rD
 PGou2nZqy4vEsYIx2llEo4tZE5Fa8wNOCopEAnFk=
Date: Tue, 7 Jul 2020 18:41:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708014117.GG839@sol.localdomain>
References: <20200707113123.3429337-1-drosen@google.com>
 <20200707113123.3429337-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707113123.3429337-4-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsz5Y-00DkiU-3c
Subject: Re: [f2fs-dev] [PATCH v10 3/4] f2fs: Use generic casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 07, 2020 at 04:31:22AM -0700, Daniel Rosenberg wrote:
> This switches f2fs over to the generic support provided in
> the previous patch.
> 
> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> the maintenance burden by unifying them, and any optimizations will
> immediately apply to both.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/dir.c           | 83 +++++------------------------------------
>  fs/f2fs/f2fs.h          |  4 --
>  fs/f2fs/super.c         | 10 ++---
>  fs/f2fs/sysfs.c         | 10 +++--
>  include/linux/f2fs_fs.h |  3 --
>  5 files changed, 20 insertions(+), 90 deletions(-)

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

One nit below:

>  #ifdef CONFIG_UNICODE
> -static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
> -			  const char *str, const struct qstr *name)
> -{
> -	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> -	const struct inode *dir = READ_ONCE(parent->d_inode);
> -	const struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
> -	struct qstr entry = QSTR_INIT(str, len);
> -	char strbuf[DNAME_INLINE_LEN];
> -	int res;
> -
> -	if (!dir || !IS_CASEFOLDED(dir))
> -		goto fallback;
> -
> -	/*
> -	 * If the dentry name is stored in-line, then it may be concurrently
> -	 * modified by a rename.  If this happens, the VFS will eventually retry
> -	 * the lookup, so it doesn't matter what ->d_compare() returns.
> -	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> -	 * string.  Therefore, we have to copy the name into a temporary buffer.
> -	 */
> -	if (len <= DNAME_INLINE_LEN - 1) {
> -		memcpy(strbuf, str, len);
> -		strbuf[len] = 0;
> -		entry.name = strbuf;
> -		/* prevent compiler from optimizing out the temporary buffer */
> -		barrier();
> -	}
> -
> -	res = utf8_strncasecmp(sbi->s_encoding, name, &entry);
> -	if (res >= 0)
> -		return res;
> -
> -	if (f2fs_has_strict_mode(sbi))
> -		return -EINVAL;
> -fallback:
> -	if (len != name->len)
> -		return 1;
> -	return !!memcmp(str, name->name, len);
> -}
> -
> -static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
> -{
> -	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
> -	const struct unicode_map *um = sbi->s_encoding;
> -	const struct inode *inode = READ_ONCE(dentry->d_inode);
> -	unsigned char *norm;
> -	int len, ret = 0;
> -
> -	if (!inode || !IS_CASEFOLDED(inode))
> -		return 0;
> -
> -	norm = f2fs_kmalloc(sbi, PATH_MAX, GFP_ATOMIC);
> -	if (!norm)
> -		return -ENOMEM;
> -
> -	len = utf8_casefold(um, str, norm, PATH_MAX);
> -	if (len < 0) {
> -		if (f2fs_has_strict_mode(sbi))
> -			ret = -EINVAL;
> -		goto out;
> -	}
> -	str->hash = full_name_hash(dentry, norm, len);
> -out:
> -	kvfree(norm);
> -	return ret;
> -}
>  
>  const struct dentry_operations f2fs_dentry_ops = {
> -	.d_hash = f2fs_d_hash,
> -	.d_compare = f2fs_d_compare,
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
>  };
>  #endif

This leaves an extra blank line just above f2fs_dentry_ops.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
