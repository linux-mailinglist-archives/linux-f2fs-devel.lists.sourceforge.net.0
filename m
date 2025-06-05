Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF8ACE867
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 04:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42aMY8nMJyRnv0bfan+ZlOVinvtHyQ67/Xn1M4qwvks=; b=CHhwj1QqIqxUCzgOuNF0Tm0Hiu
	o5a1jphy8BA9i5NswNjyd3tifdMM35AfChKqj2q58G9INDyGGulW24ouIfeQcL3gpoJxqMUKcJUMN
	1oF93IcT4y821fkQAe64//ker1LiqfexGkWfSOwXrLt0kg04Rmq7XZKlxNO7Omc9At+o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN0av-0003vj-2l;
	Thu, 05 Jun 2025 02:44:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uN0at-0003vX-Vn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 02:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=; b=h4Job4JoN6r9FvG2rD5yCuyr0t
 rQN+YkaKXJrWSb8+5eXK0I64i40Wu25qgpbTkJ2cMFpKcD0giID6XyFtCZj9et2vnG3snXnCD/8Qm
 psLp5xUdFU8bEkA5HE6qbTAlVGF3I4Uz2e6HkqUHTepmqB78ENuDMfuio08YS4ih1nQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=; b=f6CrV27l/ss3oGaeaMZKXCFVPG
 3wZW1C0Vc9OJiB67zmFOrQL3v39NOwFgP7ssBT23sgUqcBoB31mdUCSSgVUAMYqF+/gCJrPk2Vmd5
 igZC85dVqWjqynD+jIMBB7LhMd+/p4vALobJ2SzRrjXJL8qyur3IFthA9S2e91ql11k8=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uN0at-0006Bk-II for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 02:44:39 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a4e6a0c274so61977f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 19:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749091468; x=1749696268; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=;
 b=ZyVpD88MN/RV+igvnfb+ABjPkKAvMy6R540vLghuePBZ/xrVRjB0pNm/9uXVxRg31x
 TJfYMhKZGUJbiow9YC+h4AVOR2BII7Y1lmXT9Ik431yLuNtZv0eDne4+I2I79gBgI+qy
 OwlecEEWFzhe+MG9spMGKAhsXipzRMm12YI7hOfPcwZ9IO1Objn/ENcjBYHwQxtIjEcj
 thxFst5aeVE9sxwRdGy7mvZ2WuRUrPUPhC9d5ftX1VoyP4lYLp4ZSn6pMmF8is25wLl/
 XmDRvo2GsDSkQuRsWNVER1jAh9dfrrrDgR9PxDjPbmJZm43CgocPlLDQRs/fsghBVYz9
 JGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749091468; x=1749696268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/0pVGWzXcFQ955kWBaboT1rhQfuOXVFKSSp7OjJXH4=;
 b=B/pkTQMYzyzUds72okGpVPmJ/uSyVBDb2qh1JhkVbl48Bmgz4rnW1XIRanya0kaP7h
 Jw5QPQOrmqGici38U0soBqLqnfAH7qza6ENaGZ0q9FaQn14zudbaEnZvVr/gTGSHxfDq
 s+TAT+u3zKNOVV/meO+/tV0WdzG76RNGkAKeIls4jZQ9a/0nWfHvKwNjB4r6K4ODr5mW
 Tbm11jve0CMyxwdv94xWo/jEjZUdXS7D9yXCJ4MeRi6wc6YbQS0h4/AXVxWy16JwZs0D
 Ed78x5BpEBtqBsepG20gJQMVvtwrbfu/EHnlGRzRU9kUAK8C4RrgHcRJFWcD7o7sw8IO
 CKJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViq7fXLMb6drXwsh7TS6QLXegpsl+njBp6RW8Ue89bf+QsMkmz/Km/Js+lXpt7XOqYfZbVCC0z0ORWcus7diKg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwVLXAqyXw/E1COX7HIbdPToRkA19wg8a7yGKy9lTqypZIWv60A
 S19JPFPAJX4HVf97X1WpEKZ4deAixiZuXJUi5pEX9A1irWfhKHIAOV27JNqVLHEEkNjDpMCUtg9
 6Beb684qVHNeno/Tu+03ukoCx1zHj+SQ=
X-Gm-Gg: ASbGncvP5pk/RdTbJE+G04Z544pH3fUw1Dnj7BmCTlX61Ur/wzdxdQfE4AqOOIJILpM
 DmxGymI53XgmKG5Mls2xHONHsV81RA5lQ9qPksxACkJV+XrtYgw3+P/h8pKt85fMPF/p/bp260A
 D0GYz52e4YDyuGpZxlr/mUDpobpicEqrQ1mWJ2MBAEHiVz
