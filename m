Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D7D90250A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jun 2024 17:11:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sGgfn-00072m-Fb;
	Mon, 10 Jun 2024 15:11:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sGgfm-00072f-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jun 2024 15:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cycnwNbB2QbkiUYzy7U9ut8XvQ6A+eLFN2UjpJnGLXE=; b=LhiRejoS/tK2N9DfgOTB4evvKx
 kv7BZg4fJYtOofn6GBZhieeg1s4rwO1ara+nFt/2VwO772J2M64ltikB/7QcekD3YlPgDgj2p9rOD
 CUv+dM5CN8Y8Wig0kxrFRcDGDaWb/cTDubQr4n4yZXLFuB/j0Lk/o5iTB21w1eCcO5/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cycnwNbB2QbkiUYzy7U9ut8XvQ6A+eLFN2UjpJnGLXE=; b=GKFNXTRHvMEmixHrv+lHhtdUk1
 XEJ8eKrUc2HnJX5WjT/Ic3qKYrhgsv4Qi8ZZ/1EFhJukOYJoJs+P3GPZg7IbLRi1K7u+KgFnfYVRD
 q9FdOMK3QfEERdXB6C+OfMFXWPJxUAztZzLOptKgIpOYB7sKeudf+JOWudOWAejUvVEg=;
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sGgfm-0001bE-8H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jun 2024 15:11:02 +0000
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-80b7699abcaso732096241.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Jun 2024 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718032255; x=1718637055; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cycnwNbB2QbkiUYzy7U9ut8XvQ6A+eLFN2UjpJnGLXE=;
 b=FhPLM8bj/e+xkYh0uOFJ6hWb6B6ldJCLcfSvbD5fGC7sh0PxRK9JwfpONYgFSXnclN
 TwhqxEYZB3VcMcNUPhgmN/oWW70DdR3JCGbAfI5Krw+zS5LbdS55WzIGJUyK65I5buMj
 2VkvFc9lrHPnkwclaaxfpNm71CcMyYAZWp1tsbGkRjM1lRTPlHspwyYeNAGMwHOKvEtr
 yjYu1WARzmt5bufU19/qcd4mXhYQaWB4hDsqY+u1AeD7wF/PVF8Xz/LtTLk58sV9EL5n
 b/Gxwxq42BW/KWLLiT0R74/XHgZwtluIGm2YabapwZ3pgimckWngdJ2Xjaxz6kJ7hEz/
 8A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718032255; x=1718637055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cycnwNbB2QbkiUYzy7U9ut8XvQ6A+eLFN2UjpJnGLXE=;
 b=PRpT2wnrXJIJzI8uDjumyztE5rO6tYzKKQkDtcqWt/dHnkwFurOHHC5J6bTWjUjTGJ
 1+GbcsY4JolvLYrGQXfFCKKDom73A9qlc+YeBgfxOy7ka/PoQv9dQFh7PJx0HXLDfQ/a
 XDrZcgL8ClIovQWUNWMA9iw38lRMJ4umfq/LMO5sZ7Zc+85mU1CJmz/OLa3f+EmL3q+5
 78hQxF7PVBkvy0X7LzPO3CvRuu3C8ZaEdl0roAuybzPh2+gsJtLUZX5SY2MGZfkECQ+b
 gYYMEqX4lk00juU9JAINVRMTlZqWAZUSUFsVJd1+q85moNdmbbRZM/M1IXH/RRAsy0Ig
 wNOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2guk0pfuXve9BRbcJ1QpFYZMQ2563YfjP1FW+6y2XDVgGKD/c3LC6OuF0JJ0qzRN+oF6OYKb0geRuLIhCeVgw3RewW+jmJaELqBwRbNg8I+rdluy3Gg==
X-Gm-Message-State: AOJu0YzXrBk1hoF30Kc//sFPqISVjZPSuLBg17YzcuwqvWfu3+wGkXuU
 6GIjR7a67fylCAsM39h7+hDUPDmpV4qyuC3YDzqllDIVeLcbRBRQbhFmn+8K23STGH2uisFsEA4
 hnz4vrn7do/JtMda5WMRjk4Sk2zA=
X-Google-Smtp-Source: AGHT+IE1bBht3Q/RKtsJwKtDwwtiDOLpGrE5Ye4Ip0oqyDxrr1J0UcUl9iVD/cn4DnAfDoA5lFDmV46W8zkQB61nLSE=
X-Received: by 2002:a05:6122:298a:b0:4df:4498:cc with SMTP id
 71dfb90a1353d-4eb562325d3mr10040880e0c.6.1718032254029; Mon, 10 Jun 2024
 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240606095213.4087668-1-chao@kernel.org>
 <d38a2712-f7cc-4aea-a343-00335a5215a0@kernel.org>
