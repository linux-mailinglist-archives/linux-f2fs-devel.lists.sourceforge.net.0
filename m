Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D767767D765
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Jan 2023 22:09:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pL9VI-0004Eq-Ip;
	Thu, 26 Jan 2023 21:09:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pL9VH-0004Ek-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jan 2023 21:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pyu4dTW9doGEoGxUqz97wBbxXkGq2c7FhwsXIhkbe4o=; b=CIEHEGe+qmV6rxN2RPmoz/Npxu
 JYcPHK7bJfexKQe41L4UUeI6fD+d+lkvfteMFZFmf2WrVdEpFS+DD9NeGMpDBbepOZ7BI1tWqShSX
 hzu2W+aoKxYV/BczL/Kknf8+Q/yI4mdaAkbT3WEP+NZ5WpatJ0prZS+YasUlRShSgBD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pyu4dTW9doGEoGxUqz97wBbxXkGq2c7FhwsXIhkbe4o=; b=U9babzFY7QzhrvQCa0WGdmwJ0k
 2jriNVEf++O1o9r4UBsARlR3YKurir02auhdmsGd4E5hp2gbJ/JOOoXACgCfUCpNWnTPO4F0MtWo+
 i6cawxQUrjRsVFDp3+Y1PbGRNi4/oqjOH1G3mFIIsOpvkoFaH8PIspfbJ2yM8sgVcc8Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pL9VG-00078k-5j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jan 2023 21:09:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6510617D1;
 Thu, 26 Jan 2023 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DE0C433EF;
 Thu, 26 Jan 2023 21:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674767380;
 bh=Ivb1qksbftnFFwvDhNXLsTVGImL1pbxAjiwYLOBHQsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nF6ug6pmpwMcAqKOp/z/tD8sE9npc/WR1N/hE9Y7vQx3dDVnVobGjNK5dTqE5bE1i
 0YBVBVQom+7UFk+hD/2xL/FGhFiJTuFkq9BfGGdspSYiIf8DCuFHhuib6jq11GlLJy
 sU4C7ZEMc5g4JnsVWldKWO8o/xtkt5QtyW76SdQY1DNb/GhGmD/nD90U1roBWvM8lr
 qTuef0W+uUcng+5qUuFTAfLEfISJ5avDNwIDznLsATeN+VEV+BIqU/G55ZMPGKGwWU
 Cy3qec5Tew/DL1AiukspURbjnllpwFhOeWKMxcxGKA+9d5hHRankRgrqjVUyPLoUTx
 OqMzjeo4mV3qg==
Date: Thu, 26 Jan 2023 13:09:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y9LsEgN3ZdmC1aQp@google.com>
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-3-glider@google.com>
 <Y3vXL3Lw+DnVkQYC@gmail.com> <Y84wVf+pZ7tRwCh8@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y84wVf+pZ7tRwCh8@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/22, Eric Biggers wrote: > On Mon, Nov 21,
 2022 at 07:53:19PM
 +0000, Eric Biggers wrote: > > On Mon, Nov 21, 2022 at 12:21:32PM +0100,
 Alexander Potapenko wrote: > > > When aops->write_begin() do [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pL9VG-00078k-5j
Subject: Re: [f2fs-dev] [PATCH 3/5] fs: f2fs: initialize fsdata in
 pagecache_write()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/22, Eric Biggers wrote:
> On Mon, Nov 21, 2022 at 07:53:19PM +0000, Eric Biggers wrote:
> > On Mon, Nov 21, 2022 at 12:21:32PM +0100, Alexander Potapenko wrote:
> > > When aops->write_begin() does not initialize fsdata, KMSAN may report
> > > an error passing the latter to aops->write_end().
> > > 
> > > Fix this by unconditionally initializing fsdata.
> > > 
> > > Suggested-by: Eric Biggers <ebiggers@kernel.org>
> > > Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> > > ---
> > >  fs/f2fs/verity.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> > > index c352fff88a5e6..3f4f3295f1c66 100644
> > > --- a/fs/f2fs/verity.c
> > > +++ b/fs/f2fs/verity.c
> > > @@ -81,7 +81,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
> > >  		size_t n = min_t(size_t, count,
> > >  				 PAGE_SIZE - offset_in_page(pos));
> > >  		struct page *page;
> > > -		void *fsdata;
> > > +		void *fsdata = NULL;
> > >  		int res;
> > >  
> > >  		res = aops->write_begin(NULL, mapping, pos, n, &page, &fsdata);
> > 
> > Reviewed-by: Eric Biggers <ebiggers@google.com>
> > 
> 
> Jaegeuk, can you please apply this patch?

Yup, applied.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
