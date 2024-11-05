Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBD9BC61C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 07:56:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8DUG-0001od-FC;
	Tue, 05 Nov 2024 06:56:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8DUE-0001oW-Up
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 06:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2GEdrmyjwS9ZsFz5JXViw7wH7+oBt0P/vGffGcf7Oc=; b=QOs5jHEh/xZwo9T3YWyG+Ws6Es
 hS28L8gVvfGgpgEphKpHUVq9d6JL0QxGTEOokOXkvpEctUZLeKtixC6Z198ujWiP4zeSg126f8Gps
 M7J9AeSqMaP9zqZ7XwRlQOV9NT0GobwxkYKkv2olqL0i1SxWFoFL5rC2U8IlAykWFPhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U2GEdrmyjwS9ZsFz5JXViw7wH7+oBt0P/vGffGcf7Oc=; b=ScqsZsoijsJuYQMIRbaytUJLxS
 CV8KxmPam/9rZgZE23I+Mb+bJl5lQXF08mdinYsXgv8D9SS8WQePPuMZqYWFFtZOP+JFx0HBKRyMu
 tWbKs2wfYHUJOJku3rLnJScpZLpMT30lSij9HAQd73IBJmOfeGwH3h1ceZJ+7lC+stLk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8DUE-0008M4-3T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 06:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2375AA419AE;
 Tue,  5 Nov 2024 06:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D61C4CECF;
 Tue,  5 Nov 2024 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730789770;
 bh=Fo2fibcWfMKMCUazhkZYgaohA7hDQkPM3279WGFliLc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kM9Lk7Dhj3ZoWuqoKi1anVPXa2e0He9hAkpFvwOh69eU1ErvxLGilSSedBlKgGgIw
 2CrjdyJK/24JV/atfF3CHvYOOBj5st1/rEo7bkFdXadBok1uUSLzDhTWVaHBgl8/w/
 tcQR1jlT9pKlu/yKGaFguZrfmYREeWY2S9DC6q0HcXnSswh0R9hV2S91tq2HRbTBe/
 25eW2EWDtOLyhl3zmWVJ+HY76SJnLk93V/g8lS8m4xss0ZJaZ9sqoZoiiDI0csmPxD
 gI9Xzqx5rUEWAuM7zq5HJ3fdgb26A8A9bdCSBQXfLYRy4ltAKKRQWg+1+66qcFAX9u
 aydpS2I3b/bLw==
