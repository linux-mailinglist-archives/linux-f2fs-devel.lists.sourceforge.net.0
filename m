Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884B4CFB1F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 11:30:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRAcr-0007i1-5P; Mon, 07 Mar 2022 10:29:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRAcm-0007hN-OK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 10:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jqcxnRqZk90EpYiuISctfLtxeOITMGDNx9vsDALsI0k=; b=M6DwduzWLcTQ5z0S1262g0lf/d
 duUGuv9B7Bxzb3nvjCW/kaBFffgPeHmLSzBA2rQg+5d+UC9rlDj7QcAa8AFHt/ZGkzavlSb8tM2a9
 6ASa/xLRJiCvSLP6H0TLaTrc6OqXSIKWcEPcgb5CoHTQ/grp1PUjAnivEwWiQxNR9tfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqcxnRqZk90EpYiuISctfLtxeOITMGDNx9vsDALsI0k=; b=iLqJfwJ8bGVesqsiQ+SdGOwdbo
 bp9rHz8PsOZchxs18zuOB1btioy9Bqq96WFXwgCMAQ2p4bBwTxKUwiSuVkwPSCWsNmo0oCXfl9lxm
 bkyYzcA6FJ/dcuXKE2HmHNH9rR5Sr5z5jO37ga5pM1AtAbUU3+7z6d9C0trwQpVSHn8Q=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRAck-007Hq3-7Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 10:29:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5465B80CA8;
 Mon,  7 Mar 2022 10:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571CBC340F3;
 Mon,  7 Mar 2022 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646648982;
 bh=TBiJrty/qH5XQRL9/b6Ws4XEDcgyrWdPvPcOJCW6s5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QlrTQqBJMewCoL9m+qKPAlv4aQiV0BNm2NcparFQeosfOaKUdXS8QMMAye0Ua83j9
 CISX9IcvnOoMnyhF2zzB4mL1kTAoRtB6r8O+CjmGvHt77RYDdU3g2ylutEME60gifs
 UQlsDQ0TbgwNFfrbhVzElOS6tUxRO+AFL+79yqi+XI2Yiv6shAuYLnrkXc4ybqlmLM
 7LUVKsRqx02qI09Mvpia5kNvffP9C12Xka2wQ2AxNs5JCfWUfNL02OSJPparUQTPFU
 hbEvIssJKg6biPEYZ7TgCUf/SsuEwTRABAAg6kMkoq3cHA5ThGa6Ghcd3aVyznB3GL
 IV6HJBeviiqSg==
