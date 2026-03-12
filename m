Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LO/MSHasmlMQQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:22:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A3274416
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BYAapIUtN3uaTdPe0LxXDPBSFnOxGBndjeV64cxNsM=; b=Fmx1ajHon0hIR4JhaTcx2Iw5YY
	q6UTruiu3IqMUtgxMrHQdMRxYlzhdJZgzKsIX8hdEhmySzHQMYyp8+qaxS2sTp7oKT1SCgbMYRbAl
	Rq6j3lfJMekKQwsGh2e3v1XIGVRg7U/thDYmLvPEWFSPyI0QlTrc926CiAccMOWWB/EE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0hrK-0006sG-4e;
	Thu, 12 Mar 2026 15:21:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0hrI-0006s8-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ditvkuvpGdc8nLB/IAFLgoQuA2FosScgFFQvPp9i0ks=; b=Nf5q6epXZs0mu6J4Ny5HlhNJhG
 nyVNo9ddKMNVSoJ23y6AhuIETPakhNTWaI7MD/vOP1AnVxchOzXYQycypZuP0wQhTsaXb5RzlJK6H
 KC6WIxPg5ECFJP1WUJB6EVY6e26q2td7bbYyLru5KVdHFFlwsEuk6lP/RfZfRBFmWIxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ditvkuvpGdc8nLB/IAFLgoQuA2FosScgFFQvPp9i0ks=; b=F/BZK6w9+I2pQlNv3oE6f0SKge
 poWKbYnw1N+OOWRfLo2UM3DlUAV+uluswO22ZdbtNjRP6LtxYyCQDzTUbCmHe3juWCZz3/Ouk3CPz
 SonvRem+eO8YXDK8LY+HsWvQXnLspHIaSrNpZJ/bpFDp9LTYFj6aRPMO0q+Nu/zdvAlI=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0hrH-0005R8-PM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:21:56 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-5fff52ab292so345821137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2026 08:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773328905; cv=none;
 d=google.com; s=arc-20240605;
 b=XTtptDVtNrbvcqAn+sKqJwJiZPYEPPbU/2T4rn3+t1CFN9WL2WRS+Rer1xbv7L8kkI
 CiuF18an7QFkoX1EYbR1PBON5K3uiX5TQKwn5RxlKMFvoTiOtn5M/dtZlXHCGU3Tt31o
 6HEi5KsEkH9/9rCncTP1q7p45C9h/P4pkxu4lwXAfpbKcatuUfQSorSK3vZgMZDspk7o
 qRAlUM4hD32Z8/gIz1+B7C52GI/8SuBY+cqE6V19ngDhB+4NJBoN7z2AIeIBgp6S+fVY
 KEbb6MaVa3TojsikO3vzciLTb9bSNpqQBY5aecLqUq8BiVO+X+s0rI4Qs4Zxjc+sL2vH
 pemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ditvkuvpGdc8nLB/IAFLgoQuA2FosScgFFQvPp9i0ks=;
 fh=MvkkN3Ht93dXxR2ZCQdQ58M/j5CxFd8i+/bQnxaNQPg=;
 b=T8kq3oX+gYY485Si872Jyi0RktxTu5DxSK73/Bd8fWMTKaPR2AP49hBonxpImLJaqG
 Rwz6+D64tHIajZUXx9GOdbrfGvcF3UMR5Su3YK3lNWj25K6Zup/R5nRkUtAg4uvWJRHZ
 JsdA3nOc+0zP57w7SoK7hBC6vtbq+ucUAt+1Ja6YRUOxTxHp/7XnzFVXIT2NCQjhgKRg
 N9qvBW9CGDLF5wrHf/IdErZljCH+T7harwKlU64JzuI5mTqzpdYoHkUkDHaJVjZncMID
 +uX6E47zWQZT/OCvJOmj5+SIRpVC6LYtVcrZwwUZIORVNkjq9NVoG15ghbl/xwrnGiVD
 fFpA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773328905; x=1773933705; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ditvkuvpGdc8nLB/IAFLgoQuA2FosScgFFQvPp9i0ks=;
 b=DZxgxunhioptVjaOKdkzb30nUAHhzldn//u/WaX1glRdwcMGFj9bhsUDnPe+GV1jti
 Hd4++lfmavkJzGgkZn92Qg/QkVTk5im9dBVpLYcISaGaU0Xr/lYGpa8MC3c9AW7M9oRa
 FpWlW/+vA3v4UI8HmaF5nLM+kvrsoCgWpbLmGyTuOKuJNBdq+bwCKQCj6QMUbGwhXOG5
 ZlFThWhUcEJ+CHQiLwA5Yb5Bx0pw6F77+lLV8nuVOtt5aDLQUR9PWIMqpXxxskTr4fev
 Q9XfYdGeDyih1hBKVJhGmb1WPkKJhSxMZyaUJTJG0m15LJIXp1rbjPH+0XHJA42Z3eee
 QSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773328905; x=1773933705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ditvkuvpGdc8nLB/IAFLgoQuA2FosScgFFQvPp9i0ks=;
 b=RbvfgHSP3JSExazLxAfT5BRipnYIUNseJ15icFm/Ub1BhnPANP4I0UJ4z7UcXwCTdv
 rRH9yW0rJ8BZGvF91aXWow/QnEd6IrloJEJErySGH5KRzB6VGrjNl6Wg18M3PvL0oJuk
 m9HOTbUrVWMFmjQNEy5gu3kVYIx2g7lB3oOzrDCBGnLXIqg/FUeioy0zywi6Fkfnk439
 a4vJ8yTUdFPGeRke9i4i9nv2qeNU3MktHssqSYrquMxtR3XUtYNxtTYSpDEdinG/dcAw
 P6nkxmWLttujZ4MJ4LrrsAOSrRnWsqHiXOy92XNCuAbzLOL3gXyftTAQ4HP08UH3Gk+g
 ypGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6rhcyNbEmy3eNJ7dpUAreHqm2oxR/Y30utltjdTFlOAt/81C+p954nC8i3/zM/AaFeLAvT/pmuF/edAOWCikw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwYYpSzQpdYTMyI9d+sK7XzECAWHATbq/Ad3y19BWB8P+Xku1ID
 fBAjOgpFcChLe+F4lveG8mtHCrf1Nu1oeOq5KH//kLA1Jvc9+30uTJ7dLSzvLFmACFBzS/OeOeT
 8pywdn7Eu8TJeST06YNo7Yf9AoIJTCTk=
