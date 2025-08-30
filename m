Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13776B3C6EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Aug 2025 03:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmFDLYoX4G/8wfICwBMB71wPtTLhtX3N3NujcPHw6VU=; b=Glk+dtlH67h8fewAftTunSBvNP
	0MOPG46bLdelSwoVRSbpMrZ3gVqczSFD7jM0w+4+s52xo7IlBKMR3rB0g2qAfXTTVPjPdmQWEe8zg
	LmZ4vFCGJSDoC4r1k5P9hfILH883dn4uUrnpQh6uFVtFRAApEZDU43l+XbOd1nXCqjMk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usA8V-0001vH-Ca;
	Sat, 30 Aug 2025 01:12:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1usA8T-0001v1-H2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 01:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yv+CwrfdSMZJXaIsq9BVCMmUDkn/YqqhB5NOlEPidwY=; b=CWDPJCqr2A7z0mvRaCLvQPzDve
 9dAFQwEp+yHWp7JnrmvdahKH9rrhtiCQNWDlkFan1zM+Jxl1n9n1Ip24ZapwBDZR7XdIMOFiwH8Md
 uUP3ZS/X03GgZSawcGeK/sm6CsvR4BBtykcBEXtiHyA4+3dLD8WFdbjX2XK2oePW2X4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yv+CwrfdSMZJXaIsq9BVCMmUDkn/YqqhB5NOlEPidwY=; b=MB7OV37HcujbjAFPEK0YkD0Yv5
 bHfIN+evtpeiRjF2U7u7/yEYSS0k/1nKopci8TR71HmixKTfMUpcGeWNQfx9j3bl6QxuZY1MCTPkS
 LUvo07RQCWrXSiWwAAWr4A06B9TFcDobNHRS+aM2tNj+Jo/q7zg9mAoMoUMipXfUlqU4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usA8T-0003KQ-Tk for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 01:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FB6B44F26
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 01:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85877C4CEF0;
 Sat, 30 Aug 2025 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756516320;
 bh=tycl4yGmvMLiJ12nt0D6Iv196uuT9CH0W3/80EDmza8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ih+3OATp7z1kjkOLPNQ8RA8UjGhW3fAwlMok0LsgbTACMo0pqG/ila36CZYnoVj/y
 cu2Mmr2IG1ej0s0TLZ8qRwMAGkeKUSVRmNiqSgQEZoy+BIEsPlWqDYBlxiDN9e97Fz
 E/cFvtq4nVGWQ57InuVkjlKEkGV5QB0hHS4NSSQDjlOCBGFBoWtS69X+YNN9KjuoS9
 tvdDP0SfRzn2e2JUM9Ngz0TS5iQV70GDZ1dlzOnoEcvPYPGKGzxux660ab29TaBDcO
 Zch4H2VoAzDy7b2lxKfKR4WYM73DlEcU8ZI+BbYyE0APmu8eOEufGoKW8oVmTOl1fV
 3UH6KKn+TdofQ==
Message-ID: <d0357cd2-5435-4d99-af31-cc56fc05ce9a@kernel.org>
Date: Sat, 30 Aug 2025 09:11:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
 <bfbd5db4-c103-4a08-8568-1d27c8eba676@kernel.org>
 <aLB0XeQh_tm2tXIA@google.com>
 <c7a0afdc-3f33-4de7-b36d-b0d5f55216e2@kernel.org>
 <aLIR7BaaAizkdzgl@google.com>
Content-Language: en-US
In-Reply-To: <aLIR7BaaAizkdzgl@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/30/2025 4:47 AM, Jaegeuk Kim wrote: > On 08/29, Chao
 Yu wrote: >> On 8/28/2025 11:23 PM, Jaegeuk Kim wrote: >>> On 08/28, Chao
 Yu wrote: >>>> On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wr [...]
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
X-Headers-End: 1usA8T-0003KQ-Tk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/30/2025 4:47 AM, Jaegeuk Kim wrote:
> On 08/29, Chao Yu wrote:
>> On 8/28/2025 11:23 PM, Jaegeuk Kim wrote:
>>> On 08/28, Chao Yu wrote:
>>>> On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
>>>>> Let's split IPU writes in hot data area to improve the GC efficiency.
>>>>
>>>> I didn't get it, IPU may be not friendly for migrating data along w/ write in
>>>> hot area?
>>>
>>> This deals with IPU in the LFS mode.
>>
>> Okay, so, we missed to add f2fs_lfs_mode() condition, right?
> 
> Why do we need that?

As you mentioned above, this deals w/ IPU in the LFS mode. Am I missing
something?

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
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>    fs/f2fs/segment.c | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index e0f6589c6a1c..bb79dad55ac9 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>>>>>    		if (file_is_hot(inode) ||
>>>>>    				is_inode_flag_set(inode, FI_HOT_DATA) ||
>>>>> -				f2fs_is_cow_file(inode))
>>>>> +				f2fs_is_cow_file(inode) ||
>>>>> +				is_inode_flag_set(inode, FI_NEED_IPU))
>>>>>    			return CURSEG_HOT_DATA;
>>>>>    		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>>>>>    						inode->i_write_hint);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
