Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27043243755
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Aug 2020 11:10:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k69FM-0005tZ-0F; Thu, 13 Aug 2020 09:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k69FJ-0005tM-WF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Aug 2020 09:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOr3bFdmslfwW9bHK9RKFoTvtfidsW2MjLXkyEkIf4Q=; b=ErUhH0SL6oSurxIdwc9XaJMC6H
 RN0xMc/YOD/v7FFMmQ5K514AQFrD54z2d7MNc3RTPp1G/0NBYqWmhPur4gcqWzara64W27Wuogtke
 VV4ctwEv7KMSDArsws9m/tS0IcpOSIYl2jKu0RgiC8FrRuuxbjwUeupVipmFenQLxm9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nOr3bFdmslfwW9bHK9RKFoTvtfidsW2MjLXkyEkIf4Q=; b=KzR+VmVHRZq8yM2zg+QxXNE2bj
 ISDdOmkjfY5E5CNfma1JeerPE2QbpZQP69rf6qmIDchq0/7PPdpEuej8TiOXzmwMk7BZJpXBt1oAI
 oQR5Xs1iupiDOUqsw/YICa66M8oGiiKOXyo9K6jz8GW7l16UJdHDTtgXlWBNOooWopoY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k69FH-004W0s-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Aug 2020 09:10:01 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9C59BBD47B20F3BD603B;
 Thu, 13 Aug 2020 17:09:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 13 Aug
 2020 17:09:47 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200812051711.2147716-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b201452d-b1dd-146c-3a1a-c199d9a5974c@huawei.com>
Date: Thu, 13 Aug 2020 17:09:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812051711.2147716-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k69FH-004W0s-Tu
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change virtual mapping way for
 compression pages
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/12 13:17, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> By profiling f2fs compression works, I've found vmap() callings have
> unexpected hikes in the execution time in our test environment and
> those are bottlenecks of f2fs decompression path. Changing these with
> vm_map_ram(), we can enhance f2fs decompression speed pretty much.
> 
> [Verification]
> Android Pixel 3(ARM64, 6GB RAM, 128GB UFS)
> Turned on only 0-3 little cores(at 1.785GHz)
> 
> dd if=/dev/zero of=dummy bs=1m count=1000
> echo 3 > /proc/sys/vm/drop_caches
> dd if=dummy of=/dev/zero bs=512k
> 
> - w/o compression -
> 1048576000 bytes (0.9 G) copied, 2.082554 s, 480 M/s
> 1048576000 bytes (0.9 G) copied, 2.081634 s, 480 M/s
> 1048576000 bytes (0.9 G) copied, 2.090861 s, 478 M/s
> 
> - before patch -
> 1048576000 bytes (0.9 G) copied, 7.407527 s, 135 M/s
> 1048576000 bytes (0.9 G) copied, 7.283734 s, 137 M/s
> 1048576000 bytes (0.9 G) copied, 7.291508 s, 137 M/s
> 
> - after patch -
> 1048576000 bytes (0.9 G) copied, 1.998959 s, 500 M/s
> 1048576000 bytes (0.9 G) copied, 1.987554 s, 503 M/s
> 1048576000 bytes (0.9 G) copied, 1.986380 s, 503 M/s
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
