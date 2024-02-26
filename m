Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E306867DEF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 18:18:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reecD-0000P2-4V;
	Mon, 26 Feb 2024 17:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1reecC-0000Ou-2N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 17:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NAVwApJhl3od3oLSzjzXFngZMESNrDGR/c4sLez2SP4=; b=Ok4GZo15YpesamFgfps2DC5iRa
 8rTp1Dfl2CJIaZ0AUGH3fAvnnlhiNprWhx21/SuI0Gh86UpvikbubTEk82b3QZOLIALojihSgc40E
 jiBRHdm5Zi06HAVmtMMbjLjL61KUbKLZJX/pZNqEMvvEjmplZsaELhbH1Y3rA39JVLC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NAVwApJhl3od3oLSzjzXFngZMESNrDGR/c4sLez2SP4=; b=QYnHiuo71X7bQQ4BEIw+y/iPqR
 SUml5hm/5lTURu3Pr4AMmrvtrtiP23gaot6kzlNq7/MtjXGDGB7PPxA03XPaUTxuTecsNJNl37MUW
 I7Cb+3RBhBNQG5R8pB3GfIc8aFmlA1U/AFGo1ctqMaDHI41GQ/5867ATm1AzPIXbNDgQ=;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1reecB-00030S-8C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 17:18:08 +0000
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3c19927792cso214084b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708967881; x=1709572681; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAVwApJhl3od3oLSzjzXFngZMESNrDGR/c4sLez2SP4=;
 b=QvAaFIzYJkkN7C3mOie8nEDrTKyqxKskQ+K8RclUtJ1KfkCidU+GpL5WRl+zqpr2gt
 SKTrFucYhZKVA3/Dio0UHfwgb/rPjaO0gNkTSk6PIWzAAE87jTjNEvebMe5dkuoXpkO+
 hIfhbTR8LodoBn+tDE3UagR5DuftyUQzabfW7BD4fS/FFchdxrn+51JVnmrW8n5CEq1X
 h+PSiqHGjm5ADiUMW4DG28CbUPcJt+mxkvlh7OV5flnx95p50JNRdP4u2+R3Pou/pwAC
 pUe0ZTSinSmiTOAQoO5MuSDNSQoO6hmgroeUDNOk7Gdwq5N4aWF0RLEJzbYu1lqhgUw/
 Fh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708967881; x=1709572681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAVwApJhl3od3oLSzjzXFngZMESNrDGR/c4sLez2SP4=;
 b=lrUGJa34BHEEwBvvzw0JzgRcFbCtma/ndjGCRNLMIluMds5scX2qbyu03g1JaKCrxJ
 4axCTBFM6oX6nbLIhZKqhq46JQuF+LUlvKF/7BeYnBiBArhl80jIGccB99479bD0M+c0
 gfdhREzkZZK0HqQLvUYEWTUfEsIn+//tfnIUducZvfsTPY7WhahCj9G7MKqYXcrDuHVr
 2Rb30iZSItdnv1GWkqNAw44F+EGKNBOq4AncgQ/EoNwegYLGuvjeUpZlAKZ4mS+huwOJ
 MXqQE2NQgJnoBFP8uYP3ibCkG5CIxzGup15x+77o66rzF4gVcAylLuyJJo7oIHa+WFpZ
 ODeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6OeLsxfGOapPoLMW4gbKQizmI+aGn3uzav/bUQ64W+YFYi2ynSG6axDVgbuByACB/XpxcViV6Vt7EzcpNfsckN0Zqmm5W5AJTouoNBdNzf02VgzhdBw==
X-Gm-Message-State: AOJu0YwKt4iyBI79lNTHKBhJTTmVUYV3tw/w359SGFNXb4zL+goEmT36
 XuBDLGaYySrvzPsG3AusKy0EaGpTwy9b+AHvgGlVoqTA3ebBEPD3YyJjmEZXzCcaeXveVNLOGxd
 m9D7k5KK/mz5IECo2N1H2V4z/LmY=
X-Google-Smtp-Source: AGHT+IHlwotQLUh9i9aTfOKfEJh6sdq3ccECmDnrFEW5VqxgZO7vkzNQjt53ccJRVVMlnXlBqCZPUSo45ybxKNp97/w=
X-Received: by 2002:a05:6871:4e88:b0:21e:7156:a6ad with SMTP id
 uk8-20020a0568714e8800b0021e7156a6admr6879866oab.48.1708967881293; Mon, 26
 Feb 2024 09:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <afa444c5-7ac1-457e-9559-6d7c6623c426@kernel.org>
