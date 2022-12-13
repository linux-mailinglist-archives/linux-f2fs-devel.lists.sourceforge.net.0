Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189664AF89
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 06:58:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4yIw-00084P-MT;
	Tue, 13 Dec 2022 05:58:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1p4yIu-00084J-II
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 05:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f94Fg5K6pPtqpz7PAIZN5dlFiMzuXAQMWprUltpbtJQ=; b=hKMGG3sHzeKQn00zAL0U48kFow
 TTrxP3MBfYjMvkiSA1Eu/+7XcWIIjyelzth5R6Yl5chMT3BM3uJLOLg3xqCnIzVtUdEZj0XbgwKCl
 T/AlgcyEyiab6T8zaDpRCblWe3iFLaDjQonzpnup6gbUHjYiPmCTbLfk4A5oZvlN1mDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f94Fg5K6pPtqpz7PAIZN5dlFiMzuXAQMWprUltpbtJQ=; b=Q1UD4IiVqW3ktHaUqpUHNrfs6I
 tmRF4Mev7Ofm8wCmUsorMxoyf8E/E+CJ8DjSIJ4QD0WWHZapYlQcviP7nzTe6BtPWTYlc2pPBiJvl
 iKp+EE+xulyItfMp67yjZIScYUrPPKQv/k7P8KaZqt37WoPOxcpqQ2GwoIbofMYDfpZU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4yIt-00FSOm-EK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 05:58:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 893B96732D; Tue, 13 Dec 2022 06:57:59 +0100 (CET)
Date: Tue, 13 Dec 2022 06:57:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20221213055759.GC882@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
 <20221128091523.1242584-13-hch@lst.de> <Y5fT4SQ9/vuZeWWB@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5fT4SQ9/vuZeWWB@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 12, 2022 at 05:22:41PM -0800, Jaegeuk Kim wrote:
 > > struct dnode_of_data dn;
 > > @@ -1484,11 +1483,7 @@ int f2fs_map_blocks(struct
 inode *inode, struct f2fs_map_blocks *map, > > pgofs = ( [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1p4yIt-00FSOm-EK
Subject: Re: [f2fs-dev] [PATCH 12/15] f2fs: remove the create argument to
 f2fs_map_blocks
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
Cc: Christoph Hellwig <hch@lst.de>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 12, 2022 at 05:22:41PM -0800, Jaegeuk Kim wrote:
> >  	struct dnode_of_data dn;
> > @@ -1484,11 +1483,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> >  	pgofs =	(pgoff_t)map->m_lblk;
> >  	end = pgofs + maxblocks;
> >  
> > -	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
> > -		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> 
> Any reason to remove this condition?
> 
> Thanks,
> 
> > -							map->m_may_create)

With "this condition" I guess you mean the:

		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
							map->m_may_create)
			goto next_dnode;

?

Now that the !create check above is replaced with !map->m_may_create
above, it is dead code, as the map->m_may_create part of the conditions
must be false.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
