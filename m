Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B36073CD1A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 12:14:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5QIF-0000KY-Hl; Mon, 19 Jul 2021 10:14:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m5QID-0000KL-Pj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 10:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFGUhSW5rKUZ2w50N0EeyXzH5htIhaxaK/ZNnR8rUwU=; b=Rnt9rbWPOXU0+1XUJwPNtf0baG
 jyef6QK+16eUinXqZZvkJAuUjykOQAge8CzMB6W2thBEFWMmCCO9hVsIEqkdBbUJgUrjP2KrCNpuL
 WrCGxjte8Bl3LdC1ghZxJoFc7Hp9P7orVLLDLc3evCp5wX/QtjFBysfdw+ujWymMFXX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFGUhSW5rKUZ2w50N0EeyXzH5htIhaxaK/ZNnR8rUwU=; b=hjVsqfOG7fXMr9VqaeIm5rU6ml
 A1uEJ/cl4BpXCAryFQWv3uJ4OP+Nd0b8bJsbNj2uW/4W8SYAAyy+UYmqRVRWbQlGlTuHFcnNbe5kI
 4i40vtU5xUiHb9c/jqGcuo+lfPkb+A0pieTl1P++uLeQbmCP4cvuSZsevmQ1mj9DO14w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5QI7-0001sL-EN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 10:14:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDA95610FB;
 Mon, 19 Jul 2021 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626689655;
 bh=rYC7aQKYgHYQCFvRw2maH8wY3BWJyC1CnuBoXJUs47U=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Q1S/OSOlJcOaAc0PIEM7SHSkJ1dp9HRWtEGE/dcSgDzINu+8qLVb6tCx82JuGoRPM
 IEbNPpaIKazg0G64q/p38pNCPymtsw0jYWpwNqtkYNyF+Y0jrCKXXbH3EVxthOXXQw
 tyfZIRLMKifEIVQtbgQjug/jWC23MpY68BCffZxCTTs9kVTcaaOtjxWA/8J11Lp6L5
 DVmtOb8Bml4XTk7ldN687jZMgIKw0iUyHjE8Mk5wjGx/M9VBZpqgOGMkW6wOJLzlr6
 NR8gbd4xyXtCxzfAjdsbQVZH9WEgcnnhBFCBbPbMXoa1qD1XoGBFpz46fFkzGm6acs
 VOJKZUL3GET2w==
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210622115059.24860-1-changfengnan@vivo.com>
 <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
 <73528afe-8331-85af-48c1-f9d733ed8e39@kernel.org>
 <YO4lZxIH772ms1wB@google.com>
 <92a5734d-c1f7-8088-f3af-43b8cac42991@kernel.org>
Message-ID: <368e56cb-17d9-d589-6155-817430991ea9@kernel.org>
Date: Mon, 19 Jul 2021 18:14:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <92a5734d-c1f7-8088-f3af-43b8cac42991@kernel.org>
Content-Language: en-US
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5QI7-0001sL-EN
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/14 9:18, Chao Yu wrote:
> On 2021/7/14 7:44, Jaegeuk Kim wrote:
>> On 07/13, Chao Yu wrote:
>>> On 2021/7/13 10:35, Fengnan Chang wrote:
>>>> Hi Jaegeuk:
>>>> 	Any comments about this version?
>>>>
>>>> On 2021/6/22 19:50, Fengnan Chang wrote:
>>>>> when we overwrite the whole page in cluster, we don't need read original
>>>>> data before write, because after write_end(), writepages() can help to
>>>>> load left data in that cluster.
>>>
>>> Jaegeuk,
>>>
>>> Let's queue this in dev-test for testing?
>>
>> A bit worry about unknown corner cases tho, Chao, could you please test
>> as well?
> 
> Yup, I just plan to do this, may focus on data consistence.

I have time to check the data consistence for this change, I've ran a
customized script (overwrite partial blocks of compressed cluster with
original data, sync, drop cache and compare the data), there is no data
corruption till now.

Thanks,

> 
> Thanks,
> 
>>
>>>
>>> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
