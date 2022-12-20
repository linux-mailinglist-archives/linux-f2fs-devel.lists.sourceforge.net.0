Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60C651A1D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 05:56:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7UfW-0001lo-Kx;
	Tue, 20 Dec 2022 04:55:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7UfW-0001li-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 04:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J+/FBqIogp8YH0j57zrX+Hw54nzkNT++r0GlPEwUxTQ=; b=mOu4m0QZW1xi8Qzv6vxqz5HvOz
 3vY1dpejG/61g0yUYNVC3d9vwE39/9FFN6nVHJPbtN4TGkurBvFl8NtsbnMRONAZwJxPrniibQOX5
 ddk1bMsZ5u5i2XQxvuXWqNBDRbqvSRVr6f7p2mUaElpGTeWwj62SBlISWK3/FeUf4+i4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+/FBqIogp8YH0j57zrX+Hw54nzkNT++r0GlPEwUxTQ=; b=S4alWiyx+kZhXVX7YygIy8WqVC
 XBoU6wxbebDYjEQwb0jcKe+uLbjRIHWcT667okt+OpX/PaVXdN0j5hi3qmcRPXn8v5WdOUuJByHRY
 CZN2r4KhZyJPHQf7K1SDkdcEahaPcBzQxW2yyTQhptVN+S3nJc5zgPw3vRw2SR1IrO6M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7UfR-005O06-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 04:55:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6244CB810FD;
 Tue, 20 Dec 2022 04:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B7BC433EF;
 Tue, 20 Dec 2022 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671512145;
 bh=GO91DA62dHcU7Q/IJM2c+OtFqkL8CSTiPULcSnxTK68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p7XZpBHyVGDRJbYNgkBWTtK0s0fOTBFN9ejLUyQLm7pBGJX3weslrBmxnFeLyc/Hh
 7WqRpWndI3aGmtghZopcWqi+tdQq2Vdtd4b/i4YHIiRT+c7EhTBLcbZVfnUs6yO88u
 4Kv6CJhtODRsevqrSd7Q4eRia55jtQyP+x9h1Y6AlEQvbE9HhvmwwYauVotm7FWIap
 wql6qDCPiLT+heQNh8j/De08euUpEnvv4E/p+8WjFAeED6Oc7m2SJLLtccnKQyDij8
 fkox45tyLYq7EdjUraUxNb0Tlfuacw94BiibuK+eSChQHZ+3ea+1tGPXp5UO8vK83z
 ReQwA+dK4YcTQ==
Message-ID: <7cd515b7-cc24-bc66-416d-c9d27fade0ec@kernel.org>
Date: Tue, 20 Dec 2022 12:55:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221217132318.37718-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221217132318.37718-1-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/17 21:23, Yangtao Li wrote: > This patch moves
 discard related code from segment.c into discard.c > since discard is
 independent
 feature, and it's better to maintain > them in separated pla [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7UfR-005O06-Gs
Subject: Re: [f2fs-dev] [PATCH] f2fs: maintain discard in separated file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/17 21:23, Yangtao Li wrote:
> This patch moves discard related code from segment.c into discard.c
> since discard is independent feature, and it's better to maintain
> them in separated place.
> 
> There is no functionality change.

Please check Jaegeuk's comments on similar patch:

https://lore.kernel.org/linux-f2fs-devel/20180426160819.GI68594@jaegeuk-macbookpro.roam.corp.google.com/

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/Makefile  |    2 +-
>   fs/f2fs/discard.c | 1271 +++++++++++++++++++++++++++++++++++++++++++++
>   fs/f2fs/f2fs.h    |   37 +-
>   fs/f2fs/segment.c | 1268 +-------------------------------------------
>   4 files changed, 1317 insertions(+), 1261 deletions(-)
>   create mode 100644 fs/f2fs/discard.c
> 
> diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
> index 8a7322d229e4..3d2874633db0 100644
> --- a/fs/f2fs/Makefile
> +++ b/fs/f2fs/Makefile
> @@ -3,7 +3,7 @@ obj-$(CONFIG_F2FS_FS) += f2fs.o
>   
>   f2fs-y		:= dir.o file.o inode.o namei.o hash.o super.o inline.o
>   f2fs-y		+= checkpoint.o gc.o data.o node.o segment.o recovery.o
> -f2fs-y		+= shrinker.o extent_cache.o sysfs.o
> +f2fs-y		+= shrinker.o extent_cache.o sysfs.o discard.o
>   f2fs-$(CONFIG_F2FS_STAT_FS) += debug.o
>   f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
>   f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
> diff --git a/fs/f2fs/discard.c b/fs/f2fs/discard.c
> new file mode 100644
> index 000000000000..794f88fc729d
> --- /dev/null
> +++ b/fs/f2fs/discard.c
> @@ -0,0 +1,1271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * f2fs discard support
> + *
> + * Copyright (c) 2022 Vivo Communication Technology Co.,Ltd.
> + * Author: Yangtao Li <frank.li@vivo.com>

Oops, this is not a right way that changing copyright & anthor to vivo...

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
