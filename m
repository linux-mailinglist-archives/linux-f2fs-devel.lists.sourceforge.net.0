Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41751ACE8DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 06:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dfb2PWLpqEc4kgNRsytrc0oRl8+S4aef1727vsUvKM8=; b=CpUKZfv45+R13uNfsk//QMqAHH
	SHOzQookrEVrboLHNjur5Ubmot5Ac6iY55cVOhQvL9XeU6xfWhqkNWwItt0L9cYOQ+2ANrlx+5y19
	vh73xiKdNZv1ZYjs5GObPQDzXhJMytQ4KNy4YlhTDyYMbUviE+COZynlOO3J3Si6fxhQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN1rL-0001bT-5k;
	Thu, 05 Jun 2025 04:05:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uN1rJ-0001bK-Cg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 04:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=; b=Bm0EJEO4U3x8bNpQg7QRy2Hymx
 n92evdB7HmN7wyanAg/gCgFJCAcIGzM9cNWOCwEw1twzWLtlTNinOyP/Fw9NWj14w3lAv+eBY+bx4
 KpD6ozX7bGkpcgutpTxa7W96WL+w21Lcs8Imc3pMvXbnTcDbu80e1eAEtBpaWvmHi30w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=; b=KLCfwogF5LhzKA1osSWSCgbShj
 oHD1I/k5kooexUWDJnmvuJ8M8n1xj24KXLs2QoxM6ahsmLgx110UFQcQLqhctbGMti63EG/xZf6/4
 nNd8P9S3ommNdFOb1rdqPbEiJbe3NB3jGloxMSGntuZ4wBYoW7KC8ahoXAcXidsfbHX8=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uN1rI-00013m-Ut for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 04:05:41 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a4e6a0c274so69883f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 21:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749096329; x=1749701129; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=;
 b=YT/u1cAtuhXYxmjMPn7LP1mjP5MOO8qAbHS0kk7YdlJKypI+Rb0BvWOU1XTbMStB2X
 WwE9qT+oRH+kE0f87wTiCgGMp+wsvKxUiDVhJ8Q6S/eDYr83yNyfEkV3XCSCZbC8zf85
 NhtWzuRcTTbLMtXXLZOjQh6sV7ppbjAwmMLywKzWHLPD+2L9LZDaPo7IhkAgxOpRpoPR
 68tzCNxjOcSHGRodCtguBSr6EcnA99qHjt18qi/Tj2pMMXUxsFo0xBF1OZXuvbWNc4+d
 s6KzLAiPyhi1IhQ2oEizSxVe9NDaQxeGbVbyQzDea/W6Q6dYZDxfJnZiRs3EfKN/Gpb4
 xfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749096329; x=1749701129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEwtieco4GKYEC1Fw9rbOSmkU4O570HqhhN1nDaf00c=;
 b=XyPiJ8HKnk/geawCf/ETUAV4UA7p8yeVMcbSQdJ3+57JPGy0KLFBd6L4FviomJxRkY
 MFOaZ/+0Tqq1yafxl5y9kGZXDayDLMHX246aAjkCED0sdJzX1djTSLn6sBy5zGOW/sGF
 nM0ZUBN2+8Sxlhm4OhG/LFAbXByHc05O31HSw2pgJo6JEvjxay42sSQD8khqYsCjLPn1
 y5E3kWWfQ2ATf9AkJucMLjptNve17gMpmVODmxzoKn6vv9HeeJcghOEx1yMGG0ZlRsu4
 coioLHW5nVH4rwi/5LRScRwv5eGnD2AfB2G2oJ4HvAfEEr5oq48rS0hRLKJmFX3asC7z
 aYWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCf4//6kwwT+whcaEUBDufbb/CTQOnaeQb9DwC3eQsrC+zuPLLLI6KzeIZoZQGd/uWoqBLSAibZqu6iPTVN1CN@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxHCg+BAW7Fy9OGxgCGjuhoZTlyqnPZ8VjwPOiQl9h3Tg4Mpt0A
 O31qTDJ4zMjgquv/ADiV3xj5iHPLTlChYcJdk27dNjWDXw4913KlHZ7ukx3C4dcQpk9ePXv/Rpl
 k8qvrrPtgqQ9zXIFKn3Ni+9lBqHDqtUU=
