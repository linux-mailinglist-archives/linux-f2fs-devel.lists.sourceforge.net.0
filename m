Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8AC18255
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 04:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMB4AuRXG+pwHQf2s2M2w8FejtmGQIEWHDzQBvP1M/o=; b=Ipa2dPQOd2aUa60tJxmEipRYuO
	qz4sKu3a2WX2LYZGq+zGYaLaq/3/EGpCorHr0rvz2HFDWJxAs1yrNBHtlQy+1io67buemQIRPHnRY
	mCnxA7B7D2x1a52xYWqIEohjjgDSnx9fD19XJ7MubPZpvnOBNQ4pLmihlmn4slkgYlps=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDwd2-0000jo-N5;
	Wed, 29 Oct 2025 03:13:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vDwd1-0000jf-CW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 03:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iAHShkoqXEH7y+tSIgzST7Tr6+153mEpoQhsPPxfgWs=; b=ZVLH1jzfwBZizCC7XC8vpOPJ/0
 woyMIBB0OFk6c7YcwHw/sCwowbeyerCKk6M6ikKkiQAIWwQS72pgVyZueoUm3U3pMdYCPGLIsqRyn
 9qWlOjGN4fuk4qezjPY10Z3zil7fzVdylvQAudwNXVMrMhRGVfQdGTk5pn1n9C+d7ggU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iAHShkoqXEH7y+tSIgzST7Tr6+153mEpoQhsPPxfgWs=; b=dsv2P74uALhBc3XMYdCj6zP9aF
 k7TPKYV34ZCenz4BvYRemgw6y2KLo6ucIxjU79uwjaY7PIpIe4sr5EbelfjQ5BPWSGRchKZPDZPqO
 RBp8gBLzyTzMH39j3sQjKRlph9VZTEdMjNaX907ne5GMxUm0eied/D98tj3tfdIIBBLk=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDwd0-0006Kf-SA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 03:13:39 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7a4c202a30aso778323b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Oct 2025 20:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761707613; x=1762312413; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iAHShkoqXEH7y+tSIgzST7Tr6+153mEpoQhsPPxfgWs=;
 b=nncKHoUCaepkUHT84zdEfvqg2/Kw2JgP37GTsPNLk5xGzcefPc8d+TWs8NQHuncFlY
 SXoKiT0kng76b6L4WxVgMZZYqxEwoKZcK8qBUeyUDyv4aDE1jp9Eb4dnxaJchvVeMBa5
 mPh0KPO4MYieTaS0DisNbcfaTab2pnExMUkenhMT1ukUzp63jksS696BM3GFXJJlqjKp
 kKRgxZIt8XV0pmbnkzQy0bNKYNZs2laYdUdV2I61j6sXZCXzkNYqrwWN7k3+yMJVTpW7
 syT1MMpNSdUd8OCYeIZzq2z7FGzfxwJFGLbnMYnUgxjuRx36U4OyhF2TeeBR1E/BIQ7W
 tM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761707613; x=1762312413;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAHShkoqXEH7y+tSIgzST7Tr6+153mEpoQhsPPxfgWs=;
 b=ZnBZMu75tMMcuc0MoBmn/nh8L4kA+JkZGtrcWlOR4WWs6XAuwKVmOc92UHUtClMjnO
 mN2SEbUxB3VrJdIk312rjKTjx61MwyslMo6dgDzkcxiVKyVnv9jalwZ++d76fKmpmr+Y
 DEvk/0cPalC46h1gmID2CnbNfwilGNq3fMvGxNoXi3QWXjj+u3f1CufTTGYlkX+KaWs4
 iKBGDzekZaUxrnjJ9X/WqEaMkHNcKvjx+KRBt1ZfgjpK32ZueTQ5KgW62ewDXwmE4BeW
 IBq38aqavK7BXCq3o3gpalwer/jmQ2+RFyY4EPTq9gE9hFC7EevaHzR9cp3xjcep4sly
 1EfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURTGR+KWU5eqGyr0TpQoG1r23rm4GezTFMrCEgWS5/thC1NdDgAsMOJCjX5gbn2pWVL0IWh92Pm2A1nIYIwIBC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxeLrJZyVVFn5BVMswYd9zGJC6lKwToW+eYW/k0VIKDwjNPWTFr
 vKZVLJZHrbriB6BF4Ih25EYX7JSAqVPBi835K8ex3KzHji4Q5QuMjwETJdVMdKMhdh8=
