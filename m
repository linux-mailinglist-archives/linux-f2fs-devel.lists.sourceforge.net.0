Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6554A6430C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 08:13:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu4el-0006Wm-Jy;
	Mon, 17 Mar 2025 07:13:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tu4ek-0006WX-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 07:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCayJzQyXHFB5H7Hdnb4m5KAQ9IOTRvi1QJNiCAOTUg=; b=SGU/KBGo5JLxvIA4OewjSac02S
 NQBqs1smRwfAlCPQI+MLQL+jm8rdsnMOyKHx9KYIO/5jCfcr1roYuySdo4+cigCqk3JsAAxsaZgBF
 EfiwkFR/OlL7xhIANFNhuFTQZ/0jiM4+y3KwQkSsV+caD2IllEp7x0sDCeSffW3Mxhyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FCayJzQyXHFB5H7Hdnb4m5KAQ9IOTRvi1QJNiCAOTUg=; b=PAQ4se0TgA/7jAxr0DQJRbvo3/
 t91ucFLfqGr4ZKSDji7jdZMlY9B+jGpII7j2S5wkj8xZnxChYjqLaOhZrnclt1gOWGeBpL5bJ9p3S
 sXSBDC1DI/M1qzob7dqHhXM7jS87f7Sf6/HanEUMYtoFyHnFM8D9MnL/CJy6dbADd9/8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu4ek-0006CB-22 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 07:13:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE9925C53C6;
 Mon, 17 Mar 2025 07:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2DFC4CEE3;
 Mon, 17 Mar 2025 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742195576;
 bh=8CS4msPxk4DCirERvuRrksmNRWtm494ZCr116H0cv0I=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LF62dsWd9hmoMcCslTEilzyXJHFy/cmN8CxKod0XPZRyzzmfvTheXhT9/p+iFgH4B
 v4UFJHUrh0HrqZfW8i0M3gL6Zlb9Ltw1VREPojlOiXryU0D4sFQI0AiXpPSosWHgnx
 /Wq/AcGHdbB8M4JCsS2oDgPjDeFcHNukHBvFsggRIwoBdkQle6RWeNFN10doNU2A4+
 SeRZLScE4awskkiblmxaoTBzbe7zQsroyGJvPIbmfU9hzwMuTE3ubrc5CxEDJyxTM3
 BoxOCb9kIqH/UGs4Xes0EU/pYSauaVSI+yHvJObNIU6kfdnbu15muYAobrHOOdbEZ3
 skboG043PBhOw==
Message-ID: <6ad02c17-a175-43fd-bce4-d3cd2dc01338@kernel.org>
Date: Mon, 17 Mar 2025 15:12:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250109122755.177926-1-guochunhai@vivo.com>
 <4270b213-e4f9-46b2-958a-df3dbaaed969@kernel.org>
 <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
