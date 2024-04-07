Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3F89AED6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 08:24:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtLwf-0007MA-Q8;
	Sun, 07 Apr 2024 06:24:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rtLwe-0007Lt-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 06:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47Cv1QNaJqUtEipDV3Jt9G5P2S9iSDo0O8MuZh7MnTM=; b=XV8224ywlTeF/QPd4y937IXLOq
 zeYHhO1CVyEnjVZsi4iAnqIMiez8FHZkSmch2lMo94bU2TQPQpKzujF/wCh8gTolazd/w6uCuMnKN
 b8DOBEdXDuQPIPBowmghlFhrqaGIXu2RLZgjYyDFKD/IEYCg09Diu/AFvuQTNoKB+5U8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47Cv1QNaJqUtEipDV3Jt9G5P2S9iSDo0O8MuZh7MnTM=; b=krdO+VHZkz4/zNYQ7g8EiT58mS
 F/E4EMPhdYLKOKBJ51evT3GqDEmS7FUQkjkm7AEQjUK4M157YOzRn/Pk8E70yGl+NEK/vQQmcDcJT
 itcHdqNRVQxnlQEYBALk4ufhKmap9jM6kRhGyrNHLuYmOhYhdCOqBFG6beys8nQz4Fss=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtLwb-0006bp-SE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 06:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB88C60B3B;
 Sun,  7 Apr 2024 06:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6FBC433C7;
 Sun,  7 Apr 2024 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712471032;
 bh=6HP++N9P3rHmtW5FWyhCpJ6cFbjV8ZnLO3iFVGnU/O8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=MtYe9firCEDEJWo15HHI5g4rHaSzNFZq9gAwiBgppqYpITmvI8VsZpiNzHM8LRQgz
 XKo0nDgysbb7FNcon70r7ondzmN5akzcqWGAv4AXOkyXoHRFOXiA68cY+O1WelmJaT
 LySo8FFjushQQGi+7cIdbRu1ArtugxNDyOcaAqU/F/jSLi00DX8BkB6sfh2herEabz
 d/6lwvF4tHf83BeSs1llx3K0Fue9TjtJucROnMfL4OPcaT97rYnKHtuCGkEQUBhDlM
 8fieQFnp81q5cFW1CFIdvQugr8gRdyebeZRwpO6y0UhArulnPcwryruCCja4l0Dbbo
 MeBlLTZ2gc2fQ==
Message-ID: <b68f94da-4477-4ab5-b979-aa260e0b8ef3@kernel.org>
Date: Sun, 7 Apr 2024 14:23:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Jianjian <wangjianjian0@foxmail.com>
References: <tencent_67A0192ABE8A513889F4DCEEFD83DC2FBB0A@qq.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <tencent_67A0192ABE8A513889F4DCEEFD83DC2FBB0A@qq.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/4 21:47,
 Wang Jianjian wrote: > dquot_mark_dquot_dirty
 returns old dirty state not the error code. I think it's fine to just pass
 return value of dquot_mark_dquot_dirty() to caller,
 because caller can distinguish
 status from return value: 1) < 0, there is an error, 2) >= 0, there is no
 error, previ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rtLwb-0006bp-SE
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix incorrect return value
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/4 21:47, Wang Jianjian wrote:
> dquot_mark_dquot_dirty returns old dirty state not the error code.

I think it's fine to just pass return value of dquot_mark_dquot_dirty()
to caller, because caller can distinguish status from return value:
1) < 0, there is an error, 2) >= 0, there is no error, previously it is
dirty if it is 1.

Thanks,

> 
> Signed-off-by: Wang Jianjian <wangjianjian0@foxmail.com>
> ---
>   fs/f2fs/super.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a6867f26f141..af07027475d9 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3063,13 +3063,13 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
>   {
>   	struct super_block *sb = dquot->dq_sb;
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> -	int ret = dquot_mark_dquot_dirty(dquot);
>   
> +	dquot_mark_dquot_dirty(dquot);
>   	/* if we are using journalled quota */
>   	if (is_journalled_quota(sbi))
>   		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int f2fs_dquot_commit_info(struct super_block *sb, int type)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
