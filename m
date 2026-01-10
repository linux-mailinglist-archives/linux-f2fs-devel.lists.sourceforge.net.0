Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E1D0CBA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jan 2026 02:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPx+YDAk775kddBzxMZ03JK5pDN/Ef2BF61LYhirCoM=; b=UfHYfsxlhQWWrZ3/Jw7Amav9QD
	mngdAAWkOLbEKPL/rzql8zej0Pzd9sze02P5AQ6ZCiFJpAyGivEyP7VJIuoXsnLcbK/W07se4U97H
	1FsI5YnZwW+N6pNNLKQxd0WahRDOcq397k6O2QBTsj+JadTnZVB88i+Xc4lNxXXuzElY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1veNvi-0007ai-N4;
	Sat, 10 Jan 2026 01:38:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1veNvg-0007ab-Pa
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 10 Jan 2026 01:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOwesAW0AJASOZFAIF1+kfgwwEixSeh9W22TJpOe3QQ=; b=Wh0hGAQd8y6/B796vlf/J81EeQ
 AdS9w9XiAeX/k6M0L50dJYJhbN0oVFXnQOStM6s68lroYtwr560Jwe1vMWmRlA6d3mW9b2SXvdz8+
 HBmWjawTkzsDx9ciP2R4GXSA8m4SBAbO7aQskwCS5JwSftKP7jYh5vl2Ql7aiLIo9Hng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vOwesAW0AJASOZFAIF1+kfgwwEixSeh9W22TJpOe3QQ=; b=PlraOLdplEPbr9hYIzuOR2HOi+
 LzdBIQzbEvYb9pAp1lVrdBykhPIdORepdVjnNduiu1mKBsGO7FyJn2DzISLr3YucLdW08gyNfbsfL
 Sq6gNhPGuCnUz+77mzxWA5LYur0MteVp0vpdg96oiDe09MvtumtPbL9ovIU8VA/9uLpw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1veNvh-0000eF-6G for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 10 Jan 2026 01:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D3AFC40853;
 Sat, 10 Jan 2026 01:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBECC4CEF1;
 Sat, 10 Jan 2026 01:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768009082;
 bh=1SLFpiBB9qlYA2B0NL1BDi/rggkL1u617yITITr0y8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oi1Verq7l28rgBZS0fdU8RQi8LroRuewJ7vxMwnvhk2UZTZIe+fjDgG4P030svuE1
 +ps94EWb+TaZadLPigaYcvWLoOwMmHWhUbaDIrF+TVp7mjhGGgRCl96CANiWe8J+pn
 V63rpkMTjPE8RFXGAEexcPft44JIWW0UEkoo8jG6QMXtJ9U4sxsHsQqZSY2mDlhM15
 CweqTULTjSOyIf++GSCM0JRQRcV1C1/LgmFa4soUSr1wWwyNeVX8mlq59YfcM9CcOF
 YroYxBdYyLJsnM3Feetuomr/L8+a2+qLvw8UqVKi2YscCm0gRxzECZnVUQAvz8RhRg
 GAbsR4KIlJU+g==
Date: Fri, 9 Jan 2026 17:38:02 -0800
To: Joanne Chang <joannechien@google.com>
Message-ID: <20260110013802.GB15541@frogsfrogsfrogs>
References: <20260108022501.754320-1-joannechien@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108022501.754320-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 08, 2026 at 02:25:01AM +0000, Joanne Chang wrote:
 > generic/735 attempts to create a file with nearly 2^32 blocks. However,
 > some filesystems have a maximum file block limit below this th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1veNvh-0000eF-6G
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 08, 2026 at 02:25:01AM +0000, Joanne Chang wrote:
> generic/735 attempts to create a file with nearly 2^32 blocks. However,
> some filesystems have a maximum file block limit below this threshold.
> For instance, F2FS is limited to approximately 2^30 blocks due to the
> capacity of the inode. So add _require_blocks_in_file helper to skip the
> test in such cases.
> 
> The helper uses a hardcoded constant instead of a programmatic method,
> so that bugs which affect the maximum file size are not masked.

Not to mention trying to create a file with 1,057,053,439 blocks
allocated to it would probably take forever.

Hang on, we're talking about iblocks (aka the number of blocks allocated
to this inode), not the maximum file size in blocks, right?

If so, then maybe this function and its comments should
s/blocks/iblocks/?  Or am I confused? ;)

--D

> Signed-off-by: Joanne Chang <joannechien@google.com>
> ---
> v2 -> v3: 
> - added explanation for using constants to commit message
> 
> v1 -> v2:
> - changed title from "generic/735: disable for f2fs"
> - used a new helper function instead of _exclude_fs as Christoph Hellwig
>   suggested
> 
>  common/rc         | 16 ++++++++++++++++
>  tests/generic/735 |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index c3cdc220..e92f4854 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -6120,6 +6120,22 @@ _require_file_attr_special()
>  	fi
>  }
>  
> +# Require filesystem to accomodate enough blocks in a file
> +_require_blocks_in_file()
> +{
> +	local blocks=$1
> +
> +	case $FSTYP in
> +	f2fs)
> +		if [ $blocks -gt 1057053439 ]; then
> +			_notrun "$blocks blocks per file not supported on $FSTYP"
> +		fi
> +		;;
> +	*)
> +		;;
> +	esac
> +}
> +
>  ################################################################################
>  # make sure this script returns success
>  /bin/true
> diff --git a/tests/generic/735 b/tests/generic/735
> index 9bbdf3a1..2fbf125c 100755
> --- a/tests/generic/735
> +++ b/tests/generic/735
> @@ -22,6 +22,7 @@ fi
>  _require_odirect
>  _require_xfs_io_command "falloc"
>  _require_xfs_io_command "finsert"
> +_require_blocks_in_file $(( (1 << 32) - 1 ))
>  
>  dev_size=$((80 * 1024 * 1024))
>  _scratch_mkfs_sized $dev_size >>$seqres.full 2>&1
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
