Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD5250FFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Aug 2020 05:34:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAPin-00080q-L9; Tue, 25 Aug 2020 03:34:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kAPim-00080d-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Aug 2020 03:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWvTt6qy5ggOADQeJEzvPgupO0oQ78LYIG10MmUuYE8=; b=Q1mngQ2vabCLbcnjQlEYTYWO/0
 MpZ41iCGMEVdwx4Uc9KIGsyNsPiIWShKH464205LAJGp0hOAA5zi0EvSjiGB8ealGxvKvyGnI0Pqb
 YIkeUswnBe7n5Z/7Mg8+8PLpTcid3LDu+dPyTe6NrBkDa1rurUcd1z4lwB9OR/iufWQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWvTt6qy5ggOADQeJEzvPgupO0oQ78LYIG10MmUuYE8=; b=iYhiK+GLRHxh5IB5qcdyh/YzLC
 CB9mUlpkZcB2zAiPiJOfKTpdjg1ZFngCxJE/Y7hf9JnrCRXSnB1Zj6yVaMGJiyTO5bt5/lZulKNpW
 hHtLu9G8silvvdccrgLnHOHYngc4pQP+HzWAQc0Y472SnEE5koA+E8n9fd5y5s7rfopI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAPik-002x0r-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Aug 2020 03:34:04 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 155CD2B7EB9394CDF4A6;
 Tue, 25 Aug 2020 11:33:44 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 25 Aug
 2020 11:33:38 +0800
To: Dan Robertson <dan@dlrobertson.com>
References: <20200821034732.18182-1-dan@dlrobertson.com>
 <20200821034732.18182-2-dan@dlrobertson.com>
 <a530a1fa-5cc3-5c32-1f19-f52603a17f27@huawei.com>
 <20200821125404.GA20793@nessie>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4d9a9230-5bb9-d568-448d-c09653547674@huawei.com>
Date: Tue, 25 Aug 2020 11:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200821125404.GA20793@nessie>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dlrobertson.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kAPik-002x0r-Gh
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: check output position in move
 range ioctl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/21 20:54, Dan Robertson wrote:
> On Fri, Aug 21, 2020 at 05:03:34PM +0800, Chao Yu wrote:
>> On 2020/8/21 11:47, Dan Robertson wrote:
>>> When the move range ioctl is used, check the output position and ensure
>>> that it is a non-negative value. Without this check f2fs_get_dnode_of_data
>>> may hit a memmory bug.
>>
>> Nice catch!
> 
> I noticed that the pos_out value is unsigned in the file_move_range structure,
> but f2fs_file_move_range uses the signed loff_t. Would a better fix be to

singed loff_t looks good to me, as it keeps line with position variable's type
in vfs.

Thanks,

> change the pos_out argument to an unsigned type or ensure that it is cast to
> an unsigned type before we shift it right by F2FS_BLKSIZE_BITS? This also would
> remove the bug, as the index would no longer be negative for the get_node_path
> call in f2fs_get_dnode_of_data, and therefore we should calculate the correct
> offset.
> 
>>
>>>
>>> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
>>> ---
>>>    fs/f2fs/file.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 8a422400e824..62f9625299ca 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -2798,6 +2798,8 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>>>    	}
>>>    
>>>    	ret = -EINVAL;
>>> +	if (pos_out < 0)
>>> +		goto out_unlock;
>>
>> IMO, it would be better to check both pos_in and pos_out out of inode lock
>> coverage, maybe after encryption flag check?
> 
> Yeah that makes sense. If the pos_in check is the right direction, I'll
> move the check, test it, and set a second patchset version.
> 
> Cheers,
> 
>   - Dan
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
