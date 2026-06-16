Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cxRrJ+hYMWrUhQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 16:08:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E58466903D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 16:08:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=l45anFA8;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=EjZjkZ7Q;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QJJaPqBu;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=L1VO3KTS;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L9tjbT30R1+HGuBErPSN7AWgfe5U8FhjTZlI4ERb/Q=; b=l45anFA8JMXn4dk2Q0Ek1rFZqo
	VvgFiOYOVBPXLA93uDDKQSTZhPIghUbKQ1YkpdFMoG4DvV7x7F7/bKwkl0yqJomGu/gctNbmlsPIm
	VFliDfoR4jbU/nrbDr4YT5n1p9Ygdsc+Tpwi3TjyEzfARFDBVih7OjmzpWgBnSlNQ9yU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZUSr-0000gK-Re;
	Tue, 16 Jun 2026 14:08:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZUSq-0000gC-AG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 14:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdIep9P/0cMDZlvaAZGjNOLxN6aqwz4mIiicGIFwB9Y=; b=EjZjkZ7QEKMeKH57nMmURVzAdO
 /N5ziMFDk7IjWghAQBnf6uMIw3wRcpV0KSNyG1gpmiggGLGZDzqjAQNb4sfbjtfODUVNehZpA4z1e
 QGkvVRC9oQ5HDRwmIN+PuMxKEQWbpQeKjuDpT3hdAa9uQ6vk36uNyFeJ9HQp53+DuS4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RdIep9P/0cMDZlvaAZGjNOLxN6aqwz4mIiicGIFwB9Y=; b=QJJaPqBuB71aeTU/u9ouPF8t7u
 bKpZBJ1PEIHlex2g0bWgcNGT/Fe+l9ulZ4+uTpOx2YJ9D2KAKwVizemWh0gSqVBpKXLcVwWJBPH0e
 PmdMnqIu5lIaD1s9xlcBK8KJjNLDZQ8hUdx6Q1M8vVNDjtrtPGU3yfZa+WNibSFhVm2k=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZUSm-0003R9-55 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 14:08:28 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39697a4e16cso42605021fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 07:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781618898; cv=none;
 d=google.com; s=arc-20240605;
 b=SZo2kY6CnmDwi0BhYo1TLIXddpixS3e5QzX0hMow2nEkX7opOBs1eqGjzAW13ppBIk
 qvo2UEPnwIq/4HWTnzbJGLev6YR6d7Qa99iwwXAqxYByaLsn7g40hznUxNTE0axp3opF
 iM9gfGt4DP2Pp7ZHAmPabFM3axhYdYb805CYDtg/ucaxGokC3hsOgnIx9GTW+YOJ5RDj
 qdWN44W1eKzPahX6eChE73hmNuFshldNCbcm0EABWNiGmgvwo3e+Juuij3qSrWrEYXck
 /j8iYk+mNSFK7Y5pjh326A3GXzu84HtOYzJ4Y8a1yJGUtEbAhhg2qq0P1Tzt2UCyXafu
 hFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RdIep9P/0cMDZlvaAZGjNOLxN6aqwz4mIiicGIFwB9Y=;
 fh=IZSrT4WzzebYUxzIdRjKfI8+uaxr1uxd3DE3rTIuKq8=;
 b=ks2K6jl4XwsZMEZxjJ7kp9eCf7IU+1yjyKj3B7eOrgp/G7o/hWeliIUj3iY5UT1W6y
 p4O0CKKflfDSqugWtpRKQEv/T5p7iBDkZRdYCx6XuWwAga3+fi4JSRvcvNdWcpS6RyBJ
 GsMuwOtsOZNHpbH2rIkAo9Qqz2SX/UFvJXj8ecxa2xpJlZK02ZLWr01CjnEtttGLzEAp
 l5rDE6hHQO8AzQ6PW2ykTdsTtANpXV+K+kPZREOGI/J1TIfVJTX78cha9eMC+GfYyePv
 9/QzrVN20tasksYGQNC47oSNuIFB1Mb9GnbaJZJaSwGQ+LDq+HRGoTaWcVstjLUuIiJX
 ZDlQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781618898; x=1782223698; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdIep9P/0cMDZlvaAZGjNOLxN6aqwz4mIiicGIFwB9Y=;
 b=L1VO3KTSH1D/uUO7P1MplvqFE/Vc9L6UdLspGqR1cykh/3Y3OZVJ3QWeSODocpII0F
 qLhRhCm8XiuggFPJq4holZBzSNnYwI67KvNeS88VrU8CGdzuvizFfIn+jpVmUmBH11ly
 VwIh0wUKG6G9sd+9rXl/DnRpKti10orkRsTEwp4fHwxRXXYfWSLH5TaBUOZ3/EQjzA8A
 4m2GX22ievX+FLyTxxF4hiEnjshRf4YI+wYRoDIthC0KKmik+so7plZmuCXm4/hO7tIU
 1ioja4bWbqQ9f4cB6h/1gY3QPkpdHUpUgEs67ysxDc/hn6IW8NGTRl62Zp9nkpzSU26K
 cKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781618898; x=1782223698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RdIep9P/0cMDZlvaAZGjNOLxN6aqwz4mIiicGIFwB9Y=;
 b=O92kR0CZkrz1SwHGZIumBgYCerUi7RNw6YTDgWHYHIIcqW1qJc4KQ7GJbX/VqXaYBn
 GX4oGF+IcupIzBrv+KpXoNTahxAXFJ9Bpjik7SrAnMcIOnsgIsSk3KX7vsAy8J6Yejq9
 AQ6diYtRNSovyvNWyWtKrE+rDCV+O1dLtE2Xa6u4myxlSWD5+SFJLP8kWag1meVzKEek
 6QYmZEADGB0IFF78BovtqvvHZzYQMEQn3hec4nRdk8tZHzdD1pgYB5pA9D3SA79f51p3
 enrlradr42hCvNAX22bgMCQ9wIFKe883qi2Pa2UDjxUZAVS8yK3paxqM8GJT1sssTel0
 SC/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ95peK6DFD8kLiF9gJFQMuzEqAsgsd7L/AC3oArTulHyJv3+J6+6W9HJYQjl1nQqos+6k77pCN/dr6rV9W748PK@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzYT9i/eANcj3aJhAzj189Kz6WP3ioLQT0idLJoUAXXENN/+YTF
 GQfh10BvwR+dE9mfRxSt3gkfOfVsJhAuG7apPUBUxGN2G8Ksl+dN1yvFzJ/zDg/99cfr6mEjShH
 ZiZGt4iH2UfGN04IWABOMloDk1jpHLbA=
