Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9CB95466
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Sep 2025 11:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOLNuUfw8CrXxAPXBvzRnxobfLFAfHWLLBsfXXwnT08=; b=F4LIt6ZY+jsCn9Wko9nmF6YySg
	NUpxUp5JbX+sLbIijGkFHbQgAYv3XY4OaNp+zZEvDcqpgmrj4tWCLZnjOS5zbpZ8nnNdO3Uh3EHcX
	OloCYjAkQn9Z42fZgsSTP1Ft/aW2r7j63UuoqIeYgyCj4Kuq+n4yylFQ7/edtJXRiEuI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v0zSF-0001vk-Ix;
	Tue, 23 Sep 2025 09:37:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v0zSE-0001vW-Mv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSDOZ1jQFyBz8KFFyJjyZFO6NpisN5nzjktOk8bD9+A=; b=FQizQJD1oa2oEpZhHx5M4n8rIH
 2TU28B20HAXhKdFwoZsnbSvBQwfIewQiOJJVQyPRUNUsu81AwutCvtli+FxAS/dziz1dv/xQx6Za+
 kpxAmlsbklPa7dV5HegdZ2EW/9UBk3lhPcL5dAi6S76fA0i3Fsm5i2A4ENxj1DnZtICE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zSDOZ1jQFyBz8KFFyJjyZFO6NpisN5nzjktOk8bD9+A=; b=DBcQOdeS6I/A6IW9bXPv37gtIC
 uwr2zfJ8zYSTO1BpnfMXh6VlHDauYtVmpfm1OeJygJJ7slgPiC76pJ9hAOpyxdzpAu1dpLBTyWe9E
 sqXiEZTW9qOhW0ps5XM+py3df5e3K3TKaNoerLxfiCKrhkOkXZ3Drg/Yv2Pvn4tzFGAU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v0zSE-0005q9-VK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E45C43F97
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Sep 2025 09:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A35C4CEF5;
 Tue, 23 Sep 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758620208;
 bh=lyMiNW7BjfcfypqnLkD6iZi2Z6pa3PDmU0J/enU2yfQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=E/oj2s5c27W+L2UdCHwmjeSP9xmiZaddT9HaUG/ZqQ7CgWhE7MnIkwoGqORYaxUC8
 dKgseMfDvTGNE1NLzc0MfkcPbRIH74dsd1z+MBPTx8bz4IWR05b/k118FayH3poQMd
 PsSuKEj4FSB6p9GRFr63LQMxre6TnHF7jm1Y5IK1NKj7xfqKkQFReG9BitAq2RnMmZ
 R1aqLdgzXAzBaALuBCbNnl/zcLuXO7dMKaO6Nqp7c413FAnj+iR2dHJcQBfnhGHMIu
 zbV2aY+m600q3yKHL0P9rjFVzkHwB/IO6MaAN8RulBylBeosURh7QGFWOkfmxKcbu+
 CD5z+E08ALzsw==
Message-ID: <1611cd78-26f1-4d26-9c17-72b10c918b2c@kernel.org>
Date: Tue, 23 Sep 2025 17:36:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250918045316.714102-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250918045316.714102-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Need to update manual entry? On 9/18/25 12:53, Jaegeuk Kim
 via Linux-f2fs-devel wrote: > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 > --- > tools/f2fs_io/f2fs_io.c | 32 ++++++++++++++++++++++++++------ > 1
 file changed, 26 i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v0zSE-0005q9-VK
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs_io: add mlock to measure the read
 speed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Need to update manual entry?

On 9/18/25 12:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  tools/f2fs_io/f2fs_io.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index b9bf9bc5f797..2d64eda81706 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -931,6 +931,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
>  "  buffered : buffered IO\n"				\
>  "  dio      : direct IO\n"				\
>  "  mmap     : mmap IO\n"				\
> +"  mlock    : mmap + mlock\n"				\
>  "advice can be\n"					\
>  " 1 : set sequential|willneed\n"			\
>  " 0 : none\n"						\
> @@ -946,6 +947,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  	u64 total_time = 0;
>  	int flags = 0;
>  	int do_mmap = 0;
> +	int do_mlock = 0;
>  	int fd, advice;
>  
>  	if (argc != 8) {
> @@ -968,6 +970,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		flags |= O_DIRECT;
>  	else if (!strcmp(argv[4], "mmap"))
>  		do_mmap = 1;
> +	else if (!strcmp(argv[4], "mlock"))
> +		do_mlock = 1;
>  	else if (strcmp(argv[4], "buffered"))
>  		die("Wrong IO type");
>  
> @@ -993,11 +997,24 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  	total_time = get_current_us();
>  	if (do_mmap) {
>  		data = mmap(NULL, count * buf_size, PROT_READ,
> -						MAP_SHARED | MAP_POPULATE, fd, offset);
> +				MAP_SHARED | MAP_POPULATE, fd, offset);
>  		if (data == MAP_FAILED)
>  			die("Mmap failed");
> -	}
> -	if (!do_mmap) {
> +
> +		read_cnt = count * buf_size;
> +		memcpy(print_buf, data, print_bytes);
> +	} else if (do_mlock) {
> +		data = mmap(NULL, count * buf_size, PROT_READ,
> +				MAP_SHARED, fd, offset);
> +		if (data == MAP_FAILED)
> +			die("Mmap failed");
> +		if (posix_fadvise(fd, offset, count * buf_size,
> +					POSIX_FADV_WILLNEED) != 0)
> +			die_errno("fadvise failed");
> +		if (mlock(data, count * buf_size))
> +			die_errno("mlock failed");
> +		read_cnt = count * buf_size;
> +	} else {
>  		for (i = 0; i < count; i++) {
>  			ret = pread(fd, buf, buf_size, offset + buf_size * i);
>  			if (ret != buf_size) {
> @@ -1014,9 +1031,6 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  			if (i == 0)
>  				memcpy(print_buf, buf, print_bytes);
>  		}
> -	} else {
> -		read_cnt = count * buf_size;
> -		memcpy(print_buf, data, print_bytes);
>  	}
>  	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
>  		read_cnt, get_current_us() - total_time,
> @@ -1029,6 +1043,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		else if (i % 2 == 0)
>  			printf(" ");
>  	}
> +	if (do_mmap) {
> +		munmap(data, count * buf_size);
> +	} else if (do_mlock) {
> +		munlock(data, count * buf_size);
> +		munmap(data, count * buf_size);
> +	}
>  	printf("\n");
>  	exit(0);
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
