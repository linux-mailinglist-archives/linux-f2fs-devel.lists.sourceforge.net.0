Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FF2B2769
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 22:46:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdgtr-0000I8-Gx; Fri, 13 Nov 2020 21:46:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdgVG-0004y4-M6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3UmNZnPkUJtCfAGR3C4bKywnnuJ/wAmhVCorgpzW9gY=; b=G+dVNbKFQKvDTtdjj+iOkMa2os
 qJVlljzVpzeMi7/qeEEMihgawQZTFq998WZTRngzEgWSCxi8Xlnoj2O7UE/pEaZ5ayElCfyrQN3tb
 bahYQENP2yt8vaDA5o0ymYmF/2cEi2ncdPWNUTXhktRiYuDmv8baZXDO2SYV+7K6btic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3UmNZnPkUJtCfAGR3C4bKywnnuJ/wAmhVCorgpzW9gY=; b=h
 /+pEYWYhmbR2/CE4+kg/Hy55Yjw0a5h1Xg5Eg/l1myZlGv8McxBp9LQ7DgcSJ2GVAHFwJa7i8PABg
 1wv13a0T13bCTtTORznt/QOUTQW6GqiyibY6HRPqY+GvoOV4739KdMLYMqZI+G9acUWKGazGnBZ9h
 A2RI77sW0aroMiIM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdgVA-00At49-HY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:06 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9498F2224D;
 Fri, 13 Nov 2020 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605302447;
 bh=lHG67jCwlXDOXYcH0JFV147ai3EJuiVcohNYuZtoKao=;
 h=From:To:Cc:Subject:Date:From;
 b=Zofi9SqUtf/16Mc2gwiDprGXOQdGfJyGLABQRkby28VuHxeThjyzpn07RsxKY/Ucq
 IL+KarKlG9I6CkOuWEBcl3TrgYhNO5U25I8NK7vhRUMuxup/C/cbjH0mli2KY6ubFe
 x1wDWcM5+pChrPuMOGxVBQVn44nhp2oHnlmJqEZ8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 13 Nov 2020 13:19:14 -0800
Message-Id: <20201113211918.71883-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
X-Headers-End: 1kdgVA-00At49-HY
Subject: [f2fs-dev] [PATCH 0/4] fs-verity cleanups
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
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-ext4@vger.kernel.org,
 Martijn Coenen <maco@android.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset renames some names that have been causing confusion:

- fsverity_signed_digest is renamed to fsverity_formatted_digest

- "fs-verity file measurement" is renamed to "fs-verity file digest"

In addition, this patchset moves fsverity_descriptor and
fsverity_formatted_digest to the UAPI header because userspace programs
may need them in order to sign files.

Eric Biggers (4):
  fs-verity: remove filenames from file comments
  fs-verity: rename fsverity_signed_digest to fsverity_formatted_digest
  fs-verity: rename "file measurement" to "file digest"
  fs-verity: move structs needed for file signing to UAPI header

 Documentation/filesystems/fsverity.rst | 68 ++++++++++++--------------
 fs/verity/enable.c                     |  8 +--
 fs/verity/fsverity_private.h           | 36 ++------------
 fs/verity/hash_algs.c                  |  2 +-
 fs/verity/init.c                       |  2 +-
 fs/verity/measure.c                    | 12 ++---
 fs/verity/open.c                       | 24 ++++-----
 fs/verity/signature.c                  | 14 +++---
 fs/verity/verify.c                     |  2 +-
 include/uapi/linux/fsverity.h          | 49 +++++++++++++++++++
 10 files changed, 116 insertions(+), 101 deletions(-)

-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