X-Gm-Gg: ATEYQzwhdnzuBYIKhq/gsgy04i52K94e0UysIKX8t6/I9k+yEk9FBB6ebKxRJVwI5na
 sc23GWrXhewEgZE8t4zfvOAEF6CDkhucafNaLPFr+FrtRZlV8jmPyMo2ZX8aM98G0A/cEYOxep7
 g8FV5Wl+E5VZ7jO9M6NRhyHwuBjwyrLCgnHj6MuzmE0+jqggPITXL6DnPhBf3DXerUaawJXazc0
 +InEd1+SInSlnFJ24OzcSv+E3RzzUzPfReK7bftMJn35W5G4PfLpA7J1mj+/MTRbixKsFrJVzMt
 C8BhporXCCEVKPXAVhGZe92XGDcZ80T7VXoqfbDf2og8RmFwJoJmmNzkoeAaQvjTUg==
X-Received: by 2002:a05:6102:a4b:b0:5ff:9d74:967b with SMTP id
 ada2fe7eead31-601def73332mr2800990137.20.1773328904623; Thu, 12 Mar 2026
 08:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260310204916.1265736-1-daeho43@gmail.com>
 <2ab52a8d-a21b-4b74-a2a1-d7b51fb60ca6@kernel.org>
 <CACOAw_z-vDFjp8mkBPaBvibDMbAmLBcisjUxu=8A5pqaKGEfEQ@mail.gmail.com>
 <d5a7a17b-bddf-4615-bae3-347a048d186c@kernel.org>
In-Reply-To: <d5a7a17b-bddf-4615-bae3-347a048d186c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 12 Mar 2026 08:21:33 -0700
X-Gm-Features: AaiRm52vyQSNr3NNAWcW8Lg0uX2ersIZSuBr6HjrU2d26nLX967HKb2y-jOF7To
Message-ID: <CACOAw_zBjrJPUZnAs=aCOosf_gHkRR8v3Ojg5ZsbxuhjczXngA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 11,
 2026 at 6:27 PM Chao Yu wrote: > > On 2026/3/12
 00:00, Daeho Jeong wrote: > > On Wed, Mar 11, 2026 at 7:59 AM Chao Yu wrote:
 > >> > >> On 2026/3/11 04:49, Daeho Jeong wrote: > >>> [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.43 listed in wl.mailspike.net]
