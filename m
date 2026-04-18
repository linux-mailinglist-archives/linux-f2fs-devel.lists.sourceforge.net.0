Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f/tvNNUK5GmUPgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Apr 2026 00:51:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14A422875
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Apr 2026 00:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiB7gHO7lZVzedMybWvz4itRY1Cy9Jp45nWtJF4F2ug=; b=kXrFcPMStvpmjtNXeK+JWs9Fur
	5QlwEVh/yYEKQH4+UE+oWQmEfI3M5hTOWHJ1jGNzADZIz10vn+B2UKulSWU18el0TYfkH/fyiuX+y
	fGgMoNoLZSfBcYOsfoTwYEtsq5enWkTg7nwUKd+jI3eTjN1wOtHoVrUrXkxZLl6FU3mc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEEV1-0005IK-Ay;
	Sat, 18 Apr 2026 22:50:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wEEUy-0005ID-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 22:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kzpH8D80xmKPgLNRPOOZBW4klVxspHBuVrkE19QcB5k=; b=A6Oh3hLPOxWtx1g1vBJIBK2/NK
 V2JOeG88xbIzB94k9nZ2r0FbbipaEogJgGiR/5pTW7i/jKNjvlNlLJEB8XVVVxxJGFyZ7OsUJcTMx
 JlQhgEuDEuwDa7cPTzR3B/JLHLIUZO8Q2zgKfP+2KSyUTlg8WqnZHelQgaLCwXCHZ74g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kzpH8D80xmKPgLNRPOOZBW4klVxspHBuVrkE19QcB5k=; b=l
 xIyN9pGwYmJ+KPt3dJjoWQeYTHQdq4GGnFHAfau5Dd0vwHDFd66g5L/zfuLsg41XCfFRWy1Xcq4mk
 j0HjuFzLSPiG7p5xOrF/k/WtboPrBFeOQ+j37KKqcF8eFw+deuqGyK9ZoGEbRUKsRiTRJW2PdIJ6D
 oKpncxJEh7KgJNIc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEEUy-0006m5-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 22:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E475D433FB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Apr 2026 22:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C401BC2BCB4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Apr 2026 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776552637;
 bh=4RCd8nqpFiyynoi0rSgn6CdTPsl05gBw+KurNw7XVuo=;
 h=Subject:From:Date:To:From;
 b=kJzTz93ZI+9aiafj3DznZupDv4igMiRpeqHMJ4Tbs/6WwiMOgRzcvjPVNzjdA8fEN
 vpCI3QHGjlPtoqVBBkom+fnutJnttHa6O8nc7qbLgO/XLl9NSllbWhonCEHlvwb4KY
 Op5/fHv+7sMPHhOF1F5Is5kz2JzlBxXz/kMGkoHh63dhNr2FHT36mGta5cIaj3c/QC
 8gDbvpjMXXw51VbCHS2Biz+dSCR3veU8GUK3ebf3xM0SaaV4L9RWL08p2xpquKG2sS
 5ohhaZ0iKyv4rxp5e4sRVFmQS3Mi5ny5YYQxiZK6nef/SgjF+WDa72AsPGvi0cSuAz
 1+g0FWXEsDGRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 423AA380CEF4 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Apr 2026 22:50:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177655260378.555759.17067245751520025119.git-patchwork-summary@kernel.org>
Date: Sat, 18 Apr 2026 22:50:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2] f2fs: add
 page-order information for large folio reads in iostat Submitter: Daniel
 Lee <chullee@google.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patchwor [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wEEUy-0006m5-Ec
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_EQ_FROM(0.00)[];
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
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 5D14A422875
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: add page-order information for large folio reads in iostat
  Submitter: Daniel Lee <chullee@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1082654
  Lore link: https://lore.kernel.org/r/20260417175040.3562355-1-chullee@google.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
