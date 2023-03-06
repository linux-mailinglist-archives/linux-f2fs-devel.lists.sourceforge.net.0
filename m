Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E86ACFAB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Mar 2023 21:59:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZHvX-0006AH-Sb;
	Mon, 06 Mar 2023 20:59:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pZHvT-0006A9-6x
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 20:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAeor1J5eq+dpswDB1u3ifH+iB+d295TATxlVUbhWG0=; b=YLP7GgiZZ/wacRi6PnxTmM2XH6
 rK4KlSFx7nX8zXvKzSYvJ7W3f/euLhugZ9uCGNH6zdpQVE0NLJnlF9qSqk6H90yJW8IVKT82/OJTP
 lDdkYYTeqpWopwybcSVZYpnhQMDwcsXLwKu/U2smA0Nhrr8rhnuLmtHO/RdK6GaDQZdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAeor1J5eq+dpswDB1u3ifH+iB+d295TATxlVUbhWG0=; b=lkbc7D1tmrfX4iCDp93CKh/wTx
 vpCkeGRBDWrePHUIhUQkarsFPkqASLhSHbzDQBhpqSoFphi3OftD9dmer0WOb3dKnZfkcb2A9p//2
 srLA6T1WkNV6ZfPPImhdLWFz/LBwVdd86lTg+iNqJXr4FoLSaMmMTKcr/kKMom5GogzE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZHvS-001P9o-ET for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 20:59:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FAA2B81128;
 Mon,  6 Mar 2023 20:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3DDC433EF;
 Mon,  6 Mar 2023 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678136350;
 bh=Td2oETyX1QBxClU/naoSicJ6WFgZEGEe5e4OXOkJa10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbfJXqEPx/kpIEhWjonlmITYb/haomjFE6k8TxtuCLtxpHuYSVm9rtmsfrFveQ3Of
 s3qNohojGY6eFs2ZuIsrZwT0UHoNUO3O6ytTPE5ymsYzd3UXFLLfjKAGCOU7yM7/yJ
 bERG1Zts6+DzHZvn9Ax/UVLYaJDwpx5wsWAoSMla7O6pqOzezxpSlwCiY7DLRQbPGu
 m6ipR94qiXqEOc7kYPlhDf144F0kBKEDof9A75AkdSQHV+FpAeWXo2qWT1av7pJGRk
 ygsub/WfCb+SwGI1/MEdBDc+dnZvM4UEMMDpKhGiDhiB0PdaQdgnseOZs32OXxmQvn
 jH2RBXvPz1mmg==
Date: Mon, 6 Mar 2023 12:59:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZAZUHQz1GIpPG4jf@google.com>
References: <20230223073222.81702-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223073222.81702-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/23, Yangtao Li wrote: > We should check quota file ino
 before enable quota, and not only 0. > > BTW fix following check error: >
 > WARNING: Do not crash the kernel unless it is absolutely > unav [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZHvS-001P9o-ET
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check quota inums
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

On 02/23, Yangtao Li wrote:
> We should check quota file ino before enable quota, and not only 0.
> 
> BTW fix following check error:
> 
> WARNING: Do not crash the kernel unless it is absolutely
> unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible)
> instead of BUG() or variants.
> 
> Fixes: ea6767337f86 ("f2fs: support quota sys files")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/super.c | 54 ++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index aa55dc12aff2..c7e0639892e2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2652,22 +2652,40 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
>  	return enabled;
>  }
>  
> +static inline bool f2fs_check_quota_inum(int type, unsigned long qf_inum)
> +{
> +	switch (type) {
> +	case USRQUOTA:
> +		return qf_inum == 4;
> +	case GRPQUOTA:
> +		return qf_inum == 5;
> +	case PRJQUOTA:
> +		return qf_inum == 6;

I don't want to make this dependency of the inode numbers.

> +	default:
> +		return false;
> +	}
> +}
> +
>  static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
>  			     unsigned int flags)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	struct inode *qf_inode;
>  	unsigned long qf_inum;
>  	int err;
>  
> -	BUG_ON(!f2fs_sb_has_quota_ino(F2FS_SB(sb)));
> +	f2fs_bug_on(sbi, !f2fs_sb_has_quota_ino(sbi));
>  
>  	qf_inum = f2fs_qf_ino(sb, type);
> -	if (!qf_inum)
> -		return -EPERM;
> +	if (!f2fs_check_quota_inum(type, qf_inum)) {
> +		f2fs_err(sbi, "Bad quota inum: %lu, type: %d",
> +				qf_inum, type);
> +		return -EFSCORRUPTED;
> +	}
>  
>  	qf_inode = f2fs_iget(sb, qf_inum);
>  	if (IS_ERR(qf_inode)) {
> -		f2fs_err(F2FS_SB(sb), "Bad quota inode %u:%lu", type, qf_inum);
> +		f2fs_err(sbi, "Bad quota inode %u:%lu", type, qf_inum);
>  		return PTR_ERR(qf_inode);
>  	}
>  
> @@ -2682,7 +2700,7 @@ static int f2fs_enable_quotas(struct super_block *sb)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	int type, err = 0;
> -	unsigned long qf_inum;
> +	char count = MAXQUOTAS;
>  	bool quota_mopt[MAXQUOTAS] = {
>  		test_opt(sbi, USRQUOTA),
>  		test_opt(sbi, GRPQUOTA),
> @@ -2696,21 +2714,21 @@ static int f2fs_enable_quotas(struct super_block *sb)
>  
>  	sb_dqopt(sb)->flags |= DQUOT_QUOTA_SYS_FILE;
>  
> -	for (type = 0; type < MAXQUOTAS; type++) {
> -		qf_inum = f2fs_qf_ino(sb, type);
> -		if (qf_inum) {
> -			err = f2fs_quota_enable(sb, type, QFMT_VFS_V1,
> +	if (!f2fs_sb_has_project_quota(sbi))
> +		count--;
> +
> +	for (type = 0; type < count; type++) {
> +		err = f2fs_quota_enable(sb, type, QFMT_VFS_V1,
>  				DQUOT_USAGE_ENABLED |
>  				(quota_mopt[type] ? DQUOT_LIMITS_ENABLED : 0));
> -			if (err) {
> -				f2fs_err(sbi, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
> -					 type, err);
> -				for (type--; type >= 0; type--)
> -					dquot_quota_off(sb, type);
> -				set_sbi_flag(F2FS_SB(sb),
> -						SBI_QUOTA_NEED_REPAIR);
> -				return err;
> -			}
> +		if (err) {
> +			f2fs_err(sbi, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
> +				 type, err);
> +			for (type--; type >= 0; type--)
> +				dquot_quota_off(sb, type);
> +			set_sbi_flag(F2FS_SB(sb),
> +					SBI_QUOTA_NEED_REPAIR);
> +			return err;
>  		}
>  	}
>  	return 0;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
