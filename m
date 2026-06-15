Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rFFoE7puL2p3AQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:17:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBC682FFE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:17:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=gy24ny02;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=FrcCYkYa;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hBCUXrLp;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=k81ZqCRo;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1i7DBDhgmk+fDb0Y3iDUiFPH8lggU3tMWjEh5dxzcA=; b=gy24ny027M6vRgKwh4SzSVIFla
	9FKWvGxi49Jk3YGXMHs5ZLwF7WDGy080Nzw6AttKTkyu3znCpXDAQ+J0sfbAu24Y6tVQKzbqeksHQ
	ZFw8Fm+35y6DD1BLiwGBRCiIPPSuXwkhoT9dfBEpbJhZmN9S6ow0Ztu1Yb3oJ7S4ZMBc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYxov-00038f-LO;
	Mon, 15 Jun 2026 03:17:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wYxoh-00038G-CR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=raNVzxlxf+6Am20y+qpqw6MoOelLs8xABCqoCLiKUQs=; b=FrcCYkYa+ZqRmskaK1+EhS2xBN
 WpleMghTp4GxfMbTKKhF15Q9ExEyFnDMlxBHBM2EoJ3XGYJ2eE+Zp2rA9HvXdKEoJ9B7zTEM7WHay
 rOysJ5Wt/ofB23sIO90wpPFgBybLuwPrQdfnHRcvvKK6v0xDdnOzPy8KY2DvrC3QGYRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=raNVzxlxf+6Am20y+qpqw6MoOelLs8xABCqoCLiKUQs=; b=hBCUXrLpxaxiFcyaihYY53x5RI
 xa8DvngqCs7y2QXQ7DVXi3EUgIjh/Ef3QO/jPPlkZlYUFT8KBeCFyisCTOQKuxv7utAQXovK5IrGk
 ZGzxNV8+WiHRgoqGCuH1lnlPQhR8L3aer6Wp1th1YuXOAKenQ7w6APdn5VzUgt5Hg6/I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wYxog-0008HS-FD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:16:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 513486008A;
 Mon, 15 Jun 2026 03:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F3D1F000E9;
 Mon, 15 Jun 2026 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781493405;
 bh=raNVzxlxf+6Am20y+qpqw6MoOelLs8xABCqoCLiKUQs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=k81ZqCRo2LEmGR2RM9BXDSybYeiUXLc8/l6HhtcQsjpQwCF9Zs9ZetDwhzos6rtd7
 4X7jLUxhEgcxO474INjc1pWZGMskqjG8cpFIQGguk2FVjTJoH/FSMgTflB1Sk3OtuE
 jYJL3sErYqp52zZeEch39ZnEzD/lUpOsHjT81UH+B5gcaqlDkmP+tSzfaux0/juf8E
 9LMqd/mQPSLsVO95J0Pg2NkjNMWZeqcKP7YVRg43JPN2r59lrVkN8Umj+WYVOQZoge
 rytv/IR38nIYYLW3PgrOiDm/jmOCdP5By8QylyVHPCOdxWrTWP8lA9ehI+YCrjJgUR
 fM2tBnAE+yvIw==
Message-ID: <069c7bab-42aa-4e0d-b113-5919ec346fb5@kernel.org>
Date: Mon, 15 Jun 2026 11:16:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Samuel Moelius <sam.moelius@trailofbits.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260603161127.17464-1-sam.moelius@trailofbits.com>
Content-Language: en-US
In-Reply-To: <20260603161127.17464-1-sam.moelius@trailofbits.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/4/26 00:11,
 Samuel Moelius wrote: > The f2fs dentry lookup
 path can use the on-disk name length before > checking that the name fits
 in the dentry filename area. A corrupted > dentry can then mak [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wYxog-0008HS-FD
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate dentry name length before
 lookup compares it
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sam.moelius@trailofbits.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trailofbits.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0CBC682FFE

On 6/4/26 00:11, Samuel Moelius wrote:
> The f2fs dentry lookup path can use the on-disk name length before
> checking that the name fits in the dentry filename area.  A corrupted
> dentry can then make lookup read beyond the filename slots.
> 
> The bounds check needs to happen before any comparison that consumes
> the name length from disk.
> 
> Reject dentries with invalid name lengths before comparing their names.

Will be better to merge two patch into one:

f2fs: validate inline dentry name lengths before conversion
f2fs: validate dentry name length before lookup compares it

> 
> Assisted-by: Codex:gpt-5.5-cyber-preview
> Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>

Anyway, this patch looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
