Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8129E93BADE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 04:33:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWoIj-0006XE-93;
	Thu, 25 Jul 2024 02:33:53 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWoIh-0006X1-Rj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qD/lnSFLWnmUAPGZeOpM/eNGBxZO2Xg47B8ewJwTRgQ=; b=XpHk8cNp6aO6KyngFIiTWL2v83
 juAzBSMCntQcHOGRdqxpOfIFEeX+Si0OigHXQGvPh0fxmnixI3nrcOVPCGA8xG0ORs8o2DOt0yEjZ
 5su7+MUvkPyfuQqKcSSe3Of57oAhNHIqGER2BQq2apVn/AR2jIbfohcWIf0n8u778l4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qD/lnSFLWnmUAPGZeOpM/eNGBxZO2Xg47B8ewJwTRgQ=; b=NREqWrKaDwMhKroYU49ZbFIQYK
 4E8Eq621oJHM8YQuYNKfPkZHVVEwgOO+XX1/A020i5kD2cZmequfE6m/RXnabD5BUOrwGaVTw+Gm5
 0DveHq6ceEuhxZAIFGA52h7vzmFcUVxS+ALZN9gubDhLgiXxAT8vwWaeF+tuyE5sz0JE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWoIg-0002B6-Qe for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22D77CE12CA;
 Thu, 25 Jul 2024 02:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A2C32781;
 Thu, 25 Jul 2024 02:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721874818;
 bh=PQZIjRQ14ZLGYfnw6irHlNSMgZOp804K/+R3aCKG91M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bw02RJTB1L5JdARw+1KG3yyHB6nOpMb1iCWPr53eyzYLdVmTdACpILMnL8tyIqzZX
 FP5NEdGDsJGHPrOIeoZhU3+E8NUS0GUWqg+sHz9W1tEq4KCa0TPuLz0M0/RdgP5RpU
 MFMBzFCGgPnLxpB8iWyXxMqCA5lYb9devCg7rxysIoVWPSwtJXQ1JVGmCK6Gwf8kMX
 xE5GTXRp6gMnFpAL9bgZDrLVdjlkkdlgKyudZUvCPda35uxnCMjFvoF0CF5dXUA8+j
 e/1ed9L0esr1/tsA4gKXw8cPjzMfaLsvFg5aC6BqkOR0A8QgJ6EvbSA+86LGER0MgQ
 AEs4YMFeLRToA==
Message-ID: <fd64e14e-7a77-4fe4-9569-f7342c68953b@kernel.org>
Date: Thu, 25 Jul 2024 10:33:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240724103543.2666271-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240724103543.2666271-1-bo.wu@vivo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/24 18:35, Wu Bo wrote: > The cp_ver of node footer
 is useful when analyzing data corruption > issues. > > Signed-off-by: Wu
 Bo <bo.wu@vivo.com> > --- > fsck/dump.c | 33 ++++++++++++++++++--- [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWoIg-0002B6-Qe
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: add checkpoint version to dump_nat
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/24 18:35, Wu Bo wrote:
> The cp_ver of node footer is useful when analyzing data corruption
> issues.
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fsck/dump.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index 8d5613e..ca38101 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -21,7 +21,7 @@
>   #endif
>   #include <locale.h>
>   
> -#define BUF_SZ	80
> +#define BUF_SZ	256

128 is fine?

>   
>   /* current extent info */
>   struct extent_info dump_extent;
> @@ -38,6 +38,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>   {
>   	struct f2fs_nat_block *nat_block;
>   	struct f2fs_node *node_block;
> +	struct node_footer *footer;
>   	nid_t nid;
>   	pgoff_t block_addr;
>   	char buf[BUF_SZ];
> @@ -47,6 +48,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>   	ASSERT(nat_block);
>   	node_block = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
>   	ASSERT(node_block);
> +	footer = F2FS_NODE_FOOTER(node_block);
>   
>   	fd = open("dump_nat", O_CREAT|O_WRONLY|O_TRUNC, 0666);
>   	ASSERT(fd >= 0);
> @@ -54,6 +56,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>   	for (nid = start_nat; nid < end_nat; nid++) {
>   		struct f2fs_nat_entry raw_nat;
>   		struct node_info ni;
> +		int len;
>   		if(nid == 0 || nid == F2FS_NODE_INO(sbi) ||
>   					nid == F2FS_META_INO(sbi))
>   			continue;
> @@ -66,15 +69,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>   			ret = dev_read_block(node_block, ni.blk_addr);
>   			ASSERT(ret >= 0);
>   			if (ni.blk_addr != 0x0) {
> -				memset(buf, 0, BUF_SZ);
> -				snprintf(buf, BUF_SZ,
> +				len = snprintf(buf, BUF_SZ,
>   					"nid:%5u\tino:%5u\toffset:%5u"
> -					"\tblkaddr:%10u\tpack:%d\n",
> +					"\tblkaddr:%10u\tpack:%d"
> +					"\tcp_ver:0x%08x\n",
>   					ni.nid, ni.ino,
> -					le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
> -						OFFSET_BIT_SHIFT,
> -					ni.blk_addr, pack);
> -				ret = write(fd, buf, strlen(buf));
> +					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
> +					ni.blk_addr, pack,
> +					(uint32_t)le64_to_cpu(footer->cp_ver));

(uint64_t)le64_to_cpu(footer->cp_ver) ?

> +				ret = write(fd, buf, len);
>   				ASSERT(ret >= 0);
>   			}
>   		} else {
> @@ -87,15 +90,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
>   
>   			ret = dev_read_block(node_block, ni.blk_addr);
>   			ASSERT(ret >= 0);
> -			memset(buf, 0, BUF_SZ);
> -			snprintf(buf, BUF_SZ,
> +			len = snprintf(buf, BUF_SZ,
>   				"nid:%5u\tino:%5u\toffset:%5u"
> -				"\tblkaddr:%10u\tpack:%d\n",
> +				"\tblkaddr:%10u\tpack:%d"
> +				"\tcp_ver:0x%08x\n",
>   				ni.nid, ni.ino,
> -				le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
> -					OFFSET_BIT_SHIFT,
> -				ni.blk_addr, pack);
> -			ret = write(fd, buf, strlen(buf));
> +				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
> +				ni.blk_addr, pack,
> +				(uint32_t)le64_to_cpu(footer->cp_ver));

Ditto,

Thanks,

> +			ret = write(fd, buf, len);
>   			ASSERT(ret >= 0);
>   		}
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
