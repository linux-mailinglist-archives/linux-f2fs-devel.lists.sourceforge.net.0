Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FCB3D694
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Sep 2025 04:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paH/G0kfsh3/MfeM/ohUHqe+twTo6zP2v6aKL5klZQI=; b=BSEpj3URTupA+teSRsQYn6OE//
	FbTR44zMCUasmt8L9RvY6ArwgBy5u1uBjIx+iqlRUVRuq1SGbU0Xt9yBHKUA+e5oBRHsc3yav5D/R
	sD8uGc14uueIQCxcVY3kWEpgbvJl9+mtr62gtmLmxSdQi2VzSr8cYsdadDted2wvL5QQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usu50-00080e-CG;
	Mon, 01 Sep 2025 02:15:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1usu4z-00080V-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YeU4nxw6rTsKOWRN+TFAzD0qHOGBBfxiVT4K2uHcqb4=; b=C2MsYh+XmzySxL1B4Mjndsri0G
 38URcj1plvpolW3HmcJJG/JFPlAvFkaraYBdrIvUXjsZY1AADCI5bopaPwxf2lreXD1boDv7U3Nqo
 LgyllV/nTu7kRGhVZhLLbFqRAhSLXUidCJ9lHKXdSKvFDUNtGCALHXOqC4/qc+WIU9rs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YeU4nxw6rTsKOWRN+TFAzD0qHOGBBfxiVT4K2uHcqb4=; b=ZXv2wHdtXt07G26ijQkg2LEFCb
 sGhChMWg9ai1O8qijV8dyJOTvwlavi9ur81XaizAtxcMmHIvNbBCWRgxqpKOMgsQWH+Nxa55DqPKm
 p0nfIVXcYxwfdaBDHtzMuwwYgQIrdzWnXBXU0VgJfgebg5W0Kkp35fO+WhlL5SQc8Yos=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usu4y-0005NJ-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 48D854383D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Sep 2025 02:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653D8C4CEED;
 Mon,  1 Sep 2025 02:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756692927;
 bh=XO+FH4L46snPbiIleHTk7JE9h89KztDGTl+m6r5W5nw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=mX//IuTxF22YSaGeKcAgIaJaBlL5eM8DglNPukYlc4M5IYozCEtLtYY7gvuyMiT/7
 vsIccJ8jN4JsKnGCRaleNqacj5OGZvgBPx5Hrvta3RxkWQJtCbMIFLf0VplK6MC7BX
 Cnaics/y4UK+8I4BQ2hd2iiD/D0BOo/ypdQ0vzZdVtgB+0vFpPMRMNk0j9rhY7ruP5
 ac1WzNYNEIalMQAT6pNjK+ui79cdnGkJk/m93H1y9gSbjD3bfZO3Kbw7aEkn2BztZ5
 wSLbm7ymsyawnLR+nGOJdOUTB8PAZeIq0173JxWVwve8vUoFXUuf1iBHaCRBnq/3UB
 Ycd0W/4T3JW1A==
Message-ID: <887d9b30-0069-4f4d-8107-48662379fd30@kernel.org>
Date: Mon, 1 Sep 2025 10:15:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
 <bfbd5db4-c103-4a08-8568-1d27c8eba676@kernel.org>
 <aLB0XeQh_tm2tXIA@google.com>
 <c7a0afdc-3f33-4de7-b36d-b0d5f55216e2@kernel.org>
 <aLIR7BaaAizkdzgl@google.com>
 <d0357cd2-5435-4d99-af31-cc56fc05ce9a@kernel.org>
 <aLOPPQFJEqoYQg24@google.com>
Content-Language: en-US
In-Reply-To: <aLOPPQFJEqoYQg24@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/31/25 07:54, Jaegeuk Kim wrote: > On 08/30,
 Chao Yu wrote:
 >> On 8/30/2025 4:47 AM, Jaegeuk Kim wrote: >>> On 08/29, Chao Yu wrote:
 >>>> On 8/28/2025 11:23 PM, Jaegeuk Kim wrote: >>>>> On 08/28, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1usu4y-0005NJ-Lq
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate HOT_DATA for IPU writes
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/31/25 07:54, Jaegeuk Kim wrote:
> On 08/30, Chao Yu wrote:
>> On 8/30/2025 4:47 AM, Jaegeuk Kim wrote:
>>> On 08/29, Chao Yu wrote:
>>>> On 8/28/2025 11:23 PM, Jaegeuk Kim wrote:
>>>>> On 08/28, Chao Yu wrote:
>>>>>> On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
>>>>>>> Let's split IPU writes in hot data area to improve the GC efficiency.
>>>>>>
>>>>>> I didn't get it, IPU may be not friendly for migrating data along w/ write in
>>>>>> hot area?
>>>>>
>>>>> This deals with IPU in the LFS mode.
>>>>
>>>> Okay, so, we missed to add f2fs_lfs_mode() condition, right?
>>>
>>> Why do we need that?
>>
>> As you mentioned above, this deals w/ IPU in the LFS mode. Am I missing
>> something?
> 
> The IPU flag indicates the data is hot. In lfs_mode, we missed to allocate
> it into HOT_DATA. In normal mode, IPU will update the data in place, which
> doesn't affect anything, while newly create data is also good to store in
> HOT_DATA as well. So, I think we don't need other condition here.

It makes sense, thanks for the explanation.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>> ---
>>>>>>>    fs/f2fs/segment.c | 3 ++-
>>>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>>>> index e0f6589c6a1c..bb79dad55ac9 100644
>>>>>>> --- a/fs/f2fs/segment.c
>>>>>>> +++ b/fs/f2fs/segment.c
>>>>>>> @@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>>>>>>>    		if (file_is_hot(inode) ||
>>>>>>>    				is_inode_flag_set(inode, FI_HOT_DATA) ||
>>>>>>> -				f2fs_is_cow_file(inode))
>>>>>>> +				f2fs_is_cow_file(inode) ||
>>>>>>> +				is_inode_flag_set(inode, FI_NEED_IPU))
>>>>>>>    			return CURSEG_HOT_DATA;
>>>>>>>    		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>>>>>>>    						inode->i_write_hint);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
