Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD79BD316A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Oct 2025 14:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Na+WkVNbwTkZjg3/jreucPG+Ef+ZX7ySopkF04b/qg=; b=NB+ZDMuwyZByCK46SmWD1H4mZn
	IziFR9VJVr4WVPXKffBtn5M20fuj8Md2a+YY4VI2CYk33arBs/KsL908bBt2sL1nuuSHKxJRC6bxl
	Im6uqb9r6jQIq7sMR4wRQAR/DaNNHVDCzgkmHaNw0GNS6GVBaM4BVgHhe3axKCgQgXp4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8I3F-0004Y3-Q5;
	Mon, 13 Oct 2025 12:53:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8I3D-0004Xl-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 12:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mYpo+l5PNf76evMSN4afl29rfwLyqniqdOUNijxkvH4=; b=SNnPe85axLL8l2fp16+g0husuL
 uFMzv7QwCtafYgfJHKO6vvh6Yqisfowk+FBAOp4x1QsfSjlHgjQGptgQpSsY5W96RwUrM9HDBPiiN
 5KsnQ4h8A2zM6AYH/YlnpWKBm1vSwgvnFMNZF6cGp78gJi04oFbLIONDGMg2nkFzkY+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mYpo+l5PNf76evMSN4afl29rfwLyqniqdOUNijxkvH4=; b=Ju8ivnYbnx7/N6YV9U7RpaaX0e
 F/Innn8AwjqftvwgptLy48UxglbdlS5sH9xLsEgh15RpqHb7FaQipnjOPIgSUs3RjeGCqBBIUE8oH
 +O7/Wue+WWsIQ1JlPoM2KtMPhn86LpKTdRHmkxQndpoxATriHt+yhS/QkP8v1jQlnfbE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8I3D-0005dC-V3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 12:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9990045312;
 Mon, 13 Oct 2025 12:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B590C4CEE7;
 Mon, 13 Oct 2025 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760359989;
 bh=QrfJt2hUMOOD+gjf01fYxogMQriU6KiB9/iGzz3A5eo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=O5G6+SKanFheTVhhE+NeS8tIo4vNAICs41T/v/LM0moYsBF5dCxC6lZ/k4VedORqe
 uDuWtvh8BxrwZuEUb4qa59egVmQcTSFIarFOMePK9ZuzZT7TbWgcC+WLDnmLB3ogHl
 LEFpkJ0bJ+JiwKQfaZI2lPxTAqf4I0YlANkFEMyu7vJ/aUfNjZJdkuZdv9SaEMDTwT
 M3a6N7Ntf/uaCeib128QNXqJwqYo/grlDmLPo70/+QujHYLi3epUIGXJc2ZRqDN4gV
 SygHaeJagr/v9PsqvUgV4MYUqjEjGUxUryFzO0i4qcYn2pxmAN49LdAqXcck84RIWM
 qzBhQqxdfI8gg==
Message-ID: <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
Date: Mon, 13 Oct 2025 20:53:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
Content-Language: en-US
In-Reply-To: <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/13/25 05:19, Nikola Z. Ivanov wrote: > On Thu, Oct 09, 
 2025 at 10:54:40AM +0800, Chao Yu wrote: >> On 10/3/2025 9:47 PM, Nikola
 Z. Ivanov wrote: >>> Current i_nlink corruption check does not tak [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8I3D-0005dC-V3
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

On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
>> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
>>> Current i_nlink corruption check does not take into account
>>> directory inodes which have one additional i_nlink for their "." entry.
>>>
>>> Add additional check and a common corruption path.
>>>
>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
>>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>>> ---
>>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>> index b882771e4699..68b33e8089b0 100644
>>> --- a/fs/f2fs/namei.c
>>> +++ b/fs/f2fs/namei.c
>>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>   		goto out;
>>>   	}
>>> -	if (inode->i_nlink == 0) {
>>> +	if (unlikely(inode->i_nlink == 0)) {
>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>   			  __func__, inode->i_ino);
>>> -		err = -EFSCORRUPTED;
>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> -		goto out_iput;
>>> +		goto corrupted;
>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		goto corrupted;
>>
>> Can we detect such corruption in sanity_check_inode() as well? So that if
>> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
>> flag and then triggering fsck repairment later.
>>
>> Thanks,
>>
>>>   	}
>>>   	if (IS_ENCRYPTED(dir) &&
>>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>>>   	return new;
>>> +corrupted:
>>> +	err = -EFSCORRUPTED;
>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>>   out_iput:
>>>   	iput(inode);
>>>   out:
>>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>   	if (unlikely(inode->i_nlink == 0)) {
>>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>   			  __func__, inode->i_ino);
>>> -		err = -EFSCORRUPTED;
>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> -		f2fs_folio_put(folio, false);
>>> -		goto fail;
>>> +		goto corrupted;
>>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		goto corrupted;
>>>   	}
>>>   	f2fs_balance_fs(sbi, true);
>>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>   	if (IS_DIRSYNC(dir))
>>>   		f2fs_sync_fs(sbi->sb, 1);
>>> +
>>> +	goto fail;
>>> +corrupted:
>>> +	err = -EFSCORRUPTED;
>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> +	f2fs_folio_put(folio, false);
>>>   fail:
>>>   	trace_f2fs_unlink_exit(inode, err);
>>>   	return err;
>>
> 
> Hi Chao,
> 
> Thank you for the suggestion.
> I will add this to sanity_check_inode and remove it
> from f2fs_lookup as it becomes redundant since f2fs_lookup
> obtains the inode through f2fs_iget. For f2fs_unlink I will
> move the i_nlink == 1 check to f2fs_rmdir.

Hi Nikola,

I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
f2fs_unlink() to sanity_check_inode(), because before we create in-memory
inode, we will always call sanity_check_inode().

Let me know if you have other concerns.

Thanks,

> 
> I will send v2 as soon as I do some more testing.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
