Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A622BB54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 03:22:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jymPs-0007bV-5t; Fri, 24 Jul 2020 01:22:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jymPr-0007bF-H2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OhczWMiOW/AVaGffc/ePybZL/TGt3D0olVFYNy3bjME=; b=hovv/fo6vJJOmczj8x/L2cgOI0
 ww1tF8xDL+hNpe+wiz2Ui9dH0vus01iHWHTQTFNwxpUE0w4tj8lzJMw+s8Vi0e6Ljry4PG7e6hmWK
 jVlrbkipLbkMstEKISWRn1CzW/X8oE94rZC68L5wmtzpB+l7MqIQc34r3oOve3tP5qrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OhczWMiOW/AVaGffc/ePybZL/TGt3D0olVFYNy3bjME=; b=Bty4TP9f8tDr8kNergphT1h/SW
 p1Jf6JZ4L9B6Xi0SRWUJCWmbnbxiiSpOWSKyzNp41CKJ9rBWAu9t2tm37eYyUBU8rkzwsn4Nz/VQl
 YxyGdOd2y8fUmlQhrblZutw/n+5hsjfrtGVCSlRV9rSMLLI66oPHkR3H8jrtGWirhR8A=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jymPp-006zVd-0I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:22:27 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2C112B95D81FDF460943;
 Fri, 24 Jul 2020 09:22:16 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 24 Jul
 2020 09:22:11 +0800
To: Song Feng <songfengcn@163.com>
References: <20200723102806.9662-1-yuchao0@huawei.com>
 <666af139.9663.1737c480519.Coremail.songfengcn@163.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <85b9af8d-0062-9c6b-0ad7-c48870a5cf2b@huawei.com>
Date: Fri, 24 Jul 2020 09:22:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <666af139.9663.1737c480519.Coremail.songfengcn@163.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jymPp-006zVd-0I
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free issue
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Feng,

Thanks for the reminder. :)

Jaegeuk, could you please fix this while merging.

Thanks,

On 2020/7/23 23:26, Song Feng wrote:
> At 2020-07-23 17:28:06, "Chao Yu" <yuchao0@huawei.com> wrote:
> 
>> From: Li Guifu <bluce.liguifu@huawei.com>
>>
>> During umount, f2fs_put_super() unregisters procfs entries after
>> f2fs_destroy_segment_manager(), it may cause use-after-free
>> issue when umount races with procfs accessing, fix it by relcating
> typo issue: relcating -> relocating?
>> f2fs_unregister_sysfs().
>>
>> [Chao Yu: change commit title/message a bit]
>>
>> Signed-off-by: Li Guifu <bluce.liguifu@huawei.com>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> fs/f2fs/super.c | 5 +++--
>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 80cb7cd358f8..bf8bd64c8380 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1175,6 +1175,9 @@ static void f2fs_put_super(struct super_block *sb)
>> 	int i;
>> 	bool dropped;
>>
>> +	/* unregister procfs/sysfs entries to avoid race case */
>> +	f2fs_unregister_sysfs(sbi);
>> +
>> 	f2fs_quota_off_umount(sb);
>>
>> 	/* prevent remaining shrinker jobs */
>> @@ -1240,8 +1243,6 @@ static void f2fs_put_super(struct super_block *sb)
>>
>> 	kvfree(sbi->ckpt);
>>
>> -	f2fs_unregister_sysfs(sbi);
>> -
>> 	sb->s_fs_info = NULL;
>> 	if (sbi->s_chksum_driver)
>> 		crypto_free_shash(sbi->s_chksum_driver);
>> -- 
>> 2.26.2
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> please check typo issue for comment: relcating->relocating?
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
