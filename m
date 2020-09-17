Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C109E26D1F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 05:54:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIl0F-0005Kq-NW; Thu, 17 Sep 2020 03:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1kIl0E-0005HI-IA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 03:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tC0fZ3FavrW06sBUspf920opbQMiuozOUof2KncmX3U=; b=a4hJSU2nH7J9ruPz5OUwuptIcA
 HfgWHp7cbp6d5lpULMCt/2od9lrd6a5eZ3+RlgQnCh7kzui4sl9/F30Swlp937qLW5odo3Flcla9S
 JsCoaFw8RSo0TkiMfMvC6TUgfcDvPSZPxseCntN7vKGCc4zQ4sQrIh7zj+XzQyCy/gjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tC0fZ3FavrW06sBUspf920opbQMiuozOUof2KncmX3U=; b=T
 yDB/MKgJJQrHHZqgRQMkQENHyVcZTSY1y8LTyHvcuFy/zwfhVHZZKIP/6dZiXZ/VK9t5no/6qMZBV
 KDblbjX30sYUOaMDli0ECTwEGIqk8m7/C4hF8BYB1fOAsthRObB8LUDgod0atPnMzIG/hiMprWoSL
 MurzEAzy18jHd0Ek=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIl0B-00CPUr-CY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 03:54:34 +0000
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id CAC5BAF5127805EA7C6F;
 Thu, 17 Sep 2020 11:54:18 +0800 (CST)
Received: from DGGEML422-HUB.china.huawei.com (10.1.199.39) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 17 Sep 2020 11:54:18 +0800
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.224]) by
 dggeml422-hub.china.huawei.com ([10.1.199.39]) with mapi id 14.03.0487.000;
 Thu, 17 Sep 2020 11:54:11 +0800
From: "wangxiaojun (N)" <wangxiaojun11@huawei.com>
To: "Yuchao (T)" <yuchao0@huawei.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH] f2fs: fix wrong total_sections check
Thread-Index: AQHWi9UQ/+csPOjKN0qV4RXXgcAYAg==
Date: Thu, 17 Sep 2020 03:54:11 +0000
Message-ID: <6FEAADAF081CC14C95AF288712F254AE1D6EEB15@dggeml531-mbx.china.huawei.com>
References: <20200916015410.4135737-1-wangxiaojun11@huawei.com>
 <3041cb44-8666-1db2-7474-367cf19f46c7@huawei.com>
 <6FEAADAF081CC14C95AF288712F254AE1D6CBA0A@dggeml531-mbx.china.huawei.com>
 <35370655-1c32-c2d9-2952-08a36e959dde@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.148]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1kIl0B-00CPUr-CY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong total_sections check
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

在 2020/9/16 17:49, Yuchao (T) 写道:
> On 2020/9/16 14:56, wangxiaojun (N) wrote:
>> 在 2020/9/16 10:57, Yuchao (T) 写道:
>>> On 2020/9/16 9:54, Xiaojun Wang wrote:
>>>> Meta area is not included in section_count computation.
>>>> The code in mkfs/f2fs_format.c is:
>>>> 	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
>>>> 					total_meta_zones;
>>>> 	set_sb(section_count, total_zones * c.secs_per_zone);
>>>>
>>>> So the minimum total_sections is 1.
>>>>
>>>> Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
>>>> ---
>>>>    fs/f2fs/super.c | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index dfa072fa8081..a450c8589841 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -2799,8 +2799,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>>>>    		return -EFSCORRUPTED;
>>>>    	}
>>>>    
>>>> -	if (total_sections > segment_count ||
>>>> -			total_sections < F2FS_MIN_SEGMENTS ||
>>>> +	if (total_sections > segment_count || total_sections < 1 ||
>>>>    			segs_per_sec > segment_count || !segs_per_sec) {
>>> Here, we try to check sanity on segs_per_sec config directly and indirectly:
>>> - directly: check raw_super->segs_per_sec field
>>> - indirectly: check whether segment_count / total_sections is less than 1
>>>
>>> So I guess that first condition is wrong as well, should change it like?
>>>
>>> if (total_sections > segment_count - 'total_meta_segment_count' ||
>>>
>>> Thoughts?
>>>
>>> Thanks,
>> Hi Chao, aggree with you.
>>
>> 'total_meta_segment_count' = le32_to_cpu(raw_super->segment_count_ckpt) +
>> 			le32_to_cpu(raw_super->segment_count_sit) +
>> 			le32_to_cpu(raw_super->segment_count_nat) +
>> 			le32_to_cpu(raw_super->segment_count_ssa)
>> But the above values will be checked in sanity_check_area_boundary() which will be called later.
>> So can we move the total_sections checking to sanity_check_area_boundary
> I think we'd better keep segs_per_sec check in sanity_check_raw_super(), as
> it's a field of superblock.
OK
>>   ensure the 'total_meta_segment_count' is correct ?
> It looks the condition below is wrong as well for the same reason you mentioned
> in commit message?
>
> if (unlikely(fsmeta < F2FS_MIN_SEGMENTS ||
>
> Thanks,

Will updated in V2

Thanks,

>>>>    		f2fs_info(sbi, "Invalid segment/section count (%u, %u x %u)",
>>>>    			  segment_count, total_sections, segs_per_sec);
>>>>
>>
>> .
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
