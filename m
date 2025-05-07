Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19603AAED10
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 22:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rPECMrfzpEmOX9pL234VDYc7hS2jlfc5Mb/Fajsj0c=; b=egmk3gaGckNJztcaKR3RGln6VJ
	qXPCRCoY3p6Zt5mGBCsEhxQYuTwWyVh4ZXK/cAShNQHc94icjM1jH//Ae8ITBYRtCOPEmHQzpnDir
	IMv3tuwXwhYDKcIeqb18AGq4pc6zO+l8TKmi1Z/G1QA54070xx4kOm4FRQOaHKqdD9hw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uClOG-00056v-7O;
	Wed, 07 May 2025 20:29:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uClOE-00056p-5D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VlyagIrJtY1E//QDNuy2RflSHQ1s0CzyajJlyFRi0rU=; b=i7P6Pbtszs3srQRikuQZOi5FAg
 MjSu8/LAuqDb2fQycWLR0TQ6rXiFk967B1cZcCRzXRUdEdnoCSXcd19juBhscxUO5RssV1z3bUIbs
 JiYe0+Y4Xgy/GDdhpDztyNHpdD4/QO6QHdJXHbbhixJfvWjWI6H4Si7sHMgBF/X/TNpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VlyagIrJtY1E//QDNuy2RflSHQ1s0CzyajJlyFRi0rU=; b=Q+ORDUH16op4sLkZVimpRY9UBF
 9UxYAEmotuHda9PB0kBaqJMfpBt1XQUJ1mlZzaKNA+fqlZ5l9QiovUIcjza69e5KmnI/6HD7gZn3s
 xrRU5VMGh4q5H14yoI44Ul+VyDC4n63A1O3Mi/ZDnMJ75xWJWsYNUajOTq/iqTPHSKSo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uClOC-0005YD-Pc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF4B05C5F3B;
 Wed,  7 May 2025 20:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9025CC4CEE2;
 Wed,  7 May 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746649741;
 bh=E90TQCkKyMBMWWlJY1dsIQzsqbo7zISYo4FJWrAekP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VL+UuEhfNFfad+5EOz9uElrrtfJHd1QV/gZMRB67p/swR7vCTujA6B3N66Xj+2EKF
 YjRFZMspeo07NvwL4tXQUNyTvSkHlS4ONg4AbBsKNYATxpN8F6Onr7cyToZBdpFanF
 sYxA0T47eCF3Irui2018WAE6OPQLkBIFS09YrHCcyLAY1iFReV1mVuU2Ex3QGsWc8m
 DwKWUKbKJM00Q6HrIPkBeOziUgYqWBR7W5z9K+W/tn/zY0Nerkp3n2JN+ZZLwikRtu
 RrsBEVinO7fa+PSuILhAjFqBSHS/EaxjzI+mDc8MAP8+gdJWGlzf+4DFvuH6VHjmaE
 DfsU+wRPABk4w==
Date: Wed, 7 May 2025 20:28:59 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBvCi9KplfQ_7Gsn@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
 <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
 <25cb13c8-3123-4ee6-b0bc-b44f3039b6c1@redhat.com>
 <aBtyRFIrDU3IfQhV@google.com>
 <6528bdf7-3f8b-41c0-acfe-a293d68176a7@redhat.com>
 <aBu5CU7k0568RU6E@google.com>
 <e72e0693-6590-4c1e-8bb8-9d891e1bc5c0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e72e0693-6590-4c1e-8bb8-9d891e1bc5c0@redhat.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/07, Eric Sandeen wrote: > On 5/7/25 2:48 PM, Jaegeuk
 Kim wrote: > > On 05/07, Eric Sandeen wrote: > >> On 5/7/25 9:46 AM, Jaegeuk
 Kim wrote: > >> > >>> I meant: > >>> > >>> # mkfs/mkfs.f2fs -c / [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uClOC-0005YD-Pc
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/07, Eric Sandeen wrote:
> On 5/7/25 2:48 PM, Jaegeuk Kim wrote:
> > On 05/07, Eric Sandeen wrote:
> >> On 5/7/25 9:46 AM, Jaegeuk Kim wrote:
> >>
> >>> I meant:
> >>>
> >>> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
> >>> # mount /dev/vdb mnt
> >>>
> >>> It's supposed to be successful, since extent_cache is enabled by default.
> >>
> >> I'm sorry, clearly I was too sleepy last night. This fixes it for me.
> >>
> >> We have to test the mask to see if the option was explisitly set (either
> >> extent_cache or noextent_cache) at mount time.
> >>
> >> If it was not specified at all, it will be set by the default f'n and
> >> remain in the sbi, and it will pass this consistency check.
> >>
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index d89b9ede221e..e178796ce9a7 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -1412,7 +1414,8 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
> >>  	}
> >>  
> >>  	if (f2fs_sb_has_device_alias(sbi) &&
> >> -			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
> >> +			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
> >> +			 !ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
> >>  		f2fs_err(sbi, "device aliasing requires extent cache");
> >>  		return -EINVAL;
> >>  	}
> > 
> > I think that will cover the user-given options only, but we'd better check the
> > final options as well. Can we apply like this?
> 
> I'm sorry, I'm not sure I understand what situation this additional
> changes will cover...
> 
> It looks like this adds the f2fs_sanity_check_options() to the remount
> path to explicitly (re-)check a few things.
> 
> But as far as I can tell, at least for the extent cache, remount is handled
> properly already (with the hunk above):
> 
> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
> # mount /dev/vdb mnt
> # mount -o remount,noextent_cache mnt
> mount: /root/mnt: mount point not mounted or bad option.
>        dmesg(1) may have more information after failed mount system call.
> # dmesg | tail -n 1
> [60012.364941] F2FS-fs (vdb): device aliasing requires extent cache
> #
> 
> I haven't tested with i.e. blkzoned devices though, is there a testcase
> that fails for you?

