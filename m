Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AFF82A571
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 01:55:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNjLz-0008SG-De;
	Thu, 11 Jan 2024 00:55:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rNjLx-0008SA-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 00:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ea5zVOpj9Ubd0eJbED71QzNo2kZcGma98yI7Zk7sjq0=; b=DpNPBi0CyQ5ds13K8Dk4+0+jV+
 vX3sKPm2wnX6Q+SJIO++bqEoPPC8dxj+qz/660nsa35fT7uetZ1nyi31sv/310cHeCdSx3PGCS/78
 0QJdGNWTQQFf7bzHUrzpsnTvTyytxwaayfiGAoIH4pkzCGL8pKZ697VAzAnUX3iva1q8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ea5zVOpj9Ubd0eJbED71QzNo2kZcGma98yI7Zk7sjq0=; b=CmcZP25uVNZ7668u7mp912P571
 Lh7HWAIxDhwoSGN7qHj2KGb1Zr2ALrLVz3po2ipig8Xf4NKj+e5yYhdeNPdrafNm7nrwSqqaEIQAw
 CfkKVUmCfFduZrdSZEt50uHzc238AQtCH7aBMLsTiaJ1HrTBDHF5KhTeZ2pL8K7I8WR4=;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rNjLx-0001PS-4W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 00:55:25 +0000
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-4b71e8790efso1075993e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jan 2024 16:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704934519; x=1705539319; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ea5zVOpj9Ubd0eJbED71QzNo2kZcGma98yI7Zk7sjq0=;
 b=IKSCnMLcMgoKhE26zzi5YHykUXiJORDrsLKjVzGdq3jEtFQOBr4rpBzslMkkuYBMLi
 iucVQUHW0wljwfURXNYP60NcPN63a/R7/itvokfj3f0PgEXh4W86leTBcm1MoJEBQwz/
 fiynaxAFKug9OyrejtsikbyFzCrWBmzamYdcOWE/zGp+U0t30gPbFg8zQVuDvBYQzeD8
 ihRSdyzItI7yeT3gXD5OgBapURV6Gu/5p+u7dZ6w4bF4Foi0eYVacaIBvLLZ08SwbqYi
 TJPDi0ch0GlXZ5kB1fEbQoy1Yp33N1HzoceZxYMA36vSIV9+RSX9YUgQruys8mOfPPPJ
 hNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704934519; x=1705539319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ea5zVOpj9Ubd0eJbED71QzNo2kZcGma98yI7Zk7sjq0=;
 b=QUsZ/c+4Z/p6lD1BGgfJrD5V5GEnxyZoQ7Y28zZGW8or4XY9A7yO/oAatPelMsc6pK
 CnIadL/TPIOP4LiM6OWUYaq88tDrpiDk72JqUgltpvDvzTCX6/PO5VPW+QvDdNdiswc+
 9+ZpNM7HYGowTzKRVWJGtBA92pKInK3GB85YGIBAeykBc8vyuyWoa88Nt5iEuCMLmAdu
 aP2dDBVNb5U4rKMEKcIREOHPbUZ29RoX+DxcwgCpC+FIxJp2LqXpX16NYkIohjyypA1s
 5Xh69DPk+Ut1RkG20twNK1j5rTGVFPsSYa0z5P9TW21UOq7b0iQNPLedryyGLmdRDLT5
 SFfA==
X-Gm-Message-State: AOJu0YwrOSUliC3hRqVjbbv4xa807kijAa0oOBTRU70wwvu7lf8x+dw4
 bcj/qG2S4ASDmPyMM/zCenNrk4JphlWa3wrTsIc=
X-Google-Smtp-Source: AGHT+IG5mwXZAP7USA5jhPRJfZddHDN87iEqYGpOZIQwm06Lr02djACIpQ+KguRRuDjeoOgQC4kC1utQU14QNTgsq5Q=
X-Received: by 2002:a05:6122:289a:b0:4b6:ea3a:f887 with SMTP id
 fl26-20020a056122289a00b004b6ea3af887mr285475vkb.22.1704934518993; Wed, 10
 Jan 2024 16:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
In-Reply-To: <20231228143152.1543509-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 10 Jan 2024 16:55:07 -0800
Message-ID: <CACOAw_xXGUt=2JJgq5yfW5ZG7EfZMm1iNTVxvfA9FoJVDwbH_A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Dec 28, 2023 at 6:33 AM Chao Yu wrote: > > If data
    block in compressed cluster is not persisted with metadata > during checkpoint,
    after SPOR, the data may be corrupted, let's > guarantee [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.182 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rNjLx-0001PS-4W
