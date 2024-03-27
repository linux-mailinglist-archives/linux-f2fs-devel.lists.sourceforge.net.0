Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70088D3B6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Mar 2024 02:27:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpI4X-0004Ba-LP;
	Wed, 27 Mar 2024 01:27:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rpI4W-0004BN-GM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 01:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zppxzZTYcPYTCfwQCIgoByNCATXqeso08TOMqgh4uHY=; b=PDIXUXA9V9Wil9JBktEdAGOkh7
 rJvvhT6yoIo+oIdx8Dh0Y8LapMTdwQftwMKJxgOLg/b5VHSdFRUFj2UM6jRO0OQw/FMaCwCiQk/qg
 F8Nj9lb4ultYE08W+v4qIlnLjI06RgJSK8yXviZriOxLOBh/H9CTfAS/2RdAf7x0x6YM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zppxzZTYcPYTCfwQCIgoByNCATXqeso08TOMqgh4uHY=; b=VVBy9ae3EYt4vMN6lXKlwlO96h
 qWhAqUX96ZPWZJximGCQz76E6Vq8gCJFDT1noehwjTZn/Tjl9M6bqfWoJ+TQntJV17F3TVQky4Eiw
 rgWLSg+JXTRi//eFryTwkiYJ3/Kg3VV8qcM3HCMUxBEz/p6Jjjb0jZzGJECkM2lPae8k=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rpI4S-0000kV-HK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 01:27:21 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-513d212f818so7030401e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Mar 2024 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711502830; x=1712107630; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zppxzZTYcPYTCfwQCIgoByNCATXqeso08TOMqgh4uHY=;
 b=TTKtq7Dj85Vy4xZtrpv09YncKbEik6ovHaOcow9Nm1DWu8ollvV1v4cXQMHyCAKUS8
 EfcmQH/lHAym0LbybVJGskG5ShDsD+30x+Mf6ixjF2YBZSnhcYDh7iwLEzcBDaJbCF9l
 V9/SfgknKx8x/W3hr33+gOFqG9y/iG2zue2Tu6auEJHq7EZsZWb3g4cm0xnDGqkL9t/T
 pjj587HCKeuZgirq1rQkTBs6dMrcBgP0daTmVduE7wTpk9jxwQrQtQ7ggvr6fGkPZFrQ
 zdel9zUKUKSLo5xik5FxwfICjePvrDMq3/Qd/ZjdVAIk9aWydGWhPtY1CYYIaEMWSP6e
 5x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711502830; x=1712107630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zppxzZTYcPYTCfwQCIgoByNCATXqeso08TOMqgh4uHY=;
 b=CbP3VwJzYUJPQlDIXorGhWfszEEy22YKApVc5zbLoOVDWE1efg4/dYxF/0W4NOYXjJ
 WrqI6WKemzf2LoI3jPb35XxLsTwxKp7vOuD4VPB7R+ED+EovO4WLpjI746rIRE9D8j/2
 aiIpU2tQnbidcgWzx+fibmpncG9HCDkm9rM8b1pKoMO2DdZlD7NwDqGQ3m/4nMDZv3Vs
 4rK5KY11JOzJFJ5FhhR+JNtTnzHAaQbz3hqrd0dVjuwGuQs24qpnWG+mQONyw2C+RbPC
 UrmN3QW5hbSfyRSnCIiNc3xIjsChsbDV8bt8mLBr+rLRYdljqkN4gx6muu8Pt3wte8We
 kcuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWbmn//Qgu/F9/pfWIpx3QpWK2Z+9UEKylr9Q0rPu+b/sg0Fdequ7gobnfuvK+31pS7sawn9xnm96yw1dDhzmhxr0KTk3V76SXILdM9kEoTexBiaeF5A==
X-Gm-Message-State: AOJu0YwkVraaykHPWZt2MR3qXaH2dq8y7CMiRcaOHnvlqbKoynIuMXY8
 VanMzsPyF2Oqj4Wp2gYapsZEPLuOxx5PmLVIfAa3AeYJ2Cg57m1tZNqrwTaMd1Ns6OUjsYr0pIP
 6ZqdVTWX5s8F4T0JI97z1Z2H8D5Y=
X-Google-Smtp-Source: AGHT+IGTeCa7sBciFGIKw9lSR5iXHo9XhZkQYSeX+wTLh2+99nQ/NVnxgW7umWmBqjGIOJrmk/XvQBndl0kVBRInLGg=
X-Received: by 2002:a19:7016:0:b0:515:b06f:a89a with SMTP id
 h22-20020a197016000000b00515b06fa89amr782978lfc.38.1711502829855; Tue, 26 Mar
 2024 18:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <1711346195-24555-1-git-send-email-zhiguo.niu@unisoc.com>
 <8a6b2768-8ab6-4275-8c4e-05b4eca83987@kernel.org>
In-Reply-To: <8a6b2768-8ab6-4275-8c4e-05b4eca83987@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 27 Mar 2024 09:26:58 +0800
Message-ID: <CAHJ8P3J3xK2uz7egvShyCeAjGFJ87AvqKxVN=NFiKDgMLMJDPg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Mar 26, 2024 at 7:11 PM Chao Yu wrote: > > On 2024/3/25
    13:56, Zhiguo Niu wrote: > > A length that exceeds the real size of the inode
    may be > > specified from user, although these out-of- [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.42 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.42 listed in wl.mailspike.net]
