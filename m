Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fm0OvMswWmbRAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 13:07:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AB2F1A7A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 13:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeSqqLjs080gFVzCfaDr2vlYiKHZwI9yqz4qPPfv5/E=; b=eanQtOCPQipYNQowaCwKRHU3ub
	YQ/FhUGWvrKbv6Umyj80UQUdrYgaqOPY3Iup9BhDRsdMbaICki6MrNJwzHT+E0LUDTuOVtHm8xVIo
	kPyRsxlFUoHhSHw20EraeVO+O7QZwBzVQM3EuzKbXB4a4trDK73un3bnI58xTWIrGAyc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4e3s-0002J6-TZ;
	Mon, 23 Mar 2026 12:07:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w4e3r-0002Iz-RE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 12:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RCSBGNDLpAJPH5lka1KlWycj1BLhtlhzaY1xa6mzvlw=; b=NUeJ5jG9wlBZ15EqaGz2eqyg91
 bjpv0Y4gd1HmfhWnFM+7OEs1xs1tZsgZhcZbE2yZl1EH+tqt4+RhoFoLc7KGCKAannAtuMzqj9Yg4
 jaSYvQMIpp/XBU0cKR1bYR/FBvXS2VToKgvhHroEINBTlnnTstlRTGmHrjFx50m12Gn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RCSBGNDLpAJPH5lka1KlWycj1BLhtlhzaY1xa6mzvlw=; b=QJqWlN5/xYnssorDq/queLHChD
 WmjDoGYv9L93CvVLe8f4f06Pwgow/pRaf/yb1g7t9izP8e1OZgg8tF4/oEvCq/g/VpRXG6shbIc72
 o7sPKmqm1QTCd09Yzh/PVGRpRFMLDHBVKYDSt2zHNCddhwCyFIlQ6Gia51EIdznVuKYQ=;
