Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF00817F81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 02:57:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFPMR-00031q-QI;
	Tue, 19 Dec 2023 01:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rFPMR-00031k-4d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 01:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kq3IPb9MxUI/WofczsPTB2b0KO9e9TG8+h96NbTnoHA=; b=VGFHIU61zr4jWsf5NFbcova1kO
 WOM9Id/RYQPt6dksG7dVJYiPH9svb9g+OqZct4vaIIIkZrJ+qyn/sNioOKhyQu0qqkNvJNu2u8SnH
 CVIa/wzDpK8sRQH3aNMBGCwS6e6vbm6kYxVqJorfDWhbqBK+bfXydAwdPL57P3HDBo+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kq3IPb9MxUI/WofczsPTB2b0KO9e9TG8+h96NbTnoHA=; b=johp1r6TyAOQQz2jRbuit7/X96
 uk/5QySxC+svHAAWpmzEZ3/zMMHjc3uhCESk0ybATQAOSn6N6Mx3Ua7hKmGy02Gkom4hNqknEcrOa
 JDAomqpGI7c+I//oOpWJRORU/9+BHJWh5G5q0uUH5B3QSZGPoORXec8v2Eykbmtr4kb4=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFPMQ-0004w9-Of for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 01:57:31 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so1145647f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Dec 2023 17:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702951039; x=1703555839; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kq3IPb9MxUI/WofczsPTB2b0KO9e9TG8+h96NbTnoHA=;
 b=OFO7AZlK+VtS1wdjG10KAnTgx1ZhJq9+pocPBjGDFy+JPB93XH6/6yR+Z1T4cY3zvN
 5ODwXfKNg2ZiopmXxwIDD6WYNa8Zy1vv9YhRjh01KNm1fd68pumNVwQ8UcpbEBRiHf5n
 dqvWNaJsp+fRxmgL4IcmtMdEEo8RhkdbAwj9o9P6wYCHmngHu7F7ninRPF2t9VZcp7cC
 WLbrKiDff73Al5rkHQnA/ZBR8RS047veLlqinj+En/k8euhRyqKdBeEo2GYB13YkBvbX
 uHh6+u2uuO+Wzi32N1RcyF0kMA0/IVIK9oLC5K67H53lMDOWDloFBPwM+IIQ5+gBZtj3
 GXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702951039; x=1703555839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kq3IPb9MxUI/WofczsPTB2b0KO9e9TG8+h96NbTnoHA=;
 b=Nlgk2kwesp6Vd3qzDWxDFh3WnrUoGH5FCx1lUp82O28LZ1FAdhYQ/U0WIUCNeImH7/
 +/FCCj2tACjG+Gg8MCZk6x1FsPck356dZcT0RepTu84jx2miUDpuKqkKOq9AYSwpWWoR
 XZsvYPx8j8KGrNsseLi/6QgRyEhEBjV95nZvmc7ZcH5WTPGjNlA9oWfHWyaRZ2Rb+FSt
 7os927/FnxNrQSyAjZ7Et/5Gnq8t+axlPpvvowGongwT3Awu27DBx+f5PxkUXNHwsBah
 iHGgdQdWYQAcwt3EmNpKuQjs9R6nN3ouJD+Vuw2tQf2RtJB64XhBYrNCNjhE45Aexq+t
 sVDQ==
X-Gm-Message-State: AOJu0YyCnGGPhAtDvWF3uzsifLH6YAsk0KZAzbdP1tHU55anS/yJirm7
 3htVG5nh9fe2qdBVeA06ptWqU/7WLVy0DdBD63PDmkyPCHo=
X-Google-Smtp-Source: AGHT+IEEg+ro2wr1eP4EEpxwF1bjId8wJ5nQM/4YgsUGkOLSWNtyHnagsO1N5oEir7r8m6skfrJu3tOPg8vSNVQ0gGs=
X-Received: by 2002:a5d:564e:0:b0:336:5423:6c9c with SMTP id
 j14-20020a5d564e000000b0033654236c9cmr1622154wrw.16.1702943988822; Mon, 18
 Dec 2023 15:59:48 -0800 (PST)
MIME-Version: 1.0
References: <1702897676-12851-1-git-send-email-zhiguo.niu@unisoc.com>
 <ZYCFH4cyjjCVbpDF@google.com>
