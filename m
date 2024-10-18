Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCABE9A324A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 03:53:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1cBJ-0003H7-Jq;
	Fri, 18 Oct 2024 01:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t1cB9-0003Gs-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 01:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1zSHdJlPUbayXLLcfATCEIdb8eH6mankQ/VadBAff7g=; b=guSow4a28NWu9fgkqAZjc/hqJL
 SQawpaTJCzC6zOJPLgSkdvcLi2lcabZgTwfZJRK90EtRwINm1YMV+Ck6fS1wI/UMQZiBlCKtwv+QL
 d1YCtvXMAg9qG3znqL1dE+nRCqfqSvd4NXw0XxTxPkqm7WL470oicMbTP7KLgzCBoF+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1zSHdJlPUbayXLLcfATCEIdb8eH6mankQ/VadBAff7g=; b=Et3tuBVjgYhdzVq0R+As6UHbJD
 N+3agimLM3A2iy5Al3XlBvkKGP8Q/f1jAE2d+bdA1t/xi0/9j6eyB/SLR+uB7CW0bdDkHcWdN1J1a
 g3stm4ttpeFre6ay+mnU2c5O7BcdVJ/ziTza38rCtTJqRtRt5fiRwX+IbagjslT+kZzU=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t1cB7-00069X-IY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 01:53:22 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315855ec58so2626505e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Oct 2024 18:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729216390; x=1729821190; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zSHdJlPUbayXLLcfATCEIdb8eH6mankQ/VadBAff7g=;
 b=CIydfIRZHr9I7Q0gKl4aPvEzI6PJLQ3xcHHASGSo47JXYzuQQyjx2+NAPql5TtYD5E
 /LPVYtlnMRQHiUYCutFjirf0KON6ce5kcxhgpDAqdKCsyJggCj6Yr1PuYPyFwbnOEsdk
 MvAjYsGGkrPBzWWJnv816lgNB03UB2z5eLYM1ExKH5Jgp3XzuCQhGMG9wJdS6VhXsYhZ
 1lg8W/xrvRHM3CYrd9y/CPc0WoTHJw5B8G8Spbin8M3jKAIJ6+ebCoINITzkpwUapA/5
 LMCDFpUkvSPga0vgIjsuBHYyHcO2p9y0GK0Y9IWEdRzP4tGYgM9ksvR6iDsw25L8pMVP
 PxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729216390; x=1729821190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zSHdJlPUbayXLLcfATCEIdb8eH6mankQ/VadBAff7g=;
 b=Jdfp9cxL2J32j7mCYGvBizeZxYBVQSCDF9JPl49L+l3YFiLqeJhJNwuz7M4dn8z/Mb
 8F1V1kQwExv/A1d/wG0wMT9tV610TdplXFjaQ9Syo4SobyYZuSXnGuAANOWnZdrleoMy
 uioKhOPsdECldy500MUfTo64fNKxF5CBorShlr0LyW7mh2JeN2ZGtxWXIQBZGu0BZlfN
 tCsYm79+NoTY7c9mSw7HnquM7PewOF858+gdBL/wQf4sX5nizcQevRHt5HiDcW0kfSZO
 77Hxh4wuePfw4q9Nf1ySM3M4lq7NJmHG7U0f77hsAot66WScYY4s2LswW8mXwmBrp0aJ
 gfUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgSoj5DLY09YTh5HsGOky5RhJzwmCFgoOdrwxulWGLJIwO5FXhLneARlxy9XZOogEaYSl7a9yyNAsTf2FtH9/Y@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy19R1boFcd9dZD52WmqRVB1g19klfHC/FALdZa7nNL0O1IVyZy
 EudHWphZl6lRGEJyuHTWkMzruC4oh/dehFtK6Q26Pp7Z3mF/037Qtm8oJnGgLpxEveTiia1B18t
 AyvEoRT/B7FS2Rc5CwnVwJMK9dlk=
