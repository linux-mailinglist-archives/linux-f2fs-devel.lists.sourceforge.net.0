Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3F2F39C3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 20:14:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzP7P-0002qT-GA; Tue, 12 Jan 2021 19:14:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzP7O-0002qE-5a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xt1eHXNzUzKa+l7s3EH5/c/n/cLOc3aF5EK/QN5h4Ks=; b=S4Y4sz+gairv928sstyysUXZl2
 wFHfldzJ4jgstQqKVlurLFUlSgqNU6SxA8Jr8crFXVUUUTmoRhS4/zcRlkgCpX0DCbzaBKOVCa3F2
 y5JKI8wygkhwfXWiUVtN4WsyC0FMuJvqyHMJbkATMip2EdT19v6IuTUJMjyVEBO6RgGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xt1eHXNzUzKa+l7s3EH5/c/n/cLOc3aF5EK/QN5h4Ks=; b=cvHmyKsJ+PunhOADOi2l8a1pp9
 rBD35SR9qN6wOSKJREbhlPYKNsSITjlvLJQXeZnGsE/n+mBZk3uSo+MsZL4/ujV9lgGaZnsIJrIKy
 tNT4mPncW6EgtESeT2nY+NH41emlACaMoLCQAPzcQpJWWFVG0avY3gFRflCuePrIKjew=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzP7K-00Enob-P5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:14:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E00A230F9;
 Tue, 12 Jan 2021 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478845;
 bh=HfY5AtfEjHmUSHWdZ3UwZuzVHc2NCzE56hiXY2m6e1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwoxPnudxOLM4lqnZZBSF9w9BP16SXhbLDXlKHv+2Q815g1RB89LfMpGPlj3bb2b1
 jP6tx+iYMKc1cvw04K4Z/lv9IbVk4JyfqwsqXdGNIw5X405I2dSKyyPNiEJqzZHnJ3
 6XF8yEKBRhs3yDiwJ+Y2MsnLlVN0iru1OweKSNFVYYQrZPsNo/2PCJhPDteVGrpkvu
 JReSOlUZzV6NDVYCO98pz7nGvB00P9Y00qi1osy1pSVYrSaHLnY6uHzpZ5HzQ7QHhz
 WxTBhuTCeIGsXy4yrjq+RGf4Ss3X2UVcgspUAOLBBuQnP3tisZgpkl6xo8tRZ2ijfH
 jkgVPrjF5N0YA==
Date: Tue, 12 Jan 2021 11:14:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <X/30+5rc1bv39moX@sol.localdomain>
References: <20201228232529.45365-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228232529.45365-1-ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzP7K-00Enob-P5
Subject: Re: [f2fs-dev] [PATCH RESEND] libfs: unexport
 generic_ci_d_compare() and generic_ci_d_hash()
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
Cc: linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 28, 2020 at 03:25:29PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that generic_set_encrypted_ci_d_ops() has been added and ext4 and
> f2fs are using it, it's no longer necessary to export
> generic_ci_d_compare() and generic_ci_d_hash() to filesystems.
> 
> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/libfs.c         | 8 +++-----
>  include/linux/fs.h | 5 -----
>  2 files changed, 3 insertions(+), 10 deletions(-)

Jaegeuk, any interest in applying this given that this code came in through the
f2fs tree in the first place?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
