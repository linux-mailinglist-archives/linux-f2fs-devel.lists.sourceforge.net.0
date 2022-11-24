Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEF637C93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Nov 2022 16:12:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyDty-0000uO-D0;
	Thu, 24 Nov 2022 15:12:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oyDtx-0000uD-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5PHz6T1Nwi9LLS40KIDC5IPbNuy/KAeTP9B2f8AS3Ss=; b=a7Nm3O8tGmEAjICp0HhWvi4nDp
 S7XxCID2vJwjJOYKRnX+2MErCungK5ueUlluRRxEpDG0uhUhrEyPbU8H8GZ3GsefKqPis2yZuT8Du
 ks9of5tTzInaI/eELIcYTuo55hsOgNhu4U5u8qzub9NG1iyIv3T5CsIzsw1UP0o7JPwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5PHz6T1Nwi9LLS40KIDC5IPbNuy/KAeTP9B2f8AS3Ss=; b=FquWopRRxKExdT9f1qDoNKPyN4
 e3UdlJIrsYdPiVJrVsNRC1y/5iWFuSd2FMaYR5pcC2KyqLnbqeHm4VU5JoHfaWfBxOP5f0u3/6as6
 E4/HPsquInOd6y3Os9V4OWs1EhCeDWOea4Cohtep4yramnLAuFQbiBjeeR/Kdvw0vJL8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyDtw-0007Gu-9P for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:12:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D62F6B82833;
 Thu, 24 Nov 2022 15:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD06C433D6;
 Thu, 24 Nov 2022 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669302744;
 bh=OtLRvA4YMC+HsHOS+DjoSGWEC2yDF5c6xjThOmpeUiw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LExguQ8/5p1rEte9Om550OXwVQL5KHe3B8Aq6oOUB0i4QIWInzh1bHmLp08Uy56YS
 UKOyC7u8Kddlv9bkFq/gQtfaD+H4DC4FF+RZjvTRxHGYSNIO/txXbOFRrHV73on9us
 gF2ZR1IS6rn13RKF4KX1F2xA9Lr4/L+BhCk5Abk8yhus4a+r14SALefvfNudaSKwnH
 C2Yn5GVZLArSjz2irlIRCK/8efBmgOLrjGxZIYtdbpr32fu1SYKTQORaKO6XkiTK8K
 CIwYHvVrREyGZtv2XxdrSCCTThMEcye/wP5t+ZrDActpqHu2gdegV6szTKpOkNOM8R
 6Xu64UO3ZuuGw==
