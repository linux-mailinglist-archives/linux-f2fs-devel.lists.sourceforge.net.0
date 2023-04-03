Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA56D500D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 20:10:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjOdg-0006dC-Gl;
	Mon, 03 Apr 2023 18:10:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pjOdV-0006cv-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cI2KsHBwVQKXhtouWr5xZr93PSnhAb7eFgwOxWUrcd0=; b=YNt1MpsD28t/0KK3ku8Hzt+zMJ
 NrcFDJSPPWG9sckQSyv2hapKnNxwhNN6RFvNLBXHo/hNB6eMQJ7ifGRog0F0XpF993l33HHYdxxpH
 Oyzk60Pd5s/WrtjJ/5ewAlD1NJpasc/9Ul8O+nATjAr3oUyXJQLHikIo/FopU7Xz5oi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cI2KsHBwVQKXhtouWr5xZr93PSnhAb7eFgwOxWUrcd0=; b=Zq54kYwP6EakbI7RWqZhTZvukV
 3qRJv/3vFkv2+a10EFGd84qk1Gyqnen2xNg7xuZqX9SmqMHpVxuHB0VPgj8GIkoD5/ajHP66HHqlD
 1QjxrWxgNx66b25lsMsdQZmkBtn4Fduj4VCu6G/COxdS1Jjj2vB2YHuvBA6NdL+BwAC8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjOdV-00DxJf-3d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:10:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBD6062447;
 Mon,  3 Apr 2023 18:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247DFC433D2;
 Mon,  3 Apr 2023 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680545426;
 bh=daLpp3WUpqjgWJJmWb1z5abAtZoFEkpvYCCCUtguGOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eXlEabf8s3RtJX/cE9d4gWt9IF/qXLe6MUDaK7IqBn2wtC1LlnwuwRfq+GWcNRwYp
 EalbBiuo40fb5kjEEpdcjbVbJUkFX2lGDEDhir90TldsyA0Ja9w3kRD+Hc6KaElqOa
 nsJVRbimhCkzQgJO93eb4F9W76miiC0GprQG1hlNHyNGHZvodosuuaCCGdGDd6ytt6
 /t8qeDuwPn8j4TsaFg7aleVY2ru69LEhxQ4103BdDpPzmtfFbwFTtJQ5qPFwACyftZ
 3JUn8hAFXvhmjNtF9xtFniXugal5BpdhcIs3NUp8ENG/yOgM5A4EFCII6svSeC2YzR
 Ua0xutcIOw4mg==
Date: Mon, 3 Apr 2023 11:10:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZCsWkOFbn/x4tLp5@google.com>
References: <20230403084055.21482-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403084055.21482-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/03, Yangtao Li wrote: > There is only single instance
 of these ops, so remove the indirection > and call get_victim_by_default
 directly. Originally this was intended to give a chance to provide other
 allocation
 option. Anyway, it seems quit hard to do it anymore. Minor tip is it'd be
 better to rename it to f2fs_get_victim(). 
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
X-Headers-End: 1pjOdV-00DxJf-3d
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove struct victim_selection
 default_v_ops
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

On 04/03, Yangtao Li wrote:
> There is only single instance of these ops, so remove the indirection
> and call get_victim_by_default directly.

