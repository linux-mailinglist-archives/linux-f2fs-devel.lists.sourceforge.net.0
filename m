Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723750A854
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 20:46:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhbov-00083i-NM; Thu, 21 Apr 2022 18:46:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nhbou-00083c-S5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 18:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UhPUdYWcPrHDO0+fBNO4ifhvnxNM0uzu57i3QlDVcK0=; b=WRgclbdI5XFV6axLekmjl6PADG
 cAX/PzC6EqMnsM5TsDbgAWPXPtNjAfi9ylhQqNbaEaLxREdLbjazFJhZMoebvB6NaZt2xNDIkewab
 pnpHM1JcpmQk5nGSp5rQEn8RQWhcRX9UlH7y8nIGmAfYpGDxOMYFsn6KLGGTTX2M6YpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UhPUdYWcPrHDO0+fBNO4ifhvnxNM0uzu57i3QlDVcK0=; b=Zs4ZMPshtNDgBCisUMu2jZ+uMP
 tfGT1HPpSeNDhretGvk1lVuv4vGEt+Ee39tyzsvgTmddBzwhwJXhjAuifAt/VtVIZ9UeSPV+IUR10
 AM11Hp40tzSd+g3c4DFXXgI8Bma1TZ+V1YsBMQo/cIS6yEs710ER2BM1ZfajhBPeATgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhbov-0003l6-5y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 18:46:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C75D160F15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 18:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5EEC385A1;
 Thu, 21 Apr 2022 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650566779;
 bh=xIFSZuODUQ/i7IO02KTWGkjbD5hF9Q1d08rVSQEHXn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mk+bBkEvbPEQTisY2L/fxw/dTRah48WE//hutSJZHR4isII1JrO0/6vZwoO6MW3us
 9yhuj27ur4Nt6Lf70LGT6JiDsANR1RSXxV5GXb65wf/oPMbiqfcFSWQE/UBxnDESeN
 EHD8crMvmEiFFluUPIKwP1IJi6k65Sj4qXOhaYBEi8zUVqb7zid8TbVflUKQcnLbgK
 WNdO5OF0F57RQ1o43XEkFHqwrF5GSPEVEZAiMGjpWhNJEnPQ+47n31/7MzUFzTzaJ2
 Yt1qAaEJoggASrGlzLJle2kOQNHDGmYh7F31NWhxHVtmISzLXOoaGUfg1WJyMtSbDo
 mSP0IrdOaICsA==
Date: Thu, 21 Apr 2022 11:46:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YmGmeZ5sm9nqEqxd@sol.localdomain>
References: <20220414053415.158986-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414053415.158986-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 13, 2022 at 10:34:15PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > When inline encryption is
 used, the usual message "fscrypt: AES-256-XTS > using implementat [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhbov-0003l6-5y
Subject: Re: [f2fs-dev] [PATCH] fscrypt: log when starting to use inline
 encryption
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 13, 2022 at 10:34:15PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When inline encryption is used, the usual message "fscrypt: AES-256-XTS
> using implementation <impl>" doesn't appear in the kernel log.  Add a
> similar message for the blk-crypto case that indicates that inline
> encryption was used, and whether blk-crypto-fallback was used or not.
> This can be useful for debugging performance problems.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fscrypt_private.h |  4 +++-
>  fs/crypto/inline_crypt.c    | 33 ++++++++++++++++++++++++++++++++-
>  fs/crypto/keysetup.c        |  2 +-
>  3 files changed, 36 insertions(+), 3 deletions(-)

Applied to fscrypt.git#master for 5.19.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
