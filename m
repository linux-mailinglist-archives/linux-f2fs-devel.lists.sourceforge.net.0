Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D66C82AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 17:54:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfkgm-0006sU-5H;
	Fri, 24 Mar 2023 16:54:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfkgj-0006sO-5M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9LNKogth9hfT1ZrlbNUhbHvaFww/aFXRj5NxFlXJ5w=; b=PoP9f+JX02kQwzzTL7jnWV9/i7
 pBY5q3iMoLwmJVVGTsVNfjahxjNtzsY49TYAJneM9fahb4CY1Ly0VXKxU8xVcOW2sU9VpCRz269dl
 OHaGpPVNHArawPLa5FOsxsN2YSUe1S2uPDmD9WyT4P3dItHpKV2siCJW2CNAWVH5M8K0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u9LNKogth9hfT1ZrlbNUhbHvaFww/aFXRj5NxFlXJ5w=; b=AhNtp94Q2h+aeGKEW6AiI3aic5
 F0ReU+Fva88wc6AHwFh8gm8nNZzW+xWvTBclm6OXn9qCCAlXzPhIF58XCAYCwxfXXku0FT0ERKU0T
 ZbHbOn8NHM3jvwcxg/FWfXd+VOeLnpc1cjxPIkqiOamlbuAGa/wJ6x2DwLcCjYhVpRzw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfkgk-001ovT-FZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:54:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 891BAB82565;
 Fri, 24 Mar 2023 16:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C9CC433EF;
 Fri, 24 Mar 2023 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679676881;
 bh=s26PMR9LnZjCeBo1ZeGJ+j/whi/RZtcTzPjkiJphWmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=euCzy08TjPyv44g0XuHekfA7PUE7xp6aY25yiju00O0x3s+tD067nu2KN14eKX7SF
 ocFWU9Rf0Qwgg2Mk9LjbqUFu9SRvYKlXic7nPajYEwWP4YB99vIMAYneyO8gYILfzG
 YWN3B9J2zKdmTi6JRQZYmbyFiex325ZE7W2GUp32bCuS/fWU2ESmal559j/3cSxPzK
 0fQWHnEsq2TNU1u2C6tjehM46U5au7hl+bCR29AQJSnhROGmF/uRWB3SwrA/ZXLmik
 bN+1cgIkFGKs6VoCtWMTmh2oIkaH5GSjJZ3vKhTul9rsvlZWdf1xR3ohRIaSV8Sht9
 +urIUgkfi4ktQ==
Date: Fri, 24 Mar 2023 09:54:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZB3Vz9w2ybNVSY8C@google.com>
References: <CGME20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
 <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
 <a24d66ad-4048-fd5c-ae47-2dd17c87bcbe@kernel.org>
 <ZBzMql6DkrUWiRKP@google.com>
 <35dd1eea-f1b9-418e-5f97-cfd10b7ff803@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35dd1eea-f1b9-418e-5f97-cfd10b7ff803@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/24, Chao Yu wrote: > On 2023/3/24 6:03, Jaegeuk Kim
 wrote: > > On 03/23, Chao Yu wrote: > > > On 2023/3/13 17:48, Yonggil Song
 wrote: > > > > When using f2fs on a zoned block device with 2MiB zo [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfkgk-001ovT-FZ
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

On 03/24, Chao Yu wrote:
> On 2023/3/24 6:03, Jaegeuk Kim wrote:
> > On 03/23, Chao Yu wrote:
> > > On 2023/3/13 17:48, Yonggil Song wrote:
> > > > When using f2fs on a zoned block device with 2MiB zone size, IO errors
> > > > occurs because f2fs tries to write data to a zone that has not been reset.
> > > > 
> > > > The cause is that f2fs tries to discard multiple zones at once. This is
> > > > caused by a condition in f2fs_clear_prefree_segments that does not check
> > > > for zoned block devices when setting the discard range. This leads to
> > > > invalid reset commands and write pointer mismatches.
> > > > 
> > > > This patch fixes the zoned block device with 2MiB zone size to reset one
> > > > zone at a time.
> > > > 
> > > > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > > > ---
> > > >    fs/f2fs/segment.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > index acf3d3fa4363..2b6cb6df623b 100644
> > > > --- a/fs/f2fs/segment.c
> > > > +++ b/fs/f2fs/segment.c
> > > > @@ -1953,7 +1953,8 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> > > >    					(end - 1) <= cpc->trim_end)
> > > >    				continue;
> > > > -		if (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi)) {
> > > > +		if (!f2fs_sb_has_blkzoned(sbi) &&
> > > 
> > > Could you please add one line comment here for this change?
> > 
> > This was merged in -dev a while ago. I don't think this would be critical
> > to rebase it again.
> 
> Yes, it's not critical, fine to me.

Added:

/* Should cover 2MB zoned device for zone-based reset */

So lucky since I had to rebase to fix other patch. :(

"f2fs: factor out discard_cmd usage from general rb_tree use"


> 
> Thanks,
> 
> > 
> > > 
> > > Otherwise it looks good to me.
> > > 
> > > Thanks,
> > > 
> > > > +		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
> > > >    			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
> > > >    				(end - start) << sbi->log_blocks_per_seg);
> > > >    			continue;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
