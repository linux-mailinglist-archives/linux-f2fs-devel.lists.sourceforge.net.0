Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B65BFD92
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 14:14:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaycg-0005zb-MW;
	Wed, 21 Sep 2022 12:14:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oaycZ-0005zI-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 12:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DhWrp4Y+WDYIHgMfhCSnwxHjdgVkwuf2XKV8diifaJs=; b=TObOa7U3BzomRjWJCjpnFbURsA
 t8mZENYbL5a5kOGZku2y7NOC5f9PebJbLQ2TJndVkT2xgabjxagXdcmgZ6JMu1/8N2kxQxJYJPhal
 3GMERflxbqA3cEhcUdHNISAEmULOwOBVbvnKrce4I+z9Bel+Uk737li66w5ylvuPccQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DhWrp4Y+WDYIHgMfhCSnwxHjdgVkwuf2XKV8diifaJs=; b=L
 pEe67OMPbNn5XyOVLjyMwhnx8lvgxgYxDFB5gXYsGtMkegNi5Xhr6eS481UBT0OsmgHTlqliiRWJZ
 wEZwbimfIi5cOJBEmVOxWWTV7Zt4czn1xy/Mql48Q+EmX1hpdqr6+6R50mu4/pnIiY4/vabbrn7Kq
 3kBrwk+UUkjFvS3A=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaycT-00FSdj-Nj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 12:14:31 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MXcg11L8dz14Rbm;
 Wed, 21 Sep 2022 20:10:05 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:14:12 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:14:11 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Wed, 21 Sep 2022 20:14:11 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: Reply: [PATCH -next 2/4] f2fs: extent cache: support extent for
 no-compressed file
Thread-Index: AdjNrbACXl7j9lpyQ2OxMuhfPuNR+g==
Date: Wed, 21 Sep 2022 12:14:11 +0000
Message-ID: <0de024bf987748e9bf4a29780ec82917@huawei.com>
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
 Content preview:  > On 2022/9/21 15:57, Zhang Qilong wrote: > > No-compressed
 file may suffer read performance issue due to it can't > > use extent cache
 or the largest extent in inode can't covered other > > parts of [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oaycT-00FSdj-Nj
Subject: [f2fs-dev] Reply: [PATCH -next 2/4] f2fs: extent cache: support
 extent for no-compressed file
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

> On 2022/9/21 15:57, Zhang Qilong wrote:
> > No-compressed file may suffer read performance issue due to it can't
> > use extent cache or the largest extent in inode can't covered other
> > parts of continuous blocks in readonly format f2fs image.
> >
> > Now it won't build extent cacge tree for no-compressed file in
> > readonly format f2fs image.
> >
> > For readonly format f2fs image, maybe the no-compressed file don't
> > have the largest extent, or it have more than one part which have
> 
> Why it can not have largest extent in f2fs_inode?

The following several situations may occur:
	1) Wrote w/o the extent when the filesystem is read-write fs.

    2) Largest extent have been drop after being re-wrote, or it have been split to smaller parts.

    3) The largest extent only covered one part of continuous blocks, like:
      |------parts 1(continuous blocks)-----|----not continuous---|---------------------parts 2 (continuous blocks)-----------|---------|
      The largest extent is part 2, but other parts (like part1, ) can't be mapped in readonly format f2fs image which should have been mapped.


Thanks,

> 
> Thanks,
> 
> > internally continuous blocks. So we add extent cache tree for the
> > no-compressed file in readonly format f2fs image.
> >
> > The cache policy is almost same with compressed file. The difference
> > is that, the no-compressed file part will set min-number of continuous
> > blocks F2FS_MIN_EXTENT_LEN in order to reduce cache fragmentation.
> >
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >   fs/f2fs/extent_cache.c | 52
> ++++++++++++++++++++++++++++++++++--------
> >   1 file changed, 42 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c index
> > 387d53a61270..7e39381edca0 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -695,9 +695,12 @@ static void
> f2fs_update_extent_tree_range_compressed(struct inode *inode,
> >   	set_extent_info(&ei, fofs, blkaddr, llen);
> >   	ei.c_len = c_len;
> >
> > -	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> > +	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en)) {
> > +		if (!c_len && llen < F2FS_MIN_EXTENT_LEN)
> > +			goto unlock_out;
> >   		__insert_extent_tree(sbi, et, &ei,
> >   				insert_p, insert_parent, leftmost);
> > +	}
> >   unlock_out:
> >   	write_unlock(&et->lock);
> >   }
> > @@ -726,24 +729,53 @@ static unsigned int
> f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
> >   	return compressed ? i - 1 : i;
> >   }
> >
> > +/*
> > + * check whether normal file blocks are contiguous, and add extent
> > +cache
> > + * entry only if remained blocks are logically and physically contiguous.
> > + */
> > +static unsigned int f2fs_normal_blocks_are_contiguous(struct
> > +dnode_of_data *dn) {
> > +	int i = 0;
> > +	struct inode *inode = dn->inode;
> > +	block_t first_blkaddr = data_blkaddr(inode, dn->node_page,
> > +						dn->ofs_in_node);
> > +	unsigned int max_blocks = ADDRS_PER_PAGE(dn->node_page, inode)
> > +					- dn->ofs_in_node;
> > +
> > +	for (i = 1; i < max_blocks; i++) {
> > +		block_t blkaddr = data_blkaddr(inode, dn->node_page,
> > +				dn->ofs_in_node + i);
> > +
> > +		if (!__is_valid_data_blkaddr(blkaddr) ||
> > +				first_blkaddr + i != blkaddr)
> > +			return i;
> > +	}
> > +
> > +	return i;
> > +}
> > +
> >   void f2fs_readonly_update_extent_cache(struct dnode_of_data *dn,
> >   					pgoff_t index)
> >   {
> > -	unsigned int c_len = f2fs_cluster_blocks_are_contiguous(dn);
> > +	unsigned int c_len = 0;
> > +	unsigned int llen = 0;
> >   	block_t blkaddr;
> >
> > -	if (!c_len)
> > -		return;
> > -
> >   	blkaddr = f2fs_data_blkaddr(dn);
> > -	if (blkaddr == COMPRESS_ADDR)
> > -		blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > +	if (f2fs_compressed_file(dn->inode)) {
> > +		c_len = f2fs_cluster_blocks_are_contiguous(dn);
> > +		if (!c_len)
> > +			return;
> > +		llen = F2FS_I(dn->inode)->i_cluster_size;
> > +		if (blkaddr == COMPRESS_ADDR)
> > +			blkaddr = data_blkaddr(dn->inode, dn->node_page,
> >   					dn->ofs_in_node + 1);
> > +	} else {
> > +		llen = f2fs_normal_blocks_are_contiguous(dn);
> > +	}
> >
> >   	f2fs_update_extent_tree_range_compressed(dn->inode,
> > -				index, blkaddr,
> > -				F2FS_I(dn->inode)->i_cluster_size,
> > -				c_len);
> > +				index, blkaddr, llen, c_len);
> >   }
> >   #endif
> >

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