In-Reply-To: <afa444c5-7ac1-457e-9559-6d7c6623c426@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 26 Feb 2024 09:17:50 -0800
Message-ID: <CACOAw_zpmxHnG_n4pyKzqWEY2cGyJ5fQXuWfBgDx8-V0Nqu8QA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Feb 25, 2024 at 6:42 PM Chao Yu wrote: > > On 2024/2/24
    4:55, Jaegeuk Kim wrote: > > In cfd66bb715fd ("f2fs: fix deadloop in foreground
    GC"), we needed to check > > the number of blocks in [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.179 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1reecB-00030S-8C
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: check number of blocks in a
 current section
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBGZWIgMjUsIDIwMjQgYXQgNjo0MuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzIvMjQgNDo1NSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiBJ
biBjZmQ2NmJiNzE1ZmQgKCJmMmZzOiBmaXggZGVhZGxvb3AgaW4gZm9yZWdyb3VuZCBHQyIpLCB3
ZSBuZWVkZWQgdG8gY2hlY2sKPiA+IHRoZSBudW1iZXIgb2YgYmxvY2tzIGluIGEgc2VjdGlvbiBp
bnN0ZWFkIG9mIHRoZSBzZWdtZW50Lgo+ID4KPiA+IEluIGFkZHRpb24sIGxldCdzIGNoZWNrIHRo
ZSBlbnRpcmUgbm9kZSBzZWN0aW9ucyB3aGVuIGNoZWNraW5nIHRoZSBhdmFpYWJsZQo+ID4gbm9k
ZSBibG9jayBzcGFjZS4gSXQgZG9lcyBub3QgbWF0Y2ggb25lIHRvIG9uZSBwZXIgdGVtcGVyYXR1
cmUsIGJ1dCBjdXJyZW50bHkKPgo+IEkgdGVzdGVkIHRoaXMgcGF0Y2ggdy8gdGVzdGNhc2UgaW4g
WzFdLCBpdCBkb2Vzbid0IGNvbXBsYWluLgo+Cj4gWzFdIGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE1OTE0Cj4KPiA+IHdlIGRvbid0IGhhdmUgZXhhY3QgZGly
dHkgcGFnZSBjb3VudCBwZXIgdGVtcGVyYXR1cmUuIEhlbmNlLCB1c2UgYSByb3VnaAo+ID4gZXN0
aW1hdGlvbi4KPgo+IERvIHdlIG5lZWQgbW9yZSBhY2N1cmF0ZSBwZXItdGVtcGVyYXR1cmUgZGly
dHkgbm9kZSBjb3VudCBmb3IgZXh0cmVtZQo+IGNvcm5lciBjYXNlPwo+Cj4gZS5nLiBub2RlX2Js
b2NrcyBpcyBjb3VudGVkIGZyb20gaG90IGRpcnR5IG5vZGVzLCBhbmQgY3VycmVudCBob3Rfbm9k
ZQo+IGxvZyBoYXMgbm8gZW5vdWdoIGZyZWUgc3BhY2UgZm9yIGl0Lgo+Cj4gVGhhbmtzLAo+Cj4g
Pgo+ID4gRml4ZXM6IGNmZDY2YmI3MTVmZCAoImYyZnM6IGZpeCBkZWFkbG9vcCBpbiBmb3JlZ3Jv
dW5kIEdDIikKPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5v
cmc+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9zZWdtZW50LmggfCAyMiArKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3Nl
Z21lbnQuaAo+ID4gaW5kZXggM2VkZDM4MDliNmI1Li4xNWJmNWVkZDliM2MgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmgKPiA+IEBA
IC01NjEsMjMgKzU2MSwyMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2N1cnNlZ19lbm91Z2hf
c3BhY2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBub2RlX2Jsb2NrcywgdW5zaWduZWQgaW50IGRlbnRfYmxvY2tzKQo+ID4g
ICB7Cj4gPgo+ID4gLSAgICAgdW5zaWduZWQgaW50IHNlZ25vLCBsZWZ0X2Jsb2NrczsKPiA+ICsg
ICAgIHVuc2lnbmVkIHNlZ25vLCBsZWZ0X2Jsb2NrczsKPiA+ICAgICAgIGludCBpOwo+ID4KPiA+
IC0gICAgIC8qIGNoZWNrIGN1cnJlbnQgbm9kZSBzZWdtZW50ICovCj4gPiArICAgICAvKiBjaGVj
ayBjdXJyZW50IG5vZGUgc2VjdGlvbnMsIHdoaWNoIGNvdW50cyB2ZXJ5IHJvdWdobHkgKi8KPiA+
ICsgICAgIGxlZnRfYmxvY2tzID0gMDsKPiA+ICAgICAgIGZvciAoaSA9IENVUlNFR19IT1RfTk9E
RTsgaSA8PSBDVVJTRUdfQ09MRF9OT0RFOyBpKyspIHsKPiA+ICAgICAgICAgICAgICAgc2Vnbm8g
PSBDVVJTRUdfSShzYmksIGkpLT5zZWdubzsKPiA+IC0gICAgICAgICAgICAgbGVmdF9ibG9ja3Mg
PSBmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzYmksIHNlZ25vKSAtCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZXRfc2VnX2VudHJ5KHNiaSwgc2Vnbm8pLT5ja3B0X3ZhbGlkX2Js
b2NrczsKPiA+IC0KPiA+IC0gICAgICAgICAgICAgaWYgKG5vZGVfYmxvY2tzID4gbGVmdF9ibG9j
a3MpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKyAgICAgICAg
ICAgICBsZWZ0X2Jsb2NrcyArPSBDQVBfQkxLU19QRVJfU0VDKHNiaSkgLQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZ2V0X2NrcHRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRy
dWUpOwo+ID4gICAgICAgfQo+ID4gKyAgICAgaWYgKG5vZGVfYmxvY2tzID4gbGVmdF9ibG9ja3Mp
Cj4gPiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKCkkgYW0gbm90IHN1cmUgdGhpcyBpcyBv
a2F5LiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBmMmZzIG1heSBub3QKYmUgb3B0aW1h
bCB3aGVuIHRoZSBIT1RfTk9ERSBzZWN0aW9uJ3Mgc3BhY2UgcmVxdWlyZW1lbnRzIGV4Y2VlZCBp
dHMKY3VycmVudCBjYXBhY2l0eS4gSW4gc3VjaCBjYXNlcywgZjJmcyBuZWNlc3NpdGF0ZXMgdGhl
IGNyZWF0aW9uIG9mIGEKbmV3IGZyZWUgc2VjdGlvbiB0byBhY2NvbW1vZGF0ZSB0aGUgb3ZlcmZs
b3csIGV2ZW4gdGhvdWdoIHRoZXJlIG1pZ2h0CmJlIGZyZWUgc3BhY2UgYXZhaWxhYmxlIGluIG90
aGVyIE5PREUgc2VjdGlvbnMuIFRvIGFkZHJlc3MgdGhpcyBpc3N1ZSwKaXQgbWF5IGJlIG5lY2Vz
c2FyeSB0byBpbXBsZW1lbnQgYSBtb3JlIGFjY3VyYXRlIGFjY291bnRpbmcgc3lzdGVtIGZvcgpO
T0RFIHNlY3Rpb25zIGJhc2VkIG9uIHRoZWlyIHRlbXBlcmF0dXJlIGxldmVscy4KCj4gPgo+ID4g
LSAgICAgLyogY2hlY2sgY3VycmVudCBkYXRhIHNlZ21lbnQgKi8KPiA+ICsgICAgIC8qIGNoZWNr
IGN1cnJlbnQgZGF0YSBzZWN0aW9uIGZvciBkZW50cnkgYmxvY2tzLiAqLwo+ID4gICAgICAgc2Vn
bm8gPSBDVVJTRUdfSShzYmksIENVUlNFR19IT1RfREFUQSktPnNlZ25vOwo+ID4gLSAgICAgbGVm
dF9ibG9ja3MgPSBmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzYmksIHNlZ25vKSAtCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgZ2V0X3NlZ19lbnRyeShzYmksIHNlZ25vKS0+Y2twdF92YWxpZF9i
bG9ja3M7Cj4gPiArICAgICBsZWZ0X2Jsb2NrcyA9IENBUF9CTEtTX1BFUl9TRUMoc2JpKSAtCj4g
PiArICAgICAgICAgICAgICAgICAgICAgZ2V0X2NrcHRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8s
IHRydWUpOwo+ID4gICAgICAgaWYgKGRlbnRfYmxvY2tzID4gbGVmdF9ibG9ja3MpCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gQEAgLTYy
Niw3ICs2MjYsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNz
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Cj4gPiAgICAgICBpZiAoZnJlZV9zZWNzID4g
dXBwZXJfc2VjcykKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gLSAgICAgZWxz
ZSBpZiAoZnJlZV9zZWNzIDw9IGxvd2VyX3NlY3MpCj4gPiArICAgICBpZiAoZnJlZV9zZWNzIDw9
IGxvd2VyX3NlY3MpCj4gPiAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICAgcmV0
dXJuICFjdXJzZWdfc3BhY2U7Cj4gPiAgIH0KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
