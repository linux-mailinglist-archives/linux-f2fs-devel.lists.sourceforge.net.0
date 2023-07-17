Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FB755905
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 03:20:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLCuR-0004Jq-6u;
	Mon, 17 Jul 2023 01:20:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLCuQ-0004Ji-Fl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 01:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOlI8ITPrwnZyII1ZuZdTLtO51RfmzCarl4LO0OmImE=; b=Hd9VOzLRitp6QpYld02++0N1MM
 fC+kUqIh0bRjxKS/zuoh23wTPdVedSFKTa9LeCkzIg+LSlPgCwv3g4bQ8tny35IJd/q3b8Er4QhCm
 C+ZNEuOeuj6exxvAm0b1Z/12FeinAml27HLVfOu05NFshDx/QbHSE5m+dhnbDdjYdaFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zOlI8ITPrwnZyII1ZuZdTLtO51RfmzCarl4LO0OmImE=; b=ec943EqFWmQL6TAyZaZJWabWJI
 71FDnpOgtrhH4VXj9uN+/tg/6v0E6U8rnrRa9obN/tVwqAPrggJ1hrFmmmJfGGiJsXadfx3eYNmJE
 H+0Nh66WLx5vM3QPKRK+s1a/A1YREEqmCP+pwSbsk8mIqVSYU6rxin8RRQoWoyoFYEF4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLCuL-00A6La-Vc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 01:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D6AD60C41;
 Mon, 17 Jul 2023 01:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FC9C433C7;
 Mon, 17 Jul 2023 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689556807;
 bh=HoKEMJo8m28Dflkj/derC+oi9BAG6fSI3t+amFLyaw4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IQDv8ktc4zSNBTfP9jwXDzwx5R1IR0AT2CbcCqfhjXrt36eaCGoVzxgjDs8DUmC0n
 vn5LL8r6xqtkhr4ZAVIOCNURlRCbjr4Zj4UYJQ0qg3RYAhNbNkskGmQbVNd+HgP8Az
 oloIDeoge8gdiJdMSsybjTnTSVmB9G5xk09UQVv38wfcqEIKWBbfWKCyr99PMFwFiY
 BoeYw9IA1userGQ/IsF2YMzxezXwPsAUNmBq/+LVx6sngGFeWV3ZAiM8H2qyDF+NqN
 TqLbpmSjVDByI1Jtfa/iea47B+0KhsGYJIcotgi+q0BH+tr1AVgMOTXNU3qNQC3vXc
 9B/YbPLuCEUKw==
Message-ID: <f1e004a9-2982-10c8-d086-1180dce29f6e@kernel.org>
Date: Mon, 17 Jul 2023 09:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Weichao Guo <guoweichao@oppo.com>, jaegeuk@kernel.org, ebiggers@kernel.org
References: <20230715060936.2343780-1-guoweichao@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230715060936.2343780-1-guoweichao@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/15 14:09,
 Weichao Guo wrote: > As the fscrypt context
 has two versions now, this patch adds the > support of fscrypt_context_v2
 for print_xattr_entry. > > Signed-off-by: Weichao Guo <guoweic [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLCuL-00A6La-Vc
Subject: Re: [f2fs-dev] [PATCH v4] f2fs-tools: support to show
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/15 14:09, Weichao Guo wrote:
> As the fscrypt context has two versions now, this patch adds the
> support of fscrypt_context_v2 for print_xattr_entry.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/mount.c | 48 ++++++++++++++++++++++++++++++----------------
>   fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
>   2 files changed, 77 insertions(+), 25 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index df0314d..97d56f4 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -194,7 +194,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>   {
>   	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
>   	const int size = le16_to_cpu(ent->e_value_size);
> -	const struct fscrypt_context *ctx;
> +	const union fscrypt_context *ctx;
>   	int i;
>   
>   	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
> @@ -211,22 +211,38 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>   		return;
>   #endif
>   	case F2FS_XATTR_INDEX_ENCRYPTION:

#define F2FS_XATTR_NAME_ENCRYPTION_CONTEXT	"c"

Should we check ent->e_name and ent->e_name_len w/ F2FS_XATTR_NAME_ENCRYPTION_CONTEXT?

Thanks,

> -		ctx = (const struct fscrypt_context *)value;
> -		if (size != sizeof(*ctx) ||
> -		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
> +		ctx = (const union fscrypt_context *)value;
> +		if (size == 0 || size != fscrypt_context_size(ctx))
>   			break;
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
> -		return;
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
> +			return;
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
> +			return;
> +		}
> +		break;
>   	}
>   	for (i = 0; i < size; i++)
>   		MSG(0, "%02X", value[i]);
> diff --git a/fsck/xattr.h b/fsck/xattr.h
> index 22ea35c..b155cc8 100644
> --- a/fsck/xattr.h
> +++ b/fsck/xattr.h
> @@ -34,22 +34,58 @@ struct f2fs_xattr_entry {
>   	char e_name[0];		/* attribute name */
>   };
>   
> -#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
> -#ifndef FS_KEY_DESCRIPTOR_SIZE
> -#define FS_KEY_DESCRIPTOR_SIZE 8
> +#define FSCRYPT_CONTEXT_V1 1
> +#define FSCRYPT_CONTEXT_V2 2
> +#ifndef FSCRYPT_KEY_DESCRIPTOR_SIZE
> +#define FSCRYPT_KEY_DESCRIPTOR_SIZE 8
>   #endif
> -#define FS_KEY_DERIVATION_NONCE_SIZE 16
> +#ifndef FSCRYPT_KEY_IDENTIFIER_SIZE
> +#define FSCRYPT_KEY_IDENTIFIER_SIZE	16
> +#endif
> +#define FSCRYPT_FILE_NONCE_SIZE 16
> +
> +struct fscrypt_context_v1 {
> +	u8 version; /* FSCRYPT_CONTEXT_V1 */
> +	u8 contents_encryption_mode;
> +	u8 filenames_encryption_mode;
> +	u8 flags;
> +	u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
> +	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
> +};
>   
> -struct fscrypt_context {
> -	u8 format;
> +struct fscrypt_context_v2 {
> +	u8 version; /* FSCRYPT_CONTEXT_V2 */
>   	u8 contents_encryption_mode;
>   	u8 filenames_encryption_mode;
>   	u8 flags;
> -	u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
> -	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
> +	u8 __reserved[4];
> +	u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
> +	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
>   };
>   
> -static_assert(sizeof(struct fscrypt_context) == 28, "");
> +union fscrypt_context {
> +	u8 version;
> +	struct fscrypt_context_v1 v1;
> +	struct fscrypt_context_v2 v2;
> +};
> +
> +static_assert(sizeof(struct fscrypt_context_v1) == 28, "");
> +static_assert(sizeof(struct fscrypt_context_v2) == 40, "");
> +
> +/*
> +* Return the size expected for the given fscrypt_context based on its version
> +* number, or 0 if the context version is unrecognized.
> +*/
> +static inline int fscrypt_context_size(const union fscrypt_context *ctx)
> +{
> +	switch (ctx->version) {
> +	case FSCRYPT_CONTEXT_V1:
> +		return sizeof(ctx->v1);
> +	case FSCRYPT_CONTEXT_V2:
> +		return sizeof(ctx->v2);
> +	}
> +	return 0;
> +}
>   
>   #define F2FS_ACL_VERSION	0x0001
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
