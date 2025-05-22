Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6CAC0740
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 May 2025 10:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGjL59AXk+fPsn5jkCJtN5d22HuoOC7fl27H2yusp28=; b=TmYz2sdoB2D5Iklc1Qq9z+D7w0
	LbNpkeuAnLRB5+9WAYKl/PCR4R/wY9Ox/B8wYIRj/BNF2w8m31r/flimEZvA+Vh/Oz/hY0tRGSe6+
	2gEaciQSmMeKSLuBv2ANqLjYjyPm3QLIsYOWLQqGy8yD78UGzHvmQpWmBGVtzaXdps4o=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uI1QJ-0004qE-VD;
	Thu, 22 May 2025 08:37:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uI1QI-0004q7-Rg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmG8r0426YwbPhdQtVvaASK9I55k7GS2w/qupaM2J/k=; b=Ine5DvV7ylKYOOxvYGkqbHFXHc
 s1XCPBt/+Og5Umv9nz8LQIaEZb2L4cddJ3AzEhyhwV3m44LRuhYoWCz2CxDCroBNMdfOBjpvG8Q9S
 40RLC4VrGzlbJOlzGs26hGu5jm4EY3ioDoayCXG88UufMqrFTaicPEBEUpX+geTPU3LE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MmG8r0426YwbPhdQtVvaASK9I55k7GS2w/qupaM2J/k=; b=GuyULnTL2eR8W7N7DwlGCdKrLW
 u2JPzifrLZ44lZqeXdNzgn9Aie42JY87+yWiYD3fGG7tI79VcQIaRGUtrUHAMyLxq/Qkv0CKJZDUn
 C/veQ+Zh9e98JAjmZR/XGLoRUeuxO5NImkROYw3tEl64lG0XWqhXgjSpEUGH65N4wHYo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uI1QH-0006xJ-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1137C49C3B;
 Thu, 22 May 2025 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7791C4CEE4;
 Thu, 22 May 2025 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747903014;
 bh=hL+6H9AaWWoIjAEaas77G354kMS7X6T9lSREDfs09+I=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TQQGoeY3LpyZiuZn0KWdVEU+kWNSoElSz4ImZjatnYsFuvzo8nPRr1OXvnm/PZ4Ws
 RrSDHRHWYnZNFA9iph0QXJVQahbAq+TiYp3MJbHQZ4/tdg3ROqCRiF3K/mbBBb7QbA
 uhgJYWlKXQma5UFq0wFD0otLVwVc92Uca98FN+LIsNxfMRbiS6ZGu0/7DiUuWli5KG
 t8Zox9BGVqYzmLbmMEcnxMEiP5ZyXAr3colcOvcYblUik7qz30ow6+PBj8vhm5s6uS
 pk6ZiMjImIq4SgYtPV7h70btcIBIuNLN6O4yiy0xaoZ2GLu0UEGhv6PFt5ODwBHtDx
 NiT9XfCBnUIyw==
Message-ID: <1b490dd3-3f08-4955-babd-42203d80cfa4@kernel.org>
Date: Thu, 22 May 2025 16:36:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, zlang@kernel.org,
 fstests@vger.kernel.org
References: <20250522075706.1604641-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250522075706.1604641-1-guochunhai@vivo.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/22/25 15:57, Chunhai Guo wrote: > This is a regression
 test case to verify whether the CP_TRIMMED_FLAG is > properly set after
 performing
 the following steps: > 1. mount the f2fs filesystem > 2. [...] 
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
X-Headers-End: 1uI1QH-0006xJ-E5
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/014: test for missing 'trimmed' flag
 issue
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/22/25 15:57, Chunhai Guo wrote:
> This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> properly set after performing the following steps:
> 1. mount the f2fs filesystem
> 2. create a file, write data to it, then delete the file
> 3. unmount the filesystem
> 4. verify that the 'trimmed' flag is set in the checkpoint state
> 
> We should apply the commit ("f2fs: fix missing discard for active
> segments") to resolve the issue where the 'trimmed' flag is missing.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
