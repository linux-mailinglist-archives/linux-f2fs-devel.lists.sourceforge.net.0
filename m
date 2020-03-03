Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F11775A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 13:06:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j96Js-0001mx-N9; Tue, 03 Mar 2020 12:06:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j96Jn-0001mf-HN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 12:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ7bKDBu0o6VdR43cBh6o3Ah2aol9hun2yvf00ezKJc=; b=mr2tjYFuOIjY5ymxdryMyMVcOm
 mUoJdg4L/kfvow0mQ7Y1scdy1iT2+505B8OI/B0Pgl0bpEoHjy2BffHWQdSUi95WBmMt2QJMkScsw
 zQ+OOwWBt7CGfl33OxrL1Xc2ToYmvfozo2KVxrMEKtyndZIQAg2m319bYVWjwiG+E/XA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZ7bKDBu0o6VdR43cBh6o3Ah2aol9hun2yvf00ezKJc=; b=Jaic4brUwzwaFpy9hXzPpE1dlK
 xpbCZ6bdBffEHjm6hNPjJNi2Xi+nGD/uR0fmyxO/CQ3W/hGgjBKwtPOynss8vhFA1TnUA9rS4hBYv
 /Iiu90H4wZRFzseF0es15zJIugt+JuTuMN/V6tamwAeQYpRpzT/eNYtTPCo1GmZwfZWc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j96Jj-00FUhP-FL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 12:06:35 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F0E6F5C8ACCE3BF70899;
 Tue,  3 Mar 2020 20:06:23 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020
 20:06:22 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1582799978-22277-1-git-send-email-stummala@codeaurora.org>
 <c39e0cf1-dbb1-5f60-50b5-e0eb246782bc@huawei.com>
 <20200302043948.GE20234@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4d228adb-7038-1c03-e877-93221b920104@huawei.com>
Date: Tue, 3 Mar 2020 20:06:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200302043948.GE20234@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j96Jj-00FUhP-FL
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Fix mount failure due to SPO after
 a successful online resize FS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2020/3/2 12:39, Sahitya Tummala wrote:
> Hi Chao,
> 
> On Fri, Feb 28, 2020 at 04:35:37PM +0800, Chao Yu wrote:
>> Hi Sahitya,
>>
>> Good catch.
>>
>> On 2020/2/27 18:39, Sahitya Tummala wrote:
>>> Even though online resize is successfully done, a SPO immediately
>>> after resize, still causes below error in the next mount.
>>>
>>> [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
>>> [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
>>>
>>> This is because after FS metadata is updated in update_fs_metadata()
>>> if the SBI_IS_DIRTY is not dirty, then CP will not be done to reflect
>>> the new user_block_count.
>>>
>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>> ---
>>>  fs/f2fs/gc.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index a92fa49..a14a75f 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1577,6 +1577,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>>>  
>>>  	update_fs_metadata(sbi, -secs);
>>>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>>
>> Need a barrier here to keep order in between above code and set_sbi_flag(DIRTY)?
> 
> I don't think a barrier will help here. Let us say there is a another context
> doing CP already, then it races with update_fs_metadata(), so it may or may not
> see the resize updates and it will also clear the SBI_IS_DIRTY flag set by resize
> (even with a barrier).

I agreed, actually, we didn't consider race condition in between CP and
update_fs_metadata(), it should be fixed.

> 
> I think we need to synchronize this with CP context, so that these resize changes
> will be reflected properly. Please see the new diff below and help with the review.
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a14a75f..5554af8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1467,6 +1467,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>         long long user_block_count =
>                                 le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
> 
> +       clear_sbi_flag(sbi, SBI_IS_DIRTY);

Why clear dirty flag here?

And why not use cp_mutex to protect update_fs_metadata() in error path of
f2fs_sync_fs() below?

>         SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>         MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
>         FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
> @@ -1575,9 +1576,12 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>                 goto out;
>         }
> 
> +       mutex_lock(&sbi->cp_mutex);
>         update_fs_metadata(sbi, -secs);
>         clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>         set_sbi_flag(sbi, SBI_IS_DIRTY);
> +       mutex_unlock(&sbi->cp_mutex);
> +
>         err = f2fs_sync_fs(sbi->sb, 1);
>         if (err) {
>                 update_fs_metadata(sbi, secs);

		  ^^^^^^^^^^^^^^

In addition, I found that we missed to use sb_lock to protect f2fs_super_block
fields update, will submit a patch for that.

Thanks,

> 
> thanks,
> 
>>
>>> +	set_sbi_flag(sbi, SBI_IS_DIRTY);
>>>  	err = f2fs_sync_fs(sbi->sb, 1);
>>>  	if (err) {
>>>  		update_fs_metadata(sbi, secs);
>>
>> Do we need to add clear_sbi_flag(, SBI_IS_DIRTY) into update_fs_metadata(), so above
>> path can be covered as well?
>>
>> Thanks,
>>
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
