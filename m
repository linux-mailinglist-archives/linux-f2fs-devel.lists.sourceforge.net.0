Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC12E7BBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 19:02:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kufnX-0000rg-Nx; Wed, 30 Dec 2020 18:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kufnX-0000rT-2S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 18:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C114N6DT/of0HUWtJEroVeqEHZpXGaS3KkcANDpfUE0=; b=ZYcU9BZlSyuDEV1i3hXgkCtVbx
 piyciINfWqMHI6jHlqMc+I5J1KiBudgGOKAU4MMrXV0nf7IdMf+tcEosKh0pFJRyso4SwW84dOkcL
 Ne91UnZ52BQt6Ao9CUXY793GOlzvv4mYFQF4ckV5c1r0MmmOEfvLJb6PPCBSzxfF3y8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C114N6DT/of0HUWtJEroVeqEHZpXGaS3KkcANDpfUE0=; b=X2qLGp+E90U7rTc+v5auE57NGB
 KZ/8VzgvJ8wDHGBRNIV4Aa7wNogWBKt/beqRS/r6bTctlF7OLAkqcWgL1QfgQan/hNOXxD8UszWv9
 6CpQsylLetQeYyh6KyPuA6qhIE5vm9sl+rljVr0NqMxbLplna1iiA9MVEkyFSf2kVUpU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kufnP-009Wv5-9y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 18:02:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DE9C22287;
 Wed, 30 Dec 2020 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609351317;
 bh=1EEHMEPXKBgaCrorRSDRdGyZ2w5tbvnf1YgxY5j8NVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tU8Q28xTgSvY0NTPdbWeODcyYzhRYoozlDWcxAqqbcfrDDo+bkO2k5j8Yop0iJNHD
 CBOZd1nQ++IXpbg5/9ToK/BF85rVtqXkDdtJr6yIVrlEXu2ionquerG8HWPrG+VskS
 UJfJIOPERNA2d3MvGbAiQiPDYMYiKrbOP4ec/GIl6Ct4yxy9pvYLiDyocMDRV6NL22
 mwoqQ1HLmnk/5lmxvqIQrDVv0P7b8pU1XqiBMEfPMMDGe6cuCfB6D7bbjmiNWqx862
 ssbWWVyU9ClV29V3lco8LoVnH2AeO6T2aYPsuNUdlx/dXnGJZcLuXPrOFPzY1Runzr
 rYOkr93Wo7wcg==
Date: Wed, 30 Dec 2020 10:01:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <X+zAlEu+0JSvXaMu@sol.localdomain>
References: <20201230130314.3636961-1-sashal@kernel.org>
 <20201230130314.3636961-10-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230130314.3636961-10-sashal@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kufnP-009Wv5-9y
Subject: Re: [f2fs-dev] [PATCH AUTOSEL 5.10 10/31] f2fs: Handle casefolding
 with Encryption
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 30, 2020 at 08:02:52AM -0500, Sasha Levin wrote:
> From: Daniel Rosenberg <drosen@google.com>
> 
> [ Upstream commit 7ad08a58bf67594057362e45cbddd3e27e53e557 ]
> 
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
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Please don't backport this to the LTS kernels.  This is a new feature, not a
fix, and you missed prerequisite patches...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
