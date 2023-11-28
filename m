Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CB7FB030
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 03:45:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7o6U-0004mQ-C1;
	Tue, 28 Nov 2023 02:45:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1r7o6S-0004mJ-7v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uBgIx66JgbxS00z7d61Bmc74Zo2vZIf9EdPtiYw/aXQ=; b=Zy8HAM/K8WvACjtIMTppVxY2gs
 PPKJkO2gtLuoLzDQQP2xeG3Se/SbOIWD9oZOr9czSDvVUHKLTC67r2Adkf6lX7PcEf72DY+0oyAKe
 88wz866i3ekhi4OWrclsjyDBSWd2OvgCPdzFp646BtMs3/nFHnHoX6n2GORn3SkIT82I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uBgIx66JgbxS00z7d61Bmc74Zo2vZIf9EdPtiYw/aXQ=; b=POqodY4vFxq8KKyOSJ758wlDSS
 CGe+dslHOt4JjcqSngdseh+F1OGNuiazJx6+v54yYxUK8hShCk60ORav8Frd0LcKcN6SIY4+9xyk2
 mBBfPqhlqgUotKsirJu8kmDM56K7443/WFVIp6VfY/2+KrshtfwLsSd1FdS79vevnPrg=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r7o6N-00089B-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 02:45:35 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-54bb14bcacaso10653a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Nov 2023 18:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701139520; x=1701744320; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBgIx66JgbxS00z7d61Bmc74Zo2vZIf9EdPtiYw/aXQ=;
 b=lnbcKaYFufKWvNdT4jqrhQK+F+qsANhEs4JUyon4v6Jv5IkloZALymRu56OdzE5IeB
 ADmNVHmaSG2QfGudPGMJDrs8OFvBcMej/wu3AUWhg3REh8nIFRQL5cN9XEb2bzhmqxX3
 Sbj1Qnu6UXkSWB/wGDVbX8sVHyKly+5VQ2iJJS5xIyUlYcir1eomamAbP1d41vAwSjm1
 WJN8X/Hm76PcDd97QVnA9wnzZGBSxU7N5f3E6OaUj8+G0aoK+VYJNHQWpmoJJKFGn27D
 mvVusi5cw6sd7jfsJeDx26wuKxgo+oK2uA72c8RV9QuXbMs08ToH1t0VKl6MaQ6g3uZe
 hbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701139520; x=1701744320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBgIx66JgbxS00z7d61Bmc74Zo2vZIf9EdPtiYw/aXQ=;
 b=dOW/APqKD+PC6EOEfbPoB02fNB3Zw9E9vu/GYgttSNBMwqbLSqQg/0v9Pqza2Ii0YW
 dwsC/sI2tJS8AZ6teTt11Nq6kcYvnVmze/MpyCuiM6wQ2esAFLNY4uZ/fxgbBGgz23ZE
 ZA3UrFMGi8gofnhfQX2JhF/WpMUeqcffvn4WGz4Qgm3U2KUAvZwtBRI4DKZpeciXojJX
 1EuoXsJkbVxJr1yY/+PsJ0rr24wSpSvGPGv/3000N5vWv1mfoYtTK8ktQmv/KumtuHto
 2FXIhR+7KT4iDpSQSJyqW0TV1vsQgh3KNGsHwLABPkdW+KTOQUImr9KcDcIPr8VqC55F
 hnUA==
X-Gm-Message-State: AOJu0YyIDZgS1S0LFG7X1PvDcALeuzwi3Kin3QGPdD8eiYqs1YfetGqc
 LX3BhQOTD0w06nONCq5yD1tTP6yLPD+OEgS28525Idzo5ok=
X-Google-Smtp-Source: AGHT+IE2bi4/9uI/r5EaOAI59CM1P1izJgE/zvms19wepvIPOGOZvv3/TjLCEEJMxLC3aqrg/z+agGX+NiBrEEZ3ilg=
X-Received: by 2002:a05:6402:3585:b0:54b:592c:c318 with SMTP id
 y5-20020a056402358500b0054b592cc318mr4986308edc.34.1701139519706; Mon, 27 Nov
 2023 18:45:19 -0800 (PST)
