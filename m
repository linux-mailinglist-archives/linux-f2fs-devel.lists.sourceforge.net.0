Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41432265782
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Sep 2020 05:36:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGZrG-0001mk-Pk; Fri, 11 Sep 2020 03:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kGZrF-0001mX-JU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Sep 2020 03:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdPY0s68PtxdKKsDTPYE5TOx0/Pm/Zc0ncU9CMevKng=; b=L7I9GVMhT7Y4r1czCJQsTPVyOe
 9B3MP7R6EWaFKbkcx/m2I3de9kyE5jtXpFQULjM5TLgYI2uxWzQUf0kSfCam4/brcJqMCoLHa872y
 AlIVs5jUTWWsC4Xi4Tkao3dtqXHmvWVRr/VpWN4mr94STU/Z9UL03/jUupVGLZP9wf/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rdPY0s68PtxdKKsDTPYE5TOx0/Pm/Zc0ncU9CMevKng=; b=lN+JhlShxBMZK+YZNdfoVpdHG9
 XEfOhs9j+RgLJANUeRJ9DFu4kDJB11M2jJlFJtNgfXdmvEZeaoocBKqVKWCAlIUZxJuZ0zQdRsPdZ
 /8gqGJW8Usznf8sqqGXo/QMMZZQ4g/CiE3tcAapGzaw/9aAR6WfiUlT67+mdG2dnPixw=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kGZr7-003Sz5-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Sep 2020 03:36:17 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 73D2D53AE22E108792C9;
 Fri, 11 Sep 2020 11:36:00 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 11 Sep
 2020 11:35:57 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200910052948.2021806-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bb32e47d-ecc1-39d5-7877-38aac7390d60@huawei.com>
Date: Fri, 11 Sep 2020 11:35:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200910052948.2021806-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -3.6 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -3.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kGZr7-003Sz5-Ut
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: change fibmap to fiemap
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

On 2020/9/10 13:29, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Currently we support fiemap command using fibmap. It's simple and
> easy to use, but we cannot use this for compressed file. To support
> more different types of files, we need to change this to use fiemap.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> Changes in v3:
>   - Change to use linux/fiemap.h header
> Changes in v2:
>   - Move declaration to header file
> ---
>   configure.ac            |  1 +
>   tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++--------------------
>   tools/f2fs_io/f2fs_io.h | 10 ++++++++++
>   3 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index e9acd1a..eb1e745 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -93,6 +93,7 @@ AC_CHECK_HEADERS(m4_flatten([
>   	linux/posix_acl.h
>   	linux/types.h
>   	linux/xattr.h
> +	linux/fiemap.h
>   	mach/mach_time.h
>   	mntent.h
>   	scsi/sg.h
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index abb655a..5a2d06e 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -631,27 +631,18 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
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
> +#if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>   	unsigned count, i;
>   	int fd;
> +	__u64 phy_addr;
> +	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
> +			sizeof(struct fiemap_extent));
>   
>   	if (argc != 4) {
>   		fputs("Excess arguments\n\n", stderr);
> @@ -659,22 +650,32 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
> +		if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> +			die_errno("FIEMAP failed");
>   
> -		printf("%u ", blknum);
> +		phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
> +		if (phy_addr == NEW_ADDR)
> +			printf("NEW_ADDR ");
> +		else
> +			printf("%llu ", phy_addr);
> +		fm->fm_start += F2FS_BLKSIZE;
>   	}
>   	printf("\n");
> +	free(fm);
>   	exit(0);
> +#else
> +	die("Not support for this platform");
> +#endif
>   }
>   
>   #define gc_urgent_desc "start/end/run gc_urgent for given time period"
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index bd19ff9..05d4cfe 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -10,6 +10,13 @@
>   #ifdef HAVE_LINUX_TYPES_H
>   #include <linux/types.h>
>   #endif
> +#ifdef HAVE_LINUX_FIEMAP_H

Should add this HAVE_LINUX_FIEMAP_H macro into include/android_config.h?

> +#include <linux/fiemap.h>
> +#endif
> +#ifdef HAVE_LINUX_FS_H
> +#include <linux/fs.h>
> +#endif
> +
>   #include <sys/types.h>
>   
>   #ifdef UNUSED
> @@ -38,6 +45,9 @@ typedef u16	__be16;
>   typedef u32	__be32;
>   #endif
>   
> +#define F2FS_BLKSIZE	4096
> +#define NEW_ADDR	0xFFFFFFFF
> +
>   #ifndef FS_IOC_GETFLAGS
>   #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
>   #endif
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