Message-ID: <a9cbd24b-9da8-9f92-dd20-39f3a4fa5732@kernel.org>
Date: Mon, 7 Mar 2022 18:29:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 Fengnan Chang <fengnanchang@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20220305040019.225150-1-fengnanchang@gmail.com>
 <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
 <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/3/7 15:54, 常凤楠 wrote: > >> 
 
 Content analysis details:   (-5.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRAck-007Hq3-7Y
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic
 write may cause data corruption
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8zLzcgMTU6NTQsIOW4uOWHpOaloCB3cm90ZToKPiAKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiBTZW50OiBN
b25kYXksIE1hcmNoIDcsIDIwMjIgOTo0MyBBTQo+PiBUbzogRmVuZ25hbiBDaGFuZyA8ZmVuZ25h
bmNoYW5nQGdtYWlsLmNvbT47IGphZWdldWtAa2VybmVsLm9yZwo+PiBDYzogbGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IOW4uOWHpOaloAo+PiA8Y2hhbmdmZW5nbmFuQHZp
dm8uY29tPgo+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSF0gZjJmczogZml4IGNvbXByZXNzIGZp
bGUgc3RhcnQgYXRvbWljIHdyaXRlIG1heSBjYXVzZQo+PiBkYXRhIGNvcnJ1cHRpb24KPj4KPj4g
T24gMjAyMi8zLzUgMTI6MDAsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+PiBXaGVuIGNvbXByZXNz
ZWQgZmlsZSBoYXMgYmxvY2tzLCBzdGFydCBhdG9taWMgd3JpdGUgd2lsbCBiZSBmYWlsZWQsCj4+
PiBidXQKPj4KPj4gWW91IG1lYW4gZjJmc19pb2Nfc3RhcnRfYXRvbWljX3dyaXRlIHdpbGwgc3Vj
Y2VlZCwgYnV0IGNvbXByZXNzZWQgZmxhZyB3aWxsCj4+IGJlIHJlbWFpbmVkIGluIGlub2RlPwo+
IAo+IFllcy4KPiAKPj4KPj4+IHN0aWxsIHNldCBGSV9BVE9NSUNfRklMRSBmbGFnLCBpZiB3cml0
ZSBwYXJ0aWFsIGNsdXN0ZXIgYW5kIGNvbW1pdAo+Pj4gYXRvbWljIHdyaXRlIHdpbGwgY2F1c2Ug
ZGF0YSBjb3JydXB0aW9uLgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91
dCB3aHkgZGF0YSB3aWxsIGJlIGNvcnJ1cHRlZD8KPiAKPiBTdGVwIDE6Cj4gQ3JlYXRlIGEgY29t
cHJlc3NlZCBmaWxlICx3cml0ZSA2NEsgZGF0YSAsIGNhbGwgZnN5bmMoKSwgdGhlbiB0aGUgYmxv
Y2tzIGFyZSB3cml0ZSBhcyBjb21wcmVzc2VkIGNsdXN0ZXIuCj4gU3RlcDI6Cj4gaW90Y2woRjJG
U19JT0NfU1RBUlRfQVRPTUlDX1dSSVRFKSAgLS0tIHRoaXMgc2hvdWxkIGJlIGZhaWwsIGJ1dCBu
b3QuCj4gd3JpdGUgcGFnZSAwIGFuZCBwYWdlIDMuCj4gaW90Y2woRjJGU19JT0NfQ09NTUlUX0FU
T01JQ19XUklURSkgIC0tIHBhZ2UgMCBhbmQgMyB3cml0ZSBhcyBub3JtYWwgZmlsZSwKPiBTdGVw
MzoKPiBkcm9wIGNhY2hlLgo+IFJlYWQgcGFnZSAwLTQgICAtLSBTaW5jZSBwYWdlIDAgaGFzIGEg
dmFsaWQgYmxvY2sgYWRkcmVzcywgcmVhZCBhcyBuby1jb21wcmVzc2VkLCBwYWdlIDEgYW5kIDIg
d2lsbCBiZSBjb21wcmVzc2VkIGRhdGEgb3IgemVyby4KPiAKPiBBbmQgYmVmb3JlIGYyZnM6IGNv
bXByZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3aGVuIHJld3JpdGUgd2hvbGUgY2x1c3Rlciks
IGV2ZW4gU3RlcCAyIGlzIG5vdCByaWdodCwgYnV0IHdob2xlCj4gY2x1c3RlciB3aWxsIG1hcmsg
ZGlydHkgaW4gd3JpdGVfYmVnaW4sIGFuZCB3aG9sZSBjbHVzdGVyIHdpbGwgYmUgcmUtd3JpdGUg
YXMgbm8tY29tcHJlc3NlZCBjbHVzdGVyLCBzbyBpdCdzIG9rLgoKQWgsIGFmdGVyIDdlYWI3YTY5
NjgyNyAoZjJmczogY29tcHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZSB3
aG9sZSBjbHVzdGVyKSwKd2UgZXhwZWN0IHRoYXQgZjJmc193cml0ZV9jYWNoZV9wYWdlcygpIHdp
bGwgYmUgY2FsbGVkLCBhbmQgZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSgpCmNhbiBy
ZWFkIGFuZCBzZXQgZGlydHkgbGVmdCBwYWdlcyBvZiBjb21wcmVzc2VkIGNsdXN0ZXIuCgpIb3dl
dmVyIGF0b21pYyBjb21taXQgZmxvdyB3b24ndCBjYWxsIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMo
KS4uLgoKQW55d2F5LCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgYW5kLCBjb3VsZCB5b3Ug
cGxlYXNlIGFkZCBhYm92ZSBjb21tZW50cyBpbnRvIGNvbW1pdApkZXNjcmlwdGlvbiBvZiB0aGlz
IHBhdGNoPwoKVGhhbmtzLAoKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gRml4ZXM6IDRjOGZmNzA5
NWJlZiAoZjJmczogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uKQo+Pj4gRml4ZXM6IDdlYWI3YTY5
NjgyNyAoZjJmczogY29tcHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZQo+
Pj4gd2hvbGUgY2x1c3RlcikKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxm
ZW5nbmFuY2hhbmdAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgICBmcy9mMmZzL2RhdGEuYyB8IDQg
Ky0tLQo+Pj4gICAgZnMvZjJmcy9maWxlLmMgfCAzICsrLQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMgaW5kZXgKPj4+IDZiNWYzODliYTk5OC4uNWNi
ZWU0ZWQwOTgyIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4+PiBAQCAtMzM1OCw4ICszMzU4LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRl
X2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QKPj4gYWRkcmVzc19zcGFjZSAqbWFwcGlu
ZywKPj4+ICAgIAkJaW50IHJldDsKPj4+Cj4+PiAgICAJCSpmc2RhdGEgPSBOVUxMOwo+Pj4gLQo+
Pj4gLQkJaWYgKGxlbiA9PSBQQUdFX1NJWkUpCj4+PiArCQlpZiAobGVuID09IFBBR0VfU0laRSAm
JiAhKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSkKPj4+ICAgIAkJCWdvdG8gcmVwZWF0Owo+
Pj4KPj4+ICAgIAkJcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwg
cGFnZXAsIGRpZmYgLS1naXQKPj4+IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYyBp
bmRleCBjZmRjNDFmODdmNWQuLjI2YTY0OGVmOWUxZgo+Pj4gMTAwNjQ0Cj4+PiAtLS0gYS9mcy9m
MmZzL2ZpbGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+IEBAIC0yMDA5LDcgKzIwMDks
OCBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3N0YXJ0X2F0b21pY193cml0ZShzdHJ1Y3QKPj4+IGZp
bGUgKmZpbHApCj4+Pgo+Pj4gICAgCWlub2RlX2xvY2soaW5vZGUpOwo+Pj4KPj4+IC0JZjJmc19k
aXNhYmxlX2NvbXByZXNzZWRfZmlsZShpbm9kZSk7Cj4+PiArCWlmICghZjJmc19kaXNhYmxlX2Nv
bXByZXNzZWRfZmlsZShpbm9kZSkpCj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+Cj4+PiAgICAJ
aWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7Cj4+PiAgICAJCWlmIChpc19pbm9kZV9m
bGFnX3NldChpbm9kZSwgRklfQVRPTUlDX1JFVk9LRV9SRVFVRVNUKSkKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
