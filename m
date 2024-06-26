Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A643B9175FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2024 04:02:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMHzG-0006EP-CS;
	Wed, 26 Jun 2024 02:02:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sMHzE-0006EC-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 02:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j827eyPfovm1pttAYGkAs9K2vKAWkyr0R4XxYEpN49k=; b=IqxlKlSi6dfqIZFF3iQWZ1OdeD
 CIgZHBYvvvN9Hy7IFcZkGjV1lkUgxgsueansPHiHguwQ7pX2jPpXX4FnBbQn9o0EN717gaZ7Lul5k
 W7Sb6MMVP5JI4Fev+9ZU4FZ0+vlj2mrgjZuuaML8X0vSF3LZUhxt8dF8iXCLdS/4HL48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j827eyPfovm1pttAYGkAs9K2vKAWkyr0R4XxYEpN49k=; b=HVRui34G1geqvIH4M0FHjfp/5t
 4Ka/tJMpFyHi9C3eqH9AEV51WD0wt503WwEWOESfmD7GI3AN00lyd/yq2drWhfnPwJBkuZNf3fBOU
 q4fvz+cVepcUXd68Epq6NVv6oNpe9gCC6ZZij/Xl1ZuGDyNPMf8prG3LezucEbtuVAsY=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sMHzE-0004p3-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 02:02:16 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-363826fbcdeso4560015f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719367324; x=1719972124; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j827eyPfovm1pttAYGkAs9K2vKAWkyr0R4XxYEpN49k=;
 b=XbFx4dmZZXwWzLXN+sdsDknoNlRxGFLObi3fsBlX4WfvbOOgAreqMnuiJsFJGD9QW7
 JjIGJYBXyL25Y8wifvnaUWFNN0ON/pP4lr6dj59J3pTes0Zuy7D+Q6djN1dnN7MYoSG4
 eztwXKOaukogr8vPfCFuTAJc8ZLhpftlr2fnTEnh5q0LIy+OXAiZXNMhxFdfruppi9Sp
 ARWbTAWCigv/lWB1daq2tKs5QesVrkEqMXEWOzOyhrBP8ZUFQP1QBLj70DFCau7w5UWa
 sLQrYf4xSiTnu3PI1q35EgYbZjxTZqnXKAjiTUp5gWwjEeonu+MTetoJU2qYvSPFR/Uf
 Dx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719367324; x=1719972124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j827eyPfovm1pttAYGkAs9K2vKAWkyr0R4XxYEpN49k=;
 b=w/Y0TB988/+TKs4ckHqZ0I3SGHfL/uFpLbanmXxvnaBJ4CD6B8KO2+snAWCRSyu32W
 RZSemBiUIhOgf6aAWjRidohN7MScqk+kl7nN/UfJwtd3GX5vqJEhBcx0lWwXaY2Mlab7
 ZpAv/KX7gABejGQBx4B+N4DgGBzTSS90maTC74TqyUn7vWTe228mcIr3s8O7V7TKxK6h
 lA/yq9E1IPkqWCns/uXE3QGFHs7hGcbd8BnmS+MhvXpN3WABIBTEn65U+OP4YlVM/TBQ
 xWslw1pRC2RkrW0YKo4aoZ4E93Am0J9A3FCVI2H610MwlE2k51LdZeBUjihek/j9R9mJ
 jNMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjE9W44/opUIvKjtAA4YuQ2Rvt3PiyX6pIvsujoCVdKR48Nb+2f4dJdplqiTNpYQznEPNBQIEzDGWW9DMS8BcqJsf7HmiDzRMrn26RnqaNqmEz8x+7vg==
X-Gm-Message-State: AOJu0YyVQfV2LGMV5IMqH8Z3jEGwdz5UDGojS5A0diuytu4TX1FooCoe
 vPVn/8WJrSFDacAg9GUc3mI8OiFG9v6NebYkQG8zpkYx7eOaSZxncn86WgjcC2i2yPfQEd1+U/J
 hiCgLk35yjZPIrRVlK38ne1gXleX5WnDi
X-Google-Smtp-Source: AGHT+IGwrr2Re6QtzgDShGiOpHkoGQZgADb65PV0KxFMYpZIY4JGPzwGSV50AioRPApDEtm5jaEVBV1HipBAgflUfmg=
X-Received: by 2002:a05:6000:a83:b0:365:e76b:e908 with SMTP id
 ffacd0b85a97d-366e79fe983mr6147040f8f.24.1719367324358; Tue, 25 Jun 2024
 19:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240625142512.3916063-1-chao@kernel.org>
