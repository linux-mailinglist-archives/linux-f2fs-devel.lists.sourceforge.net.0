Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82106856EA4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 21:36:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raiTM-0001Sq-DG;
	Thu, 15 Feb 2024 20:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1raiTJ-0001Sj-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzgsEb6eUoIk8NVZCmk50DmTxCKxSD50fcQ7xG1THcg=; b=IGVtQdw5HG//RAluD9fR6jsCVN
 vOLh/kzxCJFk/Vw9ZNBKkpbqDnDh/B63HYOkxch4gfl7+66VC2nf47r4r49sNh4iGU4Jo1nKXB+/f
 xshtOVqwFJKRvXw34hoifhHB2BoNCeQeLDGYu6vb4gZk0VjKG6N/oolanzKAtQQjzE2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dzgsEb6eUoIk8NVZCmk50DmTxCKxSD50fcQ7xG1THcg=; b=k4wj3sJmJBI13gV0ipS8xWhPOG
 uNhB5XMObG+xR8XB28fJLXtHihg/8ayNeUVWHDpv3lkGUa2FmdgeEVM2rkGYJ8iYF4TACsb9U/Xjk
 m0u7deg0qCca2ys/UTzqcG3an2OJsTjosgbOzmTyKCAfn4GVYgd2NpUSYmdIhbQ3EFE0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1raiTF-0003Wn-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 806C1CE27F4;
 Thu, 15 Feb 2024 20:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F9FC433F1;
 Thu, 15 Feb 2024 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708029390;
 bh=w+4GQYEtYb0/zUI+FYlPpcP4BX3/rQPTNBehFhxJT4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8NJAw/Z9xiQYM8H5eWT6FTLuFCAe4wOAiQFGKvaQuhgkvG4bEZRG7cF/Ir4V8Fhk
 twbzSYtUFp9Z+4aO557z4jvS5Nk/dMhlOQtKVP7fW0Y4VEQg3nqh8GAu2H4/ZVtkOP
 OM5kJ49BnGHFc5emwzZkZqfAVYwUZl8jw5HtUV9vOJACak+XbyAx27tVrGG2sgYvvA
 lDkaFdZm6aspUE8yET7bg/WIa896NwL8bTZolSlRclL6BI32coChWkCsUCcCpjkbwQ
 4LdScP7jr+oP0f2S4CE++jXGTQ+O45ssMsCa6HlI/bPkuU5w3ImJ/sOGm2hRdWYjSB
 Q2LUa4YPnUF/w==
Date: Thu, 15 Feb 2024 12:36:29 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zc51zeFF3DrUXMem@google.com>
References: <20240215201053.2364270-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215201053.2364270-1-daeho43@gmail.com>
X-Spam-Score: -3.3 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/15,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Added lseek command to support lseek() for SEEK_DATA and SEEK_HOLE. >
 > Signed-off-by: Daeho Jeong <daehojeong@google.com> [...] 
 Content analysis details:   (-3.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1raiTF-0003Wn-Pv
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add lseek command to execute lseek()
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/15, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added lseek command to support lseek() for SEEK_DATA and SEEK_HOLE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index e7d286a..b5c5b97 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -1630,6 +1630,43 @@ static void do_removexattr(int argc, char **argv, const struct cmd_desc *cmd)
>  	exit(0);
>  }
>  
> +#define lseek_desc "do lseek for SEEK_DATA or SEEK_HOLE for a file"
> +#define lseek_help					\
> +"f2fs_io lseek [whence] [offset] [file_path]\n\n"	\
> +"Do lseek file data in file_path\n"			\
> +"whence can be\n"					\

Can we also have all the other options as well?

> +"  data     : SEEK_DATA, return the file offset to the next data location from offset\n"\
> +"  hole     : SEEK_HOLE, return the file offset to the next hole from offset\n"
> +
> +static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	int fd, whence;
> +	off_t offset, ret;
> +
> +	if (argc != 4) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	offset = atoi(argv[2]);
> +
> +	if (!strcmp(argv[1], "data"))
> +		whence = SEEK_DATA;
> +	else if (!strcmp(argv[1], "hole"))
> +		whence = SEEK_HOLE;
> +	else
> +		die("Wrong whence type");
> +
> +	fd = xopen(argv[3], O_RDONLY, 0);
> +
> +	ret = lseek(fd, offset, whence);
> +	if (ret < 0)
> +		die_errno("lseek failed");
> +	printf("returned offset=%ld\n", ret);
> +	exit(0);
> +}
> +
>  #define CMD_HIDDEN 	0x0001
>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> @@ -1671,6 +1708,7 @@ const struct cmd_desc cmd_list[] = {
>  	CMD(listxattr),
>  	CMD(setxattr),
>  	CMD(removexattr),
> +	CMD(lseek),
>  	{ NULL, NULL, NULL, NULL, 0 }
>  };
>  
> -- 
> 2.43.0.687.g38aa6559b0-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
