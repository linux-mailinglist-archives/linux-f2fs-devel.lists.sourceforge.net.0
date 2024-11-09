Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 592239C294A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2024 02:41:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9aTM-00078m-DZ;
	Sat, 09 Nov 2024 01:41:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <danielyangkang@gmail.com>) id 1t9aTK-00078g-LH
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 01:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alYAJozbBoFMlkHoZsLDELchn1HKPRNFJXfllAHwhsk=; b=N8SU/BUzcTU+A3UcXdHwwq9wIi
 rItE7E0Xpkyhitl+ikzrkBkWXGFPICT0F9U4VRBeKvANdpDKi8VzWmsDa1gguYXm6bpwMLAFSzmKu
 DzOTgCI253T2sJ+D2XMkJeC+gRrgzMUomte1WogwWt5x9gq4Yl/CO7GiyGSfkJigWSHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=alYAJozbBoFMlkHoZsLDELchn1HKPRNFJXfllAHwhsk=; b=RC6p5YWt//e3X3qiIbGO1K0jhQ
 2hntAG+KTiapS15XZjuCJeQEDuj0+V0kUrvzLdCe2Jh94ZVcqMILztXlwYGTDul8EXZHl7zU45DvM
 zEoyKf0qCm0tfamiRPR95k20q9Y4qw5infpwy8i6eMHpQ92BfBcvGYPRR/L0WSn2Dc04=;
