Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1774896379
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 06:25:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrsBX-0006HN-Q1;
	Wed, 03 Apr 2024 04:25:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rrsBW-0006HG-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6LS5USxJ6e48LvOdRpgYeEm14QQWloJhhKvq1gtcOnU=; b=m7BpGb8upiwLhY1fUKOurM4g7N
 wcGenGExl1+kH1wcZfDOZXdmxGLXihsO2KqFdR9fn9Ez+tKq7SYKQOOW12+EnYRuFLHb0U8mnwLsh
 JyLf2JaMDlB1vy8KTTgy6w8tjeJ3mMOeKU1QyTmssKVt2MdXoh9O/8p7cSCFb5NVlAtY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6LS5USxJ6e48LvOdRpgYeEm14QQWloJhhKvq1gtcOnU=; b=EMLlR2BudiL7UcE7fH3Rb8G5sI
 o30JWkCcfBxjwolAG99bojufeCIkoohU/X2UPrQ2XvSUJ4rXGI+7ngbhm7FNN1HTube4YVw7+bC5i
 c0mZnuR/1jaDVEc3iWqiOBS41fe8nlZoHCeG1ksFC/ZjhxhRsNcalcDF5Gks5D423Kp4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrsBV-0000Pb-Kc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 253BDCE1F78;
 Wed,  3 Apr 2024 04:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF21C433F1;
 Wed,  3 Apr 2024 04:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712118306;
 bh=27PJXlFeNKBe1eRs9ajk0Z8dVhFuZhGUa2ciqtrxJUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGYjykf8xUP28dLNpzEOeR559qH0dVuXx3jUBB+lk0AIfsJnvkcw1Pf5A/BT202mS
 acUS5SoH8R4mzo/QFfq6G99rBmCYCQ9F/68YTAglo5QE7bziXd5UvkseOWuVP/Zj5C
 91UG4Ji4RybN/93qed4vwq5MCONqUjXbS6RrNT+QcStbTU7jtG36+joMPBrXSFbSOm
 DMZFRm3d6FcZFHLalvIbdG13Ah2Rjk78vIpJAzducPLii76qp0D81wqKKOk2/C3h4k
 IgxdL3btyLh1ZPZ6XTKhQ2vGy1li5WS6QekZ05HViueYLXjvpRtMW9BDIDQo6Ej794
 A0e26cckwYECA==
Date: Tue, 2 Apr 2024 21:25:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240403042503.GI2576@sol.localdomain>
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-8-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402154842.508032-8-eugen.hristev@collabora.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 02, 2024 at 06:48:40PM +0300, Eugen Hristev via
 Linux-f2fs-devel wrote: > If the volume is in strict mode, generi c_ci_compare
 can report a broken > encoding name. This will not trigger on [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rrsBV-0000Pb-Kc
Subject: Re: [f2fs-dev] [PATCH v15 7/9] f2fs: Log error when lookup of
 encoded dentry fails
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 02, 2024 at 06:48:40PM +0300, Eugen Hristev via Linux-f2fs-devel wrote:
> If the volume is in strict mode, generi c_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
> 
> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/f2fs/dir.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 88b0045d0c4f..64286d80dd30 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -192,11 +192,16 @@ static inline int f2fs_match_name(const struct inode *dir,
>  	struct fscrypt_name f;
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (fname->cf_name.name)
> -		return generic_ci_match(dir, fname->usr_fname,
> -					&fname->cf_name,
> -					de_name, de_name_len);
> -
> +	if (fname->cf_name.name) {
> +		int ret = generic_ci_match(dir, fname->usr_fname,
> +					   &fname->cf_name,
> +					   de_name, de_name_len);
> +		if (ret == -EINVAL)
> +			f2fs_warn(F2FS_SB(dir->i_sb),
> +				"Directory contains filename that is invalid UTF-8");
> +

Shouldn't this use f2fs_warn_ratelimited?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
