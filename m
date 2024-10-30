Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C42499B69EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 18:00:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6C3j-00063v-AY;
	Wed, 30 Oct 2024 17:00:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1t6C3c-00063k-Lt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wWrbK7fnh9whln3CNHKOj//EVVMSdORA+MSC2o/MTY0=; b=KO86lv87Pwr1DPThYmFrt2t2fL
 GXBXl+aqrua8/c42ei4qnXeHYFC6hBSs9CQYl21gV1/5fB8yXELIQk9b5ypU7MUo6vGI9RWFBBA+C
 mlvV2bo528XvtxFqtwQ+beMW1lKz7EQJs7853jKYAWBqf/qSXLXY7CHr0+jQkGM/Lnh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wWrbK7fnh9whln3CNHKOj//EVVMSdORA+MSC2o/MTY0=; b=I8S/KD0/g705hrH0XRCClUqDdj
 81lUCuV5ihIQVkdkIEwF5y7V+rAS8JTI2tYN+jGex/6I6DMb/22+w1Fmo2A7k72nydOM1Oq0gASJl
 mA0BGmv3FyK6vyeDo7GgIvTTD4YL24IWCC0ipzLHFHuPc4cAKPEcCRQ6qF1ARRYijm4U=;
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t6C3a-00044v-Tf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 17:00:32 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-50d494ac189so25201e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Oct 2024 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730307620; x=1730912420; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWrbK7fnh9whln3CNHKOj//EVVMSdORA+MSC2o/MTY0=;
 b=arQwC+urNZdMU2fPeaCUb2tBhR2rdk59dAVJNMvx5KDY9Y7u32hbL8yPWafI/YlNB6
 ijJx+U9Wwh9p98vsj+rGGVzNaNJFMhaWPSIRszBaB5JyMbCfO8u9y/e0P+cF4XwOlmc8
 LZrr1rcJ7mKDGnGBC3xv7SvoKxhlWjNgOAN3x0bAm+is8dMzLnbLb+a5mT+U1YLdw94o
 UvqgxTIS14eLNh/72NftzXevK5y2ebFwAn8jzqee3Q1RhAklfHr721nXhCtPa1HOOVRw
 NRR/yICJOPpjoKFUWHRqBjR+PPKe4MCMZ9QMTwAsXaa/gkZC6oX2l+VAlNhXcYX2OLxV
 Nofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730307620; x=1730912420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWrbK7fnh9whln3CNHKOj//EVVMSdORA+MSC2o/MTY0=;
 b=dBffTYoHOamSlG74v1Gu7wqJS6GgK1DjXh+atoJTOFXwY0iTEDluIogiMNJOUpGZ8v
 ZOh5GitDx0biisL1TF1FYjsdBUM1fMsRUidFraHQ3JpAP6Q35liL0NR/5ebd7Ztu7x96
 Y1ORiGUueKGC/q74aXDIxRPSwh9OttiMuSi7D+3gHhFrD3gsVXn60pfJcdPmgyzXzA+a
 caVPxDu+sMB0RV/qoDqKVLyffFFkrSO2BWK0MgY83vvr8/7d/Oa93SahO6WJZXSJgczO
 ern890oJ6NgM5Fkh9B/zPhQXQFTWcr7UYiwcT55bGlSB8CFCqXq5SErAdIRcDJxNcSml
 5p0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4bpe1iM03hDdN/b87PKLjgDNXegYTIJ6+mDsv1UcjUZpXN7OJ99VYKDJyacB88QhuWmdFS7FilaWqISz97ACp@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7JGT51LdZ2TnRr2sNdnTQ6i/+d+1R57vqZ7rVFmVE6+MoJJ0j
 wu2ax0MJbPV9WIN8xq98VO00aP43SmqBN51KFcm1OHsVy1YCTqPPke5efgJnOXtdomeSha5gFMM
 A9U2DSKODyCvS17K65X98Nb+QmEU=
