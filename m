Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90306D6FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 09:03:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKGrq-0003uC-Et; Tue, 15 Oct 2019 07:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKGro-0003u4-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 07:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CV9jRmPpK7bxNOSPtYs8gvymwnUO7Rv5pl7c/dfPSY=; b=YdfBxjl5pSevhyZFw/CsuHpAa3
 0X3QlcejIqBuEs5wTxE9OQdkNyZutBFH6LJAdJNYamzWK8AtKEDEgjIt7LOAOrvK/LYK4QLxAWA9+
 F5AdcUfsp2FuSljRaPyzIue5PwSPfb/1JB6e1/d6KZ5iLt8Jc2FZ/6hawa1jeqefOTQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6CV9jRmPpK7bxNOSPtYs8gvymwnUO7Rv5pl7c/dfPSY=; b=Romr7IWF2pKsSFSNsznJsW32UZ
 jQW3A2ggv78dBJZO0bF+wOSJUcmT2dKggJ5zwqHfW9BMNSJYA2ERXhx7qpPf+ypyggMeKmp3dZmuq
 Role7Xotahf8bfUwVbe56lXaGQ51VMvrvlCS4zWodWAD9YonYd1THADRaDqNTT9SUIew=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKGrm-001dMM-FM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 07:03:36 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 594BB882611C15613402;
 Tue, 15 Oct 2019 15:03:27 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 15:03:24 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191004224317.153566-1-ebiggers@kernel.org>
 <20191004224317.153566-2-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d4668ff7-542e-9dbd-3870-2685cd5e076d@huawei.com>
Date: Tue, 15 Oct 2019 15:03:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191004224317.153566-2-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKGrm-001dMM-FM
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: add helper functions for
 handling errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/5 6:43, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add and use helper functions for:
> 
> - Printing an error message (optionally with errno) and exiting.
> - Allocating memory, exiting on error.
> - Opening a file, exiting on error.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  tools/f2fs_io/f2fs_io.c | 255 +++++++++++++++++++---------------------
>  1 file changed, 121 insertions(+), 134 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index add40c4..f5493ff 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -19,18 +19,21 @@
>  #define O_LARGEFILE 0
>  #endif
>  
> -#include <stdio.h>
> +#include <errno.h>
>  #include <fcntl.h>
> +#include <inttypes.h>
> +#include <signal.h>
> +#include <stdarg.h>
> +#include <stdbool.h>
> +#include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> -#include <unistd.h>
> -#include <time.h>
> -#include <inttypes.h>
>  #include <string.h>
> -#include <signal.h>
> -#include <termios.h>
> -#include <sys/types.h>
>  #include <sys/stat.h>
> +#include <sys/types.h>
> +#include <termios.h>
> +#include <time.h>
> +#include <unistd.h>
>  
>  #ifdef HAVE_CONFIG_H
>  #include "config.h"
> @@ -45,6 +48,63 @@ struct cmd_desc {
>  	int cmd_flags;
>  };
>  
> +static void __attribute__((noreturn))
> +do_die(const char *format, va_list va, int err)
> +{
> +	vfprintf(stderr, format, va);
> +	if (err)
> +		fprintf(stderr, ": %s", strerror(err));
> +	putc('\n', stderr);
> +	exit(1);
> +}
> +
> +static void __attribute__((noreturn, format(printf, 1, 2)))
> +die_errno(const char *format, ...)
> +{
> +	va_list va;
> +
> +	va_start(va, format);
> +	do_die(format, va, errno);
> +	va_end(va);
> +}
> +
> +static void __attribute__((noreturn, format(printf, 1, 2)))
> +die(const char *format, ...)
> +{
> +	va_list va;
> +
> +	va_start(va, format);
> +	do_die(format, va, 0);
> +	va_end(va);
> +}
> +
> +static void *xmalloc(size_t size)

Hi Eric,

How do you think of renaming wrapped functions to do_malloc(), do_open(),
do_aligned_alloc() instead of adding a 'x' prefix?

Thanks,

