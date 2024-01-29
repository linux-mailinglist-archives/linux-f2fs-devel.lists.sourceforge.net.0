Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E8840A73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 16:48:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUTrj-0006D4-J4;
	Mon, 29 Jan 2024 15:48:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rUTrj-0006Cy-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 15:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ODjba7daqQSA/bpemrGWhqRuyPAJHOSTchEASYwM++Q=; b=aCAS0VVlqGJFpsOFyAM8xcttOH
 Fi+CTjiAMeDu+m5gswxYbLHHh3LAy6l3QthASZSwVRAJOIXkYpVwsXcCjJA7N7w3RO6EO9UbjiJgv
 oFdlHcVQiG0orpp8FoPohcJTCtlnU+tjMZ1l793Ny9OJeylLc5iTJl8eZqhfNM11JZ9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ODjba7daqQSA/bpemrGWhqRuyPAJHOSTchEASYwM++Q=; b=WcQdJeMU3pg//sKWWMIrov7Eky
 87ceRN1uPzOXuYM374FRzPEjlgVoYrZ9ezmahORgZJobvrnB85RW6lcdYmt1gs5qqtzjswT2eE60y
 6AQcULXaF/1teDrezXY9Oabd8h4dZO4K3HHkalobpSvl/V+bityrbQdavyGhTi9IxmJI=;
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUTri-00017u-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 15:48:07 +0000
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-4bddb27e832so427179e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jan 2024 07:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706543281; x=1707148081; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODjba7daqQSA/bpemrGWhqRuyPAJHOSTchEASYwM++Q=;
 b=YwiXcJfD1au46VEcSnXUDFjF6EFSxhpy+UtHCpZSQ849sWs/mt0fwcnHIt7wZsX9YH
 SZEeH8w/5jU4hmNQNm62dP+gyxVEpACWaGcnjQntQiqoWV3O2HESn5M6xgDhggK17SKH
 +ozxcoeNwZdqF8JD/PXQ5gPCawKWsSom9nhIReevR59grM2nn9O+NCi8IGtActmFIlNe
 qQOAS2CNx+gKRfk5BoaoTCOOICgIqrofHJAwxjRR9ECaP4XUVAhC/pJqZ7DX+23LdT5/
 ghXLXct7d8eeiEyc9Nok8RQeXpbXm7joi4NZDmWJJmvUQJfHGv1ovGN7H9gDG355u+sw
 tOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706543281; x=1707148081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODjba7daqQSA/bpemrGWhqRuyPAJHOSTchEASYwM++Q=;
 b=BYOaWzwRmRZrNZP5Rn08SlUQ3lFmYwVfE/aOKJpZ1BHOr6q0uZRRl9Ye68V8gQm/1R
 /xuVEZ5V1UxIOLqTOKBxnnvIT7vFOhw1om3stlmztpBPzS2nMTqqhR43P5cGSvymAzXT
 acwcIuHz/J695fPlqB2dIEIjCOADtG0EykOUPrADR6um6vw+wURiCk0MQRkbdtBP552a
 UtfvfLEVgLO+OhDbTv7jOgNoCcwEZZK7AAXsF29qMqjQI0jmpKZ9Vv+DyaLg24PUx8Y6
 3L9YijXCAbljDu0XEu9gYJ6I9WCGAqmg1VBcBTjSoDwdVQuFZhC7BJXPeOnCRAQ5Z96z
 ot6A==
X-Gm-Message-State: AOJu0YwYXfMcxK+ORaXo5n0B9kNggssBZEJrFTYmR1XW8a6X9M4OvHjE
 JUwCH8ww4gUs5xGBCJzazgUdEbeuGCb5k5R28uywnxvch4SlV8si8AOqLq9Ewa6BeyZsi85JE70
 mnfE8yfegSxKx3s/KdsmG7WTdIRQ=
X-Google-Smtp-Source: AGHT+IH4QDAGFfXnGhrLRLY6rwy51DbyBy7RrfW9QB8vtw0tWsB2LtFxMP4Js/YSviWWCO9pjcat/Nbe9mcYfXqywaQ=
X-Received: by 2002:a05:6122:4e88:b0:4bd:8a18:2b8a with SMTP id
 gf8-20020a0561224e8800b004bd8a182b8amr2197406vkb.24.1706543281055; Mon, 29
 Jan 2024 07:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
 <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
 <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
