Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B395E6A68
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Sep 2022 20:09:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obQco-0004Ox-Fn;
	Thu, 22 Sep 2022 18:08:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1obQcm-0004Or-FY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 18:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cKjZLcHExLpcetnlHCXfWLAJX5u5BLSMeEj4y1l9Xd4=; b=aWL2FxQLn28kjnYfQgqRzX6tJh
 hTSMzOMh7uv9sBjdnD3C+ADqtTuWGRoJs6v1pm5pREGrJybL9Ug71Z9+wa6DkgWPG/DoGMbblSo8O
 0OrK0eDnTHGLE9fM0GiZ2EBxexQXgmpIYbp994XcKW+lfUSwiZIGOQBfdcz/xIWuFAvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cKjZLcHExLpcetnlHCXfWLAJX5u5BLSMeEj4y1l9Xd4=; b=Pj9V88ulFWEONHqNj6FnvQoIlu
 /wtADYPGiR/bQ1LUsEpq7XNOyt9R8gWK8JVs7LYFJXHV1cmIk5a1SaQ7qZTm1uFbHfYUbugg0ZsR4
 rS3mAanjYJCUtNS+XU/RpG3TuyE6nmkz1kXW7e3Yh1UpMOq+qN8CEMAntGF9vXlO0MV0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obQcv-00GnPd-Km for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 18:08:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 731C563724
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Sep 2022 18:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D6CC433D6;
 Thu, 22 Sep 2022 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663870114;
 bh=8YflYgGzeSL4oNIVZdVxWj8ALucnq8yffuvlMiR6Jb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKnmkWkRYtoGvNFwPO1otm3qjPehtjNqI1NzY2NeBo4v/wZospEBo+uiOQgBJc5t5
 IZ6adcITV/OsJe3RPPJXnGTrc+RF52P167WRwqYMgrS5iJRH+DY1rEh7BiU9c5Wsok
 MqgTh82lN/NQMQCd3ohuGHiuEUxA1NjEZbtx6fkiFwxEetsw3PSDft9D5TYKKFm9pC
 cIipw6JNWedVdTo5D8ikofmt3OQWzqp2qGYG+zIV2OqhrRZHdPNK956G71aY7YNAFJ
 OlWrCelt1MsCPQyBAreSS5+MywEb/yw1/qtWd1WXSkjwqhUwPZDkhSESE59NRAabRQ
 fTlIOKdg2EsOw==
