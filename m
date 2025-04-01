Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DA9A78353
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Apr 2025 22:34:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tziIz-0003RC-4I;
	Tue, 01 Apr 2025 20:33:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tziIx-0003R4-NR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 20:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtylexGKUuWPyhTPdN3c9z0wafpSkG0/E2vC0bfmiIo=; b=a2Rv9kF/mfx+R/QWisfJ3BFgkk
 0iXfFjk1J6uoBpViYnMYeNG5Ki1dnEfiu/5E5XxC38H0aho9mBtwGVqGH40jB9WcGcX5ahKALikY0
 2Itn2lzcvehAX3qEEaJmTWL8f6a68CO0203DgL5hFqyRAH6ycKfNJ0+4+UljDEZ4Gjic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qtylexGKUuWPyhTPdN3c9z0wafpSkG0/E2vC0bfmiIo=; b=ONkrUTOEOV4kQkznsPqHAHRltQ
 5YlAPrCBL6jYmKT/vudesrxHf05/SPmxIKW/cO6ZtkrtVkYJx1+CKNau3MhFLlalt12F9e8G8ZKTN
 l7j8cTpnjfzKaaKSuc8fZuyw4Oxay776nw3NQDl0wEu4cjkRUuYnNSfhjUndXjjAwYBw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tziIh-000377-8i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 20:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743539603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtylexGKUuWPyhTPdN3c9z0wafpSkG0/E2vC0bfmiIo=;
 b=UVLB58t0uy7OMvT00IJnEfnstj65BeTjqloCVPT81TnhVFxqp9sz6pFjrJM5OuTPPrpJeu
 LupmPnlL8yTtL8a6fPMIXCZBcfSSOdWdZ0r5LsvbfSwVPZHqySo8nHa4WkemGwZZ55DTtx
 gQv/HXJR1btDAZFfg2jVjlqmEHQ1UiY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-28vU_5fXNgGyC_XVQ7llOw-1; Tue, 01 Apr 2025 16:33:22 -0400
X-MC-Unique: 28vU_5fXNgGyC_XVQ7llOw-1
X-Mimecast-MFC-AGG-ID: 28vU_5fXNgGyC_XVQ7llOw_1743539601
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac3df3f1193so443409466b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Apr 2025 13:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743539601; x=1744144401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qtylexGKUuWPyhTPdN3c9z0wafpSkG0/E2vC0bfmiIo=;
 b=IyWAaqtFua3+PMl6HyLPju44vXvvs34G0mFCdgcP+M0/JLCQbbRRWDsZ4d1XdmtDvl
 Equa13dNHhLRnuKy8X7GKLbmVdnWnXx8kHRXXVvfKyrPNt8K2K0QMH0Jp2vfreU7tV6D
 yxTawlKPoPAV/tYMU88agmgIp52tJ4DOByJsEQXwitM1bLfbHMCHTjelrByWbx/KU3hU
 7lB9uP6IYFhNXWeDUosx8PXkCUzGNx0x2VLdeqCinPUJ7FPEiwSWFUQQ4JOy1w9sqrEa
 aU5ovGAprdNXoyT/SSR0neEIcCR/rpthaUx0zhloXaglVZlKigZXtsqu7X2lncQpw+O9
 CQRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/AxR57i3EtITd4yYoMNruibjAvErJmOhx3Gc2oDHmnB7bK82xGWKTPwd73TpcJByCCNw1pzDzV9fTUMXy6hjd@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxamti34zUS2m4sRqcAiiv6YYRjryzORu0Qvzp340QPRLetn0Pp
 PQWP2zs7bYISUybrOnxEYB/8ONyhap16jKcGVvjHLPrtYhH5igSdswi6Gt2NhT/sM5bp+mTP6nk
 zGIvZflr1GeQV9SD0QexQDOppmopFdFxZWKiyRDkz6s3Gk2c5RaM9YF1QKIhBq1p1yhCW8LQZow
 E=
