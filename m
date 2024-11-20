Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C604E9D3288
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 04:27:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDbMn-0001l4-Ks;
	Wed, 20 Nov 2024 03:26:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDbMl-0001kj-Qi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 03:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wPU5aRX3PgfTsRZ5/OxBw0HZJxDvqoJniT6PYps3NxY=; b=dKb/JnHesMxleDPaQ8w813bsDC
 CLjMvWJ/GJU1D9GsUCXJ5P2myLyyrx3yolOk5QDuw6t7bnHjWwROvEDZVw2BjCRWfnWhJWXOQ7U0T
 3dtw/UxDQqDcq/339JKJMID1j5mYM0F7kJ7mAFtVsCwBo7i+TusK9U78cVUiEje4thMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wPU5aRX3PgfTsRZ5/OxBw0HZJxDvqoJniT6PYps3NxY=; b=LG+Q0n3XctYJ0dBVfJ42+bEMe0
 KoQbsChRWP6l6MDivZYb+/0XveU6dNSFVVFyU/vKJVoeFC5haTnhuNlI8C/r7nRnwW9cZwBXhWo14
 Gx0B5gDcOYZE/TNjQUWNzE10CIuZ1KqvZL7SpAeZHYvpWhnntacfh3ch2ivJnS6Vca8Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDbMk-00073u-RK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 03:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78BBF5C599D;
 Wed, 20 Nov 2024 03:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B927C4CECD;
 Wed, 20 Nov 2024 03:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732073209;
 bh=pFoFdpRUSILZfAVqihjYwl6kJm2IBX+bSl5vNZz/tRw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CM8WD1Z1qWye61kU1FEj875V+2M6S6c9RvKVkzXsCYVVm1eVztqMQkw9iYKVeN/6d
 zDwQrUoQs+z4wbUXbjH9P8FY0b1lKrGks80r2GayN8+Cl30J1Op0fx/fFfj9QBLoH3
 JXDbbVWjnyJ9cNGao8vRV2UtFabBIcUWAQYNxwp4oxYDpFY6lXITDffecieh/gKCWJ
 7lHY0kYMe14uOwSMJErXUTk8hUCZAwAPNKRWtRtGqRT8W2GsAgivyMlTO5EELZB2gZ
 ATdBAmLvLDanslNiUvAdbmOwzAdq+C1sWjtzy3IMZaJA85hLUXfZUkPrXzuFJMT73h
 wbYbUlP7npKgw==
