Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E41684A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:16:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5Buh-0002o2-PU; Fri, 21 Feb 2020 17:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5Buf-0002nk-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TG1J0QEN8vtXrDo5SIOihTOZ3644WbOpFHicNAGsZlg=; b=IqB+sn0Apu9kTzfTx1tKGDTAHL
 IZFzCdH/4LNFomocrAiKErSwvUZzRCMztFwS6dyMGd/zQOd1vGvfKX/aE02gAHkAyF4m/uaM8tvel
 RanBmcuA5mKTyKwvbJNcPf/EiL4XA7+MeWBIXV9wmI1MwM5pQx38S/TUIZBqxkBGn1kM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TG1J0QEN8vtXrDo5SIOihTOZ3644WbOpFHicNAGsZlg=; b=VyXFbpE7cIKmMDNA0C3ocRXFmw
 h9jHazRzsva4tb4iJh+zrqOk5lnhoyZ5Y21SHB7h3PENBVpajIHpn/5iOlL3H3RcgTPuCZRk0QqqU
 cj6Nx7eACO8Yn/a3XM18xIDDju1niakXT+60ai/ckTqSuZrdACqWWreZhILptoAdQtus=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5Bub-00CtvY-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:16:29 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FE1120722;
 Fri, 21 Feb 2020 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582305378;
 bh=f7XISsFA2QC0w/nx2FlF5io26u2rX8x02+f2m36Terk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUMgltUN0yBYHaOQ/aFBIrwhAcNKwA/PidYmHPX0ru5LvhjorfIwbqZOol1EvfYsK
 VeORKw1WbgCjocqzfsl5wqb+sEO7waw35VMZot7+g7pVbI6jCVMTJXOrV3suKf89Oc
 nc/Eio5QXHdx2IMwppF5L+NMMmWr8d73CkTSTRFA=
Date: Fri, 21 Feb 2020 09:16:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221171617.GA925@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-1-satyat@google.com>
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
X-Headers-End: 1j5Bub-00CtvY-Ds
Subject: Re: [f2fs-dev] [PATCH v7 0/9] Inline Encryption Support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:41AM -0800, Satya Tangirala wrote:
> This patch series adds support for Inline Encryption to the block layer,
> UFS, fscrypt, f2fs and ext4.
[...]
> Changes v6 => v7:
>  - Keyslot management is now done on a per-request basis rather than a
>    per-bio basis.
>  - Storage drivers can now specify the maximum number of bytes they
>    can accept for the data unit number (DUN) for each crypto algorithm,
>    and upper layers can specify the minimum number of bytes of DUN they
>    want with the blk_crypto_key they send with the bio - a driver is
>    only considered to support a blk_crypto_key if the driver supports at
>    least as many DUN bytes as the upper layer wants. This is necessary
>    because storage drivers may not support as many bytes as the
>    algorithm specification dictates (for e.g. UFS only supports 8 byte
>    DUNs for AES-256-XTS, even though the algorithm specification
>    says DUNs are 16 bytes long).
>  - Introduce SB_INLINECRYPT to keep track of whether inline encryption
>    is enabled for a filesystem (instead of using an fscrypt_operation).
>  - Expose keyslot manager declaration and embed it within ufs_hba to
>    clean up code.
>  - Make blk-crypto preclude blk-integrity.
>  - Some bug fixes
>  - Introduce UFSHCD_QUIRK_BROKEN_CRYPTO for UFS drivers that don't
>    support inline encryption (yet)

This patchset can also be retrieved from

	Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
	Tag: inline-encryption-v7

For review purposes I also created a tag
inline-encryption-v6-rebased-onto-v7-base which is the v6 patchset rebased onto
the same base commit (v5.6-rc2).  So it's possible to see what changed by

	git diff inline-encryption-v6-rebased-onto-v7-base..inline-encryption-v7

(Although, I had to resolve conflicts in fs/crypto/ to do the rebase, so it's
not *exactly* v6.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
