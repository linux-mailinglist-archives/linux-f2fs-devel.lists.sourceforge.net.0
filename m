Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B1D59F181
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 04:48:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQgRa-0001hH-GL;
	Wed, 24 Aug 2022 02:48:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangshuqi3@huawei.com>) id 1oQgRY-0001hA-GV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 02:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8D83LS5yDXUJ+X+0M8u3GYPJIS+1S82cw7Oi63V1YI=; b=bXtCfV9P+qFDWVjoMpV6IUSlAH
 1cXbA+0AELrIm40wVH7G9neyHH7CLeNy19SkIOCtzEQ2FdBxLRJ/eNSIT5+A5jj8lJB40V4bjF9ID
 bsN1mlc2KU6Uyimt9G/fh9R17artgSnsfRXM8Z/gQna/q1AyVIgKfBLtOpbtDJDiNNSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E8D83LS5yDXUJ+X+0M8u3GYPJIS+1S82cw7Oi63V1YI=; b=APm5SZbi5XuVCRcbuAwRUvLSwA
 Y/QhElYme/s/tkHYRZnBS057EB+E9R/D7v8szRDkOgg5zDdR5Ra+b9YiEJQUrFNGVwSyNn7qHjBf+
 PXT76F2OcNGRMD22fRKd6jF3IKIGw2+UFgk7lhcgxXIjkm9Sf+Qat1K35pAcCffzxT/0=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQgRW-00F6UA-QM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 02:48:36 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MC9Qv6qnczXdsj;
 Wed, 24 Aug 2022 10:44:07 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 10:48:25 +0800
