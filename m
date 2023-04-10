Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB56DC49B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 10:45:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pln9K-00056M-D6;
	Mon, 10 Apr 2023 08:45:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1pln9C-00056F-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 08:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r/Z4BnJHRzAKqnTVQDGTtSpDmxVQwpQ1vpuf9de8HQ0=; b=T2tGe2dnOZKDlTJG15TVI9KUaM
 CEI/gPTgI11LU/HsB4L5vJEnyjDlgnyfCfQZ8ooN1By9wKiJ1eQdTGpgUZnEc7Ci+SwM02B+7hpBk
 nPSTDF3eR3YsnI3xoa8fr/TEgqpXXc4X5tjkJBXEDeUybqa1xIG8FP+7jEeT/yKvAU4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/Z4BnJHRzAKqnTVQDGTtSpDmxVQwpQ1vpuf9de8HQ0=; b=lmBeNTY9phNwLf1gWAdiTBFYtr
 5IuVLKQ99ZAgZ2QiboAAcxJrOCOMQstXYGGZb2AUe24nfTdt5oVISEC/qI2lMTQqcKwMIKuRRhxMp
 mfI87VfnxDhFuKp1kDFTgL25L8keUWia9N+ailrpNMhgE/xRx9o3/MKUPm5dU0HUzjrE=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pln9D-0002yG-38 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 08:45:11 +0000
Received: by mail-ej1-f51.google.com with SMTP id f26so4796730ejb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116304; x=1683708304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/Z4BnJHRzAKqnTVQDGTtSpDmxVQwpQ1vpuf9de8HQ0=;
 b=hJ4XIdrmoXYiQkF9ujgD8z1AeIn6svA52lwU5Qd+Xr9sSyfIEtcC3rcmFQ9PS5Xl/f
 kz4AwjTkctEN/7NZjiZG7znlNJbK3o4TNqv/OOMLCX41SZsmbHc9W8laqXv2z1pFz1cp
 0oC1W94ZfpmpmnkMtyhQB98+ucRPqNUBhEsxREMrdfVc647nh7YyIUruDuhN4O8AXgeJ
 GeVi7VRXgXyPBUiyyYDuYobbeILwx8iZGCUpbos4lWdcGERMUGZbX3LLDSSMhaHKEtRM
 qFKN/XLvUwxfL96pLy3o/6PlN8OV52X4QnUZlMz6lPc8CpkntO68qcVJ3J39CVE9mL4e
 yEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116304; x=1683708304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/Z4BnJHRzAKqnTVQDGTtSpDmxVQwpQ1vpuf9de8HQ0=;
 b=OrgZr5JoX3gJZcCES2zKInHZaS9nvEX1s2wLg8F5TfMyMVwDuqK9ZBAGjt+ftfPY27
 qZc0ad+q+WoBNnjFY4TryzJs2cG9LBx4UGXIcqdsOgOd4pcWS4E9pvfrVzhiKeFMiBD+
 ZUL/U+a5qIfiq625f98EMO1YQDi8LJ/ZqErKUuyMsFHWl0rmc2V3vUHn6srvkfz7ZEEv
 2+5PyPUpuRZsuz5JkzfZg7G7ZK8x9wWDb5cvymXHSlbcEddM1gvbRQF9gSk4kaGaaJBv
 RnwEjP3JVUOvFsbp9iW1lq7MxzZMCeTBAcQlMQtZOHYWmx2o31SwYwIkZCdevtAv5D8b
 dhvg==
X-Gm-Message-State: AAQBX9ezFIWtFZ/8fGnjgQ5YI1JnoyCKlBOHny1eVAFWwasggSqQZSa5
 NFgS3RdQpq/IzJTxSC8FH4E2Rvk615EjXK5kLgMbPA2E3Xg=
