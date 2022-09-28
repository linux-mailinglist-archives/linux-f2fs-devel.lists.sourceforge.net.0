Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C05ED35A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 05:15:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odNXk-0003iy-Ha;
	Wed, 28 Sep 2022 03:15:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1odNXX-0003ij-KT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 03:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nr1O+njmQbN9DcDRgUPCTHfHdi+Vo4f6zJLb/36Pn5Q=; b=gV+mEPtK/W37UarWRA3RiKLTTs
 W0Eni+2H35ebUnpWqz5KwQBYUMcOQkoH6twoSn3WXy/mTVt7Wd/S8/6ganixrAMgHBrKQzNQkstR+
 Ixnw9JHp+b8j9f4T5NQqUdqIYji36NV0BLMTEN92QTKQSAKjmMxDgTTpL6l/5rpjE8Ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nr1O+njmQbN9DcDRgUPCTHfHdi+Vo4f6zJLb/36Pn5Q=; b=SDQBDBhZA1KOltOBjXWSIB1GcP
 7DaeFY0miSFTFUl3X/CWAyxNLZ5ApQsioVTkXH/+bhKJf5ZQkXMi7yGOKe6AsgTkUnypHZrKtgIrr
 Zoml1O8G/zSVeQOHV/F4oq11/7YOsp++2XX3t30TC4L1oIpls+V0+VaYMmTqQtsptt4k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odNXg-00586l-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 03:15:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B2F861CE6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 03:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEF4C433D6;
 Wed, 28 Sep 2022 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664334913;
 bh=olkv9ev5c1Gy1IK7GPnqkm0lL6MNv6OTUmLjkTfcs3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+8Zm/iCMUS9/+SCIoDpvew5N8RTcdGxzEiQej9fuMYS14vrzoocAdz7z5+kcBSc6
 gHrJktp4/dfiNbJ9udLZMaiOSLWIuzjDHW+UYTx21XdJd7hZjodBEhp2ZmsokcjFHc
 t7KVhDSWpo43WaiY4JWIpjeUaO4VSVvwBjwiLTYCI54FX77GTyzIDoEY2R6zOGP3ur
 wchmJUzxiRvQPS/qcQbUX77Nw/0RR/M4gn7x4b0F2DZBLff8nSds3Cu1ade8wkdDg7
 aDCS+8glq9hJHXGBtoSP6bh3Vbng3NSMB7bs7eEcJMdCc5KNl46+g27Dxh66KAH8m9
 mbog4fUOU93qA==
Date: Tue, 27 Sep 2022 20:15:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YzO8P7/XM4OckVSp@google.com>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
 <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/28, Chao Yu wrote: > On 2022/9/28 0:40, Jaegeuk Kim
 wrote: > > On 09/25, Chao Yu wrote: > > > Update allocation policy for ro
 feature: > > > - hot_data: allocating blocks by LBA ascending order [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odNXg-00586l-Bj
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
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

On 09/28, Chao Yu wrote:
> On 2022/9/28 0:40, Jaegeuk Kim wrote:
> > On 09/25, Chao Yu wrote:
> > > Update allocation policy for ro feature:
> > > - hot_data: allocating blocks by LBA ascending order
> > > - hot_node: allocating blocks by LBA descending order
> > 
> > This will increase the RO image size.
> 
> Shouldn't RO image has fixed-size during mkfs?

First run gives the reduced size information, and second round makes the image
with the required size.

> 
> > 
> > > 
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   mkfs/f2fs_format.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> > > index 40ac589..8d0f410 100644
> > > --- a/mkfs/f2fs_format.c
> > > +++ b/mkfs/f2fs_format.c
> > > @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
> > >   	}
> > >   	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
> > > -		c.cur_seg[CURSEG_HOT_NODE] = 0;
> > > +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
> > >   		c.cur_seg[CURSEG_WARM_NODE] = 0;
> > >   		c.cur_seg[CURSEG_COLD_NODE] = 0;
> > > -		c.cur_seg[CURSEG_HOT_DATA] = 1;
> > > +		c.cur_seg[CURSEG_HOT_DATA] = 0;
> > >   		c.cur_seg[CURSEG_COLD_DATA] = 0;
> > >   		c.cur_seg[CURSEG_WARM_DATA] = 0;
> > >   	} else if (c.heap) {
> > > -- 
> > > 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
