Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B25B1D0E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 04:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XGpBJozf7W2vGETr5nbsf6oMoLMZYvuopFa9xwcars=; b=J/GmuYZCnS1zb0XYlGhnmWDj3N
	qpavl2K+WEOl+xPatIwHTzjNAin0uADNIFKH6KHFljLR3b7V5TAX3TKOCHM/oyUx/yKvsMbgFnjr+
	a2mscc/pWAtFSOf31EI623IopXeZOC/yaB4JQZO1lNMDsc9NPaXTKFnpaVA8TVUcqs9M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujqBv-0007Pz-FY;
	Thu, 07 Aug 2025 02:17:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ujqBt-0007Pt-Ul
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=emjKbcLCSNF5Kwzi2fOAO+eIRhNUx/cfK6ZORT1QxHE=; b=OS1nVqukWROdPxIBUjNHRf5qca
 pPUXPStBeQKnbMPS/1wjMRdMyx31AWQrtAcUyV61nd1VKigEXM6NKe2R4Xn39g7jYzPlCDzFzuJSp
 D0KqOUeN1s3PUisqr3kt6yYAvfVyDg+YbeAHpr1tbB/ope60ZMgi8rwettxZRwfXmNTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=emjKbcLCSNF5Kwzi2fOAO+eIRhNUx/cfK6ZORT1QxHE=; b=DY+W2peDUsFZlyh564fqK/SmOI
 3RTJFXWpOKH5sMbcHu9UHcGnB8YFqWPwHANwzMHjOuJqp8QCktFDNjfHoFvYcssVovHEzcGUb+CxN
 ZCqQdn6RN2HmF+gSNiWKObDibuDhZDxr8KQ9aVjzp9Bks20Ohqra0889qmYNT2CR7+bA=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujqBt-0007zU-Ff for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:17:13 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-458be3ab6adso626215e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Aug 2025 19:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754533027; x=1755137827; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emjKbcLCSNF5Kwzi2fOAO+eIRhNUx/cfK6ZORT1QxHE=;
 b=IYLt0bAEON9ewB8ezZP53UScAbZkBRbFHX/nYfAU7Ym1O9eCo3r85dEMX7hJA6qKOD
 zlwprQ5m/HF+0rlmDBwANS91r6jPEZRtrGtr+Xl7k41630bIGeFu/lAVcZDDZfi5vZSv
 1GvQh9ksJ0MzffAvX6lhEtYndGp8MG7UdOeQ34axH24GtTHF1AmtfEQoWSRdBAZBi78m
 xRT2aZJ9ol7fbQqmJyD3GX9zOUxSFljze6aO0GMnkq7GYZIGgH+jfAInxDwrnRK0L35U
 RZkPLUwDw/bjobVK8n1oFD+X2TbehgK36Vwd9xdqyLfvWW7Fuy/ScqzknXbLv9NHaTHL
 cnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754533027; x=1755137827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=emjKbcLCSNF5Kwzi2fOAO+eIRhNUx/cfK6ZORT1QxHE=;
 b=lcwaC5SCVTeoFLHVliXthBJdueBoTeDJhie7l1jFBU6BTcbu0Fk21mav9VGVL0ByBI
 Kr8B+kTlEZEc8OuzblJGgXC5rN/MFx/yVDC47rMH8muWHhfLUlmPizgk7yuWuZJ6BLuX
 bsIP4eHQFD+8JF//i5fpsxbM3dtrAXgZVPP0LAZlmPA3/A7x/KO7+ILm8O37KDWHGiVi
 +iSYaHfM2Uavj5DzFGKVzpL9IuTfRipY0BLh8dWhfXnP9pnXq8PQXwh8UIaIIL9+f2Yq
 BFhInunqsJu5M7hK/u0wZJ7uK2vVvGEswN3QYAonJozQqBobemVjTtS1saElZHPEM/b7
 YB7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5a1FIV/l7Jy85rJyfSRXeHUjEG9fLh+84aTvi4nsU/AItwUjCiMrLQG1LLS3lQS5NAjgf1p29AGPmtZKTKSI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy7GohJO+pjXJPIyaklq5owJWuVmRBqitRYZ3aQPl7s641yCgcE
 1EC40db5lkaE0186/+Oj8mOmrFjhAmuazxEnvC6YPo0htUscqC4H352cnjoBbG+XyEvlXUzREy0
 K/Cq26iL+VUv1ZQibjKGS+5ojvb7psFONlyRU
