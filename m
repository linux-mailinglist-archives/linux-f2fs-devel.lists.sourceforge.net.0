Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G+i0KQgqOmqR3AcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 08:39:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 024BE6B4981
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 08:39:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=iU2NDDz9;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=GSUEdIzb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FoPwYVL1;
	dkim=fail ("body hash did not verify") header.d=google.com header.s=20251104 header.b=Ho8qbdqm;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UrRwq79MbGoG6FeEU/HJSkVBuUI/mlI5trKDgsURQk=; b=iU2NDDz9RksAwCMEyAjVtsqxQb
	Jn1JanOBcRcGyNx24nPsZjZT5gQprMEJSdtZ8VFFyCw6zN52dIDRyfZNSZP5kPeK1sQSclMENPn4K
	EQY4VMQEKpWDjkgVVy6FPoqgOoD0W07nOBl7N9dt4lJYi8rir+25iOtICODGCDr40q3I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbumc-0000wT-Ik;
	Tue, 23 Jun 2026 06:38:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1wbumZ-0000ps-FV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 06:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s25Etaqy8yUiDfcD/I08tYW1cBdv0P/5qjkbyFXzuWg=; b=GSUEdIzbSTtFMVsboKeL3Dc86D
 lOrTFGK6PzpE40VA5dRp53+3OQewJOwXNfrxh4kJQua+54YxBHfYpFAG4TSolXm+cAhybekmLFU0N
 jgQlRdhzJ8UGpa3FzLuoJ6tagRAcC7SolQi7GB94yWFcUiYtHu9Tupb37ntLQVgDXYPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s25Etaqy8yUiDfcD/I08tYW1cBdv0P/5qjkbyFXzuWg=; b=FoPwYVL1i3SchbXjg/fILU9BLa
 /bTyZX9BE1EGqAsB5qp/jYSB6eyHkxavcTe7gKTZ5LuxYZitMS4/x2jhe0lBK6i6qtnlfqKTGguYI
 daq0VcFJ1i5CUsBdYh7MLgBC4YfzvhTmkdGrCyPfNIe9jGCmbTcXKfoEQCPQVMSEMRzA=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbumV-00053F-4R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 06:38:48 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-69565156c06so7850a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 23:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782196721; cv=none;
 d=google.com; s=arc-20260327;
 b=C5M6723A4RzJeYFfLOFrnRXwwRZfMQkbM82vWmLUI7IVE9Fo/xhS4Li4LQPqh4ZMRq
 GZFy6mLjZTtFst6XJao2yFwwnEUYtHhZ+SAzdg9hfcWqcpB6odcTKHGXnNNfWUoxLzlC
 3gxdepP4v3SCKqS+bGsTUv2NU9Vr1oPfbpXU+KYjMCLoFZt1zrRBaoL4Rfhpeg9R/eB8
 3N4Bl/q9iORk5nPQwsatKMhdTqI3gPVvgl6z/76iE+wy/ezVBzXn6LjaoNl06ULy7QTN
 YzjtuntxNTkJ9c+YHMIO3lhsqZfF2t7mRE22WrGBf1Zv+A6HXs0qTAqcj7vkPNLPAENK
 PtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=s25Etaqy8yUiDfcD/I08tYW1cBdv0P/5qjkbyFXzuWg=;
 fh=LiwJ16Pnt9ohwhZz7s8Rp9mEjMnGW6ICaty7dkE8yds=;
 b=ihHI7cqRrSLYvPbcdYEVmJLC4EtPY+fL3Agd7qQ+97Gymh0USHIvdXod1Ru8kI8yE8
 9TTLmbYi+jJKl0v1s4P9aUHjDnp1pJJwn0ToVgdwliuYWk5j9SDDNt10bJvhPTpYWuDw
 +a3MqlLiq78+dsoG56OWYBPruFcOptiET53oO/t25g52QM2iJUDHU0ua2bY4ujcCmiYB
 uTOHxTmQ/JVa6eULgTgl1cszWDMujsaxSHTalVb9utgE14idBgYZVPckFLIsXigfqoZP
 wPVXUJsohplWncXJijAHAgg4l4AYkYm4RTyUMOQi2aThMvZdFNvAP1miumRx9Ucu3Nj4
 EZfw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782196721; x=1782801521;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s25Etaqy8yUiDfcD/I08tYW1cBdv0P/5qjkbyFXzuWg=;
 b=Ho8qbdqmKL4AONlhpIjnWZPUNPfbo20z7WtNmxsS757hamnZBu7ov8u+YT8WpDhFrK
 nm0U2zaRL3A7qZoyEyX1yaaQnYIYAKOSu90hQMY4PfzleGKdz1QnQjjkSTWAIgdmeh+n
 F5yR8BeaBKTnRleDW/mSH8uOUltCbtGbGZkWhrfZ8fo6i1781SpzoSJLxdBAHjtGCIRT
 l/Ng8dFq2oKtzqD1uWi3go3TXnxAuI+c/g1rurA3lXo3YSkGIEh7VVZLux4vXICESarq
 Ma8cXP4GKW+WN76/F/AkvhOV9w3ukKGKJDHb65imD6w+gLgHFfnCZryCh+bzZFT/BVZP
 Y1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782196721; x=1782801521;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=s25Etaqy8yUiDfcD/I08tYW1cBdv0P/5qjkbyFXzuWg=;
 b=i7/w8rpTkz7zzBl04M7SVxK7HdE2LZgvSU7wXWq0c2CWoxMJDYcuHRgVmVG5lTVQu8
 vL9He3jjZvF9ERlWq/EfN/RoV13Yezzv3lafyd6j3Oi2uyTIgSAQOzkjTR0LmRhW21bl
 TCpWuv8pS950vIrGPA7hdJX0hFpgKol1id2FTkVkl2RzcoSNkyEsN1g0G/6aFp+xJ6P6
 OCf/ezEtItthn+Xf+4j53+Dn+7aOn7n6PenehPLmbyAbp3AtiAXYTTAsSRXKwIDPnQNT
 NL2ickX5az95rj93v2iXo+Ib8VvkM3lTo7eWX1KTl5WEQClI/bumaE2HitO8qvDG0oaa
 CjwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ctonBIplhHRb6heMFjt3uTK7BnmvpeatnX0PD/+wPFKlFI6Lqc7tZAOeYAWfCfiXs35SeVy1jKqd7F8nSFuXa@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzJvkmkvoIPl1RQSBrwYxhNg72S6S2tCmFK43bUmKZDZHCXDEhc
 X4GyAsxY/OcCixqq9+yil/S+jY90TvGe9wr77UV9J4e6yoGARmPqXaWsdfClAxlDrvq6indG35m
 Ey7HtEgp7PnjkToJHknYgpDlibFul4bAxW9hiifgeBic4rN10fEL6vyP6qHo=
