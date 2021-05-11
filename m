Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F237A0C5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 09:23:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgMjj-00066o-MV; Tue, 11 May 2021 07:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lgMjh-00066g-SH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 07:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+dvNI0nrKi2WQWUL5B6r23a4M4/zo4ytA8dfgI4bFvg=; b=hP7+3FITGYPzhh5Ya/c1C3xcxW
 75E8OWcKVsqXPMeVysbZ7C3dVXJhrRh5khV47UT0QWDE7YREZ7oM7hBfpyypzaVKWqHdAsQJUPUBS
 9vSmkRiPqU5D5AlpQyzII7YC3HiCP5EcYXcas7D3WfOZuCFUAPRV3plgC7g4w9c7Qk6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+dvNI0nrKi2WQWUL5B6r23a4M4/zo4ytA8dfgI4bFvg=; b=fPU8ULXaSPEpVJDDVSKFzHwtH6
 Q0VXdIkXInXIvqMCgAolaHgL2d1ZQCUwgyxfal10YKP99IV6IyFvfGriV2PAcJmHrtlG4U4a14ona
 Q+CZbAyLKoLmHuJAIb2VdFIsFeNmvCfj1CjTsinopGAqfl0ed8eQJXTUQFJOtTHBzjtk=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgMjc-0002MV-4F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 07:23:21 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FfTnt0NQFz60Yw;
 Tue, 11 May 2021 15:19:46 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 15:23:06 +0800
To: <daejun7.park@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <fc7f1b2b-60ea-eb12-3195-7b3ad0b3adc2@huawei.com>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
 <YJlHmP/ej8/IsHL3@google.com>
 <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
 <YJoRcIpW1g/OgHZn@google.com>
 <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p1>
 <20210511064156epcms2p1351480bea36733f2e00022bd295e829e@epcms2p1>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <771a05fe-e26f-d635-5f8d-5be72f82345f@huawei.com>
Date: Tue, 11 May 2021 15:23:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210511064156epcms2p1351480bea36733f2e00022bd295e829e@epcms2p1>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgMjc-0002MV-4F
Subject: Re: [f2fs-dev] [PATCH] f2fs: set file as cold when file
 defragmentation
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/11 14:41, Daejun Park wrote:
>> On 2021/5/11 13:09, Jaegeuk Kim wrote:
>>> On 05/11, Chao Yu wrote:
>>>> On 2021/5/10 22:47, Jaegeuk Kim wrote:
>>>>> On 05/06, Chao Yu wrote:
>>>>>> On 2021/5/6 12:46, Jaegeuk Kim wrote:
>>>>>>> On 05/06, Chao Yu wrote:
>>>>>>>> On 2021/4/29 14:20, Daejun Park wrote:
>>>>>>>>> In file defragmentation by ioctl, all data blocks in the file are
>>>>>>>>> re-written out-of-place. File defragmentation implies user will not update
>>>>>>>>> and mostly read the file. So before the defragmentation, we set file
>>>>>>>>> temperature as cold for better block allocation.
>>>>>>>>
>>>>>>>> I don't think all fragmented files are cold, e.g. db file.
>>>>>>>
>>>>>>> I have a bit different opinion. I think one example would be users want to
>>>>>>> defragment a file, when the they want to get higher read bandwidth for
>>>>>>
>>>>>> Multimedia file was already defined as cold file now via default extension
>>>>>> list?
>>>>>
>>>>> I just gave an example. And default is default.
>>>>>
>>>>>>
>>>>>>> usually multimedia files. That's likely to be cold files. Moreover, I don't
>>>>>>> think they want to defragment db files which will be fragmented soon?
>>>>>>
>>>>>> I guess like db files have less update but more access?
>>>>>
>>>>> I think both, and we set it as hot.
>>>>
>>>> Then hot and cold bit will set to the same db file after defragmentation?
>>>
>>> Do you set cold bit to db files? I mean, generally db is not cold, but hot.
>>
>> I never set cold bit to db files, I mean if we defragment db file which
>> has less update and more access, db file may have bot hot and cold bit.
>>
>> To Daejun, may I ask that is Samsung planning to use this defragment ioctl
>> in products? what's the user scenario?
> 
> It is just my idea for defragmentation, not Samsung.

Alright,

> I think the user will call the defrag ioctl for the files that have been updated.

Sadly, I don't see there is any user of this defragment interface since it was
been introduced... so I really don't know the real use scenario of this interface
now.

> 
> On the other hand, I think FS should be able to support defrag file even
> when in-place update is applied. What do you think?

bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
{
	if (f2fs_is_pinned_file(inode))
		return true;

	/* if this is cold file, we should overwrite to avoid fragmentation */
	if (file_is_cold(inode))
		return true;

If cold bit was set, later rewrite in defragment interface can only trigger
IPU due to above IPU policy check, so after this interface, file is still
fragmented... what's the difference compared to just setting cold bit via
setxattr?

And if user know that he will trigger less update and more read in the file,
why not just calling setxattr("system.advise", cold_bit) to set the file as
cold before it becomes fragmented, e.g. at the time of file creation?

Thanks,

> 
> Thanks,
> Daejun
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
>>>>>>>> "system.advise" -v value) to indicate this file is a hot/cold file, so my
>>>>>>>> suggestion is after file defragmentation, if you think this file is cold, and
>>>>>>>> use setxattr() to set it as cold.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
>>>>>>>>> ---
>>>>>>>>>       fs/f2fs/file.c | 3 +++
>>>>>>>>>       1 file changed, 3 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>>>>> index d697c8900fa7..dcac965a05fe 100644
>>>>>>>>> --- a/fs/f2fs/file.c
>>>>>>>>> +++ b/fs/f2fs/file.c
>>>>>>>>> @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>>>>>>>>               map.m_len = pg_end - pg_start;
>>>>>>>>>               total = 0;
>>>>>>>>> +        if (!file_is_cold(inode))
>>>>>>>>> +                file_set_cold(inode);
>>>>>>>>> +
>>>>>>>>>               while (map.m_lblk < pg_end) {
>>>>>>>>>                       pgoff_t idx;
>>>>>>>>>                       int cnt = 0;
>>>>>>>>>
>>>>>>> .
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
>>
>>
>>   
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
