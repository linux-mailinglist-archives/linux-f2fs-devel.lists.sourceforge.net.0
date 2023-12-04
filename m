Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BD802A8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 04:41:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9zqD-0007Yl-DO;
	Mon, 04 Dec 2023 03:41:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1r9zqC-0007Yc-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 03:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=usQamIUqJZ6NZB++HaV6GhUTfmbqwQpVT+aSIq6Nbqw=; b=f+WthV6z/23tSwqxcvqn4796J+
 xL0AWizSxRGo5byN9O9p1EdZAvj2ERh5CfAJf9KURyloxztXm2wdS5ETILHMpZQw6ShuXoB2JL/wd
 QhkIUZpJ6Tb6vOoGLxJdy9qQUzChKi5ZJQNO814ogc4SO2nO1Ya7bCz/j1JiRjau/spM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=usQamIUqJZ6NZB++HaV6GhUTfmbqwQpVT+aSIq6Nbqw=; b=Gb/o0fGSV8zTl7UAp+bS4nG5to
 FTELrTbQZelSe4Fz/uhZG5aIlcmqBvB4WgFdDBnLDUSKkravP2rmYVUKe4AaGxma0IftZL7ph+i0l
 5Vx7N5DSXFfRLvSKy7bxnPns/YB+XPEUmOFRIEEa5TWR51c7pMkShpAoCgwbNM6HGQrE=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r9zq8-0004sn-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 03:41:53 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40b54261524so47785785e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Dec 2023 19:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701661302; x=1702266102; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usQamIUqJZ6NZB++HaV6GhUTfmbqwQpVT+aSIq6Nbqw=;
 b=kF1KuJvkk9ns4X4Q+Z9z5c1926IFQOCyaeycD7cRX6+p5OxL5tTYhnpUNEIB7Qc6xy
 LgjkJGbasoo81k6p/7HY1nbybTZvE65hQxxPa+cUeC+abJrA03u0IeK3YPgLrgwarw2C
 gNwIUkD0+S3npYcdrEk1m4/RWXMfxQnVlmSnydYfmQhRzX/NDEI+F3fpFNUSTYTQolkA
 xzHgH1J3ij5l9ZZLxVPe5KeJDqZBx4Ll1Np7ZtyBA27VyJF8Y5U3gV+DIyJcCXsFCNis
 1PzYQ7Ht29sFx6WF5/d8EObUnGziSO56ujhj2AHlOgydH2AgsvKcNZ3kglVh3aTpkii9
 9MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701661302; x=1702266102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usQamIUqJZ6NZB++HaV6GhUTfmbqwQpVT+aSIq6Nbqw=;
 b=KFgwA7qgLDB6/llMpdpP5ieSaws9uSlxeLbsVN03vo1fStDeOlwqOCFGRsRr2YyQk4
 gDgZV8rzVzr7CDJaEn5qwFVAOukrkGacDJQiW3RZ7/q1NfBAAo1IkETF+/bKbJVPhFSv
 qGtNo6p/QnYSDm1BqLdWKStv/Ap+edhRT8TmaXnQ06MY1rtOPdhkah2ul+M1OZCxzWX0
 AMv+0oMeE+AxC2E9m+cgipwyOuvaBjA4m1GClIrZYgbu2kxOLcg+8rkEnCXZrzpDjCB9
 9dWA2sdSVO2Jv/vJzWNdHj16sthwArbnMfnUvAyEKT1J1/xtz5KncWkEMQFAOMAkqGtL
 V+vg==
X-Gm-Message-State: AOJu0YyyETS60nJGUW8Am5TSEJNvURJKf6u1UWS+5w7VlnPFaF+1uhqn
 303HWfGGtAoI27O+IvIvhayd1epjt7iZ65YfqVU=
X-Google-Smtp-Source: AGHT+IG5oJnJaoA+nIclssRYj99iohYwftln0Lz/CH7rQ1GGFQboKyYj2w+QFJMZ3+/uWoKOphk4mUbKdSlkFqeEY7U=
X-Received: by 2002:a05:600c:4ba5:b0:40b:5e59:cca1 with SMTP id
 e37-20020a05600c4ba500b0040b5e59cca1mr2118600wmp.130.1701661301960; Sun, 03
 Dec 2023 19:41:41 -0800 (PST)
