Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6817C12A9E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 03:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndUi7O+8cWwiSUD9WdXiHzsRLRZPFPInb9qu6eToRuU=; b=BhE70ph/bZhfQZ0qu05AqCI1E1
	DfE8CG0CVR6ZzPvjph2QsDm3kq0YU6OyLvlGnkZs460Y2XsDFGhLYfDUYLvf8Cc7YVU9AJd9rHN/t
	PTgWI5iAnEQkzPAnrP66PFcx2HO0luY76e4MilPKg5FZr0ZrfsKRd4cdTAyvapSD4vPM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDZTm-0000e8-46;
	Tue, 28 Oct 2025 02:30:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDZTk-0000dz-1b
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 02:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVHKmqQlrgVQaqrzou3rQc5C1rzf/txSwGgJu3Ii/1E=; b=fKtNmqc+mlBw89UCw2LRfm3yvX
 C+2fGqkhAmSSum/whWXScZhcRLiEyYxWqDRR5S8S3yAXlF2xyJMiUW8um1yWQpxApwT5gKevGQTa1
 T2Vv8WjexI8uBTqdsw/lbCAOfRUZV60dWKGb8XV+205/YNAaB8PQcHm8+Lo1gM8FYEZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVHKmqQlrgVQaqrzou3rQc5C1rzf/txSwGgJu3Ii/1E=; b=OgtrNsttTWWowLUR61udDRttFH
 gfk8GkJE/22Is8hJfv7OD34H4mm0vNzf6WIa+4ECoE9CNGIore5+S1RLS64CsEvkktsp59069t1Xk
 SEr/uS0L49VQaBVbpzWL5mnFnenVWgg2iIFudqzmfKtEH7Yi92no2ODHOXt3n5t5yfGE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDZTj-0008U2-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 02:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 00D2543655;
 Tue, 28 Oct 2025 02:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3888C4CEFB;
 Tue, 28 Oct 2025 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761618620;
 bh=oo+ZfX/qYWEeuHuoEjPXqxal9ynZpK68gcxLtSCA1/s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=omWlY72BpCiFnzvizpEXs7U49SmQwt2+Y6IoX9ToOHsuU3xzYEEsN2gbQQhK7Ey5h
 lt0FcuJUKs6Hix6c9cYfBYeg4iI+Il9nupvmGdX1NbTHfJxEqqxfLwNUUyjTY4mLEp
 xbqFwxw7nB5UBqCS4HgR0ubZleJ0zl7cfaL/qnTt17wIce1N5BRh7RVeUpzGDTGZV3
 sftYUip1eiARkKP8l3lkB4OwDnvDA3CXXuLXU0VgK1WyrnJSRtTmprhx+c+1aw/LJr
 UcmoTq0M2ng/VgoQ2l6a1ceTA5RJRy0cmomZLMdG3qEUZAvlvLoPbJZrkMliNLtZQZ
 9/XDiRicyJkcg==
Message-ID: <207c2ba6-49ef-490b-9896-0458abbf93e7@kernel.org>
Date: Tue, 28 Oct 2025 10:30:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
 <c0689523-a265-47ce-b443-b4fe4ae7d823@kernel.org>
 <d74c16bc-58c5-470f-acb5-e2dfe6c721d8@gmail.com>
