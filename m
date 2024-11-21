Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C179D509A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 17:21:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE9vG-000565-IQ;
	Thu, 21 Nov 2024 16:20:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tE9uv-00055d-CK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ylf+9EqPXUZqi7nrXirRDoQlecAcZw41b2Z1mqPq1N4=; b=k/ZMCHzwy55ft4iaKBgedabsZ6
 m59pGo2FiZ9hekvBY3228b4GK1H/bNUK41eXpqEwpRkJZwwXirpp4AL3XNH4UtlZCMeDG6HaAMPS9
 bCmls9E0EI1nylaR5UQ7m01kSfHp8sajGiUvas3sWkcH7gKiBejm6kETAeX5VsMAD+mM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ylf+9EqPXUZqi7nrXirRDoQlecAcZw41b2Z1mqPq1N4=; b=E
 tXCCtE5aFUApNlFcwfoyQqjEok7z7qix1OzjF8Ld4Vj42ze5hdKU4w85w2bOPqnh8JZqBID9+GRvu
 6D7jTpi+l/4nKchdqcn2TSiJ8XlzB/FAh/G3sIcgck6jLLB2N1F0MP70s+qXCbTpLxxj7+7roVxYH
 D9eBr0HBTxWFbXM0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE9uu-0003P0-JP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62CE15C5567
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 16:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E883DC4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732206017;
 bh=yFOAyNABjH6ZIGCDIJf9+ldK4ZrKZPRu7HyL5d9zVgQ=;
 h=Subject:From:Date:To:From;
 b=JZSIBf8KXy24KXXe8QzwgTndhtbg8tydrd3rL0LkD3d/J6Ztx40XDFuhjwfA7V0iE
 /RLqIgBxMmt9SZUVdvDZ3z4wXAmCx5uPd3wSjhlzhZuvdPgjdrUMxZRYHu8/NMObhs
 Xaa6fMIANCeWGjCZm9UTOtSoCluMqf5lmHVTmT85kPFouHwNubel3BERy1XZ7QjGRe
 kQrCfhf7CwXAqmoTj6WrfKh2/ndt7oWVjEoNQT+/b6lqh4mNzPjzEIXQCb3R6GibMZ
 cXSmdcb+5HifPEIK5gohC+nDN/mFL+c2+teESew7GhZlhdctdsCsSTNKxXPFtjktX3
 4MvJ6qxRKNcbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EF6B23809A00 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 16:20:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173220602951.1977996.9439804708530834555.git-patchwork-summary@kernel.org>
Date: Thu, 21 Nov 2024 16:20:29 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/4] f2fs:
 fix to do cast in F2FS_{BLK_TO_BYTES,
 BTYES_TO_BLK} to avoid overflow Submitter:
 Chao Yu <chao@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?serie [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE9uu-0003P0-JP
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/4] f2fs: fix to do cast in F2FS_{BLK_TO_BYTES, BTYES_TO_BLK} to avoid overflow
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=907585
  Lore link: https://lore.kernel.org/r/20241108012557.572782-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: fix to do cast in F2FS_{BLK_TO_BYTES, BTYES_TO_BLK} to avoid overflow
             [f2fs-dev,2/4] f2fs: clean up w/ F2FS_{BLK_TO_BYTES, BTYES_TO_BLK}
             [f2fs-dev,3/4] f2fs: fix to adjust appropriate length for fiemap
             [f2fs-dev,4/4] f2fs: fix to requery extent which cross boundary of inquiry

Patch: [f2fs-dev,v3] f2fs: replace deprecated strcpy with strscpy
  Submitter: Daniel Yang <danielyangkang@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=910505
  Lore link: https://lore.kernel.org/r/20241118070141.3474-1-danielyangkang@gmail.com

Series: [f2fs-dev,v3,1/2] f2fs: fix changing cursegs if recovery fails on zoned device
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=911444
  Lore link: https://lore.kernel.org/r/20241121082657.2644346-1-shengyong@oppo.com
    Patches: [f2fs-dev,v3,1/2] f2fs: fix changing cursegs if recovery fails on zoned device
             [f2fs-dev,v3,2/2] f2fs: clear SBI_POR_DOING before initing inmem curseg

Patch: [f2fs-dev] f2fs: clean up w/ F2FS_{BLK_TO_BYTES, BTYES_TO_BLK}
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=907165
  Lore link: https://lore.kernel.org/r/20241107014602.3638020-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: adjust unusable cap before checkpoint=disable mode
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=910718
  Lore link: https://lore.kernel.org/r/20241118184535.1047327-1-daeho43@gmail.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
