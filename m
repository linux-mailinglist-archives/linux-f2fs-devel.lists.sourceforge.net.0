Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73723AD855C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 10:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5derXKJes4pEQuIHnBum2rsH2ZBUOYVqpG1zDGZspPc=; b=IlBFGNB4asmzkyX2b9gfJzhTci
	/idJ4y/l31y9hQx1IeUCY0A6vyUe5Ps6fZAEA5/3hGD5Z3lz1L2IS6zHYzNlcdxDC0dubhL8RujMg
	xH8uneg6B6iGkmtSZr5UzVNGoqsX5ESmjzLSsAPlqYnpnVp6N7FoHKeNnH1T4FhlWc5s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPzey-00036X-NO;
	Fri, 13 Jun 2025 08:21:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPzex-00036Q-Cy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UIdyRCEXDEi1QwUUBD9RDk6WFKAJz7fNwlo/nQK2Gx8=; b=I0vkTKWM4YVLfdSedzQdzb57G3
 FSgvViC5ObW2Sr2rlQv4tyPAOKEo6StnF+oFvdPwxxbwmM1SeoAJoBOxEKZCgfNBVl93EeAE452mg
 zHTU3egU3+bDoWFJ6t5Z2arKGMh6wzUF3RAluEdY+7YCN+QLhgOUXLDL3ejFlkRI3Iv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UIdyRCEXDEi1QwUUBD9RDk6WFKAJz7fNwlo/nQK2Gx8=; b=S2FnQN0nzpjQKzfyp8xSl0NEbW
 Z9lh4O3TM380OXhc14RLVl6vX99WwY67Jk0ANUVVyiL7+yJPfeS9+0xScEuV90Ik4/iQ+Yesy/BlU
 JOi0xqaP2i9yjIqLfvxxmmhEZiZi8DCfKJ1FkpEgMMVO4LJXN5xnjvyQPOnrWVtoN6sA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPzeu-0001YD-OP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:21:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E1304A607;
 Fri, 13 Jun 2025 08:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5E5C4CEE3;
 Fri, 13 Jun 2025 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749802858;
 bh=I0MpPFoiuZ2ZR4SLV6UCr8XkunvMgg37+uEtCCEzrVI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=u/PxGJ80Hf1rp6tDtF90pSDZsQAo/Yj3/zzyrljZ36LiU2sIdmqnntfGkP6iFx63s
 uTtaMAOqo5hG7s+bMahRrkSgBf5XhN1RbHhkYIuZDhH6lspFsTkNYdk1KDoyjO2NDd
 MRLuquPUtWJFKdrn9sorbN3wIRJ7R4V7VqAd4wq6OU+YGs4PjnpJGRC8kfc28jqSwx
 ck0+zT0+IbazSuXjoH3LOiDwepz4rj9NwKxTqRBs4UWtQ3UlIE7l7RBJaQq9UyFL67
 O0yEpSxakg5aEJ/8cgxZPwJenFGUQdnzCR9B4wvNC7SdcqpO0GVXJ3hlHxaCPUmdPF
 r+GncAMx+/XRg==
