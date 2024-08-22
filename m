Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568995B366
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 13:02:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sh5aF-00023C-67;
	Thu, 22 Aug 2024 11:02:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1sh5Zz-00022e-4C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 11:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p5LugtInfG5PpMXW1laltD35A5E1nWXeEWvj3V1iu9Q=; b=DCP4zbJoZnRgNpm0sxazCy/mqV
 ULhitfBiEYCPssA+/uOXt7O0OlknmtOuqAEWCT3+TXQs884XsqNNm83sV7terI+aTDjtfxI3HZ6jR
 WldMkc/QtLq1FWNy6zaC3zw9IQgQvec2ve4GbZgHAy4GeiJDEAxIrG0gk5gNrttGUiqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p5LugtInfG5PpMXW1laltD35A5E1nWXeEWvj3V1iu9Q=; b=RSK0xAZvW24kgIDd0H3DMFbJH9
 hgEG0DyFz2c9LxIvYbRl9ewxYivvQINkIxJ1yQNnjkiT8GiQVH0JJnkwW2DiP2AJApbIuNX1vDINt
 PIL+FiH3dIW7JsecLTsY13Dg9ExLwP9s7KNaElyN5GJPSQbeqnDg6Pq0Sjy4Ksqu+mrA=;
Received: from mout.gmx.net ([212.227.17.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sh5Zy-0007zn-RD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 11:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1724324511; x=1724929311; i=quwenruo.btrfs@gmx.com;
 bh=p5LugtInfG5PpMXW1laltD35A5E1nWXeEWvj3V1iu9Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZgnVrsR0W3k63XUpc/YWjXL7IppFxzvppI0KD05zlojhveeN0zwtEXx6RoLrYDpH
 OL9OJCyMf2J0t3NI5/2wUl2hoMlRXLwX1l5GjaYEXzEjIPxBEXzj9BzZ10Q8qxi9a
 BQo3JqKMram/YVm0TjISmrDPMS00zX5CgOaGLivTbgQQIvST49TvIZXtRpJ1TZwPh
 rTEPEAFiXtTbcA8c4nXDchEb7iETZxUK8YIjCUIflPaGTBtqi5PNbzqCvXoG5ZLv4
 AFR8PiyKqzrlrbyCktZQwA92vebixfg/XgbphQe0u2tIAOXyRgCwmoClG2peLDCTW
 6sRfvk8urm57i4ui8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N4hvb-1rxPVw1Lq3-016zxw; Thu, 22
 Aug 2024 13:01:51 +0200
Message-ID: <e975458a-edf4-4525-b424-5f284eebe979@gmx.com>
Date: Thu, 22 Aug 2024 20:31:46 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, Li Zetao <lizetao1@huawei.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00iVQUJDToH
 pgAKCRDCPZHzoSX+qNKACACkjDLzCvcFuDlgqCiS4ajHAo6twGra3uGgY2klo3S4JespWifr
 BLPPak74oOShqNZ8yWzB1Bkz1u93Ifx3c3H0r2vLWrImoP5eQdymVqMWmDAq+sV1Koyt8gXQ
 XPD2jQCrfR9nUuV1F3Z4Lgo+6I5LjuXBVEayFdz/VYK63+YLEAlSowCF72Lkz06TmaI0XMyj
 jgRNGM2MRgfxbprCcsgUypaDfmhY2nrhIzPUICURfp9t/65+/PLlV4nYs+DtSwPyNjkPX72+
 LdyIdY+BqS8cZbPG5spCyJIlZonADojLDYQq4QnufARU51zyVjzTXMg5gAttDZwTH+8LbNI4
 mm2YzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00ibgUJDToHvwAK
 CRDCPZHzoSX+qK6vB/9yyZlsS+ijtsvwYDjGA2WhVhN07Xa5SBBvGCAycyGGzSMkOJcOtUUf
 tD+ADyrLbLuVSfRN1ke738UojphwkSFj4t9scG5A+U8GgOZtrlYOsY2+cG3R5vjoXUgXMP37
 INfWh0KbJodf0G48xouesn08cbfUdlphSMXujCA8y5TcNyRuNv2q5Nizl8sKhUZzh4BascoK
 DChBuznBsucCTAGrwPgG4/ul6HnWE8DipMKvkV9ob1xJS2W4WJRPp6QdVrBWJ9cCdtpR6GbL
 iQi22uZXoSPv/0oUrGU+U5X4IvdnvT+8viPzszL5wXswJZfqfy8tmHM85yjObVdIG6AlnrrD
In-Reply-To: <Zsaq_QkyQIhGsvTj@casper.infradead.org>
X-Provags-ID: V03:K1:GDAnGXDL6aEutjR12TqJRyPi0QdhoBXRm7C6YdXoCL4WGAxM3vc
 ah8E0Jx4R/WmSf7YXdpxQRXSamBJ6Knn7uAvGtDeowZTBykTfAdjWJ/I92rFvxWnHEx6GNV
 iXtHHUUY6AZUs1NS96QSxff5+xIF0wwe+TTF2etMXwl9w7nG+cR8BhYVE8jSjfJb7S803oz
 BSBtOM7zbs00mYtkgPT/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z2xu3eHn5e8=;4mam5odIxAsFkVDuNUmKggEcU52
 4d3sWr8SrgzwlObVJJXEat12uOvXebdBzOVNyU4bPsSER9/13KdMeonQPHYx/MqEuj7eE8vSs
 GeWWXA+fhTDrplUqtEkePtLtpNApBwbLZoux2dGmaOb6Sje3JbpTiOZBk8n12CpTgtx9ye9rh
 2/dykP/llfaZpu559Rm9aNLt9qfX2kocrzXBme+fRewQbtqE9Ss4FOpdycct6GLtHM3v4hyZL
 Exu5872MSabVV5tQSrluVYlxA/hqmDxD1XPr6veBc4k2JULMeqD+AoEm2BwrKGofkS/46gjDv
 uq8jwE6Q2W5dNFp5ey0fYRcVou+oaCX6nOlNB0e6HYc7LPg5Br0ccq5AV0AQps/Tt0CC0iHyX
 hFZi73sEQAUrRdQG5orA+pPesj8TPDmGIo7MbO/gSXn2jaITs0UK0gOM5gi8JpqygYz/HhNN0
 t0/ceLMR3qJ8hfySBesrN6t83KFLFQqxZcmlwtwuhxHR/oOweQykGzQOTwi3CluDY4W2c6C8F
 FhpWRGP5IgWsww0Ha1ZHDU+Ysi45OZedWlaMIkpCj6spfjNQbbzt9pwKNRyYkkt0j6lPu5G62
 /lylwNetgO15e/Zkwat+/LBWkAY1xlJyev2lIgu1YDSEeMHqCRt7RFRFBv9up9giwGZfw01BG
 GXog0wmdYHejvn7kMyrMNrsjaxlbGqM4vnXdjojfN+bw7VdDP74NL+gb7+w65INwBvccQsXDq
 gIll0xZn5rj20rYn+vPJ2fnWNc/7iq11Om3Mitr/cB7wY2OaGb7z/Dqj5ED5bwXUsnrt/aX4Y
 zZOyk9xg52T9RhJaes96gvmA==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/8/22 12:35, Matthew Wilcox 写道: > On Thu, Aug
   22, 2024 at 09:37:02AM +0800, Li Zetao wrote: >> static struct extent_buffer
    *get_next_extent_buffer( >> - const struct btrfs_fs_info *fs_info [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: gmx.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.22 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [212.227.17.22 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [212.227.17.22 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [quwenruo.btrfs[at]gmx.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.22 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sh5Zy-0007zn-RD
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNC84LzIyIDEyOjM1LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gT24gVGh1LCBB
dWcgMjIsIDIwMjQgYXQgMDk6Mzc6MDJBTSArMDgwMCwgTGkgWmV0YW8gd3JvdGU6Cj4+ICAgc3Rh
dGljIHN0cnVjdCBleHRlbnRfYnVmZmVyICpnZXRfbmV4dF9leHRlbnRfYnVmZmVyKAo+PiAtCQlj
b25zdCBzdHJ1Y3QgYnRyZnNfZnNfaW5mbyAqZnNfaW5mbywgc3RydWN0IHBhZ2UgKnBhZ2UsIHU2
NCBieXRlbnIpCj4+ICsJCWNvbnN0IHN0cnVjdCBidHJmc19mc19pbmZvICpmc19pbmZvLCBzdHJ1
Y3QgZm9saW8gKmZvbGlvLCB1NjQgYnl0ZW5yKQo+PiAgIHsKPj4gICAJc3RydWN0IGV4dGVudF9i
dWZmZXIgKmdhbmdbR0FOR19MT09LVVBfU0laRV07Cj4+ICAgCXN0cnVjdCBleHRlbnRfYnVmZmVy
ICpmb3VuZCA9IE5VTEw7Cj4+IC0JdTY0IHBhZ2Vfc3RhcnQgPSBwYWdlX29mZnNldChwYWdlKTsK
Pj4gLQl1NjQgY3VyID0gcGFnZV9zdGFydDsKPj4gKwl1NjQgZm9saW9fc3RhcnQgPSBmb2xpb19w
b3MoZm9saW8pOwo+PiArCXU2NCBjdXIgPSBmb2xpb19zdGFydDsKPj4KPj4gLQlBU1NFUlQoaW5f
cmFuZ2UoYnl0ZW5yLCBwYWdlX3N0YXJ0LCBQQUdFX1NJWkUpKTsKPj4gKwlBU1NFUlQoaW5fcmFu
Z2UoYnl0ZW5yLCBmb2xpb19zdGFydCwgUEFHRV9TSVpFKSk7Cj4+ICAgCWxvY2tkZXBfYXNzZXJ0
X2hlbGQoJmZzX2luZm8tPmJ1ZmZlcl9sb2NrKTsKPj4KPj4gLQl3aGlsZSAoY3VyIDwgcGFnZV9z
dGFydCArIFBBR0VfU0laRSkgewo+PiArCXdoaWxlIChjdXIgPCBmb2xpb19zdGFydCArIFBBR0Vf
U0laRSkgewo+Cj4gUHJlc3VtYWJseSB3ZSB3YW50IHRvIHN1cHBvcnQgbGFyZ2UgZm9saW9zIGlu
IGJ0cmZzIGF0IHNvbWUgcG9pbnQ/Cj4gSSBjZXJ0YWlubHkgd2FudCB0byByZW1vdmUgQ09ORklH
X1JFQURfT05MWV9USFBfRk9SX0ZTIHNvb24gYW5kIHRoYXQnbGwKPiBiZSBhIGJpdCBvZiBhIHJl
Z3Jlc3Npb24gZm9yIGJ0cmZzIGlmIGl0IGRvZXNuJ3QgaGF2ZSBsYXJnZSBmb2xpbwo+IHN1cHBv
cnQuICBTbyBzaG91bGRuJ3Qgd2UgYWxzbyBzL1BBR0VfU0laRS9mb2xpb19zaXplKGZvbGlvKS8g
PwoKRm9yZ290IHRvIG1lbnRpb24gdGhhdCwgdGhpcyBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZCBp
bnNpZGUgc3VicGFnZQpyb3V0aW5lIChzZWN0b3JzaXplIDwgUEFHRV9TSVpFIGFuZCBub2Rlc2l6
ZSwgYWthIG1ldGFkYXRhIHNpemUgPCBQQUdFX1NJWkUpCgpTbyBQQUdFX1NJWkUgaXMgY29ycmVj
dC4gR29pbmcgZm9saW9fc2l6ZSgpIGlzIG9ubHkgd2FzdGluZyBDUFUgdGltZSwKYnV0IGlmIHlv
dSBkbyBub3QgZmVlbCBzYWZlLCB3ZSBjYW4gYWRkIGV4dHJhIEFTU0VSVCgpIHRvIG1ha2Ugc3Vy
ZSBpdCdzCm9ubHkgY2FsbGVkIGZvciBzdWJwYWdlIHJvdXRpbmUuCgpUaGFua3MsClF1CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
