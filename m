Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36540E0099
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 11:24:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMqOx-0006At-1q; Tue, 22 Oct 2019 09:24:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMqOv-0006Al-At
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8kBD3C92vztUcnglkm9kkglhhv3VSOPDXkc0gnbCbN0=; b=Zd69/YmcXeCDECkppTUtHPC0QI
 vMUapy4UFxXK5stWsP9E3TL7rqzdY5TAqTII7/SORb9gKiNdcL8fkHMaoJvptHc3Xx96zegfleUgt
 BRvQpsk4v+z1I19DIMws9xw0v27/EqqGgR/G1YKRVoSetzn1mDHvaBCTyx/m1kJCtxBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8kBD3C92vztUcnglkm9kkglhhv3VSOPDXkc0gnbCbN0=; b=EZSKK1PoItFyaAp5HQ+ctTkqlf
 MJ49y1ZIRZ5DSUzW7nrLjnEu0+pNLVHMrOa2xvh9NtrK6LavA88l1X8KVe9CO5PU8H2OIaT5RrYQL
 BauXtgVItpwc+WhsXgue9A2nocZxu4/IBHMabbyWnb99blXbiaW3a4qW7XTE4NRCTBpQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMqOr-00BH1e-PW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:24:25 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0A0798254F309A913C85;
 Tue, 22 Oct 2019 17:24:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 17:24:09 +0800
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Shinichiro Kawasaki
 <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-4-shinichiro.kawasaki@wdc.com>
 <f83595f2-38b4-037e-1854-58dbb000be3a@huawei.com>
 <BYAPR04MB5816DA3BF24489E360E9E969E7680@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <44355087-2e78-2d26-3d8b-fd17be43c181@huawei.com>
Date: Tue, 22 Oct 2019 17:24:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816DA3BF24489E360E9E969E7680@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iMqOr-00BH1e-PW
Subject: Re: [f2fs-dev] [PATCH v5 3/8] libf2fs_zoned: Introduce
 f2fs_reset_zone() helper function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/22 17:10, Damien Le Moal wrote:
> On 2019/10/22 17:59, Chao Yu wrote:
>> On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
>>> To prepare for write pointer consistency fix by fsck, add
>>> f2fs_reset_zone() helper function which calls RESET ZONE command. The
>>> function is added to lib/libf2fs_zoned which gathers zoned block device
>>> related functions.
>>>
>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>> ---
>>>  include/f2fs_fs.h   |  1 +
>>>  lib/libf2fs_zoned.c | 26 ++++++++++++++++++++++++++
>>>  2 files changed, 27 insertions(+)
>>>
>>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>>> index 1f7ef05..a36927b 100644
>>> --- a/include/f2fs_fs.h
>>> +++ b/include/f2fs_fs.h
>>> @@ -1303,6 +1303,7 @@ extern int f2fs_report_zone(int, u_int64_t, void *);
>>>  typedef int (report_zones_cb_t)(int i, void *, void *);
>>>  extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
>>>  extern int f2fs_check_zones(int);
>>> +int f2fs_reset_zone(int, void *);
>>>  extern int f2fs_reset_zones(int);
>>>  
>>>  #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
>>> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
>>> index 10d6d0b..1335038 100644
>>> --- a/lib/libf2fs_zoned.c
>>> +++ b/lib/libf2fs_zoned.c
>>> @@ -388,6 +388,26 @@ out:
>>>  	return ret;
>>>  }
>>>  
>>> +int f2fs_reset_zone(int i, void *blkzone)
>>> +{
>>> +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
>>> +	struct device_info *dev = c.devices + i;
>>> +	struct blk_zone_range range;
>>> +	int ret;
>>> +
>>> +	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
>>> +		return 0;
>>> +
>>> +	/* Non empty sequential zone: reset */
>>> +	range.sector = blk_zone_sector(blkz);
>>> +	range.nr_sectors = blk_zone_length(blkz);
>>> +	ret = ioctl(dev->fd, BLKRESETZONE, &range);
>>> +	if (ret != 0)
>>
>> As you did in other zoned block device code, errno would be preferred as return
>> value?
>>
>>> +		ERR_MSG("ioctl BLKRESETZONE failed\n");
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  int f2fs_reset_zones(int j)
>>>  {
>>>  	struct device_info *dev = c.devices + j;
>>> @@ -491,6 +511,12 @@ int f2fs_check_zones(int i)
>>>  	return -1;
>>>  }
>>>  
>>> +int f2fs_reset_zone(int i, void *blkzone)
>>> +{
>>> +	ERR_MSG("%d: Zoned block devices are not supported\n", i);
>>
>> Minor thing:
>>
>> "device is"?
> 
> 	ERR_MSG("%d: Unsupported zoned block device\n", i);
> 
> may be better.

Looks better.

> 
> Note that we should never hit this anyway since the validity of the set
> of devices used should have been checked way before we start resetting
> zones.

Yup.

Thanks,

> 
>>
>>> +	return -1;
>>> +}
>>> +
>>>  int f2fs_reset_zones(int i)
>>>  {
>>>  	ERR_MSG("%d: Zoned block devices are not supported\n", i);
>>
>> "device is"?
> 
> Same as above.
> 
>>
>> Thanks,
>>
>>>
>>
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
