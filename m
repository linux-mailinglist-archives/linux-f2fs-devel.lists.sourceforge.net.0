Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276A400A26
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 08:45:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMPQW-0003lH-0e; Sat, 04 Sep 2021 06:45:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mMPQU-0003l9-V0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 06:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gP7CuZ73md+XZFc4jrK3TMBwcdA8vbKuHyFXB9aHllo=; b=XRybNX/cZVpqeyHG74O5QNYmMo
 mQiVQXBhbdHdqkHcHuhl8CUdfrau8CBx/tzMg4PFpTplN8KnaBukc8zk9XxKOeTtc0p50Xw0WehHe
 YIaS/HZwNos4u6PYLL9um7M3Bwg9M1EMhSzEWmHZB7eMycHAVm8o0FbteucWRTmqfbhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gP7CuZ73md+XZFc4jrK3TMBwcdA8vbKuHyFXB9aHllo=; b=HM5AiMpR9PWQZLZnh2RRyeog9W
 zMDSmRpbn5oO03PkNTTpHNIsiqByJBJoZHgnd/g6p33TCnXx1RbEEHt85x3C9tJL57MCOhZDmJMdy
 acD4AFUDKMnk3jnfCXaR/rnzVVRjbYVO14bbWe7PtvTwBxsoTU4F9dGft1+fDq4h+bE8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMPQQ-0000KA-5D
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 06:45:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C19AF600AA;
 Sat,  4 Sep 2021 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630737908;
 bh=MVOIlssJq/adoFt1cVqsv0+pamI8JoDpoucmm2TnnT8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ov4Hln9BpfKu0DjBJI3KZqVqJJNzWRI0yJIK37hm/aBrNMiJmsy0ImSH8jnst4IDW
 7ank/wzMZ8keOv+hFx/QH7uh200t43fUUVA/1lZQFL82zEJZb+frtukVPTsy4ar9y9
 3kVhWWim0ug1ewDrty4aAdTW0HQmsGJUmPxMnOJKx2u2gznG/rCxaNWgQeuf0gZj3d
 /7VTXWoSylVtg5H4ef5ckVvakvW2mo6mLekI6jMs7mzmfTqKOtGIzg/2dVDnHvMOgX
 diBu8DiXcVTFGCOYYI3EPinoJ+qqMt3oNOFg7hlcFcDvsg6FY1OO4C6UAZJHW3hE3v
 sHRsiRyrnWbXg==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
 <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
 <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
 <CACOAw_yBYZzUVGV-A7K57zqrcAaZv7nFSk9mSj9AC6jTTeU7Vw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f64cb941-2bb7-eed2-732d-c9537f46f67c@kernel.org>
Date: Sat, 4 Sep 2021 14:45:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_yBYZzUVGV-A7K57zqrcAaZv7nFSk9mSj9AC6jTTeU7Vw@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mMPQQ-0000KA-5D
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/4 12:40, Daeho Jeong wrote:
>> As a per curseg field.
>>
>>> Maybe, we run into the same race condition issue you told before for
>>> fragment_remained_chunk.
>>> Could you clarify this more?
>>
>> e.g.
>>
>> F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_FIXED_BLK
>> fragment_chunk_size = 384
>> fragment_hole_size = 384
>>
>> When creating hole:
>>
>> - f2fs_allocate_data_block
>>    - __refresh_next_blkoff
>>      chunk locates in [0, 383] of current segment
>>      seg->next_blkoff = 384
>>      sbi->fragment_remained_chunk = 0
>>      then we will reset sbi->fragment_remained_chunk to 384
>>      and move seg->next_blkoff forward to 768 (384 + 384)
>>    - __has_curseg_space() returns false
>>    - allocate_segment() allocates new current segment
>>
>> So, for such case that hole may cross two segments, hole size may be truncated
>> to left size of previous segment.
> 
> First, sbi->fragment_remained_chunk should be seg->fragment_remained_chunk.

Oh, correct.

> I understand what you mean, so you mean we need to take the leftover
> "hole" size over to the next segment?
> In the example, the leftover hole size will be (384 - (512-384)). Do
> you want to take this over to the next segment?

Yes, the left 256 block-sized hole should be created before next chunk
in next opened segment.

Thanks,

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
