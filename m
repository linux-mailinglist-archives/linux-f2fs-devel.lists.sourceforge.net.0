Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9AD9D8422
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2024 12:14:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFX2W-0001Mq-R4;
	Mon, 25 Nov 2024 11:14:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tFX2V-0001Mk-7o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 11:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/VyPmzs8Xbq1ApgWPjWNpCrxAFIkkn7RfHPVRn0gvg=; b=gMsYCX6HS8D0zP6xvKwIyQt2Js
 lgJNnXsxT4ZOBUVOIm3/LWVpIPtH22H7Ili5iMrrwfFU1yoRrD4IUiujUeRJiVBbMQgD5LD+Fhp7I
 hmhvEXmrQew46KgMlrmjX10ryTZCb7ML/KjTqSbuhwEfRGQvpkhonYXbEdKoSyODcwzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c/VyPmzs8Xbq1ApgWPjWNpCrxAFIkkn7RfHPVRn0gvg=; b=KhDwBkcj35AMgwNNIsu15evr1m
 3h6b+3bBh4A/Jid18cvUW8pT8wlU9NQT1Q5qF5cfOrAwDEL0P/EZgJToDG/3Q7uEFPjKEvPEQazPR
 C5LIvcQa3bfECKg5kVYTtIrvhNEXPMpsJhuIhjAB4qLSokYiIm8ohcg2UvYPwafOnMgE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tFX2U-0003pu-AE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 11:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E757A41624;
 Mon, 25 Nov 2024 11:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF722C4CECE;
 Mon, 25 Nov 2024 11:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732533232;
 bh=em2+R4u2wEQPpLl6eVmHSeE2ZgN4ooDYI6iFZ92Y+sI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FJPmdiQekWqfdMgE1/OmJyFKt6+URYxapD+gGJI5GzAwba32anEEa4xmEB+xMYiC2
 Ft1UT90zHjBBJhwlrBNDhxHdIfUrabWdhpXMjaQB1XUITtrdnA7D2quZlrxoG2naAU
 gtpk+BJNv97q+8Gj5MTbf+wiGuFZ6q7lcck45aQpbMTVJW7Yfy9aa3RewgNdpAqb1A
 sT3K6KT7Pxt/r+ieMZkP9FpPwKCfRBSWsWFK1e1BrO/5duCkkU+ICdKYpSh/7qr8G7
 zOODtTV3aotqEcjUx5tuYQ/FUjhxdzFgGb4KukBcr09Thx4e9sEjJCRjuuAgoBbjgO
 koo9L7fp/OBGA==
Message-ID: <0b9efdbb-e897-45d2-8005-bd3d6f6fa2db@kernel.org>
Date: Mon, 25 Nov 2024 19:13:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?546L56eA57qiIChYaXVob25nIFdhbmcp?= <Xiuhong.Wang@unisoc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20241122065005.3772987-1-chao@kernel.org>
 <6ddf779148f44295acfbe547d9ec3aab@BJMBX02.spreadtrum.com>
