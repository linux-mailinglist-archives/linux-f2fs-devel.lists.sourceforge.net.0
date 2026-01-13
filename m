Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D52D1A662
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 17:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N29YBRM85wELf2rfCqasBMtq64ACDxz0Su7IveyC+cM=; b=GVr/9ZERP6L81EBfmlE/9joiZG
	M28cGS+2gjEVogVrfhCkMaVng9npagAzfIl4YAIFQRoG9a8EVVQMKkfJPdcE2JVi85NevGr4mNTAR
	4dxDfr//YPgaGoiP9KkjoprVsZajHTh33HfJt0/H9RFZj/6mi/X+i9K4o28A7cH8bQlA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfhat-00071F-PU;
	Tue, 13 Jan 2026 16:50:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ngompa13@gmail.com>) id 1vfhar-000718-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gc7yqO7D0eseyKYDyefBFLldfXSHU35zlyHiXIvs8J4=; b=Q4XuMoK5LndM2k12g3b6/rplnM
 J01aTS0qx61Ix0dHge+ilyNH7fWUAHSVA5ilo8eQcu3SVBRIrppfQjc6K8A4tw1D6cPQ+gQObgHIR
 5PpuQ1PhhlCR4xpf3A4mJI8L9qJCBKgi1jY8hB/w9Y1BtZTI87yEkOWa+jL3ywvYIUw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gc7yqO7D0eseyKYDyefBFLldfXSHU35zlyHiXIvs8J4=; b=mWtu+dQPATht7k2yq5fK9oURc1
 0oS8fDjk5mMfqH7XLhxaQTxNS6vyv36gwuHdrfVBZfspCgzMbqVyk3uCRQkVmZeeUgWWiQQ6iYW6u
 8FXgKlRiU4z1QYIhHdfSMG+wzdQHtl1Y04w/dE6zdRohw43ScC7j1lg23q1pD7wSAZUg=;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfhar-0006Wb-7J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:50:09 +0000
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-459ac2f1dc2so4482764b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 08:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768322998; x=1768927798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gc7yqO7D0eseyKYDyefBFLldfXSHU35zlyHiXIvs8J4=;
 b=fnpfce/s42AgoCg5Tg+tpHPBs4pSUDN5wm6t8p94Z8EfemUIKG9RDK6ttenXH7WRfL
 RmirYzS2D2xBmFqvFQ7c+F8DVBDEd8Z9BX+OMZykszx7iI64XE+ECfIVh4RPKnZ5lVNh
 xwqLF7hFr9uqutquB1JTfx2TDpE0Nq5PsBRmDclE0rcBPadNIXaGC8L7Fx2gElNwtuii
 6F+W10MgG14jQBktC3FN2UFaO52zw97B1OkQcQx76qBF9D2L1uBQf7k6605yvDvC/565
 qlpZs5tqOpwiYqZVTQCzochHwy24H7aHTPYiO86R62PkJEGidQvbsIAt/CVav20Jqgmm
 kn2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEVv34t4I80kfBLlJfzxrxeEXFvcY8y9TTQs8oQJP5ccoYHlv1JWA9iz7Nbjqb/HjYcReKL4UHNmDeXxI+SHnf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxmXNKtI0Cc/Ix6PIRydJx+VKuJ2GpR7x6QtXVOXGAcCEocoL6c
 6Q0J4GEaFfcAbkZUnVI5myyDixm57Oxn8Go6XgTJCXw1skt4bH0lpUaww8jsnw==
X-Gm-Gg: AY/fxX62fgQlqEkeu1Il/Qk0KTz8fnfJaSdtlc6lHr83in8llpttaJ9a3Mo2v+Rr1JH
 W9zM7JSpkCVUUOxbrZmwaOXWb8unr5CcnOriduLHzaibz/J0x3hZNIogYGBLFvVfkWUS2woA6dD
 fwVhzw8YnUzeZs0h17YenCVhgyV316kZQeSIPYaiu+v77wUaepjgh6Wyyr48u+/tSy/gwixJwJB
 InyMEPDyenVWTwgNwBeGzLCoII/FxOo1Jc84T3ISlEeyFtPLoKH2ce4hs0SpnjHLlH7LoCNQD6u
 T0kc7aZasozZ+NAZwI7zkuWXgUxhWJtOMbfMUEfv2OGg9EbR/z73JHKcBSpKiY1VqQS9jQw83dZ
 pBEqhA7K/B/7LwyhyfV7pMeL09+pR02u6KKv/z2kxPMRdtpY4HQm4GHR7XU+OZxJNMkJU7tIunR
 2CuDAzREI769BRCfXselVa4UsXBm1Nor9XGxjOErXZdFOWSxktZjbDdOxUpgvUdV6ZcYTIlnneF
 cff
