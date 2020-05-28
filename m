Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB91E52E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 03:23:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je7H2-0003wi-8e; Thu, 28 May 2020 01:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1je7H0-0003wL-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 01:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=teyqHTbf2d397UdYdiP+zuzDune1ce474Ew51zbEk8A=; b=Uz/uFfhAbsG/Ju0rrH8TbQF3Dp
 djU7XXPn15yYMVbjO5BR5srXYTTKuH/K8k8XNxL25WQNUh14vRE3Q5Qq2JESrM78qrX5Pm/Xb78jg
 BKqS48sarYDXvH0TJp8PmvqB1MpuP7Qx6iqBV2Hd9wzvwN01PiXQtmIBOvFET2tW1ens=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=teyqHTbf2d397UdYdiP+zuzDune1ce474Ew51zbEk8A=; b=kqVxpnWAceUAq7OywVWw4kvLNO
 GifCp998WNgBO/U36XdC7g1VNWlJKG47v5Gw7EIXDZ+GneWCcjHCOHXnY/Y9LANow7Vjz2bAUz6Ap
 YNB5BCc3T3hZjeRaAJrngDlI0au0VsmaYmG5PDqnRLS3qT1G9/3WerGtZ5GFGvT/1ZHM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1je7Gx-00A5JK-SW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 01:23:54 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3C1F627917DD431B090D;
 Thu, 28 May 2020 09:23:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 28 May
 2020 09:23:44 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200527102753.15743-1-yuchao0@huawei.com>
 <20200527102753.15743-3-yuchao0@huawei.com>
 <20200527210233.GC206249@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <23245f6e-528d-43ab-57b6-4ca16db43fe5@huawei.com>
Date: Thu, 28 May 2020 09:23:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200527210233.GC206249@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1je7Gx-00A5JK-SW
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to cover meta flush with
 cp_lock
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

On 2020/5/28 5:02, Jaegeuk Kim wrote:
> On 05/27, Chao Yu wrote:
>> meta inode page should be flushed under cp_lock, fix it.
> 
> It doesn't matter for this case, yes?

It's not related to discard issue.

Now, I got some progress, I can reproduce that bug occasionally.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/file.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index f7de2a1da528..0fcae4d90074 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2260,7 +2260,9 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>>  		break;
>>  	case F2FS_GOING_DOWN_METAFLUSH:
>> +		mutex_lock(&sbi->cp_mutex);
>>  		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
>> +		mutex_unlock(&sbi->cp_mutex);
>>  		f2fs_stop_checkpoint(sbi, false);
>>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>>  		break;
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
