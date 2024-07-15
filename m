Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C9931700
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jul 2024 16:40:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTMsi-0002tf-2n;
	Mon, 15 Jul 2024 14:40:47 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sTMsf-0002tZ-VU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=430dXBmkWyMx9jppQI3X715Wgl0oeYKhIF3NivTOtdM=; b=G6tuQUdgOnIPZqmM1JdHMdeC/c
 9txf9rVOnSUy/XRtsdn3DjMvo/ztkhu750901esWf8YyNg09Y6zJddTLS0cU2U/gMTTSBOqee6IHq
 D9Rw+JsMGa41DQtlM6OT4xzlWFDyZOJOuYLEbYRU/0ezKldb9RbhP/REZoCy3og6fTfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=430dXBmkWyMx9jppQI3X715Wgl0oeYKhIF3NivTOtdM=; b=U
 umD+OfeBj2XuQMAkN6FKPmm/7qzkPP4jYzQiDOPcodpRTk24g59Fb1XyJNQ2EpYXu6IeeEir3EOqE
 6EGk6q2TyDrQd4hjXU+74lmIsMDdKxaHvxF3D7E6g0TYLVDxgmlwLZ3eupJ5+AmC7st7DgMbUgnb/
 ji+kmw/AAfp1jfNU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTMsf-0003EQ-4L for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 805B1CE106A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C48FCC4AF12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jul 2024 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721054431;
 bh=TZO4c45mGLN1yVk9EHILvK6rBGwUbbPzNZudKniVhnc=;
 h=Subject:From:Date:To:From;
 b=c9RqbW+akYdJQ2VyWfpPpKy+QXdpCGOHJbDhDO0S/wBBq0GAUIJXH/byTWmlDzxVN
 AOtEnl1zE0NmvAXFlpedZxmzz2FZ/8T8F9HPCc88/1UytaJ4Gnhbu6rt7MOfn1WOOw
 tSgOaW/KluJKA753pm+OjElQrz8+2ot6SYNoNDv467qZFyNm7h/x+B/YBvFJAbC0Lz
 9i6UrvJe4/39ZBDhGDV6IffKi4t3Py1iaxdeVZpC7M+pi7ezFms0+PtbuJ93UQX9pX
 wV4jfufNeFugu+6RNdUqndlgue6Uz5JwUL/R2+0ixbJk8baXKp7Fk3PpjNnwiOjxSL
 h9Qvqu7LUjIvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B072DC43443 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jul 2024 14:40:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172105443165.17443.1787252796944215025.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jul 2024 14:40:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v3] f2fs: only
 fragment segment in the same section Submitter: Sheng Yong
 <shengyong@oppo.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/proj [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTMsf-0003EQ-4L
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v3] f2fs: only fragment segment in the same section
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=869917
  Lore link: https://lore.kernel.org/r/20240710012659.3415856-1-shengyong@oppo.com

Series: [f2fs-dev,v3,1/2] f2fs: use meta inode for GC of atomic file
  Submitter: Sunmin Jeong <s_min.jeong@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=870093
  Lore link: https://lore.kernel.org/r/20240710115117.61255-1-s_min.jeong@samsung.com
    Patches: [f2fs-dev,v3,1/2] f2fs: use meta inode for GC of atomic file
             [f2fs-dev,v3,2/2] f2fs: use meta inode for GC of COW file

Patch: [f2fs-dev] f2fs: fix null reference error when checking end of zone
  Submitter: Daejun Park <daejun7.park@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=868255
  Lore link: https://lore.kernel.org/r/20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4

Patch: [f2fs-dev] f2fs: remove unreachable lazytime mount option parsing
  Submitter: Eric Sandeen <sandeen@redhat.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=866787
  Lore link: https://lore.kernel.org/r/e7e1d63e-b6d2-495d-ac1f-28d87d56ca09@redhat.com

Patch: [f2fs-dev,v2] f2fs: fix start segno of large section
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=869255
  Lore link: https://lore.kernel.org/r/20240708120407.2807639-1-shengyong@oppo.com

Series: [f2fs-dev,1/3] f2fs: clean up F2FS_I()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=865148
  Lore link: https://lore.kernel.org/r/20240625031604.3587691-1-chao@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: clean up F2FS_I()
             [f2fs-dev,2/3] f2fs: clean up addrs_per_{inode,block}()

Patch: [f2fs-dev,v2] f2fs: fix to update user block counts in block_operations()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=865133
  Lore link: https://lore.kernel.org/r/20240625023239.3534605-1-chao@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
