Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 780FF75315E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 07:40:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKBXb-0003mC-TK;
	Fri, 14 Jul 2023 05:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKBXV-0003m5-R9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdtVz2E71byQT2zkR0QrctF0wZTs9S/6uHY3g+X/kGQ=; b=Qy94ymT1+eHd9WIyf81MaYmWq3
 4j8DwpAbQmIK/YTlJnEVfR/GQU9/OmkM2A0qWyG1rSgg0Vj2AgwwUQW3/kXQ6cfwuVmCnzoWTWDjh
 RDxvVSRhXChONQFcwtRTxXS9cjIwixtM6Qi2HKUC9D57DaZRQb1X0uVQYWRcrSOKT/tE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KdtVz2E71byQT2zkR0QrctF0wZTs9S/6uHY3g+X/kGQ=; b=TT9LrGquAysFV87LaMisjoRG/v
 pIAh/sDbgkehCJ4OmBzJ/rp4gnYetADNkcnX/2uDfETOgGn5bPkIoHlyEAsorChvxH3zofGtTV1WM
 8EaHFE5Ay8nIIaYnUJN4i+bLM6KpeO8WxZItEHRoTphBAbJNogkLEG2wxuH3hc47bAPE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKBXS-007AdT-OD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3518E61BD1;
 Fri, 14 Jul 2023 05:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FFEC433C7;
 Fri, 14 Jul 2023 05:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689313216;
 bh=/ol5axUvlJefWQd68V0SGGSQUQblf2xCDTj6ilSSOck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/qaDPeog95g7fGiCfUXnsUqlrU+jq+roS/vQAeGo0jBIGM4VH9fEoVVmCUKxDb1+
 q3BD8rcolyEdPzwxnhg0tcUw/SP+OL0fFt3/uEo1yTYz+e0PlTeb/3D5DlbUTT2JYX
 pRtBESOCH/LrO2C0hfdgPbi99gwhpgHwz25PZoaSosXExddrDDI5SgLsdo1YZhxebT
 9I7freBJu0zIzr8WrofubjomRomL/RAg/JzwiHUNsVY7yfiWuiHYTuCZyq4XRZzCUr
 sGbMdzMrzdsoohluRd1z+jDuKC4sSCwuXq24j6lUD0o4JODtff2rVAL3p5tGjJ5EOv
 xT7bsw+GwVn+A==
Date: Thu, 13 Jul 2023 22:40:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230714054014.GE913@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-6-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422000310.1802-6-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 21, 2023 at 08:03:08PM -0400, Gabriel Krisman
 Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > >
 Now that casefold needs d_revalidate and calls fscrypt_d_revalidate [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qKBXS-007AdT-OD
Subject: Re: [f2fs-dev] [PATCH v2 5/7] libfs: Merge encrypted_ci_dentry_ops
 and ci_dentry_ops
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 21, 2023 at 08:03:08PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Now that casefold needs d_revalidate and calls fscrypt_d_revalidate
> itself, generic_encrypt_ci_dentry_ops and generic_ci_dentry_ops are now
> equivalent.  Merge them together and simplify the setup code.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/libfs.c | 44 +++++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 0886044db593..348ec6130198 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1504,7 +1504,7 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
>  	return fscrypt_d_revalidate(dentry, flags);
>  }
>  
> -static const struct dentry_operations generic_ci_dentry_ops = {
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
>  	.d_hash = generic_ci_d_hash,
>  	.d_compare = generic_ci_d_compare,
>  	.d_revalidate_name = generic_ci_d_revalidate,
> @@ -1517,26 +1517,20 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
>  };
>  #endif
>  
> -#if defined(CONFIG_FS_ENCRYPTION) && IS_ENABLED(CONFIG_UNICODE)
> -static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> -	.d_hash = generic_ci_d_hash,
> -	.d_compare = generic_ci_d_compare,
> -	.d_revalidate_name = generic_ci_d_revalidate,
> -};
> -#endif
> -
>  /**
>   * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
>   * @dentry:	dentry to set ops on
>   *
> - * Casefolded directories need d_hash and d_compare set, so that the dentries
> - * contained in them are handled case-insensitively.  Note that these operations
> - * are needed on the parent directory rather than on the dentries in it, and
> - * while the casefolding flag can be toggled on and off on an empty directory,
> - * dentry_operations can't be changed later.  As a result, if the filesystem has
> - * casefolding support enabled at all, we have to give all dentries the
> - * casefolding operations even if their inode doesn't have the casefolding flag
> - * currently (and thus the casefolding ops would be no-ops for now).
> + * Casefolded directories need d_hash, d_compare and d_revalidate set, so
> + * that the dentries contained in them are handled case-insensitively,
> + * but implement support for fs_encryption.  Note that these operations

The part ", but implement support for fs_encryption" is confusing.  It would be
clearer with that deleted, since encryption is covered by the next paragraph.

> + * are needed on the parent directory rather than on the dentries in it,
> + * and while the casefolding flag can be toggled on and off on an empty
> + * directory, dentry_operations can't be changed later.  As a result, if
> + * the filesystem has casefolding support enabled at all, we have to
> + * give all dentries the casefolding operations even if their inode
> + * doesn't have the casefolding flag currently (and thus the casefolding
> + * ops would be no-ops for now).
>   *
>   * Encryption works differently in that the only dentry operation it needs is
>   * d_revalidate, which it only needs on dentries that have the no-key name flag.
>   * The no-key flag can't be set "later", so we don't have to worry about that.
>   *
>   * Finally, to maximize compatibility with overlayfs (which isn't compatible
>   * with certain dentry operations) and to avoid taking an unnecessary
>   * performance hit, we use custom dentry_operations for each possible
>   * combination rather than always installing all operations.

When I wrote the last paragraph, I think I had in mind "each possible
combination of features".  Now it's changing in meaning to "each possible
combination of operations".  Maybe replace it with that to make it clearer?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
