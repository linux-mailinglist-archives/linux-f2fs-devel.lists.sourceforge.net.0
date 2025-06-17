Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC77ADC1C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 07:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMw9gTW8VYHl1WGvdITx7Uyr3nax6DMo7wUbtm+b5Ro=; b=Xa6nuzp9xKeoULmI0R0P+ZzvCO
	hlMDaFi3Q+Z94U1vrX7h5Ep86e0q74s5kKDqeTPFAqEreR13K1264iXvh/Fq9h0vHtDQMuyHAoiZW
	2k5KsxEhcURIfvbQAHSvb/6FF7hfhqZnK4lVpLd0/tekjFY/vka1Em1oa/sRtoDgcbDk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uROwy-0006rt-GP;
	Tue, 17 Jun 2025 05:33:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uROww-0006rn-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDDT/Sg4HCM6sWEbBVZfrn3M/oBDrKJmRK4Nuf9P9LM=; b=dILAcWkPuqddDuXTrNf93XgjCM
 6Ki0QBYvVmW5eCg74JpndaW515DfawC81BCzHwOWzpk//yh4dLGbt0aPtx7a9eBOcNwyEQnj4ylFW
 km8Ko8oCg2/lsKGb83liD7O0V9zele1aJElnOibW1JdTXX7pVj7VEH+RaTA/LHdT5eLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xDDT/Sg4HCM6sWEbBVZfrn3M/oBDrKJmRK4Nuf9P9LM=; b=jEUL6sqku+5KevnSaK6JtcEvCK
 9bKiFscqXlVDbq3L/bAlzFsNwYNp44gusqHoWMisJA9q925QujABRl6/EcaS3c4yxJqgvpyj5tucn
 H07NFhWJjN39uj/aZjcGLWkEDPzr+8goOyWiyAyG9+GEGU9QyESmaoZgsWK/KuzNDKvA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uROww-0003hh-95 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44C235C5BBE;
 Tue, 17 Jun 2025 05:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0882C4CEE3;
 Tue, 17 Jun 2025 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750138408;
 bh=p10LanUcmMMCTpeAaoLMIgYi3gdmGHzLMPHBRmrU8WQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OILgIDK8JdLqbhiZGcIeL6Rxw1PI2TKuJEfLtdRdxtX5mCLGDiUypzCWwvRFXUzTn
 Au1YMKFgC1hS+QjJOvUGL/hoBVJYsarBeaUFJi/0GhkKMlpymi83zMo1w8K/FkS04c
 A/Moe3uv/yKT8J4anwnKvuJCnhdPCA41tvuri8X9Ol7wcjv2tIldgT29jB9YTnFVvK
 yffg/6MzlSm7xtaAX/FJ3TeA2lF+ZuqaGoXIZTr7GUxMiX3q0XRo9nGXJUUe+ggT9Y
 dlIks71Xu8Cn9k7VZAi51PFN4qDOvB6ytoZPKa0on1LlUN8QXnOqQteUIINLfheJHc
 bBiHQ5hZtqOag==
Message-ID: <85f2a9b2-b023-4704-a593-8f00f7e3490a@kernel.org>
Date: Tue, 17 Jun 2025 13:33:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250613230522.380370-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250613230522.380370-1-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/14/25 07:05,
 Daniel Lee wrote: > A new command 'test_create_perf', 
 has been introduced to measure > the performance of creating and deleting
 many files. > > Signed-off-by: Daniel Lee <chullee@goo [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uROww-0003hh-95
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: add test_create_perf command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/14/25 07:05, Daniel Lee wrote:
> A new command 'test_create_perf', has been introduced to measure
> the performance of creating and deleting many files.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
> v2: Rename command and make fsync optional
> ---
>  tools/f2fs_io/f2fs_io.c | 139 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 6531b55..6831e78 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -2092,6 +2092,144 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
>  	exit(0);
>  }
>  
> +#define test_create_perf_desc "measure file creation speed"
> +#define test_create_perf_help						\
> +"f2fs_io test_create_perf [-s] <dir> <num_files> <size_kb>\n\n"		\
> +"Measures file creation and deletion performance.\n"			\
> +"  <dir>          The target directory where files will be created.\n"	\
> +"  <num_files>    The total number of files to create and delete.\n"	\
> +"  <size_kb>      The size of each file in kb.\n"			\
> +"  [-s]           Call fsync() after each file creation to measure\n"
> +
> +static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	bool do_fsync = false;
> +	int opt;
> +	char *dir;
> +	int num_files;
> +	int size_kb;
> +	char *write_buffer = NULL;
> +
> +	while ((opt = getopt(argc, argv, "s")) != -1) {
> +		switch (opt) {
> +		case 's':
> +			do_fsync = true;
> +			break;
> +		default:
> +			fputs(cmd->cmd_help, stderr);
> +			exit(1);
> +		}
> +	}
> +
> +	argc -= optind;
> +	argv += optind;
> +
> +	if (argc != 3) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	dir = argv[0];
> +	num_files = atoi(argv[1]);
> +	size_kb = atoi(argv[2]);
> +
> +	if (num_files <= 0) {
> +		fprintf(stderr, "Error: Number of files must be positive.\n");
> +		exit(1);
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
> +	printf("Starting test: Creating %d files of %dKB each in %s (fsync: %s)\n",
> +		num_files, size_kb, dir,
> +		do_fsync ? "Enabled" : "Disabled");
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
> +
> +		if (do_fsync)
> +			fsync(fd);
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

How about calling sync() or fsync() optionally like we did for creation perf test?

if (do_fsync)
	fsync(parent_fd); ?

Thanks,

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
>  #define CMD_HIDDEN 	0x0001
>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> @@ -2140,6 +2278,7 @@ const struct cmd_desc cmd_list[] = {
>  	CMD(get_advise),
>  	CMD(ioprio),
>  	CMD(ftruncate),
> +	CMD(test_create_perf),
>  	{ NULL, NULL, NULL, NULL, 0 }
>  };
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