Received: from r3-22.sinamail.sina.com.cn ([202.108.3.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4e3q-0003aU-AH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 12:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1774267630; bh=RCSBGNDLpAJPH5lka1KlWycj1BLhtlhzaY1xa6mzvlw=;
 h=From:Subject:Date:Message-ID;
 b=Erk08ZyJ1leRrDMfyRLx+CdL6CLKTeQwrAl/Dmffpu044bGY4QSdG+sYrkJQoEir4
 tBWbOn1uOKmJNFir5Osezb+qyDy7yuvpeHe/oJ7F46y/Kx9LXyXcSAQj7ADkOKaXPl
 zwrZzQArB2kyIItXp9HqibzvGGuu71YcEzsc6dpg=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69C12CD500000ABC; Mon, 23 Mar 2026 20:06:57 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9146466685057
X-SMAIL-UIID: ACE268A300464CCBA80681413B4158BA-20260323-200657-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 23 Mar 2026 20:06:24 +0800
Message-ID: <20260323120622.3351920-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323120622.3351920-2-monty_pavel@sina.com>
References: <20260323120622.3351920-2-monty_pavel@sina.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.22 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w4e3q-0003aU-AH
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: fix fiemap boundary handling when
 read extent cache is incomplete
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@kernel.org,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@kernel.org,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,kernel.org,sina.com,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,sina.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 897AB2F1A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+CgpmMmZzX2ZpZW1h
cCgpIGNhbGxzIGYyZnNfbWFwX2Jsb2NrcygpIHRvIG9idGFpbiB0aGUgYmxvY2sgbWFwcGluZyBh
CmZpbGUsIGFuZCB0aGVuIG1lcmdlcyBjb250aWd1b3VzIG1hcHBpbmdzIGludG8gZXh0ZW50cy4g
SWYgdGhlIG1hcHBpbmcKaXMgZm91bmQgaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlLCBub2RlIGJs
b2NrcyBkbyBub3QgbmVlZCB0byBiZSByZWFkLgpIb3dldmVyLCBpbiB0aGUgZm9sbG93aW5nIHNj
ZW5hcmlvLCBhIGNvbnRpZ3VvdXMgZXh0ZW50IGNhbiBiZSBzcGxpdAppbnRvIHR3byBleHRlbnRz
OgoKJCBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS4xMjhNIGJzPTFNIGNvdW50PTEyOAokIGxvc2V0
dXAgLWYgZGF0YS4xMjhNCiQgbWtmcy5mMmZzIC9kZXYvbG9vcDAgLWYKJCBtb3VudCAtbyBtb2Rl
PWxmcyAvZGV2L2xvb3AwIC9tbnQvZjJmcy8KJCBjZCAvbW50L2YyZnMvCiQgZGQgaWY9L2Rldi96
ZXJvIG9mPWRhdGEuNzJNIGJzPTFNIGNvdW50PTcyICYmIHN5bmMKJCBkZCBpZj0vZGV2L3plcm8g
b2Y9ZGF0YS40TSBicz0xTSBjb3VudD00ICYmIHN5bmMKJCBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0
YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MiBjb252PW5vdHJ1bmMgJiYgc3luYwokIGVjaG8gMyA+
IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwokIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJz
PTFNIGNvdW50PTIgc2Vlaz0wIGNvbnY9bm90cnVuYyAmJiBzeW5jCiQgZGQgaWY9L2Rldi96ZXJv
IG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3RydW5jICYmIHN5bmMKJCBm
MmZzX2lvIGZpZW1hcCAwIDEwMjQgZGF0YS40TQpGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTAy
NApsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFn
cwowCTAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwNjQwMDAwMCAwMDAwMDAwMDAwMjAwMDAwIDAw
MDAxMDAwCjEJMDAwMDAwMDAwMDIwMDAwMCAwMDAwMDAwMDA2NjAwMDAwIDAwMDAwMDAwMDAyMDAw
MDAgMDAwMDEwMDEKCkFsdGhvdWdoIHRoZSBwaHlzaWNhbCBhZGRyZXNzZXMgb2YgdGhlIHJhbmdl
cyAw772eMk1CIGFuZCAyTe+9njRNQiBhcmUKY29udGlndW91cywgdGhlIG1hcHBpbmcgZm9yIHRo
ZSAyTe+9njRNQiByYW5nZSBpcyBub3QgcHJlc2VudCBpbiBtZW1vcnkuCldoZW4gdGhlIHBoeXNp
Y2FsIGFkZHJlc3NlcyBmb3IgdGhlIDDvvZ4yTUIgcmFuZ2UgYXJlIHVwZGF0ZWQsIG5vIG1lcmdl
CmhhcHBlbnMgYmVjYXVzZSB0aGUgYWRqYWNlbnQgbWFwcGluZyBpcyBtaXNzaW5nIGZyb20gdGhl
IGluLW1lbW9yeQpjYWNoZS4gQXMgYSByZXN1bHQsIGZpZW1hcCByZXBvcnRzIHR3byBzZXBhcmF0
ZSBleHRlbnRzIGluc3RlYWQgb2YgYQpzaW5nbGUgY29udGlndW91cyBvbmUuCgpUaGUgcm9vdCBj
YXVzZSBpcyB0aGF0IHRoZSByZWFkIGV4dGVudCBjYWNoZSBkb2VzIG5vdCBndWFyYW50ZWUgdGhh
dCBhbGwKYmxvY2tzIG9mIGFuIGV4dGVudCBhcmUgcHJlc2VudCBpbiBtZW1vcnkuIFRoZXJlZm9y
ZSwgd2hlbiB0aGUgZXh0ZW50Cmxlbmd0aCByZXR1cm5lZCBieSBmMmZzX21hcF9ibG9ja3NfY2Fj
aGVkKCkgaXMgc21hbGxlciB0aGFuIG1heGJsb2NrcywKdGhlIHJlbWFpbmluZyBtYXBwaW5ncyBh
cmUgcmV0cmlldmVkIHZpYSBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCkgdG8KZW5zdXJlIGNvcnJl
Y3QgZmllbWFwIGV4dGVudCBib3VuZGFyeSBoYW5kbGluZy4KCkNjOiBzdGFibGVAa2VybmVsLm9y
ZwpGaXhlczogY2Q4ZmM1MjI2YmVmICgiZjJmczogcmVtb3ZlIHRoZSBjcmVhdGUgYXJndW1lbnQg
dG8gZjJmc19tYXBfYmxvY2tzIikKU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Ci0tLQp2NDoKLSBSZXBsYWNlIHRoZSBvcmlnaW5hbCByZXByb2R1
Y2VyIHNjcmlwdHMuCnYzOgotIENjIHRvIHN0YWJsZSBrZXJuZWwuCnYyOgotIEZpeCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgY2F1c2VkIGJ5IG1hcC0+bV9tdWx0aWRldl9kaW8uCi0gUmVkdWNl
IGNhbGxzIHRvIGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEoKS4KLS0tCiBmcy9mMmZzL2RhdGEuYyB8
IDI1ICsrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMv
ZjJmcy9kYXRhLmMKaW5kZXggOWU0ZGI2ZjA1MDhhLi5hMjEwYTdhNjI3YzYgMTAwNjQ0Ci0tLSBh
L2ZzL2YyZnMvZGF0YS5jCisrKyBiL2ZzL2YyZnMvZGF0YS5jCkBAIC0xNjM3LDggKzE2MzcsMjYg
QEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19t
YXBfYmxvY2tzICptYXAsIGludCBmbGFnKQogCWxmc19kaW9fd3JpdGUgPSAoZmxhZyA9PSBGMkZT
X0dFVF9CTE9DS19ESU8gJiYgZjJmc19sZnNfbW9kZShzYmkpICYmCiAJCQkJbWFwLT5tX21heV9j
cmVhdGUpOwogCi0JaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBmMmZzX21hcF9ibG9ja3NfY2Fj
aGVkKGlub2RlLCBtYXAsIGZsYWcpKQotCQlnb3RvIG91dDsKKwlpZiAoIW1hcC0+bV9tYXlfY3Jl
YXRlICYmIGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpIHsKKwkJc3Ry
dWN0IGV4dGVudF9pbmZvIGVpOworCisJCS8qCisJCSAqIDEuIElmIG1hcC0+bV9tdWx0aWRldl9k
aW8gaXMgdHJ1ZSwgbWFwLT5tX3BibGsgY2Fubm90IGJlCisJCSAqIHdhaXR0ZWQgYnkgZjJmc193
YWl0X29uX2Jsb2NrX3dyaXRlYmFja19yYW5nZSgpIGFuZCBhcmUgbm90CisJCSAqIG1lcmdlYWJs
ZS4KKwkJICogMi4gSWYgcGdvZnMgaGl0cyB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIGl0IG1lYW5z
IHRoZSBtYXBwaW5nCisJCSAqIGlzIGFscmVhZHkgY2FjaGVkIGluIHRoZSBleHRlbnQgY2FjaGUs
IGJ1dCBpdCBpcyBub3QKKwkJICogbWVyZ2VhYmxlLCBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBx
dWVyeSB0aGUgbWFwcGluZyBhZ2FpbgorCQkgKiB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgp
LgorCQkgKi8KKwkJcGdvZnMgPQkocGdvZmZfdCltYXAtPm1fbGJsayArIG1hcC0+bV9sZW47CisJ
CWlmIChtYXAtPm1fbGVuID09IG1heGJsb2NrcyB8fAorCQkJbWFwLT5tX211bHRpZGV2X2RpbyB8
fAorCQkJZjJmc19sb29rdXBfcmVhZF9leHRlbnRfY2FjaGUoaW5vZGUsIHBnb2ZzLCAmZWkpKQor
CQkJZ290byBvdXQ7CisJCW9mcyA9IG1hcC0+bV9sZW47CisJCWdvdG8gbWFwX21vcmU7CisJfQog
CiAJbWFwLT5tX2JkZXYgPSBpbm9kZS0+aV9zYi0+c19iZGV2OwogCW1hcC0+bV9tdWx0aWRldl9k
aW8gPQpAQCAtMTY0OSw3ICsxNjY3LDggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQogCiAJLyog
aXQgb25seSBzdXBwb3J0cyBibG9jayBzaXplID09IHBhZ2Ugc2l6ZSAqLwogCXBnb2ZzID0JKHBn
b2ZmX3QpbWFwLT5tX2xibGs7Ci0JZW5kID0gcGdvZnMgKyBtYXhibG9ja3M7CittYXBfbW9yZToK
KwllbmQgPSAocGdvZmZfdCltYXAtPm1fbGJsayArIG1heGJsb2NrczsKIAogCWlmIChmbGFnID09
IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKQogCQltb2RlID0gTE9PS1VQX05PREVfUkE7Ci0tIAoy
LjQzLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
