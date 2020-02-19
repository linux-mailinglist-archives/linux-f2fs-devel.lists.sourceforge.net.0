Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D1163AFF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:18:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Fsf-0006Gv-6I; Wed, 19 Feb 2020 03:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j4Fse-0006Gj-3K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrYQNbvfuDPnxD93wn7O0cc2EQYK1CANQPYgnRc0BPU=; b=B6Q18MPJ4j+u5KLsLtF1D7odgA
 5arA1GJZlIQ7o4oDj4r4hS7gyoiEY4frHR4Gmfcx3MJaqmDlZQtsC5Vh4W3zR9iW3w0+ZhasHIXvZ
 4fxn/sRcyJM0KqHDXLt/T1sOrcJRkwfmcXNkJNYM0CFLQSLBp5aEK2NU/xsHG+rd1jgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wrYQNbvfuDPnxD93wn7O0cc2EQYK1CANQPYgnRc0BPU=; b=DqtBvMsi5VEWXC1ycIcISUl/br
 6PIZYUCqSPCru/cSQh7CASht1Vaeyyar3pyq9Z5mz59UQo41E7Qs0O6a0jfl2pIEckWhhBLLLbk7n
 Ln+q86cFOaLKebimAuZ/zMAK9Tqm040XPwbQ3xQVkz2qDf3kmumfg2PYJWitsDgXYqTg=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4FsZ-007WYM-SD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:18:32 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 092E8BD6156035A3226A;
 Wed, 19 Feb 2020 11:18:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Feb
 2020 11:18:15 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200218102136.32150-1-yuchao0@huawei.com>
 <20200218102136.32150-3-yuchao0@huawei.com>
 <20200219025154.GB96609@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <576f8389-ba27-b461-5466-cc62e84b5c92@huawei.com>
Date: Wed, 19 Feb 2020 11:18:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200219025154.GB96609@google.com>
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
X-Headers-End: 1j4FsZ-007WYM-SD
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: avoid unneeded barrier in
 do_checkpoint()
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

On 2020/2/19 10:51, Jaegeuk Kim wrote:
> On 02/18, Chao Yu wrote:
>> We don't need to wait all dirty page submitting IO twice,
>> remove unneeded wait step.
> 
> What happens if checkpoint and other meta writs are reordered?

checkpoint can be done as following:

1. All meta except last cp-park of checkpoint area.
2. last cp-park of checkpoint area

So we only need to keep barrier in between step 1 and 2, we don't need
to care about the write order of meta in step 1, right?

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/checkpoint.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 751815cb4c2b..9c88fb3d255a 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1384,8 +1384,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>  
>>  	/* Flush all the NAT/SIT pages */
>>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>> -	/* Wait for all dirty meta pages to be submitted for IO */
>> -	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
>>  
>>  	/*
>>  	 * modify checkpoint
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
