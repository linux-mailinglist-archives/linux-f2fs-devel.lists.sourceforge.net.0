Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414E86A756
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 04:48:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfAvE-0006CM-KR;
	Wed, 28 Feb 2024 03:47:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rfAv9-0006Br-P5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 03:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+QnH1oJZ3yFoqGeTtQaz7Mg98UaDYu9X6FwsvJH2uCg=; b=nIXVhC4Rba6Piwdy9N2PZmbteR
 oWgaoW2r+Bf4cOGXS98Zotw6LHZFA+RTvK5dgnpRFSPAqjvNuaBX6U06P+2uHkOs5h2VJxHFXm32j
 Cd7ExRQIWF4vbPJAvgYGS7Sa5jJasSAzRlWcr4IGCkD5eJUxSV/Eud4TjdpzyQGxFwRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+QnH1oJZ3yFoqGeTtQaz7Mg98UaDYu9X6FwsvJH2uCg=; b=SKgqVLWFKUCuky+BdjN83PQDvb
 /Uvxg4qagMPZoxsxzbaMfT390Vgaq5Zbf4pGyebIMem1qYuMTTPW/NlmntobVKg2drvO0wvqiDGda
 TozYJz+ijJ15r/mfTnrwbc//WqQitKG9htf6xcsQ+OMk4fa8AQMfkP8/5XTOi8xbAT24=;
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfAv6-0004XY-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 03:47:52 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4cbc49dacc2so230092e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 19:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709092057; x=1709696857; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QnH1oJZ3yFoqGeTtQaz7Mg98UaDYu9X6FwsvJH2uCg=;
 b=c7RFbhbDZHER+TfK/ydsiBOvTZjymun0JOpMoXclgSlDwpGHpRMK3n2S5VgfIj3CZz
 SLzj32TsVBcBMToCcnfVJtgpQHZtB6P07+J1MZODYSJs1tWcmX0AfLibVfn8c8eEYafJ
 JqKvI9BJRzF6sLgWb5S8+BTA5E8r6LFqjEECeL4BcxiB52WgCL14gipfrUmcHM7j8Kxi
 BuH9jKtT/nlS7OzPclrp78hcDKGe/ZRDmWtxUc6qWNRGzBimIh3m52qxXDoFvREezQdi
 7Da2QvLcnU+CbqYFZ73TTh/AyDriv2jsD06sYxRbXRewqjAXsBUB/ghjOL8PFbYmzOmy
 idRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709092057; x=1709696857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QnH1oJZ3yFoqGeTtQaz7Mg98UaDYu9X6FwsvJH2uCg=;
 b=CmMHGe+9/LHUt77HoqFdWUl+SRFQlhXH7W2BMcMuLISSMOQEgQRsvD+NU4q1Z4o7lm
 XnSq5noGwDbCFQLoVusMNboD9ZSTTOYlmY6zn1/E0FcjRjqjtdMed6GHcjMGVphpr3T0
 Wh8QiLgrt6WFBVaoPf5AcsZsaY7wgHmc5bGL7rIP4lNbQggR4Dg5bKiogVx6N0ITsgDG
 ghvwV6oPWprQOSZooyziMm7ZrcNksnDwkDWWrL+a2yScW58GnLWBwiWOpUIfCrdrnTyt
 suGzt9sxOGV22Wa3lELrhLP0POgVHaXPH3g7FGYXfOn7hExI1B9B7zXZ2bZVeOVgRyh0
 yBRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeX0waudQ5v8ixPrn9iUSYyJ+DYdiPlws6Mb7AbwDKpKyaIYdQYlFZEDGychyQs/5/ODm9jLK6hOBLIIhy/C3DQfa6Ac0eChc3AH4l/+Va/SmbfZFr7Q==
X-Gm-Message-State: AOJu0YzYyTQaiob+cl0OH005NA8xYKJSCoHuEYfuQXk4XXl1pOOsND7T
 JaQm6hIYfdAuVtA05SmyDpm6+q3G0bM8BRTcFrrnK4YRtzIZX0udtt94uEzpo1FwIAytTnXx40G
 MFx06Onrtd0BEeSiz9/A1Nbd8mA4=