I'm worrying about any missing case to check options enabled by default_options.
For example, in the case of device_aliasing, we rely on enabling extent_cache
by default_options, which was not caught by f2fs_check_opt_consistency.

I was thinking that we'd need a post sanity check.

> 
> Thanks,
> -Eric
> 
> > ---
> >  fs/f2fs/super.c | 50 ++++++++++++++++++++++++++++++++-----------------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> > 
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index d89b9ede221e..270a9bf9773d 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1412,6 +1412,7 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
> >  	}
> >  
> >  	if (f2fs_sb_has_device_alias(sbi) &&
> > +			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
> >  			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
> >  		f2fs_err(sbi, "device aliasing requires extent cache");
> >  		return -EINVAL;
> > @@ -1657,6 +1658,29 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
> >  	f2fs_apply_quota_options(fc, sb);
> >  }
> >  
> > +static int f2fs_sanity_check_options(struct f2fs_sb_info *sbi)
> > +{
> > +	if (f2fs_sb_has_device_alias(sbi) &&
> > +	    !test_opt(sbi, READ_EXTENT_CACHE)) {
> > +		f2fs_err(sbi, "device aliasing requires extent cache");
> > +		return -EINVAL;
> > +	}
> > +#ifdef CONFIG_BLK_DEV_ZONED
> > +	if (f2fs_sb_has_blkzoned(sbi) &&
> > +	    sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> > +		f2fs_err(sbi,
> > +			"zoned: max open zones %u is too small, need at least %u open zones",
> > +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> > +		return -EINVAL;
> > +	}
> > +#endif
> > +	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> > +		f2fs_warn(sbi, "LFS is not compatible with IPU");
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> >  static struct inode *f2fs_alloc_inode(struct super_block *sb)
> >  {
> >  	struct f2fs_inode_info *fi;
> > @@ -2616,21 +2640,15 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
> >  	default_options(sbi, true);
> >  
> >  	err = f2fs_check_opt_consistency(fc, sb);
> > -	if (err < 0)
> > +	if (err)
> >  		goto restore_opts;
> >  
> >  	f2fs_apply_options(fc, sb);
> >  
> > -#ifdef CONFIG_BLK_DEV_ZONED
> > -	if (f2fs_sb_has_blkzoned(sbi) &&
> > -		sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> > -		f2fs_err(sbi,
> > -			"zoned: max open zones %u is too small, need at least %u open zones",
> > -				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> > -		err = -EINVAL;
> > +	err = f2fs_sanity_check_options(sbi);
> > +	if (err)
> >  		goto restore_opts;
> > -	}
> > -#endif
> > +
> >  	/* flush outstanding errors before changing fs state */
> >  	flush_work(&sbi->s_error_work);
> >  
> > @@ -2663,12 +2681,6 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
> >  		}
> >  	}
> >  #endif
> > -	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> > -		err = -EINVAL;
> > -		f2fs_warn(sbi, "LFS is not compatible with IPU");
> > -		goto restore_opts;
> > -	}
> > -
> >  	/* disallow enable atgc dynamically */
> >  	if (no_atgc == !!test_opt(sbi, ATGC)) {
> >  		err = -EINVAL;
> > @@ -4808,11 +4820,15 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
> >  	default_options(sbi, false);
> >  
> >  	err = f2fs_check_opt_consistency(fc, sb);
> > -	if (err < 0)
> > +	if (err)
> >  		goto free_sb_buf;
> >  
> >  	f2fs_apply_options(fc, sb);
> >  
> > +	err = f2fs_sanity_check_options(sbi);
> > +	if (err)
> > +		goto free_options;
> > +
> >  	sb->s_maxbytes = max_file_blocks(NULL) <<
> >  				le32_to_cpu(raw_super->log_blocksize);
> >  	sb->s_max_links = F2FS_LINK_MAX;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
