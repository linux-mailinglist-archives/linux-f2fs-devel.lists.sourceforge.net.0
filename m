Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD51E11D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2020 17:33:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdF6x-0005ki-Ap; Mon, 25 May 2020 15:33:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jdF6v-0005kZ-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQKLjUh/QGT1GLbCPOkHX0KapVw9OLvm4DKpf9aOWkU=; b=VC61VgbqhlQab9xWeGFOLvAVYm
 iNvN//noWaSrbuD8LA0wVx8t7QcmbblAm4fACpeXrsNVYGQnqtx7ZOsbKB6phIdLSWejvjlw85Hrc
 P2VufuEREecDKoDa1+41WEQqr/OBZiqZo2sgSUV7Vp5bV9ABKErHvEKqUDEYbN2VuQfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQKLjUh/QGT1GLbCPOkHX0KapVw9OLvm4DKpf9aOWkU=; b=kFP4CQ2TE8Yob1zc0dMo1QR6e9
 JSjIUPE0Rj1HE8S9P0OO80n/Xn8Jva0Zb0uryzrtPdUGg6AfgJIXgp+iXVoWRhRxnLtKEG+20X0Dw
 LNju8D1Q7cQcwrXI7+6G7xLy4bOX49eU/jGwD2XgW21HDjcTY8qxhWun0NeFDD6uKpYU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdF6t-005oGt-SH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:33:53 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D41B2071A;
 Mon, 25 May 2020 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590420814;
 bh=/lRcApMN9bchgxQmdRuHru0M8nV62fiOyAvgNyyKOqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FkSvkKrkHrQNmOS5J/o9VjrQqOrK15S4n8hbD/X0fyIUhr7F42waBhGQOqj/6HAJx
 tyzcpYbp9yyCxo7RvSbHabJpYOQEmcyfJ+E1oVol2cFd97D1c/VRNotZIGgME0uUKv
 pVg9kv2JyeNisFfbKjtrNkuNbJM87euAu3sXNQ6I=
Date: Mon, 25 May 2020 08:33:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200525153320.GA2152@sol.localdomain>
References: <20200515204141.251098-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515204141.251098-1-ebiggers@kernel.org>
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
X-Headers-End: 1jdF6t-005oGt-SH
Subject: Re: [f2fs-dev] [PATCH] fscrypt: add support for IV_INO_LBLK_32
 policies
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
Cc: Satya Tangirala <satyat@google.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 15, 2020 at 01:41:41PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The eMMC inline crypto standard will only specify 32 DUN bits (a.k.a. IV
> bits), unlike UFS's 64.  IV_INO_LBLK_64 is therefore not applicable, but
> an encryption format which uses one key per policy and permits the
> moving of encrypted file contents (as f2fs's garbage collector requires)
> is still desirable.
> 
> To support such hardware, add a new encryption format IV_INO_LBLK_32
> that makes the best use of the 32 bits: the IV is set to
> 'SipHash-2-4(inode_number) + file_logical_block_number mod 2^32', where
> the SipHash key is derived from the fscrypt master key.  We hash only
> the inode number and not also the block number, because we need to
> maintain contiguity of DUNs to merge bios.
> 
> Unlike with IV_INO_LBLK_64, with this format IV reuse is possible; this
> is unavoidable given the size of the DUN.  This means this format should
> only be used where the requirements of the first paragraph apply.
> However, the hash spreads out the IVs in the whole usable range, and the
> use of a keyed hash makes it difficult for an attacker to determine
> which files use which IVs.
> 
> Besides the above differences, this flag works like IV_INO_LBLK_64 in
> that on ext4 it is only allowed if the stable_inodes feature has been
> enabled to prevent inode numbers and the filesystem UUID from changing.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/filesystems/fscrypt.rst | 33 +++++++++--
>  fs/crypto/crypto.c                    |  6 +-
>  fs/crypto/fscrypt_private.h           | 20 +++++--
>  fs/crypto/keyring.c                   |  5 +-
>  fs/crypto/keysetup.c                  | 85 +++++++++++++++++++++------
>  fs/crypto/policy.c                    | 51 +++++++++++-----
>  include/uapi/linux/fscrypt.h          |  3 +-
>  7 files changed, 157 insertions(+), 46 deletions(-)

Applied to fscrypt.git#master for 5.8.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
