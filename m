Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3087519B1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jul 2023 09:22:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJqes-0000xp-6a;
	Thu, 13 Jul 2023 07:22:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qJqeq-0000xj-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 07:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aXlgRNR4+P8QoG2khYwdAhXKxFR+0pxzAZPWyreBXao=; b=dQItvL/4qq8aM8lc27lcufl0Ec
 iqOk+IBboJDuHJSN2+eQXSODGEpzTAsznV01nYU6p2mLYHwuLy5A3clngNSztfEAYjazBlHCE7ixZ
 pXryYqYBnKSArKCDT5+SDSk9oJVdupFavd5XoWwljqJd/qyj8TTRQu6FnLLg04I/7R68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aXlgRNR4+P8QoG2khYwdAhXKxFR+0pxzAZPWyreBXao=; b=jwQbiBB1pmZvjKmK13zXDKrHpd
 sRZ49Mk5PCxDg+ixkraURvUpmzTayUiQmieCkQZEdOMoADmZTtZtCpnJ7ZUaCA5AbqLRHEDrjdkqr
 PUQiT6Fkzm0pYbKGAFgSvxNuGxNR8i46+vlqwew0zzV52oD5mgd0vm4HV3gWn5tcAk5w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJqes-0002MN-Cg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 07:22:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A65F861A39;
 Thu, 13 Jul 2023 07:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E1BC433C8;
 Thu, 13 Jul 2023 07:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689232950;
 bh=BpHdt5uwnAilJ8S0bLCo0m3OsfgBJ2CqoYvUmojxMyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sj3qtugjAVE3RrZL9f0h3B+IJ+r1CcFJdTxT7WDHhHFjCVnjqxypDcJzsdYn5A+8u
 4E7+OTefkKJSfn/FlRo2iZ8G9xQpEyRiJJw+Uf2LAJ0Cf3P8oAyW38ItwNPdM26MAZ
 GrcD8WLG3c7jKFzJmJ3+8GmDM0K8/R/HRokc2Q6AnUdPSpCa+5inVLgt0pM/Rz0K/a
 vhOfw2l+9HOniKrCLauNkAR92k3HTriA/zd4UXGeUIb0hjCPTxP/DK4dsJFsGCCRkx
 WTfmNxtpwtlSGMXtE2LJq3PccVAJ51GXO91HMoP/IU7htQgT2UTOZu4F6sN5InODth
 Xsn1k8+6f6KlQ==
Date: Thu, 13 Jul 2023 00:22:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <20230713072228.GD2199@sol.localdomain>
References: <20230712102331.4079126-1-guoweichao@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712102331.4079126-1-guoweichao@oppo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Weichao, On Wed, Jul 12, 2023 at 06:23:31PM +0800, Weichao
 Guo via Linux-f2fs-devel wrote: > Signed-off-by: Weichao Guo
 <guoweichao@oppo.com>
 > Signed-off-by: Sheng Yong <shengyong@oppo.com> > --- > fsck/mount [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJqes-0002MN-Cg
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: support print_xattr_entry with
 fscrypt context v2
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Weichao,

On Wed, Jul 12, 2023 at 06:23:31PM +0800, Weichao Guo via Linux-f2fs-devel wrote:
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fsck/mount.c | 44 +++++++++++++++++++++++++++---------------
>  fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 74 insertions(+), 24 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 397feb5..b9696c4 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -196,7 +196,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  {
>  	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
>  	const int size = le16_to_cpu(ent->e_value_size);
> -	const struct fscrypt_context *ctx;
> +	const union fscrypt_context *ctx;
>  	int i;
>  
>  	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
> @@ -213,21 +213,35 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  		return;
>  #endif
>  	case F2FS_XATTR_INDEX_ENCRYPTION:
> -		ctx = (const struct fscrypt_context *)value;
> -		if (size != sizeof(*ctx) ||
> -		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
> +		ctx = (const union fscrypt_context *)value;
> +		if (size != fscrypt_context_size(ctx))
>  			break;
> -		MSG(0, "format: %d\n", ctx->format);
> -		MSG(0, "contents_encryption_mode: 0x%x\n", ctx->contents_encryption_mode);
> -		MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->filenames_encryption_mode);
> -		MSG(0, "flags: 0x%x\n", ctx->flags);
> -		MSG(0, "master_key_descriptor: ");
> -		for (i = 0; i < FS_KEY_DESCRIPTOR_SIZE; i++)
> -			MSG(0, "%02X", ctx->master_key_descriptor[i]);
> -		MSG(0, "\nnonce: ");
> -		for (i = 0; i < FS_KEY_DERIVATION_NONCE_SIZE; i++)
> -			MSG(0, "%02X", ctx->nonce[i]);
> -		MSG(0, "\n");
> +		switch (ctx->version) {
> +		case FSCRYPT_CONTEXT_V1:
> +			MSG(0, "format: %d\n", ctx->version);
> +			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v1.contents_encryption_mode);
> +			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v1.filenames_encryption_mode);
> +			MSG(0, "flags: 0x%x\n", ctx->v1.flags);
> +			MSG(0, "master_key_descriptor: ");
> +			for (i = 0; i < FSCRYPT_KEY_DESCRIPTOR_SIZE; i++)
> +				MSG(0, "%02X", ctx->v1.master_key_descriptor[i]);
> +			MSG(0, "\nnonce: ");
> +			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
> +				MSG(0, "%02X", ctx->v1.nonce[i]);
> +			MSG(0, "\n");
> +		case FSCRYPT_CONTEXT_V2:
> +			MSG(0, "format: %d\n", ctx->version);
> +			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v2.contents_encryption_mode);
> +			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v2.filenames_encryption_mode);
> +			MSG(0, "flags: 0x%x\n", ctx->v2.flags);
> +			MSG(0, "master_key_identifier: ");
> +			for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++)
> +				MSG(0, "%02X", ctx->v2.master_key_identifier[i]);
> +			MSG(0, "\nnonce: ");
> +			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
> +				MSG(0, "%02X", ctx->v2.nonce[i]);
> +			MSG(0, "\n");
> +		}
>  		return;

The FSCRYPT_CONTEXT_V1 case is falling through to FSCRYPT_CONTEXT_V2.  Also,
this patch makes the values of encryption xattrs with unknown versions no longer
be shown.  To fix this, there needs to be a return at end of each case (v1 and
v2), and the return after the switch statement needs to be a break.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
