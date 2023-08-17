Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158877F9F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 16:59:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWeSj-0005TO-CD;
	Thu, 17 Aug 2023 14:59:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qWeSh-0005T5-V4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=90s7unqK5elVRkjRWx7B5t30MpsQLmdbvp1qDt7pI60=; b=NgGjMrW9I1b4JH9ulPiWCj+vk4
 0RU5S2LPwDZhmxLezlSvBXXoEdxOWrzy9HENM4Pnq5PjjVSsc0Vv4aVPb78Ae+0/fECNpxkcwr0nh
 /+c32JfuqfYCH2xBHnwvF4d2g97qumb7ypSiQDOJmDBnOxnV0imzNudWc++hEdzT1zfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=90s7unqK5elVRkjRWx7B5t30MpsQLmdbvp1qDt7pI60=; b=LdqMh+yNpiu5d33Hiq/bD/SueW
 niTqZaScBYF4I4aroZKN6QbgofC8iocw8Be6IGOYohT3NKnhmKVKISLiZKBUWUohXE5jgywFhUPbu
 lh6ippL2M4rAEwuSrTgCILrQTc9Qas4CRs4uIRPf0e3n1bWcug23yjmXAAXoXNII5Bbk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qWeSi-00057v-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:59:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0CAD673C7;
 Thu, 17 Aug 2023 14:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E83C433C8;
 Thu, 17 Aug 2023 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692284334;
 bh=07Q0BsnSYTw2abmakLJYh6f7VgV3hoIX5r+L1SWZFTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TDrQ14Ukv0FQ/wXBWJtm0+5uH4mYYdXWtqjsfH5zobLICECrK2AvzNz1MkN7YcO7L
 SlSfAjWO7sMpndztcse2BeujWcve5oM4n3iE21xx8eVb8+a2a87oR3WNDI9cTag3H/
 Zd4H7+njwudOdtsevMMssBe5aWIwaEJqZB6WE59bshmf3hh2ADPN9vty8e71g2urqs
 y8r5wfeuhAE7rGA2lpng5r6+mCwUQs2Gvrfd+McsVj3fmFJdW4GroeGJy9fDaCjqsr
 h7bn/OVXW0+/JGazuH7D5dXnSLSY7h7y5vzrhzcAQi+JmDfLkMYCpjZrZbzkw2ajAv
 x2PTR5BdFGu6g==
Message-ID: <ded879cd-9ee0-5f0d-d745-c0ba26eebfb8@kernel.org>
Date: Thu, 17 Aug 2023 22:58:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20230815111928.31542-1-hanqi@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230815111928.31542-1-hanqi@vivo.com>
X-Spam-Score: -9.2 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/15 19:19,
 Qi Han wrote: > To align f2fs_io functionality
 with chattr +/-c and +/-m, the > do_clearflags function has been added to
 clear the FS_COMPR_FL and > FS_NOCOMP_FL flags. > > Signed- [...] 
 Content analysis details:   (-9.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qWeSi-00057v-A6
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add do_clearflags to clear
 nocompress/compress flag
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

On 2023/8/15 19:19, Qi Han wrote:
> To align f2fs_io functionality with chattr +/-c and +/-m, the
> do_clearflags function has been added to clear the FS_COMPR_FL and
> FS_NOCOMP_FL flags.
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>   man/f2fs_io.8           |  4 ++++
>   tools/f2fs_io/f2fs_io.c | 37 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
> index 450f1b7..4ffb28d 100644
> --- a/man/f2fs_io.8
> +++ b/man/f2fs_io.8
> @@ -18,6 +18,10 @@ Get the flags associated with the specified file.
>   Set an f2fs file on specified file.  The flag can be casefold,
>   compression, and nocompression.
>   .TP
> +\fBclearflags\fR \fI[flag] [file]\fR
> +Clear an f2fs file on specified file.  The flag can be compression,

Clear a specified flag on target file?

Thanks,

> +and nocompression.
> +.TP
>   \fBshutdown\fR \fIshutdown filesystem\fR
>   Freeze and stop all IOs for the file system mounted on
>   .IR dir.
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 73ac700..a450bf1 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -330,6 +330,42 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
>   	exit(0);
>   }
>   
> +#define clearflags_desc "clearflags ioctl"
> +#define clearflags_help						\
> +"f2fs_io clearflags [flag] [file]\n\n"				\
> +"clear a flag given the file\n"					\
> +"flag can be\n"							\
> +"  compression\n"						\
> +"  nocompression\n"						\
> +
> +static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	long flag = 0;
> +	int ret, fd;
> +
> +	if (argc != 3) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	fd = xopen(argv[2], O_RDONLY, 0);
> +
> +	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
> +	printf("get a flag on %s ret=%d, flags=%lx\n", argv[1], ret, flag);
> +	if (ret)
> +		die_errno("F2FS_IOC_GETFLAGS failed");
> +
> +	if (!strcmp(argv[1], "compression"))
> +		flag &= ~FS_COMPR_FL;
> +	else if (!strcmp(argv[1], "nocompression"))
> +		flag &= ~FS_NOCOMP_FL;
> +
> +	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
> +	printf("clear a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
> +	exit(0);
> +}
> +
>   #define shutdown_desc "shutdown filesystem"
>   #define shutdown_help					\
>   "f2fs_io shutdown [level] [dir]\n\n"			\
> @@ -1464,6 +1500,7 @@ const struct cmd_desc cmd_list[] = {
>   	CMD(set_verity),
>   	CMD(getflags),
>   	CMD(setflags),
> +	CMD(clearflags),
>   	CMD(shutdown),
>   	CMD(pinfile),
>   	CMD(fallocate),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
