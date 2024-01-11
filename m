Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA882A6B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 04:55:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNm9p-00008E-HH;
	Thu, 11 Jan 2024 03:55:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rNm9n-000088-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 03:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ClpuSunGho9f1gLvvhuLtowdRqHe7r4i6hpvhMTKN9U=; b=YL+kLNXyNz29l3Tf5ph9jUIksD
 +KxJHg59TCceWlVBtBWGtB9X56/iBNuOh6G0M+i/TJyyew+nTx8Azstw1P6WJfcmvb+Gtqq9UVb+s
 JILnWbtMy6/oOwgLEPttKoRrtGrDXmosG83myMcVNhM56XclsiydD4sjFmUoMQokC4aU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ClpuSunGho9f1gLvvhuLtowdRqHe7r4i6hpvhMTKN9U=; b=U4Svq+R8HE7EPWpKeV2RykQ57H
 ZfYEp8lwJQ17S+sn3sUwzJTJjw7tCNW4OQhfJy+xkQZ0PmibtmPymD4pdLwh+Zsh26pnyPUHvyw/F
 JHGIZE5fusdmmO+s+OO+7b5pb3b5HqOo3RX1mdwoANyhw4gMyJ+F0gGsc03bx8WMr/9A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNm9i-0000D7-U9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 03:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 336ABCE1E4B;
 Thu, 11 Jan 2024 03:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBC5C433F1;
 Thu, 11 Jan 2024 03:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704945286;
 bh=72ivCjl5dJtBmZbh/NqHldmjpyUkgHUjTtMsl2+EJXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N00HjlJaqIIpwtxvgkzp1hc0w21pAr2mfxFbAOOBJ4+tUE+wv3INEvh2zAPy147Hu
 fYLnEsF1lSJPmdtwP3v6F7IBCAINb6p6T/gGpzSHcmna9TsDGPNe+ZVMFJozQivHHD
 esEWMTYeAi0AI/S1x70TE1XwuljaYHVxXBM6zGjouG1P2JlP+S00vYnrlk/XQ3dfnX
 N2GOjDKVdmSwl8tcm7SkIc0dyAM9czqe7MOoCQUVoGy2O/yn/nllKYM8BODCivrapH
 d5QdAU7Zk0GWZGCtJq3bI1yMK9KTPQ9zvfItD4jvkMrPJVbh5klhgI+cGNFp5JpYxo
 D2UerbxU2uc2Q==
Date: Wed, 10 Jan 2024 19:54:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20240111035444.GA3453@sol.localdomain>
References: <20231121223909.4617-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121223909.4617-1-ebiggers@kernel.org>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 21, 2023 at 02:39:05PM -0800, Eric Biggers wrote:
 > This series adds a test that verifies the on-disk format of encrypted >
 files that use a crypto data unit size that differs from the fil [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNm9i-0000D7-U9
Subject: Re: [f2fs-dev] [PATCH v2 0/4] xfstests: test custom crypto data
 unit size
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 21, 2023 at 02:39:05PM -0800, Eric Biggers wrote:
> This series adds a test that verifies the on-disk format of encrypted
> files that use a crypto data unit size that differs from the filesystem
> block size.  This tests the functionality that was introduced in Linux
> 6.7 by kernel commit 5b1188847180 ("fscrypt: support crypto data unit
> size less than filesystem block size").

Hi Zorro, can you consider applying this series?  It's been out for review for
3 months, so I don't think reviews are going to come in.  The prerequisite
xfsprogs patch is already present on the for-next branch of xfsprogs.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
