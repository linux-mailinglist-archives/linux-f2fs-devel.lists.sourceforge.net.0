Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vyqqDe3DMGrGXAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:33:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A01F68BB4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DzoiohM0;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=duW50p6D;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=i0XQrjLV;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=KGQ+udW6;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cogt2vzu2WnEDMz3EIu2Jy6/FLwC0k1Wfkztxni4V80=; b=DzoiohM0PXmy1Sn5puwGXQuoKe
	Xgr9yiVuIYo6mifj7eSouzyahq7XesTmrO2M54IGvRoxq0FKVWZ2tl/qYbQa7rx5z15ZjSMBzxXJ/
	3sOV8biD1TgFNDWsQd0WVX8gviVzU6RTAFDRicEFYmNgLfzR6DdjgNClsIya/2lpzgbc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKXp-00059x-ID;
	Tue, 16 Jun 2026 03:32:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZKXn-00059q-RM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WTNJk3hxs3TZlE6qWl4rhpBPLCUHQXogLB1/j7bekl8=; b=duW50p6DSxvmKXJxBaD7b6o5rC
 KM1lEqbS7DZz6g3k/kdeMZUySsZnkoBofT0OjtM11mhIOdv6PIoIEWwGh4mexlTIzL8/57L+Qvs3M
 j5IvKbDeals2melpTeKTRO14gETnI/aQNOpoEqkvfzHIk+gV13Z4Wd+i73Tlsmk5yf0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WTNJk3hxs3TZlE6qWl4rhpBPLCUHQXogLB1/j7bekl8=; b=i0XQrjLVXzsJv9LrWAz9BK3cQK
 nlE16oejJTdV8gL+jUlvULROcC876CdkTvdV0u0ntz+HjvQRRcQcC0SPzeFQwMf2qGUOY2AbJ2Il3
 7X3hYg+OTNiU6Q1aJBZj3+SUENJiKnN4qVVnsofIvJKr3cBooXpvhbavUgpSrhgyZOL4=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZKXm-0005VV-Mm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:32:56 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5aa68cd8dd3so3690039e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 20:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781580768; cv=none;
 d=google.com; s=arc-20240605;
 b=S3SH43dohm3U86XvNqwh0kUyhpfa7SIkwYpIIobLeNPuEkQjsglAoYJo1qqKGqgdWh
 UQPEwCLxpuwLSRt0khCfdo7DOeJcQqtVDrBESWAmilTE2/P3ic5R7TV//yAQmgw0Rfx/
 A9JXLyV9syk2qrnIr+WBPQQU3NnE/JprTggshZfmFMrRUVmYkH/FFY/6KISmpNpIxxcJ
 LkMqALE2+k+/P2MnlDOpougr38hZ4w6X/47RaOdg0r2wN7wu3ExxjeJRFeAbmDQEqQsD
 lr7ivu/GWEspiI9hj/wnbkoimeUMVAAiXsNt+jIp+ZA3I+eZympzvZ8hZiW8RYL89h12
 4r2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WTNJk3hxs3TZlE6qWl4rhpBPLCUHQXogLB1/j7bekl8=;
 fh=jIuB0yksABARw67QTqUie4R+wH8uywmqjelnMUg7Zzc=;
 b=assi6Fs9gNEHcsX/+aruAhy4/3zbn7xadv482yroYTJRsJyElVOYXwQWiUUaSWXYQL
 3nnr3d7c8UabKg+bfADQl9lX7aM7snVhnvAkhMGAyutf+hdJBo/oGzVgnGsDPNyXGFiu
 6dE3hVhQcrwNqfYDTlcT6q1ptJ54fX9NogC2zPVOpqoSW++deHTztRjc8UqJ8FIgww9Z
 Ay8VPAekY8RJUtzo8HonDc5V68DFM324iYmwdFuya8dXakMXj8c474zlUBO0DfN0SlLP
 BWqGsFSPjvUKxmTgoGIn6TYlMiDwFPZgnNjblhCLT2HtI8c13EzwRmoFWOodKj71z6Cz
 YQQw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781580768; x=1782185568; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTNJk3hxs3TZlE6qWl4rhpBPLCUHQXogLB1/j7bekl8=;
 b=KGQ+udW69DsTOkDvTdgnXg+j1Jf/pFv0Y4ZJuJyjjxNMskqVZojBqHK1OlM38YinJk
 o+bJfgLisovktvKUZ4ygIQ0jsqlDSW8N8f6ZSCyys+e51EuW0/IfMl+m6otsC0uQN3iD
 JGFYesIbmLg6nS7SDT31JfXyBlOFLj9/gQiKNKvP9C7W0l0uw4f7CUzb+eK+WAqq8kvP
 s1/TTUVgR7ouKhs4dffHuYSUTT5Wz13IOM4Ch3ZN1/eZOrZAS0zUSHQAxkVD8NJ/o6+R
 aOEVYAgYeS/OvEtZucP8YYiX0vlK5WfVRAyOkcAFHUzXa+mZI1jfmuvVPsEVZhm3mfU2
 SXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781580768; x=1782185568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WTNJk3hxs3TZlE6qWl4rhpBPLCUHQXogLB1/j7bekl8=;
 b=WL3nIfnmggC+vhOJXgwqN2gpbR9D970F4Asg1M6OS2RWZIHLBMJa1fRjBKcbiJcpzT
 GuyA5SE/xdgGJh/qBLk6OkEDejqZuoiNA6lNmgA/z97oehLd0//LBpKTkmvzXdjwu9Rd
 AVDObG9iOGMQBgA4nB6boF3XMIUTTISHtB6tEqOoS2pvGse4q9F+QVlSmVL2h1sWDrUz
 Ro1SccS0QKXGAOjLwSKQ2PiDNdb9+yIyQeJaW1u4QkmokofwCLZLQmasbkeaIzs2ogOQ
 +soBfA2s6n0MSkcU2pwi3HDw05E32WdCus5M+VKBznAXcEOFFEOgYAW1c4K5ABqvJbZJ
 8MXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8MaQRmC3Zmz3Ox3nQoH8OwBXOG6XZ2EyCgqf/sM8Rve2djAdf6tnIE2Xq1fWLx20FewXBFxLs81eR/N7QYViaS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwOHu+i8pfp2Km2RSr/e/8DBNZrObFBq1foGxzS4s9axO1D4fRj
 j6tCKNfH65yzhJk3DuyDJyTFYIJw5DzIRKfbswjWc0rJyaVUSM7ADyj+D+xvk2zGyyYD007a8uf
 AQn91m9vmffEs0AHP50BUKojDyltZLts=
