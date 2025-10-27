Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 010ECC0C3FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 09:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/kOPoljrZgme/6WzFqfoW1rtoWc8qU/aBBoM97wAVM=; b=XZL7J5B5F3O/tYElaVH5C/o/og
	K7yTVbvEBzYWSnD//WffObbkH2HVpS8Cyb7xwJLlbP6eF0+ZyO0iJN49pbTvLnodG8wmEnATkitil
	HK4ad0/xg/kUbYawzHJvbdgsURzVVomzt11Kan+h/ByXQf6JmMiQuYo+4OHztUN+Va+Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDIL7-0002Pm-M6;
	Mon, 27 Oct 2025 08:12:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDIL7-0002Pg-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iimiM+MQU30jvxIEtJEo9RItbVDMJuLsHPGBXSd0RPY=; b=hdfdq8QMYbvfho+O9pKi9AMpRk
 zXVYOG+0lz88QFEmS0tfp/5SVz1mqRU/PNkyQQI++cu/Px7t/uAKEcfewN3Hx94kLsLsNhI0ZP/dN
 RHOxLt6AiUDHWDvWl6eQo1RcUnD+H5xrsYEzSQeGt1ywlNhohl8Wu+CZ1hmGM5udoNZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iimiM+MQU30jvxIEtJEo9RItbVDMJuLsHPGBXSd0RPY=; b=XIZB8OtBuziRJVl7VOaC/ikMu9
 8N5g4A5k1dmOxixY+Xc3lVyqtpPfiZYzn4Rzip249PMtWDs7qg+VtomGNZlM+8PI3o962fKmGw4OO
 6bBydgOS25OtNK74qggNRvp/U7yGdTL5k6i6DZAHoLA4sCz+q9+jsTPV5zA6bltihEVE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDIL6-0001YN-Au for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B197C6029B;
 Mon, 27 Oct 2025 08:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520FFC4CEF1;
 Mon, 27 Oct 2025 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761552737;
 bh=FySKsm5NndJRTBwhanRGHNyN4FODpGjVnPcCLMTbqB8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V8nVGwg43KqgpGiSjvcOdbp2gwBVPmH3YlbChUN/2fN8JiUwxc8043Vl0AvMnC669
 gR8MSy8GeO/9W3IDhox4KBrsFWD6xwpHrPVVCFhGMCalr/QpAr+zuBZUQvnWOmh6t+
 +dBgh0GIpP7RYtwBW6U4eJCjUdBY8fVLAqFKs6keYQZVf8q9gTLfQpCC5q7NiDKdRW
 5KcWV0ZCafcApm3r/3OjBCW1UVK6rfnWB1mtVMblZVieH7yXnbwcbWhWdQ02HPu9uc
 5ihU7B3VPZSebKotQjDuqW1xij3z1QQEohzTMjYxxRp1w9oHe6kQbbi59R0dX6Z2Nr
 O32R2shmsdqjA==
Message-ID: <d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org>
Date: Mon, 27 Oct 2025 16:12:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
 <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
 <235adbae-cc45-4b84-b712-1ba9e5a48dce@kernel.org>
 <wtrkydtrovhsw6azexwq576aoq36ut62y2elhzvsq3ansk477y@2rzc56l46pka>
 <2pro6x6xdvfhaypqhddzlmitx2vo6h7ro5mcqcf5tc7ssvzdls@cge4oegdkf5t>
