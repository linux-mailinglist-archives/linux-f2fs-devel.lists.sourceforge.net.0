Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83847181C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 04:58:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwFzn-0007xh-4b; Sun, 12 Dec 2021 03:57:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwFzm-0007xa-D1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 03:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S85VE6eAaJCen1Yk/8q/9hyDkBGbnOR2Sm56aAM6cb8=; b=SamwGW2SelLNp8NIz814hx23Bi
 +MkudmUy9sAcb31MyOHxPOfQ+Jgy7cj5tMwUsG0zbeo2QhkDZXwYBPAaHLmegXQaMMbkEw7Tl6fBh
 ONwm64p1EsBefPwo43rtJViAI+kcuLd20XwxCciGwHi7hP2CxUlsmKh7/+OPQRWj3A1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S85VE6eAaJCen1Yk/8q/9hyDkBGbnOR2Sm56aAM6cb8=; b=agFa2XuxMdIT+6sOqbiDpRE5bx
 vzsUk5Y62d65EGyOOD+oGd2xpQm73JF96SAX9I4oCL38ywDDMc41UB3uoZ2uJXvMDDcR2Op2mG0Nf
 1laorXenGve0+PIjsUJi8hwYodQigjSj5wZVUX+ONJ7k85q8ZU8hK3tjjQaHsiBHtjKo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwFzl-00CiQ8-Pl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 03:57:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D6BEB80B41
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 03:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61529C341C5;
 Sun, 12 Dec 2021 03:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639281462;
 bh=3b2f975Yr0NoyS8/5uW8nsUdleLfQXmWbNrzTrKg5y4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YXv/tS5gH2+yXsvr5jqJYvTZzpSHIyTReGm+LYD5MqA21s3NkzufmNUCahzAA+T9m
 Ry+jyJfWZg478kUstven7STUbNfdRHGS+HiAuHivFWt/Pyvm3yQ0DLmpZIstD2IlpA
 y5N9+Lt6Q7+nMAQDnP9G70UP+CHcgMzISPzazMMQAL05w5EQSPCd+sEgLut1rx+Pie
 SSd/bhMdc6mtKzHpb1GEefr5wVMwJLWJ1JeLuVK8YaeDqFNhrGoj8fgqY+Hj0Ekilh
 bVIdifO14RSLg+Z9zzGaQpgseDvB+j01cCJ/cvs88WlWQq7JgbRL+KfhuXSC/Ofh4f
 jHa1J3cqwvdQg==
Message-ID: <96959788-73b2-6e9b-3aa7-b1e23e9da417@kernel.org>
Date: Sun, 12 Dec 2021 11:57:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
 <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
 <YXwyvllUOm6jLiF5@google.com>
 <3e653a3d-ddb9-e115-d871-3659a1ba5530@kernel.org>
In-Reply-To: <3e653a3d-ddb9-e115-d871-3659a1ba5530@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2021/10/30 11:02, Chao Yu wrote: > On 2021/10/30
 1:43, Jaegeuk Kim wrote: >> On 10/29, Chao Yu wrote: >>> Ping, >>> >>> On
 2021/9/29 8:05, Chao Yu wrote: >>>> On 2021/9/29 3:08, Jaegeuk Kim wrote:
 [...] Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwFzl-00CiQ8-Pl
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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

