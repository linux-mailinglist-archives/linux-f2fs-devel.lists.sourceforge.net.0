Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B076D7089
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 01:22:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjpyZ-0004of-Si;
	Tue, 04 Apr 2023 23:22:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pjpyY-0004oZ-3t
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WE06DsiGzkWyBPztpvI7dPFYcEYSnIPzQCWMi3SbTdg=; b=Vq6crUNR4tUY9tvvjJOIq7c/sq
 yrLeeBfFWyZReAmpkgBxn7kavnKu2mJEhEA9AzHrfFHey2UjfI+nAQeZXnkdo/MySjfjokqKUmlDa
 l2pQa6rdk69//d0i1cGjGF+xPXzr9jFDMhjRyYK+rCRp55W3cc+lP8UOxi0YVA2riH0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WE06DsiGzkWyBPztpvI7dPFYcEYSnIPzQCWMi3SbTdg=; b=F+Hf6WSV991X/3YuYAfPCc5BMm
 07etJnJQGmvjqjg3uhU8zkCDHwWhQXQR2Da4jUn4H9p3AwNHRUQGPJ8AQ5C6pG199KgzdzDv+JKt5
 7p1yadLCyWGL4ciciFzS8pIBibglLrKfdP0zVjpDQxqA+EXu4JETxo8EwChyjjzl+0BA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjpyX-0001in-MP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:22:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E42C6343B;
 Tue,  4 Apr 2023 23:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD029C433EF;
 Tue,  4 Apr 2023 23:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680650519;
 bh=x8IC7E1FkVoNUQvJT9/z2Y21e0Mz1+IdIig/qJszVw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8ifUstyPaXndA/90D8GuOl0gsJSWLIXqbvQEjHGmCwpAU0zkQYKO/UsNnon6tWld
 Xd4eTMwrBUiwkKj2/4U4CDT5PQdMPtygcXrZXXPpz6rOqZURoDtFo8aR7dGfFS6guz
 A+cwDtVvT+oRkVAh5k57a3K+DdgeScWW1yFbddp7s45Gb5tZYMSzjk1ZGOi7E8FI1v
 ihdlUbh6+3H5uI0A39UjG7KPJiaoYrqk6uG4+XmzU4HNqbXl0Ty/A574/j55zI3/Y9
 TMPjV7V6YJd/xLb/OTmpeuVwksZ1BO2byjRD+OfbZL82uXT96Fk1mUfIYD9a+QoGXf
 +X8tdg7VhNl1Q==
Date: Tue, 4 Apr 2023 16:21:59 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20230404232159.GB109960@frogsfrogsfrogs>
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-4-zlang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404171411.699655-4-zlang@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
 > The fstests supports different kind of fs testing, better to cc > specific
 fs mailing list for specific fs testing, to get better > review [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjpyX-0001in-MP
Subject: Re: [f2fs-dev] [PATCH 3/5] fstests/MAINTAINERS: add supported
 mailing list
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

On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
> The fstests supports different kind of fs testing, better to cc
> specific fs mailing list for specific fs testing, to get better
> reviewing points. So record these mailing lists and files related
> with them in MAINTAINERS file.
> 
> Signed-off-by: Zorro Lang <zlang@kernel.org>
> ---
> 
> If someone mailing list doesn't want to be in cc list of related fstests
> patch, please reply this email, I'll remove that line.
> 
> Or if I missed someone mailing list, please feel free to tell me.
> 
> Thanks,
> Zorro
> 
>  MAINTAINERS | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09b1a5a3..620368cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -107,6 +107,83 @@ Maintainers List
>  	  should send patch to fstests@ at least. Other relevant mailing list
>  	  or reviewer or co-maintainer can be in cc list.
>  
> +BTRFS
> +L:	linux-btrfs@vger.kernel.org
> +S:	Supported
> +F:	tests/btrfs/
> +F:	common/btrfs
> +
> +CEPH
> +L:	ceph-devel@vger.kernel.org
> +S:	Supported
> +F:	tests/ceph/
> +F:	common/ceph
> +
> +CIFS
> +L:	linux-cifs@vger.kernel.org
> +S:	Supported
> +F:	tests/cifs
> +
> +EXT4
> +L:	linux-ext4@vger.kernel.org
> +S:	Supported
> +F:	tests/ext4/
> +F:	common/ext4
> +
> +F2FS
> +L:	linux-f2fs-devel@lists.sourceforge.net
> +S:	Supported
> +F:	tests/f2fs/
> +F:	common/f2fs
> +
> +FSVERITY
> +L:	fsverity@lists.linux.dev
> +S:	Supported
> +F:	common/verity
> +
> +FSCRYPT
> +L:      linux-fscrypt@vger.kernel.org
> +S:	Supported
> +F:	common/encrypt
> +
> +FS-IDMAPPED
> +L:	linux-fsdevel@vger.kernel.org
> +S:	Supported
> +F:	src/vfs/
> +
> +NFS
> +L:	linux-nfs@vger.kernel.org
> +S:	Supported
> +F:	tests/nfs/
> +F:	common/nfs
> +
> +OCFS2
> +L:	ocfs2-devel@oss.oracle.com
> +S:	Supported
> +F:	tests/ocfs2/
> +
> +OVERLAYFS
> +L:	linux-unionfs@vger.kernel.org
> +S:	Supported
> +F:	tests/overlay
> +F:	common/overlay
> +
> +UDF
> +R:	Jan Kara <jack@suse.com>
> +S:	Supported
> +F:	tests/udf/
> +
> +XFS
> +L:	linux-xfs@vger.kernel.org
> +S:	Supported
> +F:	common/dump
> +F:	common/fuzzy
> +F:	common/inject
> +F:	common/populate

note that populate and fuzzy apply to ext* as well.

> +F:	common/repair
> +F:	common/xfs
> +F:	tests/xfs/

Otherwise looks good to me,

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> +
>  ALL
>  M:	Zorro Lang <zlang@kernel.org>
>  L:	fstests@vger.kernel.org
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