X-Google-Smtp-Source: AKy350aXe3Oc4wAw3sFyYZmWubMEeJRf7RZZ71Im/T49A3lH58eJSlsn6yL+/wT3KkoqmGkTSCQlFvawdSnbF+u3Hpo=
X-Received: by 2002:a17:906:44a:b0:932:6a2:ba19 with SMTP id
 e10-20020a170906044a00b0093206a2ba19mr3326937eja.14.1681116304448; Mon, 10
 Apr 2023 01:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230404055446.1656296-1-qkrwngud825@gmail.com>
In-Reply-To: <20230404055446.1656296-1-qkrwngud825@gmail.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 10 Apr 2023 17:44:53 +0900
Message-ID: <CAD14+f0FbTXfaD_dM-RyFiPbaong-B-6hqrms2M4riidX9yVug@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, Thanks for the timely merge. Can we have a new
 f2fs-tools tag with this commit in place? Alex (the original bug reporter)
 would like to see this incorporated in the next version of Ubuntu (and Debian),
 and having a new tag is muc [...] 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pln9D-0002yG-38
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix sanity check logic for
 cp_payload
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
Cc: Alexander Koskovich <akoskovich@pm.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1aywKClRoYW5rcyBmb3IgdGhlIHRpbWVseSBtZXJnZS4KCkNhbiB3ZSBoYXZlIGEg
bmV3IGYyZnMtdG9vbHMgdGFnIHdpdGggdGhpcyBjb21taXQgaW4gcGxhY2U/CkFsZXggKHRoZSBv
cmlnaW5hbCBidWcgcmVwb3J0ZXIpIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgaW5jb3Jwb3JhdGVk
CmluIHRoZSBuZXh0IHZlcnNpb24gb2YgVWJ1bnR1IChhbmQgRGViaWFuKSwgYW5kIGhhdmluZyBh
IG5ldyB0YWcgaXMKbXVjaCBlYXNpZXIgdG8gY29udmluY2UgdGhlbSB0byBwYWNrIGEgbmV3IHRh
ZyB0aGFuIGhhdmluZyBvbmUgcGF0Y2gKYmFja3BvcnRlZC4KCkluIGEgcHJhY3RpY2FsIHNjZW5h
cmlvLCBhIDJUQiBwYXJ0aXRpb24gZm9ybWF0dGVkIHdpdGggbWtmcy5mMmZzIC1pCnNpbXBseSBk
b2Vzbid0IGJvb3QgdW5kZXIgVWJ1bnR1IGFzIGZzY2suZjJmcyBpbnNpZGUgdGhlIGluaXRyYW1m
cwpyZXR1cm5zIGFuIGVycm9yLgoKVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGFuZCB0aGVyZWZvcmUg
YWxsb3dzIHRoZSB1c2VycyB0byBib290IG5vcm1hbGx5CndpdGhvdXQgbWFudWFsbHkgZXhjbHVk
aW5nIHRoZSBmMmZzIHBhcnRpdGlvbiB0byBiZSBjaGVja2VkIGR1cmluZwpib290LgoKVGhhbmtz
LiBSZWdhcmRzCgpPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6NTTigK9QTSBKdWh5dW5nIFBhcmsg
PHFrcnduZ3VkODI1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBjcF9wYXlsb2FkIGlzIHNldCBkaWZm
ZXJlbnRseSBbMV0gd2hlbiBleHRlbmRlZCBub2RlIGJpdG1hcCBmZWF0dXJlIGlzCj4gZW5hYmxl
ZC4gQ29tbWl0IGI3OWMzYmE0ZWE5ZCBicm9rZSBmc2NrIG9uIGYyZnMgZmlsZSBzeXN0ZW1zIGNy
ZWF0ZWQgb24KPiAyKyBUQiBkZXZpY2Ugd2l0aCBleHRlbmRlZCBub2RlIGJpdG1hcCBmZWF0dXJl
IGVuYWJsZWQuCj4KPiBBcyB0aGUgc2FuaXR5IGNoZWNrIGlzIGZvciBjaGVja2luZyBvdmVyZmxv
d3MsIGZpeCB0aGlzIHRvIGFzc3VtZSB0aGUgbWF4Cj4gcG9zc2libGUgY3BfcGF5bG9hZCBzaXpl
IHVuZGVyIHRoZSBleHRlbmRlZCBub2RlIGJpdG1hcC4KPgo+IExpbms6IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQv
dHJlZS9ta2ZzL2YyZnNfZm9ybWF0LmM/aD12MS4xNS4wI24zNzIgWzFdCj4gRml4ZXM6IGI3OWMz
YmE0ZWE5ZCAoImZzY2suZjJmczogc2FuaXR5IGNoZWNrIGNwX3BheWxvYWQgYmVmb3JlIHJlYWRp
bmcgY2hlY2twb2ludCIpCj4gUmVwb3J0ZWQtYnk6IEFsZXhhbmRlciBLb3Nrb3ZpY2ggPGFrb3Nr
b3ZpY2hAcG0ubWU+Cj4gU2lnbmVkLW9mZi1ieTogSnVoeXVuZyBQYXJrIDxxa3J3bmd1ZDgyNUBn
bWFpbC5jb20+Cj4gLS0tCj4gIGZzY2svbW91bnQuYyAgICAgIHwgMiArLQo+ICBpbmNsdWRlL2Yy
ZnNfZnMuaCB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+
IGluZGV4IDJiMjY3MDEuLmRmMDMxNGQgMTAwNjQ0Cj4gLS0tIGEvZnNjay9tb3VudC5jCj4gKysr
IGIvZnNjay9tb3VudC5jCj4gQEAgLTEyMDgsNyArMTIwOCw3IEBAIGludCBnZXRfdmFsaWRfY2hl
Y2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICBpbnQgcmV0Owo+Cj4g
ICAgICAgICBjcF9wYXlsb2FkID0gZ2V0X3NiKGNwX3BheWxvYWQpOwo+IC0gICAgICAgaWYgKGNw
X3BheWxvYWQgPiBGMkZTX0JMS19BTElHTihNQVhfU0lUX0JJVE1BUF9TSVpFKSkKPiArICAgICAg
IGlmIChjcF9wYXlsb2FkID4gRjJGU19CTEtfQUxJR04oTUFYX0NQX1BBWUxPQUQpKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgY3BfYmxrcyA9IDEgKyBjcF9w
YXlsb2FkOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19m
cy5oCj4gaW5kZXggMzMzYWUwNy4uZjg5MDYzNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2YyZnNf
ZnMuaAo+ICsrKyBiL2luY2x1ZGUvZjJmc19mcy5oCj4gQEAgLTExNjgsNiArMTE2OCwxMCBAQCBz
dGF0aWNfYXNzZXJ0KHNpemVvZihzdHJ1Y3QgZjJmc19uYXRfYmxvY2spID09IDQwOTUsICIiKTsK
PiAgI2RlZmluZSBNQVhfU0lUX0JJVE1BUF9TSVpFICAgIChTRUdfQUxJR04oU0laRV9BTElHTihG
MkZTX01BWF9TRUdNRU5ULCBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU0lUX0VOVFJZX1BFUl9CTE9DSykpICogXAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuYmxrc19wZXJfc2VnIC8gOCkKPiArI2Rl
ZmluZSBNQVhfQ1BfUEFZTE9BRCAgICAgICAgIChTRUdfQUxJR04oU0laRV9BTElHTihVSU5UMzJf
TUFYLCBOQVRfRU5UUllfUEVSX0JMT0NLKSkgKiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgREVGQVVMVF9OQVRfRU5UUllfUkFUSU8gLyAxMDAgKiBc
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5ibGtz
X3Blcl9zZWcgLyA4ICsgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1BWF9TSVRfQklUTUFQX1NJWkUgLSBNQVhfQklUTUFQX1NJWkVfSU5fQ0tQVCkK
Pgo+ICAvKgo+ICAgKiBOb3RlIHRoYXQgZjJmc19zaXRfZW50cnktPnZibG9ja3MgaGFzIHRoZSBm
b2xsb3dpbmcgYml0LWZpZWxkIGluZm9ybWF0aW9uLgo+IC0tCj4gMi40MC4wCj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
