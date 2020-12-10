Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B3A2D5069
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 02:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knAwp-0002k6-DM; Thu, 10 Dec 2020 01:40:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knAwn-0002jq-M3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 01:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SQSNMqJxDBKdHs044LppI9aTnM+STLmmaUXDMGwp+U=; b=YYktG+Phxz+fjaKXmdSkn/6HjO
 M7w/GlpHkUmG5KDRr3gjLZkOko2mDpVap7ghkn5PmEfY6Q0WInhdm1V5pXmXqNbni0ShJDlvRthFz
 LnY0GYosQmD78JtEReHnPLimIVedTUmvj52DFCLVBYrTcRihqyuD/4begHqbmu8U5xGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3SQSNMqJxDBKdHs044LppI9aTnM+STLmmaUXDMGwp+U=; b=WM72QvR+892TPreaJGYZnPWSaE
 Xdvg84jILWsmUbDBYdAizXGq4NbUIn2o3mVwGB2Y6e4ze6bwlevHcAyvVXPtu1O8XWH4g1/8MHdJ1
 2bgbuGLMkvBU+vyoPTCyumk7Jbq9gBMbSbW2pFnDyxI0jVGVLSuok8BrO+Vk1M1sT+O4=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knAwf-005nLF-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 01:40:45 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CrxRt3dNBz7C6b;
 Thu, 10 Dec 2020 09:39:54 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Dec
 2020 09:40:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201209084328.30416-1-yuchao0@huawei.com>
 <20201209084328.30416-5-yuchao0@huawei.com> <X9D1dXVwKFvfHpP9@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6f8bf3c3-f210-ec06-372f-c27c85d0449b@huawei.com>
Date: Thu, 10 Dec 2020 09:40:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9D1dXVwKFvfHpP9@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knAwf-005nLF-Ec
Subject: Re: [f2fs-dev] [PATCH RESEND v2 5/5] f2fs: introduce sb_status
 sysfs node
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

On 2020/12/10 0:04, Jaegeuk Kim wrote:
> On 12/09, Chao Yu wrote:
>> Introduce /sys/fs/f2fs/<devname>/stat/sb_status to show superblock
>> status in real time as below:
>>
>> IS_DIRTY:		no
>> IS_CLOSE:		no
>> IS_SHUTDOWN:		no
>> IS_RECOVERED:		no
>> IS_RESIZEFS:		no
>> NEED_FSCK:		no
>> POR_DOING:		no
>> NEED_SB_WRITE:		no
>> NEED_CP:		no
>> CP_DISABLED:		no
>> CP_DISABLED_QUICK:	no
>> QUOTA_NEED_FLUSH:	no
>> QUOTA_SKIP_FLUSH:	no
>> QUOTA_NEED_REPAIR:	no
> 
> Wait, this is breaking a sysfs rule where one entry should show one value.

Hmm.. let me change to show the sb status value directly, but then we needs extra
tool or a mapping table to parse the real status every bit means.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   Documentation/ABI/testing/sysfs-fs-f2fs |  5 ++++
>>   fs/f2fs/sysfs.c                         | 36 +++++++++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index 3dfee94e0618..57ab839dc3a2 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -377,3 +377,8 @@ Description:	This gives a control to limit the bio size in f2fs.
>>   		Default is zero, which will follow underlying block layer limit,
>>   		whereas, if it has a certain bytes value, f2fs won't submit a
>>   		bio larger than that size.
>> +
>> +What:		/sys/fs/f2fs/<disk>/stat/sb_status
>> +Date:		December 2020
>> +Contact:	"Chao Yu" <yuchao0@huawei.com>
>> +Description:	Show status of f2fs superblock in real time.
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index ebca0b4961e8..1b85e6d16a94 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -101,6 +101,40 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
>>   				sbi->sectors_written_start) >> 1)));
>>   }
>>   
>> +#define	SB_STATUS(s)	(s ? "yes" : "no")
>> +static ssize_t sb_status_show(struct f2fs_attr *a,
>> +		struct f2fs_sb_info *sbi, char *buf)
>> +{
>> +	return sprintf(buf, "IS_DIRTY:		%s\n"
>> +				"IS_CLOSE:		%s\n"
>> +				"IS_SHUTDOWN:		%s\n"
>> +				"IS_RECOVERED:		%s\n"
>> +				"IS_RESIZEFS:		%s\n"
>> +				"NEED_FSCK:		%s\n"
>> +				"POR_DOING:		%s\n"
>> +				"NEED_SB_WRITE:		%s\n"
>> +				"NEED_CP:		%s\n"
>> +				"CP_DISABLED:		%s\n"
>> +				"CP_DISABLED_QUICK:	%s\n"
>> +				"QUOTA_NEED_FLUSH:	%s\n"
>> +				"QUOTA_SKIP_FLUSH:	%s\n"
>> +				"QUOTA_NEED_REPAIR:	%s\n",
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_DIRTY)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_CLOSE)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RECOVERED)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RESIZEFS)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_FSCK)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_POR_DOING)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_CP)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)),
>> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)));
>> +}
>> +
>>   static ssize_t features_show(struct f2fs_attr *a,
>>   		struct f2fs_sb_info *sbi, char *buf)
>>   {
>> @@ -711,7 +745,9 @@ static struct attribute *f2fs_feat_attrs[] = {
>>   };
>>   ATTRIBUTE_GROUPS(f2fs_feat);
>>   
>> +F2FS_GENERAL_RO_ATTR(sb_status);
>>   static struct attribute *f2fs_stat_attrs[] = {
>> +	ATTR_LIST(sb_status),
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(f2fs_stat);
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
