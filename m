Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2DD8C60A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 08:12:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s77sI-0001og-R6;
	Wed, 15 May 2024 06:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s77sH-0001oZ-Dt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 06:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/+o641lUZaIXYTraow3LVloiIkhoDMNBgvAMNjnQ58=; b=VKBbeE7OGRakLDfxI0O0S8SA7e
 nmBCsr+zBmdmqZ/DtxXBjlgs0D3jhfy9Ipw5jg0MiA3KZKSR7k+ecyrIm75pYHT/sqJvPwYctTfiT
 OBrkVA5oJqken9DVW7j9Iz5gas9YP+ErWGgwncPIS/jGgskLRJzYxtvO/18ygdx4fwbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V/+o641lUZaIXYTraow3LVloiIkhoDMNBgvAMNjnQ58=; b=C9z+EC3cGrXexwcBQF07yvNm5l
 ez8DbKcdnl0Q15dcZ0m8TWlPCBTW1djx4nOHcoxUMojIDaiQB3TvJu1xpWyB0K+qr9yyGcX9oWWb1
 D70pYeDwmf/JVaha+Whok4AgTnPuuhD1/6Sj8HCLgbAr2R0/RpbGjUXNxn2PyNcXqD70=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s77sG-0006NI-ML for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 06:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DD0F6124D;
 Wed, 15 May 2024 06:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB912C116B1;
 Wed, 15 May 2024 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715753533;
 bh=h0A+98/4/Mbl1gFraVzzilprOH2dwXmDXoarNVSIjT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OHuEUf3eyJWAwUxyXWMMBLboTzTl1NB9QTvaa8QJhBRZhnLVKWQ0OBFxKpjyZiKbm
 x0SyZ1lFOE+c8umMy6d458VVMbbMIeHmrvffcI7uyQakkiYx7CxhYif9Q/DOSBMts6
 ng8GZLwVqVG0sY0bvlvr0FcfsSDjyIi05byzG0XPDOfA/XCIIKdEMD3RbXpZDmta12
 OEiZO8xrCNbVulq+YtWNA+DhTpas4O2/r5K4knKkAJUwm+ZP3YYoGXlhxITnpM+4Jw
 +pG+p8fOuafdmZQmbDpjc28Rv/Pl/VWjZFFiuuKnRQT6i1PC1BAygNx+iUtinxQGYI
 KfszlBSW2YoTA==
