Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E2263960
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Sep 2020 01:23:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kG9RN-00016m-Dk; Wed, 09 Sep 2020 23:23:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kG9RM-00016f-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 23:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yl188sYExyD90GkGlBv3BhIbGYC9T3G2g/05Tggzfnw=; b=eY93GAMwkYHHNOXyScScoL3+e+
 20GjdEMsagejjEVjCxyXpRpwhn+OdabhUD1HXFrSKIbSiXsXKr6cm+tLs7BomBML/2IuX9G+bXMNy
 zrhTsZYMqLx1F0m0yv7YrtsX7jPxTVVXwAXMjyA7VuRnOrm5EgUEA8ueSVYAnTm6nETg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yl188sYExyD90GkGlBv3BhIbGYC9T3G2g/05Tggzfnw=; b=moK569bwuYNQziH34XljTTRObc
 DcJxKq7ZIpDlhb9feWNbP783R4kqtp1ZzNIF+ROS2EmQIkKE97q5UrMJZyh4jjjw4SNqfAvmAcREp
 LxG58Egr0PZhicXOqlUE2Vke6L/HSIXvNtYFiOVbR5BosIPWOkhInTNdnRmnLjBuSbKY=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kG9RG-001DxM-73
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 23:23:48 +0000
Received: by mail-lf1-f49.google.com with SMTP id d15so2510975lfq.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Sep 2020 16:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yl188sYExyD90GkGlBv3BhIbGYC9T3G2g/05Tggzfnw=;
 b=VxfEaHf9+nL+R2k+5le9H9YNehcUR633iVDOtcpItDj5uw4ygLrSb9Cs/iP0lTLExE
 2vj6cnYiqIpwdVHsnSbU1ggz6teLUODzSsuBP24F2DsBkeAUxi+eYtkP9+Jsleu0PUWx
 F59zR+gvWpK70BVa98dDHlayuC7om5SYx7Gj69U1GHpWh/Gil6Xiwwi23U8zRnY2AV1p
 xdLEINiD6X75kO31RJ9Q6XNOswjoKStJdVuXOxJgq7CaFHNVSRXMj2bi0SbPOr9xxqYb
 BuX/UYnc9ML9tNResZ/r/6rkxhryRGOOVHq22wuFuZOzzpbNp3wO/5fLxTKERS2SNR8F
 w4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yl188sYExyD90GkGlBv3BhIbGYC9T3G2g/05Tggzfnw=;
 b=jusLtm1dzcaRLbZZbF0zloyD8QMwRiVZ4nsMxqQl0CnsWVJvKLllHdn+gDyKNVhn2X
 jQnqts2C1SoONhVL6RNQbA5Rcf+58yYM51veE3TKI56onSnjsJOJd3+uXcvJIRsCGEXB
 z8cCg5QgUmtnoHblmqMiO6aOMQc1xeOAt0+w0eRzodRArF0l6sF12RectoJOaCYNOBuG
 o0kI5nsloeG/B3NsLI6ZP+nF9iI6bcPE49PpZ3qCCoUdrkTTyaQiKKsvlfbQWmj0Dzpe
 uTCnP0Hj4RyaUG2WjSE+D4QqfW/+wWb3s4qEo1vNgNMMyn9Wq55CVaWjj8N+fAhcXyK7
 eRIA==
X-Gm-Message-State: AOAM532YoQ8DvTslfCMi8foKhSVD8w5pDNtfbFQV6xm3S+LadPlbeAS+
 Z++brG6+afSK/xwh9DfUFOMSweUAH864Ma1ceb4=
X-Google-Smtp-Source: ABdhPJxJzBHtPDcsWnz08jMs86wkQnZumqyOghJZZb+fnRl/+we6VfuDQMOvv9auplBrmAuyPPgzQsC+QsLwSKe/4MA=
X-Received: by 2002:a19:5e19:: with SMTP id s25mr2812753lfb.196.1599693808198; 
 Wed, 09 Sep 2020 16:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <CACOAw_wHONVJL438_Akvo3wZewJeVKiT_8LqW0EXULxAscpGjA@mail.gmail.com>
 <220b1cb4-9c2e-c9db-5590-6dcd43b9aaed@huawei.com>
