Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96073A4CF11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 00:07:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpEsL-0006mR-6v;
	Mon, 03 Mar 2025 23:07:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tpEsJ-0006mK-E4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 23:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OxxlfGwHSDi7vOUWZgWabG840OjujkOi+GGiDV7cBY=; b=EuR2jA00LVNQSUBMPaw8tT79Tg
 dwofItezRSCiN/p1xOdARsViI1o+Z4nSIeKRiEPVW+Ktax1F9ATYic73Gbb/JlwwIqbSY0DfDrIBk
 SmNJ3Prx8FM9iYBs1LXtsMyeSRLO6sdgL26rSn5/3fmZ5iUhozAHbN0JHR2VN2q/wY9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/OxxlfGwHSDi7vOUWZgWabG840OjujkOi+GGiDV7cBY=; b=Z+r0x0GWyBbrm4JlQYF166CleO
 woTapsEgGgjfba+auqygs4VeRRhSre3AiEIyHGP4ds8djJjprUmNJkfkXD0j2gGQLR8bQLUTw8Yez
 +ItiR49NKhDX6Bz3H7jHuIoQZsO1l7WK6ymd8Yde7z7bi49gWwknNTykvI99XW8MF4Ho=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpEsD-00083J-0O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 23:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC4035C48D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 23:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D22C4CEE8;
 Mon,  3 Mar 2025 23:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741043206;
 bh=UJILM/vpJTvTLD9NoFEaSiIxBWcrfUtPn/ODc8cmblU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDb+bis/RYzdNTpvPkr+S6OCAEtVWVnUUTOhTQrL2CTU2w/a7RvTEjs6e2bpi49dS
 4i0t0wjJDdunLyjITa3qgbvQoFbG5oJDOy1j2iHNbNpOpUW+n2sdKT634B4EhVWatS
 DgknKMrSunabqvaXKSyI8c87dQXF57gFeK7O8II4ERMBsO8Prq+ek021bFXCYDgNrE
 z2wuzdgORHl2q3nrHQ9APXbtnAK9qCGb3S7iYwnU4yB6SD8FMW2W6WAO+3jInvI7LW
 Ew5VE/yT2NWU0yrhjRa4gZz4L89u42Vy5O8PAJXZGuZH2QR9J6FdH9/irl+QuyBAXC
 +KP+kGVswHX6g==
