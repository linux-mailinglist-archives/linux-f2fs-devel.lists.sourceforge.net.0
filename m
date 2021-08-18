Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 550DF3EF8DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 05:50:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGCak-0004cD-NN; Wed, 18 Aug 2021 03:50:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mGCai-0004c5-6k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 03:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ka/iSx+OCizRMcCow8sAUM4vm3Qbg2zscAMWZTPV2I=; b=aM4XENDuKjimAdKoi2ZUen7AMA
 NFV7mb5AH8U0IGmwb7IITcKNe8IIiuF0UdP6hL6vuZGOAoGkdzUe/uRvO90mDL8EFlNVzt3y4/XJi
 o0abhATQ/2TetoEaKXtlaQ43bs6hpLW/g0r3IAvO57Vd5r1AIB/E7Bx4dqm0F8Kwg3ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ka/iSx+OCizRMcCow8sAUM4vm3Qbg2zscAMWZTPV2I=; b=D9tUwGlGgZ0rDFmTLluc0j9rZ0
 r5CxtEPdfk4UZCDTLR++CoqYGOuUBlf7lB8HDJVHFZuJNFd2uzL+uXwwbGLuyTh2rZtfEV0Oo5toS
 sls9FphErfnhWDm2K3rF+FoHw4lMkBmxRiE2vbD6f6hDYoP5j+sVFDbfrUt/sFIASn2o=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGCad-00A0fz-6A
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 03:50:12 +0000
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id AF768400413;
 Wed, 18 Aug 2021 11:49:59 +0800 (CST)
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
 <YRWPetjv8PqbzzF/@google.com>
 <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
Date: Wed, 18 Aug 2021 11:49:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUMeGExWGEoYGU5LT0wYT0
 JOVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTo6ETo6FT8BTBExOBouAg8t
 LxUaCRdVSlVKTUlCSU5DTUtLSU1MVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT05CQzcG
X-HM-Tid: 0a7b57614d87d991kuwsaf768400413
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/13 9:36, Chao Yu wrote: > On 2021/8/13 5:15,
 Jaegeuk
 Kim wrote: >> On 08/06, Chao Yu wrote: >>> On 2021/7/29 20:25, Fengnan Chang
 wrote: >>>> For now, overwrite file with direct io use inpla [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mGCad-00A0fz-6A
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing inplace count in overwrite
 with direct io
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

CgpPbiAyMDIxLzgvMTMgOTozNiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIxLzgvMTMgNToxNSwg
SmFlZ2V1ayBLaW0gd3JvdGU6Cj4+IE9uIDA4LzA2LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAy
MS83LzI5IDIwOjI1LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pj4+IEZvciBub3csIG92ZXJ3cml0
ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwgYnV0IG5vdAo+Pj4+IGNv
dW50ZWQsIGZpeCBpdC4KPj4+Cj4+PiBJTU8sIExGUy9TU1IvSVBVIHN0YXRzIGluIGRlYnVnZnMg
d2FzIGZvciBidWZmZXJlZCB3cml0ZSwgbWF5YmUgd2UKPj4+IG5lZWQgdG8gYWRkIHNlcGFyYXRl
ZCBvbmUgZm9yIERJTy4KPj4KPj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gbW9uaXRvciBESU8gc3Rh
dHM/Cj4gCj4gU2ltaWxhciByZWFzb24gYXMgd2UgZGlkIGZvciBidWZmZXJlZCBJTz8KCkZvciBu
b3csIExGUyAmIFNTUiBhcmUgY291bnQgaW4gRElPLCBidXQgbm90IGNvdW50IElQVSwgIEkgdGhp
bmsgd2UgCnNob3VsZCBrZWVwIGNvbnNpc3RlbmN5LgoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+Pgo+
Pj4gSmFlZ2V1aywgdGhvdWdodHM/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4+PiAtLS0K
Pj4+PiDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgNiArKysrKysKPj4+PiDCoMKgIGZzL2YyZnMvZjJm
cy5oIHwgMiArKwo+Pj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4g
aW5kZXggZDJjZjQ4YzVhMmU0Li42MDUxMGFjZjkxZWMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0xNDc3LDYgKzE0Nzcs
OSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIAo+Pj4+IHN0cnVj
dCBmMmZzX21hcF9ibG9ja3MgKm1hcCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZmxh
ZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmMmZzX3dhaXRfb25fYmxvY2tfd3JpdGViYWNrX3JhbmdlKGlub2RlLAo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tX3BibGss
IG1hcC0+bV9sZW4pOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNfbGZzX21vZGUoc2Jp
KSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWFwLT5tX21heV9jcmVhdGUpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBtYXAtPm1fbGVuKTsKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+IEBAIC0x
NTI2LDYgKzE1MjksOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IAo+Pj4+IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJsa2FkZHIgPSBkbi5kYXRhX2Jsa2FkZHI7Cj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5EX1dSSVRFKTsK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY3Jl
YXRlICYmICFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSAKPj4+PiBGMkZTX0dFVF9CTE9D
S19ESU8gJiYKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+bV9tYXlf
Y3JlYXRlKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRfaW5jX2lucGxhY2VfYmxv
Y2tzKHNiaSk7Cj4+Pj4gwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGNyZWF0ZSkgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+IGluZGV4IDg2N2YyYzVkOTU1OS4uM2E5ZGYy
OGU2ZmQ3IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJm
cy9mMmZzLmgKPj4+PiBAQCAtMzgwNCw2ICszODA0LDggQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qg
ZjJmc19zdGF0X2luZm8gCj4+Pj4gKkYyRlNfU1RBVChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChzYmkpLT5ibG9ja19jb3VudFsoY3Vyc2VnKS0+
YWxsb2NfdHlwZV0rKykKPj4+PiDCoMKgICNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Mo
c2JpKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoYXRvbWljX2luYygmKHNiaSktPmlucGxhY2VfY291bnQpKQo+Pj4+ICsj
ZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291bnQpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4+PiArwqDCoMKgwqDCoMKgwqAgKGF0b21pY19hZGQoY291bnQs
ICYoc2JpKS0+aW5wbGFjZV9jb3VudCkpCj4+Pj4gwqDCoCAjZGVmaW5lIHN0YXRfdXBkYXRlX21h
eF9hdG9taWNfd3JpdGUoaW5vZGUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+
PiDCoMKgwqDCoMKgwqAgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQg
Y3VyID0gRjJGU19JX1NCKGlub2RlKS0+YXRvbWljX2ZpbGVzO8KgwqDCoCBcCj4+Pj4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
