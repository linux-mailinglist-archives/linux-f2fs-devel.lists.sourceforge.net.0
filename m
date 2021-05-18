Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40C386E85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 02:52:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1linyR-0002MX-54; Tue, 18 May 2021 00:52:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1linyP-0002MP-Kr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 00:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tyN99SmvEJQ8h5QqiOWXiJYIIL0lWdug7HM2jqFP7qw=; b=UueFNnUhwjbfQ6i66h2JhwN0mj
 Wv/OXfctfmSBAxQrDqzKSL7RvNNTENCU4OaHA5g4IvyX9SqO0PXUFqMtB6PBwVKMUWn/yu25gNIAu
 MTe/cWRL4Obc5sWIQFTwKl3S4v/ppxJlMqBV5hihLfRjjj9C/ZNwe8mS1nhbrQEXd5Ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tyN99SmvEJQ8h5QqiOWXiJYIIL0lWdug7HM2jqFP7qw=; b=aRBD6CiM5lKn1zHGaetizKAU6l
 JOzbj0fnhtIEeYyPF5n/9i1eBnflggvoFHnYW50gFkNu7/GGI8+Ip3G92sotuwZWIVZb0tDdh5PbJ
 K3kUFCk7iGB3z2dnWImABzdjVTK6ET63SrewZ0H1geGs+ofPWZYj2F3eUp8UiZX+WFz0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1linyK-00C40A-K8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 00:52:39 +0000
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fkcnf1R8QzmhFY;
 Tue, 18 May 2021 08:48:54 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 08:52:22 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 08:52:21 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20210517011557.21722-1-yuchao0@huawei.com>
 <YKKnkSag35cDXh0Z@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <be1af58d-fc5b-fab8-3be3-f90012c201f0@huawei.com>
Date: Tue, 18 May 2021 08:51:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YKKnkSag35cDXh0Z@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1linyK-00C40A-K8
Subject: Re: [f2fs-dev] [PATCH] f2fs: add MODULE_SOFTDEP to ensure crc32c is
 included in the initramfs
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
Cc: jaegeuk@kernel.org, marcosfrm <marcosfrm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/18 1:27, Eric Biggers wrote:
> On Mon, May 17, 2021 at 09:15:57AM +0800, Chao Yu wrote:
>> As marcosfrm reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=213089
>>
>> Initramfs generators rely on "pre" softdeps (and "depends") to include
>> additional required modules.
>>
>> F2FS does not declare "pre: crc32" softdep. Then every generator (dracut,
>> mkinitcpio...) has to maintain a hardcoded list for this purpose.
>>
>> Hence let's use MODULE_SOFTDEP("pre: crc32") in f2fs code.
>>
>> Fixes: 43b6573bac95 ("f2fs: use cryptoapi crc32 functions")
>> Reported-by: marcosfrm <marcosfrm@gmail.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/super.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 3f8a7a6c250c..fa0ce6301c16 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4431,4 +4431,5 @@ module_exit(exit_f2fs_fs)
>>   MODULE_AUTHOR("Samsung Electronics's Praesto Team");
>>   MODULE_DESCRIPTION("Flash Friendly File System");
>>   MODULE_LICENSE("GPL");
>> +MODULE_SOFTDEP("pre: crc32c");
> 
> Shouldn't it be crc32, not crc32c?

Thanks for the review, will fix.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
