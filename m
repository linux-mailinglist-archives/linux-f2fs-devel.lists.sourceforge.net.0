Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BA99DEDD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 08:57:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0bUt-0006Gz-1R;
	Tue, 15 Oct 2024 06:57:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0bUr-0006Gs-DS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gAkcCbpULSa/HrQMFLAScrfC7pomifXw9TVcIRxeaKA=; b=HGvFSyLJd6AGYCzTuNwUHTJIZr
 KfNXGLGIUMttvnTIjKknwrB6vGDB/P9SHKmXsdMEPUvZ2tkyC+qFG7dJr269ckVj0K+pS4Qa9pr4R
 zgfu5Ct9OzQg+GPiEe8DEtv9XfY9sYLJv6JNQbJbP6PYeBezSoNhDXk6Z6k/HcveNizs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gAkcCbpULSa/HrQMFLAScrfC7pomifXw9TVcIRxeaKA=; b=V+hTuHwljUCIoJZoF18rOEujXO
 kSviNIA5A+u2/7Q4bmGGGpUQR2rJ1AEkrzMdK57E43nTFGb/D6F5/+4J90H0sEANKoz0fx/zHfTNY
 hu9e7jK5D1bU7R0XNnBl+T2KvNpES2cFWFcrg6Ulo5QqDO+BDxtromgMqOGpZ9aCq4ao=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0bUq-0006in-Kc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 067ABA40E59
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Oct 2024 06:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D315DC4CEC7;
 Tue, 15 Oct 2024 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728975446;
 bh=fPb+Ot2PAvqBGzsNUR8V023td7jrlOec+/fQ+WAbwOE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HeIO2sV5PMDjIFocN886TOLF28o+y5yZ+Je4iM06uXr5pK6lWGjRgh1yKESnFt/ao
 jAzsgZ2jvBNNLQw9CuV15Kk/dKwFOQe650ySeu4snTWqyjfVOyDlAgyPwGGLKNf3VT
 HSA2kay2qKa7lNbG7yZaD1gkpOGJsqR9pdlxli1cI3ipzZjcEezCvH7JMTU7nUrIVj
 JGwdiUhEjdbFP6uNjkExYZPrbkTTCVVhoqz9uowEuxlWnaQXEf7xswlfUxmqCmlv/L
 5IvYVf08LNEnL59qZVEamq8VuhsGmESARAbzeNddp0fTCgbe4IR5LGCRBG31VBH1op
 T319wdgnV+zYQ==
Message-ID: <5a371490-a527-4c4e-9450-da033c7b3cab@kernel.org>
Date: Tue, 15 Oct 2024 14:57:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20241011224919.1729312-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20241011224919.1729312-1-jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/12 6:49, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This adds a way to boost read performance by giving fadvise. > >
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> > --- > tools/f2fs_io/f2f [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0bUq-0006in-Kc
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: support fadvice for read
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/12 6:49, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This adds a way to boost read performance by giving fadvise.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   tools/f2fs_io/f2fs_io.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 8fbad3c8e563..5b67a92e0947 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -833,12 +833,15 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
>   
>   #define read_desc "read data from file"
>   #define read_help					\
> -"f2fs_io read [chunk_size in 4kb] [offset in chunk_size] [count] [IO] [print_nbytes] [file_path]\n\n"	\
> +"f2fs_io read [chunk_size in 4kb] [offset in chunk_size] [count] [IO] [advice] [print_nbytes] [file_path]\n\n"	\
>   "Read data in file_path and print nbytes\n"		\
>   "IO can be\n"						\
>   "  buffered : buffered IO\n"				\
>   "  dio      : direct IO\n"				\
>   "  mmap     : mmap IO\n"				\
> +"advice can be\n"					\
> +" 1 : set sequential|willneed\n"			\
> +" 0 : none\n"						\
>   
>   static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>   {
> @@ -851,9 +854,9 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>   	u64 total_time = 0;
>   	int flags = 0;
>   	int do_mmap = 0;
> -	int fd;
> +	int fd, advice;
>   
> -	if (argc != 7) {
> +	if (argc != 8) {
>   		fputs("Excess arguments\n\n", stderr);
>   		fputs(cmd->cmd_help, stderr);
>   		exit(1);
> @@ -876,13 +879,22 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>   	else if (strcmp(argv[4], "buffered"))
>   		die("Wrong IO type");
>   
> -	print_bytes = atoi(argv[5]);
> +	print_bytes = atoi(argv[6]);
>   	if (print_bytes > buf_size)
>   		die("Print_nbytes should be less then chunk_size in kb");
>   
>   	print_buf = xmalloc(print_bytes);
>   
> -	fd = xopen(argv[6], O_RDONLY | flags, 0);
> +	fd = xopen(argv[7], O_RDONLY | flags, 0);
> +
> +	advice = atoi(argv[5]);
> +	if (advice) {
> +		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_SEQUENTIAL) != 0)
> +			die_errno("fadvise failed");
> +		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_WILLNEED) != 0)
> +			die_errno("fadvise failed");
> +		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[7]);
> +	}
>   
>   	total_time = get_current_us();
>   	if (do_mmap) {
> @@ -912,8 +924,9 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>   		read_cnt = count * buf_size;
>   		memcpy(print_buf, data, print_bytes);
>   	}
> -	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, print %u bytes:\n",
> -		read_cnt, get_current_us() - total_time, print_bytes);
> +	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
> +		read_cnt, get_current_us() - total_time,
> +		((long double)read_cnt / (get_current_us() - total_time) * 1000/1024 * 1000/1024 ), print_bytes);

((long double)read_cnt / (get_current_us() - total_time) / 1000 / 1000) ?

>   	printf("%08"PRIx64" : ", offset);
>   	for (i = 1; i <= print_bytes; i++) {
>   		printf("%02x", print_buf[i - 1]);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
