Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74605286A5B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 23:39:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQHAD-0002Di-Oh; Wed, 07 Oct 2020 21:39:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQHAC-0002DT-EX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ra8Mw8BX0wemQogocWXmtNgUIMKYtgDOffdXpUC3pAc=; b=S9pcZbo+b5ZNQe/JCrDk4o435q
 oe57Iw96kWO344ULwaa4Kjd7VMeeHW911qSLRecLksz1iZuvMyY9H5TK2yX7WgaGlS53IVjxs9knA
 dPSRO2zUvnOGF8AmUaHJ+GL4Xbdjy7NR838do8UEjKfDfS6DT5E9UeEjZrMCTuJQj3Mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ra8Mw8BX0wemQogocWXmtNgUIMKYtgDOffdXpUC3pAc=; b=Zy4AwH1bD1wU0xNAjHwUTIIDEm
 Klggz41GoFQ2KOIH7BkIMH7/lSllHhsC2c223U8HVaP5RoQT0PSN0xr4PiN9dSg2Q9QznbrINyN93
 Yeg1qi5EaAC0SxmIdcgU9gdNfOvvlNmQ34lXPmAB78VxQQimiIpK1EbaSpJ7tBOpV/0w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQHA3-002UtG-5r
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:39:56 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C8E22083B;
 Wed,  7 Oct 2020 21:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602106781;
 bh=sdRxveUhVytWLRhWGk462Ot+awyuVxCG/A90yWYdq/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzfvFlFTY4ZrVPRXDn5j7jg6BP43NEwJHSuM+ziF4i9UzTd0CUmg6a1FZG6vyxBgy
 X9JDRAyds9tGyNTwoGhmEynUgxanc6PpEUUibSiTAK4G8D4fyCxFidES9jbrWA/ZbP
 Xl/Pe7ev1K+G4GGmGVFyXCzbuwSPkmj27S44yGac=
Date: Wed, 7 Oct 2020 14:39:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201007213940.GE1530638@gmail.com>
References: <20201005074133.1958633-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005074133.1958633-1-satyat@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQHA3-002UtG-5r
Subject: Re: [f2fs-dev] [PATCH 0/1] userspace support for F2FS metadata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 05, 2020 at 07:41:32AM +0000, Satya Tangirala wrote:
> The kernel patches for F2FS metadata encryption are at:
> 
> https://lore.kernel.org/linux-fscrypt/20201005073606.1949772-4-satyat@google.com/
> 
> This patch implements the userspace changes required for metadata
> encryption support as implemented in the kernel changes above. All blocks
> in the filesystem are encrypted with the user provided metadata encryption
> key except for the superblock (and its redundant copy). The DUN for a block
> is its offset from the start of the filesystem.
> 
> This patch introduces two new options for the userspace tools: '-A' to
> specify the encryption algorithm, and '-M' to specify the encryption key.
> mkfs.f2fs will store the encryption algorithm used for metadata encryption
> in the superblock itself, so '-A' is only applicable to mkfs.f2fs. The rest
> of the tools only take the '-M' option, and will obtain the encryption
> algorithm from the superblock of the FS.

As I mentioned on the kernel patches, it might make sense to compute a
metadata_key_identifier and store it in the super_block so that it can be
automatically requested without needing to provide an option.

> 
> Limitations: 
> Metadata encryption with sparse storage has not been implemented yet in
> this patch.
> 
> This patch requires the metadata encryption key to be readable from
> userspace, and does not ensure that it is zeroed before the program exits
> for any reason.
> 
> Satya Tangirala (1):
>   f2fs-tools: Introduce metadata encryption support

A cover letter shouldn't be used for a 1-patch series.  Just include these
details in the patch instead.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
