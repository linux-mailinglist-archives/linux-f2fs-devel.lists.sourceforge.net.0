Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C345F01E5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Sep 2022 02:49:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oe4Dj-0001LF-SI;
	Fri, 30 Sep 2022 00:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oe4Dg-0001L8-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 00:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eFrRBBI0+Nda/q9tBv2TDwZJhS0/jc22TLtNzinxcpY=; b=U8/awMpWhtOZrTE+Mxycr5gu/d
 7KuwUuqsdGzH6P/ir2YhOUArU2M7IXFf4oFBGWCSlbPMB03jYRfWKWNWkTgLeAstbg/9sn5NM5fD6
 leQLLxRXlsOInaqEPu076rxp6QsWzplxCbo6NnPlIbbJGmsKWEMH+MTAn7Ye1Ye20UxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eFrRBBI0+Nda/q9tBv2TDwZJhS0/jc22TLtNzinxcpY=; b=Hkcg+ZOPWIiju2DZrranq7xC7Q
 AytBbveFEbnHvdsFQOSNpqlxx/PvXdhQr/JBLdVKiZ5CrXPgOgpGjL2sB30XCOjVhUxfSAQ7a9H+H
 3OzWVPWOJcXO0Z4fn4pK4AMZpSD7xI+Oc0FSkmE2jle6cwQiwD/gZZ712T9cCStoy+ow=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oe4Db-0004je-WB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 00:49:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D462CCE23EA;
 Fri, 30 Sep 2022 00:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCADC433C1;
 Fri, 30 Sep 2022 00:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664498951;
 bh=1+W2WxpzANUyIheG6zG2w3RpOWXV+2SlTaZpOGBZSxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cl+dIpoK1vRMURe0Dhp7j/JVWsrLurLBkx47cs9jvl+Ae3EDvM1r9ebjklizwWEq7
 +6KXxWH+fvy7QV9+zR+sT3eS307FFBh36g4btauxGos3aIVceNFZoLuD+5bSBQiw36
 BAIKpsn485VTxRss0HzXJGfWTGfsPVxrecWMLC5QbuiIgZhlX2kd58cHYv4VVeQhk2
 UqOS3q1InweG3mO5vo0mLVqAYhdNpepAiaUTaBgEFMadl6Dm/umqmhgPouYMjkRrNd
 Rcs6LSh8uY634rW2ng57hcuY1nvd64MJfHlceA1zOTbMDqPQVN0ryEDI0sd5PcDBWA
 NODwXyEb25/FA==
Message-ID: <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
Date: Fri, 30 Sep 2022 08:49:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20220920014036.2295853-1-daeho43@gmail.com>
 <f4ce9486-f104-b0e2-25ed-f6de96316b76@kernel.org>
 <CACOAw_z=9H6jEQNd8C99c6xO55PJXWJOW7Q=78qtppgysebN2A@mail.gmail.com>
 <4aca0d00-d3b7-975f-6b72-ccd6f07d22e5@kernel.org>
 <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
