Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F97B0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2019 19:47:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsWDJ-000175-AM; Tue, 30 Jul 2019 17:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hsWDH-00016w-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 17:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sR23nmHyiVe22Hgxpe7nZb8Q3HO3fuRCtnTRyT9NPxo=; b=SQ+wWsc9ciJyfVDfms3IcypkmS
 cX3h1WI+ot9NoEm7jtJkSrFIc3+QdJUZlkixZx7i4/wmdaBST7nk/3r5HqMIKGV8He3+xGjRYL/O5
 D4hXZ1Bpk/PVbgogpdEP82Hbm1PMsnRr/6d4XCnphuLr1NfIMkp3OW2Y6TijU95/k0i8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sR23nmHyiVe22Hgxpe7nZb8Q3HO3fuRCtnTRyT9NPxo=; b=M
 L/GW1YZeQ3lhNPopk3IZAS5bkm7cu0f/Dqr36JQ+8Ed6WiJlYbuq7e0JCt/KflRMUR1KrD09ieXvz
 4lahtgHBCTmvikDH51tJIJw8f7Vw/TO+70vBXdkRfx108qk91MKKlv2HYN8IlZl02V5B30iP+6Ijr
 tX84Vk9qHaKBMSVw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsWDG-004Yx8-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 17:47:03 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C08F7216C8;
 Tue, 30 Jul 2019 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564508814;
 bh=XxM24s4XSayOjNPRJ7HKhR4zMsXlLabaIKs2PVhefD8=;
 h=Date:From:To:Cc:Subject:From;
 b=N4R7R1vSfUZLkDaIYHS0DO5SLEgIBeQOk438LX7yu37suVf2Jn0AUR3JAwfiNM3Qv
 T3iiAAYpjH4xY+QbnGNdHtQZHeEjR9H+808iWwuvRR+tc9qr7u/b22DPLmdbbuypGJ
 egKR8Ry3or+UFcVy5zczFkQU/VS0wFgpvHcyR884=
Date: Tue, 30 Jul 2019 10:46:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190730174653.GA76478@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsWDG-004Yx8-Rk
Subject: [f2fs-dev] [GIT PULL] f2fs-for-5.4-rc3
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

Could you please merge this to address some fixes introduced in 5.4-rc1?

Thanks,

The following changes since commit 964a4eacef67503a1154f7e0a75f52fbdce52022:

  Merge tag 'dlm-5.3' of git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm (2019-07-12 17:37:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.4-rc3

for you to fetch changes up to 38fb6d0ea34299d97b031ed64fe994158b6f8eb3:

  f2fs: use EINVAL for superblock with invalid magic (2019-07-28 22:59:14 -0700)

----------------------------------------------------------------
f2fs-for-5.4-rc3

This set of patches adjust to follow recent setflags changes and fix two
regression introduced since 5.4-rc1.

----------------------------------------------------------------
Eric Biggers (3):
      f2fs: use generic checking and prep function for FS_IOC_SETFLAGS
      f2fs: use generic checking function for FS_IOC_FSSETXATTR
      f2fs: remove redundant check from f2fs_setflags_common()

Icenowy Zheng (1):
      f2fs: use EINVAL for superblock with invalid magic

Jaegeuk Kim (1):
      f2fs: fix to read source block before invalidating it

 fs/f2fs/file.c  | 63 +++++++++++++++++++--------------------------------
 fs/f2fs/gc.c    | 70 ++++++++++++++++++++++++++++-----------------------------
 fs/f2fs/super.c | 48 +++++++++++++++++++--------------------
 3 files changed, 81 insertions(+), 100 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
