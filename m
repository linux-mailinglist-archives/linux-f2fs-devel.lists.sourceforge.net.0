Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 377F9ACDC22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 12:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3oLBStnNrvMHC0Q56vubjIpoQ8KMZB30FvD/uS38SQ=; b=BsjRQW9TWFV2pCIKFNNHPu1KZR
	hSdtncV61jQDGRV+BobPSd5d3hrznxGvy4dNKti0cGto0jt/cR6BNTCuyumXWOA7FYYLnkPWEaEiD
	novw7umgo0gTHVyM6+kFO8uqvhB6217VjE/Uc519WXXmbF9FWRMvK332HeELE17awDHk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMlgu-0006KG-M4;
	Wed, 04 Jun 2025 10:49:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uMlgn-0006K5-5A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 10:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=; b=Fhrc6wojQygzYD5T2tWBIIVd4F
 R636kRBy1CPRL4Ih7+/MmfvDQ7NmhS2LifOMUZr1mKNx83+6gt8KeGRre0mzP3WHgsc46zRBRyNdQ
 JdBjkCGOJVRrzNJ0K2DRcFNoM/Fy8A1XRpoYGNYX7M22hHfK1Fz/WIBwZQWxz9H58vz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=; b=VRSLmd38PtRCfjCmXtBxrfNdAP
 kwvlDz/kig6A4dGPTYDoda2QNfaraJYmsW6+4YKyFgZgkpYULHPo0crjoje3aTBeW//0eX0jWRHD9
 pzB3aA2jvV45KQazDPgcdjSq4nWJAIiiZN0Hy1jbSo7N4W4rFJf7K4/TZsB1p4pH20jw=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMlgm-0004OD-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 10:49:45 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a4eed70f24so777155f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749034173; x=1749638973; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=;
 b=FOFV1V7rnXydm+HkD+V1t0f4oH/zI3UUB2TWuTnF+rqrjISTxvimMKtF3FQMh8+eiA
 Vb6Q4Fba3gwdevoDHHUM2+YXRuG0s1+vFcW39U5OkxYFZ9eyea7uYwuEa7wmBzwdSCNu
 gPneBBWdIws3bnzj1d9IxUogHYj/g3ol9VFcJ52pCsRziOAvjhXd4aSfQvEneBCa7IvM
 sjcw7AUgcrHpgiPNxHKob3AxGMm5B0dCf5tUEkhf/O8RYY8KRyUEFvbzXoZA1WvIwsF8
 QFwLxewdE7L8IV5LJnMWt+k/dvQWTnR3UcReLp/AUJ2Y9/8tiIO2SlwAjhO3tBpLYej9
 0BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749034173; x=1749638973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWimSkfWm5JH4ZLawa6c2SjXJDNrI4LeXxoo3qltBvk=;
 b=o0IUZh5W+gYjYPfmJbBHTEecNl6wkraECP0aHYf4a/kYWyiDxsx01MdUgzAXEYwqt7
 VYbX+ky7EovfAoxuVvL358pokczS6N1UdfQ4IIgo1/f1ya5cKDVzEEJ3aQEfP4XD5Fbw
 lQIoig84SbKaFpvAAsHcu2nfgI88IE61wTRWfXwlPjNRPHTEyAHhZOVQEU6kkWuQC/rn
 vpoGduVMatme+c3bTG6kybwPtYkAMDrOtbpmK0MVRji6yqj+3aFwyxKYMTQFr4fmo45Z
 9NyjG3kKRA8g86CbRVBYvs/QOuOMTUmlDaagnsGtvuAu5eY9LLgyGqhON1pQ2uPm5qqU
 ZqFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWfzp7veI3X1+aiWIp2g0FI13qt6JATT4z9+aLLWPbmDJG10yYjw6F/1cl9zVAUonCaaoBKyPsJjkPRFmSmXlo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YygZC8m3UFYbpPGlKaxIiJlj3HS+qoPhUjyExdWcxU89qiaeJY3
 v+7iZ0mOKPsXLsG+76oc+cdnrry7eVy02ZKWTT0WW3RVkA136wb1QBPCaqiQxrWWpqSiUKiZUpX
 mn1kjY890UrMunMIx9rMTpTb7/shh+A0=
X-Gm-Gg: ASbGncuXxYUGZnMqmtW1rD6UYpmHdhTzdSz5mMuuhdH1NBNB5sxbDvxmovvvKatrWpP
 CG2REiWXiE+YkQ9hvv2QMKV1LxbDbHeacuf8ldO9D06DNebgu0QH3fVi57/qu+3kx5cC8f4APhg
 N5Z3Q7qVbMYbdP9mNraRG7ES5cezVFMHhhCw==
