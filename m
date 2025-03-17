Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC3A63D33
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 04:31:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu1Bv-00058f-PN;
	Mon, 17 Mar 2025 03:31:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tu1Bv-00058Z-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKx+/NpYLWbYEEwp9LBPtEO0IEPzboem2y/DWez/abA=; b=QgtYBsXbHpFWFneEw+OMNdkV9p
 FQ2YTCd4eEYESTmrMSBX2f4SlYhT0IAyUbrICvEysCbcECfQPLMaF/akOsxEHFREPf2t8j/P+6g5r
 mZ4gsr2ErsNxJjfFts2VUxWmJ/7oPYskvNDevI69hrIk6kMH1QtZM/3y8j/1D1qlkcvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oKx+/NpYLWbYEEwp9LBPtEO0IEPzboem2y/DWez/abA=; b=FWcSo9nfXWp4cWtixqCknBG8VX
 eVVsdYYHu9qAtFH5KcyIXseH3ewvMcHsM7IbZh+H7MlIJR07xtKH4OeinyA6VgYA+R/nr0YwDvhdK
 S11HtbcxcI6wrkRTpqNgVSm7FxjV71AJRPpkyR/fh+85o9kbnB3VhPoDiuY8z8HCtX9Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu1Bp-0003I0-5V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E09065C4CDF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Mar 2025 03:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA558C4CEEC;
 Mon, 17 Mar 2025 03:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742182246;
 bh=GALKqDaxZX0vzEkLBcUUSw+UiWZuM7zmhImWl9VD0xk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pq5V14ay+Hj9MVySun+YYD+fHUgcdHIOnMsXwYzeQVnN1W8DnucZqxSTq8t6e0zF7
 D4kP0ho33ugJAEObIABIs16hLI3t1/e9jLi3hy9CDI+tNVaU/Kp63liXjI4AU7CEOi
 0II8Yn2oPn6pzlg+YH93Gt7Lu0K5k72CLz6zYVnb/aGnpulU/hoK1N78qjYFhmKJVI
 OBT9D2VZqIdeoNNL++ficIxeaIMPrI4Py6y8Un3FomY5IYgK2rz5YOCSeqijENQjVp
 Xxrw/EISt2NcINRUyU8rMQOUzB6ONJmPbnOp/ZluAmIebaOcf7CrM+/hZts/+OWdiG
 pkL6Kj6kSKGaA==
Message-ID: <6c194677-4f1b-414b-9beb-bf65763b03f8@kernel.org>
Date: Mon, 17 Mar 2025 11:30:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250304011036.1373650-1-jaegeuk@kernel.org>
 <15ca9817-e830-4387-ad9a-623c782e57ff@kernel.org>
 <Z9CQx2fw2rssEzwK@google.com>
 <7ad8054b-1985-4561-b62a-d39bea9945f4@kernel.org>
