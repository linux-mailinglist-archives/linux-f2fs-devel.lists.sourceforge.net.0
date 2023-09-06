Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00F7942A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Sep 2023 20:03:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdwrv-0006l6-6v;
	Wed, 06 Sep 2023 18:03:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qdsdD-0003Kf-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 13:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=efOoU/verQaAUfCkOmVwf718dsoHE8STDW5ho9fEvck=; b=YTjBboI9fxs8wQDVXHykmLaJN0
 eYP8T+7AdEk6vv7+CbYJFzfPH6IL/HuLXzhRdvEEjBsPrF1k7azgPXkGUjDiTtmHYuVoxfSR/5Pes
 nRyJg395rNguFLpCT3wyGkbU8KwlggY1ffge6N4qHSdJUr8YCjY2DGth3Jfz3z0Ql9KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=efOoU/verQaAUfCkOmVwf718dsoHE8STDW5ho9fEvck=; b=GGfitGAet2jSh/OA4BFbdhohGl
 i1Ve47xan82fVdGSYisBpCyouHrIY7ZT24bT2lxwp9jVuSZvfeoRbpTQv8G1vOk+AwB9SJcyXiYDp
 DieoODT3JMzxzTiNF76c3ghya97Hds8jLPaOhSs5mzBjWBFZDsrwU70XL9l4WffU6Vfs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdsdD-00BIEe-Iu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 13:31:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E42DFCE12CC;
 Wed,  6 Sep 2023 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5236FC433C7;
 Wed,  6 Sep 2023 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694007091;
 bh=zJzdnyVbgKuov4iHQd2mZOjHxGljRoGiBDg9rcd4yFA=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=oHpiidMj6A1fkSJtgtvYgalKnUnd2sIOn2Ak5pxZ6Qog6khUX9jmKuEUPolvRMfH0
 y219B8cKoU/e/swQGPKgm0t2PtLft0KMY8hzpkszTJQlfZQOecuJ7clObiHepzNLRg
 Q21muVtGzzryq6UwZ5ptGSqf+S1lXULiQTWA/2CyrE2foGiGaRr8+6B5FeXg76n2eL
 Vc90RgH/+f9eKasKByuTi8qN9WmBQ3v2VjFAE+sVV+CpYX7d9hj43wc6jBR8BYPUIp
 CehNF1BDAOzWVrt2Q1cmHOEvcXRMJ7LyRgPhDC7K1zuXh9kCKR8sf8c5w0ZCKbrfEV
 17opGA9iXgXMQ==
Message-ID: <aa4afdde-339d-1bdc-7ca3-1260aa7ae0bc@kernel.org>
Date: Wed, 6 Sep 2023 21:31:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chunhai Guo <guochunhai@vivo.com>
References: <20230831071011.56116-1-guochunhai@vivo.com>
 <0749d51f-bbc3-dfcb-93e3-c6c34614f403@kernel.org>
 <ZPYIfvwCd/UpMS8S@google.com> <e0f7b14b-b50f-4cee-a187-35383147aa3e@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <e0f7b14b-b50f-4cee-a187-35383147aa3e@vivo.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/5 21:42, Chunhai Guo wrote: > > > On 2023/9/5 0:40,
 Jaegeuk Kim wrote: >> On 09/04, Chao Yu wrote: >>> On 2023/8/31 15:10, Chunhai
 Guo wrote: >>>> The commit 344150999b7f ("f2fs: fix to avoi [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdsdD-00BIEe-Iu
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/5 21:42, Chunhai Guo wrote:
> 
> 
> On 2023/9/5 0:40, Jaegeuk Kim wrote:
>> On 09/04, Chao Yu wrote:
>>> On 2023/8/31 15:10, Chunhai Guo wrote:
>>>> The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
>>>> requires unplugging current->plug. Using blk_finish_plug() is unnecessary
>>>> as it sets current->plug as NULL and prevents wb_writeback() from using
>>>> plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.
>>>>
>>>> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
>>>> ---
>>>>     fs/f2fs/data.c | 3 +--
>>>>     fs/f2fs/node.c | 3 +--
>>>>     2 files changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 916e317ac925..77b4a55d6d94 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -3346,8 +3346,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>>     		atomic_inc(&sbi->wb_sync_req[DATA]);
>>>>     	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
>>>>     		/* to avoid potential deadlock */
>>>> -		if (current->plug)
>>>> -			blk_finish_plug(current->plug);
>>>
>>> What about?
>>>
>>> if (current->plug) {
>>> 	struct blk_plug *plug = current->plug;
>>>
>>> 	blk_finish_plug(plug);
>>> 	blk_start_plug(plug);
>>> }
>>>
>>> Jaegeuk, thoughts?
>>
>> By the way, do we really need to reuse current->plug again? After checkpoint
>> being done, we can use the plug in __f2fs_write_data_pages. Are there some
>> numbers to show the benefit?
>>
> 
> I don't have a number on this, but I think that reusing current->plug
> can help maintain the original intention of wb_writeback().
> Nevertheless, it can be a viable alternative to use the plug in
> __f2fs_write_data_pages().

I don't have numbers as well, but it can avoid break the intention of
per-writeback-work plug, which tries to merge IOs from all dirty inode.

Thanks,

> 
> Thanks.
>>>
>>> Thanks,
>>>
>>>> +		blk_flush_plug(current->plug, false);
>>>>     		goto skip_write;
>>>>     	}
>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>>> index ee2e1dd64f25..c4b5717a8c1a 100644
>>>> --- a/fs/f2fs/node.c
>>>> +++ b/fs/f2fs/node.c
>>>> @@ -2126,8 +2126,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
>>>>     		atomic_inc(&sbi->wb_sync_req[NODE]);
>>>>     	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
>>>>     		/* to avoid potential deadlock */
>>>> -		if (current->plug)
>>>> -			blk_finish_plug(current->plug);
>>>> +		blk_flush_plug(current->plug, false);
>>>>     		goto skip_write;
>>>>     	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
