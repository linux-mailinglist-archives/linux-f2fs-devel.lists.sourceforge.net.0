Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t/4nOml3KWoZXQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 16:40:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434366A4D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 16:40:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DjPQCp4U;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gcvS4bOY;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=KRVpFRcm;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=jONiMTgJ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+U05CEANxQJaJeEgAQgS4HNQx5hP44AsYaaVM3opiY=; b=DjPQCp4UjECXcv9NWvqkxkPfzq
	AGn+wzi72cHWDMy9ksR+3YziQdmQIhX6AwDlpekhpim7A+pTTFPJnNjwrOLd/VAqchGe/VMVj44Ue
	Sxi5zd9gw+s2ceU+HGOMa8IedFZSGGLUJPcw6ed2HhebF8Oick12NQ079qlASAI6kFG4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXK6d-0006in-2K;
	Wed, 10 Jun 2026 14:40:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wXK6G-0006iQ-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 14:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIaCwtIo6bzs9NnL4G+5os8n356/EsUB6qUXCgziAOk=; b=gcvS4bOYoCxmxSIuz3AuBMShYV
 1R/DxCcnIZt1i2MRxMD9uOgI5tDpn0ggl2fayy/O7DXMvP+f9mai9faulFymuP5JEyjBeqjCNXdbC
 DJq1/saH7ndDE0pQ0RPA2xJ71zwL7IlFkpE6bl06oxjTtqYpHI3JrI/fvSqq9mKM9mLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eIaCwtIo6bzs9NnL4G+5os8n356/EsUB6qUXCgziAOk=; b=KRVpFRcmDH+OUtb/D0KsTMXCqm
 UMRyWJOQ0rskZ2sb13RxxWqRUiuf9mTztiRumfT1ZuIEo/dm6MvJMcJrwHOxTjyaHQMvoHGMdcfYP
 XLmdTyAHVJg4pA9wmbACNHB9mG2ePXYqqq3Ul1gZwAAy/iiRpEI9zJEYAQiOW4KYk+30=;
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wXK68-00059B-0u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 14:40:07 +0000
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-396775c2720so62843731fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jun 2026 07:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102398; cv=none;
 d=google.com; s=arc-20240605;
 b=ZARxLhLz9tnueFhk9t6WzBpK0OZt2ky5O9eUUz26fx+xJYCEhr/lSUxG6k4btnUPVc
 x2wSlzYsl/ypSPilfP2rRGH8Mo9FwRTC5FNBfF37xP5mWhI3vVdZRJ7yTDe9PgChlZMR
 6BAXjI3lSfzdb1BiCozSVhAzDQC8YLkD1sXSIutiVciH0ocpCiLBPt7bHHssc1lfIlvh
 5WIbXHP1ngw+WombH18JeekLsT0PO/5A+OLYG2mX/cLNPilQcdjZtJvngw85gpyjLX7g
 uzReaePTl8/rQHD1jzUjrg1iYpAHy2euS5X2RAyZ1ZDLCbwUxKd9Qk5ukKS2HtBhL+fx
 tA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eIaCwtIo6bzs9NnL4G+5os8n356/EsUB6qUXCgziAOk=;
 fh=h+JexDMGCLoo/YgAEpIaTlxOdQ2A9pGkgVhJgfI1JKY=;
 b=AnTVXnf0gHyKOGt2csADuRW9yLyCHOdqUBe/sJf/04MtpvLHjfdKXW1GLFz8gIV20c
 weFCjWwLAKrxThGMeOZTnVqKHneyzG43Ko+BhxnWK5DBmsKh5ZTHjdLPfWOwusSldUsH
 QnjQ+dCvGvN+VacA1C72V+8YZhiQY0cAQvmozj/2iDrUq6KtSg73gAEKA3urmpPXAFmQ
 /n+h2zL9oZgUoI6PcCtd1x/CwfEKJc+FJ6YscY1N1Lw9kyDPSK5jUrk24FmSvZqC/P6p
 XPvsVx4DLm52iYi2dgu5kJbuFMqux7JNKZihcfneZILgCOoVMU6A7G6mG8AOY/cNdVVe
 bVrQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781102398; x=1781707198; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIaCwtIo6bzs9NnL4G+5os8n356/EsUB6qUXCgziAOk=;
 b=jONiMTgJxFOstd1a3SE0aPtnmOfainoaTA/suv1M6tq8/U6+lzEpZlb0wUD386wpSg
 f2B2iol3+AhCftDHBsYNhyK2j5+b5+x4WO1/tLKgeiEFNudm/bmsv32T+PpKAQNtEHC1
 eMpGGDfyRYHLepXQyJBqmjl2POkfSRdjGt62nhcdEQnAdfnluH75ek15zTgEVsdwTlJ7
 EnASL+yeLfouYxvkkJw+neiyFGrrpPsOcLkwmdx+cCxqxezABY8u7ImBOZMqGG0S25hR
 c+uyAmoa7oCp+c3VnC8VdnxIBIC6mquCqqzcUNXpWOpxNbHHysYlEat8crdGD1A0c7qi
 phHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781102398; x=1781707198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eIaCwtIo6bzs9NnL4G+5os8n356/EsUB6qUXCgziAOk=;
 b=XrKXcJSy8AyayzUENTkypyBBIwQZvTtHaHj9mcd/h/fKtYmBa5xq8ac9QxmXYfyUnN
 7ipeSbe7R2b2/DyCAeYwDpSoTAm4fkjIQ9R276tSOJ4H2lwVqRrO4P12gxwtf6bjc+qW
 mF3vaHdvsPubJ0fe3FSMsK2W3MGIDWBC9GET3alfBcaFrzF6OguXNutdh4w61qdDrK9C
 gKWpabaFNdZdQFqqeYknKvJsQpxknu+haClqHgnB5YnTWTU5j1cQS+N/RK7A4YP+WZYy
 GttfL+nfxTkql1rQAtn0H9SHTiybssPdsOsblLBXxZWvQ8Ms8kcfyxSAOMqZc66VEFVf
 OkUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XpOsxNFjosEJ4UqysKzMFwB74wYqJQLjh0cSmOc78k7xAtshldRpDWoQQOBfh6xOw+fxDeIhJV6lkmbL4YkpA@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxf9x8rmVXjKtyd1PmKtU70b1GM+8lDTZy8WvGJXQxm1NkqNhnD
 nCdTmQCipsCEDhwvcMOxRbslMVdJKNmT2waTeR9g3z8YemhLXUrKXMii+Mpf7hPCWzpZsw/WHnT
 9BDDSa2yH0a2cpqSgbZTRPnZeG/CMcok=
