Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BBD620594
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 02:06:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osD4b-0002YP-6w;
	Tue, 08 Nov 2022 01:06:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1osD4a-0002YJ-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 01:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfp1SHiGRK0ERFaTprULs+6zoDe4kKnYOnkuldHjvK0=; b=MsTIXFNHYegip690suXKR0ikQW
 OOVEMHNMcLOaV5/QGGQ1ASgilepg80fZz6OfHJHjUmzAXpup9gaihUGGF8xbyqLEkUlYzbmXco5SK
 t4vxRhSYymKBqQK5nemRpWe8AEdRPa7Wk5/plxuc7o4QrYwL/o4p7/tEmEdl1tSFeFr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qfp1SHiGRK0ERFaTprULs+6zoDe4kKnYOnkuldHjvK0=; b=X4h8H0CZN+9feKMKKMKH4Nsfwl
 sAyyfqE1yuT+cemHRYfiPC19EFvpccR45qKAb1JQUfHwK5x6mO4EK6RjbapRFhQskJtJ/B9QiStJ5
 1P+xFAD97rl8sYtdjBa6WR3iX8mg15TkRpaCardAaOG/r/snnMmzZpMWBSNwZr+EG3EE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osD4W-00FfrW-1L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 01:06:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A03AB6137C;
 Tue,  8 Nov 2022 01:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F47BC433C1;
 Tue,  8 Nov 2022 01:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667869589;
 bh=fMLhUX07pSNSkDg8dzTeiM4tsFWqD3ltLaK0XNYd6PM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XizbBn9GVFMc1LSh2/SH4G3uzK9q9Wul+darKM9jn0tb/GxkIZA02wLPiYKIOx5CG
 RYuf2KEG2/L/8EKnNUWg+PJA6IrlDjMXPKv1dYXLvHRrOamv/f15KbhW4smdkSIz4e
 9wxCwzXdoh29fzlB6AnQ85FbZaqNYn82C9gJCIpY94yd+26u8eyMgwE5wa7ejhVM2n
 /HyhlzKcSz9mkzVqJ0IzBS7J57Wc30F2p33ZlR5QkX4yH0tavRrO5wRN1Q3MVo197d
 KUmgyf8Lt3+ck4rATWGTtJgvnwM5m2AqDyYyNiyIk7dMvLhF7JXvs/pb6J6NyuCwmN
 71fE1aAoKOYlw==
Message-ID: <b42f9a77-942b-9e55-2637-93821255b370@kernel.org>
Date: Tue, 8 Nov 2022 09:06:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20221106094855.131967-1-chao@kernel.org>
 <Y2lOmCIt5gZmFJ5H@sol.localdomain>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y2lOmCIt5gZmFJ5H@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/8 2:29, Eric Biggers wrote: > On Sun, Nov 06, 2022
 at 05:48:55PM +0800, Chao Yu wrote: >> Wei Chen reports a kernel bug as blew:
 >> >> INFO: task syz-executor.0:29056 blocked for more than [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osD4W-00FfrW-1L
Subject: Re: [f2fs-dev] [PATCH] f2fs: speed up f2fs_empty_dir()
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
Cc: Wei Chen <harperchen1110@gmail.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/8 2:29, Eric Biggers wrote:
> On Sun, Nov 06, 2022 at 05:48:55PM +0800, Chao Yu wrote:
>> Wei Chen reports a kernel bug as blew:
>>
>> INFO: task syz-executor.0:29056 blocked for more than 143 seconds.
>>        Not tainted 5.15.0-rc5 #1
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:syz-executor.0  state:D stack:14632 pid:29056 ppid:  6574 flags:0x00000004
>> Call Trace:
>>   __schedule+0x4a1/0x1720
>>   schedule+0x36/0xe0
>>   rwsem_down_write_slowpath+0x322/0x7a0
>>   fscrypt_ioctl_set_policy+0x11f/0x2a0
>>   __f2fs_ioctl+0x1a9f/0x5780
>>   f2fs_ioctl+0x89/0x3a0
>>   __x64_sys_ioctl+0xe8/0x140
>>   do_syscall_64+0x34/0xb0
>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> Eric did some investigation on this issue, quoted from reply of Eric:
>>
>> "Well, the quality of this bug report has a lot to be desired (not on
>> upstream kernel, reproducer is full of totally irrelevant stuff, not
>> sent to the mailing list of the filesystem whose disk image is being
>> fuzzed, etc.).  But what is going on is that f2fs_empty_dir() doesn't
>> consider the case of a directory with an extremely large i_size on a
>> malicious disk image.
>>
>> Specifically, the reproducer mounts an f2fs image with a directory
>> that has an i_size of 14814520042850357248, then calls
>> FS_IOC_SET_ENCRYPTION_POLICY on it.
>>
>> That results in a call to f2fs_empty_dir() to check whether the
>> directory is empty.  f2fs_empty_dir() then iterates through all
>> 3616826182336513 blocks the directory allegedly contains to check
>> whether any contain anything.  i_rwsem is held during this, so
>> anything else that tries to take it will hang."
>>
>> In order to solve this issue, let's use f2fs_get_next_page_offset()
>> to speed up iteration by skipping holes for all below functions:
>> - f2fs_empty_dir
>> - f2fs_readdir
>> - find_in_level
>>
>> The way why we can speed up iteration was described in
>> 'commit 3cf4574705b4 ("f2fs: introduce get_next_page_offset to speed
>> up SEEK_DATA")'.
>>
>> Meanwhile, in f2fs_empty_dir(), let's use f2fs_find_data_page()
>> instead f2fs_get_lock_data_page(), due to i_rwsem was held in
>> caller of f2fs_empty_dir(), there shouldn't be any races, so it's
>> fine to not lock dentry page during lookuping dirents in the page.
>>
>> Link: https://lore.kernel.org/lkml/536944df-a0ae-1dd8-148f-510b476e1347@kernel.org/T/
>> Reported-by: Wei Chen <harperchen1110@gmail.com>
>> Cc: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 17 ++++++++++++-----
>>   fs/f2fs/dir.c  | 34 ++++++++++++++++++++++++----------
>>   fs/f2fs/f2fs.h |  5 +++--
>>   fs/f2fs/gc.c   |  4 ++--
>>   4 files changed, 41 insertions(+), 19 deletions(-)
> 
> Thanks.  I'm not an expert on all the details, but this patch looks good to me.
> 
> Given that it optimizes lookups and readdirs too, a better title for the patch
> might be something like "f2fs: optimize iteration over sparse directories".

Yes, thanks for your suggestion, will update in v2.

Thanks,

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