X-Gm-Gg: ASbGncsnzqdzurGmt3KxTU6ZIxGx8eDrx9LDAXMGj2gD4ySgWL6zzY0CF3KjtrVbDj+
 vNtBAvUEAhruwH3bRkmLRuQdDkzZXywuTWEeqFoxiuYSZ18RydndK7HrR4KDZpwnaqVrRWgYWJe
 0b7ztWdieqFx59t95WjFFFWG4U0DGiUSSocjuc+9Y/oaOBlelY9k9aM6UcyCx2z/xGX6CsWKDGO
 Jzs9BqOokC6T1k1NDNl/92ZKtTOIc+TMq7Ycy1ZYnw5zyAxGzlLf/BuGcaDOSOZcFYTmY7aTNgk
 GStqINHi/LYRh/ActIdOl8sgmw==
X-Received: by 2002:a17:907:724c:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-ac738a80f54mr1082678166b.34.1743539601373; 
 Tue, 01 Apr 2025 13:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfiVT6SaFB9F4/xcqL5mkONQMVwqOHwFKE9otwRtmLHLBRy73PwllE3ZqHnDlEql3pek2x3g==
X-Received: by 2002:a17:907:724c:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-ac738a80f54mr1082676766b.34.1743539600969; 
 Tue, 01 Apr 2025 13:33:20 -0700 (PDT)
Received: from [172.30.1.201] ([92.60.5.155]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196dd9d3sm797813566b.167.2025.04.01.13.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 13:33:20 -0700 (PDT)
Message-ID: <63ecf5bc-7ddf-4d66-9e64-9d5923d12fcd@redhat.com>
Date: Tue, 1 Apr 2025 22:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
 <c2d62ced-3a4f-442c-b438-043eec017a45@kernel.org>
In-Reply-To: <c2d62ced-3a4f-442c-b438-043eec017a45@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lgMRvwfdsd-Yypk1-VCiyt2ZC9c2qOEdRUWTsXA6k5w_1743539601
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/31/25 3:31 AM, Chao Yu wrote: > On 3/29/25 12:18, Eric
 Sandeen wrote: >> I was working on next steps for this, and I have a followup
 question. >> >> Today, several mount options are simply ignore [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tziIh-000377-8i
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/31/25 3:31 AM, Chao Yu wrote:
> On 3/29/25 12:18, Eric Sandeen wrote:
>> I was working on next steps for this, and I have a followup question.
>>
>> Today, several mount options are simply ignored if the on-disk format
>> does not support them. For example:
>>
>>                 case Opt_compress_mode:
>>                         if (!f2fs_sb_has_compression(sbi)) {
>>                                 f2fs_info(sbi, "Image doesn't support compression");
>>                                 break;
>>                         }
>>                         name = match_strdup(&args[0]);
>>                         if (!name)
>>                                 return -ENOMEM;
>>                         if (!strcmp(name, "fs")) {
>>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>>                         } else if (!strcmp(name, "user")) {
>>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
>>                         } else {
>>                                 kfree(name);
>>                                 return -EINVAL;
>>                         }
>>                         kfree(name);
>>                         break;
>>
>> so if f2fs_sb_has_compression() is not true, then the option is ignored without
>> any validation.
>>
>> in other words, "mount -o compress_mode=nope ..." will succeed if the feature
>> is disabled on the filesystem.
>>
>> If I move the f2fs_sb_has_compression() check to later for the new mount API,
>> then "mount -o compress_mode=nope ..."  will start failing for all images. Is
>> this acceptable? It seems wise to reject invalid options rather than ignore them,
>> even if they are incompatible with the format, but this would be a behavior
>> change.
> 
> I'm fine w/ this change. IIRC, I haven't saw above use case, otherwise user
> should stop passing invalid mount option to f2fs.

Great, I will proceed with this. It will make the conversion simpler (but may
make testing/validation more difficult, as behavior will change with invalid input).

-Eric

> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
