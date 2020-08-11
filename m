Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C53612417A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 09:55:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5P7d-0008TE-44; Tue, 11 Aug 2020 07:55:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k5P7Z-0008T4-67
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 07:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJxJMXpL8FAh8yqZw5qBGrPl+15ih7Hak2L8RJJWcuU=; b=GvWfnnHKETOnP/lWK/od7FhMlc
 l5wG1jXnA07VB3htqkGY5zZBGnqb7vrSTT56SvFpbeDDzYpiC2TbaaZ4vN7asF7+UGeK/InRx3bGI
 5Sj2ti1g1ZjZc5RtF8KpE9cRI9ifBLl5yowyGd0upYvk8EnFhcLPeUiZbK6dakQzP1z4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NJxJMXpL8FAh8yqZw5qBGrPl+15ih7Hak2L8RJJWcuU=; b=BzLm67kc67oRmnUb/ZroAS71xu
 NiY6sqxeQPBBKYFRiKJJefMEdcjCYeRkrOfLvaFtdeTdXcvVyGI2t3TJ86R6pVIDPMez636MVMt9a
 e4aCqt4fJjwaMqmfeOwUYQg9zUvnkBv1EVyRegr7W7jZhGX+G3ApPbEj8becQNJaS8AY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5P7V-007gWA-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 07:54:57 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7D23CB3EBB3893400E5D;
 Tue, 11 Aug 2020 15:54:40 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 11 Aug
 2020 15:54:35 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
Date: Tue, 11 Aug 2020 15:54:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200811071552.GA8365@xiangao.remote.csb>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k5P7V-007gWA-Ar
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net,
 Gao Xiang <hsiangkao@redhat.com>, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/11 15:15, Gao Xiang wrote:
> On Tue, Aug 11, 2020 at 12:37:53PM +0900, Daeho Jeong wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> By profiling f2fs compression works, I've found vmap() callings are
>> bottlenecks of f2fs decompression path. Changing these with
>> vm_map_ram(), we can enhance f2fs decompression speed pretty much.
>>
>> [Verification]
>> dd if=/dev/zero of=dummy bs=1m count=1000
>> echo 3 > /proc/sys/vm/drop_caches
>> dd if=dummy of=/dev/zero bs=512k
>>
>> - w/o compression -
>> 1048576000 bytes (0.9 G) copied, 1.999384 s, 500 M/s
>> 1048576000 bytes (0.9 G) copied, 2.035988 s, 491 M/s
>> 1048576000 bytes (0.9 G) copied, 2.039457 s, 490 M/s
>>
>> - before patch -
>> 1048576000 bytes (0.9 G) copied, 9.146217 s, 109 M/s
>> 1048576000 bytes (0.9 G) copied, 9.997542 s, 100 M/s
>> 1048576000 bytes (0.9 G) copied, 10.109727 s, 99 M/s
>>
>> - after patch -
>> 1048576000 bytes (0.9 G) copied, 2.253441 s, 444 M/s
>> 1048576000 bytes (0.9 G) copied, 2.739764 s, 365 M/s
>> 1048576000 bytes (0.9 G) copied, 2.185649 s, 458 M/s
> 
> Indeed, vmap() approach has some impact on the whole
> workflow. But I don't think the gap is such significant,
> maybe it relates to unlocked cpufreq (and big little
> core difference if it's on some arm64 board).

Agreed,

I guess there should be other reason causing the large performance
gap, scheduling, frequency, or something else.

> 
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
