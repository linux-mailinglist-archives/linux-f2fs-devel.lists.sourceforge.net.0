Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ2pHAkoeGl7oQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 03:50:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC788F3AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 03:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=40T73MeHRQhhNGD3HHCpIvKXpFkzfrX+ic2QMhdYZcQ=; b=db6iBgtq+nIIRFAUUJeEXpa3xr
	pk2jJ85NsOVYe5o4bAoHMSEptTkV7gpCH2eZkho36qi/t9VigkNIadPqup/RJhBd7f3EPuBmj+xG/
	nLweH0e53btzmt3qCyvSpbVZ6Sa/YC2+snlRbZaSbqS/v1WPOi8fWBn424QsytSvpbok=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkZA8-0003Kw-Dk;
	Tue, 27 Jan 2026 02:50:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vkZ9o-0003Ke-7F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 02:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xqNlaLQe1cDkgMgB8FEhqpyqPg//p5O2fI7xGq610vA=; b=hw/nGX7YlbfpgTV3MCZ8w7lE7T
 nDPgcm5UY/E0uDBpNXclOFFoG+pPuYntVQb4ZW4fJtwk5v1ji9qDPtXg5rzqAvbhU0fz3lnqw/AJC
 66zRtqLL1NlLUdTGMvpjuvZAJPC0evREmXbWNhN11bRnW4MGe3FIRqap+AcXmLrQ0BSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xqNlaLQe1cDkgMgB8FEhqpyqPg//p5O2fI7xGq610vA=; b=d
 ZTaqQzWXqZo7oN+KS7Yt/n7w70UAHJmoTgTMnYg6N4HDwugl1JY3f4h1nx4bQGeE0UvH3O4LiUpna
 VhbT8kt1M2s/sBdjXYxgshtTQrq1XVuwHNw0xso+jFHWUgH8tRGWpeVDmn8WlCIAmvfh4o9SV0NcU
 iWkbjrTiQKdv0hjA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkZ9n-0007g8-MC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 02:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E0A441865
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jan 2026 02:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E25EC116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jan 2026 02:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769482209;
 bh=bSgbEkAxEF94xW16xer8rMEwZ7HRNj8CjfcyzyZDRC0=;
 h=Subject:From:Date:To:From;
 b=Sbcp17kAyZMwosNPpnIFYdT1WiEiAXtQ5BpElS3yRBjoIZsmTTZbQme8vJg0mlmfs
 qwSUABVNEYVHlYFl4pXMlLeiO21bGG5L9D0wSaE76QQjTwJEU8umYYXubV7yZufjPz
 iAD/fYmdo6LdhB0sg5InhMGsyhBe2qNJg9aqZp0D9eMWVfxF6J7i44o8V4RpjJi5mW
 +n15yARwMdEUrjLxKmSP3JyCNSjOmfNmhHyFHJGDXWiBTjM/JporwcjnieGz4oCHod
 894mwEHiJ0T/1oZkCclLkEBC/S2reH9BGiHk/LJeIAz/hIqn2FT3Fb41b+wDcY2p5h
 JQrJAEVskOzDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8E2D2380A95F for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jan 2026 02:50:04 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176948220320.657910.959297017758320862.git-patchwork-summary@kernel.org>
Date: Tue, 27 Jan 2026 02:50:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v3,1/2] f2fs:
 check skipped write in f2fs_enable_checkpoint() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkZ9n-0007g8-MC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_EQ_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RWL_MAILSPIKE_POSSIBLE(0.00)[216.105.38.7:from];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 1BC788F3AE
X-Rspamd-Action: no action

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v3,1/2] f2fs: check skipped write in f2fs_enable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1046932
  Lore link: https://lore.kernel.org/r/20260126063203.1508295-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
