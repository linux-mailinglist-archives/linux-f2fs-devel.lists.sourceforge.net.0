Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3509839E00C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 17:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqGxe-0001mq-E0; Mon, 07 Jun 2021 15:14:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqGxd-0001mj-U9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AYgmHXCyfalLust3wPGQIh/bS0mrgLEoL9/pkFcMpk=; b=bCaSrocFjPTSnLnsqVO5sbhYTT
 7KWS2PqL/SJRTk0RbhpilkjipkET+/O7bjDq47z77Wlt8jeE1mtqLmJX27CJS4/leTYMGNVWjIDlm
 q8aYL4E9cNDcML8b+Ns1ZCYlsr1mzNZWeYPyb4LhQ6lnMjjXPhcpFaXHHVnnhwmK3Vvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6AYgmHXCyfalLust3wPGQIh/bS0mrgLEoL9/pkFcMpk=; b=QqiFwMdCjgIhkuRMZfolW1NjAF
 lJYLjYktyixChhLIK8vM1PPrp45EKa5vA9/+gzaf7MiBNJ0WdoH0w+g+5eFKUx79ZOEBO56vjZtaV
 E/LTYUEUuGjkCqtn5X/27J9/tNyGB1eEFF2kR7ZKF3nnJzFJJTOV/Ns79z7epg50gqk0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqGxd-0003md-42
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 15:14:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41372610FB;
 Mon,  7 Jun 2021 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623078873;
 bh=jqsP8B5sIgFM4cICOhhFkhiJSZbwXCtHvM/0sHcV3hY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ua+ZFXhhIXrbnFhi/tzg+G6PYAPhjbZlGVVLYDK+Fxs8MoycmndQTr7O2RSgp+ioF
 89q2HmHAUDVJSzdL4C8jnzqGF38E7Jr1D1vgYVKrf5WotSwKBPBLEYvIslvWhZeFM7
 KFNqY4YHb+FtKDP0/5307ePY96MxcYTZPH6iQvw6asJkxdhfLoOJOuTs26s7CsPeUb
 LJdgURbb6F8C5Rb3iR3PfxYTEvXPAaFm+71SoG7N2vU8w9xt0+TStflVp+RiaMsDcA
 UZ405KtBOLgkRr3ifkBGUsxWq1XNL3fbZWKLPk+t6jih3ICWTpyAn9PhnCjw7kP6mT
 FgAcJ8K9E4hbQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210526062927.52629-1-yuchao0@huawei.com>
 <YK5NXdyjgB6EFY5Q@google.com>
 <e4c1df88-f1f4-99e0-6f83-fa0f3110d737@kernel.org>
 <YK74cyGYzWZCmZue@google.com>
 <21ec5a95-bdbc-358d-99c7-e75e91228039@huawei.com>
 <ce4d1663-4082-625f-4c3f-858bf03bbb26@kernel.org>
 <YLq8nlrxfotXnerU@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <112bb86b-63eb-2249-6ad4-80a9ecdcdc67@kernel.org>
Date: Mon, 7 Jun 2021 23:14:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLq8nlrxfotXnerU@google.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqGxd-0003md-42
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: swap: remove dead codes
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

