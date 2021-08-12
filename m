Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8D3EAC4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 23:15:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEI3I-0004Sp-1G; Thu, 12 Aug 2021 21:15:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mEI3G-0004Sd-W4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 21:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+BTS3AHf/ey3CoMf/v4HAJFQscH7rLa+vzWuRE5qeg=; b=LDujiGDox5PUIQGXGO8nIYZAf9
 CZVfZJlMCRAlhZR5Sqj/q1+sRXUTuOEpd0QO2jDxcHbwwMm9K9ZllSDm2ZH7dMgmnckvSt9FBWHkP
 tyMOGgtziTeh/M5VPYHV72iFZpCWAkFRBr4quOdRe0jfN19UIBYolbEtF+VXZe0mdEc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z+BTS3AHf/ey3CoMf/v4HAJFQscH7rLa+vzWuRE5qeg=; b=jIXi5hKf+5c0TvI1K7jbzcLbV0
 0EOsDvlxjn9RggTmcrvp3M0MnThdjtL4UZq7DJ6EOAI2LldYh/6fh60Ej9oKLioJWmNp28lTHx40E
 KS2ZpAPFS41F84ZsU9Q1ulH7UPPtiPPYWvfsDBbu/mbbdylGA1nnkZd36zOQ3+zKQIyE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEI3F-0000AN-R9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 21:15:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58F1160FED;
 Thu, 12 Aug 2021 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802940;
 bh=2pqO7WHJFmbXB1e9UuOVNaqanv8SyRUtEYeR/KbwGE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGck5zGiE3Sc5zdGvo9vVYYXz5OuFqMfIey/ZxVRKqXrg/9aNSKOifAkkFYoplnXk
 WWKSostAbGngPqrFFfjXQ7EZhhijhmbYgl0EMH3nMOiC8BDc3VB+OLXB218GGG2jDo
 fU1YRGkiCPOlO8YXOb6o9MwkSJI5ndF0BVzutTxtemRyVYtixazxBNNJUU/kwsXuJr
 3Q4jiWimIN87OnBmIY3Pu7M+qW5MyPlXuirmh34GDx+0gFAYp2EgYXmo/YUvFkm6GV
 E5hH65t9jje1eYv+r34jog7IrZoblewXqLcb97IH80KHGnIYc9Vw9ViHMoK+63XWt0
 fNVlhb8pxMqDg==
Date: Thu, 12 Aug 2021 14:15:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YRWPetjv8PqbzzF/@google.com>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mEI3F-0000AN-R9
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing inplace count in overwrite
 with direct io
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/06, Chao Yu wrote:
> On 2021/7/29 20:25, Fengnan Chang wrote:
> > For now, overwrite file with direct io use inplace policy, but not
> > counted, fix it.
> 
> IMO, LFS/SSR/IPU stats in debugfs was for buffered write, maybe we
> need to add separated one for DIO.

Do we really need to monitor DIO stats?

> 
> Jaegeuk, thoughts?
> 
> Thanks,
> 
> > 
> > Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> > ---
> >   fs/f2fs/data.c | 6 ++++++
> >   fs/f2fs/f2fs.h | 2 ++
> >   2 files changed, 8 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index d2cf48c5a2e4..60510acf91ec 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1477,6 +1477,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> >   		if (flag == F2FS_GET_BLOCK_DIO)
> >   			f2fs_wait_on_block_writeback_range(inode,
> >   						map->m_pblk, map->m_len);
> > +		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> > +				map->m_may_create)
> > +			stat_add_inplace_blocks(sbi, map->m_len);
> >   		goto out;
> >   	}
> > @@ -1526,6 +1529,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> >   			blkaddr = dn.data_blkaddr;
> >   			set_inode_flag(inode, FI_APPEND_WRITE);
> >   		}
> > +		if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> > +				map->m_may_create)
> > +			stat_inc_inplace_blocks(sbi);
> >   	} else {
> >   		if (create) {
> >   			if (unlikely(f2fs_cp_error(sbi))) {
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 867f2c5d9559..3a9df28e6fd7 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3804,6 +3804,8 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
> >   		((sbi)->block_count[(curseg)->alloc_type]++)
> >   #define stat_inc_inplace_blocks(sbi)					\
> >   		(atomic_inc(&(sbi)->inplace_count))
> > +#define stat_add_inplace_blocks(sbi, count)				\
> > +		(atomic_add(count, &(sbi)->inplace_count))
> >   #define stat_update_max_atomic_write(inode)				\
> >   	do {								\
> >   		int cur = F2FS_I_SB(inode)->atomic_files;	\
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
