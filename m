Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHVSJduitGnmrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:50:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B726828AC19
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GJvK7ueI91yP9ymgy2sCm9YRV6GqTKBpOmlz9SJAtY=; b=c1FA6T8d4J9fExqm9+ZtK3tEYh
	uXLcZI017Oawz5GXJ7W1XjMu7wzxAuK+XvbUISx2qBNysM8ccjBhipeHn/4ks6Y6EAQa5xtRGKJDY
	7/m4G+gQlxAYzVXAvjQ++0SmkcHlNnYZ91u5AfhZ/Hs3P9s2k22KWkHKAgDWcejPNopk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1CHG-0000Cd-QU;
	Fri, 13 Mar 2026 23:50:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w1CGu-0000CF-4i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Um2bRrXARy3mtchJw30+S/Pvn/On2DyCGDYN2PA5Xk0=; b=fBSh5kV+aT2ZHCH2uV1KAyQDbc
 hAB2nWTsNSU4g6v6Ccd09evmokmWT4CyzeBaVL/b5EE+SIbnmmPr9zFpy7nC6yYgVWht6510H7tE4
 DHR4CaRW7oM1ulqTzB0M8OJopPBroKqzNkR6Snhx96DxMFm9sSqlkMJjHv1sxky4vHmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Um2bRrXARy3mtchJw30+S/Pvn/On2DyCGDYN2PA5Xk0=; b=eg9CcZYaPiWWJlbMou5NmHoHwx
 siHf9eNjF/IqE86fOZ+zkGZumwgsng6Qp35XYsLWx8n0UsC4AN79Kz1w7He9qdmBWygFxlp9shYKe
 IZsCXEysK1LKFS1ah+YSfkkg0nVSYikf4xWSjb0zPnPRvQV+eWHPzA/yFvgWj+LnGqu8=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w1CGt-0004hw-EI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:50:24 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-5ffe41e8e83so1753913137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 16:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773445817; cv=none;
 d=google.com; s=arc-20240605;
 b=cJrtHdvA1BaBM7BKC3wHwSoriRCJg9oRAxnsMvrifWk+WDyddjcefcv1uiFBW7mhVN
 DW7qav5FhBITrVgLAcyshGnC6tR8bFQeCMueaJxHSJGtn8UqIvLwiCn1Jyp327vInR65
 k/N1nhFWGT31i0cLQWL3MyXKf3RSu0KxDcQPIc2uyOgIWXALw2E0E92UnWjb2h6/71IQ
 4Ml9zz1Vj+8bXg14VCiQGAW+9mKdIzK50fT6Sc6h8TZdughUfq9i9p6ccCUIbV23YwFG
 N6ciOjYpTrI3hNRSD7d2Oor/BX1wKjOkNxVeuU4WKmUusRHPSmYBb46UXPgKQ3WtnvwN
 /bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Um2bRrXARy3mtchJw30+S/Pvn/On2DyCGDYN2PA5Xk0=;
 fh=3s9cMaSBpsoYoj92iE5JCsuS8Mu2Lc10mczmLnG49jg=;
 b=FN78BK0EfsxOTCmpyqMAwjpb2ImXmLEBIcKC208KCyeOl4ScsDKHnWiw4JMLPj8AxD
 M0li2iTYNAiqwXRTYP7b2gHk9ciKMaeeIqNSyZcANw2Ajufz4FNCGiFDZqpLNH/TarNi
 uaP8A8Xfl76tg2obUOGVDZKsgtBbNLS7+3PSUg/kYhMorZBWA4d840DOQyb5rqTmqiAI
 sEd8bTo5Df7zX+funqbBV8DZ0g6B3ojrUbGYKCuHcLi7adD3ffh4q5VgAB0H4GXdkWjk
 5957OAPpEBbaD0BUZ0BVlzrGOvUCGARGMXP7sGlXqNZDij7wTd7yRqquX+TSrpfcl357
 rMYg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773445817; x=1774050617; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um2bRrXARy3mtchJw30+S/Pvn/On2DyCGDYN2PA5Xk0=;
 b=dnu/aTWraBf7cY0R86t3IE9HMJqLus81m2eSJMjHZ/viJ6ZKpbi+J033eH0u3ee75T
 nj5V3L7xZ8KbgoqwQCBeWSPZl3cdgjvbpt8hl3qgD3GGt1tQxDc7PRgT0dv0SmGyqR9i
 8DqZLpxScgcQNsT7j4pG8K7MnwVmbpVFtoqY/I9WOnKj4+/AE4ujujgtPmKDbiqDyjkH
 f5NjjroqiGKOuddkfov8TBf7Xa57oFHLWZ9S/POpVfkWi9ZEHw05sQTd1Pl/LzaNkoGy
 fved6q5oeI4Tk/cskpnwwbjjBlk9MNYhS91WE6Z1fFVZCQPbCHjU2v1WSrF+eUZQM2gY
 yclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773445817; x=1774050617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Um2bRrXARy3mtchJw30+S/Pvn/On2DyCGDYN2PA5Xk0=;
 b=M9LW6tmg++8ekTb/afUwTsry5ijKBIicx7+AORYIoVj7tcqExGvKi6EWzzJ8ywHeTt
 YsRtkpnPmZoY3tYG2pjD8UfoxY5hPBydtqdWVCTUNJnWI4jI3czwdTQEZwSOegxsVZGi
 x6n4ZaVy8L0q2fC7KJD7XN/pSQTdPr26Om/+/okH3dbFaL/H4NLdKrJCB9rp4fMnRnka
 BdNHsTe+aWcOFELIcmu6r+wprBVxFoVlq07AaonVsAV8tMWFdT8E7WGMvwzwkdxhwB9/
 1lNEQqcv0wgkWV5UNYSRCJz5KwDZTdIFdO8mFyQsOsKWj/5As0M9fu64DyNVNRdPC7hA
 RXBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8d8LrHps45MeWFzTYgW51KkSp9MJ8zIqwm7kiu1o0x3QL4Jvs1fIXZLFrdk1lx7KbelXjAinWEHkujSLtzsAP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyY8FspDK1MDQVW2gTfhFQ5g0QjS5I5qTA67OHsGaiWPM5EPIQn
 b9qfz1EIN5WYZ3ByUpWdrK8KqVe9jaC97c1+mirtVRuyeaI704AqE8xBvDfOYg1rxcBtHAgiFdU
 GZGnpFItHfWNjzFCtKPU8HX2/zyYmwK0=