X-Google-Smtp-Source: AGHT+IFPkHiktkDS4zrW6LpWhec6XC71HX4ALRg7HhyinGenUQWzeEUXeCrklqaZU24kNNpzOhepuQ==
X-Received: by 2002:a05:6808:6508:b0:455:f286:7080 with SMTP id
 5614622812f47-45a6bd87117mr10773088b6e.9.1768322998158; 
 Tue, 13 Jan 2026 08:49:58 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-45a5e2e8fb1sm9225952b6e.21.2026.01.13.08.49.58
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 08:49:58 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-45c60ead7e1so804900b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 08:49:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ASbNrHoNmR1I4EmaoD/64Z1rujsRdJ58wY1LAGmgWgjBC7QE0Tiqz867r8RxAMOjt1Ge6EaDWvyb9cDepkke@lists.sourceforge.net
X-Received: by 2002:a05:6830:2e04:b0:7bb:7a28:51ba with SMTP id
 46e09a7af769-7ce50a6def5mr10521137a34.26.1768322616531; Tue, 13 Jan 2026
 08:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-9-cel@kernel.org>
 <20260113160223.GA15522@frogsfrogsfrogs>
In-Reply-To: <20260113160223.GA15522@frogsfrogsfrogs>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 13 Jan 2026 11:43:00 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8LGZGGAQ3XLMQg8=XmJjvvJNShT3zkE-o2t2fv=VGeHw@mail.gmail.com>
X-Gm-Features: AZwV_QiAh8VN4kaDD2E2Q52MaqDS5cW88U1qWaL9kDfC-E_siYu-7adEi4A7eM4
Message-ID: <CAEg-Je8LGZGGAQ3XLMQg8=XmJjvvJNShT3zkE-o2t2fv=VGeHw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 13,
 2026 at 11:02 AM Darrick J. Wong <djwong@kernel.org>
 wrote: > > On Mon, Jan 12, 2026 at 12:46:21PM -0500, Chuck Lever wrote: >
 > From: Chuck Lever <chuck.lever@oracle.com> > > > > Uppe [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.170 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ngompa13(at)gmail.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ngompa13(at)gmail.com]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1vfhar-0006Wb-7J
Subject: Re: [f2fs-dev] [PATCH v3 08/16] xfs: Report case sensitivity in
 fileattr_get
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org,
 Chuck Lever <cel@kernel.org>, vira@web.codeaurora.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, linux-nfs@vger.kernel.org,
 ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTE6MDLigK9BTSBEYXJyaWNrIEouIFdvbmcgPGRqd29u
