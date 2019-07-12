Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0D667F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 09:46:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlqGK-0000FI-8c; Fri, 12 Jul 2019 07:46:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hlqGI-0000F5-La
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 07:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HeyoSheTKWYB9ngADYvWuLkf9xzirh70Hof/la+Gzi0=; b=YvZBPYzmX1veRy/MSoJMihcxlv
 svttBJQMNwOGoia5GfrLh7FjiSqKFnoxXFqbqtkWHuZQn9oe0PnfwXDI6fqrqbl2I5Suq093P4u5n
 Ubvs+jgWBXA0J/0CjJ7vIe8Rvnyn0OYR7AckgAXukieYO14NzAcM0SPjOidgh5AyQTYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HeyoSheTKWYB9ngADYvWuLkf9xzirh70Hof/la+Gzi0=; b=BKJtZV3x2kmbLAytFMxNRCyeDf
 NpR8NEOkGsiCnOeiea/eS1fHHsy6PId17hf4OV+EvkTY3jKYE4B1ZPk2WsYFRX5f1plBkSCsGntfa
 E7MSFxO8PMZUQHWHX/2cpdU3s2sdNkKiGUIHUTKJM2BDxPCNMn4CvXxR6MkAI5WYcOp8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlqGG-00GmLu-2t
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 07:46:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8FDFB368A2D14B7429EF;
 Fri, 12 Jul 2019 15:46:23 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 12 Jul
 2019 15:46:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190711150617.124660-1-qkrwngud825@gmail.com>
 <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
 <20190711170647.GA65508@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fd831de9-620b-69d9-a44a-c789695238dd@huawei.com>
Date: Fri, 12 Jul 2019 15:46:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190711170647.GA65508@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hlqGG-00GmLu-2t
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr
 lookups
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/12 1:06, Jaegeuk Kim wrote:
> On 07/12, Ju Hyung Park wrote:
>> Hi everyone.
>>
>> This is a RFC patch.
>>
>> This patch introduces an even bigger problem, which is forcing all
>> xattr lookup memory allocations to be made in 4076B, when in reality,
>> 4076B allocations are only made during initial mounts and the rests
>> are made in 204B, unnecessarily wasting memory.
>>
>> In my testing, 4076B allocations are only done 4 times during mount
>> and the rests(millions) are in 204B.
>>
>> I'd like to ask the maintainers to suggest some bright ideas on how to
>> tackle this correctly.
>> (e.g. Use kmem pool only for 204B allocations and fallback to regular
>> kzalloc() if (*base_size != 204)?)
> 
> How about adding two paths? One is kzalloc() for normal case, and the other
> is slab alloc for inline_xattr case?

Agreed,

Something like this:

if (!xnid)
	addr = f2fs_kmem_cache_alloc();
else
	addr = f2fs_kzalloc();

....

if (!xnid)
	kmem_cache_free(, addr);
else
	kvfree(addr);

Thanks,

