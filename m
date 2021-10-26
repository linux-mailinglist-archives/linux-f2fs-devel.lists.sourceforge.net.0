Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39A43B629
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 17:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfOmI-0008Tj-NO; Tue, 26 Oct 2021 15:54:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <corbet@lwn.net>) id 1mfOmG-0008TP-J5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 15:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BO0FH4NpsoKzz5ysD7mAWzUqzUOG5vEv7ZV5CUFRW8M=; b=LIA/LqF6POoV8qSreaDT39VKH
 +JKPRjMsw5vZJAS3dxu8EEtgbNcSKNUI6ZjBFUbxFUFYBsRzUpxAuXMdFz9pTLan8/1P7H2AUXR1S
 g35h1SGSF5/4f2M5/swkoX3a8dyyQjZ/5KypMYMa2Vbe9XrTzWapMamuwRYpRyEAyqmG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BO0FH4NpsoKzz5ysD7mAWzUqzUOG5vEv7ZV5CUFRW8M=; b=dM3RDOAG7M4hWXaRqgLpypYZkf
 ql0jUQsr6A90MOypbKs26KoWbVu3UpafY+vh5M6SXVGpCgqqyMopTFBmYsGYMhKdmFEGQuYV5+8we
 1zWf8rktAmNtaEmAsRBkm0BbPagTXcePhn+s9HCJEEFI0ymH13H6HUPr2qHscnnJskKA=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfOlm-00HGao-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 15:54:16 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C48A0844;
 Tue, 26 Oct 2021 15:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C48A0844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1635262653; bh=BO0FH4NpsoKzz5ysD7mAWzUqzUOG5vEv7ZV5CUFRW8M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Xu05Dp33O+L+ESv8Lyr5fVBdlaEHL41KZPGiVMpDabg5wLbRNa59cDhn3DOrOpmmT
 ir4nHpsJeA/K+dc3EINXSs+Xf2TwZD+mQTDeX5kj/7lSFx0s/J28LNEWYBPxle5m6D
 4HRT7/57sg37DAfsXDgULCUaf01alh/nn+42iQpdOPwReQEb75ljkFWZqgFkz5WrhK
 AhWO53JBRaRSkka5MkVLlLYzGCsrqBD6Yry37DwHDTOYhrsxVUguxEMjn+N2+d0OiI
 XqO4PHTAqS63t3qgUcBjqP+1fZ7DBt7s0wpqmkQcYeroBxkNwBwI4eCbY7Y9jiuYCM
 2d6xEuewK+D9w==
From: Jonathan Corbet <corbet@lwn.net>
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
In-Reply-To: <20211023025833.216030-1-changfengnan@vivo.com>
References: <20211023025833.216030-1-changfengnan@vivo.com>
Date: Tue, 26 Oct 2021 09:37:33 -0600
Message-ID: <87ee87g5ky.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Headers-End: 1mfOlm-00HGao-Ee
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix f2fs.rst build warning
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
Cc: linux-doc@vger.kernel.org, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fengnan Chang <changfengnan@vivo.com> writes:

> fix f2fs.rst build warning.
>
> Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  Documentation/filesystems/f2fs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

"Fix a warning" is almost never a good changelog message; you are fixing
a problem that provoked a warning.  I rewrote the changelog to:

  The docs build was generating this warning:

    Documentation/filesystems/f2fs.rst:306: WARNING: Block quote ends without a blank line; unexpected unindent.

  Remove the extra white space that was confusing sphinx.

Applied, thanks.

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
