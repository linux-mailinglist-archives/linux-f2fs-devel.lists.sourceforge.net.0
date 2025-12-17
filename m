Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA9CC5B97
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 02:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRSFeTXcvwRuxSZPgqVeLEQBBgT7zwV+33iXN47lq5U=; b=I9VGZixEpEzhl281wenSu+yhH9
	Dxo9eUuWVs0S/e8Vvyg359KVz0H8H2/Z6hgBRA76lf+y+FAmEfC+jzc5ZXH0QfLNcrUUfzp+mdMwF
	sIBf7E7/v0+XsZYAocT5VwqMXknrmt7n93v4b6aF+7+DXBiyZWzD5UUAZ7fXKCHEiywU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVgd6-000655-2a;
	Wed, 17 Dec 2025 01:47:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1vVgd5-00064z-Cm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 01:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsJDqCxm+aiIlOu2N1kWyvb7DWb15dJZBscRrlrJsMM=; b=Zp57rdQRtVLbrnqxIdDIZhImJm
 D3YSHaF2yb/Bm05pflzv/oV6qv/gmL+wdruVqbnBK1WBPKuVVAkXsGn219CFm057ul4wcAvxig3mG
 cE/5BNT9kUgK2J4SoutWlLo9vyb3ffATR3gCPi9YnedyHG4lBpxZViro3506MznW1n0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vsJDqCxm+aiIlOu2N1kWyvb7DWb15dJZBscRrlrJsMM=; b=GMm6Za40aGHsbFqFWtpKaIeLEx
 W9o1dGXnSO2LObdQZ53HvS30uFV3IA0sgrTqfjgU9iYH/kApFNrLf3RsE4HDYMGQBDnP6vrY4LMUX
 yLg0Hp8hrlb8yKYrRwdeFHuKLAbS+YWZ1hYzRPzrklRwzJKmamE+HA5ycy0zfwJyLjdM=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vVgd4-0002RH-SA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 01:47:03 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477985aea2bso5288855e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765936016; x=1766540816; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsJDqCxm+aiIlOu2N1kWyvb7DWb15dJZBscRrlrJsMM=;
 b=feihseO9UmhbCbvkwQmoWeW/bZbyX7F+krYu9++QboT0rDudroSHfO9OqNLUp/Z7mb
 IvhHQGJDkIojvMAmT2AIIhM54ZB6UlVZgoNzTO6YG5yOj/0MmQ2AZDC9/uUKH93GQPtG
 gpXdmXSjeuiIBDSedYlajur/Hk+qdPuC7+7IzzH8WncN8KlcbEUVlPGwtWLSG4p/n+/z
 +lAvB0nwPfAweq3jf8wS0LvCyU+DX8gBkpQArZVCBVo31I4wdvYUYTl4b2M8lymHyrj8
 JJ4842BEX3tTDvfgriWmnbFIiZ/6yghv3Ue/wuiMSm/rvbCerV02gstHl0dg63ONytfl
 W4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765936016; x=1766540816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vsJDqCxm+aiIlOu2N1kWyvb7DWb15dJZBscRrlrJsMM=;
 b=TIbxthw/R3j0PFjWIhlHE82BEGhlqVa0r5gcZMpH0MqZ9gAW/Tkngyrl1v3JghTmcc
 JWraKBuGjoytoxdQx28aG6a7vxTdvWnFNbJ3L2ApnyJxgd+AUiwXM2NzQDDMxTDCE+Km
 Y/E+r3oZ0QZp9CvHs04t7oIGfVinqymfn6xDsCZ+nXS9YKNljieCaHZINtOAd4t4XqDn
 SyLSn06Xr7Erc6WBvNxJx6k9T5g0DI9lwIYnDDbAeC7QvJWst2Hyds1LLfGyvyvv16aP
 8rC36MmpSBq8gT9QskgfmtME7t2MvDVdpfa9t/+OCO2FljJ4GzE8tvEDx21jK/5SDFax
 3qew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Q9dUBRDPI9+vOAMb7z1jeejTOua8q145lF3GlYh4JNJ7dRgEwgdHwC8un/a1J6eXPVnhH4cacUsKAqDJLR/P@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwmQRD43xqMWC4P8BJy8Gm0y7N6gu67zxoYdR0aZVK7v8cdHH4e
 nlReDQNQ9q0eBaNjetKlwtwxgUBuKII8EaVmozczVsLfEzeYFnBevEZjN+d48ujIwovV5n24jRO
 Zl9QDbifx21ogzG+3mE6u2j0ChWLSIvc=