X-Gm-Gg: ASbGncuUCn6jWoOJk9JzH0Arjj3lEDlaadEXTKeZVzFVrSbg8Fz2J638L4JNUZi3B69
 g4wmKDnXD35NFBCmf2MffGhtNr+XiyX/s7PFX54GPx0WW+5ucWU65bvJ+VTNZRWHpgVe6IPFfvq
 I6TAnORNJqq1A+JHZ3RsMCrc+wjRGDhKq5og==
X-Google-Smtp-Source: AGHT+IEGy5Ojz4lIsgpjdJct16wfU6hSORmQedpsbzwZYJaouI3aHwEH0WbI773cz57GlUP8HPa6/7RP5vf0nNBq8mc=
X-Received: by 2002:a05:6000:430d:b0:3a3:6ab0:8863 with SMTP id
 ffacd0b85a97d-3a51d997120mr1434178f8f.16.1749096329088; Wed, 04 Jun 2025
 21:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
 <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
 <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
 <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
In-Reply-To: <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 12:05:17 +0800
X-Gm-Features: AX0GCFvJBT95joyY_JO0nCWFEiJ0UyXel-A54_RG69i2bqx3GaVOigAsJsFlYfo
Message-ID: <CAHJ8P3JcGAtwQVTqCfno+_agZjkEMn3XHtgBeOicUAPkONvnTQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月5日周四 11:31写道： > > On 6/5/25
    10:44, Zhiguo Niu wrote: > > Chao Yu 于2025年6月5日周四 10:23写道：
    > >> > >> On 6/4/25 19:37, Zhiguo Niu wrote: > >>> The de [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.45 listed in wl.mailspike.net]
