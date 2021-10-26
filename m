Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749843A9D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 03:48:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfBZf-0007aX-N0; Tue, 26 Oct 2021 01:48:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mfBZd-0007aR-LS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VBsgUpUKcn+xZcxswO9TRyQzqsDvTGjT9POmDQsSBw=; b=In+QnXGqTbXXuqiENuxzU16Dt/
 o1MsPJotwbW1TEdDZgL3HyxGG1WmDisJU6l7IlULN5RvF8bAm87q6pYsmf1VADjbdMoaRtk4butcs
 qQ4HvI622dQvJ6wQQPrmWhAUCaquk09utmZrheRyZAmELzVnA29gWMrgaUYo7XkeTY5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VBsgUpUKcn+xZcxswO9TRyQzqsDvTGjT9POmDQsSBw=; b=ecV2avScvA7EDjxHdxB2+hThw0
 oVZ+oGg6oND5XxvqcZkaq6Lxe3GsoXCOeDSH9knWoQRVqTMKq3+Is1G+qW4iueSvJKJiYZROssJqL
 s+wRkFDT0ZXEdiJrDEbnPsWzHAjvI9FfnXnEe/inQXlw1FEie+rVeQ9fygQh7TveuDoA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfBZU-0000AY-BL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:48:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45903603E9;
 Tue, 26 Oct 2021 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635212882;
 bh=mr5jfR8mRK8aSk/ldoaoaFRKssTckFrL3D1lm2BgDqQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X/oh7ZqlFPJeT+BQ2sr8KCS/cUg4kcF5EcLF12ziZbtu0e2ykuMsyH6YMPVk0wHc+
 cln3QeFWDFVGW8fSn1ZhGh0h3k7bmU8wxPrlszxdzay3Ifn8CgourmAapashCm4xpU
 YSIE6XNWKPECcg8+DzISc7mJw3Glms747ebU8dKz7hmXeoPCux0lqcbush59Mh0s6G
 qYQN1UYy+an6u8ZovKp/QTFa2DdLY4wq3G5TRNLEoC3fnT3QMykPE2LETlmMbuoADs
 qtuT9w+w3lOLSrOelI8rzKEmSPQzt3/++WLFeGGSx0DXi4QsRgF94fgQ3+3y5bLtP5
 LVcCHoCeEi9OQ==
