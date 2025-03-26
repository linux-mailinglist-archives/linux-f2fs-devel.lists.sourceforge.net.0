Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA885A71EA6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 19:51:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txVql-0005CF-SI;
	Wed, 26 Mar 2025 18:51:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1txVqk-0005C8-Rk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 18:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KhwLvVUyaGGXrQ5Rqn/eX6++j06eIfu9CynRqkL4xvQ=; b=PZjtugYFoF5T1ATmB/DAcM7OqI
 auC9kF09v6yEBkeBIcI4b4o9uAt6FiOSLGHpZUscH1PYpXu8mFckUhsu/zR6RM+SngoqiOeDpIlk5
 b8NvzbUz5gZsfmWNa8tursytmXcjtasP1+XlCsY2fhWapnKlxKpaZBOcnVsyMgY3xRw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KhwLvVUyaGGXrQ5Rqn/eX6++j06eIfu9CynRqkL4xvQ=; b=kjYB5Wm51ADaooxFvhhq1HqRYQ
 v2JSLMhiPkyeQe4o8D0oEKTEqTazk8sEzu5WMQGzVQzDuv6tPDwPFtvz74Nbodj9rSK0D3+fdocCf
 kLoIZjLp6uwEUalK7dD2lAi7Qb7UELb0wDBMjmaRaoVgxnT/SDvL2lyNhX1gVPov7b2o=;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txVqZ-0005bw-Hd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 18:51:38 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-86d69774081so84724241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743015076; x=1743619876; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhwLvVUyaGGXrQ5Rqn/eX6++j06eIfu9CynRqkL4xvQ=;
 b=ghs4pDUnuvD72u9HZ4p0izusUnAQm/RNsQqRDsEDI+CJF46sAS3rsAxkdsiaPuDBgY
 2ioZS7fWiB5PXyio/n048MKbX/zTwldun7XXtaqctPDonchG0tBxv8hV2+VRNvLxfDgN
 cfoVDzrYJK3tc8GfaMgXXrPUF27d1Zp6TAdaJYjQN4IL9ByaNW9Khq6G9vLz8f9dw+eD
 +CdqWshBTFG+FML825QtiwQ7/V2O0+0yVyNTwCeCN+qJazQQc6uiGnnvIDVAdHids4en
 RMN8DJ9hJpDJBp9MbLVkQu6eRpoO3+38Ybt9R3O+f3qgRWkPzAm9wfBNB1t66Z7nPE3V
 aqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743015076; x=1743619876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhwLvVUyaGGXrQ5Rqn/eX6++j06eIfu9CynRqkL4xvQ=;
 b=bL//gGThUFAzXDybRxa8xsdZfaglWoAMtlz5AIILCxBJ/tIaSVUcUtKZpFfheHrzAp
 K3ARAPetf5koqe2R6jsq/sGBbSF1iuS2EZp7J0ioGx2IX2QOSABtqw6nFqe+c+j5fq6Y
 qvfy0rv93OZ//3pFT0xGmNhgXmMgxsjBUWnyduuIB4jxQwaYMUlSE3QwJnf+zc1i8OkE
 RKTR4FXpxYh+UufQc97oBLa8VrSKTYHoptfyvS8YVR9MpB40f5CCWljOny7yh1PZzn/8
 qT9qj40yPqx/FiK5YCGoXHTz19kWCGIQX7ErmqMdNFqTakSS2rHNw/n4JrKTxQQ8htkr
 eUdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc/baEQ0DqOs09uK06cMtljC4kC/RghjlkQIQI+kW93WYQGDhMcq/vWef4ibvnveUe0GOWZUD439RvoIw13k1l@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzpaxB5OgpBNxZmxhBGzqNVh0Mlt0h+JkSZbYpVCxcGMGOW920p
 SGkyFSJ23O1KNrlmtm1M/+fiW0/uxBw84mUoQEiTwi7Zx5jr468FCkXfyw5mOT1B26xo+a3DiNa
 a0wTEThHaSdibcDgY01NNHKVcuT4=
X-Gm-Gg: ASbGncsnZoRYcTvNcGsh5XyA8t2KFrGYeyedEP8E5mDTUsBQ2aj9kFgDGP6ffZzp+1l
 75ZTeDhaNyFdkZw4mEEt2nTqb5escvDhmhRVfWQ4pJWoVZrdrZe4Hz+TmDcEod3cLeespVODepp
 S/iHUPyJY6BilWzYG6a/4pA+vQ33XHuxVJsrNe8j8/u4jG8A9qQH8wee5L
