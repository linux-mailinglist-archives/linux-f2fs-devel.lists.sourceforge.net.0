Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A35192E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 02:40:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nm33a-0003Zn-SW; Wed, 04 May 2022 00:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nm33Z-0003Zd-AG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 00:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z9IqWh5DpQgv2Qs7N2b906ZeMmf/9mM3Kqzxbti2ikQ=; b=BrHIWMdYZ1kf0NEFu9xHtJsvOQ
 CMdmzhhgtyvfI2RtcbTQm67B1JkduNcl4+kAibSORpwyHBLUnNbwYFv2TMYK0cUeol2uFngheucbf
 ER/ETOmmajO4VDECZxFe3jnL+gsQqjpNAi1MEep4YF2H4rKLdQQdi8F9+i1MasCa3I+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z9IqWh5DpQgv2Qs7N2b906ZeMmf/9mM3Kqzxbti2ikQ=; b=MRSFvJIC6p//YP0CkdIvT4CorZ
 wmmPSKxke3lZq2BZTelcQVTBcVkIZMDUyf0+iRlpcV7V7QSGF//R/30jZ8Mzyeqpvk10XjMmJ6IDS
 ImoYDnmx6J4P717aPcoy2Xw0p1fbOlMfI1JVfBvkXUi/tGvCuHLZ/Z/RseMesCHk7avs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nm33S-0006l5-W6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 00:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4D87B80DB7;
 Wed,  4 May 2022 00:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC3EC385A4;
 Wed,  4 May 2022 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651624771;
 bh=xlKxpLDsGDGqIEBxZuWucqMujX6BG0fM6Gh35+FdMGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b9JoHDXlj3YVviGODLUCXCiwap0JGZceDZFB8LsU8AHsYwzyjBJ4Xo6aoKC84aqPk
 xaQ+ZoXuRr+DrZV/j+/BD6Rtnlg3tXACE5zvfF1xmaRGhDnl5zX5K9qpLDj5Qe0LGX
 OpCIEJ5wgQmw71F/3NlylbGuRq1L50tx8R1aCOUk6kzEXsOpD9aMPG4Vs93tOSqo6R
 Spz7Tz9DqEi8k6sErFcR/PKNTPVhmtMO0qPtdyny7r3aO5iYlIQGSXrA/skflGN9xC
 j0JxoZ2S5J325sCuBXMXzHbFPyNMUdeYR1KLaW8mR/LkHrDACOgRAqmaFzF2YDkrpI
 wj6ha0aV+rwLg==
Message-ID: <6c0e4596-1698-25d5-7b59-c0ee6ef7eefd@kernel.org>
Date: Wed, 4 May 2022 08:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220429204631.7241-1-chao@kernel.org>
 <YnGrvEjxgaXDnxxi@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnGrvEjxgaXDnxxi@google.com>
X-Spam-Score: -8.7 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/4 6:25, Jaegeuk Kim wrote: > On 04/30,
 Chao Yu wrote: >> As Yanming reported in bugzilla: >> >>
 https://bugzilla.kernel.org/show_bug.cgi?id=215914
 >> >> The root cause is: in a very small si [...] 
 Content analysis details:   (-8.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nm33S-0006l5-W6
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadloop in foreground GC
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/4 6:25, Jaegeuk Kim wrote:
> On 04/30, Chao Yu wrote:
>> As Yanming reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215914
>>
>> The root cause is: in a very small sized image, it's very easy to
>> exceed threshold of foreground GC, if we calculate free space and
>> dirty data based on section granularity, in corner case,
>> has_not_enough_free_secs() will always return true, result in
>> deadloop in f2fs_gc().
> 
> Performance regression was reported. Can we check this for very small sized
> image only?

I noticed that, I've fixed the issue in v2, could you please take a look?

Thanks,

> 
>>
>> So this patch refactors has_not_enough_free_secs() as below to fix
>> this issue:
>> 1. calculate needed space based on block granularity, and separate
>> all blocks to two parts, section part, and block part, comparing
>> section part to free section, and comparing block part to free space
>> in openned log.
>> 2. account F2FS_DIRTY_NODES, F2FS_DIRTY_IMETA and F2FS_DIRTY_DENTS
>> as node block consumer;
>> 3. account F2FS_DIRTY_DENTS as data block consumer;
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>>   fs/f2fs/segment.h | 30 +++++++++++++++++-------------
>>   1 file changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index 8a591455d796..28f7aa9b40bf 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -575,11 +575,10 @@ static inline int reserved_sections(struct f2fs_sb_info *sbi)
>>   	return GET_SEC_FROM_SEG(sbi, reserved_segments(sbi));
>>   }
>>   
>> -static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
>> +static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>> +			unsigned int node_blocks, unsigned int dent_blocks)
>>   {
>> -	unsigned int node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
>> -					get_pages(sbi, F2FS_DIRTY_DENTS);
>> -	unsigned int dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
>> +
>>   	unsigned int segno, left_blocks;
>>   	int i;
>>   
>> @@ -605,19 +604,24 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
>>   static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>>   					int freed, int needed)
>>   {
>> -	int node_secs = get_blocktype_secs(sbi, F2FS_DIRTY_NODES);
>> -	int dent_secs = get_blocktype_secs(sbi, F2FS_DIRTY_DENTS);
>> -	int imeta_secs = get_blocktype_secs(sbi, F2FS_DIRTY_IMETA);
>> +	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
>> +					get_pages(sbi, F2FS_DIRTY_DENTS) +
>> +					get_pages(sbi, F2FS_DIRTY_IMETA);
>> +	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
>> +	unsigned int node_secs = total_node_blocks / BLKS_PER_SEC(sbi);
>> +	unsigned int dent_secs = total_dent_blocks / BLKS_PER_SEC(sbi);
>> +	unsigned int node_blocks = total_node_blocks % BLKS_PER_SEC(sbi);
>> +	unsigned int dent_blocks = total_dent_blocks % BLKS_PER_SEC(sbi);
>>   
>>   	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>   		return false;
>>   
>> -	if (free_sections(sbi) + freed == reserved_sections(sbi) + needed &&
>> -			has_curseg_enough_space(sbi))
>> -		return false;
>> -	return (free_sections(sbi) + freed) <=
>> -		(node_secs + 2 * dent_secs + imeta_secs +
>> -		reserved_sections(sbi) + needed);
>> +	if (free_sections(sbi) + freed <=
>> +			node_secs + dent_secs + reserved_sections(sbi) + needed)
>> +		return true;
>> +	if (!has_curseg_enough_space(sbi, node_blocks, dent_blocks))
>> +		return true;
>> +	return false;
>>   }
>>   
>>   static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
