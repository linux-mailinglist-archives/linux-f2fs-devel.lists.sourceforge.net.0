Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A96C6B4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:42:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfM8l-00016i-Kl;
	Thu, 23 Mar 2023 14:42:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pfM8f-000161-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uX81b+f03/K6rVT4ab7r73fTgT1ubWizpxu93noCA/M=; b=biwuyLlorhDK/IjQT6MxvihYIm
 dE6vTV7S5P/aQ75k8Ks8+SoeKh/vQ1SUA9PATU5USXhp9UEwVMD4Ptb8ceSx/IqgaPrwlxpSg1o8n
 KgdXymHw2S9q2U8jp2KZ2tJbt2eJlVUFYiSUxJqwnO625Lz5bndSaC/qKRDGKEPckzvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uX81b+f03/K6rVT4ab7r73fTgT1ubWizpxu93noCA/M=; b=lQxHHvtt11Gy2em4Srf6J9Y2dw
 I9DzCu7P6vAyDsXEGX5EYushrhALWm0EGYQ/FQr2OdcW1YTdwFpUDnrXKU/sGLnqudqm0YSvKHM7a
 5TJkqzoPD6CMG+I304MrYxvOvqCgYKKBSq7RZVHVzDAy9+jWSpcYcCintj98L+Mdgzlc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfM8e-0005VB-VY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:42:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 912A962779;
 Thu, 23 Mar 2023 14:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64B3C433A1;
 Thu, 23 Mar 2023 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679582515;
 bh=Vlg7H3iswuM5SaVZgxQDjdnUoBhjPiMEv9IlvCOSVCs=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=moaZguZ/J3waAJf4kCmha0ZzZ93nG9vf/r6CkBqy/vkc696vUfAOvgqBzW40wPeJl
 3q13nAaqKIiFJrZImZiTgn660O42ZCsl9rvyJ2/5Q63b6g3nZKLvXlyJRD35DmqXrc
 RmFMPoK61a3C4RAAXdYL7Gd1dvB9ECwxmP1nyQPB9APmuKI7905/sJi8vYqXVFaVFU
 6nKWYMmOfequny+COOzLUC6YVIUyQoRAKPUo3unRhUxV2fh81F6nO6+/4UjT2uvXDW
 MPzKkJvqQdPUYpI1Sh+b0B+AQuVWns4w+E9bOWxbREBbXMSlspK66uZnqqZJfZDbNb
 cSVmxBZOQ/KGw==
Message-ID: <0f1704e5-4a4f-d920-9c69-e01ed2f0dde5@kernel.org>
Date: Thu, 23 Mar 2023 22:41:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Wang Shilong <wangshilong1991@gmail.com>, Yangtao Li <frank.li@vivo.com>
References: <20230221144550.46557-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230221144550.46557-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +Shilong, Hi, Shilong, Could you please help to check this
 patch? in original patch, it tries to ignore such error intentionally? or
 it is a bug? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfM8e-0005VB-VY
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle dqget error in
 f2fs_transfer_project_quota()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

+Shilong,

Hi, Shilong,

Could you please help to check this patch? in original patch, it tries to
ignore such error intentionally? or it is a bug?

On 2023/2/21 22:45, Yangtao Li wrote:
> We should set the error code when dqget() failed.
> 
> Fixes: 2c1d03056991 ("f2fs: support F2FS_IOC_FS{GET,SET}XATTR")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/file.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ca1720fc1187..f25e58680984 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3009,15 +3009,16 @@ int f2fs_transfer_project_quota(struct inode *inode, kprojid_t kprojid)
>   	struct dquot *transfer_to[MAXQUOTAS] = {};
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct super_block *sb = sbi->sb;
> -	int err = 0;
> +	int err;
>   
>   	transfer_to[PRJQUOTA] = dqget(sb, make_kqid_projid(kprojid));
> -	if (!IS_ERR(transfer_to[PRJQUOTA])) {
> -		err = __dquot_transfer(inode, transfer_to);
> -		if (err)
> -			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> -		dqput(transfer_to[PRJQUOTA]);
> -	}
> +	if (IS_ERR(transfer_to[PRJQUOTA]))
> +		return PTR_ERR(transfer_to[PRJQUOTA]);
> +
> +	err = __dquot_transfer(inode, transfer_to);
> +	if (err)
> +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +	dqput(transfer_to[PRJQUOTA]);
>   	return err;
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
