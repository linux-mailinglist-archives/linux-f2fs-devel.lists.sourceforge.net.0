Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA499D20FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 08:51:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDJ0h-0006lV-AR;
	Tue, 19 Nov 2024 07:50:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDJ0c-0006lL-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 07:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6YnEgXTnNa/BrjXujb8rFmJYy8Kf0Ugxg5moYnGhfI=; b=lDle0T+AT4cpsh1+OrwCyV6n1L
 9skXpxC1G6/nTw2uGhAVvzV5RYjC0X0GcLv+7yzNG8ms0/T49fhXZYS7yVPUioirfZhzLXF6l8uKu
 h3W8cmEssxEqTZkXhMO1D0sSKVl3/mhJmK60s5Tkthp2ZpsDfbE/nV7XDnYgrRUqFBwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6YnEgXTnNa/BrjXujb8rFmJYy8Kf0Ugxg5moYnGhfI=; b=Vq2vjmdCyRclrAnGVbTspdJTVS
 P2HDecyH5POqv5tA3JrnbDJ9SR81Iawiou/MC2RRqZNRaBbDgMCUAa/99DIeOrWZX7qPmFV0OWBrN
 wuFv0VoYyK3exL+/QnUbY8z1wxCxqSEETsi3SVXo8evTjBYOwXnUMwyHDRclC2P0vHOA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDJ0c-00082k-DB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 07:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0ABDF5C46B9;
 Tue, 19 Nov 2024 07:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3365C4CECF;
 Tue, 19 Nov 2024 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732002639;
 bh=gbF36eMx9sfuMRVW+aFk+4froAkv7fnorpos7XgT+ds=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vLLw8dhY+Vk58xmDLpY9ZI3iIdLqh8G26R4HqkBHQLu2etn15x2J/+XaKYJToEjSD
 9NC6rQObOopwcSbPlxAnSWGPZMkUNA+90ij9ryXP23ERkL/H/dy0sNTL8YW5TFUEI/
 ZB4l8fW6IlSMKV+n8NbPjqSFaPfuPY5YerUlUpw+P4jYk4XgITl9XsKucgEfFnGFBr
 ool+wGiDm+Hx5qlMLJIe8YGceXAfIwImyYrsTcpi/RKJlr7kt/ocOyDHq+Lj+1+egZ
 ZjK8yuvZQIRGnNqmopKTCAvoPhk+APSwPeDzfRehCdq7y/D2/Hct+JjPNUDQ7Gk7cm
 MK5D2D2tqh16A==
