Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A66B15A1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 10:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8JZrNmLrWNaXHhQ0XL2uZSGoZLzNLxk005mncPRBnU=; b=Jwfq4T5m8AF9QZidY/jo0AbeyK
	mBCQcgjdGKkA1ZeTw0pYUaCV2cmIMoCCQEzSaCFl4QQKsDk5/0s+Ajr+M+hYSIKw7zEcuE3zSkG26
	NmU0v0j+a6+ZWypHRyDiYpAYDz6hjz39nuykdcX8eJ5PElEWQltwzMhIPRQdrPYqzDqM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh1kP-00066o-VN;
	Wed, 30 Jul 2025 08:01:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uh1kO-00066Y-G0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 08:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/BJqXo8i9greVZoJ5ygLXfLEIsjqYyEVytpe3yUP/s=; b=K6cOPJjBGIIveXyc1jZ2sng96N
 iMQ6j6rDRY4OnU7kNv6utRgbXd5CbG1yYndF0u3tnK4f6uN1aNr1wqjUmORGmnHLEpj1VpCHwQt1p
 TL8TXLK/N4yiReCX/jh1GgwlfFL2sBU7U/z3Hk141HN/mLt5v5jYGQ8LC0U0qPh8EV/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/BJqXo8i9greVZoJ5ygLXfLEIsjqYyEVytpe3yUP/s=; b=QNrFj/tuKSBkeQAyfTG84XKEju
 vwyKnkf6NO0uNg8croXYyjlzds4Jn0+EuAdTh9e2yf3rQCPe6b245Hdb/IxKsxVLJI7LcpVvc+z8n
 DbgjSJkRgcwwi4FFjA4lwWLi6eP4tkRUjnHsyBbIjvPJQOE8oJbr24/n0wp4mCSM+XDc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uh1kO-0002BH-Pb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 08:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E6AF44D05;
 Wed, 30 Jul 2025 08:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA99C4CEF5;
 Wed, 30 Jul 2025 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753862462;
 bh=Ki7ihbcUX3y1qlZQd6ZzLNSF2Z+gQobdg0k8jMlnOHo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=J1oil1KJcTG4zOZ1FisWuAjSWcsjQANfJTnk4eW1kJjsZ9PRmfFJrgMjd7+v7rBOD
 6tVI+juuNcJ1wbcUloS1yVCoI/LU1pmimdv5ohbh1olGtENowlhJc9Iqig9wCx/6Rd
 yyTQXJqSbCn7d68b6k8gttJwM1+l58yHwL56bgcZOwaSJXLklS2CU8Lh/C4PV3TuA8
 l3s+/UkNFdlgiSROUzooJuHH73v18LkZKgETzkMDY3sw2nb/aYchytRuNdRbPC9eoo
 0J8Qcf2TmpQ5yR3C/bsTyzBfWE50QtNXVdBgzEa/aUmrHJHgusRdqq0HVC6UYI1NGI
 0PVsx5HNSTBlg==
Message-ID: <9debb3ed-d8e3-4cb7-94d5-1db6d7e97721@kernel.org>
Date: Wed, 30 Jul 2025 16:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250729063326.435167-1-chao@kernel.org>
 <aIjjoBJqYjdNv63m@google.com>
Content-Language: en-US
In-Reply-To: <aIjjoBJqYjdNv63m@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/29/25 23:07, Jaegeuk Kim wrote: > On 07/29,
 Chao Yu wrote:
 >> generic/299 w/ mode=lfs will cause long time latency, let's dump more
 >> information once we hit case. >> >> CP merge: >> - Queued : [...] 
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
X-Headers-End: 1uh1kO-0002BH-Pb
Subject: Re: [f2fs-dev] [PATCH] f2fs: dump more information when checkpoint
 was blocked for long time
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/29/25 23:07, Jaegeuk Kim wrote:
> On 07/29, Chao Yu wrote:
>> generic/299 w/ mode=lfs will cause long time latency, let's dump more
>> information once we hit case.
>>
>> CP merge:
>>   - Queued :    0
>>   - Issued :    1
>>   - Total :    1
>>   - Cur time : 7565(ms)
>>   - Peak time : 7565(ms)
>>
>> F2FS-fs (vdc): checkpoint was blocked for 7565 ms, affecting 1 tasks
>> CPU: 8 UID: 0 PID: 1614 Comm: f2fs_ckpt-253:3 Tainted: G           O        6.16.0-rc3+ #406 PREEMPT(voluntary)
>> Tainted: [O]=OOT_MODULE
>> Call Trace:
>>  dump_stack_lvl+0x6e/0xa0
>>  __checkpoint_and_complete_reqs+0x1a6/0x1d0
>>  issue_checkpoint_thread+0x4b/0x140
>>  kthread+0x10d/0x250
>>  ret_from_fork+0x164/0x190
>>  ret_from_fork_asm+0x1a/0x30
> 
> Can we add more information for debugging this?

Oops, I need to dump information in user's thread instead of f2fs_ckpt.

Thanks,

> 
>>
>> Cc: Jan Prusakowski <jprusakowski@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/checkpoint.c | 9 ++++++++-
>>  fs/f2fs/f2fs.h       | 3 +++
>>  2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index db3831f7f2f5..b0dcaa8dc40d 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1788,8 +1788,15 @@ static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
>>  
>>  	spin_lock(&cprc->stat_lock);
>>  	cprc->cur_time = (unsigned int)div64_u64(sum_diff, count);
>> -	if (cprc->peak_time < cprc->cur_time)
>> +	if (cprc->peak_time < cprc->cur_time) {
>>  		cprc->peak_time = cprc->cur_time;
>> +
>> +		if (unlikely(cprc->peak_time >= CP_LONG_LATENCY_THRESHOLD)) {
>> +			f2fs_warn_ratelimited(sbi, "checkpoint was blocked for %u ms, affecting %llu tasks",
>> +					cprc->peak_time, count);
>> +			dump_stack();
>> +		}
>> +	}
>>  	spin_unlock(&cprc->stat_lock);
>>  }
>>  
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 46d23c2c086c..3130ca6a4770 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -350,6 +350,9 @@ struct ckpt_req_control {
>>  	unsigned int peak_time;		/* peak wait time in msec until now */
>>  };
>>  
>> +/* a time threshold that checkpoint was blocked for, unit: ms */
>> +#define CP_LONG_LATENCY_THRESHOLD	5000
>> +
>>  /* for the bitmap indicate blocks to be discarded */
>>  struct discard_entry {
>>  	struct list_head list;	/* list head */
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
