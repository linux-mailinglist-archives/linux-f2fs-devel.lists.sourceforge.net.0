Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LfcGF1ctPGr9kwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 21:17:43 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5896C0F82
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 21:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HSiFBwbz;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gchsjRF0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="i VEW0Hk";
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=casper.20170209 header.b="P3Blr/FQ";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHVInfWpr7IxX/6jTdeooZMH31wCMaucKxRD8MUzUTc=; b=HSiFBwbzHje5yk5DN8hQDkf1U8
	EmhqJZHxO58K2kxDj2edrWeiXSaU7Yi06zlQRXKWWLXdVyIr5NvPWpQAFFnL+9hXETcCDhxmqbikg
	c57/e+5qs9Qb+IcFNrKWZFN7LwfcTQo8AW09j/2bqxiV7xSl2ZXf7SolTed+3Wwh2TQ8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcT6L-0006NY-Ad;
	Wed, 24 Jun 2026 19:17:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1wcT6J-0006NQ-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 19:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqBc39xoDehUWuVu6AI6mn/gD7zXjqbqDQU6DrDbctI=; b=gchsjRF057wH5GYsWIE3uCKK7z
 uCtZfU6mbtZqx5mPtyrrK76CZW0IegtTNQknHBacdAloABlqifxzUVLwFXIQWbPHqZit4tQUwlIp6
 N9Bi1k75SVNy4Rid9x4i0ouV4kIrh+QGvZUBcloTLz4RYYy3jmQwcCXQNmKwpT+aLkm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bqBc39xoDehUWuVu6AI6mn/gD7zXjqbqDQU6DrDbctI=; b=i
 VEW0HkHfFSefaDza4jkZdfMRWcNZk6uMuEq3v3PaJ+asQaK+UEjDS2gIj23+SlGAlRcxX7yPW+Nib
 TJlmHi9Q0MhGDWJv6U439+T/ldZFaPnV2JtbMCBBVYqmXVJzADek4d7A8agFTxU6YDnbyynhcnFTS
 gT9Twi4EhOqWhOsE=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcT6H-0006Wn-L7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 19:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bqBc39xoDehUWuVu6AI6mn/gD7zXjqbqDQU6DrDbctI=; b=P3Blr/FQoLsDznHwZjUUmuCF4A
 sZb56+wF7UCTV/Y/5WVd1/j4fTMY21gJkKubCLELbgnA7qjvYu5AnU5KUlaftQ7Tdp5QRFpkBnf1Q
 xsPtZtPJYHPsuYRowtANcexfKkz4HXgiI+rsilTZahhtJKw5IsgWQ/HyRe3bY5+u9hflDjOTiSAe6
 T+zWrOLGCrgsEhfzjLDbMJWzPpeZwOvXpUUPE6yCI/NMORylPALoZBEkHbI80ZmduQ3RAKlA6Etqe
 BKY70iGiBmTGe/HkgV2UV2+AlSd/cil7U/0+LnURnH6yypLT0JKTEKkNc1yesAjt5+nvfQ+pCsiSZ
 LWiKhpjw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wcT69-00000008Zuo-2VOT;
 Wed, 24 Jun 2026 19:17:22 +0000
Date: Wed, 24 Jun 2026 20:17:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Message-ID: <ajwtQRawMxcQkyo8@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jiucheng, I am trying to remove FGP_NOFS from the kernel
 and the last remaining user was added by you last year in commit 2308de27c03d.
 I'm trying to understand why. Did you see an actual problem if you do not
 [...] Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1wcT6H-0006Wn-L7
Subject: [f2fs-dev] Use of FGP_NOFS in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jiucheng.xu@amlogic.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA5896C0F82

Hi Jiucheng,

I am trying to remove FGP_NOFS from the kernel and the last remaining
user was added by you last year in commit 2308de27c03d.  I'm trying to
understand why.  Did you see an actual problem if you do not use it,
or was it theoretical?  The commit message says "to avoid potential
deadlock issues", but it's not clear to me whether you know they are
there, or only think they are there.

I'd really like to understand what the issues are as the normal issues
which make calling into the filesystem (holding another folio locked,
holding a mutex relied upon by reclaim) don't seem to be present.
So if there is something, I'm not sure what it is.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
