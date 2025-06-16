Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29BADB095
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 14:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1DnQewn8hnN628ld/lIfpidsPUfO7jL1SgOCd6+/DE=; b=iWM3X4bd9Bz2DuT232B8MriaRk
	y7OkRcmNHgkpitdyEPuIfQw4yiGwvtXHQsc+VAqgI6az+GrY09GWjzmYxQSmf7VKO2HBcUO9FUM2E
	GnW4v/oFIbiKp8VJeYj82NR8fIw8jxgNArRg/ooNLmXSVpu7qL5qD+/Mppv+6MOU0Q2o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uR9IE-0005g1-9w;
	Mon, 16 Jun 2025 12:50:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uR9ID-0005ft-6t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uEadjVYSJGfPF6E9DflBqLdTmwiNcyfDmY6iOR3xzag=; b=Fmm2u4aKWYr/cdldtPAyp1W9Qg
 202h4tmKWABjxx+3NyjZt8yFny6KR7qCjokeI4qYT8cWUbuRb5hjfmLThpbQwwYwbG5vCPOUoXUge
 eG69xs+r2NHoBkOnB+i+t7e+5RMe7MikHipXkQUrp3P8k1WX7qd/RhA3iHIKRfDB+YsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uEadjVYSJGfPF6E9DflBqLdTmwiNcyfDmY6iOR3xzag=; b=gURMLyBVVYd3gOoDXAyA8mR/d7
 e2vmwl8VhNyyYfEF1dZjBxZjWQGOQuZtoo4qS0lrUG1E/UPL9yGIvXS1/znUtUHUA1McewDDKgmPI
 PhYF4a6E3SCSBxebCSI4c3rkKQeEHa2xMy57ChszhKxdQGhCIMnPOrttloan5G6w9guQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uR9IC-0007uu-Kh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ED0BEA50563;
 Mon, 16 Jun 2025 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6142EC4CEEA;
 Mon, 16 Jun 2025 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750078217;
 bh=5B0GDypy6woAYzSY9aHY7htf77d3A3ENXwrDkuTjJK8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ao/+Im09ikS3XYNJif4IPzCZVPI1rLzBr2hkK5fQi5W+mQhbzAjuFoCmdVYUus5G5
 iAsrj9MC5DiaqctCBweLZ9P0wrywMKO9w1CHFmM4gQoV2uSfqzAptfRc1AIAcUL6Am
 zuKvJC4174ktQCdROvzMsSLvGQ5D/+FG6qNiTRRMRjCTTEBe9WR0hrf9mp5qgi0xNn
 gYvmNk805qMhSUBPKNt7+uDd5FszJx+mmK+hWdE189GL2AUw722N7SYEpthsERw0R/
 OgLPmJQ8j6iL7tVXud3Epilgoybkzl1tmYP/KqpPBZJb9LUNpiqmBuvLi/IZAsyVSs
 myTmzPYTwBwlg==
Message-ID: <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
Date: Mon, 16 Jun 2025 20:50:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-3-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250615144235.1836469-3-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/25 22:42, Daniel Lee wrote: > Apply the `ioprio_hint`
 to set `F2FS_IOPRIO_WRITE` priority > on files identified as "hot" at creation
 and on files that are > pinned via ioctl. > > Signed-off-by [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uR9IC-0007uu-Kh
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use ioprio hint for hot and
 pinned files
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/15/25 22:42, Daniel Lee wrote:
> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
> on files identified as "hot" at creation and on files that are
> pinned via ioctl.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
>  fs/f2fs/file.c  |  3 +++
>  fs/f2fs/namei.c | 11 +++++++----
>  3 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3e02687c1b58..0c4f52892ff7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode, int type)
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  }
>  
> +static inline int get_ioprio(struct inode *inode)
> +{
> +	return F2FS_I(inode)->ioprio_hint;
> +}
> +
> +static inline void set_ioprio(struct inode *inode, int level)
> +{
> +	if (get_ioprio(inode) == level)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = level;
> +}
> +
> +static inline void clear_ioprio(struct inode *inode)
> +{
> +	if (get_ioprio(inode) == 0)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = 0;
> +}
> +
>  static inline void clear_file(struct inode *inode, int type)
>  {
>  	if (!is_file(inode, type))
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 3eb40d7bf602..a18fb7f3d019 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  
>  	if (!pin) {
>  		clear_inode_flag(inode, FI_PIN_FILE);
> +		clear_ioprio(inode);

I guess there are more places clearing FI_PIN_FILE? we need to cover
them all?

>  		f2fs_i_gc_failures_write(inode, 0);
>  		goto done;
>  	} else if (f2fs_is_pinned_file(inode)) {
> @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  	}
>  
>  	set_inode_flag(inode, FI_PIN_FILE);
> +	file_set_hot(inode);

Unnecessary file_set_hot() invoking? Or am I missing anything?

Thanks,

> +	set_ioprio(inode, F2FS_IOPRIO_WRITE);
>  	ret = F2FS_I(inode)->i_gc_failures;
>  done:
>  	f2fs_update_time(sbi, REQ_TIME);
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 07e333ee21b7..0f96a0b86c40 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>  }
>  
>  /*
> - * Set file's temperature for hot/cold data separation
> + * Set file's temperature (for hot/cold data separation) and
> + * I/O priority, based on filename extension
>   */
> -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
> +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
>  		const unsigned char *name)
>  {
>  	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>  
>  	if (i < cold_count)
>  		file_set_cold(inode);
> -	else
> +	else {
>  		file_set_hot(inode);
> +		set_ioprio(inode, F2FS_IOPRIO_WRITE);
> +	}
>  }
>  
>  static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
> @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>  		set_inode_flag(inode, FI_INLINE_DATA);
>  
>  	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
> -		set_file_temperature(sbi, inode, name);
> +		set_file_temp_prio(sbi, inode, name);
>  
>  	stat_inc_inline_xattr(inode);
>  	stat_inc_inline_inode(inode);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
