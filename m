Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE4682BA0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 12:38:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMoxh-0001yC-1U;
	Tue, 31 Jan 2023 11:38:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMoxc-0001xt-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 11:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uh4y/T5R6Ke8DJm7nm3+cRmpdQB7IyTAPSUmFxTZIfY=; b=aS9oD3msXSsA+eSUJufre5rFS6
 4fzfNdproj5J4WRGWfRvck4rBSdCZNCt8tUzFgRe+kQPQwC/t1FIxWePNDSOIXOB6EjaYkI6Rz/ni
 0w86QfhlhM8c9Lg4697iXblxT12O3ou3D4GKQUYBwW08/05kjvOJ4mOXccbvJbz3B718=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uh4y/T5R6Ke8DJm7nm3+cRmpdQB7IyTAPSUmFxTZIfY=; b=Fywl6l2b/nQri/4xreFpY80TmI
 f8BgXYQI/vXRK1i+vEVZw52iHXn01I6diq1/KgeZ+qBQpAP+yeWPAQuqykc7ctkFv5pqTnST/YoBx
 QSlZJ/yp7ias7cIfU/mwtRI+seHMmpRSW4xEphn0bpwaChuoCpgjbNQ2HR1LJm8LR9Dg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMoxb-005A5o-AA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 11:38:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF8E3614C6;
 Tue, 31 Jan 2023 11:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41CFC4339E;
 Tue, 31 Jan 2023 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675165073;
 bh=sGdbPulwQ30bkjroHmubJnmE4WlOTPNQAtF0xVu25AY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JNXdzzEIE5atIAnj7RkUVBIsrn8tm+SLAIccaW1vKHEW0n0nDO81l/3H+WJc6YTuM
 bLdZUM/SqelCuTbfUDaEvG/u3ERga9fknN7ymIgWGoAOWN6QNv8ZHtO4NiRSYHrOuh
 7+XO0RUEVL+hfo7k9IeBtCDNmUfcmJ5gnz+peFABbPuz5iEY1B0T6mpzB87x9SRWgl
 /hWP7kl+Xy8cRBNidbT/1fKDB+kn1apKvcqUJZPfvxzj58G99sqtQwVptggCSV82VS
 7vvJPf8/uYJ6Aamrdu9Z/N8XYafyTJk2x8x8JOgKDeRK3z/9FLOn1r9yrboJEy0Ozi
 2jz9o1TKSskEg==
Message-ID: <8f1c15a3-d056-7709-af45-fe7cba56463f@kernel.org>
Date: Tue, 31 Jan 2023 19:37:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20230113004933.2082072-1-daeho43@gmail.com>
 <ed5f65a7-13bb-581c-cfb5-df5ab30fbc4c@kernel.org>
 <CACOAw_zhVgS84gOXpfZuvptMgsZDhP3QX2EFm=5CoKibB+3V1A@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zhVgS84gOXpfZuvptMgsZDhP3QX2EFm=5CoKibB+3V1A@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daeho, On 2023/1/31 0:34, Daeho Jeong wrote: > Hi Chao,
 > > I read your patch series now and I like it. Thank you for checking the
 patches. :) 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMoxb-005A5o-AA
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
 linux-kernel@vger.kernel.org,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

On 2023/1/31 0:34, Daeho Jeong wrote:
> Hi Chao,
> 
> I read your patch series now and I like it.

Thank you for checking the patches. :)

> However, how about a race condition between start_atomic_write and
> abort_atomic_write?

Yup, I noticed that issue, I guess we can avoid this race condition by
covering these two flows w/ i_atomic_sem.

> abort_atomic_write is called without inode_lock in closing filp scenarios.
> What do you think about this?

I'm fine w/ your change as it's more clean, but it's better to drop cow_inode's
page cache if atomic_write is committed or aborted to avoid caching obsolete page?

Thanks,

