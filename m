Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJHhLxTyp2lmmwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 09:49:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A51CB1FCE33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 09:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vOfW1z/41c5u3+7G8irEJqFxlsDQ2wdjEu836DRVJCw=; b=KnJgSbWZvlpQSBZJp4j6lmciJ2
	gKrHZrSS73mShrhtZZo/aLAj3pjJLrrTzD8CEC6x/3YstnxDajfU3Qp3t/M6lEXrdOuluMyVmv4l5
	QPfKm/xD1VKLeYwfqLUowv4EvffOjYHNo2k13Yw/Priu4rQm2zjn5b3U2kQ0+SzB6l4k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxhuu-0004Nm-5i;
	Wed, 04 Mar 2026 08:49:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vxhuZ-0004Jw-03
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 08:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxDgthgxvlq2ZmYfjZyPAasjrLlFLNSwjnA9lVCz0Tw=; b=Mx7l4pLBIGK+ehFpqAcjc0Wkrm
 M5x2ipFiGZcZ9wHBQ5gEnNqezpk3pF7GEURvtY5mWAeL9wGsQwP+GEUCPHbV7cNt6nSzZnNZgfZGe
 l8NlqdzRdHQ+f2bCzr/iVzLy4Uax1D8Iu+w3ggS4lhcMCnJW7qgnqmYS0DojIV0GULSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZxDgthgxvlq2ZmYfjZyPAasjrLlFLNSwjnA9lVCz0Tw=; b=n
 G7Lq2ariO68l6d/ujZfm9R9r4pdu4t8iJTQ3Y2xDrUXOqBZc/NTlqMJu/ZGRGB2bltco4LCv1U4DK
 sJ+TN55Km5uSPQsTRsOqtSZud+k+LG6UzzbX3H1s16JEsjEJnL6xIWrvDYqBG0uav0Z0mBhjYnORS
 zd5LRfis0KXfeUHE=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxhuW-0004j1-Is for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 08:48:54 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 6248Zj3Z027161
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 4 Mar 2026 16:35:45 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 6248XpS8013299;
 Wed, 4 Mar 2026 16:33:51 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4fQmBp1JLpz2K5B73;
 Wed,  4 Mar 2026 16:32:50 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 4 Mar 2026 16:33:48 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 4 Mar 2026 16:35:16 +0800
Message-ID: <1772613316-19952-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 6248XpS8013299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1772613242;
 bh=ZxDgthgxvlq2ZmYfjZyPAasjrLlFLNSwjnA9lVCz0Tw=;
 h=From:To:CC:Subject:Date;
 b=LffOeWpq1kDiL+d1oQCz2TDZklniRgqXU+czgnz0rjjeWzpTcF1uZ8LUOSyd0WbqY
 OIYb8V54NZ8iZYz/W1kwNynpxpC0G/z9fxHV14dgNcKUB4iftfM333nMGPYMa+3qsC
 PxYsbGR4iN0uJn8SKFT+w2YFyx2e5mHfCZDvnvfyVpzyWYp9Dif0fHuZNkSssD7w0l
 vcjkC8jYTaMG623hdMAmXkDggE2D227d6ZuEVKwkLlgv8WPJKU+hGtdmeHccUPlkDK
 qsZPZjn4CgD6CWrKb09SVmDUg2gr93b1ayDdXNeSpMTZwcB/YEInABht3/uRtnMClR
 VwTyjOtzZrMrQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following steps will change previous value of
 reserve_{blocks, node}, 
 this dones not match the original intention. 1.mount -t f2fs -o
 reserve_root=8192
 imgfile test_mount/ F2FS-fs (loop56): Mounted with checkpoint version =
 1b69f8c7
 mount info: /dev/block/loop56 on /data/test_mount type f2fs (xxx,
 reserve_root=8192 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vxhuW-0004j1-Is
Subject: [f2fs-dev] [PATCH] f2fs: fix to preserve previous reserve_{blocks,
 node} value when remount
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A51CB1FCE33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:ke.wang@unisoc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:zhiguo.niu@unisoc.com,m:Hao_hao.Wang@unisoc.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,unisoc.com:s=default];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,unisoc.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_REPLYTO(0.00)[zhiguo.niu@unisoc.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unisoc.com:replyto,unisoc.com:email,unisoc.com:mid];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