X-Gm-Gg: ATEYQzxvZqVway+gz4QsMFOw3XRRJ3uzax9tt2xXEKCiOT8MkY+wH9VIHA3XH1RQql7
 eSnK1PJKLnDaZKjENwu1hxk/hgVy9HEsY9v38jl6YUOHZr1UnzaBFGUyJh1JjjQLCGqAzrLSEmQ
 4y4gaKDsd4PUOvC6HASxBdWapyg8igy3ZHjPpqM14llriwdki6gaTMXF7YNAPN+qy1R2CNRSEg3
 MtWN9/zHUowMyY+KFuS3HsvRXfMoth4EVKhn9uR3JrysgAxDRizzQODw0urvyEcdhIC+jhsKDD1
 3DawZ/Zn7z1yntmRMcnXY+RznViK89arb6ZrxGuy8gdLo2ukmB1BTlIjUicRDKalOheEHeDE
X-Received: by 2002:a05:6102:26c7:b0:5ff:11dc:2ed7 with SMTP id
 ada2fe7eead31-6020d4d1d38mr2392732137.16.1773445817336; Fri, 13 Mar 2026
 16:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
 <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
 <2625a3fc-7dc6-4764-877c-ffeeeb42276c@kernel.org>
 <CACOAw_wJunzUqUY2CKiEDqGKNSeFF8J_e=Qj2BqRoON=dJB==A@mail.gmail.com>
 <c6a042fd-274c-4596-9538-492b07ca055e@kernel.org>
