Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6B797FB6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Sep 2023 02:30:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qePOL-0005Zl-3T;
	Fri, 08 Sep 2023 00:30:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asml.silence@gmail.com>) id 1qePOK-0005Ze-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Sep 2023 00:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=; b=SjJrGR2kh5oYXBTQm6/sFt8ngp
 3sc5EUl87PZEjpwQa4X+s7QT8LJKwykduhx5jvdGNJs3AjxpSn1bBr5+Hcq4LwHHLzXa65oQ1eNgZ
 RPRHyieALcoVSQsUFIYl1aHhuYscD5WgrAXp3wi7umsvPTLmLL2qm6U55rwt4+vIBnfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=; b=Y3vBFAEUpYNnxMJHbOSWCn5NRP
 eKAAynLDTUUlcLLXXt2N7pjqVr4CbNH3K+McyX0Ida1XtLmJcxXXa1BA1c96CM61SYpPtOEAuIppt
 irmz+F1zl30U3T/uDCfVSV1t8Peq47YtFKsa/voJxlBr9J5KLSpGpC6wWrFDgtMzot4g=;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qePOG-0006pI-5c for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Sep 2023 00:30:33 +0000
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso575100866b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Sep 2023 17:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694133021; x=1694737821; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
 b=XhfuAIlH8iDpptnC52gcD4s2SrmIcjq/xdvrLoWb+WTV7kuqZSytVtwoywoH6Cf7Os
 2GaoeJdBvpEVENdrYUEPOZEnq7Ux/IyCTh0rx7pV/+l61dOogGGLbQW6hLvw5TAnRhqe
 Zc+cwWDH0a50tBJTDgYASdI4R2lY3Rf1NeB3j2ivya+IiCw0Xe0OunNL+GdMES1b6FTh
 8/PaWzNT7Fa6jZpxNysDSEpyZi4oAtEHylDS3MddYELxUMEiPC8NWnxKhRMdkAbd2XHu
 GCCDGv4xZRGMqK2HkoA75hnRyIh+1cnD5a3M/EY4EWYfM8hG8RqUQVvboXducs5jhmfr
 pWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694133021; x=1694737821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
 b=BG19JnqniqNhgyIL3lJ3y4HPJOdfGVhKX0LC4rpHUXNICq4u7yTJUHAbplCVsTcS5c
 kwkc1ChLQ4VFlIsmIlDbThLJnqBlgIOH9PiDYe4tY3Qa1uj4hd1WYa5wjjlw2mM/M/vS
 /iXw4+Fovg5JUTEsRO/3mdezq2VVgR/Ih7YP3jdsRNYKvIzsKPBs8axq9Aw2+tiiYYHW
 zXVuol6JiTME5ZqVPklazc66pKCFVTzWnBRllowU+VXDXg+kapD5wGB5f5MjswkKL9I/
 9N/Mfw60GisFHg5UaX83Wu5FSmiyNxzPD++u0HwBdnAmEeqvLR1BgxBxdn242Y8IR9bz
 H8fQ==
X-Gm-Message-State: AOJu0YwE+PNflBYam9OV44QqzpiaNg4a12Z5KhzmutvyJNFMMgtQ0j93
 LaPX1UOumH36U//QK/G7AP4=
X-Google-Smtp-Source: AGHT+IHUmcSd3yGn0Yc+fxHKH36GJLlYUzap6qvtcfMqwZgOcAgDOYhbcm3dJF4+eYZ9U6PvPuYQ6g==
X-Received: by 2002:a17:907:6e87:b0:9a1:c69c:9388 with SMTP id
 sh7-20020a1709076e8700b009a1c69c9388mr4152809ejc.37.1694133021412; 
 Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.141.16])
 by smtp.gmail.com with ESMTPSA id
 lz24-20020a170906fb1800b009932337747esm280974ejb.86.2023.09.07.17.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Message-ID: <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
Date: Fri, 8 Sep 2023 01:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>, Hao Xu <hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
 <ZPUJHAKzxvXiEDYA@dread.disaster.area>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/3/23 23:30, Dave Chinner wrote: > On Wed, Aug 30, 2023
 at 02:11:31PM +0800, Hao Xu wrote: >> On 8/29/23 19:53, Matthew Wilcox wrote:
 >>> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote: >> [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [asml.silence[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qePOG-0006pI-5c
Subject: Re: [f2fs-dev] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/3/23 23:30, Dave Chinner wrote:
> On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
>> On 8/29/23 19:53, Matthew Wilcox wrote:
>>> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
>>>> On 8/28/23 05:32, Matthew Wilcox wrote:
>>>>> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>>>>>> From: Hao Xu <howeyxu@tencent.com>
>>>>>>
>>>>>> Add a boolean parameter for file_accessed() to support nowait semantics.
>>>>>> Currently it is true only with io_uring as its initial caller.
>>>>>
>>>>> So why do we need to do this as part of this series?  Apparently it
>>>>> hasn't caused any problems for filemap_read().
>>>>>
>>>>
>>>> We need this parameter to indicate if nowait semantics should be enforced in
>>>> touch_atime(), There are locks and maybe IOs in it.
>>>
>>> That's not my point.  We currently call file_accessed() and
>>> touch_atime() for nowait reads and nowait writes.  You haven't done
>>> anything to fix those.
>>>
>>> I suspect you can trim this patchset down significantly by avoiding
>>> fixing the file_accessed() problem.  And then come back with a later
>>> patchset that fixes it for all nowait i/o.  Or do a separate prep series
>>
>> I'm ok to do that.
>>
>>> first that fixes it for the existing nowait users, and then a second
>>> series to do all the directory stuff.
>>>
>>> I'd do the first thing.  Just ignore the problem.  Directory atime
>>> updates cause I/O so rarely that you can afford to ignore it.  Almost
>>> everyone uses relatime or nodiratime.
>>
>> Hi Matthew,
>> The previous discussion shows this does cause issues in real
>> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
>>
> 
> Then separate it out into it's own patch set so we can have a
> discussion on the merits of requiring using noatime, relatime or
> lazytime for really latency sensitive IO applications. Changing code
> is not always the right solution...

Separation sounds reasonable, but it can hardly be said that only
latency sensitive apps would care about >1s nowait/async submission
delays. Presumably, btrfs can improve on that, but it still looks
like it's perfectly legit for filesystems do heavy stuff in
timestamping like waiting for IO. Right?

-- 
Pavel Begunkov


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
