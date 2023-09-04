Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07F791BB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 18:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdCd3-0004LX-4m;
	Mon, 04 Sep 2023 16:40:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qdCd1-0004LR-KV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 16:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLmavJmKst8MwlRCpvYzryPGqmmeFR2AewgneG0z5Bs=; b=WWe/9AUXseyOHr3c6kfpyyd1yr
 icWkQRp01J5Io/YrdQyRcUuZcTIDWIor2whcyqhtEN0ty0+R6zEer4ga7seWIlHLhgh3+ZO+TYYc7
 FW3Xh2fGALSiBcjW4PWoTo6DeaNpMivnbYz1oeIkG+DQL4V6OLuRdoQtCo+1YOXU+XFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rLmavJmKst8MwlRCpvYzryPGqmmeFR2AewgneG0z5Bs=; b=FrNYb0fB/wjbfacI6kHic8r2Ip
 9cFxHFj186gCtUCvqZ3I7sHQ2pG0TXaOKC5wupUVo2J1E6gXoi7+jzn7vWpXI7DJ/uxtDOn8Ftejr
 +EgdePGkjY6lBXxxBy8Qw+K867Qku77dyopy+4p1bC/JApMaO7GhoSweU6oO7kRalumM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdCcy-0003rj-E2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 16:40:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40D1260EDE;
 Mon,  4 Sep 2023 16:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857D6C433C8;
 Mon,  4 Sep 2023 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693845632;
 bh=3xgIBlBK1m7Zp9mLlRF22BaIUy8HKmcr8AoobM9e/dM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBMDbz4uHiM3Eij5T6Y3avqcmevmnQMOGFB8RuIvWI4tmD5wqCudMFYvhxbFhMyMc
 gwXM6ex64ixHUfiD3ns6AzKvqj3UjflxLCRjY0eOU63EaqFWayJgOdw8FKXTho7lGK
 sOgP0+AxDFIjfteO0jnfHAfwVKwYne7Ma3Ba+8GyKZlfLGzvI5Qi6zOflfFw3N87Ko
 AgSKU+I5YJMqaEllCxbklIe/9qksg+EuuT2t8XMBptlpAkgOrhsSYc0JEwPahBp7ZH
 OZBWUjN3vAoFshEVo09g3oDm4plAXgbfJWQYosczYPmxwSdn5KxNxMG2RZvz2/GNxP
 dQO8MEPbKikyA==
Date: Mon, 4 Sep 2023 09:40:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZPYIfvwCd/UpMS8S@google.com>
References: <20230831071011.56116-1-guochunhai@vivo.com>
 <0749d51f-bbc3-dfcb-93e3-c6c34614f403@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0749d51f-bbc3-dfcb-93e3-c6c34614f403@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/04, Chao Yu wrote: > On 2023/8/31 15:10, Chunhai Guo
 wrote: > > The commit 344150999b7f ("f2fs: fix to avoid potential deadlock")
 only > > requires unplugging current->plug. Using blk_finish_plu [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdCcy-0003rj-E2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/04, Chao Yu wrote:
> On 2023/8/31 15:10, Chunhai Guo wrote:
> > The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
> > requires unplugging current->plug. Using blk_finish_plug() is unnecessary
> > as it sets current->plug as NULL and prevents wb_writeback() from using
> > plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.
> > 
> > Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> > ---
> >   fs/f2fs/data.c | 3 +--
> >   fs/f2fs/node.c | 3 +--
> >   2 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 916e317ac925..77b4a55d6d94 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3346,8 +3346,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
> >   		atomic_inc(&sbi->wb_sync_req[DATA]);
> >   	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
> >   		/* to avoid potential deadlock */
> > -		if (current->plug)
> > -			blk_finish_plug(current->plug);
> 
> What about?
> 
> if (current->plug) {
> 	struct blk_plug *plug = current->plug;
> 
> 	blk_finish_plug(plug);
> 	blk_start_plug(plug);
> }
> 
> Jaegeuk, thoughts?

By the way, do we really need to reuse current->plug again? After checkpoint
being done, we can use the plug in __f2fs_write_data_pages. Are there some
numbers to show the benefit?

> 
> Thanks,
> 
> > +		blk_flush_plug(current->plug, false);
> >   		goto skip_write;
> >   	}
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index ee2e1dd64f25..c4b5717a8c1a 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -2126,8 +2126,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
> >   		atomic_inc(&sbi->wb_sync_req[NODE]);
> >   	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
> >   		/* to avoid potential deadlock */
> > -		if (current->plug)
> > -			blk_finish_plug(current->plug);
> > +		blk_flush_plug(current->plug, false);
> >   		goto skip_write;
> >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
