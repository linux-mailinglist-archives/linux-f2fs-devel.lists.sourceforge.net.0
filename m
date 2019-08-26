Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5974A9CAB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2019 09:38:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i29Zz-0002kE-Gs; Mon, 26 Aug 2019 07:38:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i29Zt-0002jm-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 07:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RUKXylVVu7JyKu08xlt0t5QLx+8UaZDK8tnTG81H4WI=; b=F0qDHNwMJ6xwZ5eCw+Xeb7q73t
 /b5oKLDSfIqwerUty4rDLN6j0vBxnkCBYzGDelqGSnbNmRLhTPO4DXwQMm21XiI7Jb5aCmG7D/sKg
 q4wxYKK81KrHFi1Qp7SFceFcwMmjv3TXjvuE0f3WDmTrt+ktN2PcXXN92b/HU5gEw4S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RUKXylVVu7JyKu08xlt0t5QLx+8UaZDK8tnTG81H4WI=; b=BZr/ENC2gpwC8oR4wudfK8G/hT
 Z8+FADAAyZtmzV7hQiSbKAYp0EgZeO72aJaIp91V+yF4EuHTk0oA0go781xZwpeXdx/xCjmCz5zqA
 PrTXC6jSLh6Dc+U5JkT/RIeVsWL0Pr4Sx85h2P3fo9JKeHls9Pidd38hP8J6gVadmD+w=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i29Zr-00FytU-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 07:38:13 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 99D25447CFBB5E448658;
 Mon, 26 Aug 2019 15:37:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug
 2019 15:37:53 +0800
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Chao Yu <chao@kernel.org>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <51daaa42-58b0-85dd-dcda-13185afe5b63@kernel.org>
 <BYAPR04MB5816E9510B8836D734424059E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c7e07417-d3c6-3bab-9f82-28b12ad30027@huawei.com>
Date: Mon, 26 Aug 2019 15:37:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816E9510B8836D734424059E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i29Zr-00FytU-Hk
Subject: Re: [f2fs-dev] [PATCH v2 0/4] fsck: Check write pointers of zoned
 block devices
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/26 8:10, Damien Le Moal wrote:
> Chao,
> 
> On 2019/08/23 22:09, Chao Yu wrote:
>> Hi Damien,
>>
>> Do you have time to take a look at this patch set, and add a reviewed-by if it
>> is okay to you. :)
> 
> My apologies for not chiming in earlier. Shinichiro works in my group and I

Hi Damien,

I can guess you're in the same team. ;)

> asked him to work on this. We have gone through several iterations internally
> and this is the latest version.

I do believe zoned block codes change needs your review, due to my less
experience on such device. :P

> 
> So:
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks a lot for the review.

Thanks,

> 
>>
>> Thanks,
>>
>> On 2019-8-21 12:47, Shin'ichiro Kawasaki wrote:
>>> On sudden f2fs shutdown, zoned block device status and f2fs meta data can be
>>> inconsistent. When f2fs shutdown happens during write operations, write pointers
>>> on the device go forward but the f2fs meta data does not reflect write pointer
>>> progress. This inconsistency will eventually cause "Unaligned write command"
>>> error when restarting write operation after the next mount. This error can be
>>> observed with xfstests test case generic/388, which enforces sudden shutdown
>>> during write operation and checks the file system recovery. Once the error
>>> happens because of the inconsistency, the file system requires fix. However,
>>> fsck.f2fs does not have a feature to check and fix it.
>>>
>>> This patch series adds a new feature to fsck.f2fs to check and fix the
>>> inconsistency. First and second patches add two functions which helps fsck to
>>> call report zone and reset zone commands to zoned block devices. Third patch
>>> checks write pointers of zones that current segments recorded in meta data point
>>> to. This covers the failure symptom observed with xfstests. The last patch
>>> checks write pointers of zones that current segments do not point to, which
>>> covers a potential failure scenario.
>>>
>>> This patch series depends on other patches for zoned block devices, then it
>>> conflicts with the master branch in f2fs-tools.git as of Aug/19/2019. It can be
>>> applied without conflict to dev and dev-test branch tips.
>>>
>>> Changes from v1:
>>> * Fixed build failure on dev branch
>>>
>>> Shin'ichiro Kawasaki (4):
>>>   libf2fs_zoned: Introduce f2fs_report_zones() helper function
>>>   libf2fs_zoned: Introduce f2fs_reset_zone() function
>>>   fsck.f2fs: Check write pointer consistency with current segments
>>>   fsck.f2fs: Check write pointer consistency with valid blocks count
>>>
>>>  fsck/fsck.c         | 161 ++++++++++++++++++++++++++++++++++++++++++++
>>>  fsck/fsck.h         |   3 +
>>>  fsck/main.c         |   2 +
>>>  include/f2fs_fs.h   |   3 +
>>>  lib/libf2fs_zoned.c |  81 ++++++++++++++++++++++
>>>  5 files changed, 250 insertions(+)
>>>
>>
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
