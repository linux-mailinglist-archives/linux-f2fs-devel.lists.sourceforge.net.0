Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8E25D1D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kE5sz-00013c-8n; Fri, 04 Sep 2020 07:11:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kE5sx-00013V-OH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Sep 2020 07:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YzjkDwC/rgAQLUcQwgG+TisYQ0b3C5xranMO+VXF/eU=; b=Q6+rCeq2FceLhrX9st7qimV7NZ
 VlDwsezCxD6BoYgS+biRElUXrPSLHJxD0Q6SHV9hb1oSBG77iEz7j3pBbyXk6WdnXK/VrbwpfjHA5
 Ykfe9XNq0tC7aKgdM/DY6Zj49jNyupvx+9v6JoOYTTz8SIyDPPdUTWqXe8yu0+ucD6uQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YzjkDwC/rgAQLUcQwgG+TisYQ0b3C5xranMO+VXF/eU=; b=ScSzJjeXeLjo7vHxptOzmuTMrW
 8SeEU0yTd7cYw89LZIaEkgSRKPa7Vy1SDeV5j1kMiaxYc3FgCGLePrHL6ak3HfUC/k0JyaAjG0sDA
 4hzhjEIOZ/7tUZQ1uAVfg4MH6Ri21AXO+isnEetnVoeZp8TvxflAIKzmwsibTTKPoRKs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kE5su-00BZlu-EF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Sep 2020 07:11:47 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6F775E2F219C921F5B33;
 Fri,  4 Sep 2020 15:11:28 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Sep 2020
 15:11:27 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200812051711.2147716-1-daeho43@gmail.com>
 <b201452d-b1dd-146c-3a1a-c199d9a5974c@huawei.com>
Message-ID: <f7de60a9-c1bc-1c45-1d1e-e6c79406a387@huawei.com>
Date: Fri, 4 Sep 2020 15:11:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b201452d-b1dd-146c-3a1a-c199d9a5974c@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kE5su-00BZlu-EF
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

Hi Daeho,

Could you please clean up a bit on this patch, we can wrap vm_map_ram
loop logic into f2fs_vmap() as below:

f2fs_vmap()
{
	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
		cc->cbuf = vm_map_ram(cc->cpages, cc->nr_cpages, -1);
		if (cc->cbuf)
			break;
		vm_unmap_aliases();
	}
}

How do you think of this?

Thanks,

On 2020/8/13 17:09, Chao Yu wrote:
> On 2020/8/12 13:17, Daeho Jeong wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> By profiling f2fs compression works, I've found vmap() callings have
>> unexpected hikes in the execution time in our test environment and
>> those are bottlenecks of f2fs decompression path. Changing these with
>> vm_map_ram(), we can enhance f2fs decompression speed pretty much.
>>
>> [Verification]
>> Android Pixel 3(ARM64, 6GB RAM, 128GB UFS)
>> Turned on only 0-3 little cores(at 1.785GHz)
>>
>> dd if=/dev/zero of=dummy bs=1m count=1000
>> echo 3 > /proc/sys/vm/drop_caches
>> dd if=dummy of=/dev/zero bs=512k
>>
>> - w/o compression -
>> 1048576000 bytes (0.9 G) copied, 2.082554 s, 480 M/s
>> 1048576000 bytes (0.9 G) copied, 2.081634 s, 480 M/s
>> 1048576000 bytes (0.9 G) copied, 2.090861 s, 478 M/s
>>
>> - before patch -
>> 1048576000 bytes (0.9 G) copied, 7.407527 s, 135 M/s
>> 1048576000 bytes (0.9 G) copied, 7.283734 s, 137 M/s
>> 1048576000 bytes (0.9 G) copied, 7.291508 s, 137 M/s
>>
>> - after patch -
>> 1048576000 bytes (0.9 G) copied, 1.998959 s, 500 M/s
>> 1048576000 bytes (0.9 G) copied, 1.987554 s, 503 M/s
>> 1048576000 bytes (0.9 G) copied, 1.986380 s, 503 M/s
>>
>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
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
