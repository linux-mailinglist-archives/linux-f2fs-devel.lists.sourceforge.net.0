Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0251C829D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 08:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWaBU-0004XO-B0; Thu, 07 May 2020 06:39:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWaBT-0004XE-4z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 06:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEh3uv75BsYWjZ0NOafhuQc+E/xYjYHARQg3lzhKkCE=; b=jAwUElAo08CCBV/X2a48n9LM59
 JHHAQjT+/92eo28qxzCktusCed/TM23cJ1jVUmhOEHunmRXHM0sfkP6ozciXDqf3+z0YNYUU6pI0W
 av7VkIOgN/l0QmY8pHuKdgvPUMiEwbrpyC5FjKaPOhhgEuBS0kSMVrqx7uOVY6vj6WFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fEh3uv75BsYWjZ0NOafhuQc+E/xYjYHARQg3lzhKkCE=; b=RM65HMFHhHpPhenUfzyLZBCpPk
 6Z0XqPHvh76X346TcXN9mXvL99hRCq8Zb03bwOPhLIkt/wCTN8FZWCkgCPNfb2iXvcrpz6jp8UstB
 1bySyPbyFCEmiKz7BLP7Y/gvfrmtRTPTu6GpDMYs+z1HVkScPnTNKhE52RUg4dGAzJrk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWaBO-00AnBy-23
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 06:39:03 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EAF86B5CC73187F0CE21;
 Thu,  7 May 2020 14:38:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May 2020
 14:38:43 +0800
To: Gao Xiang <hsiangkao@gmx.com>, Eric Biggers <ebiggers@kernel.org>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com> <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506191613.GB842@sol.localdomain>
 <20200506223623.GA27760@hsiangkao-HP-ZHAN-66-Pro-G1>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3a837113-8081-6f01-4d8d-1d4b6600ec8c@huawei.com>
Date: Thu, 7 May 2020 14:38:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200506223623.GA27760@hsiangkao-HP-ZHAN-66-Pro-G1>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWaBO-00AnBy-23
Subject: Re: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/7 6:36, Gao Xiang wrote:
> On Wed, May 06, 2020 at 12:16:13PM -0700, Eric Biggers wrote:
>> On Wed, May 06, 2020 at 02:47:19PM +0800, Gao Xiang wrote:
>>> On Wed, May 06, 2020 at 09:58:22AM +0800, Gao Xiang wrote:
>>>> On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
>>>>> On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
>>>>>>>
>>>>>>> Actually, I think this is wrong because the fsync can be done via a file
>>>>>>> descriptor that was opened to a now-deleted link to the file.
>>>>>>
>>>>>> I'm still confused about this...
>>>>>>
>>>>>> I don't know what's wrong with this version from my limited knowledge?
>>>>>>  inode itself is locked when fsyncing, so
>>>>>>
>>>>>>    if the fsync inode->i_nlink == 1, this inode has only one hard link
>>>>>>    (not deleted yet) and should belong to a single directory; and
>>>>>>
>>>>>>    the only one parent directory would not go away (not deleted as well)
>>>>>>    since there are some dirents in it (not empty).
>>>>>>
>>>>>> Could kindly explain more so I would learn more about this scenario?
>>>>>> Thanks a lot!
>>>>>
>>>>> i_nlink == 1 just means that there is one non-deleted link.  There can be links
>>>>> that have since been deleted, and file descriptors can still be open to them.
>>>>
>>>> Thanks for your inspiration. You are right, thanks.
>>>>
>>>> Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
>>>> take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.
>>>>
>>>> And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
>>>> no race by using d_find_alias here. Thanks again.
>>>>
>>>
>>> (think more little bit just now...)
>>>
>>>  Thread 1:                                           Thread 2 (fsync):
>>>   vfs_unlink                                          try_to_fix_pino
>>>     f2fs_unlink
>>>        f2fs_delete_entry
>>>          f2fs_drop_nlink  (i_sem, inode->i_nlink = 1)
>>>
>>>   (...   but this dentry still hashed)                  i_sem, check inode->i_nlink = 1
>>>                                                         i_sem d_find_alias
>>>
>>>   d_delete
>>>
>>> I'm not sure if fsync could still use some wrong alias by chance..
>>> completely untested, maybe just noise...

Another race condition could be:

Thread 1 (fsync)		Thread 2 (rename)
- f2fs_sync_fs
- try_to_fix_pino
				- f2fs_rename
				 - down_write
				 - file_lost_pino
				 - up_write
 - down_write
 - file_got_pino
 - up_write

Thanks,

>>>
>>
>> Right, good observation.  My patch makes it better, but it's still broken.
>>
>> I don't know how to fix it.  If we see i_nlink == 1 and multiple hashed
>> dentries, there doesn't appear to be a way to distingush which one corresponds
>> to the remaining link on-disk (if any; it may not even be in the dcache), and
>> which correspond to links that vfs_unlink() has deleted from disk but hasn't yet
>> done d_delete() on.
>>
>> One idea would be choose one, then take inode_lock_shared(dir) and do
>> __f2fs_find_entry() to check if the dentry is really still on-disk.  That's
>> heavyweight and error-prone though, and the locking could cause problems.
>>
>> I'm wondering though, does f2fs really need try_to_fix_pino() at all, and did it
>> ever really work?  It never actually updates the f2fs_inode::i_name to match the
>> new directory.  So independently of this bug with deleted links, I don't see how
>> it can possibly work as intended.
> 
> Part of my humble opinion would be "update pino in rename/unlink/link... such ops
> instead of in fsync" (maybe it makes better sense of locking)... But actually I'm
> not a f2fs folk now, just curious about what the original patch resolved with
> these new extra igrab/iput (as I said before, I could not find some clue previously).
> 
> Thanks,
> Gao Xiang
> 
>>
>> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