In-Reply-To: <220b1cb4-9c2e-c9db-5590-6dcd43b9aaed@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 10 Sep 2020 08:23:17 +0900
Message-ID: <CACOAw_zoA5PKY7sbzZtria+jjuFSQ3RormTYn83rz7NAOkxtxw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kG9RG-001DxM-73
Subject: Re: [f2fs-dev] Question about STEP_DECOMPRESS_NOWQ
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R290IGl0LiBJIG1pc3VuZGVyc3Rvb2QgdGhhdCBpcyBzb21lIHJlc2lkdWUgb2YgdHJ5aW5nIHRv
IGltcGxlbWVudApzb2Z0aXJxIGNvbnRleHQgZGVjb21wcmVzc2lvbi4gOikKCjIwMjDrhYQgOeyb
lCA57J28ICjsiJgpIOyYpO2bhCA0OjE1LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY
7J20IOyekeyEsToKPgo+IEhpIERhZWhvLAo+Cj4gT24gMjAyMC85LzkgMTI6NDMsIERhZWhvIEpl
b25nIHdyb3RlOgo+ID4gSGkgQ2hhbywKPiA+Cj4gPiBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCB0
aGUgYmVsb3cgZmxhZyBmb3IgZGVjb21wcmVzc2lvbi4KPiA+Cj4gPiBTVEVQX0RFQ09NUFJFU1Nf
Tk9XUSwgICAgICAgICAgIC8qIGhhbmRsZSBub3JtYWwgY2x1c3RlciBkYXRhIGlucGxhY2UgKi8K
PiA+Cj4gPiBBY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnQsIHlvdSBhZGRlZCB0aGlzIGZvciB1c2lu
ZyBpbnBsYWNlCj4KPiBJIGFkZGVkIHRoaXMgZm9yIHRoZSBjb25kaXRpb24gdGhhdDogaW4gY29t
cHJlc3NlZCBpbm9kZSwgcGFydGlhbCBjbHVzdGVycyBhcmUKPiB3cml0dGVuIGFzIG5vcm1hbCAo
bm9uLWNvbXByZXNzZWQpIG9uZSBkdWUgdG8gYmFkIGNvbXByZXNzIHJhdGlvLCBkdXJpbmcgcmVh
ZGluZwo+IGRhdGEgaW4gbm9ybWFsIGNsdXN0ZXIsIHdlIGRvbid0IG5lZWQgdG8gcXVldWUgdGhl
bSBpbiB3b3JrcXVldWUsIGluc3RlYWQsIHdlCj4gY2FuIGp1c3QgaGFuZGxlIHRoZW0gaW4gSVJR
IGNvbnRleHQgKGVuZF9pbygpKS4KPgo+IFRoYXQgc2F5cywgaWYgYWxsIHBhZ2VzIGluIGJpbyBh
cmUgbm9uLWNvbXByZXNzZWQsIHdlIHRhZyBzdGVwIHcvIFNURVBfREVDT01QUkVTU19OT1dRLAo+
IG9uY2UgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHBhZ2UgaXMgY29tcHJlc3NlZCwgd2UgY2hhbmdl
IHN0ZXAgdG8KPiBTVEVQX0RFQ09NUFJFU1MuCj4KPiA+IGRlY29tcHJlc3Npb24gYnV0IGlucGxh
Y2UgZGVjb21wcmVzc2lvbiBtb2RlIGlzIG5vdCBiZWluZyBhY3RpdmF0ZWQKPgo+ICdpbnBsYWNl
IGRlY29tcHJlc3Npb24nIG1lYW5zIGRlY29tcHJlc3MgaW4KPiBhLiByZWFkZXIgdGhyZWFkIG9y
Cj4gYi4gSVJRIGNvbnRleHQgPwo+Cj4gVGhhbmtzCj4KPiA+IG5vdywgc2luY2Ugd2UgYXJlIHNl
dHRpbmcgU1RFUF9ERUNPTVBSRVNTIHJpZ2h0IGFmdGVyIGJpb19hZGRfcGFnZSgpLgo+ID4KPiA+
ICAgICAgICAgICAgICAgICAgaWYgKGJpb19hZGRfcGFnZShiaW8sIHBhZ2UsIGJsb2Nrc2l6ZSwg
MCkgPCBibG9ja3NpemUpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBzdWJtaXRf
YW5kX3JlYWxsb2M7Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAvKiB0YWcgU1RFUF9ERUNPTVBS
RVNTIHRvIGhhbmRsZSBJTyBpbiB3cSAqLwo+ID4gICAgICAgICAgICAgICAgICBjdHggPSBiaW8t
PmJpX3ByaXZhdGU7Cj4gPiAgICAgICAgICAgICAgICAgIGlmICghKGN0eC0+ZW5hYmxlZF9zdGVw
cyAmICgxIDw8IFNURVBfREVDT01QUkVTUykpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
IGN0eC0+ZW5hYmxlZF9zdGVwcyB8PSAxIDw8IFNURVBfREVDT01QUkVTUzsKPiA+Cj4gPiBEaWQg
eW91IG1lYW4gdG8gZGVhY3RpdmF0ZSBpbnBsYWNlIGRlY29tcHJlc3Npb24gbW9kZSBvbiBwdXJw
b3NlLAo+ID4gc2luY2UgaXQgaGFkIGFuIGlzc3VlPyBJIGFtIGEgbGl0dGxlIGJpdCBjb25mdXNl
ZCBhYm91dCB0aGlzLgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gPiAuCj4gPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
