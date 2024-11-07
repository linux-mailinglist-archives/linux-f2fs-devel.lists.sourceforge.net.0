Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8269BFE62
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 07:18:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8vqf-0006Jc-Qu;
	Thu, 07 Nov 2024 06:18:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8vqe-0006JK-0n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 06:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2d8yz4TSvkfI6VQ73VP04bB46/JSx/kMyMhOtJLDxVQ=; b=VuP2kDeeEas5oMYijuPoCoK+p6
 kSfLXWWj8dKKgRJURMwdMGIBaLd2GbXfqmDCGgjGMVV3yf5DQ/mBQLhzViaZJGz4jqTvxBQqUuDqL
 wK2Sw6CO93UK78M/zYFxj83mD3sNSaG5gHwYinuVxW3YhLVzd7pXIOMZW4TAudI4cJPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2d8yz4TSvkfI6VQ73VP04bB46/JSx/kMyMhOtJLDxVQ=; b=E6UBgHRPHmhVdXWGjLP+iXi32y
 /FFgtAWpdjWyX0Ry8FT6qCZ1pkgXM/KUyxz8nMsE8Hmglho7xarunka8N1FjmGyZHMX7/OG8lKTQf
 28lUHyQNX31/Jz4tq8N/p8sdoPznojtDPPjeYORmRegrnBiH8ZAg+L7g9iX3LZcw73bw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8vqc-0007hI-Ra for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 06:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31145A42771;
 Thu,  7 Nov 2024 06:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA82C4CECC;
 Thu,  7 Nov 2024 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730960295;
 bh=xw2Qhh4cWFxAuA4ZpNse4z6ScdEMHofgPHy0wlSoBqA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NLJ1zS0JoRoz28yJQRPjGTzO5Irh0UTttyjwW//c360SmKmoINwqj0M1SduwPdP02
 pzTki2tcaG8WRHLea5ir7KhCMtNLyU29I0WtxLFFzRattpZb8xyyhqgdluvHoy4EEh
 uTAiqSChTPfD6Tl2srFZPOGQy+mgvAfi85707Lpas0quAZ728IFVgI1fhRaEiMXL+l
 hc0wQLOeDRDbhx+jroid52cKp0giRrdjRc3gDl+5v6ASd+DT315Vp7VbZVZQPELJVq
 ty1mFMX1XxsaiXtoihnshc0qarMP+2uUd/eQPrqjjAX5leijWbLhxnTLgaPA5tyHa1
 KBXAJlyPugj8Q==
