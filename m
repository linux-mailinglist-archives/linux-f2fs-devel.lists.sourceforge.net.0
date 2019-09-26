Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D04EBE9E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2019 03:04:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDICv-0003hc-8e; Thu, 26 Sep 2019 01:04:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iDICt-0003hU-5d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 01:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wUrqrTW62iTqvTb7ukSGpNHlEeDemvHqIo+BU0BCVQ=; b=QV7ZsnT6udhV5CwAO0+X40r7IA
 XqeKlmv3cXChVNuOrOQk+zQ/DxzS2ZV8TEJTxaoapgdeFvRpYxC5FAvMDnm6KhKToV9W4jA8O0tK6
 w7Mq5UxYQOMY3PWrz6vWSg12E2hRhxArAuQxJtskKRCmMPcUOFq9MQ1LtMs+JMo/ufrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3wUrqrTW62iTqvTb7ukSGpNHlEeDemvHqIo+BU0BCVQ=; b=fg13MHHOvgIpfStkInChsfBLSi
 qaHkf+yD0IU+cWKG0LnQXs5OPd1eKOC2MN+EWpE8k5EVhri5khGPsiMC57LkQ4gbybHEE53EVYoxP
 wf/53i/pEcZVVTd7koced5lGPCtQTeMLHDsxrAFenLqaR6BP4rSsAyUdkss+7b3pjSQw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDICo-006zni-Rh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 01:04:30 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C9C7AF081E2BB4CD68B6;
 Thu, 26 Sep 2019 09:04:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 26 Sep
 2019 09:04:12 +0800
To: Gao Xiang <gaoxiang25@huawei.com>
References: <20190925093050.118921-1-yuchao0@huawei.com>
 <20190925134706.GA157912@architecture4>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4f1a7400-04d3-ff1e-3ea0-cf5b95af972c@huawei.com>
Date: Thu, 26 Sep 2019 09:04:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190925134706.GA157912@architecture4>
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
X-Headers-End: 1iDICo-006zni-Rh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix comment of f2fs_evict_inode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/25 21:47, Gao Xiang wrote:
> Hi Chao,
> 
> On Wed, Sep 25, 2019 at 05:30:50PM +0800, Chao Yu wrote:
>> evict() should be called once i_count is zero, rather than i_nlinke
>> is zero.
>>
>> Reported-by: Gao Xiang <gaoxiang25@huawei.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/inode.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index db4fec30c30d..8262f4a483d3 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -632,7 +632,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>>  }
>>  
>>  /*
>> - * Called at the last iput() if i_nlink is zero
>> + * Called at the last iput() if i_count is zero
> 
> Yeah, I'd suggest taking some time to look at other
> inconsistent comments, it makes other folks confused
> and ask me with such-"strong" reason...

Xiang, I'm looking into it, will fix those inconsistent comments in another
patch, please wait a while. ;)

Thanks,

> 
> Thanks,
> Gao Xiang
> 
>>   */
>>  void f2fs_evict_inode(struct inode *inode)
>>  {
>> -- 
>> 2.18.0.rc1
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
