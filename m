Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 976396DD5B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 10:36:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm9UH-0007Nd-Vt;
	Tue, 11 Apr 2023 08:36:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pm9UD-0007NS-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/GcQsp6OOCoNy+3kg9eyOrpQp7vHK/vAPfhSoA1hdQ=; b=WVa9gIj8zwTxNd75HWebrbaFJz
 16F4diEFbsEeMe0ObaFqLBxUR2VAxOAfCKwi1AtMA7JlrMWAjjli1n3WgsBrEJsBWkixCHRIeI7r0
 mp8H93xz7RaE9h3DlyRvG6yS6X7EYjEd9U9y7aZ+CFlgpONBAzed48ZpdnsfUSeUPhXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O/GcQsp6OOCoNy+3kg9eyOrpQp7vHK/vAPfhSoA1hdQ=; b=Sc0MHIFtlecEpjv+CNjw2LwQEa
 hDTNFuk9o+2bg7CqHuZeyCi4ud82uhCSoTQe2FZMLprM89UB4wQ6H/If3VSBfKKbdfClCZ8D8GCuy
 USmsrbbiQBxm5u/7Zv5LIfmDrHx8I5yg9cq/0gMoMdfS5wh2mbRyHfkRn+sd/72z6D58=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm9UC-003sXj-Tz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:36:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C8C7622D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 08:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324CFC433EF;
 Tue, 11 Apr 2023 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681202175;
 bh=QK5lRHbzUyNcL/CLee7/EdTKhaXBSZZ5/FnxzE21Az0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=nRcZZDOwjeYEkfJfwVrA0nHOxUuouvEMQfZLL+FTB3DIeS4jfxJHDaF3uNl0cGsLj
 oX3IToNZLIkJAu7Z2NPpMf5K4cm47cWrVupf0+N3Gwfad9EhkHRchVbFnJ/S0XEsl/
 i8w/Gm3dnB4RE48oj+TAzDdxngWsQS2Q3utX2wzq+ET+VN4uIapGecVnXDJYgDTre+
 UBtMrGKn/x9m+0tDGJyDw2uIbKYa292nlG0ksu8DPkkxUvpIfvm19aJQ8fMNjGdRZG
 NpcTYYQ01EeMLn/dJDmfL/FVbwKWGtWf6qXf5QtY10/bRKYNuNgqku0jFm7gfqPTa6
 kjvQHeL9M9RCA==
Message-ID: <2341db3b-5a40-a9f0-51f1-29a8908e3e98@kernel.org>
Date: Tue, 11 Apr 2023 16:36:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
 <ZDROBJFxSUdGaqAa@google.com>
 <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
