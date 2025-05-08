Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3318AB05DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 May 2025 00:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jmn7P/zBPWXFywrhbXCLR3G/Rz3R/ftx4ArE6PpYQU=; b=JLEIJ/gmFeBOyc7i4JuVvr1W7J
	NadLnzuI+Xb4lGG7QLxAlPPrPKgvA9FLKDoTsOnrmGhG8hDv+Ik520oc17HjrAAWNRd56bCRgzz4A
	LUFpiUfLl1uDiK3Kb+efl99sNTuEpSGzcJOBdXyeWkPQkOvUHIR9GdC8ONrxNoUBzSDg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD9TA-0003fj-Iq;
	Thu, 08 May 2025 22:11:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uD9T9-0003fd-5W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 22:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vnuh6wiFxQ9f/XAw8FJNLOGaIJWCLSrLa/Oh4b7bi68=; b=OKPNCAxC5venVBybNWlVoUffaW
 BRjau/MEhXGnku9jxvfbdZmjuoM0ZYaNrxoRV8IzXOGBfMfsPyDg12vU0f+PCz5M4ZrSdKEyK6A2t
 brtRbATi2RkzapIz8+NRTgVW+meN/aLWFRiov9SCBYJxW4gAnarmzO2btEE2X/pBs+4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vnuh6wiFxQ9f/XAw8FJNLOGaIJWCLSrLa/Oh4b7bi68=; b=d9l+gXwbb0tI5lO4Hoj84A8H99
 t70lQqTj/q6dJ4u2IzDQNp+MSPXbmkiBIt18nybVvETCydn5e/Wa70GoaBCif6jYSSn3hOkzuOb6+
 lNxQEfydWAC74IuqgaRvpsCtkqHirrOZA2lIAHc9c4JGzDNwg4tKVE/OFlEadZMD2N2I=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD9T8-0003a1-AJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 22:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746742303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vnuh6wiFxQ9f/XAw8FJNLOGaIJWCLSrLa/Oh4b7bi68=;
 b=WgPqMGf0bqCgkZXD3MJMxZUOyQmWhI32qMdnoLN+R6LZtWD3UXejL40Copx2CqVdYfp2en
 V9gZ6vBcmRayOXj4DpfFpKxsunlbqNzDpRfSbZ9csvRVgMzDyxgAqs9636Xud1wFlqz9sO
 Kq3V0czlQi8jsXh46EZMDfGT4yNuV+4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48--lK2dN3LM3-cseEGUjhi5w-1; Thu, 08 May 2025 18:11:42 -0400
X-MC-Unique: -lK2dN3LM3-cseEGUjhi5w-1
X-Mimecast-MFC-AGG-ID: -lK2dN3LM3-cseEGUjhi5w_1746742301
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3d922570570so17598985ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 May 2025 15:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746742301; x=1747347101;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vnuh6wiFxQ9f/XAw8FJNLOGaIJWCLSrLa/Oh4b7bi68=;
 b=QZ7mwptKHsIjKlHQeKN6MSbPrglImVPfWb8PLZOCKq5rwkucguaUzCacsZmA29umAE
 w9+njSRR1UyfbHh1CUGaB3kV2l9nciXR9hHdPFazjtZwEk6fDwWJWFyUIzOYIfaZyGSv
 YuZfBjsZ8cpi4qIMQ2+ogM7gIDOFq49prs03/OlsnlPkTlnEJ24+kXVYZbIYULiw/inA
 mrqShwcZxkmWLs49tjQUtMM1dVja0mH+17F3qX8opjBgxhhpLz/kjQ0tGN8EaXt5Eczv
 F3pJz1tynjuFEEZ+qwoZyLnsmVlpUsEfbPNzJyCcgXps2E9C0pACpOUHQ0CrJ8YGIkuy
 f+5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPqYCNHlDWjuuX8LRjcNtSxJr90KnRoMZZl6H/vhSVQMuxR9X6ryPP4P5ecd68eFJcnfN3bZgG3wiHxYRNkL6l@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyqflERXRnyb1SlUCn8/iis9ZnuQMAYmhn/t22RH2GPrPWoVJJo
 Phnxvc8XCTp2Tta2U/o3F6pDtp3x77hqq6k2cYBlDDl8zkBimGb66kyDyf9AKmZrsceuixbFQLZ
 US8htQTPHHjsebL2KepcQErwwBv0BlDmlrWkMx2ulbRIxxgcnJt3M9/RZn68pc3Ybm8+IKeg2nF
 9VD2L1aH4aSw==
