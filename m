Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFDB6DE17E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 18:53:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHF5-00074B-LF;
	Tue, 11 Apr 2023 16:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmHF4-000744-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 16:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+3UTAujVj2VzsUlI3Exjh7/5eSBBstHIVTA5X4SaaU=; b=K6dCkeBeqwL6x/iHScnfwb84Lf
 HWR0psrwFLkPBOPkJLAR7K6Bttf6Qbwjc9rXc1p6RGimd4zwliEl5a2D1YUF3p+jponvxFYS9ADxe
 BSjj/i1NSuPuL/+dhn5JugroLkVAvWOqmqhCVVkZm5jTztB7Nior0mcfOy1nGpm+ksGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A+3UTAujVj2VzsUlI3Exjh7/5eSBBstHIVTA5X4SaaU=; b=avT0WnEBouk8CIy7DGxd4tlhV8
 eQkJMnD136BRoktVedUdJFwcRM9+7SUIYyF8CERPUtVV1ljfdhkY/VVt5SnjrUSgRQrDfgOIsFlWA
 dhAOcFdaOVCx7tIj6gzTLTbE+qRK9qQvMgBU6zz7wafuH6vgDWes9cwV4BHdX6Lyh+sY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHF2-0004wW-AK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 16:53:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9B8A61F4F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 16:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AEFC433A0;
 Tue, 11 Apr 2023 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681231986;
 bh=AqPxyfg+Et2H5o/3OwXKueRRJSbxjOyJRZgCX/0lmK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PL+AUFEgisfOP5Mg9c0lnKBGVW+0Vcg/zaxQBdXF0BOnvP+SA1u0MnKWhsYOe9juM
 z0wYjdkmL7UTtB0Z3FJ/jwvOBvNxafWkeJBRkeGqRC5ReZbh6TMOu7d8mVfbtxNy/Y
 +qckpCp6tN07mhoBIxHlu/EXCEmyqH+XhXjKI4uYgyhoEwTptSMkH6MaRVYBtJj8XP
 Wo2RTn28SO3OBZ8lo5Lq09Dw9eVTCzBLN1+nfl0ApoAOBniwhvhlncpQDOuUI4kbAy
 EZYU07IQmIzhbs4S4q9gyBp7Yg/5NfaRKCQ7Rn4mSwnHw3v69OH37BoVnrgj3+VWyd
 l8W9OjlZIRfwQ==
Date: Tue, 11 Apr 2023 09:53:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDWQcJJ9ceNK9Vi8@google.com>
References: <20230402112825.42486-1-chao@kernel.org>
 <ZCsT5mRsZJqPXBzz@google.com>
 <a8d480c5-3992-d241-97b3-2a7d7b15c1d1@kernel.org>
 <2c70970b-1938-7b32-8de3-21d93895bef8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c70970b-1938-7b32-8de3-21d93895bef8@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Chao Yu wrote: > On 2023/4/10 10:19, Chao Yu wrote:
 > > On 2023/4/4 1:59, Jaegeuk Kim wrote: > > > On 04/02, Chao Yu wrote: >
 > > > This patch does below changes: > > > > > > > > - If f2fs e [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHF2-0004wW-AK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check readonly condition
 correctly
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/11, Chao Yu wrote:
> On 2023/4/10 10:19, Chao Yu wrote:
> > On 2023/4/4 1:59, Jaegeuk Kim wrote:
> > > On 04/02, Chao Yu wrote:
> > > > This patch does below changes:
> > > > 
> > > > - If f2fs enables readonly feature or device is readonly, allow to
> > > > mount readonly mode only
> > > > - Introduce f2fs_dev_is_readonly() to indicate whether image or device
> > > > is readonly
> > > > - remove unnecessary f2fs_hw_is_readonly() in f2fs_write_checkpoint()
> > > > and f2fs_convert_inline_inode()
> > > > - enable FLUSH_MERGE only if f2fs is mounted as rw and image/device
> > > > is writable
> > 
> > Jaegeuk,
> > 
> > Please drop this patch, and help to check below one, thanks. :)
> > 
> > f2fs: use f2fs_hw_is_readonly() instead of bdev_read_only()
> 
> Oh, I didn't make it clear.
> 
> I found you applied both v1 and v2 of this patch.

Yeah, I was keeping the fixes locally. Please check again.

