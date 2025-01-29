Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDBA215D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 01:56:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcwN2-00047V-C5;
	Wed, 29 Jan 2025 00:55:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tcwN1-00047N-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PfjE98Cy8bGRmC86jun3PRk7KPgTk0mGRAVJi46YW5Q=; b=Fg02L2IXRXFtWgjaKoC9nvk1v6
 ZWmsnt9moHiFcLqg/d/hbuRUVK6iUWlNAZWxRoQXfkmixU1uW685prJDdW/w1B4aybyQ1r8DWCgOK
 k+dNoD7TSXaNr2Kuag3v3KAntrLk4KEba1B32FQ4pMBZ9R1Q9/FowzcglJPuQoWRZlWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PfjE98Cy8bGRmC86jun3PRk7KPgTk0mGRAVJi46YW5Q=; b=B
 0MI4i6+nXmovyjEcNL+072YM0rvnUpIpa2uoCYYETbSBlQS8I1gHELPgrqr2wx2RP6QPLirjgqANN
 lO/CFK97lbJi4upHEp4TvjA+n2MhffKpX+4bBZnf8OOqi32C7oxNVy+dCmA0j4t0OFTcSzb9qZZ/r
 5nDJhy3yZXOuwDy4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcwN1-0001LY-1M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47EC7A41642
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jan 2025 00:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6312C4CED3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jan 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738112143;
 bh=sVjdUexLrxmM3M201/5cwSY7ZldvFPIxHqPJ6wc7Ti8=;
 h=Subject:From:Date:To:From;
 b=muSag/rmRkcOYcxoz+kmlinJgrDkFpjJ4a8OMaokU7DuvjfAcsxt9KpFXCNnR24Al
 xU3PVxyyg97ZUImeMUL6yYVtbqPU4ugHiSnhLRQx/y2vh7Eypxf5XWhua3i6OaEnln
 5xYTnZrCufqBysPoW/acG8K+AlGxa+2GBPPfYUg9ImidQDoueVJtC2y2TLqiL+YTyl
 R0LuVBV0XINp1BsWeuwJTHW1SYqxxfsNnOVZoQNeJPtEv/B/qMOe33ajTRQ2MWORzy
 92srO4AH61JtJfBYf2AwPkIy7FeTOQ0ngdPBgmYADgffDW2XfNNW6Jo/UPxk8qLgl8
 1Y8x36CnEO+8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B4A43380AA66 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jan 2025 00:56:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173811216936.3973351.9315268531477988163.git-patchwork-summary@kernel.org>
Date: Wed, 29 Jan 2025 00:56:09 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: Wire up CRC32 library
 functions to arch-optimized code Submitter: Eric Biggers <ebiggers@kernel.org>
 Committer: Eric Biggers <ebiggers@google.com> Patchwork:
 https://patchwork.kernel.org/proje [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcwN1-0001LY-1M
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

Series: Wire up CRC32 library functions to arch-optimized code
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=913571
  Lore link: https://lore.kernel.org/r/20241202010844.144356-1-ebiggers@kernel.org
    Patches: [f2fs-dev,v4,01/19] lib/crc32: drop leading underscores from __crc32c_le_base
             [f2fs-dev,v4,02/19] lib/crc32: improve support for arch-specific overrides
             [f2fs-dev,v4,03/19] lib/crc32: expose whether the lib is really optimized at runtime
             [f2fs-dev,v4,04/19] crypto: crc32 - don't unnecessarily register arch algorithms
             [f2fs-dev,v4,05/19] arm/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,06/19] loongarch/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,07/19] mips/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,08/19] powerpc/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,09/19] s390/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,10/19] sparc/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,11/19] x86/crc32: update prototype for crc_pcl()
             [f2fs-dev,v4,12/19] x86/crc32: update prototype for crc32_pclmul_le_16()
             [f2fs-dev,v4,13/19] x86/crc32: expose CRC32 functions through lib
             [f2fs-dev,v4,14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
             [f2fs-dev,v4,15/19] lib/crc32: make crc32c() go directly to lib
             [f2fs-dev,v4,16/19] ext4: switch to using the crc32c library
             [f2fs-dev,v4,17/19] jbd2: switch to using the crc32c library
             [f2fs-dev,v4,18/19] f2fs: switch to using the crc32 library
             [f2fs-dev,v4,19/19] scsi: target: iscsi: switch to using the crc32c library

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.14-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=928717
  Lore link: https://lore.kernel.org/r/Z5hYrgYwNJuaPFF1@google.com

Series: data placement hints and FDP
  Submitter: Kanchan Joshi <joshi.k@samsung.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=888951
  Lore link: https://lore.kernel.org/r/20240910150200.6589-1-joshi.k@samsung.com
    Patches: [f2fs-dev,v5,1/5] fs, block: refactor enum rw_hint
             [f2fs-dev,v5,5/5] nvme: enable FDP support


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