MIME-Version: 1.0
References: <1700788128-29002-1-git-send-email-zhiguo.niu@unisoc.com>
 <a9d45834-1ccf-8387-6b90-a88e0cc0772e@kernel.org>
In-Reply-To: <a9d45834-1ccf-8387-6b90-a88e0cc0772e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 28 Nov 2023 10:45:08 +0800
Message-ID: <CAHJ8P3LUOAwam=S_1jaqspQkmxWZTL1cjY+RApox76n-V4XNqw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Chao, On Tue, Nov 28, 2023 at 10:13 AM Chao Yu wrote:
    > > On 2023/11/24 9:08, Zhiguo Niu wrote: > > The current pending_discard
    attr just only shows the discard_cmd_cnt > > information, which is not ver
    [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.53 listed in wl.mailspike.net]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7o6N-00089B-Ek
Subject: Re: [f2fs-dev] [PATCH] f2fs: show more discard stat by sysfs
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
Cc: hongyu.jin@unisoc.com, jaegeuk@kernel.org,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBDaGFvLAoKT24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgMTA6MTPigK9BTSBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMS8yNCA5OjA4LCBaaGlndW8gTml1
IHdyb3RlOgo+ID4gVGhlIGN1cnJlbnQgcGVuZGluZ19kaXNjYXJkIGF0dHIganVzdCBvbmx5IHNo
b3dzIHRoZSBkaXNjYXJkX2NtZF9jbnQKPiA+IGluZm9ybWF0aW9uLCB3aGljaCBpcyBub3QgdmVy
eSBtZWFuaW5nZnVsLiBNb3JlIGRpc2NhcmQgaW5mb3JtYXRpb24KPiA+IGNhbiBiZSBzaG93biBz
byB0aGF0IHdlIGNhbiBjaGVjayB0aGVtIHRocm91Z2ggc3lzZnMgd2hlbiBuZWVkZWQuCj4KPiBX
aGF0IGFib3V0IGFkZGluZyB0aGlzIGVudHJ5IHRvIC9zeXMvZnMvZjJmcy88ZGV2Pi9zdGF0Lz8K
SSB0aGluayBpdCBpcyBvayEKVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBvYnRhaW4g
ZjJmcyBkaXNjYXJkIHJlbGF0ZWQgc3RhdHVzCndoZW4gbmVjZXNzYXJ5LgpCZWNhdXNlIHN5cy9r
ZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgY2Fubm90IGJlIHVzZWQgb24gdGhlIHVzZXIgdmVyc2lv
biwKSSB3aWxsIGNoYW5nZSBpdCBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9uLgo+Cj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4g
LS0tCj4gPiAgIGZzL2YyZnMvc3lzZnMuYyB8IDIxICsrKysrKysrKysrKysrKy0tLS0tLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gPiBpbmRl
eCA0MTdmYWU5Ni4uZjk4ZTY4MCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+ID4g
KysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gPiBAQCAtMTM0LDEzICsxMzQsMjIgQEAgc3RhdGljIHNz
aXplX3QgY3Bfc3RhdHVzX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAgIHJldHVy
biBzeXNmc19lbWl0KGJ1ZiwgIiV4XG4iLCBsZTMyX3RvX2NwdShGMkZTX0NLUFQoc2JpKS0+Y2tw
dF9mbGFncykpOwo+ID4gICB9Cj4gPgo+ID4gLXN0YXRpYyBzc2l6ZV90IHBlbmRpbmdfZGlzY2Fy
ZF9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPiArc3RhdGljIHNzaXplX3QgZGlzY2FyZF9z
dGF0X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4gPiAgIHsKPiA+IC0gICAgIGlmICghU01fSShz
YmkpLT5kY2NfaW5mbykKPiA+ICsgICAgIHN0cnVjdCBkaXNjYXJkX2NtZF9jb250cm9sICpkY2Mg
PSBTTV9JKHNiaSktPmRjY19pbmZvOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFkY2MpCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gLSAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVm
LCAiJWxsdVxuIiwgKHVuc2lnbmVkIGxvbmcgbG9uZylhdG9taWNfcmVhZCgKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZTTV9JKHNiaSktPmRjY19pbmZvLT5kaXNjYXJkX2NtZF9j
bnQpKTsKPgo+IEl0J3MgYmV0dGVyIHRvIGtlZXAgdGhlIG9sZCBvbmUgZm9yIGFueSBwb3RlbnRp
YWwgdXNlci4KPgo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWxsdSwg
JWxsdSwgJWxsdSwgJXVcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxv
bmcgbG9uZylhdG9taWNfcmVhZCgKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZk
Y2MtPmRpc2NhcmRfY21kX2NudCksCj4gPiArICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVk
IGxvbmcgbG9uZylhdG9taWNfcmVhZCgKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZkY2MtPmlzc3VlZF9kaXNjYXJkKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAodW5zaWdu
ZWQgbG9uZyBsb25nKWF0b21pY19yZWFkKAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmRjYy0+cXVldWVkX2Rpc2NhcmQpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRjYy0+
dW5kaXNjYXJkX2Jsa3MpOwo+ID4gICB9Cj4gPgo+ID4gICBzdGF0aWMgc3NpemVfdCBnY19tb2Rl
X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+IEBAIC0xMDE2LDcgKzEwMjUsNyBAQCBzdGF0
aWMgc3NpemVfdCBmMmZzX3NiX2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4g
ICBGMkZTX0dFTkVSQUxfUk9fQVRUUihlbmNvZGluZyk7Cj4gPiAgIEYyRlNfR0VORVJBTF9ST19B
VFRSKG1vdW50ZWRfdGltZV9zZWMpOwo+ID4gICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtYWluX2Js
a2FkZHIpOwo+ID4gLUYyRlNfR0VORVJBTF9ST19BVFRSKHBlbmRpbmdfZGlzY2FyZCk7Cj4gPiAr
RjJGU19HRU5FUkFMX1JPX0FUVFIoZGlzY2FyZF9zdGF0KTsKPgo+IEl0IG5lZWRzIHRvIGFkanVz
dCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMuCj4KPiBUaGFua3MsCj4K
PiA+ICAgRjJGU19HRU5FUkFMX1JPX0FUVFIoZ2NfbW9kZSk7Cj4gPiAgICNpZmRlZiBDT05GSUdf
RjJGU19TVEFUX0ZTCj4gPiAgIEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNr
Z3JvdW5kKTsKPiA+IEBAIC0xMDc0LDcgKzEwODMsNyBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3Ni
X2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4gICAgICAgQVRUUl9MSVNUKGRp
c2NhcmRfdXJnZW50X3V0aWwpLAo+ID4gICAgICAgQVRUUl9MSVNUKGRpc2NhcmRfZ3JhbnVsYXJp
dHkpLAo+ID4gICAgICAgQVRUUl9MSVNUKG1heF9vcmRlcmVkX2Rpc2NhcmQpLAo+ID4gLSAgICAg
QVRUUl9MSVNUKHBlbmRpbmdfZGlzY2FyZCksCj4gPiArICAgICBBVFRSX0xJU1QoZGlzY2FyZF9z
dGF0KSwKPiA+ICAgICAgIEFUVFJfTElTVChnY19tb2RlKSwKPiA+ICAgICAgIEFUVFJfTElTVChp
cHVfcG9saWN5KSwKPiA+ICAgICAgIEFUVFJfTElTVChtaW5faXB1X3V0aWwpLAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
