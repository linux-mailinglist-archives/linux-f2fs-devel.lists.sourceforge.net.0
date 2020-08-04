Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32523B321
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 05:00:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2nBc-0002jS-3N; Tue, 04 Aug 2020 03:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2nBZ-0002jJ-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 03:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMKyh14Lc6+nPXxL7wlBbtrcQpSoLF88ek7gMgIpNxE=; b=NM1fa34SHvbzvTW7sVyYsvTA0o
 DMkWWN2k7DXV3oF5zV445pZ2WnBje4ZFkd12/HNDshyBjyF3U/gM7n08gTI/YxfoYZdzDwkGg0y/l
 DVDoXCua0TDeSuXZkCcSj4nwTAfWX0QrwpSnYkpa3eR7SIXouExmINn3fxg7wkord77g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eMKyh14Lc6+nPXxL7wlBbtrcQpSoLF88ek7gMgIpNxE=; b=ULWBGxIFrddHBiqkvzzQaaDDMG
 J5adR+/mzaM1T3OyNJw8Uld0k6pLLGOwyjK9GbLjq0ZYWJZoIaLAmRfJkqPHmS4mk0/1Bup1xu3uz
 rUuPK8mi5rpOuONEAYuRd16IMTuBvROLDVc043POfrfDtbexmMH+3an3qb6EyPtAY1IY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2nBY-0029Xf-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 03:00:17 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2119C2BC0355340BEDBF;
 Tue,  4 Aug 2020 11:00:06 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 4 Aug 2020
 11:00:01 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200803172825.4077289-1-jaegeuk@kernel.org>
 <9638d2c5-cfd0-359f-187a-8e23bc6d822d@huawei.com>
 <20200804010412.GA866340@google.com>
 <98ac9355-bb6c-5109-da73-4ab7cdbbf8d5@huawei.com>
 <20200804024317.GA884736@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6d84bfea-13a3-af84-16ad-5d0c7eedeb67@huawei.com>
Date: Tue, 4 Aug 2020 11:00:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200804024317.GA884736@google.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2nBY-0029Xf-Dq
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove a waiter for checkpoint
 completion
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
Cc: Eric Biggers <ebiggers@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/4 10:43, Jaegeuk Kim wrote:
> On 08/04, Chao Yu wrote:
>> On 2020/8/4 9:04, Jaegeuk Kim wrote:
>>> On 08/04, Chao Yu wrote:
>>>> On 2020/8/4 1:28, Jaegeuk Kim wrote:
>>>>> It doesn't need to wait for checkpoint being completed triggered by end_io.
>>>>>
>>>>> [   20.157753] ------------[ cut here ]------------
>>>>> [   20.158393] do not call blocking ops when !TASK_RUNNING; state=2 set at [<0000000096354225>] prepare_to_wait+0xcd/0x430
>>>>> [   20.159858] WARNING: CPU: 1 PID: 1152 at kernel/sched/core.c:7142 __might_sleep+0x149/0x1a0
>>>>> ...
>>>>> [   20.176110]  __submit_merged_write_cond+0x191/0x310
>>>>> [   20.176739]  f2fs_submit_merged_write+0x18/0x20
>>>>> [   20.177323]  f2fs_wait_on_all_pages+0x269/0x2d0
>>>>> [   20.177899]  ? block_operations+0x980/0x980
>>>>> [   20.178441]  ? __kasan_check_read+0x11/0x20
>>>>> [   20.178975]  ? finish_wait+0x260/0x260
>>>>> [   20.179488]  ? percpu_counter_set+0x147/0x230
>>>>> [   20.180049]  do_checkpoint+0x1757/0x2a50
>>>>> [   20.180558]  f2fs_write_checkpoint+0x840/0xaf0
>>>>> [   20.181126]  f2fs_sync_fs+0x287/0x4a0
>>>>>
>>>>> Reported-by: Eric Biggers <ebiggers@kernel.org>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>     fs/f2fs/checkpoint.c | 6 +-----
>>>>>     fs/f2fs/data.c       | 4 ----
>>>>>     fs/f2fs/f2fs.h       | 1 -
>>>>>     fs/f2fs/super.c      | 1 -
>>>>>     4 files changed, 1 insertion(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>>> index 99c8061da55b9..2bdddc725e677 100644
>>>>> --- a/fs/f2fs/checkpoint.c
>>>>> +++ b/fs/f2fs/checkpoint.c
>>>>> @@ -1255,11 +1255,7 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
>>>>>     void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>>>>>     {
>>>>> -	DEFINE_WAIT(wait);
>>>>> -
>>>>>     	for (;;) {
>>>>> -		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
>>>>
>>>> Wouldn't that case high cpu usage before io end?
>>>
>>> This is a critical path to wait for IO completion in checkpoint, which would be
>>> better to wait for it to avoid long latency to continue filesystem operations.
>>
>> Yup, in previous implementation, last end_io wakes up checkpoint() waiter, we
>> didn't waste any time there.
>>
>>> Moreover, I expect io_schedule_timeout() can mitigate such the CPU overhead and
>>> actually we don't need to make there-in context switches as well.
>>
>> Then io_schedule_timeout() in this loop may give CPU time slice to other thread
>> until scheduler reselect checkpoint(), that would cause longer latency?
> 
> Hmm, how about this then?
> 
>>From 4956afa1cedc019cabf6e8bff7bc48d3bcf7a3f5 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Mon, 3 Aug 2020 19:37:12 -0700
> Subject: [PATCH] f2fs: prepare a waiter before entering io_schedule
> 
> This is to avoid sleep() in the waiter thread.
> 
> [   20.157753] ------------[ cut here ]------------
> [   20.158393] do not call blocking ops when !TASK_RUNNING; state=2 set at [<0000000096354225>] prepare_to_wait+0xcd/0x430
> [   20.159858] WARNING: CPU: 1 PID: 1152 at kernel/sched/core.c:7142 __might_sleep+0x149/0x1a0
> ...
> [   20.176110]  __submit_merged_write_cond+0x191/0x310
> [   20.176739]  f2fs_submit_merged_write+0x18/0x20
> [   20.177323]  f2fs_wait_on_all_pages+0x269/0x2d0
> [   20.177899]  ? block_operations+0x980/0x980
> [   20.178441]  ? __kasan_check_read+0x11/0x20
> [   20.178975]  ? finish_wait+0x260/0x260
> [   20.179488]  ? percpu_counter_set+0x147/0x230
> [   20.180049]  do_checkpoint+0x1757/0x2a50
> [   20.180558]  f2fs_write_checkpoint+0x840/0xaf0
> [   20.181126]  f2fs_sync_fs+0x287/0x4a0
> 
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Better,

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> ---
>   fs/f2fs/checkpoint.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 99c8061da55b9..ff807e14c8911 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1258,8 +1258,6 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>   	DEFINE_WAIT(wait);
>   
>   	for (;;) {
> -		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
> -
>   		if (!get_pages(sbi, type))
>   			break;
>   
> @@ -1271,6 +1269,8 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>   							FS_CP_META_IO);
>   		else if (type == F2FS_WB_CP_DATA)
>   			f2fs_submit_merged_write(sbi, DATA);
> +
> +		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
>   		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>   	}
>   	finish_wait(&sbi->cp_wait, &wait);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