Message-ID: <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
Date: Thu, 7 Nov 2024 14:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
 <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
 <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
 <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/6 16:41, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月6日周三 15:40写道： >> >> On 2024/11/6 14:08, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月6日 [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8vqc-0007hI-Ra
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

T24gMjAyNC8xMS82IDE2OjQxLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINuaXpeWRqOS4iSAxNTo0MOWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzYgMTQ6MDgsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6NDDlhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNiAxMDoyNiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDEwOjE25YaZ6YGT77ya
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xMS81IDE5OjAyLCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+
Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAx
ODozOeWGmemBk++8mgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMDI0LzExLzUgMTU6MjgsIFpoaWd1
byBOaXUgd3JvdGU6Cj4+Pj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTl
ubQxMeaciDXml6XlkajkuowgMTU6MDTlhpnpgZPvvJoKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9u
IDIwMjQvMTEvNCA5OjU2LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+Pj4+Pj4+PiBJZiB1c2VyIGdp
dmUgYSBmaWxlIHNpemUgYXMgImxlbmd0aCIgcGFyYW1ldGVyIGZvciBmaWVtYXAKPj4+Pj4+Pj4+
Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVk
LAo+Pj4+Pj4+Pj4+PiBpdCB3aWxsIHNob3cgMiBzZWdtZW50cyBmaWVtYXAgcmVzdWx0cyBldmVu
IHRoaXMgd2hvbGUgZmlsZQo+Pj4+Pj4+Pj4+PiBpcyBjb250aWd1b3VzIG9uIGRpc2ssIHN1Y2gg
YXMgdGhlIGZvbGxvd2luZyByZXN1bHRzOgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiAgICAgICAg
Li9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkKPj4+Pj4+Pj4+Pj4gRmll
bWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgbG9n
aWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+
Pj4+Pj4+Pj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAw
MDAwMDAwNDAwMCAwMDAwMTAwMAo+Pj4+Pj4+Pj4+PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAg
MDAwMDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4+Pj4+Pj4+Pj4+IC4vZjJmc19pbyBmaWVtYXAg
MCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+Pj4+Pj4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBs
ZW4gPSAxOTAzNAo+Pj4+Pj4+Pj4+PiAgICAgICAgICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNh
bCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+Pj4+Pj4+Pj4gMCAgICAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMzE1ZjMwMDAgMDAwMDAwMDAwMDAwNTAwMCAwMDAwMTAwMQo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1
QHVuaXNvYy5jb20+Cj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+PiBWMjogY29ycmVjdCBjb21t
aXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+Pj4+Pj4+Pj4+IGYyZnNfaW8g
aGFzIGJlZW4gbW9kaWZpZWQgZm9yIHRlc3RpbmcsIHRoZSBsZW5ndGggZm9yIGZpZW1hcCBpcwo+
Pj4+Pj4+Pj4+PiByZWFsIGZpbGUgc2l6ZSwgbm90IGJsb2NrIG51bWJlcgo+Pj4+Pj4+Pj4+PiAt
LS0KPj4+Pj4+Pj4+Pj4gICAgICAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKy0tCj4+Pj4+Pj4+Pj4+
ICAgICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYwo+Pj4+Pj4+Pj4+PiBpbmRleCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+
Pj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9k
YXRhLmMKPj4+Pj4+Pj4+Pj4gQEAgLTE5NjYsOCArMTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+
Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pj4+
Pj4gICAgICAgICAgICB9Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IC0gICAgIGlmIChieXRlc190
b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4+Pj4+Pj4+Pj4+IC0gICAgICAgICAgICAgbGVuID0g
Ymxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+Pj4+Pj4+ICsgICAgIGlmIChsZW4gJiAoYmxr
c190b19ieXRlcyhpbm9kZSwgMSkgLSAxKSkKPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICBsZW4g
PSByb3VuZF91cChsZW4sIGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpKTsKPj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+IEhvdyBkbyB5b3UgdGhpbmsgb2YgZ2V0dGluZyByaWQgb2YgYWJvdmUgYWxpZ25tZW50
IGZvciBsZW4/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gICAgICAgICAgICBz
dGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4+Pj4+ICAgICAg
ICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQW5kIHJvdW5kIHVwIGVuZCBwb3NpdGlvbiB3LzoKPj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgcm91bmRfdXAo
c3RhcnQgKyBsZW4gLSAxLCBGMkZTX0JMS1NJWkUpKTsKPj4+Pj4+Pj4+IEhpIENoYW8sCj4+Pj4+
Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+Pj4+
Pj4+Pj4gLS0tLS0tLS0tLS0tLQo+Pj4+Pj4+Pj4gaWYgKHN0YXJ0X2JsayA+IGxhc3RfYmxrKQo+
Pj4+Pj4+Pj4gICAgICAgICAgZ290byBvdXQ7Cj4+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tCj4+Pj4+
Pj4+PiBmb3IgZXhhbXBsZSwgYSBmaWxlIHdpdGggc2l6ZSAxOTAwNiwgYnV0IHRoZSBsZW5ndGgg
ZnJvbSB0aGUgdXNlciBpcyAxNjM4NC4KPj4+Pj4+Pj4+IGJlZm9yZSB0aGlzIG1vZGlmaWNhdGlv
biwgIGxhc3RfYmxrID0gIGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsKPj4+Pj4+Pj4+IGxl
biAtIDEpID0gKGlub2RlLCAxNjM4MykgPSAzCj4+Pj4+Pj4+PiBhZnRlciB0aGUgZmlyc3QgZjJm
c19tYXBfYmxvY2tzKCkuIHN0YXJ0X2JsayBjaGFuZ2UgdG8gYmUgNCwKPj4+Pj4+Pj4+IGFmdGVy
IHRoZSBzZWNvbmQgZjJmc19tYXBfYmxvY2tzKCksIGZpZW1hcF9maWxsX25leF9leHRlbiB3aWxs
IGJlCj4+Pj4+Pj4+PiBjYWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRlciBhbmQgdGhlbgo+Pj4+
Pj4+Pj4gd2lsbCBnb3RvIG91dCBiZWNhdXNlIHN0YXJ0X2JsayA+IGxhc3RfYmxrLCB0aGVuIGZp
ZW1hcCBmbG93IGZpbmlzaGVzLgo+Pj4+Pj4+Pj4gYnV0IGFmdGVyIHRoaXMgbW9kaWZpY2F0aW9u
LCBsYXN0X2JsayB3aWxsIGJlIDQKPj4+Pj4+Pj4+IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkg
dW50aWwgcmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkKPj4+Pj4+Pj4KPj4+Pj4+Pj4g
WWVzLCB5b3UncmUgcmlnaHQsIGhvd2V2ZXIsIHcvIHRoaXMgcGF0Y2gsIGl0IG1heSBjaGFuZ2Ug
bGFzdF9ibGssIGUuZy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4geGZzX2lvIGZpbGUgLWMgImZpZW1hcCAt
diAwIDE5MDA2IiB2cyB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDIgMTkwMDYiCj4+Pj4+Pj4+
IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTogMCwgNCBhbmQgMCwgNS4KPj4+Pj4+PiBI
aSBDaGFvLAo+Pj4+Pj4+IHllcywgYnV0IHcvbyB0aGlzIHBhdGNoICwgdGhlIG9yaWdpbmFsIGNv
ZGUgc3RpbGwgaGFzIHRoZSBzYW1lIHNpdHVhdGlvbj8/Cj4+Pj4+Pj4gZm9yIGV4YW1wbGUKPj4+
Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiIHZzIHhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4+Pj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwg
YmU6IDAsIDMgYW5kIDAsIDQuCj4+Pj4+Pgo+Pj4+Pj4gRm9yIHRoZSBjYXNlICJmaWVtYXAgLXYg
MiAxOTAwNiIsIG9mZnNldCBpcyAyLCBhbmQgbGVuZ3RoIGlzIDE5MDA2LCBzbyBsYXN0X29mZnNl
dAo+Pj4+Pj4gaXMgMTkwMDgsIGFuZCBsYXN0X2JsayBzaG91bGQgYmUgNCByYXRoZXIgdGhhbiA1
LCByaWdodD8KPj4+Pj4gaGkgQ2hhbywKPj4+Pj4gaXQgaXMgcmlnaHQgdy9vIG15IHBhdGNoLgo+
Pj4+Pj4KPj4+Pj4+IEFuZCBmb3IgeW91IGNhc2UsIGl0IGNhbGN1bGF0ZXMgbGFzdF9ibGsgY29y
cmVjdGx5Lgo+Pj4+PiBTbyB5b3Ugc3VnZ2VzdCB0aGF0ICJTaG91bGQgd2Ugcm91bmRfdXAgbGVu
IGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrCj4+Pj4+IGNhbGN1bGF0aW9uPyIKPj4+Pgo+Pj4+
IFpoaWd1bywKPj4+Pgo+Pj4+IFllcywgSSB0aGluayBhbGlnbm1lbnQgb2YgbGVuIHNob3VsZCBu
b3QgYWZmZWN0IGNhbGN1bGF0aW9uIG9mIGxhc3RfYmxrLgo+Pj4+Cj4+Pj4gSSBtZWFuIHRoaXMs
Cj4+Pj4KPj4+PiAtLS0KPj4+PiAgICAgZnMvZjJmcy9kYXRhLmMgICAgICAgICAgfCA2ICsrKy0t
LQo+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4+Pj4gICAgIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBpbmRleCA3ZDFi
Yjk1MThhNDAuLmNiYmI5NTZmNDIwZCAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+
Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4gQEAgLTE5NjcsMTIgKzE5NjcsMTIgQEAgaW50
IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2lu
Zm8gKmZpZWluZm8sCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+
PiAgICAgICAgICAgfQo+Pj4+Cj4+Pj4gLSAgICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
bGVuKSA9PSAwKQo+Pj4+IC0gICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2Rl
LCAxKTsKPj4+PiAtCj4+Pj4gICAgICAgICAgIHN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5v
ZGUsIHN0YXJ0KTsKPj4+PiAgICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2Rl
LCBzdGFydCArIGxlbiAtIDEpOwo+Pj4+Cj4+Pj4gKyAgICAgICBpZiAobGVuICYgRjJGU19CTEtT
SVpFX01BU0spCj4+Pj4gKyAgICAgICAgICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgRjJGU19C
TEtTSVpFKTsKPj4+PiArCj4+PiBIaSBDaGFvLAo+Pj4gdGhpcyB2ZXJpb24gdmVyaWZ5IHBhc3Mg
d2l0aCBteSB0ZXN0IGNhc2UuCj4+Pgo+Pj4gYnV0IHRoZXJlIGlzIHN0aWxsIGFub3RoZXIgaXNz
dWUgaW4gb3JnaW5hbCBjb2RlOgo+Pj4geWxvZy9hbmFseXplci5weSAgc2l6ZSA9IDE5MDM0Cj4+
PiBpZiBJIGlucHV0IHRoZSBmb2xsb3dpbmcgY21kKHN0YXJ0L2xlbmd0aCBhcmUgYm90aCByZWFs
IHNpemUsIG5vdCBibG9jayBudW1iZXIpCj4+PiAvZjJmc19pbyBmaWVtYXAgMiAxNjM4NCB5bG9n
L2FuYWx5emVyLnB5Cj4+PiBhbmQgdGhlIHJlc3VsdHMgc2hvd3M6Cj4+PiBGaWVtYXA6IG9mZnNl
dCA9IDIgbGVuID0gMTYzODQKPj4+ICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRk
ci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4+PiAxICAgIDAwMDAwMDAw
MDAwMDQwMDAgMDAwMDAwMGUyZWJjZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+PiBz
byBzdGFydF9ibGsvbGFzdF9ibGsgc2hvdWxkIGJlIGNhbGN1bGF0ZSBpdCBpbiB0aGUgZm9sbG93
aW5nIHdheT8KPj4KPj4gSUlVQywgdGhlIHJvb3QgY2F1c2UgaXMgZjJmc19tYXBfYmxvY2tzKCkg
d2lsbCB0cnVuY2F0ZSBzaXplIG9mCj4+IHJldHVybmVkIGV4dGVudCB0byBGMkZTX0JZVEVTX1RP
X0JMSyhsZW4pLCBzbyB3aGVuZXZlciBwYXJhbWV0ZXIKPj4gQGxlbiBkb2Vzbid0IGNvdmVyIGxh
c3QgZXh0ZW50LCBpdCB0cmlnZ2VycyB0aGlzIGJ1Zy4KPj4KPj4gbmV4dDoKPj4gICAgICAgICAg
bWVtc2V0KCZtYXAsIDAsIHNpemVvZihtYXApKTsKPj4gICAgICAgICAgbWFwLm1fbGJsayA9IHN0
YXJ0X2JsazsKPj4gICAgICAgICAgbWFwLm1fbGVuID0gRjJGU19CWVRFU19UT19CTEsobGVuKTsg
IC0tLSBsaW1pdCBtYXggc2l6ZSBvZiBleHRlbnQgaXQgZm91bmRzCj4geWVzLCBJIHRoaW5rIHNv
IHRvby4KPj4gICAgICAgICAgbWFwLm1fbmV4dF9wZ29mcyA9ICZuZXh0X3Bnb2ZzOwo+PiAgICAg
ICAgICBtYXAubV9zZWdfdHlwZSA9IE5PX0NIRUNLX1RZUEU7Cj4+IC4uLgo+PiAgICAgICAgICBy
ZXQgPSBmMmZzX21hcF9ibG9ja3MoaW5vZGUsICZtYXAsIEYyRlNfR0VUX0JMT0NLX0ZJRU1BUCk7
Cj4+Cj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4gZmlsZToKPj4gICAg
RVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPj4gICAg
ICAwOiBbMC4uMzFdOiAgICAgICAgIDEzOTI3Mi4uMTM5MzAzICAgICAgMzIgMHgxMDAwCj4+ICAg
ICAgMTogWzMyLi4zOV06ICAgICAgICAxMzkzMDQuLjEzOTMxMSAgICAgICA4IDB4MTAwMQo+PiB4
ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiCj4+IGZpbGU6Cj4+ICAgIEVYVDogRklM
RS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4+ICAgICAgMDogWzAu
LjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAo+PiB4ZnNfaW8gZmls
ZSAtYyAiZmllbWFwIC12IDAgMTYzODUiCj4+IGZpbGU6Cj4+ICAgIEVYVDogRklMRS1PRkZTRVQg
ICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4+ICAgICAgMDogWzAuLjM5XTogICAg
ICAgICAxMzkyNzIuLjEzOTMxMSAgICAgIDQwIDB4MTAwMQo+IAo+IEJ1dCAgSWYgdGhlIGNvcnJl
Y3QgbGFzdF9ibGsgaXMgY2FsY3VsYXRlZCBjb3JyZWN0bHksIGZpZW1hcCBjYW4gYmUKPiBlbmRl
ZCBhcyBzb29uIGFzIHBvc3NpYmxlPyAgc28gdGhlIHJlc3VsdHMgc2hvd24gaXMgYWxzbyByaWdo
dD8KClpoaWd1bywKCklNTywgaXQncyBub3QsIGR1ZSB0byAxKSBpZiB0aGUgZXh0ZW50IGlzIGxh
c3Qgb25lLCBGSUVNQVBfRVhURU5UX0xBU1QKbXVzdCBiZSB0YWdnZWQgdG8gbm90aWNlIHVzZXIg
dGhhdCBpdCBkb2Vzbid0IG5lZWQgZnVydGhlciBmaWVtYXAgb24KbGF0dGVyIExCQSwgMikgb25l
IGNvbnRpbnVvdXMgZXh0ZW50IHNob3VsZCBub3QgYmUgc3BsaXQgdG8gdHdvLgoKTGV0IG1lIGZp
Z3VyZSBvdXQgYSBmaXggZm9yIHRoYXQuCgpUaGFua3MsCgo+IHN1Y2ggYXMgdGhpcyBzcGVjaWFs
IGNhc2UgInhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIgd2UgZGlzY3Vzc2VkLgo+
IGJ1dCBpdCBpcyBmaW5lIGZvciBtZSB0byBrZWVwIHRoZSBjdXJyZW50IGNvZGVzLgo+IHRoYW5r
cyEKPj4KPj4gVGhvdWdodHM/Cj4+Cj4+IFRoYW5rcywKPj4KPj4+IGJlZm9yZToKPj4+IHN0YXJ0
X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPj4+IGxhc3RfYmxrID0gYnl0ZXNf
dG9fYmxrcyhpbm9kZSwgc3RhcnQgKyBsZW4gLSAxKTsKPj4+IGFmdGVyOgo+Pj4KPj4+IHN0YXJ0
X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPj4+IGxhc3RfYmxrID0gc3RhcnRf
YmxrICsgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuIC0gMSk7Cj4+PiB0aGFua3MhCj4+Pj4gICAg
IG5leHQ6Cj4+Pj4gICAgICAgICAgIG1lbXNldCgmbWFwLCAwLCBzaXplb2YobWFwKSk7Cj4+Pj4g
ICAgICAgICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZjJmc19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPj4+PiBpbmRleCBi
MGI4MjFlZGZkOTcuLjk1NGU4ZTgzNDRiNyAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaAo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4+Pj4gQEAgLTI0
LDEwICsyNCwxMSBAQAo+Pj4+ICAgICAjZGVmaW5lIE5FV19BRERSICAgICAgICAgICAgICAoKGJs
b2NrX3QpLTEpICAgLyogdXNlZCBhcyBibG9ja190IGFkZHJlc3NlcyAqLwo+Pj4+ICAgICAjZGVm
aW5lIENPTVBSRVNTX0FERFIgICAgICAgICAoKGJsb2NrX3QpLTIpICAgLyogdXNlZCBhcyBjb21w
cmVzc2VkIGRhdGEgZmxhZyAqLwo+Pj4+Cj4+Pj4gKyNkZWZpbmUgRjJGU19CTEtTSVpFX01BU0sg
ICAgICAgICAgICAgIChGMkZTX0JMS1NJWkUgLSAxKQo+Pj4+ICAgICAjZGVmaW5lIEYyRlNfQllU
RVNfVE9fQkxLKGJ5dGVzKSAgICAgICgoYnl0ZXMpID4+IEYyRlNfQkxLU0laRV9CSVRTKQo+Pj4+
ICAgICAjZGVmaW5lIEYyRlNfQkxLX1RPX0JZVEVTKGJsaykgICAgICAgICAgICAgICAgKChibGsp
IDw8IEYyRlNfQkxLU0laRV9CSVRTKQo+Pj4+ICAgICAjZGVmaW5lIEYyRlNfQkxLX0VORF9CWVRF
UyhibGspICAgICAgICAgICAgICAgKEYyRlNfQkxLX1RPX0JZVEVTKGJsayArIDEpIC0gMSkKPj4+
PiAtI2RlZmluZSBGMkZTX0JMS19BTElHTih4KSAgICAgICAgICAgICAgICAgICAgICAoRjJGU19C
WVRFU19UT19CTEsoKHgpICsgRjJGU19CTEtTSVpFIC0gMSkpCj4+Pj4gKyNkZWZpbmUgRjJGU19C
TEtfQUxJR04oeCkgICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkgKyBGMkZTX0JM
S1NJWkUgLSAxKSkKPj4+Pgo+Pj4+ICAgICAvKiAwLCAxKG5vZGUgbmlkKSwgMihtZXRhIG5pZCkg
YXJlIHJlc2VydmVkIG5vZGUgaWQgKi8KPj4+PiAgICAgI2RlZmluZSBGMkZTX1JFU0VSVkVEX05P
REVfTlVNICAgICAgICAgICAgICAgIDMKPj4+PiAtLQo+Pj4+IDIuNDAuMQo+Pj4+Cj4+Pj4KPj4+
Pgo+Pj4+PiBUaGFua3MKPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+Pj4+IGJ1dCBv
dmVyYWxsIGxhc3RfYmxrIHdpbGwgY2hhbmdlIGxvb3AgY291bnRzIGJ1dCBoYXMgbm90IGFmZmVj
dCBvbiB0aGUgcmVzdWx0cy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2hvdWxkIHdlIHJvdW5kX3VwIGxl
biBhZnRlciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KPj4+Pj4+PiBJIHRoaW5r
cyBpdCBpcyBvayAsYnV0IGp1c3QgYSBsaXR0bGUgYml0IHJlZHVuZGFudCB3aXRoIHRoZSBmb2xs
b3dpbmcKPj4+Pj4+PiBoYW5kbGluZyBhYm91dCBsZW4uCj4+Pj4+Pj4KPj4+Pj4+PiBpZiAoYnl0
ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+Pj4+Pj4+ICAgICAgICBsZW4gPSBibGtzX3Rv
X2J5dGVzKGlub2RlLCAxKTsKPj4+Pj4+Pgo+Pj4+Pj4+IEJhc2VkIG9uIHRoZSBhYm92ZSBzaXR1
YXRpb24sCj4+Pj4+Pj4gZG8geW91IGhhdmUgYW55IG90aGVyIGdvb2Qgc3VnZ2VzdGlvbnM/IF5e
Cj4+Pj4+Pj4gdGhhbmtzIQo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+
Pj4KPj4+Pj4+Pj4+IHRoYW5rc++8gQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
