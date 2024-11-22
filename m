Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0D9D5915
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2024 06:24:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEM9F-0003vk-De;
	Fri, 22 Nov 2024 05:24:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tEM9D-0003vb-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 05:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qvfIu7WCtHFH+dZSegvvY/gAEu78tDcDOUONYuh+hwM=; b=ddHWI0jiGfTL746cOIkB76oiW8
 I2Hs6hNsioJUWxW3TMIwJpZ4E9JYfFApBLBpMv2jW7u/GlU31e/NIj95Py3Fr6dmDxAgyoFQEpnBA
 ypGnjSbYsRF2nwjvgtULUhAmcgPdhFNVNbCAYaDrr1Ol9wCzOHt7v9N4HLL3eqfG+Fvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qvfIu7WCtHFH+dZSegvvY/gAEu78tDcDOUONYuh+hwM=; b=DvSNrLXRJB0iyiuSIwIAajGVe7
 iLc60bBHnA3or3DtY1wKW2VqZES4+FRX2ldpJVzpJgKCfMFwgW7/d/Cgti5+7L9ThGXL/QAFAFCF7
 QKGt3YTOmXo0OHmGFaWqEUNusFRmv/seLPSh98/PrCCylVJf8MtEkxbBWr31w/HzF//k=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tEM9D-0002Ee-4a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 05:24:03 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-382611d2631so42253f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 21:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732253031; x=1732857831; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvfIu7WCtHFH+dZSegvvY/gAEu78tDcDOUONYuh+hwM=;
 b=Cccol6s32T0qUNkQgEOWyEYRRgr/agBZdQf+/Qh5kvlE19gc4Jj819XSnsA2iaLLw6
 0Ioi+rS8tyEl1tasVLP6QDE4Sm8930vAaSmagtS187hOyOW12rmG66qz8EiEyl6L+b7J
 JNxlwdKfbUiBb7xa12HwY1OIc6FsZRnyLYTO7P7JNAaA8fHs4lyt6T6H8ntPtR2G1KlN
 VRo5b2KKKhQZOh/UT0IRJUZbZ3Kic8EBRu0yYc0El3PUExFl5yge/YQpWxUVYODkKcns
 PhpVw6w/TvTLsrme8giIsJELhMblrK73W1UI/SS4QVK9JEcZg24qEViUUemrSDXWIjuU
 xtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732253031; x=1732857831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvfIu7WCtHFH+dZSegvvY/gAEu78tDcDOUONYuh+hwM=;
 b=OdSHafIAh3ujpRj7YvSXzcTQNdL8wRikXb+u/szjNqzDFsiYamN85dO5QHDrxYzl5Q
 RVmjTSPZgeWC4Svf2nFJkCwrUzaFOKnu4mbRpte7Nq0Pf3mSP4hhZFlFF5n773TVtsp2
 LbT9mdBsp4DJIKGFY+CkkSSlDcTU7qONkYr2Dfy4QWslAY7vB7REY/FTpKOqMfpzyPyR
 ATs7wR+mDOhwdhjPMBrSUa0WwHc30ipvKlb1CMan898dHJsGxqtWJPrLkXVGuU60L8pq
 xuWDu3Ik7l05DnLTbfHT5kRkevYPiUCkjR8Bjd8oEKF7CPDx4fSj/qE+yy2RWpmntPp3
 3zRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL1d/Bms7sw6YmzPdXaAk6GE3kcqk7QknPG8dVHr+LTgIVthoblHtkmn7L0b/gkOyqVtCTqgb8BQC3R7CN2rGO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRfSg4djbLl359Im04yqREJfjrHNxnp5jbUX0N+S8V7KvJns/M
 0r9HyW84h6AIwqDhW/iR7Y3JINR9Ii+uzHk20KR0Gig65NMXeJXbCyx7qvwzUMLI6U4mB11GMIh
 lEXE6xH3e0yApETPG0tijGxbsql0=
X-Gm-Gg: ASbGncuvpmEtVf5AJlr7WedrIyyWbY2jNcQ97aEi/zAaTdeEp6p8O7g2G/Le7g7wkVd
 WLFZLA1Jny5buZz4PUoZhxZyVK+sC2yi1