In-Reply-To: <20240625142512.3916063-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 26 Jun 2024 10:01:53 +0800
Message-ID: <CAHJ8P3+VUozoMVHvMxqDrDRVttRWDJ5a4A2ysJv2_O4ytfq8OA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年6月25日周二 22:29写道： > > If lfs
    mode is on, buffered read may race w/ OPU dio write as below, > it may cause
    buffered read hits unwritten data unexpectly, and for > dio r [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.46 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.46 listed in sa-accredit.habeas.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1sMHzE-0004p3-Qh
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0NuaciDI15pel5ZGo5LqMIDIyOjI5
5YaZ6YGT77yaCj4KPiBJZiBsZnMgbW9kZSBpcyBvbiwgYnVmZmVyZWQgcmVhZCBtYXkgcmFjZSB3
LyBPUFUgZGlvIHdyaXRlIGFzIGJlbG93LAo+IGl0IG1heSBjYXVzZSBidWZmZXJlZCByZWFkIGhp
dHMgdW53cml0dGVuIGRhdGEgdW5leHBlY3RseSwgYW5kIGZvcgo+IGRpbyByZWFkLCB0aGUgcmFj
ZSBjb25kaXRpb24gZXhpc3RzIGFzIHdlbGwuCj4KPiBUaHJlYWQgQSAgICAgICAgICAgICAgICAg
ICAgICAgIFRocmVhZCBCCj4gLSBmMmZzX2ZpbGVfd3JpdGVfaXRlcgo+ICAtIGYyZnNfZGlvX3dy
aXRlX2l0ZXIKPiAgIC0gX19pb21hcF9kaW9fcncKPiAgICAtIGYyZnNfaW9tYXBfYmVnaW4KPiAg
ICAgLSBmMmZzX21hcF9ibG9ja3MKPiAgICAgIC0gX19hbGxvY2F0ZV9kYXRhX2Jsb2NrCj4gICAg
ICAgLSBhbGxvY2F0ZWQgYmxrYWRkciAjeAo+ICAgICAgICAtIGlvbWFwX2Rpb19zdWJtaXRfYmlv
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZmlsZV9yZWFkX2l0ZXIK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGZpbGVtYXBfcmVhZAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfcmVhZF9kYXRhX2ZvbGlvCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbXBhZ2VfcmVhZHBhZ2VzCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBmMmZzX21hcF9ibG9ja3MKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBnZXQgYmxrYWRkciAjeAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19zdWJtaXRfcmVhZF9iaW8K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSBmMmZzX3JlYWRfZW5kX2lvCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiByZWFkIElPIG9uIGJsa2FkZHIgI3ggY29tcGxldGUKPiBJUlEKPiAtIGlv
bWFwX2Rpb19iaW9fZW5kX2lvCj4gIDogZGlyZWN0IHdyaXRlIElPIG9uIGJsa2FkZHIgI3ggY29t
cGxldGUKPgo+IEluIExGUyBtb2RlLCBpZiB0aGVyZSBpcyBpbmZsaWdodCBkaW8sIGxldCdzIGZv
cmNlIHJlYWQgdG8gYnVmZmVyZWQKPiBJTywgdGhpcyBwb2xpY3kgd29uJ3QgY292ZXIgYWxsIHJh
Y2UgY2FzZXMsIGhvd2V2ZXIgaXQgaXMgYSB0cmFkZW9mZgo+IHdoaWNoIGF2b2lkcyBhYnVzaW5n
IGxvY2sgYXJvdW5kIElPIHBhdGhzLgo+Cj4gRml4ZXM6IGY4NDdjNjk5Y2ZmMyAoImYyZnM6IGFs
bG93IG91dC1wbGFjZS11cGRhdGUgZm9yIGRpcmVjdCBJTyBpbiBMRlMgbW9kZSIpCj4gU2lnbmVk
LW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL2ZpbGUu
YyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+IGluZGV4IDI3ODU3Mzk3NGRi
NC4uODY2ZjFhMzRlOTJiIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gKysrIGIvZnMv
ZjJmcy9maWxlLmMKPiBAQCAtODgyLDYgKzg4MiwxMCBAQCBzdGF0aWMgYm9vbCBmMmZzX2ZvcmNl
X2J1ZmZlcmVkX2lvKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBydykKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHRydWU7Cj4gICAgICAgICBpZiAoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQ
X0RJU0FCTEVEKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICAgICAvKiBJ
biBMRlMgbW9kZSwgaWYgdGhlcmUgaXMgaW5mbGlnaHQgZGlvLCBmb3JjZSByZWFkIHRvIGJ1ZmZl
cmVkIElPICovCj4gKyAgICAgICBpZiAocncgPT0gUkVBRCAmJiBmMmZzX2xmc19tb2RlKHNiaSkg
JiYKPiArICAgICAgICAgICAgICAgICAgICAgICBhdG9taWNfcmVhZCgmaW5vZGUtPmlfZGlvX2Nv
dW50KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwpIaSBDaGFvLApBIGxpdHRsZSBk
b3VidDop77yMZm9yY2Ug4oCcYnVmZmVyZWQgSU/igJ0gc2hvdWxkIHJldHVybiAidHJ1ZSI/CmFu
b3RoZXIgd2FudCB0byBjb25maXJtIGlzLCAidGhyZWFkIEIiIGluIGNvbW1pdCBtc2cganVzdCBk
b2luZyBidWZmZXIKcmVhZCwgc28gdGhpcyBtb2RpZmljYXRpb24ganVzdCBjb3ZlciBkaXJlY3Qg
cmVhZCBjYXNl77yfCnRoYW5rc++8gQo+Cj4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gIH0KPiAt
LQo+IDIuNDAuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
