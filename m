Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D975A5E061
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 16:31:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsO3j-00008M-3p;
	Wed, 12 Mar 2025 15:31:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tsO3U-000073-12
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rN3zc/eUWvSNVumn/gE5M5cHiApWQf3isDTzf7BdJv8=; b=jaupiN5P7rFBgGgXw9Iv/Bt8nC
 zUwOeHF79j60R62FEJZZnf8hnFdCeXeOharlp3OVw2JInk/X7Qw1YvDPMWAImAfvziviFOKVPT83L
 yhZWAIBYOfzCvicXn+zbDCX9tJwbRseJWQgUVH+vT6r3PNIzxy14W12eeOGvjy9o7F5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rN3zc/eUWvSNVumn/gE5M5cHiApWQf3isDTzf7BdJv8=; b=nWCr2n1vUPZjLSMUgPfeCwOPuj
 2K8NWWiXUur+wbgTahzisgVwW6LKxEdlq6WdMPgF8qpyhWvgYJ8T1OsmOYlyGRcb0PFZpcj60wJUf
 LZIyohqvVNmyuACuRGwd+nsMQrVcnolQrrADb5ZZpn24Wv1HyofBQiYMZvJVuDS6p7jE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsO3T-0007jB-MF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741793484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN3zc/eUWvSNVumn/gE5M5cHiApWQf3isDTzf7BdJv8=;
 b=UtFgO8fXurBVfdpKn7joMpGqMxaaGjmY6JLM6dywNQUd9/Kg95TiNvwziwzUjdyfeGir6V
 9lL8uVIIwSuwCje/17RwLF7bYEBF82PPhj86IFxIJbHvlFJ2wjJkJhiCvVPyxEAf36VQcV
 QkCvaTr82ugQ1fkFVRi4AfEvo/25OF8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-fE5FcpsyNOiOnm75nYEzBg-1; Wed, 12 Mar 2025 09:29:14 -0400
X-MC-Unique: fE5FcpsyNOiOnm75nYEzBg-1
X-Mimecast-MFC-AGG-ID: fE5FcpsyNOiOnm75nYEzBg_1741786153
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d458e61faaso10038125ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Mar 2025 06:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741786153; x=1742390953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rN3zc/eUWvSNVumn/gE5M5cHiApWQf3isDTzf7BdJv8=;
 b=NYdt9zphlpVyTnFK8M/QnRr6cHq3ioBi4V7nDn7eLo1qFQ6WyTiCWrPtJrnnu8tnXI
 x5A5NNLsQ0GS3KyRjh96eIMA2XhTGIj92d0QZltRVhEpFYFbhZLkthUVBPCpZ0Hc9Y7D
 Jnf6fivfbsk2Z2lQXhzV1H2UIPOpx2mKJxKffeFEcgF+fuNvE4mNWPPB7gA7FNwvYCFQ
 1V4WHSAPWxk2ypjYxNSQS9sdKNRCcu7r76EbOtVZMMd2QHQBGk40j8zxD96YvXC15NKG
 xE5abSqETp+jPJAvq/OF7rg9llkZTLHFMAriuT44P9Nymrk9rKen1g5kWyYXIRMB5hT7
 Fuhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrJXblm4CeyoypzOVPp7zOAx7B8ynVsSeYsA4I2laUSRvATXcvi2PCDLZCxNYuEvZRhIWC+LHtJld2gGjqX+/Y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzqRfzQAoGcm8hgWW6eYZatZ6ZfIWCplWf+xvQKsEUKS6ER+GYG
 ZGohNTG+c7VIZQbRkRx54n9sjcmxL4/+oqNqDUFGI9d5n/yJTZqNa8qW5IESaOGrseJciK9Kk7v
 vSfZEvLhEB67UhxeqvWHHLshiGUAGEsvh5CXB6Yb3/Wr3n9TgJjPHZFnEiKxlC9+tRmfy6WO+To
 PMbHMKz8S6gw==
