Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13150E644
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Apr 2022 18:54:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nj1yr-0008VT-7f; Mon, 25 Apr 2022 16:54:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nj1yq-0008VN-5q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 16:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4lxQ6zI7ZKNZxwdI4ipG70rNRsaGF4u4B2eMXAbQRrM=; b=d7VD7JsTk960GPYN9XRCPM4VoF
 kgNImwNqWwUjVikVPqlXvO8T34lgR3BYHx8h/jPU8C0aRIIGV3oG0WhlZ/fFb+2oNmpC4EoqWIp/t
 8sTe6TX5xroEGNhuoxsG5road/9kHWPfsylTBHcjjuHgJUcRWnc9RL0YaHvhYaiD5Yw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4lxQ6zI7ZKNZxwdI4ipG70rNRsaGF4u4B2eMXAbQRrM=; b=E
 xudrMRay7FYjRAEpX6tpFaT7nQEOLadnVkPCL4dVnCC+HfeDamdkZpsqotE3IDlTeit0sGTJbSB+f
 LfOSUVXPwKLpQfNXHn4wDIvFXz6HdxAWpimc0XKbGNq8UGSFRECG8is0kOqyj0bs/JKf+dkE62byl
 n3FFWUnbg9koRKTU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nj1yl-0003iQ-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 16:54:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58E48B81905;
 Mon, 25 Apr 2022 16:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E4DC385A4;
 Mon, 25 Apr 2022 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650905660;
 bh=LAvXRisArrRdEcB0PKg1yD+9tEfDqEzSgD//WM5MfZI=;
 h=Date:From:To:Cc:Subject:From;
 b=OaQIKlE3ZclurMEiaNRU+4W58DXIBbh9proFJJCfC9SknLZMZxCxySZXN2gfMNj65
 KYE0BgQqXgAgskJNbUgyrrzrQBRKopXYfgvWyuXCNXyHB34hWboynf1+SsqtR81jhA
 VETHmfzfHhTkelRjMsSGGtlhnW6YhpaD9m4VnC8lTXVk0VlcUX230WjlFedhjovXKm
 KOkuR+liHyAhQ+z4cypFnuUEFuXTp6Uqs27AKbB3wy0QeFlLnj+Vb2j9cQKBmX0NJ5
 wI/aRatPYgP+s7/zqox0Yimb0TVfbU9a6C9FsNNzH6AqGVQd97ovtC+SwEFo6fijFH
 0eNNXHqZQ1XoQ==
Date: Mon, 25 Apr 2022 09:54:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YmbSOkjjP5ekfcGk@google.com>
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nj1yl-0003iQ-Lo
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 5.18
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

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-5.18

for you to fetch changes up to 4d8ec91208196e0e19195f1e7d6be9de5873f242:

  f2fs: should not truncate blocks during roll-forward recovery (2022-04-21 18:57:09 -0700)

----------------------------------------------------------------
f2fs-fix-5.18

This includes major bug fixes introduced in 5.18-rc1 and 5.17+.

- Remove obsolete whint_mode (5.18-rc1)
- Fix IO split issue caused by op_flags change in f2fs (5.18-rc1)
- Fix a wrong condition check to detect IO failure loop (5.18-rc1)
- Fix wrong data truncation during roll-forward (5.17+)

----------------------------------------------------------------
Jaegeuk Kim (4):
      f2fs: remove obsolete whint_mode
      f2fs: keep io_flags to avoid IO split due to different op_flags in two fio holders
      f2fs: fix wrong condition check when failing metapage read
      f2fs: should not truncate blocks during roll-forward recovery

 Documentation/filesystems/f2fs.rst | 70 ----------------------------
 fs/f2fs/checkpoint.c               |  6 +--
 fs/f2fs/data.c                     | 33 ++++++++-----
 fs/f2fs/f2fs.h                     |  9 ----
 fs/f2fs/inode.c                    |  3 +-
 fs/f2fs/segment.c                  | 95 --------------------------------------
 fs/f2fs/super.c                    | 32 +------------
 7 files changed, 27 insertions(+), 221 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
