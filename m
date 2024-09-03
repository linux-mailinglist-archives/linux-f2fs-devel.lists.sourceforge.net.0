Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17E96A038
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 16:21:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slUOu-0000Zr-2P;
	Tue, 03 Sep 2024 14:20:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slUOr-0000Zj-50
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ad+fXxsR8L7AAKCjkh/Mh910oNxSo91ivJmoJ7IXN2w=; b=cafHeCU8tZhgOgqK8TdWSrzUQt
 RKf9+vjUuqpnBMrTIcjHXKyXc1K5C2t9Z47oyDqM8HJEbtJ+9Kj8BBnxpD2+AqDHy+lRAgP37tVNZ
 xNSp8pqktdq2Wh6HN8OjDJvcC+Mip6dApz2dY2edi3F0IAUA10Rvl8HWyuux9vtXIwlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ad+fXxsR8L7AAKCjkh/Mh910oNxSo91ivJmoJ7IXN2w=; b=Uq9aa1BP8Fp6l52gwfXK3o2pVY
 5H8v3ynWc08uBLUjvBKpKlYy4sSSRIdlv+GL0M3yCxuFW2cxCSA4rxTez1JNEft1Qs+VqNXRmVRw3
 wsIAt89wIE4HxnsiFGs4iqKnOczRMd73oBs/1MYsS1c/QrT6JFUcK3wfC2ZVtMMG0FnY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slUOq-0001PY-Ts for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04D1CA43666;
 Tue,  3 Sep 2024 14:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DF5C4CEC4;
 Tue,  3 Sep 2024 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725373246;
 bh=JiS5TUtnfIHlv2ODmrvQoJfH4j7DNlPFmKCgxRRzrvg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iznHInVnvlZjL4lakCvuj7pfPFBDoBl0zyQSCOOGZjsj22AJ3rQfv6Y3gi9a1WF1Y
 S2C44nknDHM+5+ec2WejuA/vqhS5TWuWgA3V1p9L1num0QCH7kFkFItjPrZeFkXCmo
 An8h4XpnNjBU+BtHkYlpxY4CHw0DKbn/bEvpmxadQtefGntSyxg87fVOOgfFhAvPw9
 h1lC01yJVE+koa3WL+3uqV1xYxPaWdnK29MYjAKlHzQTV1wooGVNZ1M03WxNkcWbIC
 i4MQhWRmZW/f0drqjP11NOIbBrzVb7uzAP+T9Q79HIC/wixnZXgWfs1BR+qGEKjQ2s
 m0M2JNayLnz1A==
Message-ID: <b20810a7-e8b3-4478-9805-624a33d70b09@kernel.org>
Date: Tue, 3 Sep 2024 22:20:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Sun <sunjunchao2870@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240828165425.324845-1-sunjunchao2870@gmail.com>
 <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
 <8edbc0b87074fb9adcccb8b67032dc3a693c9bfa.camel@gmail.com>