In-Reply-To: <c6a042fd-274c-4596-9538-492b07ca055e@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 13 Mar 2026 16:50:06 -0700
X-Gm-Features: AaiRm50oLJcagXwI-VskNk6GkES_LdlMcvkBmsAZ9QuLyLZBwQ4T1uX8RCV-Anc
Message-ID: <CACOAw_wMybBhQqxfoBoBwPJbqreG7Art1-_7EQh+6X3tEJK1sg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 13,
 2026 at 4:46 PM Chao Yu wrote: > > On 2026/3/14
 00:21, Daeho Jeong wrote: > > On Thu, Mar 12, 2026 at 11:49 PM Chao Yu wrote:
 > >> > >> On 3/12/2026 11:28 PM, Daeho Jeong wrote: > [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.43 listed in wl.mailspike.net]
X-Headers-End: 1w1CGt-0004hw-EI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B726828AC19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNDo0NuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTQgMDA6MjEsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMTE6NDnigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMy8xMi8yMDI2IDExOjI4IFBNLCBEYWVobyBKZW9uZyB3
cm90ZToKPiA+Pj4gT24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMjowN+KAr0FNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gMjAyNi8zLzEyIDAwOjA1LCBE
YWVobyBKZW9uZyB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIE1hciAxMSwgMjAyNiBhdCA2OjQ04oCv
QU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4gT24g
MjAyNi8zLzExIDAxOjU0LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+Pj4+Pj4+IEZyb206IERhZWhv
IEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSW4gYWdl
LWJhc2VkIHZpY3RpbSBzZWxlY3Rpb24gKEFUR0MsIEFUX1NTUiwgb3IgR0NfQ0IpLCBmMmZzX2dl
dF92aWN0aW0KPiA+Pj4+Pj4+IGNhbiBlbmNvdW50ZXIgc2VjdGlvbnMgd2l0aCB6ZXJvIHZhbGlk
IGJsb2Nrcy4gVGhpcyBzaXR1YXRpb24gb2Z0ZW4KPiA+Pj4+Pj4+IGFyaXNlcyB3aGVuIGNoZWNr
cG9pbnQgaXMgZGlzYWJsZWQgb3IgZHVlIHRvIHJhY2UgY29uZGl0aW9ucyBiZXR3ZWVuCj4gPj4+
Pj4+PiBTSVQgdXBkYXRlcyBhbmQgZGlydHkgbGlzdCBtYW5hZ2VtZW50Lgo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IEluIHN1Y2ggY2FzZXMsIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKSByZXR1cm5zIElO
VkFMSURfTVRJTUUsIHdoaWNoCj4gPj4+Pj4+PiBzdWJzZXF1ZW50bHkgdHJpZ2dlcnMgYSBmYXRh
bCBmMmZzX2J1Z19vbihzYmksIG10aW1lID09IElOVkFMSURfTVRJTUUpCj4gPj4+Pj4+PiBpbiBh
ZGRfdmljdGltX2VudHJ5KCkgb3IgZ2V0X2NiX2Nvc3QoKS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBU
aGlzIHBhdGNoIGFkZHMgYSBjaGVjayBpbiBmMmZzX2dldF92aWN0aW0ncyBzZWxlY3Rpb24gbG9v
cCB0byBza2lwCj4gPj4+Pj4+PiBzZWN0aW9ucyB3aXRoIG5vIHZhbGlkIGJsb2Nrcy4gVGhpcyBw
cmV2ZW50cyB1bm5lY2Vzc2FyeSBhZ2UKPiA+Pj4+Pj4+IGNhbGN1bGF0aW9ucyBmb3IgZW1wdHkg
c2VjdGlvbnMgYW5kIGF2b2lkcyB0aGUgYXNzb2NpYXRlZCBrZXJuZWwgcGFuaWMuCj4gPj4+Pj4+
PiBUaGlzIGNoYW5nZSBhbHNvIGFsbG93cyByZW1vdmluZyByZWR1bmRhbnQgY2hlY2tzIGluIGFk
ZF92aWN0aW1fZW50cnkoKS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVo
byBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiAg
ICAgIGZzL2YyZnMvZ2MuYyB8IDkgKysrLS0tLS0tCj4gPj4+Pj4+PiAgICAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+ID4+Pj4+Pj4gaW5kZXgg
MmUwZjY3OTQ2OTE0Li45ODFlYWM2MjlmZTkgMTAwNjQ0Cj4gPj4+Pj4+PiAtLS0gYS9mcy9mMmZz
L2djLmMKPiA+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+ID4+Pj4+Pj4gQEAgLTUyMSwxMiAr
NTIxLDYgQEAgc3RhdGljIHZvaWQgYWRkX3ZpY3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4gPj4+Pj4+PiAgICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0gU0lUX0ko
c2JpKTsKPiA+Pj4+Pj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBtdGltZSA9IDA7Cj4g
Pj4+Pj4+Pgo+ID4+Pj4+Pj4gLSAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmks
IFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4gPj4+Pj4+PiAtICAgICAgICAgICAgIGlmIChwLT5nY19t
b2RlID09IEdDX0FUICYmCj4gPj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgZ2V0X3ZhbGlk
X2Jsb2NrcyhzYmksIHNlZ25vLCB0cnVlKSA9PSAwKQo+ID4+Pj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgIHJldHVybjsKPiA+Pj4+Pj4+IC0gICAgIH0KPiA+Pj4+Pj4+IC0KPiA+Pj4+Pj4+ICAg
ICAgICAgIG10aW1lID0gZjJmc19nZXRfc2VjdGlvbl9tdGltZShzYmksIHNlZ25vKTsKPiA+Pj4+
Pj4+ICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgbXRpbWUgPT0gSU5WQUxJRF9NVElNRSk7Cj4g
Pj4+Pj4+Pgo+ID4+Pj4+Pj4gQEAgLTg4OSw2ICs4ODMsOSBAQCBpbnQgZjJmc19nZXRfdmljdGlt
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50ICpyZXN1bHQsCj4gPj4+Pj4+
PiAgICAgICAgICAgICAgICAgIGlmIChzZWNfdXNhZ2VfY2hlY2soc2JpLCBzZWNubykpCj4gPj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4+Pj4+Pj4KPiA+Pj4+
Pj4+ICsgICAgICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUp
KQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+Pj4+Pj4KPiA+
Pj4+Pj4gV2VsbCwgZm9yIGYyZnNfZ2V0X3ZpY3RpbSgsIEFUX1NTUiksIG9uY2UgdGhlcmUgYXJl
IG5vIGRpcnR5IHNlZ21lbnQsIGlmIHdlCj4gPj4+Pj4+IGRvbid0IGNvdW50IGZyZWUgc2VnbWVu
dCBhcyBjYW5kaWRhdGVzLCB0aGVuLCB3ZSBjYW4gbm90IGZpbmQgYW55IHZhbGlkIHZpY3RpbT8K
PiA+Pj4+Pgo+ID4+Pj4+IE9oLCBBVF9TU1IgbmVlZHMgdG8gc2VsZWN0IHRoZSBmcmVlIHNlY3Rp
b24gaW4gdGhpcyBjYXNlPwo+ID4+Pj4KPiA+Pj4+IEkgdGhpbmsgc28sIGZvciBleHRyZW1lIGNh
c2UuCj4gPj4KPiA+PiBPaCwgY2hlY2sgdGhlIGNvZGUgYWdhaW4sIGl0IHNlZW1zIHdlIHNlbGVj
dCB2aWN0aW0gZnJvbSBkaXJ0eSBiaXRtYXAsCj4gPj4gdGhlIHZpY3RpbSBzaG91bGQgbm90IGJl
IGEgZnJlZSBvbmUuLi4KPiA+Pgo+ID4+IEJ1dCB0aGVyZSBpcyBzb21lIGV4Y2VwdGlvbnM6Cj4g
Pj4KPiA+PiBsb2NhdGVfZGlydHlfc2VnbWVudCgpCj4gPj4KPiA+PiAgICAgICAgICBpZiAodmFs
aWRfYmxvY2tzID09IDAgJiYgKCFpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQp
IHx8Cj4gPj4gICAgICAgICAgICAgICAgICBja3B0X3ZhbGlkX2Jsb2NrcyA9PSB1c2FibGVfYmxv
Y2tzKSkgewo+ID4+ICAgICAgICAgICAgICAgICAgX19sb2NhdGVfZGlydHlfc2VnbWVudChzYmks
IHNlZ25vLCBQUkUpOwo+ID4+ICAgICAgICAgICAgICAgICAgX19yZW1vdmVfZGlydHlfc2VnbWVu
dChzYmksIHNlZ25vLCBESVJUWSk7Cj4gPj4KPiA+PiBJZiB2YWxpZF9ibG9ja3MgZXF1YWxzIHRv
IHplcm8sIGJ1dCBpZiB0aGUgY2hlY2twb2ludCBpcyBkaXNhYmxlZCBhbmQgYWxzbwo+ID4+IGNr
cHRfdmFsaWRfYmxvY2tzIGRvZXNuJ3QgZXF1YWxzIHRvIHVzYWJsZV9ibG9ja3MuIFRoZSBzZWdt
ZW50IChvciBzZWN0aW9uKQo+ID4+IHdpbGwgc3RpbGwgYmUgZGlydHkgc3RhdGUgaW4gZGlydHkg
Yml0bWFwLgo+ID4+Cj4gPj4gV2UgbmVlZCB0byBoYW5kbGUgdGhpcyBjb3JyZWN0bHkgaW4gZjJm
c19nZXRfdmljdGltKCkgY29ycmVjdGx5IGJlZm9yZSBjYWxsaW5nCj4gPj4gaW50byBhZGRfdmlj
dGltX2VudHJ5KCkgb3IgZ2V0X2djX2Nvc3QoKT8KPiA+Pgo+ID4+Cj4gPj4gICAgICAgICAgICAg
ICAgICAvKiBEb24ndCB0b3VjaCBjaGVja3BvaW50ZWQgZGF0YSAqLwo+ID4+ICAgICAgICAgICAg
ICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkp
KSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwLmFsbG9jX21vZGUgPT0gTEZT
KSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyoKPiA+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBMRlMgaXMgc2V0IHRvIGZpbmQgc291cmNlIHNl
Y3Rpb24gZHVyaW5nIEdDLgo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAq
IFRoZSB2aWN0aW0gc2hvdWxkIGhhdmUgbm8gY2hlY2twb2ludGVkIGRhdGEuCj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKGdldF9ja3B0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCB0cnVlKSkK
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsK
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAvKgo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqIFNTUiB8IEFUX1NTUiBhcmUgc2V0IHRvIGZpbmQgdGFyZ2V0IHNlZ21lbnQKPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmb3Igd3JpdGVzIHdoaWNoIGNhbiBi
ZSBmdWxsIGJ5IGNoZWNrcG9pbnRlZAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqIGFuZCBuZXdseSB3cml0dGVuIGJsb2Nrcy4KPiA+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoIWYyZnNfc2VnbWVudF9oYXNfZnJlZV9zbG90KHNiaSwgc2Vnbm8pKQo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4gPj4KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUpKQo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4+IENhbiB0aGlz
IGJlIHRoZSBmaXg/CgpUaGVuLCBJIHRoaW5rIHdlIGFncmVlIG9uIHRoaXMgY2hlY2sgaXMgZW5v
dWdoLCByaWdodD8KCj4gPgo+ID4gRGlkIHlvdSBzYXkgQVRfU1NSIGNhbiB1c2UgYSBmcmVlIHNl
Z21lbnQ/IElmIHdlIHB1dCB0aGlzIGNvbmRpdGlvbgo+ID4gaGVyZSwgQVRfU1NSIHdpbGwgbm90
IHVzZSBhIGZyZWUgc2VnbWVudCBhbnltb3JlLgo+Cj4gU29ycnksIEkgcmVtZW1iZXIgdGhlIHdy
b25nIHBsYWNlIHdlIGZhbGxiYWNrIHRvIGFsbG9jYXRlIGEgZnJlZSBzZWdtZW50LCBzZWUKPiBn
ZXRfYXRzc3Jfc2VnbWVudCgpIGJlbG93LCBpbnNpZGUgZ2V0X3Nzcl9zZWdtZW50KCkgd2Ugb25s
eSBzZWFyY2ggZGlydHkKPiBzZWdtZW50L3NlY3Rpb24sIG9uY2UgaXQgZmFpbGVkLCB3ZSBjYWxs
IG5ld19jdXJzZWcoKSB0byBmaW5kIGEgZnJlZSBvbmUuCj4KPiAzMDgzIHN0YXRpYyBpbnQgZ2V0
X2F0c3NyX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiAzMDg0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgdGFyZ2V0X3R5cGUs
IGludCBhbGxvY19tb2RlLAo+IDMwODUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBhZ2UpCj4gMzA4NiB7Cj4gMzA4NyAgICAgICAgIHN0
cnVjdCBjdXJzZWdfaW5mbyAqY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCB0eXBlKTsKPiAzMDg4ICAg
ICAgICAgaW50IHJldCA9IDA7Cj4gMzA4OQo+IDMwOTAgICAgICAgICBjdXJzZWctPnNlZ190eXBl
ID0gdGFyZ2V0X3R5cGU7Cj4gMzA5MQo+IDMwOTIgICAgICAgICBpZiAoZ2V0X3Nzcl9zZWdtZW50
KHNiaSwgdHlwZSwgYWxsb2NfbW9kZSwgYWdlKSkgewo+IDMwOTMgICAgICAgICAgICAgICAgIHN0
cnVjdCBzZWdfZW50cnkgKnNlID0gZ2V0X3NlZ19lbnRyeShzYmksIGN1cnNlZy0+bmV4dF9zZWdu
byk7Cj4gMzA5NAo+IDMwOTUgICAgICAgICAgICAgICAgIGN1cnNlZy0+c2VnX3R5cGUgPSBzZS0+
dHlwZTsKPiAzMDk2ICAgICAgICAgICAgICAgICByZXQgPSBjaGFuZ2VfY3Vyc2VnKHNiaSwgdHlw
ZSk7Cj4gMzA5NyAgICAgICAgIH0gZWxzZSB7Cj4gMzA5OCAgICAgICAgICAgICAgICAgLyogYWxs
b2NhdGUgY29sZCBzZWdtZW50IGJ5IGRlZmF1bHQgKi8KPiAzMDk5ICAgICAgICAgICAgICAgICBj
dXJzZWctPnNlZ190eXBlID0gQ1VSU0VHX0NPTERfREFUQTsKPiAzMTAwICAgICAgICAgICAgICAg
ICByZXQgPSBuZXdfY3Vyc2VnKHNiaSwgdHlwZSwgdHJ1ZSk7Cj4gMzEwMSAgICAgICAgIH0KPiAz
MTAyICAgICAgICAgc3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpOwo+IDMxMDMgICAgICAg
ICByZXR1cm4gcmV0Owo+IDMxMDQgfQo+Cj4gSUlVQywgaW4gZjJmc19nZXRfdmljdGltKCksIHdl
IHNob3VsZCBuZXZlciBleHBlY3QgdG8gZmluZCBhIGZyZWUgc2VnbWVudCBmcm9tIGRpcnR5Cj4g
Yml0bWFwLCBleGNlcHQgZm9yIHRoZSBjaGVja3BvaW50IGRpc2FibGVkIGNhc2UsIHRoYXQncyB3
aGF0IHdlIG5lZWQgdG8gZml4LCByaWdodD8KPgo+IFRoYW5rcywKPgo+ID4KPiA+Pgo+ID4+Pj4K
PiA+Pj4+PiBJIGFtIGNvbmZ1c2VkLiBXaHkgZG8gd2UgbmVlZCB0aGUgYmVsb3cgbG9naWM/Cj4g
Pj4+Pj4gTG9va3MgbGlrZSBXQSBmb3IgdGhlIEFUX1NTUiBjYXNlPwo+ID4+Pj4+Cj4gPj4+Pj4g
SW4gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpCj4gPj4+Pj4gb3V0Ogo+ID4+Pj4+ICAgICAgICAg
ICAgaWYgKHVubGlrZWx5KG10aW1lID09IElOVkFMSURfTVRJTUUpKQo+ID4+Pj4+ICAgICAgICAg
ICAgICAgICAgICBtdGltZSAtPSAxOwo+ID4+Pj4+ICAgICAgICAgICAgcmV0dXJuIG10aW1lOwo+
ID4+Pj4KPiA+Pj4+IFRoZXJlIGFyZSB0d28gY29uZGl0aW9ucywgaW4gYSBzZWN0aW9uOgo+ID4+
Pj4KPiA+Pj4+IGEpIGlmIHRoZXJlIGFyZSBubyB2YWxpZCBibG9ja3MsIGl0IHdpbGwgcmV0dXJu
IElOVkFMSURfTVRJTUUuCj4gPj4+PiBiKSBpZiB0aGVyZSBhcmUgdmFpbGQgYmxvY2tzLCBpdCB0
cmllcyB0byByZXR1cm4gbXRpbWUgd2hpY2ggaXMgY2FsY3VsYXRlZCwgYnV0Cj4gPj4+PiBpZiB1
bmx1Y2t5IHRoZSBjYWxjdWxhdGVkIG10aW1lIGlzIGVxdWFsIHRvIElOVkFMSURfTVRJTUUsIGlu
IG9yZGVyIHRvIGRpc3Rpbmd1aXNoCj4gPj4+PiBmcm9tIGNhc2UgYSksIHdlIHdpbGwgcmV0dXJu
IElOVkFMSURfTVRJTUUgLSAxIGluc3RlYWQuCj4gPj4+Cj4gPj4+IElmIHdlIGZpbmQgYSBmcmVl
IHNlZ21lbnQgYW5kIHBhc3MgaXQgdG8gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpIGZvcgo+ID4+
PiAoIV9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKSBjYXNlLgo+ID4+PiBXaGF0IGlzIHRoZSBleHBl
Y3RlZCBvdXRwdXQgb2YgaXQ/IChJTlZBTElEX01USU1FIC0gMSk/Cj4gPj4KPiA+PiBJdCBkZXBl
bmRzIG9uIHRoZSBzdGF0dXMgb2Ygc2VjdGlvbiB0aGF0IGZyZWUgc2VnbWVudCBiZWxvbmcgdG86
Cj4gPj4gSWYgdGhlcmUgaXMgbm8gdmFsaWQgYmxvY2sgaW4gdGhlIHNlY3Rpb24sIGl0IHdpbGwg
cmV0dXJuIElOVkFMSURfTVRJTUUsCj4gPj4gb3RoZXJ3aXNlIGl0IHdpbGwgcmV0dXJuIGNhbGN1
YXRlZCBtdGltZSwgb3IgSU5WQUxJRF9NVElNRSAtIDEgZm9yCj4gPj4gZXh0cmVtZSBjYXNlIHRo
YXQgbXRpbWUgaXMganVzdCB1bmx1Y2tpbHkgZXF1YWxzIHRvIElOVkFMSURfTVRJTUUuCj4gPj4K
PiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGp1c3QgYW4gdW5s
dWNreSBjYXNlLiBJcyB0aGlzIGV4cGVjdGVkIHJlc3VsdD8KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBU
aGFua3MsCj4gPj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhhbmtzLAo+
ID4+Pj4+Pgo+ID4+Pj4+Pj4gKwo+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgICAvKiBEb24ndCB0
b3VjaCBjaGVja3BvaW50ZWQgZGF0YSAqLwo+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgICBpZiAo
dW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKSkpIHsKPiA+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocC5hbGxvY19tb2RlID09IExGUykgewo+
ID4+Pj4+Pgo+ID4+Pj4KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