Content-Language: en-US
In-Reply-To: <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/13/25 10:25, Chunhai Guo wrote: > 在 1/20/2025 8:25
   PM, Chao Yu 写道: >> On 1/9/25 20:27, Chunhai Guo wrote: >>> During a checkpoint,
    the current active segment X may not be handled >>> proper [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tu4ek-0006CB-22
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard for active
 segments
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8xMy8yNSAxMDoyNSwgQ2h1bmhhaSBHdW8gd3JvdGU6Cj4g5ZyoIDEvMjAvMjAyNSA4OjI1
IFBNLCBDaGFvIFl1IOWGmemBkzoKPj4gT24gMS85LzI1IDIwOjI3LCBDaHVuaGFpIEd1byB3cm90
ZToKPj4+IER1cmluZyBhIGNoZWNrcG9pbnQsIHRoZSBjdXJyZW50IGFjdGl2ZSBzZWdtZW50IFgg
bWF5IG5vdCBiZSBoYW5kbGVkCj4+PiBwcm9wZXJseS4gVGhpcyBvY2N1cnMgd2hlbiBzZWdtZW50
IFggaGFzIDAgdmFsaWQgYmxvY2tzIGFuZCBhIG5vbi16ZXJvCj4+IEhvdyBkb2VzIHRoaXMgaGFw
cGVuPyBBbGxvY2F0b3Igc2VsZWN0cyBhIGRpcnR5IHNlZ21lbnQgdy8gU1NSPyBhbmQgdGhlCj4+
IGxlZnQgdmFsaWQgZGF0YSBibG9ja3Mgd2VyZSBkZWxldGVkIGxhdGVyIGJlZm9yZSBmb2xsb3dp
bmcgY2hlY2twb2ludD8KPj4KPj4gSWYgc28sIHBlbmRpbmcgZGlzY2FyZCBjb3VudCBpbiB0aGF0
IHNlZ21lbnQgc2hvdWxkIGJlIGluIHJhbmdlIG9mICgwLCA1MTIpPwo+IAo+IAo+IFRoaXMgaXNz
dWUgaXMgZm91bmQgd2l0aCBMRlMgcmF0aGVyIHRoYW4gU1NSLiBIZXJlJ3Mgd2hhdCBoYXBwZW5z
OiBzb21lCj4gZGF0YSBibG9ja3MgYXJlIGFsbG9jYXRlZCBmb3IgYSBmaWxlIGluIHRoZSBjdXJy
ZW50IGFjdGl2ZSBzZWdtZW50LCBhbmQKPiB0aGVuIHRoZSBmaWxlIGlzIGRlbGV0ZWQsIHJlc3Vs
dGluZyBpbiBhbGwgdmFsaWQgZGF0YSBibG9ja3MgaW4gdGhlCj4gY3VycmVudCBhY3RpdmUgc2Vn
bWVudCBiZWluZyBkZWxldGVkIGJlZm9yZSB0aGUgZm9sbG93aW5nIGNoZWNrcG9pbnQuCj4gVGhp
cyBpc3N1ZSBpcyBlYXN5IHRvIHJlcHJvZHVjZSB3aXRoIHRoZSBmb2xsb3dpbmcgb3BlcmF0aW9u
czoKPiAKPiAKPiAjIG1rZnMuZjJmcyAtZiAvZGV2L252bWUybjEKPiAjIG1vdW50IC10IGYyZnMg
L2Rldi9udm1lMm4xIC92dG1wL21udC9mMmZzCj4gIyBkZCBpZj0vZGV2L252bWUwbjEgb2Y9L3Z0
bXAvbW50L2YyZnMvMS5iaW4gYnM9NGsgY291bnQ9MjU2Cj4gIyBzeW5jCj4gIyBybSAvdnRtcC9t
bnQvZjJmcy8xLmJpbgo+ICMgdW1vdW50IC92dG1wL21udC9mMmZzCj4gIyBkdW1wLmYyZnMgL2Rl
di9udm1lMm4xIHwgZ3JlcCAiY2hlY2twb2ludCBzdGF0ZSIKPiBJbmZvOiBjaGVja3BvaW50IHN0
YXRlID0gNDUgOiAgY3JjIGNvbXBhY3RlZF9zdW1tYXJ5IHVubW91bnQgLS0tLQo+ICd0cmltbWVk
JyBmbGFnIGlzIG1pc3NpbmcKPiAKPiBUaGUgcGVuZGluZyBkaXNjYXJkIGNvdW50IGluIHRoYXQg
c2VnbWVudCBpbmRlZWQgZmFsbHMgd2l0aGluIHRoZSByYW5nZQo+IG9mICgwLCA1MTIpLgoKUGxl
YXNlIGFkZCB0aGlzIHRlc3RjYXNlIGludG8gY29tbWl0IG1lc3NhZ2UsIG90aGVyd2lzZSBpdCBs
b29rcwpnb29kIHRvIG1lLCBmZWVsIGZyZWUgdG8gYWRkOgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUg
PGNoYW9Aa2VybmVsLm9yZz4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+PiBUaGFua3MsCj4+Cj4+
PiBudW1iZXIgb2YgZGlzY2FyZCBibG9ja3MsIGZvciB0aGUgZm9sbG93aW5nIHJlYXNvbnM6Cj4+
Pgo+Pj4gbG9jYXRlX2RpcnR5X3NlZ21lbnQoKSBkb2VzIG5vdCBtYXJrIGFueSBhY3RpdmUgc2Vn
bWVudCBhcyBhIHByZWZyZWUKPj4+IHNlZ21lbnQuIEFzIGEgcmVzdWx0LCBzZWdtZW50IFggaXMg
bm90IGluY2x1ZGVkIGluIGRpcnR5X3NlZ21hcFtQUkVdLCBhbmQKPj4+IGYyZnNfY2xlYXJfcHJl
ZnJlZV9zZWdtZW50cygpIHNraXBzIGl0IHdoZW4gaGFuZGxpbmcgcHJlZnJlZSBzZWdtZW50cy4K
Pj4+Cj4+PiBhZGRfZGlzY2FyZF9hZGRycygpIHNraXBzIGFueSBzZWdtZW50IHdpdGggMCB2YWxp
ZCBibG9ja3MsIHNvIHNlZ21lbnQgWCBpcwo+Pj4gYWxzbyBza2lwcGVkLgo+Pj4KPj4+IENvbnNl
cXVlbnRseSwgbm8gYHN0cnVjdCBkaXNjYXJkX2NtZGAgaXMgYWN0dWFsbHkgY3JlYXRlZCBmb3Ig
c2VnbWVudCBYLgo+Pj4gSG93ZXZlciwgdGhlIGNrcHRfdmFsaWRfbWFwIGFuZCBjdXJfdmFsaWRf
bWFwIG9mIHNlZ21lbnQgWCBhcmUgc3luY2VkIGJ5Cj4+PiBzZWdfaW5mb190b19yYXdfc2l0KCkg
ZHVyaW5nIHRoZSBjdXJyZW50IGNoZWNrcG9pbnQgcHJvY2Vzcy4gQXMgYSByZXN1bHQsCj4+PiBp
dCBjYW5ub3QgZmluZCB0aGUgbWlzc2luZyBkaXNjYXJkIGJpdHMgZXZlbiBpbiBzdWJzZXF1ZW50
IGNoZWNrcG9pbnRzLgo+Pj4gQ29uc2VxdWVudGx5LCB0aGUgdmFsdWUgb2Ygc2JpLT5kaXNjYXJk
X2Jsa3MgcmVtYWlucyBub24temVyby4gVGh1cywgd2hlbgo+Pj4gZjJmcyBpcyB1bW91bnRlZCwg
Q1BfVFJJTU1FRF9GTEFHIHdpbGwgbm90IGJlIHNldCBkdWUgdG8gdGhlIG5vbi16ZXJvCj4+PiBz
YmktPmRpc2NhcmRfYmxrcy4KPj4+Cj4+PiBSZWxldmFudCBjb2RlIHByb2Nlc3M6Cj4+Pgo+Pj4g
ZjJmc193cml0ZV9jaGVja3BvaW50KCkKPj4+ICAgICAgIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMo
KQo+Pj4gICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc2VzLCB0bXAsIGhlYWQs
IHNldF9saXN0KSB7Cj4+PiAgICAgICAgICAgICAgICBmb3JfZWFjaF9zZXRfYml0X2Zyb20oc2Vn
bm8sIGJpdG1hcCwgZW5kKSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgLi4uCj4+PiAgICAgICAg
ICAgICAgICAgICAgYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIGZhbHNlKTsgLy8gc2tpcCBz
ZWdtZW50IFggZHVlIHRvIGl0cyAwIHZhbGlkIGJsb2Nrcwo+Pj4gICAgICAgICAgICAgICAgICAg
IC4uLgo+Pj4gICAgICAgICAgICAgICAgICAgIHNlZ19pbmZvX3RvX3Jhd19zaXQoKTsgLy8gc3lu
YyBja3B0X3ZhbGlkX21hcCB3aXRoIGN1cl92YWxpZF9tYXAgZm9yIHNlZ21lbnQgWAo+Pj4gICAg
ICAgICAgICAgICAgICAgIC4uLgo+Pj4gICAgICAgICAgICAgICAgfQo+Pj4gICAgICAgICAgICB9
Cj4+PiAgICAgICBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHMoKTsgLy8gc2VnbWVudCBYIGlz
IG5vdCBpbmNsdWRlZCBpbiBkaXJ0eV9zZWdtYXBbUFJFXSBhbmQgaXMgc2tpcHBlZAo+Pj4KPj4+
IFNpbmNlIGFkZF9kaXNjYXJkX2FkZHJzKCkgY2FuIGhhbmRsZSBhY3RpdmUgc2VnbWVudHMgd2l0
aCBub24temVybyB2YWxpZAo+Pj4gYmxvY2tzLCBpdCBpcyByZWFzb25hYmxlIHRvIGZpeCB0aGlz
IGlzc3VlIGJ5IGFsbG93aW5nIGl0IHRvIGFsc28gaGFuZGxlCj4+PiBhY3RpdmUgc2VnbWVudHMg
d2l0aCAwIHZhbGlkIGJsb2Nrcy4KPj4+Cj4+PiBGaXhlczogYjI5NTU1NTA1ZDgxICgiZjJmczog
YWRkIGtleSBmdW5jdGlvbnMgZm9yIHNtYWxsIGRpc2NhcmRzIikKPj4+IFNpZ25lZC1vZmYtYnk6
IENodW5oYWkgR3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MTIwMzA2NTEwOC4yNzYzNDM2
LTEtZ3VvY2h1bmhhaUB2aXZvLmNvbS8KPj4+IHYxLT52MjoKPj4+ICAgIC0gTW9kaWZ5IHRoZSBj
b21taXQgbWVzc2FnZSB0byBtYWtlIGl0IGVhc2llciB0byB1bmRlcnN0YW5kLgo+Pj4gICAgLSBB
ZGQgZml4ZXMgdG8gdGhlIGNvbW1pdC4KPj4+IC0tLQo+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMg
fCA0ICsrKy0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3Nl
Z21lbnQuYwo+Pj4gaW5kZXggODZlNTQ3ZjAwOGY5Li4xM2VlNzNhM2M0ODEgMTAwNjQ0Cj4+PiAt
LS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IEBA
IC0yMDkwLDcgKzIwOTAsOSBAQCBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsCj4+PiAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+Pj4KPj4+ICAgICAgaWYgKCFmb3JjZSkgewo+Pj4gLSAgICAgICAg
ICAgIGlmICghZjJmc19yZWFsdGltZV9kaXNjYXJkX2VuYWJsZShzYmkpIHx8ICFzZS0+dmFsaWRf
YmxvY2tzIHx8Cj4+PiArICAgICAgICAgICAgaWYgKCFmMmZzX3JlYWx0aW1lX2Rpc2NhcmRfZW5h
YmxlKHNiaSkgfHwKPj4+ICsgICAgICAgICAgICAgICAgICAgICghc2UtPnZhbGlkX2Jsb2NrcyAm
Jgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAhSVNfQ1VSU0VHKHNiaSwgY3BjLT50
cmltX3N0YXJ0KSkgfHwKPj4+ICAgICAgICAgICAgICAgICAgICAgIFNNX0koc2JpKS0+ZGNjX2lu
Zm8tPm5yX2Rpc2NhcmRzID49Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNNX0ko
c2JpKS0+ZGNjX2luZm8tPm1heF9kaXNjYXJkcykKPj4+ICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKPiAKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