X-Headers-End: 1w0hrH-0005R8-PM
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to freeze GC and discard threads
 quickly
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 835A3274416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjoyN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTIgMDA6MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNzo1OeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI2LzMvMTEgMDQ6NDksIERhZWhvIEplb25nIHdyb3Rl
Ogo+ID4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+Pgo+
ID4+PiBTdXNwZW5kIGNhbiBmYWlsIGlmIGtlcm5lbCB0aHJlYWRzIGRvIG5vdCBmcmVlemUgZm9y
IGEgd2hpbGUuCj4gPj4+IGYyZnNfZ2MgYW5kIGYyZnNfZGlzY2FyZCB0aHJlYWRzIGNhbiBwZXJm
b3JtIGxvbmctcnVubmluZyBvcGVyYXRpb25zCj4gPj4+IHRoYXQgcHJldmVudCB0aGVtIGZyb20g
cmVhY2hpbmcgYSBmcmVlemUgcG9pbnQgaW4gYSB0aW1lbHkgbWFubmVyLgo+ID4+Pgo+ID4+PiBU
aGlzIHBhdGNoIGFkZHMgZXhwbGljaXQgZnJlZXppbmcgY2hlY2tzIGluIHRoZSBmb2xsb3dpbmcg
bG9jYXRpb25zOgo+ID4+PiAxLiBmMmZzX2djOiBBZGRlZCBhIGNoZWNrIGF0IHRoZSAncmV0cnkn
IGxhYmVsIHRvIGV4aXQgdGhlIGxvb3AgcXVpY2tseQo+ID4+PiAgICAgIGlmIGZyZWV6aW5nIGlz
IHJlcXVlc3RlZCwgZXNwZWNpYWxseSBkdXJpbmcgaGVhdnkgR0Mgcm91bmRzLgo+ID4+PiAyLiBf
X2lzc3VlX2Rpc2NhcmRfY21kOiBBZGRlZCBhICdzdXNwZW5kZWQnIGZsYWcgdG8gYnJlYWsgYm90
aCBpbm5lciBhbmQKPiA+Pj4gICAgICBvdXRlciBsb29wcyBkdXJpbmcgZGlzY2FyZCBjb21tYW5k
IGlzc3VhbmNlIGlmIGZyZWV6aW5nIGlzIGRldGVjdGVkCj4gPj4+ICAgICAgYWZ0ZXIgYXQgbGVh
c3Qgb25lIGNvbW1hbmQgaGFzIGJlZW4gaXNzdWVkLgo+ID4+PiAzLiBfX2lzc3VlX2Rpc2NhcmRf
Y21kX29yZGVybHk6IEFkZGVkIGEgc2ltaWxhciBjaGVjayBmb3Igb3JkZXJseSBkaXNjYXJkCj4g
Pj4+ICAgICAgdG8gZW5zdXJlIHJlc3BvbnNpdmVuZXNzLgo+ID4+Pgo+ID4+PiBUaGVzZSBjaGVj
a3MgZW5zdXJlIHRoYXQgdGhlIHRocmVhZHMgcmVsZWFzZSBsb2NrcyBzYWZlbHkgYW5kIGVudGVy
IHRoZQo+ID4+PiBmcm96ZW4gc3RhdGUuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IERhZWhv
IEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgICBmcy9mMmZz
L2djLmMgICAgICB8ICA0ICsrKysKPiA+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAxNCArKysr
KysrKysrKystLQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9m
MmZzL2djLmMKPiA+Pj4gaW5kZXggOTgxZWFjNjI5ZmU5Li5mZGMzMzY2YzRkYjMgMTAwNjQ0Cj4g
Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ID4+PiArKysgYi9mcy9mMmZzL2djLmMKPiA+Pj4gQEAg
LTE5NjIsNiArMTk2MiwxMCBAQCBpbnQgZjJmc19nYyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IHN0cnVjdCBmMmZzX2djX2NvbnRyb2wgKmdjX2NvbnRyb2wpCj4gPj4+ICAgICAgICAgICAgICAg
IGdvdG8gc3RvcDsKPiA+Pj4gICAgICAgIH0KPiA+Pj4gICAgcmV0cnk6Cj4gPj4+ICsgICAgIGlm
ICh1bmxpa2VseShmcmVlemluZyhjdXJyZW50KSkpIHsKPiA+Pj4gKyAgICAgICAgICAgICByZXQg
PSAwOwo+ID4+PiArICAgICAgICAgICAgIGdvdG8gc3RvcDsKPiA+Pj4gKyAgICAgfQo+ID4+Cj4g
Pj4gRG8gd2UgbmVlZCB0byBjaGVjayBmcmVlemluZygpIGR1cmluZyBtdWx0aXBsZSBzZWdtZW50
cyBtaWdyYXRpb24/Cj4gPj4gZXNwZWNpYWxseSBpbiBsYXJnZSBzZWN0aW9uLCBlLmcuIHp1ZnMg
Y2FzZS4KPiA+Cj4gPiBPdGhlcndpc2UsIHdlIGNhbid0IG1lZXQgdGhlIDEgc2Vjb25kIHN1c3Bl
bmQgcmVxdWlyZW1lbnQgZm9yIEFuZHJvaWQuCj4gPiBUaGlzIGxvZ2ljIG1haW5seSB0YXJnZXRz
IHp1ZnMgcHJvYWN0aXZlIEdDIGNhc2VzLgo+ID4gUGx1cywgYXJlbid0IHRoZSByZW1haW5pbmcg
c2VnbWVudHMgaW4gdGhlIHNlY3Rpb24gdGhlIG5leHQgdmljdGltcyBvZgo+ID4gR0MgZm9yIHRo
ZSBuZXh0IHJvdW5kPwo+Cj4gU29ycnksIEkgZGlkbid0IGdldCB0aGUgcG9pbnQsIGNvdWxkIHlv
dSBwbGVhc2UgZXhwbGFpbiBtb3JlIGFib3V0IHlvdXIgY29uY2Vybj8KPgo+IEFjdHVhbGx5LCB3
aGF0IEkgbWVhbiBpcyBpZiB3ZSBtaXNzZWQgZnJlZXplaW5nKCkgY2hlY2sgY29uZGl0aW9uIGlu
IGYyZnNfZ2MoKSwKPiBpbiBkb19nYXJiYWdlX2NvbGxlY3Rpb24oKSwgYWZ0ZXIgd2UgbWlncmF0
ZWQgb25lIHNlZ21lbnQgb2Ygc2VjdGlvbiwgYW5kIGJlZm9yZQo+IG1pZ3JhdGUgbmV4dCBzZWdt
ZW50IGluIHNlY3Rpb24sIHdlIGNhbiBjaGVjayBmcmVlemluZygpIGNvbmRpdGlvbiBhdCB0aGlz
IHRpbWU/Cj4KPiBJIG1lYW50IG1heWJlIHdlIGNhbiBhZGQgbW9yZSBjaGVjayBzcG90cyBpbiBk
b19nYXJiYWdlX2NvbGxlY3Rpb24oKS4KCk9oLCBJIG1pc3VuZGVyc3Rvb2QgeW91ciBwb2ludCBl
YXJsaWVyLgoKSSBhZ3JlZSB0aGF0IGFkZGluZyBtb3JlIGNoZWNrIHBvaW50cyBpbnNpZGUgZG9f
Z2FyYmFnZV9jb2xsZWN0aW9uKCkKd291bGQgYmUgYmVuZWZpY2lhbCwgZXNwZWNpYWxseSBmb3Ig
Y2FzZXMgd2l0aCBsYXJnZSBzZWN0aW9ucyBsaWtlCnp1ZnMuCgpUaGFua3MsCgo+Cj4gVGhhbmtz
LAo+Cj4gPgo+ID4+Cj4gPj4+ICAgICAgICByZXQgPSBfX2dldF92aWN0aW0oc2JpLCAmc2Vnbm8s
IGdjX3R5cGUsIGdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPiA+Pj4gICAgICAgIGlmIChyZXQpIHsK
PiA+Pj4gICAgICAgICAgICAgICAgLyogYWxsb3cgdG8gc2VhcmNoIHZpY3RpbSBmcm9tIHNlY3Rp
b25zIGhhcyBwaW5uZWQgZGF0YSAqLwo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50
LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiBpbmRleCBlOWI2ZDc3NGI5ODUuLmE2YzgyYWIy
ODI4OCAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmMKPiA+Pj4gQEAgLTE2MDYsNiArMTYwNiw5IEBAIHN0YXRpYyB2b2lkIF9f
aXNzdWVfZGlzY2FyZF9jbWRfb3JkZXJseShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+
ICAgICAgICAgICAgICAgIGlmIChkYy0+c3RhdGUgIT0gRF9QUkVQKQo+ID4+PiAgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+Pj4KPiA+Pj4gKyAgICAgICAgICAgICBpZiAoKmlz
c3VlZCA+IDAgJiYgdW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKQo+ID4+PiArICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICsKPiA+Pj4gICAgICAgICAgICAgICAgaWYgKGRwb2xp
Y3ktPmlvX2F3YXJlICYmICFpc19pZGxlKHNiaSwgRElTQ0FSRF9USU1FKSkgewo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgIGlvX2ludGVycnVwdGVkID0gdHJ1ZTsKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gQEAgLTE2NDUsNiArMTY0OCw3IEBAIHN0YXRpYyBp
bnQgX19pc3N1ZV9kaXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+ICAg
ICAgICBzdHJ1Y3QgYmxrX3BsdWcgcGx1ZzsKPiA+Pj4gICAgICAgIGludCBpLCBpc3N1ZWQ7Cj4g
Pj4+ICAgICAgICBib29sIGlvX2ludGVycnVwdGVkID0gZmFsc2U7Cj4gPj4+ICsgICAgIGJvb2wg
c3VzcGVuZGVkID0gZmFsc2U7Cj4gPj4+Cj4gPj4+ICAgICAgICBpZiAoZHBvbGljeS0+dGltZW91
dCkKPiA+Pj4gICAgICAgICAgICAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFVNT1VOVF9ESVND
QVJEX1RJTUVPVVQpOwo+ID4+PiBAQCAtMTY3NSw2ICsxNjc5LDExIEBAIHN0YXRpYyBpbnQgX19p
c3N1ZV9kaXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+ICAgICAgICAg
ICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShkYywgdG1wLCBwZW5kX2xpc3QsIGxpc3Qp
IHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGRjLT5zdGF0
ZSAhPSBEX1BSRVApOwo+ID4+Pgo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKGlzc3Vl
ZCA+IDAgJiYgdW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKSB7Cj4gPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN1c3BlbmRlZCA9IHRydWU7Cj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4+
PiArCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGRwb2xpY3ktPnRpbWVvdXQgJiYK
PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdGltZV9vdmVyKHNiaSwg
VU1PVU5UX0RJU0NBUkRfVElNRU9VVCkpCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiA+Pj4gQEAgLTE2OTQsMTEgKzE3MDMsMTIgQEAgc3RhdGljIGludCBfX2lz
c3VlX2Rpc2NhcmRfY21kKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4gICAgbmV4dDoK
PiA+Pj4gICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZkY2MtPmNtZF9sb2NrKTsKPiA+Pj4K
PiA+Pj4gLSAgICAgICAgICAgICBpZiAoaXNzdWVkID49IGRwb2xpY3ktPm1heF9yZXF1ZXN0cyB8
fCBpb19pbnRlcnJ1cHRlZCkKPiA+Pj4gKyAgICAgICAgICAgICBpZiAoaXNzdWVkID49IGRwb2xp
Y3ktPm1heF9yZXF1ZXN0cyB8fCBpb19pbnRlcnJ1cHRlZCB8fAo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN1c3BlbmRlZCkKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+Pj4gICAgICAgIH0KPiA+Pj4KPiA+Pj4gLSAgICAgaWYgKGRwb2xp
Y3ktPnR5cGUgPT0gRFBPTElDWV9VTU9VTlQgJiYgaXNzdWVkKSB7Cj4gPj4+ICsgICAgIGlmIChk
cG9saWN5LT50eXBlID09IERQT0xJQ1lfVU1PVU5UICYmIGlzc3VlZCAmJiAhc3VzcGVuZGVkKSB7
Cj4gPj4KPiA+PiBJZiB3ZSdyZSB1bW91bnRpbmcgZGF0YSBwYXJ0aXRpb24sIGl0IGRvZXNuJ3Qg
bmVlZCB0byBjb25zaWRlciBzdXNwZW5kPwo+ID4KPiA+IE1ha2VzIHNlbnNlLgo+ID4KPiA+Pgo+
ID4+IFRoYW5rcywKPiA+Pgo+ID4+PiAgICAgICAgICAgICAgICBfX3dhaXRfYWxsX2Rpc2NhcmRf
Y21kKHNiaSwgZHBvbGljeSk7Cj4gPj4+ICAgICAgICAgICAgICAgIGdvdG8gcmV0cnk7Cj4gPj4+
ICAgICAgICB9Cj4gPj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
