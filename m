Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A991C6957
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 08:48:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWDrF-0000XG-8a; Wed, 06 May 2020 06:48:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWDrD-0000X8-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mp/PZVMEnxBOUpyIKBvRxH+z2POKMuQjf2ZzfrgI9vI=; b=MUZiPlMGyLQonLghzsglMyxex8
 Df+/LdoXusF/+BxEY8pJHFi+CqUb7D8A5y7w59orGI3CrFlWL+D7IoaowEUfuf9AgZm2bJ7lPj0+R
 gkhE4kUtC0Id7225yUlL6Lv6XgluCig6sUM/ZFiuT+4ZJO6Og6KNMPJYNOMatfihO94s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mp/PZVMEnxBOUpyIKBvRxH+z2POKMuQjf2ZzfrgI9vI=; b=VqJiwgIO3N1KYQNQIKZWKvkWvf
 QOJRTRHN7w6a3l9oYq0H+IsaY5b/pFUOMU6d+wjUMEdTlLQQE1TB7YabOeU0kq3KBT2GaQv8P6MO3
 vP3I7u5xOBzxnDl1FzenG8MLcCsn0lfoQwhIE49apPw4dxRcSr+84Syj5RQVtJ+Y4kdk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWDr9-009L2i-0t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:48:39 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 42B22F69CB94B7516A49;
 Wed,  6 May 2020 14:48:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May 2020
 14:48:19 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20200504143538.159967-1-jaegeuk@kernel.org>
 <b18c4be5-b56d-6b6e-3f99-d2fe05d330eb@kernel.org>
 <20200505032358.GA136485@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3b13c020-74a2-d351-15a8-261f6901b3da@huawei.com>
Date: Wed, 6 May 2020 14:48:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200505032358.GA136485@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.2 FORGED_SPF_HELO        No description available.
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWDr9-009L2i-0t
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant check in
 f2fs_force_buffered_io
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/5 11:23, Jaegeuk Kim wrote:
> On 05/05, Chao Yu wrote:
>> On 2020-5-4 22:35, Jaegeuk Kim wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> We already checked whether the file is compressed or not in
>>> f2fs_post_read_required(). So removed f2fs_compressed_file()
>>> in f2fs_force_buffered_io().
>>
>> Agreed, since I have sent similar patch before:
>>
>> https://lkml.org/lkml/2020/3/24/1819
> 
> Heh, as I couldn't find yours, I was actually waiting for you to point out. :)

Well, all patches sent to f2fs mailing list have been archived in
lore.kernel.org/linux-f2fs-devel. :)

https://lore.kernel.org/linux-f2fs-devel/20200229104906.12061-1-yuchao0@huawei.com/

> 
>>
>> Just want to know what's the change of backport concern now.
> 
> Old ICE support had to decouple f2fs_post_read_required() and
> f2fs_forced_buffered_io(). Now, I decide to manage this as we

Copied.

> need to manage this for one kernel version only.

Okay, thanks for the explanation.

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fs/f2fs/f2fs.h | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 6b7b963641696..01a00fc808361 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -4064,8 +4064,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>>>  		return true;
>>>  	if (f2fs_is_multi_device(sbi))
>>>  		return true;
>>> -	if (f2fs_compressed_file(inode))
>>> -		return true;
>>>  	/*
>>>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>>>  	 * all IOs can be serialized by log-structured write.
>>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
