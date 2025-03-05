Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B887A5041D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 17:03:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tprDZ-00066R-Dv;
	Wed, 05 Mar 2025 16:03:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tprDX-00066J-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 16:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2CTF6Pisj27mJGFCpElro7v5jTGDiYni/G+Uk8j/R8=; b=dLIMefign8QUcZEl5iE4iycy8k
 tWRDalnU6FTQ3dorXAtTDqkLjLNdNS/9uoP84pQHwEUw/DPLao9lKobs0BBtWA2Nh9u61penFy76F
 Pb4SHUnRgK8kbmoZaglZ8F1KONfMR8ctMPvclWtn9bOcIq+NxqUswKh7zSrwBFBA1QtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2CTF6Pisj27mJGFCpElro7v5jTGDiYni/G+Uk8j/R8=; b=c5umZsx9QPvyqwulp7I6hXF1HB
 GKxMPqjXnRXgxRMY5pKsNDqme5zu2HZCkQVDKRbAfQ/m1PyJpETiBUWK8GfRd3thvf7K2eAxPzl+2
 HdcEOo9AiUcQFpkrxpPWjSUSguxWXZz+ycqbJp5FoL2YzGgXT9ZuMnoSyG1lc8coKx1Q=;
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tprDW-0000CT-3g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 16:03:30 +0000
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c3b4c4b409so594141585a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Mar 2025 08:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741190604; x=1741795404; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2CTF6Pisj27mJGFCpElro7v5jTGDiYni/G+Uk8j/R8=;
 b=MuUe0TZ/M5H7tbsupM85lp6zEawjnCJOAIh22n0RSCiEg7r/V0fUQRHpiS4eI842VZ
 EnQgArzB+hhZeHLlaNvpkHPzkK7RaepuOoNN9w9FMVGq1fozgh+G2ZB/uuasQV6Pa76c
 aib4E99VzZr6c6htszphL8VQtqA5KNxVapihPPHTXFsgRoitcr4v5az6MM9Erer+IOlQ
 2V0FZlAr5zkQxOxAareeaxg2MpXpNUWooU/J+/Z0fBtoMw3/u1yeqp8meT1jkv3j8hLG
 /aKuNSsY7o9BX63FHGD2uwZBVbb2X0zJ6NSM6ErxXL/BF360/WzFyDy52AtlPgK4ARxE
 95Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741190604; x=1741795404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2CTF6Pisj27mJGFCpElro7v5jTGDiYni/G+Uk8j/R8=;
 b=u8T1qAWj7rvVrdQBPNOA1fX1VHAHV5CaqIwODr6z2z4ejhtdworEXlGZatLP2idyLS
 GkjhGlUe80A8oxF6uOOWgx0gCBXeiOusVVl+wVpZCJtOFBnA5OdOsS2v2fLSlO2qIVxT
 5r6ybfiIE4YnRV21q6x7K1hHZ/SCx7RejPLftWOoPuLM6Fw9cGFi/hhW6EqG56y/fY4l
 HA7PRMR4PBG1l/EuBSjAnsdZBb0Gs3oiUMeymfXtLXEMh1cmGxX0nzZBqb/S9kHTR1lz
 88RC7qETsJBTJpaRobMaw/WKXw8norYgDzdHElT5pH3IasnH+zKbTyJTZEA+LvY+3xXm
 iGSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6WE1Gsx69sbVUdOuh9MhEwYwGrVyPRBHv4ucx5Ha+n21s0FUpSppRjnP71d+U1m5is2FGFia4tFuznH3ZSnQW@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw/gCBQM4hBllnW4YoE8J/bJpkYXXo/24xKV7SE85Mw3cM9RGo7
 ZCm61JqEAExRwTO/88WjVwE2CrfLJh7Gg/DR7lezieL2e2+pP04aEBoarBrJix0F5CZcZofpwPT
 sh1cW+oxgY1bKGo8uwdgc0ZLTvIM=
X-Gm-Gg: ASbGncuDFvjJVST002oJFbvLg1aJaf/+eQqWUXi7oysQznCGTIXRzvhFBtQwe/ZVg+l
 HKEyNqXs+I4WQjLDdPYFPZLR5eWIaYxiaq0cf2XCK5tXLwCHg7JhcBeXe4IwNv6mmSWlCpjnQDZ
 SvLq+zJ9dkGxcZCJkdY2sKWrCUmHjFOiriuEK66JeH7pGTMsFWTSNAxXgC/A==
X-Google-Smtp-Source: AGHT+IFTdOugn9AkO/Ghfxd0ldeYCP3H0UlwQEVKhfeVgph2bg+IiSdqod7VKnJkN6OJ+qDAOSF2mxvfTd01xPm+47I=
X-Received: by 2002:a05:620a:2815:b0:7c3:c676:ffb8 with SMTP id
 af79cd13be357-7c3d8e20f42mr535409185a.10.1741190603957; Wed, 05 Mar 2025
 08:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20250304192041.4048741-1-daeho43@gmail.com>
 <41160b37-16ad-4c12-aad2-1214d87d3df0@kernel.org>
 <Z8hhJs_fUOBN7U8y@google.com>