X-Google-Smtp-Source: AGHT+IGfLX2EZzehjczg/V4rHJkkVz/cAZAB4YX34jxqN/1Owyl+Nblq+rWJobsxdyU2j0JF2yBfefhXMBTXuIQSrkQ=
X-Received: by 2002:a1f:6201:0:b0:4c8:a2c6:c2be with SMTP id
 w1-20020a1f6201000000b004c8a2c6c2bemr1046000vkb.8.1709092057664; Tue, 27 Feb
 2024 19:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-5-jaegeuk@kernel.org>
 <CACOAw_xdBY5Rg1J4jUTaH0UxVrdZ+CCVQj72q_cMxyCHuCTy_Q@mail.gmail.com>
 <Zd0VBo3ilwRq4BJy@google.com>
In-Reply-To: <Zd0VBo3ilwRq4BJy@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 27 Feb 2024 19:47:26 -0800
Message-ID: <CACOAw_z+ouZ1Pv0P=LPiwbOKFaBYO-8OKNsU7b62MLwi=Qp4wA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Feb 26, 2024 at 2:47 PM Jaegeuk Kim wrote: > > On
    02/26, Daeho Jeong wrote: > > On Fri, Feb 23, 2024 at 12:56 PM Jaegeuk
   Kim wrote: > > > > > > Don't block mounting the partition, if c [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.170 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfAv6-0004XY-JZ
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs: allow to mount if cap is 100
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgMjo0N+KAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDIvMjYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gT24g
RnJpLCBGZWIgMjMsIDIwMjQgYXQgMTI6NTbigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gRG9uJ3QgYmxvY2sgbW91bnRpbmcgdGhlIHBhcnRp
dGlvbiwgaWYgY2FwIGlzIDEwMCUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvZjJmcy9zZWdtZW50
LmMgfCAzICsrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
ID4gPiBpbmRleCA2ZDU4NmFlOGI1NWYuLmYxMTM2MTE1MmQyYSAxMDA2NDQKPiA+ID4gLS0tIGEv
ZnMvZjJmcy9zZWdtZW50LmMKPiA+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+ID4gQEAg
LTkwNCw2ICs5MDQsOSBAQCBpbnQgZjJmc19kaXNhYmxlX2NwX2FnYWluKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgYmxvY2tfdCB1bnVzYWJsZSkKPiA+ID4gIHsKPiA+ID4gICAgICAgICBpbnQg
b3ZwX2hvbGVfc2VncyA9Cj4gPiA+ICAgICAgICAgICAgICAgICAob3ZlcnByb3Zpc2lvbl9zZWdt
ZW50cyhzYmkpIC0gcmVzZXJ2ZWRfc2VnbWVudHMoc2JpKSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICBpZiAoRjJGU19PUFRJT04oc2JpKS51bnVzYWJsZV9jYXBfcGVyYyA9PSAxMDApCj4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiBXaXRoIHRoaXMsIGYyZnMgd2lsbCBub3Qg
ZXhlY3V0ZSBHQy4gV2hhdCBpcyB0aGlzIDEwMAo+ID4gdW51c2FibGVfY2FwX3BlcmMgdXNlZCBm
b3I/Cj4KPiBUaGVvcml0aWNhbGx5LCBpdCB3b24ndCwgYnV0IEkgd2FzIGhpdHRpbmcgYSBHQyBs
b29wLCBhbmQgSSBzdXNwZWN0ZWQgYSB3cm9uZwo+IHNlY3Rpb24vc2VnbWVudCBsYXlvdXQuIFNv
LCBJIHBvc3RlZCB0aGUgYmVsb3csIGFuZCBndWVzcyB3ZSBuZWVkIHRoaXMgcGF0Y2gKPiBhcyB3
b3JrYXJvdW5kLgo+Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2YyZnMv
cGF0Y2gvMjAyNDAyMjQwMTE0MTEuMzgyMDcxOS0xLWphZWdldWtAa2VybmVsLm9yZy8KClJldmll
d2VkLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKPgo+ID4KPiA+ID4g
ICAgICAgICBpZiAodW51c2FibGUgPiBGMkZTX09QVElPTihzYmkpLnVudXNhYmxlX2NhcCkKPiA+
ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOwo+ID4gPiAgICAgICAgIGlmIChpc19z
YmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRURfUVVJQ0spICYmCj4gPiA+IC0tCj4gPiA+
IDIuNDQuMC5yYzAuMjU4Lmc3MzIwZTk1ODg2LWdvb2cKPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiA+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
