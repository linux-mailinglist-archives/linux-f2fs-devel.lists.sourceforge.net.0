Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1083A85A11
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:32:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3Bgg-0002fY-Vx;
	Fri, 11 Apr 2025 10:32:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3BgW-0002f4-6G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GZjCZS6PIG+uHen4yWTtPOjV690ZA0bLvIrEIS7foZU=; b=gnLSI1Om4RCcrIGjC9J/m6CCed
 hM3q7qn8MKwlGFya1ZFbr7w2YP3aGxe3UJP4Zlc+dO+Kg4R496ezivjWKA6REJ2jL/kL0bNclbfWn
 gxAkIISNPKA4uTlCNE97LgFQe89ghpr1KlJ5MxX4NHcuwEbj4aNqwycOLE825SbIYga4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GZjCZS6PIG+uHen4yWTtPOjV690ZA0bLvIrEIS7foZU=; b=lsyS6PUaZFSze7A/iWnfv1Qo42
 YW96dAu6L7hyflVcE9YnuV1uYx220SyofdD8MwAG9nRX8mfMNLaBYmPDrjX2E5oMDYhjVpgf0BUSw
 eZ56ze8zeBUmNvSYwABw3xwArLA7k1rLAfgHPCcB7o0hTGPbZUyN1nzHCZJuw7Hi5aIg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BgG-0006iR-OO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6368E5C3DFA;
 Fri, 11 Apr 2025 10:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CD1C4CEE2;
 Fri, 11 Apr 2025 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744367526;
 bh=ffKkQfoE7oCdc+GzLf4zcDDChKCL02Tj8blGUtUYAps=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DzMwqJjTTSMuDyZ6bnUDcAOEJj6dZROi1kWHSBH/O94Jts7BUWUj3w/3Bo+sQHu9p
 5rPfu+Ecsu3exkcsdXT5gijuKGivNjffS1on3OVajymY3N1F/z5FXx1zQfKO2LIkTt
 jc2iKuoiwPEdjZFx+XR6z9jpTtS0P8BXFMzsYWbnn/OIJEO6u9zwlmLDJo8KyarmVg
 ClpNisqc2VHbkfe/eE05aHGRfr7pXNy04zIY/UqCZ+WgShnVFXta2fQMuDB6jukn9Y
 9gT4HYd7jyalBAI3Rilc59PSg63PsMZO6lr12vtEeZxhonfHrY1DE3w0mrq+kJLcXR
 7m+LGkb3Tz/Nw==