In-Reply-To: <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/11 16:14, Chao Yu wrote: > On 2023/4/11 1:57,
 Jaegeuk
 Kim wrote: >> On 04/08, Chao Yu wrote: >>> On 2023/4/8 4:59, Jaegeuk Kim
 wrote: >>>> This breaks generic/009? >>> >>> I guess it is as e [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pm9UC-003sXj-Tz
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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

T24gMjAyMy80LzExIDE2OjE0LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvNC8xMSAxOjU3LCBK
YWVnZXVrIEtpbSB3cm90ZToKPj4gT24gMDQvMDgsIENoYW8gWXUgd3JvdGU6Cj4+PiBPbiAyMDIz
LzQvOCA0OjU5LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+PiBUaGlzIGJyZWFrcyBnZW5lcmljLzAw
OT8KPj4+Cj4+PiBJIGd1ZXNzIGl0IGlzIGFzIGV4cGVjdGVkPwo+Pj4KPj4+IFBsZWFzZSBjaGVj
ayBkZXNjcmlwdGlvbiBvZiBmaWVtYXAgaW9jdGwgbWFudWFsIGZyb20gWzFdOgo+Pj4KPj4+IEZJ
RU1BUF9FWFRFTlRfVU5LTk9XTgo+Pj4gVGhlIGxvY2F0aW9uIG9mIHRoaXMgZXh0ZW50IGlzIGN1
cnJlbnRseSB1bmtub3duLiBUaGlzIG1heQo+Pj4gaW5kaWNhdGUgdGhlIGRhdGEgaXMgc3RvcmVk
IG9uIGFuIGluYWNjZXNzaWJsZSB2b2x1bWUgb3IgdGhhdAo+Pj4gbm8gc3RvcmFnZSBoYXMgYmVl
biBhbGxvY2F0ZWQgZm9yIHRoZSBmaWxlIHlldC4KPj4+Cj4+PiBGSUVNQVBfRVhURU5UX0RFTEFM
TE9DCj4+PiBUaGlzIHdpbGwgYWxzbyBzZXQgRklFTUFQX0VYVEVOVF9VTktOT1dOLgo+Pj4KPj4+
IERlbGF5ZWQgYWxsb2NhdGlvbiAtIHdoaWxlIHRoZXJlIGlzIGRhdGEgZm9yIHRoaXMgZXh0ZW50
LCBpdHMKPj4+IHBoeXNpY2FsIGxvY2F0aW9uIGhhcyBub3QgYmVlbiBhbGxvY2F0ZWQgeWV0Lgo+
Pj4KPj4+IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOCj4+PiBVbndyaXR0ZW4gZXh0ZW50IC0gdGhl
IGV4dGVudCBpcyBhbGxvY2F0ZWQgYnV0IGl0cyBkYXRhIGhhcyBub3QKPj4+IGJlZW4gaW5pdGlh
bGl6ZWQuIFRoaXMgaW5kaWNhdGVzIHRoZSBleHRlbnTigJlzIGRhdGEgd2lsbCBiZSBhbGwKPj4+
IHplcm8gaWYgcmVhZCB0aHJvdWdoIHRoZSBmaWxlc3lzdGVtIGJ1dCB0aGUgY29udGVudHMgYXJl
IHVuZGVmaW5lZAo+Pj4gaWYgcmVhZCBkaXJlY3RseSBmcm9tIHRoZSBkZXZpY2UuCj4+Pgo+Pj4g
WzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2ZpbGVzeXN0ZW1zL2Zp
ZW1hcC5odG1sCj4+Pgo+Pj4gQWNjb3JkaW5nIHRvIGl0cyBkZXNjcmlwdGlvbiwgZjJmcyBvbmx5
IHN1cHBvcnQKPj4+IEZJRU1BUF9FWFRFTlRfe1VOS05PV04sIERFTEFMTE9DfSwgYnV0IG5vdCBz
dXBwb3J0Cj4+PiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTi4KPj4KPj4gTm8sIEkgZG9uJ3QgdGhp
bmsgc28uCj4gCj4gSmFlZ2V1aywKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGNoZWNrIHRoZSBkZXRh
aWxlZCBkZXNjcmlwdGlvbiBvZiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTj8KPiBUaGUgZmxhZyBp
bmRpY2F0ZXMgdHdvIGNvbmRpdGlvbnM6Cj4gMS4gb24tZGlzayBibGthZGRycyB3ZXJlIGFsbG9j
YXRlZCBmb3IgZXh0ZW50LCBhbmQgdGhlIGV4dGVudCBpcyB0YWdnZWQgYXMKPiB1bndyaXR0ZW4g
c3RhdHVzLgo+IDIuIGRhdGEgcmVhZGVkIG9uIHRob3NlIGJsb2NrcyB3aWxsIGJlIGFsbCB6ZXJv
LgoKU29ycnksIEkgbWVhbjoKCjEuIG9uLWRpc2sgYmxrYWRkcnMgd2VyZSBhbGxvY2F0ZWQgZm9y
IGV4dGVudDsKMi4gZXh0ZW50IGlzIHRhZ2dlZCBhcyB1bndyaXR0ZW4gc3RhdHVzLCBkYXRhIHJl
YWRlZCBvbiB0aG9zZSBibG9ja3Mgd2lsbCBiZQphbGwgemVyby4KClRoYW5rcywKCj4gCj4gU28s
IGxldCdzIGNoZWNrIGYyZnMnIHN0YXR1czoKPiAtIGZhbGxvY2F0ZSBvbmx5IHJlc2VydmUgdmFs
aWQgYmxvY2sgY291bnQgYW5kIHNldCBORVdfQUREUiBpbiBkbm9kZSwgc28KPiBpdCBkb2VzIG5v
dCBtYXRjaCBjb25kaXRpb24gMSkKPiAtIHBpbiAmIGZhbGxvY2F0ZSBwcmVhbGxvY2F0ZXMgYmxr
YWRkcnMgYW5kIHNldCBibGthZGRycyBpbiBkbm9kZSwgYnV0Cj4gY29udGVudCBvbiB0aG9zZSBi
bGthZGRycyBtYXkgY29udGFpbiB6ZXJvIG9yIHJhbmRvbSBkYXRhLCBzbyBpdCBkb2VzIG5vdAo+
IG1hdGNowqAgY29uZGl0aW9uIDIpCj4gCj4gQ2hyaXN0b3BoIGRlc2NyaWJlcyB0aGlzIGlzc3Vl
IGluIGJlbG93IHBhdGNoIGFzIHdlbGwsIHlvdSBjYW4gY2hlY2sgaXQuCj4gZGE4YzdmZWNjOWM3
ICgiZjJmczogcmVuYW1lIEYyRlNfTUFQX1VOV1JJVFRFTiB0byBGMkZTX01BUF9ERUxBTExPQyIp
Cj4gCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBUaGFua3MsCj4gCj4+Cj4+Pgo+Pj4g
U28gMDA5LCAwOTIsIDA5NCAuLiB3aGljaCBleHBlY3RzIHVud3JpdHRlbiBzdGF0dXMgZnJvbSBl
eHRlbnQgd2lsbAo+Pj4gZmFpbC4KPj4+Cj4+PiBIb3cgYWJvdXQgZGlzYWJsaW5nIHRob3NlIHRl
c3RjYXNlPwo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+PiBPbiAwNC8wNSwgQ2hhbyBZdSB3
cm90ZToKPj4+Pj4geGZzdGVzdCBnZW5lcmljLzYxNCBmYWlscyB0byBydW4gZHVlIGJlbG93IHJl
YXNvbjoKPj4+Pj4KPj4+Pj4gZ2VuZXJpYy82MTQgMXMgLi4uIFtub3QgcnVuXSB0ZXN0IHJlcXVp
cmVzIGRlbGF5ZWQgYWxsb2NhdGlvbiBidWZmZXJlZCB3cml0ZXMKPj4+Pj4KPj4+Pj4gVGhlIHJv
b3QgY2F1c2UgaXMgZjJmcyB0YWdzIHdyb25nIGZpZW1hcCBmbGFnIGZvciBkZWxheSBhbGxvY2F0
ZWQKPj4+Pj4gZXh0ZW50Lgo+Pj4+Pgo+Pj4+PiBRdW90ZWQgZnJvbSBmaWVtYXAuaDoKPj4+Pj4g
RklFTUFQX0VYVEVOVF9VTktOT1dOwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMiAvKiBEYXRhIGxv
Y2F0aW9uIHVua25vd24uICovCj4+Pj4+IEZJRU1BUF9FWFRFTlRfREVMQUxMT0PCoMKgwqDCoMKg
wqDCoCAweDAwMDAwMDA0IC8qIExvY2F0aW9uIHN0aWxsIHBlbmRpbmcuCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFNldHMgRVhU
RU5UX1VOS05PV04uICovCj4+Pj4+IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOwqDCoMKgwqDCoMKg
wqAgMHgwMDAwMDgwMCAvKiBTcGFjZSBhbGxvY2F0ZWQsIGJ1dAo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBubyBkYXRhIChpLmUu
IHplcm8pLiAqLwo+Pj4+Pgo+Pj4+PiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTiBtZWFucyBibG9j
ayBhZGRyZXNzIGlzIHByZWFsbG9jYXRlZCwgYnV0IHcvbwo+Pj4+PiBiZWVuIHdyaXR0ZW4gYW55
IGRhdGEsIHdoaWNoIHN0YXR1cyBmMmZzIGlzIG5vdCBzdXBwb3J0ZWQgbm93LCBmb3IgYWxsCj4+
Pj4+IE5FV19BRERSIGJsb2NrIGFkZHJlc3NlcywgaXQgbWVhbnMgZGVsYXkgYWxsb2NhdGVkIGJs
b2Nrcywgc28gbGV0J3MKPj4+Pj4gdGFnIEZJRU1BUF9FWFRFTlRfREVMQUxMT0MgaW5zdGVhZC4K
Pj4+Pj4KPj4+Pj4gVGVzdGNhc2U6Cj4+Pj4+IHhmc19pbyAtZiAtYyAncHdyaXRlIDAgNjRrJyAv
bW50L2YyZnMvZmlsZTsKPj4+Pj4gZmlsZWZyYWcgLXYgL21udC9mMmZzL2ZpbGUKPj4+Pj4KPj4+
Pj4gT3V0cHV0Ogo+Pj4+PiAtIEJlZm9yZQo+Pj4+PiBGaWxlc3lzdGVtIHR5cGUgaXM6IGYyZjUy
MDEwCj4+Pj4+IEZpemUgb2YgL21udC9mMmZzL2ZpbGUgaXMgNjU1MzYgKDE2IGJsb2NrcyBvZiA0
MDk2IGJ5dGVzKQo+Pj4+PiDCoMKgIGV4dDrCoMKgwqDCoCBsb2dpY2FsX29mZnNldDrCoMKgwqDC
oMKgwqDCoCBwaHlzaWNhbF9vZmZzZXQ6IGxlbmd0aDrCoMKgIGV4cGVjdGVkOiBmbGFnczoKPj4+
Pj4gwqDCoMKgwqAgMDrCoMKgwqDCoMKgwqDCoCAwLi7CoMKgwqDCoMKgIDE1OsKgwqDCoMKgwqDC
oMKgwqDCoCAwLi7CoMKgwqDCoMKgwqDCoCAxNTrCoMKgwqDCoCAxNjrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbGFzdCx1bndyaXR0ZW4sbWVyZ2VkLGVvZgo+Pj4+PiAvbW50L2YyZnMvZmlsZTog
MSBleHRlbnQgZm91bmQKPj4+Pj4KPj4+Pj4gQWZ0ZXI6Cj4+Pj4+IEZpbGVzeXN0ZW0gdHlwZSBp
czogZjJmNTIwMTAKPj4+Pj4gRmlsZSBzaXplIG9mIC9tbnQvZjJmcy9maWxlIGlzIDY1NTM2ICgx
NiBibG9ja3Mgb2YgNDA5NiBieXRlcykKPj4+Pj4gwqDCoCBleHQ6wqDCoMKgwqAgbG9naWNhbF9v
ZmZzZXQ6wqDCoMKgwqDCoMKgwqAgcGh5c2ljYWxfb2Zmc2V0OiBsZW5ndGg6wqDCoCBleHBlY3Rl
ZDogZmxhZ3M6Cj4+Pj4+IMKgwqDCoMKgIDA6wqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDCoCAx
NTrCoMKgwqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDCoMKgwqDCoCAwOsKgwqDCoMKgwqAgMDrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdCx1bmtub3duX2xvYyxkZWxhbGxvYyxlb2YKPj4+
Pj4gL21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCj4+Pj4+Cj4+Pj4+IEZpeGVzOiA3ZjYz
ZWI3N2FmN2IgKCJmMmZzOiByZXBvcnQgdW53cml0dGVuIGFyZWEgaW4gZjJmc19maWVtYXAiKQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+IC0tLQo+
Pj4+PiDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgNyArKysrKy0tCj4+Pj4+IMKgwqAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gaW5kZXggMzU5ZGU2
NTA3NzJlLi4zYWZjOTc2NDc0M2UgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+
Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+IEBAIC0xOTk1LDcgKzE5OTUsMTAgQEAgaW50
IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2lu
Zm8gKmZpZWluZm8sCj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAo
c2l6ZSkgewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9NRVJH
RUQ7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZmxhZ3MgJiBGSUVNQVBfRVhURU5UX0RFTEFM
TE9DKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaHlzID0gMDsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGVsc2UKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRklF
TUFQX0VYVEVOVF9NRVJHRUQ7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkNS
WVBURUQoaW5vZGUpKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzIHw9
IEZJRU1BUF9FWFRFTlRfREFUQV9FTkNSWVBURUQ7Cj4+Pj4+IEBAIC0yMDM1LDcgKzIwMzgsNyBA
QCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRl
bnRfaW5mbyAqZmllaW5mbywKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNpemUgKz0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKG1h
cC5tX2ZsYWdzICYgRjJGU19NQVBfREVMQUxMT0MpIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZmxhZ3MgPSBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTjsKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZmxhZ3MgPSBGSUVNQVBfRVhURU5UX0RFTEFMTE9DOwo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJ0X2JsayArPSBi
eXRlc190b19ibGtzKGlub2RlLCBzaXplKTsKPj4+Pj4gLS0gCj4+Pj4+IDIuMzYuMQo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
