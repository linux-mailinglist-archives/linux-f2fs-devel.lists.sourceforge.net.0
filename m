Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 274932B8459
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 20:06:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfSmn-0000N3-32; Wed, 18 Nov 2020 19:06:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfSmW-0000Ln-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 19:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9S6JkwW5IT2Uv9xy8+ZnnG+IPAtqPKmFqKtv9oPCakQ=; b=j9JWnWU/rbBL7e1A3fWTEbqzyg
 DAIeDkB5yyAfM//KT9RmNu/ie3nMz3JA4S2Uj8j3ZyEVbsIU5cEcnQEVjbgDx6hdRagOH8pIpabCb
 0Xw3OqKBTh80xkZjkyJzbQARAZKvVbLwP1grRPeXpcvK46Q3JrcqaaJqYg1GJCIXEozk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9S6JkwW5IT2Uv9xy8+ZnnG+IPAtqPKmFqKtv9oPCakQ=; b=cVU31hlW/bb7R1lsUP6NiIAO7H
 QRQsKZIw3hoxkPq9LqX4gD/7heDi+KwLZi2pRsZJ5BLw5Sui7Itv4pj9b9jHXilx6CLpX62CjeksB
 jEablRpRMlehoh4ePpHeWeAoaTmLqtKFunMcOj0yU7VY9kMpBERHjcXfe0yFc/rC1b08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfSmN-00ELns-OR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 19:06:16 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9639220B1F;
 Wed, 18 Nov 2020 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605726357;
 bh=czhwXJzBR4zdRxRmpiz6/CDV6S0jGgxbOLv7GLXvEi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UjOF4cr4HY06mtasTjDvTwJSyxBGG8YJAp+6mdTN+4xE8fSYavbczWX1lWh//WqVo
 rVQRLoTh1cbSKnB2SOlxbd17YT9Ed1+EP0inyaWja+lnpiyWvsNYG7igsxzyw9MeTg
 vYcQGBsopsYIMipvK1Y5rj7tjY+R+FNEWIA1tzVo=
Date: Wed, 18 Nov 2020 11:05:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <X7Vwkgb8tqJh+mOr@sol.localdomain>
References: <20201118064245.265117-1-drosen@google.com>
 <20201118064245.265117-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118064245.265117-4-drosen@google.com>
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
X-Headers-End: 1kfSmN-00ELns-OR
Subject: Re: [f2fs-dev] [PATCH v3 3/3] f2fs: Handle casefolding with
 Encryption
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 18, 2020 at 06:42:45AM +0000, Daniel Rosenberg wrote:
> Expand f2fs's casefolding support to include encrypted directories.  To
> index casefolded+encrypted directories, we use the SipHash of the
> casefolded name, keyed by a key derived from the directory's fscrypt
> master key.  This ensures that the dirhash doesn't leak information
> about the plaintext filenames.
> 
> Encryption keys are unavailable during roll-forward recovery, so we
> can't compute the dirhash when recovering a new dentry in an encrypted +
> casefolded directory.  To avoid having to force a checkpoint when a new
> file is fsync'ed, store the dirhash on-disk appended to i_name.
> 
> This patch incorporates work by Eric Biggers <ebiggers@google.com>
> and Jaegeuk Kim <jaegeuk@kernel.org>.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Looks good.  If it's needed (some may claim it's not needed because I have a
Co-developed-by), you can add:

	Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