X-Headers-End: 1rpI4S-0000kV-HK
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropirate
 defragment pg_end
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
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgNzoxMeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMjUgMTM6NTYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBB
IGxlbmd0aCB0aGF0IGV4Y2VlZHMgdGhlIHJlYWwgc2l6ZSBvZiB0aGUgaW5vZGUgbWF5IGJlCj4g
PiBzcGVjaWZpZWQgZnJvbSB1c2VyLCBhbHRob3VnaCB0aGVzZSBvdXQtb2YtcmFuZ2UgYXJlYXMK
PiA+IGFyZSBub3QgbWFwcGVkLCBidXQgdGhleSBzdGlsbCBuZWVkIHRvIGJlIGNoZWNrIGluCj4g
PiB3aGlsZSBsb29wLCB3aGljaCBpcyB1bm5lY2Vzc2FyeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+IHYyOiBjaGVj
ayBpX3NpemUgd2l0aGluIGlub2RlIGxvY2sgYWNjb3JkaW5nIHRvIENoYW8ncyBzdWdnZXN0aW9u
cwo+ID4gLS0tCj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9maWxlLmMgfCAxMSArKysrKysrLS0tLQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRl
eCAxMjhlNTNkLi5jZjYzZGI3IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+ICsr
KyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtMjYwOCw5ICsyNjA4LDYgQEAgc3RhdGljIGludCBm
MmZzX2RlZnJhZ21lbnRfcmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAg
Ym9vbCBmcmFnbWVudGVkID0gZmFsc2U7Cj4gPiAgICAgICBpbnQgZXJyOwo+ID4KPiA+IC0gICAg
IHBnX3N0YXJ0ID0gcmFuZ2UtPnN0YXJ0ID4+IFBBR0VfU0hJRlQ7Cj4gPiAtICAgICBwZ19lbmQg
PSAocmFuZ2UtPnN0YXJ0ICsgcmFuZ2UtPmxlbikgPj4gUEFHRV9TSElGVDsKPiA+IC0KPiA+ICAg
ICAgIGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+ID4KPiA+ICAgICAgIGlub2RlX2xvY2so
aW5vZGUpOwo+ID4gQEAgLTI2MjksMTAgKzI2MjYsMTYgQEAgc3RhdGljIGludCBmMmZzX2RlZnJh
Z21lbnRfcmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Cj4gcGdfc3RhcnQgPSByYW5n
ZS0+c3RhcnQgPj4gUEFHRV9TSElGVDsKPiBwZ19lbmQgPSBtaW5fdChwZ29mZl90LCAocmFuZ2Ut
PnN0YXJ0ICsgcmFuZ2UtPmxlbikgPj4gUEFHRV9TSElGVCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBESVZfUk9VTkRfVVAoaV9zaXplX3JlYWQoaW5vZGUpLCBQQUdFX1NJWkUpKTsKPgo+ID4K
PiA+ICAgICAgIC8qIHdyaXRlYmFjayBhbGwgZGlydHkgcGFnZXMgaW4gdGhlIHJhbmdlICovCj4g
PiAgICAgICBlcnIgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKGlub2RlLT5pX21hcHBp
bmcsIHJhbmdlLT5zdGFydCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByYW5nZS0+c3RhcnQgKyByYW5nZS0+bGVuIC0gMSk7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWluX3QobG9mZl90LCByYW5nZS0+
c3RhcnQgKyByYW5nZS0+bGVuIC0gMSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpX3NpemVfcmVhZChpbm9kZSkgLSAxKSk7Cj4KPiAsIHBnX3N0YXJ0
IDw8IFBBR0VfU0hJRlQgLSAxLCBwZ19lbmQgPDwgUEFHRV9TSElGVCAtIDEpOyA/CnNob3VsZCBi
ZSAgcGdfc3RhcnQgPDwgUEFHRV9TSElGVCAsIHBnX2VuZCA8PCBQQUdFX1NISUZUIC0gMSk/Pwpp
ZiByYW5nZS5zdGFydD0wLCBwZ19zdGFydCBpcyBhbHNvIDAsIGxzdGFydCBpbgpmaWxlbWFwX3dy
aXRlX2FuZF93YWl0X3JhbmdlIGlzIDAsCmJ1dCBwZ19zdGFydCA8PCBQQUdFX1NISUZUIC0gMSB3
aWxsIGdldCBsc3RhcnQ9LTE/CnRoYW5rc++8gQo+Cj4gVGhhbmtzLAo+Cj4gPiAgICAgICBpZiAo
ZXJyKQo+ID4gICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Cj4gPiArICAgICBwZ19zdGFydCA9
IHJhbmdlLT5zdGFydCA+PiBQQUdFX1NISUZUOwo+ID4gKyAgICAgcGdfZW5kID0gbWluX3QocGdv
ZmZfdCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChyYW5nZS0+c3RhcnQgKyBy
YW5nZS0+bGVuKSA+PiBQQUdFX1NISUZULAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRElWX1JPVU5EX1VQKGlfc2l6ZV9yZWFkKGlub2RlKSwgUEFHRV9TSVpFKSk7Cj4gPiArCj4g
PiAgICAgICAvKgo+ID4gICAgICAgICogbG9va3VwIG1hcHBpbmcgaW5mbyBpbiBleHRlbnQgY2Fj
aGUsIHNraXAgZGVmcmFnbWVudGluZyBpZiBwaHlzaWNhbAo+ID4gICAgICAgICogYmxvY2sgYWRk
cmVzc2VzIGFyZSBjb250aW51b3VzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