In-Reply-To: <Z8hhJs_fUOBN7U8y@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 5 Mar 2025 08:03:13 -0800
X-Gm-Features: AQ5f1JraQ2nQ-YwlAct77tFhnNZVX6HLHip0gChQCAbQqGUxDofMo3LpTumMS78
Message-ID: <CACOAw_woCqGXKeLqG_QJExc_usnZy6FkL5O+qrvdzoqF2yBnfw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Mar 5, 2025 at 6:35 AM Jaegeuk Kim wrote: > > On
    03/05, Chao Yu wrote: > > On 3/5/25 03:20, Daeho Jeong wrote: > > > From:
    Daeho Jeong > > > > > > current_reserved_blocks is not allowed [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.182 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.222.182 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.222.182 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tprDW-0000CT-3g
Subject: Re: [f2fs-dev] [PATCH] f2fs: subtract current_reserved_blocks from
 total
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

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCA2OjM14oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAwMy8wNSwgQ2hhbyBZdSB3cm90ZToKPiA+IE9uIDMvNS8y
NSAwMzoyMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+IEZyb206IERhZWhvIEplb25nIDxkYWVo
b2plb25nQGdvb2dsZS5jb20+Cj4gPiA+Cj4gPiA+IGN1cnJlbnRfcmVzZXJ2ZWRfYmxvY2tzIGlz
IG5vdCBhbGxvd2VkIHRvIHV0aWxpemUuIEZvciBzb21lIHpvbmVkCj4gPiA+IHN0b3JhZ2UgZGV2
aWNlcywgdmVuZG9ycyB3aWxsIHByb3ZpZGUgZXh0cmEgc3BhY2Ugd2hpY2ggd2FzIHVzZWQgZm9y
Cj4gPiA+IGRldmljZSBsZXZlbCBHQyB0aGFuIHNwZWNzIGFuZCB3ZSB3aWxsIHVzZSB0aGlzIHNw
YWNlIGZvciBmaWxlc3lzdGVtCj4gPiA+IGxldmVsIEdDLiBUaGlzIGV4dHJhIHNwYWNlIHNob3Vs
ZCBub3QgYmUgc2hvd24gdG8gdXNlcnMsIG90aGVyd2lzZSwKPiA+ID4gdXNlcnMgd2lsbCBzZWUg
bm90IHN0YW5kYXJkaXplZCBzaXplIG51bWJlciBsaWtlIDUzMEdCLCBub3QgNTEyR0IuCj4gPgo+
ID4gSGkgRGFlaG8sCj4gPgo+ID4gSG93ZXZlciwgaWYgdGhlcmUgYXJlIG90aGVyIHVzZXJzIGUu
Zy4gb2VtIG9yIHZlbmRvciB3YW50IHRvIHVzZQo+ID4gcmVzZXJ2ZWRfYmxvY2tzIGFuZCBjdXJy
ZW50X3Jlc2VydmVkX2Jsb2NrcyBzeXNmcyBpbnRlcmZhY2UgdG8KPiA+IHJlc2VydmUgc3BhY2Us
IHRoZW4sIHRvdGFsIHNpemUgd2lsbCBiZSBsZXNzIHRoYW4gNTEyR0I/Cj4gPgo+ID4gV2hhdCBk
byB5b3UgdGhpbmsgb2YgYWRkaW5nIGEgbmV3IHZhcmlhYmxlIHRvIGluZGljYXRlIHJlc2VydmVk
Cj4gPiBzcGFjZSBmb3Igem9uZWQgc3RvcmFnZSBjYXNlIG9ubHk/Cj4KPiBPciwgYWRkaW5nIGEg
c3lzZnMgZW50cnkgbGlrZSAiY2FydmVfb3V0IiB0byBkZXRlcm1pbmUgdGhpcz8KCkdvb2QgcG9p
bnRzLiBUaGFua3MsIGd1eXMuCgo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICBmcy9mMmZzL3N1cGVyLmMgfCAzICstLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gPiA+IGluZGV4IDE5YjY3ODI4YWUzMi4u
YzM0NmRjYzI1MThhIDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gKysr
IGIvZnMvZjJmcy9zdXBlci5jCj4gPiA+IEBAIC0xODMzLDEwICsxODMzLDkgQEAgc3RhdGljIGlu
dCBmMmZzX3N0YXRmcyhzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHN0cnVjdCBrc3RhdGZzICpidWYp
Cj4gPiA+ICAgICBidWYtPmZfdHlwZSA9IEYyRlNfU1VQRVJfTUFHSUM7Cj4gPiA+ICAgICBidWYt
PmZfYnNpemUgPSBzYmktPmJsb2Nrc2l6ZTsKPiA+ID4KPiA+ID4gLSAgIGJ1Zi0+Zl9ibG9ja3Mg
PSB0b3RhbF9jb3VudCAtIHN0YXJ0X2NvdW50Owo+ID4gPiAtCj4gPiA+ICAgICBzcGluX2xvY2so
JnNiaS0+c3RhdF9sb2NrKTsKPiA+ID4KPiA+ID4gKyAgIGJ1Zi0+Zl9ibG9ja3MgPSB0b3RhbF9j
b3VudCAtIHN0YXJ0X2NvdW50IC0gc2JpLT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsKPiA+ID4g
ICAgIHVzZXJfYmxvY2tfY291bnQgPSBzYmktPnVzZXJfYmxvY2tfY291bnQ7Cj4gPiA+ICAgICB0
b3RhbF92YWxpZF9ub2RlX2NvdW50ID0gdmFsaWRfbm9kZV9jb3VudChzYmkpOwo+ID4gPiAgICAg
YXZhaWxfbm9kZV9jb3VudCA9IHNiaS0+dG90YWxfbm9kZV9jb3VudCAtIEYyRlNfUkVTRVJWRURf
Tk9ERV9OVU07Cj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
