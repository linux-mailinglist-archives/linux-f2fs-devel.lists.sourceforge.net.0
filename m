Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA303193BE8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 10:30:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHOqf-00036S-JT; Thu, 26 Mar 2020 09:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jHOqd-00036C-Qc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 09:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a1pO8tHlZ4F/3lqbioSBXWnyoUFq+aOOFexNyUAyAc=; b=Q7NcDbXTZ94qrNrfIrVfFxrISn
 eiQ31jiCWH/SznLZKGUV3+2e/YKdetjYo09mzKTvL5F+MhEWk27wDCGKFbMIB0N8j2nSE3Y/9BswO
 NXwnoL5JDXMX3yBrGftBAh6E+tNjPo0dSCHT92s5uAYmLyOrrZ0y23Y8T/Xfl99h6jwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9a1pO8tHlZ4F/3lqbioSBXWnyoUFq+aOOFexNyUAyAc=; b=bUxLk4MOygdjbaXISpyIEunLww
 pYCrri3+lB5Mh2SXb9xx+yDZwEoJ21A6a9cOv8KHZ7Bb4vMYeIhkdg38Zckte+upScjoSx5xuR/6v
 PbEBmL0mWu/hE+LEleTgM3Rl9DLHNQj9/jV2+piU6SgTImvCZlGxlcGmBN42CsU/L7aw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHOqZ-000NH9-TN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 09:30:47 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0D07C7169ACE85BE893B;
 Thu, 26 Mar 2020 17:30:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 26 Mar
 2020 17:30:30 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200325091811.60725-1-yuchao0@huawei.com>
 <20200325155014.GB65658@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b20a846a-6035-6f5e-72a9-adb1b5399bbd@huawei.com>
Date: Thu, 26 Mar 2020 17:30:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200325155014.GB65658@google.com>
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
X-Headers-End: 1jHOqZ-000NH9-TN
Subject: Re: [f2fs-dev] [PATCH v2 3/5] f2fs: fix to avoid NULL pointer
 dereference
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

I've made that diff as a patch and changed title and commit message a
bit, let's merge the new one.

Thanks,

On 2020/3/25 23:50, Jaegeuk Kim wrote:
> Hi Chao,
> 
> I don't want to rebase old commit at this moment, so applied on top of the tree.
> 
> Thanks,
> 
> On 03/25, Chao Yu wrote:
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000
>> PC is at f2fs_free_dic+0x60/0x2c8
>> LR is at f2fs_decompress_pages+0x3c4/0x3e8
>> f2fs_free_dic+0x60/0x2c8
>> f2fs_decompress_pages+0x3c4/0x3e8
>> __read_end_io+0x78/0x19c
>> f2fs_post_read_work+0x6c/0x94
>> process_one_work+0x210/0x48c
>> worker_thread+0x2e8/0x44c
>> kthread+0x110/0x120
>> ret_from_fork+0x10/0x18
>>
>> In f2fs_free_dic(), we can not use f2fs_put_page(,1) to release dic->tpages[i],
>> as the page's mapping is NULL.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - fix to skip release tpages[i] if it is NULL in error path.
>>  fs/f2fs/compress.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index ef7dd04312fe..6e10800729b6 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1137,7 +1137,10 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
>>  		for (i = 0; i < dic->cluster_size; i++) {
>>  			if (dic->rpages[i])
>>  				continue;
>> -			f2fs_put_page(dic->tpages[i], 1);
>> +			if (!dic->tpages[i])
>> +				continue;
>> +			unlock_page(dic->tpages[i]);
>> +			put_page(dic->tpages[i]);
>>  		}
>>  		kfree(dic->tpages);
>>  	}
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