In-Reply-To: <ZYCFH4cyjjCVbpDF@google.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 19 Dec 2023 07:59:37 +0800
Message-ID: <CAHJ8P3LoN0eAJyO378zFss13mprZ1VegGFe=23d9UL2jFnnT-Q@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 19, 2023 at 1:45 AM Jaegeuk Kim wrote: > > On
    12/18, Zhiguo Niu wrote: > > The current pending_discard attr just only shows
    the discard_cmd_cnt > > information. More discard status can [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.42 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFPMQ-0004w9-Of
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMTo0NeKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTIvMTgsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBUaGUg
Y3VycmVudCBwZW5kaW5nX2Rpc2NhcmQgYXR0ciBqdXN0IG9ubHkgc2hvd3MgdGhlIGRpc2NhcmRf
Y21kX2NudAo+ID4gaW5mb3JtYXRpb24uIE1vcmUgZGlzY2FyZCBzdGF0dXMgY2FuIGJlIHNob3du
IHNvIHRoYXQgd2UgY2FuIGNoZWNrCj4gPiB0aGVtIHRocm91Z2ggc3lzZnMgd2hlbiBuZWVkZWQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29t
Pgo+ID4gLS0tCj4gPiBjaGFuZ2VzIG9mIHYyOiBJbXByb3ZlIHRoZSBwYXRjaCBhY2NvcmRpbmcg
dG8gQ2hhbydzIHN1Z2dlc3Rpb25zLgo+ID4gY2hhbmdlcyBvZiB2MzogQWRkIGEgYmxhbmsgbGlu
ZSBmb3IgZWFzeSByZWFkaW5nLgo+ID4gLS0tCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL0FC
SS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCAgNiArKysrKysKPiA+ICBmcy9mMmZzL3N5c2ZzLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rl
c3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gaW5kZXggMzZjM2NiNS4uYzY5NzBlNSAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gPiBAQCAtNDk4LDYgKzQ5
OCwxMiBAQCBEZXNjcmlwdGlvbjogICAgIFNob3cgc3RhdHVzIG9mIGYyZnMgY2hlY2twb2ludCBp
biByZWFsIHRpbWUuCj4gPiAgICAgICAgICAgICAgIENQX1JFU0laRUZTX0ZMQUcgICAgICAgICAg
ICAgICAgMHgwMDAwNDAwMAo+ID4gICAgICAgICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4KPiA+ICtXaGF0OiAg
ICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L3N0YXQvZGlzY2FyZF9zdGF0dXMKPiA+
ICtEYXRlOiAgICAgICAgICAgICAgICBOb3ZlbWJlciAyMDIzCj4gPiArQ29udGFjdDogICAgICJa
aGlndW8gTml1IiA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4gK0Rlc2NyaXB0aW9uOiBTaG93
IHN0YXR1cyBvZiBmMmZzIGRpc2NhcmQgaW4gcmVhbCB0aW1lLCBpbmNsdWRpbmcKPiA+ICsgICAg
ICAgICAgICAgImlzc3VlZCBkaXNjYXJkIiwicXVldWVkIGRpc2NhcmQiIGFuZCAidW5kaXNjYXJk
IGJsb2NrcyIuCj4gPiArCj4gPiAgV2hhdDogICAgICAgICAgICAgICAgL3N5cy9mcy9mMmZzLzxk
aXNrPi9ja3B0X3RocmVhZF9pb3ByaW8KPiA+ICBEYXRlOiAgICAgICAgICAgICAgICBKYW51YXJ5
IDIwMjEKPiA+ICBDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+
ID4gaW5kZXggNDE3ZmFlOTYuLjMxMmE0ZGMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N5c2Zz
LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gQEAgLTEzNCw2ICsxMzQsMjIgQEAgc3Rh
dGljIHNzaXplX3QgY3Bfc3RhdHVzX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAg
IHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiV4XG4iLCBsZTMyX3RvX2NwdShGMkZTX0NLUFQoc2Jp
KS0+Y2twdF9mbGFncykpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHNzaXplX3QgZGlzY2FyZF9z
dGF0dXNfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZGlz
Y2FyZF9jbWRfY29udHJvbCAqZGNjID0gU01fSShzYmkpLT5kY2NfaW5mbzsKPiA+ICsKPiA+ICsg
ICAgIGlmICghZGNjKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+
ICsgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsbHUsICVsbHUsICV1XG4iLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpYXRvbWljX3JlYWQoCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZGNjLT5pc3N1ZWRfZGlzY2FyZCksCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylhdG9taWNfcmVhZCgKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkY2MtPnF1ZXVlZF9kaXNjYXJkKSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBkY2MtPnVuZGlzY2FyZF9ibGtzKTsKPgo+IFdlIGNhbm5v
dCBkbyB0aGlzIHNpbmNlIGl0IG5lZWRzIG9uZSB2YWx1ZSBwZXIgb25lIGVudHJ5LgpPSywgSSB3
aWxsIHNwbGl0IHRoaXMgaW50byB0aHJlZSBlbnRyeS4gdGhhbmtzCj4KPiA+ICt9Cj4gPiArCj4g
PiAgc3RhdGljIHNzaXplX3QgcGVuZGluZ19kaXNjYXJkX3Nob3coc3RydWN0IGYyZnNfYXR0ciAq
YSwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYp
Cj4gPiAgewo+ID4gQEAgLTExOTcsOSArMTIxMywxMiBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3Ni
X2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4KPiA+ICBGMkZTX0dFTkVSQUxf
Uk9fQVRUUihzYl9zdGF0dXMpOwo+ID4gIEYyRlNfR0VORVJBTF9ST19BVFRSKGNwX3N0YXR1cyk7
Cj4gPiArRjJGU19HRU5FUkFMX1JPX0FUVFIoZGlzY2FyZF9zdGF0dXMpOwo+ID4gKwo+ID4gIHN0
YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX3N0YXRfYXR0cnNbXSA9IHsKPiA+ICAgICAgIEFU
VFJfTElTVChzYl9zdGF0dXMpLAo+ID4gICAgICAgQVRUUl9MSVNUKGNwX3N0YXR1cyksCj4gPiAr
ICAgICBBVFRSX0xJU1QoZGlzY2FyZF9zdGF0dXMpLAo+ID4gICAgICAgTlVMTCwKPiA+ICB9Owo+
ID4gIEFUVFJJQlVURV9HUk9VUFMoZjJmc19zdGF0KTsKPiA+IC0tCj4gPiAxLjkuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
