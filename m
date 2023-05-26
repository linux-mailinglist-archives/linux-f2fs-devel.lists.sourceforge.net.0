Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C028712A96
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 18:25:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2aFf-0006T2-70;
	Fri, 26 May 2023 16:25:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q2aFe-0006Ss-C2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 16:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uV8KtlvTKf7RKsPJYtBKftxJwgFKLN6oT8Zc+eGcVGA=; b=Rxfqw1atxoBEzgqTBJjcG2LNL5
 yJHH2xst/ydbAOVO35xKQsFyR7t4RFeroQj07tUR7sijBCjfOOiW0qJq8kjIV1V9/vWqdEkP2QCdz
 A9/P4djGlxc6+IgN6PL0QGyO4UHwfRmiYynrsauEmqo7rlCGGzuMwZtYIbx66pZ0zvUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uV8KtlvTKf7RKsPJYtBKftxJwgFKLN6oT8Zc+eGcVGA=; b=FQCsoltVsGsZSdvQhLqa26gIob
 ZebVMSLJ9lxDj1PVFFO6eWdfm6vOIPeUhse2ecqd+v5fMWVfbvdOK2wFmy7Wu3JtlA8ssQumT9HHE
 NlvsCLyWnnXw/LjeyKR3gyj9etVR6ceBEJyQFdHd5CdpznKLryoNwr4687cGdpszqHmQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2aFe-0001eq-Er for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 16:25:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 147F86115B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 16:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625D6C4339B;
 Fri, 26 May 2023 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685118308;
 bh=CH1MDjskD9x36rX5dx9t6IlDI/Ls7bSc14xsmmmqqv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fv7GlioCeL6D83fheLY8TeFv6cDtaXkxbO6vBIXeVRCre2IodygtCLyXH7XTIkJLI
 5xN0JdX/NLck+DXRA9sRc2H48dcRYru2mTkrDkiH3RNaY7u3wxkh0FrO3rQlAvqQR0
 zV89hN6KwMrXRrkXVHTqh/JTb6ixTwReuFy2jczKbyjC7LS0ixBVkjDOpvKcPQeapE
 1TANFW36Wa+kMeo9wP+RpcKiJEaMe4GpZD1v/bO5bRclZ0MAaFJGnzGzB79tZrenYF
 g0KO3Y4m4TVGAEAxRBPwn8sPTDdvaEAW9vAEIs7IdFqea9q+16INNYX2/HzkiyCP6D
 LXNZ9/+YBm7dQ==
