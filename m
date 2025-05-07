Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9943AAED47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 22:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XsfT9V3NsjKhp5NfXA8KJIo6fn9NHX2bLE5Ahv/J08=; b=MJN0ZajFJQ9mMRzBUFHf8Y5wwq
	4fUElrMqG3JroaaHlOvF7/4g2JWFL3GB2hZrprE/x9Qg1Tm+9tFvwCsyDnUgT7ZOwKSezyhvnGVb+
	kyybh0VikP7s9In9/tflm+Xm7lKXQboln9wuSXJz8J0zzfqlwhrZWN20tcTkPrTrL9k8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uClen-0003H4-M4;
	Wed, 07 May 2025 20:46:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uClel-0003Go-25
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZtvJYDNlO6G6hDwP0P9OZNeT6PCGTZnZorZ/GCvPqHw=; b=ZOPvFUj4Hx1Ljc9coMl3mBsyyd
 UH/RbfE95ETY7RDpqDagvGd1km4cfxc50cAC50AD1ZV2ma7p/0FweNOGL0LxoB+Ut7TOPqSWJmS6m
 AdVkVpNgcZbPdQ53gVn28TQWmN9bD5S/z5h8tXDXE3dBrZ1coz9YyG4zm6Mpsj6Dof84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZtvJYDNlO6G6hDwP0P9OZNeT6PCGTZnZorZ/GCvPqHw=; b=CDwgBF+iXnafyY7eurCFX9wRj/
 SLu5/kXkEn7SPlV2vk3C5YkKvjz3z2pIj0MdW4X5/vuE52qglKw7HhzXBtBdrRkrH4tfJHmznxsLI
 Zam/qWKB5xfC5Bk+sMUzaLQqnB5ns5EC3Wvw9qbPMOP6txsmlvnJmvwDidJXOgCL24sc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uClej-0006IE-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746650766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtvJYDNlO6G6hDwP0P9OZNeT6PCGTZnZorZ/GCvPqHw=;
 b=IV2L6LOrVVGTqJx6T1xM9qfG++Hx4Qjs7hkSy6GMyoCTIPxMaSwjkMSKNCWUIMjyAsZ+mk
 +z+KaykuwnBfWv0PNMYL4jhtRH+VBVxxctWRi3utTz5nevZp9lLMlXFb5mJl05ZK7pht5z
 K4mnW+RWCPnKk/p1G2vWFcCzlJtIhQE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-9pBtWYWiM-Sd75pLPaiMTw-1; Wed, 07 May 2025 16:46:05 -0400
X-MC-Unique: 9pBtWYWiM-Sd75pLPaiMTw-1
X-Mimecast-MFC-AGG-ID: 9pBtWYWiM-Sd75pLPaiMTw_1746650765
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3da717e86b1so2770515ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 May 2025 13:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650765; x=1747255565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZtvJYDNlO6G6hDwP0P9OZNeT6PCGTZnZorZ/GCvPqHw=;
 b=WJO5EULYiQ4NZnF1AXiwE44tFEqcJbh7K9NeLc5VSw6Svfuy85+mbLKVX26giXA6EA
 jllJ/qp2FFzP03cO3fqfV+yUq1JB+zB4x4f6B12Ckms3AhylBEsd+XmsFalVBfE+NUBq
 Z8je8FYq7OFcqzzH9AoTY1edoRTVWmomsjgxZiUVwZRPZ0Tb/bYG4bo1/p1P2kccluz1
 gscEz7FIAUtlnwULCJfzuX925RCwC1CLEexF0KkAOloe2A3dnQk0mV/y0r2HIKCng/Z5
 lKqvxL5RO5WqVf7HYCMWE1GP093tbktrpvx0tOWs1rIv6XhcBCuDrYpv79V08sEReV8I
 lJpw==
X-Gm-Message-State: AOJu0YxhYVmXojq5OKtUxKSCgIBwaeYZI5V2Cuh6BArWRr8iBDDb0/wu
 yyj/5wJY84Ua2/cWoAnnQAeh/MLjQ1V6rnDswkfB0LphgVchPE+X06SvknGpZ2RCsj1n0PvWZLT
 GLEMslCHddfebunaM/d97awi6oeYX6IWU8XydVJT144a01hN4xxuPcF6QAmzFlki9hhDBoX6vuu
 k=
X-Gm-Gg: ASbGncuYlt4uV2hla4gokGkBsnu/E/eOSttXM3HwQXIBMX2HglQoxlIH/ETy3VFpGVY
 WXmliK3hGbcydyiLfENmayTALElhbTUe9RRJBshpcOElBTxUKUsUzOQAeK9VS9ZivkYhKCJ7JAd
 JEpdYcrEwYMzE8XlbA5Qdl3/z8vAVExn2phfnwLkZFw1+3/ja7zCCGx6zpSG2re/VXC6izXrxBT
 5CrMBob74AiqezNFe1+dtZoSA6thkNaiJc51DpL5/r5wBtqnpLQHkLnXUau6dKurYpqEO61aA7Y
 NqMBDi0GH41yMYInbYW0deGzFGU2gK60Rm5pVfRxm7lgHW7B5Q==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr57875335ab.20.1746650764719; 
 Wed, 07 May 2025 13:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHScsCoRYIjUNWW5yDa0E+5rQrYqBqSuhif/7D+Zq0+3jJ4Uj1U10vDL6uVhOSKCIfNdkckww==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr57875155ab.20.1746650764416; 
 Wed, 07 May 2025 13:46:04 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88a91b069sm2895193173.52.2025.05.07.13.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 13:46:04 -0700 (PDT)
Message-ID: <f1674387-66d3-443f-8d48-74d8dfd111f1@redhat.com>
Date: Wed, 7 May 2025 15:46:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
 <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
 <25cb13c8-3123-4ee6-b0bc-b44f3039b6c1@redhat.com>
 <aBtyRFIrDU3IfQhV@google.com>
 <6528bdf7-3f8b-41c0-acfe-a293d68176a7@redhat.com>
 <aBu5CU7k0568RU6E@google.com>
 <e72e0693-6590-4c1e-8bb8-9d891e1bc5c0@redhat.com>
 <aBvCi9KplfQ_7Gsn@google.com>
In-Reply-To: <aBvCi9KplfQ_7Gsn@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VIkoRQOHKAAr-7oZOTYNGDtj126GCIQkbvDYY1Zsbw0_1746650765
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 3:28 PM, Jaegeuk Kim wrote: >> But as far as I can
 tell, at least for the extent cache, remount is handled >> properly already
 (with the hunk above): >> >> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.f [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uClej-0006IE-Vi
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 3:28 PM, Jaegeuk Kim wrote:
>> But as far as I can tell, at least for the extent cache, remount is handled
>> properly already (with the hunk above):
>>
>> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
>> # mount /dev/vdb mnt
>> # mount -o remount,noextent_cache mnt
>> mount: /root/mnt: mount point not mounted or bad option.
>>        dmesg(1) may have more information after failed mount system call.
>> # dmesg | tail -n 1
>> [60012.364941] F2FS-fs (vdb): device aliasing requires extent cache
>> #
>>
>> I haven't tested with i.e. blkzoned devices though, is there a testcase
>> that fails for you?
> I'm worrying about any missing case to check options enabled by default_options.
> For example, in the case of device_aliasing, we rely on enabling extent_cache
> by default_options, which was not caught by f2fs_check_opt_consistency.
> 
> I was thinking that we'd need a post sanity check.

I see. If you want a "belt and suspenders" approach and it works for
you, no argument from me :)

-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
