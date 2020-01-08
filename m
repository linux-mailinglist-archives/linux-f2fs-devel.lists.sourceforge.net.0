Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1F133D59
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 09:38:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ip6r1-000498-65; Wed, 08 Jan 2020 08:38:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ip6qw-00048G-9p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 08:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EQt1wxLyAU1s/L889vEzKzjJ+77ZF7YpKi/7oT1Eih0=; b=WbOJ4HnjBjv4G8vfwksjfpBUAp
 YT8cLUuj7XUjeQP0Spe+s+7ie+JxKIEYh0h6Kp9EOImtl6/VE7zfaXHGeMqc8u/3zEmGeIVNo5U8y
 0r79YTrc1vhMzeWjSPZ/nljjFooAObufjxdRlpEpiaqqvFdn651dDvo6gim06nzcjI6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EQt1wxLyAU1s/L889vEzKzjJ+77ZF7YpKi/7oT1Eih0=; b=O86Xrraw/jOcmiDsNZE+Zj3Q4q
 mXnZMRcsUXK5Wvv5Fguk2AqjvHf2arkTLbv6/j2yuRskymWb3XGZwypiyt5ZKNkhhncbbO5Q2lRMI
 uFsTPQVTrKcaSzyAIyzOU5e9zS3dxMPmCFW7hgoBnks/ep7tufQC29sFaqsFf1E13tPM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ip6qp-00D79w-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 08:38:10 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8F768DF273F778ADA5C4;
 Wed,  8 Jan 2020 16:37:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020
 16:37:53 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
 <e773d576-9458-48d7-bad4-dd4f8c61ebd3@huawei.com>
 <20200106184017.GD50058@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7cf85056-ef3f-b78c-e7cf-8cce5d5ef1ee@huawei.com>
Date: Wed, 8 Jan 2020 16:37:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200106184017.GD50058@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ip6qp-00D79w-Lj
Subject: Re: [f2fs-dev] Multidevice f2fs mount after disk rearrangement
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
Cc: linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/1/7 2:40, Jaegeuk Kim wrote:
> On 01/06, Chao Yu wrote:
>> Hello,
>>
>> Thanks for the report. :)
>>
>> On 2020/1/5 5:52, Oleksandr Natalenko via Linux-f2fs-devel wrote:
>>> Hi.
>>>
>>> On 04.01.2020 17:29, Oleksandr Natalenko wrote:
>>>> I was brave enough to create f2fs filesystem spanning through 2
>>>> physical device using this command:
>>>>
>>>> # mkfs.f2fs -t 0 /dev/sdc -c /dev/sdd
>>>>
>>>> It worked fine until I removed /dev/sdb from my system, so f2fs devices 
>>>> became:
>>>>
>>>> /dev/sdc -> /dev/sdb
>>>> /dev/sdd -> /dev/sdc
>>>>
>>>> Now, when I try to mount it, I get the following:
>>>>
>>>> # mount -t f2fs /dev/sdb /mnt/fs
>>>> mount: /mnt/fs: mount(2) system call failed: No such file or directory.
>>>>
>>>> In dmesg:
>>>>
>>>> [Jan 4 17:25] F2FS-fs (sdb): Mount Device [ 0]:             /dev/sdc,
>>>>   59063,        0 -  1cd6fff
>>>> [  +0,000024] F2FS-fs (sdb): Failed to find devices
>>>>
>>>> fsck also fails with the following assertion:
>>>>
>>>> [ASSERT] (init_sb_info: 908) !strcmp((char *)sb->devs[i].path, (char
>>>> *)c.devices[i].path)
>>>>
>>>> Am I doing something obviously stupid, and the device path can be
>>>> (somehow) changed so that the mount succeeds, or this is unfixable,
>>>> and f2fs relies on persistent device naming?
>>>>
>>>> Please suggest.
>>>>
>>>> Thank you.
>>>
>>> Erm, fine. I studied f2fs-tools code a little bit and discovered that 
>>> superblock indeed had /dev/sdX paths saved as strings. So I fired up 
>>> hexedit and just changed the superblock directly on the first device, 
>>> substituting sdc with sdb and sdd with sdc (I did it twice; I guess 
>>> there are 2 copies of superblock), and after this the mount worked.
>>
>> Alright, it works if superblock checksum feature is off...
>>
>>>
>>> Am I really supposed to do this manually ;)?
>>
>> We'd better add that ability in tune.f2fs. And I guess we need to let
>> kernel/fsck to notice that case, and give hint to run tune.f2fs to
>> reconfigure primary/secondary/... device paths.
> 
> I'm thinking to add tunesb.f2fs to edit superblock explicitly, since it has
> to edit it without getting superblock/checkpoint and other f2fs metadata.
> 
> For example,
> # tunesb.f2fs -c /dev/sdb -c /dev/sdc /dev/sda
> .. superblock info ..
> .. device list ..
> .. hot/cold extensions ..
> 
> Will modify the device list, if it's different from parameter.

Looks good to me.

Thanks,

> 
>>
>> Thanks,
>>
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
