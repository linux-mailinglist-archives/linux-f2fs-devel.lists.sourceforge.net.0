Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D59A501
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 03:39:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0yYO-0001JS-Ch; Fri, 23 Aug 2019 01:39:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i0yYN-0001JL-37
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 01:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkA5FQGJPNWeLuS0CeguEwuEkBCWVq5q0+xDcda09Vs=; b=WqzL4wRKEmLA38Cn8ffT78Jqle
 C527DWMvrzl2J4ap+0pTqJZGJfQrKgT94Lxy8yQ51HF55Omo8zBmFDm2jUaFGKhl0U4HE0Isx+m9F
 q4CAJotBrBsb4y+U2QLCRZ7fHemttwRB9kmO+9n8D7vzLDV61L0ZzIEvrQMXnhdvuuy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RkA5FQGJPNWeLuS0CeguEwuEkBCWVq5q0+xDcda09Vs=; b=MVl6ZN7JZStsgYCGomamh6LUgc
 Ra7tQ6r6Rx3i1oNnvJTJpGgWeiyo7ZG2AG4i/wrVaDVVDVAFhx9dY643ITguoZDdFanacSRDWoVdc
 iSQwjV5WhA4ttSaAE0H/GMk6T8BpDkbPrt4LPZADz4Xjkv8ZHiI/y437cXluLDQPgrhw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0yYH-00Giv5-Rq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 01:39:46 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CF88A45D3A56161F9648;
 Fri, 23 Aug 2019 09:39:31 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 23 Aug
 2019 09:39:30 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <3bc8584e-651c-9578-c25a-40c60b5cfbdb@huawei.com>
 <dfd847fe-0c6d-f2a1-db50-d637a685d13b@huawei.com>
 <20190822194915.GB99916@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ca722330-d7f4-4e6b-8129-ae48357db85a@huawei.com>
Date: Fri, 23 Aug 2019 09:39:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190822194915.GB99916@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0yYH-00Giv5-Rq
Subject: Re: [f2fs-dev] f2fs_symlink bug
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/23 3:49, Jaegeuk Kim wrote:
> On 08/21, Chao Yu wrote:
>> Ping,
>>
>> On 2019/8/12 20:01, Chao Yu wrote:
>>> Hi Jaegeuk,
>>>
>>> In por_fsstress testcase, fsck reports below inconsistent status, I found one
>>> path can cause this case.
>>>
>>> [FIX] (fsck_chk_inode_blk:1002)  --> Symlink: recover 0x1425 with i_size=4096
>>> [ASSERT] (fsck_chk_inode_blk:1030)  --> ino: 0x1425 chksum:0x6983d47, but
>>> calculated one is: 0xdb284b35
>>> [FIX] (fsck_chk_inode_blk:1036)  --> ino: 0x1425 recover, i_inode_checksum=
>>> 0x6983d47 -> 0xdb284b35
>>>
>>> - f2fs_symlink
>>>  - page_symlink failed -> f2fs_write_failed() will truncate size to zero
>>>   - f2fs_unlink failed -> symlink inode w/o data will remain in fs
>>>
>>> Not sure, but one choice of fix is to treat symlink as fs meta like we did for
>>> directory, so that checkpoint can take care of all data/node of symlink, any
>>> thoughts?
> 
> Hmm, how's the possible to get very long path name requiring another data block?

It can with below script, which is actually existed case in fsstress.

#!/bin/bash

for (( i = 0; i < 4095; i++ )); do
        if [ $((i % 255)) -eq 0 ]
        then
                filename=$filename"/"
        else
                filename=$filename"0"
        fi
done

ln -s $filename /f2fs_mount_point/symlink

> If it's fitted in inline_data, it's more easy to guarantee that, right?

If the length of symlink is 4095, not sure inline space is enough even we can
compress symlink...

Thanks,

> 
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
