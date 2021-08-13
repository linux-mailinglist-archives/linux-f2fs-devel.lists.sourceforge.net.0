Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B913EBC1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 20:33:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEbzZ-0008UM-Pu; Fri, 13 Aug 2021 18:33:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mEbzY-0008UG-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 18:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gTIX/LUC6PhaaslGLwug0ll78uD0OM52/7gAvklKpc=; b=AvZaw1rfyGTDLphCgPuw88fhGi
 4An+bFgZB+FUymzSvwGUP5W7Rbs5GMHZ4vbmRXKq1nedmpVbIYxCJPZaw+GVg9LDGSJpcJt5grwmh
 Hk8XNKPNwm7wSmDsPoFf2GyJw2pVrf4uDDjyaxrCiQ25XF30814TXKjKaocnVZYV1QCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gTIX/LUC6PhaaslGLwug0ll78uD0OM52/7gAvklKpc=; b=N6h0TWXMfqz5UOHTokts/aLXF6
 ufV2kLOv2jmReoZZ5itqKGPcUDkWzlITFAHqDzPBWnz28b8zKq2TmhC+yk+kNaT1lNwOdlhzNDqb7
 LIaJ/XPYxBmESfh/IyQ6dJ4cKGEG7wmCGvsE+BV4/KwkAYqOS4zfHq6qJSteIxvJrIyI=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEbzT-005P5Q-GS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 18:33:16 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id E330D780127;
 Sat, 14 Aug 2021 02:33:03 +0800 (CST)
Message-ID: <ALgAlACUD67cbvnqcwuTRaqA.3.1628879583910.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <0cc57cc5-33b1-cc00-58a4-fce8de22aa35@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 14 Aug 2021 02:33:03 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Sat, 14 Aug 2021 02:33:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlCTUNWGklNHxlPSUMeS0
 sZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OQkNLTUJKTk1LN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Nxw6Fzo4Lj9NTBgZDRUKGAwOLykaCjpVSFVKTUlDQ0xCTkNPT0NCVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFNTkNINwY+
X-HM-Tid: 0a7b40c9fabcd9aekuwse330d780127
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEbzT-005P5Q-GS
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH_v5_1/2=5D_f2fs=3A_introduce_proc/f?=
 =?utf-8?q?s/f2fs/=3Cdev=3E/fsck=5Fstack_node?=
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>
Date: 2021-08-13 22:44:49
To:  Yangtao Li <frank.li@vivo.com>,jaegeuk@kernel.org
Cc:  linux-f2fs-devel@lists.sourceforge.net,linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] f2fs: introduce proc/fs/f2fs/<dev>/fsck_stack node>On 2021/8/13 20:32, Yangtao Li wrote:
>> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
>> this flag is set in too many places. For some scenes that are not very
>> reproducible, adding stack information will help locate the problem.
>> 
>> Let's expose all fsck stack history in procfs.
>> 
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>> v5:
>> -fix implicit declaration of function 'stack_trace_save'
>>   fs/f2fs/f2fs.h  | 34 +++++++++++++++++++++++++++++++++-
>>   fs/f2fs/sysfs.c | 26 ++++++++++++++++++++++++++
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 67faa43cc141..cbd06dea3c6a 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -24,6 +24,8 @@
>>   #include <linux/quotaops.h>
>>   #include <linux/part_stat.h>
>>   #include <crypto/hash.h>
>> +#include <linux/stackdepot.h>
>> +#include <linux/stacktrace.h>
>>   
>>   #include <linux/fscrypt.h>
>>   #include <linux/fsverity.h>
>> @@ -119,6 +121,8 @@ typedef u32 nid_t;
>>   
>>   #define COMPRESS_EXT_NUM		16
>>   
>> +#define FSCK_STACK_DEPTH 64
>> +
>>   struct f2fs_mount_info {
>>   	unsigned int opt;
>>   	int write_io_size_bits;		/* Write IO size bits */
>> @@ -1786,6 +1790,8 @@ struct f2fs_sb_info {
>>   	unsigned int compress_watermark;	/* cache page watermark */
>>   	atomic_t compress_page_hit;		/* cache hit count */
>>   #endif
>> +	depot_stack_handle_t *fsck_stack;
>> +	unsigned int fsck_count;
>>   };
>>   
>>   struct f2fs_private_dio {
>> @@ -1997,9 +2003,35 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>>   	return test_bit(type, &sbi->s_flag);
>>   }
>>   
>> -static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>> +static void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>>   {
>>   	set_bit(type, &sbi->s_flag);
>> +
>> +	if (unlikely(type ==  SBI_NEED_FSCK)) {
>
>Hmm... I don't know what to say...

Sorry, maybe there is a problem with my vim configuration.
The strange thing is that checkpatch.pl didn't check it out.

>
>> +		unsigned long entries[FSCK_STACK_DEPTH];
>> +		depot_stack_handle_t stack, *new;
>> +		unsigned int nr_entries;
>> +		int i;
>> +
>> +		nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
>> +		nr_entries = filter_irq_stacks(entries, nr_entries);
>> +		stack = stack_depot_save(entries, nr_entries, GFP_KERNEL);
>> +		if (!stack)
>> +			return;
>> +
>> +		/* Try to find an existing entry for this backtrace */
>> +		for (i = 0; i < sbi->fsck_count; i++)
>> +			if (sbi->fsck_stack[i] == stack)
>
>stack need to be released here?

We can't remove stack from depot, as we store them contiguously one after
another in a contiguous memory allocation.

Or we can limit the recorded stack number.

$ grep -nr "SBI_NEED_FSCK" fs/f2fs/ --include=*.c --include=*.h | wc -l
53
$ grep -nr "f2fs_bug_on" fs/f2fs/ --include=*.c --include=*.h | wc -l
135

Since we only have two hundred possible settings here, considering that
the same stack will not be recorded, and the probability of occurrence will
not be high, so it is acceptable not to release?

If this is the case, the subsequent allocation does not need to be released.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
