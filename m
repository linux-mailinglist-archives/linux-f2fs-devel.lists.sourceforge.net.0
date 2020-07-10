Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECA21B03D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 09:33:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtnXT-0002WD-1T; Fri, 10 Jul 2020 07:33:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtnXR-0002W5-IA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yV0nTiSqJps32Q0xdfdL8k4uBP/bIjCTkj7V3Jje/0w=; b=IgonEpad6hFXYcQlYbxqzlAQoV
 drSbd+tXMY1ZTcYp7TazBXnA8Eo7LLgkIWpypYaXYiAdY8S1iIfHT1Iyej69aQO1rcCdZZXYfseot
 H1j3EuhAT614fImuZNB0U1hzVyQ+UxQ6ySM/eIJRWU4E9kUikBPrrm31dUqwx7nV/2YI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yV0nTiSqJps32Q0xdfdL8k4uBP/bIjCTkj7V3Jje/0w=; b=Xg/8Yi74NUbAMMM3LfgvSOo9Pj
 JEB8L1q2JMoUkaD6hVwI3ro3zaQE1xZ8DWcKSXf0tx1NzRMn14tpLAiSOZuPzt9ZwHHhdZIZTmwpO
 ibKEk1jzjhmij3neEkkJekol8B14sRRjtQ6LIuQB7BjG6d1F25ytOEjMWM9TIB5fhhtQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtnXQ-00Fwck-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:33:41 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 860CA9FEEA3298C31838;
 Fri, 10 Jul 2020 15:33:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 15:33:25 +0800
To: Gao Xiang <hsiangkao@aol.com>
References: <20200710023019.GD2916@codeaurora.org>
 <dcb68985-d621-6ef1-7452-172280148aa1@huawei.com>
 <20200710030257.GA5695@hsiangkao-HP-ZHAN-66-Pro-G1>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <75395901-4996-abc5-90ba-41a8fa4a1634@huawei.com>
Date: Fri, 10 Jul 2020 15:33:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710030257.GA5695@hsiangkao-HP-ZHAN-66-Pro-G1>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtnXQ-00Fwck-8Z
Subject: Re: [f2fs-dev] IO hang due to f2fs checkpoint and writeback stuck
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 11:02, Gao Xiang wrote:
> On Fri, Jul 10, 2020 at 10:54:13AM +0800, Chao Yu wrote:
>> Hi Sahitya,
>>
>> It looks block plug has already been removed by Jaegeuk with
>> below commit:
>>
>> commit 1f5f11a3c41e2b23288b2769435a00f74e02496b
>> Author: Jaegeuk Kim <jaegeuk@kernel.org>
>> Date:   Fri May 8 12:25:45 2020 -0700
>>
>>     f2fs: remove blk_plugging in block_operations
>>
>>     blk_plugging doesn't seem to give any benefit.
>>
>> How about backporting this patch?
> 
> Yeah, also notice that
> 
> commit bd900d4580107c899d43b262fbbd995f11097a43
> Author: Jens Axboe <jaxboe@fusionio.com>
> Date:   Mon Apr 18 22:06:57 2011 +0200
> 
>     block: kill blk_flush_plug_list() export
> 
>     With all drivers and file systems converted, we only have
>     in-core use of this function. So remove the export.
> 
>     Reporteed-by: Christoph Hellwig <hch@lst.de>
>     Signed-off-by: Jens Axboe <jaxboe@fusionio.com>
> 
> blk_flush_plug_list() is not an exported symbol for now except for in-core use,
> as well as blk_flush_plug().

Thanks for the reminder. :)

> 
> Thanks,
> Gao Xiang
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
