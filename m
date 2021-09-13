Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27650408852
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Sep 2021 11:34:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mPiLy-000839-Uw; Mon, 13 Sep 2021 09:34:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1mPiLi-00081y-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Sep 2021 09:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hDsr6OdexhOvPJUZA96ucQjBeZ32NG6VbgGjb4JfkY=; b=dGFciAPm15QOuhfax41czOQuVD
 wtlnLjt+HCl+RpoH3R/vq5wzxwAxZXPwDahuyNaeSukshmIEtSRifeoE0khbP+4iZOpIBKv0poPvP
 wg0Z0qY+6KdILPLChd68+1k7Wu7Q0JJjEcbtCLwUERK3XphtK+vMxRSMnhADYTYyCkY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3hDsr6OdexhOvPJUZA96ucQjBeZ32NG6VbgGjb4JfkY=; b=QFL/907aIIzSi/NNwH7L5AcSK7
 ixvoTu5xGm8nQ8Cq+7m8xzEs/mjsWoVSJbO/xvslIbigcfsYbZ37N+iouxnlVeMnXgLNJvvsJFZXO
 41pjAGF24CN/h6k9VmUABSIuTGmlsa/WpHAm6EceNmJfdNlYTQIn7vO1ZrCw2lXG+51Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mPiLh-00030C-TX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Sep 2021 09:34:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C880961004;
 Mon, 13 Sep 2021 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631525636;
 bh=GY8EbtbGrgePZfSn3NDCuLNemetE1SRK37HKfuiJrzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXfVZu5j0ppumZyeQdoQvH4+bjWZ2qTjg+7G2oYG4+8A6qFXQ1t9Ht1Wy00W3Dxli
 OeFQkayIypGECabAt0QI2dN2J3NHxXZiJ1A5dQ2xtWflk3NdrQdcbdCjSSMPLDLUXt
 qr+gz75pyugwlAj99JLG6U0f/kVMoJzmSk2BcAZU=
Date: Mon, 13 Sep 2021 11:33:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YT8bAlnKAYXMqFpe@kroah.com>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 08, 2021 at 02:50:29PM -0700, Eric Biggers wrote:
 > This series backports some patches that failed to apply to 4.19-stable
 > due to the prototype of inode_operations::getattr having change [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mPiLh-00030C-TX
Subject: Re: [f2fs-dev] [PATCH 0/4] backport fscrypt symlink fixes to 4.19
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 08, 2021 at 02:50:29PM -0700, Eric Biggers wrote:
> This series backports some patches that failed to apply to 4.19-stable
> due to the prototype of inode_operations::getattr having changed in
> v5.12, as well as several other conflicts.  Please apply to 4.19-stable.
> 
> Eric Biggers (4):
>   fscrypt: add fscrypt_symlink_getattr() for computing st_size
>   ext4: report correct st_size for encrypted symlinks
>   f2fs: report correct st_size for encrypted symlinks
>   ubifs: report correct st_size for encrypted symlinks
> 
>  fs/crypto/hooks.c               | 44 +++++++++++++++++++++++++++++++++
>  fs/ext4/symlink.c               | 11 ++++++++-
>  fs/f2fs/namei.c                 | 11 ++++++++-
>  fs/ubifs/file.c                 | 12 ++++++++-
>  include/linux/fscrypt_notsupp.h |  6 +++++
>  include/linux/fscrypt_supp.h    |  1 +
>  6 files changed, 82 insertions(+), 3 deletions(-)
> 
> -- 
> 2.33.0.153.gba50c8fa24-goog
> 

All now queued up, thanks!

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