Content-Language: en-US
In-Reply-To: <7ad8054b-1985-4561-b62a-d39bea9945f4@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/25 11:02, Chao Yu wrote: > On 3/12/25 03:36, Jaegeuk
 Kim wrote: >> On 03/11, Chao Yu wrote: >>> On 3/4/25 09:10, Jaegeuk Kim via
 Linux-f2fs-devel wrote: >>>> From: Jaegeuk Kim <jaegeuk@google. [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tu1Bp-0003I0-5V
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add fragread command to evaluate
 fragmented buffer for reads
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

On 3/12/25 11:02, Chao Yu wrote:
> On 3/12/25 03:36, Jaegeuk Kim wrote:
>> On 03/11, Chao Yu wrote:
>>> On 3/4/25 09:10, Jaegeuk Kim via Linux-f2fs-devel wrote:
>>>> From: Jaegeuk Kim <jaegeuk@google.com>
>>>>
>>>> This adds a fragread command in f2fs_io, which is able to measure the
>>>> read performance on fragmented data buffer.
>>>>
>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
>>>> ---
>>>>  tools/f2fs_io/f2fs_io.c | 110 ++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 110 insertions(+)
>>>>
>>>> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
>>>> index b72c26648f56..8431262575e0 100644
>>>> --- a/tools/f2fs_io/f2fs_io.c
>>>> +++ b/tools/f2fs_io/f2fs_io.c
>>>> @@ -1018,6 +1018,115 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>>>>  	exit(0);
>>>>  }
>>>>  
>>>> +#define fragread_desc "read data with a fragmented buffer from file"
>>>> +#define fragread_help					\
>>>> +"f2fs_io fragread [chunk_size in 4kb] [offset in chunk_size] [count] [advice] [file_path]\n\n"	\
>>>> +"Read data in file_path and print nbytes\n"		\
>>>> +"advice can be\n"					\
>>>> +" 1 : set sequential|willneed\n"			\
>>>> +" 0 : none\n"						\
>>>> +
>>>> +#ifndef PAGE_SIZE
>>>> +#define PAGE_SIZE sysconf(_SC_PAGESIZE)
>>>> +#endif
>>>> +#define ALLOC_SIZE (2 * 1024 * 1024 - 4 * 1024) // 2MB - 4KB
>>>> +
>>>> +static void do_fragread(int argc, char **argv, const struct cmd_desc *cmd)
>>>> +{
>>>> +	u64 buf_size = 0, ret = 0, read_cnt = 0;
>>>> +	u64 offset;
>>>> +	char *buf = NULL;
>>>> +	uintptr_t idx, ptr;
>>>> +	unsigned bs, count, i;
>>>> +	u64 total_time = 0;
>>>> +	int flags = 0, alloc_count = 0;
>>>> +	void *mem_hole, **mem_holes;
>>>> +	int fd, advice;
>>>> +
>>>> +	if (argc != 6) {
>>>> +		fputs("Excess arguments\n\n", stderr);
>>>> +		fputs(cmd->cmd_help, stderr);
>>>> +		exit(1);
>>>> +	}
>>>> +
>>>> +	bs = atoi(argv[1]);
>>>> +	if (bs > 256 * 1024)
>>>> +		die("Too big chunk size - limit: 1GB");
>>>> +	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
>>>> +
>>>> +	offset = atoi(argv[2]) * buf_size;
>>>> +	count = atoi(argv[3]);
>>>> +	advice = atoi(argv[4]);
>>>> +	mem_holes = xmalloc(sizeof(void *) * (buf_size / PAGE_SIZE));
>>>> +
>>>> +	/* 1. Allocate the buffer using mmap. */
>>>> +	buf = mmap(NULL, buf_size, PROT_READ | PROT_WRITE,
>>>> +				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>> +
>>>> +	/* 2. Loop and touch each page. */
>>>> +	for (idx = (uintptr_t)buf; idx < (uintptr_t)buf + buf_size;
>>>> +						idx += PAGE_SIZE)
>>>> +	{
>>>> +		/* Touch the current page. */
>>>> +		volatile char *page = (volatile char *)idx;
>>>> +		*page;
>>>> +
>>>> +		/* 3. Allocate (2M - 4K) memory using mmap and touch all of it. */
>>>> +		mem_hole = mmap(NULL, ALLOC_SIZE, PROT_READ | PROT_WRITE,
>>>> +					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>> +		if (mem_hole == MAP_FAILED)
>>>> +			die_errno("map failed");
>>>> +
>>>> +		/* Store the allocated memory pointer. */
>>>> +		mem_holes[alloc_count++] = mem_hole;
>>>
>>> Do we need to call mlock to hold allocated cache in the memory, if
>>> administrator enables swap, memory fragment will be gone once anonymous
>>> pages are swapped to device?
>>
>> Hmm, the test is going to use this very intensively, so is it possible?
> 
> Not sure, but I doubt it is possible to happen in low-end device? due to it has
> very less memory and system may has already token the most of memory.

Anyway, code looks clean, I think we can take a look at this later.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> Thanks,
> 
>>
>>>
>>> Thanks,
>>>
>>>> +
>>>> +		/* Touch all allocated memory. */
>>>> +		for (ptr = (uintptr_t)mem_hole;
>>>> +			ptr < (uintptr_t)mem_hole + ALLOC_SIZE;
>>>> +						ptr += PAGE_SIZE) {
>>>> +			volatile char *alloc_page = (volatile char *)ptr;
>>>> +			*alloc_page;
>>>> +		}
>>>> +	}
>>>> +	printf("Touched allocated memory: count = %u\n", alloc_count);
>>>> +	printf(" - allocated memory: = ");
>>>> +	for (idx = 0; idx < 5; idx++)
>>>> +		printf(" %p", mem_holes[idx]);
>>>> +	printf("\n");
>>>> +
>>>> +	fd = xopen(argv[5], O_RDONLY | flags, 0);
>>>> +
>>>> +	if (advice) {
>>>> +		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
>>>> +				POSIX_FADV_SEQUENTIAL) != 0)
>>>> +			die_errno("fadvise failed");
>>>> +		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
>>>> +				POSIX_FADV_WILLNEED) != 0)
>>>> +			die_errno("fadvise failed");
>>>> +		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[5]);
>>>> +	}
>>>> +
>>>> +	total_time = get_current_us();
>>>> +
>>>> +	for (i = 0; i < count; i++) {
>>>> +		ret = pread(fd, buf, buf_size, offset + buf_size * i);
>>>> +		if (ret != buf_size) {
>>>> +			printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
>>>> +					buf_size, ret);
>>>> +			if (ret > 0)
>>>> +				read_cnt += ret;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		read_cnt += ret;
>>>> +	}
>>>> +	printf("Fragmented_Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s\n",
>>>> +		read_cnt, get_current_us() - total_time,
>>>> +		((long double)read_cnt / (get_current_us() - total_time)));
>>>> +	printf("\n");
>>>> +	exit(0);
>>>> +}
>>>> +
>>>>  #define randread_desc "random read data from file"
>>>>  #define randread_help					\
>>>>  "f2fs_io randread [chunk_size in 4kb] [count] [IO] [advise] [file_path]\n\n"	\
>>>> @@ -2002,6 +2111,7 @@ const struct cmd_desc cmd_list[] = {
>>>>  	CMD(write_advice),
>>>>  	CMD(read),
>>>>  	CMD(randread),
>>>> +	CMD(fragread),
>>>>  	CMD(fiemap),
>>>>  	CMD(gc_urgent),
>>>>  	CMD(defrag_file),
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
