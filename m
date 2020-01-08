Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E3133DA6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 09:53:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ip75I-00008y-S4; Wed, 08 Jan 2020 08:53:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ip75E-000080-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 08:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UdfnUKV8GEPVho7FkEM0EiDyJ8Cns0mvBKHhVItfELA=; b=auvd609cRS69vMLwIUbeGWVq4W
 hiVCk8ENDJ1CBfl+bvWWFX521ttWHMf3r39lECds1bBchLfKNi/hriQ8A6IoEPddgSqT9APg7OUwf
 eGXsIJ93AfrAqo9VqlwvpVaTvL4TeF5IhGRtAspBn2grQqAWTH1kXQVtpJxjMNZ9yhaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UdfnUKV8GEPVho7FkEM0EiDyJ8Cns0mvBKHhVItfELA=; b=BrZmNmldUWWYxc76sbI6L569a5
 OlvNMctHrFRL10egrqQ+6ce5HJNEu7drTCnJDSlKygXq9k7tlCU2lZhALwwaQD6YYPW/oUjIfX3Vz
 3GRhfHt6fVrAtx98tKtpoqM2/uk6p8YFmCvtDm3nhraNTFsM+Jx2CiLmFe8D5QGOELdk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ip758-00DGsU-2G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 08:52:56 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A6AEBACE85B0BE60A8FB;
 Wed,  8 Jan 2020 16:52:39 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020
 16:52:36 +0800
To: Oleksandr Natalenko <oleksandr@natalenko.name>, Jaegeuk Kim
 <jaegeuk@kernel.org>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
 <20200106183450.GC50058@jaegeuk-macbookpro.roam.corp.google.com>
 <ee2cb1d7a6c1b51e1c8277a8feaafe6d@natalenko.name>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <815fbd14-0fbd-9c44-8d86-4ab13a12dc7f@huawei.com>
Date: Wed, 8 Jan 2020 16:52:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ee2cb1d7a6c1b51e1c8277a8feaafe6d@natalenko.name>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ip758-00DGsU-2G
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/1/7 2:40, Oleksandr Natalenko via Linux-f2fs-devel wrote:
> Hi.
> 
> On 06.01.2020 19:34, Jaegeuk Kim wrote:
>> Thank you for investigating this ahead of me. :) Yes, the device list 
>> is stored
>> in superblock, so hacking it manually should work.
>>
>> Let me think about a tool to tune that.
> 
> Thank you both for the replies.
> 
> IIUC, tune.f2fs is not there yet. I saw a submission, but I do not see 
> it as accepted, right?
> 
> Having this in tune.f2fs would be fine (assuming the assertion is 
> replaced with some meaningful hint message), but wouldn't it be more 
> convenient for an ordinary user to have implemented something like:
> 
> # mount -t f2fs /dev/sdb -o nextdev=/dev/sdc /mnt/fs

Hmm... sounds reasonable, however, the risk is obvious, if we mount with wrong
primary device, filesystem can be aware that with metadata sanity check, if we
mount with wrong secondary/... devices by mistake (or intentionally, people
may think filesystem should be aware illegal parameters....), filesystem won't
be aware of that, then metadata/data will be inconsistent...

Although that may also happen when we use tunesb.f2fs, but fsck.f2fs can be
followed to verify the modification of tunesb.f2fs, that would be much safer.

So I suggest we can do that in tools first, maybe implement nextdev mount option
if we have added metadata in secondary/... device.

Thanks,

> 
> Hm?
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
