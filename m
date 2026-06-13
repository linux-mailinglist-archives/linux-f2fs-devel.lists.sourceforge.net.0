Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xzOHA5I4LWpeeAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jun 2026 13:01:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D45367E65F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jun 2026 13:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=EJaASi5l;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=aeJsQqgR;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NpCo8tQd;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=VPvbEk9a;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4OxGBVI5NFB8yRSX95LWErADH3Agv5LhNVztueOnUM=; b=EJaASi5lU3iUGKYLvxqELayaoi
	eJCzaO2LJJ6H+xtUkkquf71ppdKnSCaaIjU5jtiSP1eihpW5lHpKaMbZDQBNIJLuou+fvC+YPaD+0
	hXRMES5JXVPzG9hA3cYTQZHA+xwZusLSm8JrGrll6PynsP2iuPndTGiBLOTImEZSmeXA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYM74-00074K-2a;
	Sat, 13 Jun 2026 11:01:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wYM72-00074B-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jun 2026 11:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uP1Tb/Yp84qyLM+n0ReE5BEpLhpyaK/XP95cF56lWSA=; b=aeJsQqgRzMw4ECSILnzDUwYQ0c
 Q/E0Q0319raV0hdkn2ughFgPxQawAygIK8/8NVOrlPMC2I8h+tb3OOv3hhw3oOedO98nBFfqVmiE6
 JCxIGvoj5mQOX1werGHS2UpuNo/PJ+pLOdVj4kN/lJVxsZZquwG+tU+Hdn+ruaEL3PhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uP1Tb/Yp84qyLM+n0ReE5BEpLhpyaK/XP95cF56lWSA=; b=NpCo8tQd6l4IwWWuUmFfawbSFh
 KZlM5HEXKRksnaxavorSg/WQOU01esaBy0gZw1gXLsmGg/UCw1CUAwMPoUjOp2ouUZGXHG3CeTh8i
 KXC4IAnJ/mBfp6jSTXw+8AQqt7UjC8lc3V5K6EariDJDuOR65gCW4TOMrRtNgZbkoz0k=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wYM70-0006jz-Dz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jun 2026 11:01:16 +0000
