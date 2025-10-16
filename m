Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB97BE50C3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 20:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vyK7l2NJGVyTFTjOkXO3vR9Yhg4zEGGQ5/nsIYvIlmY=; b=TNe/c5SMrRkUKcHrn3qqt/hZWd
	OJ3pfnXa86V03VpvqgGX4yDoZUo8RM+g1vHixXhps4Cdb07KQQ0dQeekyGoOLDFFIVEiInUibLpqa
	7lFKIKOuz/dxqdzbc4D+PnPVA1TEwBqE4+sGD5Sy6nZ7lKtEP60ytiL46gUU5KVxEFNw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9Sec-0000Mw-Ve;
	Thu, 16 Oct 2025 18:24:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v9Seb-0000Mp-L3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUZEbZDqVhABSOyImlHPIQkhRly+zIWnlm5EJirl3/Q=; b=h8xYK7rVNkByxyOGiR4qQQT7gt
 Hc6U6E9hJ1AJiU4Vm4omKg5bgbBr6MpXrA4seckKBSy3hX+aa7u0gel1z7PkbLG6yePLdBVrB7X69
 ohHFmVh+gOMnh8hoJ1jhTjr+oNIahr0lheUhzF16Ugx9Bacs5Y40Qwy4lS8FdFe/fwEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PUZEbZDqVhABSOyImlHPIQkhRly+zIWnlm5EJirl3/Q=; b=I
 Jc621mNcIeCNZqp1iz09COpQQf7wM7ZwtLgilfoYKcLxlaB0H2iCrcq583F2Ob7Wx6ILr1TrYVNsG
 xMjGwRp8ROu30uZx+qqSS9NWLCOjrCi2U8vktkToynELA8xwThDT+mvkUEt1DJ9CVqS0N04TMa9UW
 /HhtrRC/ErvAnbec=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9Seb-0001yP-3W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96EC1419DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Oct 2025 18:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74755C4CEF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Oct 2025 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760639074;
 bh=D74nv4DFK4JztM51g8yRi2SO62yZlIlhFtOf2YvixYk=;
 h=Subject:From:Date:To:From;
 b=syifZhD6Z4MBTOdGh3h4Fi8uLpKvqRxsRAhNWsE3j7Vi21CKOdy+nu9lzLWLcTfJ6
 h3i6PksrCP0PDUMJ8JI4aP8zDweyV3ExlUhks1z8o8QDfFh8LyQNe0bNf5U355okHi
 fzdOqi8NBcan1+pnng1Y3UXtx8UTJ2M9CZifoPh/nqKkd2zeLZjdOeytdwEMGUG0qS
 BCbcYpAqo+UvxxMzm2kXCAU2+IapIjSOM5+PfbaOdKX/zHPOcjh20/6WWKenaT4i8f
 QhGrYjl2nTmadAUrRQI+heQDTWdOYO9b0xLuH9yws9rZ8OcQnlfxjjPsIVgllFvyeT
 a5rKkGofObuWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B176D39B167A for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Oct 2025 18:24:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176063905813.1852182.13358683096545727991.git-patchwork-summary@kernel.org>
Date: Thu, 16 Oct 2025 18:24:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: maintain
 one time GC mode is enabled during whole zoned GC cycle Submitter: Daeho
 Jeong <daeho43@gmail.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patch [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9Seb-0001yP-3W
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

Patch: [f2fs-dev] f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1008395
  Lore link: https://lore.kernel.org/r/20251003224308.1948874-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: use folio_nr_pages() instead of shift operation
  Submitter: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1008413
  Lore link: https://lore.kernel.org/r/20251004031217.50242-1-pedrodemargomes@gmail.com

Patch: [f2fs-dev,GIT,PULL] f2fs fix for 6.18-rc2
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1012486
  Lore link: https://lore.kernel.org/r/aPEt2-u8J16L9Xnk@google.com

Patch: [f2fs-dev] f2fs: set default valid_thresh_ratio to 80 for zoned devices
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1009126
  Lore link: https://lore.kernel.org/r/20251007164614.3631594-1-daeho43@gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