X-Gm-Gg: Acq92OEFk9ZMT2zaQJvSkFvdlfQueBx8/8qZ4VcNnKa5gFhKeAQ4Ko3IBAhYqHigvbN
 rLczKabvnshS9C9jmrBcU4VsL/lrWeXMW8sfjBoxIbmxVuegiXsjoeASmu1Hu5UH0iSB2vpHIo1
 ggWqstFEPsv5C45wuUOtiA4NC6mIGuJe5Gh2xOQzKGDOwOLJULea0UcN+cJf6FNF9DnjDZVurih
 C1cHOopVOku1P+VmITVVTYeImAgqrXSXEoZ3c3XHDUwNKn1m3aNWz5BKib3SAFVHp+K/XrFYfeX
 v7+0Ed/L
X-Received: by 2002:ac2:52ab:0:b0:5aa:63ad:77f7 with SMTP id
 2adb3069b0e04-5ad427a8f40mr935731e87.25.1781618897753; Tue, 16 Jun 2026
 07:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260616033146.127000-1-qiwenjie@xiaomi.com>
 <bd3d9950-80b9-4099-a088-d2d07fb3092c@kernel.org>
In-Reply-To: <bd3d9950-80b9-4099-a088-d2d07fb3092c@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 22:08:06 +0800
X-Gm-Features: AVVi8CeTrBPJ5GX0Wqz54GtleJSJIr-WRuVD3gKEmRfbXlAFVniYS90J20nqPw4
Message-ID: <CAGFpFsS_BVVMKgmTVD_Kuihr=VuF3ODrCOmeCe=ZXs5mwrDi8A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, I added the missing Fixes tag in v5. The code is
 unchanged from v4. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
X-Headers-End: 1wZUSm-0003R9-55
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: use post-decrement count for
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
Cc: geoo115@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:geoo115@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,xiaomi.com,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,xiaomi.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E58466903D4

