Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF8C9850F6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2024 04:31:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stHo6-0000C5-Rq;
	Wed, 25 Sep 2024 02:31:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1stHo5-0000Bw-BP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 02:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvbHYwBBIznzdpE9RAx6BqUPtlxH9fa5n7a1i6TSyLA=; b=Er+qeLxgnfwE4YEimOczoRvsnF
 x8X4T7czFXR6foX/cDsOdF/kIPYCIqcfJjSYnjaJonp1qSrmIapKdh8n2Myhubb1EK8JaXVJZmMM4
 BYCEWeB+V35mx1zXsy2kWc7CORDCAlxNRKF+mtD03SIhgdvjTvNry6wK/Km9Jw5mywq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QvbHYwBBIznzdpE9RAx6BqUPtlxH9fa5n7a1i6TSyLA=; b=fpNrj/1W5Bf1CjquvwRZYeFRw5
 cplOStBmXfDfomHFawZ2w/YCERrWsEGKJP64XHEeQRffm9V1uOBL0xkLqA7BK+6OurR/MIcznKMcu
 LIKMKL/Vc/HDH494T+W8u0ZWzNPD9qlvDZQgvwt7mG8wGBQ+F9ev7ZkVOXLq6ikPP2k0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stHnz-0007BT-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 02:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FF415C5BFB;
 Wed, 25 Sep 2024 02:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F49C4CEC4;
 Wed, 25 Sep 2024 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727231452;
 bh=X1iP4x+Vd/7mY8fUwi7Ju0cN4C2hV31GJfoI2x8Ueos=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eTQZP6+eefXLaTV7lu3GJx+7buCMp0j4i04nVqImCNM6x1f9rkBaVrPosbFa5zdu1
 pE1BoUDzwTrSqsCy9Z1exgm8EOKPHjCo2t6EOb/pjDDpgwyXgDkujdLNASw/lDpAW0
 i8AA7JNyhpB2d8Y9KAH0fiHXDEfZ5LK1r5n/wIhDrnHYczhxrsqyuuv189yQ9Ax2V+
 KqBWip5+xiuOh3rdokj/U8YNC5mUr8lh93sYo9YbsAnk72RcIIiAdur8NHMDiJ3yIq
 VltlBgiyyt1PCInqggM75tj0T1kparssYQZmYQssVQcC+vtCy1zAlC0OqQjFvbNluS
 dc6H+ulEqY9Jw==
