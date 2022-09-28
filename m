Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B55ED2C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 03:49:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odMCT-0003U8-IO;
	Wed, 28 Sep 2022 01:49:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1odMCS-0003U2-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 01:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KpbDH7Z4Uneze4tpTuEMDymjQ4YMauLOr9i/ieSxJh8=; b=Ydd/xlFz7m+z/FmtcGyNwKRcGu
 OZ8kpOHFkzxEZWQLwUjZrgHZbbtLsoYISf7uSMSDt2JG47Bwn2+trRgu85DlDAhhk7y0CPz+Vsi/5
 9TwarjzzXoHhM1yNmzlXlNwp1MjLhsoarY2Kue9IKiK0JuIO8sHsNibqO36ekFHD+ugw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KpbDH7Z4Uneze4tpTuEMDymjQ4YMauLOr9i/ieSxJh8=; b=ZNmm+c4HoRXxyHo5iGREuGFuRK
 MsixYt8WmkJ2zVen3qfxgXpurlPBlHXmQTg8lJW4KLA046kkJ9SfRcUM0Lr0PmarHx6/RHRGhbchV
 6BVhojvz9jU/FgDf7c8KVFdl5Cb/qtEJveiJ3v9qTW7RbNGITPN3BTjLVLwZtw1fAwFw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odMCL-0054z7-GI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 01:49:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AD9461B75
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 01:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAA6C433D6;
 Wed, 28 Sep 2022 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664329741;
 bh=b0ZeihMjbIw6bQi0OC2wreSd8QeMJqOj+5hijpkjRPI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DxnU1iKNt+P75iTXVGF73AxWyf6xIGFFyqQajGxUfXbz86qW3np8TXeWOymT3MyPW
 45cRalfo2WOcIKofv7wGFU6t7CTrmmoxxY46mR1dZTT8UZOG3yAclYhPTNrmsghurj
 M4zOSMLa0Et52TUhbjIRtDztbMVjfCp8IvpcMDWJZA7m3tUS9XES2C/FJGt8vvtTqV
 v8cuCVKdnZKRhuu89lRjmsjZNmQqWQdW4nTpoYwz89KhTIOWpUGJiiAjUklxUW+/fM
 /A1kDm7JzD3TY5bWt48cn25pByzLjXkjqqbGIPTm1hylBKTqOWKW9vxlbKj1OE8rHh
 /YrBgIc8roJkA==
Message-ID: <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
Date: Wed, 28 Sep 2022 09:48:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YzMnm4vx7dxb+vAA@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/28 0:40, Jaegeuk Kim wrote: > On 09/25, Chao Yu
 wrote: >> Update allocation policy for ro feature: >> - hot_data: allocating
 blocks by LBA ascending order >> - hot_node: allocating blocks by [...] 
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
X-Headers-End: 1odMCL-0054z7-GI
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

On 2022/9/28 0:40, Jaegeuk Kim wrote:
> On 09/25, Chao Yu wrote:
>> Update allocation policy for ro feature:
>> - hot_data: allocating blocks by LBA ascending order
>> - hot_node: allocating blocks by LBA descending order
> 
> This will increase the RO image size.

Shouldn't RO image has fixed-size during mkfs?

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   mkfs/f2fs_format.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>> index 40ac589..8d0f410 100644
>> --- a/mkfs/f2fs_format.c
>> +++ b/mkfs/f2fs_format.c
>> @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
>>   	}
>>   
>>   	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
>> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
>> +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
>>   		c.cur_seg[CURSEG_WARM_NODE] = 0;
>>   		c.cur_seg[CURSEG_COLD_NODE] = 0;
>> -		c.cur_seg[CURSEG_HOT_DATA] = 1;
>> +		c.cur_seg[CURSEG_HOT_DATA] = 0;
>>   		c.cur_seg[CURSEG_COLD_DATA] = 0;
>>   		c.cur_seg[CURSEG_WARM_DATA] = 0;
>>   	} else if (c.heap) {
>> -- 
>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
