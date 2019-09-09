Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E8AD5CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 11:34:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7G3j-0004S0-TR; Mon, 09 Sep 2019 09:34:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i7G3i-0004Rt-B0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 09:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJMM8EuBBXKxM3EQJdYitULsRQzmrc0tnjrBtNsVipg=; b=RnilPnUFnZaBQGBuo7wJXe1s4t
 8l7Fp3gvp/jL6VhQYuJomllJqA0LTrDt/dXWQ0z1bdIRyo2DX79RzLxvbYsYjKXE/1W4ALo1B3sUd
 y7muITf2Z/18/laO5pJRnoEYWLm7H3zSNi5HKBF/SbjYlsSyROUm3Fw/HaA0dK81LHS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JJMM8EuBBXKxM3EQJdYitULsRQzmrc0tnjrBtNsVipg=; b=PbCJLUzHyndho+oZghoVVRmLWC
 qd51YEBo2Zmmkm5NYoVauqnvb92PUqJEE/ds706X00VBOGIh385BdX22ozTaRTk5l2YYid55Hjac0
 nMDE8/GABKO8N3Q22HQ0pmrwLLHvJYj/9hjawwfcKO4xMPK/OhJyK9qG7AcWefmiN2TU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7G3g-00Eubb-9N
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 09:34:06 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 036E02086D;
 Mon,  9 Sep 2019 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568021638;
 bh=yZJ3ka986SfLwgSg1wqiKBcarbCnbCLNWxBepkM70Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jRi1VKXVcj2HwNr6Z3ZnGZ7MHdDUjZLdCTeMaABs+qGLUkL5c5ui6XCXwQ0zirv3Y
 jfX/7rMpui2j8HFrzgPp5Fu4ov8ixqq1faYbTOep8M7jjCWuPU3QWuquzew0EYjIGM
 rCBxubdVTHt6WxfRDBl95MbCGW0x8tOvDar0aZhE=
Date: Mon, 9 Sep 2019 10:33:55 +0100
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190909093355.GA27742@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190906105426.109151-1-yuchao0@huawei.com>
 <20190906234808.GC71848@jaegeuk-macbookpro.roam.corp.google.com>
 <080e8dee-4726-8294-622a-cac26e781083@kernel.org>
 <20190909074425.GB21625@jaegeuk-macbookpro.roam.corp.google.com>
 <79228eaa-776f-da89-89f8-a9b5a90034b6@huawei.com>
 <873f4c07-5694-6554-5266-81812a6bd617@huawei.com>
 <20190909083725.GB25724@jaegeuk-macbookpro.roam.corp.google.com>
 <05393d3c-b78d-3bb3-ff26-64d2d3939618@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05393d3c-b78d-3bb3-ff26-64d2d3939618@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1i7G3g-00Eubb-9N
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 field of inode page in is_alive()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/09, Chao Yu wrote:
> On 2019/9/9 16:37, Jaegeuk Kim wrote:
> > On 09/09, Chao Yu wrote:
> >> On 2019/9/9 15:58, Chao Yu wrote:
> >>> On 2019/9/9 15:44, Jaegeuk Kim wrote:
> >>>> On 09/07, Chao Yu wrote:
> >>>>> On 2019-9-7 7:48, Jaegeuk Kim wrote:
> >>>>>> On 09/06, Chao Yu wrote:
> >>>>>>> If inode is newly created, inode page may not synchronize with inode cache,
> >>>>>>> so fields like .i_inline or .i_extra_isize could be wrong, in below call
> >>>>>>> path, we may access such wrong fields, result in failing to migrate valid
> >>>>>>> target block.
> >>>>>>
> >>>>>> If data is valid, how can we get new inode page?
> >>>>
> >>>> Let me rephrase the question. If inode is newly created, is this data block
> >>>> really valid to move in GC?
> >>>
> >>> I guess it's valid, let double check that.
> >>
> >> We can see inode page:
> >>
> >> - f2fs_create
> >>  - f2fs_add_link
> >>   - f2fs_add_dentry
> >>    - f2fs_init_inode_metadata
> >>     - f2fs_add_inline_entry
> >>      - ipage = f2fs_new_inode_page
> >>      - f2fs_put_page(ipage)   <---- after this
> > 
> > Can you print out how many block was assigned to this inode?
> 
> Add log like this:
> 
> 		if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
> 			if (is_inode) {
> 				for (i = 0; i < 923 - 50; i++) {
> 					__le32 *base = blkaddr_in_node(node);
> 					unsigned ofs = offset_in_addr(inode);
> 
> 					printk("i:%u, addr:%x\n", i,
> 						le32_to_cpu(*(base + i)));
> 				}
> 				printk("i_inline: %u\n", inode->i_inline);
> 			}
> 
> It shows:
> ...
> i:10, addr:e66a
> ...
> i:46, addr:e66c
> i:47, addr:e66d
> i:48, addr:e66e
> i:49, addr:e66f
> i:50, addr:e670
> i:51, addr:e671
> i:52, addr:e672
> i:53, addr:e673
> i:54, addr:e674
> i:55, addr:e675
> i:56, addr:e676
> ...
> i:140, addr:2c35    <--- we want to migrate this block, however, without correct
> .i_inline and .i_extra_isize value, we can just find i_addr[i:140-6] = NULL_ADDR

So, the theory is the block is indeed valid and the address was updated before
write_inode()?