Message-ID: <65b89566-1038-4422-9e2e-4d7da26dd1c7@kernel.org>
Date: Wed, 20 Nov 2024 11:26:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
 <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
 <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
 <5b0c17da-f1e1-490d-a560-3312bc8c3247@kernel.org>
 <CAHJ8P3+dqhsNOy6-jvPaazSSOk7V9pEkQmamE48oLgGK1ORHfg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3+dqhsNOy6-jvPaazSSOk7V9pEkQmamE48oLgGK1ORHfg@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/19 16:26, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月19日周二 15:50写道： >> >> On 2024/11/19 14:46, Xiuhong
    Wang wrote: >>> Chao Yu <chao@kernel.org> 于2024年11� [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDbMk-00073u-RK
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix to avoid long time to shrink
 extent cache
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Xiuhong Wang <xiuhong.wang.cn@gmail.com>, jaegeuk@kernel.org,
 hao_hao.wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS8xOSAxNjoyNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDE55pel5ZGo5LqMIDE1OjUw5YaZ6YGT77yaCj4+Cj4+
IE9uIDIwMjQvMTEvMTkgMTQ6NDYsIFhpdWhvbmcgV2FuZyB3cm90ZToKPj4+IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyIMTnml6XlkajkuowgMTQ6MDXlhpnpgZPvvJoK
Pj4+Pgo+Pj4+IE9uIDIwMjQvMTEvMTIgMTk6MDYsIFhpdWhvbmcgV2FuZyB3cm90ZToKPj4+Pj4g
V2UgZW5jb3VudGVyZWQgYSBzeXN0ZW0gaGFuZyBwcm9ibGVtIGJhc2VkIG9uIHRoZSBmb2xsb3dp
bmcKPj4+Pj4gZXhwZXJpbWVudDoKPj4+Pj4gVGhlcmUgYXJlIDE3IHByb2Nlc3NlcywgOCBvZiB3
aGljaCBkbyA0ayBkYXRhIHJlYWQsIHdyaXRlIGFuZAo+Pj4+PiBjb21wYXJlIHRlc3RzLCBhbmQg
OCBkbyA2NGsgcmVhZCwgd3JpdGUgYW5kIGNvbXBhcmUgdGVzdHMuIEVhY2gKPj4+Pj4gdGhyZWFk
IHdyaXRlcyBhIDI1Nk0gZmlsZSwgYW5kIGFub3RoZXIgdGhyZWFkIHdyaXRlcyBhIGxhcmdlIGZp
bGUKPj4+Pj4gdG8gODAlIG9mIHRoZSBkaXNrLCBhbmQgdGhlbiBrZWVwcyBkb2luZyByZWFkIG9w
ZXJhdGlvbnMsIGFsbCBvZgo+Pj4+PiB3aGljaCBhcmUgZGlyZWN0IG9wZXJhdGlvbnMuIFRoaXMg
d2lsbCBjYXVzZSB0aGUgbGFyZ2UgZmlsZSB0byBiZQo+Pj4+PiBmaWxsZWQgdG8gODAlIG9mIHRo
ZSBkaXNrIHRvIGJlIHNldmVyZWx5IGZyYWdtZW50ZWQuIE9uIGEgNTEyR0IKPj4+Pj4gZGV2aWNl
LCB0aGlzIGxhcmdlIGZpbGUgbWF5IGdlbmVyYXRlIGEgaHVnZSB6b21iaWUgZXh0ZW50IHRyZWUu
Cj4+Pj4+Cj4+Pj4+IFdoZW4gc3lzdGVtIHNodXR0aW5nIGRvd24sIHRoZSBpbml0IHByb2Nlc3Mg
bmVlZHMgdG8gd2FpdCBmb3IgdGhlCj4+Pj4+IHdyaXRlYmFjayBwcm9jZXNzLCBhbmQgdGhlIHdy
aXRlYmFjayBwcm9jZXNzIG1heSBlbmNvdW50ZXIgdGhlCj4+Pj4+IHNpdHVhdGlvbiB3aGVyZSB0
aGUgUkVBRF9FWFRFTlRfQ0FDSEUgc3BhY2UgaXMgaW5zdWZmaWNpZW50IGFuZAo+Pj4+PiBuZWVk
cyB0byBmcmVlIHRoZSB6b21iaWUgZXh0ZW50IHRyZWUuIFRoZSBleHRlbnQgdHJlZSBoYXMgYSBs
YXJnZQo+Pj4+PiBudW1iZXIgb2YgZXh0ZW50IG5vZGVzLCBpdCB3aWxsIGEgbG9uZyBmcmVlIHRp
bWUgdG8gZnJlZSwgd2hpY2gKPj4+Pj4gdHJpZ2dlcnMgc3lzdGVtIGhhbmcuCj4+Pj4gICAgPiA+
IFRoZSBzdGFjayB3aGVuIHRoZSBwcm9ibGVtIG9jY3VycyBpcyBhcyBmb2xsb3dzOgo+Pj4+PiBj
cmFzaF9hcm02ND4gYnQgMQo+Pj4+PiBQSUQ6IDEgICAgICAgIFRBU0s6IGZmZmZmZjgwODAxYTky
MDAgIENQVTogMSAgICBDT01NQU5EOiAiaW5pdCIKPj4+Pj4gICAgICMwIFtmZmZmZmZjMDA4MDZi
OWEwXSBfX3N3aXRjaF90byBhdCBmZmZmZmZjMDA4MTA3MTFjCj4+Pj4+ICAgICAjMSBbZmZmZmZm
YzAwODA2YmEwMF0gX19zY2hlZHVsZSBhdCBmZmZmZmZjMDA5N2MxYzRjCj4+Pj4+ICAgICAjMiBb
ZmZmZmZmYzAwODA2YmE2MF0gc2NoZWR1bGUgYXQgZmZmZmZmYzAwOTdjMjMwOAo+Pj4+PiAgICAg
IzMgW2ZmZmZmZmMwMDgwNmJhYjBdIHdiX3dhaXRfZm9yX2NvbXBsZXRpb24gYXQgZmZmZmZmYzAw
ODYzMjBkNAo+Pj4+PiAgICAgIzQgW2ZmZmZmZmMwMDgwNmJiMjBdIHdyaXRlYmFja19pbm9kZXNf
c2IgYXQgZmZmZmZmYzAwODYzNzE5Ywo+Pj4+PiAgICAgIzUgW2ZmZmZmZmMwMDgwNmJiYTBdIHN5
bmNfZmlsZXN5c3RlbSBhdCBmZmZmZmZjMDA4NjNjOThjCj4+Pj4+ICAgICAjNiBbZmZmZmZmYzAw
ODA2YmJjMF0gZjJmc19xdW90YV9vZmZfdW1vdW50IGF0IGZmZmZmZmMwMDg4NmZjNjAKPj4+Pj4g
ICAgICM3IFtmZmZmZmZjMDA4MDZiYzIwXSBmMmZzX3B1dF9zdXBlciBhdCBmZmZmZmZjMDA4ODcx
NWI0Cj4+Pj4+ICAgICAjOCBbZmZmZmZmYzAwODA2YmM2MF0gZ2VuZXJpY19zaHV0ZG93bl9zdXBl
ciBhdCBmZmZmZmZjMDA4NWNkNjFjCj4+Pj4+ICAgICAjOSBbZmZmZmZmYzAwODA2YmNkMF0ga2ls
bF9mMmZzX3N1cGVyIGF0IGZmZmZmZmMwMDg4NmIzZGMKPj4+Pj4KPj4+Pj4gY3Jhc2hfYXJtNjQ+
IGJ0IDE0OTk3Cj4+Pj4+IFBJRDogMTQ5OTcgICAgVEFTSzogZmZmZmZmODExOWQ4MjQwMCAgQ1BV
OiAzICAgIENPTU1BTkQ6ICJrd29ya2VyL3UxNjowIgo+Pj4+PiAgICAgIzAgW2ZmZmZmZmMwMTlm
OGI3NjBdIF9fZGV0YWNoX2V4dGVudF9ub2RlIGF0IGZmZmZmZmMwMDg4ZDVhNTgKPj4+Pj4gICAg
ICMxIFtmZmZmZmZjMDE5ZjhiNzkwXSBfX3JlbGVhc2VfZXh0ZW50X25vZGUgYXQgZmZmZmZmYzAw
ODhkNTk3MAo+Pj4+PiAgICAgIzIgW2ZmZmZmZmMwMTlmOGI4MTBdIGYyZnNfc2hyaW5rX2V4dGVu
dF90cmVlIGF0IGZmZmZmZmMwMDg4ZDVjN2MKPj4+Pj4gICAgICMzIFtmZmZmZmZjMDE5ZjhiOGEw
XSBmMmZzX2JhbGFuY2VfZnNfYmcgYXQgZmZmZmZmYzAwODhjMTA5Ywo+Pj4+PiAgICAgIzQgW2Zm
ZmZmZmMwMTlmOGI5MTBdIGYyZnNfd3JpdGVfbm9kZV9wYWdlcyBhdCBmZmZmZmZjMDA4OGJkNGQ4
Cj4+Pj4+ICAgICAjNSBbZmZmZmZmYzAxOWY4Yjk5MF0gZG9fd3JpdGVwYWdlcyBhdCBmZmZmZmZj
MDA4NGEwYjVjCj4+Pj4+ICAgICAjNiBbZmZmZmZmYzAxOWY4YjlmMF0gX193cml0ZWJhY2tfc2lu
Z2xlX2lub2RlIGF0IGZmZmZmZmMwMDg2MmVlMjgKPj4+Pj4gICAgICM3IFtmZmZmZmZjMDE5Zjhi
YjMwXSB3cml0ZWJhY2tfc2JfaW5vZGVzIGF0IGZmZmZmZmMwMDg2MzU4YzAKPj4+Pj4gICAgICM4
IFtmZmZmZmZjMDE5ZjhiYzEwXSB3Yl93cml0ZWJhY2sgYXQgZmZmZmZmYzAwODYzNjJkYwo+Pj4+
PiAgICAgIzkgW2ZmZmZmZmMwMTlmOGJjYzBdIHdiX2RvX3dyaXRlYmFjayBhdCBmZmZmZmZjMDA4
NjM0OTEwCj4+Pj4+Cj4+Pj4+IFByb2Nlc3MgMTQ5OTcgcmFuIGZvciB0b28gbG9uZyBhbmQgY2F1
c2VkIHRoZSBzeXN0ZW0gaGFuZy4KPj4+Pj4KPj4+Pj4gQXQgdGhpcyB0aW1lLCB0aGVyZSBhcmUg
c3RpbGwgMTA4NjkxMSBleHRlbnQgbm9kZXMgaW4gdGhpcyB6b21iaWUKPj4+Pj4gZXh0ZW50IHRy
ZWUgdGhhdCBuZWVkIHRvIGJlIGNsZWFuZWQgdXAuCj4+Pj4+Cj4+Pj4+IGNyYXNoX2FybTY0X3Nw
cmRfdjguMC4zKys+IGV4dGVudF90cmVlLm5vZGVfY250IGZmZmZmZjgwODk2Y2M1MDAKPj4+Pj4g
ICAgICBub2RlX2NudCA9IHsKPj4+Pj4gICAgICAgIGNvdW50ZXIgPSAxMDg2OTExCj4+Pj4+ICAg
ICAgfSwKPj4+Pj4KPj4+Pj4gVGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBwcm9ibGVtIGlzIHRoYXQg
d2hlbiB0aGUgZjJmc19iYWxhbmNlX2ZzCj4+Pj4+IGZ1bmN0aW9uIGlzIGNhbGxlZCBpbiB0aGUg
d3JpdGUgcHJvY2VzcywgaXQgd2lsbCBkZXRlcm1pbmUKPj4+Pj4gd2hldGhlciB0byBjYWxsIGYy
ZnNfYmFsYW5jZV9mc19iZywgYnV0IGl0IGlzIGRpZmZpY3VsdCB0bwo+Pj4+PiBtZWV0IHRoZSBj
b25kaXRpb24gb2YgZXhjZXNzX2NhY2hlZF9uYXRzLiBXaGVuIHRoZQo+Pj4+PiBmMmZzX3Nocmlu
a19leHRlbnRfdHJlZSBmdW5jdGlvbiBpcyBjYWxsZWQgdG8gZnJlZSBkdXJpbmcKPj4+Pj4gZjJm
c193cml0ZV9ub2RlX3BhZ2VzLCB0aGVyZSBhcmUgdG9vIG1hbnkgZXh0ZW50IG5vZGVzIG9uIHRo
ZQo+Pj4+PiBleHRlbnQgdHJlZSwgd2hpY2ggY2F1c2VzIGEgbG9vcCBhbmQgY2F1c2VzIGEgc3lz
dGVtIGhhbmcuCj4+Pj4+Cj4+Pj4+IFRvIHNvbHZlIHRoaXMgcHJvYmxlbSwgd2hlbiBjYWxsaW5n
IGYyZnNfYmFsYW5jZV9mcywgY2hlY2sgd2hldGhlcgo+Pj4+PiB0aGUgZXh0ZW50IGNhY2hlIGlz
IHN1ZmZpY2llbnQuIElmIG5vdCwgcmVsZWFzZSB0aGUgem9tYmllIGV4dGVudAo+Pj4+PiB0cmVl
Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaXVob25nIFdhbmcgPHhpdWhvbmcud2FuZ0B1
bmlzb2MuY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVu
aXNvYy5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBUZXN0IHRoZSBwcm9ibGVtIHdpdGggdGhlIHRlbXBv
cmFyeSB2ZXJzaW9uczoKPj4+Pj4gcGF0Y2ggZGlkIG5vdCByZXByb2R1Y2UgdGhlIHByb2JsZW0s
IHRoZSBwYXRjaCBpcyBhcyBmb2xsb3dzOgo+Pj4+PiBAQCAtNDE1LDcgKzQxNSw3IEBAIHZvaWQg
ZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+Pj4+
PiAgICAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgU1RP
UF9DUF9SRUFTT05fRkFVTFRfSU5KRUNUKTsKPj4+Pj4KPj4+Pj4gICAgICAgICAgICAvKiBiYWxh
bmNlX2ZzX2JnIGlzIGFibGUgdG8gYmUgcGVuZGluZyAqLwo+Pj4+PiAtICAgICAgIGlmIChuZWVk
ICYmIGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkpKQo+Pj4+PiArICAgICAgIGlmIChuZWVkKQo+Pj4+
PiAgICAgICAgICAgICAgICAgICAgZjJmc19iYWxhbmNlX2ZzX2JnKHNiaSwgZmFsc2UpOwo+Pj4+
Pgo+Pj4+PiAtLS0KPj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgNCArKystCj4+Pj4+ICAg
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+
Pj4+IGluZGV4IDE3NjYyNTQyNzlkMi4uMzkwYmVjMTc3NTY3IDEwMDY0NAo+Pj4+PiAtLS0gYS9m
cy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiBAQCAt
NDE1LDcgKzQxNSw5IEBAIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgYm9vbCBuZWVkKQo+Pj4+PiAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9p
bnQoc2JpLCBmYWxzZSwgU1RPUF9DUF9SRUFTT05fRkFVTFRfSU5KRUNUKTsKPj4+Pj4KPj4+Pj4g
ICAgICAgICAvKiBiYWxhbmNlX2ZzX2JnIGlzIGFibGUgdG8gYmUgcGVuZGluZyAqLwo+Pj4+PiAt
ICAgICBpZiAobmVlZCAmJiBleGNlc3NfY2FjaGVkX25hdHMoc2JpKSkKPj4+Pj4gKyAgICAgaWYg
KG5lZWQgJiYgKGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkpIHx8Cj4+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAhZjJmc19hdmFpbGFibGVfZnJlZV9tZW1vcnkoc2JpLCBSRUFEX0VYVEVOVF9DQUNI
RSkgfHwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICFmMmZzX2F2YWlsYWJsZV9mcmVlX21l
bW9yeShzYmksIEFHRV9FWFRFTlRfQ0FDSEUpKSkKPj4+Pgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gSSBk
b3VidCBpZiB0aGVyZSBpcyBubyBlbm91Z2ggbWVtb3J5LCB3ZSBtYXkgc3RpbGwgcnVuIGludG8K
Pj4+PiBmMmZzX3Nocmlua19leHRlbnRfdHJlZSgpIGFuZCBzdWZmZXIgc3VjaCBsb25nIHRpbWUg
ZGVsYXkuCj4+Pj4KPj4+PiBTbywgY2FuIHdlIGp1c3QgbGV0IF9fZnJlZV9leHRlbnRfdHJlZSgp
IGJyZWFrIHRoZSBsb29wIG9uY2Ugd2UgaGF2ZQo+Pj4+IHJlbGVhc2VkIGVudHJpZXMgdy8gdGFy
Z2V0IG51bWJlcj8gc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+IC0tLQo+Pj4+ICAgICBm
cy9mMmZzL2V4dGVudF9jYWNoZS5jIHwgMTUgKysrKysrKysrKy0tLS0tCj4+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5j
Cj4+Pj4gaW5kZXggMDE5YzFmN2I3ZmE1Li4zOGM3MWMxYzRmYjcgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMK
Pj4+PiBAQCAtMzc5LDExICszNzksMTIgQEAgc3RhdGljIHN0cnVjdCBleHRlbnRfdHJlZSAqX19n
cmFiX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4gICAgIH0KPj4+Pgo+Pj4+
ICAgICBzdGF0aWMgdW5zaWduZWQgaW50IF9fZnJlZV9leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBleHRlbnRfdHJlZSAqZXQpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0LCB1bnNpZ25lZCBpbnQgbnJfc2hyaW5rKQo+Pj4+
ICAgICB7Cj4+Pj4gICAgICAgICAgIHN0cnVjdCByYl9ub2RlICpub2RlLCAqbmV4dDsKPj4+PiAg
ICAgICAgICAgc3RydWN0IGV4dGVudF9ub2RlICplbjsKPj4+PiAgICAgICAgICAgdW5zaWduZWQg
aW50IGNvdW50ID0gYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCk7Cj4+Pj4gKyAgICAgICB1bnNp
Z25lZCBpbnQgaSA9IDA7Cj4+Pj4KPj4+PiAgICAgICAgICAgbm9kZSA9IHJiX2ZpcnN0X2NhY2hl
ZCgmZXQtPnJvb3QpOwo+Pj4+ICAgICAgICAgICB3aGlsZSAobm9kZSkgewo+Pj4+IEBAIC0zOTEs
NiArMzkyLDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+ICAgICAgICAgICAgICAgICAgIGVuID0gcmJfZW50cnko
bm9kZSwgc3RydWN0IGV4dGVudF9ub2RlLCByYl9ub2RlKTsKPj4+PiAgICAgICAgICAgICAgICAg
ICBfX3JlbGVhc2VfZXh0ZW50X25vZGUoc2JpLCBldCwgZW4pOwo+Pj4+ICAgICAgICAgICAgICAg
ICAgIG5vZGUgPSBuZXh0Owo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgICAgaWYgKG5yX3Nocmlu
ayAmJiArK2kgPj0gbnJfc2hyaW5rKQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+Pj4+ICAgICAgICAgICB9Cj4+Pj4KPj4+PiAgICAgICAgICAgcmV0dXJuIGNvdW50IC0gYXRv
bWljX3JlYWQoJmV0LT5ub2RlX2NudCk7Cj4+Pj4gQEAgLTc2MSw3ICs3NjUsNyBAQCBzdGF0aWMg
dm9pZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+
ICAgICAgICAgICB9Cj4+Pj4KPj4+PiAgICAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9OT19FWFRFTlQpKQo+Pj4+IC0gICAgICAgICAgICAgICBfX2ZyZWVfZXh0ZW50X3Ry
ZWUoc2JpLCBldCk7Cj4+Pj4gKyAgICAgICAgICAgICAgIF9fZnJlZV9leHRlbnRfdHJlZShzYmks
IGV0LCAwKTsKPj4+Pgo+Pj4+ICAgICAgICAgICBpZiAoZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+
Pj4+ICAgICAgICAgICAgICAgICAgIGV0LT5sYXJnZXN0X3VwZGF0ZWQgPSBmYWxzZTsKPj4+PiBA
QCAtOTQyLDcgKzk0Niw4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19zaHJpbmtfZXh0ZW50X3Ry
ZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgbnJfc2hyaW5rCj4+Pj4gICAgICAgICAg
IGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShldCwgbmV4dCwgJmV0aS0+em9tYmllX2xpc3QsIGxp
c3QpIHsKPj4+PiAgICAgICAgICAgICAgICAgICBpZiAoYXRvbWljX3JlYWQoJmV0LT5ub2RlX2Nu
dCkpIHsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX2xvY2soJmV0LT5sb2Nr
KTsKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBub2RlX2NudCArPSBfX2ZyZWVfZXh0ZW50
X3RyZWUoc2JpLCBldCk7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbm9kZV9jbnQgKz0g
X19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5yX3NocmluayAtIG5vZGVfY250IC0gdHJlZV9jbnQpOwo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4+Pj4gICAg
ICAgICAgICAgICAgICAgfQo+Pj4+ICAgICAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwg
YXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpOwo+Pj4+IEBAIC0xMDk1LDcgKzExMDAsNyBAQCBz
dGF0aWMgdW5zaWduZWQgaW50IF9fZGVzdHJveV9leHRlbnRfbm9kZShzdHJ1Y3QgaW5vZGUgKmlu
b2RlLAo+Pj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4+Cj4+Pj4gICAgICAgICAg
IHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPj4+PiAtICAgICAgIG5vZGVfY250ID0gX19mcmVlX2V4
dGVudF90cmVlKHNiaSwgZXQpOwo+Pj4+ICsgICAgICAgbm9kZV9jbnQgPSBfX2ZyZWVfZXh0ZW50
X3RyZWUoc2JpLCBldCwgMCk7Cj4+Pj4gICAgICAgICAgIHdyaXRlX3VubG9jaygmZXQtPmxvY2sp
Owo+Pj4+Cj4+Pj4gICAgICAgICAgIHJldHVybiBub2RlX2NudDsKPj4+PiBAQCAtMTExNyw3ICsx
MTIyLDcgQEAgc3RhdGljIHZvaWQgX19kcm9wX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkKPj4+PiAgICAgICAgICAgICAgICAgICByZXR1cm47
Cj4+Pj4KPj4+PiAgICAgICAgICAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+Pj4+IC0gICAgICAg
X19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+Pj4+ICsgICAgICAgX19mcmVlX2V4dGVudF90
cmVlKHNiaSwgZXQsIDApOwo+Pj4+ICAgICAgICAgICBpZiAodHlwZSA9PSBFWF9SRUFEKSB7Cj4+
Pj4gICAgICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7
Cj4+Pj4gICAgICAgICAgICAgICAgICAgaWYgKGV0LT5sYXJnZXN0Lmxlbikgewo+Pj4+IC0tCj4+
Pj4gMi40MC4xCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gICAgICAgICAgICAgICAgIGYy
ZnNfYmFsYW5jZV9mc19iZyhzYmksIGZhbHNlKTsKPj4+Pj4KPj4+Pj4gICAgICAgICBpZiAoIWYy
ZnNfaXNfY2hlY2twb2ludF9yZWFkeShzYmkpKQo+Pj4+Cj4+Pgo+Pj4KPj4+IEhpIGNoYW8sCj4+
Pgo+Pj4gV2UgaGF2ZSBhbHNvIGNvbnNpZGVyZWQgdGhpcyBhcHByb2FjaCwgYnV0IHRoZSBwcm9i
bGVtIHN0aWxsIG9jY3Vycwo+Pj4gYWZ0ZXIgcmV0ZXN0aW5nLgo+Pj4gMS4gVGhlIHByb2JsZW0g
c3RpbGwgb2NjdXJzIGluIHRoZSBmb2xsb3dpbmcgY2FsbCBvZiB0aGUgdW5tb3VudCBkYXRhIHBy
b2Nlc3MuCj4+PiBmMmZzX3B1dF9zdXBlciAtPiBmMmZzX2xlYXZlX3Nocmlua2VyCj4+Cj4+IFll
cywgSSBndWVzcyB3ZSBuZWVkIHRvIGZpeCB0aGlzIHBhdGggYXMgd2VsbCwgaG93ZXZlciwgeW91
ciBwYXRjaCBkaWRuJ3QKPj4gY292ZXIgdGhpcyBwYXRoIGFzIHdlbGwsIGFtIEkgbWlzc2luZyBz
b21ldGhpbmc/Cj4gRGVhciBDaGFvLAo+IFRoaXMgcGF0Y2ggdmVyc2lvbiBhaW0gIHRvIHNocmlu
ayBleHRlbnQgY2FjaGUgYXMgZWFybHkgYXMgcG9zc2libGUgb24KPiB0aGUgICJhbGwgd3JpdGUg
cGF0aCIKPiBieSAid3JpdGUgYWN0aW9uIiAtPiBmMmZzX2JhbGFuY2VfZnMgLT4gZjJmc19iYWxh
bmNlX2ZzX2JnCgpaaGlndW8sIHRoYW5rcyBmb3IgZXhwbGFpbmluZyBhZ2Fpbi4KCkhvd2V2ZXIs
IEkgZG91YnQgY292ZXJpbmcgYWxsIHdyaXRlIHBhdGhzIGlzIG5vdCBlbm91Z2gsIGJlY2F1c2Ug
ZXh0ZW50Cm5vZGUgY2FuIGluY3JlYXNlIHdoZW4gZjJmc19wcmVjYWNoZV9leHRlbnRzKCkgd2Fz
IGNhbGxlZCBmcm9tIHBhdGhzCmluY2x1ZGluZyBmYWR2aXNlL2ZpZW1hcC9zd2Fwb24vaW9jX3By
ZWNhY2hlX2V4dGVudHMsIGFuZCB0aGVyZSBtYXkgYmUKbm8gd3JpdGViYWNrLCBzbyB3ZSBtYXkg
Z2V0IG5vIGNoYW5jZSB0byBjYWxsIGludG8gZjJmc19iYWxhbmNlX2ZzX2JnKCksCmUuZy4gdGhl
cmUgaXMgbm8gZGF0YSB1cGRhdGUgaW4gbW91bnRwb2ludCwgb3IgbW91bnRwb2ludCBpcyByZWFk
b25seS4KCj4gQXMgdGhlIGNvbW1lbnQgLCB0aGUgImV4Y2Vzc19jYWNoZWRfbmF0cyIgaXMgZGlm
ZmljdWx0IHRvIGFjaGlldmUgaW4KPiB0aGlzIHNjZW5hcmlvLCBhbmQKCkFub3RoZXIgY29uY2Vy
biBpcywgaW4gaGlnaC1lbmQgcHJvZHVjdHMgdy8gbW9yZSBtZW1vcnksIGl0IG1heSBoYXMgbGVz
cwpjaGFuY2UgdG8gaGl0IG5ld2x5IGFkZGVkIGNvbmRpdGlvbiBpbiBmMmZzX2JhbGFuY2VfZnMo
KT8gbm90IHN1cmUgdGhvdWdoLgoKKyAgICAgaWYgKG5lZWQgJiYgKGV4Y2Vzc19jYWNoZWRfbmF0
cyhzYmkpIHx8CisgICAgICAgICAgICAgICAgICAgICAhZjJmc19hdmFpbGFibGVfZnJlZV9tZW1v
cnkoc2JpLCBSRUFEX0VYVEVOVF9DQUNIRSkgfHwKKyAgICAgICAgICAgICAgICAgICAgICFmMmZz
X2F2YWlsYWJsZV9mcmVlX21lbW9yeShzYmksIEFHRV9FWFRFTlRfQ0FDSEUpKSkKCkkgbWVhbiB3
aWxsIGYyZnNfYXZhaWxhYmxlX2ZyZWVfbWVtb3J5KHNiaSwge1JFQUQsQUdFfV9FWFRFTlRfQ0FD
SEUpCnJldHVybiB0cnVlIGlmIGF2YWlsYWJsZSBtZW1vcnkgaXMgc3VmZmljaWVudD8KClRoYW5r
cywKCj4gdHJpZ2dlciB0aGUgaXNzdWUgaW4gcGF0aCBmMmZzX3dyaXRlX25vZGVfcGFnZXMtPmYy
ZnNfYmFsYW5jZV9mc19iZyhpcwo+IGNhbGxlZCBkaXJlY3RseSBoZXJlKS4KPiBBdCB0aGF0IHRp
bWUsIHRoZXJlIHdlcmUgYWxyZWFkeSBhIGxvdCBvZiBleHRlbnQgbm9kZSBjbnQuCj4gVGhhbmtz
IQo+Pgo+Pj4gMi4gV3JpdGluZyBiYWNrIHRoZSBpbm9kZSBpbiB0aGUgbm9ybWFsIHdyaXRlLWJh
Y2sgcHJvY2VzcyB3aWxsCj4+PiByZWxlYXNlIHRoZSBleHRlbnQgY2FjaGUsIGFuZCB0aGUgcHJv
YmxlbSBzdGlsbCBvY2N1cnMuIFRoZSBzdGFjayBpcwo+Pj4gYXMgZm9sbG93czoKPj4KPj4gRGl0
dG8sCj4+Cj4+IFRoYW5rcywKPj4KPj4+IFtIIDEwMzA5OC45NzQzNTZdIGMyIFs8ZmZmZmZmYzAw
OGFlZThhND5dIChyYl9lcmFzZSsweDIwNC8weDMzNCkKPj4+IFtIIDEwMzA5OC45NzQzODldIGMy
IFs8ZmZmZmZmYzAwODhmOGZkMD5dIChfX3JlbGVhc2VfZXh0ZW50X25vZGUrMHhjOC8weDE2OCkK
Pj4+IFtIIDEwMzA5OC45NzQ0MjVdIGMyIFs8ZmZmZmZmYzAwODhmYWQ3ND5dCj4+PiAoZjJmc191
cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UrMHg0YTAvMHg3MjQpCj4+PiBbSCAxMDMwOTguOTc0NDU5
XSBjMiBbPGZmZmZmZmMwMDg4ZmE4YzA+XSAoZjJmc191cGRhdGVfZXh0ZW50X2NhY2hlKzB4MTlj
LzB4MWIwKQo+Pj4gW0ggMTAzMDk4Ljk3NDQ5NV0gYzIgWzxmZmZmZmZjMDA4OGVkYzcwPl0gKGYy
ZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsweDc0LzB4ZjApCj4+PiBbSCAxMDMwOTguOTc0NTI1XSBj
MiBbPGZmZmZmZmMwMDg4Y2E4MzQ+XSAoZjJmc19kb193cml0ZV9kYXRhX3BhZ2UrMHgzZTQvMHg2
YzgpCj4+PiBbSCAxMDMwOTguOTc0NTUyXSBjMiBbPGZmZmZmZmMwMDg4Y2IxNTA+XQo+Pj4gKGYy
ZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDQ3OC8weGFiMCkKPj4+IFtIIDEwMzA5OC45NzQ1
NzRdIGMyIFs8ZmZmZmZmYzAwODhkMGJkMD5dIChmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4NDU0
LzB4YWFjKQo+Pj4gW0ggMTAzMDk4Ljk3NDU5Nl0gYzIgWzxmZmZmZmZjMDA4OGQwNjk4Pl0gKF9f
ZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4NDBjLzB4NGYwKQo+Pj4gW0ggMTAzMDk4Ljk3NDYxN10g
YzIgWzxmZmZmZmZjMDA4OGNjODYwPl0gKGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDMwLzB4NDAp
Cj4+PiBbSCAxMDMwOTguOTc0NjQ1XSBjMiBbPGZmZmZmZmMwMDg0YzBlMDA+XSAoZG9fd3JpdGVw
YWdlcysweDE4Yy8weDNlOCkKPj4+IFtIIDEwMzA5OC45NzQ2NzhdIGMyIFs8ZmZmZmZmYzAwODY1
MDNjYz5dIChfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUrMHg0OC8weDQ5OCkKPj4+IFtIIDEwMzA5
OC45NzQ3MjBdIGMyIFs8ZmZmZmZmYzAwODY1NjJjOD5dICh3cml0ZWJhY2tfc2JfaW5vZGVzKzB4
NDU0LzB4OWIwKQo+Pj4gW0ggMTAzMDk4Ljk3NDc1NF0gYzIgWzxmZmZmZmZjMDA4NjU1ZGU4Pl0g
KF9fd3JpdGViYWNrX2lub2Rlc193YisweDE5OC8weDIyNCkKPj4+IFtIIDEwMzA5OC45NzQ3ODhd
IGMyIFs8ZmZmZmZmYzAwODY1NmQwYz5dICh3Yl93cml0ZWJhY2srMHgxYzAvMHg2OTgpCj4+PiBb
SCAxMDMwOTguOTc0ODE5XSBjMiBbPGZmZmZmZmMwMDg2NTU2MTQ+XSAod2JfZG9fd3JpdGViYWNr
KzB4NDIwLzB4NTRjKQo+Pj4gW0ggMTAzMDk4Ljk3NDg1M10gYzIgWzxmZmZmZmZjMDA4NjU0ZjUw
Pl0gKHdiX3dvcmtmbisweGU0LzB4Mzg4KQo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