UGluZywKCk9uIDIwMjEvMTAvMzAgMTE6MDIsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS8xMC8z
MCAxOjQzLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4gT24gMTAvMjksIENoYW8gWXUgd3JvdGU6Cj4+
PiBQaW5nLAo+Pj4KPj4+IE9uIDIwMjEvOS8yOSA4OjA1LCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9u
IDIwMjEvOS8yOSAzOjA4LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4gT24gMDkvMjgsIENoYW8g
WXUgd3JvdGU6Cj4+Pj4+PiBJbiBmMmZzX2ZpbGVfd3JpdGVfaXRlcigpLCBsZXQncyB1c2UgZjJm
c19vdmVyd3JpdGVfaW8oKSB0bwo+Pj4+Pj4gY2hlY2sgd2hldGhlcmUgaXQgaXMgb3ZlcndyaXRl
IGNhc2UsIGZvciBzdWNoIGNhc2UsIHdlIGNhbiBza2lwCj4+Pj4+PiBmMmZzX3ByZWFsbG9jYXRl
X2Jsb2NrcygpIGluIG9yZGVyIHRvIGF2b2lkIGYyZnNfZG9fbWFwX2xvY2soKSwKPj4+Pj4+IHdo
aWNoIG1heSBiZSBibG9ja2VkIGJ5IGNoZWNrcG9pbnQoKSBwb3RlbnRpYWxseS4KPj4+Pj4+Cj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+PiAtLS0K
Pj4+Pj4+IMKgwqAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKysKPj4+Pj4+IMKgwqAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+PiBpbmRleCAxM2RlYWUwM2RmMDYuLjUxZmVj
YjJmNGRiNSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+PiArKysgYi9m
cy9mMmZzL2ZpbGUuYwo+Pj4+Pj4gQEAgLTQzMjEsNiArNDMyMSwxMCBAQCBzdGF0aWMgc3NpemVf
dCBmMmZzX2ZpbGVfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRl
ciAqZnJvbSkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWFsbG9jYXRlZCA9IHRydWU7
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXJnZXRfc2l6ZSA9IGlvY2ItPmtpX3BvcyAr
IGlvdl9pdGVyX2NvdW50KGZyb20pOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChmMmZzX292
ZXJ3cml0ZV9pbyhpbm9kZSwgaW9jYi0+a2lfcG9zLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW92X2l0ZXJfY291bnQoZnJvbSkpKQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB3cml0ZTsKPj4+Pj4KPj4+Pj4gVGhpcyBj
YWxscyBmMmZzX21hcF9ibG9ja3MoKSB3aGljaCBjYW4gYmUgZHVwbGljYXRlLCBpZiBpdCdzIG5v
dCB0aGUgb3ZlcndpcnRlCj4+Pj4+IGNhc2UuIERvIHdlIGhhdmUgb3RoZXIgYmVuZWZpdD8KPj4+
Pgo+Pj4+IGYyZnNfb3ZlcndyaXRlX2lvKCkgd2lsbCBicmVhayBmb3IgYXBwZW5kIHdyaXRlIGNh
c2Ugdy8gYmVsb3cgY2hlY2s6Cj4+Pj4KPj4+PiDCoCDCoMKgwqDCoGlmIChwb3MgKyBsZW4gPiBp
X3NpemVfcmVhZChpbm9kZSkpCj4+Pj4gwqAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+
Pj4+Cj4+Pj4gSSBndWVzcyB3ZSBtYXkgb25seSBzdWZmZXIgZG91YmxlIGYyZnNfbWFwX2Jsb2Nr
cygpIGZvciB3cml0ZSBob2xlCj4+Pj4gY2FzZSwgZS5nLiB0cnVuY2F0ZSB0byBsYXJnZSBzaXpl
ICYgd3JpdGUgaW5zaWRlIHRoZSBmaWxlc2l6ZS4gRm9yCj4+Pj4gdGhpcyBjYXNlLCBob3cgYWJv
dXQgYWRkaW5nIGEgY29uZGl0aW9uIHRvIGFsbG93IGRvdWJsZSBmMmZzX21hcF9ibG9ja3MoKQo+
Pj4+IG9ubHkgaWYgd3JpdGUgc2l6ZSBpcyBzbWFsbGVyIHRoYW4gYSB0aHJlc2hvbGQ/Cj4+Cj4+
IEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBiZW5lZml0IG11Y2ggdG8gZG8gZG91YmxlIGYyZnNfbWFw
X2Jsb2Nrcy4gV2hhdCBpcyB0aGUKPj4gcHJvYmxlbSBoZXJlPwo+IAo+IFRoZXJlIGlzIHBvdGVu
dGlhbCBoYW5ndGFzayBoYXBwZW5lZCBkdXJpbmcgc3dhcGZpbGUncyB3cml0ZWJhY2s6Cj4gCj4g
LSBsb29wX2t0aHJlYWRfd29ya2VyX2ZuCj4gIMKgLSBrdGhyZWFkX3dvcmtlcl9mbgo+ICDCoCAt
IGxvb3BfcXVldWVfd29yawo+ICDCoMKgIC0gbG9fcndfYWlvCj4gIMKgwqDCoCAtIGYyZnNfZmls
ZV93cml0ZV9pdGVyCj4gIMKgwqDCoMKgIC0gZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3MKPiAgwqDC
oMKgwqDCoCAtIGYyZnNfbWFwX2Jsb2Nrcwo+ICDCoMKgwqDCoMKgwqAgLSBkb3duX3JlYWQKPiAg
wqDCoMKgwqDCoMKgwqAgLSByd3NlbV9kb3duX3JlYWRfc2xvd3BhdGgKPiAgwqDCoMKgwqDCoMKg
wqDCoCAtIHNjaGVkdWxlCj4gCj4gSSB0cnkgdG8gbWl0aWdhdGUgc3VjaCBpc3N1ZSBieSBwcmVh
bGxvY2F0aW5nIHN3YXBmaWxlJ3MgYmxvY2sgYWRkcmVzcyBhbmQKPiBhdm9pZCBmMmZzX2RvX21h
cF9sb2NrKCkgYXMgbXVjaCBhcyBwb3NzaWJsZSBpbiBzd2FwZmlsZSdzIHdyaXRlYmFjayBwYXRo
Li4uCj4gCj4gVGhhbmtzLAo+IAo+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+
PiArCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX3ByZWFsbG9jYXRlX2Js
b2Nrcyhpb2NiLCBmcm9tKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsK
Pj4+Pj4+IMKgwqAgb3V0X2VycjoKPj4+Pj4+IC0tIAo+Pj4+Pj4gMi4zMi4wCj4+Pj4KPj4+Pgo+
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLnNvdXJjZWZvcmdlLm5ldCUyRmxp
c3RzJTJGbGlzdGluZm8lMkZsaW51eC1mMmZzLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaGFv
Lnl1JTQwb3Bwby5jb20lN0NiYjQxMDA2YzNmNmQ0ZTRkNjAwYTA4ZDk5YjUxY2JjZCU3Q2YxOTA1
ZWIxYzM1MzQxYzU5NTE2NjJiNGE1NGI1ZWU2JTdDMCU3QzAlN0M2Mzc3MTE1OTc4OTU0MDAyODYl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVN
eklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9JTJCbEVB
WFdMcFY1d0dYMmhMMFdqNXAycVgwQXFmVUZJMDVRaXFkcDhQSzhnJTNEJmFtcDtyZXNlcnZlZD0w
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
