Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id StUHAkxhMmoGzQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 10:56:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28848697B54
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 10:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=NhL5r2sO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=TJfsz7y1;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Jj7fmSYU;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Ogq9ILCy;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnyevDjUpBmceP5Zg8T+B3fVimmZQiTpZb57QnOr7oM=; b=NhL5r2sOxCvUwRMYottVtMATl9
	ev8JWKDCZsgxS5Eon+mgG6Vi3+xYTLb7eM+91KX/koB9FLvFZWHlCL8OdmyCEXLLkCzGasLw8tHyU
	Flr94EDvXfgWimDu30S3IFGTi3rfmaalAfTOq8qzwy0jQzi9VbYNugz4Ba2XOjF7s4JI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZm4T-0005e4-T3;
	Wed, 17 Jun 2026 08:56:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1wZm4S-0005dx-Gl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 08:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nhj+XC6YMC4bHlxFbSWHhl3s7b3c0LIDsoNZdc6f29U=; b=TJfsz7y1cQhJIkmVWUDI4CaYbD
 hUIiVC3yMVwlBrhbY2xImbQInZ+VpOFDr1vHB6wgXret7RMOVu6Fhd5f3Z0ueRNMJah9PBRvbEvVU
 WOiB0xepRm1uiib62SQSMV49K6y/LcxJrAsbzPj9jNxyaGpjwwozibIWIVERBXSz3w54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nhj+XC6YMC4bHlxFbSWHhl3s7b3c0LIDsoNZdc6f29U=; b=Jj7fmSYU8iDopcN5ORIT8aKjze
 4AksAnI2G8Zk3MYkG4o2A+Ele1osR3X4dZNp7ygz+1xOfCd5JZt1h2tu3/OGd/1mfj2bS7VqGQq05
 pmdbJAkpm8t309uJPUJ7LOTOfSvTjzBQ8UQqMYoM6ax0KacGhu17QsY7MTquYmZGh00M=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZm4R-0006X3-9l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 08:56:28 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490b1c39fe4so3504685e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 01:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781686576; cv=none;
 d=google.com; s=arc-20240605;
 b=ACAdjm1UF3O5uCSRliQypnMqCvLCAzqhpbWvfax30RKPhesSJ5vclZ+Y9cC3HH5TbV
 Uvlqg6+/Jhu0qyDyfPBfWx63kYbobRZjCOSRS9gHy3LhQFz9VjFI+b4VzYbkEFsmziYP
 0O65bA0vV7jhAdV8/MXeKxX1X0JqykQhR1iw4h/+3m4tjG4s1JuIXVkQIYnsAcEw77Hv
 4V42H+UfdEI7R4JSXyk/Czabx4rv6YX979t03skcvYROPxr3E31LgIB3m0tV2lYo6ftz
 ZYc5C9LkTfT13NEH1LwMAskPwEzgGoWwdfgwCsBxOvLQMOXmHaOhDy1GIqw21fVozGOQ
 LptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Nhj+XC6YMC4bHlxFbSWHhl3s7b3c0LIDsoNZdc6f29U=;
 fh=Uor35o0rAYvu3cRX84mHaY4Gp7mWF2pUZ64hnYAGO4c=;
 b=aw/CeMXjWvvcYQ4+ZqPftXBgjUJMtlAntXr5+4wMkTPgodzV2cRzD7c3v8AwQeUI4s
 Ts/1Vc0d6tDZc6fKxyVvcML4KBvFu1cWF7S0vBrbwk9sJAbADMUOYR3jUHZxIYyJMyg7
 EgM9T5DuFyNJOuZUgi8+VU1KEGbpRd3eTh2QZcibr6EwjSVbPH2OemaG0rrH+l2fHf7X
 Kzx+D3fOrMo/ivEH1yhwEUTB4VuQWpk6jmDa2j8SW/bwIxSGJ6QA7bhBhFqbW7eNcUkD
 1jmqnKBgYjgBukMfms7g1Mpy29LduL3pyWyoEpxH3VycN1+sNmzVYXiCj2EyAiJ5xN1v
 BmpA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781686576; x=1782291376; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nhj+XC6YMC4bHlxFbSWHhl3s7b3c0LIDsoNZdc6f29U=;
 b=Ogq9ILCyrGQSLmmDz8aBnOlKcMfPjqu1+/Anu/2L+U38jdePrrS2lRj+rIIDN52YkZ
 DKBwu5WDq0xaUkPNhP5RYmQocnrpvzxJF8ynOEt02tCO8DTnIILSHquIfuvvF/F2zynY
 eOQKGTuKxL9w9zK7ZwhwVf5b+n1z5XB5b+ohozwDhhPKA6H2eChxFSBRJKGiAIz9+gm8
 Gve20+7WJ+4Xxe4UJf131uZVrp1vetEFAvfrGYb0ZBzz/n6jTpcOyn1+TtLQrFhGXsGj
 G9P/mbNgoQ7Ss32WNdXjyZKos8s7zRN/MWLzSgam4ss5aX36JPkwqKil+9xud4wz0lUL
 rikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781686576; x=1782291376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nhj+XC6YMC4bHlxFbSWHhl3s7b3c0LIDsoNZdc6f29U=;
 b=rejYcTga7WC63TL7r/WhQpgFsI9WqqYp+Z29E7lTgdePy3NzV0fkX/jUc7i3BoCDuf
 ai4FVVUBHbewarUOkUC4Sf5QCgYx8nV4DNMkMSYXxLK/LVneaXVmRDF5XY8Qv3SHBNK8
 d6zT6y8oWeMQrfsWRPI9G62DmEIFPOtA2bfiHCn/ARpzO4ukL2oax2OTJqamkXkdMt8P
 PdDjxFLCJ6TAkrTh9mpva0AXlzMp2BlqudPdNWCiCo3AtVaC90AMnhrGx182/ulk2mPX
 ltNPypd6qInytkHeh5fdMBjLq8Sqjlw905ncrZLb1Od0baUQNE4NkHGE5kdsmQ3F8Lqy
 0miA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8emJDPtFGCZyPCARBMtoBNwczGJcZUm2L0g4hjgdrhAejp7WujxfFSjLFSHw0vpxIFlxjK5vVtRw+qmJYgl8k1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIFimne0ldO1jfKX3gE8ZlyOqnUlYFAdbfVSxxkFI8PMBNGoPV
 Xtvd1GXRfwu845B0yAZIYUUfIcQJySV47S7vGkmLwYSBWFLomGR1xr70qtpqLkgFa9PSpbCiHnt
 Ve86g3061G4uwe+0yzfQHuOBNEZUUSZ3weLKH
