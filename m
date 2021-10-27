Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E847443BFD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 04:29:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfYh0-0002e8-QW; Wed, 27 Oct 2021 02:29:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfYgz-0002e1-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zELOuwK6i1O/SaSNqSxfj70rrSL/WFi3T6qmEiKKdgk=; b=Qbhm1LAq3CYZC6zws3c1OgbfaK
 qwvZ2ivrFZJHQWA+uj+Twy+CI1Z/jTJrs47+v5Kk1Ol2g5SQlOqnhxhPC11cwmFQN/d9Fq3c32c13
 IVLQRzfOb15s4fRkfllUcXqfL7VQ8L1ugcnc253eGZKAHN0UbJGUaEPwyLAXPt8+6aZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zELOuwK6i1O/SaSNqSxfj70rrSL/WFi3T6qmEiKKdgk=; b=BhyRMjP/a2Dr9Z5lvQH6uaJEAt
 04regOl0b3sU2ussWc3TI2udLnJzGOtF+u/pnamdSeEmnunMI7tTmARy2qW/XsKBbChPLPYv3mT9C
 /TvZHuwgQxN/G0diSRtcNjE7O2p2jFRPs8wkhoD9f+rj/ODdnPssFoxAlNHLtxxBlfmc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfYej-0001fz-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:29:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD785610A0;
 Wed, 27 Oct 2021 02:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635301197;
 bh=6OnS/9NlrXeuVcDWbkkNkhf9wUozNfxWCF5JnO+Sd0g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GJ5SrEFBopmQPRVZEr3mltDxlkZ7M6MKGEIfehRJYjf+JTh91b0vtQSqksfnqRyrp
 XlEoR/hKvcbv4VqIL9Ltzc1U7xAXjQB8pqhRcYZLNTdkQtfDILoTcEk87KvGrDvDKp
 KvtAc1I/0jhuFrynUtoHU0hzWFmgf0dQg5vvfs8Y8/dSqMtaRwGi/oXvescz9pmDDd
 ccNqCNs8JPQMVIVI0uzkpuPLMVS8o+uUzenZ36B3Vy/Ur1NeYD7vVnvF+ObT+b3BlM
 kUsDUs7b8WkcHpvamq2dOpbw6otbbmKX8Sm8F0PXPgxnf8w6QKxEouQiXIotZtC7z4
 LE3rErfe3gGfg==
Message-ID: <4897a06a-9f9e-27ce-91d3-58721bee42ac@kernel.org>
Date: Wed, 27 Oct 2021 10:19:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: jaegeuk@kernel.org, Pavel Machek <pavel@denx.de>
References: <20210922152705.720071-1-chao@kernel.org>
 <20210924095021.GA16651@duo.ucw.cz>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20210924095021.GA16651@duo.ucw.cz>
X-Headers-End: 1mfYej-0001fz-Ax
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix incorrect return value in
 f2fs_sanity_check_ckpt()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Missed to apply this patch?

Thanks,

On 2021/9/24 17:50, Pavel Machek wrote:
> Hi!
> 
>> This code looks quite confused: part of function returns 1 on
>> corruption, part returns -errno. The problem is not stable-specific.
>>
>> [1] https://lkml.org/lkml/2021/9/19/207
>>
>> Let's fix to make 'insane cp_payload case' to return 1 rater than
>> EFSCORRUPTED, so that return value can be kept consistent for all
>> error cases, it can avoid confusion of code logic.
>>
>> Fixes: 65ddf6564843 ("f2fs: fix to do sanity check for sb/cp fields correctly")
>> Reported-by: Pavel Machek <pavel@denx.de>
>> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> Reviewed-by: Pavel Machek <pavel@denx.de>
> 
> (This is good minimal fix, but eventually I believe the function
> should switch to 0/-errno... for consistency with rest of kernel).
> 
> Thank you,
> 								Pavel
> 								
>> +++ b/fs/f2fs/super.c
>> @@ -3487,7 +3487,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>>   		NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
>>   		f2fs_warn(sbi, "Insane cp_payload: %u, nat_bits_blocks: %u)",
>>   			  cp_payload, nat_bits_blocks);
>> -		return -EFSCORRUPTED;
>> +		return 1;
>>   	}
>>   
>>   	if (unlikely(f2fs_cp_error(sbi))) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