X-Gm-Gg: AY/fxX4DNPobt+WweimIyON9DFOpPaStO6rz5+mDun1pqgNV5lf1gk22T2I46fM0Zdd
 iCJTbtJW2H/N90oq9ZYs1g8Bp5g2oMXSQAC+D2YZ5dktmiHh/3mos9OH34P0kKDkYZ6TfTS6fnM
 xRmGO3WWo6n9ZoIKhRbhm5khGurlRfvYDN55hGB/B2KQCUzXV1tjaUcf/euRS2g4K54dnOpzz23
 CQhYbTTXsLSRMfbXSfDMkX29nOQJtcYhusHsyK/ktr4KCGFGop2dBU1T8WxKgvCsStWWY8f
X-Google-Smtp-Source: AGHT+IFOSGFn1VDSxOekPwyngJMFVIzy/lw6WIUWZwHVI12LPbGdkjwEA//2+W48ZoXNk5wbZl3fzBl/5zD9/MsLW5c=
X-Received: by 2002:a05:600c:8115:b0:468:7a5a:14cc with SMTP id
 5b1f17b1804b1-47a8f904148mr98988345e9.3.1765936016086; Tue, 16 Dec 2025
 17:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20251215122830.3495475-1-chao@kernel.org>
 <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
 <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
