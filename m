Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8252C2FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 21:05:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrOzN-0005BI-Sy; Wed, 18 May 2022 19:05:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrOzM-0005BC-RM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MM6853uRy+hD6Zpd7iH++qRYPGuH0db4BwjCZdOSnWU=; b=UwylVXyFrEv9C5x4yHWGVJQoB+
 qnAU0wTrruw+6BRpGrAc5LFdLBVXIInzcko/o8KcTi5cVwBIF8Cov+OTv0XoURvkPunUOl/wyUcA6
 Ddzo+88lFZANO56yOlkDOe2Y1mg3/HIFzIRQ23ztY8Gav7JtcXVavdodhZ54M2T0guUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MM6853uRy+hD6Zpd7iH++qRYPGuH0db4BwjCZdOSnWU=; b=VQjBpxD3KwC7M8RMVID37udHVJ
 K217GKKlgRRNTk033j2lHYCpl10SowFyvKxEse2JGO2ghvzgbiWVNJbUZKxAiWMllzwj5oTf5Wj3+
 VItY8yBxWmERGkVYqpwbUodR/K+wZZDB2qdHX2oE10qxhhUtIglGcHRWOxE//N3WV3fU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrOzL-007KET-8e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:05:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E08A61799;
 Wed, 18 May 2022 19:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F799C34113;
 Wed, 18 May 2022 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652900732;
 bh=cnpn7fseaG033r+jdaVt9hFU29BawCKPe9gTGSUle1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pAF7TFbOKVH4z+mtmH2nuKWJn5qnaGln3FEjUkontCQjqqyZ2FUi7/6Jsvos2HEjy
 zJEPUlLJo8gNVicfbM7r4LldaFJo6bM+8chsnnvFZsgiSDnwZ/QLitwP3wQyGrJLI0
 9Kt32iyBilTi5ioX26ZbXh3Am3v0w0tKjdKsBQfhJHPtQdiKNu9RqTDkWZBfA4us6v
 aIfcEz0SXSl9GWlUgZAQNHxTRTdIABOTmzJIhQSccuJUzPhzQiFWUzFsKV4bbhhxAs
 VOY1ePjVzDGQTlV5kaSV+5F2B4noMqHj6Sp8JS8/QgAoBv0yJFw99SYPuzWBLJOXKC
 a4DoxeIUpNdsQ==
Date: Wed, 18 May 2022 12:05:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVDejdYnHtIMxs6@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-4-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-4-krisman@collabora.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:15PM -0400, Gabriel Krisman
 Bertazi wrote: > generic_ci_match can be used by case-insensitive filesystems
 to compare > strings under lookup with dirents in a case-insensi [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrOzL-007KET-8e
Subject: Re: [f2fs-dev] [PATCH v5 3/8] libfs: Introduce case-insensitive
 string comparison helper
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

On Wed, May 18, 2022 at 01:23:15PM -0400, Gabriel Krisman Bertazi wrote:
> generic_ci_match can be used by case-insensitive filesystems to compare
> strings under lookup with dirents in a case-insensitive way.  This
> function is currently reimplemented by each filesystem supporting
> casefolding, so this reduces code duplication in filesystem-specific
> code.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/libfs.c         | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  4 +++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 974125270a42..6861d43563be 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1465,6 +1465,71 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>  	.d_hash = generic_ci_d_hash,
>  	.d_compare = generic_ci_d_compare,
>  };
> +
> +/**
> + * generic_ci_match() - Match a name (case-insensitively) name with a dirent.
> + * @parent: Inode of the parent of the dirent under comparison
> + * @name: name under lookup.
> + * @folded_name: Optional pre-folded name under lookup
> + * @de_name: Dirent name.
> + * @de_name_len: dirent name length.
> + *
> + *
> + * Test whether a case-insensitive directory entry matches the filename
> + * being searched.  If @folded_name is provided, it is used instead of
> + * recalculating the casefold of @name.
> + *
> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
> + * < 0 on error.
> + */
> +int generic_ci_match(const struct inode *parent,
> +		     const struct qstr *name,
> +		     const struct qstr *folded_name,
> +		     const u8 *de_name, size_t de_name_len)
> +{
> +	const struct super_block *sb = parent->i_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);

de_name_len is getting truncated to u32, so the parameter itself should be a
u32, like f2fs_match_ci_name().

> +	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
> +	int err, match = false;
> +
> +	if (IS_ENCRYPTED(parent)) {
> +		const struct fscrypt_str encrypted_name =
> +			FSTR_INIT((u8 *) de_name, de_name_len);

The 'if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent))) return -EINVAL;'
from f2fs_match_ci_name() should be kept here, as this is not going to work as
intended if the encryption key is unavailable.  (Unless the name is "." or "..",
as you saw in my recent patch, but that should be avoided anyway.)

> +
> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> +		if (!decrypted_name.name)
> +			return -ENOMEM;
> +		err = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
> +						&decrypted_name);
> +		if (err < 0)
> +			goto out;
> +		dirent.name = decrypted_name.name;
> +		dirent.len = decrypted_name.len;
> +	}
> +
> +	if (folded_name->name)
> +		err = utf8_strncasecmp_folded(um, folded_name, &dirent);
> +	else
> +		err = utf8_strncasecmp(um, name, &dirent);

Variables called 'err' conventionally store either 0 or a negative error value.
Here, 'err' can store a positive value.  It would be better to call it something
else, such as 'res' which f2fs_match_ci_name() uses.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
