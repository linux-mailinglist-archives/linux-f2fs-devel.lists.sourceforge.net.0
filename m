Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6pYnB2DDM2quFwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 12:07:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7669F196
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 12:07:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=JHRyC2x3;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ImFVhBLh;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=h9mZQwR8;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=aRAZ3gfb;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAZkX9Bew9DTpn3SN3sElplmCozJG6JwZnS9/GqbIXM=; b=JHRyC2x3dmynthgDjkI+TU31VT
	f/feqYxvmFihhTtvrYrDZnMBODKeCEBQVxJ916VLNd8glA7L//04YnS8W+8GjUO5wGf/LCZqOLKMR
	w9VxuNkZ07HOgL3c1AuMDDyrnxiA0RKRoRQ00Q1OdbIvJjmvL2pVTUV/JKDbITxLPq9s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wa9ec-0001Jt-Sn;
	Thu, 18 Jun 2026 10:07:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wa9eZ-0001Jm-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 10:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3tQM4YZOU4ZmVyeRxXliIy04zyVWMpCicoAHdMKaq0=; b=ImFVhBLhNAb5PG0FKm89wi9AqF
 D+/4P/yWHTK3L8y4zCk89Q0Q7LaMfWpbWETCXwliNWnEnq7dgnNs5kcS3Rfiq1dnsCQ+Vo4rV85tY
 l0yA+SIVlGz7cnlezU2LEMKmmV03x0kQWeXVMOiLoHmKfnJ5iljNUjFruQPjGvz9BLnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b3tQM4YZOU4ZmVyeRxXliIy04zyVWMpCicoAHdMKaq0=; b=h9mZQwR803VHDUPSTDgvKb0t5T
 H6t0WBPdNR5+V7B6U24QlHbx2iJh+s/Q9Z3006w8+C6F8h5aJ8NZ5H1YpQEnZw7YLo4Zj1Og7D2/6
 YCzd4RIf8v2GW64G/vsfMsLRJcKcbNskLcPze+7yP3pGNvlNwuiXiqeMFr5bkXJZ69+4=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wa9eX-0004z0-PW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 10:07:19 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so839055e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2026 03:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777226; cv=none;
 d=google.com; s=arc-20240605;
 b=ASApyyFffjquT29Wz5d+LaGO9fQEYduCQTLVPO1WyldupytT5RtbpmnAq7hXZbZvs8
 gDkJtsu5MpRNefu/jyDR286Qc1mnxj+x9b3KvTetIbBxougiutUVT2s6zbQmZdHEI7Z+
 yWFtGOLcXvLS0uo9KTYwdGk56JAVAYGSKio7f5UVdWBThMorGlWYuGXKToM2VilLCb84
 EJkby16QAWHEtqJewIkB2ZTZGbxq+3uLQSDUNvrNwa5zMvwqfa+Z3N6ugE51dJUYkzJP
 areVJ43UZNiTpY2gS1m7vud50WzB29kY4mPEnXFRUvvvSCRPhSk3xKLTy/EJ8S0mot5X
 EdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=b3tQM4YZOU4ZmVyeRxXliIy04zyVWMpCicoAHdMKaq0=;
 fh=gmLgkntjKxVWSxcBbpnbr6/by6XdW0nM/zfxypGvFbg=;
 b=AihWPndC9M+tUvt0f2mpBWwA70FNEaWwPTjgh6T2xKcRSHwd4sSiF0ExsHA2GMuqFB
 FaVQTMX1JXX5Vt5UYtGLm3hRLVW0fqCyqCHM9ZzcDtBd/3bhsXaAe39ans2Z9tQBBha1
 Pf5FqwDRhItc2fyqLrqQNrBFTAP5Qm6X/1a0KfPCjvU44sg5ZkmrjyKICoxXAveK3q7K
 I2yxY+D6a0y7QuUpUJ0JrKGT7WYy6m0DhTJwv32ZXPkY+gE8Zo5McF/OtnaYk0uyTbIT
 OiAm3JuSVECBthbgK+yL/pIQVso35toy4pfJcvbYQb8/ceRc56aoTDUVXXOX0fPE7TiW
 2baw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781777226; x=1782382026; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3tQM4YZOU4ZmVyeRxXliIy04zyVWMpCicoAHdMKaq0=;
 b=aRAZ3gfbxRo7cTkoDTTIIv8iVoeoxeNN53mcotfX1ufc5twM6VxxYULF1IPeJsXYXF
 9w+LPyOiueOXC4WxyYVkcK9/Vj924Y9Ii0mJc6JicuarI4h6pMk/tXMZVfMVvxbtl/VO
 ngtwz4t2hJy0dfZ6ETN/jhLnCcxoyQZiyOs2Off13uFu+oHILR6pWT+KCsGv5rFj+cyu
 KrIYuWtrB2ivuWN12wHGtt7NSxc6fcFpHVco9F7LUrUwzWdZS2C32DqKy4pNHDXeh+Fw
 Ch0oXD/tl5FWz2KpA2qy1Ueq26z1ztyMHg4nWSQE23OeROr+3o74o6dDJkOu69a1Xhx9
 fwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781777226; x=1782382026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b3tQM4YZOU4ZmVyeRxXliIy04zyVWMpCicoAHdMKaq0=;
 b=XND4imEn7NTY+WpOt3IP6LSD6uWA0qYUgAgGiItzCqI0dhkNOXjT/+VGXRpxzUSnuI
 fOxVC8t4oX9YrOPz3hYGWApYLvgommMy62xpQSDHFGj3sWYcrQo01d+AM3vrzgDhOzjm
 VpckT5EpRvgB3zPCh8AHf1UJW2/MQrfX8v+IJHkaFgozHltg2fnNilgMy5PtCw1dd8cu
 sPuo90s8V3JwGm3K6IyXsHn8Sg0hThff7t3AKvu5vA3AO6xEr9mB+7vJ3rp/Woa3nBCm
 4zg+4+vmIQTqYRLAieHNxQjPVTCvojGdiqddUhEHK0bITTvtCQWT33P0n0b+LviQVg7i
 8i0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8f5wd/YdXnAVzfzk4mJqLlCDCQx6plUk0SB8U1Sq11+sweSh3byaDVv6+rAKQVVQ5cAtuW/kb/gMMPvr5c2n5K@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxkdSxbW/7YJ3yoTEKEP5cinW+Ylsn9E9EeYlPEh7Z7fHuwJJF4
 6rKyr0DpVxvrJIWdX4mY8fpm/Ey81lrs5EpPTxhK5J0FsClbM5fPvYgx6v090uPzbJygBlc4Blf
 JD38h5fqIewYnNLNTK95E1D9hnC1VYAc=
