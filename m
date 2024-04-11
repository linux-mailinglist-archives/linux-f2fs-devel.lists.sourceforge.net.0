Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAB8A0C66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 11:29:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruqk0-0002dA-FF;
	Thu, 11 Apr 2024 09:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruqjy-0002d1-B7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 09:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lpKs9CjnMOz+eiCOcS4GefgMpTn7P6muMhw5yi0VzkY=; b=keAFxxUXgVqzE0vqD4lQDkjpLG
 BHxzu73dpFpXZuxFni8p6aIr1/GAW6kyYFrAISVaq6SCab1gKtjCAEysXxds6B4I3Ne0m76IruDBx
 rJdsmWhQrx92b4Q7PzEJyuGMxB1vziFfVhoEkDoKAPvFAKrlcj4xV+6At1q1cqphA3iM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lpKs9CjnMOz+eiCOcS4GefgMpTn7P6muMhw5yi0VzkY=; b=JBKD6A/UIXurnENL583EjLyTFy
 75LwVvtnNVkU9BCpC5ooAHu7O4fPNgLkaOlOZEKQwzvb7mKl80/r+gzS9mfZphFL4m4JDnYfSR6rp
 +Y9UgYRJZQ2plGHofQir4QHdV0j93dsZbT7alLu/5ZxpxXO0TFVxH3oqoaGBEhy1SJ/4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruqjx-0002St-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 09:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E565ACE2FA7;
 Thu, 11 Apr 2024 09:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93570C43390;
 Thu, 11 Apr 2024 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712827738;
 bh=TCkF2E+DiRMKfiseWROAnr1QyBdX86r5YNHDtyjoKQM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=r43x0QvAbLpsHUqd+1+UhPVHM2JKqiPCtNjeqzqsPioeSCL3GUK5rFS20TJX7KJeJ
 3FxWB7Iasw44PhSBor+BMv8eqjFZJi3EAuaIncmkotuuSOlYyHBEJISkhey6UBk4NG
 990btTZ935IR34jD+Tynkv+l1F0nPImlpB3E3aw/qUpcheoKTMGB6hgOWWhmKy1P9S
 iBfzB5Yx9flU6eebUSGNLtW5GBlScf0im3yK1vyqk9RBBwg5iabl9e6Mckr0D2yqsR
 4DG+LY0hkk4zJi/pNQX60hbmPhlJseYnolcPyj+c/ifmi7NrVA/9/v0R+uxJ0/iU5p
 hcUqcgSM+pglg==
Message-ID: <c715f840-0ba3-4074-81af-9947dcc9756f@kernel.org>
Date: Thu, 11 Apr 2024 17:28:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "wangjianjian (C)" <wangjianjian3@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <tencent_67A0192ABE8A513889F4DCEEFD83DC2FBB0A@qq.com>
 <b68f94da-4477-4ab5-b979-aa260e0b8ef3@kernel.org>
 <1c059a01-ec24-4fd4-9e66-7989d07e3207@huawei.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1c059a01-ec24-4fd4-9e66-7989d07e3207@huawei.com>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/9 14:47,
 wangjianjian (C) via Linux-f2fs-devel wrote:
 > On 2024/4/7 14:23, Chao Yu wrote: >> On 2024/4/4 21:47, Wang Jianjian wrote:
 >>> dquot_mark_dquot_dirty returns old dirty state not th [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruqjx-0002St-Ds
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix incorrect return value
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC80LzkgMTQ6NDcsIHdhbmdqaWFuamlhbiAoQykgdmlhIExpbnV4LWYyZnMtZGV2ZWwg
d3JvdGU6Cj4gT24gMjAyNC80LzcgMTQ6MjMsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjQvNC80
IDIxOjQ3LCBXYW5nIEppYW5qaWFuIHdyb3RlOgo+Pj4gZHF1b3RfbWFya19kcXVvdF9kaXJ0eSBy
ZXR1cm5zIG9sZCBkaXJ0eSBzdGF0ZSBub3QgdGhlIGVycm9yIGNvZGUuCj4+Cj4+IEkgdGhpbmsg
aXQncyBmaW5lIHRvIGp1c3QgcGFzcyByZXR1cm4gdmFsdWUgb2YgZHF1b3RfbWFya19kcXVvdF9k
aXJ0eSgpCj4+IHRvIGNhbGxlciwgYmVjYXVzZSBjYWxsZXIgY2FuIGRpc3Rpbmd1aXNoIHN0YXR1
cyBmcm9tIHJldHVybiB2YWx1ZToKPj4gMSkgPCAwLCB0aGVyZSBpcyBhbiBlcnJvciwgMikgPj0g
MCwgdGhlcmUgaXMgbm8gZXJyb3IsIHByZXZpb3VzbHkgaXQgaXMKPj4gZGlydHkgaWYgaXQgaXMg
MS4KPiBtYXJrX2FsbF9kcXVvdF9kaXJ0eSB1c2VzIGlmIHJldHVybiB2YWx1ZSBpcyAwIHRvIHNh
dmUgZXJyb3IgY29kZS4gSXQgbWF5IGNhdXNlIG1lc3MuCgpJIGRpZG4ndCBnZXQgeW91ciBwb2lu
dC4uLgoKTm8gY2FsbGVyIG9mIG1hcmtfYWxsX2RxdW90X2RpcnR5KCkgY2FyZXMgYWJvdXQgaXRz
IHJldHVybiB2YWx1ZSwgc28sCkkgdGhpbmsgdGhlcmUgaXMgbm8gcHJhY3RpY2FsIHByb2JsZW0g
bm93LgoKPiBCeSB0aGUgd2F5LCBJIGFtIGZpbmUgZG9uJ3QgY2hhbmdlIGl0Lgo+IAo+Pgo+PiBU
aGFua3MsCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBKaWFuamlhbiA8d2FuZ2ppYW5q
aWFuMEBmb3htYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZnMvZjJmcy9zdXBlci5jIHwgNCArKy0t
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+
IGluZGV4IGE2ODY3ZjI2ZjE0MS4uYWYwNzAyNzQ3NWQ5IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJm
cy9zdXBlci5jCj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+IEBAIC0zMDYzLDEzICszMDYz
LDEzIEBAIHN0YXRpYyBpbnQgZjJmc19kcXVvdF9tYXJrX2RxdW90X2RpcnR5KHN0cnVjdCBkcXVv
dCAqZHF1b3QpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBzdXBlcl9ibG9jayAqc2Ig
PSBkcXVvdC0+ZHFfc2I7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9
IEYyRlNfU0Ioc2IpOwo+Pj4gLcKgwqDCoCBpbnQgcmV0ID0gZHF1b3RfbWFya19kcXVvdF9kaXJ0
eShkcXVvdCk7Cj4+PiArwqDCoMKgIGRxdW90X21hcmtfZHF1b3RfZGlydHkoZHF1b3QpOwo+Pj4g
wqDCoMKgwqDCoCAvKiBpZiB3ZSBhcmUgdXNpbmcgam91cm5hbGxlZCBxdW90YSAqLwo+Pj4gwqDC
oMKgwqDCoCBpZiAoaXNfam91cm5hbGxlZF9xdW90YShzYmkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9RVU9UQV9ORUVEX0ZMVVNIKTsKPj4+IC3CoMKgwqAg
cmV0dXJuIHJldDsKPj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+PiDCoCB9Cj4+PiDCoCBzdGF0aWMg
aW50IGYyZnNfZHF1b3RfY29tbWl0X2luZm8oc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5
cGUpCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
