Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF6E57E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Oct 2019 03:40:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOB3z-0006wA-11; Sat, 26 Oct 2019 01:40:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iOB3x-0006vu-AW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Oct 2019 01:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3v2ztA4o/sNwsRSW6c1lbqYpSCPTCS/itgoGRoKDk+M=; b=F36mIUhtjsDHb5Z7CR2EEB5OkL
 HmLQk8Wm6cwMzRMjhL2UIVhvdPh4aEhbFWodGbZa/Rvidi40+WO0Vi99qAEsw2P8YKgzVNEXb6Mh5
 IVFxIJN9q9nGN/As/HfvYskiMUB/adb6Xz86aAiu26JQTryd3fVSvmXbK1vabsMSnk6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3v2ztA4o/sNwsRSW6c1lbqYpSCPTCS/itgoGRoKDk+M=; b=XB39g4P1KKi/iGSf8it151KgjU
 nEpoVa1Goj9TlowkhMPA3FvEsAHZdScbFbohvG0N/Oiwcmgg2fe9BIKUYabi9L5qfQLp7kYlanMTX
 Q4MU/gTeL6q+lIEeoZ32phkveHD7bpS+TumyO3UiI9BFlu8TLxV1liCBA5tcDhWy1sok=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOB3v-00HOwg-1T
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Oct 2019 01:40:17 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C28C73ADE1FA7A9539E2;
 Sat, 26 Oct 2019 09:40:07 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 26 Oct
 2019 09:40:03 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191023214821.107615-1-hridya@google.com>
 <edc52873-b40d-5047-dba0-d693548eb16d@huawei.com>
 <20191025182325.GC24183@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6d09b590-053f-98ad-e628-2c352d989f01@huawei.com>
Date: Sat, 26 Oct 2019 09:40:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191025182325.GC24183@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iOB3v-00HOwg-1T
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: delete duplicate information on
 sysfs nodes
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Hridya Valsaraju <hridya@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/26 2:23, Jaegeuk Kim wrote:
> On 10/24, Chao Yu wrote:
>> On 2019/10/24 5:48, Hridya Valsaraju wrote:
>>> This patch merges the sysfs node documentation present in
>>> Documentation/filesystems/f2fs.txt and
>>> Documentation/ABI/testing/sysfs-fs-f2fs
>>> and deletes the duplicate information from
>>> Documentation/filesystems/f2fs.txt. This is to prevent having to update
>>> both files when a new sysfs node is added for f2fs.
>>> The patch also makes minor formatting changes to
>>> Documentation/ABI/testing/sysfs-fs-f2fs.
>>
>> Jaegeuk, any particular reason to add duplicated description on f2fs.txt previously?
> 
> Not at all, thus, I asked Hridya to consolidate them. :P

Alright...

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
