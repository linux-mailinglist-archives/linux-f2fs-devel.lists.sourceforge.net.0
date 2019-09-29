Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08542C1295
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2019 02:53:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iENSl-0003By-3k; Sun, 29 Sep 2019 00:53:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iENSj-0003Bi-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 00:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHpgl9UAq+4qBKlPfOpTOn53DnAbhz9q8IYnG+44Ixw=; b=KoMJFu6LvXZcwq5mpuOVTTx/hH
 8vTh7e8c2uMsAyC0natyAmQjV0rgwF3qh7uNOELQy3ChrQTTiDID84rQBuj5iEQpONXwjFdKqs1NJ
 ntTN8nxiMcwSV3YmxlOCE5a3blGTUaGWwjygprdOwpRnca5yNBezvSI9qqic2uAtVYXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SHpgl9UAq+4qBKlPfOpTOn53DnAbhz9q8IYnG+44Ixw=; b=mFFE7lWD9MPQ26fgvXpbWwY0fa
 G0HuF03YH6qFl6Qr+v8LnWMXpJjUBp/zIBH7+aq8FwHbvO3kM0AXT4HzifRSupjCWbg7pANoGV/Al
 dSoK3LCZoFbASiO7osZPAMxgbrJUso3lpFN2AwqI8B79uuuZfx3stEVZOAO1rXFERtLE=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iENSh-00AAj2-94
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 00:53:21 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4506EAA3CB7C4192E4B3;
 Sun, 29 Sep 2019 08:53:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sun, 29 Sep
 2019 08:53:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190925093050.118921-1-yuchao0@huawei.com>
 <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8c54adaf-163f-fcbe-7731-0c18b12410e0@huawei.com>
Date: Sun, 29 Sep 2019 08:53:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1iENSh-00AAj2-94
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2019/9/28 2:31, Jaegeuk Kim wrote:
> Hi Chao,
> 
> On 09/25, Chao Yu wrote:
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
> 
> I don't think this comment is wrong. You may be able to add on top of this.

It actually misleads the developer or user.

How do you think of:

"Called at the last iput() if i_count is zero, and will release all meta/data
blocks allocated in the inode if i_nlink is zero"

Thanks,

> 
>> + * Called at the last iput() if i_count is zero
>>   */
>>  void f2fs_evict_inode(struct inode *inode)
>>  {
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
