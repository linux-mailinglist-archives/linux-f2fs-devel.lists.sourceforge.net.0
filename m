Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B15295715
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 06:23:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVS8A-0000uA-Rp; Thu, 22 Oct 2020 04:23:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kVS89-0000ti-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvPu2orPfIA1FP9D3ZMrhdO5eFOH5Xcit4mx2sladi4=; b=UDT543vmzCnDpei4UeYh2Ar8Bu
 lfePuHw33Fdn5hhEisMRXJJFkwf5YPkD5AOen4MbjMxXXyIrQ7OTD8TIMJBwMaTNlayuG7U5y97u0
 ERBVDFzdaAIxEB3Aa3JDlmVuoDneEfIqX1piWIUo087UzFczL7FDaIN/TS2cD+bEx1vU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hvPu2orPfIA1FP9D3ZMrhdO5eFOH5Xcit4mx2sladi4=; b=BxNazu1HyVCbQy2LVvobpKDa/9
 yl5mXbF0/1ItYOFBjNaXNsZsPX8p9fA1N9WoMVNkVb8Cj9gZhQepRRgQAP/ImL3z5oIfyqoEcMdEo
 cSKNX/r0BXbwRuBz8enfCqt0H+Lx2Y/u0QRQFrbzeOeIS7oouOnmoS5hf5lwybyIiYEM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kVS85-008DIC-68
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:23:13 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97F58223C7;
 Thu, 22 Oct 2020 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603340578;
 bh=abK6GnFdkR0gb+0CmFFSKSBybEXxiaGX7kjbc9XN674=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vp/iU+WQQk/3dF0vOi29eutcyfki6Gh3RadGlE+BrR4V8jSmn7zOw0T5ovw6+w4IR
 Vb1D8MuHqywZqN7Q+cNJ5x0jVoFx0Xbwe80fUMNUpEObV4AXiJQTxPBuJcqeBfA4yg
 m21uPK4QSjDz99Z6xksAMK4f1hBpamMHmLSEXEqA=
Date: Wed, 21 Oct 2020 21:22:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201022042257.GA857@sol.localdomain>
References: <20201022035848.976286-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022035848.976286-1-daeho43@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kVS85-008DIC-68
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 22, 2020 at 12:58:47PM +0900, Daeho Jeong wrote:
> +	if (!f2fs_compressed_file(inode)) {
> +		inode_unlock(inode);
> +		return -EINVAL;
> +	}

How about using ENODATA here?  EINVAL tends to be used for lots of different
reasons, and it's not always clear what it means.

Note that FS_IOC_GET_ENCRYPTION_POLICY fails with ENODATA when called on an
unencrypted file, which is a similar case.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
