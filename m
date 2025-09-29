Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A888BA8EF6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 12:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndrVXvnJwiAVJ7p04eSMudCA/uNSHz30uchpbmH+0Uw=; b=dyDONsunR3I/nUADJb4lEdENUh
	iNoToaFblTrA+bRcn0f0plpGVv5lXKIlcoOtfuo2mufbXbYVWGwWt9x3+cMwSNpv65xcM1qFqerRv
	RFyUYyJ6TQ/0RvO8sp3e5E3N0GrgTR7M0vFEg++DuXxbszXAiOBG3LerdciWCyWTfgfM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3BZn-0003fX-TD;
	Mon, 29 Sep 2025 10:57:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1v3BZm-0003fJ-HW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHXzobpLJ49nI/+XddZ1qpjJ3WtXnO55EUnggz8fl/g=; b=HU3TlcFpeJxW71pQSlPTXJ8V2L
 CCI93m9trF18ButPngSQHfsZgzzUnsqLis0q5/HGhMHIuHosxVxHWD8cEfP+WYAgDeMHRY6bchqIU
 aUdWWA/zDlc0a8tBbuMw1me9Kzw0zioNeHl6pKJ2oLagNOaLFVjm3Akpw/saa4WStqg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHXzobpLJ49nI/+XddZ1qpjJ3WtXnO55EUnggz8fl/g=; b=E6HLqIhqc8HbiX+3dZsEAGbCoj
 3+XgPXKJYTnk5DLD99Yb8s/dteW2J19puVk3s4jMLMiQz9JlV+abVt6qekIiwU/S4jfOFXv6VR+M0
 mplu0B7srLEtz02QGyXFWg3g9vHml6C9miOzovVsE9cmF8S6qpsVBGu0zd2du8C9pP+I=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3BZm-0001iA-L5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:57:51 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3682ac7f33fso55471041fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759143464; x=1759748264; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHXzobpLJ49nI/+XddZ1qpjJ3WtXnO55EUnggz8fl/g=;
 b=ge30vvav38wl5fDohCFr7t3iqdn3FRobp2kR8a5vLQwqoXnySgNmq5xy0Om8bJCQmj
 3Pd4VkUML92NmVHpLzpdvabyVF06a4VgLSlKnZVcQ7ND1O6k9aEax01uvpFmtfiVEn2o
 2W5nN6YtG4bCF0DK/MVlNNZUsqGw7jHNKy9sIfJEPA0dz98pwhbIN016hloPJ/l7tTp5
 cOqOWDb3RmTZYewJqGLxOoBYKZEGL+uStAYqoD2Wjunxc/7CzOoic2ntLs7eZCwguqni
 uC9VxfS0tdFaHgiytC+dmpCXc9wcOdFu/m8KTQJBdfWLnvpMLlECN9oS70htWKegOadZ
 0XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759143464; x=1759748264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHXzobpLJ49nI/+XddZ1qpjJ3WtXnO55EUnggz8fl/g=;
 b=imknjeNeTFCywAutigBIeGnetwsmd9gFeXScJ+OHCyNNdP+woLUipOPAclt2lEXJ6j
 Wk68YlUa/nn7JeSvf3aP1HTrFCaemuUj5SUede8VolailDiSSHp3wKnc6g1E5EYq1lPg
 BAUuG0XwPrQxPsLw/qakJUI8cK4C4cbuqbFNbg7yg139ACzN5Eb6OcRlTTDgSB6lBJap
 VuLMcGHXlzPEzJT8LAbL38xVdPsDfCbf64HqvAjxFRgGVCUu1dpDzAaIdvu8UhJa89Pa
 BXKZFSwDAeyVmtdMyLaX1qGP2SoYfwizo7dl5rb9Cy3ZhBGMy6zhkUAYMl5vgpUNMVFd
 GG8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEctWsITVXOnVCwnzx2RNE/7WF+T6cIO2bAQJv1/kyyG5uDMU84uNmc3pM/Irok3IPyfFeZhvgVb1ntM78bpXr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwqMs/V+BxFiKpqzRXIUhOLOlSX4WVZ+SsLrWUQzD8krYIf8mW6
 YPWAtgwThQb6HvDxRA/+N6RuKD3rr24wuF+ak8VCwgGd9/MWIu9k1igb5+pxZx7RmVE8SfH954U
 w4AlRWw7iqs0KznV3I1NkgF7i7TpLb6s=
