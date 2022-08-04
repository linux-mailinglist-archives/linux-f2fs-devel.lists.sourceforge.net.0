Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86648589D12
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 15:51:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJbGJ-0000cF-EK; Thu, 04 Aug 2022 13:51:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJbGI-0000c6-Te
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t0YLRDoXjXkZ0uLk57gPeqK/NVxB+ds8DGraJuJzNms=; b=HS5Kd6nFCFQGr80NtNxiRRcRZV
 6iDjAXyCNst3dHXH8olgorCiBDBO2gu7f3wBIGyOkhoEM2A0lzqJ98ZCVdt88QfPV+Y2w6mOAGWbH
 gMDV1U+82ZZXH9mt8f2hr+zsoyQ2GQFKDhABQoylYGUijgAIGY9myzp72ecRYf1G2Vu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t0YLRDoXjXkZ0uLk57gPeqK/NVxB+ds8DGraJuJzNms=; b=fHPXttNckt6IPpx5rzyZojlFYo
 uk8saHTOFH05AhWaQWJI4vlaAoOi13zs2E8IktFH62r4nY/dbrNLpH/hYAiuFUqRo82Fv2Pr69ZR4
 5Lxy52ncK04lH66YA8ziKQ64cJ+vkx4txynfzHB3GHX/N5gtPfxxnXLqgWs1gnDY0XRU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJbFq-0007vC-HU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:51:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2CC9B82492;
 Thu,  4 Aug 2022 13:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB939C433D6;
 Thu,  4 Aug 2022 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659621043;
 bh=ypCEvGSbXL+VemXY0bh4lxvSFLUZsXpyG4Kso6XHBJc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WRakjXtJ5ZXQJIkhgx2mOUgfrRZBCkvoIq3nQUz3a9f1Q6oJoSwZ0AbkpARn71wK4
 emOWCy5YOP5Kx0LpQ85HCccSBmYzNRnGZMGKEOC3oOqNHfVjDXw5bd0RWRz5qLIV+x
 jU8P0fMHEsIm3hvmRQp7QKx0YNf2ednnLW4IJZw2FqdrG2e1Bqa/v8irCb53Hui29X
 atdRrol9TxRUTO6+B3sb8czwx6k6gOv2QHs3Gz9t71UHyXSEvhnfKL0c7Wv23hnI0l
 KK1JsEusNxXUar+oejPLpdvHnoX56iaAswopaDGAr0ja10Ob3jp0+rz7aBahsyImDB
 x3zPqr3VNqZNw==
Message-ID: <a6c31e43-76eb-fefb-b197-c44537cb45af@kernel.org>
Date: Thu, 4 Aug 2022 21:50:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Joe Perches <joe@perches.com>
References: <20220801092202.3134668-1-studentxswpy@163.com>
 <YugaBtQcoR4XhXiQ@infradead.org>
 <b43b3babb8aea836add289245c640688bec87829.camel@perches.com>
 <YutC7yUo/mTfty9q@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YutC7yUo/mTfty9q@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/4 11:54, Jaegeuk Kim wrote: > On 08/01, Joe Perches
 wrote: >> On Mon, 2022-08-01 at 11:23 -0700, Christoph Hellwig wrote: >>>
 On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com w [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJbFq-0007vC-HU
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: Christoph Hellwig <hch@infradead.org>, studentxswpy@163.com,
 linux-kernel@vger.kernel.org, Hacash Robot <hacashRobot@santino.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/4 11:54, Jaegeuk Kim wrote:
> On 08/01, Joe Perches wrote:
>> On Mon, 2022-08-01 at 11:23 -0700, Christoph Hellwig wrote:
>>> On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com wrote:
>>>> From: Xie Shaowen <studentxswpy@163.com>
>>>>
>>>> replace kmalloc with f2fs_kmalloc to keep f2fs code consistency.
>>>
>>> For that removing f2fs_kmalloc entirely would be way better.
>>
>> Dunno, maybe doubtful as there's a specific "fault injector" test
>> built around f2fs_<foo>alloc. (CONFIG_F2FS_FAULT_INJECTION)
> 
> Yes, it's very useful to run the test checking the ENOMEM case.

It's useful to cover more error paths for xxx_alloc functions in f2fs
with common testcases.

> 
>>
>> For a student lesson, it would significantly better to compile any
>> patch, especially to avoid broken patches, before submitting them.
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
