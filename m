Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3415E5A57
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Sep 2022 06:55:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obEEl-00078i-BU;
	Thu, 22 Sep 2022 04:54:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1obEEi-00078b-Mw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 04:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUmv+gXhS7LUeqSG8xWG8dhI0XMEt6yZhnepDbN4UBk=; b=Oj6q7NaXv9Jac5FObYnf34dpS/
 k5cVBwQqdnnP+dNdSGs4L2PKFWlxk6HNCpexivzZos7c9AshPJkMrajbXAkfMOMTfv2NbxmCYm05V
 OBUtGqqBG+jFjU8tDiqrR+XGUcGeYya3XMk5L1uwtU/x5ksKzMvdhXq5kgGA63/Wo1O4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZUmv+gXhS7LUeqSG8xWG8dhI0XMEt6yZhnepDbN4UBk=; b=W
 f3kpNik4RXOts+exhwMRot1+bc4u9crvkGM2TeB7TJ9EpyQa7SIgHyhjfd6soMuEWEbxjUyMrCE+9
 P9hkQV1FdexIBCCilJxVsriMepmYfBfRm0YJ1zJogcrLJC78oXXe1/D4FEPSRVF0ksf9yTr6FMdy9
 Ok+R6ILfvAKUsX7A=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obEEe-00GARR-Ac for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 04:54:56 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MY2sN2F2Kz14S1S;
 Thu, 22 Sep 2022 12:50:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 12:54:40 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 12:54:39 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Thu, 22 Sep 2022 12:54:39 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: Reply: Reply: Reply: [PATCH -next 2/4] f2fs: extent cache:
 support extent for no-compressed file
Thread-Index: AdjOPhJ8/MYWvZvfSZu1lGE93dvbhA==
Date: Thu, 22 Sep 2022 04:54:39 +0000
Message-ID: <da6ce7cd67a64ec5a0d20d7a668d1377@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 2022/9/22 10:07, zhangqilong wrote: > >> On 2022/9/22
 0:00, zhangqilong wrote: > >>>> On 2022/9/21 21:57, zhangqilong wrote: >
 >>>>>> On 2022/9/21 20:14, zhangqilong wrote: > >>>>>>>> On 2022/9/2 [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1obEEe-00GARR-Ac
Subject: Re: [f2fs-dev] Reply: Reply: Reply: [PATCH -next 2/4] f2fs: extent
 cache: support extent for no-compressed file
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
From: zhangqilong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangqilong <zhangqilong3@huawei.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 2022/9/22 10:07, zhangqilong wrote:
> >> On 2022/9/22 0:00, zhangqilong wrote:
> >>>> On 2022/9/21 21:57, zhangqilong wrote:
> >>>>>> On 2022/9/21 20:14, zhangqilong wrote:
> >>>>>>>> On 2022/9/21 15:57, Zhang Qilong wrote:
> >>>>>>>>> No-compressed file may suffer read performance issue due to
> it
> >>>>>>>>> can't use extent cache or the largest extent in inode can't
> >>>>>>>>> covered other parts of continuous blocks in readonly format
> >>>>>>>>> f2fs
> >>>> image.
> >>>>>>>>>
> >>>>>>>>> Now it won't build extent cacge tree for no-compressed file in
> >>>>>>>>> readonly format f2fs image.
> >>>>>>>>>
> >>>>>>>>> For readonly format f2fs image, maybe the no-compressed file
> >>>> don't
> >>>>>>>>> have the largest extent, or it have more than one part which
> >>>>>>>>> have
> >>>>>>>>
> >>>>>>>> Why it can not have largest extent in f2fs_inode?
> >>>>>>>
> >>>>>>> The following several situations may occur:
> >>>>>>> 	1) Wrote w/o the extent when the filesystem is read-write
> fs.
> >>>>>>>
> >>>>>>>         2) Largest extent have been drop after being re-wrote,
> >>>>>>> or it have
> >>>>>> been split to smaller parts.
> >>>>>>>
> >>>>>>>         3) The largest extent only covered one part of
> >>>>>>> continuous blocks,
> >>>>>> like:
> >>>>>>>           |------parts 1(continuous blocks)-----|----not
> >>>>>> continuous---|---------------------parts 2 (continuous
> >>>>>> continuous---|blocks)-----------|---------|
> >>>>>>>           The largest extent is part 2, but other parts (like
> >>>>>>> part1, ) can't be
> >>>>>> mapped in readonly format f2fs image which should have been
> >>>> mapped.
> >>>>>>
> >>>>>> largest extent of non-compressed file should be updated during
> >>>>>> sload in a ro f2fs image?
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> I am sorry, I don't fully understand what you mean. I want to show
> >>>>> that the extent of file in readonly format f2fs image could not
> >>>>> existed or
> >>>> can't covered other parts that contain continuous blocks.
> >>>>
> >>>> Well, I mean the extent should be updated due to below flow?
> during
> >>>> the file was loaded into a formated f2fs image w/ ro feature.
> >>>>
> >>>> - f2fs_sload
> >>>>     - build_directory
> >>>>      - f2fs_build_file
> >>>>
> >>>> 	if (!c.compress.enabled || (c.feature &
> >>>> cpu_to_le32(F2FS_FEATURE_RO)))
> >>>> 		update_largest_extent(sbi, de->ino);
> >>>>
> >>>
> >>> Hi,
> >>>
> >>> I get it. I think we could consider this flow.
> >>> But it will change the metadata of the file, is it was a little
> inappropriate?
> >>> Maybe users does not want to do that during being loaded and will
> >> refuse this change.
> >>
> >> I don't get it.
> >>
> >> IIUC, we can only load files into ro f2fs image w/ sload, and sload
> >> has updated largest extent for file, or am I missing something?
> >
> > Ah, maybe I misunderstood your idea just now. We could updated
> largest
> > extent for file when loading into ro f2fs image w/ sload, but it will
> > not solve situations 3) issue for the no-compressed file that be
> mentioned previously.
> 
> Why case 3) can happen? The data blocks should be allocated
> contiguously while sload loads file into image?

