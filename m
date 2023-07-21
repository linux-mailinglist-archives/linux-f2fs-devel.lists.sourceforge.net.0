Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE075D474
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jul 2023 21:21:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMvgl-0007tc-HR;
	Fri, 21 Jul 2023 19:21:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qMvgh-0007tV-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 19:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CsmE4TH+vsBXq8PtC758Tlmo2BgZQ0mJ0Jeeq90gVO0=; b=b2mVeiZyfw5tsACEziewz5td1c
 gSLLcAGgyjiCTS7HlBo5PvdUx2qRZu5qX/RDDbWdhyzIZdkvyMI6Mid7ekETnLc7aLt05oai9gh1B
 EhdoKD4pPk7JRIaJ+tyzbDsn45G4aC9R2hsRFF50C6GDyUxh/BN0WYPjBqyJHVAMdQyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CsmE4TH+vsBXq8PtC758Tlmo2BgZQ0mJ0Jeeq90gVO0=; b=OZjghnTIJqRWaPQ1CLQd9pB9/S
 PO+8TPwgBM9Rx58DWn+R+/HoWBVB3K8rfpscm9wQyW1gF1LoiCy5dRjiUmd2nNvb7NFILBpajNIhs
 jqiI4y7IjFaueRL5FBQiTXKzxDclz2bDC16AQOAbi+lSetz5zGCjDNOR+OamhCvORclM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMvgh-00FffR-5h for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 19:21:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95AEB61B1C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Jul 2023 19:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6CFC433C8;
 Fri, 21 Jul 2023 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689967269;
 bh=NpV6bCRPAv9KHBdPZYWSD82ppJ4WyjrExHWQvabYwnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkJ1+gqStTcPU7l+Ko2SweCb6W4svIFFwOR0H2b1Xw0jXs/mDFmALI4DE4eo3k923
 /5Ed0HPb/owcKLbndmdiYoZL4gUtW1QG4UWCJbs3G4eGwvD56WXgjF7aLBMDoqQcXO
 60/5jX3KDTPUKSdRSjZlb/h7UNMu4IgFKAdFNYmlkDyh9wYW3XVuj49ezemfXKL4e2
 YV8pvOUMUX3LPuE7Xwp8F9i+L0W4m0dYY485IMeLvAp+AWOthvpVjjx7gPrlXS3L07
 1qrtgkCsdgGwCP67k2ojlToVCXUhv06x0DiYnVGtAMt5UDhou3NlA74JsQ44zRTPM4
 BL0uY7DlZ2fIA==
Date: Fri, 21 Jul 2023 12:21:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZLrao4BqUGWkBIDn@google.com>
References: <20230718040500.1170842-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718040500.1170842-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/18, Chao Yu wrote: > This patch adds to support dumping
 fsverity xattr info in print_xattr_entry(). > > Signed-off-by: Chao Yu
 <chao@kernel.org>
 > --- > fsck/mount.c | 13 +++++++++++++ > fsck/xa [...] 
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
X-Headers-End: 1qMvgh-00FffR-5h
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: support to dump fsverity xattr
 info in print_xattr_entry()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/18, Chao Yu wrote:
> This patch adds to support dumping fsverity xattr info in print_xattr_entry().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/mount.c | 13 +++++++++++++
>  fsck/xattr.h | 11 +++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index dbb516b..2691b2f 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -199,6 +199,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  	char *enc_name = F2FS_XATTR_NAME_ENCRYPTION_CONTEXT;
>  	u32 enc_name_len = strlen(enc_name);
>  	const union fscrypt_context *ctx;
> +	const struct fsverity_descriptor_location *dloc;
>  	int i;
>  
>  	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
> @@ -250,6 +251,18 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
>  			return;
>  		}
>  		break;
> +	case F2FS_XATTR_INDEX_VERITY:
> +		dloc = (const struct fsverity_descriptor_location *)value;
> +		if (ent->e_name_len != strlen(F2FS_XATTR_NAME_VERITY) ||
> +			memcmp(ent->e_name, F2FS_XATTR_NAME_VERITY,
> +						ent->e_name_len))
> +			break;
> +		if (size != sizeof(*dloc))
> +			break;
> +		MSG(0, "version: %u\n", le32_to_cpu(dloc->version));
> +		MSG(0, "size: %u\n", le32_to_cpu(dloc->size));
> +		MSG(0, "pos: %lu\n", le64_to_cpu(dloc->pos));

Fixed build error with
		MSG(0, "pos: %"PRIu64"\n", le64_to_cpu(dloc->pos));

> +		return;
>  	}
>  	for (i = 0; i < size; i++)
>  		MSG(0, "%02X", value[i]);
> diff --git a/fsck/xattr.h b/fsck/xattr.h
> index cddafa7..bf1dd7e 100644
> --- a/fsck/xattr.h
> +++ b/fsck/xattr.h
> @@ -90,6 +90,14 @@ static inline int fscrypt_context_size(const union fscrypt_context *ctx)
>  	return 0;
>  }
>  
> +struct fsverity_descriptor_location {
> +	__le32 version;
> +	__le32 size;
> +	__le64 pos;
> +};
> +
> +static_assert(sizeof(struct fsverity_descriptor_location) == 16, "");
> +
>  #define F2FS_ACL_VERSION	0x0001
>  
>  struct f2fs_acl_entry {
> @@ -150,6 +158,9 @@ static inline int f2fs_acl_count(int size)
>  #define F2FS_XATTR_INDEX_LUSTRE			5
>  #define F2FS_XATTR_INDEX_SECURITY		6
>  #define F2FS_XATTR_INDEX_ENCRYPTION		9
> +#define F2FS_XATTR_INDEX_VERITY			11
> +
> +#define F2FS_XATTR_NAME_VERITY			"v"
>  
>  #define IS_XATTR_LAST_ENTRY(entry) (*(__u32 *)(entry) == 0)
>  
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
