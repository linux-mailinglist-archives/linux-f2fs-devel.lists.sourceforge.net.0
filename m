Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGeKLIIGDmqy5gUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 21:07:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BF597CD6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 21:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xQZsJAetMzDcwssqi+/eknwkar89WJoEkZ7nd0krcI=; b=D5DQf8RlUnxUGBFz1xcgjJ5GU+
	0h8ID2F0Uo1U0Cf3KWyJRdznHBU83TFV0MxHmfucyOJXEnLH6Lq8wTxUFzXibNTTgQbbfbC05lTRL
	zV8BRGxhgDEy1UEM7lgn/CGKwBtJiL6m/mTQGVnHEpLk9yjxH/y8/Wc0HAOapqafVis4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPmGU-0001lR-4s;
	Wed, 20 May 2026 19:07:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wPmGS-0001lC-KS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 19:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuPPbPM8zpAe4QryA/1tthxBDo9k7tG+N3NSiznpDNI=; b=YsdKnX6frQaTadKCWlAaDYxhox
 LgYzAzFtuXp4PCZl3IaYDdbRIeK3mHYvwJx+lSwtdQJITSFQWJAJALlDN+GN2wW2DHq32FZQJWCt7
 N9aMiElWzFgtOkdt0w2qnSNYm9IJYyq0e+MsoZxjRWcoSHDuWb2mk+xe9TJjwhp4YzWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TuPPbPM8zpAe4QryA/1tthxBDo9k7tG+N3NSiznpDNI=; b=eilJy/1vh6uKe0FwNSa7fEGYoj
 GJBYOuxCbmz8nzeFLNQGXD33fGYcz8pdpwjEGdzqX/B/AMQ6HSFPoOl+Jg/NdHPDrfwSHsWRzNk5/
 IOhlF+XSYjl/ZYGxciLDyxnhDdumDPmqvkO20Z0MeqPyuXoMjFLUHO330UhnUTvevP5I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPmGR-0000s3-Ar for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 19:07:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 42417418C6;
 Wed, 20 May 2026 19:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33DA1F000E9;
 Wed, 20 May 2026 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779304041;
 bh=TuPPbPM8zpAe4QryA/1tthxBDo9k7tG+N3NSiznpDNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VNWkxPBavgvYKU9722kNE74XIMhBMVW+G4jyKQJ0nm7VoG+oe3Wf7Bdz8zwHUOCsp
 BUUK0HGdj/G1ZfTfgY31uAmqaBCMaKDYXRUczZgX0F/7glO62VhDb+Pp0rRP8Ntxss
 tx7P4nXzdrCw1EIoPvQtbkvhOmZS3hCJ1flylpqcUBMtxxa7G0bs94xeTsu+FGT1j4
 P+04tUdFUJMWGgONqolYkbzqUDNPi76D6j51YQ/9bOu97Hkmm6DDbHVhKX6aLnI0eH
 RY5naeBLVTgeqqoPZPRfvlV4WzL/6vOsZlInhn3QKirVl3Us58ghxELQEZKDlfHpj0
 oQpMazXCUUQGQ==
Date: Wed, 20 May 2026 19:07:19 +0000
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260520190719.GB3424023@google.com>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260520123722.405752-4-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520123722.405752-4-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 20, 2026 at 02:37:01PM +0200, Andrey Albershteyn
 wrote: > fsverity now exposes fsverity_ensure_verity_info() which could be
 used > instead of opening file to ensure that fsverity info is l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wPmGR-0000s3-Ar
Subject: Re: [f2fs-dev] [PATCH v10 03/22] ovl: use core fsverity ensure info
 interface
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, djwong@kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net,lst.de];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 671BF597CD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 02:37:01PM +0200, Andrey Albershteyn wrote:
> fsverity now exposes fsverity_ensure_verity_info() which could be used
> instead of opening file to ensure that fsverity info is loaded and
> attached to inode.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> Acked-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/overlayfs/util.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

I'm still confused by the new implementation of fsverity_active() that
got introduced by "fsverity: use a hashtable to find the fsverity_info",
though.  I should have caught this during review of that commit.  For
one its comment is outdated, but also the memory barrier seems to be
specific to the fsverity_get_info() caller and probably should be moved
to there.  Anyway, that's not directly related to this patch.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
