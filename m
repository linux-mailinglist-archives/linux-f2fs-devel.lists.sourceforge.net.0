Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802D8FC440
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 09:15:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEkrf-0001is-If;
	Wed, 05 Jun 2024 07:15:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sEkrd-0001ik-NC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 07:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J96CFqMHnnrbEyvOUEQjbx8HxqBEViaaD1bEUYtTtvw=; b=FZKQXmC/mpDoiweVS8aIibct96
 Sy72czYq7KN1C9SvobEAB+ac46SUPZSK2sIz8DArDEsD4tzZctdpBSPil0lxZgZW6WixuulfOTXoe
 +r0AhClb/BCmXxqfBhF/xrcwsQbqBBu/sjwiG1ndZn4oGw7uFszB/QZu+RBMngl79OU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J96CFqMHnnrbEyvOUEQjbx8HxqBEViaaD1bEUYtTtvw=; b=T0dQdcfhvXRdamYMC/hez7TQP4
 slKmJjfGIbcYY0yL5q9MSAJ2PsoZp5gpm+vwd0phycx5Agr9/ZJokSoBx6yub/FQ/Bqz8PBR+soyQ
 rmfENgIIHcEVESx9Wts8oSXOYiDT/vSzEIu0KGsTnzaIxHL9QLvGXkzBCFGIi+fCjuwk=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sEkrd-0007Ji-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 07:15:18 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-35e4be5bd7fso3846782f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2024 00:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717571710; x=1718176510; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J96CFqMHnnrbEyvOUEQjbx8HxqBEViaaD1bEUYtTtvw=;
 b=Nv8GiZZwDtd1Ql/TzWjYrtwugZoCud6Z7FTsPRUa1n5LV6aBfD3kEMsAXNH+WN+Af1
 K3xuGKgiDXXZLlfLjjDNqtQ8GF4oNrDx/tDMFkbvR4mC1BEUKNTGw75kk7KENvVrIApM
 nG2DxWuW/mowSKjWfUGAuPclRTPpEqkEdnNFSOnFpz5igQDk141XAQzFAMKAvCwEb+e5
 MhC0TpjWakKX2Me/CkzOt2CajhKb3AoSNYMNG2HJEcCOjR1XHhwBxaWcdxGezsfS7LIv
 SfsPuZ9wF3RJ7oP8d2b7+E4jfF6QEMYILJGsGfOJTrDPmQ6NVAIE9YCVjjGdgyj/od8q
 hrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717571710; x=1718176510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J96CFqMHnnrbEyvOUEQjbx8HxqBEViaaD1bEUYtTtvw=;
 b=G1AiwXcMk5yaFSdh2Tq/Hb1wNfdtEZ+lZZneAubCj8XKu20GhqfddwHo2UCT7WuQWI
 3ZarbTKmSczaxDlQ/ZfYdoNnqQTkpVklEvQD9ChBii1sDuxm+6bALDnWQrIbVN+WQqJU
 eeka8pp5ZemF0/JN3Q82l6/jIZH7OtDZUdlESp+05TCljsMqsRkYS1tQ+9sUXQjuBn+m
 zfD5YSye03LpkFXNCKCR1gMuy9SeBIa6c2n+ZGEb9us4ycPs1bwi242V9glmrrpCEHCt
 K4FXBgW2fTqcya75cir7yHQkiZrJDaX/e5FfsHfqQYZgOVRv3OBoCnxtX+x0u2cxzKqE
 B00A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoU7W2k2XI94KDGbdVQPSRB+DBX5VzMJymEl2VdBSUewlwoEBm0Mv/tluLFQVtPz1I/0OQP0uLk3fOgRzcQ4+sYGlaP34Yn7T/fv+rFvRx0vkTtVp26g==
X-Gm-Message-State: AOJu0YyXIgLg7ib4ocBqJ6g6zgekuVIh5xmP4DGxA2RogRKAGaz+8HPS
 pjX5pVnLtSWg5ZXr6dOevwGtLnZH0xhz2SYjdlV5xImm70HEhiAX6sm1u6SmBSov7YPjdPrhlrj
 sAeLgAf0ZtC206R4E7QcJUmbwymg=
