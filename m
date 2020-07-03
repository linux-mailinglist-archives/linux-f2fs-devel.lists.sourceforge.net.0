Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C647921313D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 04:02:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrB2J-0001u5-Ax; Fri, 03 Jul 2020 02:02:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jrB2C-0001tK-3z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qrt6ktu9VsCsUj9oWxHlekCG8cnAkfnNL7LRjxGez8g=; b=T28s+KtC3Go8BfSKL0y79yoxGo
 EaQ6NcN4M2vxKCXd4ZkNUckQsppCfUXCpUpxssPxQoCqX7WxjiYsgpT75sQn+kkhWaJa+896w2X1O
 3DSe4PdGVGaQ09dA9+rNwMG7Bute+J0ERzstd65pmwdHE9fk0vT/MOHQmMZtiXAJtPFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qrt6ktu9VsCsUj9oWxHlekCG8cnAkfnNL7LRjxGez8g=; b=MFpH4DuuB9gEtYNxGGX5FzRv1M
 jowxPV2ecjepxhuIaKVqY8tfnfWtkv8Rsd+qHUbXRDV3VZWUl0sEJD+jcmDeqKUWuL3WbY2vfkcpH
 mislGHLuj8DONE7GJF1oxCr2kS9QHLe2uEJzsPq59I7+e6C046ZALVOwv3epjMg8SSuY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrB2A-00BSrw-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:02:36 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BA02E231593B7C3B0C58;
 Fri,  3 Jul 2020 10:02:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 3 Jul 2020
 10:02:26 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200630005625.2405062-1-daeho43@gmail.com>
 <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
 <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
 <9d1afacc-6033-2bae-d55d-909d50f1904b@huawei.com>
 <CACOAw_zFLgeoomdHhRmzYMtCocTugW5AVxb2wZnoRAC9+hR9Gw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ee97fa6e-33df-04f9-ec37-6b7d7b495acb@huawei.com>
Date: Fri, 3 Jul 2020 10:02:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_zFLgeoomdHhRmzYMtCocTugW5AVxb2wZnoRAC9+hR9Gw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrB2A-00BSrw-Cw
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/1 20:12, Daeho Jeong wrote:
>> On 2020/7/1 15:04, Daeho Jeong wrote:
>>> Actually, I want to keep the mount number remaining to the same
>>> number, even if it's re-mounted.
>>
>> Then once there is f2fs umounter, the order will be incorrect...
> 
> Actually, we prepared this patch for a strictly controlled system like
> Android to easily access the sysfs node for a specific partition like
> userdata partition using a specific number.

I'm not against Android defined interfaces, just be confused about the
behavior that does not fully documented (at least, we should add this
into f2fs doc, and specify this is android specified interface), something
like once one mount point was umounted, that sequential number @x in
'mount_@x" could be reused by later newly mounted point, it breaks the
description: "in the order of mounting filesystem".

> In this system, we don't worry about another unexpected f2fs umounter
> interfering in between unmounting and mounting a partition.
> 
> When we are under the condition that we can keep track of how many
> times the userdata partition has been re-mounted, we might as well use
> the original partition name like "/sys/fs/f2fs/dm-9".
> This is for when we couldn't do that.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
