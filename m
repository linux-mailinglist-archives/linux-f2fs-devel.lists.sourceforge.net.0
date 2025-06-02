Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9EEACB1BB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTxLDz8i9mcMJuP8hE7v9MkJsdSue8pf5kQEIAufFDY=; b=RZf0WaBQ3mn4vcF4iBZZjMPAFR
	rx5Hivx1pMUafUDVCbL1ZTLgSAKmMZmo0/PUjJdQQWbK22jdA2UiQv5p4UPoKVxiE3mjU1/gykIaw
	4hvIgDai+JHqp8Oue7EXeFTqT5NpdPx231dztmiopq49JsM1PzMYh29X3zfjuVJ2SS1k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM63x-00029H-Av;
	Mon, 02 Jun 2025 14:22:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM63w-00029A-7b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1bRJdz6nL2klaaDwAuwNJqiE7K2mtRuzbdyKjXqih4=; b=mCzpGmXycZwZT7GvPHvhq0N/1n
 JCHcFBEInryo6OP+kY5MtBiBatlHtQpzWq+zt734JnQa08JKaw7LCr2VpqHD1es4S/g8BY3SkHyNr
 AKl3Usm4QSzwAy0vRfHXJT01XnslpVSeaepQb+tzB6UkbJfdQxMGs5GrfLb36OpReSFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y1bRJdz6nL2klaaDwAuwNJqiE7K2mtRuzbdyKjXqih4=; b=NJqQAkaW0vZZodY3vtlLHoKmhz
 SfPJ61tDgI8Rv/mYEvCliSXTdKx5wwWCvT+UhJ8ah1S5z8uXRH2+n76jyZSmqIGqewMTh4sl645gi
 A1cqULADQRpybc1es9lzJ+CQrHm6lzTVhcY4oCYjLfs1xNv4vjxVRkdoRzS+GipBUMhA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM63v-0002RD-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:22:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1DB8D68C7B; Mon,  2 Jun 2025 16:22:38 +0200 (CEST)
Date: Mon, 2 Jun 2025 16:22:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20250602142237.GD21996@lst.de>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113306epcas5p3d10606ae4ea7c3491e93bde9ae408c9f@epcas5p3.samsung.com>
 <20250529111504.89912-13-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-13-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1uM63v-0002RD-H6
Subject: Re: [f2fs-dev] [PATCH 12/13] nfs: add support in nfs to handle
 multiple writeback contexts
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

On Thu, May 29, 2025 at 04:45:03PM +0530, Kundan Kumar wrote:
>  	if (folio && !cinfo->dreq) {
>  		struct inode *inode = folio->mapping->host;
> +		struct bdi_writeback_ctx *bdi_wb_ctx =
> +						fetch_bdi_writeback_ctx(inode);
>  		long nr = folio_nr_pages(folio);
>  
>  		/* This page is really still in write-back - just that the
>  		 * writeback is happening on the server now.
>  		 */
>  		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
> -		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb,
> -			    WB_WRITEBACK, nr);
> +		wb_stat_mod(&bdi_wb_ctx->wb, WB_WRITEBACK, nr);

Similar comments to fuse here as well, except that nfs also really
should be using the node stat helpers automatically counting the
numbers of pages in a folio instead of duplicating the logic.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
