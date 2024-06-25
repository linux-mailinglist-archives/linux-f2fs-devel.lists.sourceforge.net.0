Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CD916556
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 12:37:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM3Y5-0004lo-5y;
	Tue, 25 Jun 2024 10:37:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sM3Y4-0004lh-DX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 10:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oyvoJMp1YpcwAJy2v5mg1fxIBDLQJ9lkCXxU6wmmVAU=; b=VdGfrn/j4K6pVixopUMWJANgJT
 WyhjuwvsWzOjRVe8/52BrqGqNc1pK+g9/zbJDi4gpi7olbhaG3leMvR/mTXPK2BH8OPmZNzGui0WG
 ANowOEaI2iTUPmk/XHiHau9vLGIzk+jo2F21dYBj2SyiZRuOZuFAx/eC9ff2M3gL9O7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oyvoJMp1YpcwAJy2v5mg1fxIBDLQJ9lkCXxU6wmmVAU=; b=kAN4knxHXs0+7S2BJFVTcwIaM5
 4vIt738FLQjRiEnWAhq1TsJA+TROLcCH8D6zoBWatTQc0Q1gvoUpYqgJc0TpIHbPnIEpKXcWhawD3
 FMbkv6gRU19nJS1laxqm92leyrqdNMEPMyg1BNXeR9x29FC7VlFv85p3iD91aK0lG14E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM3Y4-0005HO-KC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 10:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A5D9611D7;
 Tue, 25 Jun 2024 10:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD496C32781;
 Tue, 25 Jun 2024 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719311825;
 bh=zfHyXq4AEEpoZTJZYYvzdLfZN8M9azfQlCbm1meZUn8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qBTA/dTUbJNrtLkWjxxaJrLTWa5gadqMc3l5hWl1125xofX5AJsv6h534c8Dl8jho
 MPwnmyMzIQTqOo0nNe1+/AXVl192GlkUfrxm1lQZjr+Iv860IjtpE5KiRKdAt49yEL
 1m1H73LeKtCN7EPRBEBdhh2R0jFh3Wax3yZi44dOF6N6EYMFU3hwJ73nn++JAaMyJO
 VYG4s1mvobIAsmo6691lmCGnjO47OWOQjPPhqzrNsbicwoQJrJMOtFNxbd+O4vz+3h
 M1KWUCcNlVXlmhhesqGgwcvcr/vGv1OeSRmoDp5VyWcPGoRWxsLOLuHQUxc7cS4Frb
 2ODlurzM8BQcA==
