Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA2A86E60
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Apr 2025 19:18:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3eUa-0002Nf-QW;
	Sat, 12 Apr 2025 17:18:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u3eUZ-0002NX-Kj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7KSU53Ki2LBv6z7JFRDdcRHIpAh3oK7vx5DEadJypWk=; b=goa/mbQ/wHxpO5p4ke4k/bL5rK
 7mwBjS3EGQJMc5SgMsWE1QTrxPnkWQSfWuv4bYn5RAfknikV4YkpqU6sx/VU/hywVlMOMPn9iJDs0
 medhllZh4GALVcZqZxZHxSZodOJo099VNINIxyGMLLspbxGx/yPJQZfRip0qOovX0vkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7KSU53Ki2LBv6z7JFRDdcRHIpAh3oK7vx5DEadJypWk=; b=VKP7HqdPV6Ioz5VkofyOQDC+m6
 vF3p0kNhKnio2UrwdhAt/Jpk0OWYK26VemSa8ET2auyIgfuft0R3mRynGXH/cyK681A/jFax9VaBP
 MunQd6/vfdiSmDhoCTuFDEgcYjagN9yHyQc37W90S78rM9cqAoCLrerCqVoFH+/jn54E=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3eUJ-0000q5-N2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744478265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KSU53Ki2LBv6z7JFRDdcRHIpAh3oK7vx5DEadJypWk=;
 b=GXx3+a3GRFM5kPH8Y7HppvL9eQTdGO/VErZI87Pzf/PQxVzk19Liv68WMISfxBNmMEQUbI
 OlzCfruWjmqNOq/jZO6PCgYC+DQepCnFDuarzeS7pi5SsoTJiaXrUMx0dhbZ/ETRe9znxU
 BDxAcJsN/nsZRizxzbbNpXHJ56hV2Hs=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-jPBg0-m4P46XPNoCr_8iLQ-1; Sat, 12 Apr 2025 13:17:43 -0400
X-MC-Unique: jPBg0-m4P46XPNoCr_8iLQ-1
X-Mimecast-MFC-AGG-ID: jPBg0-m4P46XPNoCr_8iLQ_1744478262
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85b4ee2e69bso317888839f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Apr 2025 10:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744478262; x=1745083062;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7KSU53Ki2LBv6z7JFRDdcRHIpAh3oK7vx5DEadJypWk=;
 b=HI7qOrTmK9aoKB1HfUPowYgiZHuHdn/DRT3zU3ipOFcVzmlnMXyw8mpuoJ5PRvWDlQ
 WQfNPqW3OmoANa4D2edGAugRUIpy5fhEE8YGCRpjVQHYVv04zKkJEbcjQwSyNq2+50gn
 7xLEX4cFmJOrhnmp4d39IsLsrUmKmwcIPgZsCp9LcY+wk/tbh7EKy7Gs/INSHMBseK2A
 H41ilZXsCf47AzH+Wpx1ErsEo7tc9RlkQiRdIn2W96dn14HYp/3pYv0EipXG/RFO/5gS
 euOrcsZi4znPFMMLo2FQe/cANAKuggD4ExS+cHTD2/SnJTG11eDzndBK/mgT/NWXza3J
 0exQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+f2jTfzlXh171UOtt9sQm+7vMU4n73HLVtPu6VF48rhrb6aFPFsHh5FjjrxCJ+dtvPdtgPh4/ROPknj3zieSG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwM7yTJzfwmmygLPDKHL5PR41ZpQZgY2/xMMWm8wj/Mfdl9qGok
 Xnhkduwf/Pbyujr2tNyAZI+qk9mKeo9dnEzh5M8IiU2zfwL2cXTPbsKV5Ws2qhsfHil+/t0td+p
 V+OOCLXpYp0Ow2lczpnAhRkUT7VqoN8RjaFCBHE9uOHX2Zg2Qltbb81GgdqzZcTjQfLfRFIDmnC
 E=
X-Gm-Gg: ASbGncswcAu58GgdERA4GAsyZaPr5T9ik8QNTYKmrEfVMIBhFCcCdlBmLW7j7QSYxGm
 b/TE9Cw5SRagv9exJALHVLmGIsV5Wi8B6jwKXE51HScGrvkJn8+9FjrK2l8tHcm1LYhrbHzoJPM
 FIVfc8WiRLHNyv5NhJZitvafmR+nfoGIpOb1sr4ATrFHx9G3AFLXx3E3PIuXRI6QUDemWFlPoPm
 ssKAntvXom+V7Q+THei6XkS7+47LRxxv39xfQECmBFjXjRx04YYi9kcN0Y=
