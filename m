Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA7C0DD1D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 14:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CZfeFdNJMQKupmyDripyo/tMocgG4g4jhcrm0j2oDg=; b=g6dKVGf/sM/wh2abzxwf4oaCwK
	KSPiYpJCgyFeeJe83o+WNowtKpyWWDo0bhZujYCf44cyfrCGm5drykf6abc0ekBMPwrXizcF4oIRy
	3Zh9/tyXbuq+0aQ9N8A1LjL/483o6q1oYKgtprGeZiECEhjPUocqn2PP4wMR5+Q3n+Pk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDMvy-00015i-5Q;
	Mon, 27 Oct 2025 13:06:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vDMvw-00015c-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 13:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/YBePPQo8xGJYqtN4Y1jO8KZscMB17hUzIeXQT0ZvE=; b=BXKNXP9HDwnZh+iUZf59ToQ6px
 yUbzqlOiYtL4g/qIjiOE1xiV6TQoTY79rpuF3ORAhx3+OzyAcdVAbCgnMCsYOOhW4EcnAI4UDFekC
 3yRPhJD4u3CDnIoH0fEwNSjnwirxnBam6R3vpMyCECVVp48ym9rIxHmCAD7A+cvZ4qpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/YBePPQo8xGJYqtN4Y1jO8KZscMB17hUzIeXQT0ZvE=; b=G7K8KKrklu/pLEZif//OVeVCoi
 8hM9QAT4NJifqYPMQMvelMXrGbF91mYk4WMRkGUjUQBMtLRH3alhATJD3Dgkq+inAWhL4WNnkMML7
 DPUnzFFHRMXR2Wund4Mq2/CqiPFxAa3tXUSiPbA5A2Cqp30ku4xHZalU6b341r1pbe/U=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDMvv-0002UI-PQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 13:06:48 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7a28226dd13so3376099b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761570397; x=1762175197; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/YBePPQo8xGJYqtN4Y1jO8KZscMB17hUzIeXQT0ZvE=;
 b=mjXCZQNWpbOV4FQSr+eZ2hVkRIcMIaI36pot/DqAmEnjbCDPHCZGMx+R84Vy/3XUi7
 1QdDv8dqX20lssUKV3gDb9YWhbG+ep/Uozo5oZy9icQ3j7PuetYmpGtV9GbfaSYtX6yX
 tnSVdD4AJhP3VZbeyXDB9H58B2fmeP/cheMB+I233uHueQnvZ99BQ7r2oHCe2RGtcX6p
 LRMxUOuyq3eIc4zyubkw8v/bX4P2Jd1pHczDWCNQ0XZuKU/D1zjSd6V0ua0dEJM57d5z
 81zJD2fFGjAnaDpRy3yJOdFc2eU3Nv3uTuRh/B9nb8/X4HNDQZH6l8J12uVALwLkVKFl
 d1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570397; x=1762175197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/YBePPQo8xGJYqtN4Y1jO8KZscMB17hUzIeXQT0ZvE=;
 b=O0asnUkAbhpgOKvFVZmC3jqhPAmjgskfU/w6HE4TcHQQ8nzFawabGU38iF5H5NrFeQ
 3sEIZOmdO3l76hYMl4s1P3RPM+BbwhXK89KKRihegZ0GY6n1wbz3WTF1wWMgfkTCcMyb
 +K0wbmoFGSDbRqgZq7HeWlK8l5ferz2lkqLYO/BnYXude/DwFd0xThxRWnz2mzAg7rfo
 BJmXty96PVHSJf4HnyBjpJycOArwsd0aje7nAt1WHAhT8HbUAJVPnS9d9Gell6ixDrzx
 Oz519Q0af7sGXwShYzvvlGkEUxbbietX1ehy7pGyzx7DygBMK8WGWujigIfEAptgvbSA
 175A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaDmy4QTRGy6GF7+xC8xjIQy5tzaTHqtufCNujzsgc4Lae/Inr5zm0HTqJWIxw7sdMFy0m6jcPHO0PjSvfFgnw@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxu3eqZ5wUIEDGLpNRQ4WMMLVuPLB1DW/KetEVddbpkIttnmfgA
 4A8vMlX9sautOfQyOgf1O+Pg8Lu1vQkpf7J+X6IuU4dIsUTpK/gGFgbg
X-Gm-Gg: ASbGncsAVMddZuO1Btip45ajChEF+HHn74SDXdYn13j8bCAtO5Tgawmu5kPap9wG27Y
 3XnH4aaHW5C5tWG0LYMOCqtKy8YhMohOwSPTmC+YaGo3rpJGGjK6MvB68oIGEW9LC04ITrHA7gR
 7qdjoDdGYL7599BASaAeYCUzvmxKOhIjaN/KqhOSfbmmcoGJ4qR3xmQUnkDg10pGWT1DXPR4Ncu
 U0qBub2MX+wiQAzjV9w7teduKn6Hfj2g7a88TBgedlMqpjfF2lwJa20TW0fee4WvSZ6mr+sqs99
 Kga9VWip9d+1SDBsrKu8b/bLV9dFL/3xN1jaISzDLAmOH3JFIULWrahHExTVh9umeKCbYlZOX52
 M5EPPzzQZmKZPxxgJGTe76p/JN5rQpbN+187SvhYOWLHkc0XX600JCHXNFPdRxO4UF6FczLrF5R
 llvbSJsLFFR+USp0FNiI8=
