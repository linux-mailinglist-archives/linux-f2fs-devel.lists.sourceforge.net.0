Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05015B116D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 05:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym/XG0tncHU6bFM53HZp7/fFQ2WleLm/FPL8WfujpFc=; b=i2UspKlFJRd9S5PVF//INUpWQ0
	9OwQ2+0OeLV6xpWfUIhtY6G9H5PnpjoKQOB8tv1575GS7j6rJr3sBjLsXOX8JUzzarF3tSgmSznUD
	Wt8juaGPkOQwcGYpf7EJqPyrBVO8PatC/vG/bE2LW9CHxlsUgKFxrwiMhE3QWoKL69SM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf8kK-0004BA-E1;
	Fri, 25 Jul 2025 03:05:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uf8kJ-0004B4-Gq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 03:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IPqUxoxiIgGV8gB0uIMe29zxk/pOpfeZZ1JdmRledzo=; b=VvSwE1acxri7HNyT6vG2eOeAgk
 nH0O1/wEUiBAVlMrl97upj2pZXsbraiqXgz1L3zuHl3g+K99K5y+kInQF2QSndbyJuQfMYV1sEx4b
 OJuHgOzw9i9JGN3xeTIbgfJAbx+zvTSHQ8QruH2ZGuhvtmOuCcdmBT7uU1gILMpS/Ztw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IPqUxoxiIgGV8gB0uIMe29zxk/pOpfeZZ1JdmRledzo=; b=FK8vHg99k0V/MweRf8pC3SywBt
 0ZyRYPALsDikHnT1zSOItXGM9+RapmL2THGB2iz1yCc3Fs7jguFhlIFfHnQppVcXeNfwOVxVn8LcH
 UuX8OtS9h0U+pNlr0i0i34pw1KM3/Kvw9lVEI/NPS+t4Y8Q/RXWBHce8xtXbS5OpiVOk=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uf8kH-0005OM-7E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 03:05:19 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-456382f1a56so394195e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753412706; x=1754017506; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPqUxoxiIgGV8gB0uIMe29zxk/pOpfeZZ1JdmRledzo=;
 b=LyUPxAenlEiRnG+LOzV7bBRBk4pcdfg7viB2zOvXgropuDGEjRuH+L2pHv5YJ0NiR5
 DLsWMpOXdbYczgyQS7eQE0hMONW8wJOVNR1iZy+RkNrSQoW32hUkiz/veg2XPAvg7fbJ
 VHuRqIw3TDvKA8LM275+HBlKJxjcmWEO+e4suTVi6SRydjA/Gvni5ZNnp39RwlpBH7ow
 7NteRxKOX8CR35jzFGUWL62mMXlV0Rw0hJVpG33S8rak05yO4/0IZuhWw155GDem7S/K
 hnz789VxN3QyabkZNxqnTrnse7jHJNEHbnqN5zllY8hD1HztaiHPBlZhcfv5i4KFQt6h
 LR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753412706; x=1754017506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPqUxoxiIgGV8gB0uIMe29zxk/pOpfeZZ1JdmRledzo=;
 b=YY3J9OM6jcgSkxL8uspw2qm0/vtPI7b17xPos23qlicT7a0EWClWUgfbN7rG9BmsLR
 dBz8vZFFaTPXg3JEBXd8eOy+q+81uPRyH4g9olFu06fRldbRQuqxtjryXyv8k5ffAT78
 qSrYGlUPdxxLDTuWm9lMfw9yvOSX8uaL9zhcJmppxvhac1ahKoJGJx5/tdhLJDujVZc6
 umAh5aKQ+Wlb/iEmYVWMWK1mmIoXqqqtB4lwxTWabjOOlpzBmeQ100jmK+eBblP/2D41
 VB68ex2tPhPhZIag+nFzCegcjCoQ65fv1fPRc47SyFXMi6TW4blTHNOckf0gXmEg4JRo
 ciWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaDs7XOIRXIwbu3yljJ3UpOPT97rxbDnymk4Ora5A2SZhihN3Jd6F9cebqnOvxxBxaNDgWSfCxn12UNNPlP9Hk@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyy1JU+IRiLaXwfG2dkBC5ohlM9Hqe5WnF5Y2X1zearbSbIgG8X
 LcD4gFTY08rgPXh0D4CJi1e5pUGdtKtnC+/YhpIGU0slxcBAIcaVBd7mJQEsCbHWmrHaqao51TO
 /g8sgCWBTXT5z2jj6WuN9QJdSjehW2qg=
