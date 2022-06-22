Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C35551BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 18:52:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o43aa-0006Sr-VI; Wed, 22 Jun 2022 16:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o43aZ-0006Sl-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 16:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aXwtC6Y0q8SoHVVTmTKCIO7WYhXuIkjqAPXdXoIQzXM=; b=bpRuYjZL/hIowmbaIuUZMh/4Cb
 vbyt0WXRjv0bHY1caiMPVEeQaH26SHEJ+ke9lsrqtgQZUWDYVaGWJqr9SWdt2sKSjnSBJEKaemCUx
 qWutYD6cIb+AdBpkzgROq1CeX8DWIHoYZ3ndHW3mmnFLOSVkhRooOWVrBA1eQLf3ULlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aXwtC6Y0q8SoHVVTmTKCIO7WYhXuIkjqAPXdXoIQzXM=; b=fJytaKK0fzwE2Og4gnt0GUWdLL
 j1N82zx+ssNoJZA0TB0EvZmSzg7u8fBmmPCmo9hTsochUy0YhixZqMr2ybLt1Tq3FcOvFB7ANqiQj
 xNTqVy/6HzPLXv0/pp8EaLn0womnY6whKri2dzdgw0QWw0g3EDfXa3nlep5l52DcxTmQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o43aY-00036y-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 16:52:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D99461B2A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Jun 2022 16:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D816FC3411B;
 Wed, 22 Jun 2022 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655916732;
 bh=TxxIurnsqu6z7EwvzQ9NyM0v3aNR0Q6zyP6sKqQYt2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IFPUygRJjK9fHi3P4sbPdhML+nttk5tdx0iZ4TgHvcCodTZ1AjDuCBwvQ1aqc+5zc
 AbM9QyzyXp8hIuCly3loO4Whe4nsQ7tA/gPU/uFJyZYusAGfnFLzD/LxFPCPWTxfBR
 aQ3bX+fk1H2Qqgb8I6tCigSbPjiwuSL9qUppa3Vez4CzrAeRc5thaI99Lqq55JnkTy
 medNV4AnTspN0EEWNbgowOsg4Nj6XfPc3VGFo2p+/UJuoiAZ1ElS724v4NU30aiCWV
 a154YaJD9E4Zbm+g1dvg4Bv10j5RL4EQ6TJSIJKgDcViCpvt8Og02MmPJJDI0I7iSt
 gJJnbcVB04NUg==
Date: Wed, 22 Jun 2022 09:52:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YrNIuqmMg/KSfoHA@google.com>
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <ae324c70-8671-8878-5854-c0910c744379@kernel.org>
 <4c090b50-bfd1-ae90-ac72-ebae3963f578@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c090b50-bfd1-ae90-ac72-ebae3963f578@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/22, Chao Yu wrote: > On 2022/6/19 8:35, Chao Yu wrote:
 > > On 2022/6/18 6:31,
 Jaegeuk Kim wrote: > > > This fixes the below corruption.
 > > > > > > [345393.335389] F2FS-fs (vdb): sanity_check_in [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o43aY-00036y-Nx
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: attach inline_data after setting
 compression
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/22, Chao Yu wrote:
> On 2022/6/19 8:35, Chao Yu wrote:
> > On 2022/6/18 6:31, Jaegeuk Kim wrote:
> > > This fixes the below corruption.
> > > 
> > > [345393.335389] F2FS-fs (vdb): sanity_check_inode: inode (ino=6d0, mode=33206) should not have inline_data, run fsck to fix
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: 677a82b44ebf ("f2fs: fix to do sanity check for inline inode")
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >    fs/f2fs/namei.c | 16 ++++++++++------
> > >    1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > > index c549acb52ac4..a841abe6a071 100644
> > > --- a/fs/f2fs/namei.c
> > > +++ b/fs/f2fs/namei.c
> > > @@ -89,8 +89,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
> > >    	if (test_opt(sbi, INLINE_XATTR))
> > >    		set_inode_flag(inode, FI_INLINE_XATTR);
> > > -	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> > > -		set_inode_flag(inode, FI_INLINE_DATA);
> > >    	if (f2fs_may_inline_dentry(inode))
> > >    		set_inode_flag(inode, FI_INLINE_DENTRY);
> > > @@ -107,10 +105,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
> > >    	f2fs_init_extent_tree(inode, NULL);
> > > -	stat_inc_inline_xattr(inode);
> > > -	stat_inc_inline_inode(inode);
> > > -	stat_inc_inline_dir(inode);
> > > -
> > >    	F2FS_I(inode)->i_flags =
> > >    		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
> > > @@ -127,6 +121,14 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
> > >    			set_compress_context(inode);
> > >    	}
> > > +	/* Should enable inline_data after compression set */
> > > +	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> > > +		set_inode_flag(inode, FI_INLINE_DATA);
> > > +
> > > +	stat_inc_inline_xattr(inode);
> > > +	stat_inc_inline_inode(inode);
> > > +	stat_inc_inline_dir(inode);
> > > +
> > >    	f2fs_set_inode_flags(inode);
> > >    	trace_f2fs_new_inode(inode, 0);
> > > @@ -325,6 +327,8 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> > >    		if (!is_extension_exist(name, ext[i], false))
> > >    			continue;
> > > +		/* Do not use inline_data with compression */
> > > +		clear_inode_flag(inode, FI_INLINE_DATA);
> > 
> > if (is_inode_set_flag()) {
> > 	clear_inode_flag();
> > 	stat_dec_inline_inode();
> > }
> 
> Missed to send new version to mailing list?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4cde00d50707c2ef6647b9b96b2cb40b6eb24397

I'm testing the new version.

> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> > >    		set_compress_context(inode);
> > >    		return;
> > >    	}
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
