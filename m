Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8C2D6FFC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Dec 2020 07:09:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knbc6-0007SQ-7O; Fri, 11 Dec 2020 06:09:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knbc4-0007SI-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Dec 2020 06:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VknQgfGKJKEovuHs8J06EMcb+o5l+P/2T+Cja8VEfUE=; b=ZU3Uq0x0lBtTgn3RUGwJ4WtMN0
 FynSsmSPul5NaUm22MUyVCaVRCfNU1ZcnTnrkMJeAosXBVhm0vVslozRjES45PkFQLfqxDtFZD8nM
 3bFhUcn5kgNLnX32l8LOttGlLNo91ys1FdR6NOS5mutzFIabnRUnhIMI/+9eAVwKmu1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VknQgfGKJKEovuHs8J06EMcb+o5l+P/2T+Cja8VEfUE=; b=GcLvb39Hz3WCJ6RKxG2HjSju5v
 Sddi4+hDlwSCRlonuWzhvH9e8Wr/Bj3aoukR825cFlIyvf9Vu8KLZH3uid2Os3By0bq8ApFziZvd4
 0ha04nO96BYPx2t5wOhE+mEccaL7gkj6Yh1bTuNHmPYxqpUJrN2MjlIFq6tyxMwUFLrg=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knbbq-007UEW-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Dec 2020 06:09:08 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsgLl6zK3zM2wt;
 Fri, 11 Dec 2020 14:07:59 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 11 Dec
 2020 14:08:37 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201210092020.66245-1-yuchao0@huawei.com>
 <X9JZn2ELSZISEQpU@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bfe87060-7e47-a9c8-897f-17352d0fc623@huawei.com>
Date: Fri, 11 Dec 2020 14:08:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9JZn2ELSZISEQpU@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knbbq-007UEW-KG
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: compress: add compress_flag in
 struct f2fs_comp_option
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

On 2020/12/11 1:23, Jaegeuk Kim wrote:
> On 12/10, Chao Yu wrote:
>> Add a extra field compress_flag to get/set more compress option from/to
>> compressed inode.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>
>> Daeho, Jaegeuk,
>>
>> Could you please check whether we could add this new field to struct
>> f2fs_comp_option? so we can expand to allow user to query/config more
>> options of compressed inode via new ioctl.
>>
>> It needs to consider before original patches goes to merge window, let
>> me know you have other concerns.
> 
> Chao, I think it'd hard to add this at time point, unless there's critical
> info that we need to set very urgently.

Oops, so it needs extra ioctl interface to get/set newly added chksum and
compress_level configs...

Thanks,

> 
>>
>>   fs/f2fs/file.c            | 1 +
>>   include/uapi/linux/f2fs.h | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 16ea10f2bcf5..fbf06311c88d 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3965,6 +3965,7 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
>>   
>>   	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
>>   	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
>> +	option.compress_flag = F2FS_I(inode)->i_compress_flag;
>>   
>>   	inode_unlock_shared(inode);
>>   
>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>> index 352a822d4370..2b9c4c99ceee 100644
>> --- a/include/uapi/linux/f2fs.h
>> +++ b/include/uapi/linux/f2fs.h
>> @@ -93,6 +93,7 @@ struct f2fs_sectrim_range {
>>   struct f2fs_comp_option {
>>   	__u8 algorithm;
>>   	__u8 log_cluster_size;
>> +	__u16 compress_flag;
>>   };
>>   
>>   #endif /* _UAPI_LINUX_F2FS_H */
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
