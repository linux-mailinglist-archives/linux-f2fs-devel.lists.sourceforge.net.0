Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CA4C9E20
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 08:01:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPIza-00063h-IG; Wed, 02 Mar 2022 07:01:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nPIzY-00063a-RS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 07:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=907rrAhFQrqKq1PooUJJoNhWesjYos1bugC4FQL80TQ=; b=eYcheY2j16WVqNZaYfdLHD84Na
 Qis8D56sHkUu1IGAFSo5Z0JH0utOHJOPywrB8eS8OiW6SmQeo6C7Mtwf+Hj9i0Ybz9IXRogCGc0Jg
 9KyZ9dsB+iTwR3qyHzlG09/F5Ai05M+wrawb2Q/9rhOclVB7SkjoBdQH8CTVyVty3yXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=907rrAhFQrqKq1PooUJJoNhWesjYos1bugC4FQL80TQ=; b=Z3gQWTBHVHRfiXuGUJ7tb1B/qh
 iK++NmYEHE+e5soa5qdalE8keyE8COTpqg1IGiK19iavHh4YylTvMsOasn9ccH8UYYOC1iJ5MeK74
 Uk66BNwrcnUjg4LtwF0eUmNmkwlaSt2wu820f4iebVF4Q5dKAtunhL0nm6SJN0jASams=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPIzS-002Ag5-Vp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 07:01:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6AC4B81E47
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Mar 2022 07:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CB4C004E1;
 Wed,  2 Mar 2022 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646204490;
 bh=p5IQ8IpagSSBtlNBh7dDn+jFBz/i52xaf4GZ0TjhCfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k8rkvVoFTj9JErTYMBy0fvqfzzAZeuQeMIV7BZb1Q+cmsHGRBT0udOOAsMjaqj9ei
 WptGdh6ovcQ/w7mrvyZZzLWL8pW6ANZxj3VnJmbKffWPepCUJIcmFLpDut0Mv3NCzq
 zLWuFVCYjj1j45R/RoIikGxUl8UaLfZtnKqUPb3f8tWPFWm7bxLYaUC3kcI7E8YZhf
 RxpbOqf68E1F5pA8L2tqhhhyQbeyTPNmG5hs7pr6IrJij4S5ICel4PbpdLpJzR8D75
 5JPzTmKMAYMGj+/0vvdQAaBQOyRpvDEDRa5fBV9OSJ3iI6DU+0HWJKyHb0v3oCWHpP
 a1ry3CFqI4cvw==
