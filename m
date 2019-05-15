Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40F1E6D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 04:25:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQjbu-0005ha-QF; Wed, 15 May 2019 02:25:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hQjbt-0005hT-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s4zUowdYYUVobnu2XfHhNcWQZmtiYH6BNcIhiBUEWkI=; b=DA/kg/pihjxBrtSeOr8edo59r/
 MMImUK2GQhU4mcMvTay9Xsb2sf+XQfaju0L7R/siFw+Mc0oaypfIdRHjqV7BiaZ0NF3E7bS3IccFb
 zBlm6/3QpLkZaxniXjEey5ufSgKLRZhcy7HfL9b4HFxsDl3Cd152xSRA5YKXlcwidsvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s4zUowdYYUVobnu2XfHhNcWQZmtiYH6BNcIhiBUEWkI=; b=b/rucnjXX07+0aqH97IWQJtZ8z
 W1elacz+oiQs+2Pec+U/YYcGV3renqM32A3v/9PWt4hZ6tumsD5QSI8NKbOFizd3eV61B2AfEMBZd
 NXlyF75bRoOdxPctBFQT1VqAGWonxnuSiVi60b17afdin/uDZKXHYf4JFtsn+M/lgdKY=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQjbr-004AIj-TQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:25:37 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 4714986C11D6C9B5CA65;
 Wed, 15 May 2019 10:25:28 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 May 2019 10:25:28 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 15 May 2019 10:25:27 +0800
To: Hagbard Celine <hagbardcelin@gmail.com>, Chao Yu <chao@kernel.org>
References: <CADoWrG_NTz29eyaa3fUti2sNBP4xp7-zfhDVkix=Kty4rD=Otw@mail.gmail.com>
 <35b643e5-562c-942d-67ce-4a9dbef66d16@huawei.com>
 <5725124a-95c8-cedb-d3a8-d8be86d260dd@huawei.com>
 <CADoWrG9_5izaUMvB0mNLC7yp_Mnnm7yPrqcOvDL2ERR2YrkF2A@mail.gmail.com>
 <452dad75-a4aa-2366-b704-ee5448a3bd71@huawei.com>
 <CADoWrG9V7nD4wzj0DFDAKcjcZHhjC0yPetX_Ce6jj2_YNpU9YA@mail.gmail.com>
 <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
 <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f657d41f-84d6-8cfa-5532-689a03ab2d2e@huawei.com>
Date: Wed, 15 May 2019 10:25:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQjbr-004AIj-TQ
Subject: Re: [f2fs-dev] BUG: kernel stack overflow when mounting with
 data_flush
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/15 2:13, Hagbard Celine wrote:
> 2019-04-02 15:31 GMT+02:00, Chao Yu <chao@kernel.org>:
>> On 2019-4-2 20:41, Hagbard Celine wrote:
>>> That seems to have fixed it. No more errors in syslog after extracting
>>> my stage3 tarball. Also ran a couple of kernel compiles on a partition
>>> mounted with data_flush and system seems stable.
>>
>> Thanks a lot for your quick test. :)
> 
> My test might have been a little too quick, or I found another
> data_flush bug that behaves similar.

oops...

>>>>
>>>> -		if (is_dir)
>>>> -			F2FS_I(inode)->cp_task = current;
>>>> +		F2FS_I(inode)->cp_task = current;

If you're sure that this patch was applying before you test, I guess we need an
extra barrier here to avoid out-of-order execution.

smp_mb()

>>>>
>>>>  		filemap_fdatawrite(inode->i_mapping);
>>>>
>>>> -		if (is_dir)
>>>> -			F2FS_I(inode)->cp_task = NULL;
>>>> +		F2FS_I(inode)->cp_task = NULL;

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