Content-Language: en-US
In-Reply-To: <6ddf779148f44295acfbe547d9ec3aab@BJMBX02.spreadtrum.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/25 11:11, 王秀红 (Xiuhong Wang) wrote: > Hi
   Chao, > > after tested in this weekend with these patch base on the orginal
    case, no issue reproduced, so > Tested-by: Xiuhong Wang <xiuhong.w [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tFX2U-0003pu-AE
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjIgMS8yXSBmMmZzOiBm?=
 =?utf-8?q?ix_to_shrink_read_extent_node_in_batches?=
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
Cc: =?UTF-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS8yNSAxMToxMSwg546L56eA57qiIChYaXVob25nIFdhbmcpIHdyb3RlOgo+IEhp
IENoYW8sCj4gCj4gYWZ0ZXIgdGVzdGVkIGluIHRoaXMgd2Vla2VuZCB3aXRoIHRoZXNlIHBhdGNo
IGJhc2Ugb24gdGhlIG9yZ2luYWwgY2FzZSwgbm8gaXNzdWUgcmVwcm9kdWNlZCwgc28KPiBUZXN0
ZWQtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9uZy53YW5nQHVuaXNvYy5jb20+CgpIaSBYaXVob25n
LAoKVGhhbmtzIGZvciBoZWxwaW5nIHRvIHRlc3QuCgpUaGFua3MsCgo+IAo+IHRoYW5rcyEKPiAK
PiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4g5Y+R5Lu25Lq6OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4g5Y+R6YCB5pe26Ze0OiAyMDI05bm0MTHmnIgyMuaXpSAxNDo1MAo+IOaUtuS7tuS6
ujogamFlZ2V1a0BrZXJuZWwub3JnCj4g5oqE6YCBOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldDsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPjsg546L56eA57qiIChYaXVob25nIFdhbmcpIDxYaXVob25nLldhbmdAdW5p
c29jLmNvbT47IOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkgPFpoaWd1by5OaXVAdW5pc29jLmNvbT4K
PiDkuLvpopg6IFtQQVRDSCB2MiAxLzJdIGYyZnM6IGZpeCB0byBzaHJpbmsgcmVhZCBleHRlbnQg
bm9kZSBpbiBiYXRjaGVzCj4gCj4gCj4g5rOo5oSPOiDov5nlsIHpgq7ku7bmnaXoh6rkuo7lpJbp
g6jjgILpmaTpnZ7kvaDnoa7lrprpgq7ku7blhoXlrrnlronlhajvvIzlkKbliJnkuI3opoHngrnl
h7vku7vkvZXpk77mjqXlkozpmYTku7bjgIIKPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPiBXZSB1c2Ugcndsb2NrIHRvIHByb3Rl
Y3QgY29yZSBzdHJ1Y3R1cmUgZGF0YSBvZiBleHRlbnQgdHJlZSBkdXJpbmcgaXRzIHNocmluaywg
aG93ZXZlciwgaWYgdGhlcmUgaXMgYSBodWdlIG51bWJlciBvZiBleHRlbnQgbm9kZXMgaW4gZXh0
ZW50IHRyZWUsIGR1cmluZyBzaHJpbmsgb2YgZXh0ZW50IHRyZWUsIGl0IG1heSBob2xkIHJ3bG9j
ayBmb3IgYSB2ZXJ5IGxvbmcgdGltZSwgd2hpY2ggbWF5IHRyaWdnZXIga2VybmVsIGhhbmcgaXNz
dWUuCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0byBzaHJpbmsgcmVhZCBleHRlbnQgbm9kZSBpbiBi
YXRjaGVzLCBzbyB0aGF0LCBjcml0aWNhbCByZWdpb24gb2YgdGhlIHJ3bG9jayBjYW4gYmUgc2hy
dW5rIHRvIGF2b2lkIGl0cyBleHRyZW1lIGxvbmcgdGltZSBob2xkLgo+IAo+IFJlcG9ydGVkLWJ5
OiBYaXVob25nIFdhbmcgPHhpdWhvbmcud2FuZ0B1bmlzb2MuY29tPgo+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MTExMjExMDYyNy4xMzE0NjMy
LTEteGl1aG9uZy53YW5nQHVuaXNvYy5jb20vCj4gU2lnbmVkLW9mZi1ieTogWGl1aG9uZyBXYW5n
IDx4aXVob25nLndhbmdAdW5pc29jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6
aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+IC0tLQo+IHYyOgo+IC0gbm8gdXBkYXRlcy4KPiAgIGZzL2YyZnMvZXh0ZW50X2Nh
Y2hlLmMgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hl
LmMgaW5kZXggMDE5YzFmN2I3ZmE1Li5iN2E2ODE3YjQ0YjAgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJm
cy9leHRlbnRfY2FjaGUuYwo+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiBAQCAtMzc5
LDIxICszNzksMjIgQEAgc3RhdGljIHN0cnVjdCBleHRlbnRfdHJlZSAqX19ncmFiX2V4dGVudF90
cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsICB9Cj4gCj4gICBzdGF0aWMgdW5zaWduZWQgaW50IF9f
ZnJlZV9leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBleHRlbnRfdHJlZSAqZXQpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0LCB1bnNp
Z25lZCBpbnQKPiArIG5yX3NocmluaykKPiAgIHsKPiAgICAgICAgICBzdHJ1Y3QgcmJfbm9kZSAq
bm9kZSwgKm5leHQ7Cj4gICAgICAgICAgc3RydWN0IGV4dGVudF9ub2RlICplbjsKPiAtICAgICAg
IHVuc2lnbmVkIGludCBjb3VudCA9IGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpOwo+ICsgICAg
ICAgdW5zaWduZWQgaW50IGNvdW50Owo+IAo+ICAgICAgICAgIG5vZGUgPSByYl9maXJzdF9jYWNo
ZWQoJmV0LT5yb290KTsKPiAtICAgICAgIHdoaWxlIChub2RlKSB7Cj4gKwo+ICsgICAgICAgZm9y
IChjb3VudCA9IDA7IG5vZGUgJiYgY291bnQgPCBucl9zaHJpbms7IGNvdW50KyspIHsKPiAgICAg
ICAgICAgICAgICAgIG5leHQgPSByYl9uZXh0KG5vZGUpOwo+ICAgICAgICAgICAgICAgICAgZW4g
PSByYl9lbnRyeShub2RlLCBzdHJ1Y3QgZXh0ZW50X25vZGUsIHJiX25vZGUpOwo+ICAgICAgICAg
ICAgICAgICAgX19yZWxlYXNlX2V4dGVudF9ub2RlKHNiaSwgZXQsIGVuKTsKPiAgICAgICAgICAg
ICAgICAgIG5vZGUgPSBuZXh0Owo+ICAgICAgICAgIH0KPiAKPiAtICAgICAgIHJldHVybiBjb3Vu
dCAtIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpOwo+ICsgICAgICAgcmV0dXJuIGNvdW50Owo+
ICAgfQo+IAo+ICAgc3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdCBleHRl
bnRfdHJlZSAqZXQsIEBAIC02MjIsNiArNjIzLDMwIEBAIHN0YXRpYyBzdHJ1Y3QgZXh0ZW50X25v
ZGUgKl9faW5zZXJ0X2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAg
ICAgICByZXR1cm4gZW47Cj4gICB9Cj4gCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgX19kZXN0cm95
X2V4dGVudF9ub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkgewo+ICsgICAgICAgc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiArICAgICAgIHN0cnVj
dCBleHRlbnRfdHJlZSAqZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVt0eXBlXTsKPiAr
ICAgICAgIHVuc2lnbmVkIGludCBucl9zaHJpbmsgPSB0eXBlID09IEVYX1JFQUQgPwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUkVBRF9FWFRFTlRfQ0FDSEVfU0hSSU5LX05VTUJF
UiA6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBR0VfRVhURU5UX0NBQ0hFX1NI
UklOS19OVU1CRVI7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbm9kZV9jbnQgPSAwOwo+ICsKPiAr
ICAgICAgIGlmICghZXQgfHwgIWF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICB3aGlsZSAoYXRvbWljX3JlYWQoJmV0LT5u
b2RlX2NudCkpIHsKPiArICAgICAgICAgICAgICAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+ICsg
ICAgICAgICAgICAgICBub2RlX2NudCArPSBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCwgbnJf
c2hyaW5rKTsKPiArICAgICAgICAgICAgICAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4gKyAg
ICAgICB9Cj4gKwo+ICsgICAgICAgZjJmc19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5v
ZGVfY250KSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIG5vZGVfY250Owo+ICt9Cj4gKwo+ICAgc3Rh
dGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGV4dGVudF9pbmZvICp0ZWksIGVudW0g
ZXh0ZW50X3R5cGUgdHlwZSkgIHsgQEAgLTc2MCw5ICs3ODUsNiBAQCBzdGF0aWMgdm9pZCBfX3Vw
ZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgIH0KPiAKPiAtICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfTk9fRVhURU5UKSkKPiAtICAgICAgICAgICAgICAgX19mcmVlX2V4dGVudF90cmVl
KHNiaSwgZXQpOwo+IC0KPiAgICAgICAgICBpZiAoZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+ICAg
ICAgICAgICAgICAgICAgZXQtPmxhcmdlc3RfdXBkYXRlZCA9IGZhbHNlOwo+ICAgICAgICAgICAg
ICAgICAgdXBkYXRlZCA9IHRydWU7Cj4gQEAgLTc4MCw2ICs4MDIsOSBAQCBzdGF0aWMgdm9pZCBf
X3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgb3V0X3Jl
YWRfZXh0ZW50X2NhY2hlOgo+ICAgICAgICAgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+IAo+
ICsgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKQo+ICsg
ICAgICAgICAgICAgICBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoaW5vZGUsIEVYX1JFQUQpOwo+ICsK
PiAgICAgICAgICBpZiAodXBkYXRlZCkKPiAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9k
ZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsgIH0gQEAgLTk0MiwxMCArOTY3LDE0IEBAIHN0YXRp
YyB1bnNpZ25lZCBpbnQgX19zaHJpbmtfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBpbnQgbnJfc2hyaW5rCj4gICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGV0
LCBuZXh0LCAmZXRpLT56b21iaWVfbGlzdCwgbGlzdCkgewo+ICAgICAgICAgICAgICAgICAgaWYg
KGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBub2RlX2Nu
dCArPSBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3NocmluayAtIG5vZGVfY250IC0KPiArIHRy
ZWVfY250KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGVfdW5sb2NrKCZldC0+bG9j
ayk7Cj4gICAgICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNi
aSwgYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpOwo+ICsKPiArICAgICAgICAgICAgICAgaWYg
KGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gdW5sb2NrX291dDsKPiArCj4gICAgICAgICAgICAgICAgICBsaXN0X2RlbF9pbml0KCZldC0+
bGlzdCk7Cj4gICAgICAgICAgICAgICAgICByYWRpeF90cmVlX2RlbGV0ZSgmZXRpLT5leHRlbnRf
dHJlZV9yb290LCBldC0+aW5vKTsKPiAgICAgICAgICAgICAgICAgIGttZW1fY2FjaGVfZnJlZShl
eHRlbnRfdHJlZV9zbGFiLCBldCk7IEBAIC0xMDg0LDIzICsxMTEzLDYgQEAgdW5zaWduZWQgaW50
IGYyZnNfc2hyaW5rX2FnZV9leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGlu
dCBucl9zaHJpbmsKPiAgICAgICAgICByZXR1cm4gX19zaHJpbmtfZXh0ZW50X3RyZWUoc2JpLCBu
cl9zaHJpbmssIEVYX0JMT0NLX0FHRSk7ICB9Cj4gCj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgX19k
ZXN0cm95X2V4dGVudF9ub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkKPiAtewo+IC0g
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiAtICAg
ICAgIHN0cnVjdCBleHRlbnRfdHJlZSAqZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVt0
eXBlXTsKPiAtICAgICAgIHVuc2lnbmVkIGludCBub2RlX2NudCA9IDA7Cj4gLQo+IC0gICAgICAg
aWYgKCFldCB8fCAhYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpCj4gLSAgICAgICAgICAgICAg
IHJldHVybiAwOwo+IC0KPiAtICAgICAgIHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPiAtICAgICAg
IG5vZGVfY250ID0gX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+IC0gICAgICAgd3JpdGVf
dW5sb2NrKCZldC0+bG9jayk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIG5vZGVfY250Owo+IC19Cj4g
LQo+ICAgdm9pZCBmMmZzX2Rlc3Ryb3lfZXh0ZW50X25vZGUoc3RydWN0IGlub2RlICppbm9kZSkg
IHsKPiAgICAgICAgICBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoaW5vZGUsIEVYX1JFQUQpOyBAQCAt
MTEwOSw3ICsxMTIxLDYgQEAgdm9pZCBmMmZzX2Rlc3Ryb3lfZXh0ZW50X25vZGUoc3RydWN0IGlu
b2RlICppbm9kZSkKPiAKPiAgIHN0YXRpYyB2b2lkIF9fZHJvcF9leHRlbnRfdHJlZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBlbnVtIGV4dGVudF90eXBlIHR5cGUpICB7Cj4gLSAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ICAgICAgICAgIHN0cnVjdCBl
eHRlbnRfdHJlZSAqZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVt0eXBlXTsKPiAgICAg
ICAgICBib29sIHVwZGF0ZWQgPSBmYWxzZTsKPiAKPiBAQCAtMTExNyw3ICsxMTI4LDYgQEAgc3Rh
dGljIHZvaWQgX19kcm9wX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGVudW0gZXh0
ZW50X3R5cGUgdHlwZSkKPiAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAKPiAgICAgICAgICB3
cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4gLSAgICAgICBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBl
dCk7Cj4gICAgICAgICAgaWYgKHR5cGUgPT0gRVhfUkVBRCkgewo+ICAgICAgICAgICAgICAgICAg
c2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7Cj4gICAgICAgICAgICAgICAgICBp
ZiAoZXQtPmxhcmdlc3QubGVuKSB7Cj4gQEAgLTExMjYsNiArMTEzNiw5IEBAIHN0YXRpYyB2b2lk
IF9fZHJvcF9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBlbnVtIGV4dGVudF90eXBl
IHR5cGUpCj4gICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgfQo+ICAgICAgICAgIHdyaXRl
X3VubG9jaygmZXQtPmxvY2spOwo+ICsKPiArICAgICAgIF9fZGVzdHJveV9leHRlbnRfbm9kZShp
bm9kZSwgdHlwZSk7Cj4gKwo+ICAgICAgICAgIGlmICh1cGRhdGVkKQo+ICAgICAgICAgICAgICAg
ICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOyAgfQo+IC0tCj4gMi40
MC4xCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