Received: by mail-lf1-f68.google.com with SMTP id
 2adb3069b0e04-5aa7a7c9711so2033773e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jun 2026 04:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781348463; cv=none;
 d=google.com; s=arc-20240605;
 b=a0ql0uI9qNL22wbBBAhVRZaMTUlUqFYpUuIr81Tyqk8V8mXMtcvIT4eLXRmZydzTpE
 1KZMcqX9TqBqthF2mmeaoNG6e3UdSkxPqWr99yjVbOVGIa7wSZ3siIE6DmiZxDavCgXr
 A740pYSjN/quiBOgztOp5aRqtuo7haV6T/x5ula+d+Uw97HFXg6UShAmhr/yBijy7PMk
 QoM/mK6WO/ktKRmTk8IJJT8105qq5KWjhliGhBrCffssxSDebgxWDl8539fVT2W0FrZu
 KKtAXBiACTJ9g/I+BhWPwN0LxfUASHmdAYsl5B5n55ViavaA1juuLof2vlT9YAVy13Ev
 R95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uP1Tb/Yp84qyLM+n0ReE5BEpLhpyaK/XP95cF56lWSA=;
 fh=gBIcGip67gn6iNGC1yVkNOOybD5tVA13wU5v2BEUgvY=;
 b=GOCHk8G99ptZWbs6XfjyaGZvMum9RbIlnAJS/FZlGiIZW27FvUJHlTacHWRN2wfuvP
 UPeAIfHgurhHZ2JHbyeg0Lx8ct8sYcWov2WdrW+fH4yiHNsiV9pS7aarjNo/8EWMBavx
 vjCpzg8kRTe8kacI5Ctpky5bMiq7ee21G71a3fEc5hsxJ/a6vJ1LD0e0a4HghrzJyq7P
 Yv03/2cZlaTF5KfTwXbT0UsGS+oHw1e0z+kFd6OFbujExlG855YcUODPlY6vp0Kc9ImN
 pPHaTxw7oZo+EFO0IpCzOwOsgUdAWQeCAJjR4OGUMaDp8J2yDYFNZKISdq5bXzpO8p5f
 GSiQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781348463; x=1781953263; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP1Tb/Yp84qyLM+n0ReE5BEpLhpyaK/XP95cF56lWSA=;
 b=VPvbEk9aa8OYiu+MtEd3f16/UNwCXuW866A9ThDFAH7x/YLRdCO6jFoJjt34Mjbf5b
 9w1fpUHBmjCEekE3HTtR+pKJh2YAQ36l+InLm6kkrnietUb7AszsvgBO/dnS+/OfMNDT
 30/0q0b/NRrA3mlAkNKplv2k1r6VyjW+AOh0D0CyNNofHH+jZGo7XAV9FytZuFFgVnrR
 WGZ62/w90LJSMMtJd1x3kD05MzuW+byRo6fm+wlpp/3VI+f4c/bQ/FJx3Idf1u7MXKlk
 ll6TLqvkiiCYZEKOCH60165UGDSEQk8E8rXVApTr7sh/W0clhBrBV0wkqjHl2ZZinvii
 KBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781348463; x=1781953263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uP1Tb/Yp84qyLM+n0ReE5BEpLhpyaK/XP95cF56lWSA=;
 b=IEyhU4iCA4qkwYyURQ+AaKfYubdXgM5+qgPzM2W6NOLJjlznh1FZJMFmmmsJtvBk7h
 3w4JUQR9Sznak4CkjT5BWrT3ih07IuJlWtffDKrA/KgrbluS+hS33cCNUikpA+JYzWOt
 hUUiyOrlGbZAlwJBVrXj94n992fEq1IPvBdPUacnT/+Z8Qub7oLXw4IsDfDHOttdCNKA
 x7gtyMhH/KFPKvXAgKoExp1g3EJyX4iQWnaGq6JMb4OCJmVHf6Sj7iQ05LA8ULy2nqkk
 Ihc5y8GnOvLcRllKZu4/TQpL14SjXvyf95S30sO50jhr1xEgZTej98TaZvsbzUqgnvab
 WUpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+XOwZPJ0WP7JcIe0DqQlUk1cNDOJQBGqgaGfs3XyIy3A0GJnciuvUYXZnrifiIstUdFaR5HgQL/gUh4Ybmzcoa@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyg69EFh19YMlGC3SkyMVimcX/jiFdb5tHQThwIW60ZAXHd7RUw
 IhKD/J2S1rafb4UYW8cR0EmJMk/UocsLZQrBKmP++hrgojDzXna4CD1xblnKZVC2HVb8Z2nPdd4
 y2jlaLmkkeJ3vf2oLqSXC63/X1X9FVu8=
X-Gm-Gg: Acq92OEsBLgqFWa5r9ixAmH+axn+ACnB0XMvMQI+d8uYxdT/hM+KiSgFVmfnaBU+CqK
 PpuyhUMOa5f6y/dpl237jL4O4Tjdl/zAmkQCs/fKsQeIKImpR8Ch7ytDia29VOxsz6MwnK0NhD3
 i/sYU3rlYodPku6n3wjIXsUX6IKGiCG9TDzg48sVJGEKWqS0qZznYH7cGHGbadUF5vN3AiU5X/V
 wcblDCDfvEw2Qo3A2L2ntQ0P9wIRUcCLXcME4MxH8qjyfMS1Q5uKef8RpGVIkUjJp2h5vuviejy
 8KlfjGfR9w==
X-Received: by 2002:a05:6512:138c:b0:5aa:7572:a787 with SMTP id
 2adb3069b0e04-5ad2d6d8e0dmr1926290e87.22.1781348462736; Sat, 13 Jun 2026
 04:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260524143738.1966071-1-rollkingzzc@gmail.com>
 <09c023dd-d0a2-4de0-87d5-ceb551c2e3e0@kernel.org>
