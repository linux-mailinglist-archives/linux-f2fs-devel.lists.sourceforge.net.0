Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMbTKu/2qGktzwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 04:22:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE120A7D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 04:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EA/kEC+zd6LEX5RMYaBVWY397heVOin8h5m0c7mKD1M=; b=ZTcpZg+CjG0JTBa2Kq4c8SK632
	7ByUi4VPL0XI27XcpkfXOvKAwUJNGHw+Rg08DZFsJCT9o4xnK+9fwdA87z0yHshEPtdc9dPasiVKo
	+REM/SlO1e+mq0urZio3aq6aW+pstZgMCGrcOHkD6c4DWYl0jI3vuzX8sbMCfzy4eXkk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxzHv-0000kh-NZ;
	Thu, 05 Mar 2026 03:22:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vxzHs-0000kW-8U
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 03:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=400WQIFn++ZKQ1Ry/cxj5etcTJY4nE54JPnrb8u/8tQ=; b=f6Tj13BzilL6Z/aeuJowe2NCHT
 eIR+gvLfdq5sS1QCfW+Eqik1r3AQcpUEW+bs5Vp1VQRAZrCSAQffJOfgPeL43Zw7wOBhLl3XMCuBN
 JYCN8evEMMZg+XpQKAH5CXIXzItkfNMXLb7LStoZCr4jhHw66bI00BwVE3uNHRZhfjyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=400WQIFn++ZKQ1Ry/cxj5etcTJY4nE54JPnrb8u/8tQ=; b=K
 4X1nTs2k6Xc19MH/i7bytCW5KocqpPXGiAdkBqzZo6rqUnNzWoqtQnF24ySWi2hYiDwEbE3V2ng0S
 rScTug6E1jwvNEk+whal1rvW2nsd+OldKF8cFgxGDE45pXTYnX8KIOlX+aMYoSeU8WNNieKlP0jtN
 e03XEfBvtdVoPAAc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxzHq-00016m-SF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 03:22:08 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 6253LAXE052432;
 Thu, 5 Mar 2026 11:21:10 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4fRFCW14HXz2P9BsF;
 Thu,  5 Mar 2026 11:20:07 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 5 Mar 2026 11:21:07 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 5 Mar 2026 11:22:46 +0800
Message-ID: <1772680966-29939-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 6253LAXE052432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1772680888;
 bh=400WQIFn++ZKQ1Ry/cxj5etcTJY4nE54JPnrb8u/8tQ=;
 h=From:To:CC:Subject:Date;
 b=NFlbgOfPW3LtTqZgH4BkLce1wtxWvyTajnjvE5Lo1aCIffd0iyXM2jCttySVdpOK+
 vLY75gLKCugjmz5rT1J2tXMhb4hDPwJZQ06BTPJVYyTJUWpeunUdq6nDM/4rsWhhUj
 3/HVT1dHLgYK4/DlPGdhu0gpQh8Xvq+NE7aXqEmHfxOl9KHeYW61JeWBP/bXLZt1PW
 SLMUX3IndrmvwEnuW8DMzZQ496tXKJhwO/kHqXZwI9QXlaCljbDoZjy7gEQZTYpWdc
 Nmjp4xX7PQ4ZWLJjiCf6yxFSA7SfhGayCxohXs6Jm1Isb2FwNYT/eNyF8Iko8i4dKM
 xvTrO/jzyht8w==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
