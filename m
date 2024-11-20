Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC09D4332
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 21:39:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDrTc-0002T3-3n;
	Wed, 20 Nov 2024 20:39:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tDrTZ-0002Sq-U7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 20:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G+NzlgtzQdHsAAU8uYhLAEYIWuj/9dRqo6Ex7/fbRCA=; b=mHSAVyVcv3utIECtztgdfpdY4c
 dFG+xuQQ2Jd9VOERuUr0ND1QkJswQp4+FOrqwIzr4Bq0my0H6IzjBTv3PqZ1Fw4inlkPVQoGSyZu9
 LDYr/u6bwiK3QIc0xyrRAU9OyV58GhJKxsH/ja86QMgyXOYOpb2wAh65ZUiQFCYlimqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G+NzlgtzQdHsAAU8uYhLAEYIWuj/9dRqo6Ex7/fbRCA=; b=gYU/SkQdeto/YW9yvZdw/9ZAKH
 aaiVVf0DXvlImXl2vh6CByq0ZyvGXOgSWPTtGP2dNuKy50cEIawDgeYC0qF8UGYebOqqdMkXhp0mK
 yKXIrWbnioNxGjZHLHfe43pzn7k/Zo1eMeqV+EmcObvH6uWOggwebYHz8THLrJTVttxI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDrTZ-0008Qf-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 20:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B086AA4336E;
 Wed, 20 Nov 2024 20:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D101C4CECD;
 Wed, 20 Nov 2024 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732135130;
 bh=+5Y0qbRrViO3GMeurt2tZfKhhx1FHV6cNAsoCq4C07w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IXGfixLDpaBgzbUue1q95L/wK0RSea9FMEURCrOLwHxHR7iZdh34rm4yYYgGdfmAL
 4+HqG3pplXhytnRXBMGafoF6zW959Z7RBGNRv3+MvMkFjXYXhtiQf57SQloD3asaqL
 MbbMbBGfI8mW44Yt5Cf0IRiz6VU+j7t+Pfjj2KRoJmF/BHwizj1+t9zryGa57oddUa
 DA5lKcjwOecpHQj94QHePoQIbAfXBC12bTayISHLcEqVxy4R3iAZmCwnBv7rMmO/Ex
 bHv2n1htZhUEZQkyhRCCvtCAKoxrb4E2bUBeVU44uXWeHIli4dqVwMDkqNLf/sLXog
 n+/G9WMZC5K1w==
