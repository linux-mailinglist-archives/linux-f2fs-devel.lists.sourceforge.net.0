Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D03F489E6EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 02:38:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruLz5-0004N1-DV;
	Wed, 10 Apr 2024 00:38:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruLz0-0004Ms-G0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 00:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8GGVrYAxyI8LnjIsB9SHNIWqzMVwr9uTZG/GzXDmU4=; b=JRV5FgtjEQp8DIhe8YFNue8AEr
 SoXTXmUDsbl+gNyM+2MEIa5i31+siZZ6jhZ1NLv1R+URNSamT14uEtYg5r4votjP1sya+SlMiXou1
 NiPDXwEFl9GHqG/g1+1VcdjuJN81vet5T1gUR6sLYlBRzw/pOg+GZkTKSEQuejAezYj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8GGVrYAxyI8LnjIsB9SHNIWqzMVwr9uTZG/GzXDmU4=; b=KwCtJW3HYYgrxWi7Lmx6VYm4+E
 XAhjf3QJmk0Ny7E/NnK79U8DMDBvSV4cf2Z+tLTlJJ19AAGmvwuCmDqjZ42ea0VqPTHUinE1MJm99
 fBKDV9v+PdWhYOKaTy5+kW9istiFmgpUEGEzeFJWhWqFM8XN3MdUbyPE/U+9rY5I7g9I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruLyl-0005uk-EA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 00:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2025661B18;
 Wed, 10 Apr 2024 00:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B285C433F1;
 Wed, 10 Apr 2024 00:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712709488;
 bh=QNl096Eaxhpg9/6z/6mtoaMF/TR6zZNptkVgqYuHD1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=birLb6fKnBJaRZRuMD1o9TVdmOTQu6MEmYnpHPNsjV9vgAAGrb1q2s5Yo8TezjT7s
 cwtc434hrrwmsZPkQ+w/JSvDAG2bEDNnpV8/JFIYNMtMRu8vz31o9C7/3SO5ksZsOR
 EqMUdau4MmpvbitO1sq6DRVEZqC8Pl6t0f5YzLI8p0WqE2KI1J90qzNPjwpbZImZfX
 FP75aY6kFXQLLS0wFG2qlvO1X50BgywH/gq+aVsWNahWtyjf5r/i7JxgsLou49Soph
 aBscmBKgfEMLwa27/Y7F8TyU9d4zkDnknHdulmRWCfSdOc7PS9x9K/0WKoLNbCz/7L
 RLaIniGWMn4VQ==
Date: Wed, 10 Apr 2024 00:38:06 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <ZhXfbgxGIgaoxMP0@google.com>
References: <20240408131157.4100204-1-shengyong@oppo.com>
 <ZhQ4yRwASLuwnzpm@google.com>
 <cd9b10d8-66a7-48a1-a764-b9424b2e1fff@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd9b10d8-66a7-48a1-a764-b9424b2e1fff@oppo.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/09, Sheng Yong wrote: > > > On 2024/4/9 2:34, Jaegeuk
 Kim wrote: > > On 04/08, Sheng Yong wrote: > > > Althrough old and new sb
 have the same value for now, it would be better > > > to build new [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruLyl-0005uk-EA
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: get value from new sb during
 rebuilding cp
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/09, Sheng Yong wrote:
> 
> 
> On 2024/4/9 2:34, Jaegeuk Kim wrote:
> > On 04/08, Sheng Yong wrote:
> > > Althrough old and new sb have the same value for now, it would be better
> > > to build new checkpoint according to new sb.
> > 
> > May need to add assert, if they're different?
> > 
> We could add assert here, but I think it's not that necessary:
> 1. rebuild_checkpoint is only called by resize, and new_sb is copied directly
>    from original sb without any changes of these basic attributes.
> 2. for now, new_sb has the same attributes/members with the original one. If
>    those attributes are allowed to get changed in the future, the assert needs
>    to be removed.
> So how about adding a new helper to check and show the difference between the
> new and original sb?

So, why do we need to change this?

> 
> many thanks,
> shengyong
> > > 
> > > Signed-off-by: Sheng Yong <shengyong@oppo.com>
> > > ---
> > >   fsck/resize.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fsck/resize.c b/fsck/resize.c
> > > index 049ddd3..1b4ae85 100644
> > > --- a/fsck/resize.c
> > > +++ b/fsck/resize.c
> > > @@ -481,7 +481,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
> > >   		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
> > >   	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
> > > -						2 * get_sb(segs_per_sec));
> > > +						2 * get_newsb(segs_per_sec));
> > >   	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
> > >   	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> > > @@ -551,11 +551,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
> > >   							cpu_to_le32(crc);
> > >   	/* Write a new checkpoint in the other set */
> > > -	new_cp_blk_no = old_cp_blk_no = get_sb(cp_blkaddr);
> > > +	old_cp_blk_no = get_sb(cp_blkaddr);
> > > +	new_cp_blk_no = get_newsb(cp_blkaddr);
> > >   	if (sbi->cur_cp == 2)
> > >   		old_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
> > >   	else
> > > -		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
> > > +		new_cp_blk_no += 1 << get_newsb(log_blocks_per_seg);
> > >   	/* write first cp */
> > >   	ret = dev_write_block(new_cp, new_cp_blk_no++);
> > > -- 
> > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