X-Received: by 2002:a05:6602:6a88:b0:861:6f48:5da5 with SMTP id
 ca18e2360f4ac-8617cb323eemr925071639f.4.1744478262081; 
 Sat, 12 Apr 2025 10:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYm2jjwrX5i5SyWQgLLg0LBt22NgwKdGZhibF1rh/clcy+LhxQZJdnZpObMYfqXucvOrMuoA==
X-Received: by 2002:a05:6602:6a88:b0:861:6f48:5da5 with SMTP id
 ca18e2360f4ac-8617cb323eemr925069439f.4.1744478261599; 
 Sat, 12 Apr 2025 10:17:41 -0700 (PDT)
Received: from [172.19.0.161] ([99.196.129.205])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-86165428d82sm145178439f.20.2025.04.12.10.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 10:17:40 -0700 (PDT)
Message-ID: <6527ce81-e2c7-42fd-a39f-93380e133367@redhat.com>
Date: Sat, 12 Apr 2025 19:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
 <c2d62ced-3a4f-442c-b438-043eec017a45@kernel.org>
 <63ecf5bc-7ddf-4d66-9e64-9d5923d12fcd@redhat.com>
In-Reply-To: <63ecf5bc-7ddf-4d66-9e64-9d5923d12fcd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FLivGfXXHqAcSt0pQ2KRfYEWtdvTl3Ioh-Rg1uy1iaU_1744478262
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/25 3:33 PM, Eric Sandeen wrote: > On 3/31/25 3:31 AM, 
 Chao Yu wrote: >> On 3/29/25 12:18, Eric Sandeen wrote: >>> I was working
 on next steps for this, and I have a followup question. >>> >>> T [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3eUJ-0000q5-N2
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

On 4/1/25 3:33 PM, Eric Sandeen wrote:
> On 3/31/25 3:31 AM, Chao Yu wrote:
>> On 3/29/25 12:18, Eric Sandeen wrote:
>>> I was working on next steps for this, and I have a followup question.
>>>
>>> Today, several mount options are simply ignored if the on-disk format
>>> does not support them. For example:
>>>
>>>                 case Opt_compress_mode:
>>>                         if (!f2fs_sb_has_compression(sbi)) {
>>>                                 f2fs_info(sbi, "Image doesn't support compression");
>>>                                 break;
>>>                         }
>>>                         name = match_strdup(&args[0]);
>>>                         if (!name)
>>>                                 return -ENOMEM;
>>>                         if (!strcmp(name, "fs")) {
>>>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>>>                         } else if (!strcmp(name, "user")) {
>>>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
>>>                         } else {
>>>                                 kfree(name);
>>>                                 return -EINVAL;
>>>                         }
>>>                         kfree(name);
>>>                         break;
>>>
>>> so if f2fs_sb_has_compression() is not true, then the option is ignored without
>>> any validation.
>>>
>>> in other words, "mount -o compress_mode=nope ..." will succeed if the feature
>>> is disabled on the filesystem.
>>>
>>> If I move the f2fs_sb_has_compression() check to later for the new mount API,
>>> then "mount -o compress_mode=nope ..."  will start failing for all images. Is
>>> this acceptable? It seems wise to reject invalid options rather than ignore them,
>>> even if they are incompatible with the format, but this would be a behavior
>>> change.
>>
>> I'm fine w/ this change. IIRC, I haven't saw above use case, otherwise user
>> should stop passing invalid mount option to f2fs.
> 
> Great, I will proceed with this. It will make the conversion simpler (but may
> make testing/validation more difficult, as behavior will change with invalid input).

FYI - I don't think I will be able to complete this conversion task myself - f2fs is
by far the most difficult conversion I've encountered, and my time for these sorts of
projects is sadly limited. I do have one more patch series that moves a lot of the
on-disk feature checking out of option parsing, and perhaps I will send it as an example
at least.

But I think it may be time to ask the f2fs experts to take over this effort, because
I'm just not getting through it on my own.

(We are down to only a small handful of filesystems left - in fact, I think only
bfs, 9p, and f2fs, that don't have patches anywhere. So it would be really great to
get some help on this.)

Thanks,
-Eric
 
> -Eric
> 
>> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
