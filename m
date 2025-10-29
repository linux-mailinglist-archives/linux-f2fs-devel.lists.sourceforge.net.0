Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C8C18348
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 04:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIHrlvAZhuoyx0ijSFuKuAG+sCkBUWxk+Ca2Xhnx8ck=; b=iJM7qf4kQhYGudsQ5Jhuch8EAI
	5risDdHPgjsgjmWB1Qw9HRqKQ5Hqid3hPohXl6+SbhniNonkPCu5ek3++Caw5aIjjnAbSBiMkjvPD
	Yy36lhduKbTXkVNqFnLFgxv7Xe9E5PsWsy+cf+zkEmcOXujt+p5cunnnVnxIb8v3zakY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDx4B-0004cy-SM;
	Wed, 29 Oct 2025 03:41:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDx4A-0004cr-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 03:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yb+/NqpxoEJsrNYi3vgyHVgevYtFUqkWhXwc/wIvfSM=; b=E3Ry4l0KkqTzmMnQoOAGa8X0dD
 RLnsU7PQ5Li2iHlMwuJmYRAUscEDIJgsx9isOk4+D2m2raPosD5XTvqxEdpwD/JrENWaMeWYbDcgm
 32R/kkcWM9CQQsMkmDCCJcgkAXP4jkTX/ewP/jnBB4ql6wdjp3f5r8a/o/VycRNLd0OE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yb+/NqpxoEJsrNYi3vgyHVgevYtFUqkWhXwc/wIvfSM=; b=GBD+G0H9QGY2PP3B/+zGcXBMeF
 kFGSl3BjyAOzItoxTAeEAuxLdco8jZzP26ZBasr+QxpzcQBzHj/5pseg4c9wgDNxQVhV14ctTtcQK
 Ny6x0SXhLuBEXSKiGz1iUc8ATgTmIPny2u+N2SjUGW52kguo/pgcvCZpMtP6WeZlSTI8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDx49-0007bm-Fx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 03:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A7A3C601D9;
 Wed, 29 Oct 2025 03:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18950C4CEFD;
 Wed, 29 Oct 2025 03:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761709290;
 bh=LM7xw1gY84IyMupCcGYFAo+7pgbrAfWLJtfDO2qizCc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Jekl99XMprGXJdjtBTQM4gk/HjgvYv91axJHmKfLvDcaAlp6Fusg2oI32gmLBIEmZ
 bBYPEMY0NVaC5QQLcSqBNV6r83cWpc1k7J2VzSPwy2LBU2pMbR/CwfJLn46pDcixYz
 cVih+2WV8HBh75cBkwscMDLNAX1iZH2EHO/wLMw9j5peyk5TdZP11zJIxDWO5bazgS
 Appi5OTHnO5458pfs+9g/jeQGVIgN3Z9jps1sqOJVKwkcRJrKvBcfudFSrZV+yWHsa
 3dQtOgVAWvcdwL76Uc3Z15an740vskzjIO4aNcMsNffBZXzWMwYCngPLiE8rWeYUJX
 /WVOpZ8AQDrZQ==
Message-ID: <490569af-8e87-4cea-81dc-3bc9f59aa2b4@kernel.org>
Date: Wed, 29 Oct 2025 11:41:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251028195444.3181203-1-jaegeuk@kernel.org>
 <81602674-b9f4-4ab2-91f5-0afc762e7cc6@kernel.org>
 <7040b501-6e25-42da-bda0-a15614a80d5d@gmail.com>
