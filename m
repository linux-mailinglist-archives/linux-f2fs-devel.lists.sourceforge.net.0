Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C28C60374
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Nov 2025 11:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdPouciAXhTpLFEf71uuEzPoNTf7hR2VYrpwgX1Yyas=; b=Z5ucKjoTNE74WotWO3cTO/35+B
	tKAJh3OGTvPa1tVv4iRLmymBq5WI7ANjBvcQ3VCqVxQ/VTFA8SEuv1pM+qnJOEZ6TnbUh9G8/91Fr
	aUiL9vwGYMvK0kY/j60xftb89qnzfCxViUChBd0AuNNIMC0M6qwEjnx6AkYoZtxtC4RU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKDy1-00054c-9O;
	Sat, 15 Nov 2025 10:57:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vKDxz-00054W-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 10:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L79Op5Dv9lC//lM7sdZMYD03VEEjYuibsMEhbOh2Qa4=; b=MnIXnuj58WksQgAK2HtstdBWoQ
 3lBdgBQFcYF2XSPfOkzPXss5HHpyfiCZc0IDBjvdqWuSQFiy51zGUJLIHPWE3EHchp/RLtIAR1qo7
 6Ayeuoqj2k89LMdvUStGl7613AhaAWRP2aRhI7Pjzguy0H4Ki4xpJ6FW5Y9IKNdEnP7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L79Op5Dv9lC//lM7sdZMYD03VEEjYuibsMEhbOh2Qa4=; b=b2Zs2fhKkvK3G060Q0/6g2frjA
 fvblQXmQUBr2DCjK2S0j4fErlR4Jlvlk15bmEYHWtJlLN56viXODGAi9+orbO2fNCK0BbZXbfXdVV
 Ig9vnQmK4PnxpK+QS9u5WEOWEADrQ8q1BnwqTo3w7iyR71jDTxAkyBsHZ+l+3bJ4wE5g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKDxy-0000Qg-NV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 10:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4196840B7F;
 Sat, 15 Nov 2025 10:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49453C113D0;
 Sat, 15 Nov 2025 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763204229;
 bh=foFDEWy+bYzmTH4FnmNpv5DVW7vFXf1COv38tcbMWMQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lsDgxk1qEQpdf7VQ2TdDAledI26/tY7jk0s/8Kcy+wGOFSmjoAlGns6+BmxBq/zo8
 S8NkKxseZncyXmcfMB+jQPLm0qS+/cuj0wDBnHGDPQ2xJDROq1PjsdJR5MnhN9oh0C
 vrOXda+dnh7/J22O3Ybbz1Vo4kBLOnvRXTqbn/85/OTYNSxwnVYANZrvGoh1Ewt0aR
 kGTUISKS3jr9HPmZFjPvg3/syPTVEPVl/dyz4eECJIXIffB/HwOj3wVmaopBrHqTin
 VO9eA/cwZpLuQUprczcn1Cme/4aqRWdtQQcWC9F6obJeEkY1l355qx67W/pgXyFbn1
 J4owRTx67Xfuw==
Message-ID: <3b3d2564-434a-4220-b62d-7c97b0955781@kernel.org>
Date: Sat, 15 Nov 2025 18:57:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20251112135223.3467852-1-joannechien@google.com>
 <20251112135223.3467852-2-joannechien@google.com>
 <98034c77-5e47-43ea-9c45-335e2cd51b68@kernel.org>
 <20251115064907.tfrm6d5p2zlpmf7u@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20251115064907.tfrm6d5p2zlpmf7u@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/15/2025 2:49 PM, Zorro Lang wrote: > On Fri, Nov 14,
 2025 at 09:33:58AM +0800, Chao Yu wrote: >> On 11/12/2025 9:52 PM, Joanne
 Chang wrote: >>> Add test cases to verify f2fs's support for differ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vKDxy-0000Qg-NV
Subject: Re: [f2fs-dev] [PATCH v1 2/3] f2fs/016: add test cases for
 test_dummy_encryption mount option
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Joanne Chang <joannechien@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/15/2025 2:49 PM, Zorro Lang wrote:
> On Fri, Nov 14, 2025 at 09:33:58AM +0800, Chao Yu wrote:
>> On 11/12/2025 9:52 PM, Joanne Chang wrote:
>>> Add test cases to verify f2fs's support for different versions of the
>>> "test_dummy_encryption" mount option.
>>>
>>> To ensure test robustness, the MKFS_OPTIONS and MOUNT_OPTIONS are
>>> cleared. This prevents additional options from interfereing with the
>>> test results.
>>>
>>> Signed-off-by: Joanne Chang <joannechien@google.com>
>>
>> To Zorro,
>>
>> The changes look good to me, though, still I want to confirm that whether
>> it is recommended or not to add new cases in old testcase.
> 
> Hi Chao,
> 
> I think this case isn't a regression test to uncover a known bug, it's a
> basic mount options test for f2fs. So that makes sense to me to add
> "test_dummy_encryption" into f2fs/016, especially if it doesn't need to
> bring in more _require_* restriction (right?) .

Zorro,

Thanks for the confirmation, I agree w/ that.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> Reviewed-by: Zorro Lang <zlang@redhat.com>
> 
> Thanks,
> Zorro
> 
>>
>> Thanks,
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