Message-ID: <381e24e1-a41b-487d-a894-a3aae19d9a5a@kernel.org>
Date: Wed, 25 Sep 2024 10:30:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240924023007.2471817-1-chao@kernel.org>
 <CACOAw_y_csdZmj26C8bXNVxRirq2XBYpiFXN2EnJTTdPr6BmAQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_y_csdZmj26C8bXNVxRirq2XBYpiFXN2EnJTTdPr6BmAQ@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/25 4:38, Daeho Jeong wrote: > On Mon, Sep 23, 2024
    at 7:32 PM Chao Yu via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
    wrote: >> >> Do sanity check for extent info of device [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1stHnz-0007BT-F2
Subject: Re: [f2fs-dev] [PATCH] f2fs: device alias: add sanity check for
 device alias inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzI1IDQ6MzgsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDIzLCAy
MDI0IGF0IDc6MzLigK9QTSBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsCj4gPGxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPj4KPj4gRG8gc2FuaXR5IGNo
ZWNrIGZvciBleHRlbnQgaW5mbyBvZiBkZXZpY2UgYWxpYXMgaW5vZGUsIGluIG9yZGVyIHRvCj4+
IGF2b2lkIHVuZXhwZWN0ZWQgZXJyb3IgY2F1c2VkIGJ5IGZ1enogdGVzdC4KPj4KPj4gQ2M6IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+Cj4+IFRvIERhZWhvIGFuZCBKYWVnZXVrLAo+
Pgo+PiBNZXJnZSB0aGlzIGludG8gaW5pdGlhbCBwYXRjaCBvciBtZXJnZSBpdCBzZXBhcmF0ZWx5
IGlzIGJvdGggZmluZQo+PiB0byBtZS4KPiAKPiBJIGFtIGdvaW5nIHRvIG1lcmdlIHRoaXMgaW50
byBteSBvbmUuIFRoYW5rc34hCj4gCj4+Cj4+ICAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDMy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+IGluZGV4IDBjOGE3MDVm
YWE4Yi4uNWJmOWU0YzJiNDljIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5j
Cj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gQEAgLTI0LDYgKzI0LDcgQEAgYm9v
bCBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBw
YWdlICppcGFnZSkKPj4gICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19J
X1NCKGlub2RlKTsKPj4gICAgICAgICAgc3RydWN0IGYyZnNfZXh0ZW50ICppX2V4dCA9ICZGMkZT
X0lOT0RFKGlwYWdlKS0+aV9leHQ7Cj4+ICAgICAgICAgIHN0cnVjdCBleHRlbnRfaW5mbyBlaTsK
Pj4gKyAgICAgICBpbnQgZGV2aTsKPj4KPj4gICAgICAgICAgZ2V0X3JlYWRfZXh0ZW50X2luZm8o
JmVpLCBpX2V4dCk7Cj4+Cj4+IEBAIC0zOCw3ICszOSwzNiBAQCBib29sIHNhbml0eV9jaGVja19l
eHRlbnRfY2FjaGUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKmlwYWdlKQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlaS5ibGssIGVpLmZvZnMsIGVpLmxlbik7Cj4+ICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiAgICAgICAgICB9Cj4+IC0gICAgICAgcmV0
dXJuIHRydWU7Cj4+ICsKPj4gKyAgICAgICBpZiAoIUlTX0RFVklDRV9BTElBU0lORyhpbm9kZSkp
Cj4+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gKwo+PiArICAgICAgIGZvciAoZGV2
aSA9IDA7IGRldmkgPCBzYmktPnNfbmRldnM7IGRldmkrKykgewo+PiArICAgICAgICAgICAgICAg
aWYgKEZERVYoZGV2aSkuc3RhcnRfYmxrICE9IGVpLmJsayB8fAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICBGREVWKGRldmkpLmVuZF9ibGsgIT0gZWkuYmxrICsgZWkubGVuKQo+IAo+IGVpLmJs
ayArIGVpLmxlbiAtPiBlaS5ibGsgKyBlaS5sZW4gLSAxPwoKWWVzLCB0aGFua3MgZm9yIHRoZSBj
b3JyZWN0aW5nLgoKVGhhbmtzLAoKPiAKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGlmIChkZXZpID09IDApIHsKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiJXM6IGlub2RlIChpbm89JWx4KSBpcyBhbiBhbGlhcyBvZiBtZXRhIGRldmljZSIs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGlub2RlLT5pX2lu
byk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKyAgICAgICAg
ICAgICAgIH0KPj4gKwo+PiArICAgICAgICAgICAgICAgaWYgKGJkZXZfaXNfem9uZWQoRkRFVihk
ZXZpKS5iZGV2KSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3dhcm4oc2JpLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlczogZGV2aWNlIGFsaWFzIGlub2Rl
IChpbm89JWx4KSdzIGV4dGVudCBpbmZvICIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiWyV1LCAldSwgJXVdIG1hcHMgdG8gem9uZWQgYmxvY2sgZGV2aWNlIiwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaW5vZGUtPmlfaW5vLCBlaS5ibGss
IGVpLmZvZnMsIGVpLmxlbik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxz
ZTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+
PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIGYyZnNfd2FybihzYmksICIlczogZGV2aWNlIGFs
aWFzIGlub2RlIChpbm89JWx4KSdzIGV4dGVudCBpbmZvICIKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIlsldSwgJXUsICV1XSBpcyBpbmNvbnNpc3RlbnQgdy8gYW55IGRldmljZXMiLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaW5vZGUtPmlfaW5vLCBlaS5ibGssIGVp
LmZvZnMsIGVpLmxlbik7Cj4+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+PiAgIH0KPj4KPj4gICBz
dGF0aWMgdm9pZCBfX3NldF9leHRlbnRfaW5mbyhzdHJ1Y3QgZXh0ZW50X2luZm8gKmVpLAo+PiAt
LQo+PiAyLjQwLjEKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
