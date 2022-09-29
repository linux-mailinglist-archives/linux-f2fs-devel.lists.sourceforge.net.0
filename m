Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938E5EFD06
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Sep 2022 20:28:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odyGo-0003nQ-MR;
	Thu, 29 Sep 2022 18:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1odyGf-0003n0-Gg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 18:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VznYZvp6xTT1pPGtpGxSX8V60DNWUpd/D0lFLsuGkes=; b=Y1BA2kTuX7TTVw/LTt6wBKk2P4
 HCafRujM0fofeJnnFdQdI32xFUi9tt+i19ZyYw+sLeIocj9eje0uEyuyGCO3m72dNtG1TMiamFOU7
 cdCTo5RL/Rz/c4NeCjQdV08CI2LncvMquxKD3Jmom3g0vHTdjZX7QKISV4/m+G1peMVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VznYZvp6xTT1pPGtpGxSX8V60DNWUpd/D0lFLsuGkes=; b=J6hwvEEsov/Eccp62M9SqK1wJs
 VSoxpRNFCdJfRkAeGyCV8KWY8Lh/pI+OENaXkh74aE5CFdkohSfl6pbQfd99DJlvr3L6udvuc8MVM
 p08QyiybWQx9LAKoYF9yM4LYl/98v1XFLR+qxr0zHthImfN2bhGVwwSR5pgE4QpuaRaY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odyGd-006ugm-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 18:28:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26228B8261E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Sep 2022 18:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1021C433D6;
 Thu, 29 Sep 2022 18:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664476079;
 bh=y8i/rIZKD3R0T4175rQFF3LIQLNSt+I6e6eQ5Zf3+1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwPfI+LBAF8x1jBTENO56sIChHGFLscw0eHoGscJBk6OI+wuqJU2jXLirgSZUiXnl
 /5vcp7Pb+61AgIWm8vqV+3xeLm996LZfaBF0CTciVR38fsbkTxkMfTBerWUaNO9FMX
 JkoK0XmycJ/0W1BzwJGk6NgXutWre6ZE/hgam/OYAofWqbVoge65vArjNx6X1+tQqa
 3wMPQ0oLUC2aLpw7+GKxuks+nYI3k1IRonHxpHgWZ/9PRx62f67w6pMhE9e2Gqq1Jv
 01bxsM+yTQ9qYmaNLD/JzUN1PpewgR6ObGGpIc/R9HVKUaKKwL7wK5Jmmck91dMYs3
 ow7e20bvAvSAg==
Date: Thu, 29 Sep 2022 11:27:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YzXjrn7oZzVmUz/n@google.com>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
 <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
 <YzO8P7/XM4OckVSp@google.com>
 <7387ba71-46bd-aed9-d435-f234f486a7a0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7387ba71-46bd-aed9-d435-f234f486a7a0@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/28, Chao Yu wrote: > On 2022/9/28 11:15, Jaegeuk Kim
 wrote: > > On 09/28, Chao Yu wrote: > > > On 2022/9/28 0:40, Jaegeuk Kim
 wrote: > > > > On 09/25, Chao Yu wrote: > > > > > Update allocation [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1odyGd-006ugm-EJ
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
> On 2022/9/28 11:15, Jaegeuk Kim wrote:
> > On 09/28, Chao Yu wrote:
> > > On 2022/9/28 0:40, Jaegeuk Kim wrote:
> > > > On 09/25, Chao Yu wrote:
> > > > > Update allocation policy for ro feature:
> > > > > - hot_data: allocating blocks by LBA ascending order
> > > > > - hot_node: allocating blocks by LBA descending order
> > > > 
> > > > This will increase the RO image size.
> > > 
> > > Shouldn't RO image has fixed-size during mkfs?
> > 
> > First run gives the reduced size information, and second round makes the image
> > with the required size.
> 
> I didn't get it, in which step it may increase the RO image size?
> 
> IIUC, after we apply this patch, reduced size information won't change due
> to that after sload in first run, total used block count should be fixed?

First run fills the data and leaves the maximum LBA touched in the image. Then,
it'll resize the image file and run again with the smallest image.

> 
> Thanks,
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    mkfs/f2fs_format.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> > > > > index 40ac589..8d0f410 100644
> > > > > --- a/mkfs/f2fs_format.c
> > > > > +++ b/mkfs/f2fs_format.c
> > > > > @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
> > > > >    	}
> > > > >    	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
> > > > > -		c.cur_seg[CURSEG_HOT_NODE] = 0;
> > > > > +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
> > > > >    		c.cur_seg[CURSEG_WARM_NODE] = 0;
> > > > >    		c.cur_seg[CURSEG_COLD_NODE] = 0;
> > > > > -		c.cur_seg[CURSEG_HOT_DATA] = 1;
> > > > > +		c.cur_seg[CURSEG_HOT_DATA] = 0;
> > > > >    		c.cur_seg[CURSEG_COLD_DATA] = 0;
> > > > >    		c.cur_seg[CURSEG_WARM_DATA] = 0;
> > > > >    	} else if (c.heap) {
> > > > > -- 
> > > > > 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