X-Gm-Gg: Acq92OHAWWm1HQIGGqXsI86leFLCu0ZE5i9gDwzKSHIfP+y/eiCmes9FGDcNdlkbGAS
 mE7uUcllO1lWnXbIQYUzYgex7go+UQtv/g9sKtwTjyX/VGRvLL4tI2S81jbyMEoPZSsxfcqMvrs
 PZ8fkscFe72jfF4JyIsa0NekEqAPReJQaMUvHR9Hov4GM7zLUDAW26iL8ZNpNREGv+UbX2h11B4
 rDo3BHJaTjd2AZgmKVWKUf6BRxbqReJzJLEKGIn60CDUqmu63cA9HeE2FnY8K21s1qffTQEqg==
X-Received: by 2002:a05:600c:19cd:b0:490:ade7:9ca4 with SMTP id
 5b1f17b1804b1-4923339f546mr25639615e9.2.1781686575861; Wed, 17 Jun 2026
 01:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260617073357.93682-1-chao@kernel.org>
In-Reply-To: <20260617073357.93682-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 17 Jun 2026 16:56:04 +0800
X-Gm-Features: AVVi8Cc32g2q_NtbXPoT7Ua6WBdDtwXKLJKksnpFLwVxB1oIoVGtlJCdJaF9TFI
Message-ID: <CAHJ8P3+q-gHnvsBkdE9qt7ez-pWF4M_jzmZPm88Da7LquCqETA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2026年6月17日周三 15:36写道：
    > > When allocating memory in aligned_xalloc(), if the requested alignment
    > (e.g., F2FS_DEFAULT_BLKSIZE) is smaller than the sy [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.48 listed in wl.mailspike.net]
