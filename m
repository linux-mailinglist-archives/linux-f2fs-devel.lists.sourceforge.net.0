Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C01EACF69D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 04:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1N/6PrhlXejiofz/6eIabW7dUxYRHuTCrESufmQmuQ=; b=gNXworFbmqFszpAut8bGUn6/2X
	OBfIeJrrkA15xfi1SVFfQIuIEnVOGeX85Obz2vi1479bPAsNdanTDoYouGbFO3WiAcGXN3+h6ZoSc
	znra1mfFGed8WT6NLGoy3WYgM7alJ12p+2XCs15ormxRn9+O/f2f0mnKmdEHkGWJL1Zc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcxub-0007DK-3t;
	Tue, 06 Jan 2026 03:39:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1vcxua-0007DE-5f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 03:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HsgtiYB1rUIQaP4ifIcfW/sF8IozZ9Y8hRv0ic4VCTg=; b=Z12TA6THKUozWXzS3MfQAlCdbc
 h8YWQC1Mtu8N5VxuV++w28ChMHGCI938Kfy0FmH3X9d0EfEJazpFVCfvl7Ni2sUJ8VIhDW2rztpam
 EsDDpbyGjZPD2fzddCZSBPXwSyo+Zqn2zLma55j2Mt99Hnp3SoybqSfhQrl5ZQucsjtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HsgtiYB1rUIQaP4ifIcfW/sF8IozZ9Y8hRv0ic4VCTg=; b=Od/5o42eLYInfjqJRA5TS8cD7J
 l4gNJPMIcZ4p+85w6K1/64SGwqn74UK7GG2VDKEwIirMnImM+Fok0d77WcM86gDgNIoTOs8kRXPEg
 lOQVxDSzMvla4TDHabUqlJZctQnyBN9zkdTjWgnkgt80xHoEskiIuRB+6v6WdFU5fJAw=;
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vcxuZ-00010G-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 03:39:12 +0000
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso7998396d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Jan 2026 19:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767670741; x=1768275541; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsgtiYB1rUIQaP4ifIcfW/sF8IozZ9Y8hRv0ic4VCTg=;
 b=bRQAhcluEU+QiWHsL0pQMmpUrT4Dra0/wDYEhF3lrwIvtGQt/d/m6UPVw9hSF2ojlA
 E7WRna4ARIoXRP6lBE6Wch6CUX3AXEUpstr3fP9sou055fttcm8gXinR9f0ZFFpkEynN
 UjZ1BG4McbYMtJXPGeZRdvPIXH2qTvH9y65u2Ok0Qk+iSUFP5QDBr5kjNASqVw+9gpQG
 IyOFjS1TfLRP+6J+Quig95fuonRj8EpuR3cKr4DxNqag3ZWFvEz5z8S2SIvxn7vhoAyu
 t0iYV82lev4QWWt5J28K5cHw4Urfv6q1yJLAHX+4D3h2sOeAJn+ICPDxyFWqx9FLOSvE
 +ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767670741; x=1768275541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HsgtiYB1rUIQaP4ifIcfW/sF8IozZ9Y8hRv0ic4VCTg=;
 b=SF7Gx0+AlOwvwWuJE4nnKAMPRl7RzDkpZtmW6njmZgwOhQfV8myz1HqCGpRmtDJzBX
 WPmPo12+gP9BAbPv43UmtgG0ytyWyPdI4+Xxjb4P/tlmyF0/jUMGJZ2E25JTKpAOq/Y9
 vZWZl3k1kAZt+jwm50Fd4ZttWqkonWaFanrBVSPxzgAApS3V8RQLJmLAdd/Bpsql5tol
 L4q0+xle7LmfsjX3KdNRBWLiCwo2wqUXCz6POP2mDc9EBelNY/KWNTqaYL1p2MDpggWC
 EayO1VKlPv1Kkfz5wWDfOmivSgFLDErKkqixj9eWVUlsOUxaUOyGQUQj0dx4VsNNwxwU
 IkfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx70T2zfBLuxftH5wYgHwSY2Vs0UE6KG41jL3AymRWjyGLdYoRWGun8XIuTBcS8cuUXU6YTFygtL8/X2hvudfx@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzaQjoyD0BhafeBkQ2FkN2Xiz9uuHdeyf2+GBAfMK8SZcMb4BmE
 wN39+50XOTmJoyxzsiQJgp/BqCZCvXpH1YDBPpDShVAg0nht2g8ZY67JSpUPNQty5/PYnfODqTo
 TAPx5Ax81VNlI3hLUlQWDZVwfILoClRw=
X-Gm-Gg: AY/fxX5psvzrcf5XfQo3j1stp6v4dNTjbNGgM/01Ipu2NNPjUT7Cs5KDLyEAufpPYNS
 t6TM5yLOg8hvXkjNW0Jn0tSrG+HBbrNCIx8fMAQ5gVWLvRkPGFaR7ZthGg78d2CbSDl3mnvJAgI
 Exgi0SHp9pQXq2OBjHlB7lJljmIfi7Z/yWiJ6dNCKmT7bSm+pE389eIACL3CFyfmw3hxEx7+96P
 69ArWoDGqbrD1sJVrQ5BeSwC8eNQ1b9XSbAdUgKClw2zIpt+lBFR5sH4eE35rKuoIgOXQ==
