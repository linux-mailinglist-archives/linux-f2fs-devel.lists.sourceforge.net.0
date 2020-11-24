Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0092C34A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 00:28:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khhjh-00034I-FV; Tue, 24 Nov 2020 23:28:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khhjf-000344-QK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 23:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SYDTotrULOcmhfNxpwog7TJgd42lt5e2mZ3A58vYknY=; b=ge4KL+2JzvrUyh5r+Ehd+Pi3k6
 j87EmQHaJ7Nw7B1TMXkMWxZGXpadKGvWOLleNfsyI99bpW03Y6zp2gM/IRX43WHSLTyY1+PUM3OY9
 44/C9qzxeci3iIvTu7mxjxlZntf/s+dVU6vkb7CT6wQ1yIZRAY9sjqMAJlfPEmN3uu2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SYDTotrULOcmhfNxpwog7TJgd42lt5e2mZ3A58vYknY=; b=fBKXCHaATsHlj448LW2ppjaLX3
 UoXzjcc9y53aYQ8hTqhSpLP4vEoV8Zu6ID9otvTG4K2nAIQBuBu43m0M+RUud8NiTo9YqIR6EiYWS
 7Dlga6MmEK8Q1l2EjLBQAZlaFRW+1avdPU1of3LBsi/Dm2vVCQucCWPRGM874HcJhlpA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khhjW-002noL-KL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 23:28:35 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 213DF2100A;
 Tue, 24 Nov 2020 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606260496;
 bh=Oo4Tlzm+6V2f+cAlPJ1FnNFARv4c7gmBZzibGJ+KTPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xe5/qIrgFn//Ktx8T3FzD8iH+OmarHXR72XJec5aY3dKU9ct5j77kLudzv2sZf5oJ
 OGLz2xon5t1SKARHH1Shpa+fH+vE/ro2Dxh4IgiIiXhu9GMsszm9Js/C2MAv2yO0kf
 +eIj3mO0kFqZH0y5k2Aj81/VXm+rLTLYJc0plIV0=
Date: Tue, 24 Nov 2020 15:28:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <X72XDv89kSPWCqTQ@sol.localdomain>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khhjW-002noL-KL
Subject: Re: [f2fs-dev] [PATCH 0/5] fscrypt: prevent creating duplicate
 encrypted filenames
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 11:56:04PM -0800, Eric Biggers wrote:
> This series fixes a longstanding race condition where a duplicate
> filename can be created in an encrypted directory if a syscall that
> creates a new filename (e.g. open() or mkdir()) races with the
> directory's encryption key being added.
> 
> To close this race, we need to prevent creating files if the dentry is
> still marked as a no-key name.  I.e. we need to fail the ->create() (or
> other operation that creates a new filename) if the key wasn't available
> when doing the dentry lookup earlier in the syscall, even if the key was
> concurrently added between the dentry lookup and ->create().
> 
> See patch 1 for a more detailed explanation.
> 
> Patch 1 introduces a helper function required for the fix.  Patches 2-4
> fix the bug on ext4, f2fs, and ubifs.  Patch 5 is a cleanup.
> 
> This fixes xfstest generic/595 on ubifs, but that test was hitting this
> bug only accidentally.  I've also written a new xfstest which reproduces
> this bug on both ext4 and ubifs.
> 
> Eric Biggers (5):
>   fscrypt: add fscrypt_is_nokey_name()
>   ext4: prevent creating duplicate encrypted filenames
>   f2fs: prevent creating duplicate encrypted filenames
>   ubifs: prevent creating duplicate encrypted filenames
>   fscrypt: remove unnecessary calls to fscrypt_require_key()
> 
>  fs/crypto/hooks.c       | 31 +++++++++++--------------------
>  fs/ext4/namei.c         |  3 +++
>  fs/f2fs/f2fs.h          |  2 ++
>  fs/ubifs/dir.c          | 17 +++++++++++++----
>  include/linux/fscrypt.h | 37 +++++++++++++++++++++++++++++++++++--
>  5 files changed, 64 insertions(+), 26 deletions(-)
> 
> 
> base-commit: 3ceb6543e9cf6ed87cc1fbc6f23ca2db903564cd

All applied to fscrypt.git#master for 5.11.

I'd still appreciate acks for ext4, f2fs, and ubifs though.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