In-Reply-To: <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 17 Dec 2025 09:46:44 +0800
X-Gm-Features: AQt7F2o_LfYep-NrbjQBQ7lTpSnN6RcAbWRwHptpHm_HMOOfKm2zbiTDwlyCs78
Message-ID: <CAHJ8P3JGz89k9XSjkZquZGgXdXOtWMymG34u9rqR7muAzBSUNA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年12月16日周二 16:49写道： > > On 12/16/25
    09:36, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2025年12月15日周一
    20:34写道： > >> > >> In order to avoi [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [209.85.128.51 listed in list.dnswl.org]
X-Headers-End: 1vVgd4-0002RH-SA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid
 in f2fs_get_node_info()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0MTLmnIgxNuaXpeWRqOS6jCAxNjo0
OeWGmemBk++8mgo+Cj4gT24gMTIvMTYvMjUgMDk6MzYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldD4KPiA+IOS6jjIwMjXlubQxMuaciDE15pel5ZGo5LiAIDIwOjM05YaZ6YGT77ya
Cj4gPj4KPiA+PiBJbiBvcmRlciB0byBhdm9pZCBsb2FkaW5nIGNvcnJ1cHRlZCBuYXQgZW50cnkg
ZnJvbSBkaXNrLgo+ID4+Cj4gPj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gPj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICBmcy9mMmZzL25v
ZGUuYyB8IDkgKysrKystLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9m
cy9mMmZzL25vZGUuYwo+ID4+IGluZGV4IGNlNDcxZTAzMzc3NC4uMTNjODhkZmQ3OTBkIDEwMDY0
NAo+ID4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4gPj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPiA+
PiBAQCAtNjMwLDE0ICs2MzAsMTUgQEAgaW50IGYyZnNfZ2V0X25vZGVfaW5mbyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIG5pZF90IG5pZCwKPiA+PiAgICAgICAgIG5vZGVfaW5mb19mcm9tX3Jh
d19uYXQobmksICZuZSk7Cj4gPj4gICAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7
Cj4gPj4gIHNhbml0eV9jaGVjazoKPiA+PiAtICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihuaS0+YmxrX2FkZHIpICYmCj4gPj4gKyAgICAgICBpZiAodW5saWtlbHkobmktPm5pZCAh
PSBuaWQgfHwKPiA+IEhpIENoYW8sCj4gPiAobmktPm5pZD09bmlkKSBzaG91bGQgYmUgYWx3YXlz
IHRydWU/IGJlY2F1c2UgdGhlIGNvZGU6Cj4gPgo+ID4gbmktPmZsYWcgPSAwOwo+ID4gbmktPm5p
ZCA9IG5pZDsKPiA+IHJldHJ5Ogo+ID4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPgo+IFpo
aWd1bywKPgo+IE9oLCBJIG1heSBtaXNzZWQgc29tZXRoaW5nLCBsZXQncyBpZ25vcmUgdGhpcyBw
YXRjaC4KPgo+ID4KPiA+PiArICAgICAgICAgICAgICAgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRy
KG5pLT5ibGtfYWRkcikgJiYKPiA+IGJ0dywgSXMgaXQgcG9zc2libGUgdG8gZGV0ZWN0IHRoYXQg
c29tZSB2YWxpZCBOaWQgZW50cmllcyBjb250YWluCj4gPiBpbmNvcnJlY3QgY29udGVudD8KPiA+
IHN1Y2ggYXMgIGluby9ibG9ja19hZGRyPU5VTExfQUREUiBpbiBuaWQ9NCBlbnRyeT8KPgo+IFNv
bWV0aGluZyBsaWtlIHRoaXM/Cj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9m
MmZzL2YyZnMuaAo+IGluZGV4IDY1Y2ExYTVlYWE4OC4uYzQ1OGRmOTJiYjBkIDEwMDY0NAo+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtNDkyOCwxNiAr
NDkyOCwxNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfam91cm5hbGxlZF9xdW90YShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gIH0KPgo+IC1zdGF0
aWMgaW5saW5lIGJvb2wgZjJmc19xdW90YV9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBmMmZzX3F1b3RhX2ZpbGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBuaWRfdCBpbm8pCj4gIHsKPiAgI2lmZGVmIENPTkZJR19RVU9UQQo+ICAgICAgICAgaW50IGk7
Cj4KPiAtICAgICAgIGlmICghZjJmc19zYl9oYXNfcXVvdGFfaW5vKEYyRlNfSV9TQihpbm9kZSkp
KQo+ICsgICAgICAgaWYgKCFmMmZzX3NiX2hhc19xdW90YV9pbm8oc2JpKSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYUVVPVEFT
OyBpKyspIHsKPiAtICAgICAgICAgICAgICAgaWYgKGYyZnNfcWZfaW5vKEYyRlNfSV9TQihpbm9k
ZSktPnNiLCBpKSA9PSBpbm9kZS0+aV9pbm8pCj4gKyAgICAgICAgICAgICAgIGlmIChmMmZzX3Fm
X2lubyhzYmktPnNiLCBpKSA9PSBpbm8pCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHRydWU7Cj4gICAgICAgICB9Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lub2Rl
LmMgYi9mcy9mMmZzL2lub2RlLmMKPiBpbmRleCA5MjFmYjAyYzBmNDkuLmQxMjcwYjI1YWQ3ZCAx
MDA2NDQKPiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPiArKysgYi9mcy9mMmZzL2lub2RlLmMKPiBA
QCAtNjIxLDcgKzYyMSw3IEBAIG1ha2Vfbm93Ogo+ICAgICAgICAgICAgICAgICBpbm9kZS0+aV9m
b3AgPSAmZjJmc19maWxlX29wZXJhdGlvbnM7Cj4gICAgICAgICAgICAgICAgIGlub2RlLT5pX21h
cHBpbmctPmFfb3BzID0gJmYyZnNfZGJsb2NrX2FvcHM7Cj4gICAgICAgICAgICAgICAgIGlmIChJ
U19JTU1VVEFCTEUoaW5vZGUpICYmICFmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkgJiYKPiAt
ICAgICAgICAgICAgICAgICAgICFmMmZzX3F1b3RhX2ZpbGUoaW5vZGUpKQo+ICsgICAgICAgICAg
ICAgICAgICAgIWYyZnNfcXVvdGFfZmlsZShzYmksIGlub2RlLT5pX2lubykpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgbWFwcGluZ19zZXRfZm9saW9fbWluX29yZGVyKGlub2RlLT5pX21hcHBp
bmcsIDApOwo+ICAgICAgICAgfSBlbHNlIGlmIChTX0lTRElSKGlub2RlLT5pX21vZGUpKSB7Cj4g
ICAgICAgICAgICAgICAgIGlub2RlLT5pX29wID0gJmYyZnNfZGlyX2lub2RlX29wZXJhdGlvbnM7
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPiBpbmRleCA3
ZmVlYWQ1OTViYTUuLjEwNDQ4ZTExNWVhMCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+
ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4gQEAgLTY0Myw2ICs2NDMsMTcgQEAgc2FuaXR5X2NoZWNr
Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVGU0NPUlJVUFRFRDsKPiAgICAgICAgIH0KPgpI
aSBDaGFvCj4gKyAgICAgICBpZiAodW5saWtlbHkoZjJmc19xdW90YV9maWxlKHNiaSwgbmktPm5p
ZCkgJiYKPiArICAgICAgICAgICAgICAgX19pc192YWxpZF9kYXRhX2Jsa2FkZHIobmktPmJsa19h
ZGRyKSkpIHsKIF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKG5pLT5ibGtfYWRkcikgLS0+ICEKX19p
c192YWxpZF9kYXRhX2Jsa2FkZHIobmktPmJsa19hZGRyKT8/Cj4gKyAgICAgICAgICAgICAgIHNl
dF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+ICsgICAgICAgICAgICAgICBmMmZzX2Vy
cl9yYXRlbGltaXRlZChzYmksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgImYyZnNfZ2V0X25v
ZGVfaW5mbyBvZiAlcFM6IGluY29uc2lzdGVudCBuYXQgZW50cnkgZnJvbSBxZl9pbm8sICIKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUsIGJsa2FkZHI6JXUsIHZlcjol
dSwgZmxhZzoldSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19idWlsdGluX3JldHVybl9h
ZGRyZXNzKDApLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5pLT5pbm8sIG5pLT5uaWQsIG5p
LT5ibGtfYWRkciwgbmktPnZlcnNpb24sIG5pLT5mbGFnKTsKPiArICAgICAgICAgICAgICAgZjJm
c19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPiArICAgICAgIH0K
PiArCkkgdGhpbmsgdGhpcyBpcyBvayBmb3IgcXVvdGEgZmlsZSwKYW5kIFRoaXMgaXMgbm90IGVh
c3kgdG8gYXBwbHkgdG8gYWxsIGNvbW1vbiBjYXNlcyggbmlkIGVudHJ5IG5vdCBvbmx5CmZvciBx
dW90YSksIHJpZ2h0PyBeXgpUaGFua3MhCj4gICAgICAgICAvKiBjYWNoZSBuYXQgZW50cnkgKi8K
PiAgICAgICAgIGlmIChuZWVkX2NhY2hlKQo+ICAgICAgICAgICAgICAgICBjYWNoZV9uYXRfZW50
cnkoc2JpLCBuaWQsICZuZSk7Cj4KPiBUaGFua3MsCj4KPiA+IFRoYW5rcwo+ID4+ICAgICAgICAg
ICAgICAgICAhZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgbmktPmJsa19hZGRyLAo+ID4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5D
RSkpIHsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9H
RU5FUklDX0VOSEFOQ0UpKSkpIHsKPiA+PiAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNi
aSwgU0JJX05FRURfRlNDSyk7Cj4gPj4gICAgICAgICAgICAgICAgIGYyZnNfZXJyX3JhdGVsaW1p
dGVkKHNiaSwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9kZV9pbmZv
IG9mICVwUzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSwgIgo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICJmMmZzX2dldF9ub2RlX2luZm8gb2YgJXBTOiBuaWQ6JXUsIGluY29uc2lzdGVudCBu
YXQgZW50cnksICIKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUs
IGJsa2FkZHI6JXUsIHZlcjoldSwgZmxhZzoldSIsCj4gPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLAo+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSwgbmlkLAo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIG5pLT5pbm8sIG5pLT5uaWQsIG5pLT5ibGtfYWRkciwgbmktPnZlcnNpb24sIG5p
LT5mbGFnKTsKPiA+PiAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJP
Ul9JTkNPTlNJU1RFTlRfTkFUKTsKPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRlNDT1JS
VVBURUQ7Cj4gPj4gLS0KPiA+PiAyLjQ5LjAKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiA+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
