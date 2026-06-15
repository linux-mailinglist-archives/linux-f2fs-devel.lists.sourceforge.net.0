Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPF+G4gqMGpFPQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:38:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8368872A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XZXtXTo3;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=WG96+7Zj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="GH/SCJLh";
	dkim=fail ("body hash did not verify") header.d=rosa.ru header.s=mail header.b=iyQpzMoZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svb2f5C3Napdn6ZNbESapX4VVl2MIDIRp/LxsXApmIY=; b=XZXtXTo3hPYAgx9TRSpoMSQkUS
	qIhedqerZ1soq6ZfWJGzEqky7yZyqxfnEXDUXuOn1oK/WBjTAnZOZYW7acKP+dG963+/LfeGT6uBv
	M61i3r6GtWVrGvCvnDBM6FH8vlpUtQOKtGDZ+O2mAKA6ZdATPErjGmuA9dfUjev/Wu3o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZAKM-0006eY-Va;
	Mon, 15 Jun 2026 16:38:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <m.lobanov@rosa.ru>) id 1wZAKK-0006eQ-Jo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDHUogP752j9O3lgSAFEToo3DiQGtGOJDaqcRV9H/X8=; b=WG96+7ZjNQ/Vf8aKJd+9q5KaJa
 cPaCTWo6597izAQPXUEeOgp+/QuT8p1P9784R7s6aPPYTUWtv66CVkIODSu+BwXF1Sgb3LAfmz7hD
 BsMKtWX3jtHG64Mqs+vrpEySfXKAKmZ0lxWfyQPnTl0E2vDgN/7hEE54f3UtNjB8Leuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hDHUogP752j9O3lgSAFEToo3DiQGtGOJDaqcRV9H/X8=; b=GH/SCJLhjZs/pz1BcVO/+uKDLr
 Mx1yqVC9DApiJS5vS78aQiZIGkxHEit1ksizIH3Bjn0S8EL4acN/NZzBQSCPcpZd3V4sZ12G+JWB3
 r8+t9kT1FgvSE7tj1kmbpFuMQX8Oi6CQo+1TD0Bm7jLVWMs58kqop9mIioXgujoRjxA8=;
Received: from [178.154.239.147] (helo=forward100b.mail.yandex.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZAKE-0001SR-JA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:38:18 +0000
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c1e:489c:0:640:8d6b:0])
 by forward100b.mail.yandex.net (Yandex) with ESMTPS id 2EEEB808AB;
 Mon, 15 Jun 2026 19:38:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp)
 with ESMTPSA id xbSonHOfGa60-yzOG0B13; 
 Mon, 15 Jun 2026 19:38:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
 t=1781541482; bh=hDHUogP752j9O3lgSAFEToo3DiQGtGOJDaqcRV9H/X8=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=iyQpzMoZ5jdfbwV/PFpR8od58YlqnrBTeNXd/wJln/O3cnJWVrkKOFNaxN3MZi5T7
 6mS7grFAjgKMncvLU5LW4i6xjNQSS2wxwU2+fcggL7+VfzoQ7XFSCKeIdSMyFu+D5f
 Jyg0/g13/7cwOqA/DXQnsvDRNqmC0eMNqahYDTmI=
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 15 Jun 2026 19:37:59 +0300
Message-Id: <20260615163759.52180-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <ajAiNyPcqd4Blujr@google.com>
References: <20260615113613.20762-1-m.lobanov@rosa.ru>
 <ajAiNyPcqd4Blujr@google.com>
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, Looks good to me, thanks. Mikhail 
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [178.154.239.147 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1wZAKE-0001SR-JA
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: read COW data with the original
 inode during atomic write
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
From: Mikhail Lobanov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mikhail Lobanov <m.lobanov@rosa.ru>
Cc: lvc-project@linuxtesting.org, m.lobanov@rosa.ru,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:lvc-project@linuxtesting.org,m:m.lobanov@rosa.ru,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,rosa.ru:s=mail];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,rosa.ru:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rosa.ru:replyto,rosa.ru:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[m.lobanov@rosa.ru]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CB8368872A

Hi Jaegeuk,

Looks good to me, thanks.

Mikhail


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