X-Spam-Score: -9.4 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/30 7:33, Daeho Jeong wrote: > On Thu, Sep 29, 2022
 at 3:54 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2022/9/30 0:13, Daeho
 Jeong wrote: >>> On Thu, Sep 29, 2022 at 12:36 AM Chao Yu <chao@ [...] 
 Content analysis details:   (-9.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oe4Db-0004je-WB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce
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

On 2022/9/30 7:33, Daeho Jeong wrote:
> On Thu, Sep 29, 2022 at 3:54 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2022/9/30 0:13, Daeho Jeong wrote:
>>> On Thu, Sep 29, 2022 at 12:36 AM Chao Yu <chao@kernel.org> wrote:
>>>>
>>>> On 2022/9/20 9:40, Daeho Jeong wrote:
>>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>>
>>>>> introduce a new ioctl to replace the whole content of a file atomically,
>>>>> which means it induces truncate and content update at the same time.
>>>>> We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
>>>>> F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
>>>>> F2FS_IOC_ABORT_ATOMIC_WRITE.
>>>>>
>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>>> ---
>>>>> v2: add undefined ioctl number reported by <lkp@intel.com>
>>>>> ---
>>>>>     fs/f2fs/data.c            |  3 +++
>>>>>     fs/f2fs/f2fs.h            |  1 +
>>>>>     fs/f2fs/file.c            | 12 ++++++++++--
>>>>>     fs/f2fs/segment.c         | 14 +++++++++++++-
>>>>>     include/uapi/linux/f2fs.h |  1 +
>>>>>     5 files changed, 28 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>> index 6cd29a575105..d3d32db3a25d 100644
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -3438,6 +3438,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>>>>>         else if (*blk_addr != NULL_ADDR)
>>>>>                 return 0;
>>>>>
>>>>> +     if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
>>>>> +             goto reserve_block;
>>>>> +
>>>>>         /* Look for the block in the original inode */
>>>>>         err = __find_data_block(inode, index, &ori_blk_addr);
>>>>>         if (err)
>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>> index 539da7f12cfc..2c49da12d6d8 100644
>>>>> --- a/fs/f2fs/f2fs.h
>>>>> +++ b/fs/f2fs/f2fs.h
>>>>> @@ -764,6 +764,7 @@ enum {
>>>>>         FI_COMPRESS_RELEASED,   /* compressed blocks were released */
>>>>>         FI_ALIGNED_WRITE,       /* enable aligned write */
>>>>>         FI_COW_FILE,            /* indicate COW file */
>>>>> +     FI_ATOMIC_REPLACE,      /* indicate atomic replace */
>>>>>         FI_MAX,                 /* max flag, never be used */
>>>>>     };
>>>>>
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>> index 4f9b80c41b1e..4abd9d2a55b3 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -1982,7 +1982,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
>>>>>         return put_user(inode->i_generation, (int __user *)arg);
>>>>>     }
>>>>>
>>>>> -static int f2fs_ioc_start_atomic_write(struct file *filp)
>>>>> +static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>>>>     {
>>>>>         struct inode *inode = file_inode(filp);
>>>>>         struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
>>>>> @@ -2051,6 +2051,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>>>>
>>>>>         isize = i_size_read(inode);
>>>>>         fi->original_i_size = isize;
>>>>> +     if (truncate) {
>>>>> +             set_inode_flag(inode, FI_ATOMIC_REPLACE);
>>>>> +             truncate_inode_pages_final(inode->i_mapping);
>>>>> +             f2fs_i_size_write(inode, 0);
>>>>> +             isize = 0;
>>>>> +     }
>>>>
>>>> Hi Daeho,
>>>>
>>>> isize should be updated after tagging inode as atomic_write one?
>>>> otherwise f2fs_mark_inode_dirty_sync() may update isize to inode page,
>>>> latter checkpoint may persist that change? IIUC...
>>>>
>>>> Thanks,
>>>
>>> Hi Chao,
>>>
>>> The first patch of this patchset prevents the inode page from being
>>> updated as dirty for atomic file cases.
>>> Is there any other chances for the inode page to be marked as dirty?
>>
>> I mean:
>>
>> Thread A                                Thread B
>> - f2fs_ioc_start_atomic_write
>>    - f2fs_i_size_write(inode, 0)
>>     - f2fs_mark_inode_dirty_sync
>>                                          - checkpoint
>>                                           - persist inode with incorrect zero isize
>>
>>    - set_inode_flag(inode, FI_ATOMIC_FILE)
>>
>> Am I missing something?
>>
> 
> So, f2fs_mark_inode_dirty_sync() will not work for atomic files
> anymore, which means it doesn't make the inode dirty.
> Plz, refer to the first patch of this patchset. Or I might be confused
> with something. :(

I mean FI_ATOMIC_FILE was set after f2fs_i_size_write(), so inode will be set
as dirty.

Thanks,

> 
> @@ -30,6 +30,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode,
> bool sync)
>          if (f2fs_inode_dirtied(inode, sync))
>                  return;
> 
> +       if (f2fs_is_atomic_file(inode))
> +               return;
> +
>          mark_inode_dirty_sync(inode);
>   }
> 
> 
> 
> 
> 
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>>>         f2fs_i_size_write(fi->cow_inode, isize);
>>>>>
>>>>>         spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>>>> @@ -4080,7 +4086,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>>>         case FS_IOC_GETVERSION:
>>>>>                 return f2fs_ioc_getversion(filp, arg);
>>>>>         case F2FS_IOC_START_ATOMIC_WRITE:
>>>>> -             return f2fs_ioc_start_atomic_write(filp);
>>>>> +             return f2fs_ioc_start_atomic_write(filp, false);
>>>>> +     case F2FS_IOC_START_ATOMIC_REPLACE:
>>>>> +             return f2fs_ioc_start_atomic_write(filp, true);
>>>>>         case F2FS_IOC_COMMIT_ATOMIC_WRITE:
>>>>>                 return f2fs_ioc_commit_atomic_write(filp);
>>>>>         case F2FS_IOC_ABORT_ATOMIC_WRITE:
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index 143b7ea0fb8e..c524538a9013 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -263,14 +263,26 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
>>>>>                                         bool revoke)
>>>>>     {
>>>>>         struct revoke_entry *cur, *tmp;
>>>>> +     pgoff_t start_index = 0;
>>>>> +     bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
>>>>>
>>>>>         list_for_each_entry_safe(cur, tmp, head, list) {
>>>>> -             if (revoke)
>>>>> +             if (revoke) {
>>>>>                         __replace_atomic_write_block(inode, cur->index,
>>>>>                                                 cur->old_addr, NULL, true);
>>>>> +             } else if (truncate) {
>>>>> +                     f2fs_truncate_hole(inode, start_index, cur->index);
>>>>> +                     start_index = cur->index + 1;
>>>>> +             }
>>>>> +
>>>>>                 list_del(&cur->list);
>>>>>                 kmem_cache_free(revoke_entry_slab, cur);
>>>>>         }
>>>>> +
>>>>> +     if (!revoke && truncate) {
>>>>> +             f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
>>>>> +             clear_inode_flag(inode, FI_ATOMIC_REPLACE);
>>>>> +     }
>>>>>     }
>>>>>
>>>>>     static int __f2fs_commit_atomic_write(struct inode *inode)
>>>>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>>>>> index 3121d127d5aa..955d440be104 100644
>>>>> --- a/include/uapi/linux/f2fs.h
>>>>> +++ b/include/uapi/linux/f2fs.h
>>>>> @@ -42,6 +42,7 @@
>>>>>                                                 struct f2fs_comp_option)
>>>>>     #define F2FS_IOC_DECOMPRESS_FILE    _IO(F2FS_IOCTL_MAGIC, 23)
>>>>>     #define F2FS_IOC_COMPRESS_FILE              _IO(F2FS_IOCTL_MAGIC, 24)
>>>>> +#define F2FS_IOC_START_ATOMIC_REPLACE        _IO(F2FS_IOCTL_MAGIC, 25)
>>>>>
>>>>>     /*
>>>>>      * should be same as XFS_IOC_GOINGDOWN.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
