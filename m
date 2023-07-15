Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED47546DE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jul 2023 06:48:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKXCV-0004xA-FH;
	Sat, 15 Jul 2023 04:48:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKXCU-0004x4-Oq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 04:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gBcxujqQZAOUmwk8WUlq8n7Tr1VtfCosqg/j3NhZMpg=; b=l8xMq5BnFeSeii9U82ovIAODNS
 dPVrMoA3Z5XolUlpeiSP47mdWLnS7X3CF3waPyhC2zW//KW29/Q/tNaPokIi219RrP04ZRAiVFXVs
 18wpY5ZRHS7OGwNtVbrnSM7/P1JA9wf6pfvp9BnCspCPKa6Tl0dQ2Z4uDDqSyr2DuKk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gBcxujqQZAOUmwk8WUlq8n7Tr1VtfCosqg/j3NhZMpg=; b=Z9ZxyjfggIJ2ugb3f8HILiT9c9
 bQU1m6Un7hxjFwNjnNhN/5uHBFdVfPfToNNx/E14RhxNg9nZvMk7+NKhtxPHZQ+HPfVN3SN0VfvTv
 DfuKaIDKomO0qEj6YnHacpll/UOAwgjiZxE6xSju1WYSv9mQdJmQkWTL2Yp9Ym6SpeBI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKXCV-0000gE-0u for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 04:48:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E6A860281;
 Sat, 15 Jul 2023 04:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A02AC433C8;
 Sat, 15 Jul 2023 04:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689396474;
 bh=i1/GkoIlPdPGBqDEWGH9qxdQNDRVc3gY7MIUudsS8n8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i2U3RJclXjQbSXLz0yCtipycudB9zMU70W5cmakVo2Vpv4sVgKOPsxWsaMUWhUG4a
 4Rrhj9R2Qyrf0uMTeY02239NcTSc67ZeUQV9J23XNaRnXRK6nmU4il/MLgfhYGgk9j
 i5yRE4O3TwUm70MQX0+ZSmeTLp4dYfsHFUQ6rufX/5sIo0qpsVzFBFNFDwJF4SNUi6
 v+Zi4z5Cn8VU1E7g+78gDr2d8XieqKnOzkNidIYwuI3doGm1kX8lYgHoNRYSNlk83Q
 XsZyF2OHCe01bvauNttO1LvA+HqDe9+JRkXY5n/hQbu+/6r716UFuWBud9W6fU/d4d
 kD/HwKoUsQOgg==
Date: Fri, 14 Jul 2023 21:47:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <20230715044752.GA4123@sol.localdomain>
References: <20230714155843.1884065-1-guoweichao@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714155843.1884065-1-guoweichao@oppo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 14, 2023 at 11:58:43PM +0800, Weichao Guo wrote:
 > As the fscrypt context has two versions now, this patch adds the > support
 of fscrypt_context_v2 for print_xattr_entry. > > Signed-off-by [...] 
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
X-Headers-End: 1qKXCV-0000gE-0u
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: support to show
 fscrypt_context_v2 in print_xattr_entry
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

On Fri, Jul 14, 2023 at 11:58:43PM +0800, Weichao Guo wrote:
> As the fscrypt context has two versions now, this patch adds the
> support of fscrypt_context_v2 for print_xattr_entry.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fsck/mount.c | 46 +++++++++++++++++++++++++++++---------------
>  fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 76 insertions(+), 24 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d..fce01d1 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -194,7 +194,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  {
>  	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
>  	const int size = le16_to_cpu(ent->e_value_size);
> -	const struct fscrypt_context *ctx;
> +	const union fscrypt_context *ctx;
>  	int i;
>  
>  	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
> @@ -211,22 +211,38 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
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

If size == 0, this will read past the end of the xattr value.

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
>  		return;
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
> +		return;
> +		}
> +		break;

The two return statements are missing a level of indentation.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
