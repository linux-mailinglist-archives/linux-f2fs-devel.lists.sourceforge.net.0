Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDE615AE5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 04:43:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq4f5-0002VG-TB;
	Wed, 02 Nov 2022 03:43:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fengnanchang@gmail.com>) id 1oq4f4-0002VA-R8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=spSNIgW2JOdAoSVy5AXLz0II/F19uq7XrGoqAPzfvhU=; b=YI5UnWFRjUkgqGqpiWFALTsz+q
 XpTBNMbD7aAroOMbQpQXNlcO4tsV978CkCokfgfKZilEQ8TOLnPiDIcjLGmwaI8lxScYU09lLTFLP
 rYG6xD/v4LjVwNdO6x1KJVdro3/paNlnYay+ZUSPuOFy2NPBov1dE9mKEswebGCXd/Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=spSNIgW2JOdAoSVy5AXLz0II/F19uq7XrGoqAPzfvhU=; b=CByeb/nlVgFgMjOEdurziBbJcy
 dXHBg9ihZ0MjKjP6JyFXlT7tkeuIFpZIXrzuCntBZJLenDWppHOu2lWFUWmt06SugX972M8YaqAho
 B2wqzPhmJrJ1mF/X9lUJfrYph0ywbXG53LRfoBViWuw6In7zFANta1ps11nKNOnN5wBc=;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oq4f2-0000de-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:43:30 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 l42-20020a9d1b2d000000b0066c6366fbc3so3044271otl.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Nov 2022 20:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spSNIgW2JOdAoSVy5AXLz0II/F19uq7XrGoqAPzfvhU=;
 b=jR7h9GHevqQyXXz2ExQm+iiIqo6MRzmQoZiJZCNVT47QtB3xFGSAbEO5VZgn1rthms
 LwXaDT+KIqpcFIwKkBKYkfjHiw4Cq9/INxh/E5VpmTDRpblWx8U6lK3tGiKvKi/Bu288
 aIX1kYWTcCL/DnNV8nFmhfCYfx+kvZhfcnDzOr/YbisBZW/EqMDNrgcn56JY8758Wxy1
 jaxsjfAKjLl/KB75+mxnOUa4C0UivhuPFoy3CMjGrR4fvaZbKeqBS2NjWO+SCWvqfFc/
 As2xSu6a173MJDR3Z6RB/tFiZpRM/3NfTfw6p80T09S+/fBmSR3eeJJ25PBhwQYMK7s0
 E09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spSNIgW2JOdAoSVy5AXLz0II/F19uq7XrGoqAPzfvhU=;
 b=JKvu1SOQYVUDXSMWLGoTIsZlDIsQ6gvE3yYL4vbk1jbP6hGa9ZikNgSyQNu4cjK0M8
 Wtj1UWsIWdO3g4pNJszF+Xf7ZeBXd8SqiBL8onkIOfAx2vtJxm2Ex2xfELlAnsptntm7
 ZkIHYQwTOOdhBL8lAjv1c7A2PoUK0iqT/eZRCXCRrSbNaMSEwHaj2LXCiFT3POyC1Drt
 K+phiibQDCqY+ql32zpqj5+X1d9pi3+d3sjA4PPcKZOi314u5FBrJ20sdlDNw9r1F0JM
 roMwbCu4q6ub/U9b9Hrr/8ExZcrFKe6UmSmHK71IqJWRaX2IV0dbj23a/JhR3880Em6s
 613Q==
X-Gm-Message-State: ACrzQf0uTbWDK9PmIScJZRvK7YTYEzhDxdAJjMYSdQWqPnCw1fkOClRD
 54DafjSKx1F/Roq3mRjY9/KQLdfjU3ZD3lqctFywyv0BsismXA==
X-Google-Smtp-Source: AMsMyM4MPG8R7Ezwn1qfu29zzrSKcRkU53hCztwtNLSmg9mOZQhfH0BobtYmN05FkbwNlCLXjpL1JvevOekQ1huI3AY=
X-Received: by 2002:a05:6830:1406:b0:661:e00e:8a23 with SMTP id
 v6-20020a056830140600b00661e00e8a23mr11080467otp.31.1667360603206; Tue, 01
 Nov 2022 20:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <Y2HQftXirAxvab6M@sol.localdomain>
 <694663F8-701D-4318-94D0-A1F532DDF6F9@gmail.com>
 <Y2HhoBnocFff1WFB@sol.localdomain>
