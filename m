Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE325B82B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 03:15:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDdqv-0004JL-Hz; Thu, 03 Sep 2020 01:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDdqt-0004Gu-DT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w8sywIvlsp0+5fd9dh5RdlOehQOl2DlbS8jeGSovhpM=; b=ht15/mN9HX66SfyjTgr3FIVLc3
 IFez0zQ/piDIgEOWHNR4AfDv9G82QTuzz7y2o9SW/anYsjopTGypzeM79XD35wMJR+RbOO/EVvki0
 Q2aCdqW+fuACtBa/ELVb734zeaJKc/uViY9zCAW2Ny9G7ilFBH7wqK3Cx2rAqMHa1158=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w8sywIvlsp0+5fd9dh5RdlOehQOl2DlbS8jeGSovhpM=; b=XxST/GgE6ZtkMLgSgdYjJlRSS5
 sRD688Kxfgh1QLhKKV+j10EVXZlVkptggWqU35HWo8gxwM1Qdhl8eJpcgMdCsX7yaHCZPrI4Dllx8
 yBf/VD7jxiUEznxjBVaC6QxSET2xYtj9lwuDGaauSh6dgdKdnWECZJLJiwVjagelEt7E=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDdqb-009reZ-72
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:15:47 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AABE585D3624ABD4377C;
 Thu,  3 Sep 2020 09:15:18 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Sep 2020
 09:15:17 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200901033649.3537459-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c5e20402-dc35-ea74-c4d2-3e1deeac6711@huawei.com>
Date: Thu, 3 Sep 2020 09:15:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200901033649.3537459-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kDdqb-009reZ-72
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/9/1 11:36, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Currently we support fiemap command using fibmap. It's simple and
> easy to use, but we cannot use this for compressed file. To support
> more different types of files, we need to change this to use fiemap.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 56 ++++++++++++++++++++++++++++-------------
>   1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index abb655a..fc81b93 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -631,27 +631,42 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>   	exit(0);
>   }
>   
> -struct file_ext {
> -	__u32 f_pos;
> -	__u32 start_blk;
> -	__u32 end_blk;
> -	__u32 blk_count;
> +struct fiemap_extent {
> +	__u64 fe_logical;
> +	__u64 fe_physical;
> +	__u64 fe_length;
> +	__u64 fe_reserved64[2];
> +	__u32 fe_flags;
> +	__u32 fe_reserved[3];
>   };
>   
> -#ifndef FIBMAP
> -#define FIBMAP          _IO(0x00, 1)    /* bmap access */
> +struct fiemap {
> +	__u64 fm_start;
> +	__u64 fm_length;
> +	__u32 fm_flags;
> +	__u32 fm_mapped_extents;
> +	__u32 fm_extent_count;
> +	__u32 fm_reserved;
> +	struct fiemap_extent fm_extent[0];
> +};
> +
> +#ifndef FIEMAP
> +#define FIEMAP		_IOWR('f', 11, struct fiemap)
>   #endif
>   
> +#define NEW_ADDR	0xFFFFFFFF
> +
>   #define fiemap_desc "get block address in file"
>   #define fiemap_help					\
>   "f2fs_io fiemap [offset in 4kb] [count] [file_path]\n\n"\
>   
>   static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   {
> -	u64 offset;
> -	u32 blknum;
>   	unsigned count, i;
>   	int fd;
> +	__u64 phy_addr;
> +	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
> +			sizeof(struct fiemap_extent));
>   
>   	if (argc != 4) {
>   		fputs("Excess arguments\n\n", stderr);
> @@ -659,21 +674,28 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   		exit(1);
>   	}
>   
> -	offset = atoi(argv[1]);
> +	fm->fm_start = atoi(argv[1]) * 4096;
> +	fm->fm_length = 4096;

F2FS_BLKSIZE

> +	fm->fm_extent_count = 1;
>   	count = atoi(argv[2]);
>   
>   	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>   
> -	printf("Fiemap: offset = %08"PRIx64" len = %d\n", offset, count);
> +	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
> +						fm->fm_start / 4096, count);

F2FS_BLKSIZE

>   	for (i = 0; i < count; i++) {
> -		blknum = offset + i;
> -
> -		if (ioctl(fd, FIBMAP, &blknum) < 0)
> -			die_errno("FIBMAP failed");
> -
> -		printf("%u ", blknum);
> +		if (ioctl(fd, FIEMAP, fm) < 0)
> +			die_errno("FIEMAP failed");
> +
> +		phy_addr = fm->fm_extent[0].fe_physical / 4096;

F2FS_BLKSIZE

> +		if (phy_addr == NEW_ADDR)
> +			printf("NEW_ADDR ");
> +		else
> +			printf("%llu ", phy_addr);
> +		fm->fm_start += 4096;

F2FS_BLKSIZE

>   	}
>   	printf("\n");
> +	free(fm);
>   	exit(0);
>   }
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
