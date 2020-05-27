Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF721E4FB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2020 22:56:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je361-0007Kx-Nb; Wed, 27 May 2020 20:56:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1je360-0007Kq-IB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 20:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLtNKVYez5fnnXavEPGk7NyBsy74JNzcmgap6K3pExg=; b=Chpf3lIg98uHq9RdhYeXN2iTgl
 Q5Rl35jWSKBDAghqGmOKJ21Xx4N5V154JqQlG3j8taatYaU1SHRs2alThjDSLPcpPRteO9WUVo+iD
 Ei2wISbLQj7fn9gCuL8N5ySMUFrxNmaJlbUIZ2Ikwn+TuU4RiUOBRLL9ZYdbjCFW9tpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLtNKVYez5fnnXavEPGk7NyBsy74JNzcmgap6K3pExg=; b=gEwp4bTTlrlDXQrtf17bVGvfSo
 FhbFMZs/OMCABW+8W6yCCJ4f8OkYdnO/j8rUUKT4nN//smZeB0pQUE7zRErDkowShz6ZkwAB3/aW4
 uaYiNyxIOxbtEzzEIKZt9knN5T+BxuNkzoIHdLRr6PLNd5kJBgJEy7KD+HvN32uPGfj4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1je35y-009oHp-9Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 20:56:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB7EA2088E;
 Wed, 27 May 2020 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590612964;
 bh=CZnp1dPscHvgEsASP4rO6RwpRosxd5cli/BtqtDHsvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7dJMVmocSOm/m0XBFdUcedmtZdF03oRbNVu4aLVC37xHlvKTqCnNB0YS6INeGVwr
 febkhyUGGwleQp5IIoEpKmcd7LHkdMLMyY7yNwrODe1+2GZRirg4lK7M6+77+sZadx
 sGYaa13HokZGZGXzo59VeQdJcQ0Rf79KqRtu0OTM=
Date: Wed, 27 May 2020 13:56:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200527205603.GB206249@google.com>
References: <20200522144752.216197-1-jaegeuk@kernel.org>
 <20200522233243.GA94020@google.com>
 <20200525035655.GA135148@google.com>
 <565af47c-8364-d910-8d1c-93645c12e660@huawei.com>
 <20200525150608.GA55033@google.com>
 <92afae8b-2dd3-171a-562c-404a67f9aab2@huawei.com>
 <a44f9c2e-3859-6c5d-6f06-7c4c6b4c01c5@huawei.com>
 <20200526015650.GA207949@google.com>
 <765a1ac5-a318-14d6-666f-eab46f892d01@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <765a1ac5-a318-14d6-666f-eab46f892d01@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1je35y-009oHp-9Y
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid inifinite loop to wait for
 flushing node pages at cp_error
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/27, Chao Yu wrote:
> On 2020/5/26 9:56, Jaegeuk Kim wrote:
> > On 05/26, Chao Yu wrote:
> >> On 2020/5/26 9:11, Chao Yu wrote:
> >>> On 2020/5/25 23:06, Jaegeuk Kim wrote:
> >>>> On 05/25, Chao Yu wrote:
> >>>>> On 2020/5/25 11:56, Jaegeuk Kim wrote:
> >>>>>> Shutdown test is somtimes hung, since it keeps trying to flush dirty node pages
> 
>     71.07%     0.01%  kworker/u256:1+  [kernel.kallsyms]  [k] wb_writeback
>             |
>              --71.06%--wb_writeback
>                        |
>                        |--68.96%--__writeback_inodes_wb
>                        |          |
>                        |           --68.95%--writeback_sb_inodes
>                        |                     |
>                        |                     |--65.08%--__writeback_single_inode
>                        |                     |          |
>                        |                     |           --64.35%--do_writepages
>                        |                     |                     |
>                        |                     |                     |--59.83%--f2fs_write_node_pages
>                        |                     |                     |          |
>                        |                     |                     |           --59.74%--f2fs_sync_node_pages
>                        |                     |                     |                     |
>                        |                     |                     |                     |--27.91%--pagevec_lookup_range_tag
>                        |                     |                     |                     |          |
>                        |                     |                     |                     |           --27.90%--find_get_pages_range_tag
> 
> Before umount, kworker will always hold one core, that looks not reasonable,
> to avoid that, could we just allow node write, since it's out-place-update,
> and cp is not allowed, we don't need to worry about its effect on data on
> previous checkpoint, and it can decrease memory footprint cost by node pages.