Message-ID: <5b0c17da-f1e1-490d-a560-3312bc8c3247@kernel.org>
Date: Tue, 19 Nov 2024 15:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiuhong Wang <xiuhong.wang.cn@gmail.com>
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
 <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
 <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/19 14:46, Xiuhong Wang wrote: > Chao Yu <chao@kernel.org>
    于2024年11月19日周二 14:05写道： >> >> On 2024/11/12 19:06, Xiuhong
    Wang wrote: >>> We encountered a system hang problem b [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDJ0c-00082k-DB
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
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS8xOSAxNDo0NiwgWGl1aG9uZyBXYW5nIHdyb3RlOgo+IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyIMTnml6XlkajkuowgMTQ6MDXlhpnpgZPvvJoKPj4K
Pj4gT24gMjAyNC8xMS8xMiAxOTowNiwgWGl1aG9uZyBXYW5nIHdyb3RlOgo+Pj4gV2UgZW5jb3Vu
dGVyZWQgYSBzeXN0ZW0gaGFuZyBwcm9ibGVtIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcKPj4+IGV4
cGVyaW1lbnQ6Cj4+PiBUaGVyZSBhcmUgMTcgcHJvY2Vzc2VzLCA4IG9mIHdoaWNoIGRvIDRrIGRh
dGEgcmVhZCwgd3JpdGUgYW5kCj4+PiBjb21wYXJlIHRlc3RzLCBhbmQgOCBkbyA2NGsgcmVhZCwg
d3JpdGUgYW5kIGNvbXBhcmUgdGVzdHMuIEVhY2gKPj4+IHRocmVhZCB3cml0ZXMgYSAyNTZNIGZp
bGUsIGFuZCBhbm90aGVyIHRocmVhZCB3cml0ZXMgYSBsYXJnZSBmaWxlCj4+PiB0byA4MCUgb2Yg
dGhlIGRpc2ssIGFuZCB0aGVuIGtlZXBzIGRvaW5nIHJlYWQgb3BlcmF0aW9ucywgYWxsIG9mCj4+
PiB3aGljaCBhcmUgZGlyZWN0IG9wZXJhdGlvbnMuIFRoaXMgd2lsbCBjYXVzZSB0aGUgbGFyZ2Ug
ZmlsZSB0byBiZQo+Pj4gZmlsbGVkIHRvIDgwJSBvZiB0aGUgZGlzayB0byBiZSBzZXZlcmVseSBm
cmFnbWVudGVkLiBPbiBhIDUxMkdCCj4+PiBkZXZpY2UsIHRoaXMgbGFyZ2UgZmlsZSBtYXkgZ2Vu
ZXJhdGUgYSBodWdlIHpvbWJpZSBleHRlbnQgdHJlZS4KPj4+Cj4+PiBXaGVuIHN5c3RlbSBzaHV0
dGluZyBkb3duLCB0aGUgaW5pdCBwcm9jZXNzIG5lZWRzIHRvIHdhaXQgZm9yIHRoZQo+Pj4gd3Jp
dGViYWNrIHByb2Nlc3MsIGFuZCB0aGUgd3JpdGViYWNrIHByb2Nlc3MgbWF5IGVuY291bnRlciB0
aGUKPj4+IHNpdHVhdGlvbiB3aGVyZSB0aGUgUkVBRF9FWFRFTlRfQ0FDSEUgc3BhY2UgaXMgaW5z
dWZmaWNpZW50IGFuZAo+Pj4gbmVlZHMgdG8gZnJlZSB0aGUgem9tYmllIGV4dGVudCB0cmVlLiBU
aGUgZXh0ZW50IHRyZWUgaGFzIGEgbGFyZ2UKPj4+IG51bWJlciBvZiBleHRlbnQgbm9kZXMsIGl0
IHdpbGwgYSBsb25nIGZyZWUgdGltZSB0byBmcmVlLCB3aGljaAo+Pj4gdHJpZ2dlcnMgc3lzdGVt
IGhhbmcuCj4+ICAgPiA+IFRoZSBzdGFjayB3aGVuIHRoZSBwcm9ibGVtIG9jY3VycyBpcyBhcyBm
b2xsb3dzOgo+Pj4gY3Jhc2hfYXJtNjQ+IGJ0IDEKPj4+IFBJRDogMSAgICAgICAgVEFTSzogZmZm
ZmZmODA4MDFhOTIwMCAgQ1BVOiAxICAgIENPTU1BTkQ6ICJpbml0Igo+Pj4gICAgIzAgW2ZmZmZm
ZmMwMDgwNmI5YTBdIF9fc3dpdGNoX3RvIGF0IGZmZmZmZmMwMDgxMDcxMWMKPj4+ICAgICMxIFtm
ZmZmZmZjMDA4MDZiYTAwXSBfX3NjaGVkdWxlIGF0IGZmZmZmZmMwMDk3YzFjNGMKPj4+ICAgICMy
IFtmZmZmZmZjMDA4MDZiYTYwXSBzY2hlZHVsZSBhdCBmZmZmZmZjMDA5N2MyMzA4Cj4+PiAgICAj
MyBbZmZmZmZmYzAwODA2YmFiMF0gd2Jfd2FpdF9mb3JfY29tcGxldGlvbiBhdCBmZmZmZmZjMDA4
NjMyMGQ0Cj4+PiAgICAjNCBbZmZmZmZmYzAwODA2YmIyMF0gd3JpdGViYWNrX2lub2Rlc19zYiBh
dCBmZmZmZmZjMDA4NjM3MTljCj4+PiAgICAjNSBbZmZmZmZmYzAwODA2YmJhMF0gc3luY19maWxl
c3lzdGVtIGF0IGZmZmZmZmMwMDg2M2M5OGMKPj4+ICAgICM2IFtmZmZmZmZjMDA4MDZiYmMwXSBm
MmZzX3F1b3RhX29mZl91bW91bnQgYXQgZmZmZmZmYzAwODg2ZmM2MAo+Pj4gICAgIzcgW2ZmZmZm
ZmMwMDgwNmJjMjBdIGYyZnNfcHV0X3N1cGVyIGF0IGZmZmZmZmMwMDg4NzE1YjQKPj4+ICAgICM4
IFtmZmZmZmZjMDA4MDZiYzYwXSBnZW5lcmljX3NodXRkb3duX3N1cGVyIGF0IGZmZmZmZmMwMDg1
Y2Q2MWMKPj4+ICAgICM5IFtmZmZmZmZjMDA4MDZiY2QwXSBraWxsX2YyZnNfc3VwZXIgYXQgZmZm
ZmZmYzAwODg2YjNkYwo+Pj4KPj4+IGNyYXNoX2FybTY0PiBidCAxNDk5Nwo+Pj4gUElEOiAxNDk5
NyAgICBUQVNLOiBmZmZmZmY4MTE5ZDgyNDAwICBDUFU6IDMgICAgQ09NTUFORDogImt3b3JrZXIv
dTE2OjAiCj4+PiAgICAjMCBbZmZmZmZmYzAxOWY4Yjc2MF0gX19kZXRhY2hfZXh0ZW50X25vZGUg
YXQgZmZmZmZmYzAwODhkNWE1OAo+Pj4gICAgIzEgW2ZmZmZmZmMwMTlmOGI3OTBdIF9fcmVsZWFz
ZV9leHRlbnRfbm9kZSBhdCBmZmZmZmZjMDA4OGQ1OTcwCj4+PiAgICAjMiBbZmZmZmZmYzAxOWY4
YjgxMF0gZjJmc19zaHJpbmtfZXh0ZW50X3RyZWUgYXQgZmZmZmZmYzAwODhkNWM3Ywo+Pj4gICAg
IzMgW2ZmZmZmZmMwMTlmOGI4YTBdIGYyZnNfYmFsYW5jZV9mc19iZyBhdCBmZmZmZmZjMDA4OGMx
MDljCj4+PiAgICAjNCBbZmZmZmZmYzAxOWY4YjkxMF0gZjJmc193cml0ZV9ub2RlX3BhZ2VzIGF0
IGZmZmZmZmMwMDg4YmQ0ZDgKPj4+ICAgICM1IFtmZmZmZmZjMDE5ZjhiOTkwXSBkb193cml0ZXBh
Z2VzIGF0IGZmZmZmZmMwMDg0YTBiNWMKPj4+ICAgICM2IFtmZmZmZmZjMDE5ZjhiOWYwXSBfX3dy
aXRlYmFja19zaW5nbGVfaW5vZGUgYXQgZmZmZmZmYzAwODYyZWUyOAo+Pj4gICAgIzcgW2ZmZmZm
ZmMwMTlmOGJiMzBdIHdyaXRlYmFja19zYl9pbm9kZXMgYXQgZmZmZmZmYzAwODYzNThjMAo+Pj4g
ICAgIzggW2ZmZmZmZmMwMTlmOGJjMTBdIHdiX3dyaXRlYmFjayBhdCBmZmZmZmZjMDA4NjM2MmRj
Cj4+PiAgICAjOSBbZmZmZmZmYzAxOWY4YmNjMF0gd2JfZG9fd3JpdGViYWNrIGF0IGZmZmZmZmMw
MDg2MzQ5MTAKPj4+Cj4+PiBQcm9jZXNzIDE0OTk3IHJhbiBmb3IgdG9vIGxvbmcgYW5kIGNhdXNl
ZCB0aGUgc3lzdGVtIGhhbmcuCj4+Pgo+Pj4gQXQgdGhpcyB0aW1lLCB0aGVyZSBhcmUgc3RpbGwg
MTA4NjkxMSBleHRlbnQgbm9kZXMgaW4gdGhpcyB6b21iaWUKPj4+IGV4dGVudCB0cmVlIHRoYXQg
bmVlZCB0byBiZSBjbGVhbmVkIHVwLgo+Pj4KPj4+IGNyYXNoX2FybTY0X3NwcmRfdjguMC4zKys+
IGV4dGVudF90cmVlLm5vZGVfY250IGZmZmZmZjgwODk2Y2M1MDAKPj4+ICAgICBub2RlX2NudCA9
IHsKPj4+ICAgICAgIGNvdW50ZXIgPSAxMDg2OTExCj4+PiAgICAgfSwKPj4+Cj4+PiBUaGUgcm9v
dCBjYXVzZSBvZiB0aGlzIHByb2JsZW0gaXMgdGhhdCB3aGVuIHRoZSBmMmZzX2JhbGFuY2VfZnMK
Pj4+IGZ1bmN0aW9uIGlzIGNhbGxlZCBpbiB0aGUgd3JpdGUgcHJvY2VzcywgaXQgd2lsbCBkZXRl
cm1pbmUKPj4+IHdoZXRoZXIgdG8gY2FsbCBmMmZzX2JhbGFuY2VfZnNfYmcsIGJ1dCBpdCBpcyBk
aWZmaWN1bHQgdG8KPj4+IG1lZXQgdGhlIGNvbmRpdGlvbiBvZiBleGNlc3NfY2FjaGVkX25hdHMu
IFdoZW4gdGhlCj4+PiBmMmZzX3Nocmlua19leHRlbnRfdHJlZSBmdW5jdGlvbiBpcyBjYWxsZWQg
dG8gZnJlZSBkdXJpbmcKPj4+IGYyZnNfd3JpdGVfbm9kZV9wYWdlcywgdGhlcmUgYXJlIHRvbyBt
YW55IGV4dGVudCBub2RlcyBvbiB0aGUKPj4+IGV4dGVudCB0cmVlLCB3aGljaCBjYXVzZXMgYSBs
b29wIGFuZCBjYXVzZXMgYSBzeXN0ZW0gaGFuZy4KPj4+Cj4+PiBUbyBzb2x2ZSB0aGlzIHByb2Js
ZW0sIHdoZW4gY2FsbGluZyBmMmZzX2JhbGFuY2VfZnMsIGNoZWNrIHdoZXRoZXIKPj4+IHRoZSBl
eHRlbnQgY2FjaGUgaXMgc3VmZmljaWVudC4gSWYgbm90LCByZWxlYXNlIHRoZSB6b21iaWUgZXh0
ZW50Cj4+PiB0cmVlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9u
Zy53YW5nQHVuaXNvYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8u
bml1QHVuaXNvYy5jb20+Cj4+PiAtLS0KPj4+IFRlc3QgdGhlIHByb2JsZW0gd2l0aCB0aGUgdGVt
cG9yYXJ5IHZlcnNpb25zOgo+Pj4gcGF0Y2ggZGlkIG5vdCByZXByb2R1Y2UgdGhlIHByb2JsZW0s
IHRoZSBwYXRjaCBpcyBhcyBmb2xsb3dzOgo+Pj4gQEAgLTQxNSw3ICs0MTUsNyBAQCB2b2lkIGYy
ZnNfYmFsYW5jZV9mcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgbmVlZCkKPj4+ICAg
ICAgICAgICAgICAgICAgIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsIFNUT1BfQ1Bf
UkVBU09OX0ZBVUxUX0lOSkVDVCk7Cj4+Pgo+Pj4gICAgICAgICAgIC8qIGJhbGFuY2VfZnNfYmcg
aXMgYWJsZSB0byBiZSBwZW5kaW5nICovCj4+PiAtICAgICAgIGlmIChuZWVkICYmIGV4Y2Vzc19j
YWNoZWRfbmF0cyhzYmkpKQo+Pj4gKyAgICAgICBpZiAobmVlZCkKPj4+ICAgICAgICAgICAgICAg
ICAgIGYyZnNfYmFsYW5jZV9mc19iZyhzYmksIGZhbHNlKTsKPj4+Cj4+PiAtLS0KPj4+ICAgIGZz
L2YyZnMvc2VnbWVudC5jIHwgNCArKystCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVu
dC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IDE3NjYyNTQyNzlkMi4uMzkwYmVjMTc3
NTY3IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+ICsrKyBiL2ZzL2YyZnMv
c2VnbWVudC5jCj4+PiBAQCAtNDE1LDcgKzQxNSw5IEBAIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+Pj4gICAgICAgICAgICAgICAgZjJm
c19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgU1RPUF9DUF9SRUFTT05fRkFVTFRfSU5KRUNU
KTsKPj4+Cj4+PiAgICAgICAgLyogYmFsYW5jZV9mc19iZyBpcyBhYmxlIHRvIGJlIHBlbmRpbmcg
Ki8KPj4+IC0gICAgIGlmIChuZWVkICYmIGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkpKQo+Pj4gKyAg
ICAgaWYgKG5lZWQgJiYgKGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkpIHx8Cj4+PiArICAgICAgICAg
ICAgICAgICAgICAgIWYyZnNfYXZhaWxhYmxlX2ZyZWVfbWVtb3J5KHNiaSwgUkVBRF9FWFRFTlRf
Q0FDSEUpIHx8Cj4+PiArICAgICAgICAgICAgICAgICAgICAgIWYyZnNfYXZhaWxhYmxlX2ZyZWVf
bWVtb3J5KHNiaSwgQUdFX0VYVEVOVF9DQUNIRSkpKQo+Pgo+PiBIaSwKPj4KPj4gSSBkb3VidCBp
ZiB0aGVyZSBpcyBubyBlbm91Z2ggbWVtb3J5LCB3ZSBtYXkgc3RpbGwgcnVuIGludG8KPj4gZjJm
c19zaHJpbmtfZXh0ZW50X3RyZWUoKSBhbmQgc3VmZmVyIHN1Y2ggbG9uZyB0aW1lIGRlbGF5Lgo+
Pgo+PiBTbywgY2FuIHdlIGp1c3QgbGV0IF9fZnJlZV9leHRlbnRfdHJlZSgpIGJyZWFrIHRoZSBs
b29wIG9uY2Ugd2UgaGF2ZQo+PiByZWxlYXNlZCBlbnRyaWVzIHcvIHRhcmdldCBudW1iZXI/IHNv
bWV0aGluZyBsaWtlIHRoaXM6Cj4+Cj4+IC0tLQo+PiAgICBmcy9mMmZzL2V4dGVudF9jYWNoZS5j
IHwgMTUgKysrKysrKysrKy0tLS0tCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2Fj
aGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gaW5kZXggMDE5YzFmN2I3ZmE1Li4zOGM3
MWMxYzRmYjcgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gKysrIGIv
ZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+PiBAQCAtMzc5LDExICszNzksMTIgQEAgc3RhdGljIHN0
cnVjdCBleHRlbnRfdHJlZSAqX19ncmFiX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUs
Cj4+ICAgIH0KPj4KPj4gICAgc3RhdGljIHVuc2lnbmVkIGludCBfX2ZyZWVfZXh0ZW50X3RyZWUo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGV4dGVudF90cmVlICpldCkKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0LCB1bnNpZ25lZCBpbnQgbnJfc2hy
aW5rKQo+PiAgICB7Cj4+ICAgICAgICAgIHN0cnVjdCByYl9ub2RlICpub2RlLCAqbmV4dDsKPj4g
ICAgICAgICAgc3RydWN0IGV4dGVudF9ub2RlICplbjsKPj4gICAgICAgICAgdW5zaWduZWQgaW50
IGNvdW50ID0gYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCk7Cj4+ICsgICAgICAgdW5zaWduZWQg
aW50IGkgPSAwOwo+Pgo+PiAgICAgICAgICBub2RlID0gcmJfZmlyc3RfY2FjaGVkKCZldC0+cm9v
dCk7Cj4+ICAgICAgICAgIHdoaWxlIChub2RlKSB7Cj4+IEBAIC0zOTEsNiArMzkyLDkgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+PiAgICAgICAgICAgICAgICAgIGVuID0gcmJfZW50cnkobm9kZSwgc3RydWN0IGV4dGVu
dF9ub2RlLCByYl9ub2RlKTsKPj4gICAgICAgICAgICAgICAgICBfX3JlbGVhc2VfZXh0ZW50X25v
ZGUoc2JpLCBldCwgZW4pOwo+PiAgICAgICAgICAgICAgICAgIG5vZGUgPSBuZXh0Owo+PiArCj4+
ICsgICAgICAgICAgICAgICBpZiAobnJfc2hyaW5rICYmICsraSA+PSBucl9zaHJpbmspCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAg
IHJldHVybiBjb3VudCAtIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpOwo+PiBAQCAtNzYxLDcg
Kzc2NSw3IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdCBp
bm9kZSAqaW5vZGUsCj4+ICAgICAgICAgIH0KPj4KPj4gICAgICAgICAgaWYgKGlzX2lub2RlX2Zs
YWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKQo+PiAtICAgICAgICAgICAgICAgX19mcmVlX2V4
dGVudF90cmVlKHNiaSwgZXQpOwo+PiArICAgICAgICAgICAgICAgX19mcmVlX2V4dGVudF90cmVl
KHNiaSwgZXQsIDApOwo+Pgo+PiAgICAgICAgICBpZiAoZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+
PiAgICAgICAgICAgICAgICAgIGV0LT5sYXJnZXN0X3VwZGF0ZWQgPSBmYWxzZTsKPj4gQEAgLTk0
Miw3ICs5NDYsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fc2hyaW5rX2V4dGVudF90cmVlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IG5yX3Nocmluawo+PiAgICAgICAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUoZXQsIG5leHQsICZldGktPnpvbWJpZV9saXN0LCBsaXN0KSB7Cj4+
ICAgICAgICAgICAgICAgICAgaWYgKGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKSB7Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG5vZGVfY250ICs9IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0KTsK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVudF90cmVl
KHNiaSwgZXQsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9z
aHJpbmsgLSBub2RlX2NudCAtIHRyZWVfY250KTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+PiAgICAgICAgICAgICAgICAgIH0KPj4gICAgICAg
ICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKTsK
Pj4gQEAgLTEwOTUsNyArMTEwMCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19kZXN0cm95X2V4
dGVudF9ub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4+Cj4+ICAgICAgICAgIHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPj4gLSAgICAgICBub2Rl
X2NudCA9IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0KTsKPj4gKyAgICAgICBub2RlX2NudCA9
IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LCAwKTsKPj4gICAgICAgICAgd3JpdGVfdW5sb2Nr
KCZldC0+bG9jayk7Cj4+Cj4+ICAgICAgICAgIHJldHVybiBub2RlX2NudDsKPj4gQEAgLTExMTcs
NyArMTEyMiw3IEBAIHN0YXRpYyB2b2lkIF9fZHJvcF9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBlbnVtIGV4dGVudF90eXBlIHR5cGUpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+Pgo+PiAgICAgICAgICB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4+IC0gICAgICAgX19mcmVl
X2V4dGVudF90cmVlKHNiaSwgZXQpOwo+PiArICAgICAgIF9fZnJlZV9leHRlbnRfdHJlZShzYmks
IGV0LCAwKTsKPj4gICAgICAgICAgaWYgKHR5cGUgPT0gRVhfUkVBRCkgewo+PiAgICAgICAgICAg
ICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRFTlQpOwo+PiAgICAgICAgICAg
ICAgICAgIGlmIChldC0+bGFyZ2VzdC5sZW4pIHsKPj4gLS0KPj4gMi40MC4xCj4+Cj4+IFRoYW5r
cywKPj4KPj4+ICAgICAgICAgICAgICAgIGYyZnNfYmFsYW5jZV9mc19iZyhzYmksIGZhbHNlKTsK
Pj4+Cj4+PiAgICAgICAgaWYgKCFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPj4KPiAK
PiAKPiBIaSBjaGFvLAo+IAo+IFdlIGhhdmUgYWxzbyBjb25zaWRlcmVkIHRoaXMgYXBwcm9hY2gs
IGJ1dCB0aGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMKPiBhZnRlciByZXRlc3RpbmcuCj4gMS4gVGhl
IHByb2JsZW0gc3RpbGwgb2NjdXJzIGluIHRoZSBmb2xsb3dpbmcgY2FsbCBvZiB0aGUgdW5tb3Vu
dCBkYXRhIHByb2Nlc3MuCj4gZjJmc19wdXRfc3VwZXIgLT4gZjJmc19sZWF2ZV9zaHJpbmtlcgoK
WWVzLCBJIGd1ZXNzIHdlIG5lZWQgdG8gZml4IHRoaXMgcGF0aCBhcyB3ZWxsLCBob3dldmVyLCB5
b3VyIHBhdGNoIGRpZG4ndApjb3ZlciB0aGlzIHBhdGggYXMgd2VsbCwgYW0gSSBtaXNzaW5nIHNv
bWV0aGluZz8KCj4gMi4gV3JpdGluZyBiYWNrIHRoZSBpbm9kZSBpbiB0aGUgbm9ybWFsIHdyaXRl
LWJhY2sgcHJvY2VzcyB3aWxsCj4gcmVsZWFzZSB0aGUgZXh0ZW50IGNhY2hlLCBhbmQgdGhlIHBy
b2JsZW0gc3RpbGwgb2NjdXJzLiBUaGUgc3RhY2sgaXMKPiBhcyBmb2xsb3dzOgoKRGl0dG8sCgpU
aGFua3MsCgo+IFtIIDEwMzA5OC45NzQzNTZdIGMyIFs8ZmZmZmZmYzAwOGFlZThhND5dIChyYl9l
cmFzZSsweDIwNC8weDMzNCkKPiBbSCAxMDMwOTguOTc0Mzg5XSBjMiBbPGZmZmZmZmMwMDg4Zjhm
ZDA+XSAoX19yZWxlYXNlX2V4dGVudF9ub2RlKzB4YzgvMHgxNjgpCj4gW0ggMTAzMDk4Ljk3NDQy
NV0gYzIgWzxmZmZmZmZjMDA4OGZhZDc0Pl0KPiAoZjJmc191cGRhdGVfZXh0ZW50X3RyZWVfcmFu
Z2UrMHg0YTAvMHg3MjQpCj4gW0ggMTAzMDk4Ljk3NDQ1OV0gYzIgWzxmZmZmZmZjMDA4OGZhOGMw
Pl0gKGYyZnNfdXBkYXRlX2V4dGVudF9jYWNoZSsweDE5Yy8weDFiMCkKPiBbSCAxMDMwOTguOTc0
NDk1XSBjMiBbPGZmZmZmZmMwMDg4ZWRjNzA+XSAoZjJmc19vdXRwbGFjZV93cml0ZV9kYXRhKzB4
NzQvMHhmMCkKPiBbSCAxMDMwOTguOTc0NTI1XSBjMiBbPGZmZmZmZmMwMDg4Y2E4MzQ+XSAoZjJm
c19kb193cml0ZV9kYXRhX3BhZ2UrMHgzZTQvMHg2YzgpCj4gW0ggMTAzMDk4Ljk3NDU1Ml0gYzIg
WzxmZmZmZmZjMDA4OGNiMTUwPl0KPiAoZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKzB4NDc4
LzB4YWIwKQo+IFtIIDEwMzA5OC45NzQ1NzRdIGMyIFs8ZmZmZmZmYzAwODhkMGJkMD5dIChmMmZz
X3dyaXRlX2NhY2hlX3BhZ2VzKzB4NDU0LzB4YWFjKQo+IFtIIDEwMzA5OC45NzQ1OTZdIGMyIFs8
ZmZmZmZmYzAwODhkMDY5OD5dIChfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcysweDQwYy8weDRmMCkK
PiBbSCAxMDMwOTguOTc0NjE3XSBjMiBbPGZmZmZmZmMwMDg4Y2M4NjA+XSAoZjJmc193cml0ZV9k
YXRhX3BhZ2VzKzB4MzAvMHg0MCkKPiBbSCAxMDMwOTguOTc0NjQ1XSBjMiBbPGZmZmZmZmMwMDg0
YzBlMDA+XSAoZG9fd3JpdGVwYWdlcysweDE4Yy8weDNlOCkKPiBbSCAxMDMwOTguOTc0Njc4XSBj
MiBbPGZmZmZmZmMwMDg2NTAzY2M+XSAoX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NDgvMHg0
OTgpCj4gW0ggMTAzMDk4Ljk3NDcyMF0gYzIgWzxmZmZmZmZjMDA4NjU2MmM4Pl0gKHdyaXRlYmFj
a19zYl9pbm9kZXMrMHg0NTQvMHg5YjApCj4gW0ggMTAzMDk4Ljk3NDc1NF0gYzIgWzxmZmZmZmZj
MDA4NjU1ZGU4Pl0gKF9fd3JpdGViYWNrX2lub2Rlc193YisweDE5OC8weDIyNCkKPiBbSCAxMDMw
OTguOTc0Nzg4XSBjMiBbPGZmZmZmZmMwMDg2NTZkMGM+XSAod2Jfd3JpdGViYWNrKzB4MWMwLzB4
Njk4KQo+IFtIIDEwMzA5OC45NzQ4MTldIGMyIFs8ZmZmZmZmYzAwODY1NTYxND5dICh3Yl9kb193
cml0ZWJhY2srMHg0MjAvMHg1NGMpCj4gW0ggMTAzMDk4Ljk3NDg1M10gYzIgWzxmZmZmZmZjMDA4
NjU0ZjUwPl0gKHdiX3dvcmtmbisweGU0LzB4Mzg4KQoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
