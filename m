Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57B8F865
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 03:23:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyQxw-0007zC-V5; Fri, 16 Aug 2019 01:23:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hyQxu-0007z4-3c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EYdVNgeW79PDYuP8LUrGuenrMV2eVFVVQSg6uvX/qgs=; b=Yvo1z7IPGIZ2i+02KKCQI6qm70
 pzNc7Ct8lc1vsMzJqEz23gm/gv1qaIpinFASznRKbRKUJSPISw32zRyKykniAA8nmv+wM+x8CC4uO
 xFVAy5sZy0SrQUruJM0U0VU5Nuk3paFqkz63Hw/ItXlAEAIGxarAMnWScHgWf3sTrur8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EYdVNgeW79PDYuP8LUrGuenrMV2eVFVVQSg6uvX/qgs=; b=eeANAF4Bf8eVGUd6npxaRWBlBc
 pNdueopPHUl31wbD/5h2D8IH/e21smKabz8an+shCCbQSm4g3273MUknoxSUFxZ0AVCoj+EiRTZV2
 ac2hflj19VgBQF70Nk0PrX+txpQKMnwnQymG5V5pDjuTTib+3/plGEFnrA0lzcG6xEnA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyQxp-007jgS-BW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:23:37 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 481E64B62475EE0BA189;
 Fri, 16 Aug 2019 09:23:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 16 Aug
 2019 09:23:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
 <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
 <9e3ccdf8-6280-ac8d-30b7-e89d54f5b6c9@huawei.com>
 <20190815222127.GA60095@jaegeuk-macbookpro.roam.corp.google.com>
 <635c9a57-da04-c215-0bd1-2e76118b99dc@huawei.com>
 <20190816010230.GB65786@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e577a123-c132-ec72-89d0-142f2f05ee86@huawei.com>
Date: Fri, 16 Aug 2019 09:23:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190816010230.GB65786@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hyQxp-007jgS-BW
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/16 9:02, Jaegeuk Kim wrote:
> On 08/16, Chao Yu wrote:
>> On 2019/8/16 6:21, Jaegeuk Kim wrote:
>>> On 08/12, Chao Yu wrote:
>>>> On 2019/8/9 23:12, Jaegeuk Kim wrote:
>>>>> We actually don't need to issue trim on entire disk by checking first
>>>>> blocks having zeros.
>>>>
>>>> In heap mode, we locate node log header to tail end of device, should we
>>>> consider to check block contain according to heap option?
>>>
>>> I wanted to check F2FS metadata mainly.
>>
>> Oh, I thought you mean main area. :P
>>
>>>
>>>>
>>>> BTW, if we changed cp_ver whenever mkfs, why should we still issue trim to
>>>> obsolete old data in node remained in image?
>>>
>>> For simplicity. :P
>>
>> I didn't get why we can assume all metadata are zeroed if first 16MB are all zero...
>>
>> BTW, if first 16MB are non-zero, why not just trim F2FS metadata rather than
>> whole area?
> 
> Trim the entire space so that we can skip discard in runtime by the flag, right?

You're right, thanks helping recall. ;)

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>> v2 from v1:
>>>>>  - clean up
>>>>>
>>>>>  mkfs/f2fs_format_utils.c | 53 ++++++++++++++++++++++++++++++++++++++--
>>>>>  1 file changed, 51 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
>>>>> index 8bf128c..f2d55ad 100644
>>>>> --- a/mkfs/f2fs_format_utils.c
>>>>> +++ b/mkfs/f2fs_format_utils.c
>>>>> @@ -25,6 +25,7 @@
>>>>>  #include <stdio.h>
>>>>>  #include <unistd.h>
>>>>>  #include <stdlib.h>
>>>>> +#include <stdbool.h>
>>>>>  #ifndef ANDROID_WINDOWS_HOST
>>>>>  #include <sys/ioctl.h>
>>>>>  #endif
>>>>> @@ -110,13 +111,61 @@ static int trim_device(int i)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +static bool is_wiped_device(int i)
>>>>> +{
>>>>> +#ifdef WITH_ANDROID
>>>>> +	struct device_info *dev = c.devices + i;
>>>>> +	int fd = dev->fd;
>>>>> +	char *buf, *zero_buf;
>>>>> +	bool wiped = true;
>>>>> +	int nblocks = 4096;	/* 16MB size */
>>>>> +	int j;
>>>>> +
>>>>> +	buf = malloc(F2FS_BLKSIZE);
>>>>> +	if (buf == NULL) {
>>>>> +		MSG(1, "\tError: Malloc Failed for buf!!!\n");
>>>>> +		return false;
>>>>> +	}
>>>>> +	zero_buf = calloc(1, F2FS_BLKSIZE);
>>>>> +	if (zero_buf == NULL) {
>>>>> +		MSG(1, "\tError: Calloc Failed for zero buf!!!\n");
>>>>> +		free(buf);
>>>>> +		return false;
>>>>> +	}
>>>>> +
>>>>> +	if (lseek(fd, 0, SEEK_SET) < 0) {
>>>>> +		free(zero_buf);
>>>>> +		free(buf);
>>>>> +		return false;
>>>>> +	}
>>>>> +
>>>>> +	/* check first n blocks */
>>>>> +	for (j = 0; j < nblocks; j++) {
>>>>> +		if (read(fd, buf, F2FS_BLKSIZE) != F2FS_BLKSIZE ||
>>>>> +				memcmp(buf, zero_buf, F2FS_BLKSIZE)) {
>>>>> +			wiped = false;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>> +	free(zero_buf);
>>>>> +	free(buf);
>>>>> +
>>>>> +	if (wiped)
>>>>> +		MSG(0, "Info: Found all zeros in first %d blocks\n", nblocks);
>>>>> +	return wiped;
>>>>> +#else
>>>>> +	return false;
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>>  int f2fs_trim_devices(void)
>>>>>  {
>>>>>  	int i;
>>>>>  
>>>>> -	for (i = 0; i < c.ndevs; i++)
>>>>> -		if (trim_device(i))
>>>>> +	for (i = 0; i < c.ndevs; i++) {
>>>>> +		if (!is_wiped_device(i) && trim_device(i))
>>>>>  			return -1;
>>>>> +	}
>>>>>  	c.trimmed = 1;
>>>>>  	return 0;
>>>>>  }
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
