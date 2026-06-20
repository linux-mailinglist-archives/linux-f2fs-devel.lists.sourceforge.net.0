Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +LRxHtp5NmrtAAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 13:30:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D85056A8CD6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 13:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=amxTfYlx;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gazsY6F2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="J kDd2O2";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=elshams.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:MIME-Version:Message-ID:Date:To:From:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VKigQ+oa14xKuTkXY9Vf9nctsNjJ472WyepT4XhoXrM=; b=amxTfYlx7c13eRQtwBuwNc9wyF
	WcW6Vhan+4G60oZ7aQknvEtFC+cbkIM+ZOkOXuvPuytbd85Ch7FeeivpmSjnvFvecJSfRMOWfTjxC
	FCeJv9/IsHTpDRLQVGKB4fTKypVe+00jcDqURUnj/2Ir/VV725L3mjFNTBPj6LMkjjbc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waszD-0006uf-PX;
	Sat, 20 Jun 2026 10:31:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adam.christiansen@elshams.com>) id 1waszB-0006uZ-Pp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 10:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNFzFDz+mS7qyogcYtdY2Lij/kJAcuEN9RJk5ANoHcw=; b=gazsY6F2c0ZVmZYNhwP8UJAnc7
 +BibQffc8uV7cN51lekfSprXgweT0qungILRCeoT17MHM+AetagyprxMZ5VoxHELUEFsDPt5AJbH1
 7Pqqq15VLIV5XQCW0dfDnQi+PN8yOyswOu1pWidpy5LDbC1tpwZRu7FrXXocZjkRSBng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wNFzFDz+mS7qyogcYtdY2Lij/kJAcuEN9RJk5ANoHcw=; b=J
 kDd2O2m0LsxgU1dePFikOVymVQvvg0YgSeFFMHK0KLeL89BbMlNHelFiqr/TEbSXD+KLTEoXjcZnc
 dbEFL2eMkEBfwkIiKoFrczbKxPDMhUe8V30skBP/WidPjvY9kPSqzABPC/f/i+ADKhv/YF0uLDGUS
 Tp62DE0700hRpoRk=;
Received: from [95.215.32.33] (helo=svn.publicvm.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1waszB-0001aX-KB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 10:31:38 +0000
Received: from [127.0.0.1] (account jocus@svn.publicvm.com HELO [95.215.32.33])
 by svn.publicvm.com (CommuniGate Pro SMTP 6.2.14 _community_)
 with ESMTPA id 5701791 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 03:31:10 -0700
From: Adam Christiansen <adam.christiansen@elshams.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 20 Jun 2026 03:31:10 -0700
Message-ID: <20260620033110.782D6EED2FB84842@elshams.com>
MIME-Version: 1.0
X-Spam-Score: 4.0 (++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I am Adam,
 an investment broker. I connect business owners
 with lenders and investors for loans, working capital and expansion funding.
 Is securing financing something your business is currently exploring? A simple
 yes or no reply works perfectly. 
 Content analysis details:   (4.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 4.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [95.215.32.33 listed in dnsbl-1.uceprotect.net]
X-Headers-End: 1waszB-0001aX-KB
Subject: [f2fs-dev] Your investment partner
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
Reply-To: Adam Christiansen <adamjchristiansen01@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.79 / 15.00];
	MSBL_EBL(7.50)[adamjchristiansen01@proton.me:replyto];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[elshams.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[adamjchristiansen01@proton.me];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adam.christiansen@elshams.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85056A8CD6
X-Spam: Yes

Hi,

I am Adam, an investment broker. I connect business owners with lenders and investors for loans, working capital and expansion funding.

Is securing financing something your business is currently exploring?
A simple yes or no reply works perfectly.

Thanks,

Morgan Investment Broker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