Z0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDEyLCAyMDI2IGF0IDEyOjQ2OjIx
UE0gLTA1MDAsIENodWNrIExldmVyIHdyb3RlOgo+ID4gRnJvbTogQ2h1Y2sgTGV2ZXIgPGNodWNr
LmxldmVyQG9yYWNsZS5jb20+Cj4gPgo+ID4gVXBwZXIgbGF5ZXJzIHN1Y2ggYXMgTkZTRCBuZWVk
IHRvIHF1ZXJ5IHdoZXRoZXIgYSBmaWxlc3lzdGVtIGlzCj4gPiBjYXNlLXNlbnNpdGl2ZS4gUG9w
dWxhdGUgdGhlIGNhc2VfaW5zZW5zaXRpdmUgYW5kIGNhc2VfcHJlc2VydmluZwo+ID4gZmllbGRz
IGluIHhmc19maWxlYXR0cl9nZXQoKS4gWEZTIGFsd2F5cyBwcmVzZXJ2ZXMgY2FzZS4gWEZTIGlz
Cj4gPiBjYXNlLXNlbnNpdGl2ZSBieSBkZWZhdWx0LCBidXQgc3VwcG9ydHMgQVNDSUkgY2FzZS1p
bnNlbnNpdGl2ZQo+ID4gbG9va3VwcyB3aGVuIGZvcm1hdHRlZCB3aXRoIHRoZSBBU0NJSUNJIGZl
YXR1cmUgZmxhZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVjayBMZXZlciA8Y2h1Y2subGV2
ZXJAb3JhY2xlLmNvbT4KPgo+IFdlbGwgYXMgYSBwdXJlIGJpbmFyeSBzdGF0ZW1lbnQgb2YgeGZz
JyBjYXBhYmlsaXRpZXMsIHRoaXMgaXMgY29ycmVjdCBzbzoKPiBSZXZpZXdlZC1ieTogIkRhcnJp
Y2sgSi4gV29uZyIgPGRqd29uZ0BrZXJuZWwub3JnPgo+Cj4gW2FkZCBuZ29tcGFdCj4KPiBCdXQg
dGhlIG5leHQgb2J2aW91cyBxdWVzdGlvbiBJIHdvdWxkIGhhdmUgYXMgYSB1c2Vyc3BhY2UgcHJv
Z3JhbW1lciBpcwo+ICJjYXNlIGluc2Vuc2l0aXZlIGhvdywgZXhhY3RseT8iLCB3aGljaCB3YXMg
dGhlIHRvcGljIG9mIHRoZSBwcmV2aW91cwo+IHJldmlzaW9uLiAgU29tZXdoZXJlIG91dCB0aGVy
ZSB0aGVyZSdzIGEgcHJvZ3JhbSAvIGVtdWxhdGlvbiBsYXllciB0aGF0Cj4gd2lsbCB3YW50IHRv
IGtub3cgdGhlIGV4YWN0IHRyYW5zZm9ybWF0aW9uIHdoZW4gZG9pbmcgYSBub24tbWVtY21wCj4g
bG9va3VwLiAgUHJvYmFibHkgV2luZGVyeiBjYXNlZm9sZGluZyBoYXMgYmVoYXZlZCBkaWZmZXJl
bnRseSBldmVyeQo+IHJlbGVhc2Ugc2luY2UgdGhlIHN0YXJ0IG9mIE5URlMsIGV0Yy4KPgoKTlRG
UyBpdHNlbGYgaXMgY2FzZSBwcmVzZXJ2aW5nIGFuZCBoYXMgYSBuYW1lc3BhY2UgZm9yIFdpbjMy
ayBlbnRyaWVzCihjYXNlLWluc2Vuc2l0aXZlKSBhbmQgU0ZVL1NVQS9MWFNTIGVudHJpZXMgKGNh
c2Utc2Vuc2l0aXZlKS4gSSdtIG5vdAplbnRpcmVseSBjZXJ0YWluIG9mIHRoZSBuYXR1cmUgb2Yg
KmhvdyogdGhvc2UgZW50cmllcyBhcmUgbWFuYWdlZCwgYnV0CkkgKmJlbGlldmUqIGl0J3MgZnJv
bSB0aGUgcGVyc29uYWxpdGllcyB0aGVtc2VsdmVzLgoKPiBJIGRvbid0IGtub3cgaG93IHRvIHNv
bHZlIHRoYXQsIG90aGVyIHRoYW4gdGhlIGZzIGNvbXBpbGVzIGl0cwo+IGNhc2UtZmxhdHRlbmlu
ZyBjb2RlIGludG8gYSBicGYgcHJvZ3JhbSBhbmQgZXhwb3J0cyB0aGF0IHdoZXJlIHNvbWVvbmUK
PiBjYW4gcmVhZCgpIGl0IGFuZCBydW4vYW5hbHl6ZS9yZXZlcnNlIGVuZ2luZWVyIGl0LiAgQnV0
IHVnaCwgTGludXMgaXMKPiByaWdodCB0aGF0IHRoaXMgYXJlYSBpcyBhIG1lc3MuIDovCj4KClRo
ZSBiaWdnaWUgaXMgdGhhdCBpdCBoYXMgdG8gYmUgTkxTIGF3YXJlLiBUaGF0J3Mgd2hlcmUgaXQg
Z2V0cwpjb21wbGljYXRlZCBzaW5jZSB0aGVyZSBhcmUgZGlmZmVyZW50IGNhc2UgcnVsZXMgZm9y
IGRpZmZlcmVudApsYW5ndWFnZXMuCgoKCi0tIArnnJ/lrp/jga/jgYTjgaTjgoLkuIDjgaTvvIEv
IEFsd2F5cywgdGhlcmUncyBvbmx5IG9uZSB0cnV0aCEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
