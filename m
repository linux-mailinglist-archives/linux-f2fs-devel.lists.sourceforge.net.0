Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E212869C7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 23:00:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQGYS-0008IQ-AD; Wed, 07 Oct 2020 21:00:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQGYQ-0008II-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWys9lwjFwn3y2WLSz7/9gklVnm2rLZvAo9opNCFNxw=; b=iIveDN8URhpO3BNxZh2RHPmhf+
 ZTw3y81mhOrpJ/13c3zimw8Cy5a9hRNxkEOVgGbGIivJhMCVJ6kCRPWfxl2pAE4qr/sGLevDlC6Ww
 E0ahzfNkxwToNns2xN+SF/KrsVwbWx4RKf6jjVT3eTB2hepb4X8VahlecolE342XPdAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GWys9lwjFwn3y2WLSz7/9gklVnm2rLZvAo9opNCFNxw=; b=KGTAaTkXpaKHez1+cLsSHZVi34
 286fI+AN/bw5KlgamjSJ98o/HXCdJfBM3CzIFmQZX/lc6txcM+Yk3M0IxOeAiuUMJ8CfLVwnw1+Cx
 JsfxbE/hgRTjDvK+oL06UGgdJbCRFler2gQRElqy2h/bggH550bGJ6qhHFXsOZyiTQK4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQGYJ-002T8Y-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:00:54 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F1C120782;
 Wed,  7 Oct 2020 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602104442;
 bh=GWys9lwjFwn3y2WLSz7/9gklVnm2rLZvAo9opNCFNxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wsIcdJkx02/Jqxk4lgxxNghmKWKmf7nGpPUem6SwFDSBheWQD2Hi1eC7x3BHLBFxf
 ei/Is0gGRbQ4qXTA7QMZXG5EhehNR+eiAStKtP0JMC1lR6Hdz9O3poFMWmF42JxCWl
 O1fI67OYgM3d+jCQ6RDECZAN1PTZ/wiBPZopnKSA=
Date: Wed, 7 Oct 2020 14:00:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201007210040.GB1530638@gmail.com>
References: <20201005073606.1949772-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005073606.1949772-1-satyat@google.com>
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
X-Headers-End: 1kQGYJ-002T8Y-Ur
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 05, 2020 at 07:36:03AM +0000, Satya Tangirala wrote:
> This patch series adds support for metadata encryption to F2FS using
> blk-crypto.

This patch series needs more explanation about what "metadata encryption" is,
why people will want to use it (as opposed to either not using it, or using
fscrypt + dm-crypt instead), and why this is the best implementation of it.

> Patch 2 introduces some functions to fscrypt that help filesystems perform
> metadata encryption. Any filesystem that wants to use metadata encryption
> can call fscrypt_setup_metadata_encryption() with the super_block of the
> filesystem, the encryption algorithm and the descriptor of the encryption
> key. The descriptor is looked up in the logon keyring of the current
> session with "fscrypt:" as the prefix of the descriptor.

I notice this is missing the step I suggested to include the metadata encryption
key in the HKDF application-specific info string when deriving subkeys from the
fscrypt master keys.

The same effect could also be achieved by adding an additional level to the key
hierarchy: each HKDF key would be derived from a fscrypt master key and the
metadata encryption key.

We need one of those, to guarantee that the file contents encryption is at least
as strong as the "metadata encryption".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