Message-ID: <404a39af-b3b7-4898-a158-dd1e92f09a95@kernel.org>
Date: Wed, 15 May 2024 14:12:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240506103313.773503-1-chao@kernel.org>
 <20240506103313.773503-3-chao@kernel.org> <ZjzxWp4-wmpCzBeB@google.com>
 <b58d0a62-9491-4b77-a3be-70331f849bb8@kernel.org>
 <Zj2WWpHmHaWKbDgG@google.com>
 <948ecc86-63f5-48bb-b71c-61d57cbf446c@kernel.org>
 <Zj6-Fl5OQrHyg0g_@google.com>
 <02a4e80f-a146-4862-8399-3db42979b8fb@kernel.org>
 <ZkOMSQK6hitduUYK@google.com>
 <43f128b0-5151-4ae6-9bc0-438c7a9871e9@kernel.org>
 <ZkQ8mSYP50Etp0-C@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZkQ8mSYP50Etp0-C@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/5/15 12:39, Jaegeuk Kim wrote: > On 05/15, Chao Yu
    wrote: >> On 2024/5/15 0:07, Jaegeuk Kim wrote: >>> 外部邮件/External
    Mail >>> >>> >>> On 05/11, Chao Yu wrote: >>>> On 2024/5/11 8:38, J [...]
    
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
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
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s77sG-0006NI-ML
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to do sanity check on i_nid
 for inline_data inode
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzE1IDEyOjM5LCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwNS8xNSwgQ2hhbyBZ
dSB3cm90ZToKPj4gT24gMjAyNC81LzE1IDA6MDcsIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4g5aSW
6YOo6YKu5Lu2L0V4dGVybmFsIE1haWwKPj4+Cj4+Pgo+Pj4gT24gMDUvMTEsIENoYW8gWXUgd3Jv
dGU6Cj4+Pj4gT24gMjAyNC81LzExIDg6MzgsIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+PiBPbiAw
NS8xMCwgQ2hhbyBZdSB3cm90ZToKPj4+Pj4+IE9uIDIwMjQvNS8xMCAxMTozNiwgSmFlZ2V1ayBL
aW0gd3JvdGU6Cj4+Pj4+Pj4gT24gMDUvMTAsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIw
MjQvNS85IDIzOjUyLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4+Pj4+IE9uIDA1LzA2LCBDaGFv
IFl1IHdyb3RlOgo+Pj4+Pj4+Pj4+IHN5emJvdCByZXBvcnRzIGEgZjJmcyBidWcgYXMgYmVsb3c6
Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0KPj4+Pj4+Pj4+PiBrZXJuZWwgQlVHIGF0IGZzL2YyZnMvaW5saW5lLmM6MjU4IQo+Pj4+Pj4+
Pj4+IENQVTogMSBQSUQ6IDM0IENvbW06IGt3b3JrZXIvdTg6MiBOb3QgdGFpbnRlZCA2LjkuMC1y
YzYtc3l6a2FsbGVyLTAwMDEyLWc5ZTRiYzRiY2FlMDEgIzAKPj4+Pj4+Pj4+PiBSSVA6IDAwMTA6
ZjJmc193cml0ZV9pbmxpbmVfZGF0YSsweDc4MS8weDc5MCBmcy9mMmZzL2lubGluZS5jOjI1OAo+
Pj4+Pj4+Pj4+IENhbGwgVHJhY2U6Cj4+Pj4+Pj4+Pj4gICAgICAgZjJmc193cml0ZV9zaW5nbGVf
ZGF0YV9wYWdlKzB4YjY1LzB4MWQ2MCBmcy9mMmZzL2RhdGEuYzoyODM0Cj4+Pj4+Pj4+Pj4gICAg
ICAgZjJmc193cml0ZV9jYWNoZV9wYWdlcyBmcy9mMmZzL2RhdGEuYzozMTMzIFtpbmxpbmVdCj4+
Pj4+Pj4+Pj4gICAgICAgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMgZnMvZjJmcy9kYXRhLmM6MzI4
OCBbaW5saW5lXQo+Pj4+Pj4+Pj4+ICAgICAgIGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDFlZmUv
MHgzYTkwIGZzL2YyZnMvZGF0YS5jOjMzMTUKPj4+Pj4+Pj4+PiAgICAgICBkb193cml0ZXBhZ2Vz
KzB4MzViLzB4ODcwIG1tL3BhZ2Utd3JpdGViYWNrLmM6MjYxMgo+Pj4+Pj4+Pj4+ICAgICAgIF9f
d3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDE2NS8weDEwYjAgZnMvZnMtd3JpdGViYWNrLmM6MTY1
MAo+Pj4+Pj4+Pj4+ICAgICAgIHdyaXRlYmFja19zYl9pbm9kZXMrMHg5MDUvMHgxMjYwIGZzL2Zz
LXdyaXRlYmFjay5jOjE5NDEKPj4+Pj4+Pj4+PiAgICAgICB3Yl93cml0ZWJhY2srMHg0NTcvMHhj
ZTAgZnMvZnMtd3JpdGViYWNrLmM6MjExNwo+Pj4+Pj4+Pj4+ICAgICAgIHdiX2RvX3dyaXRlYmFj
ayBmcy9mcy13cml0ZWJhY2suYzoyMjY0IFtpbmxpbmVdCj4+Pj4+Pj4+Pj4gICAgICAgd2Jfd29y
a2ZuKzB4NDEwLzB4MTA5MCBmcy9mcy13cml0ZWJhY2suYzoyMzA0Cj4+Pj4+Pj4+Pj4gICAgICAg
cHJvY2Vzc19vbmVfd29yayBrZXJuZWwvd29ya3F1ZXVlLmM6MzI1NCBbaW5saW5lXQo+Pj4+Pj4+
Pj4+ICAgICAgIHByb2Nlc3Nfc2NoZWR1bGVkX3dvcmtzKzB4YTEyLzB4MTdjMCBrZXJuZWwvd29y
a3F1ZXVlLmM6MzMzNQo+Pj4+Pj4+Pj4+ICAgICAgIHdvcmtlcl90aHJlYWQrMHg4NmQvMHhkNzAg
a2VybmVsL3dvcmtxdWV1ZS5jOjM0MTYKPj4+Pj4+Pj4+PiAgICAgICBrdGhyZWFkKzB4MmYyLzB4
MzkwIGtlcm5lbC9rdGhyZWFkLmM6Mzg4Cj4+Pj4+Pj4+Pj4gICAgICAgcmV0X2Zyb21fZm9yaysw
eDRkLzB4ODAgYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYzoxNDcKPj4+Pj4+Pj4+PiAgICAgICBy
ZXRfZnJvbV9mb3JrX2FzbSsweDFhLzB4MzAgYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUzoyNDQK
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoZSByb290IGNhdXNlIGlzOiBpbmxpbmVfZGF0YSBpbm9k
ZSBjYW4gYmUgZnV6emVkLCBzbyB0aGF0IHRoZXJlIG1heQo+Pj4+Pj4+Pj4+IGJlIHZhbGlkIGJs
a2FkZHIgaW4gaXRzIGRpcmVjdCBub2RlLCBvbmNlIGYyZnMgdHJpZ2dlcnMgYmFja2dyb3VuZCBH
Qwo+Pj4+Pj4+Pj4+IHRvIG1pZ3JhdGUgdGhlIGJsb2NrLCBpdCB3aWxsIGhpdCBmMmZzX2J1Z19v
bigpIGR1cmluZyBkaXJ0eSBwYWdlCj4+Pj4+Pj4+Pj4gd3JpdGViYWNrLgo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4gTGV0J3MgYWRkIHNhbml0eSBjaGVjayBvbiBpX25pZCBmaWVsZCBmb3IgaW5saW5l
X2RhdGEgaW5vZGUsIG1lYW53aGlsZSwKPj4+Pj4+Pj4+PiBmb3JiaWQgdG8gbWlncmF0ZSBpbmxp
bmVfZGF0YSBpbm9kZSdzIGRhdGEgYmxvY2sgdG8gZml4IHRoaXMgaXNzdWUuCj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiBSZXBvcnRlZC1ieTogc3l6Ym90Kzg0ODA2MmJhMTljODc4MmNhNWM4QHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KPj4+Pj4+Pj4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMDAwMDAwMDAwMDAwZDEwM2NlMDYxNzRkN2VjM0Bnb29n
bGUuY29tCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
Pgo+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+ICAgICAgIGZzL2YyZnMvZjJmcy5oICAgfCAgMiAr
LQo+Pj4+Pj4+Pj4+ICAgICAgIGZzL2YyZnMvZ2MuYyAgICAgfCAgNiArKysrKysKPj4+Pj4+Pj4+
PiAgICAgICBmcy9mMmZzL2lubGluZS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPj4+Pj4+Pj4+
PiAgICAgICBmcy9mMmZzL2lub2RlLmMgIHwgIDIgKy0KPj4+Pj4+Pj4+PiAgICAgICA0IGZpbGVz
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+
Pj4+Pj4+IGluZGV4IGZjZWQyYjc2NTJmNC4uYzg3NjgxM2I1NTMyIDEwMDY0NAo+Pj4+Pj4+Pj4+
IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+
Pj4+Pj4+PiBAQCAtNDE0Niw3ICs0MTQ2LDcgQEAgZXh0ZXJuIHN0cnVjdCBrbWVtX2NhY2hlICpm
MmZzX2lub2RlX2VudHJ5X3NsYWI7Cj4+Pj4+Pj4+Pj4gICAgICAgICogaW5saW5lLmMKPj4+Pj4+
Pj4+PiAgICAgICAgKi8KPj4+Pj4+Pj4+PiAgICAgICBib29sIGYyZnNfbWF5X2lubGluZV9kYXRh
KHN0cnVjdCBpbm9kZSAqaW5vZGUpOwo+Pj4+Pj4+Pj4+IC1ib29sIGYyZnNfc2FuaXR5X2NoZWNr
X2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUpOwo+Pj4+Pj4+Pj4+ICtib29sIGYyZnNf
c2FuaXR5X2NoZWNrX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdl
ICppcGFnZSk7Cj4+Pj4+Pj4+Pj4gICAgICAgYm9vbCBmMmZzX21heV9pbmxpbmVfZGVudHJ5KHN0
cnVjdCBpbm9kZSAqaW5vZGUpOwo+Pj4+Pj4+Pj4+ICAgICAgIHZvaWQgZjJmc19kb19yZWFkX2lu
bGluZV9kYXRhKHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3QgcGFnZSAqaXBhZ2UpOwo+Pj4+Pj4+
Pj4+ICAgICAgIHZvaWQgZjJmc190cnVuY2F0ZV9pbmxpbmVfaW5vZGUoc3RydWN0IGlub2RlICpp
bm9kZSwKPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5j
Cj4+Pj4+Pj4+Pj4gaW5kZXggZTg2YzdmMDE1MzlhLi4wNDE5NTc3NTA0NzggMTAwNjQ0Cj4+Pj4+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+
Pj4+Pj4+Pj4gQEAgLTE1NjMsNiArMTU2MywxMiBAQCBzdGF0aWMgaW50IGdjX2RhdGFfc2VnbWVu
dChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBmMmZzX3N1bW1hcnkgKnN1bSwKPj4+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgIGlmIChmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkpIHsKPj4+Pj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIGlwdXQoaW5vZGUpOwo+Pj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURfRlNDSyk7Cj4+Pj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBBbnkgcmFjZSBjb25kdGlvbiB0byBnZXQgdGhpcyBhcyBmYWxzZSBhbGFybT8KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gU2luY2UgdGhlcmUgaXMgbm8gcmVwcm9kdWNlciBmb3IgdGhlIGJ1ZywgSSBk
b3VidCBpdCB3YXMgY2F1c2VkIGJ5IG1ldGFkYXRhCj4+Pj4+Pj4+IGZ1enppbmcsIHNvbWV0aGlu
ZyBsaWtlIHRoaXM6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0gaW5saW5lIGlub2RlIGhhcyBvbmUgdmFs
aWQgYmxrYWRkciBpbiBpX2FkZHIgb3IgaW4gZG5vZGUgcmVmZXJlbmNlIGJ5IGlfbmlkOwo+Pj4+
Pj4+PiAtIFNJVC9TU0EgZW50cnkgb2YgdGhlIGJsb2NrIGlzIHZhbGlkOwo+Pj4+Pj4+PiAtIGJh
Y2tncm91bmQgR0MgbWlncmF0ZXMgdGhlIGJsb2NrOwo+Pj4+Pj4+PiAtIGt3b3JrZXIgd3JpdGVi
YWNrIGl0LCBhbmQgdHJpZ2dlciB0aGUgYnVnX29uKCkuCj4+Pj4+Pj4KPj4+Pj4+PiBXYXNuJ3Qg
ZGV0ZWN0ZWQgYnkgc2FuaXR5X2NoZWNrX2lub2RlPwo+Pj4+Pj4KPj4+Pj4+IEkgZnV6emVkIG5v
bi1pbmxpbmUgaW5vZGUgdy8gYmVsb3cgbWV0YWRhdGEgZmllbGRzOgo+Pj4+Pj4gLSBpX2Jsb2Nr
cyA9IDEKPj4+Pj4+IC0gaV9zaXplID0gMjA0OAo+Pj4+Pj4gLSBpX2lubGluZSB8PSAweDAyCj4+
Pj4+Pgo+Pj4+Pj4gc2FuaXR5X2NoZWNrX2lub2RlKCkgZG9lc24ndCBjb21wbGFpbi4KPj4+Pj4K
Pj4+Pj4gSSBtZWFuLCB0aGUgYmVsb3cgc2FuaXR5X2NoZWNrX2lub2RlKCkgY2FuIGNvdmVyIHRo
ZSBmdXp6ZWQgY2FzZT8gSSdtIHdvbmRlcmluZwo+Pj4+Cj4+Pj4gSSBkaWRuJ3QgZmlndXJlIG91
dCBhIGdlbmVyaWMgd2F5IGluIHNhbml0eV9jaGVja19pbm9kZSgpIHRvIGNhdGNoIGFsbCBmdXp6
ZWQgY2FzZXMuCj4+Pgo+Pj4KPj4+IFRoZSBwYXRjaCBkZXNjcmliZWQ6Cj4+PiAgICAiVGhlIHJv
b3QgY2F1c2UgaXM6IGlubGluZV9kYXRhIGlub2RlIGNhbiBiZSBmdXp6ZWQsIHNvIHRoYXQgdGhl
cmUgbWF5Cj4+PiAgICBiZSB2YWxpZCBibGthZGRyIGluIGl0cyBkaXJlY3Qgbm9kZSwgb25jZSBm
MmZzIHRyaWdnZXJzIGJhY2tncm91bmQgR0MKPj4+ICAgIHRvIG1pZ3JhdGUgdGhlIGJsb2NrLCBp
dCB3aWxsIGhpdCBmMmZzX2J1Z19vbigpIGR1cmluZyBkaXJ0eSBwYWdlCj4+PiAgICB3cml0ZWJh
Y2suIgo+Pj4KPj4+IERvIHlvdSBzdXNwZWN0IHRoZSBub2RlIGJsb2NrIGFkZHJlc3Mgd2FzIHN1
ZGRlbmx5IGFzc2lnbmVkIGFmdGVyIGYyZnNfaWdldCgpPwo+Pgo+PiBObywgSSBzdXNwZWN0IHRo
YXQgdGhlIGltYWdlIHdhcyBmdXp6ZWQgYnkgdG9vbHMgb2ZmbGluZSwgbm90IGluIHJ1bnRpbWUg
YWZ0ZXIKPj4gbW91bnQoKS4KPj4KPj4+IE90aGVyd2lzZSwgaXQgbG9va3MgY2hlY2tpbmcgdGhl
bSBpbiBzYW5pdHlfY2hlY2tfaW5vZGUgd291bGQgYmUgZW5vdWdoLgo+Pj4KPj4+Pgo+Pj4+IGUu
Zy4KPj4+PiBjYXNlICMxCj4+Pj4gLSBibGthZGRyLCBpdHMgZG5vZGUsIFNTQSBhbmQgU0lUIGFy
ZSBjb25zaXN0ZW50Cj4+Pj4gLSBkbm9kZS5mb290ZXIuaW5vIHBvaW50cyB0byBpbmxpbmUgaW5v
ZGUKPj4+PiAtIGlubGluZSBpbm9kZSBkb2Vzbid0IGxpbmsgdG8gdGhlIGRvbmRlCj4+Pj4KPj4+
PiBTb21ldGhpbmcgbGlrZSBmdXp6ZWQgc3BlY2lhbCBmaWxlLCBwbGVhc2UgY2hlY2sgZGV0YWls
cyBpbiBiZWxvdyBjb21taXQ6Cj4+Pj4KPj4+PiA5MDU2ZDY0ODlmNWEgKCJmMmZzOiBmaXggdG8g
ZG8gc2FuaXR5IGNoZWNrIG9uIGlub2RlIHR5cGUgZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbiIp
Cj4+Pj4KPj4+PiBjYXNlICMyCj4+Pj4gLSBibGthZGRyLCBpdHMgZG5vZGUsIFNTQSBhbmQgU0lU
IGFyZSBjb25zaXN0ZW50Cj4+Pj4gLSBibGthZGRyIGxvY2F0ZXMgaW4gaW5saW5lIGlub2RlJ3Mg
aV9hZGRyCj4+Cj4+IFRoZSBpbWFnZSBzdGF0dXMgaXMgc29tZXRoaW5nIGxpa2UgYWJvdmUgYXMg
SSBkZXNjcmliZWQuCj4gCj4gVGhlbiwgd2h5IG5vdCBqdXN0IGNoZWNraW5nIHRoZSBnYyBwYXRo
IG9ubHk/CgpZZXMsIHdlIGNhbi4KCmhhc19ub2RlX2Jsb2NrcygpIGlzIGFkZGVkIGZvciB1c2lu
ZyBhIHF1aWNrIGNoZWNrIHRvIHNlZSB3aGV0aGVyIGlfbmlkCmFuZCBpbmxpbmVfZGF0YSBmbGFn
IGFyZSBpbmNvbnNpc3RlbnQsIHNob3VsZCB3ZSBjaGFuZ2UgdGhpcyBpbiBhIHNlcGFyYXRlZApw
YXRjaD8KClRoYW5rcywKCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+
Pgo+Pj4+PiB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRvIGNoZWNrIGl0IGluIHRoZSBnYyBwYXRo
Lgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gVGhvdWdodHM/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4KPj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19nY19waW5uZWRfY29udHJv
bChpbm9kZSwgZ2NfdHlwZSwgc2Vnbm8pOwo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoZXJyID09IC1FQUdBSU4pIHsKPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpcHV0KGlub2RlKTsKPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9pbmxpbmUuYyBiL2ZzL2YyZnMvaW5saW5lLmMKPj4+Pj4+Pj4+PiBpbmRleCBhYzAw
NDIzZjExN2IuLjA2NzYwMGZlZDNkNCAxMDA2NDQKPj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2lu
bGluZS5jCj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9pbmxpbmUuYwo+Pj4+Pj4+Pj4+IEBAIC0z
MywxMSArMzMsMjYgQEAgYm9vbCBmMmZzX21heV9pbmxpbmVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlu
b2RlKQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgIHJldHVybiAhZjJmc19wb3N0X3JlYWRfcmVxdWly
ZWQoaW5vZGUpOwo+Pj4+Pj4+Pj4+ICAgICAgIH0KPj4+Pj4+Pj4+PiAtYm9vbCBmMmZzX3Nhbml0
eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pj4+Pj4+ICtzdGF0
aWMgYm9vbCBoYXNfbm9kZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2Ug
KmlwYWdlKQo+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4gKyBzdHJ1Y3QgZjJmc19pbm9kZSAqcmkg
PSBGMkZTX0lOT0RFKGlwYWdlKTsKPj4+Pj4+Pj4+PiArIGludCBpOwo+Pj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4+PiArIGZvciAoaSA9IDA7IGkgPCBERUZfTklEU19QRVJfSU5PREU7IGkrKykgewo+Pj4+
Pj4+Pj4+ICsgICAgICAgICBpZiAocmktPmlfbmlkW2ldKQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwo+Pj4+Pj4+Pj4+ICsgfQo+Pj4+Pj4+Pj4+ICsgcmV0dXJuIGZh
bHNlOwo+Pj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICtib29sIGYyZnNfc2Fu
aXR5X2NoZWNrX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpp
cGFnZSkKPj4+Pj4+Pj4+PiAgICAgICB7Cj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgaWYgKCFmMmZz
X2hhc19pbmxpbmVfZGF0YShpbm9kZSkpCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4+Pj4+Pj4+Pj4gKyBpZiAoaGFzX25vZGVfYmxvY2tzKGlub2RlLCBpcGFn
ZSkpCj4+Pj4+Pj4+Pj4gKyAgICAgICAgIHJldHVybiBmYWxzZTsKPj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgaWYgKCFzdXBwb3J0X2lubGluZV9kYXRhKGlub2RlKSkKPj4+Pj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+Pj4+Pj4+Pj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+Pj4+PiBpbmRleCBj
MjZlZmZkY2U5YWEuLjE0MjNjZDI3YTQ3NyAxMDA2NDQKPj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZz
L2lub2RlLmMKPj4+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+Pj4+PiBAQCAt
MzQzLDcgKzM0Myw3IEBAIHN0YXRpYyBib29sIHNhbml0eV9jaGVja19pbm9kZShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqbm9kZV9wYWdlKQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgfQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgIH0KPj4+Pj4+Pj4+PiAtIGlmIChmMmZz
X3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShpbm9kZSkpIHsKPj4+Pj4+Pj4+PiArIGlmIChmMmZz
X3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShpbm9kZSwgbm9kZV9wYWdlKSkgewo+Pj4+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwgIiVzOiBpbm9kZSAoaW5vPSVseCwg
bW9kZT0ldSkgc2hvdWxkIG5vdCBoYXZlIGlubGluZV9kYXRhLCBydW4gZnNjayB0byBmaXgiLAo+
Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbm9kZS0+
aV9pbm8sIGlub2RlLT5pX21vZGUpOwo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+Pj4+Pj4+Pj4+IC0tCj4+Pj4+Pj4+Pj4gMi40MC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
