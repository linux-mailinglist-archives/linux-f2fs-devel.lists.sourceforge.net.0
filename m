Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1078025F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Dec 2023 18:22:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9qAv-0005OU-KR;
	Sun, 03 Dec 2023 17:22:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1r9qAt-0005OO-Ol
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KdTh7qu2wyEVz7mbvzfcC6qo4vY1PLBcIu+HyBe8cE=; b=HJg9qMbS5wKq1K2dRcsQjwlbDG
 wCvHsUFfqxZOSYaB1uuy55ournnFD800eJWtg6JnzQJM/ZqOgW5mp8hOX0lPPPEgqhh0OxO2fEMQx
 E4bOsfW6SlwazlvDR4COnwKz608Cq1a4NE9GhnqBSdVJVBS5cI6nBL9VHTa5u4GsVn+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3KdTh7qu2wyEVz7mbvzfcC6qo4vY1PLBcIu+HyBe8cE=; b=TdsTl8bmVBtToI38KJM/k3Cyav
 G66pGxQMiS3+OAB0ZJ1JweSKx7XjEbBqh7VTdfu51vcUTEpwJaPbHuGatb1FCngyL1aYJGD7aHRbx
 H8HMlmL9MGCi55L9zXp9oOJlaTLUQ6oeJ/l1TprBSJC50sknWr64WLb+MFNaB3sQMvnM=;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r9qAo-00033v-HQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:22:36 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VxgQUtK_1701624118; 
Received: from 30.27.123.200(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VxgQUtK_1701624118) by smtp.aliyun-inc.com;
 Mon, 04 Dec 2023 01:22:00 +0800
