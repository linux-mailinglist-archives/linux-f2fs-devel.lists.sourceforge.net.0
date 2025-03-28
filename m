Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB29A7445B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 08:26:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty46C-0004bN-HQ;
	Fri, 28 Mar 2025 07:25:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ty46A-0004bE-Mt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 07:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2AosjwCa97xrz8wFu/CBfwANKmqrGkcG1irvD1cs8Lk=; b=Vgb5QSNRnZWmpwx5W/8j8J4dCf
 1Q0kYVKhzFPJYmmOz2DkDUwf7k42l13AumWls0SYUo9fXQdSQ6XhOVx3vOsMgInIDViyTLvGc7Ck2
 DnAp8uDZ4KCiaXH7/CYSW8oI+cBinz1L2j3WUHF1GY1WPSahTCSwbzSIinWNT8wwXpP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2AosjwCa97xrz8wFu/CBfwANKmqrGkcG1irvD1cs8Lk=; b=UKJ/YbAwKaU/H8NAGMR2ccI74L
 fMn4Pt9J3ytkkB9EJtyNoK/GeLvqugKxDjZl6DLbRRSl5nU6kDV4Kl7/bj/T5UtZvoc/yma+v5+gv
 3cCkNDtUU5GKpPNu+/SwT2i0bOC6LhL1b+w25sMubAOSn0NBJHs7Z2Y+BGrE84obZUwU=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ty45y-0001Cd-5T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 07:25:50 +0000