Message-ID: <8ec2b28b-da85-47df-25c5-e57fe67fa33c@kernel.org>
Date: Tue, 26 Oct 2021 09:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20211025120931.1409835-1-wangxiaojun11@huawei.com>
 <1a8748f4-c15d-361a-f57a-bdacc037314f@kernel.org>
 <5a3e82d0-0f89-36a1-7f0b-b072b97278a5@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <5a3e82d0-0f89-36a1-7f0b-b072b97278a5@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/10/26 9:38, Wang Xiaojun wrote: > > 在 2021/10/26
    8:29, Chao Yu 写道: >> On 2021/10/25 20:09, Wang Xiaojun wrote: >>> If
   sbi->cur_cp is 2 and the duplicate_checkpoint function returns >>> i [...]
    
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfBZU-0000AY-BL
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix the wrong sbi->cur_cp setting
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMC8yNiA5OjM4LCBXYW5nIFhpYW9qdW4gd3JvdGU6Cj4gCj4g5ZyoIDIwMjEvMTAv
MjYgODoyOSwgQ2hhbyBZdSDlhpnpgZM6Cj4+IE9uIDIwMjEvMTAvMjUgMjA6MDksIFdhbmcgWGlh
b2p1biB3cm90ZToKPj4+IElmIHNiaS0+Y3VyX2NwIGlzIDIgYW5kIHRoZSBkdXBsaWNhdGVfY2hl
Y2twb2ludCBmdW5jdGlvbiByZXR1cm5zCj4+PiBpbiBhZHZhbmNlIGJlY2F1c2Ugc2JpLT5jcF9i
YWNrdXBlZCBpcyBzZXQgdG8gdHJ1ZSwgd2UgY2Fubm90IHNldAo+Pj4gc2JpLT5jdXJfY3AgdG8g
MS4KPj4KPj4gSG1tbSwgaW4gcHJldmlvdXMgaW1wbGVtZW50YXRpb24sIHdoYXQgcHJvYmxlbSB3
ZSB3aWxsIGVuY291bnRlciwgYW5kCj4+IHdoYXQncyB0aGUgcm9vdCBjYXVzZT8KPj4KPj4gVGhh
bmtzLAo+IAo+IEluIGZhY3QsIGl0J3Mgbm90IGNhdXNpbmcgcHJvYmxlbXMgYXQgdGhpcyB0aW1l
Lgo+IAo+IER1cmluZyB0aGUgY29kZSByZXZpZXcsIEkgZm91bmQgdGhhdCB0aGlzIHdhcyBub3Qg
bG9naWNhbGx5IHJlYXNvbmFibGUuCj4gCj4gVGhpcyBwYXJhbWV0ZXIoc2JpLT5jdXJfY3ApIGNh
biBiZSBzZXQgdG8gMSBvbmx5IGFmdGVyIHN1Y2Nlc3NmdWwgcmVwbGljYXRpb24uCgpJSVJDLCBh
ZnRlciBtaXJyb3JpbmcgY2hlY2twb2ludCAoY3BfYmFja3VwZWQgPT0gMSksIHdlIGNob29zZSB0
byBhbHdheXMgdXBkYXRlCkNQICMwIGFyZWEsIHNvIG9uY2UgU1BPIG9jY3VycywgYXQgbGVhc3Qg
dGhlcmUgaXMgb25lIHZhbGlkIGNoZWNrcG9pbnQgY2FuIGJlIGtlcHQKaW4gQ1AgIzEgYXJlYS4g
WzFdCgpbMV0gODFiYWQ5ZDExZWE1ICgiZnNjay5mMmZzOiB3cml0ZSBjaGVja3BvaW50IHdpdGgg
T1BVIG1vZGUiKQoKVGhhbmtzLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogV2FuZyBYaWFvanVuIDx3YW5neGlhb2p1bjExQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+
IMKgIGZzY2svZnNjay5jwqAgfCAzIC0tLQo+Pj4gwqAgZnNjay9tb3VudC5jIHwgNSArKy0tLQo+
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMKPj4+IGluZGV4IDEx
MGMxZWMuLmFhNzdhMzQgMTAwNjQ0Cj4+PiAtLS0gYS9mc2NrL2ZzY2suYwo+Pj4gKysrIGIvZnNj
ay9mc2NrLmMKPj4+IEBAIC0yMzgzLDkgKzIzODMsNiBAQCBzdGF0aWMgdm9pZCBmaXhfY2hlY2tw
b2ludHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCAv
KiBjb3B5IHZhbGlkIGNoZWNrcG9pbnQgdG8gaXRzIG1pcnJvciBwb3NpdGlvbiAqLwo+Pj4gwqDC
oMKgwqDCoCBkdXBsaWNhdGVfY2hlY2twb2ludChzYmkpOwo+Pj4gLQo+Pj4gLcKgwqDCoCAvKiBy
ZXBhaXIgY2hlY2twb2ludCBhdCBDUCAjMCBwb3NpdGlvbiAqLwo+Pj4gLcKgwqDCoCBzYmktPmN1
cl9jcCA9IDE7Cj4+PiDCoMKgwqDCoMKgIGZpeF9jaGVja3BvaW50KHNiaSk7Cj4+PiDCoCB9Cj4+
PiDCoCBkaWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNjay9tb3VudC5jCj4+PiBpbmRleCBj
OTI4YTE1Li4yOTUxNzBlIDEwMDY0NAo+Pj4gLS0tIGEvZnNjay9tb3VudC5jCj4+PiArKysgYi9m
c2NrL21vdW50LmMKPj4+IEBAIC0yOTk4LDYgKzI5OTgsOCBAQCB2b2lkIGR1cGxpY2F0ZV9jaGVj
a3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+IMKgwqDCoMKgwqAgQVNTRVJUKHJl
dCA+PSAwKTsKPj4+IMKgIMKgwqDCoMKgwqAgc2JpLT5jcF9iYWNrdXBlZCA9IDE7Cj4+PiArwqDC
oMKgIC8qIHJlcGFpciBjaGVja3BvaW50IGF0IENQICMwIHBvc2l0aW9uICovCj4+PiArwqDCoMKg
IHNiaS0+Y3VyX2NwID0gMTsKPj4+IMKgIMKgwqDCoMKgwqAgTVNHKDAsICJJbmZvOiBEdXBsaWNh
dGUgdmFsaWQgY2hlY2twb2ludCB0byBtaXJyb3IgcG9zaXRpb24gIgo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgICIlbGx1IC0+ICVsbHVcbiIsIHNyYywgZHN0KTsKPj4+IEBAIC0zMDk4LDkgKzMxMDAs
NiBAQCB2b2lkIHdyaXRlX2NoZWNrcG9pbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+
IMKgIHsKPj4+IMKgwqDCoMKgwqAgLyogY29weSB2YWxpZCBjaGVja3BvaW50IHRvIGl0cyBtaXJy
b3IgcG9zaXRpb24gKi8KPj4+IMKgwqDCoMKgwqAgZHVwbGljYXRlX2NoZWNrcG9pbnQoc2JpKTsK
Pj4+IC0KPj4+IC3CoMKgwqAgLyogcmVwYWlyIGNoZWNrcG9pbnQgYXQgQ1AgIzAgcG9zaXRpb24g
Ki8KPj4+IC3CoMKgwqAgc2JpLT5jdXJfY3AgPSAxOwo+Pj4gwqDCoMKgwqDCoCB3cml0ZV9jaGVj
a3BvaW50KHNiaSk7Cj4+PiDCoCB9Cj4+Pgo+PiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
