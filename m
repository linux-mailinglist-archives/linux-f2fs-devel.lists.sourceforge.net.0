Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B196883E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 15:01:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl6gL-0007mz-08;
	Mon, 02 Sep 2024 13:01:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sl6gJ-0007ms-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BoNVOtDr+VrUOkBVF3JBkCILloNfEoHqSjUAIRQBmzY=; b=ZKn0E5qDbY5cDYxYnVVYz+PWHt
 ayfQIZh0FG7c+li0/yt0LE9hyVJel9VnnktbDvnWzwfooiLpjsgAXjOIpqavQHsGbK4vmpowuwq/+
 ouIj1vroq5WveRevwt10k/fRZxUvgYOORI++Ndtpi4GrRpBzJlFdWcbIrni9xoi0paKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BoNVOtDr+VrUOkBVF3JBkCILloNfEoHqSjUAIRQBmzY=; b=YNWD6/j9XVvIX4chs8CUXhcbwC
 27kFO3zfZF8YctLgpNGd/grY8H6Mksfy/Msek3UEI7mLV13ZvNFs05xJp8tE1nFYNI5neVeT+heY7
 cpB41ay762OKKASLmkZqvvYGUL068tvWMPaqCYifzoBk50UFjTem58bWEjWcZkeZ8jDQ=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sl6gJ-0003kx-IV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 13:01:20 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-201fba05363so29838845ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Sep 2024 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725282069; x=1725886869; darn=lists.sourceforge.net;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BoNVOtDr+VrUOkBVF3JBkCILloNfEoHqSjUAIRQBmzY=;
 b=fuQ+fdEWoNHrW3De8Erh8yCR/6j6rLrHm62bl0ujmZJkM9A9xUShwpF9e6S/W+DV9/
 OtwjSAG+r44FPO0D8N43x81ZAglphy8jUQfJ42aGybgXejEn1vEHxDq0JwWXk2ZvWwOU
 8765VVIvphx5a7LIkCXKmPs/qqtxCb0uLIPkenLUviJKHcTCpUAHrypAf+4vLr9tiAuT
 p8x4WiIYgC7JEsbKndNbSTs4Bq7CqnsL0B3uhUGhHW/vJxP82IeMCAK2M1J3MdiFWwCC
 9AdzFMjlTMUCyxKTNs1cALVbiT0MTrLH076giqtHJaOKcvXgPB4lR3E7O+A9tqlBSqhd
 ukvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725282069; x=1725886869;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BoNVOtDr+VrUOkBVF3JBkCILloNfEoHqSjUAIRQBmzY=;
 b=dbc7oORe+HBSlyyq0yOaHAlBXkCwIVvTqJ3KpYFlvuJFRebSvBSRSyZ6ptYo3XtstI
 P+L2pBMJpmelo0EPtu/leIdO+tTTNh8sC58QFXU7vdOT5eE343ZyNojQk28Napuwwim/
 z8zE4PMFgRaZZ5IT1SVpA3MfX3IakxbMaemxuSNZAbtrGy89mwvlgT1FfXqrYShDmENc
 QTsx/BpVepWW5IyORlkdvByxEGpYVAvdQ898FX8ORIryJOubv9j6TgaZ8ui8BbTMj9aw
 kQbaXDtURd0QbIglNCB24icTGhEfL/9FKSiVIaH07Eol2qFlunB0g0SgsLRG/e+fRmOG
 4/+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6TnOyVsuVDarp+L9EdQAQf0TlBsOB84wqw25JBIAuA275bCyPkGkkvGtbZQo+ZdlkPHWKDY8R3ZBsU8DCpBkm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzZiv2Nb/3BGztvep3pV80LW9NOKeAAsc5LyWvb5l30OfIl5Vbr
 70A/vB7KpbpBYIqs8AIaIS2LXLtDynpZpSbk1+y7HCsJXHXqCjwsT6blgw==
X-Google-Smtp-Source: AGHT+IEYlOZ1tNxKqmlqm0I3UXHQMbJrtLOYA/TfiVNX348opQCdQS5u0PCaJyMkkMz88hu7oq1BrQ==
X-Received: by 2002:a17:902:f549:b0:205:76f3:fc2c with SMTP id
 d9443c01a7336-20576f3ff48mr27866685ad.16.1725282066601; 
 Mon, 02 Sep 2024 06:01:06 -0700 (PDT)
