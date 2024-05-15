Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B38C5FC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 06:40:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s76Qz-0006LQ-Q9;
	Wed, 15 May 2024 04:40:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1s76Qy-0006LG-FO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsZmLFBaIFTeUzSJfEj+0Wq1Pr/Fr0BQURo4lii1tq8=; b=KajvRqrCyTzsoe7rN0BOmaqzDA
 24kEDaWpDcTRMdP0OGdYnA5j7QE/6tRctVKnMEnxBpfkT229AyvqobaeyEDZEL6FZa9a9qUYGJabp
 eoGvmX0rNvIl1Xk0B62JMpPEUEGNT0ymnWtFJ+PYQpkFl6xzKm5zmDys97F8i142bqPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsZmLFBaIFTeUzSJfEj+0Wq1Pr/Fr0BQURo4lii1tq8=; b=O9JMNNtxFnO4PUOfX5lpiCkgXK
 r3Tkm5pnGAl1Dw4DVlBI6gWSjhXSdhJ8be3eehjorYel26O5p5kx7GDutvvvHy0Yz0bdsVF0BID39
 RyvvSkvDUm8sp+3324+Q9Xo7RxvOjXlf7tQ76W5fFLEaTwjq6GIrf4F6DzA+xx3HBtvU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s76Qy-0001BN-P2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3115CCE1392;
 Wed, 15 May 2024 04:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256D2C116B1;
 Wed, 15 May 2024 04:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715747995;
 bh=n0yrT64pY/eVge12/E8DV4OoPeWlIcq/Yq63xC7LMjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqO18MEbKnnQtMQqoFFEvaB0VWPmTe1w/AFGlvhekCKgkPLEvr6XRWmTOSrLxuQVL
 GwxREmU8RLZXZ21BiqDqcE+PobhNTIFCSdQ/nKR8mdkDPkdG+XYyHjp56XXN+EAwQx
 v/ZrI3ZKImGp9hcd9KxUbwOSyA2saSmkJ/SCzRo8kl4W5I/1OC+rFDTUSHHn/grYzi
 pHbAX59J+FKyBg+rg8FGirdBelUOVRpupYriIPCxsP+GJR4bW2UsWtdyjUwgtkXaxr
 Pa94+V7ZSzPBkG/4ameLxtCmndfxopF5JbvoF/HBhGFIIshN1kprlWJDptn9YfXDbk
 Q+bw8o0aai58A==