Content-Language: en-US
In-Reply-To: <2pro6x6xdvfhaypqhddzlmitx2vo6h7ro5mcqcf5tc7ssvzdls@cge4oegdkf5t>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/24/25 03:15, Nikola Z. Ivanov wrote: > On Wed, Oct 15, 
 2025 at 03:55:40PM +0300, Nikola Z. Ivanov wrote: >> On Wed, Oct 15, 2025
 at 02:41:53PM +0800, Chao Yu wrote: >>> On 10/14/25 20:17, Nikola [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDIL6-0001YN-Au
Subject: Re: [f2fs-dev] [PATCH] f2fs: Perform sanity check before unlinking
 directory inode
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 khalid@kernel.org, skhan@linuxfoundation.org, jaegeuk@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24/25 03:15, Nikola Z. Ivanov wrote:
> On Wed, Oct 15, 2025 at 03:55:40PM +0300, Nikola Z. Ivanov wrote:
>> On Wed, Oct 15, 2025 at 02:41:53PM +0800, Chao Yu wrote:
>>> On 10/14/25 20:17, Nikola Z. Ivanov wrote:
>>>> On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
>>>>> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
>>>>>> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
>>>>>>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
>>>>>>>> Current i_nlink corruption check does not take into account
>>>>>>>> directory inodes which have one additional i_nlink for their "." entry.
>>>>>>>>
>>>>>>>> Add additional check and a common corruption path.
>>>>>>>>
>>>>>>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
>>>>>>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
>>>>>>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
>>>>>>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>>>>>>>> ---
>>>>>>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>>>>>>>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>>>>>>> index b882771e4699..68b33e8089b0 100644
>>>>>>>> --- a/fs/f2fs/namei.c
>>>>>>>> +++ b/fs/f2fs/namei.c
>>>>>>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>>>>>>   		goto out;
>>>>>>>>   	}
>>>>>>>> -	if (inode->i_nlink == 0) {
>>>>>>>> +	if (unlikely(inode->i_nlink == 0)) {
>>>>>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>>>>>>   			  __func__, inode->i_ino);
>>>>>>>> -		err = -EFSCORRUPTED;
>>>>>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>>>>>> -		goto out_iput;
>>>>>>>> +		goto corrupted;
>>>>>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>>>>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>>>>>>> +			  __func__, inode->i_ino);
>>>>>>>> +		goto corrupted;
>>>>>>>
>>>>>>> Can we detect such corruption in sanity_check_inode() as well? So that if
>>>>>>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
>>>>>>> flag and then triggering fsck repairment later.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>>>   	}
>>>>>>>>   	if (IS_ENCRYPTED(dir) &&
>>>>>>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>>>>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>>>>>>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>>>>>>>>   	return new;
>>>>>>>> +corrupted:
>>>>>>>> +	err = -EFSCORRUPTED;
>>>>>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>>>>>>   out_iput:
>>>>>>>>   	iput(inode);
>>>>>>>>   out:
>>>>>>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>>>>>>   	if (unlikely(inode->i_nlink == 0)) {
>>>>>>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>>>>>>   			  __func__, inode->i_ino);
>>>>>>>> -		err = -EFSCORRUPTED;
>>>>>>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>>>>>> -		f2fs_folio_put(folio, false);
>>>>>>>> -		goto fail;
>>>>>>>> +		goto corrupted;
>>>>>>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>>>>>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>>>>>>> +			  __func__, inode->i_ino);
>>>>>>>> +		goto corrupted;
>>>>>>>>   	}
>>>>>>>>   	f2fs_balance_fs(sbi, true);
>>>>>>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>>>>>>   	if (IS_DIRSYNC(dir))
>>>>>>>>   		f2fs_sync_fs(sbi->sb, 1);
>>>>>>>> +
>>>>>>>> +	goto fail;
>>>>>>>> +corrupted:
>>>>>>>> +	err = -EFSCORRUPTED;
>>>>>>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>>>>>> +	f2fs_folio_put(folio, false);
>>>>>>>>   fail:
>>>>>>>>   	trace_f2fs_unlink_exit(inode, err);
>>>>>>>>   	return err;
>>>>>>>
>>>>>>
>>>>>> Hi Chao,
>>>>>>
>>>>>> Thank you for the suggestion.
>>>>>> I will add this to sanity_check_inode and remove it
>>>>>> from f2fs_lookup as it becomes redundant since f2fs_lookup
>>>>>> obtains the inode through f2fs_iget. For f2fs_unlink I will
>>>>>> move the i_nlink == 1 check to f2fs_rmdir.
>>>>>
>>>>> Hi Nikola,
>>>>>
>>>>> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
>>>>> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
>>>>> inode, we will always call sanity_check_inode().
>>>>>
>>>>> Let me know if you have other concerns.
>>>>>
>>>>> Thanks,
>>>>>
>>>>
>>>> The issue here is that sanity_check_inode will be called only when 
>>>> we initially read the inode off disk, not when it's already in the cache
>>>>
>>>> The syzkaller repro does something like this:
>>>> Creates a directory structure /dir1/dir2 where dir1 has
>>>> i_nlink == 2, which is one less than it should. It then does
>>>> rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.
>>>
>>> Oh, I missed this case.
>>>
>>>>
>>>> In such case what would you say should happen, should the second rmdir
>>>> fail and report the corruption, or do we close our eyes and just drop
>>>> i_nlink to 0 and possibly log a message that something isn't quite right?
>>>
>>> I agreed that we should keep i_nlink == 1 check in f2fs_unlink().
>>>
>>> Thanks,
>>>
>>
>> Hi Chao,
>>
>> Just to make sure we're on the same page, do you mean to keep the check 
>> in f2fs_unlink as well as sanity_check_inode, or only do it in f2fs_unlink?
>>
> 
> Hello,
> 
> Kindly sending a reminder here, could you please
> provide input when you have the chance?

Hi Nikola,

Sorry for the delay, I missed to reply.

I meant that we can add sanity check (i_nlink == 1) for directory in:
- f2fs_unlink(), so that, we can detect runtime i_nlink inconsistency.
- sanity_check_inode(), then, we can detect on-disk i_nlink inconsistency.

Thanks,

> 
> Thank you!
> 
>>>>
>>>> Thank you,
>>>>
>>>>>>
>>>>>> I will send v2 as soon as I do some more testing.
>>>>>
>>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
