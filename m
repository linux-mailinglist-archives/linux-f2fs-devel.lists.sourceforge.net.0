Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB60190596
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 07:13:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGcor-0001BL-9j; Tue, 24 Mar 2020 06:13:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGcoq-0001B9-5y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 06:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXgZh6cA45JnaDWrSFK6DuFNe7edN58cN2gV/jEcHuQ=; b=c6pdvgwox01T/ZSNi4b3wKRM7w
 razvYoFsV+GW+jWUx6NJS7R2vmb0PhAME9gchBoprgCnFGSx0bzNiWA+De0Zvj1NFFMlSxrikYj4/
 hotkT/wrS+ttb4QX3M+qa1wNpvZvuxmBEH4+MaKvDb02dnQP67zWqnuGX3P96ErDWUQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXgZh6cA45JnaDWrSFK6DuFNe7edN58cN2gV/jEcHuQ=; b=e/cX8UgFu/3UPPT6SEN78uZ1dZ
 ZiBlJkkMFNrsgRAlJrCch4IiRH2+/KF8HAAUqxzyfQ7wiM58O3+W1kl2gbkeiPZJLdzX1PfHTMyh1
 DpCaa9jv9Pu5yjUIZ9V67TAWaiRzxyfHVWzF16YxVWy9GDaqrDDlXQDkhSgR9xdDQaYA=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGcom-005N15-KE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 06:13:44 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 423F98E17D8711737378;
 Tue, 24 Mar 2020 14:13:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Mar
 2020 14:13:29 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Joe Perches <joe@perches.com>
References: <20200323031807.94473-1-yuchao0@huawei.com>
 <afa74570dacebb3b93d4b9c27d6c8a87186cef2d.camel@perches.com>
 <20200323151027.GA123526@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e811683f-8906-a152-5d76-cd284fca6a2f@huawei.com>
Date: Tue, 24 Mar 2020 14:13:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200323151027.GA123526@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGcom-005N15-KE
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix potential .flags overflow on
 32bit architecture
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

On 2020/3/23 23:10, Jaegeuk Kim wrote:
> On 03/23, Joe Perches wrote:
>> On Mon, 2020-03-23 at 11:18 +0800, Chao Yu wrote:
>>> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
>>> in 32bit architecture, since we introduced FI_MMAP_FILE flag
>>> when we support data compression, we may access memory cross
>>> the border of .flags field, corrupting .i_sem field, result in
>>> below deadlock.
>> []
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> []
>>> @@ -362,7 +362,7 @@ static int do_read_inode(struct inode *inode)
>>>  	fi->i_flags = le32_to_cpu(ri->i_flags);
>>>  	if (S_ISREG(inode->i_mode))
>>>  		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
>>> -	fi->flags = 0;
>>> +	bitmap_zero(fi->flags, BITS_TO_LONGS(FI_MAX));
>>
>> Sorry, I misled you here, this should be
>>
>> 	bitmap_zero(fi->flags, FI_MAX);

Oh, I missed to check that as well. :(

> 
> Thanks, I applied this directly in the f2fs tree.

Thanks for the help.

Thanks,

> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
