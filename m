Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD562332D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 14:06:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSh3L-0000mF-K2; Mon, 20 May 2019 12:06:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hSh3J-0000m7-N6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 12:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQIwh2YQByKXp5cf2XhCzNLJymskpID1ZoSk9BYjw7I=; b=IvfQlyK6wnehiCf77X4eidXf8v
 h+Gyf6XIZ1oKh9sJU4osKH/HgMFU2EbibOFBWK//FTva8UrC15mx9uaK9/v23kRxaooEVN+evYB+V
 v9BNOGRG0EQKTUl2XUp6drslzZrIP2gPH7zliwYZXxyorPdj5lBfS/9q6a4zgCNGA3xI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQIwh2YQByKXp5cf2XhCzNLJymskpID1ZoSk9BYjw7I=; b=IGB7Z3BoHmEFofSfK/Md5nY2H8
 QXiFh5maNwoJ0repZWRZFvgfkKb+MNxJu+haFPVdQTVdUvSwPu40ZgKh/JUw8NV9AEJqyhw5pMPiQ
 tsyBQLlqWL30D4Lz7kS8BpslL34OOOlXrS1EoH2nvmTBFkxI3sik8zT7lRGySkO8nyeY=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSh34-00Gzul-BU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 12:06:01 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 0FF453AF2DC1640FA183;
 Mon, 20 May 2019 20:05:39 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 May 2019 20:05:38 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 20 May 2019 20:05:37 +0800
To: Matthew Wilcox <willy@infradead.org>, sunqiuyang <sunqiuyang@huawei.com>
References: <20190517021647.43083-1-sunqiuyang@huawei.com>
 <20190517025628.GF31704@bombadil.infradead.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ce0b747e-6e3d-6285-7f20-f4ecd6c4df6c@huawei.com>
Date: Mon, 20 May 2019 20:05:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190517025628.GF31704@bombadil.infradead.org>
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
X-Headers-End: 1hSh34-00Gzul-BU
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 fangwei1@huawei.com, linux-fsdevel@vger.kernel.org, miaoxie@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/17 10:56, Matthew Wilcox wrote:
> On Fri, May 17, 2019 at 10:16:47AM +0800, sunqiuyang wrote:
>> +++ b/fs/f2fs/f2fs.h
>> @@ -423,6 +423,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>>  #define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
>>  #define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
>>  #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
>> +#define F2FS_IOC_SHRINK_RESIZE		_IOW(F2FS_IOCTL_MAGIC, 16,	\
>> +						struct f2fs_resize_param)
> 
> Why not match ext4?
> 
> fs/ext4/ext4.h:#define EXT4_IOC_RESIZE_FS               _IOW('f', 16, __u64)

Agreed, Qiuyang, could you consider to implement this interface as ext4's, in
addition, changing parameter from shrunk bytes to new block count of fs?

F2FS_IOC_RESIZE_FS		_IOW('f', 16, __u64)

if (copy_from_user(&block_count, (__u64 __user *)arg, sizeof(__u64)))

Thanks,

> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