X-Google-Smtp-Source: AGHT+IE+a/Gf/q8ZCJNrbPIEjOQEQW/h0iSkBlQV8DZREUM2G66zLJ+sF8UsnR1zsQnuSlZqupomzOXFiVHLrgYaFWM=
X-Received: by 2002:a05:6122:d90:b0:50d:35d9:ad5a with SMTP id
 71dfb90a1353d-51015045ccemr13184984e0c.5.1730307618102; Wed, 30 Oct 2024
 10:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
 <20241030103136.2874140-5-yi.sun@unisoc.com>
In-Reply-To: <20241030103136.2874140-5-yi.sun@unisoc.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 30 Oct 2024 10:00:06 -0700
Message-ID: <CACOAw_zn0ov0b2h9+zHn2gYVCDVGYPkXFNcx-j7OkhU0Y=i94g@mail.gmail.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Oct 30, 2024 at 3:35 AM Yi Sun wrote: > > New function
    can process some consecutive blocks at a time. > > Function f2fs_invalidate_blocks()->down_write()
    and up_write() > are very time-con [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t6C3a-00044v-Tf
Subject: Re: [f2fs-dev] [PATCH v2 4/5] f2fs: add parameter @len to
 f2fs_invalidate_blocks()
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
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBPY3QgMzAsIDIwMjQgYXQgMzozNeKAr0FNIFlpIFN1biA8eWkuc3VuQHVuaXNvYy5j
b20+IHdyb3RlOgo+Cj4gTmV3IGZ1bmN0aW9uIGNhbiBwcm9jZXNzIHNvbWUgY29uc2VjdXRpdmUg
YmxvY2tzIGF0IGEgdGltZS4KPgo+IEZ1bmN0aW9uIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3MoKS0+
ZG93bl93cml0ZSgpIGFuZCB1cF93cml0ZSgpCj4gYXJlIHZlcnkgdGltZS1jb25zdW1pbmcsIHNv
IGlmIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3MoKSBjYW4KPiBwcm9jZXNzIGNvbnNlY3V0aXZlIGJs
b2NrcyBhdCBvbmUgdGltZSwgaXQgd2lsbCBzYXZlIGEgbG90IG9mIHRpbWUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBZaSBTdW4gPHlpLnN1bkB1bmlzb2MuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2NvbXBy
ZXNzLmMgfCAgNCArLS0KPiAgZnMvZjJmcy9mMmZzLmggICAgIHwgIDMgKy0KPiAgZnMvZjJmcy9m
aWxlLmMgICAgIHwgIDggKysrLS0tCj4gIGZzL2YyZnMvbm9kZS5jICAgICB8ICA0ICstLQo+ICBm
cy9mMmZzL3NlZ21lbnQuYyAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9j
b21wcmVzcy5jCj4gaW5kZXggZTYwN2E3ODg1YjU3Li4wMmFkMGZmMjljZjIgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9jb21wcmVzcy5jCj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gQEAgLTEz
NzQsNyArMTM3NCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9jb21wcmVzc2VkX3BhZ2VzKHN0
cnVjdCBjb21wcmVzc19jdHggKmNjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChibGth
ZGRyID09IENPTVBSRVNTX0FERFIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
aW8uY29tcHJfYmxvY2tzKys7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKF9faXNfdmFs
aWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIsIDEp
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4s
IENPTVBSRVNTX0FERFIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrX2Nv
bnRpbnVlOwo+ICAgICAgICAgICAgICAgICB9Cj4gQEAgLTEzODQsNyArMTM4NCw3IEBAIHN0YXRp
YyBpbnQgZjJmc193cml0ZV9jb21wcmVzc2VkX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNj
LAo+Cj4gICAgICAgICAgICAgICAgIGlmIChpID4gY2MtPnZhbGlkX25yX2NwYWdlcykgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRy
KSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Js
b2NrcyhzYmksIGJsa2FkZHIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJm
c19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIsIDEpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZjJmc191cGRhdGVfZGF0YV9ibGthZGRyKCZkbiwgTkVXX0FERFIpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHVubG9ja19jb250aW51ZTsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZz
L2YyZnMuaAo+IGluZGV4IGFkZGQ0OWFmNTdlYy4uNGJiNDU5MTU3YWRmIDEwMDY0NAo+IC0tLSBh
L2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtMzcxNiw3ICszNzE2
LDggQEAgaW50IGYyZnNfaXNzdWVfZmx1c2goc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRf
dCBpbm8pOwo+ICBpbnQgZjJmc19jcmVhdGVfZmx1c2hfY21kX2NvbnRyb2woc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpKTsKPiAgaW50IGYyZnNfZmx1c2hfZGV2aWNlX2NhY2hlKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSk7Cj4gIHZvaWQgZjJmc19kZXN0cm95X2ZsdXNoX2NtZF9jb250cm9sKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBmcmVlKTsKPiAtdm9pZCBmMmZzX2ludmFsaWRh
dGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyKTsKPiArdm9p
ZCBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tf
dCBhZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBsZW4pOwo+ICBib29sIGYyZnNfaXNfY2hlY2twb2ludGVkX2RhdGEoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpOwo+ICBpbnQgZjJmc19zdGFy
dF9kaXNjYXJkX3RocmVhZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+ICB2b2lkIGYyZnNf
ZHJvcF9kaXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5kZXggNzVhOGIyMmRhNjY0Li4x
MzU5NGJiNTAyZDEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZz
L2ZpbGUuYwo+IEBAIC02NTIsNyArNjUyLDcgQEAgdm9pZCBmMmZzX3RydW5jYXRlX2RhdGFfYmxv
Y2tzX3JhbmdlKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IGNvdW50KQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmFsaWRfYmxvY2tzKys7Cj4gICAgICAgICAgICAgICAg
IH0KPgo+IC0gICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYmxrYWRk
cik7Cj4gKyAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRy
LCAxKTsKPgo+ICAgICAgICAgICAgICAgICBpZiAoIXJlbGVhc2VkIHx8IGJsa2FkZHIgIT0gQ09N
UFJFU1NfQUREUikKPiAgICAgICAgICAgICAgICAgICAgICAgICBucl9mcmVlKys7Cj4gQEAgLTc1
MCw3ICs3NTAsNyBAQCBpbnQgZjJmc19kb190cnVuY2F0ZV9ibG9ja3Moc3RydWN0IGlub2RlICpp
bm9kZSwgdTY0IGZyb20sIGJvb2wgbG9jaykKPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGk7Cj4KPiAgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGVpLmxlbjsgaSsrKQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBlaS5ibGsg
KyBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNi
aSwgZWkuYmxrICsgaSwgMSk7Cj4KPiAgICAgICAgICAgICAgICAgZGVjX3ZhbGlkX2Jsb2NrX2Nv
dW50KHNiaSwgaW5vZGUsIGVpLmxlbik7Cj4gICAgICAgICAgICAgICAgIGYyZnNfdXBkYXRlX3Rp
bWUoc2JpLCBSRVFfVElNRSk7Cj4gQEAgLTEzMTksNyArMTMxOSw3IEBAIHN0YXRpYyBpbnQgX19y
b2xsX2JhY2tfYmxrYWRkcnMoc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tfdCAqYmxrYWRkciwK
PiAgICAgICAgICAgICAgICAgcmV0ID0gZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgmZG4sIG9mZiAr
IGksIExPT0tVUF9OT0RFX1JBKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGRlY192YWxpZF9ibG9ja19jb3VudChzYmksIGlub2RlLCAxKTsK
PiAtICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgKmJs
a2FkZHIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Mo
c2JpLCAqYmxrYWRkciwgMSk7Cj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZjJmc191cGRhdGVfZGF0YV9ibGthZGRyKCZkbiwgKmJsa2FkZHIpOwo+
ICAgICAgICAgICAgICAgICB9Cj4gQEAgLTE1NzEsNyArMTU3MSw3IEBAIHN0YXRpYyBpbnQgZjJm
c19kb196ZXJvX3JhbmdlKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgcGdvZmZfdCBzdGFydCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgfQo+Cj4g
LSAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBkbi0+ZGF0YV9ibGth
ZGRyKTsKPiArICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGRuLT5k
YXRhX2Jsa2FkZHIsIDEpOwo+ICAgICAgICAgICAgICAgICBmMmZzX3NldF9kYXRhX2Jsa2FkZHIo
ZG4sIE5FV19BRERSKTsKPiAgICAgICAgIH0KPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUu
YyBiL2ZzL2YyZnMvbm9kZS5jCj4gaW5kZXggYWYzNmM2ZDY1NDJiLi5kYjE1ZDZhOTBmNjcgMTAw
NjQ0Cj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPiArKysgYi9mcy9mMmZzL25vZGUuYwo+IEBAIC05
MTYsNyArOTE2LDcgQEAgc3RhdGljIGludCB0cnVuY2F0ZV9ub2RlKHN0cnVjdCBkbm9kZV9vZl9k
YXRhICpkbikKPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogRGVhbGxvY2F0ZSBub2RlIGFkZHJl
c3MgKi8KPiAtICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBuaS5ibGtfYWRkcik7
Cj4gKyAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgbmkuYmxrX2FkZHIsIDEpOwo+
ICAgICAgICAgZGVjX3ZhbGlkX25vZGVfY291bnQoc2JpLCBkbi0+aW5vZGUsIGRuLT5uaWQgPT0g
ZG4tPmlub2RlLT5pX2lubyk7Cj4gICAgICAgICBzZXRfbm9kZV9hZGRyKHNiaSwgJm5pLCBOVUxM
X0FERFIsIGZhbHNlKTsKPgo+IEBAIC0yNzYxLDcgKzI3NjEsNyBAQCBpbnQgZjJmc19yZWNvdmVy
X3hhdHRyX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICAg
ICAgICBpZiAoZXJyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+Cj4gLSAgICAgICBm
MmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgbmkuYmxrX2FkZHIpOwo+ICsgICAgICAgZjJmc19p
bnZhbGlkYXRlX2Jsb2NrcyhzYmksIG5pLmJsa19hZGRyLCAxKTsKPiAgICAgICAgIGRlY192YWxp
ZF9ub2RlX2NvdW50KHNiaSwgaW5vZGUsIGZhbHNlKTsKPiAgICAgICAgIHNldF9ub2RlX2FkZHIo
c2JpLCAmbmksIE5VTExfQUREUiwgZmFsc2UpOwo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2Vn
bWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBpbmRleCA5MmRkZmYyODVhNjUuLjY3ZjJiZmRl
YjZlYyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ICsrKyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gQEAgLTI0NSw3ICsyNDUsNyBAQCBzdGF0aWMgaW50IF9fcmVwbGFjZV9hdG9taWNf
d3JpdGVfYmxvY2soc3RydWN0IGlub2RlICppbm9kZSwgcGdvZmZfdCBpbmRleCwKPiAgICAgICAg
ICAgICAgICAgaWYgKCFfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuZXdfYWRkcikpIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAobmV3X2FkZHIgPT0gTlVMTF9BRERSKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZGVjX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgaW5vZGUs
IDEpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2Jp
LCBkbi5kYXRhX2Jsa2FkZHIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxp
ZGF0ZV9ibG9ja3Moc2JpLCBkbi5kYXRhX2Jsa2FkZHIsIDEpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4sIG5ld19hZGRyKTsKPiAgICAgICAg
ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3JlcGxhY2Vf
YmxvY2soc2JpLCAmZG4sIGRuLmRhdGFfYmxrYWRkciwKPiBAQCAtMjU1OCwyOSArMjU1OCw3NiBA
QCBzdGF0aWMgdm9pZCB1cGRhdGVfc2l0X2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
YmxvY2tfdCBibGthZGRyLCBpbnQgZGVsKQo+ICAgICAgICAgICAgICAgICBnZXRfc2VjX2VudHJ5
KHNiaSwgc2Vnbm8pLT52YWxpZF9ibG9ja3MgKz0gZGVsOwo+ICB9Cj4KPiAtdm9pZCBmMmZzX2lu
dmFsaWRhdGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyKQo+
ICtzdGF0aWMgdm9pZCBfX2YyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja190
IGFkZHIsIGJsb2NrX3QgZW5kKQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8gPSBH
RVRfU0VHTk8oc2JpLCBhZGRyKTsKPiAgICAgICAgIHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBT
SVRfSShzYmkpOwo+ICsgICAgICAgdW5zaWduZWQgaW50IHNlZ19udW0gPSBHRVRfU0VHTk8oc2Jp
LCBlbmQpIC0gc2Vnbm8gKyAxOwo+ICsgICAgICAgdW5zaWduZWQgaW50IGkgPSAxLCBtYXhfYmxv
Y2tzID0gc2JpLT5ibG9ja3NfcGVyX3NlZywgbGVuOwo+ICsgICAgICAgYmxvY2tfdCBhZGRyX3N0
YXJ0ID0gYWRkcjsKPgo+IC0gICAgICAgZjJmc19idWdfb24oc2JpLCBhZGRyID09IE5VTExfQURE
Uik7Cj4gLSAgICAgICBpZiAoYWRkciA9PSBORVdfQUREUiB8fCBhZGRyID09IENPTVBSRVNTX0FE
RFIpCj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiAtCj4gLSAgICAgICBmMmZzX2ludmFsaWRh
dGVfaW50ZXJuYWxfY2FjaGUoc2JpLCBhZGRyLCAxKTsKPiArICAgICAgIGYyZnNfaW52YWxpZGF0
ZV9pbnRlcm5hbF9jYWNoZShzYmksIGFkZHIsIGVuZCAtIGFkZHIgKyAxKTsKPgo+ICAgICAgICAg
LyogYWRkIGl0IGludG8gc2l0IG1haW4gYnVmZmVyICovCj4gICAgICAgICBkb3duX3dyaXRlKCZz
aXRfaS0+c2VudHJ5X2xvY2spOwo+Cj4gLSAgICAgICB1cGRhdGVfc2VnbWVudF9tdGltZShzYmks
IGFkZHIsIDApOwo+IC0gICAgICAgdXBkYXRlX3NpdF9lbnRyeShzYmksIGFkZHIsIC0xKTsKPiAr
ICAgICAgIGlmIChzZWdfbnVtID09IDEpCj4gKyAgICAgICAgICAgICAgIGxlbiA9IGVuZCAtIGFk
ZHIgKyAxOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBsZW4gPSBtYXhfYmxvY2tz
IC0gR0VUX0JMS09GRl9GUk9NX1NFRzAoc2JpLCBhZGRyKTsKPgo+IC0gICAgICAgLyogYWRkIGl0
IGludG8gZGlydHkgc2VnbGlzdCAqLwo+IC0gICAgICAgbG9jYXRlX2RpcnR5X3NlZ21lbnQoc2Jp
LCBzZWdubyk7Cj4gKyAgICAgICBkbyB7Cj4gKyAgICAgICAgICAgICAgIHVwZGF0ZV9zZWdtZW50
X210aW1lKHNiaSwgYWRkcl9zdGFydCwgMCk7Cj4gKyAgICAgICAgICAgICAgIHVwZGF0ZV9zaXRf
ZW50cnkoc2JpLCBhZGRyX3N0YXJ0LCAtbGVuKTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIGFk
ZCBpdCBpbnRvIGRpcnR5IHNlZ2xpc3QgKi8KPiArICAgICAgICAgICAgICAgbG9jYXRlX2RpcnR5
X3NlZ21lbnQoc2JpLCBzZWdubyk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiB1cGRhdGUgQGFk
ZHJfc3RhcnQgYW5kIEBsZW4gYW5kIEBzZWdubyAqLwo+ICsgICAgICAgICAgICAgICBhZGRyX3N0
YXJ0ID0gU1RBUlRfQkxPQ0soc2JpLCArK3NlZ25vKTsKPiArICAgICAgICAgICAgICAgaWYgKCsr
aSA9PSBzZWdfbnVtKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxlbiA9IEdFVF9CTEtPRkZf
RlJPTV9TRUcwKHNiaSwgZW5kKSArIDE7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAg
ICAgICAgICAgICAgICAgICBsZW4gPSBtYXhfYmxvY2tzOwo+ICsgICAgICAgfSB3aGlsZSAoaSA8
PSBzZWdfbnVtKTsKPgo+ICAgICAgICAgdXBfd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7Cj4g
IH0KPgo+ICt2b2lkIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBhZGRyLCB1bnNp
Z25lZCBpbnQgbGVuKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAgICAgIC8q
IFRlbXBvcmFyeSByZWNvcmQgbG9jYXRpb24gKi8KPiArICAgICAgIGJsb2NrX3QgYWRkcl9zdGFy
dCA9IGFkZHIsIGFkZHJfZW5kOwo+ICsKPiArICAgICAgIGlmIChsZW4gPT0gMCkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykg
ewo+ICsgICAgICAgICAgICAgICBhZGRyX2VuZCA9IGFkZHIgKyBpOwo+ICsKPiArICAgICAgICAg
ICAgICAgZjJmc19idWdfb24oc2JpLCBhZGRyX2VuZCA9PSBOVUxMX0FERFIpOwoKTG9va3MgbGlr
ZSB0aGlzIGxpbmUgc2hvdWxkIGJlIG91dCBvZiB0aGlzIGxvb3AsIHJpZ2h0PwoKPiArCj4gKyAg
ICAgICAgICAgICAgIGlmIChhZGRyX2VuZCA9PSBORVdfQUREUiB8fCBhZGRyX2VuZCA9PSBDT01Q
UkVTU19BRERSKSB7CgpkaXR0bz8KQ291bGQgeW91IGhlbHAgd2l0aCBlbmhhbmNpbmcgdGhlIHJl
YWRhYmlsaXR5IGhlcmU/IGEgbGl0dGxlIGJpdApjb25mdXNlZCB3aXRoIHVzaW5nIGFkZHJfc3Rh
cnQsIGFkZHJfZW5kIGFuZCBORVdfQUREUiwgQ09NUFJFU1NfQUREUiwKaGVyZS4KCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGFkZHJfc3RhcnQgPT0gYWRkcl9lbmQpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJfZW5kID0gYWRkcl9zdGFydCA9IGFkZHJfZW5k
ICsgMTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19mMmZz
X2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYWRkcl9zdGFydCwgYWRkcl9lbmQgLSAxKTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBhZGRyX2VuZCA9IGFkZHJfc3RhcnQgPSBhZGRyX2VuZCArIDE7
Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoYWRkcl9l
bmQgPj0gKGFkZHIgKyBsZW4pKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAg
ICAgX19mMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYWRkcl9zdGFydCwgYWRkcl9lbmQpOwo+
ICsKPiArfQo+ICsKPiAgYm9vbCBmMmZzX2lzX2NoZWNrcG9pbnRlZF9kYXRhKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRyKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2l0
X2luZm8gKnNpdF9pID0gU0lUX0koc2JpKTsKPiAtLQo+IDIuMjUuMQo+Cj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
