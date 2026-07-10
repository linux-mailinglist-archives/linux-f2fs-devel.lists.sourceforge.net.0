Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z6yrOvtHUGorwAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 03:16:43 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA827367CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 03:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=c+szajoq;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bdijxuZI;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=AjPzqRIo;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=XjCCxOk0;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4nWST8exwMV0ax+79jqoC92V+H5FSViiNO+XX2Q5Gc=; b=c+szajoqS/Y4X6p1j0BiDt/QTB
	vo4imasVS2pjI49pHGnRvMPp1hnU5IsrSXSjW3K++EjkNkKuo0nNbn1cTtZmy9vyA1W9sUV1Do1gu
	eU/fFmFu6Jam1QfPcAxNVZlJODn3UsTS9/M0rzsXqp3Q4TpzoGrwJDI84d+tPLyVVfZw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whzr2-0001R5-1I;
	Fri, 10 Jul 2026 01:16:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1whzr0-0001Qp-PJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 01:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRP3vfvoLaBR0x+trbaoJtWwSSnfpSriCDu2or8rvxc=; b=bdijxuZIRkynEmOWoYal/9pzsr
 GC9B6h4cEP5SZm0f20RiHPCGO3eKfRAfGuZ/psx4OpitONPdix+09tbWgkg7mwzwPzxkuzwWAjRVC
 Se3F7IC54o5R4qkNrb18uZtMgdCQuuxx1KKagXII7DutYwqFs62YSqA74xLdAS784fPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRP3vfvoLaBR0x+trbaoJtWwSSnfpSriCDu2or8rvxc=; b=AjPzqRIoxBuzo+tj7foTVZoYym
 hDzIvQNzTO6G8dYGkV4VNeCXDY+Btgx0QlewUKB4syz5VTXzhbtzdZ1XIcd0qeyjUf7LIo4moqBU6
 yS0xyS/6ym3j4rgcf2eiCfgbQitY3bhZA+xs7hxkvG+vdxcXslEWnW0TPzpn158I7UTE=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whzqh-0004wG-NF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 01:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IR
 P3vfvoLaBR0x+trbaoJtWwSSnfpSriCDu2or8rvxc=; b=XjCCxOk090qAEnhkJ0
 eqvuOeK5Sh8F5tKy3e7LX/4eA8KAPxoEBkihWn55+ZMkMfz3tCp5Rn1Bvd5AYrUM
 Ggph66+gEZ0RFTu/uMBpaUe9gbnbqwTSCZPUQkN9UD4/tnGE38PXQNe0ISe7hFNB
 kf9w2McGntOkNXE8fILikg6jI=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3p+G2R1Bq0M_wDA--.7522S2; 
 Fri, 10 Jul 2026 09:15:36 +0800 (CST)
To: Chao Yu <chao@kernel.org>
Date: Fri, 10 Jul 2026 09:15:32 +0800
Message-Id: <20260710011534.2307696-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bc4b29f0-8309-4a36-bdbe-b5f375aec31a@kernel.org>
References: <bc4b29f0-8309-4a36-bdbe-b5f375aec31a@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3p+G2R1Bq0M_wDA--.7522S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeiihUUUUU
X-Originating-IP: [39.144.78.103]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBohiufmpQR7je3QAA3s
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > How about cleaning up w/ below macros? > > #define
 F2FS_FOLIO_INDEX(folio, 
 fio) (folio->index + fio->folio_offset) > #define F2FS_FOLIO_BLKCNT(fio)
 (fio->folio_blkcnt ? fio->folio_blkcnt : 1) F2FS_FOLIO_XXX naming seems a
 bit weird to me :). It does not show that we want to use the folio subpage
 index associated with fio, or the blkcnt recorded in fio. I think names like
 F2FS_FIO_LBLK and [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [39.144.78.103 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1whzqh-0004wG-NF
Subject: Re: [f2fs-dev] [RFC PATCH v2 02/10] f2fs: carry subpage offset and
 count in write IO
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:baohua@kernel.org,m:jyescas@google.com,m:lipengfei28@xiaomi.com,m:Dev.Jain@arm.com,m:linux-kernel@vger.kernel.org,m:David.Hildenbrand@arm.com,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: DCA827367CC

> How about cleaning up w/ below macros?
> 
> #define F2FS_FOLIO_INDEX(folio, fio)    (folio->index + fio->folio_offset)
> #define F2FS_FOLIO_BLKCNT(fio)          (fio->folio_blkcnt ? fio->folio_blkcnt : 1)

F2FS_FOLIO_XXX naming seems a bit weird to me :). It does not show that
we want to use the folio subpage index associated with fio, or the blkcnt
recorded in fio. I think names like F2FS_FIO_LBLK and F2FS_FIO_BLKCNT
may be better?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