It can cause some roll-forward recovery?

> 
> Thanks,
> 
> >>>>>
> >>>>> IMO, for umount case, we should drop dirty reference and dirty pages on meta/data
> >>>>> pages like we change for node pages to avoid potential dead loop...
> >>>>
> >>>> I believe we're doing for them. :P
> >>>
> >>> Actually, I mean do we need to drop dirty meta/data pages explicitly as below:
> >>>
> >>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >>> index 3dc3ac6fe143..4c08fd0a680a 100644
> >>> --- a/fs/f2fs/checkpoint.c
> >>> +++ b/fs/f2fs/checkpoint.c
> >>> @@ -299,8 +299,15 @@ static int __f2fs_write_meta_page(struct page *page,
> >>>
> >>>  	trace_f2fs_writepage(page, META);
> >>>
> >>> -	if (unlikely(f2fs_cp_error(sbi)))
> >>> +	if (unlikely(f2fs_cp_error(sbi))) {
> >>> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> >>> +			ClearPageUptodate(page);
> >>> +			dec_page_count(sbi, F2FS_DIRTY_META);
> >>> +			unlock_page(page);
> >>> +			return 0;
> >>> +		}
> >>>  		goto redirty_out;
> >>> +	}
> >>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >>>  		goto redirty_out;
> >>>  	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
> >>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>> index 48a622b95b76..94b342802513 100644
> >>> --- a/fs/f2fs/data.c
> >>> +++ b/fs/f2fs/data.c
> >>> @@ -2682,6 +2682,12 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
> >>>
> >>>  	/* we should bypass data pages to proceed the kworkder jobs */
> >>>  	if (unlikely(f2fs_cp_error(sbi))) {
> >>> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> >>> +			ClearPageUptodate(page);
> >>> +			inode_dec_dirty_pages(inode);
> >>> +			unlock_page(page);
> >>> +			return 0;
> >>> +		}
> >>
> >> Oh, I notice previously, we will drop non-directory inode's dirty pages directly,
> >> however, during umount, we'd better drop directory inode's dirty pages as well, right?
> > 
> > Hmm, I remember I dropped them before. Need to double check.
> > 
> >>
> >>>  		mapping_set_error(page->mapping, -EIO);
> >>>  		/*
> >>>  		 * don't drop any dirty dentry pages for keeping lastest
> >>>
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>> in an inifinite loop. Let's drop dirty pages at umount in that case.
> >>>>>>
> >>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>>>>> ---
> >>>>>> v3:
> >>>>>>  - fix wrong unlock
> >>>>>>
> >>>>>> v2:
> >>>>>>  - fix typos
> >>>>>>
> >>>>>>  fs/f2fs/node.c | 9 ++++++++-
> >>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >>>>>> index e632de10aedab..e0bb0f7e0506e 100644
> >>>>>> --- a/fs/f2fs/node.c
> >>>>>> +++ b/fs/f2fs/node.c
> >>>>>> @@ -1520,8 +1520,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
> >>>>>>  
> >>>>>>  	trace_f2fs_writepage(page, NODE);
> >>>>>>  
> >>>>>> -	if (unlikely(f2fs_cp_error(sbi)))
> >>>>>> +	if (unlikely(f2fs_cp_error(sbi))) {
> >>>>>> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> >>>>>> +			ClearPageUptodate(page);
> >>>>>> +			dec_page_count(sbi, F2FS_DIRTY_NODES);
> >>>>>> +			unlock_page(page);
> >>>>>> +			return 0;
> >>>>>> +		}
> >>>>>>  		goto redirty_out;
> >>>>>> +	}
> >>>>>>  
> >>>>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >>>>>>  		goto redirty_out;
> >>>>>>
> >>>> .
> >>>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Linux-f2fs-devel mailing list
> >>> Linux-f2fs-devel@lists.sourceforge.net
> >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
