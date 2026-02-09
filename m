Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FqsOu12iWlm9gQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 06:55:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136110BE8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Feb 2026 06:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw7AnKxq5dgE5KjERAM4UrsRF1carfmx6Q1U+326I9M=; b=SPCFP718Ud7ZRytqfyT9M75PcS
	nuQXHLp3fZzJqyoPW+qDGldWnroK3UJkAcZ2vxW3ZdHxhEdHdNSSoOxNUZS+i4bPSQ8GQ/kYyaMAK
	RtaCiyKoBlnsE6UQGFbHXZrNKzjFKRKFxtVFfkq/Oi86CklwB7jOmBxfdOE6ODNTX6oY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpKFP-0000Gt-Fh;
	Mon, 09 Feb 2026 05:55:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1vpKFO-0000Gk-64
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 05:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T+QOvhsB6nnh3rBb/EQNR/3iQSifJMKBxkesTJz9bMg=; b=e8rW0sDbB2GP+SmZCxZxdTlx5X
 x7M1TEyKmT0lVFmFN8Nm8Q7eObcPKTsTnUCUhFdJs2gAUH1MiC+5eYUbQw/TILvqhf2cvgHLe3943
 cRSkgFtAA4Wt2GbH1AGaCgbWKMeIEszGrmHkCcV/fzyLdGdQYEFWzdcb/QW0Vt2cgisk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T+QOvhsB6nnh3rBb/EQNR/3iQSifJMKBxkesTJz9bMg=; b=UoPmuIVDrFhZxxt+bq6w+8VVGZ
 fJnmyRGpa2dmi7615+453BRpCC1LgMcEgTeVPantW0f/7k2QY2ZyMKPEAvEmLOQv7J9cO11gKXQmy
 vrU88dUPa9S39YjX/BytQ+eUcYwUm6NMwBQlvW4Sa1a2ttyFQuHylWhVvckR0EtnSB5U=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vpKFM-00073X-0A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Feb 2026 05:55:46 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-652fe3bf65aso7280a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Feb 2026 21:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770616532; cv=none;
 d=google.com; s=arc-20240605;
 b=A37UDAX78CH6p60EQz7mNOAP4x6c8AGkdrFU4iFytXJvBBLijClpk19Xjo89SSmHPB
 ivLv30Xm1quebM4ofkc3f6RSSDv4Inms5nW7zR96WHig5DTUtFQL6Gv2X+5RfVv82XD3
 YnhqgWlF4zFZOVTR92GpsjYnUIcenDHmm+Xzgp9vBQ8M+2f0zP/RzRgspqALkE08vPJF
 Hn7o7ph3nZrm+792jK8vY+LPO2etAS8AbDVHArTiiG9QLtIwYtdDPgumHGpEySMzz2uE
 /P7EaYe2FnareeM2PH+q39CbCS9/gaLJEuNL85oe23mWV5unAx0DbbR5HEXtKMrqsUu2
 e57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=T+QOvhsB6nnh3rBb/EQNR/3iQSifJMKBxkesTJz9bMg=;
 fh=SrXqaHtyuvJuM2CkJzjua63hpLuHrn0BxJ3bCuD5uRo=;
 b=ZE6OVWnBjXt1PvC01t37tI+93wfsjiZ/en9KAzAnpQIVmUs/irJ7J3uWGVuIdqFT4O
 vH32Y2/UZ5cpjQXycycisHqxR6SSN6jXoy2Vx+W5Q+gLahXlJzPTGXQLaGwGbTokcJQn
 uLi9QVJnyS7gIkOxnhCPDyuuTfUmd8+HCrUUTV0hN7h7Zw1VHiNvX6UBRttsdCPzTgTv
 jiAxosRzerpojFuzbuGsYYplQgYA0t4xipl7MF+dBYFVNjoj/Ue6cVYxdgDygUvR/Rgi
 tdNvNKNPESKeQoFO7UbFVzSNCK3vM1Iv7b6zdsEqUcj49LCr51Sl3Avk6Cv2EnMD72Bb
 T/MA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770616532; x=1771221332;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+QOvhsB6nnh3rBb/EQNR/3iQSifJMKBxkesTJz9bMg=;
 b=fqUTfdMXLKHoPEFi42TFFWTm83mJbzR8hUGOBbZJ2uk9jv8QGtKSCrX/UEAxNx0gWz
 g7m5GjllYcnXINkOJ/RZ9ee3XDBnOeq19OeSwUb8Jbpqm6qpRKcsrDAqxFx3YrQ2+Cwe
 45ZFWj61tEJRm2d6sIFoto4GbjBhbXFdL2ZLB5IqGe0J2qpUc8A3QJ/q5/BBQyLM4RjM
 HX4NsOBLOQWC06lkbER4F4C5iRXUtDORmAmwod+JNY+1h8hRWIF4csdsiHyTLj0Pn0eC
 xd+L10pC5A73Qzo/QmQgq5UlqoPiY9PA5ka9ziwmgCmqus1SmCGY88gjSXknjMukYgEJ
 aLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770616532; x=1771221332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T+QOvhsB6nnh3rBb/EQNR/3iQSifJMKBxkesTJz9bMg=;
 b=B8nSbIhRnWw9eUxnrkA0WWrgYa47aNXV13mRjKmwLKUmIeMz4oPvdQRccOSUiTyvnx
 hPFgMZnne7/z11GBwhmfZV4e9D92rj7UWZKEP/0vyxQlhhkBa7sTdovx7boTmWZFfd1A
 zzHzMM+lYD96c1pzYKXWcP5GcPMtrdIAp37RIeRmVobooOoQjzbp3MTjBTiFDRQ9UIUT
 WRwAZjtLJwRIZFC6Ks4qnIuZ46OodKPKVG2N7ScXHN074qUAYPosB1nDLjwF9LTeVBG/
 9QRpboGi7gSY7Eyn0sJxGmwKgEoI4qmlS6dQiCB1jYb/foFi30/CW0moXSZtqXNsFk3J
 iHRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX3hnDSAxdq5kbBMDDIBjUVJppLxqgnStGOCENoa7YIp3XUKOvp0/ONACaMqYLZ58FicfAwhzSmsP32I0VuGp3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxGLbzO7YDqJLJfg6Non7Py+oQgRKOTyHr2WPmtm6LSNQobQiXp
 ANhZzYlReh6rRPAKpocO1ZEHMH8gy28uFn3BkrD/yn+OqAPhfu5keGRbcD4KJxK+PpJ+z4r1Z/A
 +MbIjvgMGc5IsirBtJxGHi4QfzH6y6bK+75jfi9jn
