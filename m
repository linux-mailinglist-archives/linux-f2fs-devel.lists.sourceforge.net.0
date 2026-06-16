Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id InBkHAS6MGq+WgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6E68B8B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bKyyKk6B;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MCCAoAi0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=lmlm0CuV;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=m8hQwDCS;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1rNeHpqfWHwYOJX78RHnp61ebDr9//Tmgy8hK6Q5/4=; b=bKyyKk6BJCQgTSVkUYgd8O/01J
	D0XPXFCT8GwWcO18kNMfzrVOgWKhZQV2zc998ep9/LyLNZzBlLy+4VpEjdZ8XFHB3wqGk1kZi9iVJ
	56s9rTiAlOxRGzhu0Oay0P7TRwWpzNZFagAjj7DC8v83rKxd2/wH8BNFKetImDNPP1sk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZJsu-0004kS-BK;
	Tue, 16 Jun 2026 02:50:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZJss-0004k1-Dz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sT0rUb65ahglhmRVZn82Ro8tthKKXAkAqEyeGl8D1Qk=; b=MCCAoAi0cBBu+/VPHdnKzJywbL
 t+z54KdKNnkoUEtjSxw3Od5sCrKQ0m7ctUpxUN5t4nxLIzZ+RuXUH2YJyhFxCxOjPsUMgiggSUcrg
 qrNY+sF4SXKZyI8JP0hiGL08ud+KVcRCZ1zgApTnHwPzCLO90O+GvEmdbF8NnpcpQSsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sT0rUb65ahglhmRVZn82Ro8tthKKXAkAqEyeGl8D1Qk=; b=lmlm0CuVLjMdlzmxRpt9aJhlX8
 UImSeUg8sZuqwqs4Xd+B9xlLpCtPJrkFPC0fAoPKMUTnPQyx9SMDa/OxXZssOSGG3JbQYlLn0hE+p
 A4Tr0v3UpXJZOxcyP2kvN/2awfN3V4X+4bHT0j7DD7LBEk+E2Pqk41fR3TsyiH17MpVU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZJsi-0008QT-U4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 121CA4419A;
 Tue, 16 Jun 2026 02:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97D01F000E9;
 Tue, 16 Jun 2026 02:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578219;
 bh=sT0rUb65ahglhmRVZn82Ro8tthKKXAkAqEyeGl8D1Qk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=m8hQwDCS1lXrpsbaaln4OXbijIboBnu7z5YjH7GQpJEzqkPa5YIgsEMOulkBBZIzQ
 x1/tRKm6Rwms7febgNvpRVD/A7EQg5v9GnQq0h1jXQyGj5zcK4GTnn3oPo4noBO+ZX
 cF57a3gFy/W8rEx0QJy6d9uxb5eT74KOQ31rhAZ/kCOjeX1Sse2MtEaoMGa9Cc56x1
 B2XnyzVIatwr8KuKcE0/Kmn1nQC0H4zGSD2IyHK4vtuXqac+Bm2lAlGfH3Hkek/hI/
 K/HkPxHetMtPusrK2HbwdAfgLIp3/vgeyZaGlCvqXHpjG3++x61xHfEsmZ83dUBjVS
 Vnu42OtHJo9HA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 198393839A26; Tue, 16 Jun 2026 02:50:15 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178157821363.407856.4167191226848764493.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 02:50:13 +0000
References: <20260615071954.4118409-1-rollkingzzc@gmail.com>
In-Reply-To: <20260615071954.4118409-1-rollkingzzc@gmail.com>
To: Cen Zhang <rollkingzzc@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 15 Jun 2026 15:19:54 +0800 you
 wrote: > f2fs_acl_count() only validates the aggregate ACL xattr length. A
 > malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
 > contains s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZJsi-0008QT-U4
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: validate ACL entry sizes in
 f2fs_acl_from_disk()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 2045gemini@gmail.com, jaegeuk@kernel.org, zerocling0077@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rollkingzzc@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:2045gemini@gmail.com,m:jaegeuk@kernel.org,m:zerocling0077@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3E6E68B8B4

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 15 Jun 2026 15:19:54 +0800 you wrote:
> f2fs_acl_count() only validates the aggregate ACL xattr length. A
> malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
> contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_disk()
> then reads entry->e_id before verifying that a full entry fits.
> 
> Require a short entry before reading e_tag and e_perm, and require a
> full entry before reading e_id for ACL_USER and ACL_GROUP. Return
> -EFSCORRUPTED from these new truncated-entry checks, while keeping the
> pre-existing -EINVAL paths unchanged.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: validate ACL entry sizes in f2fs_acl_from_disk()
    https://git.kernel.org/jaegeuk/f2fs/c/f3b87155543b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
