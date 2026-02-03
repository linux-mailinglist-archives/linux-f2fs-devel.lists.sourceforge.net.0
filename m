Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uYhVMBv6gWmhNQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:37:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E59D9F70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o8O+iY27AsBdxxZ5DTh7H3tnqIbg5Nsapqec5vR/Pk=; b=cOV3/sXLDUXy1j171xaQbimU6q
	hPxMvohQGqZXJbhkm5ZWwNh7gwrEFXRHXbANXADTMkznQfxnscRnFqmgsNOj2gaUJRW5sTxDzpMxp
	HFTROx53brxV3zmu/uD261Y5zjhyYbb878eyRyRx7pwSaRcmvUpQtIW7k/Ou0M03roq0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnGah-0004Wm-Jj;
	Tue, 03 Feb 2026 13:37:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vnGag-0004Wf-Bp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRChTHjNWAMGnxldrFHj5N8ou5K/e2edMm/6ExVDQK0=; b=d8y5m6kp4qWJMZlrpxKxqBgG2T
 lhP3fbvMBB8EkMuZemsU299n1je3TfC+Iq81J43VBnmj8G4wHW3BoHdEFKncqjjItEfBF+lhmVw9l
 QOnFABfCp10poVWdB4XLg8ApA9KEshGVAL/Qye76M84e77CG76Fa3XPAopVP21cvnBjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRChTHjNWAMGnxldrFHj5N8ou5K/e2edMm/6ExVDQK0=; b=bmydd8qjtTrpZrfBNGBuLXiW98
 94a6+cXW+Lq2zlEXaN3WH+2xXyMo8lNvTgy7w0a/ZqScowfN6+wo1y0LHLrezgtBhA5hoz+gxQyox
 cYPqlMtCWR+8Qu8+oilMBqDxXCN2z3gBdJGuF2NrVFmlclAVJg8ckPZX26mNrY/lRH+c=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnGaf-0004l6-Kw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1770125833; bh=hRChTHjNWAMGnxldrFHj5N8ou5K/e2edMm/6ExVDQK0=;
 h=From:Subject:Date:Message-ID;
 b=ER0q0+HQDTkmAlBvOXz3bM4hUVMvZ/3gK3fJE6906mgJVEdqvRFwZSNTMDFnpOQ/f
 KH9FzCUFamHaenu5JIBMHtVn48oHrC05mcMZZzEGjXm9T55btwSa/Vq/qQIXhuQBAN
 qp9Bj4TrgP+1g7jbTKnsIYE5bvpScI5p9iudh+f0=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 6981F9EC00006DDB; Tue, 3 Feb 2026 21:36:57 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 1424366685158
X-SMAIL-UIID: CC5521F1755E4660A44675DB990B5ADC-20260203-213657-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue,  3 Feb 2026 21:36:36 +0800
Message-ID: <20260203133635.3942502-5-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203133635.3942502-2-monty_pavel@sina.com>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang f2fs_fiemap() calls f2fs_map_blocks()
 to obtain the block mapping a file, and then merges contiguous mappings into
 extents. If the mapping is found in the read extent cache, node blocks do
 not need to [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vnGaf-0004l6-Kw
Subject: [f2fs-dev] [PATCH 3/4] f2fs: fix fiemap boundary handling when read
 extent cache is incomplete
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,xiaomi.com:email]
X-Rspamd-Queue-Id: 07E59D9F70
X-Rspamd-Action: no action

RnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+CgpmMmZzX2ZpZW1h
cCgpIGNhbGxzIGYyZnNfbWFwX2Jsb2NrcygpIHRvIG9idGFpbiB0aGUgYmxvY2sgbWFwcGluZyBh
CmZpbGUsIGFuZCB0aGVuIG1lcmdlcyBjb250aWd1b3VzIG1hcHBpbmdzIGludG8gZXh0ZW50cy4g
SWYgdGhlIG1hcHBpbmcKaXMgZm91bmQgaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlLCBub2RlIGJs
b2NrcyBkbyBub3QgbmVlZCB0byBiZSByZWFkLgpIb3dldmVyLCBpbiB0aGUgZm9sbG93aW5nIHNj
ZW5hcmlvLCBhIGNvbnRpZ3VvdXMgZXh0ZW50IGNhbiBiZSBzcGxpdAppbnRvIHR3byBleHRlbnRz
OgoKcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNv
dW50PTQgJiYgc3luYwpyb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEu
NE0gYnM9MU0gY291bnQ9MiBzZWVrPTIgY29udj1ub3RydW5jICYmIHN5bmMKcm9vdEB2bTovbW50
L2YyZnMjIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcyAjIGRyb3AgMk1+NE0gZXh0
ZW50IGNhY2hlCnJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBi
cz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwpyb290QHZtOi9tbnQvZjJm
cyMgZjJmc19pbyBmaWVtYXAgMCAxMDI0IGRhdGEuNE0KRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9
IDEwMjQKbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAg
ZmxhZ3MKMAkwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDY0MDAwMDAgMDAwMDAwMDAwMDIwMDAw
MCAwMDAwMTAwMAoxCTAwMDAwMDAwMDAyMDAwMDAgMDAwMDAwMDAwNjYwMDAwMCAwMDAwMDAwMDAw
MjAwMDAwIDAwMDAxMDAxCgpBbHRob3VnaCB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIG9mIHRoZSBy
YW5nZXMgMO+9njJNQiBhbmQgMk3vvZ40TUIgYXJlCmNvbnRpZ3VvdXMsIHRoZSBtYXBwaW5nIGZv
ciB0aGUgMk3vvZ40TUIgcmFuZ2UgaXMgbm90IHByZXNlbnQgaW4gbWVtb3J5LgpXaGVuIHRoZSBw
aHlzaWNhbCBhZGRyZXNzZXMgZm9yIHRoZSAw772eMk1CIHJhbmdlIGFyZSB1cGRhdGVkLCBubyBt
ZXJnZQpoYXBwZW5zIGJlY2F1c2UgdGhlIGFkamFjZW50IG1hcHBpbmcgaXMgbWlzc2luZyBmcm9t
IHRoZSBpbi1tZW1vcnkKY2FjaGUuIEFzIGEgcmVzdWx0LCBmaWVtYXAgcmVwb3J0cyB0d28gc2Vw
YXJhdGUgZXh0ZW50cyBpbnN0ZWFkIG9mIGEKc2luZ2xlIGNvbnRpZ3VvdXMgb25lLgoKVGhlIHJv
b3QgY2F1c2UgaXMgdGhhdCB0aGUgcmVhZCBleHRlbnQgY2FjaGUgZG9lcyBub3QgZ3VhcmFudGVl
IHRoYXQgYWxsCmJsb2NrcyBvZiBhbiBleHRlbnQgYXJlIHByZXNlbnQgaW4gbWVtb3J5LiBUaGVy
ZWZvcmUsIHdoZW4gdGhlIGV4dGVudApsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxvY2tz
X2NhY2hlZCgpIGlzIHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCnRoZSByZW1haW5pbmcgbWFwcGlu
Z3MgYXJlIHJldHJpZXZlZCB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgpIHRvCmVuc3VyZSBj
b3JyZWN0IGZpZW1hcCBleHRlbnQgYm91bmRhcnkgaGFuZGxpbmcuCgpGaXhlczogY2Q4ZmM1MjI2
YmVmICgiZjJmczogcmVtb3ZlIHRoZSBjcmVhdGUgYXJndW1lbnQgdG8gZjJmc19tYXBfYmxvY2tz
IikKU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+
Ci0tLQogZnMvZjJmcy9kYXRhLmMgfCAxNCArKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCA0MmYxNWZkOWM2OGUuLmVlZGFkY2NmODZiYiAx
MDA2NDQKLS0tIGEvZnMvZjJmcy9kYXRhLmMKKysrIGIvZnMvZjJmcy9kYXRhLmMKQEAgLTE2MjMs
OCArMTYyMywxOCBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0
cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCiAJbGZzX2Rpb193cml0ZSA9IChm
bGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJiBmMmZzX2xmc19tb2RlKHNiaSkgJiYKIAkJCQlt
YXAtPm1fbWF5X2NyZWF0ZSk7CiAKLQlpZiAoIW1hcC0+bV9tYXlfY3JlYXRlICYmIGYyZnNfbWFw
X2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpCi0JCWdvdG8gb3V0OworCWlmICghbWFw
LT5tX21heV9jcmVhdGUpIHsKKwkJaWYgKGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1h
cCwgZmxhZykpIHsKKwkJCWlmIChtYXAtPm1fbGVuID09IG1heGJsb2NrcykKKwkJCQlnb3RvIG91
dDsKKwkJCWVsc2UgeworCQkJCXBnb2ZzID0JKHBnb2ZmX3QpbWFwLT5tX2xibGsgKyBtYXAtPm1f
bGVuOworCQkJCWVuZCA9IG1hcC0+bV9sYmxrICsgbWF4YmxvY2tzOworCQkJCW9mcyA9IG1hcC0+
bV9sZW47CisJCQkJZ290byBuZXh0X2Rub2RlOworCQkJfQorCQl9CisJfQogCiAJbWFwLT5tX2Jk
ZXYgPSBpbm9kZS0+aV9zYi0+c19iZGV2OwogCW1hcC0+bV9tdWx0aWRldl9kaW8gPQotLSAKMi40
My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