Date: Thu, 22 Sep 2022 11:08:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YyykoT0BdBrXfcrQ@google.com>
References: <20220913135919.2445544-1-chao@kernel.org>
 <YykPzeC4lk+F/U/2@google.com>
 <b22657e3-df59-46ff-81c5-be22e422a576@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b22657e3-df59-46ff-81c5-be22e422a576@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/20, Chao Yu wrote: > On 2022/9/20 8:56, Jaegeuk Kim
 wrote: > > On 09/13, Chao Yu wrote: > > > Once CP_ERROR_FLAG is set, checkpoint
 is disallowed to be triggered to > > > persist CP_FSCK_FLAG, f [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obQcv-00GnPd-Km
Subject: Re: [f2fs-dev] [RFC PATCH v2] f2fs: record need_fsck in super_block
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

On 09/20, Chao Yu wrote:
> On 2022/9/20 8:56, Jaegeuk Kim wrote:
> > On 09/13, Chao Yu wrote:
> > > Once CP_ERROR_FLAG is set, checkpoint is disallowed to be triggered to
> > > persist CP_FSCK_FLAG, fsck won't repair the image due to lack of
> > > CP_FSCK_FLAG.
> > > 
> > > This patch proposes to persist newly introduced SB_NEED_FSCK flag into
> > > super block if CP_ERROR_FLAG and SBI_NEED_FSCK is set, later, once fsck
> > > detect this flag, it can check and repair corrupted image in time.
> > > 
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > > v2:
> > > - remove unneeded codes.
> > >   fs/f2fs/checkpoint.c    |  6 +++++-
> > >   fs/f2fs/f2fs.h          |  1 +
> > >   fs/f2fs/super.c         | 26 ++++++++++++++++++++++++++
> > >   include/linux/f2fs_fs.h |  5 ++++-
> > >   4 files changed, 36 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > index c3119e4c890c..0836fce40394 100644
> > > --- a/fs/f2fs/checkpoint.c
> > > +++ b/fs/f2fs/checkpoint.c
> > > @@ -30,8 +30,12 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
> > >   {
> > >   	f2fs_build_fault_attr(sbi, 0, 0);
> > >   	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> > > -	if (!end_io)
> > > +	if (!end_io) {
> > >   		f2fs_flush_merged_writes(sbi);
> > > +
> > > +		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
> > > +			f2fs_update_sb_flags(sbi, SB_NEED_FSCK);
> > 
> > Let's think of putting some more context in superblock, if we want to overwrite
> > it. E.g., a reason to stop checkpoint?
> 
> Good idea, maybe:
> Bit	Value				max number of type
> [0]	need fsck flag			1
> [1-5]	reason to stop checkpoint	32
> [6-13]	reason to fsck			256

How about just keeping the counters of the reasons? (e.g., EIO count which
stopped checkpoint)

#define MAX_CRASH_REASON 32
char array[MAX_CRASH_REASON];

> 
> Thanks
> 
> > 
> > > +	}
> > >   }
> > >   /*
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index dee7b67a17a6..1960a98c7555 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -3556,6 +3556,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
> > >   int f2fs_quota_sync(struct super_block *sb, int type);
> > >   loff_t max_file_blocks(struct inode *inode);
> > >   void f2fs_quota_off_umount(struct super_block *sb);
> > > +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag);
> > >   int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
> > >   int f2fs_sync_fs(struct super_block *sb, int sync);
> > >   int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
> > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > index b8e5fe244596..c99ba840593d 100644
> > > --- a/fs/f2fs/super.c
> > > +++ b/fs/f2fs/super.c
> > > @@ -3846,6 +3846,32 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
> > >   	return err;
> > >   }
> > > +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag)
> > > +{
> > > +	unsigned short s_flags;
> > > +	int err;
> > > +
> > > +	if (le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags) & SB_NEED_FSCK)
> > > +		return;
> > > +
> > > +	f2fs_down_write(&sbi->sb_lock);
> > > +
> > > +	s_flags = le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags);
> > > +
> > > +	if (s_flags & SB_NEED_FSCK)
> > > +		goto out_unlock;
> > > +
> > > +	F2FS_RAW_SUPER(sbi)->s_flags = cpu_to_le16(s_flags | SB_NEED_FSCK);
> > > +
> > > +	err = f2fs_commit_super(sbi, false);
> > > +	if (err) {
> > > +		f2fs_warn(sbi, "f2fs_commit_super fails to persist flag: %u, err:%d", flag, err);
> > > +		F2FS_RAW_SUPER(sbi)->s_flags = s_flags;
> > > +	}
> > > +out_unlock:
> > > +	f2fs_up_write(&sbi->sb_lock);
> > > +}
> > > +
> > >   static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
> > >   {
> > >   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> > > diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> > > index d445150c5350..124176e2a42c 100644
> > > --- a/include/linux/f2fs_fs.h
> > > +++ b/include/linux/f2fs_fs.h
> > > @@ -73,6 +73,8 @@ struct f2fs_device {
> > >   	__le32 total_segments;
> > >   } __packed;
> > > +#define SB_NEED_FSCK			0x00000001	/* need fsck */
> > > +
> > >   struct f2fs_super_block {
> > >   	__le32 magic;			/* Magic Number */
> > >   	__le16 major_ver;		/* Major Version */
> > > @@ -116,7 +118,8 @@ struct f2fs_super_block {
> > >   	__u8 hot_ext_count;		/* # of hot file extension */
> > >   	__le16  s_encoding;		/* Filename charset encoding */
> > >   	__le16  s_encoding_flags;	/* Filename charset encoding flags */
> > > -	__u8 reserved[306];		/* valid reserved region */
> > > +	__le16 s_flags;			/* super block flags */
> > > +	__u8 reserved[304];		/* valid reserved region */
> > >   	__le32 crc;			/* checksum of superblock */
> > >   } __packed;
> > > -- 
> > > 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
