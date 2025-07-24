Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E5B10F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 17:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2CrrDy7d1ov1gAvkCrDIzNxdsYKKk81ufkEBKBx2a0=; b=Aja3iTIp47YD2zX4Kk7OlmieU8
	IT2527X6WONGzA16sIZigOZ57cUKbjlN9Jm7eBquKTg3ucn8FlPQX3JJUx1libcCLXqfw3ZuZi0ED
	4+9KH9A++oISxsrbyzEHEgSInYEmKpPxfWF5MYd/whBJrT7FDOtrFctUbjg2zjRzoKro=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueyIi-0006vX-TN;
	Thu, 24 Jul 2025 15:56:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ueyIZ-0006vB-4Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PIXg3pTrFiMgHy8BVrDsjSgZsU9C2X7mwU8cnLmehVM=; b=cIfepd7Du/3g3hIbHzyTsi/JqG
 osJIwvbVKHGPFaR28w+Ddjxg/Va0Q1AcQ7AORZ64oAnd7z17fh93D/QaAjw39GdlgiQfDrmtpbMUs
 RYa9upGRVo89uQfNSj2kUVS3KZJMWwlj2J4Ktm5sGqh06JLXSgyGxxE8A0/YZlY1/dUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PIXg3pTrFiMgHy8BVrDsjSgZsU9C2X7mwU8cnLmehVM=; b=IsJJ+fQuMAZ5VovyFPPC+pO24Y
 PlMCTWAKJ66alFSzNGmYrvnbYKi5jMyCRgIuATuRY95s+CNnSw5LIMgszo1wcWWCP3XEJbWIWm6TP
 IjOowDe3uHtmANsI6X1P94e9SxxVwjhwnAxSIS0r9gfvADAnXTf2qLgGEA5MuPGzwhB8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueyIY-0004IL-ME for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4ED875C686C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 15:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4CBC4CEED;
 Thu, 24 Jul 2025 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753372548;
 bh=FjTsWn4FVztCX6T9anaJ4B08KE8vzSkMBCDtNngxVuA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Te7FaPn/2whiiw9CiQ7FEQDycvqqAfBBbo84avWvEj6bw0qCK242CXJnk3v9I7r7S
 ttw8050P24edDYIR9YmAe+95jJVPyhBCRLRIgx/ITfSK+Ne2FVwNZasQmlV9EzLPMQ
 s18YSY7cgVhHwbWOdE3buwUunwaguJeD+bOBpojtVLQSoqqQNdKbbWQDHnDGNdr60c
 Z8U5Y/a/yg+/KYUfn+Ud/5PoVfRuyos32Hp69IyQkr/EJSW+mPTkoPUCAwiDDhuNov
 3R8qY9PMi3quf4y0nPKj92qGIMHkpNhBYx5okt7bDlfLKUM83aJbpibjXkisKUvSMr
 kCAAMdgelUBCA==
Message-ID: <c3991ef9-bb3a-4ac7-af1e-7d2d3a4511bf@kernel.org>
Date: Thu, 24 Jul 2025 23:55:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250724035654.3578627-1-chao@kernel.org>
 <aIJL-sNFvNlcg3nT@google.com>
Content-Language: en-US
In-Reply-To: <aIJL-sNFvNlcg3nT@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/24/2025 11:06 PM, Jaegeuk Kim wrote: > Can we disable
 linear lookup by default, but add an option to enable it? Sure. > > On 07/24, 
 Chao Yu wrote: >> It provides a way to disable linear lookup fallback during
 mkfs. >> >> Usage: >> >> 1. Disable linear lookup: >> mkfs.f2fs -f -O casefold
 -C utf8:hashonly /dev/vdb >> d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ueyIY-0004IL-ME
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/24/2025 11:06 PM, Jaegeuk Kim wrote:
> Can we disable linear lookup by default, but add an option to enable it?

Sure.

> 
> On 07/24, Chao Yu wrote:
>> It provides a way to disable linear lookup fallback during mkfs.
>>
>> Usage:
>>
>> 1. Disable linear lookup:
>> mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
>> dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
>> s_encoding_flags                        [0x       2 : 2]
>>
>> 2. Enable linear lookup:
>> mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
>> dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
>> s_encoding_flags                        [0x       0 : 0]
>>
>> mkfs.f2fs -f -O casefold -C utf8 /dev/vdb
>> dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
>> s_encoding_flags                        [0x       0 : 0]

Let me update the logic to disable linear lookup by default for case 2.2).

1)  mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
2.1) mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
2.2) mkfs.f2fs -f -O casefold -C utf8 /dev/vdb

Thanks,

>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   lib/libf2fs.c   | 1 +
>>   man/mkfs.f2fs.8 | 8 +++++++-
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
>> index 2f012c8..0e3e62a 100644
>> --- a/lib/libf2fs.c
>> +++ b/lib/libf2fs.c
>> @@ -1424,6 +1424,7 @@ static const struct enc_flags {
>>   	char *param;
>>   } encoding_flags[] = {
>>   	{ F2FS_ENC_STRICT_MODE_FL, "strict" },
>> +	{ F2FS_ENC_NO_COMPAT_FALLBACK_FL, "hashonly"}
>>   };
>>   
>>   /* Return a positive number < 0xff indicating the encoding magic number
>> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
>> index 8b3b0cc..b57f033 100644
>> --- a/man/mkfs.f2fs.8
>> +++ b/man/mkfs.f2fs.8
>> @@ -232,10 +232,16 @@ Use UTF-8 for casefolding.
>>   .I flags:
>>   .RS 1.2i
>>   .TP 1.2i
>> -.B strict
>> +.B [no]strict
>>   This flag specifies that invalid strings should be rejected by the filesystem.
>>   Default is disabled.
>>   .RE
>> +.RS 1.2i
>> +.TP 1.2i
>> +.B [no]hashonly
>> +This flag specifies that there is no linear lookup fallback during lookup.
>> +By default, linear lookup fallback is enabled.
>> +.RE
>>   .RE
>>   .TP
>>   .BI \-q
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