Message-ID: <fe8f262c-1b18-47e8-8133-06663835b551@kernel.org>
Date: Tue, 5 Nov 2024 14:56:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <888aaf87-1363-4c1f-bd95-d119c72d7b30@kernel.org>
 <CAHJ8P3J+8xEwNL3S6JoR=E0_RczgwvHAGp8jZs5GZESza6n9LQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3J+8xEwNL3S6JoR=E0_RczgwvHAGp8jZs5GZESza6n9LQ@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/5 12:02, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月5日周二 11:15写道： >> >> On 2024/11/4 9:56, Zhiguo
   Niu wrote: >>> If user give a file size as "length" parameter [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8DUE-0008M4-3T
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
 for fiemap
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS81IDEyOjAyLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAxMToxNeWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IElmIHVzZXIgZ2l2ZSBhIGZp
bGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+Pj4gb3BlcmF0aW9ucywg
YnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+Pj4gaXQgd2lsbCBz
aG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZpbGUKPj4+IGlz
IGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5nIHJlc3VsdHM6Cj4+Pgo+
Pj4gICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkKPj4+IEZpZW1h
cDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+Pj4gICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAg
cGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+PiAwICAgICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAyMGJhYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4+
PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAx
MDAwIDAwMDAxMDAxCj4+Pgo+Pj4gYWZ0ZXIgdGhpcyBwYXRjaDoKPj4+IC4vZjJmc19pbyBmaWVt
YXAgMCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0g
MTkwMzQKPj4+ICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGgg
ICAgICAgICAgIGZsYWdzCj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAw
MCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4+Cj4+IEhpIFpoaWd1bywKPj4KPj4gQW55IHRl
c3RjYXNlIHRvIHJlcHJvZHVjZSB0aGlzIGJ1Zz8gdy9vIHRoaXMgcGF0Y2gsIGl0IGxvb2tzIG91
dHB1dAo+PiBmcm9tIGZpZW1hcCBsb29rcyBmaW5lPwo+Pgo+PiBmMmZzX2lvIGZpZW1hcCAwIDE5
MDM0IGZpbGUKPj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4+ICAgICAgICAgIGxv
Z2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+
IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDA0NDAxMDAwIDAwMDAwMDAwMDAwMDUw
MDAgMDAwMDEwMDEKPj4KPiBIaSBDaGFvLAo+IFNvcnJ5IEkgZGlkbid0IHdyaXRlIGNsZWFybHkg
ZW5vdWdoIGFib3V0IHRoZSB0ZXN0IGNhc2UsIGFuZCBpIHB1dCB0aGUKPiBub3RlIGJlbG93IHRo
ZSAiIlNpbmdlZC1vZmYiIHRhZy4KPiBsZXQgbWUgZGVzY3JpYmUgaXQgYWdhaW7vvIwgZjJmc19p
byBmaWVtYXAgaGFzIGJlZW4gbW9kaWZpZWQgYnkgbWUgZm9yCj4gdGVzdGluZyBpbiBteSBsb2Nh
bCwgYW5kICB0aGUgbGVuZ3RoIHBhcmFtZXRlcgo+IGlzIHRoZSByZWFsIGZpbGUgc2l6ZSBvZiB0
aGUgZmlsZSwgbm90IHRoZSBibG9jayBudW1lci4gYmVjYXVzZSB1c2VyCj4gYWxzbyBwYXNzIHRo
ZSByZWFsIGZpbGUgc2l6ZSB0byBmaWVtYXAgaW9jdGwuCj4gc28gd2l0aCB0aGUgbmV3IGYyZnNf
aW8gZmllbWFwLCBhIGNvbnRpZ3VvdXMgZmlsZSBvbiBkaXNrIG1heSBiZSBzaG93bgo+IDIgc2Vn
bWVudHMgaWYgdGhlIGxlbmd0aCBpcyBub3QgYmxvY2sgc2l6ZSBhbGluZ2VkLgo+IHN1Y2ggYXM6
Cj4gCj4gdW1zOTYzMl8xaDEwOi9kYXRhICMgbHMgLWwgeWxvZy9hcC9hbmFseXplci5weQo+IC1y
dy1ydy1ydy0gMSByb290IHN5c3RlbSAxOTAwNiAyMDA4LTAxLTAxIDAwOjAwIHlsb2cvYXAvYW5h
bHl6ZXIucHkKPiB1bXM5NjMyXzFoMTA6L2RhdGEgIyAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMDYg
eWxvZy9hcC9hbmFseXplci5weQo+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAwNgo+ICAg
ICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAg
IGZsYWdzCj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAw
MDAwMDAwNDAwMCAwMDAwMTAwMAo+IDEgICAgICAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMDAwMDIw
YmFlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEwMDEKPiAKPiBidXQgaWYgd2UgcGFzcyBhIGxl
bmd0aCB0aGF0IGlzIGJsb2NrIHNpemUgYWxpbmdlZCwgaXQgd2lsbCBzaG93IG9uZQo+IHdob2xl
IHNlZ21lbnQgaW4gZmllbWFwIGxvZy4KPiB1bXM5NjMyXzFoMTA6L2RhdGEgIyAuL2YyZnNfaW8g
ZmllbWFwIDAgMjA0ODAgeWxvZy9hcC9hbmFseXplci5weQo+IEZpZW1hcDogb2Zmc2V0ID0gMCBs
ZW4gPSAyMDQ4MAo+ICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBs
ZW5ndGggICAgICAgICAgIGZsYWdzCj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MjBiYWEwMDAgMDAwMDAwMDAwMDAwNTAwMCAwMDAwMTAwMQo+IFRoYW5rcy4KCk9oLCBJIGNhbiBy
ZXByb2R1Y2UgaXQgdy8geGZzX2lvLCB0aGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uCgp4ZnNf
aW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTkwMDYiCmZpbGU6CiAgRVhUOiBGSUxFLU9GRlNFVCAg
ICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKICAgIDA6IFswLi4zMV06ICAgICAgICAg
MTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKICAgIDE6IFszMi4uMzldOiAgICAgICAgMTM5
MzA0Li4xMzkzMTEgICAgICAgOCAweDEwMDEKeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDIw
NDgwIgpmaWxlOgogIEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFM
IEZMQUdTCiAgICAwOiBbMC4uMzldOiAgICAgICAgIDEzOTI3Mi4uMTM5MzExICAgICAgNDAgMHgx
MDAxCgpUaGFua3MsCgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3Vv
IE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4gLS0tCj4+PiBWMjogY29ycmVjdCBjb21t
aXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+PiBmMmZzX2lvIGhhcyBiZWVu
IG1vZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMKPj4+IHJlYWwg
ZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZGF0YS5j
IHwgNCArKy0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4+PiBpbmRleCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTE5NjYsOCArMTk2Niw4IEBA
IGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVu
dF9pbmZvICpmaWVpbmZvLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+
ICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAgaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0g
MCkKPj4+IC0gICAgICAgICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+PiAr
ICAgICBpZiAobGVuICYgKGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpIC0gMSkpCj4+PiArICAgICAg
ICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+Pj4K
Pj4+ICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+PiAg
ICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
