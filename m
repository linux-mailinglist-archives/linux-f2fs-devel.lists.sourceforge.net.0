Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDdZL4EJsGlregIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6224C6A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 13:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUkq2DZiN2XfRaE5j5NzYy41BzUJrX2/xMwNNNp7//8=; b=Qmeba3yptVE6JCB7NMWwaLE3NZ
	u3mr4Rc7w0AWkWNnW87/SlWxftRodzB51JxIZJHmS/Cy/m6wh4y1+0YcggPJ+uCoUvunAhEHIWdSP
	sDxDI0MBe01VgvjnDLBz46UXaYHvnZA/crjzqAzBESLyWD0OpExeAb4Oct+ANrlTEDr4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzvrq-0001bo-8L;
	Tue, 10 Mar 2026 12:07:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzvrp-0001bf-03
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 12:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbiaOpWoDrOq/mhltFfNpHA4E5JWfXVOzZwRbgB/hEU=; b=aAFIql5AFs1HZ8zryT2cXE2Js2
 Pujp+PA2EP2nKXmrQhPeq4+EGPFmxCf3J0ud/bjiRcXp6UHsntLI9Ku/g9RXuCjznizIV3aMmEyZH
 PzGctM0/0KLWElsP874fGdMv3cI+VV2RPE/MosUoVaDeWu+tDzpIS5c+vn8Mj+rkmwck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rbiaOpWoDrOq/mhltFfNpHA4E5JWfXVOzZwRbgB/hEU=; b=OWv8QNDmrZgCvmlWJKwoXGaroa
 t1ZG+/vT8UdcGQ1vYwKCDPxpH6yMX6A2Oeo2lCnaIBW2+4/bi8tMIqNzEeuMaZHKHS+RUASQ/Ftig
 3fNmb/qr9AjJHbraYEkmIMSDDu4oGB9uh/ikSWBVkoV8s+mX7/H8yaBFRZ48swS/qujo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzvrp-00033G-E1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 12:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 238654430E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Mar 2026 12:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B664C19423;
 Tue, 10 Mar 2026 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773144427;
 bh=wKIcJeqsWQKvgcn8Z1PSyyRlk6dkXvqm3P0/6Ted13E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MAp+JL/MI7Sf9IuWu9zcCPU4vpCTCzE5JpyPW3HYAEcJqsHl6bCaOCh/K4ZJ3Xuix
 bs9fixEUlWY3kHWQPM8JVdm1vQTN1GTH1bIBUuBRjH/9TJMA05tcYHk0XfNBOwkwXg
 9KnmSDl8ZAEYUEcPXhQgsdAuixJBfeRBWIy7Zqehz5eVdexkvwJUMayrsXjN1JZYBA
 w7tBv+zmNDHATNGU/JfCb7YSnfSY/8DohWqxZ6DvnZjSdvnixrtW3gHXPNSnw6M2v7
 bfE64PrHm1jeOjCGC4VSOhMoo2zhWoOTdfYmAd6WPk+TjF5VIOxgV97q8ajm5zhGS8
 SnElArwMRsy/g==
To: jaegeuk@kernel.org
Date: Tue, 10 Mar 2026 20:06:56 +0800
Message-ID: <20260310120656.604210-2-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310120656.604210-1-chao@kernel.org>
References: <20260310120656.604210-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Fix below compile warning: CC fibmap.o In function ‘stat_bdev’,
    inlined from ‘main’ at fibmap.c:171:2: fibmap.c:123:9: warning: ‘start_lba’
    may be used uninitialized [-Wmaybe-uninitialized] 123 | printf("start_lba
    [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzvrp-00033G-E1
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: fix to avoid uninitialized
 variable access
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 53B6224C6A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Rml4IGJlbG93IGNvbXBpbGUgd2FybmluZzoKCiAgQ0MgICAgICAgZmlibWFwLm8KSW4gZnVuY3Rp
b24g4oCYc3RhdF9iZGV24oCZLAogICAgaW5saW5lZCBmcm9tIOKAmG1haW7igJkgYXQgZmlibWFw
LmM6MTcxOjI6CmZpYm1hcC5jOjEyMzo5OiB3YXJuaW5nOiDigJhzdGFydF9sYmHigJkgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZCBbLVdtYXliZS11bmluaXRpYWxpemVkXQogIDEyMyB8ICAgICAg
ICAgcHJpbnRmKCJzdGFydF9sYmEgPSAldVxuIiwgKnN0YXJ0X2xiYSk7CiAgICAgIHwgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpmaWJtYXAuYzogSW4gZnVu
Y3Rpb24g4oCYbWFpbuKAmToKZmlibWFwLmM6MTQzOjE1OiBub3RlOiDigJhzdGFydF9sYmHigJkg
d2FzIGRlY2xhcmVkIGhlcmUKICAxNDMgfCAgICAgICAgIF9fdTMyIHN0YXJ0X2xiYTsKICAgICAg
fCAgICAgICAgICAgICAgIF5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgotLS0KIHRvb2xzL2ZpYm1hcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlibWFwLmMg
Yi90b29scy9maWJtYXAuYwppbmRleCAwYTkyNTUxLi5kZWE1MzYxIDEwMDY0NAotLS0gYS90b29s
cy9maWJtYXAuYworKysgYi90b29scy9maWJtYXAuYwpAQCAtMTQwLDcgKzE0MCw3IEBAIGludCBt
YWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJaW50IHRvdGFsX2Jsa3M7CiAJdW5zaWduZWQg
aW50IGk7CiAJc3RydWN0IGZpbGVfZXh0IGV4dDsKLQlfX3UzMiBzdGFydF9sYmE7CisJX191MzIg
c3RhcnRfbGJhID0gMDsKIAlfX3UzMiBibGtudW07CiAKIAlpZiAoYXJnYyAhPSAyKSB7Ci0tIAoy
LjQ5LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