X-Gm-Gg: Acq92OHMV8nTyETBKWu2IAUReTUd+1oIcCMGfuDEOEkQFRMuR+DcIRjYvYr4/Sbj9YO
 WjCl5Kl/XwyDexYxK9941m6EOj0aRYms1KkvAHa5ITNhnAjFDHaZME+xnyXiZBrgYEV8pmk5cZ/
 PHeijhymvgtAg01p69zRwYbvqQjhlOhVu7NanKs92cDEgaTJj/v+cdboNaFJAbkPA5r2iZWscj8
 ImJt+W+CLDZutL0E3kSv6kk7G71I9m+9PcXOS31Ve7GrdIqQTVqjqE15PzGVVtWjQ5E182rsoLJ
 Wxi6LNxD
X-Received: by 2002:a05:6512:368d:b0:5ad:3035:c2bd with SMTP id
 2adb3069b0e04-5ad43756419mr355985e87.50.1781580768335; Mon, 15 Jun 2026
 20:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260616014742.67236-1-qiwenjie@xiaomi.com>
 <8810431d-8364-44d6-bac5-d879e67529b2@kernel.org>
In-Reply-To: <8810431d-8364-44d6-bac5-d879e67529b2@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 11:32:37 +0800
X-Gm-Features: AVVi8Cdc2pS7HV5enxKc5BU7prOWa0uFr1v0LXd1_yMs1iLqk4Zwp0hzedK894k
Message-ID: <CAGFpFsTgC3ioA5OYd79oh1NPrafySQG-m4zpRnVy44fqD6+5dw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I added the Fixes and Cc stable tags in v4. The code is
 unchanged from v3. Thanks 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
X-Headers-End: 1wZKXm-0005VV-Mm
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: use post-decrement count for
 cp_wait wakeup
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
Cc: jaegeuk@kernel.org, qiwenjie@xiaomi.com, geoo115@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:geoo115@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xiaomi.com,gmail.com,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A01F68BB4A