ICAgSGkgQ2hhbywKCiAgSSBhZGRlZCB0aGUgbWlzc2luZyBGaXhlcyB0YWcgaW4gdjUuIFRoZSBj
b2RlIGlzIHVuY2hhbmdlZCBmcm9tIHY0LgoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1mMmZzLWRldmVsLzIwMjYwNjE2MTM1NjM3LjE0MzkzMTktMS1xaXdlbmppZUB4aWFvbWkuY29t
L1QvI3UKCiAgUmVnYXJkcywKICBXZW5qaWUKCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCAxMToz
N+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiA2LzE2LzI2IDEx
OjMxLCBXZW5qaWUgUWkgd3JvdGU6Cj4gPiBmMmZzX3dyaXRlX2VuZF9pbygpIGRlY3JlbWVudHMg
dGhlIHdyaXRlYmFjayBwYWdlIGNvdW50ZXIgYW5kIHRoZW4KPiA+IHJlYWRzIGl0IGFnYWluIHdp
dGggZ2V0X3BhZ2VzKCkgdG8gZGVjaWRlIHdoZXRoZXIgdGhlIGxhc3QKPiA+IEYyRlNfV0JfQ1Bf
REFUQSBjb21wbGV0aW9uIHNob3VsZCB3YWtlIGNwX3dhaXQuCj4gPgo+ID4gVXNlIGF0b21pY19k
ZWNfcmV0dXJuKCkgZm9yIEYyRlNfV0JfQ1BfREFUQSBjb21wbGV0aW9ucyBzbyB0aGUgd2FrZXVw
Cj4gPiBkZWNpc2lvbiBpcyBtYWRlIGZyb20gdGhlIHZhbHVlIHByb2R1Y2VkIGJ5IHRoZSBkZWNy
ZW1lbnQgaXRzZWxmLiBLZWVwCj4gPiB0aGUgZXhpc3RpbmcgZGVjX3BhZ2VfY291bnQoKSBwYXRo
IGZvciBvdGhlciB3cml0ZWJhY2sgY291bnRlcnMuCj4gPgo+ID4gRml4ZXM6IGNlMjczOWU0ODJi
YyAoImYyZnM6IGZpeCB0byBhdm9pZCBVQUYgaW4gZjJmc193cml0ZV9lbmRfaW8oKSIpCj4KPiBG
aXhlczogZTIzNDA4ODc1OGZjICgiZjJmczogYXZvaWQgd2FpdCBpZiBJTyBlbmQgdXAgd2hlbiBk
b19jaGVja3BvaW50IGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UiKQo+IEZpeGVzOiBjZTI3MzllNDgy
YmMgKCJmMmZzOiBmaXggdG8gYXZvaWQgVUFGIGluIGYyZnNfd3JpdGVfZW5kX2lvKCkiKQo+Cj4g
VGhhbmtzLAo+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1i
eTogV2VuamllIFFpIDxxaXdlbmppZUB4aWFvbWkuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGlu
IHY0Ogo+ID4gLSBBZGQgRml4ZXMgYW5kIENjIHN0YWJsZSB0YWdzLgo+ID4KPiA+ICBmcy9mMmZz
L2RhdGEuYyB8IDEyICsrKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IGQ4M2EyMTk5OGVjMi4uNThkMjNlYjc0ZWMyIDEw
MDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4g
PiBAQCAtMzkyLDE1ICszOTIsMTcgQEAgc3RhdGljIHZvaWQgZjJmc193cml0ZV9lbmRfaW8oc3Ry
dWN0IGJpbyAqYmlvKQo+ID4gICAgICAgICAgICAgICBpZiAoZjJmc19pbl93YXJtX25vZGVfbGlz
dChmb2xpbykpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19kZWxfZnN5bmNfbm9kZV9l
bnRyeShzYmksIGZvbGlvKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIGRlY19wYWdlX2NvdW50KHNi
aSwgdHlwZSk7Cj4gPiAtCj4gPiAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICAq
IHdlIHNob3VsZCBhY2Nlc3Mgc2JpIGJlZm9yZSBmb2xpb19lbmRfd3JpdGViYWNrKCkgdG8KPiA+
ICAgICAgICAgICAgICAgICogYXZvaWQgcmFjaW5nIHcvIGtpbGxfZjJmc19zdXBlcigpCj4gPiAg
ICAgICAgICAgICAgICAqLwo+ID4gLSAgICAgICAgICAgICBpZiAodHlwZSA9PSBGMkZTX1dCX0NQ
X0RBVEEgJiYgIWdldF9wYWdlcyhzYmksIHR5cGUpICYmCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB3cV9oYXNfc2xlZXBlcigmc2JpLT5jcF93YWl0KSkKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICB3YWtlX3VwKCZzYmktPmNwX3dhaXQpOwo+ID4gKyAgICAgICAgICAgICBpZiAo
dHlwZSA9PSBGMkZTX1dCX0NQX0RBVEEpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAo
IWF0b21pY19kZWNfcmV0dXJuKCZzYmktPm5yX3BhZ2VzW3R5cGVdKSAmJgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICB3cV9oYXNfc2xlZXBlcigmc2JpLT5jcF93YWl0KSkKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHdha2VfdXAoJnNiaS0+Y3Bfd2FpdCk7Cj4gPiArICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZGVjX3BhZ2VfY291
bnQoc2JpLCB0eXBlKTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAg
Zm9saW9fY2xlYXJfZjJmc19nY2luZyhmb2xpbyk7Cj4gPiAgICAgICAgICAgICAgIGZvbGlvX2Vu
ZF93cml0ZWJhY2soZm9saW8pOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