X-Headers-End: 1vxzHq-00016m-SF
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to preserve previous
 reserve_{blocks, node} value when remount
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
X-Rspamd-Queue-Id: AFCE120A7D8
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:ke.wang@unisoc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:zhiguo.niu@unisoc.com,m:Hao_hao.Wang@unisoc.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,unisoc.com:s=default];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,unisoc.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[zhiguo.niu@unisoc.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
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
eCkKClByaW9yIHRvIGNvbW1pdCBkMTg1MzUxMzI1MjMgKCJmMmZzOiBzZXBhcmF0ZSB0aGUgb3B0
aW9ucyBwYXJzaW5nIGFuZCBvcHRpb25zIGNoZWNraW5nIiksCnRoZSB2YWx1ZSBvZiByZXNlcnZl
X3tibG9ja3Msbm9kZX0gd2FzIG9ubHkgc2V0IGR1cmluZyB0aGUgZmlyc3QgbW91bnQsIGFsb25n
IHdpdGgKdGhlIGNvcnJlc3BvbmRpbmcgbW91bnQgb3B0aW9uIEYyRlNfTU9VTlRfUkVTRVJWRV97
Uk9PVCxOT0RFfSAuIElmIHRoZSBtb3VudCBvcHRpb24KRjJGU19NT1VOVF9SRVNFUlZFX3tST09U
LE5PREV9IHdhcyBmb3VuZCB0byBoYXZlIGJlZW4gc2V0IGR1cmluZyB0aGUgbW91bnQvcmVtb3Vu
dCwKdGhlIHByZXZpb3VzbHkgdmFsdWUgb2YgcmVzZXJ2ZV97YmxvY2tzLG5vZGV9IHdvdWxkIGFs
c28gYmUgcHJlc2VydmVkLCBhcyBzaG93biBpbgp0aGUgY29kZSBiZWxvdy4KICAgICAgICAgICAg
IGlmICh0ZXN0X29wdChzYmksIFJFU0VSVkVfUk9PVCkpIHsKICAgICAgICAgICAgICAgICAgIGYy
ZnNfaW5mbyhzYmksICJQcmVzZXJ2ZSBwcmV2aW91cyByZXNlcnZlX3Jvb3Q9JXUiLAogICAgICAg
ICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3Mp
OwogICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNi
aSkucm9vdF9yZXNlcnZlZF9ibG9ja3MgPSBhcmc7CiAgICAgICAgICAgICAgICAgICBzZXRfb3B0
KHNiaSwgUkVTRVJWRV9ST09UKTsKICAgICAgICAgICAgIH0KQnV0IGNvbW1pdCBkMTg1MzUxMzI1
MjMgKCJmMmZzOiBzZXBhcmF0ZSB0aGUgb3B0aW9ucyBwYXJzaW5nIGFuZCBvcHRpb25zIGNoZWNr
aW5nIikKb25seSBwcmVzZXJ2ZWQgdGhlIHByZXZpb3VzIG1vdW50IG9wdGlvbjsgaXQgZGlkIG5v
dCBwcmVzZXJ2ZSB0aGUgcHJldmlvdXMgdmFsdWUgb2YKcmVzZXJ2ZV97YmxvY2tzLG5vZGV9LiBT
aW5jZSB2YWx1ZSBvZiByZXNlcnZlX3tibG9ja3Msbm9kZX0gdmFsdWUgaXMgYXNzaWduZWQKb3Ig
bm90IGRlcGVuZHMgb24gY3R4LT5zcGVjX21hc2ssIGN0eC0+c3BlY19tYXNrIHNob3VsZCBiZSBh
bG9zIGhhbmRsZWQgaW4KZjJmc19jaGVja19vcHRfY29uc2lzdGVuY3kuCgpUaGlzIHBhdGNoIHdp
bGwgY2xlYXIgdGhlIGNvcnJlc3BvbmRpbmcgY3R4LT5zcGVjX21hc2sgYml0cyBpbiBmMmZzX2No
ZWNrX29wdF9jb25zaXN0ZW5jeQp0byBwcmVzZXJ2ZSB0aGUgcHJldmlvdXNseSB2YWx1ZXMgb2Yg
cmVzZXJ2ZV97YmxvY2tzLG5vZGV9IGlmIGl0IGFscmVhZHkgaGF2ZSBhIHZhbHVlLgoKRml4ZXM6
IGQxODUzNTEzMjUyMyAoImYyZnM6IHNlcGFyYXRlIHRoZSBvcHRpb25zIHBhcnNpbmcgYW5kIG9w
dGlvbnMgY2hlY2tpbmciKQpTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVu
aXNvYy5jb20+Ci0tLQp2MjogYWRkIG1vcmUgZGV0YWlsIGluZm8gaW4gY29tbWl0IG1zZyBzdWdn
ZXN0ZWQgYnkgQ2hhbwotLS0KIGZzL2YyZnMvc3VwZXIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZz
L3N1cGVyLmMKaW5kZXggODc3NGM2MC4uMzlmOGU4OCAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zdXBl
ci5jCisrKyBiL2ZzL2YyZnMvc3VwZXIuYwpAQCAtMTUxNSw2ICsxNTE1LDcgQEAgc3RhdGljIGlu
dCBmMmZzX2NoZWNrX29wdF9jb25zaXN0ZW5jeShzdHJ1Y3QgZnNfY29udGV4dCAqZmMsCiAgICAg
ICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9ja3Mp
OwogICAgICAgICAgICAgICAgY3R4X2NsZWFyX29wdChjdHgsIEYyRlNfTU9VTlRfUkVTRVJWRV9S
T09UKTsKICAgICAgICAgICAgICAgIGN0eC0+b3B0X21hc2sgJj0gfkJJVChGMkZTX01PVU5UX1JF
U0VSVkVfUk9PVCk7CisgICAgICAgICAgICAgICBjdHgtPnNwZWNfbWFzayAmPSB+RjJGU19TUEVD
X3Jlc2VydmVfcm9vdDsKICAgICAgICB9CiAgICAgICAgaWYgKHRlc3Rfb3B0KHNiaSwgUkVTRVJW
RV9OT0RFKSAmJgogICAgICAgICAgICAgICAgICAgICAgICAoY3R4LT5vcHRfbWFzayAmIEJJVChG
MkZTX01PVU5UX1JFU0VSVkVfTk9ERSkpICYmCkBAIC0xNTIzLDYgKzE1MjQsNyBAQCBzdGF0aWMg
aW50IGYyZnNfY2hlY2tfb3B0X2NvbnNpc3RlbmN5KHN0cnVjdCBmc19jb250ZXh0ICpmYywKICAg
ICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVz
KTsKICAgICAgICAgICAgICAgIGN0eF9jbGVhcl9vcHQoY3R4LCBGMkZTX01PVU5UX1JFU0VSVkVf
Tk9ERSk7CiAgICAgICAgICAgICAgICBjdHgtPm9wdF9tYXNrICY9IH5CSVQoRjJGU19NT1VOVF9S
RVNFUlZFX05PREUpOworICAgICAgICAgICAgICAgY3R4LT5zcGVjX21hc2sgJj0gfkYyRlNfU1BF
Q19yZXNlcnZlX25vZGU7CiAgICAgICAgfQoKICAgICAgICBlcnIgPSBmMmZzX2NoZWNrX3Rlc3Rf
ZHVtbXlfZW5jcnlwdGlvbihmYywgc2IpOwotLQoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KIFRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMpIGlzIGlu
dGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0IGlzIGFkZHJl
c3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxlZ2VkLCBjb25m
aWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIFVuYXV0aG9y
aXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRoaXMg
ZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFjdGlvbiBpbiBy
ZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3JtYXRpb24g
aGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBvciBh
biBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUgbWVzc2Fn
ZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5
b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHJlYWQsIGNv
cHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBvdGhlcnMuIFBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50bHkgZGVsZXRl
IHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVkIGl0IGluIGVy
cm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSB0
aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2VuZGVyIGRvZXMg
bm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25zLgrmnKzpgq7k
u7blj4rlhbbpmYTku7blhbfmnInkv53lr4bmgKfotKjvvIzlj5fms5Xlvovkv53miqTkuI3lvpfm
s4TpnLLvvIzku4Xlj5HpgIHnu5nmnKzpgq7ku7bmiYDmjIfnibnlrprmlLbku7bkurrjgILkuKXn
poHpnZ7nu4/mjojmnYPkvb/nlKjjgIHlrqPkvKDjgIHlj5HluIPmiJblpI3liLbmnKzpgq7ku7bm
iJblhbblhoXlrrnjgILoi6XpnZ7or6XnibnlrprmlLbku7bkurrvvIzor7fli7/pmIXor7vjgIHl
pI3liLbjgIEg5L2/55So5oiW5oqr6Zyy5pys6YKu5Lu255qE5Lu75L2V5YaF5a6544CC6Iul6K+v
5pS25pys6YKu5Lu277yM6K+35LuO57O757uf5Lit5rC45LmF5oCn5Yig6Zmk5pys6YKu5Lu25Y+K
5omA5pyJ6ZmE5Lu277yM5bm25Lul5Zue5aSN6YKu5Lu255qE5pa55byP5Y2z5Yi75ZGK55+l5Y+R
5Lu25Lq644CC5peg5rOV5L+d6K+B5LqS6IGU572R6YCa5L+h5Y+K5pe244CB5a6J5YWo44CB5peg
6K+v5oiW6Ziy5q+S44CC5Y+R5Lu25Lq65a+55Lu75L2V6ZSZ5ryP5Z2H5LiN5om/5ouF6LSj5Lu7
44CCCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