> i:141, addr:2c38
> i:142, addr:2c39
> i:143, addr:2c3b
> i:144, addr:2c3e
> i:145, addr:2c40
> i:146, addr:2c44
> i:147, addr:2c48
> i:148, addr:2c4a
> i:149, addr:2c4c
> i:150, addr:2c4f
> i:151, addr:2c59
> i:152, addr:2c5d
> ...
> i:188, addr:e677
> i:189, addr:e678
> i:190, addr:e679
> i:191, addr:e67a
> i:192, addr:e67b
> i:193, addr:e67c
> i:194, addr:e67d
> i:195, addr:e67e
> i:196, addr:e67f
> i:197, addr:e680
> i:198, addr:ffffffff
> i:199, addr:ffffffff
> i:200, addr:ffffffff
> i:201, addr:ffffffff
> i:202, addr:ffffffff
> i:203, addr:ffffffff
> i:204, addr:ffffffff
> i:205, addr:ffffffff
> i:206, addr:ffffffff
> i:207, addr:ffffffff
> i:208, addr:ffffffff
> i:209, addr:ffffffff
> i:210, addr:ffffffff
> i:211, addr:ffffffff
> i:212, addr:ffffffff
> i:213, addr:ffffffff
> i:214, addr:ffffffff
> i:215, addr:ffffffff
> i:216, addr:ffffffff
> i:217, addr:ffffffff
> i:218, addr:ffffffff
> i:219, addr:ffffffff
> i:220, addr:ffffffff
> i:221, addr:ffffffff
> i:222, addr:ffffffff
> i:223, addr:ffffffff
> i:224, addr:ffffffff
> i:225, addr:ffffffff
> i:226, addr:ffffffff
> i:227, addr:ffffffff
> i:228, addr:ffffffff
> i:229, addr:ffffffff
> i:230, addr:ffffffff
> i:231, addr:ffffffff
> i:232, addr:ffffffff
> i:233, addr:ffffffff
> i:234, addr:b032
> i:235, addr:b033
> i:236, addr:b034
> i:237, addr:b035
> i:238, addr:b036
> i:239, addr:b038
> ...
> i:283, addr:e681
> ...
> i_inline: 0
> 
> F2FS-fs (zram1): summary nid: 360, ofs: 134, ver: 0
> F2FS-fs (zram1): blkaddr 2c35 (blkaddr in node 0) <-blkaddr in node is NULL_ADDR
> F2FS-fs (zram1): expect: seg 14, ofs_in_seg: 53
> F2FS-fs (zram1): real: seg 4294967295, ofs_in_seg: 0
> F2FS-fs (zram1): ofs: 53, 0
> F2FS-fs (zram1): node info ino:360, nid:360, nofs:0
> F2FS-fs (zram1): ofs_in_addr: 0
> F2FS-fs (zram1): end ========
> 
> > 
> >>
> >>>
> >>>>
> >>>>>
> >>>>> is_alive()
> >>>>> {
> >>>>> ...
> >>>>> 	node_page = f2fs_get_node_page(sbi, nid);  <--- inode page
> >>>>
> >>>> Aren't we seeing the below version warnings?
> >>>>
> >>>> if (sum->version != dni->version) {
> >>>> 	f2fs_warn(sbi, "%s: valid data with mismatched node version.",
> >>>>                            __func__);
> >>>>         set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>>> }
> >>
> >> The version of summary and dni are all zero.
> > 
> > Then, this node was allocated and removed without being flushed.
> > 
> >>
> >> summary nid: 613, ofs: 111, ver: 0
> >> blkaddr 2436 (blkaddr in node 0)
> >> expect: seg 10, ofs_in_seg: 54
> >> real: seg 4294967295, ofs_in_seg: 0
> >> ofs: 54, 0
> >> node info ino:613, nid:613, nofs:0
> >> ofs_in_addr: 0
> >>
> >> Thanks,
> >>
> >>>>
> >>>>>
> >>>>> 	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
> >>>>
> >>>> So, we're getting this? Does this incur infinite loop in GC?
> >>>>
> >>>> if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
> >>>> 	f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
> >>>> 	f2fs_bug_on(sbi, 1);
> >>>> }
> >>>
> >>> Yes, I only get this with generic/269, rather than "valid data with mismatched
> >>> node version.".
> > 
> > Was this block moved as valid? In either way, is_alive() returns false, no?
> > How about checking i_blocks to detect the page is initialized in is_alive()?
> > 
> >>>
> >>> With this patch, generic/269 won't panic again.
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>>> ...
> >>>>> }
> >>>>>
> >>>>> datablock_addr()
> >>>>> {
> >>>>> ...
> >>>>> 	base = offset_in_addr(&raw_node->i);  <--- the base could be wrong here due to
> >>>>> accessing uninitialized .i_inline of raw_node->i.
> >>>>> ...
> >>>>> }
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> - gc_data_segment
> >>>>>>>  - is_alive
> >>>>>>>   - datablock_addr
> >>>>>>>    - offset_in_addr
> >>>>>>>
> >>>>>>> Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
> >>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>>>>>> ---
> >>>>>>>  fs/f2fs/dir.c | 3 +++
> >>>>>>>  1 file changed, 3 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> >>>>>>> index 765f13354d3f..b1840852967e 100644
> >>>>>>> --- a/fs/f2fs/dir.c
> >>>>>>> +++ b/fs/f2fs/dir.c
> >>>>>>> @@ -479,6 +479,9 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
> >>>>>>>  		if (IS_ERR(page))
> >>>>>>>  			return page;
> >>>>>>>  
> >>>>>>> +		/* synchronize inode page's data from inode cache */
> >>>>>>> +		f2fs_update_inode(inode, page);
> >>>>>>> +
> >>>>>>>  		if (S_ISDIR(inode->i_mode)) {
> >>>>>>>  			/* in order to handle error case */
> >>>>>>>  			get_page(page);
> >>>>>>> -- 
> >>>>>>> 2.18.0.rc1
> >>>> .
> >>>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