X-Google-Smtp-Source: AGHT+IFUb2rBaDqOLFPMfGPrqkKc83DFwn/HlDNCEZzWMjeMi/FrJzuQJY5+W1OgDhvOfGFhBS6ObPFJrvnJlmlvShw=
X-Received: by 2002:a05:6000:2482:b0:3a4:d30a:7633 with SMTP id
 ffacd0b85a97d-3a51d987c45mr1430856f8f.15.1749091467780; Wed, 04 Jun 2025
 19:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
 <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
In-Reply-To: <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 10:44:15 +0800
X-Gm-Features: AX0GCFvXicNXat09LB3YmJe-vPJXw7p7jjCvh-oK6T8jhT5VEamiUB0-8G47A_U
Message-ID: <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月5日周四 10:23写道： > > On 6/4/25
    19:37, Zhiguo Niu wrote: > > The decompress_io_ctx may be released asynchronously
    after > > I/O completion. If this file is deleted imme [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
X-Headers-End: 1uN0at-0006Bk-II
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDXml6Xlkajlm5sgMTA6MjPl
hpnpgZPvvJoKPgo+IE9uIDYvNC8yNSAxOTozNywgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IFRoZSBk
ZWNvbXByZXNzX2lvX2N0eCBtYXkgYmUgcmVsZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIKPiA+
IEkvTyBjb21wbGV0aW9uLiBJZiB0aGlzIGZpbGUgaXMgZGVsZXRlZCBpbW1lZGlhdGVseSBhZnRl
ciByZWFkLAo+ID4gYW5kIHRoZSBrd29ya2VyIG9mIHByb2Nlc3NpbmcgcG9zdF9yZWFkX3dxIGhh
cyBub3QgYmVlbiBleGVjdXRlZCB5ZXQKPiA+IGR1ZSB0byBoaWdoIHdvcmtsb2FkcywgSXQgaXMg
cG9zc2libGUgdGhhdCB0aGUgaW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+ID4gaXMgZXZpY3RlZCBh
bmQgZnJlZWQgYmVmb3JlIGl0IGlzIHVzZWQgZjJmc19mcmVlX2RpYy4KPiA+Cj4gPiAgICAgVGhl
IFVBRiBjYXNlIGFzIGJlbG93Ogo+ID4gICAgIFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBUaHJlYWQgQgo+ID4gICAgIC0gZjJmc19kZWNvbXByZXNzX2VuZF9p
bwo+ID4gICAgICAtIGYyZnNfcHV0X2RpYwo+ID4gICAgICAgLSBxdWV1ZV93b3JrCj4gPiAgICAg
ICAgIGFkZCBmcmVlX2RpYyB3b3JrIHRvIHBvc3RfcmVhZF93cQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBkb191bmxpbmsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGlwdXQKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBl
dmljdAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBjYWxsX3JjdQo+ID4gICAgIFRoaXMgZmlsZSBpcyBkZWxldGVkIGFmdGVyIHJlYWQu
Cj4gPgo+ID4gICAgIFRocmVhZCBDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3dv
cmtlciB0byBwcm9jZXNzIHBvc3RfcmVhZF93cQo+ID4gICAgIC0gcmN1X2RvX2JhdGNoCj4gPiAg
ICAgIC0gZjJmc19mcmVlX2lub2RlCj4gPiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+ID4gICAg
ICBpbm9kZSBpcyBmcmVlZCBieSByY3UKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0gcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNf
ZnJlZV9kaWMKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0gZjJmc19yZWxlYXNlX2RlY29tcF9tZW0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVhZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4g
Pgo+ID4gVGhpcyBwYXRjaCB1c2UgX19pZ2V0IGJlZm9yZSBmMmZzX2ZyZWVfZGljIGFuZCBpcHV0
IGFmdGVyIGZyZWUgdGhlIGRpYy4KPiA+Cj4gPiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdA
Z29vZ2xlLmNvbT4KPiA+IEZpeGVzOiBiZmYxMzliNDlkOWYgKCJmMmZzOiBoYW5kbGUgZGVjb21w
cmVzcyBvbmx5IHBvc3QgcHJvY2Vzc2luZyBpbiBzb2Z0aXJxIikKPiA+IFNpZ25lZC1vZmYtYnk6
IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJh
b2NvbmcgTGl1IDxiYW9jb25nLmxpdUB1bmlzb2MuY29tPgo+ID4gLS0tCj4gPiB2MjogdXNlIF9f
aWdldC9pcHV0IGZ1bmN0aW9uCj4gPiAtLS0KPiA+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxNiAr
KysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2Zz
L2YyZnMvY29tcHJlc3MuYwo+ID4gaW5kZXggYjNjMWRmOS4uM2YwYzE4ZCAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBA
QCAtMTY4Nyw3ICsxNjg3LDcgQEAgc3RhdGljIHZvaWQgZjJmc19yZWxlYXNlX2RlY29tcF9tZW0o
c3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9p
ZCBmMmZzX2ZyZWVfZGljKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+ID4gLSAgICAg
ICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95X2NhbGxiYWNrKTsKPiA+ICsgICAgICAgICAgICAg
Ym9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFjaywgYm9vbCBsYXRlX2ZyZWUpOwo+ID4KPiA+ICBz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmYyZnNfYWxsb2NfZGljKHN0cnVjdCBjb21wcmVzc19j
dHggKmNjKQo+ID4gIHsKPiA+IEBAIC0xNzQzLDEyICsxNzQzLDEyIEBAIHN0cnVjdCBkZWNvbXBy
ZXNzX2lvX2N0eCAqZjJmc19hbGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4gPiAg
ICAgICByZXR1cm4gZGljOwo+ID4KPiA+ICBvdXRfZnJlZToKPiA+IC0gICAgIGYyZnNfZnJlZV9k
aWMoZGljLCB0cnVlKTsKPiA+ICsgICAgIGYyZnNfZnJlZV9kaWMoZGljLCB0cnVlLCBmYWxzZSk7
Cj4gPiAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZv
aWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPiA+IC0gICAg
ICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFjaykKPiA+ICsgICAgICAgICAgICAg
Ym9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFjaywgYm9vbCBsYXRlX2ZyZWUpCj4gPiAgewo+ID4g
ICAgICAgaW50IGk7Cj4gPgo+ID4gQEAgLTE3NzUsNiArMTc3NSw4IEBAIHN0YXRpYyB2b2lkIGYy
ZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4gPiAgICAgICB9Cj4g
Pgo+ID4gICAgICAgcGFnZV9hcnJheV9mcmVlKGRpYy0+aW5vZGUsIGRpYy0+cnBhZ2VzLCBkaWMt
Pm5yX3JwYWdlcyk7Cj4gPiArICAgICBpZiAobGF0ZV9mcmVlKQo+ID4gKyAgICAgICAgICAgICBp
cHV0KGRpYy0+aW5vZGUpOwo+ID4gICAgICAga21lbV9jYWNoZV9mcmVlKGRpY19lbnRyeV9zbGFi
LCBkaWMpOwo+ID4gIH0KPiA+Cj4gPiBAQCAtMTc4MywxNiArMTc4NSwyMCBAQCBzdGF0aWMgdm9p
ZCBmMmZzX2xhdGVfZnJlZV9kaWMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gICAgICAg
c3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMgPQo+ID4gICAgICAgICAgICAgICBjb250YWlu
ZXJfb2Yod29yaywgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4LCBmcmVlX3dvcmspOwo+ID4KPiA+
IC0gICAgIGYyZnNfZnJlZV9kaWMoZGljLCBmYWxzZSk7Cj4gPiArICAgICBmMmZzX2ZyZWVfZGlj
KGRpYywgZmFsc2UsIHRydWUpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZvaWQgZjJmc19wdXRf
ZGljKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLCBib29sIGluX3Rhc2spCj4gPiAgewo+
ID4gICAgICAgaWYgKHJlZmNvdW50X2RlY19hbmRfdGVzdCgmZGljLT5yZWZjbnQpKSB7Cj4gPiAg
ICAgICAgICAgICAgIGlmIChpbl90YXNrKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgZjJm
c19mcmVlX2RpYyhkaWMsIGZhbHNlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBmMmZzX2Zy
ZWVfZGljKGRpYywgZmFsc2UsIGZhbHNlKTsKPiA+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBJTklUX1dPUksoJmRpYy0+ZnJlZV93b3JrLCBmMmZzX2xh
dGVfZnJlZV9kaWMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIC8qIHRvIGF2b2lkIGlub2Rl
IGlzIGV2aWN0ZWQgc2ltdWx0YW5lb3VzbHkgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBz
cGluX2xvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
X19pZ2V0KGRpYy0+aW5vZGUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2Nr
KCZkaWMtPmlub2RlLT5pX2xvY2spOwo+Cj4gT2gsIGhvdyBhYm91dCB1c2luZyBpZ3JhYigpIGlu
c3RlYWQ/CkhpIENoYW8sCmFmdGVyIEkgY2hlY2sgaWdyYWIsIEkgdGhpbmsgaXQgaXMgb2ssCmJ1
dCBoZXJlIFdlIGRvbid0IG5lZWQgY2FyZSBhYm91dCBpZ2FyYidzIHJldHVybiB2YWx1ZSwgcmln
aHQ/ClRoYW5rcyEKCj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBxdWV1ZV93b3JrKEYyRlNf
SV9TQihkaWMtPmlub2RlKS0+cG9zdF9yZWFkX3dxLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZGljLT5mcmVlX3dvcmspOwo+ID4gICAgICAgICAgICAgICB9Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