X-Gm-Gg: ASbGncvDaanR0T1jcPsP6udleiUBkLEmxfdcacGVEihY2YRZDqF+JfoiaY8+8GDELZh
 G9Tss9NrW25fYC2/36qgkiuWWYpaiFHb3kCWb9DZUyEwWNEvwuqfOYMeMpVzaanhst5FddHLKDz
 zJ1uUpFArrjoT4GqY7OMn0IQmzHEeHBPvnUNypyYFqHJ4qgkHSOH6N1sYOeudxFmTawFrGRFkM+
 MocWH2qYISoBAmguPoxVsO/NXj/ssG/2fyBGSo4cpxhjZqKny0OTKEd11TWWfUKz6gXTTaFfwMd
 wXkH/VsnQ0wcM65yeO5y/IWKaOffLUUJQw1oI5J+CPYId+w10JEfrrsLC61NLkJblM+4X3RwET4
 qy9kVL86q91ExxN8MHmkic+D6Xshmipw8+NADvBmlmqb6bswjtv9aZHZ8L9kOxQOCci2cjianCD
 XUuP3hJ1R2y/edy0uKFbI=
X-Google-Smtp-Source: AGHT+IGWiLR+9A+Wv9Xl8a2OKQ1ySYkVUBBFO2aK+0Osm/SMDZfRYSD20pDJN/39LOlHRqF2MjFjrA==
X-Received: by 2002:a05:6a00:813:b0:7a2:7964:64c0 with SMTP id
 d2e1a72fcca58-7a4e2dfb724mr1916402b3a.12.1761707612983; 
 Tue, 28 Oct 2025 20:13:32 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414087cdbsm13385745b3a.64.2025.10.28.20.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 20:13:32 -0700 (PDT)
Message-ID: <7040b501-6e25-42da-bda0-a15614a80d5d@gmail.com>
Date: Wed, 29 Oct 2025 11:13:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20251028195444.3181203-1-jaegeuk@kernel.org>
 <81602674-b9f4-4ab2-91f5-0afc762e7cc6@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <81602674-b9f4-4ab2-91f5-0afc762e7cc6@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 10:06, Chao Yu via Linux-f2fs-devel wrote: > On
 10/29/25 03:54,
 Jaegeuk Kim via Linux-f2fs-devel wrote: >> This adds a tracepoint
 in the fadvise call path. >> >> Signed-off-by: Jaegeuk Kim [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vDwd0-0006Kf-SA
Subject: Re: [f2fs-dev] [PATCH] f2fs: add fadvise tracepoint
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/25 10:06, Chao Yu via Linux-f2fs-devel wrote:
> On 10/29/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
>> This adds a tracepoint in the fadvise call path.
>>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> ---
>>   fs/f2fs/file.c              |  2 ++
>>   include/trace/events/f2fs.h | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6d42e2d28861..4a81089c5df3 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -5288,6 +5288,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>>   	struct inode *inode = file_inode(filp);
>>   	int err;
>>   
>> +	trace_f2fs_fadvise(inode, offset, len, advice);
>> +
>>   	if (advice == POSIX_FADV_SEQUENTIAL) {
>>   		if (S_ISFIFO(inode->i_mode))
>>   			return -ESPIPE;
>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
>> index edbbd869078f..b7f5317b5980 100644
>> --- a/include/trace/events/f2fs.h
>> +++ b/include/trace/events/f2fs.h
>> @@ -586,6 +586,38 @@ TRACE_EVENT(f2fs_file_write_iter,
>>   		__entry->ret)
>>   );
>>   
>> +TRACE_EVENT(f2fs_fadvise,
>> +
>> +	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int advice),
>> +
>> +	TP_ARGS(inode, offset, len, advice),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(dev_t,	dev)
>> +		__field(ino_t,	ino)
>> +		__field(loff_t, size)
>> +		__field(loff_t,	offset)
>> +		__field(loff_t,	len)
>> +		__field(int,	advice)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->dev	= inode->i_sb->s_dev;
>> +		__entry->ino	= inode->i_ino;
>> +		__entry->size	= inode->i_size;
> 
> __entry->size = i_size_read(inode)?
> 
> Thanks,
> 
The other "__entry->size = inode->i_size;" in 
include/trace/events/f2fs.h also need to be updated?

>> +		__entry->offset	= offset;
>> +		__entry->len	= len;
>> +		__entry->advice	= advice;
>> +	),
>> +
>> +	TP_printk("dev = (%d,%d), ino = %lu, i_size = %lld offset:%llu, len:%llu, advise:%d",
>> +		show_dev_ino(__entry),
>> +		(unsigned long long)__entry->size,
>> +		__entry->offset,
>> +		__entry->len,
>> +		__entry->advice)
>> +);
>> +
>>   TRACE_EVENT(f2fs_map_blocks,
>>   	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
>>   		 int ret),
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
