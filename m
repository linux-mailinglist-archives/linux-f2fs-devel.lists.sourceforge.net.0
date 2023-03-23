Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B006C72B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 23:03:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfT1x-0002uE-5r;
	Thu, 23 Mar 2023 22:03:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfT1v-0002u4-34
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 22:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIZs61UQ4D9EsTpNjcOvLQrX2Fldl7RPq7n54QqVHvQ=; b=inJN4I/rswgAtS0gQoUOfMSeLv
 8S4nvrMeVxlIDpb5y5nxEldPx2bofJLOfurBc/ylBCyWWwjkPR2wKawr6+I3xJAYQ/Z1sUXZHRH84
 gbet48FCuohTUG4ElV33DkCbtfj9vQViM8v855jEh9VL4Q5+388VXGBXxwpHXwAeE8xI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cIZs61UQ4D9EsTpNjcOvLQrX2Fldl7RPq7n54QqVHvQ=; b=DBer8CyrCA77JeHnIU5SPhf9sx
 h5EcnxXsDsoM1P0O7ubAXGe/jlXEXVBaaDeEOVoYECXahc41Bb5Ow3BSlwy9xXYquIecS5+khd2Co
 G8t7+8wmQ0FTZ5SzgKbYCI9/hLUMJcaD5EJiQa/9Mevi/E2Z6AlqT0zp2U3Dtd5iOGCg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfT1u-0003uk-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 22:03:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61F0B628A5;
 Thu, 23 Mar 2023 22:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FFCC433D2;
 Thu, 23 Mar 2023 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679609004;
 bh=goJ4V9EA3h8tpdyLAJRYYFW4knwa/WVSAHQH3lMkgl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dM6si4v4OoCcVcoOqAx/sf+oiBJriayq0sO2xzovDAAhA1uieRCpJ+hibfqxQNPit
 DZtNG4r/J+2QxBE1ZIQ4OAjC7j5fhaG4ID3GnLxWx3DR65KEmU0lUFhgfxwDJvbJ2W
 pQrl1k76LI5lcX+vizatOsawtmeOmSRuVzo6Q/hicdheeL0KC8ezRo/Gc7uwMO3yUG
 +Sck6h5dkveSi4cRMIwiFghdXLAYGGdOpKODWyDnRvOObjp55HQOnv4mL+7R05QlDP
 u0tojVrN1a2weuQCrJfgKUVePaBtlbujBovq+/+cNPRKK0A9oSWoLtfHegcVFxrmUB
 J7Uj6scixKeAg==
Date: Thu, 23 Mar 2023 15:03:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZBzMql6DkrUWiRKP@google.com>
References: <CGME20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
 <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
 <a24d66ad-4048-fd5c-ae47-2dd17c87bcbe@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a24d66ad-4048-fd5c-ae47-2dd17c87bcbe@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/23, Chao Yu wrote: > On 2023/3/13 17:48, Yonggil Song
 wrote: > > When using f2fs on a zoned block device with 2MiB zone size, IO
 errors > > occurs because f2fs tries to write data to a zone that [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfT1u-0003uk-P1
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Fix discard bug on zoned block
 devices with 2MiB zone size
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Chao Yu wrote:
> On 2023/3/13 17:48, Yonggil Song wrote:
> > When using f2fs on a zoned block device with 2MiB zone size, IO errors
> > occurs because f2fs tries to write data to a zone that has not been reset.
> > 
> > The cause is that f2fs tries to discard multiple zones at once. This is
> > caused by a condition in f2fs_clear_prefree_segments that does not check
> > for zoned block devices when setting the discard range. This leads to
> > invalid reset commands and write pointer mismatches.
> > 
> > This patch fixes the zoned block device with 2MiB zone size to reset one
> > zone at a time.
> > 
> > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > ---
> >   fs/f2fs/segment.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index acf3d3fa4363..2b6cb6df623b 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1953,7 +1953,8 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> >   					(end - 1) <= cpc->trim_end)
> >   				continue;
> > -		if (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi)) {
> > +		if (!f2fs_sb_has_blkzoned(sbi) &&
> 
> Could you please add one line comment here for this change?

This was merged in -dev a while ago. I don't think this would be critical
to rebase it again.

> 
> Otherwise it looks good to me.
> 
> Thanks,
> 
> > +		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
> >   			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
> >   				(end - start) << sbi->log_blocks_per_seg);
> >   			continue;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