X-AuditID: a67dfc59-03fff7000000aab6-c6-67e64eeb4151
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 28 Mar 2025 16:25:26 +0900
Message-ID: <20250328072530.2475-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
References: <3a2149b5-68b7-413d-8098-27ee5049f146@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXC9ZZnke5rv2fpBgdvmVmcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsDqweO2fdZffYtKqTzWP3gs9MHp83yQWwRHHZpKTmZJalFunbJXBl
 rDg7lbngqkfFih2vmBsYJ1h0MXJwSAiYSMxc4NHFyAlhrjrBDGKzCWhI/OntBbNFBLQkJjb8
 Zexi5OJgFuhklFh/8DMriCMssJlR4u/riWBVLAKqEvd3rWcFsXkFzCRmTT3AAjFVU2LHl/NM
 IDangJ3EgVXLwGqEBGwlZpz8xA5RLyhxcuYTFpCDmAXUJdbPEwIJMwvISzRvnc0MsktCYAGb
 xL7Wh4wQMyUlDq64wTKBUWAWkvZZCO2zkLQvYGRexSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJ
 ERjAy2r/RO5g/HYh+BCjAAejEg/vAdun6UKsiWXFlbmHGCU4mJVEeCWvPEkX4k1JrKxKLcqP
 LyrNSS0+xCjNwaIkzmv0rTxFSCA9sSQ1OzW1ILUIJsvEwSnVwBhev/HVv88F/1/tvlkjoH5Q
 /kiSYLiUjbSiqpMiV2LBqWM62rOuddmrFsaUdHIv2fzXN2RVuIF27adt5avnuhyVDQjISI2x
 PLB357fCVItpjz58KtgnvZXXaduuuF1T20K6F/JcnjPv1JtVXk8F3l3kvqBp5FgY8d7n8+WX
 MnO+9L/ROnJtupkSS3FGoqEWc1FxIgApyegSXAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsXCNUNlju5rv2fpBodXalmcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
 RnHZpKTmZJalFunbJXBlrDg7lbngqkfFih2vmBsYJ1h0MXJySAiYSMxcdYIZxGYT0JD409sL
 ZosIaElMbPjL2MXIxcEs0Mkosf7gZ1YQR1hgM6PE39cTwapYBFQl7u9azwpi8wqYScyaeoAF
 YqqmxI4v55lAbE4BO4kDq5aB1QgJ2ErMOPmJHaJeUOLkzCdA9RxAG9Ql1s8TAgkzC8hLNG+d
 zTyBkXcWkqpZCFWzkFQtYGRexSiSmVeWm5iZY6ZXnJ1RmZdZoZecn7uJERiUy2r/TNrB+O2y
 +yFGAQ5GJR7eA7ZP04VYE8uKK3MPMUpwMCuJ8EpeeZIuxJuSWFmVWpQfX1Sak1p8iFGag0VJ
 nNcrPDVBSCA9sSQ1OzW1ILUIJsvEwSnVwOhhtHzTqlOZbisUvEuubXk2k0VQLjC//1jMwnPr
 HwdPep34vN9z2zT7C/ZLow8e9k8yUFx77VXaoiipu3mJKVZPv71cfXC94uu/mq1XpFZMmZO4
 5dONU3d8n+6S5UwvaCxqO8x31W1Fh+SEhNi5DH/Kppsbvb8ziz/ZRlpFv179lIAaa79HuasS
 S3FGoqEWc1FxIgDi17SZRgIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > On 2025/3/28 11:40, yohan.joung wrote: > >> From: Chao Yu
    <chao@kernel.org> > >> Sent: Thursday, March 27, 2025 10:48 PM > >> To: 정요한(JOUNG
    YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [166.125.252.90 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [166.125.252.90 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ty45y-0001Cd-5T
Subject: [f2fs-dev] [External Mail] Re: [External Mail] Re: [External Mail]
 Re: [PATCH] f2fs: prevent the current section from being selected as a
 victim during garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiAyMDI1LzMvMjggMTE6NDAsIHlvaGFuLmpvdW5nIHdyb3RlOgo+ID4+IEZyb206IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjcsIDIwMjUg
MTA6NDggUE0KPiA+PiBUbzog7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFu
LmpvdW5nQHNrLmNvbT47IFlvaGFuIEpvdW5nCj4gPj4gPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVn
ZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNAZ21haWwuY29tCj4gPj4gQ2M6IGNoYW9Aa2VybmVsLm9y
ZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+ID4+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOq5gO2VhO2YhChLSU0gUElMSFlVTikgTW9iaWxlIEFFCj4g
Pj4gPHBpbGh5dW4ua2ltQHNrLmNvbT4KPiA+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6
IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFsIE1haWxdIFJlOgo+ID4+IFtQQVRDSF0gZjJm
czogcHJldmVudCB0aGUgY3VycmVudCBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYQo+
ID4+IHZpY3RpbSBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uCj4gPj4KPiA+PiBPbiAyMDI1LzMv
MjcgMTY6MDAsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPiA+Pj4+IEZyb206IENoYW8gWXUg
PGNoYW9Aa2VybmVsLm9yZz4KPiA+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSA0
OjMwIFBNCj4gPj4+PiBUbzog7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFu
LmpvdW5nQHNrLmNvbT47IFlvaGFuIEpvdW5nCj4gPj4+PiA8anloNDI5QGdtYWlsLmNvbT47IGph
ZWdldWtAa2VybmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPiA+Pj4+IENjOiBjaGFvQGtlcm5l
bC5vcmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC0KPiA+
Pj4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOq5gO2VhO2YhChLSU0gUElMSFlVTikgTW9iaWxl
IEFFCj4gPj4+PiA8cGlsaHl1bi5raW1Ac2suY29tPgo+ID4+Pj4gU3ViamVjdDogW0V4dGVybmFs
IE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczoKPiA+Pj4+IHByZXZl
bnQgdGhlIGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1
cmluZwo+ID4+Pj4gZ2FyYmFnZSBjb2xsZWN0aW9uCj4gPj4+Pgo+ID4+Pj4gT24gMy8yNy8yNSAx
NDo0MywgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOgo+ID4+Pj4+PiBGcm9tOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAz
OjAyIFBNCj4gPj4+Pj4+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdtYWlsLmNvbT47IGphZWdl
dWtAa2VybmVsLm9yZzsKPiA+Pj4+Pj4gZGFlaG80M0BnbWFpbC5jb20KPiA+Pj4+Pj4gQ2M6IGNo
YW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4g
Pj4+Pj4+IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDsoJXsmpTtlZwoSk9VTkcgWU9I
QU4pIE1vYmlsZSBBRQo+ID4+Pj4+PiA8eW9oYW4uam91bmdAc2suY29tPgo+ID4+Pj4+PiBTdWJq
ZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUgY3VycmVu
dAo+ID4+Pj4+PiBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5n
IGdhcmJhZ2UgY29sbGVjdGlvbgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAzLzI2LzI1IDIyOjE0LCBZ
b2hhbiBKb3VuZyB3cm90ZToKPiA+Pj4+Pj4+IFdoZW4gc2VsZWN0aW5nIGEgdmljdGltIHVzaW5n
IG5leHRfdmljdGltX3NlZyBpbiBhIGxhcmdlCj4gPj4+Pj4+PiBzZWN0aW9uLCB0aGUgc2VsZWN0
ZWQgc2VjdGlvbiBtaWdodCBhbHJlYWR5IGhhdmUgYmVlbiBjbGVhcmVkCj4gPj4+Pj4+PiBhbmQg
ZGVzaWduYXRlZCBhcyB0aGUgbmV3IGN1cnJlbnQgc2VjdGlvbiwgbWFraW5nIGl0IGFjdGl2ZWx5
IGluCj4gdXNlLgo+ID4+Pj4+Pj4gVGhpcyBiZWhhdmlvciBjYXVzZXMgaW5jb25zaXN0ZW5jeSBi
ZXR3ZWVuIHRoZSBTSVQgYW5kIFNTQS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSGksIGRvZXMgdGhpcyBm
aXggeW91ciBpc3N1ZT8KPiA+Pj4+Pgo+ID4+Pj4+IFRoaXMgaXMgYW4gaXNzdWUgdGhhdCBhcmlz
ZXMgd2hlbiBkaXZpZGluZyBhIGxhcmdlIHNlY3Rpb24gaW50bwo+ID4+Pj4+IHNlZ21lbnRzIGZv
ciBnYXJiYWdlIGNvbGxlY3Rpb24uCj4gPj4+Pj4gY2F1c2VkIGJ5IHRoZSBiYWNrZ3JvdW5kIEdD
IChnYXJiYWdlIGNvbGxlY3Rpb24pIHRocmVhZCBpbiBsYXJnZQo+ID4+Pj4+IHNlY3Rpb24KPiA+
Pj4+PiBmMmZzX2djKHZpY3RpbV9zZWN0aW9uKSAtPgo+ID4+Pj4+IGYyZnNfY2xlYXJfcHJlZnJl
ZV9zZWdtZW50cyh2aWN0aW1fc2VjdGlvbiktPgo+ID4+Pj4+IGN1cnNlYyh2aWN0aW1fc2VjdGlv
bikgLT4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbiBieQo+ID4+Pj4+IG5leHRfdmljdGltX3NlZykK
PiA+Pj4+Cj4gPj4+PiBJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0aW0oKSB3aWxs
IHJldHVybiBzZWN0aW9uIHdoaWNoIGlzCj4gPj4+PiB1c2VkIGJ5IGN1cnNlZz8gSXQgc2hvdWxk
IGJlIGF2b2lkZWQgYnkgY2hlY2tpbmcgdy8gc2VjX3VzYWdlX2NoZWNrKCkuCj4gPj4+Pgo+ID4+
Pj4gT3Igd2UgbWlzc2VkIHRvIGNoZWNrIGdjaW5nIHNlY3Rpb24gd2hpY2ggbmV4dF92aWN0aW1f
c2VnIHBvaW50cyB0bwo+ID4+Pj4gZHVyaW5nIGdldF9uZXdfc2VnbWVudCgpPwo+ID4+Pj4KPiA+
Pj4+IENhbiB0aGlzIGhhcHBlbj8KPiA+Pj4+Cj4gPj4+PiBlLmcuCj4gPj4+PiAtIGJnZ2Mgc2Vs
ZWN0cyBzZWMgIzAKPiA+Pj4+IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzAKPiA+Pj4+IC0gbWln
cmF0ZSBzZWcgIzAgYW5kIHN0b3AKPiA+Pj4+IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzEKPiA+
Pj4+IC0gY2hlY2twb2ludCwgc2V0IHNlYyAjMCBmcmVlIGlmIHNlYyAjMCBoYXMgbm8gdmFsaWQg
YmxvY2tzCj4gPj4+PiAtIGFsbG9jYXRlIHNlZyAjMCBpbiBzZWMgIzAgZm9yIGN1cnNlZwo+ID4+
Pj4gLSBjdXJzZWcgbW92ZXMgdG8gc2VnICMxIGFmdGVyIGFsbG9jYXRpb24KPiA+Pj4+IC0gYmdn
YyB0cmllcyB0byBtaWdyYXRlIHNlZyAjMQo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4gVGhh
dCdzIGNvcnJlY3QKPiA+Pj4gSW4gZjJmc19nZXRfdmljdGltLCB3ZSB1c2UgbmV4dF92aWN0aW1f
c2VnIHRvIGRpcmVjdGx5IGp1bXAgdG8KPiA+Pj4gZ290X3Jlc3VsdCwgdGhlcmVieSBieXBhc3Np
bmcgc2VjX3VzYWdlX2NoZWNrIFdoYXQgZG8geW91IHRoaW5rCj4gPj4+IGFib3V0IHRoaXMgY2hh
bmdlPwo+ID4+Pgo+ID4+PiBAQCAtODUwLDE1ICs4NTAsMjAgQEAgaW50IGYyZnNfZ2V0X3ZpY3Rp
bShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4gdW5zaWduZWQgaW50ICpyZXN1bHQsCj4g
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgcC5taW5fc2Vnbm8gPSBzYmktPm5leHRfdmlj
dGltX3NlZ1tCR19HQ107Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3VsdCA9
IHAubWluX3NlZ25vOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92
aWN0aW1fc2VnW0JHX0dDXSA9IE5VTExfU0VHTk87Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZ290X3Jlc3VsdDsKPiA+Pj4gICAgICAgICAgICAgICAgICAgfQo+ID4+PiAgICAg
ICAgICAgICAgICAgICBpZiAoZ2NfdHlwZSA9PSBGR19HQyAmJgo+ID4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdICE9IE5VTExf
U0VHTk8pIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNi
aS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXTsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAqcmVzdWx0ID0gcC5taW5fc2Vnbm87Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPiA+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Owo+ID4+PiAgICAgICAgICAgICAgICAgICB9
Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgICAgICAgIHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhz
YmksIHNlZ25vKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9j
aGVjayhzYmksIHNlY25vKSkKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0
Owo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4gPj4+ICAg
ICAgICAgICB9Cj4gPj4KPiA+PiBCdXQgc3RpbGwgYWxsb2NhdG9yIGNhbiBhc3NpZ24gdGhpcyBz
ZWdtZW50IGFmdGVyIHNlY191c2FnZV9jaGVjaygpCj4gPj4gaW4gcmFjZSBjb25kaXRpb24sIHJp
Z2h0Pwo+ID4gU2luY2UgdGhlIEJHIEdDIHVzaW5nIG5leHRfdmljdGltICB0YWtlcyBwbGFjZSBh
ZnRlciB0aGUgU0lUIHVwZGF0ZSBpbgo+ID4gZG9fY2hlY2twb2ludCwgaXQgc2VlbXMgdW5saWtl
bHkgdGhhdCBhIHJhY2UgY29uZGl0aW9uIHdpdGgKPiBzZWNfdXNhZ2VfY2hlY2sgd2lsbCBvY2N1
ci4KPiAKPiBJIG1lYW4gdGhpczoKPiAKPiAtIGdjX3RocmVhZAo+ICAgLSBmMmZzX2djCj4gICAg
LSBmMmZzX2dldF92aWN0aW0KPiAgICAgLSBzZWNfdXNhZ2VfY2hlY2sgLS0tIHNlZ25vICMxIGlz
IG5vdCB1c2VkIGluIGFueSBjdXJzZWdzCj4gCQkJCQktIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9j
awo+IAkJCQkJIC0gbmV3X2N1cnNlZwo+IAkJCQkJICAtIGdldF9uZXdfc2VnbWVudCBmaW5kIHNl
Z25vICMxCj4gCj4gICAgLSBkb19nYXJiYWdlX2NvbGxlY3QKPiAKPiBUaGFua3MsCgoJCQkJCQkg
IGRvX2NoZWNrcG9pbnQgc2VjMCBmcmVlIAoJCQkJCQkgIElmIHNlYzAgaXMgbm90IGZyZWVkLCB0
aGVuIHNlZ25vMSB3aXRoaW4gc2VjMCBjYW5ub3QgYmUgYWxsb2NhdGVkCi0gZ2NfdGhyZWFkCiAg
LSBmMmZzX2djCiAgIC0gZjJmc19nZXRfdmljdGltCiAgICAtIHNlY191c2FnZV9jaGVjayAgLS0t
IHNlZ25vICMxIGlzIG5vdCB1c2VkIGluIGFueSBjdXJzZWdzIChidXQgc2VjMCBpcyBhbHJlYWR5
IHVzZWQpCgkJCQkJCQktIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jawoJCQkJCQkJLSBuZXdfY3Vy
c2VnCgkJCQkJCQktIGdldF9uZXdfc2VnbWVudCBmaW5kIHNlZ25vICMxCgkJCQkJCiAgIC0gZG9f
Z2FyYmFnZV9jb2xsZWN0CgpJIGFwcHJlY2lhdGUgeW91ciBwYXRjaCwgaXQgaXMgdW5kZXIgdGVz
dGluZy4KYnV0IEknbSB3b25kZXJpbmcgaWYgdGhlcmUncyBhIHJpc2sgb2YgYSByYWNlIGNvbmRp
dGlvbiBpbiB0aGlzIHNpdHVhdGlvbgoKCj4gCj4gPj4KPiA+PiBJTU8sIHdlIGNhbiBjbGVhciBu
ZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJlZSBpbgo+ID4+IF9fc2V0X3Rlc3Rf
YW5kX2ZyZWUoKT8gc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+IEkgd2lsbCB0ZXN0IGl0IGFjY29y
ZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24uCj4gPiBJZiB0aGVyZSBhcmUgbm8gaXNzdWVzLCBjYW4g
SSBzdWJtaXQgaXQgYWdhaW4gd2l0aCB0aGUgcGF0Y2g/Cj4gPiBUaGFua3MKPiA+Pgo+ID4+IC0t
LQo+ID4+ICAgIGZzL2YyZnMvc2VnbWVudC5oIHwgMTMgKysrKysrKysrKy0tLQo+ID4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmggaW5kZXgK
PiA+PiAwNDY1ZGMwMGIzNDkuLjgyNmUzNzk5OTA4NSAxMDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZz
L3NlZ21lbnQuaAo+ID4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5oCj4gPj4gQEAgLTQ3Myw5ICs0
NzMsMTYgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0Cj4g
Pj4gZjJmc19zYl9pbmZvICpzYmksCj4gPj4gICAgCQkJZ290byBza2lwX2ZyZWU7Cj4gPj4gICAg
CQluZXh0ID0gZmluZF9uZXh0X2JpdChmcmVlX2ktPmZyZWVfc2VnbWFwLAo+ID4+ICAgIAkJCQlz
dGFydF9zZWdubyArIFNFR1NfUEVSX1NFQyhzYmkpLCBzdGFydF9zZWdubyk7Cj4gPj4gLQkJaWYg
KG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2Vncykgewo+ID4+IC0JCQlpZiAodGVzdF9h
bmRfY2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFwKSkKPiA+PiAtCQkJCWZyZWVf
aS0+ZnJlZV9zZWN0aW9ucysrOwo+ID4+ICsJCWlmICgobmV4dCA+PSBzdGFydF9zZWdubyArIHVz
YWJsZV9zZWdzKSAmJgo+ID4+ICsJCQl0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGZyZWVfaS0+
ZnJlZV9zZWNtYXApKSB7Cj4gPj4gKwkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+ID4+ICsK
PiA+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0Nd
KSA9PQo+ID4+ICsJCQkJCQkJCQlzZWNubykKPiA+PiArCQkJCXNiaS0+bmV4dF92aWN0aW1fc2Vn
W0JHX0dDXSA9IE5VTExfU0VHTk87Cj4gPj4gKwkJCWlmIChHRVRfU0VDX0ZST01fU0VHKHNiaS0+
bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSkgPT0KPiA+PiArCQkJCQkJCQkJc2Vjbm8pCj4gPj4gKwkJ
CQlzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+ID4+ICAgIAkJfQo+
ID4+ICAgIAl9Cj4gPj4gICAgc2tpcF9mcmVlOgo+ID4+IC0tCj4gPj4gMi40MC4xCj4gPj4KPiA+
Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBCZWNhdXNlIHRoZSBjYWxsIHN0YWNrIGlzIGRpZmZlcmVudCwg
SSB0aGluayB0aGF0IGluIG9yZGVyIHRvCj4gPj4+Pj4gaGFuZGxlIGV2ZXJ5dGhpbmcgYXQgb25j
ZSwgd2UgbmVlZCB0byBhZGRyZXNzIGl0IHdpdGhpbgo+ID4+Pj4+IGRvX2dhcmJhZ2VfY29sbGVj
dCwgb3Igb3RoZXJ3aXNlIGluY2x1ZGUgaXQgb24gYm90aCBzaWRlcy4KPiA+Pj4+PiBXaGF0IGRv
IHlvdSB0aGluaz8KPiA+Pj4+Pgo+ID4+Pj4+IFszMDE0Ni4zMzc0NzFdWyBUMTMwMF0gRjJGUy1m
cyAoZG0tNTQpOiBJbmNvbnNpc3RlbnQgc2VnbWVudAo+ID4+Pj4+ICg3MDk2MSkgdHlwZSBbMCwg
MV0gaW4gU1NBIGFuZCBTSVQgWzMwMTQ2LjM0NjE1MV1bIFQxMzAwXSBDYWxsIHRyYWNlOgo+ID4+
Pj4+IFszMDE0Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBfYmFja3RyYWNlKzB4ZTgvMHgxMGMgWzMw
MTQ2LjM0NjE1N11bCj4gPj4+Pj4gVDEzMDBdICBzaG93X3N0YWNrKzB4MTgvMHgyOCBbMzAxNDYu
MzQ2MTU4XVsgVDEzMDBdCj4gPj4+Pj4gZHVtcF9zdGFja19sdmwrMHg1MC8weDZjIFszMDE0Ni4z
NDYxNjFdWyBUMTMwMF0KPiA+Pj4+PiBkdW1wX3N0YWNrKzB4MTgvMHgyOCBbMzAxNDYuMzQ2MTYy
XVsgVDEzMDBdCj4gPj4+Pj4gZjJmc19zdG9wX2NoZWNrcG9pbnQrMHgxYy8weDNjIFszMDE0Ni4z
NDYxNjVdWyBUMTMwMF0KPiA+Pj4+PiBkb19nYXJiYWdlX2NvbGxlY3QrMHg0MWMvMHgyNzFjIFsz
MDE0Ni4zNDYxNjddWyBUMTMwMF0KPiA+Pj4+PiBmMmZzX2djKzB4MjdjLzB4ODI4IFszMDE0Ni4z
NDYxNjhdWyBUMTMwMF0KPiA+Pj4+PiBnY190aHJlYWRfZnVuYysweDI5MC8weDg4YyBbMzAxNDYu
MzQ2MTY5XVsgVDEzMDBdCj4gPj4+Pj4ga3RocmVhZCsweDExYy8weDE2NCBbMzAxNDYuMzQ2MTcy
XVsgVDEzMDBdCj4gPj4+Pj4gcmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPiA+Pj4+Pgo+ID4+Pj4+
IHN0cnVjdCBjdXJzZWdfaW5mbyA6IDB4ZmZmZmZmODAzZjk1ZTgwMCB7Cj4gPj4+Pj4gCXNlZ25v
ICAgICAgICA6IDB4MTE1MzEgOiA3MDk2MQo+ID4+Pj4+IH0KPiA+Pj4+Pgo+ID4+Pj4+IHN0cnVj
dCBmMmZzX3NiX2luZm8gOiAweGZmZmZmZjg4MTFkMTIwMDAgewo+ID4+Pj4+IAluZXh0X3ZpY3Rp
bV9zZWdbMF0gOiAweDExNTMxIDogNzA5NjEgfQo+ID4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNTAzMjUwODA2NDYuMzI5
MTk0Ny0yCj4gPj4+Pj4+IC0KPiA+Pj4+Pj4gY2hhb0BrZXJuZWwub3JnCj4gPj4+Pj4+Cj4gPj4+
Pj4+IFRoYW5rcywKPiA+Pj4+Pj4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
b2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiAg
ICBmcy9mMmZzL2djLmMgfCA0ICsrKysKPiA+Pj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5j
IGIvZnMvZjJmcy9nYy5jIGluZGV4Cj4gPj4+Pj4+PiAyYjhmOTIzOWJlZGUuLjRiNWQxOGUzOTVl
YiAxMDA2NDQKPiA+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ID4+Pj4+Pj4gKysrIGIvZnMv
ZjJmcy9nYy5jCj4gPj4+Pj4+PiBAQCAtMTkyNiw2ICsxOTI2LDEwIEBAIGludCBmMmZzX2djKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4+Pj4+IHN0cnVjdAo+ID4+Pj4+PiBmMmZzX2dj
X2NvbnRyb2wgKmdjX2NvbnRyb2wpCj4gPj4+Pj4+PiAgICAJCWdvdG8gc3RvcDsKPiA+Pj4+Pj4+
ICAgIAl9Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gKwlpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkg
JiYKPiA+Pj4+Pj4+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vn
bm8pKSkKPiA+Pj4+Pj4+ICsJCWdvdG8gc3RvcDsKPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICAgIAlz
ZWdfZnJlZWQgPSBkb19nYXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsIGdjX3R5
cGUsCj4gPj4+Pj4+PiAgICAJCQkJZ2NfY29udHJvbC0+c2hvdWxkX21pZ3JhdGVfYmxvY2tzLAo+
ID4+Pj4+Pj4gICAgCQkJCWdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPiA+Pj4+Pgo+ID4+Pgo+ID4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