In-Reply-To: <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 29 Jan 2024 07:47:49 -0800
Message-ID: <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Jan 28, 2024 at 5:27 PM Chao Yu wrote: > > On 2024/1/27
    2:17, Daeho Jeong wrote: > > On Thu, Jan 25, 2024 at 5:27 PM Chao Yu wrote:
    > >> > >> On 2024/1/26 0:25, Daeho Jeong wrote: > >> [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.176 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUTri-00017u-Bc
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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

T24gU3VuLCBKYW4gMjgsIDIwMjQgYXQgNToyN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEvMjcgMjoxNywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBUaHUsIEphbiAyNSwgMjAyNCBhdCA1OjI34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvMS8yNiAwOjI1LCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+Pj4gT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNzozNOKAr1BNIENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gK0NjIFlvbmdwZW5nIFlhbmcKPiA+Pj4+Cj4g
Pj4+PiBEYWVobywKPiA+Pj4+Cj4gPj4+PiBZb25ncGVuZyByZXBvcnRzIGEgcG90ZW50aWFsIGlz
c3VlOiBpZiBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMgaXMKPiA+Pj4+IGxhcmdlciB0aGFu
IHNlZ21lbnRzIG9mIG1haW5hcmVhLCBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSB3aWxsIGV4
Y2VlZAo+ID4+Pj4gZW5kIGJvdW5kYXJ5IG9mIG1haW5hcmVhLiBDb3VsZCB5b3UgcGxlYXNlIGNo
ZWNrIHRoYXQ/IHRob3VnaCBpdCdzIGEgY29ybmVyCj4gPj4+PiBjYXNlLgo+ID4+Pgo+ID4+PiBD
YW4geW91IGVsYWJvcmF0ZSBtb3JlPwo+ID4+Cj4gPj4gU2luY2UgYy5jdXJfc2VnW0NVUlNFR19I
T1RfTk9ERV0gaXMgYW4gb2Zmc2V0IHN0YXJ0ZWQgZnJvbSBtYWluX2Jsa2FkZHIuCj4gPgo+ID4g
T2gsIEdvdCBpdC4KPiA+IFRoZW4sIGhvdyBhYm91dCB0aGlzPwo+ID4KPiA+ICAgICAgICAgICBj
LmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9I
TSA/Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIChjLmRldmljZXNbMV0uc3RhcnRfYmxr
YWRkciAtCj4gPiBnZXRfc2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZyA6IDA7Cj4K
PiBCZXR0ZXIsIGJ1dCBsb2cgaGVhZGVyIHNob3VsZCBhbGlnbiB0byBzdGFydCBibGthZGRyIG9m
IHpvbmU/CgpJdCdzIGFscmVhZHkgYWxpZ25lZCBoZXJlLgoKICAgICAgICBpZiAoYy56b25lZF9t
b2RlICYmIGMubmRldnMgPiAxKQogICAgICAgICAgICAgICAgem9uZV9hbGlnbl9zdGFydF9vZmZz
ZXQgKz0KICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1swXS50b3RhbF9zZWN0b3Jz
ICogYy5zZWN0b3Jfc2l6ZSkgJQp6b25lX3NpemVfYnl0ZXM7CgouLi4KCiAgICAgICAgZm9yIChp
ID0gMDsgaSA8IGMubmRldnM7IGkrKykgewogICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkgewog
ICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0udG90YWxfc2VnbWVudHMgPQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjLmRldmljZXNbaV0udG90YWxfc2VjdG9ycyAq
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5zZWN0b3Jfc2l6ZSAtIHpvbmVfYWxp
Z25fc3RhcnRfb2Zmc2V0KSAvCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VnbWVu
dF9zaXplX2J5dGVzOwogICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0uc3RhcnRf
YmxrYWRkciA9IDA7CiAgICAgICAgICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpXS5lbmRfYmxr
YWRkciA9IGMuZGV2aWNlc1tpXS50b3RhbF9zZWdtZW50cyAqCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuYmxrc19wZXJfc2VnIC0gMSArCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiLT5zZWdtZW50MF9ibGth
ZGRyOwogICAgICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgICAgICAgICAgYy5k
ZXZpY2VzW2ldLnRvdGFsX3NlZ21lbnRzID0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjLmRldmljZXNbaV0udG90YWxfc2VjdG9ycyAvCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKGMuc2VjdG9yc19wZXJfYmxrICogYy5ibGtzX3Blcl9zZWcpOwogICAgICAgICAgICAg
ICAgICAgICAgICBjLmRldmljZXNbaV0uc3RhcnRfYmxrYWRkciA9CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaSAtIDFdLmVuZF9ibGthZGRyICsgMTsK
Ci4uLgoKICAgICAgICB0b3RhbF9tZXRhX3pvbmVzID0gWk9ORV9BTElHTih0b3RhbF9tZXRhX3Nl
Z21lbnRzICoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Yy5ibGtzX3Blcl9zZWcpOwoKICAgICAgICBzZXRfc2IobWFpbl9ibGthZGRyLCBnZXRfc2Ioc2Vn
bWVudDBfYmxrYWRkcikgKyB0b3RhbF9tZXRhX3pvbmVzICoKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjLnNlZ3NfcGVyX3pvbmUgKiBjLmJsa3NfcGVyX3NlZyk7Cgo+Cj4gVGhhbmtz
LAo+Cj4gPgo+ID4+IElmIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdhcyBhc3NpZ25lZCB3
LyBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMsCj4gPj4gYW5kIGMuZGV2aWNlc1swXS50b3Rh
bF9zZWdtZW50cyBpcyBsYXJnZXIgdGhhbiBzZWdtZW50cyBvZiBtYWluYXJlLAo+ID4+IGMuY3Vy
X3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkIHRoZSBlbmQgYm91bmRhcnkgb2YgbWFp
bmFyZWEuCj4gPj4KPiA+PiAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMu
em9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyA6IDA7Cj4gPj4KPiA+Pj4gSW4gdGhlIGNh
c2Ugb2YgRjJGU19aT05FRF9ITSwgd2UgaGF2ZSB0aGUgZGV2aWNlc1sxXS4KPiA+Pj4gRG8geW91
IG1lYW4gdGhlIGNhc2Ugd2UgZm9ybWF0IHRoZSBmaWxlc3lzdGVtIGludGVudGlvbmFsbHkgc21h
bGxlcgo+ID4+PiB0aGFuIHdoYXQgZGV2aWNlcyBoYXZlPwo+ID4+Cj4gPj4gSSBtZWFuIGJsZXcg
Y2FzZToKPiA+PiBkZXZpY2VbMF06IGNvbnZlbnRpb25hbCBkZXZpY2Ugc2l6ZSA9IDEwMjQwIE1C
Cj4gPj4gZGV2aWNlWzFdOiB6b25lIGRldmljZSBzaXplID0gMiBNQgo+ID4+Cj4gPj4gVGhhbmtz
LAo+ID4+Cj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xLzE4IDc6MDAsIERhZWhvIEplb25n
IHdyb3RlOgo+ID4+Pj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4gPj4+Pj4KPiA+Pj4+PiBNYWtlIHRvIGFsbG9jYXRlIGxvZ3MgYWZ0ZXIgY29udmVudGlvbmFs
IGFyZWEgZm9yIEhNIHpvbmVkIGRldmljZXMgdG8KPiA+Pj4+PiBzcGFyZSB0aGVtIGZvciBmaWxl
IHBpbm5pbmcgc3VwcG9ydC4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pj4gLS0tCj4gPj4+Pj4gICAgIG1rZnMv
ZjJmc19mb3JtYXQuYyB8IDMgKystCj4gPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9ta2Zz
L2YyZnNfZm9ybWF0LmMgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiA+Pj4+PiBpbmRleCBmMjg0MGM4
Li45MWE3ZjRiIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL21rZnMvZjJmc19mb3JtYXQuYwo+ID4+Pj4+
ICsrKyBiL21rZnMvZjJmc19mb3JtYXQuYwo+ID4+Pj4+IEBAIC01NTcsNyArNTU3LDggQEAgc3Rh
dGljIGludCBmMmZzX3ByZXBhcmVfc3VwZXJfYmxvY2sodm9pZCkKPiA+Pj4+PiAgICAgICAgICAg
ICAgICAgYy5jdXJfc2VnW0NVUlNFR19DT0xEX0RBVEFdID0gMDsKPiA+Pj4+PiAgICAgICAgICAg
ICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX0RBVEFdID0gbmV4dF96b25lKENVUlNFR19DT0xE
X0RBVEEpOwo+ID4+Pj4+ICAgICAgICAgfSBlbHNlIGlmIChjLnpvbmVkX21vZGUpIHsKPiA+Pj4+
PiAtICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdID0gMDsKPiA+Pj4+PiAr
ICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdID0gYy56b25lZF9tb2RlbCA9
PSBGMkZTX1pPTkVEX0hNID8KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2Vz
WzBdLnRvdGFsX3NlZ21lbnRzIDogMDsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgYy5jdXJfc2Vn
W0NVUlNFR19XQVJNX05PREVdID0gbmV4dF96b25lKENVUlNFR19IT1RfTk9ERSk7Cj4gPj4+Pj4g
ICAgICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfQ09MRF9OT0RFXSA9IG5leHRfem9uZShD
VVJTRUdfV0FSTV9OT0RFKTsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNF
R19IT1RfREFUQV0gPSBuZXh0X3pvbmUoQ1VSU0VHX0NPTERfTk9ERSk7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
