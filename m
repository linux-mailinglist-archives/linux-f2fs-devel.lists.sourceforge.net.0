Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE15ACB1CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 16:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u0uFQb60rTe66AT+nyQWDqOjdgPhTxzYXP6HfuBC7s=; b=lMcvnIvsxlJ2+8zF3HAiPSd+kF
	h/zNRsbxwHz8o/nKTDHH6no0Bvp/mFdUauOzC1FZu+b5GdFLaQ7lKVAxPu1jV06HNbFKSjBUGxktS
	v2/DcE0CDrqOWUF7BueoudZKTbjuB4KNX4Up9gqOvIT8Tt2BOEIllUY3jk58VhPzz8F0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM65N-0006Iw-LR;
	Mon, 02 Jun 2025 14:24:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM65L-0006Il-PA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bvmk3nvgj/43LFsf0Vsu+jLmucsaq9sRlp6VUYMcnx8=; b=fmMuCE+vOGyTXRZM4cL7kqOCCA
 1XodCEn17/E8UtxaYpAaLJqRN/rmW/6QHXXEMG+P1U9Qz29dv18PWdWudVF9j3tO3xowkwEEzRTxv
 rHHcxAXt0hZ1IcCLoLb1SFrkOUzCLwRoV6D/EXM5PEExD+gF0lL4QUzA7XfuJ8KCmQpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bvmk3nvgj/43LFsf0Vsu+jLmucsaq9sRlp6VUYMcnx8=; b=OaCKpFqh5aez3jT4dmAbZoAnPq
 uLjsnROrsfI/vhQy17+ysWru/6aiA3EHDxc/SaZ3zL/PJy4TRFCa4x/nyV0kk9oNJlGJ7AgKBs9Fx
 7GNPiwfjTVZrqR7bjWAWkxRp0c7ztMnBo9eKP0ZTGcbYNxzaAnul7UQnite4/g0CXly4=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM65L-0002X8-2K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:24:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A052D68C7B; Mon,  2 Jun 2025 16:24:05 +0200 (CEST)
Date: Mon, 2 Jun 2025 16:24:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20250602142405.GA22563@lst.de>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113232epcas5p4e6f3b2f03d3a5f8fcaace3ddd03298d0@epcas5p4.samsung.com>
 <20250529111504.89912-5-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-5-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1uM65L-0002X8-2K
Subject: Re: [f2fs-dev] [PATCH 04/13] writeback: affine inode to a writeback
 ctx within a bdi
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, p.raghav@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 29, 2025 at 04:44:55PM +0530, Kundan Kumar wrote:
> @@ -157,7 +157,7 @@ fetch_bdi_writeback_ctx(struct inode *inode)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(inode);
>  
> -	return bdi->wb_ctx_arr[0];
> +	return bdi->wb_ctx_arr[inode->i_ino % bdi->nr_wb_ctx];

Most modern file systems use 64-bit inode numbers, while i_ino sadly
still is only an ino_t that can be 32-bits wide.  So we'll either need
an ugly fs hook here, or maybe convince Linus that it finally is time
for a 64-bit i_ino (which would also clean up a lot of mess in the
file systems and this constant source of confusion).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