X-Gm-Gg: ASbGnctSDwMtmuJUrf9ES6j3UmDA0SBK42kTF3Q+YhKueNHbznMFM6CwztAp+iRPFGD
 RCQyKbdVjykJNgytNaW9gQul5MGrlou1jtlTue/qNWaTQ24k+j6h4Ypv61i3J8Xt/OiybINl8Hb
 ugDE9zvDm2Yr/DetU/dbj8ryCDgjq8OOSOkjKlQN26vBYRSYbp1uaGLBRTmLC86VeJfj3DZLPUK
 GrRX3JZ222TjCi+QRNybm9rUv8jZVY=
X-Google-Smtp-Source: AGHT+IGWuBxNGdwpR1qoBJpJgw+amjLbYU9hsRksLpCILSPVONQpvSdK96EgUU9ULAnuDqxgbW6BMzUzXAVtxbo57r8=
X-Received: by 2002:a05:651c:502:b0:372:89df:9673 with SMTP id
 38308e7fff4ca-372fa29f95fmr330321fa.13.1759143463517; Mon, 29 Sep 2025
 03:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250929095544.308392-1-sunjunchao@bytedance.com>
 <f8cf2061-44f3-4775-b321-713dc90c3282@suse.com>
In-Reply-To: <f8cf2061-44f3-4775-b321-713dc90c3282@suse.com>
From: Julian Sun <sunjunchao2870@gmail.com>
Date: Mon, 29 Sep 2025 18:57:31 +0800
X-Gm-Features: AS18NWAAuvHx66ggA-u_WXc9TsJVtaQqxswdi4XTKTeAlkY1OmNtEzHnxjh03Xk
Message-ID: <CAHB1Naj44zBo1Fi_+SSpNx1PSXyAy3XnTMPDdU4yCPkr3oxcNw@mail.gmail.com>
To: Qu Wenruo <wqu@suse.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Sep 29, 2025 at 6:16 PM Qu Wenruo wrote: > > > > 在
    2025/9/29 19:25, Julian Sun 写道: > > The logic in wbc_to_tag() is widely
    used in file systems, so modify this > > function to be exter [...] 
 
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
                             [sunjunchao2870(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [sunjunchao2870(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.174 listed in wl.mailspike.net]
X-Headers-End: 1v3BZm-0001iA-L5
Subject: Re: [f2fs-dev] [PATCH] fs: Make wbc_to_tag() extern and use it in
 fs.
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
Cc: brauner@kernel.org, xiubli@redhat.com, tytso@mit.edu, agruenba@redhat.com,
 Julian Sun <sunjunchao@bytedance.com>, jack@suse.cz, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, clm@fb.com, dsterba@suse.com,
 jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org, idryomov@gmail.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBTZXAgMjksIDIwMjUgYXQgNjoxNuKAr1BNIFF1IFdlbnJ1byA8d3F1QHN1c2UuY29t
PiB3cm90ZToKPgo+Cj4KPiDlnKggMjAyNS85LzI5IDE5OjI1LCBKdWxpYW4gU3VuIOWGmemBkzoK
PiA+IFRoZSBsb2dpYyBpbiB3YmNfdG9fdGFnKCkgaXMgd2lkZWx5IHVzZWQgaW4gZmlsZSBzeXN0
ZW1zLCBzbyBtb2RpZnkgdGhpcwo+ID4gZnVuY3Rpb24gdG8gYmUgZXh0ZXJuIGFuZCB1c2UgaXQg
aW4gZmlsZSBzeXN0ZW1zLgo+ID4KPiA+IFRoaXMgcGF0Y2ggaGFzIG9ubHkgcGFzc2VkIGNvbXBp
bGF0aW9uIHRlc3RzLCBidXQgaXQgc2hvdWxkIGJlIGZpbmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogSnVsaWFuIFN1biA8c3VuanVuY2hhb0BieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgIGZz
L2J0cmZzL2V4dGVudF9pby5jICAgICAgfCA1ICstLS0tCj4gPiAgIGZzL2NlcGgvYWRkci5jICAg
ICAgICAgICAgfCA2ICstLS0tLQo+ID4gICBmcy9leHQ0L2lub2RlLmMgICAgICAgICAgIHwgNSAr
LS0tLQo+ID4gICBmcy9mMmZzL2RhdGEuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ID4gICBmcy9n
ZnMyL2FvcHMuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L3dyaXRl
YmFjay5oIHwgMSArCj4gPiAgIG1tL3BhZ2Utd3JpdGViYWNrLmMgICAgICAgfCAyICstCj4gPiAg
IDcgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZnMvYnRyZnMvZXh0ZW50X2lvLmMgYi9mcy9idHJmcy9leHRlbnRfaW8u
Ywo+ID4gaW5kZXggYjIxY2I3MjgzNWNjLi4wZmVhNTgyODcxNzUgMTAwNjQ0Cj4gPiAtLS0gYS9m
cy9idHJmcy9leHRlbnRfaW8uYwo+ID4gKysrIGIvZnMvYnRyZnMvZXh0ZW50X2lvLmMKPiA+IEBA
IC0yMzkwLDEwICsyMzkwLDcgQEAgc3RhdGljIGludCBleHRlbnRfd3JpdGVfY2FjaGVfcGFnZXMo
c3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZCVFJGU19JKGlub2RlKS0+cnVudGltZV9mbGFncykpCj4gPiAgICAgICAgICAgICAg
IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMgPSAxOwo+ID4KPiA+IC0gICAgIGlmICh3YmMtPnN5bmNf
bW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0ZXBhZ2VzKQo+ID4gLSAgICAg
ICAgICAgICB0YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gPiAtICAgICBlbHNlCj4gPiAt
ICAgICAgICAgICAgIHRhZyA9IFBBR0VDQUNIRV9UQUdfRElSVFk7Cj4gPiArICAgICB0YWcgPSB3
YmNfdG9fdGFnKHdiYyk7Cj4gPiAgIHJldHJ5Ogo+ID4gICAgICAgaWYgKHdiYy0+c3luY19tb2Rl
ID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gPiAgICAgICAgICAg
ICAgIHRhZ19wYWdlc19mb3Jfd3JpdGViYWNrKG1hcHBpbmcsIGluZGV4LCBlbmQpOwo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2NlcGgvYWRkci5jIGIvZnMvY2VwaC9hZGRyLmMKPiA+IGluZGV4IDMyMmVk
MjY4ZjE0YS4uNjNiNzVkMjE0MjEwIDEwMDY0NAo+ID4gLS0tIGEvZnMvY2VwaC9hZGRyLmMKPiA+
ICsrKyBiL2ZzL2NlcGgvYWRkci5jCj4gPiBAQCAtMTA0NSwxMSArMTA0NSw3IEBAIHZvaWQgY2Vw
aF9pbml0X3dyaXRlYmFja19jdGwoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gPiAg
ICAgICBjZXBoX3diYy0+aW5kZXggPSBjZXBoX3diYy0+c3RhcnRfaW5kZXg7Cj4gPiAgICAgICBj
ZXBoX3diYy0+ZW5kID0gLTE7Cj4gPgo+ID4gLSAgICAgaWYgKHdiYy0+c3luY19tb2RlID09IFdC
X1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpIHsKPiA+IC0gICAgICAgICAgICAg
Y2VwaF93YmMtPnRhZyA9IFBBR0VDQUNIRV9UQUdfVE9XUklURTsKPiA+IC0gICAgIH0gZWxzZSB7
Cj4gPiAtICAgICAgICAgICAgIGNlcGhfd2JjLT50YWcgPSBQQUdFQ0FDSEVfVEFHX0RJUlRZOwo+
ID4gLSAgICAgfQo+ID4gKyAgICAgY2VwaF93YmMtPnRhZyA9IHdiY190b190YWcod2JjKTsKPiA+
Cj4gPiAgICAgICBjZXBoX3diYy0+b3BfaWR4ID0gLTE7Cj4gPiAgICAgICBjZXBoX3diYy0+bnVt
X29wcyA9IDA7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZXh0NC9pbm9kZS5jIGIvZnMvZXh0NC9pbm9k
ZS5jCj4gPiBpbmRleCA1YjdhMTVkYjQ5NTMuLjE5NmViYTdmYTM5YyAxMDA2NDQKPiA+IC0tLSBh
L2ZzL2V4dDQvaW5vZGUuYwo+ID4gKysrIGIvZnMvZXh0NC9pbm9kZS5jCj4gPiBAQCAtMjYxOSwx
MCArMjYxOSw3IEBAIHN0YXRpYyBpbnQgbXBhZ2VfcHJlcGFyZV9leHRlbnRfdG9fbWFwKHN0cnVj
dCBtcGFnZV9kYV9kYXRhICptcGQpCj4gPiAgICAgICBoYW5kbGVfdCAqaGFuZGxlID0gTlVMTDsK
PiA+ICAgICAgIGludCBicHAgPSBleHQ0X2pvdXJuYWxfYmxvY2tzX3Blcl9mb2xpbyhtcGQtPmlu
b2RlKTsKPiA+Cj4gPiAtICAgICBpZiAobXBkLT53YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FM
TCB8fCBtcGQtPndiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gPiAtICAgICAgICAgICAgIHRhZyA9
IFBBR0VDQUNIRV9UQUdfVE9XUklURTsKPiA+IC0gICAgIGVsc2UKPiA+IC0gICAgICAgICAgICAg
dGFnID0gUEFHRUNBQ0hFX1RBR19ESVJUWTsKPiA+ICsgICAgIHRhZyA9IHdiY190b190YWcobXBk
LT53YmMpOwo+ID4KPiA+ICAgICAgIG1wZC0+bWFwLm1fbGVuID0gMDsKPiA+ICAgICAgIG1wZC0+
bmV4dF9wb3MgPSBtcGQtPnN0YXJ0X3BvczsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBpbmRleCA3OTYxZTBkZGZjYTMuLjEwMWU5NjI4NDVkYiAx
MDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+
ID4gQEAgLTMwMDMsMTAgKzMwMDMsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfY2FjaGVfcGFn
ZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gPiAgICAgICAgICAgICAgIGlmICh3
YmMtPnJhbmdlX3N0YXJ0ID09IDAgJiYgd2JjLT5yYW5nZV9lbmQgPT0gTExPTkdfTUFYKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHJhbmdlX3dob2xlID0gMTsKPiA+ICAgICAgIH0KPiA+IC0g
ICAgIGlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0
ZXBhZ2VzKQo+ID4gLSAgICAgICAgICAgICB0YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4g
PiAtICAgICBlbHNlCj4gPiAtICAgICAgICAgICAgIHRhZyA9IFBBR0VDQUNIRV9UQUdfRElSVFk7
Cj4gPiArICAgICB0YWcgPSB3YmNfdG9fdGFnKHdiYyk7Cj4gPiAgIHJldHJ5Ogo+ID4gICAgICAg
cmV0cnkgPSAwOwo+ID4gICAgICAgaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8
IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZ2ZzMi9hb3BzLmMg
Yi9mcy9nZnMyL2FvcHMuYwo+ID4gaW5kZXggNDdkNzRhZmQ2M2FjLi4xMjM5NGZjNWRkMjkgMTAw
NjQ0Cj4gPiAtLS0gYS9mcy9nZnMyL2FvcHMuYwo+ID4gKysrIGIvZnMvZ2ZzMi9hb3BzLmMKPiA+
IEBAIC0zMTEsMTAgKzMxMSw3IEBAIHN0YXRpYyBpbnQgZ2ZzMl93cml0ZV9jYWNoZV9qZGF0YShz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiA+ICAgICAgICAgICAgICAgICAgICAgICBy
YW5nZV93aG9sZSA9IDE7Cj4gPiAgICAgICAgICAgICAgIGN5Y2xlZCA9IDE7IC8qIGlnbm9yZSBy
YW5nZV9jeWNsaWMgdGVzdHMgKi8KPiA+ICAgICAgIH0KPiA+IC0gICAgIGlmICh3YmMtPnN5bmNf
bW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0ZXBhZ2VzKQo+ID4gLSAgICAg
ICAgICAgICB0YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gPiAtICAgICBlbHNlCj4gPiAt
ICAgICAgICAgICAgIHRhZyA9IFBBR0VDQUNIRV9UQUdfRElSVFk7Cj4gPiArICAgICB0YWcgPSB3
YmNfdG9fdGFnKHdiYyk7Cj4gPgo+ID4gICByZXRyeToKPiA+ICAgICAgIGlmICh3YmMtPnN5bmNf
bW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0ZXBhZ2VzKQo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmggYi9pbmNsdWRlL2xpbnV4L3dyaXRlYmFj
ay5oCj4gPiBpbmRleCBhMjg0OGQ3MzFhNDYuLjg4NDgxMTU5NmUxMCAxMDA2NDQKPiA+IC0tLSBh
L2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvd3JpdGVi
YWNrLmgKPiA+IEBAIC0zNzAsNiArMzcwLDcgQEAgaW50IGRvX3dyaXRlcGFnZXMoc3RydWN0IGFk
ZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjKTsKPiA+
ICAgdm9pZCB3cml0ZWJhY2tfc2V0X3JhdGVsaW1pdCh2b2lkKTsKPiA+ICAgdm9pZCB0YWdfcGFn
ZXNfZm9yX3dyaXRlYmFjayhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBnb2ZmX3Qgc3RhcnQsIHBnb2ZmX3QgZW5kKTsKPiA+ICt4
YV9tYXJrX3Qgd2JjX3RvX3RhZyhzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYyk7Cj4gPgo+
ID4gICBib29sIGZpbGVtYXBfZGlydHlfZm9saW8oc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBp
bmcsIHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+ID4gICBib29sIGZvbGlvX3JlZGlydHlfZm9yX3dy
aXRlcGFnZShzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKiwgc3RydWN0IGZvbGlvICopOwo+ID4g
ZGlmZiAtLWdpdCBhL21tL3BhZ2Utd3JpdGViYWNrLmMgYi9tbS9wYWdlLXdyaXRlYmFjay5jCj4g
PiBpbmRleCAzZTI0OGQxYzM5NjkuLjI0MzgwOGUxOTQ0NSAxMDA2NDQKPiA+IC0tLSBhL21tL3Bh
Z2Utd3JpdGViYWNrLmMKPiA+ICsrKyBiL21tL3BhZ2Utd3JpdGViYWNrLmMKPiA+IEBAIC0yNDM0
LDcgKzI0MzQsNyBAQCBzdGF0aWMgYm9vbCBmb2xpb19wcmVwYXJlX3dyaXRlYmFjayhzdHJ1Y3Qg
YWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gICB9Cj4g
Pgo+ID4gLXN0YXRpYyB4YV9tYXJrX3Qgd2JjX3RvX3RhZyhzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRy
b2wgKndiYykKPiA+ICt4YV9tYXJrX3Qgd2JjX3RvX3RhZyhzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRy
b2wgKndiYykKPgo+IFRoZSBmdW5jdGlvbiBpcyBzbWFsbCBlbm91Z2gsIHdoeSBub3QgZXhwb3J0
IGl0IGFzIGFuIGlubGluZSBmdW5jdGlvbj8KPgoKR29vZCBpZGVhLCB3aWxsIGZpeCBpdCBpbiBw
YXRjaCB2Mi4KPiBUaGUgY3VycmVudCB2ZXJzaW9uIGFsc28gbGFja3MgRVhQT1JUX1NZTUJPTCgp
LCBpdCBtYXkgY2F1c2UgcHJvYmxlbXMKPiBmb3IgZnNlcyBidWlsdCBhcyBhIG1vZHVsZS4KPgo+
IFRoYW5rcywKPiBRdQo+Cj4gPiAgIHsKPiA+ICAgICAgIGlmICh3YmMtPnN5bmNfbW9kZSA9PSBX
Ql9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0ZXBhZ2VzKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gUEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+Cj4KClRoYW5rcywKLS0gCkp1bGlhbiBTdW4g
PHN1bmp1bmNoYW8yODcwQGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
