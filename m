Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C455A599
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jun 2022 02:41:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4trN-0008C7-C6; Sat, 25 Jun 2022 00:41:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o4trL-0008C0-JR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jun 2022 00:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ric6jwY9+Ayjmk1zbLIi03OdqZbi7dzz+ypKZ+unWHU=; b=CTrdHpWmaX1P5DrFOAgIIxubRA
 rDgzL7B21HwHO1VH/P7lrgMzluMIeFSO3bd28VC1p9f69eTFge5ecs2zfbzSFS3V6hC/v2BwUwgX2
 59TvVZYgMVFLm9I6gkxDox89JGpmH7WNsblnmu1z8vNNHJLvpxSGsonkz9qgeqW8iGDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ric6jwY9+Ayjmk1zbLIi03OdqZbi7dzz+ypKZ+unWHU=; b=O
 lse9hv64xCHi0uJZ2K9AYM6gKembCk9sWZxoPpHIybzIt0jTAXN+KwvaiszTnyQ75nWXCz7xYdWgF
 HzNRgKckmlJ5l/GiFLPEmEhWABIutIvzuV0tc/mm1WO1icxQLwwLmF9hWBSx2gJ5HUEAxOu51acqT
 9VuwRUvdWlMPb1u0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4trK-0008LQ-QU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jun 2022 00:41:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 971C561BE2;
 Sat, 25 Jun 2022 00:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF338C34114;
 Sat, 25 Jun 2022 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656117660;
 bh=lU23NS8nQUbjGYr2lzn5fx8XEUUBMrQ76dRDXjq9je8=;
 h=Date:From:To:Cc:Subject:From;
 b=DPZaIOLGXmUemkb1VVJqcZO5brXgDTBRmYtI/Sk0XpBS9/btQ750gYD6uV6h/AcmF
 A4rg/Gtz8uNXkPsAU8ac3pGth/vsfCRrrWoHBPe1Oc7MV+FQROs2qX/DBd1YzugyhP
 nXrBR1kXY0zgNjWGhJBo5+meV7vrHza2Q7hKG2nSKx1lPCfogy+VObvX2U/LrhSNGb
 QBHf3y/HT4qW+5N2XVDfBkqFvC/akrJIMA6WbVHW6/e2O+UIrJeNl3AJ/wBhNEPMTA
 fqxaWmjo5xhW/iCwtT0F98KlntsITJJNyVsvOnLEV/DDRfgsZ1G0hN+1M4+LEFvhre
 FcQxNO6erzS0w==
Date: Fri, 24 Jun 2022 17:40:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YrZZmp8qBSDM28iy@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4trK-0008LQ-QU
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 5.19-rc4
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.19-rc4

for you to fetch changes up to 82c7863ed95d0914f02c7c8c011200a763bc6725:

  f2fs: do not count ENOENT for error case (2022-06-21 08:29:56 -0700)

----------------------------------------------------------------
f2fs-fix-5.19

This includes some urgent fixes to avoid generating corrupted inodes
caused by compressed and inline_data files. In addition, another patch
tries to avoid wrong error report which prevents a roll-forward
recovery.

----------------------------------------------------------------
Daeho Jeong (1):
      f2fs: fix iostat related lock protection

Jaegeuk Kim (2):
      f2fs: attach inline_data after setting compression
      f2fs: do not count ENOENT for error case

 fs/f2fs/iostat.c | 31 ++++++++++++++++++-------------
 fs/f2fs/namei.c  | 17 +++++++++++------
 fs/f2fs/node.c   |  4 +++-
 3 files changed, 32 insertions(+), 20 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
