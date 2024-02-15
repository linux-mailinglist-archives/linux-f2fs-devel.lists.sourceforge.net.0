Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36A85583F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 01:16:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raPQm-0006Os-V6;
	Thu, 15 Feb 2024 00:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1raPQl-0006Of-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 00:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mOwL+EGIOBx/xim2ZXhrn61+VNM/cAXORgsz1BYVJQ=; b=XCY2gQ6j4hiR7/vhVJRhY2NJ/R
 1tzpF/a3GBJAepi/Z95rTbAHsd3o9wtYm7hm4SmSzVwyqG+hAQJ2RaNDKeE9sGPVwWihdZv8jWEIg
 ZbYrRKlhvjWeCqs1teK6IbdAIS723qKbnC9BTYqq3L1kdpR7K0SBn2j8pAcR80ZGKsPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5mOwL+EGIOBx/xim2ZXhrn61+VNM/cAXORgsz1BYVJQ=; b=RNCvLRbidB04qEscHV2eLF3N1N
 NZstJ4OlsczvOzxTt3q/suwJjO9tLRx4cUV+/l1LkdrdNiIMgRoZZAqFhmBz7uY11rPq946AlWZUb
 FKLFTCXfNdxVYnKfoPyceKkKbYH6WiZZNLxhV+niNkq2+nnyEzAEmTKzRGDAoxLArFyk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1raPQk-0006eT-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 00:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 79448CE234B;
 Thu, 15 Feb 2024 00:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCF9C433F1;
 Thu, 15 Feb 2024 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707956193;
 bh=ylFK6Bpi7O0s6j/9+mo/NrShh6U5P03/xrJn/rG4PpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VEvdwyv92kXe4udUPiYfbfA9b6N6wY5f05UN/tXpwXHit2VxdlHZZIQ4lvbl7JCb6
 fGYXD6oQSJ9SpdC361S/r4aUdmN4cyBhjtlCshylY1BOlBXnmc+mg7N+1s0hBW3kTz
 pIt0vbs66fOB1cWPiOnO1k/uVsWavea+HZjzPACrazcYPZSV+EvqjVs309elxkHM2A
 Z2qgQmP6d1NRO6s+/qrBmK+BA6yW/WOrypcYy7gygv260aFM2OVif9hW82XZub3Uhc
 DXBqhfAWjEU4KDEIHfzixirflHkeiWRiORgDXBCdku4/cEfJ/9n9YdZPUNTe4MlRSh
 G2KeHLq9+gT8w==
Date: Wed, 14 Feb 2024 16:16:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240215001631.GI1638@sol.localdomain>
References: <20240213021321.1804-1-krisman@suse.de>
 <20240213021321.1804-5-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213021321.1804-5-krisman@suse.de>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 12, 2024 at 09:13:15PM -0500, Gabriel Krisman
 Bertazi wrote: > From fscrypt perspective, once the key is available, the
 dentry will > remain valid until evicted for other reasons, since ke [...]
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1raPQk-0006eT-Gf
Subject: Re: [f2fs-dev] [PATCH v6 04/10] fscrypt: Drop d_revalidate once the
 key is added
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

On Mon, Feb 12, 2024 at 09:13:15PM -0500, Gabriel Krisman Bertazi wrote:
> From fscrypt perspective, once the key is available, the dentry will
> remain valid until evicted for other reasons, since keyed dentries don't
> require revalidation and, if the key is removed, the dentry is
> forcefully evicted.  Therefore, we don't need to keep revalidating them
> repeatedly.
> 
> Obviously, we can only do this if fscrypt is the only thing requiring
> revalidation for a dentry.  For this reason, we only disable
> d_revalidate if the .d_revalidate hook is fscrypt_d_revalidate itself.
> 
> It is safe to do it here because when moving the dentry to the
> plain-text version, we are holding the d_lock.  We might race with a
> concurrent RCU lookup but this is harmless because, at worst, we will
> get an extra d_revalidate on the keyed dentry, which is will find the
> dentry is valid.
> 
> Finally, now that we do more than just clear the DCACHE_NOKEY_NAME in
> fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
> extra costs.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

I think this explanation misses an important point, which is that it's only
*directories* where a no-key dentry can become the regular dentry.  The VFS does
the move because it only allows one dentry to exist per directory.

For nondirectories, the dentries don't get reused and this patch is irrelevant.

(Of course, there's no point in making fscrypt_handle_d_move() check whether the
dentry is a directory, since checking DCACHE_NOKEY_NAME is sufficient.)

The diff itself looks good -- thanks.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