In-Reply-To: <09c023dd-d0a2-4de0-87d5-ceb551c2e3e0@kernel.org>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Sat, 13 Jun 2026 19:00:51 +0800
X-Gm-Features: AVVi8CeXzkqFHcGqGKE8p99d9E4c3JIgTBwYN85kj-1GhnNXOova-jzVxZF6nuk
Message-ID: <CAB7XQsFP-_hkNcq3knY-GgN0etnqcYNVVEOQcn4HH4MKOG+2-Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Thanks for the review. I agree with both points.
 I sent a v2 which wraps the new ACL entry-size checks in unlikely() and
 returns
 -EFSCORRUPTED for malformed on-disk ACL blobs in f2fs_acl_from_disk(). 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
X-Headers-End: 1wYM70-0006jz-Dz
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate ACL entry sizes in
 f2fs_acl_from_disk()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, zerocling0077@gmail.com,
 2045gemini@gmail.com, linux-f2fs-devel@lists.sourceforge.net
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
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D45367E65F

SGkgQ2hhbywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkkgYWdyZWUgd2l0aCBib3RoIHBvaW50
cy4gSSBzZW50IGEgdjIgd2hpY2ggd3JhcHMgdGhlIG5ldyBBQ0wgZW50cnktc2l6ZQpjaGVja3Mg
aW4gdW5saWtlbHkoKSBhbmQgcmV0dXJucyAtRUZTQ09SUlVQVEVEIGZvciBtYWxmb3JtZWQgb24t
ZGlzayBBQ0wKYmxvYnMgaW4gZjJmc19hY2xfZnJvbV9kaXNrKCkuCgpUaGFua3MsClpoYW5nIENl
bgoKQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI25bm0NuaciDEx5pel5ZGo5ZubIDA5
OjU55YaZ6YGT77yaCj4KPiBPbiA1LzI0LzI2IDIyOjM3LCBaaGFuZyBDZW4gd3JvdGU6Cj4gPiBm
MmZzX2FjbF9jb3VudCgpIG9ubHkgdmFsaWRhdGVzIHRoZSBhZ2dyZWdhdGUgQUNMIHhhdHRyIGxl
bmd0aC4gQQo+ID4gbWFsZm9ybWVkIEFDTCBjYW4gc3RpbGwgcGxhY2UgQUNMX1VTRVIgb3IgQUNM
X0dST1VQIGluIGEgc2xvdCB0aGF0IG9ubHkKPiA+IGNvbnRhaW5zIHN0cnVjdCBmMmZzX2FjbF9l
bnRyeV9zaG9ydCBieXRlcywgYW5kIGYyZnNfYWNsX2Zyb21fZGlzaygpCj4gPiB0aGVuIHJlYWRz
IGVudHJ5LT5lX2lkIGJlZm9yZSB2ZXJpZnlpbmcgdGhhdCBhIGZ1bGwgZW50cnkgZml0cy4KPiA+
Cj4gPiBSZXF1aXJlIGEgc2hvcnQgZW50cnkgYmVmb3JlIHJlYWRpbmcgZV90YWcgYW5kIGVfcGVy
bSwgYW5kIHJlcXVpcmUgYQo+ID4gZnVsbCBlbnRyeSBiZWZvcmUgcmVhZGluZyBlX2lkIGZvciBB
Q0xfVVNFUiBhbmQgQUNMX0dST1VQLiBUaGlzIGtlZXBzCj4gPiBjb3JydXB0ZWQgQUNMIHhhdHRy
cyBvbiB0aGUgZXhpc3RpbmcgLUVJTlZBTCBwYXRoIHdpdGhvdXQgcmVhZGluZyBwYXN0Cj4gPiB0
aGUgY29waWVkIHhhdHRyIHZhbHVlLgo+ID4KPiA+IFZhbGlkYXRpb24gcmVwcm9kdWNlZCB0aGlz
IGtlcm5lbCByZXBvcnQ6Cj4gPiBLQVNBTiBzbGFiLW91dC1vZi1ib3VuZHMgaW4gX19mMmZzX2dl
dF9hY2wrMHg2ZmIvMHg3ZTAKPiA+IFJJUDogMDAzMzoweDdmNGI4MzVlYTdhYQo+ID4gVGhlIGJ1
Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgb2JqZWN0IGF0IGZmZmY4ODgxMTQ1ODk5NjAgd2hp
Y2ggYmVsb25ncwo+ID4gdG8gdGhlIGNhY2hlIGttYWxsb2MtOCBvZiBzaXplIDgKPiA+IFRoZSBi
dWdneSBhZGRyZXNzIGlzIGxvY2F0ZWQgMCBieXRlcyB0byB0aGUgcmlnaHQgb2YgYWxsb2NhdGVk
IDgtYnl0ZQo+ID4gcmVnaW9uIFtmZmZmODg4MTE0NTg5OTYwLCBmZmZmODg4MTE0NTg5OTY4KQo+
ID4gUmVhZCBvZiBzaXplIDQKPiA+IENhbGwgdHJhY2U6Cj4gPiAgIGR1bXBfc3RhY2tfbHZsKzB4
NjYvMHhhMCAoPzo/KQo+ID4gICBwcmludF9yZXBvcnQrMHhjZS8weDYzMCAoPzo/KQo+ID4gICBf
X2YyZnNfZ2V0X2FjbCsweDZmYi8weDdlMCAoZnMvZjJmcy9hY2wuYzoxNjkpCj4gPiAgIHNyc29f
YWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1ICg/Oj8pCj4gPiAgIF9fdmlydF9hZGRyX3Zh
bGlkKzB4MjI0LzB4NDMwICg/Oj8pCj4gPiAgIGthc2FuX3JlcG9ydCsweGUwLzB4MTEwICg/Oj8p
Cj4gPiAgIF9fZjJmc19nZXRfYWNsKzB4NS8weDdlMCAoZnMvZjJmcy9hY2wuYzoxNjkpCj4gPiAg
IF9fZ2V0X2FjbCsweDI4MS8weDM4MCAoPzo/KQo+ID4gICB2ZnNfZ2V0X2FjbCsweDEwYi8weDE5
MCAoPzo/KQo+ID4gICBkb19nZXRfYWNsKzB4MmEvMHg0MTAgKD86PykKPiA+ICAgZG9fZ2V0X2Fj
bCsweDkvMHg0MTAgKD86PykKPiA+ICAgZG9fZ2V0eGF0dHIrMHhlOC8weDI2MCAoPzo/KQo+ID4g
ICBmaWxlbmFtZV9nZXR4YXR0cisweGQxLzB4MTQwICg/Oj8pCj4gPiAgIGRvX2dldG5hbWUrMHgy
ZC8weDJkMCAoPzo/KQo+ID4gICBwYXRoX2dldHhhdHRyYXQrMHgxNmMvMHgyMDAgKD86PykKPiA+
ICAgbG9ja19yZWxlYXNlKzB4YzgvMHgyOTAgKD86PykKPiA+ICAgY2dyb3VwX3VwZGF0ZV9mcm96
ZW4rMHg5ZC8weDMyMCAoPzo/KQo+ID4gICBsb2NrZGVwX2hhcmRpcnFzX29uX3ByZXBhcmUrMHhl
YS8weDFhMCAoPzo/KQo+ID4gICB0cmFjZV9oYXJkaXJxc19vbisweDFhLzB4MTcwICg/Oj8pCj4g
PiAgIF9yYXdfc3Bpbl91bmxvY2tfaXJxKzB4MjgvMHg1MCAoPzo/KQo+ID4gICBkb19zeXNjYWxs
XzY0KzB4MTE1LzB4NmEwIChhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6ODcpCj4gPiAgIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YgKD86PykKPiA+Cj4gPiBGaXhl
czogYWY0OGI4NWI4Y2QzICgiZjJmczogYWRkIHhhdHRyIGFuZCBhY2wgZnVuY3Rpb25hbGl0aWVz
IikKPiA+IEFzc2lzdGVkLWJ5OiBDb2RleDpncHQtNS41Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFu
ZyBDZW4gPHJvbGxraW5nenpjQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMvYWNsLmMg
fCA2ICsrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9hY2wuYyBiL2ZzL2YyZnMvYWNsLmMK
PiA+IGluZGV4IGZhOGQ4MWEzMGZiOS4uMjkwZmVlNDUxNjM3IDEwMDY0NAo+ID4gLS0tIGEvZnMv
ZjJmcy9hY2wuYwo+ID4gKysrIGIvZnMvZjJmcy9hY2wuYwo+ID4gQEAgLTcwLDcgKzcwLDcgQEAg
c3RhdGljIHN0cnVjdCBwb3NpeF9hY2wgKmYyZnNfYWNsX2Zyb21fZGlzayhjb25zdCBjaGFyICp2
YWx1ZSwgc2l6ZV90IHNpemUpCj4gPgo+ID4gICAgICAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBp
KyspIHsKPiA+Cj4gPiAtICAgICAgICAgICAgIGlmICgoY2hhciAqKWVudHJ5ID4gZW5kKQo+ID4g
KyAgICAgICAgICAgICBpZiAoKGNoYXIgKillbnRyeSArIHNpemVvZihzdHJ1Y3QgZjJmc19hY2xf
ZW50cnlfc2hvcnQpID4gZW5kKQo+Cj4gdW5saWtlbHkoKT8KPgo+IFNob3VsZCByZXR1cm4gLUVG
U0NPUlJVUFRFRCBpbnN0ZWFkIG9mIC1FSU5WQUw/Cj4KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGZhaWw7Cj4gPgo+ID4gICAgICAgICAgICAgICBhY2wtPmFfZW50cmllc1tpXS5lX3Rh
ZyAgPSBsZTE2X3RvX2NwdShlbnRyeS0+ZV90YWcpOwo+ID4gQEAgLTg2LDYgKzg2LDggQEAgc3Rh
dGljIHN0cnVjdCBwb3NpeF9hY2wgKmYyZnNfYWNsX2Zyb21fZGlzayhjb25zdCBjaGFyICp2YWx1
ZSwgc2l6ZV90IHNpemUpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4g
ICAgICAgICAgICAgICBjYXNlIEFDTF9VU0VSOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlm
ICgoY2hhciAqKWVudHJ5ICsgc2l6ZW9mKHN0cnVjdCBmMmZzX2FjbF9lbnRyeSkgPiBlbmQpCj4K
PiBEaXR0bywKPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGFjbC0+YV9lbnRyaWVzW2ldLmVfdWlkID0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1ha2Vfa3VpZCgmaW5pdF91c2VyX25zLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlMzJfdG9fY3B1
KGVudHJ5LT5lX2lkKSk7Cj4gPiBAQCAtOTMsNiArOTUsOCBAQCBzdGF0aWMgc3RydWN0IHBvc2l4
X2FjbCAqZjJmc19hY2xfZnJvbV9kaXNrKGNvbnN0IGNoYXIgKnZhbHVlLCBzaXplX3Qgc2l6ZSkK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBm
MmZzX2FjbF9lbnRyeSkpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAg
ICAgICAgICAgICBjYXNlIEFDTF9HUk9VUDoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAo
KGNoYXIgKillbnRyeSArIHNpemVvZihzdHJ1Y3QgZjJmc19hY2xfZW50cnkpID4gZW5kKQo+Cj4g
RGl0dG8sCj4KPiBUaGFua3MsCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZmFpbDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBhY2wtPmFfZW50cmllc1tpXS5lX2dp
ZCA9Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWtlX2tnaWQoJmluaXRfdXNl
cl9ucywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
ZTMyX3RvX2NwdShlbnRyeS0+ZV9pZCkpOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