> 
>>
>> Thanks.
>>
>> On Fri, Jul 12, 2019 at 12:06 AM Park Ju Hyung <qkrwngud825@gmail.com> wrote:
>>>
>>> It's been observed that kzalloc() on lookup_all_xattrs() are called millions
>>> of times on Android, quickly becoming the top abuser of slub memory allocator.
>>>
>>> Use a dedicated kmem cache pool for xattr lookups to mitigate this.
>>>
>>> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
>>> ---
>>>  fs/f2fs/f2fs.h  |  6 ++++++
>>>  fs/f2fs/super.c |  8 +++++++-
>>>  fs/f2fs/xattr.c | 33 ++++++++++++++++++++++++---------
>>>  3 files changed, 37 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 9c6388253c9d2..3046ca2ebd121 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -3510,6 +3510,12 @@ void f2fs_exit_sysfs(void);
>>>  int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
>>>  void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
>>>
>>> +/*
>>> + * xattr.c
>>> + */
>>> +int __init f2fs_init_xattr_caches(void);
>>> +void f2fs_destroy_xattr_caches(void);
>>> +
>>>  /*
>>>   * crypto support
>>>   */
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 6d262d13251cf..abb59d9e25848 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -3614,9 +3614,12 @@ static int __init init_f2fs_fs(void)
>>>         err = init_inodecache();
>>>         if (err)
>>>                 goto fail;
>>> -       err = f2fs_create_node_manager_caches();
>>> +       err = f2fs_init_xattr_caches();
>>>         if (err)
>>>                 goto free_inodecache;
>>> +       err = f2fs_create_node_manager_caches();
>>> +       if (err)
>>> +               goto fail_xattr_caches;
>>>         err = f2fs_create_segment_manager_caches();
>>>         if (err)
>>>                 goto free_node_manager_caches;
>>> @@ -3656,6 +3659,8 @@ static int __init init_f2fs_fs(void)
>>>         f2fs_destroy_segment_manager_caches();
>>>  free_node_manager_caches:
>>>         f2fs_destroy_node_manager_caches();
>>> +fail_xattr_caches:
>>> +       f2fs_destroy_xattr_caches();
>>>  free_inodecache:
>>>         destroy_inodecache();
>>>  fail:
>>> @@ -3673,6 +3678,7 @@ static void __exit exit_f2fs_fs(void)
>>>         f2fs_destroy_checkpoint_caches();
>>>         f2fs_destroy_segment_manager_caches();
>>>         f2fs_destroy_node_manager_caches();
>>> +       f2fs_destroy_xattr_caches();
>>>         destroy_inodecache();
>>>         f2fs_destroy_trace_ios();
>>>  }
>>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>>> index e791741d193b8..635b50ea3e5e8 100644
>>> --- a/fs/f2fs/xattr.c
>>> +++ b/fs/f2fs/xattr.c
>>> @@ -22,6 +22,23 @@
>>>  #include "f2fs.h"
>>>  #include "xattr.h"
>>>
>>> +static struct kmem_cache *f2fs_xattr_cachep;
>>> +
>>> +int __init f2fs_init_xattr_caches(void)
>>> +{
>>> +       f2fs_xattr_cachep = f2fs_kmem_cache_create("xattr_entry",
>>> +                       VALID_XATTR_BLOCK_SIZE + XATTR_PADDING_SIZE);
>>> +       if (!f2fs_xattr_cachep)
>>> +               return -ENOMEM;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +void f2fs_destroy_xattr_caches(void)
>>> +{
>>> +       kmem_cache_destroy(f2fs_xattr_cachep);
>>> +}
>>> +
>>>  static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
>>>                 struct dentry *unused, struct inode *inode,
>>>                 const char *name, void *buffer, size_t size)
>>> @@ -312,7 +329,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>>>                 return -ENODATA;
>>>
>>>         *base_size = XATTR_SIZE(xnid, inode) + XATTR_PADDING_SIZE;
>>> -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
>>> +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
>>>         if (!txattr_addr)
>>>                 return -ENOMEM;
>>>
>>> @@ -358,7 +375,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>>>         *base_addr = txattr_addr;
>>>         return 0;
>>>  out:
>>> -       kvfree(txattr_addr);
>>> +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
>>>         return err;
>>>  }
>>>
>>> @@ -367,13 +384,11 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
>>>  {
>>>         struct f2fs_xattr_header *header;
>>>         nid_t xnid = F2FS_I(inode)->i_xattr_nid;
>>> -       unsigned int size = VALID_XATTR_BLOCK_SIZE;
>>>         unsigned int inline_size = inline_xattr_size(inode);
>>>         void *txattr_addr;
>>>         int err;
>>>
>>> -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode),
>>> -                       inline_size + size + XATTR_PADDING_SIZE, GFP_NOFS);
>>> +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
>>>         if (!txattr_addr)
>>>                 return -ENOMEM;
>>>
>>> @@ -401,7 +416,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
>>>         *base_addr = txattr_addr;
>>>         return 0;
>>>  fail:
>>> -       kvfree(txattr_addr);
>>> +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
>>>         return err;
>>>  }
>>>
>>> @@ -528,7 +543,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>>>         }
>>>         error = size;
>>>  out:
>>> -       kvfree(base_addr);
>>> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>>>         return error;
>>>  }
>>>
>>> @@ -574,7 +589,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>>>         }
>>>         error = buffer_size - rest;
>>>  cleanup:
>>> -       kvfree(base_addr);
>>> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>>>         return error;
>>>  }
>>>
>>> @@ -712,7 +727,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>>         if (!error && S_ISDIR(inode->i_mode))
>>>                 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>>>  exit:
>>> -       kvfree(base_addr);
>>> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>>>         return error;
>>>  }
>>>
>>> --
>>> 2.21.0
>>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
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