Date: Fri, 26 May 2023 09:25:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZHDdYjFRwWDcELJw@google.com>
References: <20230526061129.2999437-1-chao@kernel.org>
 <20230526061129.2999437-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526061129.2999437-2-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/26,
 Chao Yu wrote: > Signed-off-by: Chao Yu <chao@kernel.org>
 > --- > fsck/mount.c | 56 +++++++++++++ > include/f2fs_fs.h | 42
 +++++++++++++++++++++ [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2aFe-0001eq-Er
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs-tools: reuse feature_table in
 print_sb_state()
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

On 05/26, Chao Yu wrote:
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/mount.c      | 56 +++++++++++++----------------------------------
>  include/f2fs_fs.h | 42 +++++++++++++++++++++--------------
>  2 files changed, 41 insertions(+), 57 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 70e8b46..60ad493 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -599,54 +599,28 @@ void print_cp_state(u32 flag)
>  	MSG(0, "\n");
>  }
>  
> +extern struct feature feature_table[];
>  void print_sb_state(struct f2fs_super_block *sb)
>  {
>  	unsigned int f = get_sb(feature);
> +	char *name;
>  	int i;
>  
>  	MSG(0, "Info: superblock features = %x : ", f);
> -	if (f & F2FS_FEATURE_ENCRYPT) {
> -		MSG(0, "%s", " encrypt");
> -	}
> -	if (f & F2FS_FEATURE_VERITY) {
> -		MSG(0, "%s", " verity");
> -	}
> -	if (f & F2FS_FEATURE_BLKZONED) {
> -		MSG(0, "%s", " blkzoned");
> -	}
> -	if (f & F2FS_FEATURE_EXTRA_ATTR) {
> -		MSG(0, "%s", " extra_attr");
> -	}
> -	if (f & F2FS_FEATURE_PRJQUOTA) {
> -		MSG(0, "%s", " project_quota");
> -	}
> -	if (f & F2FS_FEATURE_INODE_CHKSUM) {
> -		MSG(0, "%s", " inode_checksum");
> -	}
> -	if (f & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) {
> -		MSG(0, "%s", " flexible_inline_xattr");
> -	}
> -	if (f & F2FS_FEATURE_QUOTA_INO) {
> -		MSG(0, "%s", " quota_ino");
> -	}
> -	if (f & F2FS_FEATURE_INODE_CRTIME) {
> -		MSG(0, "%s", " inode_crtime");
> -	}
> -	if (f & F2FS_FEATURE_LOST_FOUND) {
> -		MSG(0, "%s", " lost_found");
> -	}
> -	if (f & F2FS_FEATURE_SB_CHKSUM) {
> -		MSG(0, "%s", " sb_checksum");
> -	}
> -	if (f & F2FS_FEATURE_CASEFOLD) {
> -		MSG(0, "%s", " casefold");
> -	}
> -	if (f & F2FS_FEATURE_COMPRESSION) {
> -		MSG(0, "%s", " compression");
> -	}
> -	if (f & F2FS_FEATURE_RO) {
> -		MSG(0, "%s", " ro");
> +
> +	for (i = 0; i < 32; i++) {

Need to add a definition for 32?

> +		unsigned int bit = 1 << i;
> +
> +		if (!(f & bit))
> +			continue;
> +
> +		name = feature_name(feature_table, bit);
> +		if (!name)
> +			continue;
> +
> +		MSG(0, " %s", name);
>  	}
> +
>  	MSG(0, "\n");
>  	MSG(0, "Info: superblock encrypt level = %d, salt = ",
>  					sb->encryption_level);
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 9d35b42..a97c974 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1811,35 +1811,45 @@ static inline void f2fs_init_inode(struct f2fs_super_block *sb,
>  
>  struct feature {
>  	char *name;
> -	u32  mask;
> +	u32 mask;
> +	u32 settable;
>  };
>  
>  #define INIT_FEATURE_TABLE						\
>  struct feature feature_table[] = {					\
> -	{ "encrypt",			F2FS_FEATURE_ENCRYPT },		\
> -	{ "extra_attr",			F2FS_FEATURE_EXTRA_ATTR },	\
> -	{ "project_quota",		F2FS_FEATURE_PRJQUOTA },	\
> -	{ "inode_checksum",		F2FS_FEATURE_INODE_CHKSUM },	\
> -	{ "flexible_inline_xattr",	F2FS_FEATURE_FLEXIBLE_INLINE_XATTR },\
> -	{ "quota",			F2FS_FEATURE_QUOTA_INO },	\
> -	{ "inode_crtime",		F2FS_FEATURE_INODE_CRTIME },	\
> -	{ "lost_found",			F2FS_FEATURE_LOST_FOUND },	\
> -	{ "verity",			F2FS_FEATURE_VERITY },	/* reserved */ \
> -	{ "sb_checksum",		F2FS_FEATURE_SB_CHKSUM },	\
> -	{ "casefold",			F2FS_FEATURE_CASEFOLD },	\
> -	{ "compression",		F2FS_FEATURE_COMPRESSION },	\
> -	{ "ro",				F2FS_FEATURE_RO},		\
> -	{ NULL,				0x0},				\
> +	{ "encrypt",			F2FS_FEATURE_ENCRYPT,		1}, \
> +	{ "blkzoned",			F2FS_FEATURE_BLKZONED,		0}, \
> +	{ "extra_attr",			F2FS_FEATURE_EXTRA_ATTR,	1}, \
> +	{ "project_quota",		F2FS_FEATURE_PRJQUOTA,		1}, \
> +	{ "inode_checksum",		F2FS_FEATURE_INODE_CHKSUM,	1}, \
> +	{ "flexible_inline_xattr",	F2FS_FEATURE_FLEXIBLE_INLINE_XATTR,1}, \
> +	{ "quota",			F2FS_FEATURE_QUOTA_INO,		1}, \
> +	{ "inode_crtime",		F2FS_FEATURE_INODE_CRTIME,	1}, \
> +	{ "lost_found",			F2FS_FEATURE_LOST_FOUND,	1}, \
> +	{ "verity",			F2FS_FEATURE_VERITY,		1}, \
> +	{ "sb_checksum",		F2FS_FEATURE_SB_CHKSUM,		1}, \
> +	{ "casefold",			F2FS_FEATURE_CASEFOLD,		1}, \
> +	{ "compression",		F2FS_FEATURE_COMPRESSION,	1}, \
> +	{ "ro",				F2FS_FEATURE_RO,		1}, \
> +	{ NULL,				0x0,				0}, \
>  };
>  
>  static inline u32 feature_map(struct feature *table, char *feature)
>  {
>  	struct feature *p;
> -	for (p = table; p->name && strcmp(p->name, feature); p++)
> +	for (p = table; p->name && p->settable && strcmp(p->name, feature); p++)
>  		;
>  	return p->mask;
>  }
>  
> +static inline char *feature_name(struct feature *table, u32 mask)
> +{
> +	struct feature *p;
> +	for (p = table; p->name && p->mask != mask; p++)
> +		;
> +	return p->name;
> +}
> +
>  static inline int set_feature_bits(struct feature *table, char *features)
>  {
>  	u32 mask = feature_map(table, features);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
