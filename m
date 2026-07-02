Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /xp8F/0TRmqtJQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:32:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1756F4322
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 09:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=O8BB+qCT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ZJxsizsy;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=MsSlDi52;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=QaZrY3+8;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY/CqpKomoBCnO5CP+kywIPG7EDEf/EnI9zqdgrxN3g=; b=O8BB+qCTTjcpuU6eEenw6A6hU5
	o0gqbxVtLT1jCw8nQ8t5v7Vzs7NcOzP8VDd7W3DTFMJmjWA9Srgz2G3jrEyQmuJKz5Hpn1hsoeGmD
	gdLDr2A9hu1V2FrK+DroA/nkXBYmlqZGfX8FBbMs2d+mtE8DFCye5qTOuMlDKjsxvwjQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfBu6-0008OW-Nm;
	Thu, 02 Jul 2026 07:32:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wfBtm-0008NH-5I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6gqemwJOuOxefkEr4riKiSbxU01eIA48quPWO2igp4=; b=ZJxsizsyLIzpxSOfS1hiRbfjbr
 +03g/lLTa9PYt3Ez1w+RAijwNvGvR+ge4yCR2VZ6i+yzKUlvtro511b2zHpDMEHjNGXxKCJSCpOM4
 ZVY4xWXoQKHfjbHptEt4GkwFW02QRgfE/wdsB+dYfGwGbdBrQFecfoNt657ACmvbLnYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q6gqemwJOuOxefkEr4riKiSbxU01eIA48quPWO2igp4=; b=MsSlDi52g7s1aB0osyGhrhMP4Z
 Mp/Uagabt32nbPJa+yyeJ6Jdd+GNjDYYbhlv9bFIfkUBKdWjzWVWhvlugxlGMbjqdBBbKRxRfBLOb
 eI+lNKYu/7Guxll4GaQgB3BgNtnFcilKF8BJx1cr6tSsyVlUEtW7u1QGURcPWVrXKnYo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfBtd-0004GH-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 07:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C1B34146D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jul 2026 07:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A661F000E9;
 Thu,  2 Jul 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782977496;
 bh=q6gqemwJOuOxefkEr4riKiSbxU01eIA48quPWO2igp4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=QaZrY3+80eem/2ppGFGhBgtkH4rNfkdoD/bwXjbTXfZd21psxWD0zhpDVS6KIXWoK
 i5i6/oJ+LrCl9t6OxJoEZINfR3Y1xK2ma2fLOZ48HLVPhSwnxK7kzfbru+orw0IVAm
 TpuNPbFEpMnPzV47siIE2dp1kmPYx2BqFwCQ9gqCD7iU6BexW6biSpjEteaPPmyOjF
 K8SGW/gAxo8wLhC8DbVm5Hic/mvj/lUoYuEIKMLAnY/paYvUm57KzB7moQ7v5Php7k
 hWOBlrBldLSZpmlrvz32XhwI79h3P+QmIYGy8Rs0RRpjUXet9mgfw8+gRVE674Ygb3
 tQG58ByJkFMww==
Message-ID: <d3830391-6bc5-4d35-a6b7-a77024971774@kernel.org>
Date: Thu, 2 Jul 2026 15:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260702065602.4120914-1-jaegeuk@kernel.org>
 <20260702065602.4120914-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20260702065602.4120914-3-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 external/f2fs-tools/lib/libf2fs.c:1019:12: error: use of undeclared identifier
 'BLKFLSBUF' > 1019 | ioctl(fd, BLKFLSBUF); > | ^~~~~~~~~ > > F [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wfBtd-0004GH-Cy
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs-tools: fix build failure on mac
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C1756F4322

On 7/2/26 14:56, Jaegeuk Kim via Linux-f2fs-devel wrote:
> external/f2fs-tools/lib/libf2fs.c:1019:12: error: use of undeclared identifier 'BLKFLSBUF'
>   1019 |         ioctl(fd, BLKFLSBUF);
>        |                   ^~~~~~~~~
> 
> Fixes: c188a3e303d9 ("f2fs-tools: invalidate block device page cache before reading metadata")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
