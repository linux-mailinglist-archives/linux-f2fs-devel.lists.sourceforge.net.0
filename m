Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 674082BDC3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2019 05:32:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVSqM-00018o-M3; Tue, 28 May 2019 03:32:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1hVSqL-00018T-2N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 03:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uxtugqUAa9NehSISgWVUCra2043C+kzz7GDUhldPulk=; b=T+iffK1VKyFegRpNETt0bkCLlH
 vIoxez30n0UOCRzW8+Lv2kPIPrmeXBuIvaVCr6OeJ8Yskn/sFInKAxkI9Djqxm9VDgDGKaVOWTJLG
 uNmzbH2zUy2HtWPLilEoXQIVjPxTXxMpqrOelNQPo7Dcbw/itwKfii6EZOreGZ4Ueta0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uxtugqUAa9NehSISgWVUCra2043C+kzz7GDUhldPulk=; b=Al7GyV092iQ/+/2OT39AqaCrw/
 d9YvoF9jZWFmBZxw7WjJzASRmvsWO7IYF3DoIp+Yelv8B111sfZTX0IUOjzHqvP/IUINx9QFUB+eZ
 Aq7B01jKGPAQvq284whGjcp+CxloIt6ksr89bxW7uwjtyJYVPpq3RhlvbwsEiuBWVmU4=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVSpy-00H8RL-Ci
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 03:32:04 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EB2311CEAC61CABD6EED;
 Tue, 28 May 2019 11:31:34 +0800 (CST)
Received: from [10.151.23.176] (10.151.23.176) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 28 May
 2019 11:31:25 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1558962655-25994-1-git-send-email-stummala@codeaurora.org>
 <94025a6d-f485-3811-5521-ed5c9b4d1d77@huawei.com>
 <20190528030509.GE10043@codeaurora.org>
 <2575bd54-d67c-6b26-ebf7-d6adb2e193a7@huawei.com>
From: Gao Xiang <gaoxiang25@huawei.com>
Message-ID: <b5665201-d13d-5fcb-100d-21630960e5f1@huawei.com>
Date: Tue, 28 May 2019 11:30:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <2575bd54-d67c-6b26-ebf7-d6adb2e193a7@huawei.com>
X-Originating-IP: [10.151.23.176]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hVSpy-00H8RL-Ci
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: ratelimit recovery messages
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

On 2019/5/28 11:17, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019/5/28 11:05, Sahitya Tummala wrote:
>> Hi Chao,
>>
>> On Tue, May 28, 2019 at 09:23:15AM +0800, Chao Yu wrote:
>>> Hi Sahitya,
>>>
>>> On 2019/5/27 21:10, Sahitya Tummala wrote:
>>>> Ratelimit the recovery logs, which are expected in case
>>>> of sudden power down and which could result into too
>>>> many prints.
>>>
>>> FYI
>>>
>>> https://lore.kernel.org/patchwork/patch/973837/
>>>
>>> IMO, we need those logs to provide evidence during trouble-shooting of file data
>>> corruption or file missing problem...
>>>
>> In one of the logs, I have noticed there were ~400 recovery prints in the
> 
> I think its order of magnitudes is not such bad, if there is redundant logs such
> as the one in do_recover_data(), we can improve it.
> 
>> kernel bootup. I noticed your patch above and with that now we can always get
>> the error returned by f2fs_recover_fsync_data(), which should be good enough
>> for knowing the status of recovered files I thought. Do you think we need
>> individually each file status as well?
> 
> Yes, I think so, we need them for the detailed info. :)

I personally agree with Chao's suggestion as well.

Sometimes huawei got stuck into rare potential f2fs stability issues,
which is hard to say whether it is a clearly hardware or software issues.

These messages is used as some evidences for us to guess what happened.
it'd better to handle carefully...

Thanks,
Gao Xiang

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>> So I suggest we can keep log as it is in recover_dentry/recover_inode, and for
>>> the log in do_recover_data, we can record recovery info [isize_kept,
>>> recovered_count, err ...] into struct fsync_inode_entry, and print them in
>>> batch, how do you think?
>>>
>>> Thanks,
>>>
>>>>
>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>> ---
>>>> v2:
>>>>  - fix minor formatting and add new line for printk
>>>>
>>>>  fs/f2fs/recovery.c | 18 +++++++++---------
>>>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>>>> index e04f82b..60d7652 100644
>>>> --- a/fs/f2fs/recovery.c
>>>> +++ b/fs/f2fs/recovery.c
>>>> @@ -188,8 +188,8 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
>>>>  		name = "<encrypted>";
>>>>  	else
>>>>  		name = raw_inode->i_name;
>>>> -	f2fs_msg(inode->i_sb, KERN_NOTICE,
>>>> -			"%s: ino = %x, name = %s, dir = %lx, err = %d",
>>>> +	printk_ratelimited(KERN_NOTICE
>>>> +			"%s: ino = %x, name = %s, dir = %lx, err = %d\n",
>>>>  			__func__, ino_of_node(ipage), name,
>>>>  			IS_ERR(dir) ? 0 : dir->i_ino, err);
>>>>  	return err;
>>>> @@ -292,8 +292,8 @@ static int recover_inode(struct inode *inode, struct page *page)
>>>>  	else
>>>>  		name = F2FS_INODE(page)->i_name;
>>>>  
>>>> -	f2fs_msg(inode->i_sb, KERN_NOTICE,
>>>> -		"recover_inode: ino = %x, name = %s, inline = %x",
>>>> +	printk_ratelimited(KERN_NOTICE
>>>> +			"recover_inode: ino = %x, name = %s, inline = %x\n",
>>>>  			ino_of_node(page), name, raw->i_inline);
>>>>  	return 0;
>>>>  }
>>>> @@ -642,11 +642,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>>>>  err:
>>>>  	f2fs_put_dnode(&dn);
>>>>  out:
>>>> -	f2fs_msg(sbi->sb, KERN_NOTICE,
>>>> -		"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
>>>> -		inode->i_ino,
>>>> -		file_keep_isize(inode) ? "keep" : "recover",
>>>> -		recovered, err);
>>>> +	printk_ratelimited(KERN_NOTICE
>>>> +			"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d\n",
>>>> +			inode->i_ino,
>>>> +			file_keep_isize(inode) ? "keep" : "recover",
>>>> +			recovered, err);
>>>>  	return err;
>>>>  }
>>>>  
>>>>
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
