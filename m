Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DAB04F42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 05:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUuk4M1pHfZfCA0Dx3RfgJxWWOVrBQbRXx5b/OmCAig=; b=l+y5d+/e3628ePJ00ZOAsixiUD
	gNhmAjj9K0WDTcPUnjo5obzyoj5M+dxXnEiZxC2TnZXV1ml9cSOSbVUd/zqU3rfr75ghRAe0mCAxC
	ELd83JY5Drkt2crcYF9DRTCrwCn6Sedw+y1sFH6HOPhVwkAg819bnyd1KcqPCAliE2iE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubWZ7-0004D6-Gl;
	Tue, 15 Jul 2025 03:42:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubWZ5-0004Cz-M1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8RPs5wVfrhHBwfwtpmLACHPOJR0YvbZSnSb5WEPOD8Y=; b=Y9jTVu2sivAKplFPBHEB4aCdVu
 +F5VawW2GbOo1oLFeq6IvJa2BRyM3KmQ3JBjaoLYDqUJvnK39XIPU3X8j08yIdMuaxS/1Ox+N9hVT
 o2eNggXNWEn7NqEEQtLNE/jhll/ROdP6cN47txVZ4hyxSldgq1uanGZZcxKGus1N61BE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8RPs5wVfrhHBwfwtpmLACHPOJR0YvbZSnSb5WEPOD8Y=; b=cWzNpjQQ8rSIVFp4QTCwngX9M7
 g7KsfwOc4MheCpHZ74sjtqMLuJv5fv9hIQhozysN6OUiX8UFJ4VUSBxiKebPfKLOdRgdZZbCFWVx8
 Css318YEra7WEjJbfDV59TmznZg9DtRAxz2a54G0RfEzpjHsDHrhmupOmCYy+7E9UV9g=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubWZ5-0002AX-0b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E2A4A56FD2;
 Tue, 15 Jul 2025 02:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1484FC4CEED;
 Tue, 15 Jul 2025 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752546185;
 bh=y0YLJBJHBBcUz80gxRkqV2ylrYzezSPE5GIKrN3lpgE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=E2Met/IsNhQ4HjHepvWQXS9D0PG+fPlIDBo+kVDCUYT2pBV9r2pHEGWYpd+aBkVLD
 leC3EpD4Zpm3x0VATrbGOx87wHYrGkJRoZHqB62UOXK1lQP55lBz3FBRkCbdE0Ytyh
 bUpU6AzpeOGLoW7bM0pQ9kg8aNFISEOG2zsy9gKEx5WCRLbhMBXNUo6RdFERXv7e3U
 2JcNdLoibN/Y+UEk1OxIduk85Tt2srHfhbSW/KnkYpzIZwqv3kmC+kdOK6x/dR0s4w
 zbtDlEJmAQF5EwDBxVPyjVrhS9UONX3mlv61pQUXn+jHNmNw1PIO5mgelY0J78say2
 8L5OfWlbzU7AQ==
Message-ID: <60b1519f-1131-4a4e-bfc8-ac5be75878e1@kernel.org>
Date: Tue, 15 Jul 2025 10:23:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250617140457.2358846-1-chullee@google.com>
 <4f3847e6-0859-4ec7-b626-50db81dd0de1@kernel.org>
 <aHUS1xQWBh7Y_KYI@google.com>
Content-Language: en-US
In-Reply-To: <aHUS1xQWBh7Y_KYI@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/14/25 22:23, Jaegeuk Kim wrote: > On 07/14,
 Chao Yu wrote:
 >> Daniel, >> >> It missed to add doc entry, just found the issue. > > Can
 you post another patch to update the doc? Sure. :) Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubWZ5-0002AX-0b
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: add test_create_perf command
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

On 7/14/25 22:23, Jaegeuk Kim wrote:
> On 07/14, Chao Yu wrote:
>> Daniel,
>>
>> It missed to add doc entry, just found the issue.
> 
> Can you post another patch to update the doc?

Sure. :)

Thanks,

