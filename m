Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B764860D8CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Oct 2022 03:18:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onV3X-0007GM-90;
	Wed, 26 Oct 2022 01:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onV3W-0007GG-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 01:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eafPppTfAIvC5huZTEwOM4KBYi0IRA129kyNSf5kBYQ=; b=RojdN7ERY591yBeZctutHxc4T6
 xWoV4byjdCLSt5kwUKp0mlkmXdYuzoiIC4cowiiU+O0k2p0g/CakIXNKBzihZp+Z2Zvo6jM+CepjR
 ylVsXifzqkzsgLHcuvmKR4FjwX5n+/l/TtZr9vVhgPQJdx0a1ntaTinL2iAqLKJm9LEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eafPppTfAIvC5huZTEwOM4KBYi0IRA129kyNSf5kBYQ=; b=Hnd+76WNwHL0DZV3HS9lPuIvcf
 BULAGvcVWdhaDN4kTVeeNoz31fvFhvVOk5++zCkzu/KzS/yJeQnerqCDESPnci0ZvFdfJ4p6JWbOS
 lBISMDm9uXGvTvzJmLHQawKsSIC5q5K6VNYOqrGShn5iOqwIygJ+xBUnQdNaQYBEbdvk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onV3S-00HV8E-Ry for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 01:18:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF7E0B81F1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Oct 2022 01:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9E6C433D6;
 Wed, 26 Oct 2022 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666747070;
 bh=wOZM+oyBXIQ35iD4e8i/HPoDGliVpVT3G5QL4pHtCHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KjxblEtYkDKjNwJ8VsL3Wu5qqrR3r+cRA9AzCCnoW3NbrHdnpv5DGQqiCcgh4HWta
 rX/qtOzJdSP5T8KFE3FbK6jVPC5lMmYtfK3XNu7YkUoIIikTH8ev57C+I0PH2BXiga
 Ypoq1mW1gveyQRLnXTh3qUhWcGk+9i502SWYaFVaujfYzXaC3f3A2aI2v6Rp2pCCDg
 XbupuPLwPdNtb0iiErCG8dwS7AC9a9tfYeCLcF/itpN1esqgQO4wSTqhQMfJcgSnJ4
 1kXf3t5QuIjvzmKGja2lvVs7mIPxp/hdIKSM+TrMHIffaBUSELFLQAgFyRvGsDiM+A
 6Ea5ObtPK4WHQ==
Message-ID: <0a339e33-d79a-19e4-fadd-bb37a5a9f79d@kernel.org>
Date: Wed, 26 Oct 2022 09:17:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221024233634.803695-1-jaegeuk@kernel.org>
 <ae5f7c6e-248b-3cf7-b111-a4ddc85dd411@kernel.org>
 <Y1gg6P6CO9KbDO0O@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y1gg6P6CO9KbDO0O@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/26 1:46, Jaegeuk Kim wrote: > On 10/25, Chao Yu
 wrote: >> On 2022/10/25 7:36, Jaegeuk Kim wrote: >>> The below commit disallows
 to set compression on empty created file which >>> has a inli [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onV3S-00HV8E-Ry
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow to set compression for inlined
 file
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

On 2022/10/26 1:46, Jaegeuk Kim wrote:
> On 10/25, Chao Yu wrote:
>> On 2022/10/25 7:36, Jaegeuk Kim wrote:
>>> The below commit disallows to set compression on empty created file which
>>> has a inline_data. Let's fix it.
>>>
>>> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/file.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 1c4004c9245f..304fe08edc61 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1915,6 +1915,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>>    			if (!f2fs_disable_compressed_file(inode))
>>>    				return -EINVAL;
>>>    		} else {
>>> +			/* try to convert inline_data to support compression */
>>> +			f2fs_convert_inline_inode(inode);
>>
>> It needs to check return value of f2fs_convert_inline_inode()?
> 
> I intended to catch that in the below checks?

But it may hide the real error number, e.g. -ENOMEM returned from
f2fs_convert_inline_inode()?

Thanks,

> 
>>
>> Thanks,
>>
>>> +
>>>    			if (!f2fs_may_compress(inode))
>>>    				return -EINVAL;
>>>    			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
