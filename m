Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB55F76FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Oct 2022 12:38:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogkk1-0005DZ-Bl;
	Fri, 07 Oct 2022 10:38:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogkjy-0005DB-GM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 10:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6N6YOXpC8juIvfNZUCFgxuCIDURy1IKD7XNL8aOPgMo=; b=JNyyDk/romSZx1hyP7CpQvoxgZ
 aWIS3diqbDHDs0lXjdoH9CFmFm8flrkFmr7W1OunMcAavEGpcsY7sVWdS3U3KNAxzRmC6Pu/Mfo9v
 IUyVmgnRX3G94bvCX+vMmQpUt6Jisxfa6E1KEiCHFF8rvYlxZUaNvSrygxRz01ZPDWC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6N6YOXpC8juIvfNZUCFgxuCIDURy1IKD7XNL8aOPgMo=; b=cJKjFqQvYeWZxPno0s0ZcvlXRt
 jiiYWK8AevITAMHntDZSL9Nh4/V4XQPYRan9d0oRmAVmHYB/MCdtj2PouWtHBwgwXTokMkfPszHoi
 1teJ19UvqQ3pjEx7UswLlBgMeP7UN/alCS/DGmejkNjUndmeND/rf+NVNurvv31ANf6k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogkjx-00033m-CS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 10:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C1A8B821EC;
 Fri,  7 Oct 2022 10:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C3FC433D6;
 Fri,  7 Oct 2022 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665139073;
 bh=Pl3iAD/5G+SNfYl4QrD98UtT2vc2ZQkXtR5hchYEjR4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HJITOn3VdHp8rGYkojtpynvaJW2Vw9oKfMHMoaajkW7kCXUOzoPXQRP7w1O0oflPr
 WWNKaU1oIKqyT/10kNG43TF2cG93qM6fvt6UuqMgQjERVdB43gQLY9th6wzKv7dRaC
 MImY8jGI84orLfWXNNLBcLnMpqxo602o4KiKnxLdDVPszTV8VHyfn///k3i2kZPa6x
 irAWLyYpE6MEjyYoGip9YQyLtl3pKpIMujUJ99DYeOmZu1x+q6puh7zJNUcIcPRkrS
 fw2gUYksOIJ37vVTYDzxf8XdY5ZeN1einUeytMNg5xpXzYl1SlTbOKYt6vOWn92h/h
 hoecf0S/63khg==
Message-ID: <4d7f250d-19c0-acd0-dde4-752f95c5fc2a@kernel.org>
Date: Fri, 7 Oct 2022 18:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Daeho Jeong <daeho43@gmail.com>
References: <20221004171351.3678194-1-daeho43@gmail.com>
 <b1ca9048-99c5-1ab4-fb77-5fe0bbc6d4de@kernel.org>
 <CACOAw_zXTHzc5mjPchGNXkgnswZLxLEBfRoEztB7VFdV-rtpwQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zXTHzc5mjPchGNXkgnswZLxLEBfRoEztB7VFdV-rtpwQ@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/6 0:06, Daeho Jeong wrote: > On Wed, Oct 5, 2022
 at 6:46 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2022/10/5 1:13, Daeho
 Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> >> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogkjx-00033m-CS
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: correct i_size change for
 atomic writes
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

