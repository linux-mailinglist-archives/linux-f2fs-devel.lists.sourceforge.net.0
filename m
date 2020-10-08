Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E6287A90
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 19:06:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQZMz-0004Qd-99; Thu, 08 Oct 2020 17:06:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQZMx-0004QW-Cc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 17:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Q3Mm3gJVzGfrhz3Y+FQl16YOlJ3CQXn3ykzNiXZI7w=; b=N7b3Z2kZGwOMe7J3ulhNEjv8mL
 43DrMbfBHsU6jdbZfcNz4xgDe3eINBNdM2dzdbZmWncFl6uIqYaGitK1v/HZQwdv/2oVHOqEuVEmo
 kYz440yW5uNWiD6m+T014AqRSd4Mee6mktJXBj4muzyJjCbVrWn65FNKEhA2T5GhXBOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Q3Mm3gJVzGfrhz3Y+FQl16YOlJ3CQXn3ykzNiXZI7w=; b=AQOqawdQwWd6sYQMao+/w+k4lr
 D8RfhKMqx+yGGIgJYSSCDDG6oeHTuKp2Xy/yPTGPS55gMdmy1N+S6Q2gGLVSud6SGhJLqPKkaIf5V
 uRWgt5ggcjSo+WusJOFL3/7wGn/i5m3qGspvwrINMksl0SyCl3zJMWDi5k/Hv0Zg/nAs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQZMk-003Ivl-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 17:06:19 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F42921D7D;
 Thu,  8 Oct 2020 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602176753;
 bh=BcdaZq8ar4XX+2VOyCYshYDAMVSvt+n6/c1IW4iUOfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uAUcdYaozNytHFrBAl5SWYRuaP3ehrQ6a0xozh1La36HyBZjhclNRckdMr6HiV089
 pGp2BspU/uQTRZp4q1hL2s5YLQOgAezBVIQF2thcthMr8rmSUjU2COAtDCFt5NyjCQ
 KISB4BRgdtIWZEEo2y/XhRJBaQVViqg8cW79ABr0=
Date: Thu, 8 Oct 2020 10:05:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201008170551.GB1869638@gmail.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201005073606.1949772-3-satyat@google.com>
 <20201007205221.GA1530638@gmail.com>
 <20201007232806.GB2544297@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007232806.GB2544297@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kQZMk-003Ivl-KQ
Subject: Re: [f2fs-dev] [PATCH 2/3] fscrypt: Add metadata encryption support
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

On Wed, Oct 07, 2020 at 11:28:06PM +0000, Satya Tangirala wrote:
> > This needs Kconfig help text to describe what this feature is and why anyone
> > would want to enable it.  It also needs an update to
> > Documentation/filesystems/fscrypt.rst, and a test in xfstests that tests that
> > the encryption is being done correctly.
> > 
> Sure. I forgot to mention, fwiw I did hack xfstests to enable metadata
> encryption on each device to try to test the code, and also some other
> informal tests, but as you point out, I should send out actual xfstests
> to test this.

To be clear, I'm asking for tests which verify the actual ciphertext written to
disk.  So similar to _verify_ciphertext_for_encryption_policy() in xfstests, or
to vts_kernel_encryption_test in Android's VTS.

> > Perhaps fscrypt_set_bio_crypt_ctx() should call this?  It seems there should be
> > a single function that filesystems can call that handles setting the
> > bio_crypt_ctx for both file contents and metadata encryption.
> > 
> I mistakenly dismissed this idea when I was coding this up :( - I'll do
> this for the next version... I think it'll also make supporting direct I/O
> easier in future :) . Also, I might require FS_ENCRYPTION_INLINE_CRYPT
> when enabling FS_ENCRYPTION_METADATA to maybe make the code slightly
> cleaner (unless there's a reason we want to support metadata encryption
> without FS inline encryption being enabled?).

Since metadata encryption would already depend on FS_ENCRYPTION and
BLK_INLINE_ENCRYPTION, I think it would be fine to require
FS_ENCRYPTION_INLINE_CRYPT too, in order to reduce the number of combinations.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