Received: from mail-yw1-f181.google.com ([209.85.128.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9aTJ-0001IX-V2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 01:41:06 +0000
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e3b7b3e9acso22756477b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Nov 2024 17:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731116455; x=1731721255; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alYAJozbBoFMlkHoZsLDELchn1HKPRNFJXfllAHwhsk=;
 b=UifNSvXEOoZIMQEpxFJKZr5W82U3nltdpyOzirqTZFEi0uh2xxSE/q1XZJPtsGhi6B
 9Q4xxrKAR5KMcpnMPi4i967cf+kEmlsje5nIJfHq3W2qI7KyRVtfffkklhWHCWUeJ/ih
 tGCKzklE0d6STCWUygiM8z0psPwZLeNu5v+ijQcHDncLxjc4tXCsSarBoPn1vWR6PWpU
 YfNReotk4vwwsODIcbxWCmgyXIoqx35vCcApMYjEwhEl4TkAKhN5VSnB8ppeT35+MDhL
 r3q+iP6HJkXG5FkUHI7kn3JY1cXZFNMf7CYeGV9v1WWSZEW/bZAlBypunRCt2qpndA13
 B/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731116455; x=1731721255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alYAJozbBoFMlkHoZsLDELchn1HKPRNFJXfllAHwhsk=;
 b=bdIr1hFDhYzUwKUlv9l2ESxi2hvat8Slod0WsTxAv22w4AoHO61VCTSL91/vDet5cw
 8I34XLqa05fUuRcOAXqx11XN7Jz5qQ1SdCOhrN+cKvTKfrHegc7LnyNTeKbImCHcl3MC
 HlXc8ILBsIN6JhHPhmxeRNndSqW/sgn5c8fCwZDJSl7lt+kwkryrH3VSl9z6HT+vw6XV
 HZEwuMb8Mzw3vDrgklYiBhETFSiKuc8cnGBfMf07AqcoYSnKwVX7t6w09M4ffRzaszyU
 KFDg20Krrj7JU8BCrrMxrZlrW8Qsa5c/RqbI7BzPQ6jTy3oTuP0apwLbPPz9HMS+ufjT
 aa5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxHcJ95/F36Mu3j4KcJFatqWEYWOvr2Sm9qfWNnomYcpiSDrID/ux7ZAJ/Agl1CaGc+OfWd6ZeZRP4DwIozZxC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwhF8uSB6hFOx7gN9voYjBG5bKuCTxbGtsntpN8FbXar78A8Dfz
 Q9VzO7RVldkPO+t7R4xArR0HB0UnvaT2z4zV2DRHaEzT1IgM7dNZePcQP0R3K84Av1PVFzTu3Gc
 xcPILCG7lYe9XblhI0OEDvA7VpPA8yGs8p4M=
X-Google-Smtp-Source: AGHT+IE65QQH5vxKcHYJFh7ya9QxQWKveCsogo/+blQwMlt/NfBp7O7Kxfqq2lNd+lRWWCZftGnWtdIxU1VU5gS6mRU=
X-Received: by 2002:a05:690c:3346:b0:6e3:2608:d5af with SMTP id
 00721157ae682-6eaddf7e5fbmr59882317b3.26.1731116455164; Fri, 08 Nov 2024
 17:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20241106025858.495458-1-danielyangkang@gmail.com>
 <a1471ca1-e119-4106-8965-cd954c373a62@kernel.org>
In-Reply-To: <a1471ca1-e119-4106-8965-cd954c373a62@kernel.org>
From: Daniel Yang <danielyangkang@gmail.com>
Date: Fri, 8 Nov 2024 17:40:19 -0800
Message-ID: <CAGiJo8Qd_Xd=u-Q84dpR6krU-svVjgA1hHdPHBr9kHkMwpX8qA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Nov 8, 2024 at 1:47 AM Chao Yu wrote: > > On 2024/11/6
    10:58, Daniel Yang wrote: > > strcpy is deprecated. Kernel docs recommend
    replacing strcpy with > > strscpy. The function strcpy() re [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [danielyangkang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.181 listed in wl.mailspike.net]
X-Headers-End: 1t9aTJ-0001IX-V2
Subject: Re: [f2fs-dev] [PATCH] parse_options(): replace deprecated strcpy
 with strscpy
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCAxOjQ34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvMTEvNiAxMDo1OCwgRGFuaWVsIFlhbmcgd3JvdGU6Cj4gPiBz
dHJjcHkgaXMgZGVwcmVjYXRlZC4gS2VybmVsIGRvY3MgcmVjb21tZW5kIHJlcGxhY2luZyBzdHJj
cHkgd2l0aAo+ID4gc3Ryc2NweS4gVGhlIGZ1bmN0aW9uIHN0cmNweSgpIHJldHVybiB2YWx1ZSBp
c24ndCB1c2VkIHNvIHRoZXJlCj4gPiBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgcmVwbGFjaW5nIHdp
dGggdGhlIHNhZmVyIGFsdGVybmF0aXZlIHN0cnNjcHkuCj4KPiBJdCdzIGJldHRlciB0byBhZGQg
ImYyZnM6ICIgcHJlZml4IGZvciBjb21taXQgdGl0bGUuCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgWWFuZyA8ZGFuaWVseWFuZ2thbmdAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIGZz
L2YyZnMvc3VwZXIuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMg
Yi9mcy9mMmZzL3N1cGVyLmMKPiA+IGluZGV4IDg3YWI1Njk2Yi4uZWU4ODYxYjk1IDEwMDY0NAo+
ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IEBA
IC0xMTU4LDcgKzExNTgsNyBAQCBzdGF0aWMgaW50IHBhcnNlX29wdGlvbnMoc3RydWN0IHN1cGVy
X2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywgYm9vbCBpc19yZW1vdW50KQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfQo+
ID4KPiA+IC0gICAgICAgICAgICAgICAgICAgICBzdHJjcHkoZXh0W2V4dF9jbnRdLCBuYW1lKTsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBzdHJzY3B5KGV4dFtleHRfY250XSwgbmFtZSk7Cj4K
PiBOZWVkcyB0byBoYW5kbGUgcmV0dXJuIHZhbHVlIG9mIHN0cnNjcHkoKT8KPgo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkuY29tcHJlc3NfZXh0X2NudCsrOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKG5hbWUpOwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4gQEAgLTExODcsNyArMTE4Nyw3IEBAIHN0YXRpYyBpbnQgcGFyc2Vfb3B0
aW9ucyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBjaGFyICpvcHRpb25zLCBib29sIGlzX3JlbW91
bnQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHN0cmNweShub2V4
dFtub2V4dF9jbnRdLCBuYW1lKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdHJzY3B5KG5v
ZXh0W25vZXh0X2NudF0sIG5hbWUpOwo+Cj4gRGl0dG8sCj4KPiBUaGFua3MsCj4KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLm5vY29tcHJlc3NfZXh0X2NudCsrOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKG5hbWUpOwo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOwo+CgpPaywgSSd2ZSBhZGRlZCB0aGUgY2hhbmdlcyBhbmQgc2VudCBhIHYy
IG9mIHRoZSBwYXRjaC4gTG1rIGlmIHRoZXJlJ3MKYW55IG90aGVyIGlzc3Vlcy4KCi0gRGFuaWVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
