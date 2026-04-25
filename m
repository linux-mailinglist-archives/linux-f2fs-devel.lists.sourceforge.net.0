Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC+tLwCM7GndZgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 11:40:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140D465BD9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 11:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Su37Zz5w2XeceAOMZp9RwHcR4wgooJrFGySfHBlPx4=; b=XQuRXWIvK+po3MereX+hFHurUW
	Go01CboaC27dyvNhO5a3orvr8afWfokAWSTXhQNw94l99dYO4F719WS7dc+/TD7CWOduX4JbYMCKA
	Se4wrM1aUL8JTJHwkTS5zS76zKG1SUIcxGvbIdJY91rCP+Te4/37fYVjqMHP2cBpIWik=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGZUb-0002c1-Ug;
	Sat, 25 Apr 2026 09:40:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <priv.luk@gmail.com>) id 1wGZUa-0002bl-6I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 09:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KnJt0R6P/EzMhVMx0yMwdeyv1R6sTasE2imvc+jbKL0=; b=dCJk5RKDi8dI1NQXDrieGlcZMM
 bG02GwaIM5wfTwsuaLCL/KlCtvO8aUj8eSbDLmrOKr2EnwzaT/8o5CFSbg95qXVAMJX/74s3mLh31
 4zUOHcSVjBoTGqyImdJBCJQ2mjWWpo1ufp2t86+lt5bfZxYnxGptU7VaBf+dAa5Hgs78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KnJt0R6P/EzMhVMx0yMwdeyv1R6sTasE2imvc+jbKL0=; b=OA07vDnzd+Y0GHhdX1JBJZTs6A
 2yb5oTqsEdFiG7UAzZpBRpnnUNfFSmT1VivZM7XDieJZNU1vkMOLYfMIfZqHvZ3ZlIX9iUsh0kijB
 zC9WrgesW9MNXqE6KWvQkRYA2uat3CTFy7uFDGbSrnhh6OL8DmQ8hejSK3v6aGQhvHG0=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wGZUa-0004Ar-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 09:40:04 +0000
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c795eacbeb0so3799172a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Apr 2026 02:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777109993; cv=none;
 d=google.com; s=arc-20240605;
 b=WEPomDE/6U6Uejl0TVMJeOvIzaXCWqwfYWG0U1AczAJo9DbFFwNRo3JidD5qQYcx5k
 Z598TC6Cg6d5fi3PGrLNMej5Wct2FOvycnzmw1jAfOS2n8GRlra3ViEX2iqYKmQg3WF0
 iLtfn2lm5ACdjqqmtP6wFaxlrzBQIpmkd2d53MRdyvK+3V4G8ZLudsZhHDqkYZe0xumC
 GTTsIhs74RdJCnVGud5u1m4u60Ke4TUoDbSjE7BgNWtsgL7K4N+ZCWyGqngtg4uhLgq7
 LumsAt65wBZwwEgBtCK7lvSW0Zqsc3dUXXjuDEVlFspUM5/JCeW5B+NpaKLqcPqGXYIj
 1iAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KnJt0R6P/EzMhVMx0yMwdeyv1R6sTasE2imvc+jbKL0=;
 fh=Z78PayH4iMX3EHwpT0WeldmKHulSQMmOfZkc3CYAL8c=;
 b=RctPQsMVh6SQ0raz1LEa8e+ZHfXldIoJPXP/920j90FsrqXKxahiHWLvZwuFoMexH7
 77w9SISF+1fMBIOT+NEeg2ldZGoVKKbajy+NzpRflR4YPJCqufKT1mQDrvPpjOFfp+ZB
 EQdvAe/AN1dTiCmsx++5FaHBPX/vm2MVPqBdM+UgUgOMolX//+6hQeTAl9cOJgrSLpy7
 ZVy5vzkBgCnyExx75l44ZX4VbRYJeOWaohx2m5Hrv2GcNhkqtwF4eDfLzQkTV4mgHnqd
 nYqErinM8KtzZVz4EDBEp6izHKCXHxflAeAH1bpTs2Upn4yBAIHIiWf/pqWUKKrch3ue
 JfPQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777109993; x=1777714793; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnJt0R6P/EzMhVMx0yMwdeyv1R6sTasE2imvc+jbKL0=;
 b=jlq/azxBjQt7ExfZCHil3C+VkjYU7sAH1I1Aoj1po6ZfMLpXoUE1aV5Czl1YZHm5uO
 f+R0G2fp3/yuQZMeYPlGW/nG9VM2qF6H8z+Brs2xErhffe5t/w5M6f7pn+chQHmytyFy
 Y3ZdYFzw1/doOXl5N4rtgcw5aYRGRlcm/nSDG0cO2O6K7tMZR18606RZYiL2rC+r/var
 vzQSbYIyirJp0YrBTAdgakj65QLVBlBdxtXrjdKNVwAFSzHd/TcHrYplL7NJP8NMylsm
 /dsupgcma3cuG+snb6OPHd3370jTaHhiHl1LlTJ5HJ2aBgaa/yS3BOncEefTJQLaoFhw
 lebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777109993; x=1777714793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KnJt0R6P/EzMhVMx0yMwdeyv1R6sTasE2imvc+jbKL0=;
 b=R2X2P0sVl5fkFA4IrzVOofwtCahDJbgi2fyNijjghytxyeFCWwPU4xr2wQ5GtzCN7r
 6hGr2uCMKRc/2v2RG6BqLiLCXms63sKjNRz5NvXmSEmZqV6knKQ25dE7VJ+UVjRP1NdJ
 gGp7DgbBAg6Mr3MPBnhvl/gafPbSUFETssLkcDk0dl5BsXC6aM1LweC49VFzam7/z6Pg
 QtNWyy2a2wqI4Wm0wJQBskXCBKvN85Iin0RHzToY08VsWVizAuJvBID93xRpwJASdHJ7
 6vSuh1WLVIOuLGghao9cUUv7GfbVNrgPLyKjoOBhyIsw8Bx2YUoiecztELnlZ4N3fgH8
 bbrA==