X-Gm-Gg: ASbGnctaORY93VR4+qxS5ssZVGKh2BqcCiTx+QUMShPfzOwDh+wwBZPSa6EcK6uIv+e
 JqHKJ/adtYCLyB21XIM1Xs3YaDToDdMWo2q9O2zAJgvtfExcLQv9LIdqgn1LmlEEJ2MRMCoNnaC
 pAvO5g5yc5VPhwyDytV+H4llCqxXYeJg5IjQVTDVdd7WJH9QijC0IV3D7pJLG1F5dItjfYhXgIC
 Pb0h0GH
X-Google-Smtp-Source: AGHT+IEDgxg6iRgwaSXL4jJjBOKjTZiLSujIy/8PVwn5fJvNmXFwfjCTDBt1L7WVPRCV4qCed3Vc/N2dWw7/95soQRM=
X-Received: by 2002:a05:6000:2910:b0:3a5:7875:576 with SMTP id
 ffacd0b85a97d-3b776716447mr90494f8f.1.1753412705305; Thu, 24 Jul 2025
 20:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250725005924.3909785-1-chao@kernel.org>
 <CAHJ8P3LSv5hYwc6uTAg-LYE8Bwyf8Xp-gme=EKZ0hbx4LKJv=A@mail.gmail.com>
 <30ce1862-87ea-40dc-ad66-34fc73efeafd@kernel.org>
In-Reply-To: <30ce1862-87ea-40dc-ad66-34fc73efeafd@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 25 Jul 2025 11:04:54 +0800
X-Gm-Features: Ac12FXyPEcSzZ8T5oBTA90l5VHDQ8abRwE1IC2ZdrSS1NNlFcG25pZs6t9175yA
Message-ID: <CAHJ8P3LBOB7PgTp+hqDApCb7-MaS=NnTjoMHCMyBFgMfuLBi=Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年7月25日周五 10:45写道： > > On 7/25/2025
    10:08 AM, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2025年7月25日周五
    09:03写道： > >> > >> It provides a [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.44 listed in wl.mailspike.net]
