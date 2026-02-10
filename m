Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG17Kmv9imlyPAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 10:42:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895C119011
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 10:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zk6Ubkjngi7fJ3BjL5npYvJ5fgQ5GQTUE5e/mS3f5sg=; b=mckM8mxH7hkIGphniULySwQKYB
	lt5VlQJ7+AB7jdBrNBfASn939FGbnNrnnKv8GPIQHFgcHiArAvE9L/6Jc9VMFAITWR6KxQ6iF5rJe
	Rk/MCwUmmWi4ewJF6V5GOOsAWNsz9jTZt/arxoS8WdAeQjVnWMWxECDERd7icFMFZKp8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpjZp-0000pi-Q3;
	Tue, 10 Feb 2026 08:58:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mikolaj.rak@venturex.pl>) id 1vpjZo-0000pa-D4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 08:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=; b=TAbH2sU0Kdndyxk9FdQgWd7lp7
 oqzVqol+NrjjHd+XiGeSAE/EY3ryopx0c9Yd4s1eFBblkY9/QMU/+2IuuJI5HY32mICzmFBAW3eOp
 AOUO5hIqtYHmnZkmKHfV4FDmM9PmPJl3Ht99XOA59TNmn7IbPbdl7KKsGVisAfOKYn0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=; b=g
 9GyxH/kK5TYdYA27WNng2xsseT5F8eib3HoaF21XxAxyYH7EF57vWmdElZIdF6Aj3BxgLDJ8s21dD
 CH0ecCQ7LAV06nOymS8xuaQJOWeI1PN5C/Bx7eR/qI8bQllvjWcp2ytB3T8p5WollW3GuOkPaM4RG
 vCyDVXgFGiEfATBY=;
Received: from mail.venturex.pl ([141.95.86.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpjZn-00005Y-UZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 08:58:32 +0000
Received: by mail.venturex.pl (Postfix, from userid 1002)
 id A78D124C53; Tue, 10 Feb 2026 09:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
 t=1770713905; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
 h=Date:From:To:Subject:From;
 b=ZSS11cCr8JzGca1fv9cDH/84IACMFBoLTWOZNHjVOI9E+cpy1r1yjHevFF3MOWX9C
 3nEkjbtAMJh/99bv5U6YKVHwkcDJGDh5ZaoMDqQy413Dl+W5SbVNorQGZvwgyJj32j
 7BtywGcd+iZpJJ89LVGCltv0F2GIhv/fHTFbBh3Kir8Fto7qFS1hwcTxU501xfmpq0
 6Y3/3wVg7DTJpp5jZQqS6O+aEtrYMYiEY9nRRjI7SHZBPDp7k72K+w5SGqXBWlcbxh
 NUtvFyBdBaVt57RV6M5jxDUfJf5NzHxUET8AqWBLCuw/2kmM5F1pYT8/QbeEfUNReP
 rABncFDYbVI0Q==
Received: by mail.venturex.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 08:56:13 GMT
Message-ID: <20260210084552-0.1.cl.2le1q.0.idqlp6htby@venturex.pl>
Date: Tue, 10 Feb 2026 08:56:13 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.venturex.pl
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Szanowni Państwo, czy byliby Państwo zainteresowani rozmową
    o możliwych rozwiązaniach dla swojej firmy i rodziny? Nowelizacja ustawy
    o Fundacjach Rodzinnych otwiera przed przedsiębiorcami zupełnie nowe możliwości
    ochrony majątku i planowania sukcesji. Fundacja Rodzinna pozwala oddzielić
    aktywa od ryzyk bizn [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1vpjZn-00005Y-UZ
Subject: [f2fs-dev] Fundacja Rodzina a optymalizacja podatkowa
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
From: =?UTF-8?Q? Miko=C5=82aj_Rak ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? Miko=C5=82aj_Rak ?= <mikolaj.rak@venturex.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.12 / 15.00];
	FUZZY_DENIED(11.42)[1:b639f4eae7:0.90:txt];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	FROM_NAME_EXCESS_SPACE(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mikolaj.rak@venturex.pl];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,venturex.pl:s=mail];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,venturex.pl:-];
	DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m.in:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 4895C119011
X-Rspamd-Action: no action

U3phbm93bmkgUGHFhHN0d28sCgpjenkgYnlsaWJ5IFBhxYRzdHdvIHphaW50ZXJlc293YW5pIHJv
em1vd8SFIG8gbW/FvGxpd3ljaCByb3p3acSFemFuaWFjaCBkbGEgc3dvamVqIGZpcm15IGkgcm9k
emlueT8KCk5vd2VsaXphY2phIHVzdGF3eSBvIEZ1bmRhY2phY2ggUm9kemlubnljaCBvdHdpZXJh
IHByemVkIHByemVkc2nEmWJpb3JjYW1pIHp1cGXFgm5pZSBub3dlIG1vxbxsaXdvxZtjaSBvY2hy
b255IG1hasSFdGt1IGkgcGxhbm93YW5pYSBzdWtjZXNqaS4gRnVuZGFjamEgUm9kemlubmEgcG96
d2FsYSBvZGR6aWVsacSHIGFrdHl3YSBvZCByeXp5ayBiaXpuZXNvd3ljaCwgcHJhd255Y2ggaSBw
b2RhdGtvd3ljaCwgYSBqZWRub2N6ZcWbbmllIHphY2hvd2HEhyBrb250cm9sxJkgbmFkIHN3b2lt
IG1hasSFdGtpZW0gaSB6YWRiYcSHIG8gamVnbyB0cndhxYJvxZvEhyBkbGEga29sZWpueWNoIHBv
a29sZcWELgoKQ28gaXN0b3RuZSwgcG8gdXDFgnl3aWUgMTAgbGF0IG9kIHduaWVzaWVuaWEgYWt0
eXfDs3cgZG8gZnVuZGFjamksIHJvc3pjemVuaWEgbyB6YWNob3dlayBwcnplc3RhasSFIG9ib3dp
xIV6eXdhxIcuIFVzdGF3b2Rhd2NhIHByemV3aWR6aWHFgiByw7N3bmllxbwgbGljem5lIHp3b2xu
aWVuaWEgcG9kYXRrb3dlIG9iZWptdWrEhWNlIG0uaW4uIGRvY2hvZHkgeiBkemlhxYJhbG5vxZtj
aSBnb3Nwb2RhcmN6ZWogY3p5IHd5bmFqZW0gbmllcnVjaG9tb8WbY2kuCgpCxJlkxJkgd2R6acSZ
Y3pueSB6YSBpbmZvcm1hY2rEmSwgY3p5IGNoY2llbGlieSBQYcWEc3R3byBwb3puYcSHIG1vxbxs
aXdvxZvEhyBzdHdvcnplbmlhIEZ1bmRhY2ppIFJvZHppbm5laj8KCgpQb3pkcmF3aWFtCk1pa2/F
gmFqIFJhawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