Received: from [10.174.177.86] (10.174.177.86) by
 kwepemm600016.china.huawei.com (7.193.23.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 10:48:24 +0800
Message-ID: <93f9d06b-c557-b489-d5d4-0433419c73a1@huawei.com>
Date: Wed, 24 Aug 2022 10:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20220815081555.2961943-1-zhangshuqi3@huawei.com>
 <a364da58-f476-69fd-3f90-448f35c8e151@kernel.org>
 <YwFaTprvOf8ckGsP@google.com> <YwFd/+YPfPz60uWg@google.com>
In-Reply-To: <YwFd/+YPfPz60uWg@google.com>
X-Originating-IP: [10.174.177.86]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600016.china.huawei.com (7.193.23.20)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/21, Jaegeuk Kim wrote: > On 08/20, Jaegeuk Kim wrote:
 >> On 08/20, Chao Yu wrote: >>> On 2022/8/15 16:15, Shuqi Zhang wrote: >>>>
 This is a BUG_ON issue as follows when running xfstest-generic-5 [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oQgRW-00F6UA-QM
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix wrong dirty page count when
 race between mmap and fallocate.
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
From: Shuqi Zhang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shuqi Zhang <zhangshuqi3@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 08/21, Jaegeuk Kim wrote:
> On 08/20, Jaegeuk Kim wrote:
>> On 08/20, Chao Yu wrote:
>>> On 2022/8/15 16:15, Shuqi Zhang wrote:
>>>> This is a BUG_ON issue as follows when running xfstest-generic-503:
>>>> WARNING: CPU: 21 PID: 1385 at fs/f2fs/inode.c:762 f2fs_evict_inode+0x847/0xaa0
>>>> Modules linked in:
>>>> CPU: 21 PID: 1385 Comm: umount Not tainted 5.19.0-rc5+ #73
>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-4.fc34 04/01/2014
>>>>
>>>> Call Trace:
>>>> evict+0x129/0x2d0
>>>> dispose_list+0x4f/0xb0
>>>> evict_inodes+0x204/0x230
>>>> generic_shutdown_super+0x5b/0x1e0
>>>> kill_block_super+0x29/0x80
>>>> kill_f2fs_super+0xe6/0x140
>>>> deactivate_locked_super+0x44/0xc0
>>>> deactivate_super+0x79/0x90
>>>> cleanup_mnt+0x114/0x1a0
>>>> __cleanup_mnt+0x16/0x20
>>>> task_work_run+0x98/0x100
>>>> exit_to_user_mode_prepare+0x3d0/0x3e0
>>>> syscall_exit_to_user_mode+0x12/0x30
>>>> do_syscall_64+0x42/0x80
>>>> entry_SYSCALL_64_after_hwframe+0x46/0xb0
>>>>
>>>> Function flow analysis when BUG occurs:
>>>> f2fs_fallocate                    mmap
>>>>                                     do_page_fault
>>>>                                       pte_spinlock  // ---lock_pte
>>>>                                       do_wp_page
>>>>                                         wp_page_shared
>>>>                                           pte_unmap_unlock   // unlock_pte
>>>>                                             do_page_mkwrite
>>>>                                             f2fs_vm_page_mkwrite
>>>>                                               down_read(i_mmap_sem)
>>>>                                               lock_page
>>>>                                               if (PageMappedToDisk(page))
>>>>                                                 goto out;
>>>>                                               // set_page_dirty  --NOT RUN
>>>>                                               out: up_read(i_mmap_sem)
>>>>                                             lock_page
>>>>                                           finish_mkwrite_fault // unlock_pte
>>>> f2fs_collapse_range
>>>>     down_write(i_mmap_sem)
>>>>     truncate_pagecache
>>>>       unmap_mapping_pages
>>>>         i_mmap_lock_write // down_write(i_mmap_rwsem)
>>>>           ......
>>>>           zap_pte_range
>>>>             pte_offset_map_lock // ---lock_pte
>>>>             f2fs_set_data_page_dirty
>>> I didn't get it, why zap_pte_range() can set page dirty w/o lock_page?
>>>
>>> I found it's very easy to reproduce this bug, but previously I never saw this...
>>> is there any code udpate around truncate_pagecache()?
>> Found this.
>>
>> 2637  * The caller must ensure this doesn't race with truncation.  Most will
>> 2638  * simply hold the folio lock, but e.g. zap_pte_range() calls with the
>> 2639  * folio mapped and the pte lock held, which also locks out truncation.
>> 2640  */
>> 2641 bool filemap_dirty_folio(struct address_space *mapping, struct folio *folio)
>> 2642 {
>>
>>> Thanks,
>>>
>>>>               if (!PageDirty(page)) {
>>>>                                           fault_dirty_shared_page
>>>>                                             f2fs_set_data_page_dirty
>>>>                                               if (!PageDirty(page)) {
>>>>                                                 __set_page_dirty_nobuffer
>>>>                                                 f2fs_update_dirty_page // ++
>>>>                                               }
>>>>                                             unlock_page
>>>>                 __set_page_dirty_nobuffers
>>>>                 f2fs_update_dirty_page // page count++
>>>>               }
>>>>             pte_unmap_unlock  // --unlock_pte
>>>>         i_mmap_unlock_write  // up_write(i_mmap_rwsem)
>>>>     truncate_inode_pages
>>>>     up_write(i_mmap_sem)
>>>>
>>>> When race happens between mmap-do_page_fault-wp_page_shared and
>>>> fallocate-truncate_pagecache-zap_pte_range, the zap_pte_range calls
>>>> function set_page_dirty without page lock. Besides, though
>>>> truncate_pagecache has immap and pte lock, wp_page_shared calls
>>>> fault_dirty_shared_page without any. In this case, two threads race
>>>> in f2fs_set_data_page_dirty function. Page is set to dirty only ONCE,
>>>> but the count is added TWICE by calling f2fs_update_dirty_page.
>>>> Thus the count of dirty page cannot accord with the real dirty pages.
>>>>
>>>> Following is the solution to in case of race happens without any lock.
>>>> If making sure f2fs_vm_page_mkwrite calls set_page_dirty within immap
>>>> lock area, page will already be dirtied when running into
>>>> fault_dirty_shared_page-f2fs_set_data_page_dirty.
>>>> The count of dirty page will not be increased wrong times.
>>>>
>>>> Signed-off-by: Shuqi Zhang <zhangshuqi3@huawei.com>
>>>> ---
>>>>    fs/f2fs/file.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index ce4905a073b3..d837359a9c00 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -140,7 +140,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>>>    	 * check to see if the page is mapped already (no holes)
>>>>    	 */
>>>>    	if (PageMappedToDisk(page))
>>>> -		goto out_sem;
>>>> +		goto set_dirty;
>>>>    	/* page is wholly or partially inside EOF */
>>>>    	if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
>>>> @@ -150,14 +150,15 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>>>    		offset = i_size_read(inode) & ~PAGE_MASK;
>>>>    		zero_user_segment(page, offset, PAGE_SIZE);
>>>>    	}
>>>> -	set_page_dirty(page);
>>>> -	if (!PageUptodate(page))
>>>> -		SetPageUptodate(page);
>>>>    	f2fs_update_iostat(sbi, APP_MAPPED_IO, F2FS_BLKSIZE);
>>>> -	f2fs_update_time(sbi, REQ_TIME);
>>>> +set_dirty:
>>>>    	trace_f2fs_vm_page_mkwrite(page, DATA);
>>>> +	set_page_dirty(page);
>>>> +	if (!PageUptodate(page))
>>>> +		SetPageUptodate(page);
> Actually we don't need to call SetPageUptodate() since set_page_dirty() should
> do? And, it seems the call stack is out-dated as well.
>
> By the way, do we just need to get the right count by this?
>
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3697,8 +3697,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
>                  folio_mark_uptodate(folio);
>          BUG_ON(folio_test_swapcache(folio));
>
> -       if (!folio_test_dirty(folio)) {
> -               filemap_dirty_folio(mapping, folio);
> +       if (filemap_dirty_folio(mapping, folio)) {
>                  f2fs_update_dirty_folio(inode, folio);
>                  return true;
>          }

Yes, this patch seems a better one. I will send a PATCH-v2 about it.


Thanks,

>>>> +	f2fs_update_time(sbi, REQ_TIME);
>>>>    out_sem:
>>>>    	filemap_invalidate_unlock_shared(inode->i_mapping);
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