X-Gm-Gg: Acq92OH+0v1OqWGeeu/VmYTWS8KdkuYNXzuPxVBhtefk2po5LY8JNPkDricyG512yKe
 oCLJWhxH46J/YU4WUn7LUSRz/bu27lDfUAlGuvUsHTqqihvV+vG7xSN++Fcl2uQWbKf2MMNbLwW
 Tp5O+zdzytUIGz+yz106ssoyPlbskNPdSviMm6obOJA2cxZC12GTqOr+D6y4eNl81lTLh4c9dbV
 gPKUVkMAq5EmCKO/xPVxTZM/9bjwLBQshDqO/ZV6D43Ncn/gK22PdbYixMbSoZm2gLzE8cdT2UZ
 nzys8I0h8kxC+c+BgRjkDT3obgTCpQ==
X-Received: by 2002:a05:651c:2121:b0:396:5d0a:765a with SMTP id
 38308e7fff4ca-396d0991ac7mr68469361fa.21.1781102397555; Wed, 10 Jun 2026
 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260521110526.1967583-1-qiwenjie@xiaomi.com>
 <aiivTdvRhZlk6wC3@google.com>
In-Reply-To: <aiivTdvRhZlk6wC3@google.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Wed, 10 Jun 2026 22:39:45 +0800
X-Gm-Features: AVVi8CdCdJypjS0Ybj5-bprpY4TyEhjYScR65ph6s1ykz3OQIO2AyVsd8dFtNDk
Message-ID: <CAGFpFsRSKcNd-Ks9NWnKK+dOCJ8YPxt23pdy6whMsV71AZPYXw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Updated in v2 by dropping the obsolete user.fadvise/chmod
 case and restricting the fix to ATTR_SIZE on immutable large-folio mappings.
 On Wed, Jun 10, 2026 at 8:26 AM Jaegeuk Kim wrote: > > On 05/21, Wenjie Qi
 wrote: > > F2FS large folio support is read-only. It rejects writable opens
 and > > mmap writes when an inode mapping suppo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.177 listed in wl.mailspike.net]
X-Headers-End: 1wXK68-00059B-0u
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject setattr writes on large folio
 files
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
Cc: linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org
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
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
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
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3434366A4D2