Message-ID: <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
Date: Mon, 4 Dec 2023 01:21:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
X-Spam-Score: -9.8 (---------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/12/4 01:01, Juhyung Park wrote: > Hi Gao, > > On Mon,
    Dec 4, 2023 at 1:52 AM Gao Xiang <hsiangkao@linux.alibaba.com> wrote: >>
    >> Hi Juhyung, >> >> On 2023/12/4 00:22, Juhyung Park wrote: >> [...] 
 
 Content analysis details:   (-9.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [115.124.30.133 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [115.124.30.133 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
  0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
                             lines
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1r9qAo-00033v-HQ
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIzLzEyLzQgMDE6MDEsIEp1aHl1bmcgUGFyayB3cm90ZToKPiBIaSBHYW8sCj4gCj4g
T24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxOjUy4oCvQU0gR2FvIFhpYW5nIDxoc2lhbmdrYW9AbGlu
dXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBKdWh5dW5nLAo+Pgo+PiBPbiAyMDIzLzEy
LzQgMDA6MjIsIEp1aHl1bmcgUGFyayB3cm90ZToKPj4+IChDYydpbmcgZjJmcyBhbmQgY3J5cHRv
IGFzIEkndmUgbm90aWNlZCBzb21ldGhpbmcgc2ltaWxhciB3aXRoIGYyZnMgYQo+Pj4gd2hpbGUg
YWdvLCB3aGljaCBtYXkgbWVhbiB0aGF0IHRoaXMgaXMgbm90IHNwZWNpZmljIHRvIEVST0ZTOgo+
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBRDE0K2YybkJadExmTEM2Q3dOamdDT3VS
UlJqd3p0dHAzRDNpSzRPZisxRUVqSytjd0BtYWlsLmdtYWlsLmNvbS8KPj4+ICkKPj4+Cj4+PiBI
aS4KPj4+Cj4+PiBJJ20gZW5jb3VudGVyaW5nIGEgdmVyeSB3ZWlyZCBFUk9GUyBkYXRhIGNvcnJ1
cHRpb24uCj4+Pgo+Pj4gSSBub3RpY2VkIHdoZW4gSSBidWlsZCBhbiBFUk9GUyBpbWFnZSBmb3Ig
QU9TUCBkZXZlbG9wbWVudCwgdGhlIGRldmljZQo+Pj4gd291bGQgcmFuZG9tbHkgbm90IGJvb3Qg
ZnJvbSBhIGNlcnRhaW4gYnVpbGQuCj4+PiBBZnRlciBpbnNwZWN0aW5nIHRoZSBsb2csIEkgbm90
aWNlZCB0aGF0IGEgZmlsZSBnb3QgY29ycnVwdGVkLgo+Pgo+PiBJcyBpdCBvYnNlcnZlZCBvbiB5
b3VyIGxhcHRvcCAoaTctMTE4NUc3KSwgeWVzPyBvciBzb21lIG90aGVyIGFybTY0Cj4+IGRldmlj
ZT8KPiAKPiBZZXMsIG9ubHkgb24gbXkgbGFwdG9wLiBUaGUgYXJtNjQgZGV2aWNlIHNlZW1zIGZp
bmUuCj4gVGhlIHJlYXNvbiB0aGF0IGl0IHdvdWxkIG5vdCBib290IHdhcyB0aGF0IHRoZSBob3N0
IG1hY2hpbmUgKG15Cj4gbGFwdG9wKSB3YXMgcmVwYWNraW5nIHRoZSBFUk9GUyBpbWFnZSB3cm9u
Z2Z1bGx5Lgo+IAo+IFRoZSB3b3JrZmxvdyBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IFNlcnZl
ci1idWlsdCBFUk9GUyBBT1NQIGltYWdlIC0+IEltYWdlIGNvcGllZCB0byBsYXB0b3AgLT4gTGFw
dG9wCj4gbW91bnRzIHRoZSBFUk9GUyBpbWFnZSAtPiBDb3BpZXMgdGhlIGVudGlyZSBjb250ZW50
IHRvIGEgc2NyYXRjaAo+IGRpcmVjdG9yeSAoQ09SUlVQVCEpIC0+IENoYW5nZXMgc29tZSBmaWxl
cyAtPiBta2ZzLmVyb2ZzCj4gCj4gU28gdGhlIGRldmljZSBpcyBub3QgcmVzcG9uc2libGUgZm9y
IHRoZSBjb3JydXB0aW9uLCB0aGUgbGFwdG9wIGlzLgoKT2suCgo+IAo+Pgo+Pj4KPj4+IEFmdGVy
IGFkZGluZyBhIGhhc2ggY2hlY2sgZHVyaW5nIHRoZSBidWlsZCBmbG93LCBJIG5vdGljZWQgdGhh
dCBFUk9GUwo+Pj4gd291bGQgcmFuZG9tbHkgcmVhZCBkYXRhIHdyb25nLgo+Pj4KPj4+IEkgbm93
IGhhdmUgYSByZWxpYWJsZSBtZXRob2Qgb2YgcmVwcm9kdWNpbmcgdGhlIGlzc3VlLCBidXQgaGVy
ZSdzIHRoZQo+Pj4gZnVubnkvd2VpcmQgcGFydDogaXQncyBvbmx5IGhhcHBlbmluZyBvbiBteSBs
YXB0b3AgKGk3LTExODVHNykuIFRoaXMKPj4+IGlzIG5vdCBoYXBwZW5pbmcgd2l0aCBteSAxMjgg
Y29yZXMgYnVpbGRmYXJtIG1hY2hpbmUgKFRocmVhZHJpcHBlcgo+Pj4gMzk5MFgpLj4KPj4+IEkg
Zmlyc3Qgc3VzcGVjdGVkIGEgaGFyZHdhcmUgaXNzdWUsIGJ1dDoKPj4+IGEuIFRoZSBsYXB0b3Ag
aGFkIGl0cyBtb3RoZXJib2FyZCByZXBsYWNlZCByZWNlbnRseSAoZHVlIHRvIGEgZmFpbGluZwo+
Pj4gcGh5c2ljYWwgVHlwZS1DIHBvcnQpLgo+Pj4gYi4gVGhlIGxhcHRvcCBwYXNzZXMgbWVtb3J5
IHRlc3QgKG1lbXRlc3Q4NikuCj4+PiBjLiBUaGlzIGhhcHBlbnMgb24gYWxsIGtlcm5lbCB2ZXJz
aW9ucyBmcm9tIHY1LjQgdG8gdGhlIGxhdGVzdCB2Ni42Cj4+PiBpbmNsdWRpbmcgbXkgcGVyc29u
YWwgY3VzdG9tIGJ1aWxkcyBhbmQgQ2Fub25pY2FsJ3Mgb2ZmaWNpYWwgVWJ1bnR1Cj4+PiBrZXJu
ZWxzLgo+Pj4gZC4gVGhpcyBoYXBwZW5zIG9uIGRpZmZlcmVudCBob3N0IFNTRHMgYW5kIGZpbGUt
c3lzdGVtIGNvbWJpbmF0aW9ucy4KPj4+IGUuIFRoaXMgb25seSBoYXBwZW5zIG9uIExaNC4gTFo0
SEMgZG9lc24ndCB0cmlnZ2VyIHRoZSBpc3N1ZS4KPj4+IGYuIFRoaXMgb25seSBoYXBwZW5zIHdo
ZW4gbW91bnRpbmcgdGhlIGltYWdlIG5hdGl2ZWx5IGJ5IHRoZSBrZXJuZWwuCj4+PiBVc2luZyBm
dXNlIHdpdGggZXJvZnNmdXNlIGlzIGZpbmUuCj4+Cj4+IEkgdGhpbmsgaXQncyBhIHdlaXJkIGlz
c3VlIHdpdGggaW5wbGFjZSBkZWNvbXByZXNzaW9uIGJlY2F1c2UgeW91IHNhaWQKPj4gaXQgZGVw
ZW5kcyBvbiB0aGUgaGFyZHdhcmUuICBJbiBhZGRpdGlvbiwgd2l0aCB5b3VyIGRhdGFzZXQgc2Fk
bHkgSQo+PiBjYW5ub3QgcmVwcm9kdWNlIG9uIG15IGxvY2FsIHNlcnZlciAoWGVvbihSKSBDUFUg
RTUtMjY4MiB2NCkuCj4gCj4gQXMgSSBmZWFyZWQuIEJ1bW1lciA6KAo+IAo+Pgo+PiBXaGF0IGlz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlc2UgdHdvIG1hY2hpbmVzPyBqdXN0IGRpZmZlcmVu
dCBDUFUgb3IKPj4gdGhleSBoYXZlIHNvbWUgb3RoZXIgZGlmZmVyZW5jZSBsaWtlIGRpZmZlcmVu
dCBjb21wbGllcnM/Cj4gCj4gSSBmdWxseSBhbmQgZXhjbHVzaXZlbHkgY29udHJvbCBib3RoIGRl
dmljZXMsIGFuZCB0aGUgc2V0dXAgaXMgYWxtb3N0IHRoZSBzYW1lLgo+IFNhbWUgVWJ1bnR1IHZl
cnNpb24sIGtlcm5lbC9jb21waWxlciB2ZXJzaW9uLgo+IAo+IEJ1dCBhcyBJIHNhaWQsIG9uIG15
IGxhcHRvcCwgdGhlIGlzc3VlIGhhcHBlbnMgb24ga2VybmVscyB0aGF0IHNvbWVvbmUKPiBlbHNl
IChDYW5vbmljYWwpIGJ1aWx0LCBzbyBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMuCgpUaGUgb25s
eSB0aGluZyBJIGNvdWxkIHNheSBpcyB0aGF0IHRoZSBrZXJuZWwgc2lkZSBoYXMgb3B0aW1pemVk
CmlucGxhY2UgZGVjb21wcmVzc2lvbiBjb21wYXJlZCB0byBmdXNlIHNvIHRoYXQgaXQgd2lsbCBy
ZXVzZSB0aGUKc2FtZSBidWZmZXIgZm9yIGRlY29tcHJlc3Npb24gYnV0IHdpdGggYSBzYWZlIG1h
cmdpbiAoYWNjb3JkaW5nIHRvCnRoZSBjdXJyZW50IGx6NCBkZWNvbXByZXNzaW9uIGltcGxlbWVu
dGF0aW9uKS4gIEl0IHNob3VsZG4ndCBiZWhhdmUKZGlmZmVyZW50IGp1c3QgZHVlIHRvIGRpZmZl
cmVudCBDUFVzLiAgTGV0IG1lIGZpbmQgbW9yZSBjbHVlcwpsYXRlciwgYWxzbyBtYXliZSB3ZSBz
aG91bGQgaW50cm9kdWNlIGEgd2F5IGZvciB1c2VycyB0byB0dXJuIG9mZgp0aGlzIGlmIG5lZWRl
ZC4KClRoYW5rcywKR2FvIFhpYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