X-Gm-Gg: ASbGncsOSwXmOr+0OqI2uCZb/81BLpmMJMFqnf1x/pduXEOPZXG0OPDdiWVYWdswjjF
 BKALHtGYa95DOjW7i5VsvNtXL3mIriwz5qMyNtwINba4Jds3+CylDoU0C1G2zgcgK+V5p5V0u5r
 xT8TW8FxJNDduWhJXfoOCQOvooX3u9gt+vrGJ8x4fJSumjfFZt8xkce5bg4I9QZlzvBKDr3WGlB
 OAe2XpGHQhdvYTlWyvo+HVUzKTDNg==
X-Google-Smtp-Source: AGHT+IHosFPRBu6qdkS0P/9ANurx7HeX4wmp1afJzS7stgR2tcfKH7FgQbFtsoP1L1Gpk+e+c84RDMyHX3ebaxl/lJQ=
X-Received: by 2002:a05:6000:2c0c:b0:3a4:f7ae:7801 with SMTP id
 ffacd0b85a97d-3b8f41ba350mr1653500f8f.8.1754533026692; Wed, 06 Aug 2025
 19:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250731084700.1230841-1-chao@kernel.org>
In-Reply-To: <20250731084700.1230841-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Aug 2025 10:16:55 +0800
X-Gm-Features: Ac12FXy4abTVjzlt0lrkD09Avc9qQGimskVCDTgC2N8xRhDE55hHWCAVvZyWSRU
Message-ID: <CAHJ8P3+GJu8ztM85pMUih93RUsDF65n2OUc-F7QPwvGwv2x48w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年7月31日周四 16:49写道：
    > > This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
    > in order to tune performance of f2fs data flush f [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1ujqBt-0007zU-Ff
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce flush_policy sysfs entry
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

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ35pyIMzHml6Xlkajlm5sgMTY6NDnlhpnpgZPvvJoKPgo+
IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBzeXNmcyBlbnRyeSAvc3lzL2ZzL2YyZnMvPGRp
c2s+L2ZsdXNoX3BvbGljeQo+IGluIG9yZGVyIHRvIHR1bmUgcGVyZm9ybWFuY2Ugb2YgZjJmcyBk
YXRhIGZsdXNoIGZsb3cuCj4KPiBGb3IgZXhhbXBsZSwgY2hlY2twb2ludCB3aWxsIHVzZSBSRVFf
RlVBIHRvIHBlcnNpc3QgQ1AgbWV0YWRhdGEsIGhvd2V2ZXIsCj4gc29tZSBraW5kIGRldmljZSBo
YXMgYmFkIHBlcmZvcm1hbmNlIG9uIFJFUV9GVUEgY29tbWFuZCwgcmVzdWx0IGluIHRoYXQKPiBj
aGVja3BvaW50IGJlaW5nIGJsb2NrZWQgZm9yIGxvbmcgdGltZSwgdy8gdGhpcyBzeXNmcyBlbnRy
eSwgd2UgY2FuIGdpdmUKPiBhbiBvcHRpb24gdG8gdXNlIFJFUV9QUkVGTFVTSCBjb21tYW5kIGlu
c3RlYWQgb2YgUkVRX0ZVQSBkdXJpbmcgY2hlY2twb2ludCwKPiBpdCBjYW4gaGVscCB0byBtaXRp
Z2F0ZSBsb25nIGxhdGVuY3kgb2YgY2hlY2twb2ludC4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1mcy1mMmZzIHwgIDkgKysrKysrKysrCj4gIGZzL2YyZnMvY2hlY2twb2ludC5jICAgICAg
ICAgICAgICAgICAgICB8IDEwICsrKysrKysrKy0KPiAgZnMvZjJmcy9mMmZzLmggICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICBmcy9mMmZzL3N5c2ZzLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9B
QkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNm
cy1mcy1mMmZzCj4gaW5kZXggYmMwZTdmZWZjMzlkLi4yZmVkYjQ0YjcxM2IgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gQEAgLTg4MywzICs4ODMsMTIgQEAg
RGF0ZTogICAgICAgICAgICAgIEp1bmUgMjAyNQo+ICBDb250YWN0OiAgICAgICAiRGFlaG8gSmVv
bmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gIERlc2NyaXB0aW9uOiAgIENvbnRyb2wgR0Mg
YWxnb3JpdGhtIGZvciBib29zdCBHQy4gMDogY29zdCBiZW5lZml0LCAxOiBncmVlZHkKPiAgICAg
ICAgICAgICAgICAgRGVmYXVsdDogMQo+ICsKPiArV2hhdDogICAgICAgICAgL3N5cy9mcy9mMmZz
LzxkaXNrPi9mbHVzaF9wb2xpY3kKPiArRGF0ZTogICAgICAgICAgSnVseSAyMDI1Cj4gK0NvbnRh
Y3Q6ICAgICAgICJDaGFvIFl1IiA8Y2hhb0BrZXJuZWwub3JnPgo+ICtEZXNjcmlwdGlvbjogICBE
ZXZpY2UgaGFzIGRpZmZlcmVudCBwZXJmb3JtYW5jZSBmb3IgdGhlIHNhbWUgZmx1c2ggbWV0aG9k
cywgdGhpcyBub2RlCj4gKyAgICAgICAgICAgICAgIGNhbiBiZSB1c2VkIHRvIHR1bmUgcGVyZm9y
bWFuY2UgYnkgc2V0dGluZyBkaWZmZXJlbnQgZmx1c2ggbWV0aG9kcy4KPiArCj4gKyAgICAgICAg
ICAgICAgIHBvbGljeSB2YWx1ZSAgICAgICAgICAgIGRlc2NyaXB0aW9uCj4gKyAgICAgICAgICAg
ICAgIDB4MDAwMDAwMDEgICAgICAgICAgICAgIFVzZSBwcmVmbHVzaCBpbnN0ZWFkIG9mIGZ1YSBk
dXJpbmcgY2hlY2twb2ludAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2Zz
L2YyZnMvY2hlY2twb2ludC5jCj4gaW5kZXggYmJlMDdlM2E2Yzc1Li4xMGNjMjcxNTg3NzAgMTAw
NjQ0Cj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiArKysgYi9mcy9mMmZzL2NoZWNrcG9p
bnQuYwo+IEBAIC0xNDE5LDcgKzE0MTksOSBAQCBzdGF0aWMgdm9pZCBjb21taXRfY2hlY2twb2lu
dChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gICAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xp
bywgZmFsc2UpOwo+Cj4gICAgICAgICAvKiBzdWJtaXQgY2hlY2twb2ludCAod2l0aCBiYXJyaWVy
IGlmIE5PQkFSUklFUiBpcyBub3Qgc2V0KSAqLwo+IC0gICAgICAgZjJmc19zdWJtaXRfbWVyZ2Vk
X3dyaXRlKHNiaSwgTUVUQV9GTFVTSCk7Cj4gKyAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3Jp
dGUoc2JpLAo+ICsgICAgICAgICAgICAgICBzYmktPmZsdXNoX3BvbGljeSAmIEJJVChGTFVTSF9Q
T0xJQ1lfQ1BfTk9fRlVBKSA/Cj4gKyAgICAgICAgICAgICAgIE1FVEEgOiBNRVRBX0ZMVVNIKTsK
PiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUgdTY0IGdldF9zZWN0b3JzX3dyaXR0ZW4oc3RydWN0IGJs
b2NrX2RldmljZSAqYmRldikKPiBAQCAtMTYwNiw2ICsxNjA4LDEyIEBAIHN0YXRpYyBpbnQgZG9f
Y2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpj
cGMpCj4gICAgICAgICBmMmZzX3dhaXRfb25fYWxsX3BhZ2VzKHNiaSwgRjJGU19XQl9DUF9EQVRB
KTsKPiAgICAgICAgIHN0YXRfY3BfdGltZShjcGMsIENQX1RJTUVfV0FJVF9MQVNUX0NQKTsKPgo+
ICsgICAgICAgaWYgKHNiaS0+Zmx1c2hfcG9saWN5ICYgQklUKEZMVVNIX1BPTElDWV9DUF9OT19G
VUEpKSB7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IGYyZnNfZmx1c2hfZGV2aWNlX2NhY2hlKHNi
aSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIGVycjsKPiArICAgICAgIH0KSGkgQ2hhbywKc29ycnkgZm9yIGxhdGUgaW50ZXJydXB0
aW9uLgpmMmZzX2ZsdXNoX2RldmljZV9jYWNoZSBpcyBqdXN0IHVzZWQgZm9yIG11bHRpIGRldmlj
ZSBjYXNlcywgc28gdGhpcyBwYXRjaCB3aWxsCm5vdCBiZSBzdWl0YWJsZSBmb3IgYSBzaW5nbGUg
ZGV2aWNlIGlmIHRoZSB1c2VyIGNoYW5nZXMgZmx1c2hfcG9saWN5CmJ5IHN5c2ZzLCBvdGhlcndp
c2UgaXQKd2lsbCBub3QgdXNlIEZVQSB3cml0ZSB3aGVuIGNvbW1pdHRpbmcgY2hlY2twb2ludD8g
SXMgdGhpcyBleHBlY3RlZD8KVGhhbmtzIQo+ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBp
bnZhbGlkYXRlIGludGVybWVkaWF0ZSBwYWdlIGNhY2hlIGJvcnJvd2VkIGZyb20gbWV0YSBpbm9k
ZSB3aGljaCBhcmUKPiAgICAgICAgICAqIHVzZWQgZm9yIG1pZ3JhdGlvbiBvZiBlbmNyeXB0ZWQs
IHZlcml0eSBvciBjb21wcmVzc2VkIGlub2RlJ3MgYmxvY2tzLgo+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gaW5kZXggNWMwZWE2MGU1MDJlLi41YmJhMjRj
YTE1YzggMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMu
aAo+IEBAIC0xNjIxLDYgKzE2MjEsMTEgQEAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4IHsKPiAg
I2RlZmluZSBNQVhfQ09NUFJFU1NfTE9HX1NJWkUgICAgICAgICAgOAo+ICAjZGVmaW5lIE1BWF9D
T01QUkVTU19XSU5ET1dfU0laRShsb2dfc2l6ZSkgICAgICgoUEFHRV9TSVpFKSA8PCAobG9nX3Np
emUpKQo+Cj4gK2VudW0gZmx1c2hfcG9saWN5IHsKPiArICAgICAgIEZMVVNIX1BPTElDWV9DUF9O
T19GVUEsCj4gKyAgICAgICBGTFVTSF9QT0xJQ1lfTUFYLAo+ICt9Owo+ICsKPiAgc3RydWN0IGYy
ZnNfc2JfaW5mbyB7Cj4gICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOyAgICAgICAgICAg
ICAgICAgLyogcG9pbnRlciB0byBWRlMgc3VwZXIgYmxvY2sgKi8KPiAgICAgICAgIHN0cnVjdCBw
cm9jX2Rpcl9lbnRyeSAqc19wcm9jOyAgICAgICAgICAvKiBwcm9jIGVudHJ5ICovCj4gQEAgLTE4
NzMsNiArMTg3OCw4IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+ICAgICAgICAgLyogY2FydmUg
b3V0IHJlc2VydmVkX2Jsb2NrcyBmcm9tIHRvdGFsIGJsb2NrcyAqLwo+ICAgICAgICAgYm9vbCBj
YXJ2ZV9vdXQ7Cj4KPiArICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9wb2xpY3k7ICAgICAgICAg
ICAgICAvKiBmbHVzaCBwb2xpY3kgKi8KPiArCj4gICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01Q
UkVTU0lPTgo+ICAgICAgICAgc3RydWN0IGttZW1fY2FjaGUgKnBhZ2VfYXJyYXlfc2xhYjsgICAg
IC8qIHBhZ2UgYXJyYXkgZW50cnkgKi8KPiAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX2FycmF5
X3NsYWJfc2l6ZTsgICAgICAvKiBkZWZhdWx0IHBhZ2UgYXJyYXkgc2xhYiBzaXplICovCj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+IGluZGV4IGY3MzYw
NTJkZWE1MC4uYjY5MDE1ZjFkYzY3IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+ICsr
KyBiL2ZzL2YyZnMvc3lzZnMuYwo+IEBAIC04NTIsNiArODUyLDEzIEBAIHN0YXRpYyBzc2l6ZV90
IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gICAgICAgICAgICAgICAgIHJldHVy
biBjb3VudDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1l
LCAiZmx1c2hfcG9saWN5IikpIHsKPiArICAgICAgICAgICAgICAgaWYgKHQgPj0gQklUKEZMVVNI
X1BPTElDWV9NQVgpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICsgICAgICAgICAgICAgICAqdWkgPSAodW5zaWduZWQgaW50KXQ7Cj4gKyAgICAgICAgICAgICAg
IHJldHVybiBjb3VudDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBpZiAoIXN0cmNtcChhLT5h
dHRyLm5hbWUsICJnY19ib29zdF9nY19tdWx0aXBsZSIpKSB7Cj4gICAgICAgICAgICAgICAgIGlm
ICh0IDwgMSB8fCB0ID4gU0VHU19QRVJfU0VDKHNiaSkpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTExNzUsNiArMTE4Miw3IEBAIEYyRlNfU0JJX0dFTkVS
QUxfUldfQVRUUihibGt6b25lX2FsbG9jX3BvbGljeSk7Cj4gICNlbmRpZgo+ICBGMkZTX1NCSV9H
RU5FUkFMX1JXX0FUVFIoY2FydmVfb3V0KTsKPiAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKHJl
c2VydmVkX3Bpbl9zZWN0aW9uKTsKPiArRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGZsdXNoX3Bv
bGljeSk7Cj4KPiAgLyogU1RBVF9JTkZPIEFUVFIgKi8KPiAgI2lmZGVmIENPTkZJR19GMkZTX1NU
QVRfRlMKPiBAQCAtMTM3MSw2ICsxMzc5LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYy
ZnNfYXR0cnNbXSA9IHsKPiAgICAgICAgIEFUVFJfTElTVChtYXhfcmVhZF9leHRlbnRfY291bnQp
LAo+ICAgICAgICAgQVRUUl9MSVNUKGNhcnZlX291dCksCj4gICAgICAgICBBVFRSX0xJU1QocmVz
ZXJ2ZWRfcGluX3NlY3Rpb24pLAo+ICsgICAgICAgQVRUUl9MSVNUKGZsdXNoX3BvbGljeSksCj4g
ICAgICAgICBOVUxMLAo+ICB9Owo+ICBBVFRSSUJVVEVfR1JPVVBTKGYyZnMpOwo+IC0tCj4gMi40
OS4wCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