Originally this was intended to give a chance to provide other allocation
option. Anyway, it seems quit hard to do it anymore.
Minor tip is it'd be better to rename it to f2fs_get_victim().

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/f2fs.h    |  5 ++++-
>  fs/f2fs/gc.c      | 12 +++---------
>  fs/f2fs/segment.c |  7 ++++---
>  fs/f2fs/segment.h |  7 -------
>  4 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8d5124569a03..9a1ec5515121 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3871,7 +3871,10 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
>  int __init f2fs_create_garbage_collection_cache(void);
>  void f2fs_destroy_garbage_collection_cache(void);
> -
> +/* victim selection function for cleaning and SSR */
> +int get_victim_by_default(struct f2fs_sb_info *sbi, unsigned int *result,
> +				int gc_type, int type,
> +				char alloc_mode, unsigned long long age);
>  /*
>   * recovery.c
>   */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f1e0e01a5dd1..f3f0020633ad 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -741,7 +741,7 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
>   * When it is called from SSR segment selection, it finds a segment
>   * which has minimum valid blocks and removes it from dirty seglist.
>   */
> -static int get_victim_by_default(struct f2fs_sb_info *sbi,
> +int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			unsigned int *result, int gc_type, int type,
>  			char alloc_mode, unsigned long long age)
>  {
> @@ -937,10 +937,6 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  	return ret;
>  }
>  
> -static const struct victim_selection default_v_ops = {
> -	.get_victim = get_victim_by_default,
> -};
> -
>  static struct inode *find_gc_inode(struct gc_inode_list *gc_list, nid_t ino)
>  {
>  	struct inode_entry *ie;
> @@ -1671,8 +1667,8 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
>  	int ret;
>  
>  	down_write(&sit_i->sentry_lock);
> -	ret = DIRTY_I(sbi)->v_ops->get_victim(sbi, victim, gc_type,
> -					      NO_CHECK_TYPE, LFS, 0);
> +	ret = get_victim_by_default(sbi, victim, gc_type,
> +					NO_CHECK_TYPE, LFS, 0);
>  	up_write(&sit_i->sentry_lock);
>  	return ret;
>  }
> @@ -1969,8 +1965,6 @@ static void init_atgc_management(struct f2fs_sb_info *sbi)
>  
>  void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  {
> -	DIRTY_I(sbi)->v_ops = &default_v_ops;
> -
>  	sbi->gc_pin_file_threshold = DEF_GC_FAILED_PINNED_FILES;
>  
>  	/* give warm/cold data area from slower device */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index cb8aacbc5df6..c9e674fe477b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2881,7 +2881,6 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
>  				int alloc_mode, unsigned long long age)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> -	const struct victim_selection *v_ops = DIRTY_I(sbi)->v_ops;
>  	unsigned segno = NULL_SEGNO;
>  	unsigned short seg_type = curseg->seg_type;
>  	int i, cnt;
> @@ -2890,7 +2889,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
>  	sanity_check_seg_type(sbi, seg_type);
>  
>  	/* f2fs_need_SSR() already forces to do this */
> -	if (!v_ops->get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
> +	if (!get_victim_by_default(sbi, &segno, BG_GC,
> +			seg_type, alloc_mode, age)) {
>  		curseg->next_segno = segno;
>  		return 1;
>  	}
> @@ -2917,7 +2917,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
>  	for (; cnt-- > 0; reversed ? i-- : i++) {
>  		if (i == seg_type)
>  			continue;
> -		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
> +		if (!get_victim_by_default(sbi, &segno, BG_GC,
> +				i, alloc_mode, age)) {
>  			curseg->next_segno = segno;
>  			return 1;
>  		}
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index d66c9b636708..89619969ec85 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -289,7 +289,6 @@ enum dirty_type {
>  };
>  
>  struct dirty_seglist_info {
> -	const struct victim_selection *v_ops;	/* victim selction operation */
>  	unsigned long *dirty_segmap[NR_DIRTY_TYPE];
>  	unsigned long *dirty_secmap;
>  	struct mutex seglist_lock;		/* lock for segment bitmaps */
> @@ -300,12 +299,6 @@ struct dirty_seglist_info {
>  	bool enable_pin_section;		/* enable pinning section */
>  };
>  
> -/* victim selection function for cleaning and SSR */
> -struct victim_selection {
> -	int (*get_victim)(struct f2fs_sb_info *, unsigned int *,
> -					int, int, char, unsigned long long);
> -};
> -
>  /* for active log information */
>  struct curseg_info {
>  	struct mutex curseg_mutex;		/* lock for consistency */
> -- 
> 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