> 
>>
>> Thanks,
>>
>> On 6/17/25 22:04, Daniel Lee wrote:
>>> A new command 'test_create_perf', has been introduced to measure
>>> the performance of creating and deleting many files.
>>>
>>> Signed-off-by: Daniel Lee <chullee@google.com>
>>> ---
>>> v3: make sync optional for deletion phase
>>> v2: Rename command and make fsync optional
>>> ---
>>>  tools/f2fs_io/f2fs_io.c | 146 ++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 146 insertions(+)
>>>
>>> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
>>> index 6531b55..f6649f1 100644
>>> --- a/tools/f2fs_io/f2fs_io.c
>>> +++ b/tools/f2fs_io/f2fs_io.c
>>> @@ -2092,6 +2092,151 @@ static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
>>>  	exit(0);
>>>  }
>>>  
>>> +#define test_create_perf_desc "measure file creation speed"
>>> +#define test_create_perf_help						\
>>> +"f2fs_io test_create_perf [-s] [-S] <dir> <num_files> <size_kb>\n\n"	\
>>> +"Measures file creation and deletion performance.\n"			\
>>> +"  <dir>          The target directory where files will be created.\n"	\
>>> +"  <num_files>    The total number of files to create and delete.\n"	\
>>> +"  <size_kb>      The size of each file in kb.\n"			\
>>> +"  [-s]           Call fsync() after each file creation.\n"		\
>>> +"  [-S]           Call sync() after deleting all files.\n"
>>> +
>>> +static void do_test_create_perf(int argc, char **argv, const struct cmd_desc *cmd)
>>> +{
>>> +	bool do_fsync = false, do_sync = false;
>>> +	int opt;
>>> +	char *dir;
>>> +	int num_files;
>>> +	int size_kb;
>>> +	char *write_buffer = NULL;
>>> +
>>> +	while ((opt = getopt(argc, argv, "sS")) != -1) {
>>> +		switch (opt) {
>>> +		case 's':
>>> +			do_fsync = true;
>>> +			break;
>>> +		case 'S':
>>> +			do_sync = true;
>>> +			break;
>>> +		default:
>>> +			fputs(cmd->cmd_help, stderr);
>>> +			exit(1);
>>> +		}
>>> +	}
>>> +
>>> +	argc -= optind;
>>> +	argv += optind;
>>> +
>>> +	if (argc != 3) {
>>> +		fputs("Excess arguments\n\n", stderr);
>>> +		fputs(cmd->cmd_help, stderr);
>>> +		exit(1);
>>> +	}
>>> +
>>> +	dir = argv[0];
>>> +	num_files = atoi(argv[1]);
>>> +	size_kb = atoi(argv[2]);
>>> +
>>> +	if (num_files <= 0) {
>>> +		fprintf(stderr, "Error: Number of files must be positive.\n");
>>> +		exit(1);
>>> +	}
>>> +
>>> +	if (size_kb > 0) {
>>> +		write_buffer = malloc(size_kb * 1024);
>>> +		if (!write_buffer) {
>>> +			perror("Failed to allocate write buffer");
>>> +			exit(1);
>>> +		}
>>> +		memset(write_buffer, 'a', size_kb * 1024);
>>> +	}
>>> +
>>> +	// Creation Phase
>>> +	printf("Starting test: Creating %d files of %dKB each in %s (fsync: %s)\n",
>>> +		num_files, size_kb, dir,
>>> +		do_fsync ? "Enabled" : "Disabled");
>>> +
>>> +	struct timespec create_start, create_end;
>>> +
>>> +	clock_gettime(CLOCK_MONOTONIC, &create_start);
>>> +
>>> +	for (int i = 0; i < num_files; i++) {
>>> +		char path[1024];
>>> +
>>> +		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
>>> +
>>> +		int fd = open(path, O_WRONLY | O_CREAT, 0644);
>>> +
>>> +		if (fd < 0) {
>>> +			perror("Error opening file");
>>> +			continue;
>>> +		}
>>> +		if (size_kb > 0) {
>>> +			if (write(fd, write_buffer, size_kb * 1024) < 0)
>>> +				perror("Error writing to file");
>>> +		}
>>> +
>>> +		if (do_fsync)
>>> +			fsync(fd);
>>> +
>>> +		close(fd);
>>> +	}
>>> +
>>> +	clock_gettime(CLOCK_MONOTONIC, &create_end);
>>> +
>>> +
>>> +	// Deletion Phase
>>> +	printf("Deleting %d created files (sync: %s)\n", num_files,
>>> +		do_sync ? "Enabled" : "Disabled");
>>> +
>>> +	struct timespec del_start, del_end;
>>> +
>>> +	clock_gettime(CLOCK_MONOTONIC, &del_start);
>>> +
>>> +	for (int i = 0; i < num_files; i++) {
>>> +		char path[1024];
>>> +
>>> +		snprintf(path, sizeof(path), "%s/test_file_%d", dir, i);
>>> +		if (unlink(path) != 0)
>>> +			perror("Error unlinking file");
>>> +	}
>>> +
>>> +	if (do_sync)
>>> +		sync();
>>> +
>>> +	clock_gettime(CLOCK_MONOTONIC, &del_end);
>>> +
>>> +	long create_seconds = create_end.tv_sec - create_start.tv_sec;
>>> +	long create_ns = create_end.tv_nsec - create_start.tv_nsec;
>>> +	double create_time_s = (double)create_seconds + (double)create_ns / 1000000000.0;
>>> +	double create_throughput = (create_time_s > 0) ? (num_files / create_time_s) : 0;
>>> +
>>> +	long del_seconds = del_end.tv_sec - del_start.tv_sec;
>>> +	long del_ns = del_end.tv_nsec - del_start.tv_nsec;
>>> +	double del_time_s = (double)del_seconds + (double)del_ns / 1000000000.0;
>>> +	double del_throughput = (del_time_s > 0) ? (num_files / del_time_s) : 0;
>>> +
>>> +	printf("Operation,total_files,file_size_kb,total_time_s,throughput_files_per_sec\n");
>>> +
>>> +	printf("CREATE,%d,%d,%.4f,%.2f\n",
>>> +		   num_files,
>>> +		   size_kb,
>>> +		   create_time_s,
>>> +		   create_throughput);
>>> +
>>> +	printf("DELETE,%d,%d,%.4f,%.2f\n",
>>> +		   num_files,
>>> +		   size_kb,
>>> +		   del_time_s,
>>> +		   del_throughput);
>>> +
>>> +	if (write_buffer)
>>> +		free(write_buffer);
>>> +
>>> +	exit(0);
>>> +}
>>> +
>>>  #define CMD_HIDDEN 	0x0001
>>>  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
>>>  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
>>> @@ -2140,6 +2285,7 @@ const struct cmd_desc cmd_list[] = {
>>>  	CMD(get_advise),
>>>  	CMD(ioprio),
>>>  	CMD(ftruncate),
>>> +	CMD(test_create_perf),
>>>  	{ NULL, NULL, NULL, NULL, 0 }
>>>  };
>>>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