Message-ID: <815fa2db-0463-4a8b-86a4-dc5aefc16c0b@kernel.org>
Date: Fri, 13 Jun 2025 16:21:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250613040231.170532-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250613040231.170532-1-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/13 12:02,
 Daniel Lee wrote: > A new command 'create_speed', 
 has been introduced to measure > the performance of creating and deleting
 many files. > > Signed-off-by: Daniel Lee <chullee@googl [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPzeu-0001YD-OP
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add create_speed command
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/13 12:02, Daniel Lee wrote:
> A new command 'create_speed', has been introduced to measure
> the performance of creating and deleting many files.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 112 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 112 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 6531b55..ea6a3ff 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -2092,6 +2092,117 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
>   	exit(0);
>   }
>   
> +#define create_speed_desc "create_speed a file"
> +#define create_speed_help				\
> +"f2fs_io create_speed [dir] [num_files] [size_kb]\n\n"	\
> +"Measures file creation and deletion performance.\n"
> +
> +static void do_create_speed(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	if (argc != 4) {
> +		fputs("Usage: f2fs_io create_latency <directory> <num_files> [size_kb]\n", stderr);
> +	fputs(cmd->cmd_help, stderr);
> +	exit(1);
> +	}
> +
> +	const char *dir = argv[1];
> +	int num_files = atoi(argv[2]);
> +	int size_kb = atoi(argv[3]);
> +	char *write_buffer = NULL;
> +
> +	if (num_files <= 0) {
> +		fprintf(stderr, "Error: Number of files must be positive.\n");
> +	exit(1);
> +	}
> +
> +	if (size_kb > 0) {
> +		write_buffer = malloc(size_kb * 1024);
> +		if (!write_buffer) {
> +			perror("Failed to allocate write buffer");
> +			exit(1);
> +		}
> +		memset(write_buffer, 'a', size_kb * 1024);
> +	}
> +
> +	// Creation Phase
> +	printf("Starting test: Creating %d files of %dKB each in %s\n", num_files, size_kb, dir);
> +
> +	struct timespec create_start, create_end;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &create_start);
> +
> +	for (int i = 0; i < num_files; i++) {
> +		char path[1024];
> +
> +		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
> +
> +		int fd = open(path, O_WRONLY | O_CREAT, 0644);
> +
> +		if (fd < 0) {
> +			perror("Error opening file");
> +			continue;
> +		}
> +		if (size_kb > 0) {
> +			if (write(fd, write_buffer, size_kb * 1024) < 0)
> +				perror("Error writing to file");
> +		}
> +		if (fsync(fd) < 0)

Maybe we need to call fsync() optionally, as if we want to find and
notice performance regression comes from create, we'd better avoid
distraction from disk IO.

Thanks,

> +			perror("Error fsyncing file");
> +
> +		close(fd);
> +	}
> +
> +	clock_gettime(CLOCK_MONOTONIC, &create_end);
> +
> +
> +	// Deletion Phase
> +	printf("Deleting %d created files...\n", num_files);
> +
> +	struct timespec del_start, del_end;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &del_start);
> +
> +	for (int i = 0; i < num_files; i++) {
> +		char path[1024];
> +
> +		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
> +		if (unlink(path) != 0)
> +			perror("Error unlinking file");
> +	}
> +	sync();
> +
> +	clock_gettime(CLOCK_MONOTONIC, &del_end);
> +
> +	long create_seconds = create_end.tv_sec - create_start.tv_sec;
> +	long create_ns = create_end.tv_nsec - create_start.tv_nsec;
> +	double create_time_s = (double)create_seconds + (double)create_ns / 1000000000.0;
> +	double create_throughput = (create_time_s > 0) ? (num_files / create_time_s) : 0;
> +
> +	long del_seconds = del_end.tv_sec - del_start.tv_sec;
> +	long del_ns = del_end.tv_nsec - del_start.tv_nsec;
> +	double del_time_s = (double)del_seconds + (double)del_ns / 1000000000.0;
> +	double del_throughput = (del_time_s > 0) ? (num_files / del_time_s) : 0;
> +
> +	printf("Operation,total_files,file_size_kb,total_time_s,throughput_files_per_sec\n");
> +
> +	printf("CREATE,%d,%d,%.4f,%.2f\n",
> +		   num_files,
> +		   size_kb,
> +		   create_time_s,
> +		   create_throughput);
> +
> +	printf("DELETE,%d,%d,%.4f,%.2f\n",
> +		   num_files,
> +		   size_kb,
> +		   del_time_s,
> +		   del_throughput);
> +
> +	if (write_buffer)
> +		free(write_buffer);
> +
> +	exit(0);
> +}
> +
>   #define CMD_HIDDEN 	0x0001
>   #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>   #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> @@ -2140,6 +2251,7 @@ const struct cmd_desc cmd_list[] = {
>   	CMD(get_advise),
>   	CMD(ioprio),
>   	CMD(ftruncate),
> +	CMD(create_speed),
>   	{ NULL, NULL, NULL, NULL, 0 }
>   };
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