Date: Mon, 3 Mar 2025 23:06:44 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <20250303230644.GA3695685@google.com>
References: <20250303034606.1355224-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303034606.1355224-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 03, 2025 at 11:46:06AM +0800,
 Chao Yu via Linux-f2fs-devel
 wrote: > This patch introduces a new flag F2FS_NOLINEAR_LOOKUP_FL, so that
 we can > tag casefolded directory w/ it to disable lin [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpEsD-00083J-0O
Subject: Re: [f2fs-dev] [PATCH] f2fs: support F2FS_NOLINEAR_LOOKUP_FL
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 03, 2025 at 11:46:06AM +0800, Chao Yu via Linux-f2fs-devel wrote:
> This patch introduces a new flag F2FS_NOLINEAR_LOOKUP_FL, so that we can
> tag casefolded directory w/ it to disable linear lookup functionality,
> it can be used for QA.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/dir.c             |  3 ++-
>  fs/f2fs/f2fs.h            |  2 ++
>  fs/f2fs/file.c            | 36 +++++++++++++++++++++++-------------
>  include/uapi/linux/f2fs.h |  5 +++++
>  4 files changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 54dd52de7269..4c74f29a2c73 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  
>  out:
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (IS_CASEFOLDED(dir) && !de && use_hash) {
> +	if (IS_CASEFOLDED(dir) && !de && use_hash &&
> +				!IS_NOLINEAR_LOOKUP(dir)) {
>  		use_hash = false;
>  		goto start_find_entry;
>  	}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 05879c6dc4d6..787f1e5a52d7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3047,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
>  #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
>  #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
> +#define F2FS_NOLINEAR_LOOKUP_FL		0x08000000 /* do not use linear lookup */
>  #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
>  #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
>  #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
> @@ -3066,6 +3067,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
>  
>  #define IS_DEVICE_ALIASING(inode)	(F2FS_I(inode)->i_flags & F2FS_DEVICE_ALIAS_FL)
> +#define IS_NOLINEAR_LOOKUP(inode)	(F2FS_I(inode)->i_flags & F2FS_NOLINEAR_LOOKUP_FL)
>  
>  static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
>  {
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 014cb7660a9a..1acddc4d11e4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2062,6 +2062,11 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  		}
>  	}
>  
> +	if ((iflags ^ masked_flags) & F2FS_NOLINEAR_LOOKUP_FLAG) {
> +		if (!S_ISDIR(inode->i_mode) || !IS_CASEFOLDED(inode))
> +			return -EINVAL;
> +	}
> +
>  	fi->i_flags = iflags | (fi->i_flags & ~mask);
>  	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
>  					(fi->i_flags & F2FS_NOCOMP_FL));
> @@ -2093,17 +2098,18 @@ static const struct {
>  	u32 iflag;
>  	u32 fsflag;
>  } f2fs_fsflags_map[] = {
> -	{ F2FS_COMPR_FL,	FS_COMPR_FL },
> -	{ F2FS_SYNC_FL,		FS_SYNC_FL },
> -	{ F2FS_IMMUTABLE_FL,	FS_IMMUTABLE_FL },
> -	{ F2FS_APPEND_FL,	FS_APPEND_FL },
> -	{ F2FS_NODUMP_FL,	FS_NODUMP_FL },
> -	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
> -	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
> -	{ F2FS_INDEX_FL,	FS_INDEX_FL },
> -	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
> -	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
> -	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
> +	{ F2FS_COMPR_FL,		FS_COMPR_FL },
> +	{ F2FS_SYNC_FL,			FS_SYNC_FL },
> +	{ F2FS_IMMUTABLE_FL,		FS_IMMUTABLE_FL },
> +	{ F2FS_APPEND_FL,		FS_APPEND_FL },
> +	{ F2FS_NODUMP_FL,		FS_NODUMP_FL },
> +	{ F2FS_NOATIME_FL,		FS_NOATIME_FL },
> +	{ F2FS_NOCOMP_FL,		FS_NOCOMP_FL },
> +	{ F2FS_INDEX_FL,		FS_INDEX_FL },
> +	{ F2FS_DIRSYNC_FL,		FS_DIRSYNC_FL },
> +	{ F2FS_PROJINHERIT_FL,		FS_PROJINHERIT_FL },
> +	{ F2FS_CASEFOLD_FL,		FS_CASEFOLD_FL },
> +	{ F2FS_NOLINEAR_LOOKUP_FL,	F2FS_NOLINEAR_LOOKUP_FL },
>  };
>  
>  #define F2FS_GETTABLE_FS_FL (		\
> @@ -2121,7 +2127,8 @@ static const struct {
>  		FS_INLINE_DATA_FL |	\
>  		FS_NOCOW_FL |		\
>  		FS_VERITY_FL |		\
> -		FS_CASEFOLD_FL)
> +		FS_CASEFOLD_FL |	\
> +		F2FS_NOLINEAR_LOOKUP_FL)
>  
>  #define F2FS_SETTABLE_FS_FL (		\
>  		FS_COMPR_FL |		\
> @@ -2133,7 +2140,8 @@ static const struct {
>  		FS_NOCOMP_FL |		\
>  		FS_DIRSYNC_FL |		\
>  		FS_PROJINHERIT_FL |	\
> -		FS_CASEFOLD_FL)
> +		FS_CASEFOLD_FL |	\
> +		F2FS_NOLINEAR_LOOKUP_FL)
>  
>  /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
>  static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
> @@ -3344,6 +3352,8 @@ int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  		fsflags |= FS_INLINE_DATA_FL;
>  	if (is_inode_flag_set(inode, FI_PIN_FILE))
>  		fsflags |= FS_NOCOW_FL;
> +	if (IS_NOLINEAR_LOOKUP(inode))
> +		fsflags |= F2FS_NOLINEAR_LOOKUP_FL;
>  
>  	fileattr_fill_flags(fa, fsflags & F2FS_GETTABLE_FS_FL);
>  
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 795e26258355..a03626fdcf35 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -104,4 +104,9 @@ struct f2fs_comp_option {
>  	__u8 log_cluster_size;
>  };
>  
> +/* used for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS */
> +enum {
> +	F2FS_NOLINEAR_LOOKUP_FLAG = 0x08000000,
> +};

FS_IOC_GETFLAGS and FS_IOC_SETFLAGS are not filesystem-specific, and the
supported flags are declared in include/uapi/linux/fs.h.  You can't just
randomly give an unused bit a filesystem specific meaning.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
