Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3270AB2E43
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 05:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gocXiX4Enw9F4GAgiIFwRGrhDz4rECy3KHJFz3TkYts=; b=HNIBF1d0Ky0J8RRDYnPQuilHW/
	h0Vnn1EwrMPJzD1Nm2g8/o2C+skTuEE+a/mJG2WFF8vUvIp6f3iJrNPW4M0hoxXYoLG1qKgOCdcxy
	r6zmNRRbHiVbN0/916xXII/xot503V3z59h4B90IXVOFKUgJl9wSZb/u917wPdellgXc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEKK9-0006T0-V4;
	Mon, 12 May 2025 03:59:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEKK8-0006Su-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTFo+wCyrVFzH5zeoPklSw4AcjAPLBox+pYEESsRYzU=; b=Qwikfx+upTY3UxT3UvC+yQj73P
 bzniF9isWxzHE3RGDbqA5LviPrqyz1AkJZICK/Rse0fsPfGtsN4/OxGGMSemIPXBllyxyLJWIMURA
 mlXETkIfTMn6xWScrGNB2GPXqN2EJNOMlW44tTJNP1u7wtn2wJoHUpHgCJT/XJS3AWPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTFo+wCyrVFzH5zeoPklSw4AcjAPLBox+pYEESsRYzU=; b=NXlP8/9pAS6O75IuJDhxvGynhV
 GcDfkWS2DrWXnuHgIkItvfPwExKbXUVOfMrvPkyLfO9drOvPqrRyZSZFMUnTCF9vgG4T+BBGc/po7
 3gjWGzEwrbXqAG/sZvlm89FrvC9WjB2VcLx3p7aTQvVANN3h0bADLKZSge7VlrmSeECc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEKK7-0008RQ-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 106336116F;
 Mon, 12 May 2025 03:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0547C4CEE7;
 Mon, 12 May 2025 03:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747022361;
 bh=m33sL63sKfE3zgdTcdDSQHiRwqKw+8+9u/tgeSYiPEA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=u9Q+i+Fu+b1o6UBW4NWSHTr/2yX51IuEGz/cxHbuNdlqdTYHg5NqqLE/FEFU4dRzT
 yVqu5rYV1meFWPW0/13nYeFqa5iPlvOe6U5wg3GKNbjZQZdlQaykpRazPzUveR16gA
 UrpxlTyVb3KbyvmHHjfS/tKFDc1kxLVCyJ7x/g4V7rLx8vaQnKThUqDH9Th5uiV9am
 phVtFWBJZ9nbUJyaUdOZbcAvWA67x0YGXgr8bS0393fyugeq61RBzJaWwUuchstMFv
 0n+RpCdJ//7Hf0USN1+FL7wBS59jL13iAe1hhKHDOCj46O8RqgUDper38Tv9lorkOf
 tjel9prbJqgaA==
Message-ID: <8cceb6a8-3887-4fdb-af9a-caa95514affc@kernel.org>
Date: Mon, 12 May 2025 11:59:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com>
 <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
 <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
 <9f9bb488-ceaf-4e23-b27a-f4ac75f16504@redhat.com>
Content-Language: en-US
In-Reply-To: <9f9bb488-ceaf-4e23-b27a-f4ac75f16504@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/9/25 06:11, Eric Sandeen wrote: > On 5/8/25 10:52 AM,
 Eric Sandeen wrote: >>>> + >>>> + if
 (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions, 
 >>>> + F2FS_CTX_INFO(ctx).nocompress_ext_ [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEKK7-0008RQ-T5
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/9/25 06:11, Eric Sandeen wrote:
> On 5/8/25 10:52 AM, Eric Sandeen wrote:
>>>> +
>>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>>> +				F2FS_CTX_INFO(ctx).extensions,
>>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>> Can you please describe what is detailed confliction in the log? e.g. new
>>> noext conflicts w/ new ext...
> 
>> Hmm, let me think about this. I had not noticed it was calling 
>> f2fs_test_compress_extension 3 times, I wonder if there is a better option.
>> I need to understand this approach better. Maybe Hongbo has thoughts.
> 
> (taking linux-fsdevel off cc: to reduce noise)
> 
> Looking at this some more, I don't think any information is lost with this
> change. The messages are exactly the same as they were before, in the error
> cases.
> 
> (I don't love the "check 3 times" logic, but I guess we have to check internal
> ctx consistency, as well as ctx vs. sbi, and sbi vs. ctx).
> 
> I think that if you would like to see clearer error messages, that's outside
> the scope of the mount API conversion.
> 
> (If you have an example of a kernel message difference under this mount API
> conversion vs current upstream, I'd be happy to look in more detail.)

Please check my previous reply.

Anyway, it's fine to not update the log in mount API series, since it's minor.
I can handle it later. :)

Thanks,

> 
> Thanks,
> -Eric
> 
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>>> +				F2FS_OPTION(sbi).extensions,
>>>> +				F2FS_OPTION(sbi).compress_ext_cnt)) {
>>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>> Ditto,
>>>
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	if (f2fs_test_compress_extension(F2FS_OPTION(sbi).noextensions,
>>>> +				F2FS_OPTION(sbi).nocompress_ext_cnt,
>>>> +				F2FS_CTX_INFO(ctx).extensions,
>>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>> Ditto,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