X-Gm-Message-State: AOJu0Yzt8pbg2xxn4QEnr/0Ctpztduq0YWTLenPoEa3t2uzTsRal6rX6
 YQNEnDT11ZWOAz6MmUYGxNvclsPoxkKB6QCTRnemX79T0eDxgjzkgDwUjaioCglEFSGY4xx12Zq
 Mj5P66d7K74JsC7iOL/UxPpEjIFnaWoYeJw==
X-Gm-Gg: AeBDiesoAcCK4aQVJ4Pt7pVqs9JjK0Ef/01DD9uV3xMm3VwOBhCJU7NYHNuxPqUAhqP
 SccAoOM8vd2Dxh8AS/lySv1m+OmwaSYRSG6zZViQ9nYs05BmzNp8Unj3xz54N0q7QbAQU+dlu3j
 07jYLDv/r4ggFO5muog45WfWMrLsiyyfKH1bVo2CSOMcka5fGgIH56D2DA2REgW/d0F+67BvXdt
 W1ENotMWLzXtQfCjEbBvEq3nXDeCwJeinsQ/sUGnWItr62U3QMtoF1/ln8BHj3klb2e/YkUezwE
 89eb3HzYlWcVZsn0QPuIeGbKhy3O
X-Received: by 2002:a17:902:bd8c:b0:2b2:50f6:cdd9 with SMTP id
 d9443c01a7336-2b5f9ecb818mr237904805ad.8.1777109993483; Sat, 25 Apr 2026
 02:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260313130915.1752881-1-priv.luk@gmail.com>
In-Reply-To: <20260313130915.1752881-1-priv.luk@gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>
Date: Sat, 25 Apr 2026 11:39:41 +0200
X-Gm-Features: AQROBzD396b-Miur0j8-4tkIJ7S__4egkVyBr9ZcKVdUcwxqwGEozwSynlbbD8w
Message-ID: <CAJmEJMxG3TB6zzxoXfXPZWxBsEek_0GQFk+1D+artoEh95ZCpQ@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ping On Fri, Mar 13, 2026 at 2:09 PM LuK1337 wrote: > > From:
    Łukasz Patron > > Fixes: a66d49fd2678 ("dump.f2fs: Dump symlinks as symlinks")
    > Signed-off-by: Łukasz Patron > --- > fsck/dump.c | 4 + [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [priv.luk(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.215.171 listed in wl.mailspike.net]
X-Headers-End: 1wGZUa-0004Ar-Hw
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: macOS does not support lsetxattr
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1140D465BD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[privluk@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,mail.gmail.com:mid]

cGluZwoKT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMjowOeKAr1BNIEx1SzEzMzcgPHByaXYubHVr
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiDFgXVrYXN6IFBhdHJvbiA8cHJpdi5sdWtAZ21h
aWwuY29tPgo+Cj4gRml4ZXM6IGE2NmQ0OWZkMjY3OCAoImR1bXAuZjJmczogRHVtcCBzeW1saW5r
cyBhcyBzeW1saW5rcyIpCj4gU2lnbmVkLW9mZi1ieTogxYF1a2FzeiBQYXRyb24gPHByaXYubHVr
QGdtYWlsLmNvbT4KPiAtLS0KPiAgZnNjay9kdW1wLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mc2Nr
L2R1bXAuYyBiL2ZzY2svZHVtcC5jCj4gaW5kZXggZjVjOTVkZS4uN2QyMDI3NSAxMDA2NDQKPiAt
LS0gYS9mc2NrL2R1bXAuYwo+ICsrKyBiL2ZzY2svZHVtcC5jCj4gQEAgLTQ2NCw5ICs0NjQsOSBA
QCBzdGF0aWMgdm9pZCBkdW1wX3hhdHRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0
IGYyZnNfbm9kZSAqbm9kZV9ibGssIGludAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDAsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhBVFRSX0NSRUFURSk7Cj4gICAgICAgICAg
ICAgICAgIH0gaWYgKFNfSVNMTksodHlwZSkgJiYgYy5wcmVzZXJ2ZV9zeW1saW5rcykgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGxzZXR4YXR0cihjLmR1bXBfc3ltbGluaywgeGF0
dHJfbmFtZSwgdmFsdWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gc2V0eGF0dHIo
Yy5kdW1wX3N5bWxpbmssIHhhdHRyX25hbWUsIHZhbHVlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDAsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhBVFRSX0NSRUFURSk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhBVFRSX0NSRUFURSB8IFhB
VFRSX05PRk9MTE9XKTsKPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBmc2V0eGF0dHIoYy5kdW1wX2ZkLCB4YXR0cl9uYW1lLCB2YWx1ZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUxNl90b19jcHUoZW50
LT5lX3ZhbHVlX3NpemUpLCAwLAo+IC0tCj4gMi41My4wCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
