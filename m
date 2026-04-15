Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PofLwvC32l7YgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 18:51:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E8406806
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 18:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sfnhoKxispofUAgIiWrBHFGXGkmnkSRnDPkbaty1LJI=; b=H/+MubhLPLrzxe3OBy2kpT065X
	TZZZkTYjOIpJgA58Ug0kV7MYlX7D6fsgK0LW6JXOvP1OQrL590Dwze9ztWrTJb6VEjjDbxytVAJWQ
	727xrxp+WcRiMdl9ezDJWcxrZtJY+4cBq532LtRwS1KUoDI2yedoV74NKlWaBRM2TDKE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wD3SQ-0008M6-HL;
	Wed, 15 Apr 2026 16:51:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wD3SC-0008Ky-OB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 16:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpG7jt45QL0SeaTHmIXRn54UiRI021ckeTf7xIkIsRo=; b=jY/MJN2XKnK9aV42ZYAZaSekpM
 3H7xifg91PJPVl7+5OCksp3sP6N7Uk0/f4yOg7os2R4f/2Kxm0FAP+5JM7z36HixaqoqEamMFPYZb
 3toYV2M+DuW1oiN7hRN18nqUPPxCFjb2hp7KJteoebmlHo9BUsDB0sWgZaYIDSuy59Gw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EpG7jt45QL0SeaTHmIXRn54UiRI021ckeTf7xIkIsRo=; b=e
 9/PSE+zZoebz6efDLYQzjltBYTFRUMW1iIseaqPVOz5j9mPuT/OjL72Dp4Fex9AR1vYhGKhGOxQG5
 reVjmw8tKeR+dduwVEEqJtIDPQ1pIftiMRCtK3F4HtoVNI+hL/BZz5sETLq6OUQPhd4TrzQtGprEO
 LvE5m2IM3IJ01h4I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wD3SC-000178-8r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 16:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2CF544381
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Apr 2026 16:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFED0C2BCB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Apr 2026 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776271858;
 bh=B/otPwTg18iezt63Sa68xLnJb2NzXHI56QEM1lIgdAQ=;
 h=Subject:From:Date:To:From;
 b=j4n72rTOQ9B5B/ZHEDH1PYpCIhAOsPiqq2Ql0L3qpJ1qRG2Dw4Gyi5xKIkXWo6M02
 R8OewBLDoHvLITLy38kZ1Q/nT4yLmrB/6hrCX5RzOoqKjExZW9aXFEf5TVavvyPkeZ
 a33MRo4aJ3H+I7ZaKd23CqxWTImNmqEULOYDy6HVYrIQ47qK4IF1jW8njSqd7acGOy
 RstX6sb2cXY5xKC8qzWxUfkadjQatF/DfeG9w4OKi7wATFFx68JN59yi0L2JTJFsu/
 mNPlA/0YO29oIiyYaiQSYzvckiPJflNMUNMT+k2P7LsejlFtfekZeEcczFjBFZtD20
 uK9eoYs9NNyzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 76AC7380A964 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Apr 2026 16:50:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177627182838.2303073.8012102223566683281.git-patchwork-summary@kernel.org>
Date: Wed, 15 Apr 2026 16:50:28 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 disallow setting an extension to both cold and hot Submitter: Yongpeng Yang
 <monty_pavel@sina.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wD3SC-000178-8r
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 917E8406806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/2] f2fs: disallow setting an extension to both cold and hot
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1079812
  Lore link: https://lore.kernel.org/r/20260410150537.1683974-2-monty_pavel@sina.com
    Patches: [f2fs-dev,1/2] f2fs: disallow setting an extension to both cold and hot
             [f2fs-dev,2/2] f2fs: protect extension_list reading with sb_lock in f2fs_sbi_show()

Patch: [f2fs-dev] f2fs: fix node_cnt race between extent node destroy and writeback
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1077053
  Lore link: https://lore.kernel.org/r/20260403144015.221811-3-monty_pavel@sina.com

Patch: [f2fs-dev] f2fs: fix uninitialized kobject put in f2fs_init_sysfs()
  Submitter: Guangshuo Li <lgs201920130244@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1079751
  Lore link: https://lore.kernel.org/r/20260410124726.2035729-1-lgs201920130244@gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