X-Gm-Gg: ASbGncvw9pzpJCFyH/fvxapVgaB/9Cd8oVlfrhH9sC/s/RPmwTG6QUs3KUQz8+V+UBb
 8tEQb/fMP5d5v7BdMxhmGi15vXYJqSSr8avQkthyrhHaUnRpyWWXk8+gAz4YarXXESR6XGOZUgp
 LaoBKRUUG3J5x+tndqxw62UpObDDZTtdqaGcupF1rNfTs9JLKs5G9evsGN9LUkWnla6bJ9iHQ61
 1mpcnz11eqpkGfNxn6MbyJDqu62H5E34LQm5DBanfjhNvX8vpdJRTcqjzQVxAFpRfSYuAdAbVZq
 8D2k7gV3pL/omIWU6TNvvyKADFgMZ4tXQE/VBozrzuXCU2IC7w==
X-Received: by 2002:a05:6e02:190e:b0:3d5:890b:d9df with SMTP id
 e9e14a558f8ab-3da7e20d8a3mr15751855ab.15.1746742300954; 
 Thu, 08 May 2025 15:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF4E0IAXwv+/PaYCfO+XQ4fUA0/3ACteNIKBO8zwcN3gG1+n6WDC6nxv/6y/DWPFC40TWPoA==
X-Received: by 2002:a05:6e02:190e:b0:3d5:890b:d9df with SMTP id
 e9e14a558f8ab-3da7e20d8a3mr15751745ab.15.1746742300675; 
 Thu, 08 May 2025 15:11:40 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2251c01bsm147208173.57.2025.05.08.15.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 15:11:39 -0700 (PDT)
Message-ID: <9f9bb488-ceaf-4e23-b27a-f4ac75f16504@redhat.com>
Date: Thu, 8 May 2025 17:11:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com>
 <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
 <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
In-Reply-To: <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m-J_ZJ2njDS8gtbKLHxxccTcfxc1wpY9b-la08FcST8_1746742301
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 10:52 AM,
 Eric Sandeen wrote: >>> + >>> + if
 (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions, 
 >>> + F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
 >>> + F2FS_CTX_INFO(ctx).extensions, [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uD9T8-0003a1-AJ
Subject: Re: [f2fs-dev] [PATCH V3 5/7] f2fs: separate the options parsing
 and options checking
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

On 5/8/25 10:52 AM, Eric Sandeen wrote:
>>> +
>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>> +				F2FS_CTX_INFO(ctx).extensions,
>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>> Can you please describe what is detailed confliction in the log? e.g. new
>> noext conflicts w/ new ext...

> Hmm, let me think about this. I had not noticed it was calling 
> f2fs_test_compress_extension 3 times, I wonder if there is a better option.
> I need to understand this approach better. Maybe Hongbo has thoughts.

(taking linux-fsdevel off cc: to reduce noise)

Looking at this some more, I don't think any information is lost with this
change. The messages are exactly the same as they were before, in the error
cases.

(I don't love the "check 3 times" logic, but I guess we have to check internal
ctx consistency, as well as ctx vs. sbi, and sbi vs. ctx).

I think that if you would like to see clearer error messages, that's outside
the scope of the mount API conversion.

(If you have an example of a kernel message difference under this mount API
conversion vs current upstream, I'd be happy to look in more detail.)

Thanks,
-Eric

>>> +		return -EINVAL;
>>> +	}
>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>> +				F2FS_OPTION(sbi).extensions,
>>> +				F2FS_OPTION(sbi).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>> Ditto,
>>
>>> +		return -EINVAL;
>>> +	}
>>> +	if (f2fs_test_compress_extension(F2FS_OPTION(sbi).noextensions,
>>> +				F2FS_OPTION(sbi).nocompress_ext_cnt,
>>> +				F2FS_CTX_INFO(ctx).extensions,
>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>> Ditto,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
