Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rskdAfxHUGotwAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 03:16:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C017367CD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 03:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="K/R33TUu";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ErIFGVYN;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=O92Lh9E5;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=crtjClSM;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DETmMnPJFuNL9iA66eA+zP7d2CQzBg/y5624LhQ9egU=; b=K/R33TUuTd8bdhN9VOVjIjsEwG
	S9JSm7nSBlc4w4fgeaONKmTSQYvkLq+o9i3/l7tNIG7E5dAKmO2uexb7JQNRWpP4mvqkyzk6XPRF5
	qBpOp15buny0iAP2tK+c6I3SApBa04JeWUQA9I9DFuDCk9/VeL2hdIlcLVKVo2l4IL3M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whzr0-0001gq-SA;
	Fri, 10 Jul 2026 01:16:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1whzqd-0001fH-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 01:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKv40+Rzw+MoVgpFHomEnuLuSrw5OPIiQZ1nay2qfrI=; b=ErIFGVYNvN47MLx85YlJ6u1MsL
 8lfR2JAx1ZpuAWMQkzmSBlNRg3zM10SqVIU8+wTmTQzlLkFV6iP/dqAKn/rwHVMlF5kTz12oWUWOA
 9CKOx58YE0qh3LTQ2/sxygZ28K6y6h81LzIRzTAx88RCw2m4dPtsOKjSdAEaPbEDA+P0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JKv40+Rzw+MoVgpFHomEnuLuSrw5OPIiQZ1nay2qfrI=; b=O92Lh9E53U3s+FR0xj4Muhbt+J
 reK9a/xibG19QYMKWJ8tGcRzXICwZzshSMx1i+HhLwi7yPb7GjhqwH18gLUG6pe/CV3FJL/eKTtov
 EmaNJp/aiNGO3aAp6kuEStT8MMrA6xB3yqtZIczf/J6YSHc7JZpU8zRSYEBrOdAXxWtE=;
Received: from m16.mail.126.com ([220.197.31.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whzqc-0004w0-DI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 01:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=JK
 v40+Rzw+MoVgpFHomEnuLuSrw5OPIiQZ1nay2qfrI=; b=crtjClSM7mkpJ8BrJV
 0a2qd77WzCoTglY7tsfuJkCUAeeO+qQx175rjSQaioi0OvDZ21CoDFXGASV7Fy+r
 GYiB4MRZorq841kztjvnYkOrV37OGXj9y172md8i0gMUwuk8Lzl8okXiK1CCoQcI
 dc5v4lM3CrCag7iPzcJk86Iy8=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3p+G2R1Bq0M_wDA--.7522S3; 
 Fri, 10 Jul 2026 09:15:37 +0800 (CST)
To: Chao Yu <chao@kernel.org>
Date: Fri, 10 Jul 2026 09:15:33 +0800
Message-Id: <20260710011534.2307696-2-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a9b257fd-68ce-45a6-b4df-be5faf583e2d@kernel.org>
References: <a9b257fd-68ce-45a6-b4df-be5faf583e2d@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3p+G2R1Bq0M_wDA--.7522S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4xKryrXFWrurW3JrWUurg_yoW5Wryxpr
 Z5GF1vyr4fGFy5W3WUJr1Svry7Ar9xXF4DZay3Cw4fJ3W2qw1ruFn7J34j9F4fJry8ZFn3
 tay5CFn3WF4YyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNiSLUUUUU=
X-Originating-IP: [39.144.78.103]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBmufmpQR7nqmgAA3N
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Seems there are redundant codes below, let's have a try
 to wrap them w/ a macro for cleanup? Got it, thanks! How about the following
 example implementation? static inline unsigned long
 f2fs_folio_get_private_flags(const
 struct folio *folio) { if (f2fs_folio_has_state(folio)) { struct
 f2fs_folio_state *ffs = folio->private; 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [39.144.78.103 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1whzqc-0004w0-DI
Subject: Re: [f2fs-dev] [RFC PATCH v2 01/10] f2fs: extend folio state for
 large folio write path
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
From: Nanzhe Zhao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:baohua@kernel.org,m:jyescas@google.com,m:lipengfei28@xiaomi.com,m:Dev.Jain@arm.com,m:linux-kernel@vger.kernel.org,m:David.Hildenbrand@arm.com,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32C017367CD

> Seems there are redundant codes below, let's have a try to wrap them w/ a macro for cleanup?

Got it, thanks!
How about the following example implementation?

static inline unsigned long f2fs_folio_get_private_flags(const struct folio *folio)
{
	if (f2fs_folio_has_state(folio)) {
		struct f2fs_folio_state *ffs = folio->private;

		return ffs->private_flags;
	}

	return (unsigned long)folio->private;
}

static inline void f2fs_folio_set_private_flags(struct folio *folio,
						unsigned long flags)
{
	if (f2fs_folio_has_state(folio)) {
		struct f2fs_folio_state *ffs = folio->private;

		ffs->private_flags |= flags;
		return;
	}

	if (!folio_test_private(folio))
		folio_attach_private(folio, (void *)flags);
	else
		folio->private = (void *)((unsigned long)folio->private | flags);
}

static inline void f2fs_folio_clear_private_flags(struct folio *folio,
						 unsigned long flags)
{
	unsigned long private;

	if (f2fs_folio_has_state(folio)) {
		struct f2fs_folio_state *ffs = folio->private;

		ffs->private_flags &= ~flags;
		return;
	}

	private = (unsigned long)folio->private;
	private &= ~flags;
	if (private == BIT(PAGE_PRIVATE_NOT_POINTER))
		folio_detach_private(folio);
	else
		folio->private = (void *)private;
}

#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
static inline bool folio_test_f2fs_##name(const struct folio *folio)\
{\
	unsigned long priv = f2fs_folio_get_private_flags(folio);\
	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |\
			     (1UL << PAGE_PRIVATE_##flagname);\
	return (priv & v) == v;\
}\
static inline bool page_private_##name(struct page *page)\
{\
	return PagePrivate(page) &&\
		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) &&\
		test_bit(PAGE_PRIVATE_##flagname, &page_private(page));\
}

#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
static inline void folio_set_f2fs_##name(struct folio *folio)\
{\
	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |\
			     (1UL << PAGE_PRIVATE_##flagname);\
	f2fs_folio_set_private_flags(folio, v);\
}\
static inline void set_page_private_##name(struct page *page)\
{\
	if (!PagePrivate(page))\
		attach_page_private(page, (void *)0);\
	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));\
	set_bit(PAGE_PRIVATE_##flagname, &page_private(page));\
}

#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
static inline void folio_clear_f2fs_##name(struct folio *folio)\
{\
	f2fs_folio_clear_private_flags(folio,\
			1UL << PAGE_PRIVATE_##flagname);\
}\
static inline void clear_page_private_##name(struct page *page)\
{\
	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page));\
	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))\
		detach_page_private(page);\
}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
