Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBF1DC25D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 00:52:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbXZR-0002KR-4b; Wed, 20 May 2020 22:52:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jbXZQ-0002KK-9E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 22:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1k9dPbpSTer4C/ycvJ7+IweWQFk7HDRsMJk8qir9Mu4=; b=ZBTRjgVLCLrxJw3UTud3Z7NBis
 Cx2dG1GPpX4LF87xJeYkG6DwGZeeG8zhShc1HG9zQtt+9/z8HdNG8BEF/i0/eGC+BMtg63dXblLkW
 VmhFL994Jt8pvXJRj9ve6vevfju9oBmQbG9VJX8hqYtVvdTncj8JMnI/t9/9dqirm3Kg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1k9dPbpSTer4C/ycvJ7+IweWQFk7HDRsMJk8qir9Mu4=; b=T5kzw7GJ7PG/2oM05fVJmTJd3j
 2gvEspAJVUwSkgATrwuE5uiytQG9eJVjTOtpIBTLMSFbC8F6H9AscYAyCFX2n313xgATlbiClHT6O
 1lTwdSbtWBJjVFnTGOVC7gDibt+qGFlZiQbTUvhiM2Lh54atgGWSZN60j/irkle3AgZ0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jbXZK-00HDIw-DY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 22:52:16 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B404B20708;
 Wed, 20 May 2020 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590015117;
 bh=6M3UYo+lP4Q5z8KTNc19X5qmKIkadqyM78V5Jg8RXbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPehf3XhcpNB7X6B3CiBoI7ZapLjg/nHI9yc9SOZCLTPYGTvrUEX3TRqF5urCONVK
 USocpsRQnusCnpqILdPycSQVoAycXT6zYTzN7NkzClff5GwImZ0Lw5+pzY5doXvIPQ
 aMff7m8l+ehp2CY09IEyUY+NBdO5ULxIlnq8KQEw=
Date: Wed, 20 May 2020 15:51:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200520225156.GA19246@sol.localdomain>
References: <20200511191358.53096-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511191358.53096-1-ebiggers@kernel.org>
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
X-Headers-End: 1jbXZK-00HDIw-DY
Subject: Re: [f2fs-dev] [PATCH 0/3] fscrypt: misc cleanups
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 11, 2020 at 12:13:55PM -0700, Eric Biggers wrote:
> In fs/crypto/ and fscrypt.h, fix all kerneldoc warnings, and fix some
> coding style inconsistencies in function declarations.
> 
> Eric Biggers (3):
>   fscrypt: fix all kerneldoc warnings
>   fscrypt: name all function parameters
>   fscrypt: remove unnecessary extern keywords
> 
>  fs/crypto/crypto.c          |   9 +-
>  fs/crypto/fname.c           |  52 +++++++++---
>  fs/crypto/fscrypt_private.h |  88 +++++++++----------
>  fs/crypto/hooks.c           |   4 +-
>  fs/crypto/keysetup.c        |   9 +-
>  fs/crypto/policy.c          |  19 ++++-
>  include/linux/fscrypt.h     | 165 ++++++++++++++++++------------------
>  7 files changed, 193 insertions(+), 153 deletions(-)
> 

All applied to fscrypt.git#master for 5.8.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
