Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689139E9FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 01:17:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqOV0-0004m7-JT; Mon, 07 Jun 2021 23:17:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1lqOUy-0004lz-O2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iG9jCR6+UM3/fQMtKinULDQEIvl0mgVy6Y11EarUHNo=; b=WoJZnV0xKTQQWEAse5FCIx682P
 UCm79NT8go8Oc8PcXvyK2JyeBjKy/tc7Azkxl8nnD80sCl+1eqyMWWxi/1TvIuvXLCpP3Fc69Pcxn
 4D/67aHCYKzNkcVKia5H1V2rmemv/5kBdQzNXBwg+v4QwDulW+cduw+3GzYrpn2lxpt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iG9jCR6+UM3/fQMtKinULDQEIvl0mgVy6Y11EarUHNo=; b=kzQ3GDHjFKWtB1iEavLmxfQv0p
 WRalBBxqUXKcEQaRuJDF2yAZqZOcd20R3/cxj1+/A6456GqUH29XiI4EaQPzmPGnJHZU/JPrzoKPZ
 c0mveOqqf1l8soE7yD0+V3NFXuHT+a4fK3/uPRTIIzN/qNc91tpe/3boHMnb215tFstE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqOUv-00Ghaw-P0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:17:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B3FB60FE8;
 Mon,  7 Jun 2021 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623107848;
 bh=uAFqAYU/bACW2VW9xPHzguF/tbVX9rGQ9607lmRbWBg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S3n99o9nkbIypvkfNCnFeQkEgWI4Zv2XzQxtAytJCWhyXx1Yql3SHBHDwmhjnS84d
 Tpu1xPA7U1/H4FeMTDVGPyoThU5pvRYlEwZ6kUtlGziKqfg8wouMBRu13Om8FpWh2u
 b6Ifg0upCmfIcoij86PhuhUoVPhKqc76cneuSchsS9QBZaQqgEmfw9Ou1askDNBBGw
 q2VwJ3XIxNj9UwEgFdVVssOjgIc/KV7jaA9sd7CdQsOTN7t2nPG4Fg544JulsRUd7N
 vAlp/6PJrRRhqLLKZ0Fl6RZiUBSVCEtRzY3sASgpkIExu7A38K94H5cdyvwGxxwOYZ
 Fh4B3SqfAauIA==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210525204955.2512409-1-jaegeuk@kernel.org>
 <20210525204955.2512409-2-jaegeuk@kernel.org>
 <95b5669f-a521-5865-2089-320e2a2493de@kernel.org>
 <YL5P15nLsc/3GQOY@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3f2c2543-c8a4-3477-76af-5c7614b643e8@kernel.org>
Date: Tue, 8 Jun 2021 07:17:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YL5P15nLsc/3GQOY@google.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqOUv-00Ghaw-P0
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

On 2021/6/8 0:56, Jaegeuk Kim wrote:
> On 06/06, Chao Yu wrote:
>> On 2021/5/26 4:49, Jaegeuk Kim wrote:
>>> Once we release compressed blocks, we used to set IMMUTABLE bit. But it turned
>>> out it disallows every fs operations which we don't need for compression.
>>>
>>> Let's just prevent writing data only.
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>> BTW, we need to expose .i_inline field to userspace since there is no
>> way to check status of inode whether it has released blocks?
> 
> Need to add some in F2FS_IOC_GET_COMPRESS_OPTION?

We should not change this interface, in order to keep its compatibility for
userspace usage. How about adding it in F2FS_IOC_GET_COMPRESS_OPTION_EX?

Thanks,

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