> 
> Thanks,
> 
> 
> On Fri, Jan 27, 2023 at 6:07 PM Chao Yu <chao@kernel.org> wrote:
>>
>> Hi Daeho, Jaegeuk,
>>
>> Please take a look at patchset in below link:
>>
>> https://lore.kernel.org/linux-f2fs-devel/20230109034453.490176-1-chao@kernel.org/T/#t
>>
>> In PATCH 4/5, I'm trying to fix the same issue w/ alternative way, let me
>> know your preference. :)
>>
>> One comment as below.
>>
>> On 2023/1/13 8:49, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> To fix a race condition between atomic write aborts, I use the inode
>>> lock and make COW inode to be re-usable thoroughout the whole
>>> atomic file inode lifetime.
>>>
>>> Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
>>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>>    fs/f2fs/file.c    | 43 ++++++++++++++++++++++++++++---------------
>>>    fs/f2fs/inode.c   | 11 +++++++++--
>>>    fs/f2fs/segment.c |  3 ---
>>>    fs/f2fs/super.c   |  2 --
>>>    4 files changed, 37 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index ecbc8c135b49..ff072a9ed258 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1866,7 +1866,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
>>>                        atomic_read(&inode->i_writecount) != 1)
>>>                return 0;
>>>
>>> +     inode_lock(inode);
>>>        f2fs_abort_atomic_write(inode, true);
>>> +     inode_unlock(inode);
>>> +
>>>        return 0;
>>>    }
>>>
>>> @@ -1880,8 +1883,11 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
>>>         * until all the writers close its file. Since this should be done
>>>         * before dropping file lock, it needs to do in ->flush.
>>>         */
>>> -     if (F2FS_I(inode)->atomic_write_task == current)
>>> +     if (F2FS_I(inode)->atomic_write_task == current) {
>>> +             inode_lock(inode);
>>>                f2fs_abort_atomic_write(inode, true);
>>> +             inode_unlock(inode);
>>> +     }
>>>        return 0;
>>>    }
>>>
>>> @@ -2087,19 +2093,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>>                goto out;
>>>        }
>>>
>>> -     /* Create a COW inode for atomic write */
>>> -     pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>>> -     if (IS_ERR(pinode)) {
>>> -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>> -             ret = PTR_ERR(pinode);
>>> -             goto out;
>>> -     }
>>> +     /* Check if the inode already has a COW inode */
>>> +     if (fi->cow_inode == NULL) {
>>> +             /* Create a COW inode for atomic write */
>>> +             pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>>> +             if (IS_ERR(pinode)) {
>>> +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>> +                     ret = PTR_ERR(pinode);
>>> +                     goto out;
>>> +             }
>>>
>>> -     ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
>>> -     iput(pinode);
>>> -     if (ret) {
>>> -             f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>> -             goto out;
>>> +             ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
>>> +             iput(pinode);
>>> +             if (ret) {
>>> +                     f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>> +                     goto out;
>>> +             }
>>> +
>>> +             set_inode_flag(fi->cow_inode, FI_COW_FILE);
>>> +             clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>>> +     } else {
>>> +             /* Reuse the already created COW inode */
>>> +             f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>>>        }
>>>
>>>        f2fs_write_inode(inode, NULL);
>>> @@ -2107,8 +2122,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>>        stat_inc_atomic_inode(inode);
>>>
>>>        set_inode_flag(inode, FI_ATOMIC_FILE);
>>> -     set_inode_flag(fi->cow_inode, FI_COW_FILE);
>>> -     clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>>>
>>>        isize = i_size_read(inode);
>>>        fi->original_i_size = isize;
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index ff6cf66ed46b..4921f7209e28 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -766,11 +766,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>>>    void f2fs_evict_inode(struct inode *inode)
>>>    {
>>>        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>> -     nid_t xnid = F2FS_I(inode)->i_xattr_nid;
>>> +     struct f2fs_inode_info *fi = F2FS_I(inode);
>>> +     nid_t xnid = fi->i_xattr_nid;
>>>        int err = 0;
>>>
>>>        f2fs_abort_atomic_write(inode, true);
>>>
>>> +     if (fi->cow_inode) {
>>> +             clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>>> +             iput(fi->cow_inode);
>>> +             fi->cow_inode = NULL;
>>> +     }
>>> +
>>>        trace_f2fs_evict_inode(inode);
>>>        truncate_inode_pages_final(&inode->i_data);
>>>
>>> @@ -857,7 +864,7 @@ void f2fs_evict_inode(struct inode *inode)
>>>        stat_dec_inline_inode(inode);
>>>        stat_dec_compr_inode(inode);
>>>        stat_sub_compr_blocks(inode,
>>> -                     atomic_read(&F2FS_I(inode)->i_compr_blocks));
>>> +                     atomic_read(&fi->i_compr_blocks));
>>>
>>>        if (likely(!f2fs_cp_error(sbi) &&
>>>                                !is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index ae3c4e5474ef..536d7c674b04 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>>>        if (!f2fs_is_atomic_file(inode))
>>>                return;
>>>
>>> -     clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>>> -     iput(fi->cow_inode);
>>> -     fi->cow_inode = NULL;
>>>        release_atomic_write_cnt(inode);
>>>        clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
>>>        clear_inode_flag(inode, FI_ATOMIC_REPLACE);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 1f812b9ce985..10463f084d30 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -1430,8 +1430,6 @@ static int f2fs_drop_inode(struct inode *inode)
>>>                        atomic_inc(&inode->i_count);
>>>                        spin_unlock(&inode->i_lock);
>>>
>>> -                     f2fs_abort_atomic_write(inode, true);
>>
>> In order to avoid caching obsolete page of cow_inode, how about truncating
>> them here?
>>
>> if (f2fs_is_atomic_file() && cow_inode)
>>          truncate_inode_pages_final(&cow_inode->i_data);
>>
>> Thanks,
>>
>>> -
>>>                        /* should remain fi->extent_tree for writepage */
>>>                        f2fs_destroy_extent_node(inode);
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