In-Reply-To: <d38a2712-f7cc-4aea-a343-00335a5215a0@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 10 Jun 2024 08:10:41 -0700
Message-ID: <CACOAw_x3s2m70-cBhA0X0h5AetCQgDzVh7hRM00OVm=0Od5FUA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Jun 8, 2024 at 5:36 AM Chao Yu wrote: > > On 2024/6/6
    17:52, Chao Yu wrote: > > After commit 261eeb9c1585 ("f2fs: introduce checkpoint_merge
    mount > > option"), checkpoint can be triggered [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.222.42 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.42 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.42 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sGgfm-0001bE-8H
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to add missing sb_{start,
 end}_intwrite() for ckpt thread
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBKdW4gOCwgMjAyNCBhdCA1OjM24oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNi82IDE3OjUyLCBDaGFvIFl1IHdyb3RlOgo+ID4gQWZ0ZXIg
Y29tbWl0IDI2MWVlYjljMTU4NSAoImYyZnM6IGludHJvZHVjZSBjaGVja3BvaW50X21lcmdlIG1v
dW50Cj4gPiBvcHRpb24iKSwgY2hlY2twb2ludCBjYW4gYmUgdHJpZ2dlcmVkIGluIGJhY2tncm91
bmQgdGhyZWFkLCBpdCBtaXNzZWQKPiA+IHRvIGNvdmVyIGYyZnMgaW5uZXIgY2hlY2twb2ludCBv
cGVyYXRpb24gdy8gc2Jfe3N0YXJ0LGVuZH1faW50d3JpdGUoKSwKPiA+IGZpeCBpdC4KPgo+IEl0
IG5lZWRzIHRvIHVzZSBzYl9zdGFydF9pbnR3cml0ZV90cnlsb2NrKCksIG90aGVyd2lzZSwgaXQg
d2lsbCBjYXVzZQo+IGRlYWRsb2NrIGFzIGJlbG93Ogo+Cj4gLSBmcmVlemVfc3VwZXIKPiAgIC0g
c2Jfd2FpdF93cml0ZShTQl9GUkVFWkVfV1JJVEUpCj4gICAtIHNiX3dhaXRfd3JpdGUoU0JfRlJF
RVpFX1BBR0VGQVVMVCkKPiAgIC0gc2Jfd2FpdF93cml0ZShTQl9GUkVFWkVfRlMpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gc3luYwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBpdGVyYXRlX3N1cGVycwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gc3VwZXJfbG9ja19zaGFyZWQKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBkb3duX3JlYWQoJnNiLT5z
X3Vtb3VudCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBz
eW5jX2ZzX29uZV9zYgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLSBmMmZzX3N5bmNfZnMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtIGYyZnNfaXNzdWVfY2hlY2twb2ludAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIHdhaXRfZm9yX2NvbXBsZXRpb24KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIGlzc3VlX2NoZWNrcG9pbnRfdGhyZWFkCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gc2Jfc3Rh
cnRfaW50d3JpdGUoc2JpLT5zYik7Cj4KPiAtIHRoYXdfc3VwZXIKPiAgIC0gc3VwZXJfbG9ja19l
eGNsCj4gICAgLSBkb3duX3dyaXRlKCZzYi0+c191bW91bnQpCj4KPiBUaGFua3MsCj4KPiA+Cj4g
PiBGaXhlczogMjYxZWViOWMxNTg1ICgiZjJmczogaW50cm9kdWNlIGNoZWNrcG9pbnRfbWVyZ2Ug
bW91bnQgb3B0aW9uIikKPiA+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4gLS0tCj4g
PiAgIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgNSArKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvY2hlY2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+IGluZGV4IDU1ZDQ0NGJl
YzVjMC4uNjZlYWFkNTkxYjYwIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMK
PiA+ICsrKyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gPiBAQCAtMTgyOCw4ICsxODI4LDExIEBA
IHN0YXRpYyBpbnQgaXNzdWVfY2hlY2twb2ludF90aHJlYWQodm9pZCAqZGF0YSkKPiA+ICAgICAg
IGlmIChrdGhyZWFkX3Nob3VsZF9zdG9wKCkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4KPiA+IC0gICAgIGlmICghbGxpc3RfZW1wdHkoJmNwcmMtPmlzc3VlX2xpc3QpKQo+ID4gKyAg
ICAgaWYgKCFsbGlzdF9lbXB0eSgmY3ByYy0+aXNzdWVfbGlzdCkpIHsKPiA+ICsgICAgICAgICAg
ICAgc2Jfc3RhcnRfaW50d3JpdGUoc2JpLT5zYik7Cj4gPiAgICAgICAgICAgICAgIF9fY2hlY2tw
b2ludF9hbmRfY29tcGxldGVfcmVxcyhzYmkpOwo+ID4gKyAgICAgICAgICAgICBzYl9lbmRfaW50
d3JpdGUoc2JpLT5zYik7Cj4gPiArICAgICB9Cj4gPgo+ID4gICAgICAgd2FpdF9ldmVudF9pbnRl
cnJ1cHRpYmxlKCpxLAo+ID4gICAgICAgICAgICAgICBrdGhyZWFkX3Nob3VsZF9zdG9wKCkgfHwg
IWxsaXN0X2VtcHR5KCZjcHJjLT5pc3N1ZV9saXN0KSk7Cj4KPgoKUmV2aWV3ZWQtYnk6IERhZWhv
IEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3MuCgoKCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
