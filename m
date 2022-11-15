Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F46291B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 07:01:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oup17-0007sA-BL;
	Tue, 15 Nov 2022 06:01:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1oup16-0007s4-6K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QiPp9wXW5sYNgbM5DvpWBRIpbsokJEIfqnGv+ONh+jQ=; b=hjfnBDIIPvY2eN7ZF2PhqeJsBv
 cxfwP1rjMqGZklih2uaM9YQGNlfrGO3BC5MaT45CkVkYghAhk/RRORR35jRHN10kG3XGXW0k9sPPr
 885P00zXtJxe8nhIuY6BMzb4gZLGpPfJXF9Fuu0I06lQrcnzwy50PaVXSdzNsoA21hJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QiPp9wXW5sYNgbM5DvpWBRIpbsokJEIfqnGv+ONh+jQ=; b=MbbdfImcVaxZfQWKRPh7EmMNag
 mGzKyYAi9/7xUHRVvw3qahSodjUse11uHLqifZgjjOqNjSrrwbP/DZyGILWR8ZT4+fJywLLoqmVHe
 faFpoMU9yqtic4CuvpP5WIuV05OJrOvgLmjTZ6UQeWyXbAREzFM9+5po/XQs3krADcb8=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oup15-0006nG-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:01:52 +0000
Received: by mail-pl1-f182.google.com with SMTP id 4so12268972pli.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 22:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiPp9wXW5sYNgbM5DvpWBRIpbsokJEIfqnGv+ONh+jQ=;
 b=o91OP2cOwAObkCIdomSMPtkVh6/AFSANjM2FOi4LPfy1Aj2zyJwkc7rL57VXp+v+JV
 U0bEhqJwnlrO4HzpqBgAcgv0dgghmslptSEyr0gxJTEHufW4CglBymNmqd+c0KZkQPSl
 xIKOGlRTAz7TVH6tNAouThmUSj9zbjA2/AZ9yXwlJb4PxUHat4PduEdDQmCu2QANiCyy
 2b62vsfXZ1K2PvtPEicXTmY6/nm01myJKTXJcKX2DwTGSl1jPlIbNEBBbh+1w8uhfy0o
 kNs415tq0ipywjBRTZSWV+ubdILzKne1myp8AZSp7fC2+U34617r+VfMLyI+8v0BL6cP
 K9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QiPp9wXW5sYNgbM5DvpWBRIpbsokJEIfqnGv+ONh+jQ=;
 b=yIcmMwp9rZSDdlko2vVVRqNyLYgDEgccymlDs1kk5CSvcJFyiCXwawe1CUlFU5Kh1d
 EirlXe6UTg7lUmpdNSQ4e6nKR+YO5FVgC+Guv0k/rzzVoz1ouZSxrifC4+sTP0u+X0rT
 e1qnDtTmGHNRgeC8PWACApmtn+9UMIs8exVG4XpEqnsiVckOf7TFgcPyf3A63rGM4Exw
 u/jHPegOj7f+AB20Uld+EJeaR/2cl0O9Hbs4zuc96o2svW/FA9KmRoAbxXNwPvynln6m
 2WnUv2WAlAT1yFY+jr2e/hyqrG+jtEqmw1sg0jc8rRr/Ul/LlI8Nn4ZLAo0s07XwH5QD
 wkuw==
X-Gm-Message-State: ANoB5pk5F846RmQHWa5Fd/Lu/UOrkHkkpFoNm9xJMJA0eyUx38/53xkR
 YymiK8NvJxdQwyVObWpj/GM=
X-Google-Smtp-Source: AA0mqf73GV1ED3D3eOWsTAvWueAS/bMZagXzDGgkSkpTUN/TrPs2S2pXi9pb7C/bjNlVg4kGA9q6Fw==
X-Received: by 2002:a17:902:aa0a:b0:186:944a:2560 with SMTP id
 be10-20020a170902aa0a00b00186944a2560mr2614507plb.84.1668492105905; 
 Mon, 14 Nov 2022 22:01:45 -0800 (PST)
