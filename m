Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9F868903
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 07:36:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rer4k-0007Ca-8K;
	Tue, 27 Feb 2024 06:36:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rer4i-0007CT-LK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Esne05Xg/2+FYn1gPTCPuX94UvkRu95MFCnEvRPRHOU=; b=ReTg0yBqmuEFdaZtTlgFCES23Q
 ilHc83KQKP2QlgjUoT76Flerus2pCmF3XLTu5V9YXNJf/hm9TGoWehQRseyEtXk+1c9XiKMtlOwts
 amexEnHLnz4X1s+PGM145HS3wMxf6deKs4fksu1BLMZgb/Ce+mX5gkMstKPrfGJKbpUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Esne05Xg/2+FYn1gPTCPuX94UvkRu95MFCnEvRPRHOU=; b=aoiVr0Q8ZgrrFb0Vr1XqRDe38P
 D4YJVw66W/B98xUqU2wDxnyD6WCdP+lg9Ys03gDWUVbYV1fkhGHXS10MnqtO0Xn41g0DtZJGht08L
 BRqBCluzu9jvXpVUmGs0eUraCcQz9q5glWvKUuS6217T/GqiVuJ04lj2P0P/9r6RaC8w=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rer4h-0004tS-OU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0CCA6CE1BC4;
 Tue, 27 Feb 2024 06:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0E8C433C7;
 Tue, 27 Feb 2024 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709015776;
 bh=BnWI1QlWvLT8QiqmYWbI9nYOFqfqKjduJfF+ni+ECWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAON0pASJNwPRPdlYDWOlNy5thVAd1zfXGGDMD9tvgdhVDaM5MNasI2hsJeAog4tq
 7CTK3YUoVpDtoSiwjBCcs1j8vsWNtuNltYFB2rpX5BA8lpn/ER+fi+uVYOiaslWRaB
 XPj3t5FLRAz5a4gWlqFvqfHWQNMawq6j6zD6CqvUGJ5fmaW9ltX7XUqs0garIZvcAE
 r/1CDWmMln2ZZ5SQzUh1yg3TkgSgQvG07KDx7Dn5Yr5UCvCMi2QH8Z/wIrLCX2XwrE
 F9TjgMeBF2H5Lxr7j46Wnvh/8W/qUtLTUWQRcH3QLnYc5/msk+7Cw58aZIFQhiiARk
 tYei7ksoL52xQ==
Date: Mon, 26 Feb 2024 22:36:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240227063614.GB1126@sol.localdomain>
References: <20240221171412.10710-1-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 21, 2024 at 12:14:02PM -0500, Gabriel Krisman
 Bertazi wrote: > > When case-insensitive and fscrypt were adapted to work
 together, we moved the > code that sets the dentry operations for ca [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rer4h-0004tS-OU
Subject: Re: [f2fs-dev] [PATCH v7 00/10] Set casefold/fscrypt dentry
 operations through sb->s_d_op
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
Cc: brauner@kernel.org, tytso@mit.edu, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 21, 2024 at 12:14:02PM -0500, Gabriel Krisman Bertazi wrote:
> 
> When case-insensitive and fscrypt were adapted to work together, we moved the
> code that sets the dentry operations for case-insensitive dentries(d_hash and
> d_compare) to happen from a helper inside ->lookup.  This is because fscrypt
> wants to set d_revalidate only on some dentries, so it does it only for them in
> d_revalidate.
> 
> But, case-insensitive hooks are actually set on all dentries in the filesystem,
> so the natural place to do it is through s_d_op and let d_alloc handle it [1].
> In addition, doing it inside the ->lookup is a problem for case-insensitive
> dentries that are not created through ->lookup, like those coming
> open-by-fhandle[2], which will not see the required d_ops.
> 
> This patchset therefore reverts to using sb->s_d_op to set the dentry operations
> for case-insensitive filesystems.  In order to set case-insensitive hooks early
> and not require every dentry to have d_revalidate in case-insensitive
> filesystems, it introduces a patch suggested by Al Viro to disable d_revalidate
> on some dentries on the fly.
> 
> It survives fstests encrypt and quick groups without regressions.  Based on
> v6.7-rc1.
> 
> [1] https://lore.kernel.org/linux-fsdevel/20231123195327.GP38156@ZenIV/
> [2] https://lore.kernel.org/linux-fsdevel/20231123171255.GN38156@ZenIV/
> 
> Gabriel Krisman Bertazi (10):
>   ovl: Always reject mounting over case-insensitive directories
>   fscrypt: Factor out a helper to configure the lookup dentry
>   fscrypt: Drop d_revalidate for valid dentries during lookup
>   fscrypt: Drop d_revalidate once the key is added
>   libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>   libfs: Add helper to choose dentry operations at mount-time
>   ext4: Configure dentry operations at dentry-creation time
>   f2fs: Configure dentry operations at dentry-creation time
>   ubifs: Configure dentry operations at dentry-creation time
>   libfs: Drop generic_set_encrypted_ci_d_ops
> 
>  fs/crypto/hooks.c       | 15 ++++------
>  fs/ext4/namei.c         |  1 -
>  fs/ext4/super.c         |  1 +
>  fs/f2fs/namei.c         |  1 -
>  fs/f2fs/super.c         |  1 +
>  fs/libfs.c              | 62 +++++++++++---------------------------
>  fs/overlayfs/params.c   | 14 +++++++--
>  fs/ubifs/dir.c          |  1 -
>  fs/ubifs/super.c        |  1 +
>  include/linux/fs.h      | 11 ++++++-
>  include/linux/fscrypt.h | 66 ++++++++++++++++++++++++++++++++++++-----
>  11 files changed, 105 insertions(+), 69 deletions(-)
> 

Looks good,

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