X-Google-Smtp-Source: AGHT+IGWATenhfNDGMe5lR8Qo7v9m5GRG45d78yyblvl2VAcN/Ee+r8eXJRI3Nbw/VWQP+GfXC7nkjlugT6AdnGNZ6k=
X-Received: by 2002:a5d:4f83:0:b0:354:de3c:6ee9 with SMTP id
 ffacd0b85a97d-35e84058179mr1121251f8f.6.1717571709913; Wed, 05 Jun 2024
 00:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
 <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
 <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
 <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
 <0c52e657-9872-4dfa-9c4d-83d74f0c9b07@kernel.org>
In-Reply-To: <0c52e657-9872-4dfa-9c4d-83d74f0c9b07@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 5 Jun 2024 15:14:58 +0800
Message-ID: <CAHJ8P3K-LOMDU0udwXj__qRpozNmv2tvvA4BRdktcOaK4OB7Bw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jun 5, 2024 at 2:26 PM Chao Yu wrote: > > On 2024/6/5
    13:59, Zhiguo Niu wrote: > > On Wed, Jun 5, 2024 at 11:48 AM Chao Yu wrote:
    > >> > >> On 2024/6/3 17:05, Zhiguo Niu wrote: > >>> O [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.52 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.221.52 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.52 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEkrd-0007Ji-Ip
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCAyOjI24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNi81IDEzOjU5LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gT24g
V2VkLCBKdW4gNSwgMjAyNCBhdCAxMTo0OOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI0LzYvMyAxNzowNSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
Pj4gT24gTW9uLCBKdW4gMywgMjAyNCBhdCAzOjQx4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiAyMDI0LzUvMjAgMTk6MzYsIFpoaWd1byBOaXUg
d3JvdGU6Cj4gPj4+Pj4gTm93IGF0Z2MgY2FuIGJlIGVuYWJsZWQgYmFzZWQgb24gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOgo+ID4+Pj4+IC1BVEdDIG1vdW50IG9wdGlvbiBpcyBzZXQKPiA+Pj4+
PiAtZWxhcHNlZF90aW1lIGlzIG1vcmUgdGhhbiBhdGdjX2FnZV90aHJlc2hvbGQgYWxyZWFkeQo+
ID4+Pj4+IGJ1dCB0aGVzZSBjb25kaXRpb25zIGFyZSBjaGVjayB3aGVuIHVtb3VudGVkLT5tb3Vu
dGVkIGRldmljZSBhZ2Fpbi4KPiA+Pj4+PiBJZiB0aGUgZGV2aWNlIGhhcyBub3QgYmUgdW1vdW50
ZWQtPm1vdW50ZWQgZm9yIGEgbG9uZyB0aW1lLCBhdGdjIGNhbgo+ID4+Pj4+IG5vdCB3b3JrIGV2
ZW4gdGhlIGFib3ZlIGNvbmRpdGlvbnMgbWV0Lgo+ID4+Pj4+Cj4gPj4+Pj4gSXQgaXMgYmV0dGVy
IHRvIGVuYWJsZSBhdGdjIGR5bmFtaWNsbHkgd2hlbiB1c2VyIGNoYW5nZSBhdGdjX2FnZV90aHJl
c2hvbGQKPiA+Pj4+PiBtZWFud2hpbGUgdGhpcyB2YWxlIGlzIGxlc3MgdGhhbiBlbGFwc2VkX3Rp
bWUgYW5kIEFUR0MgbW91bnQgb3B0aW9uIGlzIG9uLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4+Pj4+IC0tLQo+ID4+
Pj4+ICAgICBmcy9mMmZzL2YyZnMuaCAgICB8ICAxICsKPiA+Pj4+PiAgICAgZnMvZjJmcy9zZWdt
ZW50LmMgfCAgOSArKysrLS0tLS0KPiA+Pj4+PiAgICAgZnMvZjJmcy9zeXNmcy5jICAgfCAxNiAr
KysrKysrKysrKysrKysrCj4gPj4+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4+Pj4gaW5kZXggMTk3NGI2YS4uZTQ0MWQyZCAx
MDA2NDQKPiA+Pj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oCj4gPj4+Pj4gQEAgLTM2OTQsNiArMzY5NCw3IEBAIHZvaWQgZjJmc19jbGVhcl9wcmVm
cmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4+PiAgICAgaW50IGYy
ZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+Pj4+PiAg
ICAgdm9pZCBmMmZzX3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7
Cj4gPj4+Pj4gICAgIHZvaWQgZjJmc19yZXN0b3JlX2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpOwo+ID4+Pj4+ICtpbnQgZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4+Pj4gICAgIGludCBmMmZzX2FsbG9jYXRlX3NlZ21lbnRf
Zm9yX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+ID4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3RhcnQs
IHVuc2lnbmVkIGludCBlbmQpOwo+ID4+Pj4+ICAgICBpbnQgZjJmc19hbGxvY2F0ZV9uZXdfc2Vj
dGlvbihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLCBib29sIGZvcmNlKTsKPiA+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
ID4+Pj4+IGluZGV4IDcxZGM4MDQyLi40NDkyM2Q0IDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4gPj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4+PiBAQCAt
MjkzMSwxNCArMjkzMSwxMSBAQCBzdGF0aWMgaW50IGdldF9hdHNzcl9zZWdtZW50KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4gPj4+Pj4gICAgICAgICByZXR1cm4gcmV0Owo+
ID4+Pj4+ICAgICB9Cj4gPj4+Pj4KPiA+Pj4+PiAtc3RhdGljIGludCBfX2YyZnNfaW5pdF9hdGdj
X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPj4+Pj4gK2ludCBmMmZzX2luaXRf
YXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+Pj4+ICAgICB7Cj4gPj4+
Pj4gICAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNlZyA9IENVUlNFR19JKHNiaSwgQ1VS
U0VHX0FMTF9EQVRBX0FUR0MpOwo+ID4+Pj4+ICAgICAgICAgaW50IHJldCA9IDA7Cj4gPj4+Pj4K
PiA+Pj4+PiAtICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4+Pj4+IC0gICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPj4+Pj4gLQo+ID4+Pj4+ICAgICAgICAgZjJmc19kb3duX3JlYWQo
JlNNX0koc2JpKS0+Y3Vyc2VnX2xvY2spOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICBtdXRleF9s
b2NrKCZjdXJzZWctPmN1cnNlZ19tdXRleCk7Cj4gPj4+Pj4gQEAgLTI5NTUsNyArMjk1Miw5IEBA
IHN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQo+ID4+Pj4+ICAgICB9Cj4gPj4+Pj4gICAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2Vn
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Pj4+PiAgICAgewo+ID4+Pj4+IC0gICAgIHJl
dHVybiBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4+Pj4+ICsgICAgIGlmICghc2Jp
LT5hbS5hdGdjX2VuYWJsZWQpCj4gPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+
PiArICAgICByZXR1cm4gZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7Cj4gPj4+Pj4gICAgIH0K
PiA+Pj4+Pgo+ID4+Pj4+ICAgICBzdGF0aWMgdm9pZCBfX2YyZnNfc2F2ZV9pbm1lbV9jdXJzZWco
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiA+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gPj4+Pj4gaW5kZXggMDlkM2VjZi4u
NzI2NzZjNSAxMDA2NDQKPiA+Pj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiA+Pj4+PiArKysg
Yi9mcy9mMmZzL3N5c2ZzLmMKPiA+Pj4+PiBAQCAtNjczLDYgKzY3MywyMiBAQCBzdGF0aWMgc3Np
emVfdCBfX3NiaV9zdG9yZShzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4+Pj4+ICAgICAgICAgICAg
ICAgICByZXR1cm4gY291bnQ7Cj4gPj4+Pj4gICAgICAgICB9Cj4gPj4+Pj4KPiA+Pj4+PiArICAg
ICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJhdGdjX2FnZV90aHJlc2hvbGQiKSkgewo+ID4+
Pj4+ICsgICAgICAgICAgICAgaWYgKHQgPCAwKQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+Pj4+PiArICAgICAgICAgICAgIHNiaS0+YW0uYWdlX3RocmVz
aG9sZCA9IHQ7Cj4gPj4+Pj4gKyAgICAgICAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQp
Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPiA+Pj4+PiArCj4g
Pj4+Pj4gKyAgICAgICAgICAgICBpZiAodGVzdF9vcHQoc2JpLCBBVEdDKSAmJgo+ID4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICBsZTY0X3RvX2NwdShzYmktPmNrcHQtPmVsYXBzZWRfdGltZSkg
Pj0gdCkgewo+ID4+Pj4KPiA+Pj4gSGkgQ2hhbywKPiA+Pj4+IE9oLCBJIGd1ZXNzIHlvdSB3YW50
IHRvIGZpeCB0aGlzOgo+ID4+PiBZZXMsICBTb3JyeSBmb3Igbm90IG1ha2luZyBpdCBjbGVhciBi
ZWZvcmUuCj4gPj4+Pgo+ID4+Pj4gc3RhdGljIHZvaWQgaW5pdF9hdGdjX21hbmFnZW1lbnQoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+Pj4gewo+ID4+Pj4gLi4uCj4gPj4+PiAgICAgICAg
ICAgaWYgKHRlc3Rfb3B0KHNiaSwgQVRHQykgJiYKPiA+Pj4+ICAgICAgICAgICAgICAgICAgIFNJ
VF9JKHNiaSktPmVsYXBzZWRfdGltZSA+PSBERUZfR0NfVEhSRUFEX0FHRV9USFJFU0hPTEQpCj4g
Pj4+PiAgICAgICAgICAgICAgICAgICBhbS0+YXRnY19lbmFibGVkID0gdHJ1ZTsKPiA+Pj4+Cj4g
Pj4+PiBXaGF0IGFib3V0IGVuYWJsaW5nIGF0Z2NfZW5hYmxlZCBkdXJpbmcgY2hlY2twb2ludCBv
bmNlIGVsYXBzZWQgdGltZSBpcwo+ID4+Pj4gc2F0aXNmZWQgdy8gdGhlIGNvbmRpdGlvbj8gSSBn
dWVzcyB0aGlzIGNhbiBnaXZlIGFub3RoZXIgY2hhbmNlIHdoZW5ldmVyCj4gPj4+PiBDUCBpcyBi
ZWVuIHRyaWdnZXJlZCwgYW5kIGl0IGNhbiBhdm9pZCB0aGUgcmFjaW5nIGNvbmRpdGlvbiBhcyB3
ZWxsLgo+ID4+PiAxLiBJJ20gbm90IHN1cmUgaWYgdGhpcyB3aWxsIGluY3JlYXNlIGNoZWNrcG9p
bnQgdGltZSBjb25zdW1wdGlvbj8KPiA+Pgo+ID4+IFNpbmNlIGl0IHdvbid0IGluY3JlYXNlIGFu
eSBJTyB0aW1lLCBJIGd1ZXNzIGl0J3MgZmluZSB0b2xlcmF0ZSB0aW1lIGNvbnN1bWVkCj4gPj4g
YnkgaW5pdGlhbGl6YXRpb24gb2YgYXRnYyBjdXJzZWcuCj4gPj4KPiA+Pj4gMi4gZHluYW1pY2Fs
bHkgZW5hYmxpbmcgYXRnYyBtYXkgaGF2ZSBvdGhlciBwcm9ibGVtcy4gSXMgdGhpcyBjb25maXJt
ZWQ/Cj4gPj4KPiA+PiBJIHRoaW5rIHNvLCBjaGVja3BvaW50IGhhcyBhdm9pZGVkIG1vc3QgcmFj
ZSBjYXNlcy4KPiA+Pgo+ID4+IFNvLCBob3cgZG8geW91IHRoaW5rIG9mIGJlbG93IGRpZmY6Cj4g
PiBIaSBDaGFvLAo+ID4gICBJIHRoaW5rIGZsb3cgaXMgb2ssICBzb21lIGRldGFpbHMgbmVlZCB0
byBiZSBkaXNjdXNzZWQuCj4gPj4KPiA+PiAtLS0KPiA+PiAgICBmcy9mMmZzL2NoZWNrcG9pbnQu
YyB8ICAyICsrCj4gPj4gICAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgMSArCj4gPj4gICAgZnMv
ZjJmcy9zZWdtZW50LmMgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ID4+ICAg
IDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2lu
dC5jCj4gPj4gaW5kZXggNTVkNDQ0YmVjNWMwLi40YTczYmQ0ODFhMjUgMTAwNjQ0Cj4gPj4gLS0t
IGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+
ID4+IEBAIC0xNzE4LDYgKzE3MTgsOCBAQCBpbnQgZjJmc193cml0ZV9jaGVja3BvaW50KHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykKPiA+PiAgICAgICAg
ICB9Cj4gPj4KPiA+PiAgICAgICAgICBmMmZzX3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHNiaSk7Cj4g
Pj4gKyAgICAgICBmMmZzX3JlaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4+ICsKPiA+PiAgICAg
ICAgICBzdGF0X2luY19jcF9jb3VudChzYmkpOwo+ID4+ICAgIHN0b3A6Cj4gPj4gICAgICAgICAg
dW5ibG9ja19vcGVyYXRpb25zKHNiaSk7Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5o
IGIvZnMvZjJmcy9mMmZzLmgKPiA+PiBpbmRleCA5Njg4ZGYzMzIxNDcuLjhkMzg1YTFjNzVhZCAx
MDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5o
Cj4gPj4gQEAgLTM2OTMsNiArMzY5Myw3IEBAIHZvaWQgZjJmc19yZWxlYXNlX2Rpc2NhcmRfYWRk
cnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+PiAgICBpbnQgZjJmc19ucGFnZXNfZm9y
X3N1bW1hcnlfZmx1c2goc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZvcl9yYSk7Cj4g
Pj4gICAgYm9vbCBmMmZzX3NlZ21lbnRfaGFzX2ZyZWVfc2xvdChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGludCBzZWdubyk7Cj4gPj4gICAgaW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+PiAraW50IGYyZnNfcmVpbml0X2F0Z2NfY3Vyc2Vn
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4gICAgdm9pZCBmMmZzX3NhdmVfaW5tZW1f
Y3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4gICAgdm9pZCBmMmZzX3Jlc3Rv
cmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPj4gICAgaW50IGYy
ZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
aW50IHR5cGUsCj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9z
ZWdtZW50LmMKPiA+PiBpbmRleCBiZGMyMjQ3Mzg3ZTguLjZkNDI3M2ZhZjA2MSAxMDA2NDQKPiA+
PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4g
Pj4gQEAgLTI5NDksMTIgKzI5NDksMTIgQEAgc3RhdGljIGludCBnZXRfYXRzc3Jfc2VnbWVudChz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+ID4+ICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPj4gICAgfQo+ID4+Cj4gPj4gLXN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJz
ZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+ICtzdGF0aWMgaW50IF9fZjJmc19pbml0
X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBmb3JjZSkKPiA+PiAg
ICB7Cj4gPj4gICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShz
YmksIENVUlNFR19BTExfREFUQV9BVEdDKTsKPiA+PiAgICAgICAgICBpbnQgcmV0ID0gMDsKPiA+
Pgo+ID4+IC0gICAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkKPiA+PiArICAgICAgIGlm
ICghc2JpLT5hbS5hdGdjX2VuYWJsZWQgJiYgIWZvcmNlKQo+ID4gSXMgdGhpcyBwYXJhbWV0ZXIg
ICJmb3JjZSIgdW5uZWNlc3Nhcnk/Cj4gPiBpbiBtb3VudCBmbG93LCBldmVuIGF0Z2MgZW5hYmxl
IGNvbmRpdGlvbnMgYXJlIGFsbCBtZXQsIGl0IGlzIG5vdAo+ID4gZW5hYmxlZCBiZWNhdXNlIG9m
IGZvcmNlPWZhbHNlLgo+ID4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiA+PiAgICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4+Cj4gPj4gICAgICAgICAgZjJmc19kb3duX3JlYWQoJlNN
X0koc2JpKS0+Y3Vyc2VnX2xvY2spOwo+ID4+IEBAIC0yOTcxLDkgKzI5NzEsMjkgQEAgc3RhdGlj
IGludCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4g
Pj4gICAgICAgICAgZjJmc191cF9yZWFkKCZTTV9JKHNiaSktPmN1cnNlZ19sb2NrKTsKPiA+PiAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4+ICAgIH0KPiA+PiArCj4gPj4gICAgaW50IGYyZnNfaW5p
dF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+ICAgIHsKPiA+PiAt
ICAgICAgIHJldHVybiBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4+ICsgICAgICAg
cmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgZmFsc2UpOwo+ID4+ICt9Cj4gPj4g
Kwo+ID4+ICtpbnQgZjJmc19yZWluaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQo+ID4+ICt7Cj4gPj4gKyAgICAgICBpbnQgcmV0Owo+ID4+ICsKPiA+PiArICAgICAgIGlm
ICghdGVzdF9vcHQoc2JpLCBBVEdDKSkKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
Pj4gKyAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPj4gKyAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4+ICsgICAgICAgaWYgKFNJVF9JKHNiaSktPmVsYXBzZWRfdGltZSA8IHNi
aS0+YW0uYWdlX3RocmVzaG9sZCkKPiA+IFNJVChzYmkpLT5lbGFwc2VkX3RpbWUgaXMganVzdCB1
cGRhdGVkIGluIG1vdW50IGZsb3csIHNvCj4gPiBja3B0LT5lbGFwc2VkX3RpbWUgaXMgIG1vcmUg
c3VpdGFibGUgaGVyZT8KPgo+IEFncmVlZCwgaXQgbmVlZHMgdG8gYmUgZml4ZWQuCj4KPiBDYW4g
eW91IHBsZWFzZSB1cGRhdGUgdGhvc2UgY2hhbmdlcyBpbnRvIHYyPwpIaSBDaGFvLApPSywgYW5k
IEkgd2lsbCBhbHNvIHZlcmlmeSB0aGUgYmFzaWMgZnVuY3Rpb24uCnRoYW5rc++8gQo+Cj4gVGhh
bmtzLAo+Cj4gPiB0aGFua3MhCj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4+ICsK
PiA+PiArICAgICAgIHJldCA9IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgdHJ1ZSk7Cj4g
Pj4gKyAgICAgICBpZiAoIXJldCkgewo+ID4+ICsgICAgICAgICAgICAgICBzYmktPmFtLmF0Z2Nf
ZW5hYmxlZCA9IHRydWU7Cj4gPj4gKyAgICAgICAgICAgICAgIGYyZnNfaW5mbyhzYmksICJyZWVu
YWJsZWQgYWdlIHRocmVzaG9sZCBHQyIpOwo+ID4+ICsgICAgICAgfQo+ID4+ICsgICAgICAgcmV0
dXJuIHJldDsKPiA+PiAgICB9Cj4gPj4KPiA+PiAgICBzdGF0aWMgdm9pZCBfX2YyZnNfc2F2ZV9p
bm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiA+PiAtLQo+
ID4+IDIuNDAuMQo+ID4+Cj4gPj4+IHRoYW5rc++8gQo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+
Pj4+Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChmMmZzX2luaXRfYXRnY19jdXJz
ZWcoc2JpKSkKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgc2JpLT5hbS5hdGdjX2VuYWJsZWQg
PSB0cnVlOwo+ID4+Pj4+ICsgICAgICAgICAgICAgfQo+ID4+Pj4+ICsgICAgICAgICAgICAgcmV0
dXJuIGNvdW50Owo+ID4+Pj4+ICsgICAgIH0KPiA+Pj4+PiArCj4gPj4+Pj4gICAgICAgICBpZiAo
IXN0cmNtcChhLT5hdHRyLm5hbWUsICJnY19zZWdtZW50X21vZGUiKSkgewo+ID4+Pj4+ICAgICAg
ICAgICAgICAgICBpZiAodCA8IE1BWF9HQ19NT0RFKQo+ID4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHNiaS0+Z2Nfc2VnbWVudF9tb2RlID0gdDsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
