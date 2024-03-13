Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BB087AAA2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 16:46:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkQoL-0001kS-TT;
	Wed, 13 Mar 2024 15:46:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rkQoJ-0001kI-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 15:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sGwxmqFwO1mvnSpSmoipMpLxUDWbyvTiCSsDIpsLb+c=; b=Divapt7zGGzO0hmukpgNzq+ccs
 GNkrfZZpKPeNAlS8EmEoCceDeAuV57G4Z3hUsdk2tLM2hckddBu8JXo/UPL+6vis93lZLNixl3deN
 euYO6kqHj6WwK3to3cPXiZY0JFazh0K9UYDnwXOcZV+JSbgR3OflXy0FUCKzI54di7Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sGwxmqFwO1mvnSpSmoipMpLxUDWbyvTiCSsDIpsLb+c=; b=UKtBHoaDpF/nVankyLifQIshGZ
 +AXHrAhFNU8fw1P6/RbnagtBXpjJVdPG1n4Siuuclkz2BQBUk8NDD8VRTCAY27bqtgxSFRQ5wlLhp
 wXSwWR9ofqXHLmB/gMCqNWREkwcYdqleOQHLwX7mkqF3OpZicg6ialSg8C3QbONrMTj4=;
Received: from mail-vs1-f50.google.com ([209.85.217.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkQo8-00041j-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 15:46:32 +0000
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-475da36107bso208783137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710344776; x=1710949576; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGwxmqFwO1mvnSpSmoipMpLxUDWbyvTiCSsDIpsLb+c=;
 b=d5IZug9cGKshrXCmma+I1WVM2xMyiD2zxrs9lmcmUYj4UxQaHt4NHkj0h7ygV5c1EN
 uRxGwQLJDWAuUdZgByomzNWnChX41VnK+VvIpUEobSXVuEr6oD8y6J379vSj87oWP+20
 nxAVXu2FybryMFhKLaEsVd4ahAQPyUZ+t6hFPX0GECRwqa36hXzFXFZU3aFBqfnPFQ10
 lafRRaxubvimJEb/tTZ197YmmOV2wGaVwzzjZBWpMvisWzTTzpWRC1lZfDbPGPcpLATp
 N1tIaiyL1qvEHF2UkCzOt+j/T1wkMLqtUx6PkhW300nFtQ6pDzV8/MHh3uafQHB9mvDl
 3U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710344776; x=1710949576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGwxmqFwO1mvnSpSmoipMpLxUDWbyvTiCSsDIpsLb+c=;
 b=oz4ANi24cHXOeQvCRhG4TEdw6BvBAIyqBix668ttC0GSr/NptYMFeXVcmvpaak1hQ0
 G7vNW6mxfIEBJDLA3fUXp9rywWzc19Vm9w5ZO97vIZIEKic9QZmhTYp5RfdzoXz9382C
 uGQHuI30PS/MeuvibLLnVbguKPnsdK/W7TRKEzoYA+mK2cNDhIZq3pQ25PL6nkLJUsP8
 +SAoTXJR4LN2VuN4Zb7kuv6hT13+Z8kQ+t96x/DI6hOCjvcm02jI9gA4CKgdrSetL9Xk
 uXqbktl5XkUMauRRDoppNZrdszHEvA9TSdLLqjEHGfGRxlA7o/VZyrcIJV1s8Zga/cgL
 2+Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZWQIIkCOoTrRtD95fDJGDas4aBs0/JJNTC7h9pmn0yYcwbV9cGoob+yHQVBWymM9aX7fG0tF4f4V1VpYYkZNX2PG7CnNg44QRKgoyPUxhAV+lFV4ikA==
X-Gm-Message-State: AOJu0YyhP8WL7Y8Zc2lNcBRY6reVe7hh4LWMGbB1e5wvpe6oAhcBbmt9
 US3y4NwtVOYDHQPn2UqWXYd88fX57Z74nyrM/r+MFl3zhFiAW99XZqaLc/wqkPCPZE8rOsYC0Lq
 EZQaw3jj0vrgZdF/0l4IIdw1z6vbA6uxvAO0sog==
X-Google-Smtp-Source: AGHT+IF0sJ3VgTNC/pkl0UrGOsYQkAjEU0lUMb93ytZfaLzDn9zGQlZtaMC1E/aWH2b9zLlfMYC0kUj2hz7Vv/wwYho=
X-Received: by 2002:a67:f8cd:0:b0:474:5f25:58a3 with SMTP id
 c13-20020a67f8cd000000b004745f2558a3mr218263vsp.19.1710344776177; Wed, 13 Mar
 2024 08:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28@epcas1p3.samsung.com>
 <20240313112620.1061463-1-s_min.jeong@samsung.com>
In-Reply-To: <20240313112620.1061463-1-s_min.jeong@samsung.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 13 Mar 2024 08:46:04 -0700
Message-ID: <CACOAw_xeAmGXt_ZZ=6wC1mKmpo+R-a8KaNUVvXYQPa3rCpqQYw@mail.gmail.com>
To: Sunmin Jeong <s_min.jeong@samsung.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Wed, Mar 13, 2024 at 4:37 AM
    Sunmin Jeong wrote: > > In f2fs_update_inode, i_size of the atomic file isn't
    updated until > FI_ATOMIC_COMMITTED flag is set. When committing atomic write
    right > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkQo8-00041j-Vi
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: mark inode dirty for
 FI_ATOMIC_COMMITTED flag
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBXZWQs
IE1hciAxMywgMjAyNCBhdCA0OjM34oCvQU0gU3VubWluIEplb25nIDxzX21pbi5qZW9uZ0BzYW1z
dW5nLmNvbT4gd3JvdGU6Cj4KPiBJbiBmMmZzX3VwZGF0ZV9pbm9kZSwgaV9zaXplIG9mIHRoZSBh
dG9taWMgZmlsZSBpc24ndCB1cGRhdGVkIHVudGlsCj4gRklfQVRPTUlDX0NPTU1JVFRFRCBmbGFn
IGlzIHNldC4gV2hlbiBjb21taXR0aW5nIGF0b21pYyB3cml0ZSByaWdodAo+IGFmdGVyIHRoZSB3
cml0ZWJhY2sgb2YgdGhlIGlub2RlLCBpX3NpemUgb2YgdGhlIHJhdyBpbm9kZSB3aWxsIG5vdCBi
ZQo+IHVwZGF0ZWQuIEl0IGNhbiBjYXVzZSB0aGUgYXRvbWljaXR5IGNvcnJ1cHRpb24gZHVlIHRv
IGEgbWlzbWF0Y2ggYmV0d2Vlbgo+IG9sZCBmaWxlIHNpemUgYW5kIG5ldyBkYXRhLgo+Cj4gVG8g
cHJldmVudCB0aGUgcHJvYmxlbSwgbGV0J3MgbWFyayBpbm9kZSBkaXJ0eSBmb3IgRklfQVRPTUlD
X0NPTU1JVFRFRAo+Cj4gQXRvbWljIHdyaXRlIHRocmVhZCAgICAgICAgICAgICAgICAgICBXcml0
ZWJhY2sgdGhyZWFkCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
d3JpdGViYWNrX3NpbmdsZV9pbm9kZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHdyaXRlX2lub2RlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX3VwZGF0ZV9pbm9kZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtIHNraXAgaV9zaXplIHVwZGF0ZQo+ICAgZjJmc19pb2NfY29t
bWl0X2F0b21pY193cml0ZQo+ICAgICBmMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUKPiAgICAgICBz
ZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCkKPiAgICAgZjJmc19kb19z
eW5jX2ZpbGUKPiAgICAgICBmMmZzX2ZzeW5jX25vZGVfcGFnZXMKPiAgICAgICAgIC0gc2tpcCBm
MmZzX3VwZGF0ZV9pbm9kZSBzaW5jZSB0aGUgaW5vZGUgaXMgY2xlYW4KPgo+IEZpeGVzOiAzZGIx
ZGUwZTU4MmMgKCJmMmZzOiBjaGFuZ2UgdGhlIGN1cnJlbnQgYXRvbWljIHdyaXRlIHdheSIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgI3Y1LjE5Kwo+IFJldmlld2VkLWJ5OiBTdW5nam9u
ZyBTZW8gPHNqMTU1Ny5zZW9Ac2Ftc3VuZy5jb20+Cj4gUmV2aWV3ZWQtYnk6IFllb25namluIEdp
bCA8eW91bmdqaW4uZ2lsQHNhbXN1bmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFN1bm1pbiBKZW9u
ZyA8c19taW4uamVvbmdAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGZzL2YyZnMvZjJmcy5oIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRleCA1NDM4OTg0ODJmOGIuLmEwMDBjYjAy
NGRiZSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5o
Cj4gQEAgLTMwMzksNiArMzAzOSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX21hcmtfaW5vZGVf
ZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgICAgICAgY2FzZSBGSV9JTkxJTkVf
RE9UUzoKPiAgICAgICAgIGNhc2UgRklfUElOX0ZJTEU6Cj4gICAgICAgICBjYXNlIEZJX0NPTVBS
RVNTX1JFTEVBU0VEOgo+ICsgICAgICAgY2FzZSBGSV9BVE9NSUNfQ09NTUlUVEVEOgo+ICAgICAg
ICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4gICAg
ICAgICB9Cj4gIH0KPiAtLQo+IDIuMjUuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
