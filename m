Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC41DC264
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 00:55:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbXcf-0001tY-As; Wed, 20 May 2020 22:55:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jbXcd-0001tI-OI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 22:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MBI9+Qv0T946S1T33gMn4MTB6UHvYJMlzuW1V+/XVIA=; b=WjkUyl6XANkswlNNFhajQjv+Ri
 NpxpFJQzUKVP8ctPnWoB6ybDsvnucre6M4bdU/+hgNrSJ4n88iegBDwx2fFrNXBXSP88G9atvvXdR
 VCpVUVRmfLWhfCnp83RgSYCCKapwhUdIH0b/OG0awRu5gSHGDATPD5YSoYuSLPrqOa1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MBI9+Qv0T946S1T33gMn4MTB6UHvYJMlzuW1V+/XVIA=; b=dQYxqMBgAODODsR2jju50rPy6t
 4m1nmIaWq2QFZg9oKKSmjw8fhWhmMsbyrO6m9LumUU4zxkqdTQ3dS26DKneEiqDQgL6VpbGerQNaa
 UNSsiNiEIL5BJlhTye8mZvvB4PAfvOF0f1dnkhb0GBBDW25pPK3G4Sikwg4qoGSSbYLA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jbXcX-009i3i-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 22:55:35 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E09020708;
 Wed, 20 May 2020 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590015317;
 bh=E1DfljRpbA6H0IZzsWRX/4aXJ88Hj2y4PqJ5SvnK5Ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/TPnlDOY0Ch8TASNkZrTmEyp4fQfD43DMOlLeLHPLMxpUSL9g5UzvNMe75nkUORJ
 c0KlLIY/Qom29xZQp7fFPrnSEuJVAD4ZXPOiZNM9gcZpiZdfUrsnsQ10NdRWNp4VFS
 T+T6tgycX/Vzju3MKAcDuUz2T064ekJezx3O0KMg=
Date: Wed, 20 May 2020 15:55:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200520225515.GC19246@sol.localdomain>
References: <20200512233251.118314-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512233251.118314-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbXcX-009i3i-Rm
Subject: Re: [f2fs-dev] [PATCH 0/4] fscrypt: make '-o test_dummy_encryption'
 support v2 policies
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 12, 2020 at 04:32:47PM -0700, Eric Biggers wrote:
> v1 encryption policies are deprecated in favor of v2, and some new
> features (e.g. encryption+casefolding) are only being added for v2.
> 
> As a result, the "test_dummy_encryption" mount option (which is used for
> encryption I/O testing with xfstests) needs to support v2 policies.
> 
> Therefore, this patchset adds support for specifying
> "test_dummy_encryption=v2" (or "test_dummy_encryption=v1").
> To make this possible, it reworks the way the test_dummy_encryption
> mount option is handled to make it more flexible than a flag, and to
> automatically add the test dummy key to the filesystem's keyring.
> 
> Patch 4 additionally changes the default to "v2".
> 
> This patchset applies to v5.7-rc4.
> 
> Eric Biggers (4):
>   linux/parser.h: add include guards
>   fscrypt: add fscrypt_add_test_dummy_key()
>   fscrypt: support test_dummy_encryption=v2
>   fscrypt: make test_dummy_encryption use v2 by default
> 

All applied to fscrypt.git#master for 5.8
(including the sysfs additions to patch 3, as was discussed)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