X-Google-Smtp-Source: AGHT+IHnQgpdWdYPT3F4uR1Agmv+WCEfs2iQIcCplh1cQWAF5Zd/RrwZKZAVvqPWJgzQAbUkfcaNaOfQrcYEclnPgtI=
X-Received: by 2002:a05:6214:d6e:b0:882:42e6:171a with SMTP id
 6a1803df08f44-89075e53c1amr29342386d6.29.1767670740396; Mon, 05 Jan 2026
 19:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-2-nzzhao@126.com>
In-Reply-To: <20260105153101.152892-2-nzzhao@126.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 6 Jan 2026 11:38:49 +0800
X-Gm-Features: AQt7F2rIOD0TPQuxHFBO1J7cG0blq4iLzAQc2m-8El1yOrUzFRedsMpl3s56E3M
Message-ID: <CAGsJ_4yrspqjbEK8vj8Fd9FCDAasQ7mp5nBsE0Zg9XX265PXgA@mail.gmail.com>
To: Nanzhe Zhao <nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 6,
 2026 at 12:12 AM Nanzhe Zhao wrote: > > f2fs_folio_state
 is attached to folio->private and is expected to start > with
 read_pages_pending
 == 0. However, the structure was allocated fr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.48 listed in wl.mailspike.net]
X-Headers-End: 1vcxuZ-00010G-Ns
Subject: Re: [f2fs-dev] [PATCH v1 1/5] f2fs: Zero f2fs_folio_state on
 allocation
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
Cc: Kim Jaegeuk <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMjoxMuKAr0FNIE5hbnpoZSBaaGFvIDxuenpoYW9AMTI2
LmNvbT4gd3JvdGU6Cj4KPiBmMmZzX2ZvbGlvX3N0YXRlIGlzIGF0dGFjaGVkIHRvIGZvbGlvLT5w
cml2YXRlIGFuZCBpcyBleHBlY3RlZCB0byBzdGFydAo+IHdpdGggcmVhZF9wYWdlc19wZW5kaW5n
ID09IDAuICBIb3dldmVyLCB0aGUgc3RydWN0dXJlIHdhcyBhbGxvY2F0ZWQgZnJvbQo+IGZmc19l
bnRyeV9zbGFiIHdpdGhvdXQgYmVpbmcgZnVsbHkgaW5pdGlhbGl6ZWQsIHdoaWNoIGNhbiBsZWF2
ZQo+IHJlYWRfcGFnZXNfcGVuZGluZyB3aXRoIHN0YWxlIHZhbHVlcy4KPgo+IEFsbG9jYXRlIHRo
ZSBvYmplY3Qgd2l0aCBfX0dGUF9aRVJPIHNvIGFsbCBmaWVsZHMgYXJlIHJlbGlhYmx5IHplcm9l
ZCBhdAo+IGNyZWF0aW9uIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW56aGUgWmhhbyA8bnp6
aGFvQDEyNi5jb20+CgoKV2UgYWxyZWFkeSBoYXZlIEdGUF9GMkZTX1pFUk8sIGJ1dCBpdCBpbmNs
dWRlcyBHRlBfSU8uIFNob3VsZCB3ZQppbnRyb2R1Y2UgYW5vdGhlciB2YXJpYW50LCBzdWNoIGFz
IEdGUF9GMkZTX05PSU9fWkVSTyAob3Igc2ltaWxhcik/Ck92ZXJhbGwsIExHVE0uCgpSZXZpZXdl
ZC1ieTogQmFycnkgU29uZyA8YmFvaHVhQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICBmcy9mMmZzL2Rh
dGEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGlu
ZGV4IDQ3MWU1MmM2YzFlMC4uYWIwOTFiMjk0ZmE3IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMjM4OSw3ICsyMzg5LDcgQEAgc3RhdGlj
IHN0cnVjdCBmMmZzX2ZvbGlvX3N0YXRlICpmZnNfZmluZF9vcl9hbGxvYyhzdHJ1Y3QgZm9saW8g
KmZvbGlvKQo+ICAgICAgICAgaWYgKGZmcykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZmczsK
Pgo+IC0gICAgICAgZmZzID0gZjJmc19rbWVtX2NhY2hlX2FsbG9jKGZmc19lbnRyeV9zbGFiLCBH
RlBfTk9JTywgdHJ1ZSwgTlVMTCk7Cj4gKyAgICAgICBmZnMgPSBmMmZzX2ttZW1fY2FjaGVfYWxs
b2MoZmZzX2VudHJ5X3NsYWIsIEdGUF9OT0lPIHwgX19HRlBfWkVSTywgdHJ1ZSwgTlVMTCk7Cj4K
PiAgICAgICAgIHNwaW5fbG9ja19pbml0KCZmZnMtPnN0YXRlX2xvY2spOwo+ICAgICAgICAgZm9s
aW9fYXR0YWNoX3ByaXZhdGUoZm9saW8sIGZmcyk7Cj4gLS0KPiAyLjM0LjEKClRoYW5rcwpCYXJy
eQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