T24gMjAyMS82LzUgNzo1MSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDYvMDQsIENoYW8gWXUg
d3JvdGU6Cj4+IE9uIDIwMjEvNS8yNyAxMDoxMiwgQ2hhbyBZdSB3cm90ZToKPj4+IE9uIDIwMjEv
NS8yNyA5OjQwLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+PiBPbiAwNS8yNiwgQ2hhbyBZdSB3cm90
ZToKPj4+Pj4gT24gMjAyMS81LzI2IDIxOjMwLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4+IE9u
IDA1LzI2LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+IEFmdGVyIGNvbW1pdCBhZjRiNmI4ZWRmNmEg
KCJmMmZzOiBpbnRyb2R1Y2UgY2hlY2tfc3dhcF9hY3RpdmF0ZV9mYXN0KCkiKSwKPj4+Pj4+PiB3
ZSB3aWxsIG5ldmVyIHJ1biBpbnRvIG9yaWdpbmFsIGxvZ2ljIG9mIGNoZWNrX3N3YXBfYWN0aXZh
dGUoKSBiZWZvcmUKPj4+Pj4+PiBmMmZzIHN1cHBvcnRzIG5vbiA0ay1zaXplZCBwYWdlLCBzbyBs
ZXQncyBkZWxldGUgdGhvc2UgZGVhZCBjb2Rlcy4KPj4+Pj4+Cj4+Pj4+PiBXaHkgbm90IGtlZXBp
bmcgdGhpcyBmb3IgbGFyZ2UgcGFnZSBzdXBwb3J0IGluIGZ1dHVyZSBtYXliZT8KPj4+Pj4KPj4+
Pj4gV2VsbCwgaWYgc28sIGF0IHRoYXQgdGltZSwgaXQgd291bGQgYmUgYmV0dGVyIHRvIHJlZmFj
dG9yCj4+Pj4+IGNoZWNrX3N3YXBfYWN0aXZhdGVfZmFzdCgpIGltcGxlbWVudGF0aW9uIGJhc2Vk
IG9uIGYyZnNfbWFwX2Jsb2NrKCkgcmF0aGVyCj4+Pj4+IHRoYW4gcmVmYWN0b3JpbmcgY2hlY2tf
c3dhcF9hY3RpdmF0ZSgpIGltcGxlbWVudGF0aW9uIGJhc2VkIG9uIGxvdyBlZmZpY2llbnQKPj4+
Pj4gYm1hcCgpPwo+Pj4+Cj4+Pj4gTGV0J3MgZmlyc3QgY2hlY2sgd2hldGhlciB3ZSBzdXBwb3J0
IGxhcmdlIHBhZ2UuIEhhdmUgeW91IHF1aWNrbHkgdGVzdGVkIGl0Pwo+Pj4+IElmIHdlIHN1cHBv
cnQgaXQgbm93IGFuZCBjdXJyZW50IGZsb3cgaXMganVzdCBpbmVmZmljaWVudCwgSSdkIHNheSBr
ZWVwaW5nIGJ1dAo+Pj4+IHJlZmFjdG9yaW5nIGl0IGxhdGVyLgo+Pj4KPj4+IExldCBtZSBjaGVj
ayB0aGlzLCBidXQgSSBndWVzcyBpdCBtaXNzZWQgdG8gaGFuZGxlIGxhcmdlIHBhZ2UgaW4gbG90
cyBvZiBmbG93cywKPj4+IG5vdCBzdXJlIHdoZXJlIHdlIG1heSBwYW5pYyBhdC4uLiA6KAo+Pgo+
PiBJJ3ZlIGNoZWNrZWQgZjJmcyBiZWhhdmlvciBvbiA2NGtiIHBhZ2Ugc2l6ZSBpbiBhcm02NCB2
bSwKPj4gLSAnbHMgLWxzJyB3aWxsIGNhdXNlIGYyZnMgcHJpbnRpbmcgImludmFsaWQgbmFtZWxl
bigwKSwgaW5vOiV1LCBydW4gZnNjawo+PiB0byBmaXguIiBlYWNoIHRpbWUuCj4+IC0gYWZ0ZXIg
dG91Y2ggYSBmaWxlIGFuZCB1bW91bnQsIGZzY2sgcmVwb3J0cyB0aGF0IGltYWdlIGlzIGNvcnJ1
cHRlZC4KPj4KPj4gRjJGUyB1c2VzIFBBR0VfU0laRSBhbmQgRjJGU19CTEtTSVpFIGRpcmVjdGx5
IGluIGEgbG90IG9mIHBsYWNlcywgSSBkb3VidAo+PiBtb3N0IG9mIHBsYWNlcyBtYXkgbm90IGNv
bnNpZGVyIGxhcmdlIHBhZ2Ugc2l6ZSBjb25kaXRpb24uCj4+Cj4+IFNvLCB0aG91Z2h0cz8gSSBn
dWVzcyB3ZSBoYXZlIHRvIGFkbWl0IHdlIGRvIG5vdCBzdXBwb3J0IDY0S0IgcGFnZSByaWdodAo+
PiBub3cuLi4gOlAKPiAKPiBZZWFoLCB3ZSBuZWVkIHRvIGJsb2NrIHRoZSBsYXJnZSBwYWdlIHN1
cHBvcnQgdW5mb3J0dW5hdGVseS4gOigKCkNvdWxkIHlvdSBwbGVhc2UgcXVldWUgdGhpcyBzZXJp
ZXMgaW4gZGV2LXRlc3Q/CgpUaGFua3MsCgo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhh
bmtzLAo+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+ICDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgMTcxICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+PiAgwqDCoCAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNjggZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+IGluZGV4
IDMwNThjN2UyOGIxMS4uOWMyM2ZkZTkzYjc2IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiBAQCAtMzgzMCw2NyAr
MzgzMCw3IEBAIGludCBmMmZzX21pZ3JhdGVfcGFnZShzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFw
cGluZywKPj4+Pj4+PiAgwqDCoCAjZW5kaWYKPj4+Pj4+PiAgwqDCoCAjaWZkZWYgQ09ORklHX1NX
QVAKPj4+Pj4+PiAtc3RhdGljIGludCBmMmZzX2lzX2ZpbGVfYWxpZ25lZChzdHJ1Y3QgaW5vZGUg
Kmlub2RlKQo+Pj4+Pj4+IC17Cj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+Pj4+Pj4+IC3CoMKgwqAgYmxvY2tfdCBtYWluX2Jsa2Fk
ZHIgPSBTTV9JKHNiaSktPm1haW5fYmxrYWRkcjsKPj4+Pj4+PiAtwqDCoMKgIGJsb2NrX3QgY3Vy
X2xibG9jazsKPj4+Pj4+PiAtwqDCoMKgIGJsb2NrX3QgbGFzdF9sYmxvY2s7Cj4+Pj4+Pj4gLcKg
wqDCoCBibG9ja190IHBibG9jazsKPj4+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgbnJfcGJs
b2NrczsKPj4+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGludCBibG9ja3NfcGVyX3NlYyA9IEJMS1Nf
UEVSX1NFQyhzYmkpOwo+Pj4+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IG5vdF9hbGlnbmVkID0g
MDsKPj4+Pj4+PiAtwqDCoMKgIGludCByZXQgPSAwOwo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKg
IGN1cl9sYmxvY2sgPSAwOwo+Pj4+Pj4+IC3CoMKgwqAgbGFzdF9sYmxvY2sgPSBieXRlc190b19i
bGtzKGlub2RlLCBpX3NpemVfcmVhZChpbm9kZSkpOwo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKg
IHdoaWxlIChjdXJfbGJsb2NrIDwgbGFzdF9sYmxvY2spIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXA7Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBtYXAubV9sYmxrID0gY3VyX2xibG9jazsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgbWFw
Lm1fbGVuID0gbGFzdF9sYmxvY2sgLSBjdXJfbGJsb2NrOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBtYXAubV9uZXh0X3Bnb2ZzID0gTlVMTDsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgbWFwLm1f
bmV4dF9leHRlbnQgPSBOVUxMOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBtYXAubV9zZWdfdHlw
ZSA9IE5PX0NIRUNLX1RZUEU7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIG1hcC5tX21heV9jcmVh
dGUgPSBmYWxzZTsKPj4+Pj4+PiAtCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNf
bWFwX2Jsb2Nrcyhpbm9kZSwgJm1hcCwgMCwgRjJGU19HRVRfQkxPQ0tfRklFTUFQKTsKPj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIG91dDsKPj4+Pj4+PiAtCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qIGhvbGUgKi8K
Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCEobWFwLm1fZmxhZ3MgJiBGMkZTX01BUF9GTEFH
UykpIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2VycihzYmksICJTd2Fw
ZmlsZSBoYXMgaG9sZXNcbiIpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IC1FTk9FTlQ7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAtCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHBi
bG9jayA9IG1hcC5tX3BibGs7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIG5yX3BibG9ja3MgPSBt
YXAubV9sZW47Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoKHBibG9jayAt
IG1haW5fYmxrYWRkcikgJiAoYmxvY2tzX3Blcl9zZWMgLSAxKSB8fAo+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG5yX3BibG9ja3MgJiAoYmxvY2tzX3Blcl9zZWMgLSAxKSkgewo+Pj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2Rl
KSkgewo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2Jp
LCAiU3dhcGZpbGUgZG9lcyBub3QgYWxpZ24gdG8gc2VjdGlvbiIpOwo+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTlZBTDsKPj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3RfYWxpZ25lZCsrOwo+
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBjdXJfbGJsb2NrICs9IG5yX3BibG9ja3M7Cj4+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+Pj4gLcKg
wqDCoCBpZiAobm90X2FsaWduZWQpCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGYyZnNfd2Fybihz
YmksICJTd2FwZmlsZSAoJXUpIGlzIG5vdCBhbGlnbiB0byBzZWN0aW9uOiBcbiIKPj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiXHQxKSBjcmVhdCgpLCAyKSBpb2N0bChGMkZTX0lPQ19T
RVRfUElOX0ZJTEUpLCAzKSBmYWxsb2NhdGUoKSIsCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbm90X2FsaWduZWQpOwo+Pj4+Pj4+IC1vdXQ6Cj4+Pj4+Pj4gLcKgwqDCoCByZXR1cm4g
cmV0Owo+Pj4+Pj4+IC19Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC1zdGF0aWMgaW50IGNoZWNrX3N3YXBf
YWN0aXZhdGVfZmFzdChzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2lzLAo+Pj4+Pj4+ICtzdGF0
aWMgaW50IGNoZWNrX3N3YXBfYWN0aXZhdGUoc3RydWN0IHN3YXBfaW5mb19zdHJ1Y3QgKnNpcywK
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmaWxl
ICpzd2FwX2ZpbGUsIHNlY3Rvcl90ICpzcGFuKQo+Pj4+Pj4+ICDCoMKgIHsKPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gc3dhcF9maWxlLT5mX21h
cHBpbmc7Cj4+Pj4+Pj4gQEAgLTM5MDcsNiArMzg0Nyw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfc3dh
cF9hY3RpdmF0ZV9mYXN0KHN0cnVjdCBzd2FwX2luZm9fc3RydWN0ICpzaXMsCj4+Pj4+Pj4gIMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbm90X2FsaWduZWQgPSAwOwo+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqAgaW50IHJldCA9IDA7Cj4+Pj4+Pj4gK8KgwqDCoCBmMmZzX2J1Z19vbihzYmksIFBBR0Vf
U0laRSAhPSBGMkZTX0JMS1NJWkUpOwo+Pj4+Pj4+ICsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgIC8q
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgICogTWFwIGFsbCB0aGUgYmxvY2tzIGludG8gdGhlIGV4
dGVudCBsaXN0LsKgIFRoaXMgY29kZSBkb2Vzbid0IHRyeQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oCAqIHRvIGJlIHZlcnkgc21hcnQuCj4+Pj4+Pj4gQEAgLTM5ODYsMTEzICszOTI4LDYgQEAgc3Rh
dGljIGludCBjaGVja19zd2FwX2FjdGl2YXRlX2Zhc3Qoc3RydWN0IHN3YXBfaW5mb19zdHJ1Y3Qg
KnNpcywKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4gIMKgwqAgfQo+
Pj4+Pj4+IC0vKiBDb3BpZWQgZnJvbSBnZW5lcmljX3N3YXBmaWxlX2FjdGl2YXRlKCkgdG8gY2hl
Y2sgYW55IGhvbGVzICovCj4+Pj4+Pj4gLXN0YXRpYyBpbnQgY2hlY2tfc3dhcF9hY3RpdmF0ZShz
dHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2lzLAo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGZpbGUgKnN3YXBfZmlsZSwgc2VjdG9yX3QgKnNwYW4pCj4+Pj4+
Pj4gLXsKPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gc3dh
cF9maWxlLT5mX21hcHBpbmc7Cj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2RlID0g
bWFwcGluZy0+aG9zdDsKPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9
IEYyRlNfSV9TQihpbm9kZSk7Cj4+Pj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBibG9ja3NfcGVyX3Bh
Z2U7Cj4+Pj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIHBhZ2Vfbm87Cj4+Pj4+Pj4gLcKgwqDC
oCBzZWN0b3JfdCBwcm9iZV9ibG9jazsKPj4+Pj4+PiAtwqDCoMKgIHNlY3Rvcl90IGxhc3RfYmxv
Y2s7Cj4+Pj4+Pj4gLcKgwqDCoCBzZWN0b3JfdCBsb3dlc3RfYmxvY2sgPSAtMTsKPj4+Pj4+PiAt
wqDCoMKgIHNlY3Rvcl90IGhpZ2hlc3RfYmxvY2sgPSAwOwo+Pj4+Pj4+IC3CoMKgwqAgaW50IG5y
X2V4dGVudHMgPSAwOwo+Pj4+Pj4+IC3CoMKgwqAgaW50IHJldCA9IDA7Cj4+Pj4+Pj4gLQo+Pj4+
Pj4+IC3CoMKgwqAgaWYgKFBBR0VfU0laRSA9PSBGMkZTX0JMS1NJWkUpCj4+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIHJldHVybiBjaGVja19zd2FwX2FjdGl2YXRlX2Zhc3Qoc2lzLCBzd2FwX2ZpbGUs
IHNwYW4pOwo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgIHJldCA9IGYyZnNfaXNfZmlsZV9hbGln
bmVkKGlub2RlKTsKPj4+Pj4+PiAtwqDCoMKgIGlmIChyZXQpCj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIGdvdG8gb3V0Owo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgIGJsb2Nrc19wZXJfcGFnZSA9
IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIFBBR0VfU0laRSk7Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKg
wqAgLyoKPj4+Pj4+PiAtwqDCoMKgwqAgKiBNYXAgYWxsIHRoZSBibG9ja3MgaW50byB0aGUgZXh0
ZW50IGxpc3QuwqAgVGhpcyBjb2RlIGRvZXNuJ3QgdHJ5Cj4+Pj4+Pj4gLcKgwqDCoMKgICogdG8g
YmUgdmVyeSBzbWFydC4KPj4+Pj4+PiAtwqDCoMKgwqAgKi8KPj4+Pj4+PiAtwqDCoMKgIHByb2Jl
X2Jsb2NrID0gMDsKPj4+Pj4+PiAtwqDCoMKgIHBhZ2Vfbm8gPSAwOwo+Pj4+Pj4+IC3CoMKgwqAg
bGFzdF9ibG9jayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGlfc2l6ZV9yZWFkKGlub2RlKSk7Cj4+
Pj4+Pj4gLcKgwqDCoCB3aGlsZSAoKHByb2JlX2Jsb2NrICsgYmxvY2tzX3Blcl9wYWdlKSA8PSBs
YXN0X2Jsb2NrICYmCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZV9ubyA8IHNp
cy0+bWF4KSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGJsb2NrX2luX3BhZ2U7
Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNlY3Rvcl90IGZpcnN0X2Jsb2NrOwo+Pj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBzZWN0b3JfdCBibG9jayA9IDA7Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBjb25kX3Jlc2NoZWQoKTsKPj4+Pj4+PiAtCj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIGJsb2NrID0gcHJvYmVfYmxvY2s7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IGJt
YXAoaW5vZGUsICZibG9jayk7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIGlmICghYmxvY2spCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBiYWRf
Ym1hcDsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZmlyc3RfYmxvY2sgPSBibG9jazsKPj4+Pj4+
PiAtCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAg
KiBJdCBtdXN0IGJlIFBBR0VfU0laRSBhbGlnbmVkIG9uLWRpc2sKPj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqDCoCAqLwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoZmlyc3RfYmxvY2sgJiAoYmxv
Y2tzX3Blcl9wYWdlIC0gMSkpIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9i
ZV9ibG9jaysrOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVwcm9iZTsK
Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqAgZm9yIChibG9ja19pbl9wYWdlID0gMTsgYmxvY2tfaW5fcGFnZSA8IGJsb2Nrc19wZXJfcGFn
ZTsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tf
aW5fcGFnZSsrKSB7Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJs
b2NrID0gcHJvYmVfYmxvY2sgKyBibG9ja19pbl9wYWdlOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldCA9IGJtYXAoaW5vZGUsICZibG9jayk7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gb3V0Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYmxvY2sp
Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGJhZF9ibWFwOwo+
Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYmxvY2sgIT0gZmly
c3RfYmxvY2sgKyBibG9ja19pbl9wYWdlKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBEaXNjb250aWd1aXR5ICovCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcm9iZV9ibG9jaysrOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byByZXByb2JlOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgZmlyc3RfYmxvY2sgPj49IChQQUdFX1NISUZUIC0gaW5vZGUtPmlfYmxrYml0cyk7Cj4+
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChwYWdlX25vKSB7wqDCoMKgIC8qIGV4Y2x1ZGUgdGhl
IGhlYWRlciBwYWdlICovCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZpcnN0
X2Jsb2NrIDwgbG93ZXN0X2Jsb2NrKQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbG93ZXN0X2Jsb2NrID0gZmlyc3RfYmxvY2s7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGZpcnN0X2Jsb2NrID4gaGlnaGVzdF9ibG9jaykKPj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhpZ2hlc3RfYmxvY2sgPSBmaXJzdF9ibG9jazsKPj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
LyoKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGZvdW5kIGEgUEFHRV9TSVpFLWxlbmd0
aCwgUEFHRV9TSVpFLWFsaWduZWQgcnVuIG9mIGJsb2Nrcwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oMKgICovCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IGFkZF9zd2FwX2V4dGVudChzaXMs
IHBhZ2Vfbm8sIDEsIGZpcnN0X2Jsb2NrKTsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCA8IDApCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIG5yX2V4dGVudHMgKz0gcmV0Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBwYWdlX25vKys7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHByb2JlX2Jsb2NrICs9IGJsb2Nr
c19wZXJfcGFnZTsKPj4+Pj4+PiAtcmVwcm9iZToKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgY29u
dGludWU7Cj4+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+Pj4gLcKgwqDCoCByZXQgPSBucl9leHRlbnRz
Owo+Pj4+Pj4+IC3CoMKgwqAgKnNwYW4gPSAxICsgaGlnaGVzdF9ibG9jayAtIGxvd2VzdF9ibG9j
azsKPj4+Pj4+PiAtwqDCoMKgIGlmIChwYWdlX25vID09IDApCj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIHBhZ2Vfbm8gPSAxO8KgwqDCoCAvKiBmb3JjZSBFbXB0eSBtZXNzYWdlICovCj4+Pj4+Pj4g
LcKgwqDCoCBzaXMtPm1heCA9IHBhZ2Vfbm87Cj4+Pj4+Pj4gLcKgwqDCoCBzaXMtPnBhZ2VzID0g
cGFnZV9ubyAtIDE7Cj4+Pj4+Pj4gLcKgwqDCoCBzaXMtPmhpZ2hlc3RfYml0ID0gcGFnZV9ubyAt
IDE7Cj4+Pj4+Pj4gLW91dDoKPj4+Pj4+PiAtwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4gLWJh
ZF9ibWFwOgo+Pj4+Pj4+IC3CoMKgwqAgZjJmc19lcnIoc2JpLCAiU3dhcGZpbGUgaGFzIGhvbGVz
XG4iKTsKPj4+Pj4+PiAtwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+IC19Cj4+Pj4+Pj4g
LQo+Pj4+Pj4+ICDCoMKgIHN0YXRpYyBpbnQgZjJmc19zd2FwX2FjdGl2YXRlKHN0cnVjdCBzd2Fw
X2luZm9fc3RydWN0ICpzaXMsIHN0cnVjdCBmaWxlICpmaWxlLAo+Pj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VjdG9yX3QgKnNwYW4pCj4+Pj4+Pj4gIMKgwqAg
ewo+Pj4+Pj4+IC0tIAo+Pj4+Pj4+IDIuMjkuMgo+Pj4+IC4KPj4+PgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