Date: Wed, 15 May 2024 04:39:53 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZkQ8mSYP50Etp0-C@google.com>
References: <20240506103313.773503-1-chao@kernel.org>
 <20240506103313.773503-3-chao@kernel.org>
 <ZjzxWp4-wmpCzBeB@google.com>
 <b58d0a62-9491-4b77-a3be-70331f849bb8@kernel.org>
 <Zj2WWpHmHaWKbDgG@google.com>
 <948ecc86-63f5-48bb-b71c-61d57cbf446c@kernel.org>
 <Zj6-Fl5OQrHyg0g_@google.com>
 <02a4e80f-a146-4862-8399-3db42979b8fb@kernel.org>
 <ZkOMSQK6hitduUYK@google.com>
 <43f128b0-5151-4ae6-9bc0-438c7a9871e9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43f128b0-5151-4ae6-9bc0-438c7a9871e9@kernel.org>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 05/15, Chao Yu wrote: > On 2024/5/15 0:07, Jaegeuk Kim
   wrote: > > 外部邮件/External Mail > > > > > > On 05/11, Chao Yu wrote:
    > > > On 2024/5/11 8:38, Jaegeuk Kim wrote: > > > > On 05/10, Chao [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [145.40.73.55 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s76Qy-0001BN-P2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMTUsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC81LzE1IDA6MDcsIEphZWdldWsgS2lt
IHdyb3RlOgo+ID4g5aSW6YOo6YKu5Lu2L0V4dGVybmFsIE1haWwKPiA+IAo+ID4gCj4gPiBPbiAw
NS8xMSwgQ2hhbyBZdSB3cm90ZToKPiA+ID4gT24gMjAyNC81LzExIDg6MzgsIEphZWdldWsgS2lt
IHdyb3RlOgo+ID4gPiA+IE9uIDA1LzEwLCBDaGFvIFl1IHdyb3RlOgo+ID4gPiA+ID4gT24gMjAy
NC81LzEwIDExOjM2LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiA+ID4gT24gMDUvMTAsIENo
YW8gWXUgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gMjAyNC81LzkgMjM6NTIsIEphZWdldWsgS2lt
IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gMDUvMDYsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiA+IHN5emJvdCByZXBvcnRzIGEgZjJmcyBidWcgYXMgYmVsb3c6Cj4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0t
LS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4ga2VybmVsIEJVRyBhdCBmcy9mMmZzL2lubGluZS5jOjI1
OCEKPiA+ID4gPiA+ID4gPiA+ID4gQ1BVOiAxIFBJRDogMzQgQ29tbToga3dvcmtlci91ODoyIE5v
dCB0YWludGVkIDYuOS4wLXJjNi1zeXprYWxsZXItMDAwMTItZzllNGJjNGJjYWUwMSAjMAo+ID4g
PiA+ID4gPiA+ID4gPiBSSVA6IDAwMTA6ZjJmc193cml0ZV9pbmxpbmVfZGF0YSsweDc4MS8weDc5
MCBmcy9mMmZzL2lubGluZS5jOjI1OAo+ID4gPiA+ID4gPiA+ID4gPiBDYWxsIFRyYWNlOgo+ID4g
PiA+ID4gPiA+ID4gPiAgICAgIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweGI2NS8weDFk
NjAgZnMvZjJmcy9kYXRhLmM6MjgzNAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIGYyZnNfd3JpdGVf
Y2FjaGVfcGFnZXMgZnMvZjJmcy9kYXRhLmM6MzEzMyBbaW5saW5lXQo+ID4gPiA+ID4gPiA+ID4g
PiAgICAgIF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzIGZzL2YyZnMvZGF0YS5jOjMyODggW2lubGlu
ZV0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgxZWZlLzB4
M2E5MCBmcy9mMmZzL2RhdGEuYzozMzE1Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgZG9fd3JpdGVw
YWdlcysweDM1Yi8weDg3MCBtbS9wYWdlLXdyaXRlYmFjay5jOjI2MTIKPiA+ID4gPiA+ID4gPiA+
ID4gICAgICBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUrMHgxNjUvMHgxMGIwIGZzL2ZzLXdyaXRl
YmFjay5jOjE2NTAKPiA+ID4gPiA+ID4gPiA+ID4gICAgICB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4
OTA1LzB4MTI2MCBmcy9mcy13cml0ZWJhY2suYzoxOTQxCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
d2Jfd3JpdGViYWNrKzB4NDU3LzB4Y2UwIGZzL2ZzLXdyaXRlYmFjay5jOjIxMTcKPiA+ID4gPiA+
ID4gPiA+ID4gICAgICB3Yl9kb193cml0ZWJhY2sgZnMvZnMtd3JpdGViYWNrLmM6MjI2NCBbaW5s
aW5lXQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIHdiX3dvcmtmbisweDQxMC8weDEwOTAgZnMvZnMt
d3JpdGViYWNrLmM6MjMwNAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIHByb2Nlc3Nfb25lX3dvcmsg
a2VybmVsL3dvcmtxdWV1ZS5jOjMyNTQgW2lubGluZV0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICBw
cm9jZXNzX3NjaGVkdWxlZF93b3JrcysweGExMi8weDE3YzAga2VybmVsL3dvcmtxdWV1ZS5jOjMz
MzUKPiA+ID4gPiA+ID4gPiA+ID4gICAgICB3b3JrZXJfdGhyZWFkKzB4ODZkLzB4ZDcwIGtlcm5l
bC93b3JrcXVldWUuYzozNDE2Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAga3RocmVhZCsweDJmMi8w
eDM5MCBrZXJuZWwva3RocmVhZC5jOjM4OAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIHJldF9mcm9t
X2ZvcmsrMHg0ZC8weDgwIGFyY2gveDg2L2tlcm5lbC9wcm9jZXNzLmM6MTQ3Cj4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwIGFyY2gveDg2L2VudHJ5L2Vu
dHJ5XzY0LlM6MjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBUaGUgcm9v
dCBjYXVzZSBpczogaW5saW5lX2RhdGEgaW5vZGUgY2FuIGJlIGZ1enplZCwgc28gdGhhdCB0aGVy
ZSBtYXkKPiA+ID4gPiA+ID4gPiA+ID4gYmUgdmFsaWQgYmxrYWRkciBpbiBpdHMgZGlyZWN0IG5v
ZGUsIG9uY2UgZjJmcyB0cmlnZ2VycyBiYWNrZ3JvdW5kIEdDCj4gPiA+ID4gPiA+ID4gPiA+IHRv
IG1pZ3JhdGUgdGhlIGJsb2NrLCBpdCB3aWxsIGhpdCBmMmZzX2J1Z19vbigpIGR1cmluZyBkaXJ0
eSBwYWdlCj4gPiA+ID4gPiA+ID4gPiA+IHdyaXRlYmFjay4KPiA+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiA+IExldCdzIGFkZCBzYW5pdHkgY2hlY2sgb24gaV9uaWQgZmllbGQgZm9y
IGlubGluZV9kYXRhIGlub2RlLCBtZWFud2hpbGUsCj4gPiA+ID4gPiA+ID4gPiA+IGZvcmJpZCB0
byBtaWdyYXRlIGlubGluZV9kYXRhIGlub2RlJ3MgZGF0YSBibG9jayB0byBmaXggdGhpcyBpc3N1
ZS4KPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBzeXpi
b3QrODQ4MDYyYmExOWM4NzgyY2E1YzhAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gPiA+
ID4gPiA+ID4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2
ZWwvMDAwMDAwMDAwMDAwZDEwM2NlMDYxNzRkN2VjM0Bnb29nbGUuY29tCj4gPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4g
PiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgZnMvZjJmcy9mMmZzLmggICB8ICAyICst
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgZnMvZjJmcy9nYy5jICAgICB8ICA2ICsrKysrKwo+ID4g
PiA+ID4gPiA+ID4gPiAgICAgIGZzL2YyZnMvaW5saW5lLmMgfCAxNyArKysrKysrKysrKysrKysr
LQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgIGZzL2YyZnMvaW5vZGUuYyAgfCAgMiArLQo+ID4gPiA+
ID4gPiA+ID4gPiAgICAgIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4
IGZjZWQyYjc2NTJmNC4uYzg3NjgxM2I1NTMyIDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0g
YS9mcy9mMmZzL2YyZnMuaAo+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+
ID4gPiA+ID4gPiA+ID4gPiBAQCAtNDE0Niw3ICs0MTQ2LDcgQEAgZXh0ZXJuIHN0cnVjdCBrbWVt
X2NhY2hlICpmMmZzX2lub2RlX2VudHJ5X3NsYWI7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICog
aW5saW5lLmMKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgKi8KPiA+ID4gPiA+ID4gPiA+ID4gICAg
ICBib29sIGYyZnNfbWF5X2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUpOwo+ID4gPiA+
ID4gPiA+ID4gPiAtYm9vbCBmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1Y3QgaW5v
ZGUgKmlub2RlKTsKPiA+ID4gPiA+ID4gPiA+ID4gK2Jvb2wgZjJmc19zYW5pdHlfY2hlY2tfaW5s
aW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKmlwYWdlKTsKPiA+ID4g
PiA+ID4gPiA+ID4gICAgICBib29sIGYyZnNfbWF5X2lubGluZV9kZW50cnkoc3RydWN0IGlub2Rl
ICppbm9kZSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgdm9pZCBmMmZzX2RvX3JlYWRfaW5saW5l
X2RhdGEoc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVjdCBwYWdlICppcGFnZSk7Cj4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgdm9pZCBmMmZzX3RydW5jYXRlX2lubGluZV9pbm9kZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLAo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMv
ZjJmcy9nYy5jCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGU4NmM3ZjAxNTM5YS4uMDQxOTU3NzUw
NDc4IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+ID4gPiA+
ID4gPiA+ID4gKysrIGIvZnMvZjJmcy9nYy5jCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNTYzLDYg
KzE1NjMsMTIgQEAgc3RhdGljIGludCBnY19kYXRhX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBzdHJ1Y3QgZjJmc19zdW1tYXJ5ICpzdW0sCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgaWYgKGYyZnNfaGFzX2lubGluZV9kYXRhKGlub2RlKSkgewo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGlwdXQoaW5vZGUpOwo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVE
X0ZTQ0spOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBBbnkgcmFjZSBjb25kdGlvbiB0
byBnZXQgdGhpcyBhcyBmYWxzZSBhbGFybT8KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBT
aW5jZSB0aGVyZSBpcyBubyByZXByb2R1Y2VyIGZvciB0aGUgYnVnLCBJIGRvdWJ0IGl0IHdhcyBj
YXVzZWQgYnkgbWV0YWRhdGEKPiA+ID4gPiA+ID4gPiBmdXp6aW5nLCBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IC0gaW5saW5lIGlub2RlIGhhcyBvbmUg
dmFsaWQgYmxrYWRkciBpbiBpX2FkZHIgb3IgaW4gZG5vZGUgcmVmZXJlbmNlIGJ5IGlfbmlkOwo+
ID4gPiA+ID4gPiA+IC0gU0lUL1NTQSBlbnRyeSBvZiB0aGUgYmxvY2sgaXMgdmFsaWQ7Cj4gPiA+
ID4gPiA+ID4gLSBiYWNrZ3JvdW5kIEdDIG1pZ3JhdGVzIHRoZSBibG9jazsKPiA+ID4gPiA+ID4g
PiAtIGt3b3JrZXIgd3JpdGViYWNrIGl0LCBhbmQgdHJpZ2dlciB0aGUgYnVnX29uKCkuCj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiBXYXNuJ3QgZGV0ZWN0ZWQgYnkgc2FuaXR5X2NoZWNrX2lub2Rl
Pwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGZ1enplZCBub24taW5saW5lIGlub2RlIHcvIGJlbG93
IG1ldGFkYXRhIGZpZWxkczoKPiA+ID4gPiA+IC0gaV9ibG9ja3MgPSAxCj4gPiA+ID4gPiAtIGlf
c2l6ZSA9IDIwNDgKPiA+ID4gPiA+IC0gaV9pbmxpbmUgfD0gMHgwMgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBzYW5pdHlfY2hlY2tfaW5vZGUoKSBkb2Vzbid0IGNvbXBsYWluLgo+ID4gPiA+IAo+ID4g
PiA+IEkgbWVhbiwgdGhlIGJlbG93IHNhbml0eV9jaGVja19pbm9kZSgpIGNhbiBjb3ZlciB0aGUg
ZnV6emVkIGNhc2U/IEknbSB3b25kZXJpbmcKPiA+ID4gCj4gPiA+IEkgZGlkbid0IGZpZ3VyZSBv
dXQgYSBnZW5lcmljIHdheSBpbiBzYW5pdHlfY2hlY2tfaW5vZGUoKSB0byBjYXRjaCBhbGwgZnV6
emVkIGNhc2VzLgo+ID4gCj4gPiAKPiA+IFRoZSBwYXRjaCBkZXNjcmliZWQ6Cj4gPiAgICJUaGUg
cm9vdCBjYXVzZSBpczogaW5saW5lX2RhdGEgaW5vZGUgY2FuIGJlIGZ1enplZCwgc28gdGhhdCB0
aGVyZSBtYXkKPiA+ICAgYmUgdmFsaWQgYmxrYWRkciBpbiBpdHMgZGlyZWN0IG5vZGUsIG9uY2Ug
ZjJmcyB0cmlnZ2VycyBiYWNrZ3JvdW5kIEdDCj4gPiAgIHRvIG1pZ3JhdGUgdGhlIGJsb2NrLCBp
dCB3aWxsIGhpdCBmMmZzX2J1Z19vbigpIGR1cmluZyBkaXJ0eSBwYWdlCj4gPiAgIHdyaXRlYmFj
ay4iCj4gPiAKPiA+IERvIHlvdSBzdXNwZWN0IHRoZSBub2RlIGJsb2NrIGFkZHJlc3Mgd2FzIHN1
ZGRlbmx5IGFzc2lnbmVkIGFmdGVyIGYyZnNfaWdldCgpPwo+IAo+IE5vLCBJIHN1c3BlY3QgdGhh
dCB0aGUgaW1hZ2Ugd2FzIGZ1enplZCBieSB0b29scyBvZmZsaW5lLCBub3QgaW4gcnVudGltZSBh
ZnRlcgo+IG1vdW50KCkuCj4gCj4gPiBPdGhlcndpc2UsIGl0IGxvb2tzIGNoZWNraW5nIHRoZW0g
aW4gc2FuaXR5X2NoZWNrX2lub2RlIHdvdWxkIGJlIGVub3VnaC4KPiA+IAo+ID4gPiAKPiA+ID4g
ZS5nLgo+ID4gPiBjYXNlICMxCj4gPiA+IC0gYmxrYWRkciwgaXRzIGRub2RlLCBTU0EgYW5kIFNJ
VCBhcmUgY29uc2lzdGVudAo+ID4gPiAtIGRub2RlLmZvb3Rlci5pbm8gcG9pbnRzIHRvIGlubGlu
ZSBpbm9kZQo+ID4gPiAtIGlubGluZSBpbm9kZSBkb2Vzbid0IGxpbmsgdG8gdGhlIGRvbmRlCj4g
PiA+IAo+ID4gPiBTb21ldGhpbmcgbGlrZSBmdXp6ZWQgc3BlY2lhbCBmaWxlLCBwbGVhc2UgY2hl
Y2sgZGV0YWlscyBpbiBiZWxvdyBjb21taXQ6Cj4gPiA+IAo+ID4gPiA5MDU2ZDY0ODlmNWEgKCJm
MmZzOiBmaXggdG8gZG8gc2FuaXR5IGNoZWNrIG9uIGlub2RlIHR5cGUgZHVyaW5nIGdhcmJhZ2Ug
Y29sbGVjdGlvbiIpCj4gPiA+IAo+ID4gPiBjYXNlICMyCj4gPiA+IC0gYmxrYWRkciwgaXRzIGRu
b2RlLCBTU0EgYW5kIFNJVCBhcmUgY29uc2lzdGVudAo+ID4gPiAtIGJsa2FkZHIgbG9jYXRlcyBp
biBpbmxpbmUgaW5vZGUncyBpX2FkZHIKPiAKPiBUaGUgaW1hZ2Ugc3RhdHVzIGlzIHNvbWV0aGlu
ZyBsaWtlIGFib3ZlIGFzIEkgZGVzY3JpYmVkLgoKVGhlbiwgd2h5IG5vdCBqdXN0IGNoZWNraW5n
IHRoZSBnYyBwYXRoIG9ubHk/Cgo+IAo+IFRoYW5rcywKPiAKPiA+ID4gCj4gPiA+IFRoYW5rcywK
PiA+ID4gCj4gPiA+ID4gd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0byBjaGVjayBpdCBpbiB0aGUg
Z2MgcGF0aC4KPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRob3VnaHRzPwo+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJy
ID0gZjJmc19nY19waW5uZWRfY29udHJvbChpbm9kZSwgZ2NfdHlwZSwgc2Vnbm8pOwo+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyID09IC1FQUdBSU4p
IHsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
cHV0KGlub2RlKTsKPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5saW5l
LmMgYi9mcy9mMmZzL2lubGluZS5jCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGFjMDA0MjNmMTE3
Yi4uMDY3NjAwZmVkM2Q0IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2lu
bGluZS5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2ZzL2YyZnMvaW5saW5lLmMKPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTMzLDExICszMywyNiBAQCBib29sIGYyZnNfbWF5X2lubGluZV9kYXRhKHN0
cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgcmV0dXJuICFm
MmZzX3Bvc3RfcmVhZF9yZXF1aXJlZChpbm9kZSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgfQo+
ID4gPiA+ID4gPiA+ID4gPiAtYm9vbCBmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQo+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGljIGJvb2wgaGFzX25vZGVf
YmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSkKPiA+ID4gPiA+
ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiA+ID4gKyBzdHJ1Y3QgZjJmc19pbm9kZSAqcmkgPSBG
MkZTX0lOT0RFKGlwYWdlKTsKPiA+ID4gPiA+ID4gPiA+ID4gKyBpbnQgaTsKPiA+ID4gPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArIGZvciAoaSA9IDA7IGkgPCBERUZfTklEU19QRVJf
SU5PREU7IGkrKykgewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgaWYgKHJpLT5pX25pZFtp
XSkKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+
ID4gPiA+ID4gPiA+ICsgfQo+ID4gPiA+ID4gPiA+ID4gPiArIHJldHVybiBmYWxzZTsKPiA+ID4g
PiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArYm9v
bCBmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgcGFnZSAqaXBhZ2UpCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgewo+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgIGlmICghZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKQo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ID4gPiA+ID4g
PiArIGlmIChoYXNfbm9kZV9ibG9ja3MoaW5vZGUsIGlwYWdlKSkKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgIGlmICghc3VwcG9ydF9pbmxpbmVfZGF0YShpbm9kZSkpCj4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4gPiA+
ID4gPiA+ID4gPiBpbmRleCBjMjZlZmZkY2U5YWEuLjE0MjNjZDI3YTQ3NyAxMDA2NDQKPiA+ID4g
PiA+ID4gPiA+ID4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2ZzL2YyZnMvaW5vZGUuYwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzQzLDcgKzM0Myw3IEBAIHN0
YXRpYyBib29sIHNhbml0eV9jaGVja19pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
cGFnZSAqbm9kZV9wYWdlKQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgfQo+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gLSBpZiAoZjJm
c19zYW5pdHlfY2hlY2tfaW5saW5lX2RhdGEoaW5vZGUpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICsg
aWYgKGYyZnNfc2FuaXR5X2NoZWNrX2lubGluZV9kYXRhKGlub2RlLCBub2RlX3BhZ2UpKSB7Cj4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICBmMmZzX3dhcm4oc2JpLCAiJXM6IGlu
b2RlIChpbm89JWx4LCBtb2RlPSV1KSBzaG91bGQgbm90IGhhdmUgaW5saW5lX2RhdGEsIHJ1biBm
c2NrIHRvIGZpeCIsCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX19mdW5jX18sIGlub2RlLT5pX2lubywgaW5vZGUtPmlfbW9kZSk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gPiA+IC0t
Cj4gPiA+ID4gPiA+ID4gPiA+IDIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