X-Gm-Gg: AfdE7ckKwmDByqgCAPJN2oF+vrHAF8owCEsbqwIXU654WCbp11N2z0l66Dpq6ol/tbq
 PVd/XIgZMrc02QIYsQqvGHmUmMsy5WY0pNPy5CjO3iP2VMIVMytu/iJe1+pkRa+xzR1V/h1XiVr
 UbHCWB8u/9bU6d97oX3HFy9bEWdFwZMyaj/77X6MUxF9QfJmG0Rc3oMQO9dB3lijMPj8mcjRbgO
 jQStXmk3nA5yc7HsHtJG7bS1a4lrVjG1OZF7ycv2klo5crn00GHHvzaOOmdefBz875zQkkv+/nn
 eP7OcFjUjnVoRkKOenZdmqA7mQ==
X-Received: by 2002:a05:6402:2038:b0:697:7f69:48e3 with SMTP id
 4fb4d7f45d1cf-697d4ba4c97mr29966a12.10.1782195071761; Mon, 22 Jun 2026
 23:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260623032701.173516-1-joannechien@google.com>
 <e0b1476a-6b51-465d-bdbf-29c37f63ceb8@kernel.org>
In-Reply-To: <e0b1476a-6b51-465d-bdbf-29c37f63ceb8@kernel.org>
Date: Tue, 23 Jun 2026 14:10:55 +0800
X-Gm-Features: AVVi8CcwghkXbPaR3G5jthHT70zOzbP8BeV2_XjDIgjSmi_X-9jV3gbxnE8sPjQ
Message-ID: <CACQK4XBfg4s3WdTjyQ8Q_GnzFuDxvb328FKbcNxbQYb4wTFsbQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 23, 2026 at 11:36 AM Chao Yu <chao@kernel.org>
 wrote: > On 6/23/26 11:27, Joanne Chang wrote: > Needs a Fixes line and Cc
 stable. > > > Signed-off-by: Joanne Chang <joannechien@google.com> [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
X-Headers-End: 1wbumV-00053F-4R
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: dirty directory inodes on
 mtime/ctime update
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[joannechien@google.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 024BE6B4981

T24gVHVlLCBKdW4gMjMsIDIwMjYgYXQgMTE6MzbigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+IE9uIDYvMjMvMjYgMTE6MjcsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiBOZWVk
cyBhIEZpeGVzIGxpbmUgYW5kIENjIHN0YWJsZS4KPgo+ID4gU2lnbmVkLW9mZi1ieTogSm9hbm5l
IENoYW5nIDxqb2FubmVjaGllbkBnb29nbGUuY29tPgo+Cj4gQW55d2F5IHRoZSBjb2RlIHBhcnQg
bG9va3MgZ29vZCB0byBtZS4KPgo+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4KPiBUaGFua3MsCgpUaGFuayB5b3UgZm9yIHJldmlld2luZy4gSSB3aWxsIHNlbmQgdjIg
d2l0aCB0aGUgdGFncy4KCkJlc3QgcmVnYXJkcywKSm9hbm5lCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
