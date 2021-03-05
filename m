Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF632DF92
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Mar 2021 03:20:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lI04L-0005b2-7S; Fri, 05 Mar 2021 02:19:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lI04J-0005aq-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 02:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZiOjc17KK+6grqxjnl2ycgqynAHu8YXi4coiH0EtUzI=; b=Xpp3Uf/Wem+mA6EIIVelj0+giN
 4VQ3etglVsHb7TxnLVL5RwhaJqktN0ZSysf0B9NJqqtp9V4Wft+vWQ5eZ1Hqmx3dGcMvlKOkmOJyx
 J+SLMdISZnrVlhRGe7q0GHyBThILbg/ytbHj+YiTSeZ4OWVjg+8ghzGQQOs1/j8spnbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZiOjc17KK+6grqxjnl2ycgqynAHu8YXi4coiH0EtUzI=; b=QvQNDxcDwRZwY98GoX3RQWeRfY
 3rXq3gtjtADl8welewUpLr+kr16VdxwVlovZs04xLElAx11NyHdQSXLoWpiwY5xdlw8OitBreMrS4
 kpOmaf1p3FFU+PElroWoOKnFBQSVKN2u26YUmHmRbdB+5dr+/or9ZKawygbxe8AAfB+0=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lI045-0002ES-Jb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 02:19:52 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsBFt356lzMjHn;
 Fri,  5 Mar 2021 10:17:22 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Mar 2021
 10:19:31 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
 <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
 <YD5wQRX+HnltBvEM@google.com> <YD6HjZG7QMS6Z3Tb@google.com>
 <05b43d3e-d735-ae34-5a4f-3d81a4fc8a9b@huawei.com>
 <YEEd1q5nz9EYGy8H@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ee90aac8-bc84-0a85-e1b8-f51c40c77535@huawei.com>
Date: Fri, 5 Mar 2021 10:19:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YEEd1q5nz9EYGy8H@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lI045-0002ES-Jb
Subject: Re: [f2fs-dev] [PATCH] f2fs: expose # of overprivision segments
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/5 1:50, Jaegeuk Kim wrote:
> On 03/04, Chao Yu wrote:
>> On 2021/3/3 2:44, Jaegeuk Kim wrote:
>>> On 03/02, Jaegeuk Kim wrote:
>>>> On 03/02, Chao Yu wrote:
>>>>> On 2021/3/2 13:42, Jaegeuk Kim wrote:
>>>>>> This is useful when checking conditions during checkpoint=disable in Android.
>>>>>
>>>>> This sysfs entry is readonly, how about putting this at
>>>>> /sys/fs/f2fs/<disk>/stat/?
>>>>
>>>> Urg.. "stat" is a bit confused. I'll take a look a better ones.
>>
>> Oh, I mean put it into "stat" directory, not "stat" entry, something like this:
>>
>> /sys/fs/f2fs/<disk>/stat/ovp_segments
> 
> I meant that too. Why is it like stat, since it's a geomerty?

Hmm.. I feel a little bit weired to treat ovp_segments as 'stat' class, one reason
is ovp_segments is readonly and is matching the readonly attribute of a stat.

> 
>>
>>>
>>> Taking a look at other entries using in Android, I feel that this one can't be
>>> in stat or whatever other location, since I worry about the consistency with
>>> similar dirty/free segments. It seems it's not easy to clean up the existing
>>> ones anymore.
>>
>> Well, actually, the entry number are still increasing continuously, the result is
>> that it becomes more and more slower and harder for me to find target entry name
>> from that directory.
>>
>> IMO, once new readonly entry was added to "<disk>" directory, there is no chance
>> to reloacate it due to interface compatibility. So I think this is the only
>> chance to put it to the appropriate place at this time.
> 
> I know, but this will diverge those info into different places. I don't have
> big concern when finding a specific entry with this tho, how about making
> symlinks to create a dir structure for your easy access? Or, using a script
> would be alternative way.

Yes, there should be some alternative ways to help to access f2fs sysfs
interface, but from a point view of user, I'm not sure he can figure out those
ways.

For those fs meta stat, why not adding a single entry to include all info you
need rather than adding them one by one? e.g.

/proc/fs/f2fs/<disk>/super_block
/proc/fs/f2fs/<disk>/checkpoint
/proc/fs/f2fs/<disk>/nat_table
/proc/fs/f2fs/<disk>/sit_table
...

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>> ---
>>>>>>     fs/f2fs/sysfs.c | 8 ++++++++
>>>>>>     1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>>>>>> index e38a7f6921dd..254b6fa17406 100644
>>>>>> --- a/fs/f2fs/sysfs.c
>>>>>> +++ b/fs/f2fs/sysfs.c
>>>>>> @@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
>>>>>>     			(unsigned long long)(free_segments(sbi)));
>>>>>>     }
>>>>>> +static ssize_t ovp_segments_show(struct f2fs_attr *a,
>>>>>> +		struct f2fs_sb_info *sbi, char *buf)
>>>>>> +{
>>>>>> +	return sprintf(buf, "%llu\n",
>>>>>> +			(unsigned long long)(overprovision_segments(sbi)));
>>>>>> +}
>>>>>> +
>>>>>>     static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
>>>>>>     		struct f2fs_sb_info *sbi, char *buf)
>>>>>>     {
>>>>>> @@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
>>>>>>     F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
>>>>>>     F2FS_GENERAL_RO_ATTR(dirty_segments);
>>>>>>     F2FS_GENERAL_RO_ATTR(free_segments);
>>>>>> +F2FS_GENERAL_RO_ATTR(ovp_segments);
>>>>>
>>>>> Missed to add document entry in Documentation/ABI/testing/sysfs-fs-f2fs?
>>>>
>>>> Yeah, thanks.
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>     F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
>>>>>>     F2FS_GENERAL_RO_ATTR(features);
>>>>>>     F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
>>>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
