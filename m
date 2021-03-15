Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE533AFFE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 11:31:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLkVf-0004bd-IJ; Mon, 15 Mar 2021 10:31:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lLkVc-0004bU-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 10:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+4pCBq7sIlLhtkXiUHhkvDUQlhjXdSrJuHUbG2XRpw=; b=nGer1tVuzTLZcfHOrkcF6ZT6Q+
 kLCN8+5qmsNBQfyXqhuvCGDiCnjaJ1cQN1Zx7/TDYjplUyBJHBQSW/6UrG7NciXEWBHatJOGUv+2j
 dYwNC29M6o3LBG82uULeXI6J1yoCyOo5a1fdKrppY38W9J0+wk/l+8XdWKhOOPU1FXu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9+4pCBq7sIlLhtkXiUHhkvDUQlhjXdSrJuHUbG2XRpw=; b=VOXvbFs+QKDPX/gzXBrOC2mMg6
 nqyVmO8wG62rsF1UJwiSYeO5AG7+O6M54NcaPsiwyTM8wgEw47PpvSiOgvcXjINidvmGrg4mXTH+3
 odfBXohI47P3fKnBG5m6X8ZofLKlmY+tB4xnl+mhNSfLHGCZjkMQRnUlxg4/1GAA5GwA=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lLkVG-0006mu-A9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 10:31:36 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzXh95GkJzmXYg;
 Mon, 15 Mar 2021 18:28:41 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 15 Mar
 2021 18:31:00 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1615784186-2693-1-git-send-email-stummala@codeaurora.org>
 <49be0c70-4fe4-6acd-b508-08621f0623c0@huawei.com>
 <20210315074645.GA8562@codeaurora.org>
 <0c7220d7-416e-32b7-96cb-effd3f84d6e2@huawei.com>
 <20210315094502.GB8562@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f0da1e4c-24b0-211c-670a-686067203d08@huawei.com>
Date: Mon, 15 Mar 2021 18:31:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210315094502.GB8562@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lLkVG-0006mu-A9
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the discard thread sleep timeout
 under high utilization
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2021/3/15 17:45, Sahitya Tummala wrote:
> Hi Chao,
> 
> On Mon, Mar 15, 2021 at 04:10:22PM +0800, Chao Yu wrote:
>> Hi Sahitya,
>>
>> On 2021/3/15 15:46, Sahitya Tummala wrote:
>>> Hi Chao,
>>>
>>> On Mon, Mar 15, 2021 at 02:12:44PM +0800, Chao Yu wrote:
>>>> Sahitya,
>>>>
>>>> On 2021/3/15 12:56, Sahitya Tummala wrote:
>>>>> When f2fs is heavily utilized over 80%, the current discard policy
>>>>> sets the max sleep timeout of discard thread as 50ms
>>>>> (DEF_MIN_DISCARD_ISSUE_TIME). But this is set even when there are
>>>>> no pending discard commands to be issued. This results into
>>>>> unnecessary frequent and periodic wake ups of the discard thread.
>>>>> This patch adds check for pending  discard commands in addition
>>>>> to heavy utilization condition to prevent those wake ups.
>>>>
>>>> Could this commit fix your issue?
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=43f8c47ea7d59c7b2270835f1d7c4618a1ea27b6
>>>>
>>> I don't think it will help because we are changing the max timeout of the
>>> dpolicy itself in __init_discard_policy() when util > 80% as below -
>>>
>>> dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
>>>
>>> And issue_discard_thread() uses this value as wait_ms, when there
>>> are no more pending discard commands to be issued.
>>> <snip>
>>>                  } else {
>>>                          wait_ms = dpolicy.max_interval;
>>>                  }
>>> <snip>
>>>
>>> The new patch posted above is not changing anything related to the  max_interval.
>>> Hence, I think it won't help the uncessary wakeup problem I am trying to solve
>>> for this condition - util > 80% and when there are no pending discards.
>>>
>>> Please let me know if i am missing something.
>>
>> Copied, thanks for the explanation.
>>
>> But there is another case which can cause this issue in the case of
>> disk util < 80%.
>>
>> wait_ms = DEF_MIN_DISCARD_ISSUE_TIME;
>>
>> do {
>> 	wait_event_interruptible_timeout(, wait_ms);
>>
>> 	...
>>
>> 	if (!atomic_read(&dcc->discard_cmd_cnt))
>> [1] new statement
>> 		continue;
>>
>> } while();
>>
>> Then the loop will wakeup whenever 50ms timeout.
>>
> Yes, only for a short period of time i.e., until the first discard command
> is issued. Once a discard is issued, it will use
> wait_ms = dpolicy.max_interval;
> 
>> So, to avoid this case, shouldn't we reset wait_ms to dpolicy.max_interval
>> at [1]?
>>
> Yes, we can add that to cover the above case.
> 
>> Meanwhile, how about relocating discard_cmd_cnt check after
>> __init_discard_policy(DPOLICY_FORCE)? and olny set .max_interval to
>> DEF_MAX_DISCARD_ISSUE_TIME if there is no discard command, and keep
>> .granularity to 1?
>>
> 
> There is not need to change .granularity, right? It will be controlled

