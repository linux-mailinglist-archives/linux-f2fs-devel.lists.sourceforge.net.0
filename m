Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A5500570
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Apr 2022 07:31:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nes5C-0000uP-Pq; Thu, 14 Apr 2022 05:31:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nes5B-0000uJ-L1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 05:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7tiswAjqbGC0WKq4AaVaAbhfgYrnLGWY4E1O61GtQ78=; b=IwifiX6pWrPNdJn45STYQpNRiB
 JdTqEpCFGNyl9gbAMxqUlzmCd6L87YfaCwb/PXfk0EjpXtFpyiDeMpB036WtbNGX/gnaeMRfz5+Et
 XeZP2KIC2AbBLnFw8nv0XV903KNhrSB0I2SqAISA5rt/wABHQnm0N4ic1+VhbBssanhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7tiswAjqbGC0WKq4AaVaAbhfgYrnLGWY4E1O61GtQ78=; b=fQkK21cdUW4yd5UxEV2bgECSdn
 Anfq+Wgxs49gNklSoqLrOXdOeT9jGhLdoUG6auEXJAD68hodlL+dgX4VCCif8K/xdX8uYoKNPCS+j
 R5/oNPIkatJuB5v4Ri0R5qJz2NI291V4fLak12kOHVT9cpMQRIxLF758FL5HvOpWxkr0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nes58-0002kW-Je
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 05:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C352B827CE;
 Thu, 14 Apr 2022 05:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E90C385A1;
 Thu, 14 Apr 2022 05:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649914295;
 bh=L5WfTzpjmjPzbWBOyi36W4xnedgDh3ktWaS0CuxYK2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gRf6aEfGzR7cjx2ARWlkHDkLhiYl21dZDhTgSJtG1yCo6JAZZQoZ3VD0ckT/44hy0
 IBgRPNsmLZf1C1+ya4UCWyPlFjo9/iWkLxeOYhvlrYhDPeGhgs6SKlm0TvUSnLM6tZ
 5htpQJu+7Ep7a2Mj0Ja+ZM+avjLOV41Ggqdd4SZFwbYDY4mXNVVVCTNNTNQ2UPAwDK
 ilCpygqNTadPdfUW6h8nbVonntqOeyYLI5YMaAXba7ghSpOk2x0Mkc2hpXxihFLZMg
 g8YAgbyBFpBPzblXAtfGGzy9pinnedmIJ/wjZ5Wq11DwNYN5BANzlUaLM41cX5G5X6
 GpystR7vfkPjA==
Date: Wed, 13 Apr 2022 22:31:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YlextfUbirO97Gl7@sol.localdomain>
References: <20220405010914.18519-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405010914.18519-1-ebiggers@kernel.org>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 04, 2022 at 06:09:14PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > FS_CRYPTO_BLOCK_SIZE is neither
 the filesystem block size nor the > granularity of encrypti [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nes58-0002kW-Je
Subject: Re: [f2fs-dev] [PATCH] fscrypt: split up FS_CRYPTO_BLOCK_SIZE
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 04, 2022 at 06:09:14PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> FS_CRYPTO_BLOCK_SIZE is neither the filesystem block size nor the
> granularity of encryption.  Rather, it defines two logically separate
> constraints that both arise from the block size of the AES cipher:
> 
> - The alignment required for the lengths of file contents blocks
> - The minimum input/output length for the filenames encryption modes
> 
> Since there are way too many things called the "block size", and the
> connection with the AES block size is not easily understood, split
> FS_CRYPTO_BLOCK_SIZE into two constants FSCRYPT_CONTENTS_ALIGNMENT and
> FSCRYPT_FNAME_MIN_MSG_LEN that more clearly describe what they are.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/crypto.c      | 10 +++++-----
>  fs/crypto/fname.c       | 11 +++++++++--
>  fs/ubifs/ubifs.h        |  2 +-
>  include/linux/fscrypt.h | 12 +++++++++++-
>  4 files changed, 26 insertions(+), 9 deletions(-)

Applied to fscrypt.git#master for 5.19.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
