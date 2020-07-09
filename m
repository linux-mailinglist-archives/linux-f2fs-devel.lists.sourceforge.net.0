Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0521AABB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 00:46:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtfJ5-0004UF-VA; Thu, 09 Jul 2020 22:46:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jtfJ3-0004U5-VT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 22:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xamRBiR2vsIZHdRIqsSF/LZqSnudIci9c8EUS+KPAXc=; b=ftUPnVbEhStdhk1nD20k0jL/RB
 779cW85aNkOyTmcczOCd5kxj/D3zq4nF3P2jxM2V5Wx/aS7IL4wkFYdPNJaZI3itzxomWqlc13g9O
 FLO2h8CVYtSm8KLTtuduaRah5EedLEkCxgk002emS/oFfKYr5kmQzjDkfYM71Kp1COU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xamRBiR2vsIZHdRIqsSF/LZqSnudIci9c8EUS+KPAXc=; b=hNWoDvcQjp7DwFPcJTAU1X9EvQ
 0AvWmYP4xcbV2n6v4infYeWS+uuj/gxm2XwsFcetO3bpKKwa9+8ujZ4h8DPbH++YXzeutDbGns8cE
 bTai9WggJhB9Jq08D0IaGmYwTOB1ptNUZb2dncKutjwxCFnnJe824PyJfwsYXKVHWUgc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtfJ2-00Cdvo-Og
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 22:46:17 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 405FE206E2;
 Thu,  9 Jul 2020 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594334771;
 bh=dllc0mNQLui62MxdLGsYVQ0KPlrkGuocjRq3Z70d4xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xvDIPC57zh3Q9WVIHSKHkAsCSM6aAI047xfy8fejKV0QhiMZ7VZ8/UwZmuDEAVmTi
 VxJnjd+/iQeXu9RqWowkQxgCnxyVtCOnLm+E1OUsprA9HEDc5V8LrIfscbZjHANAS7
 qITlXpZ46+T3AzBMvAcTLL3qacPrDc6ArNn+VhKw=
Date: Thu, 9 Jul 2020 15:46:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200709224609.GF3855682@gmail.com>
References: <20200709194751.2579207-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtfJ2-00Cdvo-Og
Subject: Re: [f2fs-dev] [PATCH 0/5] add support for direct I/O with fscrypt
 using blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 09, 2020 at 07:47:46PM +0000, Satya Tangirala wrote:
> This patch series adds support for direct I/O with fscrypt using
> blk-crypto. It has been rebased on fscrypt/inline-encryption.

Nit: use fscrypt/master instead.  (Eventually I'll delete the
"inline-encryption" branch.)

> Patch 1 adds two functions to fscrypt that need to be called to determine
> if direct I/O is supported for a request.
> 
> Patches 2 and 3 wire up direct-io and iomap respectively with the functions
> introduced in Patch 1 and set bio crypt contexts on bios when appropriate
> by calling into fscrypt.
> 
> Patches 4 and 5 allow ext4 and f2fs direct I/O to support fscrypt without
> falling back to buffered I/O.
> 
> This patch series was tested by running xfstests with test_dummy_encryption
> with and without the 'inlinecrypt' mount option, and there were no
> meaningful regressions. The only regression was for generic/587 on ext4,
> but that test isn't compatible with test_dummy_encryption in the first
> place, and the test "incorrectly" passes without the 'inlinecrypt' mount
> option - a patch will be sent out to exclude that test when
> test_dummy_encryption is turned on with ext4 (like the other quota related
> tests that use user visible quota files).

Note that xfstests has a check that prevents most of the direct I/O tests from
running when the 'test_dummy_encryption' mount option was specified:

_require_odirect()
{
        if [ $FSTYP = "ext4" ] || [ $FSTYP = "f2fs" ] ; then
                if echo "$MOUNT_OPTIONS" | grep -q "test_dummy_encryption"; then
                        _notrun "$FSTYP encryption doesn't support O_DIRECT"
                fi
        fi

We should try changing that check to not skip the test if the 'inlinecrypt'
mount option was also specified.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
