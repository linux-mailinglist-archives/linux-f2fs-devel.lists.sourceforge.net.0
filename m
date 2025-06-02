Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D3ACB1AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 16:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/WZRAU735V/l6DTZpZ4ZCufXIomFrcqfFSsRjOprQc=; b=I7+Q/5XGcXNmiNGUoWPgw4wneY
	ZhIDHjrt6JfvrJ8OjTleotV62LLvfYOeI3y2Ijmko2nRcfVgUfZGaigtKLzkAnZFepPE1mqTDoop1
	0yrMyFI3zBnC4ZeHa65NEIJsCJfoWwpPUphKhfnGd4tTJIA9nFDgxT925RytBqCGrai0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM63I-0007yf-60;
	Mon, 02 Jun 2025 14:22:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM63H-0007yT-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uto16itjkDMpk4PmjcYSRtJ3jKBOXUUHzJUvEAv10r4=; b=iko6whwiIjWadmLuOudzRUiv5e
 ARqIac3FyxXVhm1qFd41cHrGa6bXDN702uppCY66RIF33xruGQ650PxGJCyDQbJe/0nxfaCFZYmAf
 07Ms0an4/hdc2g/j+aZRa8xhIVZtzCVMQchX1IyqDVLJF0ROUK3JseeN8Al7WFzL8XXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uto16itjkDMpk4PmjcYSRtJ3jKBOXUUHzJUvEAv10r4=; b=cqkzTHn9IyBAS1NKEYv19DiPfe
 c/BJ2m41+CujrpvMzc4gE7+Zmo09kPOy8E3/Hn2fFWOIh1yYSJjuIS33WsXeFdctdUv41Tp6MO5Yj
 jVXP+4RIWzeP8hwgbsKEWWdsrko1xol2dibM48XcUaJ09OSoli1szt7OZ08zhdKdK038=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM63G-0002PR-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:22:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 448D468C7B; Mon,  2 Jun 2025 16:21:57 +0200 (CEST)
Date: Mon, 2 Jun 2025 16:21:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20250602142157.GC21996@lst.de>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea@epcas5p4.samsung.com>
 <20250529111504.89912-11-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-11-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1uM63G-0002PR-Mp
Subject: Re: [f2fs-dev] [PATCH 10/13] fuse: add support for multiple
 writeback contexts in fuse
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

>  static void fuse_writepage_finish_stat(struct inode *inode, struct folio *folio)
>  {
> -	struct backing_dev_info *bdi = inode_to_bdi(inode);
> +	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
>  
> -	dec_wb_stat(&bdi->wb_ctx_arr[0]->wb, WB_WRITEBACK);
> +	dec_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
>  	node_stat_sub_folio(folio, NR_WRITEBACK_TEMP);
> -	wb_writeout_inc(&bdi->wb_ctx_arr[0]->wb);
> +	wb_writeout_inc(&bdi_wb_ctx->wb);
>  }

There's nothing fuse-specific here except that nothing but fuse uses
NR_WRITEBACK_TEMP.  Can we try to move this into the core first so that
the patches don't have to touch file system code?

> -	inc_wb_stat(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb, WB_WRITEBACK);
> +	inc_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
>  	node_stat_add_folio(tmp_folio, NR_WRITEBACK_TEMP);

Same here.  On pattern is that fuse and nfs both touch the node stat
and the web stat, and having a common helper doing both would probably
also be very helpful.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