In-Reply-To: <Y2HhoBnocFff1WFB@sol.localdomain>
From: fengnan chang <fengnanchang@gmail.com>
Date: Wed, 2 Nov 2022 11:43:11 +0800
Message-ID: <CALWNXx9-EtdXpGJONESQAQ9aOK9=Ggk9n0U+wxy-Wxq+sBcXkg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Eric Biggers 于2022年11月2日周三 11:18写道： > >
   On Wed, Nov 02, 2022 at 11:06:17AM +0800, fengnan chang wrote: > > > > > >
    > 2022年11月2日 10:05，Eric Biggers 写道： > > > > > > O [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.45 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oq4f2-0000de-Rq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTHmnIgy5pel5ZGo
5LiJIDExOjE45YaZ6YGT77yaCj4KPiBPbiBXZWQsIE5vdiAwMiwgMjAyMiBhdCAxMTowNjoxN0FN
ICswODAwLCBmZW5nbmFuIGNoYW5nIHdyb3RlOgo+ID4KPiA+Cj4gPiA+IDIwMjLlubQxMeaciDLm
l6UgMTA6MDXvvIxFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+IOWGmemBk++8mgo+
ID4gPgo+ID4gPiBPbiBXZWQsIEp1biAwOCwgMjAyMiBhdCAwOTo0ODo1MlBNICswODAwLCBGZW5n
bmFuIENoYW5nIHdyb3RlOgo+ID4gPj4gV2hlbiBkZWNvbXByZXNzZWQgZmFpbGVkLCBmMmZzX3By
ZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlIHdpbGwgZW50ZXIKPiA+ID4+IGVuZGxlc3MgbG9vcCwg
bWF5IGNhc3VlIGh1bmd0YXNrLgo+ID4gPj4KPiA+ID4+IFsgICAxNC4wODg2NjVdIEYyRlMtZnMg
KG52bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWlsZWQsIHJldDotNDE1NQo+ID4gPj4gWyAgIDE0
LjA4OTg1MV0gRjJGUy1mcyAobnZtZTBuMSk6IGx6NCBkZWNvbXByZXNzIGZhaWxlZCwgcmV0Oi00
MTU1Cj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNo
YW5nQGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBjb21taXQgbWVzc2FnZSBvbmx5IGV4cGxh
aW5zIHRoZSBwcm9ibGVtLCBub3QgdGhlIHNvbHV0aW9uLiAgSXQgc2hvdWxkCj4gPiA+IGV4cGxh
aW4gdGhlIHNvbHV0aW9uIHRvby4KPiA+ID4KPiA+ID4gQWxzbywgaWYgaXQncyBmaXhpbmcgYSBi
dWcsIGl0IG5lZWRzICdGaXhlcycgYW5kICdDYyBzdGFibGUnIHRhZ3MuCj4gPgo+ID4gSeKAmWxs
IGFkZCBtb3JlIGV4cGxhbmF0aW9uIGFuZCB0YWdzLCB0aGFua3MuCj4gPgo+ID4gPgo+ID4gPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4g
Pj4gaW5kZXggMjQ4MjRjZDk2ZjM2Li4xNzY0ZTM4NTkyNjIgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9m
cy9mMmZzL2NvbXByZXNzLmMKPiA+ID4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gPj4g
QEAgLTEwNjAsNyArMTA2MCw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVyd3Jp
dGUoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gPiA+PiAgICBzZWN0b3JfdCBsYXN0X2Jsb2Nr
X2luX2JpbzsKPiA+ID4+ICAgIHVuc2lnbmVkIGZncF9mbGFnID0gRkdQX0xPQ0sgfCBGR1BfV1JJ
VEUgfCBGR1BfQ1JFQVQ7Cj4gPiA+PiAgICBwZ29mZl90IHN0YXJ0X2lkeCA9IHN0YXJ0X2lkeF9v
Zl9jbHVzdGVyKGNjKTsKPiA+ID4+IC0gIGludCBpLCByZXQ7Cj4gPiA+PiArICBpbnQgaSwgcmV0
LCByZXRyeV9jb3VudCA9IDM7Cj4gPiA+Pgo+ID4gPj4gcmV0cnk6Cj4gPiA+PiAgICByZXQgPSBm
MmZzX2lzX2NvbXByZXNzZWRfY2x1c3RlcihjYy0+aW5vZGUsIHN0YXJ0X2lkeCk7Cj4gPiA+PiBA
QCAtMTEyMCw3ICsxMTIwLDEyIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVyd3Jp
dGUoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gPiA+PiAgICAgICAgICAgICAgICAgICAgZjJm
c19wdXRfcnBhZ2VzKGNjKTsKPiA+ID4+ICAgICAgICAgICAgICAgICAgICBmMmZzX3VubG9ja19y
cGFnZXMoY2MsIGkgKyAxKTsKPiA+ID4+ICAgICAgICAgICAgICAgICAgICBmMmZzX2Rlc3Ryb3lf
Y29tcHJlc3NfY3R4KGNjLCB0cnVlKTsKPiA+ID4+IC0gICAgICAgICAgICAgICAgICBnb3RvIHJl
dHJ5Owo+ID4gPj4gKyAgICAgICAgICAgICAgICAgIHJldHJ5X2NvdW50LS07Cj4gPiA+PiArICAg
ICAgICAgICAgICAgICAgaWYgKFBhZ2VFcnJvcihwYWdlKSAmJiAhcmV0cnlfY291bnQpIHsKPiA+
ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU87Cj4gPiA+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4+ICsgICAgICAgICAgICAgICAgICB9
IGVsc2UKPiA+ID4KPiA+ID4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiB1c2luZyBQR19lcnJvciBo
ZXJlPwo+ID4KPiA+IEluIHRoaXMgdmVyc2lvbiwgd2Ugc2V0IFBHX2Vycm9yIHdoZW4gY29tcHJl
c3NlZCBmYWlsZWQsIHNvIGNoZWNrIFBHX2Vycm9yIGhlcmUuCj4gPiBNYXliZSB3ZSBjYW4gcmVt
b3ZlIFBHX2Vycm9yIGluIGxhdGVyPwo+ID4KPgo+IFJlYWQgSS9PIGVycm9ycyBjYW4gYmUgZGV0
ZWN0ZWQgdmlhIFBHX3VwdG9kYXRlIG5vdCBiZWluZyBzZXQuICBUaGVyZSBzaG91bGRuJ3QKPiBi
ZSBhbnkgbmVlZCBmb3IgUEdfZXJyb3IgaGVyZS4KClllYWgsIEkgZ2V0IGl0IG5vdy4gTWF5YmUg
d2UgY2FuIHJlbW92ZSBQR19lcnJvciBpbiBmMmZzX3ZlcmlmeV9jbHVzdGVyIHRvby4KCmRpZmYg
LS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKaW5kZXggZDMx
NWMyZGUxMzZmLi4xM2MwYmZlNDU4MDQgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwor
KysgYi9mcy9mMmZzL2NvbXByZXNzLmMKQEAgLTE3MjcsMTAgKzE3MjcsOSBAQCBzdGF0aWMgdm9p
ZCBfX2YyZnNfZGVjb21wcmVzc19lbmRfaW8oc3RydWN0CmRlY29tcHJlc3NfaW9fY3R4ICpkaWMs
IGJvb2wgZmFpbGVkLAogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKCiAgICAgICAg
ICAgICAgICAvKiBQR19lcnJvciB3YXMgc2V0IGlmIHZlcml0eSBmYWlsZWQuICovCi0gICAgICAg
ICAgICAgICBpZiAoZmFpbGVkIHx8IFBhZ2VFcnJvcihycGFnZSkpIHsKLSAgICAgICAgICAgICAg
ICAgICAgICAgQ2xlYXJQYWdlVXB0b2RhdGUocnBhZ2UpOworICAgICAgICAgICAgICAgaWYgKGZh
aWxlZCkgewogICAgICAgICAgICAgICAgICAgICAgICAvKiB3aWxsIHJlLXJlYWQgYWdhaW4gbGF0
ZXIgKi8KLSAgICAgICAgICAgICAgICAgICAgICAgQ2xlYXJQYWdlRXJyb3IocnBhZ2UpOworICAg
ICAgICAgICAgICAgICAgICAgICBDbGVhclBhZ2VVcHRvZGF0ZShycGFnZSk7CiAgICAgICAgICAg
ICAgICB9IGVsc2UgewogICAgICAgICAgICAgICAgICAgICAgICBTZXRQYWdlVXB0b2RhdGUocnBh
Z2UpOwogICAgICAgICAgICAgICAgfQpAQCAtMTc0NSwxMyArMTc0NCwxNCBAQCBzdGF0aWMgdm9p
ZCBmMmZzX3ZlcmlmeV9jbHVzdGVyKHN0cnVjdAp3b3JrX3N0cnVjdCAqd29yaykKICAgICAgICBz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYyA9CiAgICAgICAgICAgICAgICBjb250YWluZXJf
b2Yod29yaywgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4LCB2ZXJpdHlfd29yayk7CiAgICAgICAg
aW50IGk7CisgICAgICAgYm9vbCBmYWlsZWQgPSBmYWxzZTsKCiAgICAgICAgLyogVmVyaWZ5IHRo
ZSBjbHVzdGVyJ3MgZGVjb21wcmVzc2VkIHBhZ2VzIHdpdGggZnMtdmVyaXR5LiAqLwogICAgICAg
IGZvciAoaSA9IDA7IGkgPCBkaWMtPmNsdXN0ZXJfc2l6ZTsgaSsrKSB7CiAgICAgICAgICAgICAg
ICBzdHJ1Y3QgcGFnZSAqcnBhZ2UgPSBkaWMtPnJwYWdlc1tpXTsKCiAgICAgICAgICAgICAgICBp
ZiAocnBhZ2UgJiYgIWZzdmVyaXR5X3ZlcmlmeV9wYWdlKHJwYWdlKSkKLSAgICAgICAgICAgICAg
ICAgICAgICAgU2V0UGFnZUVycm9yKHJwYWdlKTsKKyAgICAgICAgICAgICAgICAgICAgICAgZmFp
bGVkID0gdHJ1ZTsKICAgICAgICB9CgogICAgICAgIF9fZjJmc19kZWNvbXByZXNzX2VuZF9pbyhk
aWMsIGZhbHNlLCB0cnVlKTsKCj4KPiAtIEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
