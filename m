Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CC1C4F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 10:30:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQSp3-0006lp-9M; Tue, 14 May 2019 08:30:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hQSp1-0006lh-RH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 08:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4LrLvz1Z9J0C4WoXLTfiJ0w5Pet2zJRsNNaLL3ujWrE=; b=B814PNZyUyFGAjQqRrx2aafcOz
 xYLCbBsqrkWGXF49sBnVrgBURYA+qyHkD7mwHkJrXCleGkAK8Q38DtIgJHd0NnUfvf/sMG3qJSEau
 roNg2xpsYk+2TTXaB4OdZ1QLbWIcJBqPFHGMFggDVmIXsg9BwinjxX2xgkKziHbkC8SY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4LrLvz1Z9J0C4WoXLTfiJ0w5Pet2zJRsNNaLL3ujWrE=; b=mAq8N0EnyvbUQlJPmOqnrUDDby
 ZyKJCsl/cxrh9lmJHv3eWqFMmzjXoW9VNhKCjP7tF44bGaPVrcjBhRU2X41CRxIJnXMVnC8YW49bN
 FqCiBKitTCeVD+dzNTN/DlekmVnQJz3f5uy8/z0nnF+9WSBjdQDJaFcGs9oykNrEif9Q=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQSoz-00GLug-Ja
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 08:30:03 +0000
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 2A642CAC562BAF98E832;
 Tue, 14 May 2019 16:29:54 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 14 May 2019 16:29:53 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 14 May 2019 16:29:53 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
References: <20180529205048.39694-1-jaegeuk@kernel.org>
 <CAD14+f154_t1-TbbSDb9xV_ikDAWfF+8H7aOSK4VF8UmqWRDAQ@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <73fc6da8-7b89-3b02-8856-bd6876c50259@huawei.com>
Date: Tue, 14 May 2019 16:29:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f154_t1-TbbSDb9xV_ikDAWfF+8H7aOSK4VF8UmqWRDAQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQSoz-00GLug-Ja
Subject: Re: [f2fs-dev] [PATCH] f2fs: issue discard commands proactively in
 high fs utilization
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/14 13:39, Ju Hyung Park wrote:
> On Wed, May 30, 2018 at 5:51 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>
>> In the high utilization like over 80%, we don't expect huge # of large discard
>> commands, but do many small pending discards which affects FTL GCs a lot.
>> Let's issue them in that case.
>>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> ---
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 6e40e536dae0..8c1f7a6bf178 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -915,6 +915,38 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
>> +                       dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
> 
> Isn't this way too aggressive?
> 
> Discard thread will wake up on 50ms interval just because the user has
> used 80% of space.
> 60,000ms vs 50ms is too much of a stark difference.
> 
> I feel something like 10 seconds(10,000ms) could be a much more
> reasonable choice than this.

Hmm.. I agree that current hard code method is not flexible enough, and I
proposed below patch last year to adjust interval according to space usage, it
looks Jaegeuk partially agreed with that, and pointed out we need to distinguish
low/high-end storage to decide interval. And also you point out that btrfs
introduces mount option "ssd" to let user give the device type, and we can
distinguish with that. :P

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=f2fs-dev&id=009f548e37ca5d9b4cad9e3c15c2164c53eff1df

But I pended below patch based on Jaegeuk's and your idea due to other work...

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=f2fs-dev&id=47a992c12398c98e739e3eedc2743824459df943

Thanks,

> 
> Thanks.
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