SSBhZGRlZCB0aGUgRml4ZXMgYW5kIENjIHN0YWJsZSB0YWdzIGluIHY0LiBUaGUgY29kZSBpcyB1
bmNoYW5nZWQgZnJvbSB2My4KClRoYW5rcwoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZjJmcy1kZXZlbC8yMDI2MDYxNjAzMzE0Ni4xMjcwMDAtMS1xaXdlbmppZUB4aWFvbWkuY29tL1Qv
I3UKCk9uIFR1ZSwgSnVuIDE2LCAyMDI2IGF0IDExOjEz4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIDYvMTYvMjYgMDk6NDcsIFdlbmppZSBRaSB3cm90ZToKPiA+
IGYyZnNfd3JpdGVfZW5kX2lvKCkgZGVjcmVtZW50cyB0aGUgd3JpdGViYWNrIHBhZ2UgY291bnRl
ciBhbmQgdGhlbgo+ID4gcmVhZHMgaXQgYWdhaW4gd2l0aCBnZXRfcGFnZXMoKSB0byBkZWNpZGUg
d2hldGhlciB0aGUgbGFzdAo+ID4gRjJGU19XQl9DUF9EQVRBIGNvbXBsZXRpb24gc2hvdWxkIHdh
a2UgY3Bfd2FpdC4KPiA+Cj4gPiBVc2UgYXRvbWljX2RlY19yZXR1cm4oKSBmb3IgRjJGU19XQl9D
UF9EQVRBIGNvbXBsZXRpb25zIHNvIHRoZSB3YWtldXAKPiA+IGRlY2lzaW9uIGlzIG1hZGUgZnJv
bSB0aGUgdmFsdWUgcHJvZHVjZWQgYnkgdGhlIGRlY3JlbWVudCBpdHNlbGYuIEtlZXAKPiA+IHRo
ZSBleGlzdGluZyBkZWNfcGFnZV9jb3VudCgpIHBhdGggZm9yIG90aGVyIHdyaXRlYmFjayBjb3Vu
dGVycy4KPiA+Cj4KPiBNaXNzaW5nIEZpeGVzIGFuZCBDYyBsaW5lcz8gT3RoZXJ3aXNlIGl0IGxv
b2tzIGdvb2QgdG8gbWUuCj4KPiBUaGFua3MKPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFp
IDxxaXdlbmppZUB4aWFvbWkuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBE
cm9wIHRoZSB3YWl0cXVldWUgcHJvdG9jb2wgY2hhbmdlIGZyb20gdjIuCj4gPiAtIFVzZSBhdG9t
aWNfZGVjX3JldHVybigpIGRpcmVjdGx5IGZvciBGMkZTX1dCX0NQX0RBVEEgYW5kIHdha2UgY3Bf
d2FpdAo+ID4gICB3aGVuIHRoZSByZXR1cm5lZCBjb3VudCByZWFjaGVzIHplcm8uCj4gPgo+ID4g
IGZzL2YyZnMvZGF0YS5jIHwgMTIgKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggZDgzYTIxOTk4ZWMyLi41OGQyM2Vi
NzRlYzIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9k
YXRhLmMKPiA+IEBAIC0zOTIsMTUgKzM5MiwxNyBAQCBzdGF0aWMgdm9pZCBmMmZzX3dyaXRlX2Vu
ZF9pbyhzdHJ1Y3QgYmlvICpiaW8pCj4gPiAgICAgICAgICAgICAgIGlmIChmMmZzX2luX3dhcm1f
bm9kZV9saXN0KGZvbGlvKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2RlbF9mc3lu
Y19ub2RlX2VudHJ5KHNiaSwgZm9saW8pOwo+ID4KPiA+IC0gICAgICAgICAgICAgZGVjX3BhZ2Vf
Y291bnQoc2JpLCB0eXBlKTsKPiA+IC0KPiA+ICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAg
ICAgICAgICogd2Ugc2hvdWxkIGFjY2VzcyBzYmkgYmVmb3JlIGZvbGlvX2VuZF93cml0ZWJhY2so
KSB0bwo+ID4gICAgICAgICAgICAgICAgKiBhdm9pZCByYWNpbmcgdy8ga2lsbF9mMmZzX3N1cGVy
KCkKPiA+ICAgICAgICAgICAgICAgICovCj4gPiAtICAgICAgICAgICAgIGlmICh0eXBlID09IEYy
RlNfV0JfQ1BfREFUQSAmJiAhZ2V0X3BhZ2VzKHNiaSwgdHlwZSkgJiYKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHdxX2hhc19zbGVlcGVyKCZzYmktPmNwX3dhaXQpKQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIHdha2VfdXAoJnNiaS0+Y3Bfd2FpdCk7Cj4gPiArICAgICAgICAg
ICAgIGlmICh0eXBlID09IEYyRlNfV0JfQ1BfREFUQSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGlmICghYXRvbWljX2RlY19yZXR1cm4oJnNiaS0+bnJfcGFnZXNbdHlwZV0pICYmCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIHdxX2hhc19zbGVlcGVyKCZzYmktPmNwX3dhaXQpKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2FrZV91cCgmc2JpLT5jcF93YWl0KTsK
PiA+ICsgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZWNf
cGFnZV9jb3VudChzYmksIHR5cGUpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPgo+ID4gICAgICAg
ICAgICAgICBmb2xpb19jbGVhcl9mMmZzX2djaW5nKGZvbGlvKTsKPiA+ICAgICAgICAgICAgICAg
Zm9saW9fZW5kX3dyaXRlYmFjayhmb2xpbyk7Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
