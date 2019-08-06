Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97882919
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 03:17:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huo5y-000804-8N; Tue, 06 Aug 2019 01:16:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huo5w-0007zx-VH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eKgH2Cg70QsMNmUF3p2XybEx3cTPS1dWKYyI2EmGaxI=; b=HjbBKd5br+BmPpxTmRnebAcwIZ
 ZwPbT7gpePB3MbJl/6yirO3S7OzlUouDVxCjWcaz3/aPRTfDiqu6wc6qxfiyoVmRAuoNA6HG82aqL
 n9vRpRfyjhkHa+iyUBn2N5TXLnZFTxEhqjRuDgtJeN2c6WU2DhFfwF0kaCv/JGoT6/S8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKgH2Cg70QsMNmUF3p2XybEx3cTPS1dWKYyI2EmGaxI=; b=NEpoW5pVNcj8mJS5D/ZuHGFXOv
 0vR7Qq0ivMxPmYEu0PZIa/cVn/jmoLPslj0RvqpUts+/LgXuIoi6zez1eBJcukHQZ+2YWQ5mdsR2r
 ypqI+deeQ7n4824ntNfB74WCWr2zTGAYxij2vuysF1iOj39YOxjC2v+wPp2ikKr7nl4I=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huo5v-00CKmi-4B
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:16:56 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 44FBC7DF4E356A1AFB6D;
 Tue,  6 Aug 2019 09:16:48 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019
 09:16:46 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20190727154434.5946-1-chao@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b3010d4f-11c8-58e8-96fe-578d58278e28@huawei.com>
Date: Tue, 6 Aug 2019 09:17:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190727154434.5946-1-chao@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huo5v-00CKmi-4B
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: support defrag_file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/27 23:44, Chao Yu wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> Support 'defrag_file' sub command to trigger file based defragment via
> ioctl in f2fs.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - remove unneeded debug info.
> - fix compile warning.

Sorry I sent the old one...

I add -v option, but w/o implement the details, because I just see generic/018
want this, also other filesystem utils have this option, not sure we should
remove this option... any thoughts?

"f2fs_io defrag_file [start] [length] [-v] [file_path]\n\n"	

>  tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index f087da4..59ef8a7 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -442,6 +442,46 @@ static void do_gc_urgent(int argc, char **argv, const struct cmd_desc *cmd)
>  	}
>  }
>  
> +#define defrag_file_desc "do defragment on file"
> +#define defrag_file_help						\
> +"f2fs_io defrag_file [start] [length] [-v] [file_path]\n\n"		\
> +"  start     : start offset of defragment region, unit: bytes\n"	\
> +"  length    : bytes number of defragment region\n"			\
> +"  -v        : be verbose\n"						\
> +
> +static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	struct f2fs_defragment df;
> +	u64 len;
> +	int ret, fd;
> +
> +	if (argc != 5) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	df.start = atoll(argv[1]);
> +	df.len = len = atoll(argv[2]);
> +
> +	fd = open(argv[4], O_RDWR);
> +	if (fd == -1) {
> +		fputs("Open failed\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +printf("%lu, %lu\n", df.start, df.len);
> +	ret = ioctl(fd, F2FS_IOC_DEFRAGMENT, &df);
> +	if (ret < 0) {
> +		perror("F2FS_IOC_DEFRAGMENT");
> +		exit(1);
> +	}
> +	printf("defrag %s in region[%lu, %lu]\n", argv[3],
> +				df.start, df.start + len);
> +	exit(0);
> +}
> +
> +
>  #define CMD_HIDDEN 	0x0001
>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> @@ -456,6 +496,7 @@ const struct cmd_desc cmd_list[] = {
>  	CMD(read),
>  	CMD(fiemap),
>  	CMD(gc_urgent),
> +	CMD(defrag_file),
>  	{ NULL, NULL, NULL, NULL, 0 }
>  };
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