Content-Language: en-US
In-Reply-To: <7040b501-6e25-42da-bda0-a15614a80d5d@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 11:13, Yongpeng Yang wrote: > On 10/29/25 10:06, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 10/29/25 03:54, Jaegeuk Kim via
 Linux-f2fs-devel wrote: >>> This adds a tracepoint in the fadvise [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDx49-0007bm-Fx
Subject: Re: [f2fs-dev] [PATCH] f2fs: add fadvise tracepoint
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjkvMjUgMTE6MTMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gT24gMTAvMjkvMjUgMTA6
MDYsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDEwLzI5LzI1IDAz
OjU0LCBKYWVnZXVrIEtpbSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IFRoaXMgYWRk
cyBhIHRyYWNlcG9pbnQgaW4gdGhlIGZhZHZpc2UgY2FsbCBwYXRoLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+IMKgIGZz
L2YyZnMvZmlsZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysKPj4+IMKgIGlu
Y2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gaW5kZXggNmQ0
MmUyZDI4ODYxLi40YTgxMDg5YzVkZjMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+
Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+IEBAIC01Mjg4LDYgKzUyODgsOCBAQCBzdGF0aWMg
aW50IGYyZnNfZmlsZV9mYWR2aXNlKHN0cnVjdCBmaWxlICpmaWxwLCBsb2ZmX3Qgb2Zmc2V0LCBs
b2ZmX3QgbGVuLAo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9k
ZShmaWxwKTsKPj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4+IMKgICvCoMKgwqAgdHJhY2VfZjJm
c19mYWR2aXNlKGlub2RlLCBvZmZzZXQsIGxlbiwgYWR2aWNlKTsKPj4+ICsKPj4+IMKgwqDCoMKg
wqAgaWYgKGFkdmljZSA9PSBQT1NJWF9GQURWX1NFUVVFTlRJQUwpIHsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoU19JU0ZJRk8oaW5vZGUtPmlfbW9kZSkpCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVTUElQRTsKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3RyYWNl
L2V2ZW50cy9mMmZzLmggYi9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPj4+IGluZGV4IGVk
YmJkODY5MDc4Zi4uYjdmNTMxN2I1OTgwIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS90cmFjZS9l
dmVudHMvZjJmcy5oCj4+PiArKysgYi9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPj4+IEBA
IC01ODYsNiArNTg2LDM4IEBAIFRSQUNFX0VWRU5UKGYyZnNfZmlsZV93cml0ZV9pdGVyLAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnJldCkKPj4+IMKgICk7Cj4+PiDCoCArVFJBQ0Vf
RVZFTlQoZjJmc19mYWR2aXNlLAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuLCBpbnQgYWR2aWNlKSwKPj4+ICsK
Pj4+ICvCoMKgwqAgVFBfQVJHUyhpbm9kZSwgb2Zmc2V0LCBsZW4sIGFkdmljZSksCj4+PiArCj4+
PiArwqDCoMKgIFRQX1NUUlVDVF9fZW50cnkoCj4+PiArwqDCoMKgwqDCoMKgwqAgX19maWVsZChk
ZXZfdCzCoMKgwqAgZGV2KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZmllbGQoaW5vX3QswqDCoMKg
IGlubykKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKGxvZmZfdCwgc2l6ZSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCBfX2ZpZWxkKGxvZmZfdCzCoMKgwqAgb2Zmc2V0KQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIF9fZmllbGQobG9mZl90LMKgwqDCoCBsZW4pCj4+PiArwqDCoMKgwqDCoMKgwqAgX19maWVs
ZChpbnQswqDCoMKgIGFkdmljZSkKPj4+ICvCoMKgwqAgKSwKPj4+ICsKPj4+ICvCoMKgwqAgVFBf
ZmFzdF9hc3NpZ24oCj4+PiArwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+ZGV2wqDCoMKgID0gaW5v
ZGUtPmlfc2ItPnNfZGV2Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPmlub8KgwqDCoCA9
IGlub2RlLT5pX2lubzsKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5zaXplwqDCoMKgID0g
aW5vZGUtPmlfc2l6ZTsKPj4KPj4gX19lbnRyeS0+c2l6ZSA9IGlfc2l6ZV9yZWFkKGlub2RlKT8K
Pj4KPj4gVGhhbmtzLAo+Pgo+IFRoZSBvdGhlciAiX19lbnRyeS0+c2l6ZSA9IGlub2RlLT5pX3Np
emU7IiBpbiBpbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmggYWxzbyBuZWVkIHRvIGJlIHVwZGF0
ZWQ/CgpZZWFoLCBZb25ncGVuZywgSSBub3RpY2VkIHRoYXQgYW5kIGZpeGVkIHRoZW0gcmlnaHQg
YWZ0ZXIgcmVwbHk6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaGFvL2xpbnV4LmdpdC9jb21taXQvP2g9YnVnZml4L2NvbW1vbiZpZD1mZmQyMWJmNzkx
MTQzOTU3ZjZmZjFmYzE0ZDdkYmQ2ZTg0NjZiMzIwCgpUaGFua3MgZm9yIHlvdXIgcmVtaW5kZXIu
IDopCgpUaGFua3MsCgo+IAo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPm9mZnNldMKgwqDC
oCA9IG9mZnNldDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5sZW7CoMKgwqAgPSBsZW47
Cj4+PiArwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+YWR2aWNlwqDCoMKgID0gYWR2aWNlOwo+Pj4g
K8KgwqDCoCApLAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9wcmludGsoImRldiA9ICglZCwlZCksIGlu
byA9ICVsdSwgaV9zaXplID0gJWxsZCBvZmZzZXQ6JWxsdSwgbGVuOiVsbHUsIGFkdmlzZTolZCIs
Cj4+PiArwqDCoMKgwqDCoMKgwqAgc2hvd19kZXZfaW5vKF9fZW50cnkpLAo+Pj4gK8KgwqDCoMKg
wqDCoMKgICh1bnNpZ25lZCBsb25nIGxvbmcpX19lbnRyeS0+c2l6ZSwKPj4+ICvCoMKgwqDCoMKg
wqDCoCBfX2VudHJ5LT5vZmZzZXQsCj4+PiArwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+bGVuLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPmFkdmljZSkKPj4+ICspOwo+Pj4gKwo+Pj4gwqAg
VFJBQ0VfRVZFTlQoZjJmc19tYXBfYmxvY2tzLAo+Pj4gwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnLAo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHJldCksCj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