X-Google-Smtp-Source: AGHT+IGwBkeoS6sd4gr1aVfLZJRs0JzkD14L3FH0hyzdzb19dFr293HoSTDrObTuCpab1NYYs9Aa167HcOdZGI8s8NI=
X-Received: by 2002:a67:e716:0:b0:4bb:b809:36c6 with SMTP id
 ada2fe7eead31-4c586fa2576mr1413775137.11.1743015076250; Wed, 26 Mar 2025
 11:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
 <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
 <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
 <8a72691e-28ef-4b6b-a855-62fd6c2743dc@kernel.org>
In-Reply-To: <8a72691e-28ef-4b6b-a855-62fd6c2743dc@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Mar 2025 11:51:05 -0700
X-Gm-Features: AQ5f1JoRxqsXwsgId_2_iZ1biEmq72GTY2n2d4UtnIf563T_zKnJWRq8-UhLLL0
Message-ID: <CACOAw_wX3QPvpaCWW2gfKH_9Zf_=Tku14+RL6CatU9f2d2AiGQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Mar 26, 2025 at 5:12 AM Chao Yu via Linux-f2fs-devel
    wrote: > > On 3/26/25 18:51, Zhiguo Niu wrote: > > Chao Yu 于2025年3月26日周三
    17:26写道： > >> > >> On 3/26/25 16:46, Zhigu [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.54 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.54 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.54 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1txVqZ-0005bw-Hd
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxMuKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IE9uIDMvMjYvMjUgMTg6NTEsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjXlubQz5pyIMjbml6XlkajkuIkgMTc6MjblhpnpgZPvvJoKPiA+Pgo+
ID4+IE9uIDMvMjYvMjUgMTY6NDYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+IENvbW1pdCBmY2Nh
YTgxZGU4N2UgKCJmMmZzOiBwcmV2ZW50IGF0b21pYyBmaWxlIGZyb20gYmVpbmcgZGlydGllZCBi
ZWZvcmUgY29tbWl0IikKPiA+Pj4gYWRkcyB0aGUgcHJvY2Vzc2luZyBvZiBGSV9BVE9NSUNfRElS
VElFRCBpbiB0aGUgZm9sbG93aW5nIHR3byBwb3NpdGlvbnMsCj4gPj4+IFsxXQo+ID4+PiBmMmZz
X2NvbW1pdF9hdG9taWNfd3JpdGUKPiA+Pj4gIC0gX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUK
PiA+Pj4gICAtIHNiaS0+Y29tbWl0dGVkX2F0b21pY19ibG9jayArPSBmaS0+YXRvbWljX3dyaXRl
X2NudDsKPiA+Pj4gICAtIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVE
KTsKPiA+Pj4gICAtIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJ
RUQpKSB7Cj4gPj4+ICAgLSAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElS
VElFRCk7Cj4gPj4+ICAgLSAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1
ZSk7Cj4gPj4+ICAgLSB9Cj4gPj4+IFsyXQo+ID4+PiBmMmZzX2Fib3J0X2F0b21pY193cml0ZQo+
ID4+PiAgIC0gaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkp
IHsKPiA+Pj4gICAtICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVE
KTsKPiA+Pj4gICAtICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsK
PiA+Pj4gICAtIH0KPiA+Pj4KPiA+Pj4gYnV0IFsxXSBzZWVtcyB0byBiZSByZWR1bmRhbnQ6Cj4g
Pj4+IFRoZSBhdG9taWMgZmlsZSBmbGFnIEZJX0FUT01JQ19GSUxFIGlzIHN0aWxsIHNldCBoZXJl
LCBzbyBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYwo+ID4+PiBzdGlsbCBkb2VzIG5vdCBzZXQg
dGhlIGRpcnR5IHN0YXRlIHRvIHZmcy4gSWYgRklfQVRPTUlDX0RJUlRJRUQgd2FzIG9yaWdpbmFs
bHkgc2V0Cj4gPj4+IHdoZW4gYXRvbWljIGZpbGUgaXMgY29tbWl0dGluZywgdGhlbiBGSV9BVE9N
SUNfRElSVElFRCBpcyBqdXN0IGNsZWFyZWQgaGVyZSwgYW5kCj4gPj4+IHRoZW4gZG8gdGhlIHJl
cGVhdGluZyBhY3Rpb24gb2Ygc2V0dGluZyBGSV9BVE9NSUNfRElSVElFRD8KPiA+Pj4gU28gaXMg
aXQgZW5vdWdoIHRvIGRvIHRoaXMgb25seSBpbiBbMl0/Cj4gPj4KPiA+PiBIaSBaaGlndW8sCj4g
Pj4KPiA+PiBJIGNoZWNrZWQgdGhlIGNvZGUgYWdhaW4sIGZpbmFsbHksIEkgZ290IHRoaXMsIGNv
dWxkIHlvdSBwbGVhc2UgdGFrZQo+ID4+IGEgbG9vaz8KPiA+Pgo+ID4+IFBpbmcgRGFlaG8gYXMg
d2VsbC4KPiA+Pgo+ID4+IFN1YmplY3Q6IFtQQVRDSF0gZjJmczogZml4IHRvIHNldCBhdG9taWMg
d3JpdGUgc3RhdHVzIG1vcmUgY2xlYXIKPiA+Pgo+ID4+IDEuIEFmdGVyIHdlIHN0YXJ0IGF0b21p
YyB3cml0ZSBpbiBhIGRhdGFiYXNlIGZpbGUsIGJlZm9yZSBjb21taXR0aW5nCj4gPj4gYWxsIGRh
dGEsIHdlJ2QgYmV0dGVyIG5vdCBzZXQgaW5vZGUgdy8gdmZzIGRpcnR5IHN0YXR1cyB0byBhdm9p
ZAo+ID4+IHJlZHVuZGFudCB1cGRhdGVzLCBpbnN0ZWFkLCB3ZSBvbmx5IHNldCBpbm9kZSB3LyBh
dG9taWMgZGlydHkgc3RhdHVzLgo+ID4+Cj4gPj4gMi4gQWZ0ZXIgd2UgY29tbWl0IGFsbCBkYXRh
LCBiZWZvcmUgY29tbWl0dGluZyBtZXRhZGF0YSwgd2UgbmVlZCB0bwo+ID4+IGNsZWFyIGF0b21p
YyBkaXJ0eSBzdGF0dXMsIGFuZCBzZXQgdmZzIGRpcnR5IHN0YXR1cyB0byBhbGxvdyB2ZnMgZmx1
c2gKPiA+PiBkaXJ0eSBpbm9kZS4KPiA+Pgo+ID4gSGkgQ2hhbywKPiA+IHRoZXNlIGxvb2tzIG1v
cmUgY2xlYXIuCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
ID4+IC0tLQo+ID4+ICBmcy9mMmZzL2lub2RlLmMgICB8ICA0ICsrKy0KPiA+PiAgZnMvZjJmcy9z
ZWdtZW50LmMgfCAxMCArKysrKystLS0tCj4gPj4gIGZzL2YyZnMvc3VwZXIuYyAgIHwgIDQgKysr
LQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5j
Cj4gPj4gaW5kZXggNWM4NjM0ZWFlZjdiLi5mNTk5MWU4NzUxYjkgMTAwNjQ0Cj4gPj4gLS0tIGEv
ZnMvZjJmcy9pbm9kZS5jCj4gPj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4gPj4gQEAgLTM0LDcg
KzM0LDkgQEAgdm9pZCBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLCBib29sIHN5bmMpCj4gPj4gICAgICAgICBpZiAoZjJmc19pbm9kZV9kaXJ0aWVkKGlub2Rl
LCBzeW5jKSkKPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4+Cj4gPj4gLSAgICAgICBp
ZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpCj4gPj4gKyAgICAgICAvKiBvbmx5IGF0b21p
YyBmaWxlIHcvIEZJX0FUT01JQ19DT01NSVRURUQgY2FuIGJlIHNldCB2ZnMgZGlydHkgKi8KPiA+
PiArICAgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSAmJgo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0NPTU1J
VFRFRCkpCj4gPj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiA+Pgo+ID4+ICAgICAgICAgbWFy
a19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlKTsKPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdt
ZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+IGluZGV4IGRjMzYwYjRiMDU2OS4uMjg2NTlh
NzE4OTFhIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmMKPiA+PiBAQCAtMzc2LDEwICszNzYsMTIgQEAgc3RhdGljIGludCBfX2Yy
ZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4+ICAgICAgICAg
fSBlbHNlIHsKPiA+PiAgICAgICAgICAgICAgICAgc2JpLT5jb21taXR0ZWRfYXRvbWljX2Jsb2Nr
ICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+ID4+ICAgICAgICAgICAgICAgICBzZXRfaW5vZGVf
ZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4gPj4gLSAgICAgICAgICAgICAgIGlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJ
UlRJRUQpOwo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0
eV9zeW5jKGlub2RlLCB0cnVlKTsKPiA+PiAtICAgICAgICAgICAgICAgfQo+ID4+ICsKPiA+PiAr
ICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCAhaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUs
IEZJX0FUT01JQ19ESVJUSUVEKSk7Cj4gPiBidXQgRklfQVRPTUlDX0RJUlRJRUQgbWF5ICBub3Qg
YmUgc2V0IHdoZW4gYXRvbWljIGZpbGUgaXMgY29tbWl0dGluZz8KPiA+IHRoYW5rcyEKPgo+IGlu
Y192YWxpZF9ibG9ja19jb3VudCgpIHdpbGwgc2V0IEZJX0FUT01JQ19ESVJUSUVEIGZvciBpbm9k
ZSBhdCBsZWFzdD8KPgo+IC0gX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUKPiAgLSBfX3JlcGxh
Y2VfYXRvbWljX3dyaXRlX2Jsb2NrCj4gICAtIGluY192YWxpZF9ibG9ja19jb3VudAo+ICAgIC0g
ZjJmc19pX2Jsb2Nrc193cml0ZQo+ICAgICAtIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jCgpN
YXliZSwgbm8gd3JpdGUgc2NlbmFyaW8/IG9wZW4gLT4gYXRvbWljX3dyaXRlX3N0YXJ0IC0+IG5v
IHdyaXRlIC0+IGNvbW1pdD8KCj4KPiBUaGFua3MsCj4KPiA+PiArCj4gPj4gKyAgICAgICAgICAg
ICAgIC8qIGNsZWFyIGF0b21pYyBkaXJ0eSBzdGF0dXMgYW5kIHNldCB2ZnMgZGlydHkgc3RhdHVz
ICovCj4gPj4gKyAgICAgICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01J
Q19ESVJUSUVEKTsKPiA+PiArICAgICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5
bmMoaW5vZGUsIHRydWUpOwo+ID4+ICAgICAgICAgfQo+ID4+Cj4gPj4gICAgICAgICBfX2NvbXBs
ZXRlX3Jldm9rZV9saXN0KGlub2RlLCAmcmV2b2tlX2xpc3QsIHJldCA/IHRydWUgOiBmYWxzZSk7
Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4+
IGluZGV4IDlhNDJhMTMyM2Y0Mi4uYTVjYzlmNmVlMTZhIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2Yy
ZnMvc3VwZXIuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4+IEBAIC0xNTMyLDcgKzE1
MzIsOSBAQCBpbnQgZjJmc19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wg
c3luYykKPiA+PiAgICAgICAgIH0KPiA+PiAgICAgICAgIHNwaW5fdW5sb2NrKCZzYmktPmlub2Rl
X2xvY2tbRElSVFlfTUVUQV0pOwo+ID4+Cj4gPj4gLSAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lz
X2F0b21pY19maWxlKGlub2RlKSkKPiA+PiArICAgICAgIC8qIGlmIGF0b21pYyB3cml0ZSBpcyBu
b3QgY29tbWl0dGVkLCBzZXQgaW5vZGUgdy8gYXRvbWljIGRpcnR5ICovCj4gPj4gKyAgICAgICBp
ZiAoIXJldCAmJiBmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSAmJgo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRF
RCkpCj4gPj4gICAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNf
RElSVElFRCk7Cj4gPj4KPiA+PiAgICAgICAgIHJldHVybiByZXQ7Cj4gPj4gLS0KPiA+PiAyLjQ4
LjEKPiA+Pgo+ID4+Cj4gPj4+Cj4gPj4+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+ID4+PiBGaXhlczogZmNjYWE4MWRlODdlICgiZjJmczogcHJldmVudCBhdG9taWMg
ZmlsZSBmcm9tIGJlaW5nIGRpcnRpZWQgYmVmb3JlIGNvbW1pdCIpCj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICBm
cy9mMmZzL3NlZ21lbnQuYyB8IDQgLS0tLQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4gPj4+IGluZGV4IDM5NmVmNzEuLmQ0ZWEzYWYgMTAwNjQ0Cj4gPj4+IC0t
LSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+
IEBAIC0zNzYsMTAgKzM3Niw2IEBAIHN0YXRpYyBpbnQgX19mMmZzX2NvbW1pdF9hdG9taWNfd3Jp
dGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+Pj4gICAgICAgfSBlbHNlIHsKPiA+Pj4gICAgICAg
ICAgICAgICBzYmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9j
bnQ7Cj4gPj4+ICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19D
T01NSVRURUQpOwo+ID4+PiAtICAgICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9k
ZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICBjbGVh
cl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gPj4+IC0gICAgICAgICAg
ICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4gPj4+
IC0gICAgICAgICAgICAgfQo+ID4+PiAgICAgICB9Cj4gPj4+Cj4gPj4+ICAgICAgIF9fY29tcGxl
dGVfcmV2b2tlX2xpc3QoaW5vZGUsICZyZXZva2VfbGlzdCwgcmV0ID8gdHJ1ZSA6IGZhbHNlKTsK
PiA+Pgo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
