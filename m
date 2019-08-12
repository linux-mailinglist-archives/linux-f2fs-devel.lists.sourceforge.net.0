Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DE8957E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 04:58:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hx0Xe-0001pY-NU; Mon, 12 Aug 2019 02:58:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hx0XZ-0001oy-UT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 02:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AMbUmwuSscok27Mdr5wRoI5mvh6pLiwVGojPMI+F8Qw=; b=Fdls3DXkHm9lOU4fnYYr1W+nQ+
 ppwD+fnng3aBnUuixmd6ykf3sKh1LiZyw4FLGJvW6WXMKuRzM09OPQj9WQ157iNdh5hL4sCWs+4Fe
 QNUx7daMdmzeNJCzHKswGavtHZdTHYK9+o1SkvWDgd8Luyu36czPyRNQgxOJwFt/J3GI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AMbUmwuSscok27Mdr5wRoI5mvh6pLiwVGojPMI+F8Qw=; b=hCml/K3szS0vT556bdK1HZF6ns
 kRHxanIoj0IJW5orpiF3WSSeZnrd+UdHq2QFXO+8JdsBGVq4KRilsp3oiP/361uQrYZAg2bBTMpvF
 fztoL4m/nxwTfjPebl6/6oXPvTeZE+9EQ09Z6b/dzvvn+1SHIHhfTiBcMf3GrJXV7000=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hx0XU-000hLJ-SS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 02:58:33 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BE6CE194F6C044FB0365;
 Mon, 12 Aug 2019 10:58:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 12 Aug
 2019 10:58:20 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190809152328.94814-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0177358e-f900-857d-d7e6-5e5335497913@huawei.com>
Date: Mon, 12 Aug 2019 10:58:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809152328.94814-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hx0XU-000hLJ-SS
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add get/setflags
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/9 23:23, Jaegeuk Kim wrote:
> From: Jaegeuk Kim <jaegeuk@google.com>
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 91 +++++++++++++++++++++++++++++++++++++++++
>  tools/f2fs_io/f2fs_io.h | 14 +++++++
>  2 files changed, 105 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 6b43778..b57c458 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -45,6 +45,95 @@ struct cmd_desc {
>  	int cmd_flags;
>  };
>  
> +#define getflags_desc "getflags ioctl"
> +#define getflags_help						\
> +"f2fs_io getflags [file]\n\n"					\
> +"get a flag given the file\n"					\
> +"flag can show \n"						\
> +"  casefold\n"							\
> +"  compression\n"						\
> +"  nocompression\n"

Could we support +/- flags?

> +
> +static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	long flag;
> +	int ret, fd;
> +	int exist = 0;
> +
> +	if (argc != 2) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	fd = open(argv[1], O_RDONLY);
> +	if (fd == -1) {
> +		fputs("Open failed\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
> +	printf("get a flag on %s ret=%d, flags=", argv[1], ret);
> +	if (flag & FS_CASEFOLD_FL) {
> +		printf("casefold");
> +		exist = 1;
> +	}
> +	if (flag & FS_COMPR_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("compression");
> +		exist = 1;
> +	}
> +	if (flag & FS_NOCOMP_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("nocompression");
> +		exist = 1;
> +	}
> +	if (!exist)
> +		printf("none");
> +	printf("\n");
> +	exit(0);
> +}
> +
> +#define setflags_desc "setflags ioctl"
> +#define setflags_help						\
> +"f2fs_io setflags [flag] [file]\n\n"				\
> +"set a flag given the file\n"					\
> +"flag can be\n"							\
> +"  casefold\n"							\
> +"  compression\n"						\
> +"  nocompression\n"
> +
> +static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	long flag;
> +	int ret, fd;
> +
> +	if (argc != 3) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	fd = open(argv[2], O_RDONLY);
> +	if (fd == -1) {
> +		fputs("Open failed\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +	if (!strcmp(argv[1], "casefold"))
> +		flag = FS_CASEFOLD_FL;
> +	else if (!strcmp(argv[1], "compression"))
> +		flag = FS_COMPR_FL;
> +	else if (!strcmp(argv[1], "nocompression"))
> +		flag = FS_NOCOMP_FL;
> +
> +	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);

It will drop other existed flags, should be:

F2FS_IOC_GETFLAGS flag
flag +/- FS_*_FL
F2FS_IOC_SETFLAGS flag

Thanks,

> +	printf("set a flag: %s ret=%d\n", argv[2], ret);
> +	exit(0);
> +}
> +
>  #define shutdown_desc "shutdown filesystem"
>  #define shutdown_help					\
>  "f2fs_io shutdown [level] [dir]\n\n"			\
> @@ -488,6 +577,8 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
>  static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
>  const struct cmd_desc cmd_list[] = {
>  	_CMD(help),
> +	CMD(getflags),
> +	CMD(setflags),
>  	CMD(shutdown),
>  	CMD(pinfile),
>  	CMD(fallocate),
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index 95fd5be..5768c1b 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -41,9 +41,13 @@ typedef u32	__be32;
>  #ifndef FS_IOC_GETFLAGS
>  #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
>  #endif
> +#ifndef FS_IOC_SETFLAGS
> +#define FS_IOC_SETFLAGS			_IOW('f', 2, long)
> +#endif
>  
>  #define F2FS_IOCTL_MAGIC		0xf5
>  #define F2FS_IOC_GETFLAGS		FS_IOC_GETFLAGS
> +#define F2FS_IOC_SETFLAGS		FS_IOC_SETFLAGS
>  
>  #define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
>  #define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
> @@ -98,6 +102,16 @@ typedef u32	__be32;
>  #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
>  #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
>  
> +#ifndef FS_NOCOMP_FL
> +#define FS_NOCOMP_FL			0x00000400 /* Don't compress */
> +#endif
> +#ifndef FS_COMPR_FL
> +#define FS_COMPR_FL			0x00000004 /* Compress file */
> +#endif
> +#ifndef FS_CASEFOLD_FL
> +#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
> +#endif
> +
>  struct f2fs_gc_range {
>  	u32 sync;
>  	u64 start;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