X-Google-Smtp-Source: AGHT+IEhWr/oJ8E1Zyy+W66pCjIpMxWHTixzW7gMc8tMPHE5zIr4Q479fvioLoa7TY4uLVTgBq1zVIJbucTNp0WLh2o=
X-Received: by 2002:a05:6000:1887:b0:3a4:e667:9226 with SMTP id
 ffacd0b85a97d-3a51d95dc6bmr683154f8f.10.1749034172575; Wed, 04 Jun 2025
 03:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
 <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
In-Reply-To: <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 4 Jun 2025 18:49:21 +0800
X-Gm-Features: AX0GCFvCuty0imqhT_17dlR0lz_ZTGEqCRFE17Z47gaugw1FbiJUIKH6XW1W_M8
Message-ID: <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月4日周三 17:48写道： > > On 6/4/25
    13:54, Zhiguo Niu wrote: > > The decompress_io_ctx may be released asynchronously
    after > > I/O completion. If this file is deleted imme [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.43 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.43 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.43 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.43 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1uMlgm-0004OD-Ck
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix UAF of f2fs_inode_info
 in f2fs_free_dic
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDTml6XlkajkuIkgMTc6NDjl
hpnpgZPvvJoKPgo+IE9uIDYvNC8yNSAxMzo1NCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IFRoZSBk
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
Pgo+ID4gVGhpcyBwYXRjaCBpbmNyZWFzZSBpbm9kZS0+aV9jb3VudCBiZWZvcmUgZjJmc19mcmVl
X2RpYyBhbmQgZGVjcmVhc2UgaXQKPiA+IGFmdGVyIGZyZWUgdGhlIGRpYy4KPiA+Cj4gPiBDYzog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IEZpeGVzOiBiZmYxMzliNDlk
OWYgKCJmMmZzOiBoYW5kbGUgZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJvY2Vzc2luZyBpbiBzb2Z0
aXJxIikKPiA+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhb2NvbmcgTGl1IDxiYW9jb25nLmxpdUB1bmlzb2MuY29t
Pgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMTkgKysrKysrKysrKysrKystLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNz
LmMKPiA+IGluZGV4IGIzYzFkZjkuLjZiM2IzYTcgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2Nv
bXByZXNzLmMKPiA+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gQEAgLTE2ODcsNyArMTY4
Nyw3IEBAIHN0YXRpYyB2b2lkIGYyZnNfcmVsZWFzZV9kZWNvbXBfbWVtKHN0cnVjdCBkZWNvbXBy
ZXNzX2lvX2N0eCAqZGljLAo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2Rp
YyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPiA+IC0gICAgICAgICAgICAgYm9vbCBi
eXBhc3NfZGVzdHJveV9jYWxsYmFjayk7Cj4gPiArICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rl
c3Ryb3lfY2FsbGJhY2ssIGJvb2wgbGF0ZV9mcmVlKTsKPiA+Cj4gPiAgc3RydWN0IGRlY29tcHJl
c3NfaW9fY3R4ICpmMmZzX2FsbG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+ICB7
Cj4gPiBAQCAtMTc0MywxMiArMTc0MywxMiBAQCBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmYy
ZnNfYWxsb2NfZGljKHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQo+ID4gICAgICAgcmV0dXJuIGRp
YzsKPiA+Cj4gPiAgb3V0X2ZyZWU6Cj4gPiAtICAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSk7
Cj4gPiArICAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSwgZmFsc2UpOwo+ID4gICAgICAgcmV0
dXJuIEVSUl9QVFIocmV0KTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9k
aWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4gPiAtICAgICAgICAgICAgIGJvb2wg
YnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2spCj4gPiArICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rl
c3Ryb3lfY2FsbGJhY2ssIGJvb2wgbGF0ZV9mcmVlKQo+ID4gIHsKPiA+ICAgICAgIGludCBpOwo+
ID4KPiA+IEBAIC0xNzc1LDYgKzE3NzUsMTEgQEAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICBw
YWdlX2FycmF5X2ZyZWUoZGljLT5pbm9kZSwgZGljLT5ycGFnZXMsIGRpYy0+bnJfcnBhZ2VzKTsK
PiA+ICsgICAgIGlmIChsYXRlX2ZyZWUpIHsKPiA+ICsgICAgICAgICAgICAgc3Bpbl9sb2NrKCZk
aWMtPmlub2RlLT5pX2xvY2spOwo+ID4gKyAgICAgICAgICAgICBhdG9taWNfZGVjKCZkaWMtPmlu
b2RlLT5pX2NvdW50KTsKPiA+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRpYy0+aW5vZGUt
PmlfbG9jayk7Cj4KPiBJZiBpdCBpcyB0aGUgbGFzdCBvbmUgcmVsZWFzZSBpX2NvdW50LCBpdCBu
ZWVkcyB0byBjYWxsIGlwdXRfZmluYWwgdG8gZXZpY3QgaW5vZGUKPiBsaWtlIHdoYXQgaXB1dCBk
aWQsIHNvIHdlJ2QgYmV0dGVyIHRvIGNhbGwgaXB1dCgpIGhlcmU/CkhpIENoYW8sClllcywgd2Ug
aGF2ZSBhbHNvIHRlc3RlZCB0aGlzIG1ldGhvZChpcHV0L19faWdldCksIGFuZCBpdCB3b3JrZWQu
Ckp1c3QgdGhpbmsgSXQgaXMgc2ltcGxlciBhbmQgZWFzaWVyIHRvIHJlYWQgdG8gZGlyZWN0bHkg
b3BlcmF0ZQppX2NvdW50LCBhbmQgdGhlbiBmcmVlIGl0CmJ5IHJlbHlpbmcgb24gdGhlIG1lbW9y
eSBtb2R1bGUgd2hlbiBpX2NvdW50PTAuCkJ1dCBJdCBzZWVtcyBpcHV0L19faWdldCBpcyBiZXR0
ZXIuCj4KPiA+ICsgICAgIH0KPiA+ICAgICAgIGttZW1fY2FjaGVfZnJlZShkaWNfZW50cnlfc2xh
YiwgZGljKTsKPiA+ICB9Cj4gPgo+ID4gQEAgLTE3ODMsMTYgKzE3ODgsMjAgQEAgc3RhdGljIHZv
aWQgZjJmc19sYXRlX2ZyZWVfZGljKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiA+ICAgICAg
IHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljID0KPiA+ICAgICAgICAgICAgICAgY29udGFp
bmVyX29mKHdvcmssIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCwgZnJlZV93b3JrKTsKPiA+Cj4g
PiAtICAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2UpOwo+ID4gKyAgICAgZjJmc19mcmVlX2Rp
YyhkaWMsIGZhbHNlLCB0cnVlKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGYyZnNfcHV0
X2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYm9vbCBpbl90YXNrKQo+ID4gIHsK
PiA+ICAgICAgIGlmIChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJmRpYy0+cmVmY250KSkgewo+ID4g
ICAgICAgICAgICAgICBpZiAoaW5fdGFzaykgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGYy
ZnNfZnJlZV9kaWMoZGljLCBmYWxzZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19m
cmVlX2RpYyhkaWMsIGZhbHNlLCBmYWxzZSk7Cj4gPiAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgSU5JVF9XT1JLKCZkaWMtPmZyZWVfd29yaywgZjJmc19s
YXRlX2ZyZWVfZGljKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiB0byBhdm9pZCBpbm9k
ZSBpcyBldmljdGVkIHNpbXVsdGFuZW91c2x5ICovCj4gPiArICAgICAgICAgICAgICAgICAgICAg
c3Bpbl9sb2NrKCZkaWMtPmlub2RlLT5pX2xvY2spOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGF0b21pY19pbmMoJmRpYy0+aW5vZGUtPmlfY291bnQpOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHNwaW5fdW5sb2NrKCZkaWMtPmlub2RlLT5pX2xvY2spOwo+Cj4gaWdldCgpPwo+Cj4gQlRX
LCBjYW4gd2Ugc3RvcmUgaV9jb21wcmVzc19hbGdvcml0aG0gaW4gZGljIHRvIGF2b2lkIGlub2Rl
IGFjY2Vzcz8KCkFsc28gdGhvdWdodCBvZiB0aGlzIG1ldGhvZCwgYnV0IGl0IHdvdWxkIHJlcXVp
cmUgbW9yZSBjaGFuZ2VzLgpkaWMtPmlub2RlIHVzZWQgaW4gZjJmc19mcmVlX2RpYyBhcmUgYWxs
IG5lZWRlZCB0byBtb2RpZnkgZXhjZXB0CmlfY29tcHJlc3NfYWxnb3JpdGhtLgpzdWNoIGFzICBw
YWdlX2FycmF5X2ZyZWUoZGljLT5pbm9kZSksCmFsbG93X21lbWFsbG9jX2Zvcl9kZWNvbXAoRjJG
U19JX1NCKGRpYy0+aW5vZGUpKS4KCkRvIHlvdSBoYXZlIGFueSBvdGhlciBzdWdnZXN0aW9ucz8K
dGhhbmtz77yBCgo+Cj4gVGhhbmtzLAo+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcXVldWVf
d29yayhGMkZTX0lfU0IoZGljLT5pbm9kZSktPnBvc3RfcmVhZF93cSwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRpYy0+ZnJlZV93b3JrKTsKPiA+ICAgICAgICAg
ICAgICAgfQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
