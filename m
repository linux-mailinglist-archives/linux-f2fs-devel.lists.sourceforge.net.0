Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10723A4525D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2025 02:45:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tn6US-0003K4-RN;
	Wed, 26 Feb 2025 01:45:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tn6UR-0003Jy-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 01:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=djUeJ/rRw+7bVTqGeHEjffdnhFU5ObaLMZm6waEo/cM=; b=UwBZgJk2cJV8ux/ZvoDOOyI70V
 KYe0LC9Ee70F3UjN+jCjK4n1ZJHxwd7TGVSwXFvOn9DPQ9pomeXjLI5AXOXAD/eBWFmR1uWzbCSZF
 H/TRit+OXYg1qNfSD8WE7TxEH0h5Th2yVl5LIu7GFvzymnoup9NF6Lb2d3427NwJcEMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=djUeJ/rRw+7bVTqGeHEjffdnhFU5ObaLMZm6waEo/cM=; b=NaNgB/sD70WdvGNWF/gjUhZ49K
 z2hl11p/cxHNFKXf/xKNVJuAcnpie7Y1hasjFBtEUusIF0DpumWx4vHl4DIa0xG34COsnGcGVnFvs
 GLMsWTdYMEHcYplim2S54K5RNMjViU8jbbhhgMH2bT8tHH3binATsBTja4dIaqOmN6mc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tn6UQ-0001ZD-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 01:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33C0B5C49B1;
 Wed, 26 Feb 2025 01:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850BBC4CEDD;
 Wed, 26 Feb 2025 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740534323;
 bh=ngX5hmUBid2B/leasE/ldqcaQuKWY4R/b6bE5lXGa9g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rTpTTGjYdx2MUuAKzqQZmH2+d0v8Kbdea04pfGIjqYXLovNpjxmSR8xlnwTElkR5M
 NxR1SjvxFJzLlqpXpEee9cB2M4LI+3e4m5pVxmKeKNB/CWu0/XIZ61PxW22rhvaAzy
 Av/PjMEKjuEYbM0ThtE04yKXMjEzQyHbLIf0v6W4g6Cs1kog/ZtaFj1rLDqcP8EU/h
 dnimeoOuJT1aNQXi9P7NyRvSTvPNtoa0B9y1m3D9cx37DRICtbTZg6f6nk4YCzcex/
 oWWrwdX6iZ0hW63LtdVPVKhtT87sCsrrHmciWynV4qCI00HKk7TMCuAWdDECl+yYTV
 Ba4STfOufVZNQ==
Message-ID: <6f097ce3-5a0b-4d58-bd48-6b2ed135747f@kernel.org>
Date: Wed, 26 Feb 2025 09:45:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250226002707.358601-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250226002707.358601-1-daeho43@gmail.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/26/25 08:27,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > add ftruncate command to do file truncate. Need to update manual of
 f2fs_io as well? Thanks, 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tn6UQ-0001ZD-E7
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: add ftruncate command in f2fs_io
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/26/25 08:27, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> add ftruncate command to do file truncate.

Need to update manual of f2fs_io as well?

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index fa01f8f..08056a9 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -1887,6 +1887,31 @@ static void do_get_advise(int argc, char **argv, const struct cmd_desc *cmd)
>  	printf("\n");
>  }
>  
> +#define ftruncate_desc "ftruncate a file"
> +#define ftruncate_help					\
> +"f2fs_io ftruncate [length] [file_path]\n\n"	\
> +"Do ftruncate a file in file_path with the length\n"	\
> +
> +static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	int fd, ret;
> +	off_t length;
> +
> +	if (argc != 3) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	length = atoll(argv[1]);
> +	fd = xopen(argv[2], O_WRONLY, 0);
> +
> +	ret = ftruncate(fd, length);
> +	if (ret < 0)
> +		die_errno("ftruncate failed");
> +	exit(0);
> +}
> +
>  #define CMD_HIDDEN 	0x0001
>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> @@ -1932,6 +1957,7 @@ const struct cmd_desc cmd_list[] = {
>  	CMD(removexattr),
>  	CMD(lseek),
>  	CMD(get_advise),
> +	CMD(ftruncate),
>  	{ NULL, NULL, NULL, NULL, 0 }
>  };
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