X-Google-Smtp-Source: AGHT+IFW22XGmxmpGx3e2cHqyt8VryX3WIKRioJuCFz5mCW9CyRfz8JruPy/YmT26mUzckqqU1NlUWv/HMqLMLId5C0=
X-Received: by 2002:a5d:6481:0:b0:37d:468c:1f38 with SMTP id
 ffacd0b85a97d-37eab715171mr258721f8f.12.1729216389794; Thu, 17 Oct 2024
 18:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241009102745.1390935-1-hanqi@vivo.com>
 <bdd890de-4794-4133-bca1-9c7e067e6e5c@kernel.org>
In-Reply-To: <bdd890de-4794-4133-bca1-9c7e067e6e5c@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 18 Oct 2024 09:52:58 +0800
Message-ID: <CAHJ8P3KhfuCSNwyc16QYQQYMNzjVKc4ey5CTZ2XK4893aW4mCQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2024年10月17日周四 17:57写道：
    > > On 2024/10/9 18:27, Qi Han wrote: > > When the free segment is used up
    during CP disable, many write or > > ioctl operation [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.47 listed in list.dnswl.org]
 -1.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t1cB7-00069X-IY
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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
Cc: jaegeuk@kernel.org, Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjTlubQxMOaciDE35pel5ZGo5ZubIDE3OjU35YaZ6YGT77yaCj4K
PiBPbiAyMDI0LzEwLzkgMTg6MjcsIFFpIEhhbiB3cm90ZToKPiA+IFdoZW4gdGhlIGZyZWUgc2Vn
bWVudCBpcyB1c2VkIHVwIGR1cmluZyBDUCBkaXNhYmxlLCBtYW55IHdyaXRlIG9yCj4gPiBpb2N0
bCBvcGVyYXRpb25zIHdpbGwgZ2V0IEVOT1NQQyBlcnJvciBjb2RlcywgZXZlbiBpZiB0aGVyZSBh
cmUKPiA+IHN0aWxsIG1hbnkgYmxvY2tzIGF2YWlsYWJsZS4gV2UgY2FuIHJlcHJvZHVjZSBpdCBp
biB0aGUgZm9sbG93aW5nCj4gPiBzdGVwczoKPiA+Cj4gPiBkZCBpZj0vZGV2L3plcm8gb2Y9ZjJm
cy5pbWcgYnM9MU0gY291bnQ9NTUKPiA+IG1rZnMuZjJmcyAtZiBmMmZzLmltZwo+ID4gbW91bnQg
ZjJmcy5pbWcgZjJmc19kaXIgLW8gY2hlY2twb2ludD1kaXNhYmxlOjEwJQo+ID4gY2QgZjJmc19k
aXIKPiA+IGRkIGlmPS9kZXYvemVybyBvZj1iaWdmaWxlIGJzPTFNIGNvdW50PTUwCj4gPiBzeW5j
Cj4gPiBybSBiaWdmaWxlCj4gPiBpPTE7IHdoaWxlIFtbICRpIC1sdCAxMDAwMDAwMCBdXTsgZG8g
KGZpbGVfbmFtZT0uL2ZpbGUkaTsgZGQgXAo+ID4gaWY9L2Rldi9yYW5kb20gb2Y9JGZpbGVfbmFt
ZSBicz0xTSBjb3VudD0wKTsgaT0kKChpKzEpKTsgZG9uZQo+ID4gc3RhdCAtZiAuLwo+ID4KPiA+
IEluIGYyZnNfbmVlZF9TU1IoKSBmdW5jdGlvbiwgaXQgaXMgYWxsb3dlZCB0byB1c2UgU1NSIHRv
IGFsbG9jYXRlCj4gPiBibG9ja3Mgd2hlbiBDUCBpcyBkaXNhYmxlZCwgc28gaW4gZjJmc19pc19j
aGVja3BvaW50X3JlYWR5IGZ1bmN0aW9uLApIaSBDaGFvIGFuZCBRaSwKYmFzZWQgb24gdGhpcyBj
b21tZW50ICBhbmQgY29kZXMsIEkgaGF2ZSBzb21lIGRvdWJ0czoKdW51c2FibGUgYmxvY2tzIGFy
ZSBjYWxjdWxhdGVkICBmcm9tICBpbnZhbGlkIGJsb2NrcyBvZiBEaXJ0eSBzZWdtZW50CmluIGYy
ZnNfZ2V0X3Vuc3VhYmxlX2Jsb2NrcyB0aGVuIG1pbnVzIG92cF9ob2xlLApidXQgU1NSIGlzIGFs
bG93ZWQgd2hlbiB0aGUgY2hlY2twb2ludCBpcyBkaXNhYmxlZC4KU28gYWN0dWFsbHkgU1NSIGNh
biBub3QgdXNlIG1vc3QgaW52YWxpZCBibG9ja3Mgb2YgRGlydHkgc2VnbWVudHM/CklzIHRoaXMg
YSBjb250cmFkaWN0aW9uPwpUaGFua3MhCgo+ID4gY2FuIHdlIGp1ZGdlIHRoZSBudW1iZXIgb2Yg
aW52YWxpZCBibG9ja3Mgd2hlbiBmcmVlIHNlZ21lbnQgaXMgbm90Cj4gPiBlbm91Z2gsIGFuZCBy
ZXR1cm4gRU5PU1BDIG9ubHkgaWYgdGhlIG51bWJlciBvZiBpbnZhbGlkIGJsb2NrcyBpcwo+ID4g
YWxzbyBub3QgZW5vdWdoPwo+Cj4gQ2FuIHlvdSBwbGVhc2UgdHJ5IGJlbG93IHBhdGNoPwo+Cj4g
IEZyb20gMzhiN2M5N2RjYzU1YmE4M2RlNDIyMGMzZGM1NGMyZWI2NjE0OGRkNSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gRGF0ZTog
VGh1LCAxNyBPY3QgMjAyNCAxNzowNzowNSArMDgwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZjJmczog
cmV2YWxpZGF0ZSBlbXB0eSBzZWdtZW50IHdoZW4gY2hlY2twb2ludCBpcyBkaXNhYmxlZAo+Cj4g
SWYgY2hlY2twb2ludCBpcyBvZmYsIGxldCdzIHNldCBzZWdtZW50IGFzIGZyZWUgb25jZSBhbGwg
bmV3bHkKPiB3cml0dGVuIGRhdGFzIHdlcmUgcmVtb3ZlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTMg
KysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gaW5kZXggZjhkNmU2MDFlMDg0Li45YmFkMTNkNzBhZmIgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IEBAIC04NTMsNiAr
ODUzLDE3IEBAIHN0YXRpYyB2b2lkIGxvY2F0ZV9kaXJ0eV9zZWdtZW50KHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgdW5zaWduZWQgaW50IHNlZ25vKQo+ICAgICAgICAgdmFsaWRfYmxvY2tzID0g
Z2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCBmYWxzZSk7Cj4gICAgICAgICBja3B0X3ZhbGlk
X2Jsb2NrcyA9IGdldF9ja3B0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCBmYWxzZSk7Cj4KPiAr
ICAgICAgIC8qCj4gKyAgICAgICAgKiBJZiBjaGVja3BvaW50IGlzIG9mZiwgbGV0J3Mgc2V0IHNl
Z21lbnQgYXMgZnJlZSBvbmNlIGFsbCBuZXdseQo+ICsgICAgICAgICogd3JpdHRlbiBkYXRhcyB3
ZXJlIHJlbW92ZWQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChpc19zYmlfZmxhZ19zZXQo
c2JpLCBTQklfQ1BfRElTQUJMRUQpICYmCj4gKyAgICAgICAgICAgICAgIHZhbGlkX2Jsb2NrcyA9
PSAwICYmIGNrcHRfdmFsaWRfYmxvY2tzID09IDApIHsKPiArICAgICAgICAgICAgICAgX19yZW1v
dmVfZGlydHlfc2VnbWVudChzYmksIHNlZ25vLCBESVJUWSk7Cj4gKyAgICAgICAgICAgICAgIF9f
c2V0X3Rlc3RfYW5kX2ZyZWUoc2JpLCBzZWdubywgZmFsc2UpOwo+ICsgICAgICAgICAgICAgICBn
b3RvIG91dF9sb2NrOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIGlmICh2YWxpZF9ibG9ja3Mg
PT0gMCAmJiAoIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkgfHwKPiAgICAg
ICAgICAgICAgICAgY2twdF92YWxpZF9ibG9ja3MgPT0gdXNhYmxlX2Jsb2NrcykpIHsKPiAgICAg
ICAgICAgICAgICAgX19sb2NhdGVfZGlydHlfc2VnbWVudChzYmksIHNlZ25vLCBQUkUpOwo+IEBA
IC04NjMsNyArODc0LDcgQEAgc3RhdGljIHZvaWQgbG9jYXRlX2RpcnR5X3NlZ21lbnQoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgc2Vnbm8pCj4gICAgICAgICAgICAgICAg
IC8qIFJlY292ZXJ5IHJvdXRpbmUgd2l0aCBTU1IgbmVlZHMgdGhpcyAqLwo+ICAgICAgICAgICAg
ICAgICBfX3JlbW92ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vnbm8sIERJUlRZKTsKPiAgICAgICAg
IH0KPiAtCj4gK291dF9sb2NrOgo+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZkaXJ0eV9pLT5zZWds
aXN0X2xvY2spOwo+ICAgfQo+Cj4gLS0KPiAyLjQwLjEKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFFpIEhhbiA8aGFucWlAdml2by5jb20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9zZWdtZW50Lmgg
fCAyMSArKysrKysrKysrKysrKysrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZz
L3NlZ21lbnQuaAo+ID4gaW5kZXggNzFhZGI0YTQzYmVjLi45YmYwY2YzYTZhMzEgMTAwNjQ0Cj4g
PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmgKPiA+
IEBAIC02MzcsMTIgKzYzNywzMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2Vub3VnaF9mcmVl
X3NlY3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgcmV0dXJuICFoYXNfbm90
X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCBmcmVlZCwgbmVlZGVkKTsKPiA+ICAgfQo+ID4KPiA+ICtz
dGF0aWMgaW5saW5lIGJvb2wgaGFzX2Vub3VnaF9hdmFpbGFibGVfYmxvY2tzKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKPiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgdG90YWxfZnJlZV9i
bG9ja3MgPSBzYmktPnVzZXJfYmxvY2tfY291bnQgLQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2YWxpZF91c2VyX2Jsb2NrcyhzYmkpIC0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsK
PiA+ICsKPiA+ICsgICAgIGlmICh0b3RhbF9mcmVlX2Jsb2NrcyA8PSBzYmktPnVudXNhYmxlX2Js
b2NrX2NvdW50KQo+ID4gKyAgICAgICAgICAgICB0b3RhbF9mcmVlX2Jsb2NrcyA9IDA7Cj4gPiAr
ICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHRvdGFsX2ZyZWVfYmxvY2tzIC09IHNiaS0+dW51
c2FibGVfYmxvY2tfY291bnQ7Cj4gPiArCj4gPiArICAgICBpZiAodG90YWxfZnJlZV9ibG9ja3Mg
PiBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzKQo+ID4gKyAgICAgICAgICAg
ICB0b3RhbF9mcmVlX2Jsb2NrcyAtPSBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxv
Y2tzOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICB0b3RhbF9mcmVlX2Jsb2NrcyA9
IDA7Cj4gPiArCj4gPiArICAgICByZXR1cm4gKHRvdGFsX2ZyZWVfYmxvY2tzID4gMCkgPyB0cnVl
IDogZmFsc2U7Cj4gPiArfQo+ID4gKwo+ID4gICBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19pc19j
aGVja3BvaW50X3JlYWR5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ICAgewo+ID4gICAg
ICAgaWYgKGxpa2VseSghaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKSkpCj4g
PiAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICAgaWYgKGxpa2VseShoYXNfZW5v
dWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
Cj4gPiArICAgICBpZiAobGlrZWx5KGhhc19lbm91Z2hfYXZhaWxhYmxlX2Jsb2NrcyhzYmkpKSkK
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiAgICAgICByZXR1cm4gZmFsc2U7Cj4g
PiAgIH0KPiA+Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
