Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1F2A2F79
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 17:17:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZcVt-0005Gm-DE; Mon, 02 Nov 2020 16:16:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kZcVr-0005Ga-Cp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nw7abBfLiepkpe+xdc8icLu6MFX6TpRPR8aIq6wXwOU=; b=eTZ5D4RKrfXWYPt5uDqZad6LA6
 bDUAsT3TGJ1hUK/wsxZcweX1cKj+SI0Usq5g3z2gKEzpcKq40N0mlEDAvJtjBB2AlbLm3b9oMJu+O
 Nk2GeoDetFw1GcNUoqUQEqA+5afNdJnxnw9kOIF5g4e5UnwOsQ9xORPv1CsvTLQQKM14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nw7abBfLiepkpe+xdc8icLu6MFX6TpRPR8aIq6wXwOU=; b=ReZNefJbc9swqjQRKT0abXPDlV
 xoTD7Xa3N7Tsa38gWz68PjzdNad4S50+s1b16ntiBFRdC3PY5e9s81iUbEn9NIr3p6OsbfZU5gMQI
 wudIe8xLOk/gWZxoY32L4Q++CuFdIf/Lg4Q81YJcoe/l+ZmltT2iiFGCf38ZCl59EWOI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZcVm-006a2k-4F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:16:54 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30CE222BA;
 Mon,  2 Nov 2020 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604333797;
 bh=RF6+gyvtCJ3WSklv5O2OIde9nlAW9l8n4qvBwKokL90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMcvXD/N6bWt/fu+UgfSllzmp1xdzZASkmlWSf88T1FFnbPVUw+yQ0AUdxWR8LDTC
 GmQbynfpkPvWzKk0Lg5X6Ukdyym7ouomMZOw9FSZR8EFMvjPOUdTOHuzHkV8f4JI8n
 GSGKvNqZ2sVK7GnTuJiOx/LmCfSlJOpB9V4ezFO0=
Date: Mon, 2 Nov 2020 08:16:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201102161635.GC529594@google.com>
References: <20201102002940.1450284-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102002940.1450284-1-daeho43@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZcVm-006a2k-4F
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add get/set compression option
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/02, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added new commands, get_coption and set_coption, to support
> F2FS_IOC_GET_COMPRESS_OPTION and F2FS_IOC_SET_COMPRESS_OPTION.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 61 +++++++++++++++++++++++++++++++++++++++++
>  tools/f2fs_io/f2fs_io.h |  9 ++++++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 5a2d06e..dab0d14 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -905,6 +905,65 @@ static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd
>  	exit(0);
>  }
>  
> +#define get_coption_desc "get compression option of a compressed file"
> +#define get_coption_help						\
> +"f2fs_io get_coption [file]\n\n"	\
> +"  algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
> +"  log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"
> +
> +static void do_get_coption(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	struct f2fs_comp_option option;
> +	int ret, fd;
> +
> +	if (argc != 2) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	fd = xopen(argv[1], O_RDONLY, 0);
> +
> +	ret = ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);
> +	if (ret < 0)
> +		die_errno("F2FS_IOC_GET_COMPRESS_OPTION failed");
> +
> +	printf("compression algorithm:%u\n", option.algorithm);
> +	printf("compression cluster log size:%u\n", option.log_cluster_size);
> +
> +	exit(0);
> +}
> +
> +#define set_coption_desc "set compression option of a compressed file"
> +#define set_coption_help						\
> +"f2fs_io set_coption [algorithm] [log_cluster_size] [file_path]\n\n"	\
> +"  algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
> +"  log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"
> +
> +static void do_set_coption(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	struct f2fs_comp_option option;
> +	int fd, ret;
> +
> +	if (argc != 4) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	option.algorithm = atoi(argv[1]);
> +	option.log_cluster_size = atoi(argv[2]);
> +
> +	fd = xopen(argv[3], O_RDONLY, 0);

O_WRONLY?

> +
> +	ret = ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
> +	if (ret < 0)
> +		die_errno("F2FS_IOC_SET_COMPRESS_OPTION failed");
> +
> +	printf("set compression option: algorithm=%u, log_cluster_size=%u\n",
> +			option.algorithm, option.log_cluster_size);
> +	exit(0);
> +}
>  
>  #define CMD_HIDDEN 	0x0001
>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
> @@ -930,6 +989,8 @@ const struct cmd_desc cmd_list[] = {
>  	CMD(get_cblocks),
>  	CMD(release_cblocks),
>  	CMD(reserve_cblocks),
> +	CMD(get_coption),
> +	CMD(set_coption),
>  	{ NULL, NULL, NULL, NULL, 0 }
>  };
>  
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index 05d4cfe..cb56e8c 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -84,6 +84,10 @@ typedef u32	__be32;
>  					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
>  #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
>  					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
> +#define F2FS_IOC_GET_COMPRESS_OPTION    _IOR(F2FS_IOCTL_MAGIC, 21,      \
> +						struct f2fs_comp_option)
> +#define F2FS_IOC_SET_COMPRESS_OPTION    _IOW(F2FS_IOCTL_MAGIC, 22,      \
> +						struct f2fs_comp_option)
>  
>  #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
>  #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
> @@ -164,3 +168,8 @@ struct f2fs_flush_device {
>  	u32 dev_num;		/* device number to flush */
>  	u32 segments;		/* # of segments to flush */
>  };
> +
> +struct f2fs_comp_option {
> +	u8 algorithm;
> +	u8 log_cluster_size;
> +};
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