X-Gm-Gg: AfdE7clkpNCHQeOt2wmMpVRXi4Rbkfjq21oW/JlszGQtvzUGqYj2vdzeSmJsg1pIrX1
 SBnOd0qaMhbNa6VJmr4w+VnahwXRB5xLFnE7+3LWbCobieJgbATSHX9p2UwrkIBYLzhqdaDpaRR
 nAzygp/sGIDxiaRfokuKPGvm+dg3NQ8JSYMIEonjio3NfZywjyh9x46W7FRazI7ICOg4c2Pen9C
 wN9GsjnngNEfjidcECYgnKIkGxGlCUZTFR9V2ofEfMU4vXI2UreCYm7Vn6SH/Y7BzLKBz3E2g==
X-Received: by 2002:ac2:4bd2:0:b0:5ad:4840:fbab with SMTP id
 2adb3069b0e04-5ad50ec7d27mr538117e87.41.1781777226239; Thu, 18 Jun 2026
 03:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260616135637.1439319-1-qiwenjie@xiaomi.com>
 <ajLi3nLqyS31Y6J4@google.com>
 <CAGFpFsRfSsBjuhGmXC8_NohcPFEAZncWKFnmbazo5EhrNqCM-A@mail.gmail.com>
 <0d161878-6602-4bbb-b1db-754f4a37a011@kernel.org>