I think so.

> as per utilization as it is done today. Only max_interval and wait_ms
> needs to be updated. Does this look good?
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d7076796..958ad1e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1772,13 +1772,16 @@ static int issue_discard_thread(void *data)
>                          wait_ms = dpolicy.max_interval;
>                          continue;
>                  }
> -               if (!atomic_read(&dcc->discard_cmd_cnt))
> -                       continue;
> -
>                  if (sbi->gc_mode == GC_URGENT_HIGH ||
>                          !f2fs_available_free_memory(sbi, DISCARD_CACHE))
>                          __init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
> 
> +               if (!atomic_read(&dcc->discard_cmd_cnt)) {
> +                       dpolicy.max_interval = DEF_MAX_DISCARD_ISSUE_TIME;
> +                       wait_ms = dpolicy.max_interval;
> +                       continue;
> +               }

Hmm.. how about cleaning up to configure discard policy in
__init_discard_policy()?

Something like:

---
  fs/f2fs/segment.c | 19 ++++++++++++-------
  1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 592927ccffa7..684463a70eb9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1118,7 +1118,9 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
  		dpolicy->ordered = true;
  		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
  			dpolicy->granularity = 1;
-			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
+			if (atomic_read(&SM_I(sbi)->dcc_info->discard_cmd_cnt))
+				dpolicy->max_interval =
+					DEF_MIN_DISCARD_ISSUE_TIME;
  		}
  	} else if (discard_type == DPOLICY_FORCE) {
  		dpolicy->min_interval = DEF_MIN_DISCARD_ISSUE_TIME;
@@ -1734,8 +1736,15 @@ static int issue_discard_thread(void *data)
  	set_freezable();

  	do {
-		__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
-					dcc->discard_granularity);
+		if (sbi->gc_mode == GC_URGENT_HIGH ||
+			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
+		else
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
+						dcc->discard_granularity);
+
+		if (!atomic_read(&dcc->discard_cmd_cnt))
+			wait_ms = dpolicy.max_interval;

  		wait_event_interruptible_timeout(*q,
  				kthread_should_stop() || freezing(current) ||
@@ -1762,10 +1771,6 @@ static int issue_discard_thread(void *data)
  		if (!atomic_read(&dcc->discard_cmd_cnt))
  			continue;

-		if (sbi->gc_mode == GC_URGENT_HIGH ||
-			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
-			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
-
  		sb_start_intwrite(sbi->sb);

  		issued = __issue_discard_cmd(sbi, &dpolicy);
-- 
2.29.2

Thoughts?

Thanks,

> +
>                  sb_start_intwrite(sbi->sb);
> 
>                  issued = __issue_discard_cmd(sbi, &dpolicy);
> 
> thanks,
> Sahitya.
> 
>> Thanks,
>>
>>>
>>> Thanks,
>>> Sahitya.
>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>>> ---
>>>>>   fs/f2fs/segment.c | 5 ++++-
>>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index dced46c..df30220 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -1112,6 +1112,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>>>>>   				struct discard_policy *dpolicy,
>>>>>   				int discard_type, unsigned int granularity)
>>>>>   {
>>>>> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>>>>> +
>>>>>   	/* common policy */
>>>>>   	dpolicy->type = discard_type;
>>>>>   	dpolicy->sync = true;
>>>>> @@ -1129,7 +1131,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>>>>>   		dpolicy->io_aware = true;
>>>>>   		dpolicy->sync = false;
>>>>>   		dpolicy->ordered = true;
>>>>> -		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
>>>>> +		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL &&
>>>>> +				atomic_read(&dcc->discard_cmd_cnt)) {
>>>>>   			dpolicy->granularity = 1;
>>>>>   			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
>>>>>   		}
>>>>>
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