MIME-Version: 1.0
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
 <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
 <CAD14+f1u6gnHLhGSoQxL9wLq9vDYse+Ac8zxep-O2E8hHreT2w@mail.gmail.com>
 <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
In-Reply-To: <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 4 Dec 2023 12:41:30 +0900
Message-ID: <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Gao, On Mon, Dec 4, 2023 at 12:28 PM Gao Xiang wrote:
    > > > > On 2023/12/4 01:32, Juhyung Park wrote: > > Hi Gao, > > ... > > >>>
    > >>>> > >>>> What is the difference between these two machines? just d [...]
    
 
 Content analysis details:   (2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.50 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r9zq8-0004sn-Uh
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgR2FvLAoKT24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxMjoyOOKAr1BNIEdhbyBYaWFuZyA8aHNp
YW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDIzLzEyLzQgMDE6
MzIsIEp1aHl1bmcgUGFyayB3cm90ZToKPiA+IEhpIEdhbywKPgo+IC4uLgo+Cj4gPj4+Cj4gPj4+
Pgo+ID4+Pj4gV2hhdCBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZXNlIHR3byBtYWNoaW5l
cz8ganVzdCBkaWZmZXJlbnQgQ1BVIG9yCj4gPj4+PiB0aGV5IGhhdmUgc29tZSBvdGhlciBkaWZm
ZXJlbmNlIGxpa2UgZGlmZmVyZW50IGNvbXBsaWVycz8KPiA+Pj4KPiA+Pj4gSSBmdWxseSBhbmQg
ZXhjbHVzaXZlbHkgY29udHJvbCBib3RoIGRldmljZXMsIGFuZCB0aGUgc2V0dXAgaXMgYWxtb3N0
IHRoZSBzYW1lLgo+ID4+PiBTYW1lIFVidW50dSB2ZXJzaW9uLCBrZXJuZWwvY29tcGlsZXIgdmVy
c2lvbi4KPiA+Pj4KPiA+Pj4gQnV0IGFzIEkgc2FpZCwgb24gbXkgbGFwdG9wLCB0aGUgaXNzdWUg
aGFwcGVucyBvbiBrZXJuZWxzIHRoYXQgc29tZW9uZQo+ID4+PiBlbHNlIChDYW5vbmljYWwpIGJ1
aWx0LCBzbyBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMuCj4gPj4KPiA+PiBUaGUgb25seSB0aGlu
ZyBJIGNvdWxkIHNheSBpcyB0aGF0IHRoZSBrZXJuZWwgc2lkZSBoYXMgb3B0aW1pemVkCj4gPj4g
aW5wbGFjZSBkZWNvbXByZXNzaW9uIGNvbXBhcmVkIHRvIGZ1c2Ugc28gdGhhdCBpdCB3aWxsIHJl
dXNlIHRoZQo+ID4+IHNhbWUgYnVmZmVyIGZvciBkZWNvbXByZXNzaW9uIGJ1dCB3aXRoIGEgc2Fm
ZSBtYXJnaW4gKGFjY29yZGluZyB0bwo+ID4+IHRoZSBjdXJyZW50IGx6NCBkZWNvbXByZXNzaW9u
IGltcGxlbWVudGF0aW9uKS4gIEl0IHNob3VsZG4ndCBiZWhhdmUKPiA+PiBkaWZmZXJlbnQganVz
dCBkdWUgdG8gZGlmZmVyZW50IENQVXMuICBMZXQgbWUgZmluZCBtb3JlIGNsdWVzCj4gPj4gbGF0
ZXIsIGFsc28gbWF5YmUgd2Ugc2hvdWxkIGludHJvZHVjZSBhIHdheSBmb3IgdXNlcnMgdG8gdHVy
biBvZmYKPiA+PiB0aGlzIGlmIG5lZWRlZC4KPiA+Cj4gPiBDb29sIDopCj4gPgo+ID4gSSdtIGNv
bWZvcnRhYmxlIGNoYW5naW5nIGFuZCBidWlsZGluZyBteSBvd24gY3VzdG9tIGtlcm5lbCBmb3Ig
dGhpcwo+ID4gc3BlY2lmaWMgbGFwdG9wLiBGZWVsIGZyZWUgdG8gYXNrIG1lIHRvIHRyeSBvdXQg
c29tZSBwYXRjaGVzLgo+Cj4gVGhhbmtzLCBJIG5lZWQgdG8gbmFycm93IGRvd24gdGhpcyBpc3N1
ZToKPgo+IC0gIEZpcnN0LCBjb3VsZCB5b3UgYXBwbHkgdGhlIGZvbGxvd2luZyBkaWZmIHRvIHRl
c3QgaWYgaXQncyBzdGlsbAo+ICAgICByZXByb2R1Y2FibGU/Cj4KPiBkaWZmIC0tZ2l0IGEvZnMv
ZXJvZnMvZGVjb21wcmVzc29yLmMgYi9mcy9lcm9mcy9kZWNvbXByZXNzb3IuYwo+IGluZGV4IDAy
MWJlNWZlYjFiYy4uNDBhMzA2NjI4ZTFhIDEwMDY0NAo+IC0tLSBhL2ZzL2Vyb2ZzL2RlY29tcHJl
c3Nvci5jCj4gKysrIGIvZnMvZXJvZnMvZGVjb21wcmVzc29yLmMKPiBAQCAtMTMxLDcgKzEzMSw3
IEBAIHN0YXRpYyB2b2lkICp6X2Vyb2ZzX2x6NF9oYW5kbGVfb3ZlcmxhcChzdHJ1Y3Qgel9lcm9m
c19sejRfZGVjb21wcmVzc19jdHggKmN0eCwKPgo+ICAgICAgICAgaWYgKHJxLT5pbnBsYWNlX2lv
KSB7Cj4gICAgICAgICAgICAgICAgIG9tYXJnaW4gPSBQQUdFX0FMSUdOKGN0eC0+b2VuZCkgLSBj
dHgtPm9lbmQ7Cj4gLSAgICAgICAgICAgICAgIGlmIChycS0+cGFydGlhbF9kZWNvZGluZyB8fCAh
bWF5X2lucGxhY2UgfHwKPiArICAgICAgICAgICAgICAgaWYgKDEgfHwgcnEtPnBhcnRpYWxfZGVj
b2RpbmcgfHwgIW1heV9pbnBsYWNlIHx8Cj4gICAgICAgICAgICAgICAgICAgICBvbWFyZ2luIDwg
TFo0X0RFQ09NUFJFU1NfSU5QTEFDRV9NQVJHSU4ocnEtPmlucHV0c2l6ZSkpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBkb2NvcHk7CgpZdXAsIHRoYXQgZml4ZXMgaXQuCgpUaGUgaGFz
aCBvdXRwdXQgaXMgdGhlIHNhbWUgZm9yIDUwIHJ1bnMuCgo+Cj4gLSBDb3VsZCB5b3Ugc2hhcmUg
dGhlIGZ1bGwgbWVzc2FnZSBhYm91dCB0aGUgb3V0cHV0IG9mIGBsc2NwdWA/CgpTdXJlOgoKQXJj
aGl0ZWN0dXJlOiAgICAgICAgICAgIHg4Nl82NAogIENQVSBvcC1tb2RlKHMpOiAgICAgICAgMzIt
Yml0LCA2NC1iaXQKICBBZGRyZXNzIHNpemVzOiAgICAgICAgIDM5IGJpdHMgcGh5c2ljYWwsIDQ4
IGJpdHMgdmlydHVhbAogIEJ5dGUgT3JkZXI6ICAgICAgICAgICAgTGl0dGxlIEVuZGlhbgpDUFUo
cyk6ICAgICAgICAgICAgICAgICAgOAogIE9uLWxpbmUgQ1BVKHMpIGxpc3Q6ICAgMC03ClZlbmRv
ciBJRDogICAgICAgICAgICAgICBHZW51aW5lSW50ZWwKICBCSU9TIFZlbmRvciBJRDogICAgICAg
IEludGVsKFIpIENvcnBvcmF0aW9uCiAgTW9kZWwgbmFtZTogICAgICAgICAgICAxMXRoIEdlbiBJ
bnRlbChSKSBDb3JlKFRNKSBpNy0xMTg1RzcgQCAzLjAwR0h6CiAgICBCSU9TIE1vZGVsIG5hbWU6
ICAgICAxMXRoIEdlbiBJbnRlbChSKSBDb3JlKFRNKSBpNy0xMTg1RzcgQCAzLjAwR0h6IE5vbmUg
Q1BVCiAgICAgICAgICAgICAgICAgICAgICAgICAgQCAzLjBHSHoKICAgIEJJT1MgQ1BVIGZhbWls
eTogICAgIDE5OAogICAgQ1BVIGZhbWlseTogICAgICAgICAgNgogICAgTW9kZWw6ICAgICAgICAg
ICAgICAgMTQwCiAgICBUaHJlYWQocykgcGVyIGNvcmU6ICAyCiAgICBDb3JlKHMpIHBlciBzb2Nr
ZXQ6ICA0CiAgICBTb2NrZXQocyk6ICAgICAgICAgICAxCiAgICBTdGVwcGluZzogICAgICAgICAg
ICAxCiAgICBDUFUocykgc2NhbGluZyBNSHo6ICA2MCUKICAgIENQVSBtYXggTUh6OiAgICAgICAg
IDQ4MDAuMDAwMAogICAgQ1BVIG1pbiBNSHo6ICAgICAgICAgNDAwLjAwMDAKICAgIEJvZ29NSVBT
OiAgICAgICAgICAgIDU5OTAuNDAKICAgIEZsYWdzOiAgICAgICAgICAgICAgIGZwdSB2bWUgZGUg
cHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWMKICAgICAgICAgICAg
ICAgICAgICAgICAgIGEgY21vdiBwYXQgcHNlMzYgY2xmbHVzaCBkdHMgYWNwaSBtbXggZnhzciBz
c2Ugc3NlMiBzcwogICAgICAgICAgICAgICAgICAgICAgICAgaHQgdG0gcGJlIHN5c2NhbGwgbngg
cGRwZTFnYiByZHRzY3AgbG0gY29uc3RhbnRfdHNjIGFydAogICAgICAgICAgICAgICAgICAgICAg
ICAgIGFyY2hfcGVyZm1vbiBwZWJzIGJ0cyByZXBfZ29vZCBub3BsIHh0b3BvbG9neSBub25zdG9w
XwogICAgICAgICAgICAgICAgICAgICAgICAgdHNjIGNwdWlkIGFwZXJmbXBlcmYgdHNjX2tub3du
X2ZyZXEgcG5pIHBjbG11bHFkcSBkdGVzNgogICAgICAgICAgICAgICAgICAgICAgICAgNCBtb25p
dG9yIGRzX2NwbCB2bXggc214IGVzdCB0bTIgc3NzZTMgc2RiZyBmbWEgY3gxNiB4dAogICAgICAg
ICAgICAgICAgICAgICAgICAgcHIgcGRjbSBwY2lkIHNzZTRfMSBzc2U0XzIgeDJhcGljIG1vdmJl
IHBvcGNudCB0c2NfZGVhZAogICAgICAgICAgICAgICAgICAgICAgICAgbGluZV90aW1lciBhZXMg
eHNhdmUgYXZ4IGYxNmMgcmRyYW5kIGxhaGZfbG0gYWJtIDNkbm93cAogICAgICAgICAgICAgICAg
ICAgICAgICAgcmVmZXRjaCBjcHVpZF9mYXVsdCBlcGIgY2F0X2wyIGNkcF9sMiBzc2JkIGlicnMg
aWJwYiBzdAogICAgICAgICAgICAgICAgICAgICAgICAgaWJwIGlicnNfZW5oYW5jZWQgdHByX3No
YWRvdyBmbGV4cHJpb3JpdHkgZXB0IHZwaWQgZXB0XwogICAgICAgICAgICAgICAgICAgICAgICAg
YWQgZnNnc2Jhc2UgdHNjX2FkanVzdCBibWkxIGF2eDIgc21lcCBibWkyIGVybXMgaW52cGNpZAog
ICAgICAgICAgICAgICAgICAgICAgICAgIHJkdF9hIGF2eDUxMmYgYXZ4NTEyZHEgcmRzZWVkIGFk
eCBzbWFwIGF2eDUxMmlmbWEgY2xmbAogICAgICAgICAgICAgICAgICAgICAgICAgdXNob3B0IGNs
d2IgaW50ZWxfcHQgYXZ4NTEyY2Qgc2hhX25pIGF2eDUxMmJ3IGF2eDUxMnZsCiAgICAgICAgICAg
ICAgICAgICAgICAgICB4c2F2ZW9wdCB4c2F2ZWMgeGdldGJ2MSB4c2F2ZXMgc3BsaXRfbG9ja19k
ZXRlY3QgZHRoZXJtCiAgICAgICAgICAgICAgICAgICAgICAgICAgaWRhIGFyYXQgcGxuIHB0cyBo
d3AgaHdwX25vdGlmeSBod3BfYWN0X3dpbmRvdyBod3BfZXBwCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgaHdwX3BrZ19yZXEgdm5taSBhdng1MTJ2Ym1pIHVtaXAgcGt1IG9zcGtlIGF2eDUxMl92
Ym1pCiAgICAgICAgICAgICAgICAgICAgICAgICAyIGdmbmkgdmFlcyB2cGNsbXVscWRxIGF2eDUx
Ml92bm5pIGF2eDUxMl9iaXRhbGcgdG1lIGF2CiAgICAgICAgICAgICAgICAgICAgICAgICB4NTEy
X3Zwb3BjbnRkcSByZHBpZCBtb3ZkaXJpIG1vdmRpcjY0YiBmc3JtIGF2eDUxMl92cDJpCiAgICAg
ICAgICAgICAgICAgICAgICAgICBudGVyc2VjdCBtZF9jbGVhciBpYnQgZmx1c2hfbDFkIGFyY2hf
Y2FwYWJpbGl0aWVzClZpcnR1YWxpemF0aW9uIGZlYXR1cmVzOgogIFZpcnR1YWxpemF0aW9uOiAg
ICAgICAgVlQteApDYWNoZXMgKHN1bSBvZiBhbGwpOgogIEwxZDogICAgICAgICAgICAgICAgICAg
MTkyIEtpQiAoNCBpbnN0YW5jZXMpCiAgTDFpOiAgICAgICAgICAgICAgICAgICAxMjggS2lCICg0
IGluc3RhbmNlcykKICBMMjogICAgICAgICAgICAgICAgICAgIDUgTWlCICg0IGluc3RhbmNlcykK
ICBMMzogICAgICAgICAgICAgICAgICAgIDEyIE1pQiAoMSBpbnN0YW5jZSkKTlVNQToKICBOVU1B
IG5vZGUocyk6ICAgICAgICAgIDEKICBOVU1BIG5vZGUwIENQVShzKTogICAgIDAtNwpWdWxuZXJh
YmlsaXRpZXM6CiAgR2F0aGVyIGRhdGEgc2FtcGxpbmc6ICBWdWxuZXJhYmxlCiAgSXRsYiBtdWx0
aWhpdDogICAgICAgICBOb3QgYWZmZWN0ZWQKICBMMXRmOiAgICAgICAgICAgICAgICAgIE5vdCBh
ZmZlY3RlZAogIE1kczogICAgICAgICAgICAgICAgICAgTm90IGFmZmVjdGVkCiAgTWVsdGRvd246
ICAgICAgICAgICAgICBOb3QgYWZmZWN0ZWQKICBNbWlvIHN0YWxlIGRhdGE6ICAgICAgIE5vdCBh
ZmZlY3RlZAogIFJldGJsZWVkOiAgICAgICAgICAgICAgTm90IGFmZmVjdGVkCiAgU3BlYyByc3Rh
Y2sgb3ZlcmZsb3c6ICBOb3QgYWZmZWN0ZWQKICBTcGVjIHN0b3JlIGJ5cGFzczogICAgIFZ1bG5l
cmFibGUKICBTcGVjdHJlIHYxOiAgICAgICAgICAgIFZ1bG5lcmFibGU6IF9fdXNlciBwb2ludGVy
IHNhbml0aXphdGlvbiBhbmQgdXNlcmNvcHkgYmEKICAgICAgICAgICAgICAgICAgICAgICAgIHJy
aWVycyBvbmx5OyBubyBzd2FwZ3MgYmFycmllcnMKICBTcGVjdHJlIHYyOiAgICAgICAgICAgIFZ1
bG5lcmFibGUsIElCUEI6IGRpc2FibGVkLCBTVElCUDogZGlzYWJsZWQsIFBCUlNCLWVJQlIKICAg
ICAgICAgICAgICAgICAgICAgICAgIFM6IFZ1bG5lcmFibGUKICBTcmJkczogICAgICAgICAgICAg
ICAgIE5vdCBhZmZlY3RlZAogIFRzeCBhc3luYyBhYm9ydDogICAgICAgTm90IGFmZmVjdGVkCgoK
Pgo+IFRoYW5rcywKPiBHYW8gWGlhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
