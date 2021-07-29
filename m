Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A593D9A14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 02:27:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8tsy-0003A9-Gk; Thu, 29 Jul 2021 00:26:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m8tss-00039W-8R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhTrtOLf2R1pBA8SrRggsAaWhJJrdGcXhn8gpDz3Tlc=; b=O2r4sR8BHTr6slMgx9IMSHjrPw
 eYUnQk73vKCQT9iS2jAwtLFf8XspKX0wXf0fBL2LNhTQs5b2lUr3a9Fn7ceVmYFbU6Gk9IAnynz75
 BdN9OLVV1TGHER9U40wW2a7IvYa9+E98+pmWe5bDoAH8sOaDX+SSwcAYaq2IsUuEA/aE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FhTrtOLf2R1pBA8SrRggsAaWhJJrdGcXhn8gpDz3Tlc=; b=VHaoW/Is4/jn9wlKhDdYBBp54Y
 YSKmquky28i1QqKfT7qbshc1oooux+RZMSCAOFFiwN6jN1p/0+AcUeRXG52rLuIBobFbGpb++Q/zJ
 vGAupGFW80xCRa6bXaOVqgFlMcNgHXKiqG9VPJbcQWxJ1xj9FklyyJgzwTw6vSMj1ybA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8tso-005vrD-BS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:26:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2465E60F59;
 Thu, 29 Jul 2021 00:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627518384;
 bh=uludeyf3+zGf2YO7V7UPfU6EFXH4cySzsy2ac4vsqZg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uc+72srOYR120uKGl7ZxsAJO2p0AMdqnnbO8mDXLYzC3n8ZaPT0qkoi/GV9IVP1l4
 ZrAfzKwfU3hfAOrONYnqYPgHd/TnafG4/K9DAwHy3hO8MXHsRDFDB7pFClWg+3M/7Z
 BNTpulDwWjsDj9yXPrafyLei5OXfAXPV2yg+brRzltg7lyONSFwSlS0k9Rtt7h2sVj
 Ci/rZW1yQR/LSdLe1jRlUY4nsk9b3YXPAMeu9h94UPw15RdQjzOwEiGnYrpoCSOibp
 NzqUm9sTByxPYnLI1sSwefdqgKAfpdajK78xOVOUxykWCO6pPP+BHgnjYelPo75Qw8
 ofqXEcTdeS8yA==
To: "Darrick J. Wong" <djwong@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
 <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
 <YP+38QzXS6kpLGn0@sol.localdomain>
 <70d9c954-d7f0-bbe2-f078-62273229342f@kernel.org>
 <20210727153335.GE559212@magnolia>
From: Chao Yu <chao@kernel.org>
Message-ID: <e237ab66-82dd-254d-7be2-aee8cb2b1c85@kernel.org>
Date: Thu, 29 Jul 2021 08:26:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727153335.GE559212@magnolia>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m8tso-005vrD-BS
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/27 23:33, Darrick J. Wong wrote:
> On Tue, Jul 27, 2021 at 04:30:16PM +0800, Chao Yu wrote:
>> On 2021/7/27 15:38, Eric Biggers wrote:
>>> That's somewhat helpful, but I've been doing some more investigation and now I'm
>>> even more confused.  How can f2fs support non-overwrite DIO writes at all
>>> (meaning DIO writes in LFS mode as well as DIO writes to holes in non-LFS mode),
>>> given that it has no support for unwritten extents?  AFAICS, as-is users can
>>
>> I'm trying to pick up DAX support patch created by Qiuyang from huawei, and it
>> looks it faces the same issue, so it tries to fix this by calling sb_issue_zeroout()
>> in f2fs_map_blocks() before it returns.
> 
> I really hope you don't, because zeroing the region before memcpy'ing it
> is absurd.  I don't know if f2fs can do that (xfs can't really) without
> pinning resources during a potentially lengthy memcpy operation, but you
> /could/ allocate the space in ->iomap_begin, attach some record of that
> to iomap->private, and only commit the mapping update in ->iomap_end.

Thanks for the suggestion, let me check this a little bit later, since now I
just try to stabilize the codes...

Thanks,

> 
> --D
> 
>>> easily leak uninitialized disk contents on f2fs by issuing a DIO write that
>>> won't complete fully (or might not complete fully), then reading back the blocks
>>> that got allocated but not written to.
>>>
>>> I think that f2fs will have to take the ext2 approach of not allowing
>>> non-overwrite DIO writes at all...
>> Yes,
>>
>> Another option is to enhance f2fs metadata's scalability which needs to update layout
>> of dnode block or SSA block, after that we can record the status of unwritten data block
>> there... it's a big change though...
>>
>> Thanks,
>>
>>>
>>> - Eric
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
