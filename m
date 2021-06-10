Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA583A2F3F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jun 2021 17:24:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrMY7-0003EO-Tt; Thu, 10 Jun 2021 15:24:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lrMY5-0003EG-Or
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 15:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8r0v1G5dXjtWTb1L1VQPJP4vY6mLtcahIjtsp1FQ1k=; b=RL9i4xKJX/InEqPOTPzXFwfMHI
 7Le+aPMgoxpxhuZNeSHlVklPu/M0RwAvAkES2V30gQFOSEStqi3gTE9oJk/iD1Ztq/tw7o6Us8OSJ
 Bq5fX7KygxPPaXFQZMyxYAkyECJOCu/8rtamXddjynBFarT7XWyfBIcFXOTELV6mNrxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x8r0v1G5dXjtWTb1L1VQPJP4vY6mLtcahIjtsp1FQ1k=; b=KByDqscC4LKtxfWsnwAnnr0bqF
 XCbwzH+dsM5/LIzR1UGmQcv+Sd87lKGvHSeHAuLWye0wjplSEp8AXVeAabO49rZDmCqu8XHSBk69U
 OfogQY6RcNvkc9Jbhtp2brwwXul0aFsPzr3TzZvJHuMSTAs5RrigvrOkS7Ca7rwg+fuI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lrMY1-000352-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 15:24:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F6F760231;
 Thu, 10 Jun 2021 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623338681;
 bh=Z9DXrGBlZtJ7EjBpFHqP4z2CDz1wxkr66cHPD11hj/0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JgWUeglEwGBAd0KI4qaetEaUalbQ/G6ksjts/m19OO8rgW4RieRVI1cWNask25La7
 5lfYVHNd8b7UGAGZcDtL0biSM8dfOPQ6ZRV0IPUYmOKsKd2rBhYbzBxbSnhW3BX9vC
 2A6w5QORhE/8FjRe0VwhFbAODOxxmZuDSo2zfm4fz/Rw+uHuVapGU7adJ0UzOTKOvd
 Scbfr0t1RkuaLewqa3qIPZ1VMkjgOHNzI2ILdzOJEg/z0UseJlQFM309ZneGu/f5G5
 WbrMbg/+S+borMPowAaUMz5Mdbl2PSD4K6plT7VrvNLLaLYQHHmOtqsjwhEiFP5GWz
 3LGjnD/DBXUkQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210525204955.2512409-1-jaegeuk@kernel.org>
 <20210525204955.2512409-2-jaegeuk@kernel.org>
 <95b5669f-a521-5865-2089-320e2a2493de@kernel.org>
 <YL5P15nLsc/3GQOY@google.com>
 <3f2c2543-c8a4-3477-76af-5c7614b643e8@kernel.org>
 <YMEL06gZC5n3J2bX@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a7a3078e-918d-53f2-6bff-537934094631@kernel.org>
Date: Thu, 10 Jun 2021 23:24:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMEL06gZC5n3J2bX@google.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lrMY1-000352-Fx
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce FI_COMPRESS_RELEASED
 instead of using IMMUTABLE bit
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/10 2:43, Jaegeuk Kim wrote:
> On 06/08, Chao Yu wrote:
>> On 2021/6/8 0:56, Jaegeuk Kim wrote:
>>> On 06/06, Chao Yu wrote:
>>>> On 2021/5/26 4:49, Jaegeuk Kim wrote:
>>>>> Once we release compressed blocks, we used to set IMMUTABLE bit. But it turned
>>>>> out it disallows every fs operations which we don't need for compression.
>>>>>
>>>>> Let's just prevent writing data only.
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>
>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>
>>>> BTW, we need to expose .i_inline field to userspace since there is no
>>>> way to check status of inode whether it has released blocks?
>>>
>>> Need to add some in F2FS_IOC_GET_COMPRESS_OPTION?
>>
>> We should not change this interface, in order to keep its compatibility for
>> userspace usage. How about adding it in F2FS_IOC_GET_COMPRESS_OPTION_EX?
> 
> Hmm, or need to add it in getflags?

Not sure whether the flag may conflict with the bit FS_*_FL used in
lsattr/chattr.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