Message-ID: <1fe7878f-36db-4055-9e40-b39425eb5936@kernel.org>
Date: Tue, 25 Jun 2024 18:37:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20240625065459.3665791-1-chao@kernel.org>
 <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/25 16:09, 牛志国 (Zhiguo Niu) wrote: > > > -----邮件原件-----
    > 发件人: Chao Yu <chao@kernel.org> > 发送时间: 2024年6月25日 14:55
    > 收件人: jaegeuk@kernel.org > 抄送: l [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sM3Y4-0005HO-KC
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IHJlZHVj?=
 =?utf-8?q?e_expensive_checkpoint_trigger_frequency?=
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
Cc: =?UTF-8?B?546L55qTIChIYW9faGFvIFdhbmcp?= <Hao_hao.Wang@unisoc.com>,
 wangzijie <wangzijie1@honor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzI1IDE2OjA5LCDniZvlv5flm70gKFpoaWd1byBOaXUpIHdyb3RlOgo+IAo+IAo+
IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPiDlj5HpgIHml7bpl7Q6IDIwMjTlubQ25pyIMjXml6UgMTQ6NTUKPiDmlLbku7bkuro6
IGphZWdldWtAa2VybmVsLm9yZwo+IOaKhOmAgTogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz47IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+OyDniZvlv5flm70g
KFpoaWd1byBOaXUpIDxaaGlndW8uTml1QHVuaXNvYy5jb20+OyBZdW5sZWkgSGUgPGhleXVubGVp
QGhpaG9ub3IuY29tPgo+IOS4u+mimDogW1BBVENIIHY0XSBmMmZzOiByZWR1Y2UgZXhwZW5zaXZl
IGNoZWNrcG9pbnQgdHJpZ2dlciBmcmVxdWVuY3kKPiAKPiAKPiDms6jmhI86IOi/meWwgemCruS7
tuadpeiHquS6juWklumDqOOAgumZpOmdnuS9oOehruWumumCruS7tuWGheWuueWuieWFqO+8jOWQ
puWImeS4jeimgeeCueWHu+S7u+S9lemTvuaOpeWSjOmZhOS7tuOAggo+IENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+IAo+IAo+IAo+IFdlIG1heSB0
cmlnZ2VyIGhpZ2ggZnJlcXVlbnQgY2hlY2twb2ludCBmb3IgYmVsb3cgY2FzZToKPiAxLiBta2Rp
ciAvbW50L2RpcjE7IHNldCBkaXIxIGVuY3J5cHRlZAo+IDIuIHRvdWNoIC9tbnQvZmlsZTE7IGZz
eW5jIC9tbnQvZmlsZTEKPiAzLiBta2RpciAvbW50L2RpcjI7IHNldCBkaXIyIGVuY3J5cHRlZAo+
IDQuIHRvdWNoIC9tbnQvZmlsZTI7IGZzeW5jIC9tbnQvZmlsZTIKPiAuLi4KPiAKPiBBbHRob3Vn
aCwgbmV3bHkgY3JlYXRlZCBkaXIgYW5kIGZpbGUgYXJlIG5vdCByZWxhdGVkLCBkdWUgdG8gY29t
bWl0IGJiZjE1NmY3YWZhNyAoImYyZnM6IGZpeCBsb3N0IHhhdHRycyBvZiBkaXJlY3RvcmllcyIp
LCB3ZSB3aWxsIHRyaWdnZXIgY2hlY2twb2ludCB3aGVuZXZlciBmc3luYygpIGNvbWVzIGFmdGVy
IGEgbmV3IGVuY3J5cHRlZCBkaXIgY3JlYXRlZC4KPiAKPiBJbiBvcmRlciB0byBhdm9pZCBzdWNo
IHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaXNzdWUsIGxldCdzIHJlY29yZCBhbiBlbnRyeSBpbmNs
dWRpbmcgZGlyZWN0b3J5J3MgaW5vIGluIGdsb2JhbCBjYWNoZSB3aGVuZXZlciB3ZSB1cGRhdGUg
ZGlyZWN0b3J5J3MgeGF0dHIgZGF0YSwgYW5kIHRoZW4gdHJpZ2dlcnJpbmcgY2hlY2twb2ludCgp
IG9ubHkgaWYgeGF0dHIgbWV0YWRhdGEgb2YgdGFyZ2V0IGZpbGUncyBwYXJlbnQgd2FzIHVwZGF0
ZWQuCj4gCj4gVGhpcyBwYXRjaCB1cGRhdGVzIHRvIGNvdmVyIGJlbG93IG5vIGVuY3J5cHRpb24g
Y2FzZSBhcyB3ZWxsOgo+IDEpIHBhcmVudCBpcyBjaGVja3BvaW50ZWQKPiAyKSBzZXRfeGF0dHIo
ZGlyKSB3LyBuZXcgeG5pZAo+IDMpIGNyZWF0ZShmaWxlKQo+IDQpIGZzeW5jKGZpbGUpCj4gCj4g
Rml4ZXM6IGJiZjE1NmY3YWZhNyAoImYyZnM6IGZpeCBsb3N0IHhhdHRycyBvZiBkaXJlY3Rvcmll
cyIpCj4gUmVwb3J0ZWQtYnk6IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+Cj4gUmVw
b3J0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiBUZXN0ZWQtYnk6
IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiBSZXBvcnRlZC1ieTogWXVubGVp
IEhlIDxoZXl1bmxlaUBoaWhvbm9yLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBmcy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgfCAgMiAr
Kwo+ICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgICAgIHwgIDMgKysrCj4gICBmcy9mMmZzL3hh
dHRyLmMgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQo+ICAgaW5jbHVkZS90cmFjZS9l
dmVudHMvZjJmcy5oIHwgIDMgKystCj4gICA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMv
ZjJmcy9mMmZzLmggaW5kZXggZjFkNjVlZTNhZGRmLi5mM2M5MTBiODk4M2IgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC0yODQsNiArMjg0
LDcgQEAgZW51bSB7Cj4gICAgICAgICAgQVBQRU5EX0lOTywgICAgICAgICAgICAgLyogZm9yIGFw
cGVuZCBpbm8gbGlzdCAqLwo+ICAgICAgICAgIFVQREFURV9JTk8sICAgICAgICAgICAgIC8qIGZv
ciB1cGRhdGUgaW5vIGxpc3QgKi8KPiAgICAgICAgICBUUkFOU19ESVJfSU5PLCAgICAgICAgICAv
KiBmb3IgdHJhbnNhY3Rpb25zIGRpciBpbm8gbGlzdCAqLwo+ICsgICAgICAgRU5DX0RJUl9JTk8s
ICAgICAgICAgICAgLyogZm9yIGVuY3J5cHRlZCBkaXIgaW5vIGxpc3QgKi8KPiAgICAgICAgICBG
TFVTSF9JTk8sICAgICAgICAgICAgICAvKiBmb3IgbXVsdGlwbGUgZGV2aWNlIGZsdXNoaW5nICov
Cj4gICAgICAgICAgTUFYX0lOT19FTlRSWSwgICAgICAgICAgLyogbWF4LiBsaXN0ICovCj4gICB9
Owo+IEBAIC0xMTUwLDYgKzExNTEsNyBAQCBlbnVtIGNwX3JlYXNvbl90eXBlIHsKPiAgICAgICAg
ICBDUF9GQVNUQk9PVF9NT0RFLAo+ICAgICAgICAgIENQX1NQRUNfTE9HX05VTSwKPiAgICAgICAg
ICBDUF9SRUNPVkVSX0RJUiwKPiArICAgICAgIENQX0VOQ19ESVIsCj4gICB9Owo+IAo+ICAgZW51
bSBpb3N0YXRfdHlwZSB7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9m
aWxlLmMgaW5kZXggYTUyN2RlMWU3YTJmLi4yNzg1NzM5NzRkYjQgMTAwNjQ0Cj4gLS0tIGEvZnMv
ZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC0yMTcsNiArMjE3LDkgQEAg
c3RhdGljIGlubGluZSBlbnVtIGNwX3JlYXNvbl90eXBlIG5lZWRfZG9fY2hlY2twb2ludChzdHJ1
Y3QgaW5vZGUgKmlub2RlKQo+ICAgICAgICAgICAgICAgICAgZjJmc19leGlzdF93cml0dGVuX2Rh
dGEoc2JpLCBGMkZTX0koaW5vZGUpLT5pX3Bpbm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFJBTlNfRElSX0lOTykpCj4gICAgICAg
ICAgICAgICAgICBjcF9yZWFzb24gPSBDUF9SRUNPVkVSX0RJUjsKPiArICAgICAgIGVsc2UgaWYg
KGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgRjJGU19JKGlub2RlKS0+aV9waW5vLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRU5D
X0RJUl9JTk8pKQo+ICsgICAgICAgICAgICAgICBjcF9yZWFzb24gPSBDUF9FTkNfRElSOwo+IAo+
ICAgICAgICAgIHJldHVybiBjcF9yZWFzb247Cj4gICB9Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
eGF0dHIuYyBiL2ZzL2YyZnMveGF0dHIuYyBpbmRleCBmMjkwZmU5MzI3YzQuLmQwNGMwYjQ3YTRl
NCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3hhdHRyLmMKPiArKysgYi9mcy9mMmZzL3hhdHRyLmMK
PiBAQCAtNjI5LDYgKzYyOSw3IEBAIHN0YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGludCBpbmRleCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSwgY29uc3Qgdm9pZCAqdmFsdWUsIHNpemVfdCBzaXplLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqaXBhZ2UsIGludCBmbGFncykgIHsKPiArICAgICAg
IHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gICAgICAgICAg
c3RydWN0IGYyZnNfeGF0dHJfZW50cnkgKmhlcmUsICpsYXN0Owo+ICAgICAgICAgIHZvaWQgKmJh
c2VfYWRkciwgKmxhc3RfYmFzZV9hZGRyOwo+ICAgICAgICAgIGludCBmb3VuZCwgbmV3c2l6ZTsK
PiBAQCAtNzcyLDkgKzc3MywxOCBAQCBzdGF0aWMgaW50IF9fZjJmc19zZXR4YXR0cihzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBpbnQgaW5kZXgsCj4gICAgICAgICAgaWYgKGluZGV4ID09IEYyRlNfWEFU
VFJfSU5ERVhfRU5DUllQVElPTiAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAhc3RyY21w
KG5hbWUsIEYyRlNfWEFUVFJfTkFNRV9FTkNSWVBUSU9OX0NPTlRFWFQpKQo+ICAgICAgICAgICAg
ICAgICAgZjJmc19zZXRfZW5jcnlwdGVkX2lub2RlKGlub2RlKTsKPiAtICAgICAgIGlmIChTX0lT
RElSKGlub2RlLT5pX21vZGUpKQo+IC0gICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoRjJGU19J
X1NCKGlub2RlKSwgU0JJX05FRURfQ1ApOwo+IAo+ICsgICAgICAgaWYgKCFTX0lTRElSKGlub2Rl
LT5pX21vZGUpKQo+ICsgICAgICAgICAgICAgICBnb3RvIHNhbWU7Cj4gKyAgICAgICAvKgo+ICsg
ICAgICAgICogSW4gcmVzdHJpY3QgbW9kZSwgZnN5bmMoKSBhbHdheXMgdHJ5IHRvIHRyaWdnZXIg
Y2hlY2twb2ludCBmb3IgYWxsCj4gKyAgICAgICAgKiBtZXRhZGF0YSBjb25zaXN0ZW5jeSwgaW4g
b3RoZXIgbW9kZSwgaXQgdHJpZ2dlcnMgY2hlY2twb2ludCB3aGVuCj4gKyAgICAgICAgKiBwYXJl
bnQncyB4YXR0ciBtZXRhZGF0YSB3YXMgdXBkYXRlZC4KPiArICAgICAgICAqLwo+ICsgICAgICAg
aWYgKEYyRlNfT1BUSU9OKHNiaSkuZnN5bmNfbW9kZSA9PSBGU1lOQ19NT0RFX1NUUklDVCkKPiAr
ICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURfQ1ApOwo+IEhpIENoYW8s
Cj4gRm9yIHRoaXMgY2FzZSwgd2lsbCBpdCBhbHNvIGNhdXNlIHRoZSBzYW1lIGlzc3VlIHdpdGgg
b3JpZ2luYWwgaXNzdWUgd2hlbiBmc3luY19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUID8KPiBp
ZiBja3B0IHRocmVhZCBpcyBibG9ja2VkIGJ5IHNvbWUgcmVhc29ucyBhbmQgU0JJX05FRURfQ1Ag
aXMgbm90IGNsZWFyZWQgaW4gdGltZSwgU3Vic2VxdWVudCBmc3luYyB3aWxsIHRyaWdnZXIgY3A/
CgpIaSBaaGlndW8sCgpJZiB0aGVyZSBpcyBubyBkaXJ0eSBkYXRhIGFmdGVyIHByZXZpb3VzIENQ
LCBsYXRlciBDUCB0cmlnZ2VyZWQgYnkgc3Vic2VxdWVudApmc3luYyB3aWxsIHJldHVybiBkaXJl
Y3RseT8KCglpZiAoIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9JU19ESVJUWSkgJiYKCQkoKGNw
Yy0+cmVhc29uICYgQ1BfRkFTVEJPT1QpIHx8IChjcGMtPnJlYXNvbiAmIENQX1NZTkMpIHx8CgkJ
KChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpICYmICFzYmktPmRpc2NhcmRfYmxrcykpKQoJCWdv
dG8gb3V0OwoKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgZjJmc19hZGRfaW5vX2Vu
dHJ5KHNiaSwgaW5vZGUtPmlfaW5vLCBFTkNfRElSX0lOTyk7Cj4gVGhpcyBwYXRjaCB2ZXJzaW9u
IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBkaXIgaXMgZW5jcnlwdGVkIG9yIG5vdCwgc28gdGhpcyBu
YW1lKEVOQ19ESVJfSU5PKSBjYW4gYmUgcmVuYW1lIG90aGVyIGZvciBtb3JlIGFjY3VyYXRlPwoK
VGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhpcywgbGV0IG1lIGZpeCBpdCBpbiB2NS4KClRoYW5r
cywKCj4gVGhhbmtz77yBCj4gICBzYW1lOgo+ICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfQUNMX01PREUpKSB7Cj4gICAgICAgICAgICAgICAgICBpbm9kZS0+aV9tb2Rl
ID0gRjJGU19JKGlub2RlKS0+aV9hY2xfbW9kZTsgZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJhY2Uv
ZXZlbnRzL2YyZnMuaCBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBpbmRleCBlZDc5NGI1
ZmVmYmUuLmU0YTk0OTk1ZTlhOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9m
MmZzLmgKPiArKysgYi9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPiBAQCAtMTM5LDcgKzEz
OSw4IEBAIFRSQUNFX0RFRklORV9FTlVNKEVYX0JMT0NLX0FHRSk7Cj4gICAgICAgICAgICAgICAg
ICB7IENQX05PREVfTkVFRF9DUCwgICAgICAibm9kZSBuZWVkcyBjcCIgfSwgICAgICAgICAgICAg
IFwKPiAgICAgICAgICAgICAgICAgIHsgQ1BfRkFTVEJPT1RfTU9ERSwgICAgICJmYXN0Ym9vdCBt
b2RlIiB9LCAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgeyBDUF9TUEVDX0xPR19O
VU0sICAgICAgImxvZyB0eXBlIGlzIDIiIH0sICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAg
ICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAgICJkaXIgbmVlZHMgcmVjb3ZlcnkiIH0pCj4gKyAg
ICAgICAgICAgICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAgICJkaXIgbmVlZHMgcmVjb3Zlcnki
IH0sICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICB7IENQX0VOQ19ESVIsICAgICAgICAgICAi
cGVyc2lzdCBlbmNyeXB0aW9uIHBvbGljeSIgfSkKPiAKPiAgICNkZWZpbmUgc2hvd19zaHV0ZG93
bl9tb2RlKHR5cGUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAg
ICAgICAgIF9fcHJpbnRfc3ltYm9saWModHlwZSwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gLS0KPiAyLjQwLjEKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
