Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZxHNGyaDMmoC1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3645698FC9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=m8nVPgtk;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=at7tZyDo;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=GhyAHY8S;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Lv26D56m;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19RTRE05Lv3DKKLo4o2b4EkGEDeE8r8q+B4pv7bLkMs=; b=m8nVPgtk4ABnTKUZ+PLFxlS6ad
	7LCz87rXVF77qVHfF41daOAY1IGSUIS3MLXLLQwIXEApl167VrOEO1MHpZNK0lGBAHna0RcCOuPP1
	L1TX+lBxhXMvSmc5PYnN1J4lXWhLgaqdTdJ0aPxj7wlHbURYyTKa7psJUpGv82reKRBc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZoKP-0002fE-7c;
	Wed, 17 Jun 2026 11:21:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wZoKN-0002ey-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/ifHRev1KZt7zJcATaDa76vriuxBeCWHVdvTL8hqTg=; b=at7tZyDoPsMgZ+f3XrHntR7JZu
 mZ6Be4Yz/9h38jPVCoJP0GvlcDGzDuP1lqTzK8yJn1tLWxXslVY+O4t1BpevX9IEx8YHyr9/jI35I
 LZ3mIABMx1o86MIvoW0VGW66TYciKBOGPZmBcCrq5rQpjFFn2t9TbTxQ+gKiLT4a6qz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H/ifHRev1KZt7zJcATaDa76vriuxBeCWHVdvTL8hqTg=; b=GhyAHY8SpQpagyvEu5j5eKe4DD
 yb0v6Ds7zcl8eq6JSu/6Oy33XL1YxBMWrJiPYUtTs2zGKiTvZVdLHQTMaKX91sG9enuqWHM6LUmne
 D5VNMR7kssH9yRLpHc+fZygvSt1Q/Ha0Xh8KlOx4Kq2lqsjFc2B1VJdDGESyjm35X4RQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZoKL-0002NG-V8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DBAD760121;
 Wed, 17 Jun 2026 11:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BE01F000E9;
 Wed, 17 Jun 2026 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781695256;
 bh=H/ifHRev1KZt7zJcATaDa76vriuxBeCWHVdvTL8hqTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lv26D56moyfzDjRSXP1h969cV8AgvYZ9N6st5AgvVoCbI7grJ+nuu2E96cZpLkujJ
 fCfjAoeLGwcg2Up76V7nMIxDz8uXtv1f+uvfbgEFI4NiZBJRpKSCXB+691y1wO+/he
 IlpoZKSO7qQSouDyMJev/ycppfktDcR34RxiPRQ/sahCYrYZIs2gYs6aao44sMmeFR
 D3MaO1JSIGWwZ2/0wiSf0M2PUx7tpXGw2a7r7bGmA+bxRiexde2llQri+ukVrmGiks
 /CMxwH+duzWuwQ4e2YqAJh32OFRp1KYM3egdns98DgBG84DsIChKcmPKSGsyTJgIaZ
 6pYRzqZ7vt8mg==
To: fstests@vger.kernel.org
Date: Wed, 17 Jun 2026 19:20:30 +0800
Message-ID: <4cfac83869d90a41ab6a1c01ad2b13ad95430f4c.1781694879.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781694879.git.asj@kernel.org>
References: <cover.1781694879.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Define `FSNOTIFYWAIT_PROG` for an upcoming test case that
 uses `fsnotifywait`. Signed-off-by: Anand Jain <asj@kernel.org> Reviewed-by:
 "Darrick J. Wong" <djwong@kernel.org> --- common/config | 1 + 1 file changed, 
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
X-Headers-End: 1wZoKL-0002NG-V8
Subject: [f2fs-dev] [PATCH v7 03/11] fstests: add FSNOTIFYWAIT_PROG
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
From: Anand Jain via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Jain <asj@kernel.org>
Cc: hch@infradead.org, djwong@kernel.org, zlang@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:djwong@kernel.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3645698FC9

Define `FSNOTIFYWAIT_PROG` for an upcoming test case that uses `fsnotifywait`.

Signed-off-by: Anand Jain <asj@kernel.org>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 common/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/config b/common/config
index d5299d5b926f..5661fa0ec310 100644
--- a/common/config
+++ b/common/config
@@ -242,6 +242,7 @@ export BTRFS_MAP_LOGICAL_PROG=$(type -P btrfs-map-logical)
 export PARTED_PROG="$(type -P parted)"
 export XFS_PROPERTY_PROG="$(type -P xfs_property)"
 export FSCRYPTCTL_PROG="$(type -P fscryptctl)"
+export FSNOTIFYWAIT_PROG="$(type -P fsnotifywait)"
 
 # udev wait functions.
 #
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