On 2022/10/6 0:06, Daeho Jeong wrote:
> On Wed, Oct 5, 2022 at 6:46 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2022/10/5 1:13, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> We need to make sure i_size doesn't change until atomic write commit is
>>> successful and restore it when commit is failed.
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>> v4: move i_size update after clearing atomic file flag in
>>>       f2fs_abort_atomic_write()
>>> v3: make sure inode is clean while atomic writing
>>> ---
>>>    fs/f2fs/f2fs.h    |  1 +
>>>    fs/f2fs/file.c    | 18 +++++++++++-------
>>>    fs/f2fs/inode.c   |  3 +++
>>>    fs/f2fs/segment.c |  7 +++++--
>>>    4 files changed, 20 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index dee7b67a17a6..539da7f12cfc 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -821,6 +821,7 @@ struct f2fs_inode_info {
>>>        unsigned int i_cluster_size;            /* cluster size */
>>>
>>>        unsigned int atomic_write_cnt;
>>> +     loff_t original_i_size;         /* original i_size before atomic write */
>>>    };
>>>
>>>    static inline void get_extent_info(struct extent_info *ext,
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 5efe0e4a725a..ce2336d2f688 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1989,6 +1989,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>>        struct f2fs_inode_info *fi = F2FS_I(inode);
>>>        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>        struct inode *pinode;
>>> +     loff_t isize;
>>>        int ret;
>>>
>>>        if (!inode_owner_or_capable(mnt_userns, inode))
>>> @@ -2047,7 +2048,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>>                f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>>                goto out;
>>>        }
>>> -     f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
>>> +
>>> +     f2fs_write_inode(inode, NULL);
>>> +
>>> +     isize = i_size_read(inode);
>>> +     fi->original_i_size = isize;
>>> +     f2fs_i_size_write(fi->cow_inode, isize);
>>>
>>>        spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>>        sbi->atomic_files++;
>>> @@ -2087,16 +2093,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
>>>
>>>        if (f2fs_is_atomic_file(inode)) {
>>>                ret = f2fs_commit_atomic_write(inode);
>>> -             if (ret)
>>> -                     goto unlock_out;
>>> -
>>> -             ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
>>>                if (!ret)
>>> -                     f2fs_abort_atomic_write(inode, false);
>>> +                     ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
>>> +
>>> +             f2fs_abort_atomic_write(inode, ret);
>>>        } else {
>>>                ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
>>>        }
>>> -unlock_out:
>>> +
>>>        inode_unlock(inode);
>>>        mnt_drop_write_file(filp);
>>>        return ret;
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index cde0a3dc80c3..64d7772b4cd9 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -30,6 +30,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>>>        if (f2fs_inode_dirtied(inode, sync))
>>>                return;
>>>
>>> +     if (f2fs_is_atomic_file(inode))
>>> +             return;
>>
>> One question, after f2fs_inode_dirtied(), atomic_file is added to
>> inode_list[DIRTY_META], and it will be flushed by checkpoint()
>> triggered in between write() and atomic_commit ioctl, is it not
>> expected that inode w/ new i_size will be persisted?
> 
> Isn't it okay if we move f2fs_is_atomic_file() ahead of f2fs_inode_dirtied()?

Fine to me.

But another question is, now it allows GC to migrate blocks belong
to atomic files, so, during migration, it may update extent cache,
once largest extent was updated, it will mark inode dirty, but after
this patch, it may lose the extent change? thoughts?

> 
>>
>> Should write_end() skip updating atomic_file's i_size and let
>> atomic_commit() update it if there is no error?
> 
> In this case, the user can't see the changed i_size while writing an
> atomic file.

Oh, right, please ignore this comment...

Thanks,

> 
>>
>> Thanks,
>>
>>> +
>>>        mark_inode_dirty_sync(inode);
>>>    }
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 460048f3c850..abb55cd418c1 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -193,14 +193,17 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>>>        if (!f2fs_is_atomic_file(inode))
>>>                return;
>>>
>>> -     if (clean)
>>> -             truncate_inode_pages_final(inode->i_mapping);
>>>        clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>>>        iput(fi->cow_inode);
>>>        fi->cow_inode = NULL;
>>>        release_atomic_write_cnt(inode);
>>>        clear_inode_flag(inode, FI_ATOMIC_FILE);
>>>
>>> +     if (clean) {
>>> +             truncate_inode_pages_final(inode->i_mapping);
>>> +             f2fs_i_size_write(inode, fi->original_i_size);
>>> +     }
>>> +
>>>        spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>>        sbi->atomic_files--;
>>>        spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