That's what I thought before, it should allocated contiguously while
sload loads file into image. But I found that it may not be completely
continuous for the big file recently. It may contain several discontinuous
parts.

Thanks,

> 
> Thanks,
> 
> >
> > Thanks,
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>> Thanks,
> >>>>
> >>>>> Whether it exists or not, we will not change or update largest
> >>>>> extent
> >>>> during sload in a ro f2fs image.
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>>
> >>>>>>>>> internally continuous blocks. So we add extent cache tree for
> >>>>>>>>> the no-compressed file in readonly format f2fs image.
> >>>>>>>>>
> >>>>>>>>> The cache policy is almost same with compressed file. The
> >>>>>>>>> difference is that, the no-compressed file part will set
> >>>>>>>>> min-number of continuous blocks F2FS_MIN_EXTENT_LEN in
> >> order
> >>>> to
> >>>>>>>>> reduce cache
> >>>>>> fragmentation.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> >>>>>>>>> ---
> >>>>>>>>>       fs/f2fs/extent_cache.c | 52
> >>>>>>>> ++++++++++++++++++++++++++++++++++--------
> >>>>>>>>>       1 file changed, 42 insertions(+), 10 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> >>>>>>>>> index
> >>>>>>>>> 387d53a61270..7e39381edca0 100644
> >>>>>>>>> --- a/fs/f2fs/extent_cache.c
> >>>>>>>>> +++ b/fs/f2fs/extent_cache.c
> >>>>>>>>> @@ -695,9 +695,12 @@ static void
> >>>>>>>> f2fs_update_extent_tree_range_compressed(struct inode
> >> *inode,
> >>>>>>>>>       	set_extent_info(&ei, fofs, blkaddr, llen);
> >>>>>>>>>       	ei.c_len = c_len;
> >>>>>>>>>
> >>>>>>>>> -	if (!__try_merge_extent_node(sbi, et, &ei, prev_en,
> >> next_en))
> >>>>>>>>> +	if (!__try_merge_extent_node(sbi, et, &ei, prev_en,
> >> next_en)) {
> >>>>>>>>> +		if (!c_len && llen < F2FS_MIN_EXTENT_LEN)
> >>>>>>>>> +			goto unlock_out;
> >>>>>>>>>       		__insert_extent_tree(sbi, et, &ei,
> >>>>>>>>>       				insert_p, insert_parent, leftmost);
> >>>>>>>>> +	}
> >>>>>>>>>       unlock_out:
> >>>>>>>>>       	write_unlock(&et->lock);
> >>>>>>>>>       }
> >>>>>>>>> @@ -726,24 +729,53 @@ static unsigned int
> >>>>>>>> f2fs_cluster_blocks_are_contiguous(struct dnode_of_data
> *dn)
> >>>>>>>>>       	return compressed ? i - 1 : i;
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>> +/*
> >>>>>>>>> + * check whether normal file blocks are contiguous, and add
> >>>>>>>>> +extent cache
> >>>>>>>>> + * entry only if remained blocks are logically and physically
> >>>>>> contiguous.
> >>>>>>>>> + */
> >>>>>>>>> +static unsigned int
> f2fs_normal_blocks_are_contiguous(struct
> >>>>>>>>> +dnode_of_data *dn) {
> >>>>>>>>> +	int i = 0;
> >>>>>>>>> +	struct inode *inode = dn->inode;
> >>>>>>>>> +	block_t first_blkaddr = data_blkaddr(inode, dn->node_page,
> >>>>>>>>> +						dn->ofs_in_node);
> >>>>>>>>> +	unsigned int max_blocks =
> >> ADDRS_PER_PAGE(dn->node_page,
> >>>>>> inode)
> >>>>>>>>> +					- dn->ofs_in_node;
> >>>>>>>>> +
> >>>>>>>>> +	for (i = 1; i < max_blocks; i++) {
> >>>>>>>>> +		block_t blkaddr = data_blkaddr(inode, dn->node_page,
> >>>>>>>>> +				dn->ofs_in_node + i);
> >>>>>>>>> +
> >>>>>>>>> +		if (!__is_valid_data_blkaddr(blkaddr) ||
> >>>>>>>>> +				first_blkaddr + i != blkaddr)
> >>>>>>>>> +			return i;
> >>>>>>>>> +	}
> >>>>>>>>> +
> >>>>>>>>> +	return i;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>       void f2fs_readonly_update_extent_cache(struct
> >>>> dnode_of_data
> >>>>>> *dn,
> >>>>>>>>>       					pgoff_t index)
> >>>>>>>>>       {
> >>>>>>>>> -	unsigned int c_len =
> >> f2fs_cluster_blocks_are_contiguous(dn);
> >>>>>>>>> +	unsigned int c_len = 0;
> >>>>>>>>> +	unsigned int llen = 0;
> >>>>>>>>>       	block_t blkaddr;
> >>>>>>>>>
> >>>>>>>>> -	if (!c_len)
> >>>>>>>>> -		return;
> >>>>>>>>> -
> >>>>>>>>>       	blkaddr = f2fs_data_blkaddr(dn);
> >>>>>>>>> -	if (blkaddr == COMPRESS_ADDR)
> >>>>>>>>> -		blkaddr = data_blkaddr(dn->inode, dn->node_page,
> >>>>>>>>> +	if (f2fs_compressed_file(dn->inode)) {
> >>>>>>>>> +		c_len = f2fs_cluster_blocks_are_contiguous(dn);
> >>>>>>>>> +		if (!c_len)
> >>>>>>>>> +			return;
> >>>>>>>>> +		llen = F2FS_I(dn->inode)->i_cluster_size;
> >>>>>>>>> +		if (blkaddr == COMPRESS_ADDR)
> >>>>>>>>> +			blkaddr = data_blkaddr(dn->inode,
> >> dn->node_page,
> >>>>>>>>>       					dn->ofs_in_node + 1);
> >>>>>>>>> +	} else {
> >>>>>>>>> +		llen = f2fs_normal_blocks_are_contiguous(dn);
> >>>>>>>>> +	}
> >>>>>>>>>
> >>>>>>>>>
> >> 	f2fs_update_extent_tree_range_compressed(dn->inode,
> >>>>>>>>> -				index, blkaddr,
> >>>>>>>>> -				F2FS_I(dn->inode)->i_cluster_size,
> >>>>>>>>> -				c_len);
> >>>>>>>>> +				index, blkaddr, llen, c_len);
> >>>>>>>>>       }
> >>>>>>>>>       #endif
> >>>>>>>>>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