Date: Wed, 20 Nov 2024 20:38:49 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <Zz5I2cdFn331_0ud@google.com>
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
 <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
 <ee341ea4-904c-4885-bf8d-8111f9e416b5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee341ea4-904c-4885-bf8d-8111f9e416b5@redhat.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/20, Eric Sandeen wrote: > On 11/20/24 8:27 AM, Eric
 Sandeen wrote: > > On 11/12/24 3:39 PM, Jaegeuk Kim wrote: > >> Hi Eric, >
 >> > >> Could you please check this revert as it breaks the mount() [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDrTZ-0008Qf-Pv
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daniel Rosenberg <drosen@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20, Eric Sandeen wrote:
> On 11/20/24 8:27 AM, Eric Sandeen wrote:
> > On 11/12/24 3:39 PM, Jaegeuk Kim wrote:
> >> Hi Eric,
> >>
> >> Could you please check this revert as it breaks the mount()?
> >> It seems F2FS needs to implement new mount support.
> >>
> >> Thanks,
> > 
> > I'm sorry, I missed this email. I will look into it more today.
> 
> Ok, I see that I had not considered a direct mount call passing
> the lazytime option strings. :(
> 
> Using mount(8), "lazytime" is never passed as an option all the way to f2fs,
> nor is "nolazytime" -
> 
> # mount -o loop,nolazytime f2fsfile.img mnt
> # mount | grep lazytime
> /root/f2fs-test/f2fsfile.img on /root/f2fs-test/mnt type f2fs (rw,relatime,lazytime,seclabel,background_gc=on,nogc_merge,discard,discard_unit=block,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,memory=normal,errors=continue)
> 
> (note that lazytime is still set despite -o nolazytime)
> 
> when mount(8) is using the new mount API, it does do fsconfig for (no)lazytime:
> 
> fsconfig(3, FSCONFIG_SET_FLAG, "nolazytime", NULL, 0) = 0
> 
> but that is consumed by the VFS and never sent into f2fs for parsing.
> 
> And because default_options() does:
> 
> sbi->sb->s_flags |= SB_LAZYTIME;
> 
> by default, it overrides the "nolazytime" that the vfs had previously handled.
> 
> I'm fairly sure that when mount(8) was using the old mount API (long ago) it also
> did not send in the lazytime option string - it sent it as a flag instead.
> 
> However - a direct call to mount(2) /will/ pass those options all the way
> to f2fs, and parse_options() does need to handle them there or it will be rejected
> as an invalid option.
> 
> (Note that f2fs is the only filesystem that attempts to handle lazytime within
> the filesystem itself):
> 
> [linux]# grep -r \"lazytime\" fs/*/
> fs/f2fs/super.c:	{Opt_lazytime, "lazytime"},
> [linux]#
> 
> I'm not entirely sure how to untangle all this, but regressions are not acceptable,
> so please revert my commit for now.

Thanks for the explanation. At a glance, I thought it's caused that f2fs doesn't
implement fs_context_operations. We'll take a look at how to support it.

> 
> Thanks,
> -Eric
> 
> 
> > As for f2fs new mount API support, I have been struggling with it for a
> > long time, f2fs has been uniquely complex. The assumption that the superblock
> > and on-disk features are known at option parsing time makes it much more
> > difficult than most other filesystems.
> > 
> > But if there's a problem/regression with this commit, I have no objection to
> > reverting the commit for now, and I'm sorry for the error.
> > 
> > -Eric
> > 
> >> On 11/12, Jaegeuk Kim wrote:
> >>> This reverts commit 54f43a10fa257ad4af02a1d157fefef6ebcfa7dc.
> >>>
> >>> The above commit broke the lazytime mount, given
> >>>
> >>> mount("/dev/vdb", "/mnt/test", "f2fs", 0, "lazytime");
> >>>
> >>> CC: stable@vger.kernel.org # 6.11+
> >>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  fs/f2fs/super.c | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >>> index 49519439b770..35c4394e4fc6 100644
> >>> --- a/fs/f2fs/super.c
> >>> +++ b/fs/f2fs/super.c
> >>> @@ -150,6 +150,8 @@ enum {
> >>>  	Opt_mode,
> >>>  	Opt_fault_injection,
> >>>  	Opt_fault_type,
> >>> +	Opt_lazytime,
> >>> +	Opt_nolazytime,
> >>>  	Opt_quota,
> >>>  	Opt_noquota,
> >>>  	Opt_usrquota,
> >>> @@ -226,6 +228,8 @@ static match_table_t f2fs_tokens = {
> >>>  	{Opt_mode, "mode=%s"},
> >>>  	{Opt_fault_injection, "fault_injection=%u"},
> >>>  	{Opt_fault_type, "fault_type=%u"},
> >>> +	{Opt_lazytime, "lazytime"},
> >>> +	{Opt_nolazytime, "nolazytime"},
> >>>  	{Opt_quota, "quota"},
> >>>  	{Opt_noquota, "noquota"},
> >>>  	{Opt_usrquota, "usrquota"},
> >>> @@ -922,6 +926,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> >>>  			f2fs_info(sbi, "fault_type options not supported");
> >>>  			break;
> >>>  #endif
> >>> +		case Opt_lazytime:
> >>> +			sb->s_flags |= SB_LAZYTIME;
> >>> +			break;
> >>> +		case Opt_nolazytime:
> >>> +			sb->s_flags &= ~SB_LAZYTIME;
> >>> +			break;
> >>>  #ifdef CONFIG_QUOTA
> >>>  		case Opt_quota:
> >>>  		case Opt_usrquota:
> >>> -- 
> >>> 2.47.0.277.g8800431eea-goog
> >>
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
