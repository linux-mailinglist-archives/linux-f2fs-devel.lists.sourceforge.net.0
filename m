Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C49917FB02D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 03:43:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7o3r-0001ON-P9;
	Tue, 28 Nov 2023 02:42:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7o3r-0001OH-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M+OVn7rG6wjg/6KeWB7jvUo6rUubdlR1FVOIkS+IaH8=; b=gmVUBUaN71W5Rgj1BWXjnSOlrC
 QOgl24L2eYHzqyjSBz3wUtIB9TfmX/8Xmuf7G76Io5keemmwyOTUmo6wbYgYpJtzEnUgyMMKXxzW0
 vTtt1ELrP3aHYHX0w3ZMGRIoycIwY+dW9X6+GfoRH8QJebj3QdVdb4GSPzpvuRafyvyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M+OVn7rG6wjg/6KeWB7jvUo6rUubdlR1FVOIkS+IaH8=; b=U4zcT09FFzuTjUf6ha3zv1FUEA
 G4Upj/rft4E7RoAFLwnCtGuvkPklUWE4/29Tpuy4+Iit6JB48kckLmJe+29egaPI/YVib/gF5Bv2Y
 PLz0n/A20L1QXQFl6QV8kzJiWmCe/yjeZsST2huHjrF4apb2TqcyXYuw8H/jkHIC0ysE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7o3i-00081s-E3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06D4861518;
 Tue, 28 Nov 2023 02:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D72DC433C8;
 Tue, 28 Nov 2023 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701139355;
 bh=2dvgtHHX3mS1iRK8Z6Pf8GW437Nns93TnuD/Y1DQVW8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VIhrBaLpqmLcDjVkkPKkX8uNUl5Gt5g1ZFcbeTH9mU/L1qlDNttqRFiFI+H0dpLS2
 zWTVQbv42GLLEkEShGP1u6nxjocAPGvXTmjLnTx0YVvvFPU+Z8mInF+IthuKBAKI55
 9Gh4irLY8uNY2iJJpKF8kkdeha+1Smh67pIFVs2a2Q7LW+xgMp354UhYHBw+JLxMbe
 1DmH6FSDD3/wQEznc2F/r9sdfTJxOo7+obaDQxMgtQTKWSq3dJaYwF/Z5tRYpHHIII
 5XihRSyWDtHZVbZjwOjqHwHCLhQI3GDXDyMTwFTIUJLfvYEEcJjNciMU68icwzJh6j
 /sbjhEF2sI7RQ==
Message-ID: <bcacb482-5496-0a86-2e6a-a58d310cb0dc@kernel.org>
Date: Tue, 28 Nov 2023 10:42:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231120095410.3604801-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231120095410.3604801-1-frank.li@vivo.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/20 17:54, Yangtao Li wrote: > NFSv4 mandates a
 change attribute to avoid problems with timestamp > granularity, which Linux
 implements using the i_version counter. This is > particularly im [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7o3i-00081s-E3
Subject: Re: [f2fs-dev] [PATCH] f2fs: add support for an i_version counter
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

On 2023/11/20 17:54, Yangtao Li wrote:
> NFSv4 mandates a change attribute to avoid problems with timestamp
> granularity, which Linux implements using the i_version counter. This is
> particularly important when the underlying filesystem is fast.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h  | 1 +
>   fs/f2fs/inode.c | 1 +
>   fs/f2fs/super.c | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9043cedfa12b..68fd2ef35104 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -28,6 +28,7 @@
>   
>   #include <linux/fscrypt.h>
>   #include <linux/fsverity.h>
> +#include <linux/iversion.h>
>   
>   struct pagevec;
>   
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 560bfcad1af2..2604fa4a0704 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -32,6 +32,7 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>   	if (f2fs_inode_dirtied(inode, sync))
>   		return;
>   
> +	inode_inc_iversion(inode);

For the case f2fs is not used by nfs as backend storage, there will be overhead for
iversion update logic.

So what about introducing a new mount option to enable the iversion functionality,
and disabling it by default?

Thanks,

>   	mark_inode_dirty_sync(inode);
>   }
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 033af907c3b1..2bddccd47e3a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2204,6 +2204,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
>   	set_opt(sbi, MERGE_CHECKPOINT);
>   	F2FS_OPTION(sbi).unusable_cap = 0;
>   	sbi->sb->s_flags |= SB_LAZYTIME;
> +	sbi->sb->s_flags |= SB_I_VERSION;
>   	if (!f2fs_is_readonly(sbi))
>   		set_opt(sbi, FLUSH_MERGE);
>   	if (f2fs_sb_has_blkzoned(sbi))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
