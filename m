Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263B1E1C6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 09:44:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdUG9-0008Qt-HG; Tue, 26 May 2020 07:44:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jdUG7-0008Qb-IK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 07:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5scwrV9G91EwXufHwCnBmC/UW/gq/tLkL6QW02KnHXw=; b=UCV9g+t73knrlfC2dkBbX7niK/
 eYFpqKpOy4TQqFNmfkNrNN2cTsvcOM5HXMl7RGYtvVk813bBfpD5hgoFwyEF1/nKUzzicBF/VIYIt
 Ik29I2dWeCuFBV+hnHGWua4Sf5Is+QscP5+H7yzwOOeB3iAOYzkwL1meBmuf1sAFqkh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5scwrV9G91EwXufHwCnBmC/UW/gq/tLkL6QW02KnHXw=; b=RzzRWmf9wGyU1gunqaOn4fN5Vu
 C269jcEeFahgBSiSV9YPu8MtttShn5kd5vtIrD+kt490RQfwX5acqoKFFpNASKKiGKFLgm0MahAWw
 iR07HsU3FEwjz+Kc6BAgSJlCUIYGrSdFMe66ZN9kIg08Bbu5+6Sz2MVGbm5qwzx59lH4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdUG4-007ONY-E0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 07:44:23 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2BE932229573FB02C4C5;
 Tue, 26 May 2020 15:44:11 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 26 May
 2020 15:44:10 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200526015917.GB207949@google.com>
 <9a09da49-9b3d-68c3-f47f-40bb7e4309b8@huawei.com>
 <20200526022646.GA226136@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <36fc95db-96e1-a93b-737a-c8bf34ca00f3@huawei.com>
Date: Tue, 26 May 2020 15:44:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200526022646.GA226136@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: run.sh]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdUG4-007ONY-E0
Subject: Re: [f2fs-dev] Discard issue
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/26 10:26, Jaegeuk Kim wrote:
> On 05/26, Chao Yu wrote:
>> Hi Jaegeuk,
>>
>> On 2020/5/26 9:59, Jaegeuk Kim wrote:
>>> Hi Chao,
>>>
>>> I'm hitting segment.c:1065 when running longer fsstress (1000s) with error
>>
>> (1000s) do you mean time in single round or total time of multi rounds?
>>
>>> injection. Do you have any issue from your side?
>>
>> I haven't hit that before, in my test, in single round, fsstress won't last long
>> time (normally about 10s+ for each round).
>>
>> Below is por_fsstress() implementation in my code base:
>>
>> por_fsstress()
>> {
>>         _fs_opts
>>
>>         while true; do
>>                 ltp/fsstress -x "echo 3 > /proc/sys/vm/drop_caches" -X 10 -r -f fsync=8 -f sync=0 -f write=4 -f dwrite=2 -f truncate=6 -f allocsp=0 -f bulkstat=0 -f bulkstat1=0 -f freesp=0 -f zero=1 -f collapse=1 -f insert=1 -f resvsp=0 -f unresvsp=0 -S t -p 20 -n 200000 -d $TESTDIR/test &
>>                 sleep 10
>>                 src/godown $TESTDIR
>>                 killall fsstress
>>                 sleep 5
>>                 umount $TESTDIR
>>                 if [ $? -ne 0 ]; then
>>                         for i in `seq 1 50`
>>                         do
>>                                 umount $TESTDIR
>>                                 if [ $? -eq 0]; then
>>                                         break
>>                                 fi
>>                                 sleep 5
>>                         done
>>                 fi
>>                 echo 3 > /proc/sys/vm/drop_caches
>>                 _fsck
>>                 _mount f2fs
>>                 rm $TESTDIR/testfile
>>                 touch $TESTDIR/testfile
>>                 umount $TESTDIR
>>                 _fsck
>>                 _mount f2fs
>>                 _rm_50
>>         done
>> }
>>
>> Did you update this code?
>>
>> Could you share more test configuration, like mkfs option, device size, mount option,
>> new por_fsstress() implementation if it exists? I can try to reproduce this issue
>> in my env.
> 
> I just changed, in __run_godown_fsstress(), sleep 1000 instead of 10.
> 
> https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh#L249
> 
> ./run.sh por_fsstress

Reproducing...

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