Received: from [10.114.96.21] ([129.227.152.6])
 by smtp.gmail.com with ESMTPSA id
 187-20020a6206c4000000b0056d2317455bsm7732431pfg.7.2022.11.14.22.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 22:01:45 -0800 (PST)
Message-ID: <abaa605d-a288-b6d5-49f5-932d4497c207@gmail.com>
Date: Tue, 15 Nov 2022 14:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
 <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
 <983de611-a9e7-56d0-d375-f2b54e1f4d05@kernel.org>
 <7f221206-a29c-08ee-dfae-d4875bf7205d@gmail.com>
 <29fa9df4-dc5f-a944-a150-68d34904cc91@kernel.org>
From: Yuwei Guan <ssawgyw@gmail.com>
In-Reply-To: <29fa9df4-dc5f-a944-a150-68d34904cc91@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/15 9:23, Chao Yu wrote: > On 2022/11/15 0:13,
 Yuwei
 Guan wrote: >> >> On 2022/11/14 22:42, Chao Yu wrote: >>> On 2022/11/12 16:32, 
 Yuwei Guan wrote: >>>> The commit 84b89e5d943d8 ("f2fs: ad [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oup15-0006nG-Hn
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to alloc_mode changed after
 remount on a small volume device
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjIvMTEvMTUgOToyMywgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzExLzE1IDA6MTMs
IFl1d2VpIEd1YW4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjIvMTEvMTQgMjI6NDIsIENoYW8gWXUgd3Jv
dGU6Cj4+PiBPbiAyMDIyLzExLzEyIDE2OjMyLCBZdXdlaSBHdWFuIHdyb3RlOgo+Pj4+IFRoZSBj
b21taXQgODRiODllNWQ5NDNkOCAoImYyZnM6IGFkZCBhdXRvIHR1bmluZyBmb3Igc21hbGwgCj4+
Pj4gZGV2aWNlcyIpIGFkZAo+Pj4+IHR1bmluZyBmb3Igc21hbGwgdm9sdW1lIGRldmljZSwgbm93
IHN1cHBvcnQgdG8gdHVuZSBhbGxvY2VfbW9kZSB0byAKPj4+PiAncmV1c2UnCj4+Pj4gaWYgaXQn
cyBzbWFsbCBzaXplLiBCdXQgdGhlIGFsbG9jX21vZGUgd2lsbCBjaGFuZ2UgdG8gJ2RlZmF1bHQn
IAo+Pj4+IHdoZW4gZG8KPj4+PiByZW1vdW50IG9uIHRoaXMgc21hbGwgc2l6ZSBkaWV2Y2UuCj4+
Pj4KPj4+PiBUaGUgY29tbWl0IDRjYWM5MGQ1NDkxYzkgKCJmMmZzOiByZWxvY2F0ZSByZWFkZGly
X3JhIGNvbmZpZ3VyZQo+Pj4+IGluaXRpYWxpemF0aW9uIikgcmVsb2NhdGVzIHJlYWRkaXJfcmEg
dmFyaWFibGUgdG8gdHVuaW5nIHByb2Nlc3MuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGZvIGZpeCBh
bGxvY19tb2RlIGNoYW5nZWQgd2hlbiBkbyByZW1vdW50IGZvciBhIHNtYWxsIAo+Pj4+IHZvbHVt
ZQo+Pj4+IGRldmljZS4KPj4+Pgo+Pj4+IEZvciBhIHNtYWxsIGRldmljZSwKPj4+PiAtIGFsbG9j
X21vZGUgd2lsbCBrZWVwICdyZXVzZScsIGlmIG5vIGFsbG9jX21vZGUgb3B0aW9uIGluIHJlbW91
bnQKPj4+PiDCoMKgIGNvbW1hbmQsCj4+Pj4gLSBhbGxvY19tb2RlIHdpbGwgYmUgc2V0IGFzIHJl
bW91bnQgY29tbWFuZCwgaWYgaXQgaGFzICdhbGxvY19tb2RlPScuCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBZdXdlaSBHdWFuIDxZdXdlaS5HdWFuQHplZWtybGlmZS5jb20+Cj4+Pj4gLS0tCj4+
Pj4gwqAgZnMvZjJmcy9zdXBlci5jIHwgMzcgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZz
L3N1cGVyLmMKPj4+PiBpbmRleCAzODM0ZWFkMDQ2MjAuLjJmMzY4MjRmZjg0YiAxMDA2NDQKPj4+
PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBA
QCAtMjE5MCw2ICsyMTkwLDIzIEBAIHN0YXRpYyB2b2lkIGYyZnNfZW5hYmxlX2NoZWNrcG9pbnQo
c3RydWN0IAo+Pj4+IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+IMKgwqDCoMKgwqAgZjJmc19mbHVz
aF9ja3B0X3RocmVhZChzYmkpOwo+Pj4+IMKgIH0KPj4+PiDCoCArc3RhdGljIHZvaWQgZjJmc190
dW5pbmdfcGFyYW1ldGVycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIAo+Pj4+IGJvb2wgaXNf
cmVtb3VudCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IGYyZnNfc21faW5mbyAqc21faSA9
IFNNX0koc2JpKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKiBhZGp1c3QgcGFyYW1ldGVycyBhY2Nv
cmRpbmcgdG8gdGhlIHZvbHVtZSBzaXplICovCj4+Pj4gK8KgwqDCoCBpZiAoc21faS0+bWFpbl9z
ZWdtZW50cyA8PSBTTUFMTF9WT0xVTUVfU0VHTUVOVFMpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
RjJGU19PUFRJT04oc2JpKS5hbGxvY19tb2RlID0gQUxMT0NfTU9ERV9SRVVTRTsKPj4+Cj4+PiBI
b3cgYWJvdXQgbW92aW5nIGFib3ZlIGxvZ2ljIGludG8gZGVmYXVsdF9vcHRpb25zKCk/Cj4+Pgo+
PiBIaSBDaGFvLAo+Pgo+PiAnc21faS0+bWFpbl9zZWdtZW50cycgaW5pdCBpbiBmdW5jICdmMmZz
X2J1aWxkX3NlZ21lbnRfbWFuYWdlcigpJywKPj4KPj4gd2hlbiBkbyBmaWxsIHN1cGVyIHByb2Nl
c3MsIHNvIGl0IGNhbm5vdCBtb3ZlIGludG8gZGVmYXVsdF9vcHRpb25zKCkuCj4KPiBIb3cgYWJv
dXQgY2hlY2tpbmcgbGUzMl90b19jcHUocmF3X3N1cGVyLT5zZWdtZW50X2NvdW50X21haW4pIGRp
cmVjdGx5Pwo+CkhpIENoYW8sCgpUaGFua3MgYSBsb3QgZm9yIGl0LCBJIHdpbGwgdXBkYXRlIHdp
dGggdjEgcGF0Y2guCgo+IFRoYW5rcywKPgo+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKGYyZnNfYmxvY2tfdW5pdF9kaXNjYXJkKHNiaSkpCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc21faS0+ZGNjX2luZm8tPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSAxOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBzbV9pLT5pcHVfcG9saWN5ID0gMSA8PCBGMkZTX0lQVV9GT1JD
RSB8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEgPDwgRjJG
U19JUFVfSE9OT1JfT1BVX1dSSVRFOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKg
IGlmICghaXNfcmVtb3VudCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgc2JpLT5yZWFkZGlyX3JhID0g
MTsKPj4+PiArfQo+Pj4+ICsKPj4+PiDCoCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFyIAo+Pj4+ICpkYXRhKQo+Pj4+IMKgIHsK
Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfU0Ioc2IpOwo+
Pj4+IEBAIC0yMjQ4LDYgKzIyNjUsOCBAQCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qg
c3VwZXJfYmxvY2sgCj4+Pj4gKnNiLCBpbnQgKmZsYWdzLCBjaGFyICpkYXRhKQo+Pj4+IMKgIMKg
wqDCoMKgwqAgZGVmYXVsdF9vcHRpb25zKHNiaSk7Cj4+Pj4gwqAgK8KgwqDCoCBmMmZzX3R1bmlu
Z19wYXJhbWV0ZXJzKHNiaSwgdHJ1ZSk7Cj4+Pj4gKwo+Pj4+IMKgwqDCoMKgwqAgLyogcGFyc2Ug
bW91bnQgb3B0aW9ucyAqLwo+Pj4+IMKgwqDCoMKgwqAgZXJyID0gcGFyc2Vfb3B0aW9ucyhzYiwg
ZGF0YSwgdHJ1ZSk7Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+Pj4+IEBAIC00MDU0LDIyICs0
MDczLDYgQEAgc3RhdGljIGludCBmMmZzX3NldHVwX2Nhc2Vmb2xkKHN0cnVjdCAKPj4+PiBmMmZz
X3NiX2luZm8gKnNiaSkKPj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+IMKgIH0KPj4+PiDC
oCAtc3RhdGljIHZvaWQgZjJmc190dW5pbmdfcGFyYW1ldGVycyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCj4+Pj4gLXsKPj4+PiAtwqDCoMKgIHN0cnVjdCBmMmZzX3NtX2luZm8gKnNtX2kgPSBT
TV9JKHNiaSk7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqAgLyogYWRqdXN0IHBhcmFtZXRlcnMgYWNjb3Jk
aW5nIHRvIHRoZSB2b2x1bWUgc2l6ZSAqLwo+Pj4+IC3CoMKgwqAgaWYgKHNtX2ktPm1haW5fc2Vn
bWVudHMgPD0gU01BTExfVk9MVU1FX1NFR01FTlRTKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIEYy
RlNfT1BUSU9OKHNiaSkuYWxsb2NfbW9kZSA9IEFMTE9DX01PREVfUkVVU0U7Cj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIGlmIChmMmZzX2Jsb2NrX3VuaXRfZGlzY2FyZChzYmkpKQo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNtX2ktPmRjY19pbmZvLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gMTsK
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc21faS0+aXB1X3BvbGljeSA9IDEgPDwgRjJGU19JUFVfRk9S
Q0UgfAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxIDw8IEYy
RlNfSVBVX0hPTk9SX09QVV9XUklURTsKPj4+PiAtwqDCoMKgIH0KPj4+PiAtCj4+Pj4gLcKgwqDC
oCBzYmktPnJlYWRkaXJfcmEgPSAxOwo+Pj4+IC19Cj4+Pj4gLQo+Pj4+IMKgIHN0YXRpYyBpbnQg
ZjJmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQgKmRhdGEsIAo+Pj4+
IGludCBzaWxlbnQpCj4+Pj4gwqAgewo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpOwo+Pj4+IEBAIC00NDc1LDcgKzQ0NzgsNyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9z
dXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgCj4+Pj4gKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50
KQo+Pj4+IMKgIMKgwqDCoMKgwqAgZjJmc19qb2luX3Nocmlua2VyKHNiaSk7Cj4+Pj4gwqAgLcKg
wqDCoCBmMmZzX3R1bmluZ19wYXJhbWV0ZXJzKHNiaSk7Cj4+Pj4gK8KgwqDCoCBmMmZzX3R1bmlu
Z19wYXJhbWV0ZXJzKHNiaSwgZmFsc2UpOwo+Pj4+IMKgIMKgwqDCoMKgwqAgZjJmc19ub3RpY2Uo
c2JpLCAiTW91bnRlZCB3aXRoIGNoZWNrcG9pbnQgdmVyc2lvbiA9ICVsbHgiLAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN1cl9jcF92ZXJzaW9uKEYyRlNfQ0tQVChzYmkpKSk7CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