> 
> So I mean how about keeping v2:
> 
> [PATCH v2] f2fs: fix to check readonly condition correctly
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev-test&id=2bce08d26c0fe3a4ce1cca03ee0ea0c59d98c0b2
> 
> and apply
> 
> [PATCH] f2fs: use f2fs_hw_is_readonly() instead of bdev_read_only()
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev-test&id=7ec21ff2e8f521842938415af741fc72f39c0135
> 
> to instead
> 
> [PATCH] f2fs: fix to check readonly condition correctly
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev-test&id=66eb18a8b892afe085097747521fb280a1577ea4
> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> > > 
> > > What is the problem to solve here?
> > > 
> > > > 
> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > ---
> > > >    fs/f2fs/checkpoint.c |  2 +-
> > > >    fs/f2fs/f2fs.h       | 10 +++++-----
> > > >    fs/f2fs/inline.c     |  3 +--
> > > >    fs/f2fs/super.c      | 13 +++++++------
> > > >    4 files changed, 14 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > > index 8e1db5752fff..1eef597ed393 100644
> > > > --- a/fs/f2fs/checkpoint.c
> > > > +++ b/fs/f2fs/checkpoint.c
> > > > @@ -1604,7 +1604,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> > > >    	unsigned long long ckpt_ver;
> > > >    	int err = 0;
> > > > -	if (f2fs_readonly(sbi->sb) || f2fs_hw_is_readonly(sbi))
> > > > +	if (f2fs_readonly(sbi->sb))
> > > >    		return -EROFS;
> > > >    	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > index 2d4a7ef62537..7de95133478a 100644
> > > > --- a/fs/f2fs/f2fs.h
> > > > +++ b/fs/f2fs/f2fs.h
> > > > @@ -4446,6 +4446,11 @@ static inline bool f2fs_hw_is_readonly(struct f2fs_sb_info *sbi)
> > > >    	return false;
> > > >    }
> > > > +static inline bool f2fs_dev_is_readonly(struct f2fs_sb_info *sbi)
> > > > +{
> > > > +	return f2fs_sb_has_readonly(sbi) || f2fs_hw_is_readonly(sbi);
> > > > +}
> > > > +
> > > >    static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
> > > >    {
> > > >    	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
> > > > @@ -4546,11 +4551,6 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
> > > >    	}
> > > >    }
> > > > -static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
> > > > -{
> > > > -	return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
> > > > -}
> > > > -
> > > >    #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
> > > >    #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
> > > > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > > > index 72269e7efd26..2c36f2dc2317 100644
> > > > --- a/fs/f2fs/inline.c
> > > > +++ b/fs/f2fs/inline.c
> > > > @@ -203,8 +203,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
> > > >    	struct page *ipage, *page;
> > > >    	int err = 0;
> > > > -	if (!f2fs_has_inline_data(inode) ||
> > > > -			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
> > > > +	if (!f2fs_has_inline_data(inode) || f2fs_readonly(sbi->sb))
> > > >    		return 0;
> > > >    	err = f2fs_dquot_initialize(inode);
> > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > index d016f398fcad..db7649010c12 100644
> > > > --- a/fs/f2fs/super.c
> > > > +++ b/fs/f2fs/super.c
> > > > @@ -1382,15 +1382,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > > >    		return -EINVAL;
> > > >    	}
> > > > -	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
> > > > +	if (f2fs_dev_is_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
> > > > +		f2fs_err(sbi, "Allow to mount readonly mode only");
> > > > +		return -EROFS;
> > > > +	}
> > > > +
> > > > +	if (f2fs_readonly(sbi->sb) && test_opt(sbi, FLUSH_MERGE)) {
> > > >    		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
> > > >    		return -EINVAL;
> > > >    	}
> > > > -	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
> > > > -		f2fs_err(sbi, "Allow to mount readonly mode only");
> > > > -		return -EROFS;
> > > > -	}
> > > >    	return 0;
> > > >    }
> > > > @@ -2122,7 +2123,7 @@ static void default_options(struct f2fs_sb_info *sbi)
> > > >    	set_opt(sbi, MERGE_CHECKPOINT);
> > > >    	F2FS_OPTION(sbi).unusable_cap = 0;
> > > >    	sbi->sb->s_flags |= SB_LAZYTIME;
> > > > -	if (!f2fs_is_readonly(sbi))
> > > > +	if (!f2fs_readonly(sbi->sb) && !f2fs_dev_is_readonly(sbi))
> > > >    		set_opt(sbi, FLUSH_MERGE);
> > > >    	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
> > > >    		set_opt(sbi, DISCARD);
> > > > -- 
> > > > 2.36.1
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
