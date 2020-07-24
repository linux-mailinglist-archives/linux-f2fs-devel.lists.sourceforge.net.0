Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99B22C028
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 09:49:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jysS3-0007UW-9P; Fri, 24 Jul 2020 07:49:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jysS1-0007Ta-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 07:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rlZpkqVvqog0cZKUGoC0MthnfhBAX+SjxkJ3qxi0B8M=; b=RAAztpYAeXw3M7B96hY2x0RGLW
 aBFeEJWqPKJ9oe+J8jINPWzBsTGHye5j35DQkECcOIqreM/IMjo2+9JE6k0TYwNBxT2nQU2rKue13
 hBOiUrcCAYhNu4IW5gCLaIozGVRit/hOZFHE55uWFhSTJPKHnBHUBjpZxDK7D1N5gnvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rlZpkqVvqog0cZKUGoC0MthnfhBAX+SjxkJ3qxi0B8M=; b=I
 vIjWIEghV043va4CJRSstuDLLgu3Ew/abZ73yOWwsXBZoE9G7NzdkMKI9rdBlkaLRSVBqChmBuZSa
 s2qZFxa+1rYkj9DwE1Ac0p7UeLvwzsE68NbU11I+rWf3pwMwRWNq9VAklr3X7ygioiwrM4aecP+HM
 gAARnrbUBTUTNACk=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jysRy-00Fitl-6f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 07:49:05 +0000
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 0567921EB69C9A7ACFE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 15:48:54 +0800 (CST)
Received: from DGGEMM513-MBX.china.huawei.com ([169.254.1.141]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0487.000;
 Fri, 24 Jul 2020 15:48:44 +0800
From: "Qiujie (Jack)" <jack.qiu@huawei.com>
To: "Yuchao (T)" <yuchao0@huawei.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [f2fs-dev] [PATCH 1/2] f2fs: delete useless space
Thread-Index: AdZhjneD8OpnOCEAQAyr/s9kq/Kt/A==
Date: Fri, 24 Jul 2020 07:48:44 +0000
Message-ID: <9E81852FD51EDB42A790F24E63A53FC0B1867190@dggemm513-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.179]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jysRy-00Fitl-6f
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: delete useless space
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 2020/7/20 20:19, Jack Qiu wrote:
> > Just for code style, no logic change
> 
> I think space related cleanup could be done in one patch?
> 
> Could you please merge them?
> 
> Thanks,
> 

Thanks for review.
I will send a V2 patch after incorporating your comments.

> >
> > Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> > ---
> >   fs/f2fs/checkpoint.c   | 2 +-
> >   fs/f2fs/data.c         | 4 ++--
> >   fs/f2fs/extent_cache.c | 2 +-
> >   fs/f2fs/namei.c        | 2 +-
> >   fs/f2fs/node.c         | 2 +-
> >   5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c index
> > 236064930251..cbff5e2a6b18 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1415,7 +1415,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi,
> struct cp_control *cpc)
> >   				curseg_alloc_type(sbi, i + CURSEG_HOT_DATA);
> >   	}
> >
> > -	/* 2 cp  + n data seg summary + orphan inode blocks */
> > +	/* 2 cp + n data seg summary + orphan inode blocks */
> >   	data_sum_blocks = f2fs_npages_for_summary_flush(sbi, false);
> >   	spin_lock_irqsave(&sbi->cp_lock, flags);
> >   	if (data_sum_blocks < NR_CURSEG_DATA_TYPE) diff --git
> > a/fs/f2fs/data.c b/fs/f2fs/data.c index 326c63879ddc..b6d5cc2de5ba
> > 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -86,7 +86,7 @@ static bool __is_cp_guaranteed(struct page *page)
> >   	sbi = F2FS_I_SB(inode);
> >
> >   	if (inode->i_ino == F2FS_META_INO(sbi) ||
> > -			inode->i_ino ==  F2FS_NODE_INO(sbi) ||
> > +			inode->i_ino == F2FS_NODE_INO(sbi) ||
> >   			S_ISDIR(inode->i_mode) ||
> >   			(S_ISREG(inode->i_mode) &&
> >   			(f2fs_is_atomic_file(inode) || IS_NOQUOTA(inode))) || @@
> -1145,7
> > +1145,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t
> > index)
> >
> >   int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
> >   {
> > -	struct extent_info ei  = {0,0,0};
> > +	struct extent_info ei = {0, 0, 0};
> >   	struct inode *inode = dn->inode;
> >
> >   	if (f2fs_lookup_extent_cache(inode, index, &ei)) { diff --git
> > a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c index
> > e60078460ad1..f23cf0eaa0a1 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -365,7 +365,7 @@ static bool __f2fs_init_extent_tree(struct inode
> > *inode, struct f2fs_extent *i_e
> >
> >   bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
> >   {
> > -	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
> > +	bool ret = __f2fs_init_extent_tree(inode, i_ext);
> >
> >   	if (!F2FS_I(inode)->extent_tree)
> >   		set_inode_flag(inode, FI_NO_EXTENT); diff --git
> a/fs/f2fs/namei.c
> > b/fs/f2fs/namei.c index e94e02c6580a..664e220e0c80 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -600,7 +600,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry
> *dentry)
> >   	/* VFS negative dentries are incompatible with Encoding and
> >   	 * Case-insensitiveness. Eventually we'll want avoid
> >   	 * invalidating the dentries here, alongside with returning the
> > -	 * negative dentries at f2fs_lookup(), when it is  better
> > +	 * negative dentries at f2fs_lookup(), when it is better
> >   	 * supported by the VFS for the CI case.
> >   	 */
> >   	if (IS_CASEFOLDED(dir))
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c index
> > 03e24df1c84f..0bf5bd22d460 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1726,7 +1726,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info
> *sbi, struct inode *inode,
> >   					set_dentry_mark(page,
> >   						f2fs_need_dentry_mark(sbi, ino));
> >   				}
> > -				/*  may be written by other thread */
> > +				/* may be written by other thread */
> >   				if (!PageDirty(page))
> >   					set_page_dirty(page);
> >   			}
> > --
> > 2.17.1
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