X-Google-Smtp-Source: AGHT+IGTAXFwvy+YlFe65udJUB5SHdnZppGLJRTQU4YtKMCiog51t6EaF3epT31M0cpi/9oJgoBTqQ==
X-Received: by 2002:a05:6a00:2d8d:b0:781:261b:7524 with SMTP id
 d2e1a72fcca58-7a220aa1dc7mr46026480b3a.14.1761570396775; 
 Mon, 27 Oct 2025 06:06:36 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414049ee0sm8056225b3a.33.2025.10.27.06.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:06:35 -0700 (PDT)
Message-ID: <d74c16bc-58c5-470f-acb5-e2dfe6c721d8@gmail.com>
Date: Mon, 27 Oct 2025 21:06:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
 <c0689523-a265-47ce-b443-b4fe4ae7d823@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <c0689523-a265-47ce-b443-b4fe4ae7d823@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/27/25 16:35, Chao Yu via Linux-f2fs-devel wrote: > On
 10/24/25 22:37, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> When F2FS
 uses multiple block devices, each device may have a >> differe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
X-Headers-End: 1vDMvv-0002UI-PQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/27/25 16:35, Chao Yu via Linux-f2fs-devel wrote:
> On 10/24/25 22:37, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> When F2FS uses multiple block devices, each device may have a
>> different discard granularity. The minimum trim granularity must be
>> at least the maximum discard granularity of all devices, excluding
>> zoned devices. Use max_t instead of the max() macro to compute the
>> maximum value.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/f2fs.h | 12 ++++++++++++
>>   fs/f2fs/file.c | 12 ++++++------
>>   2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 32fb2e7338b7..064bdbf463f7 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4762,6 +4762,18 @@ static inline bool f2fs_hw_support_discard(struct f2fs_sb_info *sbi)
>>   	return false;
>>   }
>>   
>> +static inline unsigned int f2fs_hw_discard_granularity(struct f2fs_sb_info *sbi)
>> +{
>> +	int i = 1;
>> +	unsigned int discard_granularity = bdev_discard_granularity(sbi->sb->s_bdev);
> 
> Yongpeng,
> 
> The patch makes sense to me.
> 
> One extra question, if a zoned device contains both conventional zones and
> sequential zones, what discard granularity will it exposes?
> 
> Thanks,
I don't have such a device. I think the exposed discard granularity 
should be that of the conventional zones, since the sequential zones 
have a default reset granularity of 1 zone, and no additional 
information is needed to indicate that.

Yongpeng>
>> +
>> +	if (f2fs_is_multi_device(sbi))
>> +		for (; i < sbi->s_ndevs && !bdev_is_zoned(FDEV(i).bdev); i++)
>> +			discard_granularity = max_t(unsigned int, discard_granularity,
>> +						bdev_discard_granularity(FDEV(i).bdev));
>> +	return discard_granularity;
>> +}
>> +
>>   static inline bool f2fs_realtime_discard_enable(struct f2fs_sb_info *sbi)
>>   {
>>   	return (test_opt(sbi, DISCARD) && f2fs_hw_support_discard(sbi)) ||
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6d42e2d28861..ced0f78532c9 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2588,14 +2588,14 @@ static int f2fs_keep_noreuse_range(struct inode *inode,
>>   static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>>   {
>>   	struct inode *inode = file_inode(filp);
>> -	struct super_block *sb = inode->i_sb;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	struct fstrim_range range;
>>   	int ret;
>>   
>>   	if (!capable(CAP_SYS_ADMIN))
>>   		return -EPERM;
>>   
>> -	if (!f2fs_hw_support_discard(F2FS_SB(sb)))
>> +	if (!f2fs_hw_support_discard(sbi))
>>   		return -EOPNOTSUPP;
>>   
>>   	if (copy_from_user(&range, (struct fstrim_range __user *)arg,
>> @@ -2606,9 +2606,9 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>>   	if (ret)
>>   		return ret;
>>   
>> -	range.minlen = max((unsigned int)range.minlen,
>> -			   bdev_discard_granularity(sb->s_bdev));
>> -	ret = f2fs_trim_fs(F2FS_SB(sb), &range);
>> +	range.minlen = max_t(unsigned int, range.minlen,
>> +			f2fs_hw_discard_granularity(sbi));
>> +	ret = f2fs_trim_fs(sbi, &range);
>>   	mnt_drop_write_file(filp);
>>   	if (ret < 0)
>>   		return ret;
>> @@ -2616,7 +2616,7 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>>   	if (copy_to_user((struct fstrim_range __user *)arg, &range,
>>   				sizeof(range)))
>>   		return -EFAULT;
>> -	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>> +	f2fs_update_time(sbi, REQ_TIME);
>>   	return 0;
>>   }
>>   
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