Message-ID: <895fb0f9-244d-4251-afb5-6ad9fef28d7a@kernel.org>
Date: Fri, 11 Apr 2025 18:32:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250407020727.1810288-1-chao@kernel.org>
 <CAHJ8P3+p9ExSyCxhBT0EUsVD15-v==4rhyQ8nXYXWwMEBEKvFA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3+p9ExSyCxhBT0EUsVD15-v==4rhyQ8nXYXWwMEBEKvFA@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/4/11 10:07, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年4月7日周一 10:11写道：
    >> >> Support a new option --nolinear-lookup=X f [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BgG-0006iR-OO
Subject: Re: [f2fs-dev] [PATCH v2 3/3] fsck.f2fs: support to tune linear
 lookup feature
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDEwOjA3LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4
LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6
jjIwMjXlubQ05pyIN+aXpeWRqOS4gCAxMDoxMeWGmemBk++8mgo+Pgo+PiBTdXBwb3J0IGEgbmV3
IG9wdGlvbiAtLW5vbGluZWFyLWxvb2t1cD1YIGZvciBmc2NrLmYyZnMgdG8gdHVuZQo+PiBsaW5l
YXIgbG9va3VwIGZhbGxiYWNrIGNvbmRpdGlvbmFsbHksIFg9MTogZGlzYWJsZSBsaW5lYXIgbG9v
a3VwLAo+PiBYPTA6IGVuYWJsZSBsaW5lYXIgbG9va3VwLgo+Pgo+PiBUaGlzIGNhbiBoZWxwIHRv
IDEpIGFkZCBhIHJlZ3Jlc3Npb24gdGVzdGNhc2UgdG8gY2hlY2sga2VybmVsCj4+IHdoZXRoZXIg
bGluZWFyIGxvb2t1cCBmYWxsYmFjayBoYXMgZml4ZWQgdW5pY29kZSByZWQgaGVhcnQgbG9va3Vw
Cj4+IGlzc3VlLCAyKSBvbmNlIHVuaWNvZGUgYnVnIGhhcyBiZWVuIGZpeGVkLCB3ZSBjYW4gdXNl
IHRoaXMgb3B0aW9uCj4+IHRvIGRpc2FibGUgbGluZWFyIGxvb2t1cCBmb3IgcGVyZm9ybWFuY2Ug
cmVjb3ZlcnkuCj4+Cj4+IENjOiBEYW5pZWwgTGVlIDxjaHVsbGVlQGdvb2dsZS5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+IHYyOgo+PiAt
IGFkZCBkZXNjcmlwdGlvbiBpbiBmc2NrIG1hbnVhbAo+PiAgIGZzY2svZnNjay5jICAgICAgIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gICBmc2NrL2ZzY2suaCAgICAgICB8ICAx
ICsKPj4gICBmc2NrL21haW4uYyAgICAgICB8IDEwICsrKysrKysrKysKPj4gICBpbmNsdWRlL2Yy
ZnNfZnMuaCB8ICA4ICsrKysrKy0tCj4+ICAgbWFuL2ZzY2suZjJmcy44ICAgfCAgMyArKysKPj4g
ICA1IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9mc2NrL2ZzY2suYyBiL2ZzY2svZnNjay5jCj4+IGluZGV4IDgxNTVjYmQu
LjA1OWJhNjEgMTAwNjQ0Cj4+IC0tLSBhL2ZzY2svZnNjay5jCj4+ICsrKyBiL2ZzY2svZnNjay5j
Cj4+IEBAIC0yMzU3LDYgKzIzNTcsMzAgQEAgaW50IGZzY2tfY2hrX3F1b3RhX2ZpbGVzKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKPj4gICAgICAgICAgcmV0dXJuIHJldDsKPj4gICB9Cj4+Cj4+
ICt2b2lkIGZzY2tfdXBkYXRlX3NiX2ZsYWdzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4g
K3sKPj4gKyAgICAgICBzdHJ1Y3QgZjJmc19zdXBlcl9ibG9jayAqc2IgPSBGMkZTX1JBV19TVVBF
UihzYmkpOwo+PiArICAgICAgIHUxNiBmbGFncyA9IGdldF9zYihzX2VuY29kaW5nX2ZsYWdzKTsK
Pj4gKwo+PiArICAgICAgIGlmIChjLm5vbGluZWFyX2xvb2t1cCkgewo+PiArICAgICAgICAgICAg
ICAgaWYgKCEoZmxhZ3MgJiBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwpKSB7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGZsYWdzIHw9IEYyRlNfRU5DX05PX0NPTVBBVF9GQUxMQkFD
S19GTDsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2V0X3NiKHNfZW5jb2RpbmdfZmxhZ3Ms
IGZsYWdzKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYy5maXhfb24gPSAxOwo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjLmludmFsaWRfc2IgfD0gU0JfRU5DT0RFX0ZMQUc7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIERCRygwLCAiQ2FzZWZvbGQ6IGVuYWJsZSBub2xpbmVhciBs
b29rdXBcbiIpOwo+PiArICAgICAgICAgICAgICAgfQo+PiArICAgICAgIH0gZWxzZSB7Cj4+ICsg
ICAgICAgICAgICAgICBpZiAoZmxhZ3MgJiBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwp
IHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgJj0gfkYyRlNfRU5DX05PX0NPTVBB
VF9GQUxMQkFDS19GTDsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2V0X3NiKHNfZW5jb2Rp
bmdfZmxhZ3MsIGZsYWdzKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYy5maXhfb24gPSAx
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBjLmludmFsaWRfc2IgfD0gU0JfRU5DT0RFX0ZM
QUc7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIERCRygwLCAiQ2FzZWZvbGQ6IGRpc2FibGUg
bm9saW5lYXIgbG9va3VwXG4iKTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKyAgICAgICB9Cj4+
ICt9Cj4+ICsKPj4gICBpbnQgZnNja19jaGtfbWV0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4+ICAgewo+PiAgICAgICAgICBzdHJ1Y3QgZjJmc19mc2NrICpmc2NrID0gRjJGU19GU0NLKHNi
aSk7Cj4+IEBAIC0zNzcwLDcgKzM3OTQsNyBAQCBpbnQgZnNja192ZXJpZnkoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpKQo+PiAgICAgICAgICAgICAgICAgIGlmIChjLmludmFsaWRfc2IgJiBTQl9G
U19FUlJPUlMpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1zZXQoc2ItPnNfZXJyb3Jz
LCAwLCBNQVhfRjJGU19FUlJPUlMpOwo+Pgo+PiAtICAgICAgICAgICAgICAgaWYgKGMuaW52YWxp
ZF9zYiAmIFNCX05FRURfRklYKQo+PiArICAgICAgICAgICAgICAgaWYgKGMuaW52YWxpZF9zYiAm
IChTQl9ORUVEX0ZJWCB8IFNCX0VOQ09ERV9GTEFHKSkKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHVwZGF0ZV9zdXBlcmJsb2NrKHNiLCBTQl9NQVNLX0FMTCk7Cj4+Cj4+ICAgICAgICAgICAg
ICAgICAgLyogdG8gcmV0dXJuIEZTQ0tfRVJST1JfQ09SUkVDVEVEICovCj4+IGRpZmYgLS1naXQg
YS9mc2NrL2ZzY2suaCBiL2ZzY2svZnNjay5oCj4+IGluZGV4IGI1ODFkM2UuLjQwY2I2ZDkgMTAw
NjQ0Cj4+IC0tLSBhL2ZzY2svZnNjay5oCj4+ICsrKyBiL2ZzY2svZnNjay5oCj4+IEBAIC0xODgs
NiArMTg4LDcgQEAgZXh0ZXJuIGludCBmc2NrX2Noa19kZW50cnlfYmxrKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKiwgaW50LAo+PiAgIGludCBmc2NrX2Noa19pbmxpbmVfZGVudHJpZXMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqLCBzdHJ1Y3QgZjJmc19ub2RlICosCj4+ICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGNoaWxkX2luZm8gKik7Cj4+ICAgdm9pZCBmc2NrX2Noa19jaGVja3BvaW50KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSk7Cj4+ICt2b2lkIGZzY2tfdXBkYXRlX3NiX2ZsYWdzKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSk7Cj4+ICAgaW50IGZzY2tfY2hrX21ldGEoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKTsKPj4gICB2b2lkIGZzY2tfY2hrX2FuZF9maXhfd3JpdGVfcG9pbnRlcnMoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqKTsKPj4gICBpbnQgZnNja19jaGtfY3Vyc2VnX2luZm8oc3RydWN0
IGYyZnNfc2JfaW5mbyAqKTsKPj4gZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWlu
LmMKPj4gaW5kZXggNDdiYTZjOS4uNTI0ZGJiMSAxMDA2NDQKPj4gLS0tIGEvZnNjay9tYWluLmMK
Pj4gKysrIGIvZnNjay9tYWluLmMKPj4gQEAgLTkxLDYgKzkxLDcgQEAgdm9pZCBmc2NrX3VzYWdl
KCkKPj4gICAgICAgICAgTVNHKDAsICIgIC0tbm8ta2VybmVsLWNoZWNrIHNraXBzIGRldGVjdGlu
ZyBrZXJuZWwgY2hhbmdlXG4iKTsKPj4gICAgICAgICAgTVNHKDAsICIgIC0ta2VybmVsLWNoZWNr
IGNoZWNrcyBrZXJuZWwgY2hhbmdlXG4iKTsKPj4gICAgICAgICAgTVNHKDAsICIgIC0tZGVidWct
Y2FjaGUgdG8gZGVidWcgY2FjaGUgd2hlbiAtYyBpcyB1c2VkXG4iKTsKPj4gKyAgICAgICBNU0co
MCwgIiAgLS1ub2xpbmVhci1sb29rdXA9WCBYPTE6IGRpc2FibGUgbGluZWFyIGxvb2t1cCwgWD0w
OiBlbmFibGUgbGluZWFyIGxvb2t1cFxuIik7Cj4+ICAgICAgICAgIGV4aXQoMSk7Cj4+ICAgfQo+
Pgo+PiBAQCAtMjYzLDYgKzI2NCw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRpb25zKGludCBhcmdj
LCBjaGFyICphcmd2W10pCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB7Im5vLWtlcm5lbC1j
aGVjayIsIG5vX2FyZ3VtZW50LCAwLCAyfSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHsi
a2VybmVsLWNoZWNrIiwgbm9fYXJndW1lbnQsIDAsIDN9LAo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgeyJkZWJ1Zy1jYWNoZSIsIG5vX2FyZ3VtZW50LCAwLCA0fSwKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgeyJub2xpbmVhci1sb29rdXAiLCByZXF1aXJlZF9hcmd1bWVudCwgMCwgNX0s
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB7MCwgMCwgMCwgMH0KPj4gICAgICAgICAgICAg
ICAgICB9Owo+Pgo+PiBAQCAtMjg3LDYgKzI4OSwxMiBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9u
cyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2Fz
ZSA0Ogo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLmNhY2hlX2NvbmZpZy5k
YmdfZW4gPSB0cnVlOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2FzZSA1Ogo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghb3B0YXJnIHx8ICFzdHJjbXAob3B0YXJnLCAiMCIpKQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5ub2xpbmVhcl9sb29rdXAgPSAw
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMubm9saW5lYXJfbG9va3VwID0gMTsKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiBIaSBDaGFvCj4gSSBhbHNvIGVu
Y291bnRlcmVkIHRoZSBzYW1lIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gcHJvYmxlbSBpbiBBbmRy
b2lkCj4gZGV2aWNlIGFzIGtlcm5lbCBjb21taXQKPiA1MWRjNDkxYTA4NTUoImYyZnM6IHN1cHBv
cnQgdG8gZGlzYWJsZSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIikgc2hvd24uCj4gCj4gc28gYmVj
YXVzZSB3ZSBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoaXMgY29tbWl0IGFib3V0IGZzY2sgdG8gYXZv
aWQKPiBwZXJmb3JtYW5jZSByZWdyZXNzaW9ucy4KPiBJcyBpdCBhcHByb3ByaWF0ZSB0byBzZXQg
dGhpcyBwYXJhbWV0ZXIgIGRpc2FibGUgbGluZWFyX2xvb2t1cCBieQo+IGRlZmF1bHQg77yIYy5u
b2xpbmVhcl9sb29rdXAgPSAx77yJPwo+IFRoaXMgYWxzbyBmaXRzIG1vc3Qgb2YgdGhlIHNjZW5h
cmlvcy4KPiBJZiBvdGhlciB1c2VycyB3YW50IHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUsIHRoZXkg
Y2FuIGNvbnRyb2wgaXQKPiB0aHJvdWdoIHBhcmFtZXRlcnMuCgpaaGlndW8sCgpUaGVyZSBhcmUg
dHdvIGNvbmRpdGlvbnMgdXNlciB3aWxsIGxvc3QgdGhlaXIgZmlsZSB3aGljaCBoYXMgc3BlY2lm
aWVkCmNoYXJhY3RvcnMsIGxpa2UgcmVkIGhlYXJ0IOKdpO+4jy4KCmNhc2UgIzEKLSBjcmVhdGUg
ZmlsZSBuYW1lZCByZWRfaGVhcnQg4p2k77iPCi0gYXBwbHkgNWMyNmQyZjFkM2Y1ICgidW5pY29k
ZTogRG9uJ3Qgc3BlY2lhbCBjYXNlIGlnbm9yYWJsZSBjb2RlIHBvaW50cyIpCi0gc3RhdCByZWRf
aGVhcnQg4p2k77iPIC0tPiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgpjYXNlICMyCi0gYXBw
bHkgNWMyNmQyZjFkM2Y1ICgidW5pY29kZTogRG9uJ3Qgc3BlY2lhbCBjYXNlIGlnbm9yYWJsZSBj
b2RlIHBvaW50cyIpCi0gY3JlYXRlIGZpbGUgbmFtZWQgcmVkX2hlYXJ0IOKdpO+4jwotIHJldmVy
dCA1YzI2ZDJmMWQzZjUgKCJ1bmljb2RlOiBEb24ndCBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNv
ZGUgcG9pbnRzIikKLSBzdGF0IHJlZF9oZWFydCDinaTvuI8gLS0+IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKCklmIHlvdSBkb2VzIG5vdCBtYXRjaGVkIGFueSBvZiBhYm92ZSBjYXNlcywgSSBn
dWVzcyBpdCdzIGZpbmUgZm9yIHlvdSB0bwpkaXNhYmxlIGxpbmVhciBmYWxsYmFjay4KCkkgcHJl
ZmVyIHRvIHdhaXQgZm9yIHRoZSBmb3JtYWwgZml4IGZvciBzcGVjaWZpZWQgdW5pY29kZSBjaGFy
YWN0b3IKaGFuZGxpbmcsIGFuZCB0aGVuIGRpc2FibGUgbGluZWFyIGZhbGxiYWNrLCBhcyBJIGRv
bid0IGtub3cgdGhlIGNvbmRpdGlvbgpvZiBvdXIgdXNlci4KCj4gdGhhbmtzIQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgY2FzZSAnYSc6Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGMuYXV0b19maXggPSAxOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBNU0coMCwgIkluZm86IEF1dG9tYXRpYyBmaXggbW9kZSBlbmFibGVkLlxuIik7Cj4+IEBAIC05
OTAsNiArOTk4LDggQEAgc3RhdGljIGludCBkb19mc2NrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfRlRfRElSLCBUWVBFX0lOT0RFLCAm
YmxrX2NudCwgJmNiYywgJmNoaWxkKTsKPj4gICAgICAgICAgZnNja19jaGtfcXVvdGFfZmlsZXMo
c2JpKTsKPj4KPj4gKyAgICAgICBmc2NrX3VwZGF0ZV9zYl9mbGFncyhzYmkpOwo+PiArCj4+ICAg
ICAgICAgIHJldCA9IGZzY2tfdmVyaWZ5KHNiaSk7Cj4+ICAgICAgICAgIGZzY2tfZnJlZShzYmkp
Owo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZzX2ZzLmggYi9pbmNsdWRlL2YyZnNfZnMu
aAo+PiBpbmRleCBmMjA2OTk0Li43ZTNmMjViIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2YyZnNf
ZnMuaAo+PiArKysgYi9pbmNsdWRlL2YyZnNfZnMuaAo+PiBAQCAtNjgyLDcgKzY4Miw4IEBAIGVu
dW0gewo+PiAgICNkZWZpbmUgSVNfREVWSUNFX0FMSUFTSU5HKGZpKSAoKGZpKS0+aV9mbGFncyAm
IGNwdV90b19sZTMyKEYyRlNfREVWSUNFX0FMSUFTX0ZMKSkKPj4KPj4gICAjZGVmaW5lIEYyRlNf
RU5DX1VURjhfMTJfMSAgICAgMQo+PiAtI2RlZmluZSBGMkZTX0VOQ19TVFJJQ1RfTU9ERV9GTCAg
ICAgICAgKDEgPDwgMCkKPj4gKyNkZWZpbmUgRjJGU19FTkNfU1RSSUNUX01PREVfRkwgICAgICAg
ICAgICAgICAgKDEgPDwgMCkKPj4gKyNkZWZpbmUgRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNL
X0ZMICgxIDw8IDEpCj4+Cj4+ICAgLyogVGhpcyBmbGFnIGlzIHVzZWQgYnkgbm9kZSBhbmQgbWV0
YSBpbm9kZXMsIGFuZCBieSByZWNvdmVyeSAqLwo+PiAgICNkZWZpbmUgR0ZQX0YyRlNfWkVSTyAg
KEdGUF9OT0ZTIHwgX19HRlBfWkVSTykKPj4gQEAgLTE0NjcsNyArMTQ2OCw5IEBAIGVudW0gewo+
PiAgICNkZWZpbmUgU0JfQUJOT1JNQUxfU1RPUCAgICAgICAweDIgICAgIC8qIHNfc3RvcF9yZWFz
b24gaXMgc2V0IGV4Y2VwdCBzaHV0ZG93biAqLwo+PiAgICNkZWZpbmUgU0JfRlNfRVJST1JTICAg
ICAgICAgICAweDQgICAgIC8qIHNfZXJyb3MgaXMgc2V0ICovCj4+ICAgI2RlZmluZSBTQl9JTlZB
TElEICAgICAgICAgICAgIDB4OCAgICAgLyogc2IgaXMgaW52YWxpZCAqLwo+PiAtI2RlZmluZSBT
Ql9ORUVEX0ZJWCAoU0JfQUJOT1JNQUxfU1RPUCB8IFNCX0ZTX0VSUk9SUyB8IFNCX0lOVkFMSUQp
Cj4+ICsjZGVmaW5lIFNCX0VOQ09ERV9GTEFHICAgICAgICAgMHgxNiAgICAvKiBlbmNvZGVfZmxh
ZyAqLwo+PiArI2RlZmluZSBTQl9ORUVEX0ZJWCAgICAgICAgICAgIChTQl9BQk5PUk1BTF9TVE9Q
IHwgU0JfRlNfRVJST1JTIHwgICAgICBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU0JfSU5WQUxJRCB8IFNCX0VOQ09ERV9GTEFHKQo+Pgo+PiAgICNkZWZpbmUgTUFYX0NBQ0hF
X1NVTVMgICAgICAgICAgICAgICAgIDgKPj4KPj4gQEAgLTE1NDEsNiArMTU0NCw3IEBAIHN0cnVj
dCBmMmZzX2NvbmZpZ3VyYXRpb24gewo+PiAgICAgICAgICBpbnQgcHJlc2VydmVfbGltaXRzOyAg
ICAgICAgICAgIC8qIHByZXNlcnZlIHF1b3RhIGxpbWl0cyAqLwo+PiAgICAgICAgICBpbnQgbGFy
Z2VfbmF0X2JpdG1hcDsKPj4gICAgICAgICAgaW50IGZpeF9jaGtzdW07ICAgICAgICAgICAgICAg
ICAvKiBmaXggb2xkIGNwLmNoa3N1bSBwb3NpdGlvbiAqLwo+PiArICAgICAgIGludCBub2xpbmVh
cl9sb29rdXA7ICAgICAgICAgICAgLyogZGlzYWJsZSBsaW5lYXIgbG9va3VwICovCj4+ICAgICAg
ICAgIHVuc2lnbmVkIGludCBmZWF0dXJlOyAgICAgICAgICAgICAgICAgICAvKiBkZWZpbmVkIGZl
YXR1cmVzICovCj4+ICAgICAgICAgIHVuc2lnbmVkIGludCBkaXNhYmxlZF9mZWF0dXJlOyAgLyog
ZGlzYWJsZWQgZmVhdHVyZSwgdXNlZCBmb3IgQW5kcm9pZCBvbmx5ICovCj4+ICAgICAgICAgIHVu
c2lnbmVkIGludCBxdW90YV9iaXRzOyAgICAgICAgLyogcXVvdGEgYml0cyAqLwo+PiBkaWZmIC0t
Z2l0IGEvbWFuL2ZzY2suZjJmcy44IGIvbWFuL2ZzY2suZjJmcy44Cj4+IGluZGV4IGUzOWE4NDYu
LjYwNmUyODggMTAwNjQ0Cj4+IC0tLSBhL21hbi9mc2NrLmYyZnMuOAo+PiArKysgYi9tYW4vZnNj
ay5mMmZzLjgKPj4gQEAgLTY3LDYgKzY3LDkgQEAgRW5hYmxlIHRvIHNob3cgZXZlcnkgZGlyZWN0
b3J5IGVudHJpZXMgaW4gdGhlIHBhcnRpdGlvbi4KPj4gICBTcGVjaWZ5IHRoZSBsZXZlbCBvZiBk
ZWJ1Z2dpbmcgb3B0aW9ucy4KPj4gICBUaGUgZGVmYXVsdCBudW1iZXIgaXMgMCwgd2hpY2ggc2hv
d3MgYmFzaWMgZGVidWdnaW5nIG1lc3NhZ2VzLgo+PiAgIC5UUAo+PiArLkJJIFwtLW5vbGluZWFy
LWxvb2t1cAo+PiArVHVuZSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrLCBtdXN0IHNwZWNpZnkgYW4g
YXJndW1lbnQsIDA6IGVuYWJsZSBsaW5lYXIgbG9va3VwLCAxOiBkaXNhYmxlIGxpbmVhciBsb29r
dXAuCj4+ICsuVFAKPj4gICAuU0ggQVVUSE9SCj4+ICAgSW5pdGlhbCBjaGVja2luZyBjb2RlIHdh
cyB3cml0dGVuIGJ5IEJ5b3VuZyBHZXVuIEtpbSA8YmdiZy5raW1Ac2Ftc3VuZy5jb20+Lgo+PiAg
IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHJld29ya2VkIG1vc3QgcGFydHMgb2Yg
dGhlIGNvZGVzIHRvIHN1cHBvcnQKPj4gLS0KPj4gMi40OS4wCj4+Cj4+Cj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