Received: from [127.0.0.1] ([103.85.75.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20515537890sm65785455ad.180.2024.09.02.06.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:01:05 -0700 (PDT)
Message-ID: <8edbc0b87074fb9adcccb8b67032dc3a693c9bfa.camel@gmail.com>
From: Julian Sun <sunjunchao2870@gmail.com>
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 Sep 2024 21:01:02 +0800
In-Reply-To: <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
References: <20240828165425.324845-1-sunjunchao2870@gmail.com>
 <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2024-09-02 at 16:13 +0800,
 Chao Yu wrote: > > On 2024/8/29
 0:54, Julian Sun wrote: > > > > Hi, all. > > > > > > > > Recently syzbot
 reported a bug as following: > > > > > > > > kernel BUG at f [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sl6gJ-0003kx-IV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE
 flag when umounting a ro fs.
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
Cc: jaegeuk@kernel.org, syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCAyMDI0LTA5LTAyIGF0IDE2OjEzICswODAwLCBDaGFvIFl1IHdyb3RlOgo+ID4gT24g
MjAyNC84LzI5IDA6NTQsIEp1bGlhbiBTdW4gd3JvdGU6Cj4gPiA+ID4gSGksIGFsbC4KPiA+ID4g
PiAKPiA+ID4gPiBSZWNlbnRseSBzeXpib3QgcmVwb3J0ZWQgYSBidWcgYXMgZm9sbG93aW5nOgo+
ID4gPiA+IAo+ID4gPiA+IGtlcm5lbCBCVUcgYXQgZnMvZjJmcy9pbm9kZS5jOjg5NiEKPiA+ID4g
PiBDUFU6IDEgVUlEOiAwIFBJRDogNTIxNyBDb21tOiBzeXotZXhlY3V0b3I2MDUgTm90IHRhaW50
ZWQKPiA+ID4gPiA2LjExLjAtcmM0LXN5emthbGxlci0wMDAzMy1nODcyY2YyOGI4ZGY5ICMwCj4g
PiA+ID4gUklQOiAwMDEwOmYyZnNfZXZpY3RfaW5vZGUrMHgxNTk4LzB4MTVjMCBmcy9mMmZzL2lu
b2RlLmM6ODk2Cj4gPiA+ID4gQ2FsbCBUcmFjZToKPiA+ID4gPiDCoCA8VEFTSz4KPiA+ID4gPiDC
oCBldmljdCsweDUzMi8weDk1MCBmcy9pbm9kZS5jOjcwNAo+ID4gPiA+IMKgIGRpc3Bvc2VfbGlz
dCBmcy9pbm9kZS5jOjc0NyBbaW5saW5lXQo+ID4gPiA+IMKgIGV2aWN0X2lub2RlcysweDVmOS8w
eDY5MCBmcy9pbm9kZS5jOjc5Nwo+ID4gPiA+IMKgIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIrMHg5
ZC8weDJkMCBmcy9zdXBlci5jOjYyNwo+ID4gPiA+IMKgIGtpbGxfYmxvY2tfc3VwZXIrMHg0NC8w
eDkwIGZzL3N1cGVyLmM6MTY5Ngo+ID4gPiA+IMKgIGtpbGxfZjJmc19zdXBlcisweDM0NC8weDY5
MCBmcy9mMmZzL3N1cGVyLmM6NDg5OAo+ID4gPiA+IMKgIGRlYWN0aXZhdGVfbG9ja2VkX3N1cGVy
KzB4YzQvMHgxMzAgZnMvc3VwZXIuYzo0NzMKPiA+ID4gPiDCoCBjbGVhbnVwX21udCsweDQxZi8w
eDRiMCBmcy9uYW1lc3BhY2UuYzoxMzczCj4gPiA+ID4gwqAgdGFza193b3JrX3J1bisweDI0Zi8w
eDMxMCBrZXJuZWwvdGFza193b3JrLmM6MjI4Cj4gPiA+ID4gwqAgcHRyYWNlX25vdGlmeSsweDJk
Mi8weDM4MCBrZXJuZWwvc2lnbmFsLmM6MjQwMgo+ID4gPiA+IMKgIHB0cmFjZV9yZXBvcnRfc3lz
Y2FsbCBpbmNsdWRlL2xpbnV4L3B0cmFjZS5oOjQxNSBbaW5saW5lXQo+ID4gPiA+IMKgIHB0cmFj
ZV9yZXBvcnRfc3lzY2FsbF9leGl0IGluY2x1ZGUvbGludXgvcHRyYWNlLmg6NDc3Cj4gPiA+ID4g
W2lubGluZV0KPiA+ID4gPiDCoCBzeXNjYWxsX2V4aXRfd29yaysweGM2LzB4MTkwIGtlcm5lbC9l
bnRyeS9jb21tb24uYzoxNzMKPiA+ID4gPiDCoCBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlX3By
ZXBhcmUga2VybmVsL2VudHJ5L2NvbW1vbi5jOjIwMAo+ID4gPiA+IFtpbmxpbmVdCj4gPiA+ID4g
wqAgX19zeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlX3dvcmsga2VybmVsL2VudHJ5L2NvbW1vbi5j
OjIwNQo+ID4gPiA+IFtpbmxpbmVdCj4gPiA+ID4gwqAgc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9k
ZSsweDI3OS8weDM3MAo+ID4gPiA+IGtlcm5lbC9lbnRyeS9jb21tb24uYzoyMTgKPiA+ID4gPiDC
oCBkb19zeXNjYWxsXzY0KzB4MTAwLzB4MjMwIGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjg5Cj4g
PiA+ID4gwqAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zgo+ID4gPiA+
IAo+ID4gPiA+IFRoZSBzeXpib3QgY29uc3RydWN0ZWQgdGhlIGZvbGxvd2luZyBzY2VuYXJpbzog
Y29uY3VycmVudGx5Cj4gPiA+ID4gY3JlYXRpbmcgZGlyZWN0b3JpZXMgYW5kIHNldHRpbmcgdGhl
IGZpbGUgc3lzdGVtIHRvIHJlYWQtb25seS4KPiA+ID4gPiBJbiB0aGlzIGNhc2UsIHdoaWxlIGYy
ZnMgd2FzIG1ha2luZyBkaXIsIHRoZSBmaWxlc3lzdGVtCj4gPiA+ID4gc3dpdGNoZWQgdG8KPiA+
ID4gPiByZWFkb25seSwgYW5kIHdoZW4gaXQgdHJpZWQgdG8gY2xlYXIgdGhlIGRpcnR5IGZsYWcs
IGl0Cj4gPiA+ID4gdHJpZ2dlcmVkCj4gPiA+ID4gdGhpcwo+ID4gPiA+IGNvZGUgcGF0aDogZjJm
c19ta2RpcigpLT4gZjJmc19zeW5jX2ZzKCktCj4gPiA+ID4gPmYyZnNfd3JpdGVfY2hlY2twb2lu
dCgpCj4gPiA+ID4gLT5mMmZzX3JlYWRvbmx5KCkuIFRoaXMgcmVzdWx0ZWQgRklfRElSVFlfSU5P
REUgZmxhZyBub3QgYmVpbmcKPiA+ID4gPiBjbGVhcmVkLAo+ID4gPiA+IHdoaWNoIGV2ZW50dWFs
bHkgbGVkIHRvIGEgYnVnIGJlaW5nIHRyaWdnZXJlZCBkdXJpbmcgdGhlCj4gPiA+ID4gRklfRElS
VFlfSU5PREUKPiA+ID4gPiBjaGVjayBpbiBmMmZzX2V2aWN0X2lub2RlKCkuCj4gPiA+ID4gCj4g
PiA+ID4gSW4gdGhpcyBjYXNlLCB3ZSBjYW5ub3QgZG8gYW55dGhpbmcgZnVydGhlciwgc28gaWYg
ZmlsZXN5c3RlbQo+ID4gPiA+IGlzCj4gPiA+ID4gcmVhZG9ubHksCj4gPiA+ID4gZG8gbm90IHRy
aWdnZXIgdGhlIEJVRy4gSW5zdGVhZCwgY2xlYW4gdXAgcmVzb3VyY2VzIHRvIHRoZSBiZXN0Cj4g
PiA+ID4gb2YKPiA+ID4gPiBvdXIKPiA+ID4gPiBhYmlsaXR5IHRvIHByZXZlbnQgdHJpZ2dlcmlu
ZyBzdWJzZXF1ZW50IHJlc291cmNlIGxlYWsgY2hlY2tzLgo+ID4gPiA+IAo+ID4gPiA+IElmIHRo
ZXJlIGlzIGFueXRoaW5nIGltcG9ydGFudCBJJ20gbWlzc2luZywgcGxlYXNlIGxldCBtZSBrbm93
LAo+ID4gPiA+IHRoYW5rcy4KPiA+ID4gPiAKPiA+ID4gPiBSZXBvcnRlZC1ieToKPiA+ID4gPiBz
eXpib3QrZWJlYTI3OTA5MDQ2NzNkN2M2MThAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4g
PiA+IENsb3NlczogCj4gPiA+ID4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4
dGlkPWViZWEyNzkwOTA0NjczZDdjNjE4Cj4gPiA+ID4gRml4ZXM6IGNhN2Q4MDJhN2Q4ZSAoImYy
ZnM6IGRldGVjdCBkaXJ0eSBpbm9kZSBpbiBldmljdF9pbm9kZSIpCj4gPiA+ID4gQ0M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gU3VuIDxzdW5q
dW5jaGFvMjg3MEBnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gwqAgZnMvZjJmcy9pbm9k
ZS5jIHwgMyArKy0KPiA+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUu
YyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4gPiA+IGluZGV4IGFlZjU3MTcyMDE0Zi4uZWJmODI1ZGJh
MGE1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ID4gPiA+ICsrKyBiL2Zz
L2YyZnMvaW5vZGUuYwo+ID4gPiA+IEBAIC04OTIsNyArODkyLDggQEAgdm9pZCBmMmZzX2V2aWN0
X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljX3JlYWQoJmZpLT5pX2NvbXByX2Jsb2Nr
cykpOwo+ID4gPiA+IMKgIAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAobGlrZWx5KCFmMmZz
X2NwX2Vycm9yKHNiaSkgJiYKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAhaXNfc2JpX2ZsYWdfc2V0KHNiaSwKPiA+
ID4gPiBTQklfQ1BfRElTQUJMRUQpKSkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAhaXNfc2JpX2ZsYWdfc2V0KHNi
aSwKPiA+ID4gPiBTQklfQ1BfRElTQUJMRUQpKSAmJgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCFmMmZzX3JlYWRv
bmx5KHNiaS0+c2IpKQo+ID4gCj4gPiBJcyBpdCBmaW5lIHRvIGRyb3AgdGhpcyBkaXJ0eSBpbm9k
ZT8gU2luY2Ugb25jZSBpdCByZW1vdW50cyBmMmZzIGFzCj4gPiBydyBvbmUsCj4gPiBwcmV2aW91
cyB1cGRhdGVzIG9uIHN1Y2ggaW5vZGUgbWF5IGJlIGxvc3Q/IE9yIGFtIEkgbWlzc2luZwo+ID4g
c29tZXRoaW5nPwoKVGhlIHB1cnBvc2Ugb2YgY2FsbGluZyB0aGlzIGhlcmUgaXMgbWFpbmx5IHRv
IGF2b2lkIHRyaWdnZXJpbmcgdGhlCmYyZnNfYnVnX29uKHNiaSwgMSk7IHN0YXRlbWVudCBpbiB0
aGUgc3Vic2VxdWVudCBmMmZzX3B1dF9zdXBlcigpIGR1ZQp0byBhIHJlZmVyZW5jZSBjb3VudCBj
aGVjayBmYWlsdXJlLsKgCkkgd291bGQgc2F5IGl0J3MgcG9zc2libGUsIGJ1dCB0aGVyZSBkb2Vz
bid0IHNlZW0gdG8gYmUgbXVjaCBtb3JlIHdlCmNhbiBkbyBpbiB0aGlzIHNjZW5hcmlvOiB0aGUg
aW5vZGUgaXMgYWJvdXQgdG8gYmUgZnJlZWQsIGFuZCB0aGUgZmlsZQpzeXN0ZW0gaXMgcmVhZC1v
bmx5LiBPciBkbyB3ZSBuZWVkIGEgbWVjaGFuaXNtIHRvIHNhdmUgdGhlIGlub2RlIHRoYXQKaXMg
YWJvdXQgdG8gYmUgZnJlZWQgYW5kIHRoZW4gd3JpdGUgaXQgYmFjayB0byBkaXNrIGF0IHRoZSBh
cHByb3ByaWF0ZQp0aW1lIGFmdGVyIHRoZSBmaWxlIHN5c3RlbSBiZWNvbWVzIHJ3IGFnYWluPyBC
dXQgc3VjaCBhIG1lY2hhbmlzbQpzb3VuZHMgc29tZXdoYXQgY29tcGxleCBhbmQgYSBsaXR0bGUg
Yml0IG9mIHdlaXJkLi4uIERvIHlvdSBoYXZlIGFueQpzdWdnZXN0aW9ucz8KPiA+IAo+ID4gVGhh
bmtzLAo+ID4gCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmMmZzX2J1
Z19vbihzYmksIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLAo+ID4gPiA+IEZJX0RJUlRZX0lOT0RF
KSk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGYyZnNfaW5vZGVfc3luY2VkKGlub2RlKTsKPiA+IAoKClRoYW5rcywK
LS0gCkp1bGlhbiBTdW4gPHN1bmp1bmNoYW8yODcwQGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