X-Gm-Gg: ASbGnctxxYCdyE07ahLmZm7Wa0sw/GNUOVoLwoTO4CFCXPiYw2OPz3oCoTGcoo0FHX4
 07sYQrw3gC/L3w2gUCV91xTwk8ZlrE42ptisMQqyAUVLiHr8Ge34yKmmZr8fgiPLDITEvY2gpwp
 WQdJhG6FvzhpkxxXUznHCIDIWH61Qv12mYx1E6AsHlB9oRrp4y8566/L/izuJZ4CJNrYeHNuVql
 U9VQtRGd4uFrMmFJS/F/oRg9rE22j4CX1aAE77neaE/Jw3T/3Cx97cThv45V/VESh+UYgYz3DlC
 4jw+fo6LjpSbWpbP9jLig70=
X-Received: by 2002:a05:6e02:1a2f:b0:3d1:4a69:e58f with SMTP id
 e9e14a558f8ab-3d46914380fmr70044995ab.2.1741786153312; 
 Wed, 12 Mar 2025 06:29:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/gAK0bgbIqe4JLjMap+mXixs8uT1X60Iy8RQ1NJdYXDJGNiE7ceQcZ3ngbsjlVkmHrVzLoQ==
X-Received: by 2002:a05:6e02:1a2f:b0:3d1:4a69:e58f with SMTP id
 e9e14a558f8ab-3d46914380fmr70044805ab.2.1741786153002; 
 Wed, 12 Mar 2025 06:29:13 -0700 (PDT)
Received: from [10.0.0.176] ([65.128.97.82]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d43b5869absm30515285ab.51.2025.03.12.06.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 06:29:12 -0700 (PDT)
Message-ID: <a2eda580-d205-40cf-b0d6-2dfa90dfc03b@redhat.com>
Date: Wed, 12 Mar 2025 08:29:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-4-sandeen@redhat.com>
 <5f8c60ec-2186-4315-b8c2-74aee91205df@kernel.org>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <5f8c60ec-2186-4315-b8c2-74aee91205df@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: icIIXTwmqhWiK4a_8SYVsWq-bCC6G8SDh_ZVCiorYR0_1741786153
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/11/25 10:10 PM, Chao Yu wrote: > On 3/4/25 01:12, Eric
 Sandeen wrote: >> From: Eric Sandeen <sandeen@sandeen.net> >> >> The current
 options parsing function both parses options and validates >> t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsO3T-0007jB-MF
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: factor out an f2fs_default_check
 function
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
Cc: jaegeuk@kernel.org, Eric Sandeen <sandeen@sandeen.net>,
 lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/11/25 10:10 PM, Chao Yu wrote:
> On 3/4/25 01:12, Eric Sandeen wrote:
>> From: Eric Sandeen <sandeen@sandeen.net>
>>
>> The current options parsing function both parses options and validates
>> them - factor the validation out to reduce the size of the function and
>> make transition to the new mount API possible, because under the new mount
>> API, options are parsed one at a time, and cannot all be tested at the end
>> of the parsing function.
>>
>> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
>> ---
>>  fs/f2fs/super.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 29b3aa1ee99c..7cfd5e4e806e 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -687,7 +687,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>  	int ret;
>>  
>>  	if (!options)
>> -		goto default_check;
> 
> Eric, do you know in which condition options can be NULL, mount w/o any
> specified options?
> 
> If so, maybe we'd keep this in order to chech whether default options
> generated from default_options() is conflicted or not? What do you think?
> 
> Thanks,

Yes, that's I think that is correct - (!options) is true when no f2fs-specific
options are present for parsing.

However, I think that we do still check default options with my patch in this
case, because both calls to parse_options() still call f2fs_default_check()
when parse_options() completes.

Or am I misunderstanding your question?

I added printks to check:

# mount -o loop,ro  f2fsfile.img mnt
[root@fedora-rawhide f2fs-test]# dmesg 
[847946.326384] loop2: detected capacity change from 0 to 819200
[847946.337625] parse_options: (!options) is true
[847946.337637] enter f2fs_default_check()

Thank you for reviewing this series. I think at least the first 2 or 3 patches
are suitable for merge now, if you agree. I am fairly certain that the rest of
them are proper steps towards mount API conversion as well, but as I have not
yet finished the work, I can't guarantee it yet. :)

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
