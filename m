Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F596D709F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 01:23:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjpzg-0006sZ-By;
	Tue, 04 Apr 2023 23:23:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pjpzZ-0006rY-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SppiAf9Jzlp2TmQ4w0B7l6YumWIpeqsGclP/mMRD6/0=; b=moNj7qkl/X4xRS/f442jOtFFma
 g5ENNyc91PT9ALt1s3kYwfAjv55yDz2H3932CREXgOKplFvu79nOMXPICmTVmfD9PEkRA/g/ewyaB
 Dn0G4pnkD3uHCNu9jsUP+B3OuVjn6b3l3tMujrcel6+bsSrVcbml8gQs0buJTMqzzSCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SppiAf9Jzlp2TmQ4w0B7l6YumWIpeqsGclP/mMRD6/0=; b=Fn1dmqnmLqNRIs3XGpTYyMU7ud
 G8qBdg2bm55ZYer0HQHAEs72uNzcxNhMUKMVcU6cOIJa1ThOqY7tgsavCQOack4fVuLHAe9ceQ1hc
 MVOnmg0jHlAkYYpwQhBvPs9hnnwhRar+JqjUkvSw9AGuaYdIlSPPgJ9wNHnC1rpl3DTs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjpzY-0001m7-Gm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:23:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24045634B7;
 Tue,  4 Apr 2023 23:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3E7C433EF;
 Tue,  4 Apr 2023 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680650582;
 bh=n/9jmBZO4HC87mIQyzeLEmcpGLyNDj01f1vbSC9mn1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5+6maz5xNhwYCtGwMq8kBY6ewuVOIdTUKUDsuMQwiiVGRZ4JLKIYUBPjB2R83qK2
 jmGenLfcD91UqsPu8iPNLDQItXW3gHeC3I3+QXoAFh+P/RTje+RB6N+AVCH6go5t7H
 lFGiVsSBrnYilekJWLE6vxyxrlVTrpCB4T4Y9zy6W5+71+O7LZHNDuLkkIeCmSFMdd
 LnjJ5ISVLkFIasoDRJ2L6Z+C/842tcZjmW0jqL8fTsEkpwRvnDkEqNPwfaJWuniC/G
 qFkKLchRB/hFADz1nfVP1I1Ba9kxaadE3S8FPdnJd+Kyn/HycjKR2qAf5p461PbUhh
 fEgpj2mzxoQVg==
Date: Tue, 4 Apr 2023 16:23:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20230404232302.GD109960@frogsfrogsfrogs>
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-5-zlang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404171411.699655-5-zlang@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 01:14:10AM +0800, Zorro Lang wrote:
 > Some people contribute to someone specific fs testing mostly, record >
 some of them as Reviewer. > > Signed-off-by: Zorro Lang <zlang@kern [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjpzY-0001m7-Gm
Subject: Re: [f2fs-dev] [PATCH 4/5] fstests/MAINTAINERS: add some specific
 reviewers
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
Cc: brauner@kernel.org, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ebiggers@google.com, amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, fdmanana@suse.com, ocfs2-devel@oss.oracle.com,
 jack@suse.com, linux-fsdevel@vger.kernel.org, anand.jain@oracle.com,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 01:14:10AM +0800, Zorro Lang wrote:
> Some people contribute to someone specific fs testing mostly, record
> some of them as Reviewer.
> 
> Signed-off-by: Zorro Lang <zlang@kernel.org>
> ---
> 
> If someone doesn't want to be in cc list of related fstests patch, please
> reply this email, I'll remove that reviewer line.
> 
> Or if someone else (who contribute to fstests very much) would like to a
> specific reviewer, nominate yourself to get a review.
> 
> Thanks,
> Zorro
> 
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 620368cb..0ad12a38 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -108,6 +108,7 @@ Maintainers List
>  	  or reviewer or co-maintainer can be in cc list.
>  
>  BTRFS
> +R:	Filipe Manana <fdmanana@suse.com>
>  L:	linux-btrfs@vger.kernel.org
>  S:	Supported
>  F:	tests/btrfs/
> @@ -137,16 +138,19 @@ F:	tests/f2fs/
>  F:	common/f2fs
>  
>  FSVERITY
> +R:	Eric Biggers <ebiggers@google.com>
>  L:	fsverity@lists.linux.dev
>  S:	Supported
>  F:	common/verity
>  
>  FSCRYPT
> +R:	Eric Biggers <ebiggers@google.com>
>  L:      linux-fscrypt@vger.kernel.org
>  S:	Supported
>  F:	common/encrypt
>  
>  FS-IDMAPPED
> +R:	Christian Brauner <brauner@kernel.org>
>  L:	linux-fsdevel@vger.kernel.org
>  S:	Supported
>  F:	src/vfs/
> @@ -163,6 +167,7 @@ S:	Supported
>  F:	tests/ocfs2/
>  
>  OVERLAYFS
> +R:	Amir Goldstein <amir73il@gmail.com>
>  L:	linux-unionfs@vger.kernel.org
>  S:	Supported
>  F:	tests/overlay
> @@ -174,6 +179,7 @@ S:	Supported
>  F:	tests/udf/
>  
>  XFS
> +R:	Darrick J. Wong <djwong@kernel.org>

For this one hunk,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

>  L:	linux-xfs@vger.kernel.org
>  S:	Supported
>  F:	common/dump
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
