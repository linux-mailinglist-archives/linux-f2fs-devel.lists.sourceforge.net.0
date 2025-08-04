Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E22B19BA3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 08:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OQqwDcs0Xh4AW5o5L1P1LhxBHSJ42k6zFjiRbua7X4=; b=jcY9fZKyvf8XzlE0/IPe73+5Tj
	ACFsiP2O/DWctpZz8GybHrYyY1H5usJaSJlmIFwY2sXLadHdPHaSe3yHU5k3Tcj88xn1dZBI5giVJ
	LoZwZryNDr8XqcpELG63AYtsx6E3D91jIFAY2FF1cZldZ5uXuwG/IfQfDL4kEEvGfUNI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uioo1-0001IF-00;
	Mon, 04 Aug 2025 06:36:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uiony-0001I3-Nk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gxw47r7vytOmLC8S+S782bV+EuBTtGT2uAeXgySSDy4=; b=WroLxWgz1DeOL4xNWqzFQdYZV7
 rUp86WA6cR535Ex9qIFfI+8CiTG+iLLTrtW9pEfKOzYYeUSvcg/UnnndMfptuferCBqGD/Zthhgfl
 wneH1sGQWtW67cMVFv6XFv2DKgyJuaIBRs5jw044PH8mEspxxooyfgh+h0Bo7CE88QcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gxw47r7vytOmLC8S+S782bV+EuBTtGT2uAeXgySSDy4=; b=Z2gYZujkxPgNUwiuPFb9zNlsmm
 n+vMS/q+n/jHk9EG6P+iGGRMx6+quUW+BqShyzAC1QjeBYP4NpvPINK6jjW7SUOiuj3fJm5TUmxZE
 FxGYYniJY4PYplF16wca0H1NoMR5CuuYihsoqqSXC4SS/SMPuaaSh03276e2+2OyEr5I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uiony-00019w-8i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDA6C5C4926;
 Mon,  4 Aug 2025 06:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE0CC4CEE7;
 Mon,  4 Aug 2025 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754289367;
 bh=xWUKsu37RY2bqm4n6MvNMO5+hGMcJNhFHMo1GtEmpaU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lxp6jCAcMl5n92cwpAJR42eWzvc2HkTa/WZk8TJhsfgIv+BP6jMkJqW4OcxKmdOeB
 SSWWpHgRLvxOcY530Dt/+tQkklRnWBOCTNd1KWFLZNN3Dxsl0ts65KxfJj2Q/p+ImX
 4Sye6etRk1NxM6auaMotIUugB9YHMXolvIxmEiaFNdV9d+mvzA6ug6xdf6fmbkZTne
 jtPVEyVwlTuUStKBOduPVJg9D6+6KNiWaoGA+yFPzrdtLdtr6gnc0La3vKQoq1LZQP
 xlrAJXG+6M2XANuxma+BJGBHycApqmsU5MJUJsWic4sSJ8ZAD/l59mu42YXWcVC0jq
 lC2ixDyPWVUHA==
Message-ID: <785306c5-27ba-4a18-b702-1d943c484a56@kernel.org>
Date: Mon, 4 Aug 2025 14:36:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250804060327.512247-1-chullee@google.com>
 <20250804060327.512247-2-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250804060327.512247-2-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/4/25 14:03, Daniel Lee wrote: > This commit introduces
 a new read-only sysfs entry at > /sys/fs/f2fs/<device>/effective_lookup_mode.
 > > This entry displays the actual directory lookup mode F2FS [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uiony-00019w-8i
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add sysfs entry for effective
 lookup mode
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

On 8/4/25 14:03, Daniel Lee wrote:
> This commit introduces a new read-only sysfs entry at
> /sys/fs/f2fs/<device>/effective_lookup_mode.
> 
> This entry displays the actual directory lookup mode F2FS is
> currently using. This is needed for debugging and verification,
> as the behavior is determined by both on-disk flags and mount
> options.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
>  fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..e847a50e7403 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,17 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>  		SB_ENC_STRICT_MODE_FL            0x00000001
>  		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>  		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/effective_lookup_mode
> +Date:		August 2025
> +Contact:	"Daniel Lee" <chullee@google.com>
> +Description:
> +		This is a read-only entry to show the effective directory lookup mode
> +		F2FS is currently using for casefolded directories.
> +		This considers both the "lookup_mode" mount option and the on-disk
> +		encoding flag, SB_ENC_NO_COMPAT_FALLBACK_FL.
> +
> +		Possible values are:
> +		- "perf": Hash-only lookup.
> +		- "compat": Hash-based lookup with a linear search fallback enabled
> +		  for casefolded directories.

Any way to know whether "perf" or "compat" comes from auto mode or not? something
like "auto:perf", "auto:compat", maybe?

Thanks,

> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..9897dd8564e0 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -281,6 +281,22 @@ static ssize_t encoding_flags_show(struct f2fs_attr *a,
>  		le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_encoding_flags));
>  }
>  
> +static ssize_t effective_lookup_mode_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	switch (f2fs_get_lookup_mode(sbi)) {
> +	case LOOKUP_PERF:
> +		return sysfs_emit(buf, "perf\n");
> +	case LOOKUP_COMPAT:
> +		return sysfs_emit(buf, "compat\n");
> +	case LOOKUP_AUTO:
> +		if (sb_no_casefold_compat_fallback(sbi->sb))
> +			return sysfs_emit(buf, "perf\n");
> +		return sysfs_emit(buf, "compat\n");
> +	}
> +	return 0;
> +}
> +
>  static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
> @@ -1166,6 +1182,7 @@ F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
>  F2FS_GENERAL_RO_ATTR(unusable);
>  F2FS_GENERAL_RO_ATTR(encoding);
>  F2FS_GENERAL_RO_ATTR(encoding_flags);
> +F2FS_GENERAL_RO_ATTR(effective_lookup_mode);
>  F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>  F2FS_GENERAL_RO_ATTR(main_blkaddr);
>  F2FS_GENERAL_RO_ATTR(pending_discard);
> @@ -1282,6 +1299,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(current_reserved_blocks),
>  	ATTR_LIST(encoding),
>  	ATTR_LIST(encoding_flags),
> +	ATTR_LIST(effective_lookup_mode),
>  	ATTR_LIST(mounted_time_sec),
>  #ifdef CONFIG_F2FS_STAT_FS
>  	ATTR_LIST(cp_foreground_calls),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
