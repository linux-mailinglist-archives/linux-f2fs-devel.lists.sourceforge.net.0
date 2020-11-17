Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F232B6DD5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 19:53:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf66x-0001au-IA; Tue, 17 Nov 2020 18:53:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kf66v-0001aM-JS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOfml8XNbcpuAFTYEYouX3wjSebLzC0EbBcqdMG0evQ=; b=hq38hTx7OdImFMG27Re4UCBIIO
 G1m7QGSWTnQXNjPNvMYuN457/OvcVL2g3lbwkTsyOIUC7yGj8LNZc2UGPvdfPqCxvnkfQ2VeKDPd8
 4lSHGuGME72x2aSGpKEXVBsnxx7G1Nr8SAsY+kPaKCjFXApy5n/5R/TfRxCgRkG8aPrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oOfml8XNbcpuAFTYEYouX3wjSebLzC0EbBcqdMG0evQ=; b=cisZPk/+OJscGGX9ZPw2cA2+gh
 bj7hFE6GbEK1NP+yb+xO3tmHrgkoLWNnhppVr5juHBLV18d19muPk95zvdcpPAab1Vwv/+G2XOelQ
 n6iK1uURrNwv588jJfxaOq/D9x7Ka56LEdexD3bFlcV1S4lQxaCiTWcUBhqtp91irscc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf66e-00B47A-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:53:49 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACCC924199;
 Tue, 17 Nov 2020 18:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605639200;
 bh=oOfml8XNbcpuAFTYEYouX3wjSebLzC0EbBcqdMG0evQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/lhA7NhkxdXRpkr9r4LzAXwXv5c8gii8rE5PpYq7CcAPe5OzkV6aNvC+Hw/NHJYK
 aoaoWzXqxUykv/E4wx6bzZ0QOHyWYoOMSn5ZwXKX3poseARTLGZTA7BEu8zOZ0dNLv
 8ePryzPsKPyW6e7s8YJ2JZhusbFugsu1L36m5IHs=
Date: Tue, 17 Nov 2020 10:53:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <X7QcHmarXZOgfjzz@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-1-drosen@google.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1kf66e-00B47A-Tg
Subject: Re: [f2fs-dev] [PATCH v2 0/3] Add support for Encryption and
 Casefolding in F2FS
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 04:03:12AM +0000, Daniel Rosenberg wrote:
> I've included one ext4 patch from the previous set since it isn't in the f2fs
> branch, but is needed for the fscrypt changes.

Note that this is no longer the case, as this ext4 patch was merged in 5.10
(commit f8f4acb6cded: "ext4: use generic casefolding support").

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
