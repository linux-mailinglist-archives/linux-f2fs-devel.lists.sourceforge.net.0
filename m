Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA087DDD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 17:19:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw6fy-0008Dd-A6; Fri, 09 Aug 2019 15:19:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hw6fx-0008DW-1s
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KLf6GTR8DeNhSBT+e5SPuRwr5AvV1mIjd/4jDBNIXh4=; b=ieiGVrDH9VZiN7cp6/E+MRkhPt
 eAYoThR9bng1b6xFX5a2J1CKO7QjtnM8/EV7BwYSaymZwaXxsQDdRxGQrElOiXnmeknX/As+Pvzzn
 cIrS+V/gshs9+077kh/Zc2j9RkUmFjeB/aDyvb+pL3VQK9t6nTHivRyMKtTFpb1fsnfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KLf6GTR8DeNhSBT+e5SPuRwr5AvV1mIjd/4jDBNIXh4=; b=jAZiPaf1fv+bXVfipAOaCzNbKG
 euwD9YN+F+MN61omYoeLUrVlboPqMbLAIqtzFDZ6X/v9OGraFR8j7OPzjjDLRB5WPp1xu+fIUf4A5
 m7UFNfUvV/w17rX2NpM0zyTRDbIENf3IA9Yu1D3aAxjiNN6O6G83YNS5+HrYTpovPmLU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw6fv-00HTIB-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:19:28 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23E6B20C01;
 Fri,  9 Aug 2019 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565363962;
 bh=ojsCh6zH5M2twmcxcR8KTE+bmE0FgFJylCM5lNvG9y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQkgtVaZd8kGl3wiyRnz1ZiLloMvEYAzgu/B/nRewB2f5nWbt0KLJ8ux3Ug+RgcQ0
 dtj4jZB8RGA+nI7u8ofS3Vz/whXXMCXRmwaVeMXUd09or9svX6ZQrd/DkmN+suCfwk
 f9GUannEYdq2cwHGtoaG6CRjiXO7pgSfmhyufL74=
Date: Fri, 9 Aug 2019 08:19:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190809151921.GB93481@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190805102725.27834-1-yuchao0@huawei.com>
 <7a47ec24-2352-7438-bed2-493a89d5c576@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a47ec24-2352-7438-bed2-493a89d5c576@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hw6fv-00HTIB-Oh
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong available node count
 calculation
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

On 08/06, Chao Yu wrote:
> On 2019/8/5 18:27, Chao Yu wrote:
> > In mkfs, we have counted quota file's node number in cp.valid_node_count,
> > so we have to avoid wrong substraction of quota node number in
> > .available_nid/.avail_node_count calculation.
> > 
> > f2fs_write_check_point_pack()
> > {
> > ..
> > 	set_cp(valid_node_count, 1 + c.quota_inum + c.lpf_inum);
> > 
> > Fixes: 292c196a3695 ("reserve nid resource for quota sysfile")
> 
> Jaegeuk,
> 
> Could you help to add prefix "f2fs: " into commit tile in your branch, I missed
> to add it. :P

Done. :)

> 
> Thanks,
> 
> > Fixes: 7b63f72f73af ("f2fs: fix to do sanity check on valid node/block count")
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/node.c  | 2 +-
> >  fs/f2fs/super.c | 6 ++----
> >  2 files changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index a18b2a895771..d9ba1db2d01e 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -2964,7 +2964,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
> >  
> >  	/* not used nids: 0, node, meta, (and root counted as valid node) */
> >  	nm_i->available_nids = nm_i->max_nid - sbi->total_valid_node_count -
> > -				sbi->nquota_files - F2FS_RESERVED_NODE_NUM;
> > +						F2FS_RESERVED_NODE_NUM;
> >  	nm_i->nid_cnt[FREE_NID] = 0;
> >  	nm_i->nid_cnt[PREALLOC_NID] = 0;
> >  	nm_i->nat_cnt = 0;
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 6a7f1166d068..118a31f90a37 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1297,8 +1297,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
> >  	else
> >  		buf->f_bavail = 0;
> >  
> > -	avail_node_count = sbi->total_node_count - sbi->nquota_files -
> > -						F2FS_RESERVED_NODE_NUM;
> > +	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
> >  
> >  	if (avail_node_count > user_block_count) {
> >  		buf->f_files = user_block_count;
> > @@ -2750,8 +2749,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
> >  	}
> >  
> >  	valid_node_count = le32_to_cpu(ckpt->valid_node_count);
> > -	avail_node_count = sbi->total_node_count - sbi->nquota_files -
> > -						F2FS_RESERVED_NODE_NUM;
> > +	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
> >  	if (valid_node_count > avail_node_count) {
> >  		f2fs_err(sbi, "Wrong valid_node_count: %u, avail_node_count: %u",
> >  			 valid_node_count, avail_node_count);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