VGhlIGZvbGxvd2luZyBzdGVwcyB3aWxsIGNoYW5nZSBwcmV2aW91cyB2YWx1ZSBvZiByZXNlcnZl
X3tibG9ja3Msbm9kZX0sCnRoaXMgZG9uZXMgbm90IG1hdGNoIHRoZSBvcmlnaW5hbCBpbnRlbnRp
b24uCgoxLm1vdW50IC10IGYyZnMgLW8gcmVzZXJ2ZV9yb290PTgxOTIgaW1nZmlsZSB0ZXN0X21v
dW50LwpGMkZTLWZzIChsb29wNTYpOiBNb3VudGVkIHdpdGggY2hlY2twb2ludCB2ZXJzaW9uID0g
MWI2OWY4YzcKbW91bnQgaW5mbzoKL2Rldi9ibG9jay9sb29wNTYgb24gL2RhdGEvdGVzdF9tb3Vu
dCB0eXBlIGYyZnMgKHh4eCxyZXNlcnZlX3Jvb3Q9ODE5MixyZXNlcnZlX25vZGU9MCxyZXN1aWQ9
MCxyZXNnaWQ9MCx4eHgpCgoyLm1vdW50IC10IGYyZnMgLW8gcmVtb3VudCxyZXNlcnZlX3Jvb3Q9
NDA5NiAvZGF0YS90ZXN0X21vdW50CkYyRlMtZnMgKGxvb3A1Nik6IFByZXNlcnZlIHByZXZpb3Vz
IHJlc2VydmVfcm9vdD04MTkyCmNoZWNrIG1vdW50IGluZm86IHJlc2VydmVfcm9vdCBjaGFuZ2Ug
dG8gNDA5NgovZGV2L2Jsb2NrL2xvb3A1NiBvbiAvZGF0YS90ZXN0X21vdW50IHR5cGUgZjJmcyAo
eHh4LHJlc2VydmVfcm9vdD00MDk2LHJlc2VydmVfbm9kZT0wLHJlc3VpZD0wLHJlc2dpZD0wLHh4
eCkKCkZpeGVzOiBkMTg1MzUxMzI1MjMgKCJmMmZzOiBzZXBhcmF0ZSB0aGUgb3B0aW9ucyBwYXJz
aW5nIGFuZCBvcHRpb25zIGNoZWNraW5nIikKU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhp
Z3VvLm5pdUB1bmlzb2MuY29tPgotLS0KIGZzL2YyZnMvc3VwZXIuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMKaW5kZXggODc3NGM2MC4uMzlmOGU4OCAxMDA2NDQKLS0tIGEvZnMvZjJm
cy9zdXBlci5jCisrKyBiL2ZzL2YyZnMvc3VwZXIuYwpAQCAtMTUxNSw2ICsxNTE1LDcgQEAgc3Rh
dGljIGludCBmMmZzX2NoZWNrX29wdF9jb25zaXN0ZW5jeShzdHJ1Y3QgZnNfY29udGV4dCAqZmMs
CiAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9i
bG9ja3MpOwogICAgICAgICAgICAgICAgY3R4X2NsZWFyX29wdChjdHgsIEYyRlNfTU9VTlRfUkVT
RVJWRV9ST09UKTsKICAgICAgICAgICAgICAgIGN0eC0+b3B0X21hc2sgJj0gfkJJVChGMkZTX01P
VU5UX1JFU0VSVkVfUk9PVCk7CisgICAgICAgICAgICAgICBjdHgtPnNwZWNfbWFzayAmPSB+RjJG
U19TUEVDX3Jlc2VydmVfcm9vdDsKICAgICAgICB9CiAgICAgICAgaWYgKHRlc3Rfb3B0KHNiaSwg
UkVTRVJWRV9OT0RFKSAmJgogICAgICAgICAgICAgICAgICAgICAgICAoY3R4LT5vcHRfbWFzayAm
IEJJVChGMkZTX01PVU5UX1JFU0VSVkVfTk9ERSkpICYmCkBAIC0xNTIzLDYgKzE1MjQsNyBAQCBz
dGF0aWMgaW50IGYyZnNfY2hlY2tfb3B0X2NvbnNpc3RlbmN5KHN0cnVjdCBmc19jb250ZXh0ICpm
YywKICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVk
X25vZGVzKTsKICAgICAgICAgICAgICAgIGN0eF9jbGVhcl9vcHQoY3R4LCBGMkZTX01PVU5UX1JF
U0VSVkVfTk9ERSk7CiAgICAgICAgICAgICAgICBjdHgtPm9wdF9tYXNrICY9IH5CSVQoRjJGU19N
T1VOVF9SRVNFUlZFX05PREUpOworICAgICAgICAgICAgICAgY3R4LT5zcGVjX21hc2sgJj0gfkYy
RlNfU1BFQ19yZXNlcnZlX25vZGU7CiAgICAgICAgfQoKICAgICAgICBlcnIgPSBmMmZzX2NoZWNr
X3Rlc3RfZHVtbXlfZW5jcnlwdGlvbihmYywgc2IpOwotLQoxLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KIFRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMp
IGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0IGlz
IGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxlZ2Vk
LCBjb25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIFVu
YXV0aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9m
IHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFjdGlv
biBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3Jt
YXRpb24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBvciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUg
bWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHJl
YWQsIGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBvdGhl
cnMuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50bHkg
ZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVkIGl0
IGluIGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0
byBiZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2VuZGVy
IGRvZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25zLgrm
nKzpgq7ku7blj4rlhbbpmYTku7blhbfmnInkv53lr4bmgKfotKjvvIzlj5fms5Xlvovkv53miqTk
uI3lvpfms4TpnLLvvIzku4Xlj5HpgIHnu5nmnKzpgq7ku7bmiYDmjIfnibnlrprmlLbku7bkurrj
gILkuKXnpoHpnZ7nu4/mjojmnYPkvb/nlKjjgIHlrqPkvKDjgIHlj5HluIPmiJblpI3liLbmnKzp
gq7ku7bmiJblhbblhoXlrrnjgILoi6XpnZ7or6XnibnlrprmlLbku7bkurrvvIzor7fli7/pmIXo
r7vjgIHlpI3liLbjgIEg5L2/55So5oiW5oqr6Zyy5pys6YKu5Lu255qE5Lu75L2V5YaF5a6544CC
6Iul6K+v5pS25pys6YKu5Lu277yM6K+35LuO57O757uf5Lit5rC45LmF5oCn5Yig6Zmk5pys6YKu
5Lu25Y+K5omA5pyJ6ZmE5Lu277yM5bm25Lul5Zue5aSN6YKu5Lu255qE5pa55byP5Y2z5Yi75ZGK
55+l5Y+R5Lu25Lq644CC5peg5rOV5L+d6K+B5LqS6IGU572R6YCa5L+h5Y+K5pe244CB5a6J5YWo
44CB5peg6K+v5oiW6Ziy5q+S44CC5Y+R5Lu25Lq65a+55Lu75L2V6ZSZ5ryP5Z2H5LiN5om/5ouF
6LSj5Lu744CCCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