X-Google-Smtp-Source: AGHT+IGmsZDvHCeNOpFAyh8dXH/iftRhZDVahZGx26C3AAewoLSLqv7b6VUTiVcbMnYVTwiVOb1pReSfgHbcijcVDIU=
X-Received: by 2002:a5d:47c7:0:b0:382:51bf:b0ec with SMTP id
 ffacd0b85a97d-3826089bf40mr399724f8f.0.1732253031178; Thu, 21 Nov 2024
 21:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20241121015751.2300234-1-chao@kernel.org>
 <20241121015751.2300234-2-chao@kernel.org>
In-Reply-To: <20241121015751.2300234-2-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 22 Nov 2024 13:23:39 +0800
Message-ID: <CAHJ8P3LhPzmzf-tgiwSh+a+W+EC7pFE9+=RqkHL1543cHMag2w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2024年11月21日周四 10:01写道：
    > > Quoted: > "at this time, there are still 1086911 extent nodes in this
    zombie > extent tree that need to be cleaned up. > > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.47 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.47 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.47 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tEM9D-0002Ee-4a
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs node to limit max read
 extent count per-inode
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjTlubQxMeaciDIx5pel5ZGo5ZubIDEwOjAx5YaZ6YGT77yaCj4K
PiBRdW90ZWQ6Cj4gImF0IHRoaXMgdGltZSwgdGhlcmUgYXJlIHN0aWxsIDEwODY5MTEgZXh0ZW50
IG5vZGVzIGluIHRoaXMgem9tYmllCj4gZXh0ZW50IHRyZWUgdGhhdCBuZWVkIHRvIGJlIGNsZWFu
ZWQgdXAuCj4KPiBjcmFzaF9hcm02NF9zcHJkX3Y4LjAuMysrPiBleHRlbnRfdHJlZS5ub2RlX2Nu
dCBmZmZmZmY4MDg5NmNjNTAwCj4gICBub2RlX2NudCA9IHsKPiAgICAgY291bnRlciA9IDEwODY5
MTEKPiAgIH0sCj4gIgo+Cj4gQXMgcmVwb3J0ZWQgYnkgWGl1aG9uZywgdGhlcmUgd2lsbCBiZSBh
IGh1Z2UgbnVtYmVyIG9mIGV4dGVudCBub2Rlcwo+IGluIGV4dGVudCB0cmVlLCBpdCBtYXkgcG90
ZW50aWFsbHkgY2F1c2U6Cj4gLSBzbGFiIG1lbW9yeSBmcmFnbWVudHMKPiAtIGV4dHJlbWUgbG9u
ZyB0aW1lIHNocmluayBvbiBleHRlbnQgdHJlZQo+IC0gbG93IG1hcHBpbmcgZWZmaWNpZW5jeQo+
Cj4gTGV0J3MgYWRkIGEgc3lzZnMgbm9kZSB0byBsaW1pdCBtYXggcmVhZCBleHRlbnQgY291bnQg
Zm9yIGVhY2ggaW5vZGUsCj4gYnkgZGVmYXVsdCwgdmFsdWUgb2YgdGhpcyB0aHJlc2hvbGQgaXMg
MTAyNDAsIGl0IGNhbiBiZSB1cGRhdGVkCj4gYWNjb3JkaW5nIHRvIHVzZXIncyByZXF1aXJlbWVu
dC4KPgo+IFJlcG9ydGVkLWJ5OiBYaXVob25nIFdhbmcgPHhpdWhvbmcud2FuZ0B1bmlzb2MuY29t
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0
MTExMjExMDYyNy4xMzE0NjMyLTEteGl1aG9uZy53YW5nQHVuaXNvYy5jb20vCj4gU2lnbmVkLW9m
Zi1ieTogWGl1aG9uZyBXYW5nIDx4aXVob25nLndhbmdAdW5pc29jLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0
aW5nL3N5c2ZzLWZzLWYyZnMgfCA2ICsrKysrKwo+ICBmcy9mMmZzL2V4dGVudF9jYWNoZS5jICAg
ICAgICAgICAgICAgICAgfCA1ICsrKystCj4gIGZzL2YyZnMvZjJmcy5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKysrKwo+ICBmcy9mMmZzL3N5c2ZzLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA3ICsrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4g
aW5kZXggNTEzMjk2YmI2ZjI5Li4zZTE2MzBjNzBkOGEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gQEAgLTgyMiwzICs4MjIsOSBAQCBEZXNjcmlwdGlvbjog
ICAgICAgIEl0IGNvbnRyb2xzIHRoZSB2YWxpZCBibG9jayByYXRpbyB0aHJlc2hvbGQgbm90IHRv
IHRyaWdnZXIgZXhjZXNzaXYKPiAgICAgICAgICAgICAgICAgZm9yIHpvbmVkIGRlaXZjZXMuIFRo
ZSBpbml0aWFsIHZhbHVlIG9mIGl0IGlzIDk1KCUpLiBGMkZTIHdpbGwgc3RvcCB0aGUKPiAgICAg
ICAgICAgICAgICAgYmFja2dyb3VuZCBHQyB0aHJlYWQgZnJvbSBpbnRpYXRpbmcgR0MgZm9yIHNl
Y3Rpb25zIGhhdmluZyB2YWxpZCBibG9ja3MKPiAgICAgICAgICAgICAgICAgZXhjZWVkaW5nIHRo
ZSByYXRpby4KPiArCj4gK1doYXQ6ICAgICAgICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vbWF4X3Jl
YWRfZXh0ZW50X2NvdW50Cj4gK0RhdGU6ICAgICAgICAgIE5vdmVtYmVyIDIwMjQKPiArQ29udGFj
dDogICAgICAgIkNoYW8gWXUiIDxjaGFvQGtlcm5lbC5vcmc+Cj4gK0Rlc2NyaXB0aW9uOiAgIEl0
IGNvbnRyb2xzIG1heCByZWFkIGV4dGVudCBjb3VudCBmb3IgcGVyLWlub2RlLCB0aGUgdmFsdWUg
b2YgdGhyZXNob2xkCj4gKyAgICAgICAgICAgICAgIGlzIDEwMjQwIGJ5IGRlZmF1bHQuCj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5j
Cj4gaW5kZXggYjdhNjgxN2I0NGIwLi4zNDdiM2I2NDc4MzQgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJm
cy9leHRlbnRfY2FjaGUuYwo+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiBAQCAtNzE3
LDcgKzcxNyw5IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4gICAgICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICBp
ZiAoZW5kIDwgb3JnX2VuZCAmJiAodHlwZSAhPSBFWF9SRUFEIHx8Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvcmdfZW5kIC0gZW5kID49IEYyRlNfTUlOX0VYVEVOVF9MRU4pKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgKG9yZ19lbmQgLSBlbmQgPj0gRjJGU19NSU5fRVhU
RU5UX0xFTiAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGF0b21pY19yZWFkKCZldC0+bm9k
ZV9jbnQpIDwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5t
YXhfcmVhZF9leHRlbnRfY291bnQpKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChw
YXJ0cykgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19zZXRfZXh0ZW50X2lu
Zm8oJmVpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmQsIG9y
Z19lbmQgLSBlbmQsCj4gQEAgLTEyMTIsNiArMTIxNCw3IEBAIHZvaWQgZjJmc19pbml0X2V4dGVu
dF9jYWNoZV9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgIHNiaS0+aG90
X2RhdGFfYWdlX3RocmVzaG9sZCA9IERFRl9IT1RfREFUQV9BR0VfVEhSRVNIT0xEOwo+ICAgICAg
ICAgc2JpLT53YXJtX2RhdGFfYWdlX3RocmVzaG9sZCA9IERFRl9XQVJNX0RBVEFfQUdFX1RIUkVT
SE9MRDsKPiAgICAgICAgIHNiaS0+bGFzdF9hZ2Vfd2VpZ2h0ID0gTEFTVF9BR0VfV0VJR0hUOwo+
ICsgICAgICAgc2JpLT5tYXhfcmVhZF9leHRlbnRfY291bnQgPSBERUZfTUFYX1JFQURfRVhURU5U
X0NPVU5UOwo+ICB9Cj4KPiAgaW50IF9faW5pdCBmMmZzX2NyZWF0ZV9leHRlbnRfY2FjaGUodm9p
ZCkKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+IGluZGV4
IGI2NWIwMjNhNTg4YS4uNmYyY2JmNGM1NzQwIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5o
Cj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtNjM1LDYgKzYzNSw5IEBAIGVudW0gewo+ICAj
ZGVmaW5lIERFRl9IT1RfREFUQV9BR0VfVEhSRVNIT0xEICAgICAyNjIxNDQKPiAgI2RlZmluZSBE
RUZfV0FSTV9EQVRBX0FHRV9USFJFU0hPTEQgICAgMjYyMTQ0MAo+Cj4gKy8qIGRlZmF1bHQgbWF4
IHJlYWQgZXh0ZW50IGNvdW50IHBlciBpbm9kZSAqLwo+ICsjZGVmaW5lIERFRl9NQVhfUkVBRF9F
WFRFTlRfQ09VTlQgICAgICAxMDI0MAo+ICsKPiAgLyogZXh0ZW50IGNhY2hlIHR5cGUgKi8KPiAg
ZW51bSBleHRlbnRfdHlwZSB7Cj4gICAgICAgICBFWF9SRUFELAo+IEBAIC0xNjE5LDYgKzE2MjIs
NyBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPiAgICAgICAgIC8qIGZvciBleHRlbnQgdHJlZSBj
YWNoZSAqLwo+ICAgICAgICAgc3RydWN0IGV4dGVudF90cmVlX2luZm8gZXh0ZW50X3RyZWVbTlJf
RVhURU5UX0NBQ0hFU107Cj4gICAgICAgICBhdG9taWM2NF90IGFsbG9jYXRlZF9kYXRhX2Jsb2Nr
czsgICAgICAgLyogZm9yIGJsb2NrIGFnZSBleHRlbnRfY2FjaGUgKi8KPiArICAgICAgIHVuc2ln
bmVkIGludCBtYXhfcmVhZF9leHRlbnRfY291bnQ7ICAgICAvKiBtYXggcmVhZCBleHRlbnQgY291
bnQgcGVyIGlub2RlICovCj4KPiAgICAgICAgIC8qIFRoZSB0aHJlc2hvbGQgdXNlZCBmb3IgaG90
IGFuZCB3YXJtIGRhdGEgc2VwZXJhdGlvbiovCj4gICAgICAgICB1bnNpZ25lZCBpbnQgaG90X2Rh
dGFfYWdlX3RocmVzaG9sZDsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJm
cy9zeXNmcy5jCj4gaW5kZXggYmRiZjI0ZGI2NjdiLi5kMTM1NmM2NTZjYWMgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9zeXNmcy5jCj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gQEAgLTc4Nyw2ICs3
ODcsMTMgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBp
ZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJtYXhfcmVhZF9leHRlbnRfY291bnQiKSkgewo+ICsg
ICAgICAgICAgICAgICBpZiAodCA+IFVJTlRfTUFYKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAqdWkgPSAodW5zaWduZWQgaW50KXQ7
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPiArICAgICAgIH0KPiArCkhpIENoYW8s
CmZyb20gWGl1aG9uZyByZW1pZGVyLCBpdCBzZWVtcyBtaXNzIGNvZGVzIG9mIGFkZGluZyBzeXNm
cyBub2RlCiJtYXhfcmVhZF9leHRlbnRfY291bnQiPwpGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIo
bWF4X3JlYWRfZXh0ZW50X2NvdW50KTsKQVRUUl9MSVNUKG1heF9yZWFkX2V4dGVudF9jb3VudCk7
CnRoYW5rc++8gQo+ICAgICAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAiaXB1X3BvbGlj
eSIpKSB7Cj4gICAgICAgICAgICAgICAgIGlmICh0ID49IEJJVChGMkZTX0lQVV9NQVgpKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0tCj4gMi40MC4xCj4KPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
