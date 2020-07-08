Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A56218E09
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 19:14:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtDel-0001wB-Ln; Wed, 08 Jul 2020 17:14:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jtDek-0001vy-7a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixhyvEhFDHCepLgAKgp2gzSfDXTRXTpXEaPYpvrukuQ=; b=Zi4OQbx9xry/2VlCExYkWo+OnB
 wlCEzV0Qk3JRHaADYAmM1Zjsy4klkXafEDV2jeNoBxViHzdQ36pGohhwVH19yLehEOt3LYBB8HXfc
 tQ0PpJn1uY/7msJPJBo19YluAv4TtQ3SoSgkozJObFwiyLpDkFAo0C+ZKxTIkXpyZsxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ixhyvEhFDHCepLgAKgp2gzSfDXTRXTpXEaPYpvrukuQ=; b=bz7aDhbnVncruoXDQF60xSvXOo
 ex45LArlXc34HA5VbavSTlkI5sd7/2ziMqrNzAMdjYs84/5B+Q6+86Iw8ah9KbCHmsKjcaODldWlT
 xcU0M1wFEGk88AEiZSFKG0xn3lDCoSOZHt32wFuEk71M/0UmXnW2aRT7yFzJCf48eOK8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtDei-00HVnI-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:14:50 +0000
Received: from callcc.thunk.org (pool-96-230-252-158.bstnma.fios.verizon.net
 [96.230.252.158]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 068HES9I021454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jul 2020 13:14:29 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 5EA4D420304; Wed,  8 Jul 2020 13:14:28 -0400 (EDT)
Date: Wed, 8 Jul 2020 13:14:28 -0400
From: tytso@mit.edu
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200708171428.GE1627842@mit.edu>
References: <20200702015607.1215430-1-satyat@google.com>
 <20200702015607.1215430-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702015607.1215430-3-satyat@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtDei-00HVnI-Ee
Subject: Re: [f2fs-dev] [PATCH v4 2/4] fscrypt: add inline encryption support
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 02, 2020 at 01:56:05AM +0000, Satya Tangirala wrote:
> Add support for inline encryption to fs/crypto/.  With "inline
> encryption", the block layer handles the decryption/encryption as part
> of the bio, instead of the filesystem doing the crypto itself via
> Linux's crypto API. This model is needed in order to take advantage of
> the inline encryption hardware present on most modern mobile SoCs.
> 
> To use inline encryption, the filesystem needs to be mounted with
> '-o inlinecrypt'. Blk-crypto will then be used instead of the traditional
> filesystem-layer crypto whenever possible to encrypt the contents
> of any encrypted files in that filesystem. Fscrypt still provides the key
> and IV to use, and the actual ciphertext on-disk is still the same;
> therefore it's testable using the existing fscrypt ciphertext verification
> tests.
> 
> Note that since blk-crypto has a fallback to Linux's crypto API, and
> also supports all the encryption modes currently supported by fscrypt,
> this feature is usable and testable even without actual inline
> encryption hardware.
> 
> Per-filesystem changes will be needed to set encryption contexts when
> submitting bios and to implement the 'inlinecrypt' mount option.  This
> patch just adds the common code.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