Content-Language: en-US
In-Reply-To: <d74c16bc-58c5-470f-acb5-e2dfe6c721d8@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/27/25 21:06, Yongpeng Yang wrote: > On 10/27/25 16:35, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 10/24/25 22:37, Yongpeng Yang wrote:
 >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> Wh [...] 
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
X-Headers-End: 1vDZTj-0008U2-Fe
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjcvMjUgMjE6MDYsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gT24gMTAvMjcvMjUgMTY6
MzUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDEwLzI0LzI1IDIy
OjM3LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+Pgo+Pj4gV2hlbiBGMkZTIHVzZXMgbXVsdGlwbGUgYmxvY2sg
ZGV2aWNlcywgZWFjaCBkZXZpY2UgbWF5IGhhdmUgYQo+Pj4gZGlmZmVyZW50IGRpc2NhcmQgZ3Jh
bnVsYXJpdHkuIFRoZSBtaW5pbXVtIHRyaW0gZ3JhbnVsYXJpdHkgbXVzdCBiZQo+Pj4gYXQgbGVh
c3QgdGhlIG1heGltdW0gZGlzY2FyZCBncmFudWxhcml0eSBvZiBhbGwgZGV2aWNlcywgZXhjbHVk
aW5nCj4+PiB6b25lZCBkZXZpY2VzLiBVc2UgbWF4X3QgaW5zdGVhZCBvZiB0aGUgbWF4KCkgbWFj
cm8gdG8gY29tcHV0ZSB0aGUKPj4+IG1heGltdW0gdmFsdWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+PiAtLS0KPj4+IMKg
IGZzL2YyZnMvZjJmcy5oIHwgMTIgKysrKysrKysrKysrCj4+PiDCoCBmcy9mMmZzL2ZpbGUuYyB8
IDEyICsrKysrKy0tLS0tLQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2Zz
L2YyZnMvZjJmcy5oCj4+PiBpbmRleCAzMmZiMmU3MzM4YjcuLjA2NGJkYmY0NjNmNyAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAg
LTQ3NjIsNiArNDc2MiwxOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19od19zdXBwb3J0X2Rp
c2NhcmQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+PiDCoCB9Cj4+PiDCoCArc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZjJmc19od19k
aXNjYXJkX2dyYW51bGFyaXR5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+ICt7Cj4+PiAr
wqDCoMKgIGludCBpID0gMTsKPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGRpc2NhcmRfZ3JhbnVs
YXJpdHkgPSBiZGV2X2Rpc2NhcmRfZ3JhbnVsYXJpdHkoc2JpLT5zYi0+c19iZGV2KTsKPj4KPj4g
WW9uZ3BlbmcsCj4+Cj4+IFRoZSBwYXRjaCBtYWtlcyBzZW5zZSB0byBtZS4KPj4KPj4gT25lIGV4
dHJhIHF1ZXN0aW9uLCBpZiBhIHpvbmVkIGRldmljZSBjb250YWlucyBib3RoIGNvbnZlbnRpb25h
bCB6b25lcyBhbmQKPj4gc2VxdWVudGlhbCB6b25lcywgd2hhdCBkaXNjYXJkIGdyYW51bGFyaXR5
IHdpbGwgaXQgZXhwb3Nlcz8KPj4KPj4gVGhhbmtzLAo+IEkgZG9uJ3QgaGF2ZSBzdWNoIGEgZGV2
aWNlLiBJIHRoaW5rIHRoZSBleHBvc2VkIGRpc2NhcmQgZ3JhbnVsYXJpdHkgc2hvdWxkIGJlIHRo
YXQgb2YgdGhlIGNvbnZlbnRpb25hbCB6b25lcywgc2luY2UgdGhlIHNlcXVlbnRpYWwgem9uZXMg
aGF2ZSBhIGRlZmF1bHQgcmVzZXQgZ3JhbnVsYXJpdHkgb2YgMSB6b25lLCBhbmQgbm8gYWRkaXRp
b25hbCBpbmZvcm1hdGlvbiBpcyBuZWVkZWQgdG8gaW5kaWNhdGUgdGhhdC4KCkkgZ3Vlc3MgeW91
IGNhbiBoYXZlIGEgdmlydHVhbCBvbmUgc2ltdWxhdGVkIGJ5IG51bGxfYmxrIGRyaXZlcj8KCmh0
dHBzOi8vem9uZWRzdG9yYWdlLmlvL2RvY3MvZ2V0dGluZy1zdGFydGVkL3piZC1lbXVsYXRpb24j
em9uZWQtYmxvY2stZGV2aWNlLWVtdWxhdGlvbi13aXRoLW51bGxfYmxrCgotIG51bGxibGtfY3Jl
YXRlLnNoIDUxMiAyIDEwMjQgMTAyNAotIGNhdCAvc3lzL2Jsb2NrL251bGxiMS9xdWV1ZS9kaXNj
YXJkXyoKMAowCjAKMAoKSSBkaWRuJ3QgZGlnIGludG8gbW9yZSBkZXRhaWxzLCB0aG91Z2guIDop
CgpUaGFua3MsCgo+IAo+IFlvbmdwZW5nPgo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoZjJmc19pc19t
dWx0aV9kZXZpY2Uoc2JpKSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKDsgaSA8IHNiaS0+c19u
ZGV2cyAmJiAhYmRldl9pc196b25lZChGREVWKGkpLmJkZXYpOyBpKyspCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkaXNjYXJkX2dyYW51bGFyaXR5ID0gbWF4X3QodW5zaWduZWQgaW50LCBk
aXNjYXJkX2dyYW51bGFyaXR5LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYmRldl9kaXNjYXJkX2dyYW51bGFyaXR5KEZERVYoaSkuYmRldikpOwo+
Pj4gK8KgwqDCoCByZXR1cm4gZGlzY2FyZF9ncmFudWxhcml0eTsKPj4+ICt9Cj4+PiArCj4+PiDC
oCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19yZWFsdGltZV9kaXNjYXJkX2VuYWJsZShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHJldHVybiAodGVzdF9v
cHQoc2JpLCBESVNDQVJEKSAmJiBmMmZzX2h3X3N1cHBvcnRfZGlzY2FyZChzYmkpKSB8fAo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+IGluZGV4IDZk
NDJlMmQyODg2MS4uY2VkMGY3ODUzMmM5IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBAQCAtMjU4OCwxNCArMjU4OCwxNCBAQCBzdGF0
aWMgaW50IGYyZnNfa2VlcF9ub3JldXNlX3JhbmdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+PiDC
oCBzdGF0aWMgaW50IGYyZnNfaW9jX2ZpdHJpbShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQg
bG9uZyBhcmcpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBm
aWxlX2lub2RlKGZpbHApOwo+Pj4gLcKgwqDCoCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiID0gaW5v
ZGUtPmlfc2I7Cj4+PiArwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9T
Qihpbm9kZSk7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmc3RyaW1fcmFuZ2UgcmFuZ2U7Cj4+PiDC
oMKgwqDCoMKgIGludCByZXQ7Cj4+PiDCoCDCoMKgwqDCoMKgIGlmICghY2FwYWJsZShDQVBfU1lT
X0FETUlOKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVQRVJNOwo+Pj4gwqAgLcKg
wqDCoCBpZiAoIWYyZnNfaHdfc3VwcG9ydF9kaXNjYXJkKEYyRlNfU0Ioc2IpKSkKPj4+ICvCoMKg
wqAgaWYgKCFmMmZzX2h3X3N1cHBvcnRfZGlzY2FyZChzYmkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+IMKgIMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91
c2VyKCZyYW5nZSwgKHN0cnVjdCBmc3RyaW1fcmFuZ2UgX191c2VyICopYXJnLAo+Pj4gQEAgLTI2
MDYsOSArMjYwNiw5IEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfZml0cmltKHN0cnVjdCBmaWxlICpm
aWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqAgLcKgwqDCoCByYW5nZS5taW5sZW4gPSBt
YXgoKHVuc2lnbmVkIGludClyYW5nZS5taW5sZW4sCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBiZGV2X2Rpc2NhcmRfZ3JhbnVsYXJpdHkoc2ItPnNfYmRldikpOwo+Pj4gLcKgwqDC
oCByZXQgPSBmMmZzX3RyaW1fZnMoRjJGU19TQihzYiksICZyYW5nZSk7Cj4+PiArwqDCoMKgIHJh
bmdlLm1pbmxlbiA9IG1heF90KHVuc2lnbmVkIGludCwgcmFuZ2UubWlubGVuLAo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZjJmc19od19kaXNjYXJkX2dyYW51bGFyaXR5KHNiaSkpOwo+Pj4g
K8KgwqDCoCByZXQgPSBmMmZzX3RyaW1fZnMoc2JpLCAmcmFuZ2UpOwo+Pj4gwqDCoMKgwqDCoCBt
bnRfZHJvcF93cml0ZV9maWxlKGZpbHApOwo+Pj4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gQEAgLTI2MTYsNyArMjYxNiw3IEBA
IHN0YXRpYyBpbnQgZjJmc19pb2NfZml0cmltKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBs
b25nIGFyZykKPj4+IMKgwqDCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcigoc3RydWN0IGZzdHJpbV9y
YW5nZSBfX3VzZXIgKilhcmcsICZyYW5nZSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2l6ZW9mKHJhbmdlKSkpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
RkFVTFQ7Cj4+PiAtwqDCoMKgIGYyZnNfdXBkYXRlX3RpbWUoRjJGU19JX1NCKGlub2RlKSwgUkVR
X1RJTUUpOwo+Pj4gK8KgwqDCoCBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+Pj4g
wqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+IMKgIH0KPj4+IMKgIAo+Pgo+Pgo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