VXBkYXRlZCBpbiB2MiBieSBkcm9wcGluZyB0aGUgb2Jzb2xldGUgdXNlci5mYWR2aXNlL2NobW9k
IGNhc2UgYW5kCnJlc3RyaWN0aW5nIHRoZSBmaXgKIHRvIEFUVFJfU0laRSBvbiBpbW11dGFibGUg
bGFyZ2UtZm9saW8gbWFwcGluZ3MuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMt
ZGV2ZWwvMjAyNjA2MTAxNDM3MzUuMzE2OTkzNS0xLXFpd2VuamllQHhpYW9taS5jb20vVC8jdQoK
T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgODoyNuKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMjEsIFdlbmppZSBRaSB3cm90ZToKPiA+IEYyRlMg
bGFyZ2UgZm9saW8gc3VwcG9ydCBpcyByZWFkLW9ubHkuIEl0IHJlamVjdHMgd3JpdGFibGUgb3Bl
bnMgYW5kCj4gPiBtbWFwIHdyaXRlcyB3aGVuIGFuIGlub2RlIG1hcHBpbmcgc3VwcG9ydHMgbGFy
Z2UgZm9saW9zLCBidXQgc2V0YXR0ciBjYW4KPiA+IHN0aWxsIHJlYWNoIHRoZSBpbm9kZSB3aXRo
b3V0IGdvaW5nIHRocm91Z2ggdGhvc2UgY2hlY2tzLgo+ID4KPiA+IEZvciBpbW11dGFibGUgbGFy
Z2UtZm9saW8gZmlsZXMsIGNsZWFyaW5nIHRoZSBpbW11dGFibGUgZmxhZyBrZWVwcyB0aGUKPiA+
IGNhY2hlZCBpbm9kZSBhbmQgaXRzIGxhcmdlLWZvbGlvIG1hcHBpbmcgYWxpdmUgdW50aWwgdGhl
IGlub2RlIGlzCj4gPiBkcm9wcGVkLiBBIHBhdGgtYmFzZWQgdHJ1bmNhdGUoMikgY2FuIHRoZW4g
Y2FsbCBmMmZzX3NldGF0dHIoKSB3aXRoCj4gPiBBVFRSX1NJWkUgYW5kIGNoYW5nZSB0aGUgZmls
ZSBzaXplIHdpdGhvdXQgb3BlbmluZyB0aGUgZmlsZSBmb3Igd3JpdGUuCj4gPgo+ID4gVGhlIHVz
ZXIuZmFkdmlzZSBwYXRoIGFkZHMgYW5vdGhlciB2aXNpYmxlIGNhc2U6IGFmdGVyIHRoZSBmaWxl
IGlzCj4gPiByZW9wZW5lZCB3aXRoIGxhcmdlIGZvbGlvcywgY2htb2QoV1JJVEUpIGlzIGRvY3Vt
ZW50ZWQgdG8gZmFpbCwgYnV0Cj4gPiBmMmZzX3NldGF0dHIoKSBjdXJyZW50bHkgYWxsb3dzIEFU
VFJfTU9ERSB0byBhZGQgd3JpdGUgYml0cyBiYWNrLgo+Cj4gV2UgZG9uJ3QgYWRkIHRoaXMgYW55
bW9yZS4gQ2FuIHlvdSB1cGRhdGU/Cj4KPiA+Cj4gPiBSZWplY3Qgc2l6ZSBjaGFuZ2VzIGFuZCBt
b2RlIGNoYW5nZXMgdGhhdCBlbmFibGUgd3JpdGUgcGVybWlzc2lvbnMgd2hpbGUKPiA+IHRoZSBt
YXBwaW5nIHN0aWxsIHN1cHBvcnRzIGxhcmdlIGZvbGlvcy4gUmVhZC1vbmx5IG1vZGUgY2hhbmdl
cyBhbmQKPiA+IHVucmVsYXRlZCBtZXRhZGF0YSB1cGRhdGVzIHJlbWFpbiBhbGxvd2VkLgo+ID4K
PiA+IEZpeGVzOiAwNWU2NWMxNGVhNTkgKCJmMmZzOiBzdXBwb3J0IGxhcmdlIGZvbGlvIGZvciBp
bW11dGFibGUgbm9uLWNvbXByZXNzZWQgY2FzZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUg
UWkgPHFpd2VuamllQHhpYW9taS5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2ZpbGUuYyB8IDUg
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDcxMzg1Y2E0
MTYzZC4uMzg4MGZmNWU2NzQwIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+ICsr
KyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtMTA5Nyw2ICsxMDk3LDExIEBAIGludCBmMmZzX3Nl
dGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVRUUl9HSUQgfCBBVFRSX1RJTUVTX1NF
VCkpKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiA+Cj4gPiArICAgICBpZiAo
bWFwcGluZ19sYXJnZV9mb2xpb19zdXBwb3J0KGlub2RlLT5pX21hcHBpbmcpICYmCj4gPiArICAg
ICAgICAgKChhdHRyLT5pYV92YWxpZCAmIEFUVFJfU0laRSkgfHwKPiA+ICsgICAgICAgICAgKChh
dHRyLT5pYV92YWxpZCAmIEFUVFJfTU9ERSkgJiYgKGF0dHItPmlhX21vZGUgJiAwMjIyKSkpKQo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCj4gPiAgICAgICBpZiAo
KGF0dHItPmlhX3ZhbGlkICYgQVRUUl9TSVpFKSkgewo+ID4gICAgICAgICAgICAgICBpZiAoIWYy
ZnNfaXNfY29tcHJlc3NfYmFja2VuZF9yZWFkeShpbm9kZSkgfHwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIElTX0RFVklDRV9BTElBU0lORyhpbm9kZSkpCj4gPiAtLQo+ID4gMi40
My4wCj4gPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
