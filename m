Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3B554A54
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 14:50:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3zon-0003jH-1N; Wed, 22 Jun 2022 12:50:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o3zom-0003jB-7S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 12:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKjfZVkv31vlj8fjRLrdB6+HAMmb2SOZLqRnnAudKuY=; b=PObd/WHsShkvy6F1dMcTK15n7l
 65GCOw7PZzaQ9v6qjJSkvOixXRbbFWNgojG+vNELCX4Ew1ZVzmgk5V8FgFhr5xym4G0VHHvmMxeRH
 yOoYAyVbrhAfIak11QnzEN5INz+n1r8tBsxJEilHOQ4WEkLQ6jbCAemP/g1GvsgK5AfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nKjfZVkv31vlj8fjRLrdB6+HAMmb2SOZLqRnnAudKuY=; b=PzRq9xfADwTO6ZbOz0xg8oxIpx
 Mi0lmsWUPt3gG7HbyR8PHiSDvYIUd7cYZ+Zv6ocWDJ23WE7JkeK2++h7MQFZGGFMFdclp7jbbyqd2
 seKy2zLTcZGg68FRZQqTWiqSPSj9nMZbdlcMNm7z72RrHfJLZecXJmHIiHCacagPFXLM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o3zok-0001Gv-Aj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 12:50:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85464619C2;
 Wed, 22 Jun 2022 12:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E54C34114;
 Wed, 22 Jun 2022 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655902238;
 bh=LXxV2XdWo9ODoRTaLbjoba11bZZU9SlnRfAgm8n7JzY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fLZ3mqtYAJa53yiCfNTiRj1aEhHPpsRxRTyyUS3j7nvWZTQETvpeH+NcsscuD0ZSF
 ZBRmPM252tNBMwjpni8AgN8bi0TmY2KfS62hwVOA47xp6kcqeGSd/uW2LXl/Gdgx9n
 b+n22ovai8cT4CUN1I3AHrgRojLQ/YZjXPP11+PLypEko5iOv9/1Ti2WiWsidNiJun
 UevxTFy3LRLL5Av02OEz+N/NQwqBAU/LjUp3Iz4Z86zaTYU4ewURivE4YiL9Oz7BNs
 Nj7JuCKAfXj+arqj2uEMsPvoAy8j5NP/912yVnaBE3Qnd6aXtHRXP4npLQN2TxyMpq
 V1qAxU+/OaGPg==
Message-ID: <7fb689d9-11ba-a173-8ad4-a328a03298a8@kernel.org>
Date: Wed, 22 Jun 2022 20:50:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220621064202.1078536-1-chaoliu719@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220621064202.1078536-1-chaoliu719@gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/21 14:42,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > Files created by truncate have a size but no blocks, so I didn't get
 it, how can we create file by truncation... Thanks, 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o3zok-0001Gv-Aj
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow compression of files without
 blocks
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
Cc: Chao Liu <liuchao@coolpad.com>, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/21 14:42, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> Files created by truncate have a size but no blocks, so

I didn't get it, how can we create file by truncation...

Thanks,

> they can be allowed to enable compression.
> 
> Signed-off-by: Chao Liu <liuchao@coolpad.com>
> ---
>   fs/f2fs/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2d1114b0ceef..daaa0dfd2d2e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1879,7 +1879,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>   		if (iflags & F2FS_COMPR_FL) {
>   			if (!f2fs_may_compress(inode))
>   				return -EINVAL;
> -			if (S_ISREG(inode->i_mode) && inode->i_size)
> +			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
>   				return -EINVAL;
>   
>   			set_compress_context(inode);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
