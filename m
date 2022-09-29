Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B59225F011D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Sep 2022 00:58:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oe2Tr-0003vc-GZ;
	Thu, 29 Sep 2022 22:58:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oe2Tp-0003vW-My
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 22:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74jrsJFAQTFVMdeLtMShLFbIQzrOA/5UMG5O+ACNT6Y=; b=AHgw2lzEM/ZZUo6L7xSZN+T0C5
 xsnfkQqZGqatVL9wHiumJ002aEinScDGwc2ak+KPlgbjq0PfyvsGAlUXyaPUR4yM+fWxbEe2SFkBq
 Oce/tQiwXsRJSPgdaU5w9MUE9f/O/NDjA59c65KYVWAbZmrLlrZo77RTkVZ7lNdg3IK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74jrsJFAQTFVMdeLtMShLFbIQzrOA/5UMG5O+ACNT6Y=; b=C1r9nV5sJbu5LV5JqqECy1704v
 3tUA1lAJXcW8ltmOnD5v0z9odJAjd+RixfXfus+DS/JVkw1DuRTgi9f/jXyP1RV8MdO6FQnIBxfwt
 BgYsEfxF88P3DlgyZc6mOVCeFJmxMCF8JEFo9onFqc7WfVWVb/QDYSqYK++hd4+CnqYA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oe2TW-0003dG-KT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 22:57:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A636B82695
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Sep 2022 22:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD8EC433C1;
 Thu, 29 Sep 2022 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664492262;
 bh=MUcVUQTYxryqqYVf2atTyoGg3zkvvqO0ukcuowDbup0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cf3lyeYCpRU1KRK4vVwp+u/ncq/ckhO+YKh34GxBcB+Z7VQXuuUpBkmmBM58hSh2S
 tdf1oeDrGS+gJ2OUvMvBZgZktGcb3ciUrLt3wWGNGDF/IM72ZWL+zd4HlsKsynR1Av
 69zdR0u2MLWg8eNOQNetHWCKGdTffBKW845g45TwNhXsAu2deglV22J98Zwbm6+aoW
 89D3KRdqm0G+piSBNwsWmLC5fHJ+bPKflabqRIGlJclouobAGXMxid+0SwCWZgYO1k
 XQsNRuyyOUjutq0gHP/ilC5gThLnPfLit2khzDDMnQhLaJe9iVGNhTAIikXUCNjYVX
 mu7E9qj0YOkMw==
Message-ID: <45e56fa9-de7a-7858-f032-4433adb2b021@kernel.org>
Date: Fri, 30 Sep 2022 06:57:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
 <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
 <YzO8P7/XM4OckVSp@google.com>
 <7387ba71-46bd-aed9-d435-f234f486a7a0@kernel.org>
 <YzXjrn7oZzVmUz/n@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YzXjrn7oZzVmUz/n@google.com>
X-Spam-Score: -9.4 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/30 2:27, Jaegeuk Kim wrote: > On 09/28, Chao Yu
 wrote: >> On 2022/9/28 11:15, Jaegeuk Kim wrote: >>> On 09/28, Chao Yu wrote:
 >>>> On 2022/9/28 0:40, Jaegeuk Kim wrote: >>>>> On 09/25, Chao [...] 
 Content analysis details:   (-9.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oe2TW-0003dG-KT
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

On 2022/9/30 2:27, Jaegeuk Kim wrote:
> On 09/28, Chao Yu wrote:
>> On 2022/9/28 11:15, Jaegeuk Kim wrote:
>>> On 09/28, Chao Yu wrote:
>>>> On 2022/9/28 0:40, Jaegeuk Kim wrote:
>>>>> On 09/25, Chao Yu wrote:
>>>>>> Update allocation policy for ro feature:
>>>>>> - hot_data: allocating blocks by LBA ascending order
>>>>>> - hot_node: allocating blocks by LBA descending order
>>>>>
>>>>> This will increase the RO image size.
>>>>
>>>> Shouldn't RO image has fixed-size during mkfs?
>>>
>>> First run gives the reduced size information, and second round makes the image
>>> with the required size.
>>
>> I didn't get it, in which step it may increase the RO image size?
>>
>> IIUC, after we apply this patch, reduced size information won't change due
>> to that after sload in first run, total used block count should be fixed?
> 
> First run fills the data and leaves the maximum LBA touched in the image. Then,

How about caclulating required size w/ total used blocks rather than maximum LBA?

Thanks,

> it'll resize the image file and run again with the smallest image.
> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>>>> ---
>>>>>>     mkfs/f2fs_format.c | 4 ++--
>>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>>>>> index 40ac589..8d0f410 100644
>>>>>> --- a/mkfs/f2fs_format.c
>>>>>> +++ b/mkfs/f2fs_format.c
>>>>>> @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
>>>>>>     	}
>>>>>>     	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
>>>>>> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
>>>>>> +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
>>>>>>     		c.cur_seg[CURSEG_WARM_NODE] = 0;
>>>>>>     		c.cur_seg[CURSEG_COLD_NODE] = 0;
>>>>>> -		c.cur_seg[CURSEG_HOT_DATA] = 1;
>>>>>> +		c.cur_seg[CURSEG_HOT_DATA] = 0;
>>>>>>     		c.cur_seg[CURSEG_COLD_DATA] = 0;
>>>>>>     		c.cur_seg[CURSEG_WARM_DATA] = 0;
>>>>>>     	} else if (c.heap) {
>>>>>> -- 
>>>>>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
