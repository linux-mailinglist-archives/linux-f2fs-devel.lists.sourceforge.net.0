Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E22983E0CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 05:04:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBTgT-0006JO-Or; Thu, 05 Aug 2021 03:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mBTgT-0006JH-3a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 03:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXMBZYKFqlIx4Lvs95YrNKM2sRuEQgPXSm9odpdXikM=; b=gxyIrw5R4gQL8L7ynMpHoTVc26
 mY/AMxb0m2UVPtqaqIimHVtwvk+Out5TAv+geIr+lYEEM/450ZWNs1fxi7IWQgonOmy1MczVReQP/
 GC62D4x8nGZTpvjvTl5/8yHHGe9z+nBtyDkSVyumxtijcUXcPQeJhMaFLS9j1TOkeUz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXMBZYKFqlIx4Lvs95YrNKM2sRuEQgPXSm9odpdXikM=; b=i9j7pi+8uNtS4UNdWv/nO3OzM5
 BRKpdQ3DZHOB+ul80taK6Z7ip3UHEawordeHaMD2xIQjhdc8HvMe+I2bIEzGIxdAM9MJTXbsCIJh6
 sh/c72gGx6rTZtg+xOquJC41NbtH7OAEjxKafmlKUmT3fHKZjbS3xoDcYIWPivTjWUu0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBTgR-00ClWe-0q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 03:04:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD0D661004;
 Thu,  5 Aug 2021 03:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628132664;
 bh=DoFtBqW8UB6ruKlkRSAEkUmYvCdD/NWqyxtofjx/IEo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cvv2hzAVc/Y0Ko9wOqWwQ6eDKKp8phmjSGUKkGAUixj6TLKLpEbP/5Xou52GPQ52v
 4OsGSN8N0tCQ2O7TpNpgOi998eUE0In9YgHtsMMSir0V8m8f/AAsPReP3ko5XI9rYN
 Y8kuw6pFcUknud+XlcEcUBiWfOBwWZ37i5YL2FOfboPgLnb62DsH3eeNzWQ3i3g6gP
 94XL/XW94+p13ZFM0n8f0mUcqZ49qYODEqJpAF/SXnuaIZyOhvM2XWyYKF/vInrUJP
 tTLPyGcOzCOWGozvvnhEwJqC6DvqOTxYYAJfGc4jY8hAP0u+GeBeVCJoWHypOoynWa
 v5gkfyyrZ3Sug==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210804022348.1414543-1-chao@kernel.org>
 <YQsIj0wKk6YbN/FJ@google.com> <YQsmfm3ibU6bhvZr@google.com>
 <0dad9863-4aa2-3ea3-fd97-457aa635ed66@kernel.org>
 <YQtSrIx0/sAipDs4@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <62eb8902-90fa-4b1a-55ce-a178643baf90@kernel.org>
Date: Thu, 5 Aug 2021 11:04:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQtSrIx0/sAipDs4@google.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBTgR-00ClWe-0q
Subject: Re: [f2fs-dev] [RFC v3] f2fs: extent cache: support unaligned extent
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/5 10:53, Jaegeuk Kim wrote:
> On 08/05, Chao Yu wrote:
>> Jaegeuk,
>>
>> On 2021/8/5 7:45, Jaegeuk Kim wrote:
>>> Chao,
>>>
>>> How about this?
>>> https://github.com/jaegeuk/f2fs/commit/d6bbe121bc24dfabfedc07ba7cb6e921fb70ece0
>>
>> Looks more clean, thanks,
>>
>>>
>>> I'm digging one bug in __insert_extent_tree w/ the patch tho.
>>
>> Shouldn't we initialize @ei in f2fs_update_extent_tree_range(), otherwise,
>> __try_merge_extent_node(&ei) -> __is_extent_mergeable() will do the check
>> w/ uninitialized c_len of @ei.
> 
> Fixed some bugs, but still getting another data corruption.
> 
> https://github.com/jaegeuk/f2fs/commit/c5d97919c55b467392407b60c1a7b1e3e81721ff

Let me rebase to your code, and do some tests.

Thanks

> 
>>
>>>> On 08/04, Chao Yu wrote:
>>>>> +	if (from_dnode)
>>>>> +		goto skip_reading_dnode;
>>
>> Wrong condition here, thanks for fixing.
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
