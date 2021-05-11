Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75380379C25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 03:38:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgHLV-00088X-A6; Tue, 11 May 2021 01:38:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lgHLN-00088F-9d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTlS6wzB48ygGytPTuR4mKmz2k/kwt1DQudb8KCmOV8=; b=KQWvOvdlJ95n7Owh1/NLGK0ABD
 9xwsNHJqI5rS5L3atSVkO7ZMOMZGsMxyE7p7eoobzcdfLI8YQf3jWFvk6OkBY6o6qRCMxXr8FOOb6
 ZpOU4wxp0q+m1x+JUUGm3XoBp4cl2HYAlGnkrAIOziwQwIRQzFpAW9g99qr7EHj8sCLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mTlS6wzB48ygGytPTuR4mKmz2k/kwt1DQudb8KCmOV8=; b=L7yXdPHopNAGHHf9Mzco26IVoM
 WzdkTPK0EwS380Gn32PhGQ503xu8YZe0FgpTTcZWkFrFa6XQms2DGvGbv15yHm5Xp/BwabTp0YYzN
 s0DzXjGcwtxq/rjKSBkHnssmKCgniO/c2VzkmIQtpBdBrORfT0lHNQ57854sJx8mdbng=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgHLD-00026X-T2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:37:53 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfL7F0tbgzmftL;
 Tue, 11 May 2021 09:34:17 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 11 May
 2021 09:37:35 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210510093032.35466-1-yuchao0@huawei.com>
 <YJlWaOSZNLkdGNnQ@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b45c381e-45e7-037d-c71c-77c73fdaae8a@huawei.com>
Date: Tue, 11 May 2021 09:37:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJlWaOSZNLkdGNnQ@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgHLD-00026X-T2
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: compress: fix to call
 f2fs_put_dnode() paired with f2fs_get_block()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/10 23:51, Jaegeuk Kim wrote:
> On 05/10, Chao Yu wrote:
>> f2fs_get_block() and f2fs_put_dnode() should be called as a pair,
>> add missing f2fs_put_dnode() in prepare_compress_overwrite().
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/compress.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index c208563eac28..d5cb0ba9a0e1 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1088,6 +1088,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   
>>   		for (i = cc->cluster_size - 1; i > 0; i--) {
>>   			ret = f2fs_get_block(&dn, start_idx + i);
>> +			f2fs_put_dnode(&dn);
> 
> f2fs_reserve_block()
>   -> need_put = true;
>    -> f2fs_put_dnode();

Correct, it looks f2fs_vm_page_mkwrite() doesn't need to call
f2fs_put_dnode() as well.

Thanks,

> 
>>   			if (ret) {
>>   				i = cc->cluster_size;
>>   				break;
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
