Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808C25CFAC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Sep 2020 05:11:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kE28c-0007jt-6P; Fri, 04 Sep 2020 03:11:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kE28a-0007jm-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Sep 2020 03:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/azfHFVrMaB+7BLUxyx2nQP5uZssVi+3Y5iVZdIlKk=; b=YCh2ubHvW4yH3TUPPES+B3vffQ
 mNZwcJJuMwucRYXtXnZWy6cq3nFjh2waXBGfHc1bYS7CSnOCu6LCKiFb71DuP3IwYxVmWoZT7fBFa
 D8I4NkAXfwQPdvGved5e2o5BFsRnWxKqUxqDDNLIFWQrbdW8loRNJzDMx2TIdLwj3juA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t/azfHFVrMaB+7BLUxyx2nQP5uZssVi+3Y5iVZdIlKk=; b=WlRGttLJPzB8gdW/XqZDTdomwb
 7Ul9CarsK2/5Qauy96hkRBUjeqzNqe7vtFslrhbGft6chLcSHYB2o2yuODcZyI3IXW47yFOH29BIC
 eFmciDwqI4hs7QAng1i7QyYKh3femMn8Ab5EhgBDqRaxHT0VzA4Uy1bASuMqAJYt1WhU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kE28V-00BMQM-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Sep 2020 03:11:40 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 80256DDCAD3CB82EB68C;
 Fri,  4 Sep 2020 11:11:17 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Sep 2020
 11:11:12 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200903024442.296703-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4c5dcf19-4495-5181-1695-fddf05c3bf24@huawei.com>
Date: Fri, 4 Sep 2020 11:11:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200903024442.296703-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kE28V-00BMQM-Lq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: change fibmap to fiemap
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



On 2020/9/3 10:44, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Currently we support fiemap command using fibmap. It's simple and
> easy to use, but we cannot use this for compressed file. To support
> more different types of files, we need to change this to use fiemap.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> Changes in v2:
>   - Move declaration to header file
> ---
>   tools/f2fs_io/f2fs_io.c | 37 +++++++++++++++++--------------------
>   tools/f2fs_io/f2fs_io.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index abb655a..9a651c0 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -631,27 +631,17 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>   	exit(0);
>   }
>   
> -struct file_ext {
> -	__u32 f_pos;
> -	__u32 start_blk;
> -	__u32 end_blk;
> -	__u32 blk_count;
> -};
> -
> -#ifndef FIBMAP
> -#define FIBMAP          _IO(0x00, 1)    /* bmap access */
> -#endif
> -
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
> @@ -659,21 +649,28 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   		exit(1);
>   	}
>   
> -	offset = atoi(argv[1]);
> +	fm->fm_start = atoi(argv[1]) * F2FS_BLKSIZE;
> +	fm->fm_length = F2FS_BLKSIZE;
> +	fm->fm_extent_count = 1;
>   	count = atoi(argv[2]);
>   
>   	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>   
> -	printf("Fiemap: offset = %08"PRIx64" len = %d\n", offset, count);
> +	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
> +					fm->fm_start / F2FS_BLKSIZE, count);
>   	for (i = 0; i < count; i++) {
> -		blknum = offset + i;
> -
> -		if (ioctl(fd, FIBMAP, &blknum) < 0)
> -			die_errno("FIBMAP failed");
> +		if (ioctl(fd, FIEMAP, fm) < 0)
> +			die_errno("FIEMAP failed");
>   
> -		printf("%u ", blknum);
> +		phy_addr = fm->fm_extent[0].fe_physical / F2FS_BLKSIZE;
> +		if (phy_addr == NEW_ADDR)
> +			printf("NEW_ADDR ");
> +		else
> +			printf("%llu ", phy_addr);
> +		fm->fm_start += F2FS_BLKSIZE;
>   	}
>   	printf("\n");
> +	free(fm);
>   	exit(0);
>   }
>   
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index bd19ff9..62d6e7b 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -38,6 +38,9 @@ typedef u16	__be16;
>   typedef u32	__be32;
>   #endif
>   
> +#define F2FS_BLKSIZE	4096
> +#define NEW_ADDR	0xFFFFFFFF
> +
>   #ifndef FS_IOC_GETFLAGS
>   #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
>   #endif
> @@ -132,6 +135,29 @@ typedef u32	__be32;
>   #define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
>   #endif
>   
> +struct fiemap_extent {
> +	u64 fe_logical;
> +	u64 fe_physical;
> +	u64 fe_length;
> +	u64 fe_reserved64[2];
> +	u32 fe_flags;
> +	u32 fe_reserved[3];
> +};
> +
> +struct fiemap {
> +	u64 fm_start;
> +	u64 fm_length;
> +	u32 fm_flags;
> +	u32 fm_mapped_extents;
> +	u32 fm_extent_count;
> +	u32 fm_reserved;
> +	struct fiemap_extent fm_extent[0];
> +};

We don't need to copy & paste fiemap related structure here.

Let's just include <linux/fiemap.h> in f2fs_io.h

Thanks,

> +
> +#ifndef FIEMAP
> +#define FIEMAP				_IOWR('f', 11, struct fiemap)
> +#endif
> +
>   struct f2fs_gc_range {
>   	u32 sync;
>   	u64 start;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
