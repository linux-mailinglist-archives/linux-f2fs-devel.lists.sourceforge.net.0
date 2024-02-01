Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C2845175
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 07:37:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVQhM-0007IM-8l;
	Thu, 01 Feb 2024 06:37:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rVQhK-0007I7-Te
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0XftTZmMqVSvJL+EjU+2m5OO9k8gWhkt4r5NbjjDQk=; b=lFjXFszsqJSm8k9A2Lv14gtBFp
 jnRTXDbZmwkHzf8ST9L6BCEGCwz31Swo/7wtx2x4hM6kW2lLzOMF35HLl5si2uAW6/G7LqqT9TZIy
 rcEydg18XK2DBB5anbilBn6CJDoHY/2lGEaqGH0rkqtxFKzmPXfgBA/tb4AQCSOfXyJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0XftTZmMqVSvJL+EjU+2m5OO9k8gWhkt4r5NbjjDQk=; b=EIcuCf/zZMAn8zw01njIaj8tl6
 fZ6bM7s1ezD6Pv5NlQ20z4dw1qZp13ah4i3FgVoEIsXCEtnzOxl7dy+mHAJqnO9w79HS6VXsdFrat
 6/l6GTwdyczcsY2JKg1wWF+FuitaxiLGVANfW65SkBd/uHnXN3SVvDthrGhb8CiSc1iw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVQhK-0006gL-4E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6878E61D13;
 Thu,  1 Feb 2024 06:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F45EC433C7;
 Thu,  1 Feb 2024 06:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706769428;
 bh=zdkLy9fauD+A9v8dM4kOHEFhsRRUum7BFXWpjWp5NtI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C/YRV7bbzttn4RPVurN88DPBtxTo+ldlSzcqM2gK4Nay2MGQRJqaMRkz9dMtxzRPL
 8OIzFFh4jgnzDpPkPIUdRXNor+TuaZaNHJ9JmIeRrWQcVRvUVJnARH0nvFuMKgesjs
 0nJ+7fmR+AKUI+ls1tvIcFx4yt7pmSdVuMw7ipdY50JnfcmxYciidODzTw8TV6E6jM
 Q0KsSDvFF+j2wRIyxezwbdZ/FvpkRl8gRsn8MHGi6HJbcGuAJD/PD/gRdSJlYlHNEW
 Y0LHPeGR5jshqmZI6GevrkRN78wMbp4ptLDBh5YRlhP3QkWMg5vQAyYC9rUK6TXOWg
 jTxPkS/fq8NgQ==
Message-ID: <c4b31e03-1cad-4525-a40a-ede78549cb17@kernel.org>
Date: Thu, 1 Feb 2024 14:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: zhangxirui <xirui.zhang@vivo.com>
References: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
 <20240201064043.4082115-1-xirui.zhang@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240201064043.4082115-1-xirui.zhang@vivo.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/1 14:40, zhangxirui wrote: > On 2024/1/26 14:37,
 zhangxirui wrote: >>> In sparse mode we just read or write to a sparse file
 not a block device >>> so no need to check device mount state in [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVQhK-0006gL-4E
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: skip check device mount state in
 sparse mode
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/1 14:40, zhangxirui wrote:
> On 2024/1/26 14:37, zhangxirui wrote:
>>> In sparse mode we just read or write to a sparse file not a block device
>>> so no need to check device mount state in sparse mode.
>>
>> I guess it needs to check whether regular file was a backfile of mounted
>> loop device, so we can only skip block device related check?
>>
>> https://lore.kernel.org/linux-f2fs-devel/20240131073425.4043962-1-chao@kernel.org
>>
>> Thanks,
> 
> Ah, yes, it needs to check whether regular file was a backfile of mounted loop devce,
> but it does not conflict with skip check device mount state in sparse mode.
> 
> Sparse file is Android only for making userdata.img or other rw partion image, in this case
> i guess we will not mkfs to a backfile of mounted loop device, right? skip check mount state is more efficient.

But this patch leaves a hole to mkfs backfile of loop device w/ -S option
in non-Android system, right?

Thanks,

> 
>>
>>>
>>> Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
>>> ---
>>>    lib/libf2fs.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
>>> index 2451201..5315de2 100644
>>> --- a/lib/libf2fs.c
>>> +++ b/lib/libf2fs.c
>>> @@ -830,6 +830,10 @@ int f2fs_devs_are_umounted(void)
>>>    {
>>>    	int i;
>>>
>>> +	/*no need to check device mount state in sparse mode*/
>>> +	if (c.sparse_mode)
>>> +		return 0;
>>> +
>>>    	for (i = 0; i < c.ndevs; i++)
>>>    		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
>>>    			return -1;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