X-Headers-End: 1uN1rI-00013m-Ut
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDXml6Xlkajlm5sgMTE6MzHl
hpnpgZPvvJoKPgo+IE9uIDYvNS8yNSAxMDo0NCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNeW5tDbmnIg15pel5ZGo5ZubIDEwOjIz5YaZ6YGT
77yaCj4gPj4KPiA+PiBPbiA2LzQvMjUgMTk6MzcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+IFRo
ZSBkZWNvbXByZXNzX2lvX2N0eCBtYXkgYmUgcmVsZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIK
PiA+Pj4gSS9PIGNvbXBsZXRpb24uIElmIHRoaXMgZmlsZSBpcyBkZWxldGVkIGltbWVkaWF0ZWx5
IGFmdGVyIHJlYWQsCj4gPj4+IGFuZCB0aGUga3dvcmtlciBvZiBwcm9jZXNzaW5nIHBvc3RfcmVh
ZF93cSBoYXMgbm90IGJlZW4gZXhlY3V0ZWQgeWV0Cj4gPj4+IGR1ZSB0byBoaWdoIHdvcmtsb2Fk
cywgSXQgaXMgcG9zc2libGUgdGhhdCB0aGUgaW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+ID4+PiBp
cyBldmljdGVkIGFuZCBmcmVlZCBiZWZvcmUgaXQgaXMgdXNlZCBmMmZzX2ZyZWVfZGljLgo+ID4+
Pgo+ID4+PiAgICAgVGhlIFVBRiBjYXNlIGFzIGJlbG93Ogo+ID4+PiAgICAgVGhyZWFkIEEgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRocmVhZCBCCj4gPj4+ICAgICAtIGYy
ZnNfZGVjb21wcmVzc19lbmRfaW8KPiA+Pj4gICAgICAtIGYyZnNfcHV0X2RpYwo+ID4+PiAgICAg
ICAtIHF1ZXVlX3dvcmsKPiA+Pj4gICAgICAgICBhZGQgZnJlZV9kaWMgd29yayB0byBwb3N0X3Jl
YWRfd3EKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBkb191bmxpbmsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0gaXB1dAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZXZpY3QKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBjYWxsX3JjdQo+ID4+PiAg
ICAgVGhpcyBmaWxlIGlzIGRlbGV0ZWQgYWZ0ZXIgcmVhZC4KPiA+Pj4KPiA+Pj4gICAgIFRocmVh
ZCBDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3dvcmtlciB0byBwcm9jZXNzIHBv
c3RfcmVhZF93cQo+ID4+PiAgICAgLSByY3VfZG9fYmF0Y2gKPiA+Pj4gICAgICAtIGYyZnNfZnJl
ZV9pbm9kZQo+ID4+PiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+ID4+PiAgICAgIGlub2RlIGlz
IGZyZWVkIGJ5IHJjdQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtIHByb2Nlc3Nfc2NoZWR1bGVkX3dvcmtzCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19mcmVl
X2RpYwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIGYyZnNfcmVsZWFzZV9kZWNvbXBfbWVtCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVhZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4g
Pj4+Cj4gPj4+IFRoaXMgcGF0Y2ggdXNlIF9faWdldCBiZWZvcmUgZjJmc19mcmVlX2RpYyBhbmQg
aXB1dCBhZnRlciBmcmVlIHRoZSBkaWMuCj4gPj4+Cj4gPj4+IENjOiBEYWVobyBKZW9uZyA8ZGFl
aG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+PiBGaXhlczogYmZmMTM5YjQ5ZDlmICgiZjJmczogaGFu
ZGxlIGRlY29tcHJlc3Mgb25seSBwb3N0IHByb2Nlc3NpbmcgaW4gc29mdGlycSIpCj4gPj4+IFNp
Z25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogQmFvY29uZyBMaXUgPGJhb2NvbmcubGl1QHVuaXNvYy5jb20+Cj4gPj4+IC0t
LQo+ID4+PiB2MjogdXNlIF9faWdldC9pcHV0IGZ1bmN0aW9uCj4gPj4+IC0tLQo+ID4+PiAgZnMv
ZjJmcy9jb21wcmVzcy5jIHwgMTYgKysrKysrKysrKystLS0tLQo+ID4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+Pj4gaW5kZXgg
YjNjMWRmOS4uM2YwYzE4ZCAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4g
Pj4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+PiBAQCAtMTY4Nyw3ICsxNjg3LDcgQEAg
c3RhdGljIHZvaWQgZjJmc19yZWxlYXNlX2RlY29tcF9tZW0oc3RydWN0IGRlY29tcHJlc3NfaW9f
Y3R4ICpkaWMsCj4gPj4+ICB9Cj4gPj4+Cj4gPj4+ICBzdGF0aWMgdm9pZCBmMmZzX2ZyZWVfZGlj
KHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+ID4+PiAtICAgICAgICAgICAgIGJvb2wg
YnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2spOwo+ID4+PiArICAgICAgICAgICAgIGJvb2wgYnlwYXNz
X2Rlc3Ryb3lfY2FsbGJhY2ssIGJvb2wgbGF0ZV9mcmVlKTsKPiA+Pj4KPiA+Pj4gIHN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZjJmc19hbGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2Mp
Cj4gPj4+ICB7Cj4gPj4+IEBAIC0xNzQzLDEyICsxNzQzLDEyIEBAIHN0cnVjdCBkZWNvbXByZXNz
X2lvX2N0eCAqZjJmc19hbGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4gPj4+ICAg
ICAgIHJldHVybiBkaWM7Cj4gPj4+Cj4gPj4+ICBvdXRfZnJlZToKPiA+Pj4gLSAgICAgZjJmc19m
cmVlX2RpYyhkaWMsIHRydWUpOwo+ID4+PiArICAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSwg
ZmFsc2UpOwo+ID4+PiAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4+PiAgfQo+ID4+Pgo+
ID4+PiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHgg
KmRpYywKPiA+Pj4gLSAgICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95X2NhbGxiYWNrKQo+
ID4+PiArICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2ssIGJvb2wgbGF0
ZV9mcmVlKQo+ID4+PiAgewo+ID4+PiAgICAgICBpbnQgaTsKPiA+Pj4KPiA+Pj4gQEAgLTE3NzUs
NiArMTc3NSw4IEBAIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMsCj4gPj4+ICAgICAgIH0KPiA+Pj4KPiA+Pj4gICAgICAgcGFnZV9hcnJheV9m
cmVlKGRpYy0+aW5vZGUsIGRpYy0+cnBhZ2VzLCBkaWMtPm5yX3JwYWdlcyk7Cj4gPj4+ICsgICAg
IGlmIChsYXRlX2ZyZWUpCj4gPj4+ICsgICAgICAgICAgICAgaXB1dChkaWMtPmlub2RlKTsKPiA+
Pj4gICAgICAga21lbV9jYWNoZV9mcmVlKGRpY19lbnRyeV9zbGFiLCBkaWMpOwo+ID4+PiAgfQo+
ID4+Pgo+ID4+PiBAQCAtMTc4MywxNiArMTc4NSwyMCBAQCBzdGF0aWMgdm9pZCBmMmZzX2xhdGVf
ZnJlZV9kaWMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4+PiAgICAgICBzdHJ1Y3QgZGVj
b21wcmVzc19pb19jdHggKmRpYyA9Cj4gPj4+ICAgICAgICAgICAgICAgY29udGFpbmVyX29mKHdv
cmssIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCwgZnJlZV93b3JrKTsKPiA+Pj4KPiA+Pj4gLSAg
ICAgZjJmc19mcmVlX2RpYyhkaWMsIGZhbHNlKTsKPiA+Pj4gKyAgICAgZjJmc19mcmVlX2RpYyhk
aWMsIGZhbHNlLCB0cnVlKTsKPiA+Pj4gIH0KPiA+Pj4KPiA+Pj4gIHN0YXRpYyB2b2lkIGYyZnNf
cHV0X2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYm9vbCBpbl90YXNrKQo+ID4+
PiAgewo+ID4+PiAgICAgICBpZiAocmVmY291bnRfZGVjX2FuZF90ZXN0KCZkaWMtPnJlZmNudCkp
IHsKPiA+Pj4gICAgICAgICAgICAgICBpZiAoaW5fdGFzaykgewo+ID4+PiAtICAgICAgICAgICAg
ICAgICAgICAgZjJmc19mcmVlX2RpYyhkaWMsIGZhbHNlKTsKPiA+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfZnJlZV9kaWMoZGljLCBmYWxzZSwgZmFsc2UpOwo+ID4+PiAgICAgICAgICAg
ICAgIH0gZWxzZSB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICBJTklUX1dPUksoJmRpYy0+
ZnJlZV93b3JrLCBmMmZzX2xhdGVfZnJlZV9kaWMpOwo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgLyogdG8gYXZvaWQgaW5vZGUgaXMgZXZpY3RlZCBzaW11bHRhbmVvdXNseSAqLwo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZkaWMtPmlub2RlLT5pX2xvY2spOwo+ID4+
PiArICAgICAgICAgICAgICAgICAgICAgX19pZ2V0KGRpYy0+aW5vZGUpOwo+ID4+PiArICAgICAg
ICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4gPj4KPiA+
PiBPaCwgaG93IGFib3V0IHVzaW5nIGlncmFiKCkgaW5zdGVhZD8KPiA+IEhpIENoYW8sCj4gPiBh
ZnRlciBJIGNoZWNrIGlncmFiLCBJIHRoaW5rIGl0IGlzIG9rLAo+ID4gYnV0IGhlcmUgV2UgZG9u
J3QgbmVlZCBjYXJlIGFib3V0IGlnYXJiJ3MgcmV0dXJuIHZhbHVlLCByaWdodD8KPgo+IEkgZ3Vl
c3MgInJldHVybiBOVUxMIiBzaG91bGQgYmUgaW1wb3NzaWJsZSBjYXNlLCBidXQgc3RpbGwgd2Ug
Y2FuIGFkZAo+IGYyZnNfYnVnX29uKCkgdG8gZGV0ZWN0IGFueSBwb3RlbnRpYWwgYnVnLCByaWdo
dD8KT0ssIHRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9ucy4KPgo+IFRoYW5rcywKPgo+ID4gVGhh
bmtzIQo+ID4KPiA+Pgo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgcXVldWVfd29yayhGMkZT
X0lfU0IoZGljLT5pbm9kZSktPnBvc3RfcmVhZF93cSwKPiA+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmZGljLT5mcmVlX3dvcmspOwo+ID4+PiAgICAgICAgICAgICAg
IH0KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