X-Headers-End: 1uf8kH-0005OM-7E
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0N+aciDI15pel5ZGo5LqUIDEwOjQ1
5YaZ6YGT77yaCj4KPiBPbiA3LzI1LzIwMjUgMTA6MDggQU0sIFpoaWd1byBOaXUgd3JvdGU6Cj4g
PiBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldD4KPiA+IOS6jjIwMjXlubQ35pyIMjXml6XlkajkupQgMDk6MDPlhpnpgZPv
vJoKPiA+Pgo+ID4+IEl0IHByb3ZpZGVzIGEgd2F5IHRvIGRpc2FibGUgbGluZWFyIGxvb2t1cCBm
YWxsYmFjayBkdXJpbmcgbWtmcy4KPiA+Pgo+ID4+IEJlaGF2aW9yIHN1bW1hcnk6Cj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIEFuZHJvaWQgICAgICAgICBEaXN0cm8KPiA+PiBCeSBkZWZh
dWx0ICAgICAgICAgICAgICBkaXNhYmxlZCAgICAgICAgZW5hYmxlZAo+ID4+IFR1bmUgdy8gW25v
XWhhc2hvbmx5ICAgIG5vICAgICAgICAgICAgICB5ZXMKPiA+Pgo+ID4+IEFuZHJvaWQgY2FzZToK
PiA+Pgo+ID4+IDEuMSkgRGlzYWJsZSBsaW5lYXIgbG9va3VwOgo+ID4+IG1rZnMuZjJmcyAtZiAt
ZyBhbmRyb2lkIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6aGFzaG9ubHkgL2Rldi92ZGIKPiA+PiBkdW1w
LmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPiA+PiBzX2VuY29kaW5n
X2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQo+ID4+Cj4gPj4g
MS4yKSBFbmFibGUgbGluZWFyIGxvb2t1cDoKPiA+PiBta2ZzLmYyZnMgLWYgLWcgYW5kcm9pZCAt
TyBjYXNlZm9sZCAtQyB1dGY4Om5vaGFzaG9ubHkgL2Rldi92ZGIKPiA+PiBkdW1wLmYyZnMgLWQz
IC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPiA+PiBzX2VuY29kaW5nX2ZsYWdzICAg
ICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQo+ID4gSGkgQ2hhbywKPiA+IFNl
ZW1zIGxpa2UgYSB0eXBvIGhlcmU/IHNob3VsZCBiZToKPgo+IFpoaWd1bywKPgo+IE5vdCBhIHR5
cG8sIGl0J3MgaW50ZW50aW9uYWwsIHNlZSBhYm92ZSBiZWhhdmlvciBzdW1tYXJ5Lgo+CkhpIENo
YW8sCkFoLCBJIGdvdCBpdCBhZnRlciBjaGVja2luZyBhZ2Fpbi5eXgo+IEJ1dCBhZnRlciByZXRo
aW5raW5nIGFib3V0IHRoaXMsIEkgZ3Vlc3MgaXQgd2lsbCBiZSBnb29kIHRvIGhvbm9yCj4gJ25v
aGFzaG9ubHknIGZvciBBbmRyb2lkIGNhc2UgbGlrZSBEaXN0cm8gY2FzZS4KPgo+IEFueXdheSwg
bGV0IG1lIHVwZGF0ZSB0aGUgcGF0Y2guClRoYW5rcyBmb3IgdGhpcyBhbmQgZXhwbGFuYXRpb24u
Cj4KPiBUaGFua3MsCj4KPiA+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAg
ICBbMHggICAgICAgMCA6IDBdID8KPiA+IHRoYW5rcyEKPiA+Pgo+ID4+IDEuMykgQnkgZGVmYXVs
dDoKPiA+PiBta2ZzLmYyZnMgLWYgLWcgYW5kcm9pZCAtTyBjYXNlZm9sZCAtQyB1dGY4IC9kZXYv
dmRiCj4gPj4gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3JlcCBzX2VuY29kaW5nX2ZsYWdzCj4g
Pj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDog
Ml0KPiA+Pgo+ID4+IERpc3RybyBjYXNlOgo+ID4+Cj4gPj4gMi4xKSBEaXNhYmxlIGxpbmVhciBs
b29rdXA6Cj4gPj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6aGFzaG9ubHkgL2Rl
di92ZGIKPiA+PiBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MK
PiA+PiBzX2VuY29kaW5nX2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIg
OiAyXQo+ID4+Cj4gPj4gMi4yKSBFbmFibGUgbGluZWFyIGxvb2t1cDoKPiA+PiBta2ZzLmYyZnMg
LWYgLU8gY2FzZWZvbGQgLUMgdXRmODpub2hhc2hvbmx5IC9kZXYvdmRiCj4gPj4gZHVtcC5mMmZz
IC1kMyAvZGV2L3ZkYiB8Z3JlcCBzX2VuY29kaW5nX2ZsYWdzCj4gPj4gc19lbmNvZGluZ19mbGFn
cyAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAwIDogMF0KPiA+Pgo+ID4+IDIuMykg
QnkgZGVmYXVsdDoKPiA+PiBta2ZzLmYyZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmOCAvZGV2L3Zk
Ygo+ID4+IGR1bXAuZjJmcyAtZDMgL2Rldi92ZGIgfGdyZXAgc19lbmNvZGluZ19mbGFncwo+ID4+
IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMCA6IDBd
Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gPj4g
LS0tCj4gPj4gdjI6Cj4gPj4gLSBkaXNhYmxlIGxpbmVhciBsb29rdXAgYnkgZGVmYXVsdCBmb3Ig
QW5kcm9pZCBjYXNlCj4gPj4gICBpbmNsdWRlL2YyZnNfZnMuaCAgICAgICB8ICAzICsrLQo+ID4+
ICAgbGliL2xpYmYyZnMuYyAgICAgICAgICAgfCAgMSArCj4gPj4gICBtYW4vbWtmcy5mMmZzLjgg
ICAgICAgICB8IDEwICsrKysrKysrLS0KPiA+PiAgIG1rZnMvZjJmc19mb3JtYXQuYyAgICAgIHwg
IDMgKysrCj4gPj4gICBta2ZzL2YyZnNfZm9ybWF0X21haW4uYyB8ICAzICsrLQo+ID4+ICAgNSBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+PiBp
bmRleCBmNzI2OGQxLi5hOGRhOGZhIDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5o
Cj4gPj4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+PiBAQCAtMTQ3OCw3ICsxNDc4LDggQEAg
ZW51bSB7Cj4gPj4KPiA+PiAgIC8qIGZlYXR1cmUgbGlzdCBpbiBBbmRyb2lkICovCj4gPj4gICBl
bnVtIHsKPiA+PiAtICAgICAgIEYyRlNfRkVBVFVSRV9OQVRfQklUUyA9IDB4MDAwMSwKPiA+PiAr
ICAgICAgIEYyRlNfRkVBVFVSRV9OQVRfQklUUyAgICAgICAgICAgPSAweDAwMDEsCj4gPj4gKyAg
ICAgICBGMkZTX0ZFQVRVUkVfTElORUFSX0xPT0tVUCAgICAgID0gMHgwMDAyLAo+ID4+ICAgfTsK
PiA+Pgo+ID4+ICAgLyogbm9saW5lYXIgbG9va3VwIHR1bmUgKi8KPiA+PiBkaWZmIC0tZ2l0IGEv
bGliL2xpYmYyZnMuYyBiL2xpYi9saWJmMmZzLmMKPiA+PiBpbmRleCAyZjAxMmM4Li4wZTNlNjJh
IDEwMDY0NAo+ID4+IC0tLSBhL2xpYi9saWJmMmZzLmMKPiA+PiArKysgYi9saWIvbGliZjJmcy5j
Cj4gPj4gQEAgLTE0MjQsNiArMTQyNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZW5jX2ZsYWdz
IHsKPiA+PiAgICAgICAgICBjaGFyICpwYXJhbTsKPiA+PiAgIH0gZW5jb2RpbmdfZmxhZ3NbXSA9
IHsKPiA+PiAgICAgICAgICB7IEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMLCAic3RyaWN0IiB9LAo+
ID4+ICsgICAgICAgeyBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwsICJoYXNob25seSJ9
Cj4gPj4gICB9Owo+ID4+Cj4gPj4gICAvKiBSZXR1cm4gYSBwb3NpdGl2ZSBudW1iZXIgPCAweGZm
IGluZGljYXRpbmcgdGhlIGVuY29kaW5nIG1hZ2ljIG51bWJlcgo+ID4+IGRpZmYgLS1naXQgYS9t
YW4vbWtmcy5mMmZzLjggYi9tYW4vbWtmcy5mMmZzLjgKPiA+PiBpbmRleCA4YjNiMGNjLi44Y2I3
ZDMyIDEwMDY0NAo+ID4+IC0tLSBhL21hbi9ta2ZzLmYyZnMuOAo+ID4+ICsrKyBiL21hbi9ta2Zz
LmYyZnMuOAo+ID4+IEBAIC0yMzIsOSArMjMyLDE1IEBAIFVzZSBVVEYtOCBmb3IgY2FzZWZvbGRp
bmcuCj4gPj4gICAuSSBmbGFnczoKPiA+PiAgIC5SUyAxLjJpCj4gPj4gICAuVFAgMS4yaQo+ID4+
IC0uQiBzdHJpY3QKPiA+PiArLkIgW25vXXN0cmljdAo+ID4+ICAgVGhpcyBmbGFnIHNwZWNpZmll
cyB0aGF0IGludmFsaWQgc3RyaW5ncyBzaG91bGQgYmUgcmVqZWN0ZWQgYnkgdGhlIGZpbGVzeXN0
ZW0uCj4gPj4gLURlZmF1bHQgaXMgZGlzYWJsZWQuCj4gPj4gK0ZvciBhbmRyb2lkIGNhc2UsIGl0
IHdpbGwgZGlzYWJsZSBsaW5lYXIgbG9va3VwIGJ5IGRlZmF1bHQuCj4gPj4gKy5SRQo+ID4+ICsu
UlMgMS4yaQo+ID4+ICsuVFAgMS4yaQo+ID4+ICsuQiBbbm9daGFzaG9ubHkKPiA+PiArVGhpcyBm
bGFnIHNwZWNpZmllcyB0aGF0IHRoZXJlIGlzIG5vIGxpbmVhciBsb29rdXAgZmFsbGJhY2sgZHVy
aW5nIGxvb2t1cC4KPiA+PiArQnkgZGVmYXVsdCwgbGluZWFyIGxvb2t1cCBmYWxsYmFjayBpcyBl
bmFibGVkLgo+ID4+ICAgLlJFCj4gPj4gICAuUkUKPiA+PiAgIC5UUAo+ID4+IGRpZmYgLS1naXQg
YS9ta2ZzL2YyZnNfZm9ybWF0LmMgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiA+PiBpbmRleCAyNjgw
YmQzLi5hNDViYmNiIDEwMDY0NAo+ID4+IC0tLSBhL21rZnMvZjJmc19mb3JtYXQuYwo+ID4+ICsr
KyBiL21rZnMvZjJmc19mb3JtYXQuYwo+ID4+IEBAIC02NzEsNiArNjcxLDkgQEAgc3RhdGljIGlu
dCBmMmZzX3ByZXBhcmVfc3VwZXJfYmxvY2sodm9pZCkKPiA+PiAgICAgICAgICBtZW1jcHkoc2It
PmluaXRfdmVyc2lvbiwgYy52ZXJzaW9uLCBWRVJTSU9OX0xFTik7Cj4gPj4KPiA+PiAgICAgICAg
ICBpZiAoYy5mZWF0dXJlICYgRjJGU19GRUFUVVJFX0NBU0VGT0xEKSB7Cj4gPj4gKyAgICAgICAg
ICAgICAgIGlmICghKGMuc19lbmNvZGluZ19mbGFncyAmIEYyRlNfRU5DX05PX0NPTVBBVF9GQUxM
QkFDS19GTCkgJiYKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAoYy5kaXNhYmxlZF9mZWF0
dXJlICYgRjJGU19GRUFUVVJFX0xJTkVBUl9MT09LVVApKQo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGMuc19lbmNvZGluZ19mbGFncyB8PSBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tf
Rkw7Cj4gPj4gICAgICAgICAgICAgICAgICBzZXRfc2Ioc19lbmNvZGluZywgYy5zX2VuY29kaW5n
KTsKPiA+PiAgICAgICAgICAgICAgICAgIHNldF9zYihzX2VuY29kaW5nX2ZsYWdzLCBjLnNfZW5j
b2RpbmdfZmxhZ3MpOwo+ID4+ICAgICAgICAgIH0KPiA+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZz
X2Zvcm1hdF9tYWluLmMgYi9ta2ZzL2YyZnNfZm9ybWF0X21haW4uYwo+ID4+IGluZGV4IGYwYmVj
NGYuLjhmOGU5NzUgMTAwNjQ0Cj4gPj4gLS0tIGEvbWtmcy9mMmZzX2Zvcm1hdF9tYWluLmMKPiA+
PiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0X21haW4uYwo+ID4+IEBAIC0xNDMsNyArMTQzLDggQEAg
c3RhdGljIHZvaWQgYWRkX2RlZmF1bHRfb3B0aW9ucyh2b2lkKQo+ID4+ICAgICAgICAgICAgICAg
ICAgZm9yY2Vfb3ZlcndyaXRlID0gMTsKPiA+PiAgICAgICAgICAgICAgICAgIGMud2FudGVkX3Nl
Y3Rvcl9zaXplID0gRjJGU19CTEtTSVpFOwo+ID4+ICAgICAgICAgICAgICAgICAgYy5yb290X3Vp
ZCA9IGMucm9vdF9naWQgPSAwOwo+ID4+IC0gICAgICAgICAgICAgICBjLmRpc2FibGVkX2ZlYXR1
cmUgfD0gRjJGU19GRUFUVVJFX05BVF9CSVRTOwo+ID4+ICsgICAgICAgICAgICAgICBjLmRpc2Fi
bGVkX2ZlYXR1cmUgfD0gRjJGU19GRUFUVVJFX05BVF9CSVRTIHwKPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19GRUFUVVJFX0xJTkVBUl9MT09LVVA7Cj4g
Pj4KPiA+PiAgICAgICAgICAgICAgICAgIC8qIFJPIGRvZXNuJ3QgbmVlZCBhbnkgb3RoZXIgZmVh
dHVyZXMgKi8KPiA+PiAgICAgICAgICAgICAgICAgIGlmIChjLmZlYXR1cmUgJiBGMkZTX0ZFQVRV
UkVfUk8pCj4gPj4gLS0KPiA+PiAyLjQ5LjAKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiA+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