Content-Language: en-US
In-Reply-To: <8edbc0b87074fb9adcccb8b67032dc3a693c9bfa.camel@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/2 21:01, Julian Sun wrote: > On Mon, 2024-09-02
 at 16:13 +0800, Chao Yu wrote: >>> On 2024/8/29 0:54, Julian Sun wrote: >>>>>
 Hi, all. >>>>> >>>>> Recently syzbot reported a bug as following [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slUOq-0001PY-Ts
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE
 flag when umounting a ro fs.
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
Cc: jaegeuk@kernel.org, syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzIgMjE6MDEsIEp1bGlhbiBTdW4gd3JvdGU6Cj4gT24gTW9uLCAyMDI0LTA5LTAy
IGF0IDE2OjEzICswODAwLCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyNC84LzI5IDA6NTQsIEp1
bGlhbiBTdW4gd3JvdGU6Cj4+Pj4+IEhpLCBhbGwuCj4+Pj4+Cj4+Pj4+IFJlY2VudGx5IHN5emJv
dCByZXBvcnRlZCBhIGJ1ZyBhcyBmb2xsb3dpbmc6Cj4+Pj4+Cj4+Pj4+IGtlcm5lbCBCVUcgYXQg
ZnMvZjJmcy9pbm9kZS5jOjg5NiEKPj4+Pj4gQ1BVOiAxIFVJRDogMCBQSUQ6IDUyMTcgQ29tbTog
c3l6LWV4ZWN1dG9yNjA1IE5vdCB0YWludGVkCj4+Pj4+IDYuMTEuMC1yYzQtc3l6a2FsbGVyLTAw
MDMzLWc4NzJjZjI4YjhkZjkgIzAKPj4+Pj4gUklQOiAwMDEwOmYyZnNfZXZpY3RfaW5vZGUrMHgx
NTk4LzB4MTVjMCBmcy9mMmZzL2lub2RlLmM6ODk2Cj4+Pj4+IENhbGwgVHJhY2U6Cj4+Pj4+ICDC
oCA8VEFTSz4KPj4+Pj4gIMKgIGV2aWN0KzB4NTMyLzB4OTUwIGZzL2lub2RlLmM6NzA0Cj4+Pj4+
ICDCoCBkaXNwb3NlX2xpc3QgZnMvaW5vZGUuYzo3NDcgW2lubGluZV0KPj4+Pj4gIMKgIGV2aWN0
X2lub2RlcysweDVmOS8weDY5MCBmcy9pbm9kZS5jOjc5Nwo+Pj4+PiAgwqAgZ2VuZXJpY19zaHV0
ZG93bl9zdXBlcisweDlkLzB4MmQwIGZzL3N1cGVyLmM6NjI3Cj4+Pj4+ICDCoCBraWxsX2Jsb2Nr
X3N1cGVyKzB4NDQvMHg5MCBmcy9zdXBlci5jOjE2OTYKPj4+Pj4gIMKgIGtpbGxfZjJmc19zdXBl
cisweDM0NC8weDY5MCBmcy9mMmZzL3N1cGVyLmM6NDg5OAo+Pj4+PiAgwqAgZGVhY3RpdmF0ZV9s
b2NrZWRfc3VwZXIrMHhjNC8weDEzMCBmcy9zdXBlci5jOjQ3Mwo+Pj4+PiAgwqAgY2xlYW51cF9t
bnQrMHg0MWYvMHg0YjAgZnMvbmFtZXNwYWNlLmM6MTM3Mwo+Pj4+PiAgwqAgdGFza193b3JrX3J1
bisweDI0Zi8weDMxMCBrZXJuZWwvdGFza193b3JrLmM6MjI4Cj4+Pj4+ICDCoCBwdHJhY2Vfbm90
aWZ5KzB4MmQyLzB4MzgwIGtlcm5lbC9zaWduYWwuYzoyNDAyCj4+Pj4+ICDCoCBwdHJhY2VfcmVw
b3J0X3N5c2NhbGwgaW5jbHVkZS9saW51eC9wdHJhY2UuaDo0MTUgW2lubGluZV0KPj4+Pj4gIMKg
IHB0cmFjZV9yZXBvcnRfc3lzY2FsbF9leGl0IGluY2x1ZGUvbGludXgvcHRyYWNlLmg6NDc3Cj4+
Pj4+IFtpbmxpbmVdCj4+Pj4+ICDCoCBzeXNjYWxsX2V4aXRfd29yaysweGM2LzB4MTkwIGtlcm5l
bC9lbnRyeS9jb21tb24uYzoxNzMKPj4+Pj4gIMKgIHN5c2NhbGxfZXhpdF90b191c2VyX21vZGVf
cHJlcGFyZSBrZXJuZWwvZW50cnkvY29tbW9uLmM6MjAwCj4+Pj4+IFtpbmxpbmVdCj4+Pj4+ICDC
oCBfX3N5c2NhbGxfZXhpdF90b191c2VyX21vZGVfd29yayBrZXJuZWwvZW50cnkvY29tbW9uLmM6
MjA1Cj4+Pj4+IFtpbmxpbmVdCj4+Pj4+ICDCoCBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKzB4
Mjc5LzB4MzcwCj4+Pj4+IGtlcm5lbC9lbnRyeS9jb21tb24uYzoyMTgKPj4+Pj4gIMKgIGRvX3N5
c2NhbGxfNjQrMHgxMDAvMHgyMzAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6ODkKPj4+Pj4gIMKg
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKPj4+Pj4KPj4+Pj4gVGhl
IHN5emJvdCBjb25zdHJ1Y3RlZCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOiBjb25jdXJyZW50bHkK
Pj4+Pj4gY3JlYXRpbmcgZGlyZWN0b3JpZXMgYW5kIHNldHRpbmcgdGhlIGZpbGUgc3lzdGVtIHRv
IHJlYWQtb25seS4KPj4+Pj4gSW4gdGhpcyBjYXNlLCB3aGlsZSBmMmZzIHdhcyBtYWtpbmcgZGly
LCB0aGUgZmlsZXN5c3RlbQo+Pj4+PiBzd2l0Y2hlZCB0bwo+Pj4+PiByZWFkb25seSwgYW5kIHdo
ZW4gaXQgdHJpZWQgdG8gY2xlYXIgdGhlIGRpcnR5IGZsYWcsIGl0Cj4+Pj4+IHRyaWdnZXJlZAoK
R28gYmFjayB0byB0aGUgcm9vdCBjYXVzZSwgSSBoYXZlIG5vIGlkZWEgd2h5IGl0IGNhbiBsZWF2
ZSBkaXJ0eSBpbm9kZQp3aGlsZSBta2RpciByYWNlcyB3LyByZWFkb25seSByZW1vdW50LCBkdWUg
dG8gdGhlIHR3byBvcGVyYXRpb25zIHNob3VsZApiZSBleGNsdXNpdmUsIElJVUMuCgotIG1rZGly
CiAgLSBkb19ta2RpcmF0CiAgIC0gZmlsZW5hbWVfY3JlYXRlCiAgICAtIG1udF93YW50X3dyaXRl
CiAgICAgLSBtbnRfZ2V0X3dyaXRlX2FjY2VzcwoJCQkJLSBtb3VudAoJCQkJIC0gZG9fcmVtb3Vu
dAoJCQkJICAtIHJlY29uZmlndXJlX3N1cGVyCgkJCQkgICAtIHNiX3ByZXBhcmVfcmVtb3VudF9y
ZWFkb25seQoJCQkJICAgIC0gbW50X2hvbGRfd3JpdGVycwogICAtIHZmc19ta2RpcgogICAgLSBm
MmZzX21rZGlyCgpCdXQgd2hlbiBJIHRyeSB0byByZXByb2R1Y2UgdGhpcyBidWcgdy8gcmVwcm9k
dWNlciBwcm92aWRlZCBieSBzeXpib3QsCkkgaGF2ZSBmb3VuZCBhIGNsdWUgaW4gdGhlIGxvZzoK
CiJza2lwIHJlY292ZXJpbmcgaW5saW5lX2RvdHMgaW5vZGUuLi4iCgpTbyBJIGRvdWJ0IHRoZSBy
b290IGNhdXNlIGlzIF9fcmVjb3Zlcl9kb3RfZGVudHJpZXMoKSBpbiBmMmZzX2xvb2t1cCgpCmdl
bmVyYXRlcyBkaXJ0eSBkYXRhL21ldGEsIGluIHRoaXMgcGF0aCwgd2Ugd2lsbCBub3QgZ3JhYiBy
ZWxhdGVkIGxvY2sKdG8gZXhjbHVkZSByZWFkb25seSByZW1vdW50LgoKTGV0IG1lIHRyeSB0byB2
ZXJpZnkgYmVsb3cgcGF0Y2g6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9jb21taXQvP2g9d2lwJmlkPTY5ZGM4ZmJiYmIzOWY4
NWY5ZjQzNmNhNTYyYzk4YWZiY2MyYTQ4ZDIKClRoYW5rcywKCj4+Pj4+IHRoaXMKPj4+Pj4gY29k
ZSBwYXRoOiBmMmZzX21rZGlyKCktPiBmMmZzX3N5bmNfZnMoKS0KPj4+Pj4+IGYyZnNfd3JpdGVf
Y2hlY2twb2ludCgpCj4+Pj4+IC0+ZjJmc19yZWFkb25seSgpLiBUaGlzIHJlc3VsdGVkIEZJX0RJ
UlRZX0lOT0RFIGZsYWcgbm90IGJlaW5nCj4+Pj4+IGNsZWFyZWQsCj4+Pj4+IHdoaWNoIGV2ZW50
dWFsbHkgbGVkIHRvIGEgYnVnIGJlaW5nIHRyaWdnZXJlZCBkdXJpbmcgdGhlCj4+Pj4+IEZJX0RJ
UlRZX0lOT0RFCj4+Pj4+IGNoZWNrIGluIGYyZnNfZXZpY3RfaW5vZGUoKS4KPj4+Pj4KPj4+Pj4g
SW4gdGhpcyBjYXNlLCB3ZSBjYW5ub3QgZG8gYW55dGhpbmcgZnVydGhlciwgc28gaWYgZmlsZXN5
c3RlbQo+Pj4+PiBpcwo+Pj4+PiByZWFkb25seSwKPj4+Pj4gZG8gbm90IHRyaWdnZXIgdGhlIEJV
Ry4gSW5zdGVhZCwgY2xlYW4gdXAgcmVzb3VyY2VzIHRvIHRoZSBiZXN0Cj4+Pj4+IG9mCj4+Pj4+
IG91cgo+Pj4+PiBhYmlsaXR5IHRvIHByZXZlbnQgdHJpZ2dlcmluZyBzdWJzZXF1ZW50IHJlc291
cmNlIGxlYWsgY2hlY2tzLgo+Pj4+Pgo+Pj4+PiBJZiB0aGVyZSBpcyBhbnl0aGluZyBpbXBvcnRh
bnQgSSdtIG1pc3NpbmcsIHBsZWFzZSBsZXQgbWUga25vdywKPj4+Pj4gdGhhbmtzLgo+Pj4+Pgo+
Pj4+PiBSZXBvcnRlZC1ieToKPj4+Pj4gc3l6Ym90K2ViZWEyNzkwOTA0NjczZDdjNjE4QHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KPj4+Pj4gQ2xvc2VzOgo+Pj4+PiBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9ZWJlYTI3OTA5MDQ2NzNkN2M2MTgKPj4+Pj4gRml4ZXM6
IGNhN2Q4MDJhN2Q4ZSAoImYyZnM6IGRldGVjdCBkaXJ0eSBpbm9kZSBpbiBldmljdF9pbm9kZSIp
Cj4+Pj4+IENDOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1
bGlhbiBTdW4gPHN1bmp1bmNoYW8yODcwQGdtYWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoCBm
cy9mMmZzL2lub2RlLmMgfCAzICsrLQo+Pj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9p
bm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+IGluZGV4IGFlZjU3MTcyMDE0Zi4uZWJmODI1
ZGJhMGE1IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4gKysrIGIvZnMv
ZjJmcy9pbm9kZS5jCj4+Pj4+IEBAIC04OTIsNyArODkyLDggQEAgdm9pZCBmMmZzX2V2aWN0X2lu
b2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhdG9taWNfcmVhZCgmZmktPmlfY29tcHJfYmxvY2tzKSk7
Cj4+Pj4+ICAgIAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoGlmIChsaWtlbHkoIWYyZnNfY3BfZXJy
b3Ioc2JpKSAmJgo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAhaXNfc2JpX2ZsYWdfc2V0KHNiaSwKPj4+Pj4gU0JJX0NQ
X0RJU0FCTEVEKSkpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCFpc19zYmlfZmxhZ19zZXQoc2JpLAo+Pj4+PiBTQklf
Q1BfRElTQUJMRUQpKSAmJgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAhZjJmc19yZWFkb25seShzYmktPnNiKSkKPj4+
Cj4+PiBJcyBpdCBmaW5lIHRvIGRyb3AgdGhpcyBkaXJ0eSBpbm9kZT8gU2luY2Ugb25jZSBpdCBy
ZW1vdW50cyBmMmZzIGFzCj4+PiBydyBvbmUsCj4+PiBwcmV2aW91cyB1cGRhdGVzIG9uIHN1Y2gg
aW5vZGUgbWF5IGJlIGxvc3Q/IE9yIGFtIEkgbWlzc2luZwo+Pj4gc29tZXRoaW5nPwo+IAo+IFRo
ZSBwdXJwb3NlIG9mIGNhbGxpbmcgdGhpcyBoZXJlIGlzIG1haW5seSB0byBhdm9pZCB0cmlnZ2Vy
aW5nIHRoZQo+IGYyZnNfYnVnX29uKHNiaSwgMSk7IHN0YXRlbWVudCBpbiB0aGUgc3Vic2VxdWVu
dCBmMmZzX3B1dF9zdXBlcigpIGR1ZQo+IHRvIGEgcmVmZXJlbmNlIGNvdW50IGNoZWNrIGZhaWx1
cmUuCj4gSSB3b3VsZCBzYXkgaXQncyBwb3NzaWJsZSwgYnV0IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0
byBiZSBtdWNoIG1vcmUgd2UKPiBjYW4gZG8gaW4gdGhpcyBzY2VuYXJpbzogdGhlIGlub2RlIGlz
IGFib3V0IHRvIGJlIGZyZWVkLCBhbmQgdGhlIGZpbGUKPiBzeXN0ZW0gaXMgcmVhZC1vbmx5LiBP
ciBkbyB3ZSBuZWVkIGEgbWVjaGFuaXNtIHRvIHNhdmUgdGhlIGlub2RlIHRoYXQKPiBpcyBhYm91
dCB0byBiZSBmcmVlZCBhbmQgdGhlbiB3cml0ZSBpdCBiYWNrIHRvIGRpc2sgYXQgdGhlIGFwcHJv
cHJpYXRlCj4gdGltZSBhZnRlciB0aGUgZmlsZSBzeXN0ZW0gYmVjb21lcyBydyBhZ2Fpbj8gQnV0
IHN1Y2ggYSBtZWNoYW5pc20KPiBzb3VuZHMgc29tZXdoYXQgY29tcGxleCBhbmQgYSBsaXR0bGUg
Yml0IG9mIHdlaXJkLi4uIERvIHlvdSBoYXZlIGFueQo+IHN1Z2dlc3Rpb25zPwoKCgoKPj4+Cj4+
PiBUaGFua3MsCj4+Pgo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmMmZz
X2J1Z19vbihzYmksIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLAo+Pj4+PiBGSV9ESVJUWV9JTk9E
RSkpOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZjJmc19pbm9kZV9zeW5jZWQoaW5vZGUpOwo+Pj4KPiAKPiAKPiBUaGFu
a3MsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
