Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6aWoLTK1u2ksmwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 09:34:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 143602C7F06
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 09:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIws79fRN9WpzmxZKZcoPSkprTOAQk6JKjIvmz3bDr4=; b=f9g8BtTWvzMuTQY2dYC0HrosBF
	hfT8bxzG07fkKWtR0cRPGsydC645xRP6qg4fnbY/i1Nnr7M0AVSI8uuWTS3jot8xEDKSsONECXUQ5
	9g1UtCv7+poTgns5j+QNvof70+atA0GQ9SHJIx0Ae7iC0KeyE1DsAS0kc/T5VVYKxyas=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w38qF-00006J-PE;
	Thu, 19 Mar 2026 08:34:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w38qD-00005X-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 08:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCmUNSTymLL+YNxy6xmIdfANBQEHxQ2Bu9ZAE4rY5OM=; b=KTm7Kc9fHA5DgmsFVMq00QYqUj
 ZUeE0CMkUUvclisHargpixbuJ5a9xx19UwYrzUvKwLwg2NDQ7EG+5GoUdIo69q5+KXnKMyuMG/Gur
 zzrhFqSSWRJBBn6VzwKlMQpCo6S9NwVwCTVl60hDsJbyvd4bk84wlQq0Q687kgxezT1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCmUNSTymLL+YNxy6xmIdfANBQEHxQ2Bu9ZAE4rY5OM=; b=O0CjT8bE10abi03tZtc6mjnrDV
 UX8roDA12VjaYstRs88RZ7wJzXQwHItE/E8XN/HaoY5WhXosYLkcgTgh92L7iaY86CiLwE2lV7uXr
 VzvHempDcYHXtp+VTb5KpU0du877VynwZiNW/wvj6+caFSQtxFYcWqWVsCnwUfr+GBhs=;
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w38qC-0006B9-UR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 08:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773909293; bh=JCmUNSTymLL+YNxy6xmIdfANBQEHxQ2Bu9ZAE4rY5OM=;
 h=From:Subject:Date:Message-ID;
 b=rBb71cKwUIZEHsJZBvo2A41Kwlfe/GBBCOzpkiM90/eWvmBHGYh0o/jGXglyRciOH
 sInHExqbcPSr1btNxOyLGjuHVk3qn88glWte3ucjWWFdVIRvXMewsI+D68XqRJzbAq
 gsETO4NTKNb2hrxb++lTtMS1A6JCld0RvgZTVYSM=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69BBB5130000505E; Thu, 19 Mar 2026 16:34:39 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4910064456789
X-SMAIL-UIID: BA77502F9EBC4646993CE0EEA433D284-20260319-163439-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 19 Mar 2026 16:34:19 +0800
Message-ID: <20260319083417.603605-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319083417.603605-2-monty_pavel@sina.com>
References: <20260319083417.603605-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w38qC-0006B9-UR
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: fix fiemap boundary handling when
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vm:email,xiaomi.com:email]
X-Rspamd-Queue-Id: 143602C7F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Ci0tLQp2MjoKLSBGaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGNhdXNlZCBieSBtYXAtPm1f
bXVsdGlkZXZfZGlvLgotIFJlZHVjZSBjYWxscyB0byBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCku
Ci0tLQogZnMvZjJmcy9kYXRhLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCmluZGV4IDllNGRiNmYwNTA4YS4uYTIx
MGE3YTYyN2M2IDEwMDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEu
YwpAQCAtMTYzNyw4ICsxNjM3LDI2IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKIAlsZnNfZGlv
X3dyaXRlID0gKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2Jp
KSAmJgogCQkJCW1hcC0+bV9tYXlfY3JlYXRlKTsKIAotCWlmICghbWFwLT5tX21heV9jcmVhdGUg
JiYgZjJmc19tYXBfYmxvY2tzX2NhY2hlZChpbm9kZSwgbWFwLCBmbGFnKSkKLQkJZ290byBvdXQ7
CisJaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBmMmZzX21hcF9ibG9ja3NfY2FjaGVkKGlub2Rl
LCBtYXAsIGZsYWcpKSB7CisJCXN0cnVjdCBleHRlbnRfaW5mbyBlaTsKKworCQkvKgorCQkgKiAx
LiBJZiBtYXAtPm1fbXVsdGlkZXZfZGlvIGlzIHRydWUsIG1hcC0+bV9wYmxrIGNhbm5vdCBiZQor
CQkgKiB3YWl0dGVkIGJ5IGYyZnNfd2FpdF9vbl9ibG9ja193cml0ZWJhY2tfcmFuZ2UoKSBhbmQg
YXJlIG5vdAorCQkgKiBtZXJnZWFibGUuCisJCSAqIDIuIElmIHBnb2ZzIGhpdHMgdGhlIHJlYWQg
ZXh0ZW50IGNhY2hlLCBpdCBtZWFucyB0aGUgbWFwcGluZworCQkgKiBpcyBhbHJlYWR5IGNhY2hl
ZCBpbiB0aGUgZXh0ZW50IGNhY2hlLCBidXQgaXQgaXMgbm90CisJCSAqIG1lcmdlYWJsZSwgYW5k
IHRoZXJlIGlzIG5vIG5lZWQgdG8gcXVlcnkgdGhlIG1hcHBpbmcgYWdhaW4KKwkJICogdmlhIGYy
ZnNfZ2V0X2Rub2RlX29mX2RhdGEoKS4KKwkJICovCisJCXBnb2ZzID0JKHBnb2ZmX3QpbWFwLT5t
X2xibGsgKyBtYXAtPm1fbGVuOworCQlpZiAobWFwLT5tX2xlbiA9PSBtYXhibG9ja3MgfHwKKwkJ
CW1hcC0+bV9tdWx0aWRldl9kaW8gfHwKKwkJCWYyZnNfbG9va3VwX3JlYWRfZXh0ZW50X2NhY2hl
KGlub2RlLCBwZ29mcywgJmVpKSkKKwkJCWdvdG8gb3V0OworCQlvZnMgPSBtYXAtPm1fbGVuOwor
CQlnb3RvIG1hcF9tb3JlOworCX0KIAogCW1hcC0+bV9iZGV2ID0gaW5vZGUtPmlfc2ItPnNfYmRl
djsKIAltYXAtPm1fbXVsdGlkZXZfZGlvID0KQEAgLTE2NDksNyArMTY2Nyw4IEBAIGludCBmMmZz
X21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAq
bWFwLCBpbnQgZmxhZykKIAogCS8qIGl0IG9ubHkgc3VwcG9ydHMgYmxvY2sgc2l6ZSA9PSBwYWdl
IHNpemUgKi8KIAlwZ29mcyA9CShwZ29mZl90KW1hcC0+bV9sYmxrOwotCWVuZCA9IHBnb2ZzICsg
bWF4YmxvY2tzOworbWFwX21vcmU6CisJZW5kID0gKHBnb2ZmX3QpbWFwLT5tX2xibGsgKyBtYXhi
bG9ja3M7CiAKIAlpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSkKIAkJbW9kZSA9
IExPT0tVUF9OT0RFX1JBOwotLSAKMi40My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