Message-ID: <1faee1c5-33ca-2d1f-0079-0e7bcbd3df21@kernel.org>
Date: Thu, 24 Nov 2022 23:12:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221111170406.1086745-1-daeho43@gmail.com>
 <6e26eb7d-8b9e-5a91-b66f-a6f8cf1d53ce@kernel.org>
 <Y36Xis5vGsfzVS8l@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y36Xis5vGsfzVS8l@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/24 5:58, Jaegeuk Kim wrote: > On 11/23, Chao Yu
 wrote: >> On 2022/11/12 1:04,
 Daeho Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com>
 >>> >>> introduce a new ioctl to replace the w [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyDtw-0007Gu-9P
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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

On 2022/11/24 5:58, Jaegeuk Kim wrote:
> On 11/23, Chao Yu wrote:
>> On 2022/11/12 1:04, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> introduce a new ioctl to replace the whole content of a file atomically,
>>> which means it induces truncate and content update at the same time.
>>> We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
>>> F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
>>> F2FS_IOC_ABORT_ATOMIC_WRITE.
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>> v7: changed where to clear FI_ATOMIC_REPLACE
>>>       fixed tentative race condition in f2fs_ioc_start_atomic_write()
>>> v3: move i_size change after setting atomic write flag
>>> v2: add undefined ioctl number reported by <lkp@intel.com>
>>> ---
>>>    fs/f2fs/data.c            |  3 +++
>>>    fs/f2fs/f2fs.h            |  1 +
>>>    fs/f2fs/file.c            | 21 +++++++++++++++------
>>>    fs/f2fs/segment.c         | 13 ++++++++++++-
>>>    include/uapi/linux/f2fs.h |  1 +
>>>    5 files changed, 32 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 5f895ddcd64a..bce4dcc3ad78 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3457,6 +3457,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>>>    	else if (*blk_addr != NULL_ADDR)
>>>    		return 0;
>>> +	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
>>> +		goto reserve_block;
>>> +
>>>    	/* Look for the block in the original inode */
>>>    	err = __find_data_block(inode, index, &ori_blk_addr);
>>>    	if (err)
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index e29f9adf60ca..d513ecd17550 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -765,6 +765,7 @@ enum {
>>>    	FI_ALIGNED_WRITE,	/* enable aligned write */
>>>    	FI_COW_FILE,		/* indicate COW file */
>>>    	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
>>> +	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
>>>    	FI_MAX,			/* max flag, never be used */
>>>    };
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 7ce629c95f4a..f9a04f6d76cb 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1984,7 +1984,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
>>>    	return put_user(inode->i_generation, (int __user *)arg);
>>>    }
>>> -static int f2fs_ioc_start_atomic_write(struct file *filp)
>>> +static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>>    {
>>>    	struct inode *inode = file_inode(filp);
>>>    	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
>>> @@ -2053,15 +2053,22 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>>    	f2fs_write_inode(inode, NULL);
>>> -	isize = i_size_read(inode);
>>> -	fi->original_i_size = isize;
>>> -	f2fs_i_size_write(fi->cow_inode, isize);
>>> -
>>>    	stat_inc_atomic_inode(inode);
>>>    	set_inode_flag(inode, FI_ATOMIC_FILE);
>>>    	set_inode_flag(fi->cow_inode, FI_COW_FILE);
>>>    	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>>> +
>>> +	isize = i_size_read(inode);
>>> +	fi->original_i_size = isize;
>>> +	if (truncate) {
>>> +		set_inode_flag(inode, FI_ATOMIC_REPLACE);
>>> +		truncate_inode_pages_final(inode->i_mapping);
>>> +		f2fs_i_size_write(inode, 0);
>>> +		isize = 0;
>>> +	}
>>> +	f2fs_i_size_write(fi->cow_inode, isize);
>>> +
>>>    	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>>    	f2fs_update_time(sbi, REQ_TIME);
>>> @@ -4089,7 +4096,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>    	case FS_IOC_GETVERSION:
>>>    		return f2fs_ioc_getversion(filp, arg);
>>>    	case F2FS_IOC_START_ATOMIC_WRITE:
>>> -		return f2fs_ioc_start_atomic_write(filp);
>>> +		return f2fs_ioc_start_atomic_write(filp, false);
>>> +	case F2FS_IOC_START_ATOMIC_REPLACE:
>>> +		return f2fs_ioc_start_atomic_write(filp, true);
>>>    	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
>>>    		return f2fs_ioc_commit_atomic_write(filp);
>>>    	case F2FS_IOC_ABORT_ATOMIC_WRITE:
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 9cbf88092c78..f2930fffbc7d 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -197,6 +197,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>>>    	fi->cow_inode = NULL;
>>>    	release_atomic_write_cnt(inode);
>>>    	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
>>> +	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
>>>    	clear_inode_flag(inode, FI_ATOMIC_FILE);
>>>    	stat_dec_atomic_inode(inode);
>>> @@ -261,14 +262,24 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
>>>    					bool revoke)
>>>    {
>>>    	struct revoke_entry *cur, *tmp;
>>> +	pgoff_t start_index = 0;
>>> +	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
>>>    	list_for_each_entry_safe(cur, tmp, head, list) {
>>> -		if (revoke)
>>> +		if (revoke) {
>>>    			__replace_atomic_write_block(inode, cur->index,
>>>    						cur->old_addr, NULL, true);
>>> +		} else if (truncate) {
>>> +			f2fs_truncate_hole(inode, start_index, cur->index);
>>> +			start_index = cur->index + 1;
>>
>> Do we try to truncate from page #0 to page #(index of last page in chain)?
>>
>> If so, how about calling f2fs_truncate_hole(, 0, last_index) after the loop?
> 
> I think either would be fine. Could you please send a separate patch for this?

Fine, let me add a new patch to clean up it.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>> +		}
>>> +
>>>    		list_del(&cur->list);
>>>    		kmem_cache_free(revoke_entry_slab, cur);
>>>    	}
>>> +
>>> +	if (!revoke && truncate)
>>> +		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
>>>    }
>>>    static int __f2fs_commit_atomic_write(struct inode *inode)
>>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>>> index 3121d127d5aa..955d440be104 100644
>>> --- a/include/uapi/linux/f2fs.h
>>> +++ b/include/uapi/linux/f2fs.h
>>> @@ -42,6 +42,7 @@
>>>    						struct f2fs_comp_option)
>>>    #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
>>>    #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>>> +#define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>>>    /*
>>>     * should be same as XFS_IOC_GOINGDOWN.
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
