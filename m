Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487B82B3C3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 18:16:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNyf3-00062n-NS;
	Thu, 11 Jan 2024 17:16:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rNyf2-00062Y-4L
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 17:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPxIBj0Nu8xEORuneqUuWH8O+j39UTrFRFHSau6xBbI=; b=g1Ds2Qh6ldHPzhZp47lcfeXU3F
 0BIQmPDLZW+Jq8jcvZJ9T488aXvKEJVJ+4u3KqJ5xrQh+lUo1VHyTbPymI3JPKrzwTE1Nm67c8OUA
 2Cw1Ju/tMZiybDgeJg+7oh+1e0PsO+2/+dm8x3nRlEE1T1KATz77gfTM+QyS43saBKZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPxIBj0Nu8xEORuneqUuWH8O+j39UTrFRFHSau6xBbI=; b=EUeEwGRQS3tVevwBpmGa0Z41PY
 uy5yNQGvcXMKqNbMAtyv7CtkiNW/Mbu3Sy/tlZuh4+MruvHVov/1CE21NYT5TwyKu6WQMdoqcCGX4
 SebPqv5eCSOhKS+TBizChXeoIv5jOROBG2ZMoNAnsdYPpmkksknOsXoOAUHVoHoOT6Nk=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rNyex-0005p2-Gx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 17:16:07 +0000
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4678161e4cfso1618595137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704993351; x=1705598151; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPxIBj0Nu8xEORuneqUuWH8O+j39UTrFRFHSau6xBbI=;
 b=HZosAddkRdGNpmU/9CoN6Zk9uXd/HSmWVXxe4gn5UXA7w2CS1hXEixVD3cRmJCgKCM
 c8Bbuvl5L6rNazjcOuzHW1dDeJUeDnNJJ1G+h3FTHFfGulhYs68Q9vvxO0A8u+J1OVhP
 5++2WqpND3Vk16crCU1X6D1e5+lcj0VgXs1QuKwmXOSHvk7KhQgGl2iwZH/D6V6cvoZw
 NZptDl6kzr4KZ6RaT0OwHiKbCgdiOTynDMx0/pdeqBSMTDcEuL0UXojRx3Rof9HV0gBb
 FHuFz+PHLXPy1gzis8IHXd51EHQIVmoRX2lwBJauXgwvFfoSGyUqxNWvFAnL/NLsHN2w
 W6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704993351; x=1705598151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPxIBj0Nu8xEORuneqUuWH8O+j39UTrFRFHSau6xBbI=;
 b=DccFdhUFyM2y6b6Y9bnvdMEmnCWiBVE58GzlMJt+0o8kjFYg382OU7vKkUbFiCV40B
 vjnHGDUXvTcuSBqXvjyKIQFyPrdbW6WJDiaD15qavED23T7E58bHIup2EiBq5nOzMax9
 +lMT41lj0qNZepWjKh8vYdeekVsilfZQv6lj9SusUdk8fWWISYLyRncJ7uQ5349gZ1ue
 2o5SKoeG5Z+hxL5RM0rxawJAvd1KkNFIu1229HmxQEbqlhlbE3gjnVHq0k5cfQcLopsW
 r61nBLqhDoZM0UIwnketMVp43p8Nyb9ATBovwXokAh+2g2PFzfT6P2BTkooGgMDpkZYw
 sWHg==
X-Gm-Message-State: AOJu0YwrRDden9BfHmN7JQN0HtsI7aEXp12ySoq/yJHYyW942qFl7q8t
 7UImv/oU+tt2drQXAIVLmNLgNHqVW27wKlo9vY6NyEmamW14ZOlV
X-Google-Smtp-Source: AGHT+IGurpmaylu9PZFv0zDQOHwhHDlIYEEcR/qQFEaRbIGo8/ll684CFOtOfEk1QCAf2HWCJe9UvxixgjNZyEYBNao=
X-Received: by 2002:a05:6122:4a19:b0:4b6:dbfd:f89b with SMTP id
 ez25-20020a0561224a1900b004b6dbfdf89bmr202402vkb.27.1704993351400; Thu, 11
 Jan 2024 09:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-3-chao@kernel.org>
 <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
 <e7f4a835-6a4c-4f94-a79f-a425b04516e2@kernel.org>