X-Headers-End: 1wZm4R-0006X3-9l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: adapt w/ page_size in
 aligned_xalloc()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28848697B54

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjblubQ25pyIMTfml6XlkajkuIkgMTU6MzblhpnpgZPvvJoKPgo+
IFdoZW4gYWxsb2NhdGluZyBtZW1vcnkgaW4gYWxpZ25lZF94YWxsb2MoKSwgaWYgdGhlIHJlcXVl
c3RlZCBhbGlnbm1lbnQKPiAoZS5nLiwgRjJGU19ERUZBVUxUX0JMS1NJWkUpIGlzIHNtYWxsZXIg
dGhhbiB0aGUgc3lzdGVtJ3MgcGFnZSBzaXplLAo+IGFsaWduZWRfYWxsb2MoKSB3aWxsIGFsbG9j
YXRlIG1lbW9yeSB0aGF0IGlzIG5vdCBwYWdlLWFsaWduZWQgb24gc3lzdGVtcwo+IHdpdGggMTZL
QiBvciA2NEtCIHBhZ2Ugc2l6ZXMuCj4KPiBBcyBhIHJlc3VsdCwgc3Vic2VxdWVudCBjYWxscyB0
byBtYWR2aXNlKC4uLiwgTUFEVl9IVUdFUEFHRSkgd2lsbCBmYWlsCj4gYmVjYXVzZSBtYWR2aXNl
KCkgcmVxdWlyZXMgdGhlIG1lbW9yeSBhZGRyZXNzIGFuZCBsZW5ndGggdG8gYmUgcGFnZS1hbGln
bmVkLgo+Cj4gRml4IHRoaXMgYnkgZHluYW1pY2FsbHkgYWRqdXN0aW5nIHRoZSBhbGlnbm1lbnQg
YW5kIHJvdW5kaW5nIHVwIHRoZSByZXF1ZXN0ZWQKPiBhbGxvY2F0aW9uIHNpemUgKHZpYSByb3Vu
ZHVwKCkpIHRvIHRoZSBzeXN0ZW0ncyBwYWdlIHNpemUsIGVuc3VyaW5nIHRoYXQKPiBtZW1vcnkg
aXMgY29ycmVjdGx5IHBhZ2UtYWxpZ25lZCBmb3IgbWFkdmlzZSgpLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogWmhpZ3VvIE5pdSA8emhp
Z3VvLm5pdUB1bmlzb2MuY29tPgp0aGFua3MhCj4gLS0tCj4gIHRvb2xzL2YyZnNfaW8vZjJmc19p
by5jIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmggfCAg
MyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+IGlu
ZGV4IDk0ZTYxYjguLjlhODY2Y2MgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lv
LmMKPiArKysgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+IEBAIC05Nyw2ICs5NywyMyBAQCBz
dGF0aWMgdm9pZCAqeG1hbGxvYyhzaXplX3Qgc2l6ZSkKPgo+ICBzdGF0aWMgdm9pZCAqYWxpZ25l
ZF94YWxsb2Moc2l6ZV90IGFsaWdubWVudCwgc2l6ZV90IHNpemUpCj4gIHsKPiArICAgICAgIGxv
bmcgcGFnZV9zaXplID0gRjJGU19ERUZBVUxUX0JMS1NJWkU7Cj4gKwo+ICsjaWZkZWYgX1NDX1BB
R0VTSVpFCj4gKyAgICAgICBwYWdlX3NpemUgPSBzeXNjb25mKF9TQ19QQUdFU0laRSk7Cj4gKyAg
ICAgICBpZiAocGFnZV9zaXplIDwgMCkKPiArICAgICAgICAgICAgICAgcGFnZV9zaXplID0gRjJG
U19ERUZBVUxUX0JMS1NJWkU7Cj4gKyNlbmRpZgo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAg
KiBPbiBzeXN0ZW1zIHdpdGggbGFyZ2UgcGFnZSBzaXplcyAoZS5nLiwgMTZLQi82NEtCKSwgYWxp
Z25tZW50IGFuZAo+ICsgICAgICAgICogYWxsb2NhdGlvbiBzaXplIG11c3QgYmUgcGFnZS1hbGln
bmVkIHRvIHNhdGlzZnkgbWFkdmlzZSgpLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoYWxp
Z25tZW50IDwgKHNpemVfdClwYWdlX3NpemUpCj4gKyAgICAgICAgICAgICAgIGFsaWdubWVudCA9
IHBhZ2Vfc2l6ZTsKPiArCj4gKyAgICAgICBzaXplID0gcm91bmR1cChzaXplLCBhbGlnbm1lbnQp
Owo+ICsKPiAgICAgICAgIHZvaWQgKnAgPSBhbGlnbmVkX2FsbG9jKGFsaWdubWVudCwgc2l6ZSk7
Cj4KPiAgICAgICAgIGlmICghcCkKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lv
LmggYi90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+IGluZGV4IDUzOTk2NGYuLmNmMWMzMzQgMTAw
NjQ0Cj4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPiArKysgYi90b29scy9mMmZzX2lv
L2YyZnNfaW8uaAo+IEBAIC00OSw2ICs0OSw5IEBAIHR5cGVkZWYgdTMyICAgX19iZTMyOwo+ICAj
ZW5kaWYKPgo+ICAjZGVmaW5lIEYyRlNfREVGQVVMVF9CTEtTSVpFICAgNDA5Ngo+ICsjaWZuZGVm
IHJvdW5kdXAKPiArI2RlZmluZSByb3VuZHVwKHgsIHkpICAgICAgICAgICgoKCh4KSArICgoeSkg
LSAxKSkgLyAoeSkpICogKHkpKQo+ICsjZW5kaWYKPiAgI2RlZmluZSBORVdfQUREUiAgICAgICAw
eEZGRkZGRkZGCj4KPiAgI2lmbmRlZiBGU19JT0NfR0VURkxBR1MKPiAtLQo+IDIuNDkuMAo+Cj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
