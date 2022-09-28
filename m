Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B285EDC1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 14:00:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odVje-0004hb-7X;
	Wed, 28 Sep 2022 12:00:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1odVjM-0004hF-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 12:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCPW+z/7n7OdRIfE180L2/FHZIi8n18zDnB/fhrZjVA=; b=IGMkULDADHyRlqtIJwZg9vCGtb
 NO56aTwiZ3ohSKJ0B4+vES2QCUwDqXN07ugrMtIU9AH1SdRuzkSvg3br3iRKEvmaq00UksTPC9fHZ
 FlWvF1ALtcOdnwZPjfSSPVCn+C/q4/O7iRA+QhPcyIiNo/pLHBfrjKp4ieZzbYU2CGA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCPW+z/7n7OdRIfE180L2/FHZIi8n18zDnB/fhrZjVA=; b=YMK1+Vh183Bc5MQhSz8RJ/i+Up
 Ntvm0m/kfwQwKtixtsJG8qFW51KjPcOX2ssYp5UxOo4KOr+H8WqarxfxDZw9XE0wu1z7GUn9FmZTt
 7ox2xnp1Zr8I+4W9NG+Igbmu7xT8sib/sc5nNyTnAuCfW7hygYEgJI3VRKlP1L69PSZ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odVjM-005WSv-3N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 12:00:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD58E61DD9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 11:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4DAC433D6;
 Wed, 28 Sep 2022 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664366386;
 bh=QOZsBitzHJ8vBEfyTkS84z/UB0A3GmflR295674nxIw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fwtITXp3tqUO9t0KjyBj+zEpubNEm0Px4x8GoEv7aiHOkPaH2PqwY3drY/h7MVEJC
 MINbB3/2Be/Bm7HBjJAW/fnnXcWvOhbRp85C0EKr6PppHO5+d52MWFa6GQc6P+7F55
 V/68t9TJUBOYSIQzXZfJc2H1tMDTX8z4J5xhuvvbsnQzcZc4vtR0C9yDPjqFqoNOGi
 IR89ZI5LadVidxA0rdvoZL0c14hInlKyT6FMEkCryUlLE/hQeqHlQ9nS5kQUpXWBTU
 YgjXGox1MVZdbYi2wDXGxQWc2z5AtToKngxFxwMVfQ1BX7qNaDe99vfyx332qRKVZv
 SHRr9IMx0pz2w==
Message-ID: <7387ba71-46bd-aed9-d435-f234f486a7a0@kernel.org>
Date: Wed, 28 Sep 2022 19:59:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
 <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
 <YzO8P7/XM4OckVSp@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YzO8P7/XM4OckVSp@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/28 11:15, Jaegeuk Kim wrote: > On 09/28, Chao Yu
 wrote: >> On 2022/9/28 0:40, Jaegeuk Kim wrote: >>> On 09/25, Chao Yu wrote:
 >>>> Update allocation policy for ro feature: >>>> - hot_data: a [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odVjM-005WSv-3N
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/28 11:15, Jaegeuk Kim wrote:
> On 09/28, Chao Yu wrote:
>> On 2022/9/28 0:40, Jaegeuk Kim wrote:
>>> On 09/25, Chao Yu wrote:
>>>> Update allocation policy for ro feature:
>>>> - hot_data: allocating blocks by LBA ascending order
>>>> - hot_node: allocating blocks by LBA descending order
>>>
>>> This will increase the RO image size.
>>
>> Shouldn't RO image has fixed-size during mkfs?
> 
> First run gives the reduced size information, and second round makes the image
> with the required size.

I didn't get it, in which step it may increase the RO image size?

IIUC, after we apply this patch, reduced size information won't change due
to that after sload in first run, total used block count should be fixed?

Thanks,

> 
>>
>>>
>>>>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    mkfs/f2fs_format.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>>> index 40ac589..8d0f410 100644
>>>> --- a/mkfs/f2fs_format.c
>>>> +++ b/mkfs/f2fs_format.c
>>>> @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
>>>>    	}
>>>>    	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
>>>> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
>>>> +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
>>>>    		c.cur_seg[CURSEG_WARM_NODE] = 0;
>>>>    		c.cur_seg[CURSEG_COLD_NODE] = 0;
>>>> -		c.cur_seg[CURSEG_HOT_DATA] = 1;
>>>> +		c.cur_seg[CURSEG_HOT_DATA] = 0;
>>>>    		c.cur_seg[CURSEG_COLD_DATA] = 0;
>>>>    		c.cur_seg[CURSEG_WARM_DATA] = 0;
>>>>    	} else if (c.heap) {
>>>> -- 
>>>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
