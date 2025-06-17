Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1BADC37E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 09:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnpfyBLkWBLTpfy4VC/j1OFyCgXMoEDsTfGPP5n5W64=; b=Sx7B/ZTuK4HQCs2B7i64SRk12T
	Ai308og4Wv7J7wxuipnUiuqwW03oPljVPE5BclC1JE4NxWBdrxbAwX5uWKXTLV5uU4ME88Qv8t5lX
	cWc4C0GioUkL8BaMkeq8El/hjrjn0pGlyJmRwQjZT205onMBuvlPMgEBh9PrNCxHSUNE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRQst-0008Se-Le;
	Tue, 17 Jun 2025 07:37:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRQss-0008SY-Gk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 07:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hOdb7cBF4NjQNgjAh19ttvM8oCRYtPhAVkOB3ByDaEY=; b=NQ9l/5hKkTIA1UOt5zU8h/B8XV
 ARDXNLUFtjY13GRpDRBCKIMlDD4hivFigmecw4sWcGRbxLtpGEDl+kqSlnqRPaAj/Rg9PFMjfm0S9
 LUowE1chIciBEr8wPM5H6hfOvmWtc5OyyG/0HC9xUPCn5w7t7K/Jwa0zlGTpcfgoAOI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hOdb7cBF4NjQNgjAh19ttvM8oCRYtPhAVkOB3ByDaEY=; b=ZC5cE4pxhoBdKIho07PM0nYrP6
 6aQEcmB8m/bbpWMZzB2YQQYS1qpqmd470WxVgzF8s+5QnyzpPbJa0GdxUgPIJD1efw80l12gxQkbn
 Ln6phHQyyxfIdKSg0fN5Bc7KzZ9zFKHAeWPzvhauUCOmWQTyYIJBeAk3pCaCD8TzYElY=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRQsr-0001tv-VP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 07:37:30 +0000
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bLzCF0ScnzYl63Q;
 Tue, 17 Jun 2025 15:34:17 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 15:36:43 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 15:36:43 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 17 Jun 2025 15:36:43 +0800
Message-ID: <20250617073643.2361088-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6ccfdae1-13f7-421d-b7d3-76883c2e7b8b@kernel.org>
References: <6ccfdae1-13f7-421d-b7d3-76883c2e7b8b@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 6/17/25 11:57,
 wangzijie wrote: > > To prevent non-section-aligned
 size pinned file generated from truncation, > > add check condition in setattr.
 > > > > Signed-off-by: wangzijie <wangzijie1@hon [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uRQsr-0001tv-VP
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size
 pinned file generation
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 6/17/25 11:57, wangzijie wrote:
> > To prevent non-section-aligned size pinned file generated from truncation,
> > add check condition in setattr.
> > 
> > Signed-off-by: wangzijie <wangzijie1@honor.com>
> > ---
> >  fs/f2fs/file.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 6bd3de64f..72f7d1b4a 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
> >  {
> >  	struct inode *inode = d_inode(dentry);
> >  	struct f2fs_inode_info *fi = F2FS_I(inode);
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >  	int err;
> >  
> >  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> > @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
> >  			!IS_ALIGNED(attr->ia_size,
> >  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
> >  			return -EINVAL;
> > +		if (f2fs_is_pinned_file(inode) &&
> > +			attr->ia_size < i_size_read(inode) &&
> 
> Do we need to consider attr->ia_size > i_size case?
> 
> Thanks,

Hi, Chao
After commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned
files"), when we want to write data to pinned file, we need to use pin+fallocate, 
and we did CAP_BLKS_PER_SEC roundup align when fallocate pinned file:

block_t sec_len = roundup(map.m_len, sec_blks);

Even if we truncate the file to a larger size(maybe larger than sec_len, section
align or not), and write data to offset beyond sec_len, the write will fail(commit
3fdd89b452c2 prevent it). The scattered pin block cannot be generated by this way,
so I did not consider attr->ia_size > i_size case.
Do you have some suggestions?

> > +			!IS_ALIGNED(attr->ia_size,
> > +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> > +			return -EINVAL;
> >  	}
> >  
> >  	err = setattr_prepare(idmap, dentry, attr);





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