> +{
> +	void *p = malloc(size);
> +
> +	if (!p)
> +		die("Memory alloc failed (requested %zu bytes)", size);
> +	return p;
> +}
> +
> +static void *aligned_xalloc(size_t alignment, size_t size)
> +{
> +	void *p = aligned_alloc(alignment, size);
> +
> +	if (!p)
> +		die("Memory alloc failed (requested %zu bytes)", size);
> +	return p;
> +}
> +
> +static int xopen(const char *pathname, int flags, mode_t mode)
> +{
> +	int fd = open(pathname, flags, mode);
> +
> +	if (fd < 0)
> +		die_errno("Failed to open %s", pathname);
> +	return fd;
> +}
> +
>  #define getflags_desc "getflags ioctl"
>  #define getflags_help						\
>  "f2fs_io getflags [file]\n\n"					\
> @@ -66,12 +126,7 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
>  		exit(1);
>  	}
>  
> -	fd = open(argv[1], O_RDONLY);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[1], O_RDONLY, 0);
>  
>  	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
>  	printf("get a flag on %s ret=%d, flags=", argv[1], ret);
> @@ -117,17 +172,12 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
>  		exit(1);
>  	}
>  
> -	fd = open(argv[2], O_RDONLY);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[2], O_RDONLY, 0);
>  
>  	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
>  	printf("get a flag on %s ret=%d, flags=%lx\n", argv[1], ret, flag);
>  	if (ret)
> -		exit(1);
> +		die_errno("F2FS_IOC_GETFLAGS failed");
>  
>  	if (!strcmp(argv[1], "casefold"))
>  		flag |= FS_CASEFOLD_FL;
> @@ -169,18 +219,12 @@ static void do_shutdown(int argc, char **argv, const struct cmd_desc *cmd)
>  		fputs(cmd->cmd_help, stderr);
>  		exit(1);
>  	}
> -	fd = open(argv[2], O_RDONLY);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[2], O_RDONLY, 0);
>  
>  	ret = ioctl(fd, F2FS_IOC_SHUTDOWN, &flag);
> -	if (ret < 0) {
> -		perror("F2FS_IOC_SHUTDOWN");
> -		exit(1);
> -	}
> +	if (ret < 0)
> +		die_errno("F2FS_IOC_SHUTDOWN failed");
> +
>  	printf("Shutdown %s with level=%d\n", argv[2], flag);
>  	exit(0);
>  }
> @@ -201,35 +245,26 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
>  		exit(1);
>  	}
>  
> -	fd = open(argv[2], O_RDWR);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[2], O_RDWR, 0);
>  
>  	ret = -1;
>  	if (!strcmp(argv[1], "set")) {
>  		pin = 1;
>  		ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE, &pin);
> -		if (ret != 0) {
> -			perror("set_pin_file failed");
> -			exit(1);
> -		}
> +		if (ret != 0)
> +			die_errno("F2FS_IOC_SET_PIN_FILE failed");
>  		printf("set_pin_file: %u blocks moved in %s\n", ret, argv[2]);
>  	} else if (!strcmp(argv[1], "get")) {
>  		unsigned int flags;
>  
>  		ret = ioctl(fd, F2FS_IOC_GET_PIN_FILE, &pin);
> -		if (ret < 0) {
> -			perror("pin_file failed");
> -			exit(1);
> -		}
> +		if (ret < 0)
> +			die_errno("F2FS_IOC_GET_PIN_FILE failed");
> +
>  		ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flags);
> -		if (ret < 0) {
> -			perror("get flags failed");
> -			exit(1);
> -		}
> +		if (ret < 0)
> +			die_errno("F2FS_IOC_GETFLAGS failed");
> +
>  		printf("get_pin_file: %s with %u blocks moved in %s\n",
>  				(flags & F2FS_NOCOW_FL) ? "pinned" : "un-pinned",
>  				pin, argv[2]);
> @@ -262,21 +297,14 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
>  	offset = atoi(argv[2]);
>  	length = atoi(argv[3]);
>  
> -	fd = open(argv[4], O_RDWR);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[4], O_RDWR, 0);
> +
> +	if (fallocate(fd, mode, offset, length) != 0)
> +		die_errno("fallocate failed");
> +
> +	if (fstat(fd, &sb) != 0)
> +		die_errno("fstat failed");
>  
> -	if (fallocate(fd, mode, offset, length)) {
> -		fputs("fallocate failed\n\n", stderr);
> -		exit(1);
> -	}
> -	if (fstat(fd, &sb) == -1) {
> -		fputs("Stat failed\n\n", stderr);
> -		exit(1);
> -	}
>  	printf("fallocated a file: i_size=%"PRIu64", i_blocks=%"PRIu64"\n", sb.st_size, sb.st_blocks);
>  	exit(0);
>  }
> @@ -311,41 +339,27 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
>  	}
>  
>  	bs = atoi(argv[1]);
> -	if (bs > 1024) {
> -		fputs("Too big chunk size - limit: 4MB\n\n", stderr);
> -		exit(1);
> -	}
> +	if (bs > 1024)
> +		die("Too big chunk size - limit: 4MB");
> +
>  	buf_size = bs * 4096;
>  
>  	offset = atoi(argv[2]) * buf_size;
>  
> -	buf = aligned_alloc(4096, buf_size);
> -	if (!buf) {
> -		fputs("Memory alloc failed\n\n", stderr);
> -		exit(1);
> -	}
> +	buf = aligned_xalloc(4096, buf_size);
>  	count = atoi(argv[3]);
>  
> -	if (!strcmp(argv[4], "zero")) {
> +	if (!strcmp(argv[4], "zero"))
>  		memset(buf, 0, buf_size);
> -	} else if (strcmp(argv[4], "inc_num") &&
> -			strcmp(argv[4], "rand")) {
> -		fputs("Wrong pattern type\n\n", stderr);
> -		exit(1);
> -	}
> +	else if (strcmp(argv[4], "inc_num") && strcmp(argv[4], "rand"))
> +		die("Wrong pattern type");
>  
> -	if (!strcmp(argv[5], "dio")) {
> +	if (!strcmp(argv[5], "dio"))
>  		flags |= O_DIRECT;
> -	} else if (strcmp(argv[5], "buffered")) {
> -		fputs("Wrong IO type\n\n", stderr);
> -		exit(1);
> -	}
> +	else if (strcmp(argv[5], "buffered"))
> +		die("Wrong IO type");
>  
> -	fd = open(argv[6], O_CREAT | O_WRONLY | flags, 0755);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[6], O_CREAT | O_WRONLY | flags, 0755);
>  
>  	for (i = 0; i < count; i++) {
>  		if (!strcmp(argv[4], "inc_num"))
> @@ -389,43 +403,27 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  	}
>  
>  	bs = atoi(argv[1]);
> -	if (bs > 1024) {
> -		fputs("Too big chunk size - limit: 4MB\n\n", stderr);
> -		exit(1);
> -	}
> +	if (bs > 1024)
> +		die("Too big chunk size - limit: 4MB");
>  	buf_size = bs * 4096;
>  
>  	offset = atoi(argv[2]) * buf_size;
>  
> -	buf = aligned_alloc(4096, buf_size);
> -	if (!buf) {
> -		fputs("Memory alloc failed\n\n", stderr);
> -		exit(1);
> -	}
> +	buf = aligned_xalloc(4096, buf_size);
> +
>  	count = atoi(argv[3]);
> -	if (!strcmp(argv[4], "dio")) {
> +	if (!strcmp(argv[4], "dio"))
>  		flags |= O_DIRECT;
> -	} else if (strcmp(argv[4], "buffered")) {
> -		fputs("Wrong IO type\n\n", stderr);
> -		exit(1);
> -	}
> +	else if (strcmp(argv[4], "buffered"))
> +		die("Wrong IO type");
>  
>  	print_bytes = atoi(argv[5]);
> -	if (print_bytes > buf_size) {
> -		fputs("Print_nbytes should be less then chunk_size in kb\n\n", stderr);
> -		exit(1);
> -	}
> -	print_buf = malloc(print_bytes);
> -	if (!print_buf) {
> -		fputs("Memory alloc failed\n\n", stderr);
> -		exit(1);
> -	}
> +	if (print_bytes > buf_size)
> +		die("Print_nbytes should be less then chunk_size in kb");
>  
> -	fd = open(argv[6], O_RDONLY | flags);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		exit(1);
> -	}
> +	print_buf = xmalloc(print_bytes);
> +
> +	fd = xopen(argv[6], O_RDONLY | flags, 0);
>  
>  	for (i = 0; i < count; i++) {
>  		ret = pread(fd, buf, buf_size, offset + buf_size * i);
> @@ -480,20 +478,15 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>  	offset = atoi(argv[1]);
>  	count = atoi(argv[2]);
>  
> -	fd = open(argv[3], O_RDONLY | O_LARGEFILE);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>  
>  	printf("Fiemap: offset = %08"PRIx64" len = %d\n", offset, count);
>  	for (i = 0; i < count; i++) {
>  		blknum = offset + i;
>  
> -		if (ioctl(fd, FIBMAP, &blknum) < 0) {
> -			fputs("FIBMAP failed\n\n", stderr);
> -			exit(1);
> -		}
> +		if (ioctl(fd, FIBMAP, &blknum) < 0)
> +			die_errno("FIBMAP failed");
> +
>  		printf("%u ", blknum);
>  	}
>  	printf("\n");
> @@ -559,18 +552,12 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
>  	df.start = atoll(argv[1]);
>  	df.len = len = atoll(argv[2]);
>  
> -	fd = open(argv[3], O_RDWR);
> -	if (fd == -1) {
> -		fputs("Open failed\n\n", stderr);
> -		fputs(cmd->cmd_help, stderr);
> -		exit(1);
> -	}
> +	fd = xopen(argv[3], O_RDWR, 0);
>  
>  	ret = ioctl(fd, F2FS_IOC_DEFRAGMENT, &df);
> -	if (ret < 0) {
> -		perror("F2FS_IOC_DEFRAGMENT");
> -		exit(1);
> -	}
> +	if (ret < 0)
> +		die_errno("F2FS_IOC_DEFRAGMENT failed");
> +
>  	printf("defrag %s in region[%"PRIu64", %"PRIu64"]\n",
>  			argv[3], df.start, df.start + len);
>  	exit(0);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