Subject: Re: [f2fs-dev] [PATCH v3 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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

T24gVGh1LCBEZWMgMjgsIDIwMjMgYXQgNjozM+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBJZiBkYXRhIGJsb2NrIGluIGNvbXByZXNzZWQgY2x1c3RlciBpcyBub3Qg
cGVyc2lzdGVkIHdpdGggbWV0YWRhdGEKPiBkdXJpbmcgY2hlY2twb2ludCwgYWZ0ZXIgU1BPUiwg
dGhlIGRhdGEgbWF5IGJlIGNvcnJ1cHRlZCwgbGV0J3MKPiBndWFyYW50ZWUgdG8gd3JpdGUgY29t
cHJlc3NlZCBwYWdlIGJ5IGNoZWNrcG9pbnQuCj4KPiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJm
czogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4gdjM6Cj4gLSB0cmVhdCBjb21wcmVzc2VkIHBhZ2UgYXMg
Q1AgZ3VhcmFudGVlZCBkYXRhIGV4cGxpY3RseS4KPiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgIDQg
KysrLQo+ICBmcy9mMmZzL2RhdGEuYyAgICAgfCAxNyArKysrKysrKystLS0tLS0tLQo+ICBmcy9m
MmZzL2YyZnMuaCAgICAgfCAgNCArKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5j
IGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gaW5kZXggYzVhNDM2NGM0NDgyLi45OTQwYjc4ODZlNWQg
MTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4gKysrIGIvZnMvZjJmcy9jb21wcmVz
cy5jCj4gQEAgLTE0MTgsNiArMTQxOCw4IEBAIHZvaWQgZjJmc19jb21wcmVzc193cml0ZV9lbmRf
aW8oc3RydWN0IGJpbyAqYmlvLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgICAgICAgIHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSA9IGJpby0+YmlfcHJpdmF0ZTsKPiAgICAgICAgIHN0cnVjdCBjb21w
cmVzc19pb19jdHggKmNpYyA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgKHN0cnVjdCBjb21w
cmVzc19pb19jdHggKilwYWdlX3ByaXZhdGUocGFnZSk7Cj4gKyAgICAgICBlbnVtIGNvdW50X3R5
cGUgdHlwZSA9IFdCX0RBVEFfVFlQRShwYWdlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZjJmc19pc19jb21wcmVzc2VkX3BhZ2UocGFnZSkpOwo+ICAgICAgICAgaW50IGk7Cj4K
PiAgICAgICAgIGlmICh1bmxpa2VseShiaW8tPmJpX3N0YXR1cykpCj4gQEAgLTE0MjUsNyArMTQy
Nyw3IEBAIHZvaWQgZjJmc19jb21wcmVzc193cml0ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvLCBz
dHJ1Y3QgcGFnZSAqcGFnZSkKPgo+ICAgICAgICAgZjJmc19jb21wcmVzc19mcmVlX3BhZ2UocGFn
ZSk7Cj4KPiAtICAgICAgIGRlY19wYWdlX2NvdW50KHNiaSwgRjJGU19XQl9EQVRBKTsKPiArICAg
ICAgIGRlY19wYWdlX2NvdW50KHNiaSwgdHlwZSk7Cj4KPiAgICAgICAgIGlmIChhdG9taWNfZGVj
X3JldHVybigmY2ljLT5wZW5kaW5nX3BhZ2VzKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggZGNl
OGRlZmRmNGM3Li44MWY5ZTJjYzQ5ZTIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+IEBAIC00OCw3ICs0OCw3IEBAIHZvaWQgZjJmc19kZXN0cm95
X2Jpb3NldCh2b2lkKQo+ICAgICAgICAgYmlvc2V0X2V4aXQoJmYyZnNfYmlvc2V0KTsKPiAgfQo+
Cj4gLXN0YXRpYyBib29sIF9faXNfY3BfZ3VhcmFudGVlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAr
Ym9vbCBmMmZzX2lzX2NwX2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gIHsKPiAgICAg
ICAgIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gcGFnZS0+bWFwcGluZzsKPiAgICAg
ICAgIHN0cnVjdCBpbm9kZSAqaW5vZGU7Cj4gQEAgLTY1LDggKzY1LDYgQEAgc3RhdGljIGJvb2wg
X19pc19jcF9ndWFyYW50ZWVkKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIFNfSVNESVIoaW5vZGUtPmlfbW9kZSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiB0
cnVlOwo+Cj4gLSAgICAgICBpZiAoZjJmc19pc19jb21wcmVzc2VkX3BhZ2UocGFnZSkpCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKCk91dCBvZiBjdXJpb3NpdHksIHdoeSBkb24ndCB3
ZSBzaW1wbHkgY2hhbmdlIHRoZSBhYm92ZSB0byAicmV0dXJuIHRydWUiPwoKPiAgICAgICAgIGlm
ICgoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSAmJiBJU19OT1FVT1RBKGlub2RlKSkgfHwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBwYWdlX3ByaXZhdGVfZ2NpbmcocGFnZSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwo+IEBAIC0zMzgsNyArMzM2LDcgQEAgc3RhdGljIHZvaWQgZjJm
c193cml0ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvKQo+Cj4gICAgICAgICBiaW9fZm9yX2VhY2hf
c2VnbWVudF9hbGwoYnZlYywgYmlvLCBpdGVyX2FsbCkgewo+ICAgICAgICAgICAgICAgICBzdHJ1
Y3QgcGFnZSAqcGFnZSA9IGJ2ZWMtPmJ2X3BhZ2U7Cj4gLSAgICAgICAgICAgICAgIGVudW0gY291
bnRfdHlwZSB0eXBlID0gV0JfREFUQV9UWVBFKHBhZ2UpOwo+ICsgICAgICAgICAgICAgICBlbnVt
IGNvdW50X3R5cGUgdHlwZSA9IFdCX0RBVEFfVFlQRShwYWdlLCBmYWxzZSk7Cj4KPiAgICAgICAg
ICAgICAgICAgaWYgKHBhZ2VfcHJpdmF0ZV9kdW1teShwYWdlKSkgewo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsZWFyX3BhZ2VfcHJpdmF0ZV9kdW1teShwYWdlKTsKPiBAQCAtNzYyLDcgKzc2
MCw3IEBAIGludCBmMmZzX3N1Ym1pdF9wYWdlX2JpbyhzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8p
Cj4gICAgICAgICAgICAgICAgIHdiY19hY2NvdW50X2Nncm91cF9vd25lcihmaW8tPmlvX3diYywg
ZmlvLT5wYWdlLCBQQUdFX1NJWkUpOwo+Cj4gICAgICAgICBpbmNfcGFnZV9jb3VudChmaW8tPnNi
aSwgaXNfcmVhZF9pbyhmaW8tPm9wKSA/Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgX19yZWFk
X2lvX3R5cGUocGFnZSkgOiBXQl9EQVRBX1RZUEUoZmlvLT5wYWdlKSk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgX19yZWFkX2lvX3R5cGUocGFnZSkgOiBXQl9EQVRBX1RZUEUoZmlvLT5wYWdl
LCBmYWxzZSkpOwo+Cj4gICAgICAgICBpZiAoaXNfcmVhZF9pbyhiaW9fb3AoYmlvKSkpCj4gICAg
ICAgICAgICAgICAgIGYyZnNfc3VibWl0X3JlYWRfYmlvKGZpby0+c2JpLCBiaW8sIGZpby0+dHlw
ZSk7Cj4gQEAgLTk3Myw3ICs5NzEsNyBAQCBpbnQgZjJmc19tZXJnZV9wYWdlX2JpbyhzdHJ1Y3Qg
ZjJmc19pb19pbmZvICpmaW8pCj4gICAgICAgICBpZiAoZmlvLT5pb193YmMpCj4gICAgICAgICAg
ICAgICAgIHdiY19hY2NvdW50X2Nncm91cF9vd25lcihmaW8tPmlvX3diYywgZmlvLT5wYWdlLCBQ
QUdFX1NJWkUpOwo+Cj4gLSAgICAgICBpbmNfcGFnZV9jb3VudChmaW8tPnNiaSwgV0JfREFUQV9U
WVBFKHBhZ2UpKTsKPiArICAgICAgIGluY19wYWdlX2NvdW50KGZpby0+c2JpLCBXQl9EQVRBX1RZ
UEUocGFnZSwgZmFsc2UpKTsKPgo+ICAgICAgICAgKmZpby0+bGFzdF9ibG9jayA9IGZpby0+bmV3
X2Jsa2FkZHI7Cj4gICAgICAgICAqZmlvLT5iaW8gPSBiaW87Cj4gQEAgLTEwMDcsNiArMTAwNSw3
IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8p
Cj4gICAgICAgICBlbnVtIHBhZ2VfdHlwZSBidHlwZSA9IFBBR0VfVFlQRV9PRl9CSU8oZmlvLT50
eXBlKTsKPiAgICAgICAgIHN0cnVjdCBmMmZzX2Jpb19pbmZvICppbyA9IHNiaS0+d3JpdGVfaW9b
YnR5cGVdICsgZmlvLT50ZW1wOwo+ICAgICAgICAgc3RydWN0IHBhZ2UgKmJpb19wYWdlOwo+ICsg
ICAgICAgZW51bSBjb3VudF90eXBlIHR5cGU7Cj4KPiAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwg
aXNfcmVhZF9pbyhmaW8tPm9wKSk7Cj4KPiBAQCAtMTA0Niw3ICsxMDQ1LDggQEAgdm9pZCBmMmZz
X3N1Ym1pdF9wYWdlX3dyaXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPiAgICAgICAgIC8q
IHNldCBzdWJtaXR0ZWQgPSB0cnVlIGFzIGEgcmV0dXJuIHZhbHVlICovCj4gICAgICAgICBmaW8t
PnN1Ym1pdHRlZCA9IDE7Cj4KPiAtICAgICAgIGluY19wYWdlX2NvdW50KHNiaSwgV0JfREFUQV9U
WVBFKGJpb19wYWdlKSk7Cj4gKyAgICAgICB0eXBlID0gV0JfREFUQV9UWVBFKGJpb19wYWdlLCBm
aW8tPmNvbXByZXNzZWRfcGFnZSk7Cj4gKyAgICAgICBpbmNfcGFnZV9jb3VudChzYmksIHR5cGUp
Owo+Cj4gICAgICAgICBpZiAoaW8tPmJpbyAmJgo+ICAgICAgICAgICAgICghaW9faXNfbWVyZ2Vh
YmxlKHNiaSwgaW8tPmJpbywgaW8sIGZpbywgaW8tPmxhc3RfYmxvY2tfaW5fYmlvLAo+IEBAIC0x
MDU5LDcgKzEwNTksOCBAQCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoc3RydWN0IGYyZnNf
aW9faW5mbyAqZmlvKQo+ICAgICAgICAgICAgICAgICBpZiAoRjJGU19JT19BTElHTkVEKHNiaSkg
JiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChmaW8tPnR5cGUgPT0gREFUQSB8
fCBmaW8tPnR5cGUgPT0gTk9ERSkgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZpby0+bmV3X2Jsa2FkZHIgJiBGMkZTX0lPX1NJWkVfTUFTSyhzYmkpKSB7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZGVjX3BhZ2VfY291bnQoc2JpLCBXQl9EQVRBX1RZUEUoYmlvX3BhZ2Up
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBkZWNfcGFnZV9jb3VudChzYmksIFdCX0RBVEFf
VFlQRShiaW9fcGFnZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmaW8tPmNvbXByZXNzZWRfcGFnZSkpOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGZpby0+cmV0cnkgPSAxOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gc2tpcDsKPiAg
ICAgICAgICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4gaW5kZXggNjUyOTRlM2IwYmVmLi41MGYzZDU0NmRlZDggMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC0xMDgwLDcgKzEwODAs
OCBAQCBzdHJ1Y3QgZjJmc19zbV9pbmZvIHsKPiAgICogZjJmcyBtb25pdG9ycyB0aGUgbnVtYmVy
IG9mIHNldmVyYWwgYmxvY2sgdHlwZXMgc3VjaCBhcyBvbi13cml0ZWJhY2ssCj4gICAqIGRpcnR5
IGRlbnRyeSBibG9ja3MsIGRpcnR5IG5vZGUgYmxvY2tzLCBhbmQgZGlydHkgbWV0YSBibG9ja3Mu
Cj4gICAqLwo+IC0jZGVmaW5lIFdCX0RBVEFfVFlQRShwKSAgICAgICAgKF9faXNfY3BfZ3VhcmFu
dGVlZChwKSA/IEYyRlNfV0JfQ1BfREFUQSA6IEYyRlNfV0JfREFUQSkKPiArI2RlZmluZSBXQl9E
QVRBX1RZUEUocCwgZikgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAoZiB8fCBmMmZz
X2lzX2NwX2d1YXJhbnRlZWQocCkgPyBGMkZTX1dCX0NQX0RBVEEgOiBGMkZTX1dCX0RBVEEpCj4g
IGVudW0gY291bnRfdHlwZSB7Cj4gICAgICAgICBGMkZTX0RJUlRZX0RFTlRTLAo+ICAgICAgICAg
RjJGU19ESVJUWV9EQVRBLAo+IEBAIC0zODA0LDYgKzM4MDUsNyBAQCB2b2lkIGYyZnNfaW5pdF9j
a3B0X3JlcV9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gICAqLwo+ICBpbnQg
X19pbml0IGYyZnNfaW5pdF9iaW9zZXQodm9pZCk7Cj4gIHZvaWQgZjJmc19kZXN0cm95X2Jpb3Nl
dCh2b2lkKTsKPiArYm9vbCBmMmZzX2lzX2NwX2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2Up
Owo+ICBpbnQgZjJmc19pbml0X2Jpb19lbnRyeV9jYWNoZSh2b2lkKTsKPiAgdm9pZCBmMmZzX2Rl
c3Ryb3lfYmlvX2VudHJ5X2NhY2hlKHZvaWQpOwo+ICB2b2lkIGYyZnNfc3VibWl0X3JlYWRfYmlv
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGJpbyAqYmlvLAo+IC0tCj4gMi40MC4x
Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