In-Reply-To: <0d161878-6602-4bbb-b1db-754f4a37a011@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Thu, 18 Jun 2026 18:06:54 +0800
X-Gm-Features: AVVi8CdIYSWPCV4zbTbrh8InJy9-CYEOx6N8eLPWgnHONLZmhfuqM3wGmOWr1FE
Message-ID: <CAGFpFsR9DDYXvad-Q7+ZinqQRPb5KKGP2xTm2a6HbdcrJY+b_g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yes. I described the race with a calltrace-style timeline
 in v7. The code is unchanged from v6. On Thu, Jun 18, 2026 at 5:10 PM Chao
 Yu wrote: > > On 6/18/26 11:38, Wenjie Qi wrote: > > The race is between
 dec_page_count() and the later get_pages() check: > > another CP-data
 writeback can be s [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
X-Headers-End: 1wa9eX-0004z0-PW
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: use post-decrement count for
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
Cc: geoo115@gmail.com, yangyongpeng@xiaomi.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:geoo115@gmail.com,m:yangyongpeng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net,kernel.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,xiaomi.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63D7669F196

WWVzLiBJIGRlc2NyaWJlZCB0aGUgcmFjZSB3aXRoIGEgY2FsbHRyYWNlLXN0eWxlIHRpbWVsaW5l
IGluIHY3LiBUaGUKY29kZSBpcwogIHVuY2hhbmdlZCBmcm9tIHY2LgoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI2MDYxODEwMDUwMy4yNjAxNzkwLTEtcWl3ZW5q
aWVAeGlhb21pLmNvbS9ULyN1CgpPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCA1OjEw4oCvUE0gQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDYvMTgvMjYgMTE6MzgsIFdlbmpp
ZSBRaSB3cm90ZToKPiA+ICAgIFRoZSByYWNlIGlzIGJldHdlZW4gZGVjX3BhZ2VfY291bnQoKSBh
bmQgdGhlIGxhdGVyIGdldF9wYWdlcygpIGNoZWNrOgo+ID4gICAgYW5vdGhlciBDUC1kYXRhIHdy
aXRlYmFjayBjYW4gYmUgc3VibWl0dGVkIGFmdGVyIHRoZSBjb3VudGVyIHJlYWNoZXMgemVybwo+
ID4gICAgYnV0IGJlZm9yZSBnZXRfcGFnZXMoKSBvYnNlcnZlcyBpdCwgc28gdGhlIHplcm8gdHJh
bnNpdGlvbiBtYXkgbWlzcyB0aGUKPiA+ICAgIGNwX3dhaXQgd2FrZXVwLgo+Cj4gQ2FuIHlvdSBk
ZXNjcmliZSByYWNlIGNvbmRpdGlvbiBsaWtlIGJlbG93IGNhbGx0cmFjZT8gd2hpY2ggd2lsbCBi
ZSBlYXNpZXIgdG8KPiB1bmRlcnN0YW5kPwo+Cj4gICAgICBsb29wIGRldmljZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW1vdW50Cj4gICAgICAtIHdvcmtlcl90aHJlYWQKPiAgICAgICAt
IGxvb3BfcHJvY2Vzc193b3JrCj4gICAgICAgIC0gZG9fcmVxX2ZpbGViYWNrZWQKPiAgICAgICAg
IC0gbG9fcndfYWlvCj4gICAgICAgICAgLSBsb19yd19haW9fY29tcGxldGUKPiAgICAgICAgICAg
LSBibGtfbXFfZW5kX3JlcXVlc3QKPiAgICAgICAgICAgIC0gYmxrX3VwZGF0ZV9yZXF1ZXN0Cj4g
ICAgICAgICAgICAgLSBmMmZzX3dyaXRlX2VuZF9pbwo+ICAgICAgICAgICAgICAtIGRlY19wYWdl
X2NvdW50Cj4gICAgICAgICAgICAgIC0gZm9saW9fZW5kX3dyaXRlYmFjawo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0ga2lsbF9mMmZzX3N1cGVyCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0ga2lsbF9ibG9ja19z
dXBlcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBm
MmZzX3B1dF9zdXBlcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA6IGZyZWUoc2JpKQo+ICAgICAgICAgICAgIDogZ2V0X3BhZ2VzKCwgRjJGU19XQl9DUF9E
QVRBKQo+ICAgICAgICAgICAgICAgYWNjZXNzZWQgc2JpIHdoaWNoIGlzIGZyZWVkCj4KPiBUaGFu
a3MsCj4KPiA+Cj4gPiAgICB2NiBhbHNvIGFkZHMgZGVjX3BhZ2VfY291bnRfcmV0dXJuKCkgYW5k
IHVzZXMgaXQgaW5zdGVhZCBvZiBhY2Nlc3NpbmcKPiA+ICAgIG5yX3BhZ2VzIGRpcmVjdGx5LiAg
VGhlIHdha2V1cCBsb2dpYyBpcyB1bmNoYW5nZWQgZnJvbSB2NS4KPiA+Cj4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjYwNjE4MDMxMDA4LjI0NDcyNzktMS1x
aXdlbmppZUB4aWFvbWkuY29tL1QvI3UKPiA+Cj4gPiBPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCAy
OjA54oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+
PiBPbiAwNi8xNiwgV2VuamllIFFpIHdyb3RlOgo+ID4+PiBmMmZzX3dyaXRlX2VuZF9pbygpIGRl
Y3JlbWVudHMgdGhlIHdyaXRlYmFjayBwYWdlIGNvdW50ZXIgYW5kIHRoZW4KPiA+Pj4gcmVhZHMg
aXQgYWdhaW4gd2l0aCBnZXRfcGFnZXMoKSB0byBkZWNpZGUgd2hldGhlciB0aGUgbGFzdAo+ID4+
PiBGMkZTX1dCX0NQX0RBVEEgY29tcGxldGlvbiBzaG91bGQgd2FrZSBjcF93YWl0Lgo+ID4+Pgo+
ID4+PiBVc2UgYXRvbWljX2RlY19yZXR1cm4oKSBmb3IgRjJGU19XQl9DUF9EQVRBIGNvbXBsZXRp
b25zIHNvIHRoZSB3YWtldXAKPiA+Pj4gZGVjaXNpb24gaXMgbWFkZSBmcm9tIHRoZSB2YWx1ZSBw
cm9kdWNlZCBieSB0aGUgZGVjcmVtZW50IGl0c2VsZi4gS2VlcAo+ID4+PiB0aGUgZXhpc3Rpbmcg
ZGVjX3BhZ2VfY291bnQoKSBwYXRoIGZvciBvdGhlciB3cml0ZWJhY2sgY291bnRlcnMuCj4gPj4K
PiA+PiBJcyB0aGVyZSBhIHJhY2UgY29uZGl0aW9uIHRvIGRvIHRoaXM/IElmIHNvLCBjYW4geW91
IGRlc2NyaWJlPyBBbmQsIEkgdGhpbmsKPiA+PiB3ZSBuZWVkIGEgd3JhcHBlciBmdW5jdGlvbiBp
bnN0ZWFkIG9mIGNhbGxpbmcgbnJfcGFnZXMgZGlyZWN0bHkuCj4gPj4KPiA+Pj4KPiA+Pj4gRml4
ZXM6IGUyMzQwODg3NThmYyAoImYyZnM6IGF2b2lkIHdhaXQgaWYgSU8gZW5kIHVwIHdoZW4gZG9f
Y2hlY2twb2ludCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIikKPiA+Pj4gRml4ZXM6IGNlMjczOWU0
ODJiYyAoImYyZnM6IGZpeCB0byBhdm9pZCBVQUYgaW4gZjJmc193cml0ZV9lbmRfaW8oKSIpCj4g
Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmpp
ZSBRaSA8cWl3ZW5qaWVAeGlhb21pLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgZnMvZjJmcy9kYXRh
LmMgfCAxMiArKysrKysrLS0tLS0KPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+PiBpbmRleCBkODNhMjE5OThlYzIuLjU4ZDIzZWI3NGVj
MiAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+Pj4gKysrIGIvZnMvZjJmcy9k
YXRhLmMKPiA+Pj4gQEAgLTM5MiwxNSArMzkyLDE3IEBAIHN0YXRpYyB2b2lkIGYyZnNfd3JpdGVf
ZW5kX2lvKHN0cnVjdCBiaW8gKmJpbykKPiA+Pj4gICAgICAgICAgICAgICAgaWYgKGYyZnNfaW5f
d2FybV9ub2RlX2xpc3QoZm9saW8pKQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNf
ZGVsX2ZzeW5jX25vZGVfZW50cnkoc2JpLCBmb2xpbyk7Cj4gPj4+Cj4gPj4+IC0gICAgICAgICAg
ICAgZGVjX3BhZ2VfY291bnQoc2JpLCB0eXBlKTsKPiA+Pj4gLQo+ID4+PiAgICAgICAgICAgICAg
ICAvKgo+ID4+PiAgICAgICAgICAgICAgICAgKiB3ZSBzaG91bGQgYWNjZXNzIHNiaSBiZWZvcmUg
Zm9saW9fZW5kX3dyaXRlYmFjaygpIHRvCj4gPj4+ICAgICAgICAgICAgICAgICAqIGF2b2lkIHJh
Y2luZyB3LyBraWxsX2YyZnNfc3VwZXIoKQo+ID4+PiAgICAgICAgICAgICAgICAgKi8KPiA+Pj4g
LSAgICAgICAgICAgICBpZiAodHlwZSA9PSBGMkZTX1dCX0NQX0RBVEEgJiYgIWdldF9wYWdlcyhz
YmksIHR5cGUpICYmCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdxX2hhc19z
bGVlcGVyKCZzYmktPmNwX3dhaXQpKQo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgd2FrZV91
cCgmc2JpLT5jcF93YWl0KTsKPiA+Pj4gKyAgICAgICAgICAgICBpZiAodHlwZSA9PSBGMkZTX1dC
X0NQX0RBVEEpIHsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghYXRvbWljX2RlY19y
ZXR1cm4oJnNiaS0+bnJfcGFnZXNbdHlwZV0pICYmCj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgd3FfaGFzX3NsZWVwZXIoJnNiaS0+Y3Bfd2FpdCkpCj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHdha2VfdXAoJnNiaS0+Y3Bfd2FpdCk7Cj4gPj4+ICsgICAgICAgICAg
ICAgfSBlbHNlIHsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGRlY19wYWdlX2NvdW50KHNi
aSwgdHlwZSk7Cj4gPj4+ICsgICAgICAgICAgICAgfQo+ID4+Pgo+ID4+PiAgICAgICAgICAgICAg
ICBmb2xpb19jbGVhcl9mMmZzX2djaW5nKGZvbGlvKTsKPiA+Pj4gICAgICAgICAgICAgICAgZm9s
aW9fZW5kX3dyaXRlYmFjayhmb2xpbyk7Cj4gPj4+Cj4gPj4+IGJhc2UtY29tbWl0OiBjMGI2NWY2
MTI5YzdmYmI1MjZlOTIxZGQ2MDI2MTY1MGYxYjJiZWY5Cj4gPj4+IC0tCj4gPj4+IDIuNDMuMAo+
ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