In-Reply-To: <e7f4a835-6a4c-4f94-a79f-a425b04516e2@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 11 Jan 2024 09:15:40 -0800
Message-ID: <CACOAw_wzBTV=+cqZeiCZvhud1Ek06aW_5nJbg=9FF327MNgxEg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jan 10, 2024 at 5:33 PM Chao Yu wrote: > > On 2024/1/11
    9:18, Daeho Jeong wrote: > > On Thu, Dec 28, 2023 at 6:33 AM Chao Yu wrote:
    > >> > >> From: Sheng Yong > >> > >> Compressed cl [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rNyex-0005p2-Gx
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check
 unreleased compressed cluster
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

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgNTozM+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEvMTEgOToxOCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBUaHUsIERlYyAyOCwgMjAyMyBhdCA2OjMz4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IEZyb206IFNoZW5nIFlvbmcgPHNoZW5neW9uZ0BvcHBvLmNvbT4K
PiA+Pgo+ID4+IENvbXByZXNzZWQgY2x1c3RlciBtYXkgbm90IGJlIHJlbGVhc2VkIGR1ZSB0byB3
ZSBjYW4gZmFpbCBpbgo+ID4+IHJlbGVhc2VfY29tcHJlc3NfYmxvY2tzKCksIGZpeCB0byBoYW5k
bGUgcmVzZXJ2ZWQgY29tcHJlc3NlZAo+ID4+IGNsdXN0ZXIgY29ycmVjdGx5IGluIHJlc2VydmVf
Y29tcHJlc3NfYmxvY2tzKCkuCj4gPj4KPiA+PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczog
c3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25n
IDxzaGVuZ3lvbmdAb3Bwby5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICAgZnMvZjJmcy9maWxlLmMgfCAxMiArKysrKysrKysr
KysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+IGluZGV4IDAyNmQw
NWE3ZWRkOC4uNzgyYWUzYmU0OGY2IDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4g
Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+PiBAQCAtMzYyNCw2ICszNjI0LDE1IEBAIHN0YXRp
YyBpbnQgcmVzZXJ2ZV9jb21wcmVzc19ibG9ja3Moc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBw
Z29mZl90IGNvdW50KQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
bmV4dDsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4+Cj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyoKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgKiBjb21wcmVz
c2VkIGNsdXN0ZXIgd2FzIG5vdCByZWxlYXNlZCBkdWUgdG8KPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgKiBpdCBmYWlscyBpbiByZWxlYXNlX2NvbXByZXNzX2Jsb2NrcygpLgo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
IChibGthZGRyID09IE5FV19BRERSKSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb21wcl9ibG9ja3MrKzsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+PiArCj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRy
KSkgewo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXByX2Jsb2Nrcysr
Owo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4KPiA+
IEhvdyBhYm91dCBtZXJnaW5nIHR3byBjb25kaXRpb25zIGxpa2UgImJsa2FkZHIgPT0gTkVXX0FE
RFIgfHwKPiA+IF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpIj8KPgo+IE9oLCBzdXJl
Lgo+Cj4gPgo+ID4+IEBAIC0zNjMzLDYgKzM2NDIsOSBAQCBzdGF0aWMgaW50IHJlc2VydmVfY29t
cHJlc3NfYmxvY2tzKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgcGdvZmZfdCBjb3VudCkKPiA+
PiAgICAgICAgICAgICAgICAgIH0KPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICAgcmVzZXJ2ZWQg
PSBjbHVzdGVyX3NpemUgLSBjb21wcl9ibG9ja3M7Cj4gPj4gKyAgICAgICAgICAgICAgIGlmICgh
cmVzZXJ2ZWQpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4+ICsK
PiA+Cj4gPiBIb3cgY2FuIHRoZSByZXNlcnZlZCB2YXJpYWJsZSBiZSB6ZXJvPwo+Cj4gSSBndWVz
cyBpdCBjYW4gaGFwcGVuIGlmIGEgY2x1c3RlciB3YXMgbm90IHJlbGVhc2VkIGR1cmluZwo+IHJl
bGVhc2VfY29tcHJlc3NfYmxvY2tzKCksIHRoZW4gYWxsIGJsb2NrcyBpbiB0aGUgY2x1c3RlciBz
aG91bGQKPiBoYXMgYmVlbiByZXNlcnZlZCwgc28sIGluIHRoaXMgcm91bmQgb2YgcmVzZXJ2aW5n
LCBpdCBuZWVkcyB0byBza2lwCj4gcmVzZXJ2ZSBibG9ja3MsIHJpZ2h0PwoKTGV0J3MgYXNzdW1l
IGNsdXN0ZXJfc2l6ZSBpcyA0LiBIb3cgY2FuIGNvbXByX2Jsb2NrcyBiZSA0PwoKICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChibGthZGRyID09IENPTVBSRVNTX0FERFIpCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbi0+b2ZzX2luX25vZGUgKz0gY2x1c3Rlcl9zaXplOwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gbmV4dDsKICAgICAgICAgICAgICAgICAgICAgICAgfQoKV2Ugc2tpcCB0
aGUgYmxvY2sgaGF2aW5nIENPTVBSRVNTX0FERFIgd2hlbiBjb3VudGluZyBjb21wcl9ibG9ja3Mu
ClNvLCB0aGUgbWF4aW11bSB2YWx1ZSBvZiBjb21wcl9ibG9ja3Mgc2hvdWxkIGJlIDMsIHJpZ2h0
PwoKPgo+IFRoYW5rcywKPgo+ID4KPiA+PiAgICAgICAgICAgICAgICAgIHJldCA9IGluY192YWxp
ZF9ibG9ja19jb3VudChzYmksIGRuLT5pbm9kZSwgJnJlc2VydmVkKTsKPiA+PiAgICAgICAgICAg
ICAgICAgIGlmIChyZXQpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPj4gLS0KPiA+PiAyLjQwLjEKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+
PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