Message-ID: <3d861bf6-c404-140d-b91a-60df3ddec304@kernel.org>
Date: Wed, 2 Mar 2022 15:01:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220215220039.1477906-1-jaegeuk@kernel.org>
 <09683b83-b6c0-fe05-0dae-b93cab2f4b63@kernel.org>
 <YhkpjWZ3NO5ihvH5@google.com> <Yh2lpb3c5X9aPJ+r@google.com>
 <4b264607-4d60-7370-eca7-8816a3f8d29f@kernel.org>
 <Yh8B/w9kPGU98Hfh@google.com> <Yh8C4aA+nBajs+fc@google.com>
 <Yh8EgciUTRAbWDNG@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yh8EgciUTRAbWDNG@google.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/2 13:45, Jaegeuk Kim wrote: > On 03/01, Jaegeuk
 Kim wrote: >> On 03/01, Jaegeuk Kim wrote: >>> On 03/02, Chao Yu wrote: >>>>
 On 2022/3/1 12:48, Jaegeuk Kim wrote: >>>>> 1. waiting for f2fs_e [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPIzS-002Ag5-Vp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid sb_start_intwrite during
 eviction
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

On 2022/3/2 13:45, Jaegeuk Kim wrote:
> On 03/01, Jaegeuk Kim wrote:
>> On 03/01, Jaegeuk Kim wrote:
>>> On 03/02, Chao Yu wrote:
>>>> On 2022/3/1 12:48, Jaegeuk Kim wrote:
>>>>> 1. waiting for f2fs_evict_inode
>>>>> [ 5560.043945]  __wait_on_freeing_inode+0xac/0xf0
>>>>> [ 5560.045540]  ? var_wake_function+0x30/0x30
>>>>> [ 5560.047036]  find_inode_fast+0x6d/0xc0
>>>>> [ 5560.048473]  iget_locked+0x79/0x230
>>>>> [ 5560.049933]  f2fs_iget+0x27/0x1200 [f2fs]
>>>>> [ 5560.051496]  f2fs_lookup+0x18c/0x3e0 [f2fs]
>>>>> [ 5560.053069]  __lookup_slow+0x84/0x150
>>>>> [ 5560.054503]  walk_component+0x141/0x1b0
>>>>> [ 5560.055938]  link_path_walk.part.0+0x23b/0x360
>>>>> [ 5560.057541]  ? end_bio_bh_io_sync+0x37/0x50
>>>>> [ 5560.059086]  path_parentat+0x3c/0x90
>>>>> [ 5560.060492]  filename_parentat+0xd7/0x1e0
>>>>> [ 5560.062002]  ? blk_mq_free_request+0x127/0x150
>>>>> [ 5560.063576]  do_renameat2+0xc1/0x5b0
>>>>>    --> sb_start_write(m->mnt_sb); ->  __sb_start_write(sb, SB_FREEZE_WRITE);
>>>>>
>>>>> [ 5560.064999]  ? __check_object_size+0x13f/0x150
>>>>> [ 5560.066559]  ? strncpy_from_user+0x44/0x150
>>>>> [ 5560.068038]  ? getname_flags.part.0+0x4c/0x1b0
>>>>> [ 5560.069617]  __x64_sys_renameat2+0x51/0x60
>>>>>
>>>>> 2. waiting for sb_start_intwrite -> __sb_start_write(sb, SB_FREEZE_FS);
>>>>
>>>> It's still not clear that why __sb_start_write(sb, SB_FREEZE_FS) will be blocked,
>>>> as SB_FREEZE_FS and SB_FREEZE_WRITE points to different locks.
>>>
>>> It seems I missed another call, thaw_super(), got SB_FREEZE_FS and then being
>>> stuck to grab SB_FREEZE_WRITE.
>>
>> Ah, sorry. freeze_super().
> 
> Messed up. So, the lock order is SB_FREEZE_WRITE -> SB_FREEZE_FS in both cases.

Yeah, I noticed this, w/ such lock order, Thread C (freeze_super) will be blocked
on SB_FREEZE_WRITE, and then Thread B won't be block on SB_FREEZE_FS, right?

Thanks,

> 
>>
>>>
>>>>
>>>> Thread A				Thread B				Thread C
>>>> - rename
>>>>   - sb_start_write
>>>>    - __sb_start_write(SB_FREEZE_WRITE)
>>>> ...
>>>>       - f2fs_lookup
>>>> ...
>>>>         - __wait_on_freeing_inode
>>>> 					- drop_slab
>>>> 					 - prune_icache_sb
>>>> 					  - inode_lru_isolate
>>>> 					   :inode->i_state |= I_FREEING
>>>> 										- Is there any flow that it has already held
>>>> 										 SB_FREEZE_FS and try to lock SB_FREEZE_WRITE?
>>>> 					   - f2fs_evict_inode
>>>> 					    - __sb_start_write(SB_FREEZE_FS)
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> [ 5560.152447]  percpu_rwsem_wait+0xaf/0x160
>>>>> [ 5560.154000]  ? percpu_down_write+0xd0/0xd0
>>>>> [ 5560.155498]  __percpu_down_read+0x4e/0x60
>>>>> [ 5560.157000]  f2fs_evict_inode+0x5a3/0x610 [f2fs]
>>>>> [ 5560.158648]  ? var_wake_function+0x30/0x30
>>>>> [ 5560.160341]  evict+0xd2/0x180
>>>>> [ 5560.161728]  prune_icache_sb+0x81/0xb0
>>>>>    --> inode_lru_isolate() -> inode->i_state |= I_FREEING;
>>>>>
>>>>> [ 5560.163179]  super_cache_scan+0x169/0x1f0
>>>>> [ 5560.164675]  do_shrink_slab+0x145/0x2b0
>>>>> [ 5560.166121]  shrink_slab+0x186/0x2d0
>>>>> [ 5560.167481]  drop_slab_node+0x4a/0x90
>>>>> [ 5560.168876]  drop_slab+0x3e/0x80
>>>>> [ 5560.170178]  drop_caches_sysctl_handler+0x75/0x90
>>>>> [ 5560.171761]  proc_sys_call_handler+0x149/0x280
>>>>> [ 5560.173328]  proc_sys_write+0x13/0x20
>>>>> [ 5560.174667]  new_sync_write+0x117/0x1b0
>>>>> [ 5560.176120]  vfs_write+0x1d5/0x270
>>>>> [ 5560.177409]  ksys_write+0x67/0xe0
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>    Note, I found this call stack.
>>>>>
>>>>>    fs/f2fs/inode.c | 2 --
>>>>>    1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>>> index ab8e0c06c78c..882db4bd917b 100644
>>>>> --- a/fs/f2fs/inode.c
>>>>> +++ b/fs/f2fs/inode.c
>>>>> @@ -778,7 +778,6 @@ void f2fs_evict_inode(struct inode *inode)
>>>>>    	f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
>>>>>    	f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
>>>>> -	sb_start_intwrite(inode->i_sb);
>>>>>    	set_inode_flag(inode, FI_NO_ALLOC);
>>>>>    	i_size_write(inode, 0);
>>>>>    retry:
>>>>> @@ -809,7 +808,6 @@ void f2fs_evict_inode(struct inode *inode)
>>>>>    		if (dquot_initialize_needed(inode))
>>>>>    			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>>>>>    	}
>>>>> -	sb_end_intwrite(inode->i_sb);
>>>>>    no_delete:
>>>>>    	dquot_drop(inode);
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