X-Gm-Gg: AZuq6aJsc06frIInoem0UIaoEtRJ4utSfc1o949YmFjfkTEQsF578LRM57nI8K13N4i
 egs3b5Afn6GzXKz9sXHJzHA7J3g8E9bX1S8LRlu7MwKC5KcGrUs4AIb2rhN7XTBiIZ759bZ4vDS
 DRGpdSluu3i5siz17IAe3LWDDCHF8qV9pVV1HumzgIY02K9j1Qy2rvYbIkum7ASZaTn6JQ3GNKV
 Tt+fMXsxGyraUhYd8cH8kusA677LIOcOGVJj8a9r1A/QDbZ1237d3zrQdvQqTSWdNQVaykiR7Pu
 qW7epvvxOr3Ndj2z62l5XYkK
X-Received: by 2002:aa7:cf19:0:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-659a9d1828emr30239a12.11.1770616532212; Sun, 08 Feb 2026
 21:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20260108022501.754320-1-joannechien@google.com>
 <20260110013802.GB15541@frogsfrogsfrogs>
 <CACQK4XDtrE5P-PjwSqvGtmEmMvEQS4r2KZkDh55LXY2YAoH6vw@mail.gmail.com>
 <20260208195043.vhvkanq5pysbb74y@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <20260209015326.GK1535390@frogsfrogsfrogs>
 <20260209035419.ivosuxils2gnn3lw@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
In-Reply-To: <20260209035419.ivosuxils2gnn3lw@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Date: Mon, 9 Feb 2026 13:55:15 +0800
X-Gm-Features: AZwV_Qjt0fAkperlVyp0uk5iJGAtZNUJexdbTOuM0fhw25LV9L2JU0rcyHAtMX0
Message-ID: <CACQK4XChXe7PoCdCbzSySpc4g_bKRXkyW6zoZtL8eYzV9NzmXg@mail.gmail.com>
To: Zorro Lang <zlang@redhat.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 9, 2026 at 11:54 AM Zorro Lang <zlang@redhat.com>
 wrote: > On Sun, Feb 08, 2026 at 05:53:26PM -0800, Darrick J. Wong wrote:
 > > Ok, since this is a limit on the maximum logical file block [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vpKFM-00073X-0A
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@redhat.com,m:djwong@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.sourceforge.net:server fail,mail.gmail.com:server fail];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20230601];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[joannechien@google.com];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0136110BE8E
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCAxMTo1NOKAr0FNIFpvcnJvIExhbmcgPHpsYW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+IE9uIFN1biwgRmViIDA4LCAyMDI2IGF0IDA1OjUzOjI2UE0gLTA4MDAs
IERhcnJpY2sgSi4gV29uZyB3cm90ZToKPiA+IE9rLCBzaW5jZSB0aGlzIGlzIGEgbGltaXQgb24g
dGhlIG1heGltdW0gbG9naWNhbCBmaWxlIGJsb2NrIG51bWJlciwKPiA+IF9yZXF1aXJlX21heF9m
aWxlX3JhbmdlX2Jsb2NrcywgcGVyaGFwcz8KPgo+IFRoYW5rcyBEYXJyaWNrISBJJ20gZ29vZCB3
aXRoIHRoaXMsIGlmIEpvYW5uZSBhZ3JlZXMgd2l0aCB0aGlzIHRvbywgSSBjYW4gaGVscCB0bwo+
IG1ha2UgdGhpcyBjaGFuZ2UgbG9jYWxseSB0byBhdm9pZCBhc2tpbmcgZm9yIGEgbmV3IHBhdGNo
Lgo+CgpJIGFncmVlIHRvby4gVGhhbmtzIERhcnJpY2sgZm9yIHRoZSBzdWdnZXN0aW9uLCBhbmQg
dGhhbmtzIFpvcnJvCmZvciB5b3VyIGhlbHAuCgpCZXN0IHJlZ2FyZHMsCkpvYW5uZQoKPiBUaGFu
a3MsCj4gWm9ycm8KPgo+ID4KPiA+IC0tRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
